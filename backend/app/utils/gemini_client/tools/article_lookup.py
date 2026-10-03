from typing import Any

from app.db.articles import find_article
from app.db.session import SessionFactory
from app.pipeline.act_keys import make_act_key, make_article_slug, parse_iso_date
from app.utils.gemini_client.tools.base import GeminiTool

MAX_ARTICLE_CHARS = 12_000


def make_article_lookup_tool(session_factory: SessionFactory) -> GeminiTool:
    async def get_article(
        act_type: str, act_name: str, article_number: str, act_date: str | None = None
    ) -> dict[str, Any]:
        # The model gives the parts; the slug is always built here so it matches the DB exactly.
        act_key = make_act_key(act_type, act_name, parse_iso_date(act_date))
        async with session_factory() as session:
            article = await find_article(session, act_key, article_number)

        if article is None:
            return {
                "found": False,
                "slug": make_article_slug(act_key, article_number),
                "error": f"Nie znaleziono art. {article_number} ({act_type} {act_date or ''} {act_name}) w bazie.",
            }

        text = article.text
        return {
            "found": True,
            "slug": article.slug,
            "act_title": article.act.title,
            "article_number": article.number,
            "summary": article.summary,
            "text": text[:MAX_ARTICLE_CHARS],
            "truncated": len(text) > MAX_ARTICLE_CHARS,
        }

    return GeminiTool(
        name="get_article",
        description=(
            "Pobiera treść i streszczenie konkretnego artykułu aktu prawnego z bazy danych. "
            "Użyj, gdy analizowany przepis odsyła do innego artykułu "
            "(np. 'o którym mowa w art. 5 ust. 2' albo 'w rozumieniu art. 2 pkt 12b ustawy o statystyce publicznej') "
            "i jego treść jest potrzebna, aby poprawnie wyjaśnić przepis. "
            "Dla odesłań wewnętrznych podaj dane aktu, który jest analizowany."
        ),
        parameters={
            "type": "object",
            "properties": {
                "act_type": {
                    "type": "string",
                    "description": "Rodzaj aktu w mianowniku, np. 'ustawa', 'rozporządzenie Ministra Finansów'. "
                    "Kodeksy są ustawami.",
                },
                "act_name": {
                    "type": "string",
                    "description": "Nazwa aktu po dacie, np. 'o podatku akcyzowym', 'Kodeks pracy'.",
                },
                "act_date": {
                    "type": "string",
                    "description": "Data aktu w formacie YYYY-MM-DD, np. '2008-12-06'. Pomiń, jeśli nieznana.",
                },
                "article_number": {
                    "type": "string",
                    "description": "Numer artykułu, np. '5', '178a', '26^1'.",
                },
            },
            "required": ["act_type", "act_name", "article_number"],
        },
        handler=get_article,
    )
