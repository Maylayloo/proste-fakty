"""PDF ingestion pipeline: bronze (PDF files) -> silver (Postgres articles + summaries) -> gold (Qdrant).

Every PDF has a `source_documents` row tracking how far it got. A run continues each document
from its last finished layer, so a failure in the gold step does not redo the Gemini work.
"""

import logging
from dataclasses import dataclass, field
from datetime import UTC, datetime
from pathlib import Path

from sqlalchemy import delete, select
from sqlalchemy.orm import selectinload

from app.config import settings
from app.db.models import Act, Article, DocumentStatus, Layer, SourceDocument
from app.db.session import SessionFactory, init_db, session_factory
from app.pipeline.act_keys import make_article_slug
from app.pipeline.gold import load_to_qdrant
from app.pipeline.pdf_reader import ActPdfReader
from app.pipeline.silver import build_silver
from app.utils.gemini_client.client import GeminiClient, get_gemini_client

logger = logging.getLogger(__name__)


@dataclass
class PipelineReport:
    discovered: int = 0
    to_silver: list[str] = field(default_factory=list)
    to_gold: list[str] = field(default_factory=list)
    failed: dict[str, str] = field(default_factory=dict)


async def register_pdfs(pdf_dir: Path, sf: SessionFactory) -> list[SourceDocument]:
    """Bronze: make sure every PDF in the folder has a tracking row (keyed by content hash)."""
    documents = []
    async with sf() as session:
        for path in sorted(pdf_dir.glob("*.pdf")):
            info = ActPdfReader(path).file_info()
            doc = await session.scalar(select(SourceDocument).where(SourceDocument.sha256 == info.sha256))
            if doc is None:
                doc = SourceDocument(
                    sha256=info.sha256,
                    file_name=info.file_name,
                    file_path=str(path),
                    size_bytes=info.size_bytes,
                    page_count=info.page_count,
                    pdf_metadata=info.metadata,
                    layer=Layer.BRONZE,
                    status=DocumentStatus.PENDING,
                )
                session.add(doc)
                logger.info("bronze: registered %s", info.file_name)
            else:
                doc.file_name, doc.file_path = info.file_name, str(path)  # file may have been renamed/moved
            documents.append(doc)
        await session.commit()
    return documents


async def to_silver(doc: SourceDocument, client: GeminiClient, sf: SessionFactory) -> None:
    parsed = ActPdfReader(doc.file_path).parse()
    articles = await build_silver(parsed, client, sf, settings.llm_concurrency)
    header = parsed.header

    async with sf() as session:
        # Re-processing an act replaces it (articles cascade).
        await session.execute(delete(Act).where(Act.act_key == header.act_key))
        act = Act(
            act_key=header.act_key,
            act_type=header.act_type.lower(),
            act_date=header.act_date,
            title=header.title,
        )
        act.articles = [
            Article(
                number=a.segment.number,
                slug=make_article_slug(header.act_key, a.segment.number),
                position=a.segment.position,
                text=a.segment.text,
                summary=a.summary,
                references=[r.as_record() for r in a.references],
            )
            for a in articles
        ]
        session.add(act)

        tracked = await session.get(SourceDocument, doc.id)
        tracked.layer = Layer.SILVER
        tracked.act_key = header.act_key
        tracked.article_count = len(articles)
        tracked.unresolved_references = sum(not r.resolved for a in articles for r in a.references)
        tracked.silver_at = datetime.now(UTC)
        await session.commit()
    doc.layer, doc.act_key = Layer.SILVER, header.act_key


async def to_gold(doc: SourceDocument, sf: SessionFactory) -> None:
    async with sf() as session:
        act = await session.scalar(
            select(Act).where(Act.act_key == doc.act_key).options(selectinload(Act.articles))
        )
        if act is None:
            raise LookupError(f"act {doc.act_key} missing from silver layer")
        chunk_count = await load_to_qdrant(act, doc.sha256)

        tracked = await session.get(SourceDocument, doc.id)
        tracked.layer = Layer.GOLD
        tracked.status = DocumentStatus.DONE
        tracked.chunk_count = chunk_count
        tracked.gold_at = datetime.now(UTC)
        tracked.error = None
        await session.commit()


async def _set_status(sf: SessionFactory, doc_id: int, status: DocumentStatus, error: str | None = None) -> None:
    async with sf() as session:
        tracked = await session.get(SourceDocument, doc_id)
        tracked.status = status
        tracked.error = error
        await session.commit()


async def run_pipeline(
    pdf_dir: Path | str | None = None,
    *,
    force: bool = False,
    client: GeminiClient | None = None,
    sf: SessionFactory = session_factory,
) -> PipelineReport:
    """Process every new or unfinished PDF in `pdf_dir`. `force=True` re-runs finished ones too."""
    pdf_dir = Path(pdf_dir or settings.pdf_dir)
    client = client or get_gemini_client()
    await init_db()

    report = PipelineReport()
    documents = await register_pdfs(pdf_dir, sf)
    report.discovered = len(documents)

    for doc in documents:
        if doc.layer == Layer.GOLD and not force:
            continue
        await _set_status(sf, doc.id, DocumentStatus.PROCESSING)
        try:
            if doc.layer == Layer.BRONZE or force:
                logger.info("silver: %s", doc.file_name)
                await to_silver(doc, client, sf)
                report.to_silver.append(doc.file_name)
            logger.info("gold: %s", doc.file_name)
            await to_gold(doc, sf)
            report.to_gold.append(doc.file_name)
        except Exception as exc:
            logger.exception("pipeline failed for %s", doc.file_name)
            await _set_status(sf, doc.id, DocumentStatus.FAILED, f"{type(exc).__name__}: {exc}")
            report.failed[doc.file_name] = str(exc)

    return report
