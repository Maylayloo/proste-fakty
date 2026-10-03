from sqlalchemy import create_engine, Column, Integer, String, Text
from sqlalchemy.orm import declarative_base, sessionmaker

# =====================================================================
# 1. KONFIGURACJA POŁĄCZENIA
# =====================================================================
engine = create_engine('sqlite:///prawo.db', echo=False)
Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)


# Model musi odzwierciedlać strukturę z poprzedniego skryptu
class Artykul(Base):
    __tablename__ = 'artykuly'

    id = Column(Integer, primary_key=True, autoincrement=True)
    unikalny_id = Column(String, unique=True, nullable=False, index=True)
    tytul_ustawy = Column(String, nullable=False)
    data_ustawy = Column(String, nullable=False)
    numer_artykulu = Column(String, nullable=False)
    tresc = Column(Text, nullable=False)


# =====================================================================
# 2. FUNKCJA TESTUJĄCA
# =====================================================================
def sprawdz_baze():
    session = SessionLocal()

    try:
        # Sprawdzamy łączną liczbę zapisanych artykułów
        liczba_art = session.query(Artykul).count()
        print(f"📊 Całkowita liczba artykułów w bazie: {liczba_art}\n")

        if liczba_art > 0:
            # Pobieramy pierwszy z brzegu artykuł
            przyklad = session.query(Artykul).first()

            print("--- PRZYKŁADOWY REKORD ---")
            print(f"🔑 Unikalny ID : {przyklad.unikalny_id}")
            print(f"📖 Tytuł ustawy: {przyklad.tytul_ustawy}")
            print(f"📅 Data ustawy : {przyklad.data_ustawy}")
            print(f"🔢 Numer       : Art. {przyklad.numer_artykulu}")
            print("-" * 30)

            # Wypisujemy początek treści (pierwsze 300 znaków), żeby nie zaśmiecić konsoli
            tresc_skrocona = przyklad.tresc[:300].replace('\n', ' ')
            print(f"📝 Treść (początek):\n{tresc_skrocona}...")
            print("-" * 30)

            # Przykładowe wyszukiwanie po konkretnym ID (symulacja Toola z LLM)
            szukane_id = przyklad.unikalny_id
            znaleziony_po_id = session.query(Artykul).filter(Artykul.unikalny_id == szukane_id).first()

            if znaleziony_po_id:
                print("\n✅ Test wyszukiwania po `unikalny_id` zadziałał poprawnie!")

    except Exception as e:
        print(f"❌ Wystąpił błąd: {e}")
    finally:
        session.close()


if __name__ == "__main__":
    sprawdz_baze()