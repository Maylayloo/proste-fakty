"""Bronze -> silver: parsed PDF -> articles with references resolved (depth 1) and LLM summaries."""

import asyncio
import logging
from dataclasses import dataclass, field
from typing import Any

from langchain_text_splitters import RecursiveCharacterTextSplitter

from app.db.articles import find_article
from app.db.session import SessionFactory
from app.pipeline.act_keys import make_act_key, make_article_slug, normalize_article_number, parse_iso_date
from app.pipeline.pdf_reader import ArticleSegment, ParsedAct
from app.utils.gemini_client.client import GeminiClient
from app.utils.gemini_client.tasks.act_ingestion import (
    ExtractedReference,
    extract_act_context,
    extract_references,
    summarize_article_part,
)

logger = logging.getLogger(__name__)

REFERENCE_BATCH_CHARS = 20_000  # articles per reference-extraction call
ARTICLE_PART_CHARS = 6_000  # longer articles are summarised in parts
REFERENCE_CONTENT_CHARS = 3_000  # cap on each referenced article pasted into the prompt
MAX_REFERENCES = 12

_article_part_splitter = RecursiveCharacterTextSplitter(
    chunk_size=ARTICLE_PART_CHARS,
    chunk_overlap=0,
    # Prefer cutting before a point "12) ..." or a paragraph "3. ..." of the article.
    separators=[r"\n(?=\d+[a-z]*\) )", r"\n(?=\d+[a-z]*\. )", "\n", " "],
    is_separator_regex=True,
)


@dataclass
class ResolvedReference:
    act_key: str
    article: str
    same_act: bool
    label: str
    content: str | None  # None = not found

    @property
    def resolved(self) -> bool:
        return self.content is not None

    def as_prompt_block(self) -> str:
        return f"[{self.label}]\n{self.content if self.resolved else 'Treść niedostępna w bazie.'}"

    @property
    def slug(self) -> str:
        return make_article_slug(self.act_key, self.article)

    def as_record(self) -> dict[str, Any]:
        return {"slug": self.slug, "same_act": self.same_act, "resolved": self.resolved}


@dataclass
class SilverArticle:
    segment: ArticleSegment
    references: list[ResolvedReference] = field(default_factory=list)
    summary: str = ""


def _reference_act_key(ref: ExtractedReference, current_act_key: str) -> str:
    if ref.same_act or not ref.act_name:
        return current_act_key
    return make_act_key(ref.act_type or "ustawa", ref.act_name, parse_iso_date(ref.act_date))


def _batches(articles: list[ArticleSegment], max_chars: int) -> list[list[ArticleSegment]]:
    batches: list[list[ArticleSegment]] = [[]]
    size = 0
    for article in articles:
        if batches[-1] and size + len(article.text) > max_chars:
            batches.append([])
            size = 0
        batches[-1].append(article)
        size += len(article.text)
    return batches


def summary_waves(
    articles: list[ArticleSegment], refs: dict[str, list[ExtractedReference]]
) -> list[list[ArticleSegment]]:
    """Group articles so each one is summarised after the earlier same-act articles it references.

    Only backward references create a dependency, so there are no cycles; forward references
    fall back to the raw text of the referenced article.
    """
    position = {a.number: a.position for a in articles}
    level: dict[str, int] = {}
    for article in articles:
        deps = [
            ref.article
            for ref in refs.get(article.number, [])
            if ref.same_act and position.get(ref.article, article.position) < article.position
        ]
        level[article.number] = 1 + max(level[d] for d in deps) if deps else 0

    waves: list[list[ArticleSegment]] = [[] for _ in range(max(level.values(), default=-1) + 1)]
    for article in articles:
        waves[level[article.number]].append(article)
    return waves


async def build_silver(
    parsed: ParsedAct, client: GeminiClient, session_factory: SessionFactory, concurrency: int
) -> list[SilverArticle]:
    act_key = parsed.header.act_key
    act_title = parsed.header.title
    limiter = asyncio.Semaphore(concurrency)

    async def limited(coro):
        async with limiter:
            return await coro

    # 1. Which other acts does this act talk about (with dates), incl. aliases like "ustawa zmieniana w art. 1".
    context = await extract_act_context(client, act_title, [a.text for a in parsed.articles])

    # 2. References per article, in batches so the model sees a manageable amount of text.
    batch_results = await asyncio.gather(
        *(
            limited(extract_references(client, act_title, context, [(a.number, a.text) for a in batch]))
            for batch in _batches(parsed.articles, REFERENCE_BATCH_CHARS)
        )
    )
    refs: dict[str, list[ExtractedReference]] = {}
    for result in batch_results:
        for item in result.articles:
            for ref in item.references:
                ref.article = normalize_article_number(ref.article)
            refs[normalize_article_number(item.article_number)] = item.references

    # 3. Summaries, wave by wave, so earlier summaries can be reused by later articles.
    own_text = {a.number: a.text for a in parsed.articles}
    summaries: dict[str, str] = {}
    silver = {a.number: SilverArticle(segment=a) for a in parsed.articles}

    async def resolve(article: ArticleSegment) -> list[ResolvedReference]:
        resolved: list[ResolvedReference] = []
        seen: set[tuple[str, str]] = set()
        async with session_factory() as session:
            for ref in refs.get(article.number, []):
                key = _reference_act_key(ref, act_key)
                same_act = key == act_key
                if (key, ref.article) in seen or (same_act and ref.article == article.number):
                    continue
                seen.add((key, ref.article))
                if len(resolved) == MAX_REFERENCES:
                    logger.warning("%s art. %s: more than %d references, rest skipped", act_key, article.number,
                                   MAX_REFERENCES)
                    break

                if same_act:
                    content = summaries.get(ref.article) or own_text.get(ref.article)
                    kind = "streszczenie" if ref.article in summaries else "treść"
                    label = f"Ten sam akt, art. {ref.article} ({kind})"
                else:
                    found = await find_article(session, key, ref.article)
                    content = (found.summary or found.text) if found else None
                    label = f"{found.act.title if found else ref.act_name or key}, art. {ref.article}"
                resolved.append(ResolvedReference(
                    act_key=key,
                    article=ref.article,
                    same_act=same_act,
                    label=label,
                    content=content[:REFERENCE_CONTENT_CHARS] if content else None,
                ))
        return resolved

    async def summarize(article: ArticleSegment) -> None:
        item = silver[article.number]
        item.references = await resolve(article)
        related = [r.as_prompt_block() for r in item.references]

        parts = _article_part_splitter.split_text(article.text) if len(article.text) > ARTICLE_PART_CHARS else [
            article.text
        ]
        part_summaries: list[str] = []
        for i, part in enumerate(parts, start=1):
            part_summaries.append(
                await limited(
                    summarize_article_part(
                        client,
                        act_title=act_title,
                        article_number=article.number,
                        text=part,
                        related=related,
                        previous_parts_summary="\n".join(part_summaries) or None,
                        part=i,
                        part_count=len(parts),
                    )
                )
            )
        item.summary = "\n\n".join(part_summaries)
        summaries[article.number] = item.summary

    for wave in summary_waves(parsed.articles, refs):
        await asyncio.gather(*(summarize(article) for article in wave))

    return [silver[a.number] for a in parsed.articles]
