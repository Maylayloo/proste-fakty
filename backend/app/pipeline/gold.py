"""Silver -> gold: article summaries -> chunks with the act name in front -> Qdrant."""

import asyncio
import uuid

from langchain_core.documents import Document
from langchain_text_splitters import RecursiveCharacterTextSplitter

from app.config import settings
from app.db.models import Act
from app.vectorstore import ActArticleChunk, get_vector_store
from app.vectorstore.embeddings import get_tokenizer

HEADER_TOKEN_RESERVE = 96  # room for the "<act title>\nArt. N" prefix on every chunk


def build_chunks(act: Act, source_sha256: str) -> list[tuple[str, Document]]:
    """Returns (point_id, document) pairs. Ids are deterministic, so re-runs overwrite instead of duplicating."""
    splitter = RecursiveCharacterTextSplitter.from_huggingface_tokenizer(
        get_tokenizer(),
        chunk_size=settings.chunk_max_tokens - HEADER_TOKEN_RESERVE,
        chunk_overlap=64,
    )
    chunks: list[tuple[str, Document]] = []
    for article in sorted(act.articles, key=lambda a: a.position):
        summary = article.summary or article.text
        parts = splitter.split_text(summary)
        for part_no, part in enumerate(parts, start=1):
            payload = ActArticleChunk(
                slug=article.slug,
                act_key=act.act_key,
                act_title=act.title,
                article_number=article.number,
                part=part_no,
                part_count=len(parts),
                summary=summary,
                source_sha256=source_sha256,
            )
            header = f"{act.title}\nArt. {article.number}" + (f" (część {part_no}/{len(parts)})" if len(parts) > 1 else "")
            point_id = str(uuid.uuid5(uuid.NAMESPACE_URL, f"{article.slug}/{part_no}"))
            chunks.append((point_id, Document(page_content=f"{header}\n{part}", metadata=payload.model_dump())))
    return chunks


async def load_to_qdrant(act: Act, source_sha256: str) -> int:
    chunks = build_chunks(act, source_sha256)

    def _write() -> None:
        store = get_vector_store(ActArticleChunk)
        # Drop the act's old points first: a re-processed act may now have fewer articles/parts.
        store.client.delete(
            ActArticleChunk.collection_name,
            points_selector=ActArticleChunk.field_filter(act_key=act.act_key),
        )
        if chunks:
            ids, documents = zip(*chunks, strict=True)
            store.add_documents(list(documents), ids=list(ids))

    await asyncio.to_thread(_write)  # embedding is CPU-bound; keep the event loop free
    return len(chunks)

