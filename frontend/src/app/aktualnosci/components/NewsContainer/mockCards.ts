import { NewsItem } from '../NewsCard/NewsCard'

// DISCLAIMER: THIS IS THE ONLY MOCKED DATA IN OUR PROJECT,
// AS IT MAKES NO SENSE TO DO AKTUALNOŚCI WITHOUT USERS

export const mockNewsItems: NewsItem[] = [
  {
    id: 'e4a1b2c3-1234-5678-90ab-cdef12345678',
    category: 'Podatki i Finanse',
    date: '2026-09-18',
    docNumber: '3099',
    status: 'passed' as any,
    statusLabel: 'Uchwalono',
    title: 'Wyższy limit zwolnienia z podatku przy sprzedaży rzeczy',
    subtitle: 'Zmiany w podatkach lokalnych i PCC',
    summary30s:
      'Zwiększono z 1 tys. zł do 3 tys. zł limit zwolnienia z podatku przy sprzedaży używanych rzeczy. Dodatkowo uregulowano na nowo zasady pobierania opłaty miejscowej i uzdrowiskowej.',
    beforeText:
      'Sprzedaż używanych rzeczy ruchomych o wartości powyżej 1000 zł (np. elektroniki, mebli) wiązała się z koniecznością zapłaty podatku od czynności cywilnoprawnych (PCC).',
    afterText:
      'Podatek zapłacisz dopiero wtedy, gdy wartość sprzedawanej rzeczy przekroczy kwotę 3000 zł, co zdejmuje obowiązek podatkowy z większości drobnych transakcji.',
    targetAudience: 'Osoby prywatne, turyści, sprzedawcy okazjonalni',
    readTime: '3 min',
    docType: '',
    contentType: '',
  },
  {
    id: 'f5b2c3d4-2345-6789-01bc-def234567890',
    category: 'Prawo i Bezpieczeństwo',
    date: '2026-09-16',
    docNumber: '3101',
    status: 'pending' as any,
    statusLabel: 'Procedowany',
    title: 'Surowsze kary za wykroczenia na przejazdach kolejowych',
    subtitle: 'Nowelizacja Prawa o ruchu drogowym',
    summary30s:
      'Projekt zakłada natychmiastowe zatrzymanie prawa jazdy na 3 miesiące za najpoważniejsze wykroczenia popełniane na przejazdach kolejowych. Celem jest poprawa bezpieczeństwa.',
    beforeText:
      'Za wjazd na przejazd kolejowy przy opuszczających się zaporach kierowcy groził mandat i punkty karne, ale zazwyczaj bez natychmiastowej utraty uprawnień.',
    afterText:
      'Złamanie zakazu wjazdu na przejazd przy czerwonym świetle lub opadających rogatkach będzie skutkować obligatoryjnym, natychmiastowym zatrzymaniem prawa jazdy na 3 miesiące.',
    targetAudience: 'Kierowcy, piesi, uczestnicy ruchu drogowego',
    readTime: '2 min',
    docType: '',
    contentType: '',
  },
  {
    id: 'a1b2c3d4-3456-7890-12de-fab345678901',
    category: 'Gospodarka i Biznes',
    date: '2024-05-09',
    docNumber: '263',
    status: 'passed' as any,
    statusLabel: 'Uchwalono',
    title: 'Wakacje składkowe dla przedsiębiorców',
    subtitle: 'Nowelizacja ustawy o systemie ubezpieczeń społecznych',
    summary30s:
      'Mikroprzedsiębiorcy mogą raz w roku zawiesić opłacanie własnych składek na ubezpieczenia społeczne za wybrany miesiąc kalendarzowy, bez utraty ciągłości ubezpieczeniowej.',
    beforeText:
      'Przedsiębiorcy musieli opłacać pełne składki społeczne za każdy miesiąc prowadzenia działalności, niezależnie od przerw urlopowych czy sezonowych spadków przychodów.',
    afterText:
      'W wybranym miesiącu składki społeczne finansuje budżet państwa, dzięki czemu przedsiębiorca zachowuje prawo do świadczeń, płacąc jedynie składkę zdrowotną.',
    targetAudience:
      'Samozatrudnieni, mikroprzedsiębiorcy, właściciele jednoosobowych firm',
    readTime: '3 min',
    docType: '',
    contentType: '',
  },
  {
    id: 'b2c3d4e5-4567-8901-23ef-abc456789012',
    category: 'Zdrowie',
    date: '2026-08-25',
    docNumber: '2481',
    status: 'passed' as any,
    statusLabel: 'Uchwalono',
    title: 'Ochrona przed pseudomedycyną i szarlatanerią',
    subtitle: 'Nowelizacja ustawy o prawach pacjenta',
    summary30s:
      'Wprowadzono zakaz promowania i świadczenia niezweryfikowanych medycznie usług zagrażających życiu oraz uprawnienia do nakładania dotkliwych kar finansowych na fałszywych uzdrowicieli.',
    beforeText:
      'Ściganie osób oferujących pseudoterapie i wprowadzających chorych w błąd było utrudnione i wymagało żmudnych procesów karnych o bezpośrednie narażenie życia.',
    afterText:
      'Rzecznik Praw Pacjenta może błyskawicznie nakładać kary do 1 mln zł i wnioskować o blokowanie witryn promujących niebezpieczne praktyki pseudomedyczne.',
    targetAudience: 'Pacjenci, rodziny chorych, konsumenci usług medycznych',
    readTime: '3 min',
    docType: '',
    contentType: '',
  },
  {
    id: 'c3d4e5f6-5678-9012-34fa-bcd567890123',
    category: 'Podatki i Finanse',
    date: '2026-09-02',
    docNumber: '2685',
    status: 'passed' as any,
    statusLabel: 'Uchwalono',
    title: 'Wyłączenie sprzedaży środków trwałych ze składki zdrowotnej',
    subtitle: 'Nowelizacja ustawy o świadczeniach opieki zdrowotnej',
    summary30s:
      'Zlikwidowano obowiązek naliczania składki zdrowotnej od przychodów ze sprzedaży firmowych środków trwałych, takich jak samochody czy maszyny.',
    beforeText:
      'Sprzedaż samochodu lub nieruchomości firmowej drastycznie podnosiła dochód/przychód, skutkując jednorazową, wysoką składką zdrowotną do zapłaty.',
    afterText:
      'Zysk ze sprzedaży środka trwałego nie powiększa już podstawy wymiaru składki zdrowotnej, zapobiegając karaniu przedsiębiorców za modernizację majątku firmy.',
    targetAudience: 'Przedsiębiorcy, samozatrudnieni, ryczałtowcy',
    readTime: '2 min',
    docType: '',
    contentType: '',
  },
  {
    id: 'd4e5f6a7-6789-0123-45ab-cde678901234',
    category: 'Nowe Technologie',
    date: '2026-06-14',
    docNumber: '2064',
    status: 'rejected' as any,
    statusLabel: 'Odrzucono',
    title: 'Ustawa o rynku kryptoaktywów (MiCA)',
    subtitle: 'Nadzór KNF nad platformami kryptowalutowymi',
    summary30s:
      'Rządowy projekt nakładający restrykcyjny nadzór KNF na kantory i giełdy kryptowalut, zawierający mechanizmy blokowania serwisów i wysokie opłaty licencyjne, został zawetowany i odrzucony.',
    beforeText:
      'Rynek krypto w Polsce działał głównie na podstawie przepisów o przeciwdziałaniu praniu pieniędzy (AML) i wpisu do rejestru działalności w zakresie walut wirtualnych.',
    afterText:
      'Weto zablokowało zaostrzone regulacje oraz uprawnienia KNF do arbitralnego odcinania domen giełd; konieczne jest wypracowanie nowego projektu kompromisowego.',
    targetAudience:
      'Inwestorzy kryptowalut, giełdy i kantory krypto, użytkownicy web3',
    readTime: '4 min',
    docType: '',
    contentType: '',
  },
  {
    id: 'e5f6a7b8-7890-1234-56bc-def789012345',
    category: 'Technologie i Społeczeństwo',
    date: '2026-09-24',
    docNumber: '2554',
    status: 'pending' as any,
    statusLabel: 'Procedowany',
    title: 'Wdrożenie Aktu o usługach cyfrowych (DSA)',
    subtitle: 'Nowelizacja ustawy o świadczeniu usług drogą elektroniczną',
    summary30s:
      'Nowe zasady ochrony użytkowników internetu przed nieuzasadnionym banowaniem na portalach społecznościowych oraz procedura szybkiego usuwania nielegalnych treści pod nadzorem UKE.',
    beforeText:
      'Użytkownicy mieli ograniczone możliwości kwestionowania decyzji algorytmów i moderatorów platform takich jak Facebook, YouTube czy X w przypadku blokady konta.',
    afterText:
      'Platformy muszą zapewnić transparentną ścieżkę odwoławczą dla polskich użytkowników, a Koordynator ds. Usług Cyfrowych (Prezes UKE) zyskuje prawo egzekwowania praw internautów.',
    targetAudience:
      'Użytkownicy mediów społecznościowych, twórcy internetowi, konsumenci e-commerce',
    readTime: '3 min',
    docType: '',
    contentType: '',
  },
]
