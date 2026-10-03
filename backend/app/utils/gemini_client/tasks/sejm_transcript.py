import asyncio

from pydantic import BaseModel, Field

from app.utils.gemini_client.client import GeminiClient

# Gemini has a large context window, so most sittings fit in one call.
# Longer transcripts are summarised in chunks first and then merged (map-reduce).
SINGLE_PASS_MAX_CHARS = 600_000
CHUNK_CHARS = 200_000

SYSTEM_INSTRUCTION = """\
Streszczasz stenogramy z posiedzeń Sejmu RP dla osób, które nie śledzą polityki ani prawa.

Zasady:
- Pisz po polsku, prostym językiem.
- Bądź neutralny politycznie: relacjonuj stanowiska, nie oceniaj ich.
- Przy każdym stanowisku podawaj, kto je wyraził (imię i nazwisko, klub lub funkcja, jeśli są w stenogramie).
- Pomijaj sprawy proceduralne (przerwy, ogłoszenia porządkowe), chyba że miały wpływ na przebieg obrad.
- Uwzględniaj tylko informacje ze stenogramu.
"""

REDUCE_INSTRUCTION = """\
Poniżej są streszczenia kolejnych części jednego posiedzenia Sejmu (JSON).
Połącz je w jedno spójne streszczenie całego posiedzenia: scal powtarzające się tematy,
zachowaj wszystkie decyzje i głosowania, nie dodawaj informacji spoza streszczeń.
"""


class TranscriptTopic(BaseModel):
    title: str = Field(description="Krótki tytuł tematu, np. nazwa projektu ustawy")
    summary: str = Field(description="2-5 zdań: o co chodziło i jakie padły stanowiska")
    speakers: list[str] = Field(description="Najważniejsi mówcy w tym temacie")


class TranscriptSummary(BaseModel):
    overview: str = Field(description="3-5 zdań o całym posiedzeniu")
    topics: list[TranscriptTopic]
    decisions: list[str] = Field(description="Głosowania i decyzje z wynikiem, jeśli jest podany")


def _split_into_chunks(text: str, chunk_chars: int) -> list[str]:
    """Split on paragraph boundaries so speeches are not cut mid-sentence where possible."""
    chunks, current, size = [], [], 0
    for paragraph in text.split("\n\n"):
        if size + len(paragraph) > chunk_chars and current:
            chunks.append("\n\n".join(current))
            current, size = [], 0
        current.append(paragraph)
        size += len(paragraph) + 2
    if current:
        chunks.append("\n\n".join(current))
    return chunks


async def summarize_transcript(client: GeminiClient, transcript: str) -> TranscriptSummary:
    if len(transcript) <= SINGLE_PASS_MAX_CHARS:
        return await client.generate_structured(
            f"Stenogram:\n\n{transcript}", TranscriptSummary, system_instruction=SYSTEM_INSTRUCTION
        )

    chunks = _split_into_chunks(transcript, CHUNK_CHARS)
    partials = await asyncio.gather(
        *(
            client.generate_structured(
                f"Część {i} z {len(chunks)} stenogramu:\n\n{chunk}",
                TranscriptSummary,
                system_instruction=SYSTEM_INSTRUCTION,
            )
            for i, chunk in enumerate(chunks, start=1)
        )
    )
    merged_input = "\n\n".join(p.model_dump_json() for p in partials)
    return await client.generate_structured(
        merged_input, TranscriptSummary, system_instruction=SYSTEM_INSTRUCTION + "\n" + REDUCE_INSTRUCTION
    )
