import { NewsItem } from "../NewsCard/NewsCard";

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
    summary30s: 'Zwiększono z 1 tys. zł do 3 tys. zł limit zwolnienia z podatku przy sprzedaży używanych rzeczy. Dodatkowo uregulowano na nowo zasady pobierania opłaty miejscowej i uzdrowiskowej.',
    beforeText: 'Sprzedaż używanych rzeczy ruchomych o wartości powyżej 1000 zł (np. elektroniki, mebli) wiązała się z koniecznością zapłaty podatku od czynności cywilnoprawnych (PCC).',
    afterText: 'Podatek zapłacisz dopiero wtedy, gdy wartość sprzedawanej rzeczy przekroczy kwotę 3000 zł, co zdejmuje obowiązek podatkowy z większości drobnych transakcji.',
    targetAudience: 'Osoby prywatne, turyści, sprzedawcy okazjonalni',
    readTime: '3 min',
    docType: "",
    contentType: ""
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
    summary30s: 'Projekt zakłada natychmiastowe zatrzymanie prawa jazdy na 3 miesiące za najpoważniejsze wykroczenia popełniane na przejazdach kolejowych. Celem jest poprawa bezpieczeństwa.',
    beforeText: 'Za wjazd na przejazd kolejowy przy opuszczających się zaporach kierowcy groził mandat i punkty karne, ale zazwyczaj bez natychmiastowej utraty uprawnień.',
    afterText: 'Złamanie zakazu wjazdu na przejazd przy czerwonym świetle lub opadających rogatkach będzie skutkować obligatoryjnym, natychmiastowym zatrzymaniem prawa jazdy na 3 miesiące.',
    targetAudience: 'Kierowcy, piesi, uczestnicy ruchu drogowego',
    readTime: '2 min',
    docType: "",
    contentType: ""
  }
];