"""Gemini steps of the PDF -> Qdrant ingestion pipeline (see app.pipeline.run)."""

from pydantic import BaseModel, Field

from app.utils.gemini_client.client import GeminiClient

ARTICLE_PREVIEW_CHARS = 600


class KnownAct(BaseModel):
    alias: str | None = Field(
        default=None,
        description="Jak akt jest nazywany w tekście w skrócie, np. 'ustawa zmieniana w art. 1'",
    )
    act_type: str = Field(description="Rodzaj aktu w mianowniku, np. 'ustawa', 'rozporządzenie Ministra Finansów'")
    act_date: str | None = Field(description="Data aktu w formacie YYYY-MM-DD, jeśli podana w tekście")
    act_name: str = Field(description="Nazwa aktu po dacie, np. 'o podatku akcyzowym', 'Kodeks pracy'")


class ActContext(BaseModel):
    referenced_acts: list[KnownAct]


class ExtractedReference(BaseModel):
    article: str = Field(description="Numer artykułu, np. '5', '99b', '137a'. Bez ustępu i punktu.")
    same_act: bool = Field(description="True, jeśli odesłanie dotyczy aktu, którego artykuły analizujesz")
    act_type: str | None = Field(description="Rodzaj aktu docelowego w mianowniku, np. 'ustawa'; null gdy same_act")
    act_date: str | None = Field(description="Data aktu docelowego YYYY-MM-DD; null gdy same_act albo nieznana")
    act_name: str | None = Field(description="Nazwa aktu docelowego po dacie; null gdy same_act")


class ArticleReferences(BaseModel):
    article_number: str
    references: list[ExtractedReference]


class ReferenceBatch(BaseModel):
    articles: list[ArticleReferences]


CONTEXT_INSTRUCTION = """\
Analizujesz polski akt prawny. Wypisz wszystkie INNE akty prawne, do których odsyła tekst,
wraz z pełną datą (jeśli występuje gdziekolwiek w tekście) i nazwą.
Jeśli akt jest dalej nazywany skrótowo (np. "ustawa zmieniana w art. 1"), podaj ten skrót jako alias.
"""

REFERENCES_INSTRUCTION = """\
Wyszukujesz w artykułach polskiego aktu prawnego odesłania do artykułów (np. "o którym mowa w art. 5 ust. 2",
"art. 99b ust. 4 ustawy zmienianej w art. 1", "w rozumieniu art. 2 pkt 12b ustawy z dnia ... o ...").

Zasady:
- Zwracaj tylko numer artykułu (bez ustępu, punktu, litery podpunktu).
- Odesłanie bez nazwy aktu ("art. 5", "ust. 2 art. 7", "niniejszej ustawy") dotyczy aktu analizowanego: same_act = true.
- Wyjątek: tekst w cudzysłowie „...” w ustawie zmieniającej to nowe brzmienie przepisów aktu zmienianego.
  Odesłania bez nazwy aktu wewnątrz takiego cytatu dotyczą aktu zmienianego, nie analizowanego.
- Dla innych aktów uzupełnij rodzaj, datę i nazwę na podstawie listy znanych aktów (także gdy tekst używa skrótu).
  Kodeksy są ustawami: "ustawy z dnia 26 czerwca 1974 r. – Kodeks pracy" -> rodzaj "ustawa", nazwa "Kodeks pracy".
- Pomijaj odesłania do ustępów/punktów tego samego artykułu (np. "ust. 2" bez numeru artykułu).
- Zwróć wpis dla każdego podanego artykułu, także z pustą listą odesłań.
"""

SUMMARY_INSTRUCTION = """\
Streszczasz artykuł polskiego aktu prawnego dla osób bez wykształcenia prawniczego.

Zasady:
- Pisz po polsku, prostym językiem. Opisz, co przepis faktycznie ustanawia lub zmienia.
- Streszczenie ma być samodzielne: zamiast "o którym mowa w art. X" wyjaśnij, czego dotyczy art. X,
  korzystając z dołączonych przepisów powiązanych.
- Jeśli treść powiązanego przepisu jest niedostępna, napisz wprost, że odesłanie nie zostało wyjaśnione. Nie zgaduj.
- Zachowaj konkretne liczby, kwoty, terminy i daty.
- W ustawie zmieniającej opisz, co i w jakim akcie się zmienia.
- Jeśli dostajesz kolejną część długiego artykułu, streszczaj tylko nową część, nie powtarzaj wcześniejszych.
- Odpowiedz samym streszczeniem, bez nagłówków i wstępów.
"""


async def extract_act_context(client: GeminiClient, act_title: str, article_texts: list[str]) -> ActContext:
    previews = "\n\n".join(text[:ARTICLE_PREVIEW_CHARS] for text in article_texts)
    return await client.generate_structured(
        f"Akt: {act_title}\n\nPoczątki artykułów:\n\n{previews}",
        ActContext,
        system_instruction=CONTEXT_INSTRUCTION,
    )


async def extract_references(
    client: GeminiClient, act_title: str, context: ActContext, articles: list[tuple[str, str]]
) -> ReferenceBatch:
    """`articles` is a batch of (article_number, text)."""
    known = "\n".join(
        f"- {a.act_type} | {a.act_date or 'data nieznana'} | {a.act_name}" + (f" | skrót: {a.alias}" if a.alias else "")
        for a in context.referenced_acts
    )
    body = "\n\n".join(f"=== Art. {number} ===\n{text}" for number, text in articles)
    prompt = f"Akt analizowany: {act_title}\n\nZnane akty, do których odsyła tekst:\n{known or '- brak'}\n\n{body}"
    return await client.generate_structured(prompt, ReferenceBatch, system_instruction=REFERENCES_INSTRUCTION)


async def summarize_article_part(
    client: GeminiClient,
    *,
    act_title: str,
    article_number: str,
    text: str,
    related: list[str],
    previous_parts_summary: str | None = None,
    part: int = 1,
    part_count: int = 1,
) -> str:
    sections = [f"Akt: {act_title}", f"Artykuł: art. {article_number}"]
    if related:
        sections.append("Przepisy powiązane (odesłania z tego artykułu):\n\n" + "\n\n".join(related))
    if previous_parts_summary:
        sections.append(f"Streszczenie wcześniejszych części tego artykułu:\n{previous_parts_summary}")
    label = f"Treść artykułu (część {part} z {part_count})" if part_count > 1 else "Treść artykułu"
    sections.append(f"{label}:\n{text}")

    response = await client.generate("\n\n".join(sections), system_instruction=SUMMARY_INSTRUCTION)
    return response.text.strip()
