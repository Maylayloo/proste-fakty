from typing import Any

from app.db.articles import find_article
from app.db.session import SessionFactory
from app.utils.gemini_client.tools.base import GeminiTool

MAX_ARTICLE_CHARS = 12_000


def make_article_lookup_tool(session_factory: SessionFactory) -> GeminiTool:
    async def get_article(act_name: str, article_number: str) -> dict[str, Any]:
        async with session_factory() as session:
            article = await find_article(session, act_name, article_number)

        if article is None:
            return {
                "found": False,
                "error": f"Nie znaleziono art. {article_number} w akcie pasującym do '{act_name}'.",
            }

        text = article.text
        truncated = len(text) > MAX_ARTICLE_CHARS
        return {
            "found": True,
            "act_title": article.act.title,
            "act_eli": article.act.eli,
            "article_number": article.number,
            "text": text[:MAX_ARTICLE_CHARS],
            "truncated": truncated,
        }

    return GeminiTool(
        name="get_article",
        description=(
            "Pobiera pełną treść konkretnego artykułu ustawy z bazy danych. "
            "Użyj, gdy analizowany przepis odsyła do innego artykułu "
            "(np. 'o którym mowa w art. 5 ust. 2' albo 'w rozumieniu art. 2 pkt 12b ustawy o statystyce publicznej') "
            "i jego treść jest potrzebna, aby poprawnie wyjaśnić przepis."
        ),
        parameters={
            "type": "object",
            "properties": {
                "act_name": {
                    "type": "string",
                    "description": (
                        "Nazwa aktu (np. 'Kodeks pracy', 'ustawa o publicznym transporcie zbiorowym') "
                        "albo identyfikator ELI (np. 'DU/2024/1539'). "
                        "Dla odesłań wewnętrznych podaj nazwę aktu, który jest analizowany."
                    ),
                },
                "article_number": {
                    "type": "string",
                    "description": "Numer artykułu, np. '5', '178a', '26^1'.",
                },
            },
            "required": ["act_name", "article_number"],
        },
        handler=get_article,
    )
