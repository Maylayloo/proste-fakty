import asyncio
import re
from contextlib import asynccontextmanager
from datetime import date
from pathlib import Path

import pytest

from app.pipeline import silver
from app.pipeline.act_keys import make_act_key, make_article_slug
from app.pipeline.pdf_reader import ActPdfReader, ArticleSegment, split_units
from app.utils.gemini_client.tasks.act_ingestion import (
    ActContext,
    ArticleReferences,
    ExtractedReference,
    KnownAct,
    ReferenceBatch,
)

SAMPLE_PDF = Path(__file__).parent.parent / "pdfs" / "2839_u.pdf"
needs_sample = pytest.mark.skipif(not SAMPLE_PDF.exists(), reason="sample act PDF not present")


def _no_whitespace(text: str) -> str:
    return re.sub(r"\s+", "", text)


@needs_sample
def test_reader_splits_amending_act():
    parsed = ActPdfReader(SAMPLE_PDF).parse()

    assert parsed.preamble.startswith("Tekst ustawy przekazany do Senatu")
    assert parsed.header.act_type == "USTAWA"
    assert parsed.header.act_date == date(2026, 9, 18)
    assert parsed.header.act_key == "ustawa_o_zmianie_ustawy_o_podatku_akcyzowym_2026_09_18"
    # Art. 137a / 137b are quoted new wording of the amended act, not articles of this act.
    assert [a.number for a in parsed.articles] == ["1", "2", "3", "4"]
    assert "Art. 137b. Minister właściwy" in parsed.articles[0].text
    assert parsed.signature.strip().startswith("MARSZAŁEK SEJMU")
    assert "Czarzasty" not in parsed.articles[-1].text


@needs_sample
def test_reader_keeps_every_line_and_drops_only_page_numbers():
    reader = ActPdfReader(SAMPLE_PDF)
    parsed = reader.parse()
    lines = reader.lines()

    assert not any(line.strip().isdigit() for line in lines)  # "2", "3", ... page numbers removed
    pieces = [parsed.preamble, parsed.header.raw, *(a.text for a in parsed.articles), parsed.signature]
    assert _no_whitespace("".join(pieces)) == _no_whitespace("".join(lines))


@pytest.mark.parametrize(
    ("act_type", "name", "act_date", "expected"),
    [
        ("ustawa", "o podatku akcyzowym", date(2008, 12, 6), "ustawa_o_podatku_akcyzowym_2008_12_06"),
        ("USTAWA", "– Kodeks pracy", date(1974, 6, 26), "ustawa_kodeks_pracy_1974_06_26"),
        ("ustawa", "ustawy o zmianie ustawy – Prawo o ruchu drogowym", date(2020, 1, 2),
         "ustawa_o_zmianie_ustawy_prawo_o_ruchu_drogowym_2020_01_02"),
        ("ROZPORZĄDZENIE MINISTRA FINANSÓW", "w sprawie znaków akcyzy", date(2024, 3, 5),
         "rozporzadzenie_ministra_finansow_w_sprawie_znakow_akcyzy_2024_03_05"),
        ("ustawa", "o statystyce publicznej", None, "ustawa_o_statystyce_publicznej"),
    ],
)
def test_make_act_key(act_type, name, act_date, expected):
    assert make_act_key(act_type, name, act_date) == expected


@pytest.mark.parametrize(
    ("number", "expected"),
    [("99b", "art_99b"), ("Art. 137a", "art_137a"), ("26¹", "art_26_1"), ("§ 5", "art_5")],
)
def test_make_article_slug(number, expected):
    act_key = "ustawa_o_podatku_akcyzowym_2008_12_06"
    assert make_article_slug(act_key, number) == f"{act_key}_{expected}"


def _ref(article: str, same_act: bool = True, act_date: str | None = None, act_name: str | None = None):
    act_type = None if same_act else "ustawa"
    return ExtractedReference(
        article=article, same_act=same_act, act_type=act_type, act_date=act_date, act_name=act_name
    )


def test_summary_waves_follow_backward_references_only():
    articles = [ArticleSegment(number=str(i), position=i - 1, text=f"Art. {i}.") for i in range(1, 5)]
    refs = {"2": [_ref("1")], "3": [_ref("2"), _ref("4")], "4": [_ref("99", same_act=False)]}

    waves = silver.summary_waves(articles, refs)

    # 3 -> 2 -> 1 chain; 3's forward ref to 4 and 4's external ref add no dependency.
    assert [[a.number for a in wave] for wave in waves] == [["1", "4"], ["2"], ["3"]]


