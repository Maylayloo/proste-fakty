import hashlib
import re
from dataclasses import dataclass, field
from datetime import date
from functools import cached_property
from pathlib import Path

from pypdf import PdfReader

from app.pipeline.act_keys import make_act_key

POLISH_MONTHS = {
    "stycznia": 1, "lutego": 2, "marca": 3, "kwietnia": 4, "maja": 5, "czerwca": 6,
    "lipca": 7, "sierpnia": 8, "września": 9, "października": 10, "listopada": 11, "grudnia": 12,
}  # fmt: skip

_DATE_LINE = re.compile(r"^z dnia (\d{1,2}) (\w+) (\d{4}) r\.", re.IGNORECASE)
# Consolidated texts (ISAP) mark wording that is about to expire with [...] and future wording with <...>.
_ARTICLE_START = re.compile(r"^[\[<]?Art\.\s*(\d+[a-z]*)\.(?:\s|$)")
_PARAGRAPH_START = re.compile(r"^§\s*(\d+[a-z]*)\.(?:\s|$)")
_CHAPTER_START = re.compile(r"^(Rozdział|DZIAŁ|Dział|Oddział)\s+\S+")
_SIGNATURE_START = re.compile(
    r"^(MARSZAŁEK|PREZYDENT|PREZES RADY MINISTRÓW|MINISTER)\b"  # Sejm print: "MARSZAŁEK SEJMU"
    r"|^(Prezydent Rzeczypospolitej Polskiej|Marszałek Sejmu|Prezes Rady Ministrów):"  # Dz. U.: "...: K. Nawrocki"
)
# Kancelaria Sejmu (ISAP) exports start every page with "©Kancelaria Sejmu   s. 2/40" + the export date.
ISAP_PAGE_HEADER = re.compile(r"^©Kancelaria Sejmu\s+s\.\s*\d+/\d+$")
ISAP_EXPORT_DATE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
_OPENING_QUOTES = "„"
_CLOSING_QUOTES = '”“"'  # plain " too: OCR transcriptions often close „..." with it


class PdfParseError(ValueError):
    pass


@dataclass(frozen=True)
class PdfFileInfo:
    path: Path
    file_name: str
    sha256: str
    size_bytes: int
    page_count: int
    metadata: dict[str, str]


@dataclass(frozen=True)
class ActHeader:
    act_type: str  # "USTAWA", "ROZPORZĄDZENIE MINISTRA ...", ...
    act_date: date | None
    date_text: str  # "z dnia 18 września 2026 r."
    name: str  # part after the date: "o zmianie ustawy o podatku akcyzowym"
    raw: str

    @property
    def title(self) -> str:
        return f"{self.act_type.capitalize()} {self.date_text} {self.name}"

    @property
    def act_key(self) -> str:
        return make_act_key(self.act_type, self.name, self.act_date)


@dataclass
class ArticleSegment:
    number: str
    position: int
    text: str  # full text including the "Art. N." prefix
    chapter: str | None = None


@dataclass
class ParsedAct:
    info: PdfFileInfo
    preamble: str  # e.g. "Tekst ustawy przekazany do Senatu..."
    header: ActHeader
    articles: list[ArticleSegment]
    chapters: list[str]
    signature: str
    full_text: str = field(repr=False)


class ActPdfReader:
    """Reads a Polish legal act PDF and splits it into header, articles and signature.

    Every line of the document ends up in exactly one part; `parse()` verifies that
    nothing was dropped. Only page numbers that pypdf puts at the top of pages 2+ are removed.
    Article markers inside quotes („Art. 5. ...”) belong to amended acts and are not split on.
    """

    def __init__(self, path: Path | str) -> None:
        self.path = Path(path)

    @cached_property
    def _reader(self) -> PdfReader:
        return PdfReader(self.path)

    def file_info(self) -> PdfFileInfo:
        data = self.path.read_bytes()
        raw_meta = self._reader.metadata or {}
        return PdfFileInfo(
            path=self.path,
            file_name=self.path.name,
            sha256=hashlib.sha256(data).hexdigest(),
            size_bytes=len(data),
            page_count=len(self._reader.pages),
            metadata={str(k).lstrip("/"): str(v) for k, v in raw_meta.items()},
        )

    @property
    def ocr_path(self) -> Path:
        """Cached transcription for PDFs without a text layer (see app.pipeline.run.to_silver)."""
        return self.path.with_suffix(".ocr.txt")

    def has_text_layer(self) -> bool:
        return any((page.extract_text() or "").strip() for page in self._reader.pages)

    def lines(self) -> list[str]:
        if self.ocr_path.exists():
            text = self.ocr_path.read_text(encoding="utf-8")
            return [line.rstrip() for line in text.splitlines() if line.strip()]
        result: list[str] = []
        for page_no, page in enumerate(self._reader.pages, start=1):
            page_lines = [line.rstrip() for line in (page.extract_text() or "").splitlines()]
            page_lines = [line for line in page_lines if line.strip()]
            if page_no > 1 and page_lines and page_lines[0].strip() == str(page_no):
                page_lines = page_lines[1:]
            if page_lines and ISAP_PAGE_HEADER.match(page_lines[0].strip()):
                page_lines = page_lines[1:]
                if page_lines and ISAP_EXPORT_DATE.match(page_lines[0].strip()):
                    page_lines = page_lines[1:]
            result.extend(page_lines)
        return result

    def parse(self) -> ParsedAct:
        lines = self.lines()
        if not lines:
            raise PdfParseError(f"{self.path.name}: no text layer (scanned PDF?)")

        head, articles, chapters, signature = split_units(lines)

        if not articles:
            raise PdfParseError(f"{self.path.name}: no articles (Art. N. / § N.) found")

        preamble, header = _parse_header(head, self.path.name)
        parsed = ParsedAct(
            info=self.file_info(),
            preamble=preamble,
            header=header,
            articles=articles,
            chapters=chapters,
            signature="\n".join(signature),
            full_text="\n".join(lines),
        )
        _verify_nothing_skipped(parsed)
        return parsed


