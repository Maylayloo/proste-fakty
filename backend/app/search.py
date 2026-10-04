"""Search the act_articles collection in Qdrant from the command line.

    uv run python -m app.search "ile wynosi akcyza na płyn do e-papierosów"
    uv run python -m app.search "od kiedy obowiązują przepisy" -k 3
    uv run python -m app.search "znaki akcyzy" --act ustawa_o_zmianie_ustawy_o_podatku_akcyzowym_2026_09_18 --json
    uv run python -m app.search            # interactive: model loads once, then ask as many questions as you like
"""

import os
from pathlib import Path

from app.config import settings

# Keep the output clean: no Hugging Face progress bars / Windows symlink warnings.
os.environ.setdefault("HF_HUB_DISABLE_PROGRESS_BARS", "1")
os.environ.setdefault("HF_HUB_DISABLE_SYMLINKS_WARNING", "1")
os.environ.setdefault("TRANSFORMERS_VERBOSITY", "error")
# Model already downloaded -> skip the update checks against huggingface.co on every run.
# (Path computed by hand: importing huggingface_hub here would read HF_HUB_OFFLINE before it is set.)
_hf_cache = Path(os.environ.get("HF_HUB_CACHE") or Path(os.environ.get("HF_HOME", Path.home() / ".cache/huggingface")) / "hub")
if (_hf_cache / f"models--{settings.embedding_model.replace('/', '--')}").exists():
    os.environ.setdefault("HF_HUB_OFFLINE", "1")

import argparse
import json
import logging
import sys
import textwrap
from dataclasses import asdict, dataclass

from app.services.articles import search_articles as search_service
from app.vectorstore import ActArticleChunk, get_vector_store


@dataclass
class SearchHit:
    score: float
    slug: str
    act_key: str
    act_title: str
    article_number: str
    part: int
    part_count: int
    summary: str


def search_articles(query: str, k: int = 1, act_key: str | None = None, min_score: float = 0.0) -> list[SearchHit]:
    """Same search as POST /api/v1/articles/search, but with the full summary for reading in a terminal."""
    return [
        SearchHit(score=hit.score, **chunk.model_dump(exclude={"source_sha256"}))
        for hit, chunk in search_service(query, k=k, min_score=min_score, act_key=act_key)
    ]


def main() -> None:
    parser = argparse.ArgumentParser(description="Find the best matching article in Qdrant")
    parser.add_argument("query", nargs="?", help="question, e.g. 'akcyza na e-papierosy'; omit for interactive mode")
    parser.add_argument("-k", type=int, default=1, help="number of articles to return (default 1)")
    parser.add_argument("--act", help="only search one act, by act_key")
    parser.add_argument("--min-score", type=float, default=0.0, help="hide results below this score (API uses 0.4)")
    parser.add_argument("--json", action="store_true", help="print JSON instead of text")
    args = parser.parse_args()

    logging.basicConfig(level=logging.WARNING)
    sys.stdout.reconfigure(encoding="utf-8")

    if args.query:
        print_hits(search_articles(args.query, k=args.k, act_key=args.act, min_score=args.min_score), as_json=args.json)
        return

    print("Loading the embedding model...", flush=True)
    get_vector_store(ActArticleChunk)  # pay the slow import/model load once, before the first question
    print("Ready. Type a question (empty line or Ctrl+C to quit).")
    while True:
        try:
            query = input("\n> ").strip()
        except (EOFError, KeyboardInterrupt):
            break
        if not query:
            break
        print_hits(search_articles(query, k=args.k, act_key=args.act, min_score=args.min_score), as_json=args.json)


def print_hits(hits: list[SearchHit], *, as_json: bool) -> None:
    if as_json:
        print(json.dumps([asdict(h) for h in hits], ensure_ascii=False, indent=2))
        return
    if not hits:
        print("Nothing found.")
        return
    for i, hit in enumerate(hits, start=1):
        part = f" (part {hit.part}/{hit.part_count})" if hit.part_count > 1 else ""
        print(f"{i}. [{hit.score:.3f}] {hit.slug}{part}")
        print(f"   {hit.act_title} - art. {hit.article_number}\n")
        for paragraph in hit.summary.splitlines():
            print(textwrap.fill(paragraph, width=100, initial_indent="   ", subsequent_indent="   ") or "")
        print()


if __name__ == "__main__":
    main()