def test_long_article_parts_keep_all_text():
    text = "Art. 1. Zmiany:\n" + "\n".join(f"{i}) w art. {i} dodaje się wyrazy „x” " + "y" * 400 for i in range(1, 40))
    parts = silver._article_part_splitter.split_text(text)

    assert len(parts) > 1
    assert all(len(p) <= silver.ARTICLE_PART_CHARS for p in parts)
    assert _no_whitespace("".join(parts)) == _no_whitespace(text)
    assert all(re.match(r"(Art\. 1\.|\d+\) )", p) for p in parts)  # cut before amendment points


class FakeGemini:
    def __init__(self):
        self.summary_prompts: list[str] = []

    async def generate_structured(self, prompt, schema, **_):
        if schema is ActContext:
            return ActContext(referenced_acts=[
                KnownAct(
                    alias="ustawa zmieniana w art. 1", act_type="ustawa", act_date="2008-12-06",
                    act_name="o podatku akcyzowym",
                )
            ])
        assert schema is ReferenceBatch
        numbers = re.findall(r"^=== Art\. (\S+) ===$", prompt, re.MULTILINE)
        refs = {
            "2": [_ref("1"), _ref("99b", False, "2008-12-06", "o podatku akcyzowym")],
            "3": [_ref("2"), _ref("137b", False, "2008-12-06", "o podatku akcyzowym")],
        }
        return ReferenceBatch(articles=[ArticleReferences(article_number=n, references=refs.get(n, [])) for n in numbers])

    async def generate(self, prompt, **_):
        self.summary_prompts.append(prompt)
        number = re.search(r"Artykuł: art\. (\S+)", prompt)[1]
        part = re.search(r"część (\d+) z", prompt)
        return type("R", (), {"text": f"SUMMARY-{number}" + (f"-part{part[1]}" if part else "")})()


@needs_sample
def test_build_silver_on_sample_act(monkeypatch):
    lookups = []

    async def fake_find(session, act_key, number):
        lookups.append((act_key, number))

    @asynccontextmanager
    async def fake_session():
        yield None

    monkeypatch.setattr(silver, "find_article", fake_find)
    parsed = ActPdfReader(SAMPLE_PDF).parse()
    client = FakeGemini()

    result = asyncio.run(silver.build_silver(parsed, client, fake_session, concurrency=4))
    by_number = {a.segment.number: a for a in result}

    # Art. 1 and 2 are > ARTICLE_PART_CHARS, so they are summarised in parts with a rolling summary.
    assert by_number["1"].summary == "SUMMARY-1-part1\n\nSUMMARY-1-part2"
    assert by_number["4"].summary == "SUMMARY-4"
    # External refs are looked up by normalised key; unresolved ones are marked, not dropped.
    assert ("ustawa_o_podatku_akcyzowym_2008_12_06", "99b") in lookups
    art2_refs = {r.slug: r for r in by_number["2"].references}
    assert not art2_refs["ustawa_o_podatku_akcyzowym_2008_12_06_art_99b"].resolved
    assert art2_refs["ustawa_o_zmianie_ustawy_o_podatku_akcyzowym_2026_09_18_art_1"].same_act
    # Same-act ref uses the already finished summary of art. 1 (depth 1).
    art2_prompt = next(p for p in client.summary_prompts if "Artykuł: art. 2" in p)
    assert "SUMMARY-1-part1" in art2_prompt and "Treść niedostępna w bazie" in art2_prompt


def test_split_units_restores_superscripts_and_reads_isap_version_markers():
    lines = [
        "Art. 41. Rada.",
        "Art. 411. Pierwszy z indeksem.",  # "Art. 41¹." with the superscript flattened by the PDF
        "Art. 412. Drugi z indeksem.",
        "Art. 41a. Litera.",
        "[Art. 42. Brzmienie, które wygasa.]",
        "<Art. 42a. Brzmienie przyszłe.>",
        "Art. 91. Ostatni przed luką.",
        "Art. 117. Po luce (art. 92-116 pominięte).",
    ]
    _, articles, _, _ = split_units(lines)
    assert [a.number for a in articles] == ["41", "41^1", "41^2", "41a", "42", "42a", "91", "117"]