def _restore_superscript(number: str, previous: str | None) -> str:
    """PDF text loses superscripts: "Art. 41¹." comes out as "Art. 411.". A number that jumps ahead and starts with
    the previous article's number is read as one: after 41 (or 41^1), "411" -> "41^1", "412" -> "41^2"."""
    if previous is None or not number.isdigit():
        return number
    base = re.match(r"\d+", previous)[0]
    suffix = number[len(base) :]
    if number.startswith(base) and suffix and not suffix.startswith("0") and int(number) > int(base) + 1:
        return f"{base}^{suffix}"
    return number


def split_units(lines: list[str]) -> tuple[list[str], list[ArticleSegment], list[str], list[str]]:
    """Split act lines into (head, articles, chapter headings, signature); every line goes to exactly one.

    Units are "Art. N." (or "§ N." when the act has no articles). Markers inside quotes („Art. 5. ...”)
    are new wording of an amended act and stay part of the surrounding article.
    """
    unit_pattern = _ARTICLE_START if any(_ARTICLE_START.match(line.strip()) for line in lines) else _PARAGRAPH_START

    head: list[str] = []
    articles: list[ArticleSegment] = []
    chapters: list[str] = []
    signature: list[str] = []
    current_chapter: list[str] | None = None
    quote_depth = 0

    for line in lines:
        stripped = line.strip()
        outside_quotes = quote_depth == 0
        quote_depth = max(0, quote_depth + sum(line.count(q) for q in _OPENING_QUOTES)
                          - sum(line.count(q) for q in _CLOSING_QUOTES))

        if signature or outside_quotes and articles and _SIGNATURE_START.match(stripped):
            signature.append(line)
        elif outside_quotes and (match := unit_pattern.match(stripped)):
            chapter = " ".join(current_chapter) if current_chapter else (articles[-1].chapter if articles else None)
            current_chapter = None
            number = _restore_superscript(match[1], articles[-1].number if articles else None)
            articles.append(ArticleSegment(number=number, position=len(articles), text=line, chapter=chapter))
        elif outside_quotes and articles and _CHAPTER_START.match(stripped):
            current_chapter = [line]
            chapters.append(line)
        elif current_chapter is not None:
            current_chapter.append(line)  # chapter title lines
            chapters[-1] = " ".join(current_chapter)
        elif articles:
            articles[-1].text += "\n" + line
        else:
            head.append(line)

    return head, articles, chapters, signature


def _parse_header(head: list[str], file_name: str) -> tuple[str, ActHeader]:
    date_idx = next((i for i, line in enumerate(head) if _DATE_LINE.match(line.strip())), None)
    if date_idx is None:
        raise PdfParseError(f"{file_name}: act date line ('z dnia ...') not found")

    # The act type is the run of upper-case lines right above the date ("USTAWA", "ROZPORZĄDZENIE ...").
    type_start = date_idx
    while type_start > 0 and head[type_start - 1].strip().isupper():
        type_start -= 1

    day, month_name, year = _DATE_LINE.match(head[date_idx].strip()).groups()
    month = POLISH_MONTHS.get(month_name.lower())
    act_date = date(int(year), month, int(day)) if month else None

    header = ActHeader(
        act_type=" ".join(line.strip() for line in head[type_start:date_idx]) or "AKT",
        act_date=act_date,
        date_text=head[date_idx].strip(),
        name=" ".join(line.strip() for line in head[date_idx + 1 :]),
        raw="\n".join(head[type_start:]),
    )
    return "\n".join(head[:type_start]), header


def _verify_nothing_skipped(parsed: ParsedAct) -> None:
    pieces = [parsed.preamble, parsed.header.raw, *parsed.chapters, *(a.text for a in parsed.articles), parsed.signature]
    collected = sorted(re.sub(r"\s+", "", "".join(pieces)))
    original = sorted(re.sub(r"\s+", "", parsed.full_text))
    if collected != original:
        raise PdfParseError(f"{parsed.info.file_name}: parsed parts do not cover the whole document")
