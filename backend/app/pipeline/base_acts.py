"""Load a base act from its plain-text consolidated version (Kancelaria Sejmu / ISAP export) into Postgres.

Articles only: no Gemini summaries and no embeddings. Acts processed by the main pipeline resolve their
references against these articles (by slug), so load base acts before the acts that amend them.

    uv run python -m app.pipeline.base_acts base_acts/ustawa_o_podatku_akcyzowym_2008_12_06.txt \\
        --type ustawa --name "o podatku akcyzowym" --date 2008-12-06
"""

import argparse
import logging
import re
from datetime import date
from pathlib import Path

from sqlalchemy import delete

from app.db.models import Act, Article
from app.db.session import SessionFactory, engine, init_db, run_async, session_factory
from app.pipeline.act_keys import make_act_key, make_article_slug, normalize_article_number
from app.pipeline.pdf_reader import POLISH_MONTHS, split_units

logger = logging.getLogger(__name__)

_PAGE_HEADER = re.compile(r"^©Kancelaria Sejmu s\. \d+/\d+$")
_EXPORT_DATE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
_MONTH_NAMES = {number: name for name, number in POLISH_MONTHS.items()}


def clean_isap_lines(text: str) -> list[str]:
    """Drop the export's page headers ("©Kancelaria Sejmu s. 2/368" + export date) and the
    "Opracowano na podstawie: t.j. Dz. U. ..." side note. Everything else is kept."""
    lines = [line.rstrip() for line in text.splitlines() if line.strip()]
    result: list[str] = []
    after_header = in_note = False
    for line in lines:
        stripped = line.strip()
        if _PAGE_HEADER.match(stripped):
            after_header = True
            continue
        if after_header and _EXPORT_DATE.match(stripped):
            after_header = False
            continue
        after_header = False
        if stripped == "Opracowano na":
            in_note = True
        if in_note:
            in_note = not stripped.endswith(".")  # the note ends with the last "poz. ..." line
            continue
        result.append(line)
    return result


async def load_base_act(
    path: Path, act_type: str, name: str, act_date: date, sf: SessionFactory = session_factory
) -> tuple[str, int]:
    _, segments, _, _ = split_units(clean_isap_lines(path.read_text(encoding="utf-8")))
    act_key = make_act_key(act_type, name, act_date)
    title = f"{act_type.capitalize()} z dnia {act_date.day} {_MONTH_NAMES[act_date.month]} {act_date.year} r. {name}"

    articles: dict[str, Article] = {}
    for segment in segments:
        number = normalize_article_number(segment.number)
        if number in articles:
            logger.warning("%s: duplicate art. %s, keeping the first one", act_key, number)
            continue
        articles[number] = Article(
            number=number,
            slug=make_article_slug(act_key, number),
            position=len(articles),
            text=segment.text,
            references=[],
        )

    async with sf() as session:
        await session.execute(delete(Act).where(Act.act_key == act_key))
        session.add(Act(act_key=act_key, act_type=act_type, act_date=act_date, title=title,
                        articles=list(articles.values())))
        await session.commit()
    return act_key, len(articles)


async def main() -> None:
    parser = argparse.ArgumentParser(description="Load a base act (plain text) into Postgres")
    parser.add_argument("path", type=Path)
    parser.add_argument("--type", default="ustawa", help="act type, e.g. 'ustawa'")
    parser.add_argument("--name", required=True, help="name after the date, e.g. 'o podatku akcyzowym'")
    parser.add_argument("--date", required=True, type=date.fromisoformat, help="YYYY-MM-DD")
    args = parser.parse_args()

    try:
        await init_db()
        act_key, count = await load_base_act(args.path, args.type, args.name, args.date)
    finally:
        await engine.dispose()
    print(f"loaded {count} articles as {act_key}")


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format="%(levelname)s %(name)s: %(message)s")
    run_async(main())
