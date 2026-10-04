from app.db.articles import find_article_by_slug
from app.db.session import SessionFactory
from app.utils.gemini_client.client import GeminiClient, GeminiResponse
from app.utils.gemini_client.tools import make_article_lookup_tool

SYSTEM_INSTRUCTION = """\
Jesteś asystentem, który tłumaczy polskie przepisy prawa zwykłym ludziom bez wykształcenia prawniczego.

Zasady:
- Pisz po polsku, prostym językiem, bez żargonu. Jeśli musisz użyć terminu prawnego, wyjaśnij go.
- Opieraj się wyłącznie na treści przepisów. Nie zgaduj i nie dopowiadaj skutków, których przepis nie przewiduje.
- Gdy przepis odsyła do innego artykułu i bez jego treści nie da się go poprawnie wyjaśnić,
  pobierz ten artykuł narzędziem get_article. Nie pobieraj artykułów, które nie są potrzebne.
- Jeśli narzędzie nie znajdzie artykułu, napisz wprost, że wyjaśnienie odesłania jest niepełne.
- Nie udzielaj porad prawnych.

Format odpowiedzi:
**W skrócie:** jedno zdanie, o czym jest przepis.
**Co to oznacza:** 2-4 punkty z konkretnymi skutkami.
**Kogo dotyczy:** grupy osób lub podmiotów.
**Powiązane przepisy:** artykuły, do których przepis odsyła (jeśli są), każdy z jednym zdaniem wyjaśnienia.
"""


class ArticleNotFoundError(LookupError):
    pass


async def summarize_article(
    client: GeminiClient,
    session_factory: SessionFactory,
    slug: str,
) -> GeminiResponse:
    """`slug` e.g. 'ustawa_o_podatku_akcyzowym_2008_12_06_art_99b' (see app.pipeline.act_keys)."""
    async with session_factory() as session:
        article = await find_article_by_slug(session, slug)
    if article is None:
        raise ArticleNotFoundError(slug)

    prompt = (
        f"Akt: {article.act.title}\n"
        f"Artykuł: art. {article.number}\n\n"
        f"Treść artykułu:\n{article.text}\n\n"
        "Wyjaśnij ten artykuł zgodnie z instrukcjami."
    )
    return await client.generate(
        prompt,
        system_instruction=SYSTEM_INSTRUCTION,
        tools=[make_article_lookup_tool(session_factory)],
    )
