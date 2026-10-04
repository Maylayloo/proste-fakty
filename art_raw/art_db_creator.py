import re
import os
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey, UniqueConstraint
from sqlalchemy.orm import declarative_base, sessionmaker, relationship


# =====================================================================
# 1. FUNKCJA DO TWORZENIA ELI (identyfikator ustawy)
# =====================================================================
def stworz_eli(tytul: str, data: str) -> str:
    """
    Tworzy pseudo-ELI z tytułu i daty, np.:
    DU/2008/ustawa_o_podatku_akcyzowym
    """
    tekst = tytul.lower()

    # Zamiana polskich znaków na odpowiedniki bez ogonków
    pl_znaki = {'ą': 'a', 'ć': 'c', 'ę': 'e', 'ł': 'l', 'ń': 'n', 'ó': 'o', 'ś': 's', 'ź': 'z', 'ż': 'z'}
    for k, v in pl_znaki.items():
        tekst = tekst.replace(k, v)

    slug = re.sub(r'[^a-z0-9]+', '_', tekst).strip('_')
    year = data.split('-')[0]
    return f"DU/{year}/{slug}"


# =====================================================================
# 2. KONFIGURACJA BAZY DANYCH (PostgreSQL via Docker)
# =====================================================================
PG_USER = os.environ.get("POSTGRES_USER", "postgres")
PG_PASS = os.environ.get("POSTGRES_PASSWORD", "postgres")
PG_HOST = os.environ.get("POSTGRES_HOST", "localhost")
PG_PORT = os.environ.get("POSTGRES_PORT", "5432")
PG_DB   = os.environ.get("POSTGRES_DB", "proste_fakty")

DATABASE_URL = f"postgresql://{PG_USER}:{PG_PASS}@{PG_HOST}:{PG_PORT}/{PG_DB}"

engine = create_engine(DATABASE_URL, echo=False)
Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)


# =====================================================================
# Modele odpowiadające tabelom backendu (acts + articles)
# =====================================================================
class Act(Base):
    __tablename__ = 'acts'

    id = Column(Integer, primary_key=True, autoincrement=True)
    eli = Column(String(64), unique=True, nullable=False)
    title = Column(Text, nullable=False)
    short_title = Column(Text, nullable=True)

    articles = relationship("Article", back_populates="act")


class Article(Base):
    __tablename__ = 'articles'
    __table_args__ = (UniqueConstraint('act_id', 'number'),)

    id = Column(Integer, primary_key=True, autoincrement=True)
    act_id = Column(Integer, ForeignKey('acts.id', ondelete='CASCADE'), nullable=False)
    number = Column(String(32), nullable=False)
    text = Column(Text, nullable=False)

    act = relationship("Act", back_populates="articles")


def init_db():
    """Tworzy tabele acts i articles jeśli nie istnieją (nie rusza sittings)."""
    Act.__table__.create(engine, checkfirst=True)
    Article.__table__.create(engine, checkfirst=True)


# =====================================================================
# 3. PARSOWANIE I ZAPIS
# =====================================================================
def parse_and_insert_law(file_path: str, law_title: str, law_date: str):
    if not os.path.exists(file_path):
        print(f"[WARN] Brak pliku: {file_path}")
        return

    with open(file_path, "r", encoding="utf-8") as file:
        full_text = file.read()

    # Wzorzec dzielący tekst
    split_pattern = r"(?=\n\s*Art\.\s+\d+[a-z]*\.)"
    chunks = re.split(split_pattern, "\n" + full_text)

    number_pattern = r"Art\.\s+(\d+[a-z]*)\."

    session = SessionLocal()
    inserted_count = 0

    try:
        # Znajdź lub utwórz ustawę (Act)
        eli = stworz_eli(law_title, law_date)
        act = session.query(Act).filter_by(eli=eli).first()
        if not act:
            act = Act(eli=eli, title=law_title, short_title=None)
            session.add(act)
            session.flush()  # żeby uzyskać act.id

        for chunk in chunks:
            chunk = chunk.strip()
            if chunk.startswith("Art."):
                match = re.search(number_pattern, chunk)
                if match:
                    art_number = match.group(1)  # np. "1", "137a"

                    # Sprawdzamy czy duplikat już istnieje
                    istniejacy = session.query(Article).filter_by(
                        act_id=act.id, number=art_number
                    ).first()
                    if not istniejacy:
                        nowy_artykul = Article(
                            act_id=act.id,
                            number=art_number,
                            text=chunk
                        )
                        session.add(nowy_artykul)
                        inserted_count += 1

        session.commit()
        print(f"[OK] Dodano {inserted_count} artykulow z: '{law_title}'")

    except Exception as e:
        session.rollback()
        print(f"Błąd podczas zapisu ustawy {law_title}: {e}")
    finally:
        session.close()


# =====================================================================
# URUCHOMIENIE
# =====================================================================
if __name__ == "__main__":
    init_db()

    # Twoje pliki
    ustawy_do_przetworzenia = [
        {
            "plik": "zus.txt",
            "tytul": "Ustawa o systemie ubezpieczeń społecznych",
            "data": "1998-10-13"
        },
        {
            "plik": "pit.txt",
            "tytul": "Ustawa o podatku dochodowym od osób fizycznych",
            "data": "2008-12-06"
        },
        {
            "plik": "ochrona_srodowiska.txt",
            "tytul": "Prawo ochrony środowiska",
            "data": "2001-04-27"
        },
        {
            "plik": "art_e_papierosy_main.txt",
            "tytul": "Ustawa o zmianie ustawy o podatku akcyzowym",
            "data": "2026-09-18"
        },
        {
            "plik": "art_e_papierosy_mother.txt",
            "tytul": "Ustawa o podatku akcyzowym",
            "data": "2008-12-06"
        }
    ]

    for ustawa in ustawy_do_przetworzenia:
        parse_and_insert_law(ustawa["plik"], ustawa["tytul"], ustawa["data"])