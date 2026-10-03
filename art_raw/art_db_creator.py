import re
import os
from sqlalchemy import create_engine, Column, Integer, String, Text
from sqlalchemy.orm import declarative_base, sessionmaker


# =====================================================================
# 1. FUNKCJA DO TWORZENIA UNIKALNEGO ID (SLUG)
# =====================================================================
def stworz_unikalne_id(tytul: str, data: str, numer_art: str) -> str:
    """
    Zmienia tytuł, datę i numer w jednolity string, np.:
    ustawa_o_podatku_akcyzowym_2008_12_06_art_2
    """
    tekst = f"{tytul}_{data}_art_{numer_art}".lower()

    # Zamiana polskich znaków na odpowiedniki bez ogonków
    pl_znaki = {'ą': 'a', 'ć': 'c', 'ę': 'e', 'ł': 'l', 'ń': 'n', 'ó': 'o', 'ś': 's', 'ź': 'z', 'ż': 'z'}
    for k, v in pl_znaki.items():
        tekst = tekst.replace(k, v)

    # Usunięcie wszystkiego co nie jest literą lub cyfrą i zastąpienie znakiem '_'
    tekst = re.sub(r'[^a-z0-9]+', '_', tekst)

    return tekst.strip('_')


# =====================================================================
# 2. KONFIGURACJA BAZY DANYCH (SQLAlchemy)
# =====================================================================
engine = create_engine('sqlite:///prawo.db', echo=False)
Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)


# Definicja modelu (tabeli w bazie)
class Artykul(Base):
    __tablename__ = 'artykuly'

    id = Column(Integer, primary_key=True, autoincrement=True)
    unikalny_id = Column(String, unique=True, nullable=False, index=True)
    tytul_ustawy = Column(String, nullable=False)
    data_ustawy = Column(String, nullable=False)
    numer_artykulu = Column(String, nullable=False)
    tresc = Column(Text, nullable=False)


def init_db():
    """Inicjalizuje bazę: czyści stare dane i tworzy nową strukturę."""
    # Czyszczenie przy każdym uruchomieniu (odpowiednik DROP TABLE)
    Base.metadata.drop_all(engine)
    # Tworzenie tabeli
    Base.metadata.create_all(engine)


# =====================================================================
# 3. PARSOWANIE I ZAPIS
# =====================================================================
def parse_and_insert_law(file_path: str, law_title: str, law_date: str):
    if not os.path.exists(file_path):
        print(f"⚠️ Brak pliku: {file_path}")
        return

    with open(file_path, "r", encoding="utf-8") as file:
        full_text = file.read()

    # Wzorzec dzielący tekst
    split_pattern = r"(?=\n\s*Art\.\s+\d+[a-z]*\.)"
    chunks = re.split(split_pattern, "\n" + full_text)

    number_pattern = r"Art\.\s+(\d+[a-z]*)\."

    # Otwieramy sesję z bazą
    session = SessionLocal()
    inserted_count = 0

    try:
        for chunk in chunks:
            chunk = chunk.strip()
            if chunk.startswith("Art."):
                match = re.search(number_pattern, chunk)
                if match:
                    art_number = match.group(1)  # np. "1", "137a"

                    # Generujemy unikalny klucz
                    uid = stworz_unikalne_id(law_title, law_date, art_number)

                    # Sprawdzamy czy duplikat już istnieje, jeśli nie -> dodajemy
                    istniejacy = session.query(Artykul).filter_by(unikalny_id=uid).first()
                    if not istniejacy:
                        nowy_artykul = Artykul(
                            unikalny_id=uid,
                            tytul_ustawy=law_title,
                            data_ustawy=law_date,
                            numer_artykulu=art_number,
                            tresc=chunk
                        )
                        session.add(nowy_artykul)
                        inserted_count += 1

        # Zapisujemy wszystko do bazy za jednym razem
        session.commit()
        print(f"✅ Dodano {inserted_count} artykułów z: '{law_title}'")

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