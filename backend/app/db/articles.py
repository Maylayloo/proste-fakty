import re

from sqlalchemy import func, or_, select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload

from app.db.models import Act, Article

_SUPERSCRIPTS = str.maketrans("⁰¹²³⁴⁵⁶⁷⁸⁹", "0123456789")
_PREFIX = re.compile(r"^\s*(art\.?|artykuł|§)\s*", re.IGNORECASE)


def normalize_article_number(raw: str) -> str:
    """'Art. 178a' -> '178a', 'art. 26¹' / '26^1' / '26(1)' -> '26^1'."""
    number = _PREFIX.sub("", raw).strip().lower().replace(" ", "")
    if match := re.fullmatch(r"(\d+[a-z]*)([⁰¹²³⁴⁵⁶⁷⁸⁹]+)", number):
        return f"{match[1]}^{match[2].translate(_SUPERSCRIPTS)}"
    if match := re.fullmatch(r"(\d+[a-z]*)\((\d+)\)", number):
        return f"{match[1]}^{match[2]}"
    return number


async def find_article(session: AsyncSession, act_name: str, article_number: str) -> Article | None:
    """Find an article by (partial) act name or ELI and article number.

    When several acts match the name, the one with the shortest title wins, so
    "kodeks pracy" prefers the code itself over acts that merely mention it.
    """
    pattern = f"%{act_name.strip()}%"
    query = (
        select(Article)
        .join(Article.act)
        .options(joinedload(Article.act))
        .where(
            Article.number == normalize_article_number(article_number),
            or_(Act.eli == act_name.strip(), Act.title.ilike(pattern), Act.short_title.ilike(pattern)),
        )
        .order_by(func.length(Act.title))
        .limit(1)
    )
    return (await session.execute(query)).scalar_one_or_none()
