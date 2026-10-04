--
-- PostgreSQL database dump
--

\restrict cX8h3wwykYPHHLk7O7GAPumlzJYRZfeJmCHs8OcvtZoGlkvM8aCKctg9pbX5CDJ

-- Dumped from database version 17.11 (Debian 17.11-1.pgdg13+2)
-- Dumped by pg_dump version 17.11 (Debian 17.11-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bills (
    id integer NOT NULL,
    term integer NOT NULL,
    print_number character varying(16) NOT NULL,
    title text NOT NULL,
    document_type character varying(64),
    description text,
    eli character varying(64),
    isap_url text,
    summary text,
    summary_model character varying(64)
);


--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bills_id_seq OWNED BY public.bills.id;


--
-- Name: sittings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sittings (
    id integer NOT NULL,
    term integer NOT NULL,
    number integer NOT NULL,
    title text NOT NULL,
    dates date[] NOT NULL,
    agenda text,
    description text,
    votings_count integer NOT NULL,
    synced_at timestamp with time zone NOT NULL,
    votings_synced_at timestamp with time zone
);


--
-- Name: sittings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sittings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sittings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sittings_id_seq OWNED BY public.sittings.id;


--
-- Name: voting_club_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_club_results (
    id integer NOT NULL,
    voting_id integer NOT NULL,
    club character varying(32) NOT NULL,
    yes integer NOT NULL,
    no integer NOT NULL,
    abstain integer NOT NULL,
    absent integer NOT NULL
);


--
-- Name: voting_club_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_club_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_club_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_club_results_id_seq OWNED BY public.voting_club_results.id;


--
-- Name: votings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votings (
    id integer NOT NULL,
    sitting_id integer NOT NULL,
    bill_id integer,
    number integer NOT NULL,
    held_at timestamp without time zone NOT NULL,
    kind character varying(32) NOT NULL,
    title text NOT NULL,
    topic text,
    description text,
    is_final boolean NOT NULL,
    yes integer NOT NULL,
    no integer NOT NULL,
    abstain integer NOT NULL,
    not_participating integer NOT NULL,
    majority_votes integer NOT NULL
);


--
-- Name: votings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votings_id_seq OWNED BY public.votings.id;


--
-- Name: bills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bills ALTER COLUMN id SET DEFAULT nextval('public.bills_id_seq'::regclass);


--
-- Name: sittings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sittings ALTER COLUMN id SET DEFAULT nextval('public.sittings_id_seq'::regclass);


--
-- Name: voting_club_results id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_club_results ALTER COLUMN id SET DEFAULT nextval('public.voting_club_results_id_seq'::regclass);


--
-- Name: votings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votings ALTER COLUMN id SET DEFAULT nextval('public.votings_id_seq'::regclass);


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bills (id, term, print_number, title, document_type, description, eli, isap_url, summary, summary_model) FROM stdin;
1	10	174	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
2	10	171	Rządowy projekt ustawy o zmianie ustawy o Narodowym Centrum Badań i Rozwoju oraz ustawy - Prawo o szkolnictwie wyższym i nauce	projekt ustawy	projekt dotyczy przeniesienia uprawnień nadzorczych nad Centrum na Ministra Nauki oraz konieczności uzyskania zgody Ministra na powołanie przez NCBR m. in. spółek czy obejmowanie oraz nabywanie udziałów i akcji	DU/2024/227	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20240000227	\N	\N
3	10	157	Poselski projekt uchwały w 100. rocznicę wydania pierwszego numeru "Wiadomości Literackich"	projekt uchwały	\N	MP/2024/94	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20240000094	\N	\N
4	10	184	Przedstawiony przez Prezydium Sejmu wniosek w sprawie wyboru składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r.	wniosek	\N	MP/2024/89	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20240000089	\N	\N
5	10	2876	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej	projekt uchwały	\N	MP/2026/901	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000901	\N	\N
9	10	3045	Głosowanie proceduralne dotyczące druku 3045	\N	\N	\N	\N	\N	\N
10	10	3014	Głosowanie proceduralne dotyczące druku 3014	\N	\N	\N	\N	\N	\N
11	10	3023	Głosowanie proceduralne dotyczące druku 3023	\N	\N	\N	\N	\N	\N
12	10	3052	Głosowanie proceduralne dotyczące druku 3052	\N	\N	\N	\N	\N	\N
13	10	3005	Kandydat na stanowisko sędziego Trybunału Konstytucyjnego - Pan Artur Kotowski	lista kandydatów	\N	\N	\N	\N	\N
14	10	2710	Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 15 maja 2026 r. o rynku kryptoaktywów (druki nr 2710 i 2742)	\N	\N	\N	\N	\N	\N
15	10	3027	Wniosek Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi	wniosek	\N	MP/2026/906	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000906	\N	\N
203	10	2683	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmiany w składzie osobowym komisji sejmowej	wniosek	\N	\N	\N	\N	\N
206	10	2713	Komisyjny projekt uchwały w sprawie uczczenia 35. rocznicy podpisania Traktatu między Rzecząpospolitą Polską a Republiką Federalną Niemiec o dobrym sąsiedztwie i przyjaznej współpracy	projekt uchwały	\N	MP/2026/650	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000650	\N	\N
207	10	2624	Komisyjny projekt uchwały w sprawie uczczenia 80-lecia działalności Ludowych Zespołów Sportowych	projekt uchwały	\N	MP/2026/649	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000649	\N	\N
7	10	3015	Poselski projekt ustawy o utworzeniu Uniwersytetu Mazowieckiego w Płocku	projekt ustawy	projekt dotyczy utworzenia z dniem 1 października 2026 r. Uniwersytetu Mazowieckiego w Płocku w miejsce funkcjonującej obecnie Akademii Mazowieckiej w Płocku	\N	\N	Projekt przewiduje przekształcenie Akademii Mazowieckiej w Płocku w Uniwersytet Mazowiecki od października 2026 roku. Zmiana ta dotyczy społeczności akademickiej tej uczelni, w tym studentów i pracowników.	gemini-3.5-flash-lite
208	10	2417	Poselski projekt uchwały w sprawie upamiętnienia bohaterów wydarzeń Czerwca 1976 roku w Radomiu, Płocku i Ursusie	projekt uchwały	\N	MP/2026/648	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000648	\N	\N
23	10	2990	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	\N	\N	\N	\N	\N	\N
24	10	2994	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014)	\N	\N	\N	\N	\N	\N
25	10	2991	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2991 i 3023)	\N	\N	\N	\N	\N	\N
26	10	2992	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2992 i 3052)	\N	\N	\N	\N	\N	\N
27	10	2993	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2993 i 3016)	\N	\N	\N	\N	\N	\N
28	10	3060	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmiany w składzie osobowym Komisji do Spraw Służb Specjalnych	wniosek	\N	\N	\N	\N	\N
29	10	3061	Przedstawiony przez Prezydium Sejmu wniosek w sprawie wyboru nowego składu osobowego Komisji do Spraw Unii Europejskiej	wniosek	\N	\N	\N	\N	\N
30	10	3071	Poselski projekt uchwały o zmianie Regulaminu Sejmu Rzeczypospolitej Polskiej	projekt uchwały	projekt dotyczy zwiększenia liczby zastępców przewodniczącego Komisji do Spraw Służb Specjalnych z dwóch do trzech	MP/2026/925	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000925	\N	\N
209	10	2418	Poselski projekt uchwały w sprawie upamiętnienia bohaterów 70. rocznicy Poznańskiego Czerwca 1956 roku	projekt uchwały	\N	MP/2026/651	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000651	\N	\N
33	10	3109	Głosowanie proceduralne dotyczące druku nr 3109	\N	\N	\N	\N	\N	\N
34	10	3107	Głosowanie proceduralne dotyczące druku nr 3107	\N	\N	\N	\N	\N	\N
35	10	3118	Głosowanie proceduralne dotyczące druku nr 3118	\N	\N	\N	\N	\N	\N
36	10	2863	Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 29 maja 2026 r. o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2863 i 3110)	\N	\N	\N	\N	\N	\N
37	10	2864	Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 29 maja 2026 r. - Przepisy wprowadzające ustawę o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2864 i 3111)	\N	\N	\N	\N	\N	\N
38	10	3105	Sprawozdanie Komisji w sprawie wniosku Europejskiego Prokuratora Generalnego z dnia 29 lipca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla (druk nr 3105)	\N	\N	\N	\N	\N	\N
40	10	2889	Poselski projekt uchwały w sprawie upamiętnienia 50. rocznicy powstania Komitetu Obrony Robotników	projekt uchwały	\N	MP/2026/960	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000960	\N	\N
41	10	3106	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
42	10	2875	Kandydat na stanowisko Wicemarszałka Sejmu RP - poseł Marcin Ociepa	lista kandydatów	\N	\N	\N	\N	\N
43	10	3078	Kandydat na stanowisko Przewodniczącego Komisji Rozwoju i Bezpieczeństwa Sztucznej Inteligencji - Pani Pamela Krzypkowska	lista kandydatów	\N	MP/2026/945	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000945	\N	\N
44	10	3044	Sprawozdanie Komisji w sprawie wniosku prokuratora Prokuratury Okręgowej w Przemyślu z dnia 17 czerwca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana (druk nr 3044)	\N	\N	\N	\N	\N	\N
46	10	2725	Sprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2025 roku. Informacja o podstawowych problemach radiofonii i telewizji w 2025 roku	informacja innych organów	\N	\N	\N	\N	\N
47	10	2726	Informacja o działalności Rady Mediów Narodowych w 2025 roku	informacja innych organów	\N	\N	\N	\N	\N
22	10	2866	Rządowy projekt ustawy o zmianie ustawy - Prawo wodne	projekt ustawy	projekt dotyczy dostosowania polskiego prawa do przepisów Unii Europejskiej dotyczących jakości wód w kąpieliskach	\N	\N	Projekt zmienia polskie przepisy dotyczące jakości wód w kąpieliskach, aby dostosować je do unijnych wymogów. Zmiana dotyczy osób korzystających z kąpielisk oraz zarządców terenów nadwodnych.	gemini-3.5-flash-lite
216	10	2657	Sprawozdanie Komisji w sprawie wniosku oskarżyciela prywatnego Dariusza Korneluka, reprezentowanego przez adwokata Janusza Kaczmarka, z dnia 30 marca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry (druk nr 2657)	\N	\N	\N	\N	\N	\N
200	10	2684	Rządowy projekt ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r.	projekt ustawy	projekt dotyczy wprowadzenia czasowego podatku od nadzwyczajnych zysków osiąganych przez przedsiębiorstwa zajmujące się produkcją i handlem paliwami sprowadzanymi z zagranicy. Nowe przepisy mają pomóc sfinansować działania chroniące przed skutkami gwałtownego wzrostu cen paliw wywołanego kryzysem na światowych rynkach energii.	\N	\N	Wprowadzony zostanie czasowy podatek od nadzwyczajnych zysków ze sprzedaży paliw sprowadzanych z zagranicy. Przepisy te dotyczą firm zajmujących się produkcją i handlem paliwami ciekłymi.	gemini-3.5-flash-lite
201	10	2549	Rządowy projekt ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków  ich funkcjonowania pod polską banderą	projekt ustawy	projekt dotyczy przywrócenia możliwości korzystania z podatku tonażowego przez przedsiębiorców żeglugowych, zwolnienia dochodów marynarzy z podatku PIT niezależnie od obywatelstwa marynarza oraz liczby dni przepracowanych w roku, rozwiązania problemu zaopatrywania statków w produkty lecznicze i wyroby medyczne, które są obowiązkowym wyposażeniem apteczek okrętowych oraz wdrożenia do polskiego prawa poprawki (z 2022 r.) do Konwencji o pracy na morzu (z 2006 r.) oraz doprecyzowania niektórych przepisów ustawy (z 15 sierpnia 2015 r.) o pracy na morzu. Projekt realizuje priorytet polityki Rady Ministrów.	DU/2026/1079	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001079	Projekt ułatwia firmom żeglugowym korzystanie z podatku tonażowego, zwalnia dochody marynarzy z podatku PIT oraz ułatwia zaopatrywanie statków w leki i wprowadza unijne przepisy dotyczące pracy na morzu. Zmiany te dotyczą przedsiębiorców żeglugowych oraz marynarzy pracujących na statkach.	gemini-3.5-flash-lite
202	10	2498	Rządowy projekt ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym	projekt ustawy	projekt dotyczy wprowadzenia zmian w przepisach dotyczących zastawu rejestrowego, czyli zabezpieczenia długu lub kredytu na majątku dłużnika (np. samochodzie), ujawnianego w specjalnym rejestrze. Nowe przepisy odciążą sądy rejestrowe, które musiałyby wydawać i doręczać postanowienia o wykreśleniu zastawów. Projekt porządkuje także  przepisy dotyczące prowadzenia rejestru zastawów i przekazywania informacji o zastawach na pojazdach do centralnej ewidencji pojazdów	DU/2026/1073	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001073	Projekt zmienia zasady wykreślania zastawów rejestrowych z rejestrów oraz aktualizuje sposób przekazywania informacji o zastawach pojazdów do centralnej ewidencji. Zmiany te dotyczą sądów rejestrowych oraz osób i instytucji powiązanych z zastawami rejestrowymi i pojazdami.	gemini-3.5-flash-lite
204	10	2643	Rządowy projekt ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy wprowadzenia elektronicznej karty diagnostyki i leczenia onkologicznego (karta DiLO); uproszczenia obowiązków administracyjnych szpitali należących do Krajowej Sieci Onkologicznej; doprecyzowania roli koordynatora opieki onkologicznej, wprowadzenia definicji ciągłości opieki onkologicznej; skrócenia i uproszczenia procesu uzyskiwania akredytacji przez placówki medyczne. NFZ będzie odpowiadał za monitorowanie jakości opieki onkologicznej.	DU/2026/1007	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001007	Wprowadzono między innymi elektroniczną kartę DiLO, uproszczono biurokrację w szpitalach oraz doprecyzowano zasady opieki nad pacjentami. Zmiany te dotyczą pacjentów onkologicznych, szpitali oraz placówek medycznych.	gemini-3.5-flash-lite
205	10	2685	Rządowy projekt ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o działalności leczniczej	projekt ustawy	projekt dotyczy określenia niezbędnych uprawnienia dla ministra właściwego do spraw zdrowia, Narodowego Funduszu Zdrowia (NFZ) oraz Agencji do pozyskiwania i przetwarzania szczegółowych danych o wynagrodzeniach powiązanych z konkretnym numerem PESEL lub numerem prawa wykonywania zawodu	DU/2026/972	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000972	Projekt daje ministerstwu zdrowia, NFZ i odpowiedniej agencji uprawnienia do zbierania szczegółowych danych o zarobkach powiązanych z numerem PESEL lub numerem prawa wykonywania zawodu. Zmiana dotyczy osób pracujących w ochronie zdrowia oraz instytucji zarządzających finansami i polityką zdrowotną w kraju.	gemini-3.5-flash-lite
59	10	2556	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie ustanowienia roku 2027 Rokiem Konstytucji Rzeczypospolitej Polskiej z dnia 2 kwietnia 1997 r. w 30. rocznicę jej uchwalenia	projekt uchwały	\N	MP/2026/954	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000954	\N	\N
60	10	2510	Poselski projekt uchwały w sprawie ustanowienia roku 2027 Rokiem Tadeusza Mazowieckiego	projekt uchwały	\N	MP/2026/941	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000941	\N	\N
61	10	2419	Poselski projekt uchwały w sprawie ustanowienia roku 2027 Rokiem św. Andrzeja Boboli	projekt uchwały	\N	MP/2026/944	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000944	\N	\N
62	10	2506	Poselski projekt uchwały w sprawie ustanowienia roku 2027 Rokiem Objawień Matki Bożej Gietrzwałdzkiej	projekt uchwały	\N	\N	\N	\N	\N
63	10	2507	Poselski projekt uchwały w sprawie ustanowienia roku 2027 Rokiem Jerzego Żurawlewa	projekt uchwały	\N	MP/2026/942	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000942	\N	\N
64	10	2508	Poselski projekt uchwały w sprawie ustanowienia roku 2027 Rokiem Kazimiery Bujwidowej	projekt uchwały	\N	MP/2026/963	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000963	\N	\N
65	10	2509	Poselski projekt uchwały w sprawie ustanowienia roku 2027 Rokiem Nauki	projekt uchwały	\N	\N	\N	\N	\N
124	10	2522	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o postępowaniu egzekucyjnym w administracji (druki nr 2522 i 2539)	\N	\N	\N	\N	\N	\N
70	10	2407	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
71	10	2430	Głosowanie proceduralne dotyczące druku 2430	\N	\N	\N	\N	\N	\N
72	10	2435	Głosowanie proceduralne dotyczące druku 2435	\N	\N	\N	\N	\N	\N
210	10	2289	Rządowy projekt ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego	projekt ustawy	projekt dotyczy skuteczniejszej ochrony pracowników przed mobbingiem, dyskryminacją i innymi formami przemocy w miejscu pracy. Nowe przepisy wprowadzają prostszą i jaśniejszą definicję mobbingu, ujednolicają formy nękania, wprowadzają tzw. "model racjonalnej ofiary", zgodnie z którym ocena zachowania będzie dokonywana nie tylko z perspektywy subiektywnych odczuć pracownika, lecz także przy uwzględnieniu obiektywnych okoliczności sprawy. Podwyższeniu ulegnie minimalne zadośćuczynienie za mobbing i wprowadzona zostanie lepsza ochrona przed działaniami odwetowymi.	DU/2026/1046	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001046	Projekt wprowadza jaśniejszą definicję mobbingu, podwyższa minimalne zadośćuczynienie i zapewnia lepszą ochronę przed działaniami odwetowymi w miejscu pracy. Zmiany te dotyczą wszystkich pracowników oraz pracodawców.	gemini-3.5-flash-lite
211	10	2620	Rządowy projekt ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego	projekt ustawy	projekt dotyczy: zmian sposobu wnoszenia opłat za zezwolenia, zgody oraz wpisy do rejestrów prowadzonych przez Komisję Nadzoru Finansowego	DU/2026/1074	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001074	Zmienia się sposób wnoszenia opłat za zezwolenia, zgody oraz wpisy do rejestrów prowadzonych przez Komisję Nadzoru Finansowego. Przepisy dotyczą osób i firm załatwiających sprawy urzędowe związane z tymi rejestrami.	gemini-3.5-flash-lite
77	10	2267	Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 18 grudnia 2025 r. o rynku kryptoaktywów (druki nr 2267 i 2436)	\N	\N	\N	\N	\N	\N
212	10	2597	Rządowy projekt ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie oraz ustawy o grach hazardowych	projekt ustawy	projekt dotyczy ułatwienia organizacjom pozarządowym realizacji zadań publicznych i ograniczenie formalności. Nowe przepisy przewidują także nową formę wyróżniania osób zasłużonych dla rozwoju społeczeństwa obywatelskiego oraz ustanowienie 24 kwietnia Dniem Społeczeństwa Obywatelskiego.	DU/2026/1040	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001040	Projekt ułatwia organizacjom pozarządowym realizację zadań publicznych, zmniejsza biurokrację, wprowadza nową formę wyróżniania osób zasłużonych oraz ustanawia 24 kwietnia Dniem Społeczeństwa Obywatelskiego. Zmiany te dotyczą organizacji pozarządowych, wolontariuszy oraz osób zasłużonych dla rozwoju społeczeństwa obywatelskiego.	gemini-3.5-flash-lite
74	10	1963	Komisyjny projekt ustawy o zmianie ustawy o radcach prawnych	projekt ustawy	projekt dotyczy uporządkowania zasad przetwarzania danych osobowych przez radców prawnych; umożliwienia Krajowej Izbie Radców Prawnych zawierania na rzecz radców prawnych grupowego ubezpieczenia odpowiedzialności cywilnej; wprowadzenia zmian w zakresie wykonalności prawomocnych i kończących postępowanie orzeczeń Wyższego Sądu Dyscyplinarnego, zaostrzenie zasad odpowiedzialności za bezprawne używanie tytułu zawodowego "radca prawny"	DU/2026/731	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000731	Projekt ma na celu uporządkowanie zasad przetwarzania danych osobowych, umożliwienie zawierania grupowego ubezpieczenia OC, zmianę zasad wykonywania orzeczeń sądu dyscyplinarnego oraz zaostrzenie odpowiedzialności za bezprawne używanie tytułu radcy prawnego. Nowe przepisy dotyczą radców prawnych, Krajowej Izby Radców Prawnych oraz osób, które nieuprawnienie posługują się tym tytułem zawodowym.	gemini-3.6-flash
75	10	2317	Rządowy projekt ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy ograniczenia emisji gazów cieplarnianych w transporcie morskim oraz zwiększenia wykorzystania paliw odnawialnych i niskoemisyjnych	\N	\N	Projekt zakłada zmniejszenie emisji gazów cieplarnianych w transporcie morskim oraz zwiększenie wykorzystania paliw odnawialnych i niskoemisyjnych. Zmiany te dotyczą sektora transportu morskiego oraz podmiotów korzystających ze statków.	gemini-3.6-flash
78	10	2293	Rządowy projekt ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów	projekt ustawy	projekt dotyczy wprowadzenia powszechnego obowiązku znakowania i rejestracji psów i kotów w państwowym rejestrze - Krajowym Rejestrze Oznakowania Psów i Kotów	DU/2026/755	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000755	Wprowadzony zostanie obowiązek oznakowania oraz rejestracji psów i kotów w nowym, państwowym systemie. Przepisy te dotyczą wszystkich właścicieli psów i kotów w kraju.	gemini-3.5-flash-lite
79	10	2361	Rządowy projekt ustawy o zmianie ustawy o języku polskim oraz ustawy o Narodowej Agencji Wymiany Akademickiej	projekt ustawy	projekt dotyczy usprawnienia organizacji egzaminów państwowych z języka polskiego jako obcego, zwiększenia ich dostępności oraz poprawy nadzoru nad systemem certyfikacji; zmiany organizacji egzaminów, zasad działania komisji egzaminacyjnych oraz sposobu wydawania certyfikatów	DU/2026/676	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000676	Projekt zmienia zasady organizacji państwowych egzaminów z języka polskiego jako obcego, usprawniając ich dostępność oraz sposób wydawania certyfikatów i nadzoru. Zmiany te dotyczą osób zdających te egzaminy oraz instytucji zajmujących się ich organizacją i komisjami egzaminacyjnymi.	gemini-3.5-flash-lite
82	10	2276	Rządowy projekt ustawy o ratyfikacji Umowy między Rządem Rzeczypospolitej Polskiej a Gabinetem Ministrów Ukrainy o współpracy w zwalczaniu przestępczości, podpisanej we Lwowie dnia 11 grudnia 2025 r.	projekt ustawy	projekt dotyczy stworzenia lepszych ram prawnych dla wykrywania, zapobiegania oraz zwalczania przestępczości	DU/2026/682	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000682	Polska i Ukraina podpisaly umowe, ktora tworzy nowe ramy prawne dla lepszego zapobiegania, wykrywania i zwalczania przestczepczosci. Projekt dotyczy organow i sluzb odpowiedzialnych za porzadek publiczny w obu panstwach.	gemini-3.5-flash-lite
69	10	2810	Rządowy projekt ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Japonią o zabezpieczeniu społecznym, podpisanej w Tokio dnia 15 kwietnia 2026 r.	projekt ustawy	projekt dotyczy m.in. możliwości sumowania polskich oraz japońskich okresów ubezpieczenia, w celu przyznania prawa do świadczeń oraz możliwości dokonywania wypłaty\npolskich świadczeń osobom uprawnionym mającym miejsce zamieszkania na terytorium Japonii	\N	\N	Projekt wprowadza możliwość sumowania okresów ubezpieczenia w Polsce i w Japonii oraz umożliwia wypłatę polskich świadczeń osobom mieszkającym w Japonii. Zmiana dotyczy osób, które pracowały lub pracują w obu tych krajach.	gemini-3.5-flash-lite
88	10	2400	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 2400 i 2405)	\N	\N	\N	\N	\N	\N
89	10	2403	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429)	\N	\N	\N	\N	\N	\N
90	10	2402	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Funduszu Ochrony Rolnictwa (druki nr 2402 i 2428)	\N	\N	\N	\N	\N	\N
91	10	2401	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	\N	\N	\N	\N	\N	\N
92	10	2439	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
73	10	2440	Poselski projekt ustawy o zmianie ustawy o systemie instytucji rozwoju	projekt ustawy	\N	DU/2026/633	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000633	Projekt zakłada wprowadzenie zmian w przepisach dotyczących systemu instytucji rozwoju. Nowe regulacje dotyczą instytucji tworzących ten system oraz podmiotów objętych ich działalnością.	gemini-3.6-flash
76	10	2319	Rządowy projekt ustawy o zmianie ustawy o postępowaniu egzekucyjnym w administracji	projekt ustawy	projekt dotyczy uruchomienia portalu eLicytacje, prowadzonego przez Krajową Administrację Skarbową. Będzie to elektroniczny systemem sprzedaży m.in. ruchomości (np. samochodów) i nieruchomości należących do dłużników podatkowych. Portal pozwoli na przeprowadzanie licytacji i sprzedaży z wolnej ręki online, zwiększając dostęp do informacji i zapewniając większą przejrzystość procesów egzekucyjnych.	DU/2026/739	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000739	Projekt zakłada uruchomienie portalu eLicytacje, który umożliwi prowadzenie internetowych licytacji oraz sprzedaży majątku dłużników podatkowych, takiego jak samochody czy nieruchomości. Nowe zasady dotyczą dłużników podatkowych oraz osób zainteresowanych udziałem w elektronicznych licytacjach.	gemini-3.6-flash
81	10	2272	Rządowy projekt ustawy o zmianie ustawy o systemie monitorowania drogowego  i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych  innych ustaw	projekt ustawy	projekt dotyczy uszczelnienia systemu podatkowego (dot. produkcji i sprzedaży betonu towarowego); rozszerzenia systemu SENT, obsługiwanego przez Krajową Administrację Skarbową	\N	\N	Projekt przewiduje uszczelnienie systemu podatkowego poprzez rozszerzenie systemu SENT obsługiwanego przez Krajową Administrację Skarbową. Zmiany dotyczą podmiotów zajmujących się produkcją oraz sprzedażą betonu towarowego.	gemini-3.6-flash
84	10	2371	Rządowy projekt ustawy o zmianie ustawy o wspieraniu rozwoju obszarów wiejskich z udziałem środków Europejskiego Funduszu Rolnego na rzecz Rozwoju Obszarów Wiejskich w ramach Programu Rozwoju Obszarów Wiejskich na lata 2014-2020 oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy wprowadzenia dodatkowej formy wsparcia, obok poręczeń i gwarancji, w postaci dopłat do odsetek w celu obniżenia kosztów obsługi kredytów. Rozwiązanie to bazuje na doświadczeniach Funduszu Gwarancji Rolnych, finansowanego z PROW.	DU/2026/680	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000680	Projekt wprowadza nową formę pomocy w postaci dopłat do odsetek, co pozwoli zmniejszyć koszty obsługi kredytów. Zmiany dotyczą osób i podmiotów biorących kredyty w ramach programów wspierania rozwoju obszarów wiejskich.	gemini-3.6-flash
85	10	2388	Rządowy projekt ustawy o zmianie ustawy o finansach publicznych oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy m.in. rozszerzenia możliwości uzyskiwania kwalifikacji do prowadzenia audytu wewnętrznego w sektorze publicznym poprzez wprowadzenie dodatkowej ścieżki w postaci egzaminu państwowego na audytora wewnętrznego	DU/2026/635	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000635	Projekt wprowadza nową możliwość uzyskania kwalifikacji do prowadzenia audytu wewnętrznego w sektorze publicznym poprzez egzamin państwowy. Zmiana ta dotyczy osób ubiegających się o uprawnienia audytora wewnętrznego oraz instytucji sektora publicznego.	gemini-3.6-flash
87	10	1765	Poselski projekt ustawy o zmianie ustawy o ochronie zwierząt	projekt ustawy	projekt dotyczy skuteczniejszego i sprawniejszego prowadzenia działań niwelujących niebezpieczne dla zdrowia i życia sytuacje, powodowane zachowaniem niedźwiedzia brunatnego i żubra	DU/2026/737	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000737	Projekt ma umożliwić skuteczniejsze i sprawniejsze reagowanie na sytuacje niebezpieczne dla zdrowia i życia, które są powodowane przez niedźwiedzie brunatne i żubry. Zmiany dotyczą osób narażonych na takie zagrożenia oraz podmiotów odpowiedzialnych za prowadzenie działań niwelujących to niebezpieczeństwo.	gemini-3.6-flash
80	10	2290	Rządowy projekt ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy zmian w przepisach publicznego systemu internetowego, który służy do zawierania i obsługi m.in. umów o pracę, umów zlecenia czy umów związanych np. z zatrudnieniem niani; rozszerzenia dostępu do systemu, zwiększenia liczby rodzajów umów, które można zawierać online, a także umożliwienia przeniesienia do systemu umów podpisanych wcześniej w formie papierowej. Nowe przepisy realizują działania deregulacyjne rządu.	DU/2026/734	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000734	Projekt rozszerza możliwości państwowego systemu internetowego do obsługi umów, umożliwiając zawieranie większej liczby ich rodzajów online oraz przenoszenie umów podpisanych wcześniej na papierze. Regulacje dotyczą osób zatrudnionych oraz pracodawców i zleceniodawców, w tym m.in. osób pracujących na podstawie umowy o pracę, umowy zlecenia czy zatrudniających nianie.	gemini-3.6-flash
83	10	2353	Poselski projekt ustawy o najmie krótkoterminowym	projekt ustawy	projekt dotyczy wprowadzenia instytucji najmu krótkoterminowego jako odrębnej usługi prowadzonej na określonych w ustawie warunkach przez osobę fizyczną, osobę prawną lub jednostkę organizacyjną nieposiadającą osobowości prawnej, niezależnie od tytułu prawnego do dysponowania lokalem. Usługa najmu krótkoterminowego umeblowanego domu jednorodzinnego, lokalu mieszkalnego lub ich części dotyczyć będzie świadczenia na podstawie jednej umowy na okres nie dłuższy niż 30 dni i  wykonywana będzie za pośrednictwem internetowej platformy handlowej	\N	\N	Projekt wprowadza najem krótkoterminowy umeblowanych mieszkań lub domów na okres do 30 dni przez internet jako osobną usługę. Zmiany dotyczą osób prywatnych, firm i organizacji wynajmujących te lokale oraz platform internetowych pośredniczących w najmie.	gemini-3.6-flash
125	10	2520	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	\N	\N	\N	\N	\N	\N
126	10	2524	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2524 i 2574)	\N	\N	\N	\N	\N	\N
86	10	2404	Rządowy projekt ustawy o zmianie ustawy o utworzeniu Uniwersytetu Medycznego w Łodzi	projekt ustawy	projekt dotyczy nowelizacji art. 7 ustawy z dnia 27 lipca 2002 r. o utworzeniu Uniwersytetu Medycznego w Łodzi. Zmiana ma charakter dostosowawczy i porządkujący, zmierzający do ujednolicenia terminologii oraz mechanizmów finansowania działalności dydaktycznej uczelni z rozwiązaniami systemowymi wprowadzonymi ustawą z dnia 20 lipca 2018 r. - Prawo o szkolnictwie wyższym i nauce.	DU/2026/636	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000636	Projekt dostosowuje nazewnictwo oraz zasady finansowania działalności dydaktycznej Uniwersytetu Medycznego w Łodzi do ogólnych przepisów prawa o szkolnictwie wyższym i nauce. Zmiana ta dotyczy Uniwersytetu Medycznego w Łodzi.	gemini-3.6-flash
20	10	2271	Rządowy projekt ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka	projekt ustawy	projekt dotyczy ustanowienia zasad i trybu wykonywania orzeczeń Europejskiego Trybunału Praw Człowieka, wydanych w sprawach ze skarg indywidualnych, w których stroną jest Rzeczpospolita Polska, w tym sposobu koordynacji współdziałania podmiotów publicznych w celu wykonania orzeczeń Trybunału.	\N	\N	Projekt wprowadza jasne zasady i tryb wykonywania wyroków Europejskiego Trybunału Praw Człowieka oraz ustala sposób współpracy urzędów przy ich realizacji. Regulacja ta dotyczy instytucji publicznych i organów państwowych biorących udział w wykonywaniu tych orzeczeń.	gemini-3.5-flash-lite
213	10	1941	Poselski projekt ustawy o zmianie ustawy - Prawo wodne	projekt ustawy	projekt dotyczy wprowadzenia czasowego mechanizmu zachęcającego do legalizacji istniejących urządzeń wodnych poprzez zwolnienie z opłaty legalizacyjnej oraz warunkowego zwolnienie z przewidzianych kar pieniężnych, pod warunkiem złożenia wniosku o legalizację do dnia 30 września 2027 r.	DU/2026/1033	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001033	Wprowadzono czasowy mechanizm pozwalający na legalizację istniejących urządzeń wodnych bez ponoszenia opłaty legalizacyjnej oraz z możliwością zwolnienia z kar pieniężnych przy złożeniu wniosku do końca września 2027 roku. Zmiana ta dotyczy osób i podmiotów posiadających takie urządzenia, które wymagają uregulowania ich statusu prawnego.	gemini-3.5-flash-lite
214	10	2468	Poselski projekt ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym	projekt ustawy	projekt dotyczy zapewnienia jednolitego i spójnego sposobu udostępniania danych przez deweloperów w portalu dane.gov.pl prowadzonym przez Ministra Cyfryzacji	DU/2026/1077	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001077	Projekt wprowadza jeden, spójny sposób udostępniania przez deweloperów danych w publicznym portalu internetowym. Zmiana dotyczy firm deweloperskich oraz osób kupujących nowe mieszkania lub domy jednorodzinne.	gemini-3.5-flash-lite
215	10	2644	Rządowy projekt ustawy o zabezpieczeniu socjalnym osób wykonujących zawód artystyczny	projekt ustawy	projekt dotyczy włączenie artystów zawodowych do systemu zabezpieczenia społecznego; stworzenia możliwości aplikowania o przyznanie im uprawnienia do otrzymania dopłaty celem uzupełnienia finansowania ich składek na ubezpieczenia społeczne i zdrowotne do poziomu składek wynikających z minimalnego wynagrodzenia za pracę. Dopłata ma obejmować również składki na Fundusz Pracy oraz Fundusz Emerytur Pomostowych. Artyści osiągający tym samym najniższe dochody będą uprawnieni do wsparcia finansowego w opłaceniu składek w okresach, w których ich własne dochody nie będą pozwalać na pokrycie składek.	\N	\N	Projekt wprowadza dopłaty do składek na ubezpieczenia społeczne i zdrowotne dla twórców o najniższych dochodach. Zmiana dotyczy osób wykonujących zawód artystyczny.	gemini-3.5-flash-lite
97	10	2535	Głosowanie proceduralne dotyczące druku nr 2535	\N	\N	\N	\N	\N	\N
98	10	2564	Głosowanie proceduralne dotyczące druku nr 2564	\N	\N	\N	\N	\N	\N
99	10	2501	Wniosek Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi	wniosek	\N	MP/2026/505	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000505	\N	\N
100	10	2537	Głosowanie proceduralne dotyczące druku nr 2537	\N	\N	\N	\N	\N	\N
101	10	2571	Głosowanie proceduralne dotyczące druku nr 2571	\N	\N	\N	\N	\N	\N
102	10	2574	Głosowanie proceduralne dotyczące druku nr 2574	\N	\N	\N	\N	\N	\N
103	10	2543	Głosowanie proceduralne dotyczące druku nr 2543	\N	\N	\N	\N	\N	\N
104	10	2215	Poselski projekt uchwały w sprawie upamiętnienia 120. rocznicy urodzin profesora Tadeusza Wacława Korzybskiego	projekt uchwały	\N	MP/2026/547	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000547	\N	\N
105	10	2275	Poselski projekt uchwały w sprawie upamiętnienia 100. rocznicy urodzin Tadeusza Konwickiego	projekt uchwały	\N	MP/2026/548	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000548	\N	\N
106	10	2493	Poselski projekt uchwały w sprawie upamiętnienia 125. rocznicy strajku dzieci wrzesińskich	projekt uchwały	\N	MP/2026/546	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000546	\N	\N
127	10	2523	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2523 i 2543)	\N	\N	\N	\N	\N	\N
117	10	2355	Rządowy projekt ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy wzmocnienia systemu zarządzania kryzysowego poprzez wprowadzenie rozwiązań zapewniających efektywne zarządzanie ryzykiem, z uwzględnieniem postanowień Decyzji Parlamentu Europejskiego i Rady nr 1313/2013/EU; wzmocnienia ochrony infrastruktury krytycznej, w szczególności niezbędnej do świadczenia tzw. usług kluczowych przez podmioty krytyczne; wdrożenia rozwiązań umożliwiających wzmocnienie ochrony najważniejszych dla państwa obszarów, obiektów i urządzeń, w szczególności infrastruktury morskiej	DU/2026/815	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000815	\N	\N
123	10	2525	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537)	\N	\N	\N	\N	\N	\N
128	10	2521	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 2521 i 2532)	\N	\N	\N	\N	\N	\N
129	10	2526	Wykaz sędziów - kandydatów na członków Krajowej Rady Sądownictwa wskazanych przez kluby poselskie	lista kandydatów	\N	MP/2026/513	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000513	\N	\N
130	10	2575	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
93	10	2460	Rządowy projekt ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia	projekt ustawy	projekt dotyczy rozbudowania systemu e-zdrowia o System e-Konsylium, System Domowej Opieki Medycznej, Hurtowni Danych e Zdrowia oraz możliwości samodzielnego wprowadzania danych dotyczących zdrowia do systemu informacji w ochronie zdrowia, w tym przekazywania danych z elektronicznych urządzeń wielofunkcyjnych służących monitorowaniu parametrów zdrowotnych, aktywności fizycznej czy też stylu życia; wyeliminowania konieczności odbywania osobistej wizyty w podmiotach udzielających świadczeń zdrowotnych. Projekt realizuje priorytet polityki Rady Ministrów.	DU/2026/791	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000791	Ustawa wprowadza nowe systemy cyfrowe w ochronie zdrowia oraz pozwala na przesyłanie danych z urządzeń monitorujących i korzystanie z usług bez konieczności wizyty osobistej. Zmiany te dotyczą pacjentów oraz placówek medycznych korzystających z rozwiązań e-zdrowia.	gemini-3.5-flash-lite
94	10	2363	Poselski projekt ustawy o rynku kryptoaktywów	projekt ustawy	projekt dotyczy wprowadzenia rozwiązań w obszarze sektora rynku kryptoaktywów, mających na celu zapewnienie stosowania rozporządzenia PE i Rady (UE) 2023/1114, w szczególności w zakresie skutecznego nadzoru i ochrony inwestorów.	\N	\N	Projekt wprowadza nowe przepisy mające na celu nadzór nad rynkiem kryptoaktywów oraz lepszą ochronę inwestorów. Zmiany te dotkną osoby i podmioty działające na rynku kryptowalut.	gemini-3.5-flash-lite
95	10	2528	Przedstawiony przez Prezydenta Rzeczypospolitej Polskiej projekt ustawy o rynku kryptoaktywów	projekt ustawy	projekt dotyczy szczegółowych zasad prowadzenia działalności w zakresie kryptoaktywów, zasad odpowiedzialności cywilnej w związku z dokumentem informacyjnym dotyczącym kryptoaktywa oraz zmienionym dokumentem informacyjnym dotyczących kryptoaktywa, organizacji i zasad wykonywania nadzoru nad tym rynkiem	\N	\N	Projekt wprowadza nowe zasady prowadzenia działalności i nadzoru nad rynkiem kryptoaktywów oraz określa zasady odpowiedzialności cywilnej za dokumenty informacyjne. Przepisy te dotyczą osób i firm działających na rynku kryptoaktywów.	gemini-3.5-flash-lite
96	10	2529	Rządowy projekt ustawy o rynku kryptoaktywów	projekt ustawy	\N	\N	\N	Projekt wprowadza nowe przepisy i zasady dotyczące funkcjonowania rynku kryptoaktywów w Polsce. Zmiany te dotyczą osób oraz firm działających w branży kryptowalut i kryptoaktywów.	gemini-3.5-flash-lite
107	10	2530	Poselski projekt ustawy o kryptoaktywach	projekt ustawy	projekt dotyczy zapewnienia stosowania na terytorium RP rozporządzenia PE i Rady (UE) 2023/1114 z dnia 31 maja 2023 r. w sprawie rynków kryptoaktywów oraz zmiany rozporządzeń (UE) nr 1093/2010 i (UE) nr 1095/2010 oraz dyrektyw 2013/36/UE i (UE) 2019/1937 i ustanowienia krajowych rozwiązań organizacyjnych i proceduralnych, w szczególności w zakresie wskazania właściwego organu, trybów prowadzenia postępowań oraz zasad finansowania kosztów nadzoru w granicach dopuszczonych prawem	\N	\N	Projekt wprowadza krajowe zasady i wyznacza instytucje odpowiedzialne za nadzór nad rynkiem walut cyfrowych zgodnie z unijnymi przepisami. Zmiana dotyczy osób i firm działających w branży kryptoaktywów.	gemini-3.5-flash-lite
108	10	2457	Rządowy projekt ustawy o zmianie ustawy o podatku akcyzowym	projekt ustawy	projekt dotyczy obciążenia akcyzą e-papierosów w takiej samej wysokości, w jakiej obciążone są e-papierosy z grzałką elektryczną	\N	\N	Projekt wprowadza taką samą stawkę podatku akcyzowego dla wszystkich rodzajów e-papierosów. Zmiana dotyczy osób korzystających z e-papierosów oraz ich producentów i sprzedawców.	gemini-3.5-flash-lite
109	10	2489	Rządowy projekt ustawy o zmianie ustawy o podatku od spadków i darowizn	projekt ustawy	projekt dotyczy wydłużenia o rok zwolnienia od podatku od spadków i darowizn dla środków przeznaczonych na usuwanie skutków powodzi, jaka miała miejsce we wrześniu 2024 r.	DU/2026/775	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000775	Wydłuża się o rok czas na skorzystanie ze zwolnienia z podatku od spadków i darowizn dla pieniędzy przeznaczonych na usuwanie skutków wrześniowej powodzi z 2024 roku. Zmiana ta dotyczy osób, które otrzymują lub przekazują środki na ten konkretny cel.	gemini-3.5-flash-lite
110	10	2287	Rządowy projekt ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy m.in.: wprowadzenia uproszczeń dotyczących schematów podatkowych (MDR), czyli określonych działań podatkowych, które trzeba zgłaszać do urzędu; ułatwiona zostaje płatność podatków np.: każdy będzie mógł zapłacić podatek za podatnika - do 5 tys. zł.; zmniejszą się formalności podatkowe: nowe przepisy zakładają m.in., że jeśli nadpłata podatku wynika z korekty deklaracji, urząd sam ją rozliczy. Oznacza to, że wyjaśnienie od podatnika będzie wymagane tylko wtedy, gdy nadpłata przekroczy 10 tys. zł., ponadto, urząd skarbowy będzie mógł skorygować drobne błędy w deklaracji podatkowej do 10 tys. zł bez zbędnej korespondencji z podatnikiem; ułatwiony zostaje zwrot opłaty skarbowej; Wprowadzone zostają jasne zasady oprocentowania zwrotu opłaty skarbowej, co poprawi ochronę podatnika; wprowadzony zostaje szerszy dostęp do akt podatkowych dla Rzecznika Praw Obywatelskich oraz Rzecznika Małych i Średnich Przedsiębiorstw; usprawnione zostają przepisy w Kodeksie karnym skarbowym	DU/2026/846	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000846	Projekt wprowadza uproszczenia w rozliczeniach z urzędem skarbowym, takie jak łatwiejsze płacenie podatków za inne osoby czy automatyczne rozliczanie niektórych nadpłat. Zmiany te dotyczą wszystkich podatników, przedsiębiorców oraz urzędów skarbowych.	gemini-3.5-flash-lite
111	10	2445	Rządowy projekt ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych, ustawy o podatku dochodowym od osób prawnych oraz ustawy o zryczałtowanym podatku dochodowym od niektórych przychodów osiąganych przez osoby fizyczne	projekt ustawy	projekt dotyczy wydłużenia na stałe terminu na przesyłanie Jednolitego Pliku Kontrolnego, w związku z tym podatnicy będą mogli przesyłać księgi rachunkowe, w tym ewidencję środków trwałych i wartości niematerialnych, do końca siódmego miesiąca po zakończeniu roku podatkowego	DU/2026/779	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000779	Projekt wprowadza stałe wydłużenie terminu na przesyłanie Jednolitego Pliku Kontrolnego, w tym ksiąg rachunkowych, do końca siódmego miesiąca po zakończeniu roku podatkowego. Zmiana ta dotyczy podatników podatku dochodowego od osób fizycznych, podatku dochodowego od osób prawnych oraz osób rozliczających się zryczałtowanym podatkiem dochodowym.	gemini-3.5-flash-lite
112	10	2456	Rządowy projekt ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o zapobieganiu oraz zwalczaniu zakażeń i chorób zakaźnych u ludzi	projekt ustawy	projekt dotyczy poprawy dostępu do leczenia osób żyjących z HIV oraz zmiany źródła finasowania badań diagnostycznych pacjentom z wirusowym zapaleniem wątroby typu C, przebywającym w zakładach penitencjarnych	\N	\N	Projekt ułatwia dostęp do leczenia osobom żyjącym z HIV oraz zmienia sposób finansowania badań na wirusowe zapalenie wątroby typu C dla pacjentów w więzieniach. Zmiany te dotyczą osób żyjących z HIV oraz pacjentów przebywających w zakładach penitencjarnych.	gemini-3.5-flash-lite
113	10	2318	Rządowy projekt ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco	projekt ustawy	projekt dotyczy rozszerzenia stosowania tzw. milczącej zgody, jeśli chodzi o załatwienie spraw w urzędach (jeśli urząd nie wyda decyzji w określonym terminie, sprawa zostanie uznana za załatwioną, zgodnie z wnioskiem obywatela lub przedsiębiorcy). Celem zmian jest skrócenie czasu oczekiwania na rozstrzygnięcia administracyjne oraz ułatwienie prowadzenia działalności gospodarczej. Nowe przepisy realizują działania deregulacyjne rządu.	DU/2026/875	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000875	Wprowadza się zasadę, że jeśli urząd nie odpowie w wyznaczonym czasie, sprawa automatycznie uznaje się za załatwioną zgodnie z wnioskiem. Zmiana ta dotyczy obywateli oraz przedsiębiorców załatwiających sprawy w urzędach.	gemini-3.5-flash-lite
114	10	2398	Rządowy projekt ustawy o zmianie ustawy - Kodeks karny	projekt ustawy	projekt dotyczy wdrożenia artykułu 7 dyrektywy Parlamentu Europejskiego i Rady 2013/40/UE z dnia 12 sierpnia 2013 r. dotyczącej ataków na systemy informatyczne i zastępującej decyzję ramową Rady 2005/222/WSiSW w zakresie penalizacji przestępstw, o których mowa w art. 3 i art. 6 dyrektywy. Proponowane rozwiązania poszerzają zakres zastosowania art. 269b k.k. poprzez objęcie jego dyspozycją 5 dodatkowych czynów karalnych, wzmacniają ochronę przed cyberprzestępczością i mają skuteczniej przeciwdziałać atakom na systemy informatyczne oraz nielegalnemu wykorzystywaniu narzędzi hakerskich, a także ścigać osoby, które nie tylko przeprowadzają ataki, ale także je przygotowują lub udostępniają narzędzia do ich popełniania.	DU/2026/902	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000902	Projekt wprowadza nowe przepisy rozszerzające katalog karanych czynów związanych z cyberprzestępczością i nielegalnym wykorzystywaniem narzędzi hakerskich. Zmiana dotyczy osób, które przeprowadzają ataki na systemy informatyczne, a także tych, które je przygotowują lub udostępniają odpowiednie narzędzia.	gemini-3.5-flash-lite
115	10	2387	Rządowy projekt ustawy o zmianie ustawy - Kodeks postępowania karnego	projekt ustawy	projekt dotyczy dostosowania polskich przepisów do unijnego prawa dotyczącego europejskiego nakazu aresztowania (ENA), w celu umożliwienia szybkiego przekazywania osób między państwami UE w celu prowadzenia spraw karnych lub wykonania kary	DU/2026/882	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000882	Projekt dostosowuje polskie przepisy do prawa Unii Europejskiej w sprawie europejskiego nakazu aresztowania, co ma umożliwić szybkie przekazywanie osób między państwami. Zmiana dotyczy osób objętych europejskim nakazem aresztowania w sprawach karnych.	gemini-3.5-flash-lite
116	10	2372	Rządowy projekt ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy	projekt ustawy	projekt dotyczy zwiększenia kontroli sądowej nad decyzjami prokuratorów. Obecnie, jeśli prokurator odmówi w śledztwie dopuszczenia pełnomocnika (np. adwokata) osoby niebędącej stroną postępowania, można złożyć zażalenie tylko do prokuratora wyższego szczebla. Po zmianach, takie zażalenie będzie rozpoznawał sąd rejonowy odpowiedni dla miejsca prowadzenia postępowania. Oznacza to wprowadzenie niezależnej kontroli decyzji prokuratora przez sąd.	DU/2026/901	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000901	Projekt wprowadza sądową kontrolę nad decyzjami prokuratora w sprawach odmowy dopuszczenia pełnomocnika do udziału w śledztwie, zastępując dotychczasowy tryb odwoławczy do prokuratora wyższego szczebla. Zmiana dotyczy osób niebędących stroną postępowania, które korzystają z pomocy adwokata lub innego pełnomocnika.	gemini-3.5-flash-lite
118	10	2488	Rządowy projekt ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej	projekt ustawy	projekt dotyczy wzmocnienia ochrony osób zabierających głos w sprawach publicznych - dziennikarzy, aktywistów, organizacji społecznych i naukowców. Nowe przepisy to przede wszystkim ochrona wolności wypowiedzi i przeciwdziałanie nadużywaniu postępowań cywilnych do ograniczania debaty publicznej i uciszania krytyki. Dzięki temu trudniej będzie wykorzystywać procedury prawne jako narzędzie nacisku lub zastraszania. Proponowane rozwiązania wdrażają prawo Unii Europejskiej i wprowadzają skuteczniejsze narzędzia ochrony przed tzw. pozwami SLAPP.	DU/2026/830	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000830	Projekt wprowadza nowe przepisy, które mają chronić przed wykorzystywaniem postępowań sądowych jako narzędzia nacisku i zastraszania. Zmiany te dotyczą dziennikarzy, aktywistów, naukowców oraz organizacji społecznych biorących udział w debacie publicznej.	gemini-3.5-flash-lite
119	10	2533	Rządowy projekt ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac	projekt ustawy	projekt dotyczy określenia w sposób kompleksowy zasad i sposobu realizacji udziału Rzeczypospolitej Polskiej w systemie Eurodac - ogólnoeuropejskiej bazie danych daktyloskopijnych osób ubiegających się o azyl (ochronę międzynarodową) oraz cudzoziemców zatrzymanych w związku z nielegalnym przekroczeniem zewnętrznych granic Unii Europejskiej	DU/2026/760	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000760	Wprowadza się nowe zasady udziału Polski w ogólnoeuropejskiej bazie danych zawierającej odciski palców osób szukających azylu oraz cudzoziemców, którzy nielegalnie przekroczyli granice Unii Europejskiej. Przepisy te dotyczą osób ubiegających się o ochronę międzynarodową oraz cudzoziemców zatrzymanych przy nielegalnym przekraczaniu granic.	gemini-3.5-flash-lite
120	10	2444	Poselski projekt ustawy o zmianie ustawy o podatku od towarów i usług	projekt ustawy	projekt dotyczy rozszerzenia zakresu przedmiotowego załącznika nr 8 do ustawy o podatku od towarów i usług poprzez dostosowanie wykazu towarów objętych stawką 0% VAT przy darowiznach na rzecz jednostek systemu oświaty do rzeczywistych potrzeb współczesnej edukacji oraz aktualnego poziomu rozwoju technologicznego	\N	\N	Projekt poszerza listę nowoczesnego sprzętu i towarów edukacyjnych, które można przekazać szkołom i przedszkolom z zerową stawką podatku VAT. Zmiana dotyczy darczyńców oraz placówek oświatowych korzystających z takich darowizn.	gemini-3.5-flash-lite
121	10	2288	Rządowy projekt ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy	projekt ustawy	projekt dotyczy zmian w Ordynacji podatkowej w obszarze instytucji przedawnienia; ponadto m.in.: uchylenia art. 44 § 2 Kodeksu karnego skarbowego, zawierającego przesłankę przedawnienia karalności czynu także w przypadku przedawnienia należności publicznoprawnej w związku z projektowanym uchyleniem art. 70 § 6 pkt 1 Ordynacji podatkowej	\N	\N	Projekt zmienia przepisy dotyczące przedawnienia podatków oraz kar za przestępstwa skarbowe. Zmiany te dotyczą osób i firm rozliczających podatki oraz organów skarbowych.	gemini-3.5-flash-lite
122	10	2458	Rządowy projekt ustawy o utworzeniu Wojskowej Akademii Medycznej	projekt ustawy	projekt dotyczy utworzenia Wojskowej Akademii Medycznej w Łodzi, która zacznie działać od 1 lipca 2026 roku; celem nowej uczelni będzie przygotowanie kadr medycznych do służby wojskowej w różnych specjalizacjach, m.in. jako lekarze, pielęgniarki, ratownicy medyczni czy farmaceuci. Akademia będzie miała status uczelni publicznej i będzie kształcić studentów-żołnierzy w ramach wojskowego systemu edukacji	DU/2026/821	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260000821	W Łodzi powstanie nowa uczelnia publiczna pod nazwą Wojskowa Akademia Medyczna, która rozpocznie działalność 1 lipca 2026 roku. Zmiana dotyczy osób chcących uczyć się i służyć jako lekarze, pielęgniarki, ratownicy medyczni oraz farmaceuci w ramach wojskowego systemu edukacji.	gemini-3.5-flash-lite
31	10	3100	Rządowy projekt ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych	projekt ustawy	projekt dotyczy wprowadzenia czasowego podatku od nadzwyczajnych zysków osiąganych przez przedsiębiorstwa zajmujące się produkcją i handlem paliwami sprowadzanymi z zagranicy. Nowe przepisy pomogą sfinansować rządowe działania, które mają chronić obywateli przed skutkami wzrostu cen paliw wywołanego kryzysem na światowych rynkach energii, czyli tzw. CPN.	DU/2026/1287	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001287	Projekt wprowadza czasowy podatek od nadzwyczajnych zysków ze sprzedaży paliw ciekłych, który ma pomóc w finansowaniu działań osłonowych przed wzrostem cen energii. Przepisy te dotyczyć będą przedsiębiorstw zajmujących się produkcją i handlem paliwami sprowadzanymi z zagranicy.	gemini-3.5-flash-lite
32	10	3099	Rządowy projekt ustawy o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych	projekt ustawy	projekt dotyczy podwyższenia z 1 tys. zł do 3 tys. zł limitu zwolnienia z podatku od czynności cywilnoprawnych przy sprzedaży rzeczy ruchomych. Chodzi np. o odsprzedawane przez osoby prywatne meble, telefony, komputery czy sprzęt AGD. Nowe przepisy wprowadzają także zmiany dotyczące opłaty miejscowej i opłaty uzdrowiskowej.	\N	\N	Projekt podwyższa z 1 tysiąca do 3 tysięcy złotych limit zwolnienia z podatku przy sprzedaży używanych rzeczy oraz zmienia zasady pobierania opłaty miejscowej i uzdrowiskowej. Zmiany te dotyczą osób prywatnych sprzedających rzeczy ruchome oraz osób przebywających w miejscowościach turystycznych i uzdrowiskowych.	gemini-3.5-flash-lite
39	10	3101	Rządowy projekt ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy ograniczenia liczby zdarzeń drogowych na przejazdach kolejowych poprzez: 1) wprowadzenie instrumentu natychmiastowego zatrzymania na 3 miesiące prawa jazdy za najbardziej niebezpieczne naruszenia popełnione na przejazdach kolejowych, 2) zaostrzenie sądowego środka karnego w postaci zakazu prowadzenia pojazdów w przypadku przestępstw popełnionych na przejazdach kolejowych.	\N	\N	Wprowadzono natychmiastowe zatrzymanie prawa jazdy na trzy miesiące za najpoważniejsze wykroczenia na przejazdach kolejowych oraz zaostrzono kary sądowe za przestępstwa w tych miejscach. Zmiany te dotyczą kierujących pojazdami, którzy naruszają przepisy ruchu drogowego na przejazdach kolejowych.	gemini-3.5-flash-lite
45	10	316	Przedstawiony przez Prezydenta Rzeczypospolitej Polskiej projekt ustawy o asystencji osobistej osób z niepełnosprawnościami	projekt ustawy	projekt dotyczy systemowego uregulowania korzystania przez osoby z niepełnosprawnościami z usługi asystencji osobistej i stworzenia w ten sposób trwałych warunków dla osób z niepełnosprawnościami do realizacji możliwie pełnego samodzielnego życia	\N	\N	Projekt wprowadza stałe zasady korzystania z usług asystencji osobistej, co ma pomóc w samodzielnym życiu. Zmiana dotyczy osób z niepełnosprawnościami.	gemini-3.5-flash-lite
48	10	3010	Rządowy projekt ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r.	projekt ustawy	projekt dotyczy umorzenia starych zobowiązań wobec ZUS. Chodzi o należności dotyczące składek powstałych przed 1 stycznia 1999 r., czyli przed reformą systemu ubezpieczeń społecznych. Nowe przepisy realizują działania deregulacyjne rządu	\N	\N	Projekt przewiduje umorzenie zaległych składek na ubezpieczenia społeczne, które powstały przed dniem 1 stycznia 1999 roku. Zmiana dotyczy osób i podmiotów, które posiadają takie stare zobowiązania finansowe wobec Zakładu Ubezpieczeń Społecznych.	gemini-3.5-flash-lite
49	10	2837	Rządowy projekt ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych	projekt ustawy	projekt dotyczy uproszczenia obowiązków informacyjnych dla przedsiębiorców dotyczących cen transferowych, czyli rozliczeń pomiędzy firmami należącymi do tej samej grupy kapitałowej. Nowe rozwiązania ograniczą obowiązki administracyjne, zmniejszą koszty prowadzenia działalności gospodarczej i ułatwią wywiązywanie się z obowiązków sprawozdawczych. Nowe przepisy realizują działania deregulacyjne rządu	\N	\N	Projekt upraszcza obowiązki informacyjne związane z rozliczeniami pomiędzy firmami należącymi do tej samej grupy kapitałowej. Zmiany te dotyczą przedsiębiorców prowadzących działalność gospodarczą.	gemini-3.5-flash-lite
50	10	2838	Rządowy projekt ustawy o zmianie ustawy o podatku od towarów i usług	projekt ustawy	projekt dotyczy nowelizacji obowiązujących przepisów ustawy o VAT w związku ze zmianami przepisów unijnych dotyczących zniesienia zwolnienia z należności celnych przesyłek o wartości do 150 euro. Nowe przepisy realizują działania deregulacyjne rządu.	\N	\N	Projekt wprowadza zmiany w przepisach dotyczące zniesienia zwolnienia z należności celnych dla przesyłek o wartości do 150 euro, dostosowując je do unijnych regulacji. Zmiana ta dotyczy osób robiących zakupy w formie przesyłek oraz podmiotów zajmujących się ich obsługą.	gemini-3.5-flash-lite
51	10	2839	Rządowy projekt ustawy o zmianie ustawy o podatku akcyzowym	projekt ustawy	projekt dotyczy wprowadzenia jednolitych zasad opodatkowania papierosów elektronicznych oraz urządzeń do waporyzacji, czyli urządzeń przeznaczonych do podgrzewania płynów lub innych wyrobów wykorzystywanych do inhalacji	\N	\N	Wprowadzone zostaną jednolite zasady opodatkowania papierosów elektronicznych oraz urządzeń służących do waporyzacji. Przepisy te dotyczą osób korzystających z takich wyrobów oraz podmiotów zajmujących się ich obrotem.	gemini-3.5-flash-lite
52	10	2846	Rządowy projekt ustawy o szczególnych rozwiązaniach związanych z organizacją XXVI Światowego Jamboree Skautowego w Polsce w 2027 r.	projekt ustawy	projekt dotyczy uregulowania współpracy administracji i służb odpowiedzialnych za przygotowanie XXVI Światowego Jamboree Skautowego. Wydarzenie odbędzie się od 29 lipca do 9 sierpnia 2027 r. na Wyspie Sobieszewskiej w Gdańsku. Organizatorem jest Związek Harcerstwa Polskiego we współpracy ze Światową Organizacją Ruchu Skautowego.	\N	\N	Przygotowano specjalne zasady współpracy urzędów i służb przy organizacji dużego międzynarodowego zlotu harcerskiego. Przepisy te dotyczą osób biorących udział w przygotowaniach oraz uczestników XXVI Światowego Jamboree Skautowego w 2027 roku.	gemini-3.5-flash-lite
53	10	2870	Rządowy projekt ustawy o zmianie ustawy o działaniach antyterrorystycznych	projekt ustawy	projekt dotyczy wprowadzenia stałych i jednolitych zasad przygotowania i zabezpieczania najważniejszych wydarzeń państwowych oraz międzynarodowych organizowanych w Polsce. Dzięki nowym przepisom służby będą mogły sprawniej planować działania i skuteczniej reagować na zagrożenia, w tym o charakterze terrorystycznym. Rozwiązania zastąpią przepisy przygotowywane dotychczas odrębnie dla poszczególnych wydarzeń	\N	\N	Wprowadzone zostają stałe i jednolite zasady zabezpieczania najważniejszych wydarzeń państwowych oraz międzynarodowych w Polsce, zastępując dotychczasowe przepisy tworzone osobno dla każdej imprezy. Zmiana ta dotyczy służb odpowiedzialnych za planowanie działań i reagowanie na zagrożenia, w tym terrorystyczne.	gemini-3.5-flash-lite
54	10	2998	Rządowy projekt ustawy o zmianie ustawy o finansowym wspieraniu produkcji audiowizualnej oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy: uproszczenia procedur i zwalczenia negatywnych zjawisk w dziedzinie produkcji audiowizualnej. Proponowane rozwiązania w szczególności polegają na wprowadzeniu: nowych okresów rozliczeniowych dla wniosków o wsparcie finansowe i nowego terminu na składanie takich wniosków, możliwości ustanawiania zabezpieczenia na środkach zdeponowanych na kontach powierniczych w bankach jako zachęty, zmian dotyczących raportowania przed podmioty prowadzące kina, a także zmian dotyczących przekazywania kopii filmu do Filmoteki Narodowej.	\N	\N	Projekt upraszcza zasady ubiegania się o wsparcie finansowe na produkcję filmów, zmienia terminy składania wniosków oraz wprowadza nowe przepisy dotyczące raportowania i przekazywania kopii dzieł do Filmoteki Narodowej. Zmiany te dotyczą twórców filmowych, producentów oraz kin.	gemini-3.5-flash-lite
55	10	671	Poselski projekt ustawy o wychowaniu patriotycznym zmieniająca niektóre ustawy	projekt ustawy	projekt dotyczy ustanowienia Komisji Edukacji Narodowej jako organu eksperckiego, stabilizującego polski system edukacji; wprowadzenia nowych form edukacji obywatelskiej przygotowującej do odpowiedzialności za Ojczyznę oraz uwspółcześnienie zadań edukacyjnych i wychowawczych w szkołach\n\n	\N	\N	Projekt wprowadza Komisję Edukacji Narodowej jako organ ekspercki oraz nowe formy edukacji obywatelskiej, a także aktualizuje zadania wychowawcze w szkołach. Zmiany te dotyczą uczniów, nauczycieli oraz osób związanych z systemem edukacji w Polsce.	gemini-3.5-flash-lite
56	10	3002	Rządowy projekt ustawy o zmianie ustawy - Prawo farmaceutyczne	projekt ustawy	projekt dotyczy uchylenia obowiązującego od 2012 r. całkowitego zakazu reklamy aptek i punktów aptecznych; umożliwienia reklamowania usług świadczonych przez farmaceutów, takich jak: opieka farmaceutyczna, szczepienia, przeglądy lekowe czy podstawowe badania diagnostyczne; podwyższenia wysokości kary za prowadzenie reklamy niezgodnej z przepisami z 50 tys. zł do 100 tys. zł	\N	\N	Projekt znosi zakaz reklamy aptek i pozwala na promowanie usług takich jak szczepienia, przeglądy lekowe czy badania, jednocześnie podwyższając kary za niezgodną z prawem reklamę z 50 do 100 tysięcy złotych. Zmiana ta dotyczy właścicieli aptek, punktów aptecznych oraz farmaceutów świadczących te usługi.	gemini-3.5-flash-lite
57	10	3012	Rządowy projekt ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o grach hazardowych	projekt ustawy	projekt dotyczy podniesienia poziomu dofinansowania wynagrodzeń dla twórców i wydawców za wypożyczanie książek w bibliotekach z 5% do 10% wartości zakupów bibliotecznych	\N	\N	Projekt podwyższa dofinansowanie wynagrodzeń dla twórców i wydawców za wypożyczanie książek w bibliotekach z 5% do 10% wartości zakupów bibliotecznych. Zmiana dotyczy autorów, twórców oraz wydawców książek.	gemini-3.5-flash-lite
58	10	3102	Rządowy projekt ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy zwiększenia bezpieczeństwa i efektywności funkcjonowania rynku energii elektrycznej. Nowe przepisy porządkują zasady działania centralnego systemu informacji rynku energii, ułatwią rozliczenia w przypadku problemów z systemami informatycznymi oraz wzmocnią obowiązek przekazywania danych potrzebnych do bezpiecznego zarządzania siecią. Projekt upraszcza także rozliczenia związane z ograniczeniami w poborze energii i porządkuje zasady dotyczące liczników zdalnego odczytu.	\N	\N	Projekt zmienia i porządkuje zasady działania centralnego systemu informacji rynku energii oraz ułatwia rozliczenia i zarządzanie siecią. Nowe przepisy dotyczą uczestników rynku energii elektrycznej, operatorów oraz odbiorców korzystających z liczników zdalnego odczytu.	gemini-3.5-flash-lite
66	10	2841	Rządowy projekt ustawy o ratyfikacji Konwencji Rady Europy w sprawie koprodukcji utworów audiowizualnych w formie seriali, sporządzonej w Lille dnia 26 marca 2026 r.	projekt ustawy	projekt dotyczy regulacji zagadnień związanych z koprodukcją międzynarodową seriali w tym m.in.: wsparcie finansowe ze strony partnerów zagranicznych, zwiększenie szansy na dystrybucję	\N	\N	Polska przyjmuje międzynarodową konwencję, która ułatwia wspólne finansowanie i międzynarodową dystrybucję seriali. Zmiana dotyczy twórców i producentów zajmujących się tworzeniem seriali telewizyjnych.	gemini-3.5-flash-lite
67	10	2738	Rządowy projekt ustawy o ratyfikacji Międzynarodowej konwencji z Hongkongu o bezpiecznym i ekologicznie racjonalnym recyklingu statków, sporządzonej w Hongkongu dnia 15 maja 2009 r.	projekt ustawy	projekt dotyczy zobowiązania państw-stron do pełnego wykonywania postanowień konwencji w celu zapobiegania, ograniczania, minimalizowania oraz, w miarę możliwości, eliminowania wypadków, obrażeń i innych negatywnych skutków dla zdrowia ludzi i środowiska związanych z recyklingiem statków	\N	\N	Polska ratyfikuje międzynarodową konwencję, która ma na celu poprawę bezpieczeństwa ludzi i ochrony środowiska przy recyklingu statków. Zmiana dotyczy instytucji oraz osób zajmujących się demontażem i utylizacją statków.	gemini-3.5-flash-lite
134	10	2811	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie ustalenia liczby członków Komisji do Spraw Służb Specjalnych	projekt uchwały	\N	\N	\N	\N	\N
135	10	2862	Głosowanie proceduralne dotyczące druku nr 2862	\N	\N	\N	\N	\N	\N
136	10	2847	Głosowanie proceduralne dotyczące druku nr 2847	\N	\N	\N	\N	\N	\N
137	10	2854	Głosowanie proceduralne dotyczące druku nr 2854	\N	\N	\N	\N	\N	\N
68	10	2840	Rządowy projekt ustawy o ratyfikacji Traktatu między Rzecząpospolitą Polską a Zjednoczonym Królestwem Wielkiej Brytanii i Irlandii Północnej o partnerstwie w dziedzinie bezpieczeństwa i obronności, podpisanego w Londynie dnia 27 maja 2026 r.	projekt ustawy	projekt dotyczy intensyfikacji polsko-brytyjskiej współpracy w dziedzinie bezpieczeństwa i obronności	\N	\N	Polska i Zjednoczone Królestwo zacieśniają współpracę w obszarze bezpieczeństwa i obronności na mocy nowego traktatu. Zmiana ta dotyczy obu tych państw oraz ich struktur odpowiedzialnych za obronę.	gemini-3.5-flash-lite
6	10	2821	Rządowy projekt ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy m.in.: powstania nowego systemu wsparcia dla instalacji produkujących biometan o mocy większej niż 1 MW, złagodzenia zasad udziału części instalacji wykorzystujących biogaz i biomasę w systemie aukcyjnym OZE, ułatwienia zasad budowy tzw. gazociągów bezpośrednich, czyli połączeń, które umożliwiają dostarczanie biogazu lub biometanu bezpośrednio od producenta do odbiorcy, z pominięciem ogólnej sieci gazowej, doprecyzowania zasad działania spółdzielni energetycznych, czyli grup mieszkańców, przedsiębiorców lub samorządów, które wspólnie produkują i wykorzystują energię	\N	\N	Projekt wprowadza nowy system wsparcia dla producentów biometanu oraz ułatwia budowę bezpośrednich gazociągów i działanie spółdzielni energetycznych. Zmiany te dotyczą wytwórców biogazu i biometanu, przedsiębiorców, samorządów oraz mieszkańców tworzących spółdzielnie energetyczne.	gemini-3.5-flash-lite
8	10	3028	Rządowy projekt ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2026	projekt ustawy	projekt dotyczy wprowadzenia rozwiązań umożliwiających sprawne wykonywanie budżetu państwa w 2026 r. w celu sfinansowania realizacji istotnych zadań publicznych w zakresie świadczeń wypłacanych z Funduszu emerytalno-rentowego	\N	\N	Projekt wprowadza przepisy, które mają ułatwić sprawne wykonanie budżetu państwa w 2026 roku. Zmiany te dotyczą finansowania ważnych zadań publicznych, w tym świadczeń wypłacanych z Funduszu emerytalno-rentowego.	gemini-3.5-flash-lite
16	10	2769	Senacki projekt ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach	projekt ustawy	projekt dotyczy ustanowienia przepisów służących stosowaniu rozporządzenia Parlamentu Europejskiego i Rady (UE) 2024/900 z dnia 13 marca 2024 r. W myśl projektu organem wiodącym, któremu powierzone zostaną zadania w zakresie ww. rozporządzenia  oraz nadzór nad jego stosowaniem będzie PKW, a pozostałymi organami będą: Prezes UKE, KRRiT, Prezes UKOiK oraz Prezes UODO. Postępowania będą się toczyć w trybie przewidzianym w kpa.	\N	\N	Projekt wprowadza nowe przepisy dotyczące nadzoru nad reklamą polityczną, wyznaczając Państwową Komisję Wyborczą oraz cztery inne urzędy do kontroli tych spraw. Regulacja dotyczy instytucji państwowych odpowiedzialnych za nadzór nad rynkiem mediów, konkurencji, ochrony danych oraz łączności.	gemini-3.5-flash-lite
17	10	2670	Senacki projekt ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym	projekt ustawy	projekt dotyczy wprowadzenia zmian w zasadach przeprowadzania głosowania i ustalania wyników wyborów, doprecyzowania kompetencji organów wyborczych oraz modyfikacji przepisów dotyczących organizacji i przebiegu referendów lokalnych	\N	\N	Projekt wprowadza zmiany w zasadach przeprowadzania głosowania i ustalania wyników wyborów, a także modyfikuje przepisy dotyczące organizacji referendów lokalnych. Zmiany te dotyczą osób biorących udział w wyborach i referendach oraz instytucji zajmujących się ich organizacją.	gemini-3.5-flash-lite
18	10	2801	Rządowy projekt ustawy o zmianie ustawy o związkach zawodowych oraz ustawy o informowaniu pracowników i przeprowadzaniu z nimi konsultacji	projekt ustawy	projekt dotyczy ułatwienia komunikacji między pracodawcą, zakładową organizacją związkową oraz radą pracowników. Zamiast obowiązkowego obiegu dokumentów w formie papierowej możliwe będzie korzystanie również z formy elektronicznej lub dokumentowej (np. PDF), o ile strony wyrażą na to zgodę. Nowe przepisy realizują działania deregulacyjne rządu.	\N	\N	Projekt wprowadza możliwość przesyłania dokumentów między pracodawcami a związkami zawodowymi w formie elektronicznej zamiast papierowej, o ile obie strony wyrażą na to zgodę. Zmiana dotyczy pracodawców, zakładowych organizacji związkowych oraz rad pracowników.	gemini-3.5-flash-lite
19	10	2737	Rządowy projekt ustawy o zmianie ustawy - Kodeks spółek handlowych oraz ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy uproszczenia zasad funkcjonowania spółek z ograniczoną odpowiedzialnością oraz dostosowania je do obrotu cyfrowego. Zmiany mają ułatwić prowadzenie firm, w szczególności w sytuacjach, gdy wspólnicy kontaktują się zdalnie lub przebywają za granicą. Nowe przepisy ograniczają wymogi dotyczące papierowych dokumentów i podpisów, umożliwiając częstsze korzystanie z formy elektronicznej, np. e-maila lub skanu dokumentu. Nowe przepisy realizują działania deregulacyjne rządu.	\N	\N	Projekt ułatwia działanie spółek z ograniczoną odpowiedzialnością poprzez rezygnację z papierowych dokumentów na rzecz formy elektronicznej, takiej jak e-mail czy skan. Zmiana dotyczy wspólników i osób prowadzących te firmy, zwłaszcza kontaktujących się zdalnie lub przebywających za granicą.	gemini-3.5-flash-lite
21	10	2799	Rządowy projekt ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta	projekt ustawy	projekt dotyczy dostosowania polskich przepisów do prawa Unii Europejskiej, których celem jest wspieranie konsumentów w podejmowaniu bardziej świadomych decyzji zakupowych. Wprowadzone zmiany ułatwią rozpoznawanie rzetelnych informacji o produktach oraz ograniczą możliwość stosowania przez przedsiębiorców wprowadzających w błąd deklaracji dotyczących wpływu produktów na środowisko (tzw. "greenwashingu")	\N	\N	Nowe przepisy mają pomóc konsumentom w rozpoznawaniu rzetelnych informacji o produktach i ukrócić wprowadzające w błąd deklaracje firm o ekologiczności ich towarów. Zmiany te dotyczą wszystkich konsumentów robiących zakupy oraz przedsiębiorców oferujących swoje produkty na rynku.	gemini-3.5-flash-lite
158	10	2794	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2794	\N	\N	\N	\N	\N	\N
159	10	2784	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2784	\N	\N	\N	\N	\N	\N
160	10	2795	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2795	\N	\N	\N	\N	\N	\N
161	10	2816	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2816	\N	\N	\N	\N	\N	\N
179	10	2455	Wniosek o powołanie przez Sejm Rzeczypospolitej Polskiej za zgodą Senatu na stanowisko Prezesa Instytutu Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu dr. Mateusza Szpytmy	wniosek	\N	\N	\N	\N	\N
138	10	2878	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia pamięci uczestników Powstania Warszawskiego oraz ludności cywilnej Warszawy	projekt uchwały	\N	MP/2026/767	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000767	\N	\N
147	10	2629	Sprawozdanie z wykonania budżetu państwa za okres od dnia 1 stycznia do dnia 31 grudnia 2025 r.	informacja rządowa	\N	MP/2026/756	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000756	\N	\N
150	10	2834	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2834 i 2862)	\N	\N	\N	\N	\N	\N
151	10	2835	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	\N	\N	\N	\N	\N	\N
152	10	2836	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2836 i 2854)	\N	\N	\N	\N	\N	\N
153	10	2861	Sprawozdanie Komisji w sprawie wniosku z dnia 4 maja 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla, przedłożonego przez Europejskiego Prokuratora Generalnego, uzupełnionego w dniu 28 maja 2026 r. (druk nr 2861)	\N	\N	\N	\N	\N	\N
154	10	2879	Sprawozdanie Komisji w sprawie wniosku oskarżyciela prywatnego Artura Szweda, reprezentowanego przez adwokata Lesława Szpalę, z dnia 10 września 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Adama Dziedzica (druk nr 2879)	\N	\N	\N	\N	\N	\N
139	10	2778	Rządowy projekt ustawy o zmianie ustawy - Prawo ochrony środowiska	projekt ustawy	projekt dotyczy wzmocnienia prawa obywateli do ochrony zdrowia i czystego powietrza. Mieszkańcy, przedsiębiorcy i organizacje społeczne będą mogli składać skargi - bez wykazania interesu prawnego - na programy ochrony powietrza, ich aktualizacje, plany działań krótkoterminowych, a także na bezczynność organów odpowiedzialnych za ich przyjęcie. Programy ochrony powietrza są tworzone wtedy, gdy w danym regionie przekroczone zostają normy jego jakości.	\N	\N	Obywatele, przedsiębiorcy i organizacje społeczne zyskają prawo do składania skarg na programy ochrony powietrza oraz na bezczynność urzędów w tym zakresie, bez konieczności udowadniania swojego interesu prawnego. Zmiana ta dotyczy wszystkich mieszkańców, firm oraz organizacji, które chcą mieć większy wpływ na walkę z zanieczyszczeniami powietrza.	gemini-3.5-flash-lite
140	10	2411	Rządowy projekt ustawy o zmianie niektórych ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną	projekt ustawy	projekt dotyczy wzmocnienia kontroli sądów nad działaniami służb stosujących tzw. kontrolę operacyjną. Chodzi o niejawne działania, np. podsłuchy czy obserwację, które są wykorzystywane do zapobiegania i wykrywania przestępstw. Zmiany wzmocnią ochronę praw obywateli - zwłaszcza prawa do prywatności - oraz zwiększą przejrzystość działań służb. Nowe przepisy będą dotyczyć m.in. służb specjalnych, Policji oraz Straży Granicznej.	DU/2026/1281	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001281	Projekt wprowadza silniejszą kontrolę sądów nad niejawnymi działaniami służb, takimi jak podsłuchy czy obserwacja. Nowe przepisy dotyczą służb specjalnych, Policji, Straży Granicznej oraz obywateli.	gemini-3.5-flash-lite
141	10	2750	Komisyjny projekt ustawy zmieniającej ustawę o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy zmiany przepisów w zakresie obowiązku wniesienia albo uzupełnienia zaliczki na poczet opłaty za przyłączenie do sieci. Projekt nie ingeruje w konstrukcję zaliczki, lecz doprecyzowuje zakres podmiotowy i czasowy przepisów przejściowych	\N	\N	Projekt precyzuje przepisy przejściowe dotyczące wpłacania lub uzupełniania zaliczek na poczet opłat za przyłączenie do sieci. Zmiana dotyczy osób i firm, które planują podłączyć swoje instalacje do sieci energetycznej.	gemini-3.5-flash-lite
146	10	2822	Rządowy projekt ustawy o zmianie niektórych ustaw w celu wsparcia zrównoważonego lotnictwa	projekt ustawy	projekt dotyczy dostosowania polskiego prawa do przepisów Unii Europejskiej dotyczących ograniczania emisji gazów cieplarnianych w lotnictwie. Nowe rozwiązania wyrównają szanse mniejszych i średnich przewoźników lotniczych, w tym polskich, na europejskim rynku. Zmiany zlikwidują dotychczasowe preferencje dla największych linii lotniczych i będą zachęcać przewoźników do korzystania z bardziej ekologicznych paliw	DU/2026/1157	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001157	Przepisy dostosowują polskie prawo do unijnych wymogów ograniczania emisji gazów cieplarnianych w lotnictwie oraz zachęcają do korzystania z ekologicznych paliw. Zmiany dotyczą linii lotniczych, wyrównując szanse mniejszych i średnich przewoźników na europejskim rynku.	gemini-3.5-flash-lite
131	10	2848	Poselski projekt ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy zmiany zasad opodatkowania podatkiem od nieruchomości budynków mieszkalnych jednorodzinnych i lokali mieszkalnych oraz zmiana stawek tego podatku, w zależności od liczby posiadanych przez podatnika takich nieruchomości	\N	\N	Projekt zmienia zasady naliczania podatku od nieruchomości dla domów i mieszkań oraz modyfikuje jego stawki w zależności od liczby posiadanych przez podatnika lokali. Zmiana dotyczy właścicieli domów jednorodzinnych i mieszkań.	gemini-3.5-flash-lite
132	10	2600	Poselski projekt ustawy o zmianie ustawy o ochotniczych strażach pożarnych	projekt ustawy	projekt dotyczy ustawowego umocowania funkcjonowania psów ratowniczych w ochotniczych strażach pożarnych	DU/2026/1159	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001159	Projekt wprowadza do przepisów oficjalne zasady działania psów ratowniczych w ochotniczych strażach pożarnych. Zmiana dotyczy ochotniczych straży pożarnych oraz strażaków pracujących z psami ratowniczymi.	gemini-3.5-flash-lite
142	10	2649	Poselski projekt ustawy o zmianie ustawy o samorządzie gminnym	projekt ustawy	projekt dotyczy ujednolicenia przepisów w zakresie biernego prawa wyborczego (prawa wybieralności) w organach jednostek samorządu terytorialnego	DU/2026/1273	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001273	Projekt ujednolica przepisy dotyczące prawa do kandydowania w wyborach do władz samorządowych. Zmiana dotyczy osób biorących udział w wyborach samorządowych.	gemini-3.5-flash-lite
143	10	2675	Poselski projekt ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy umożliwienia właścicielom gruntów rolnych zniszczonych w wyniku powodzi przywrócenia właściwości produkcyjnych gleb poprzez usprawnienie i przyspieszenie procesu rekultywacji gruntów. W przypadku gdy rekultywacja gruntów będzie zbyt kosztowna lub gdy grunty rolne w przyszłości narażone będą na ponowne zalanie wodami powodziowymi proponuje się umożliwienie dokonania zmiany lokalizacji gruntów właścicieli prywatnych na lokalizację gdzie znajdują się obecnie grunty Skarbu Państwa.	DU/2026/1155	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001155	Projekt ułatwia i przyspiesza odnawianie zniszczonych przez powódź gleb, a także pozwala zamienić zalaną ziemię na grunt pochodzący ze Skarbu Państwa. Zmiany te dotyczą właścicieli gruntów rolnych, którzy ucierpieli w wyniku powodzi.	gemini-3.5-flash-lite
144	10	2669	Senacki projekt ustawy o zmianie ustawy o samorządach zawodowych architektów oraz inżynierów budownictwa oraz ustawy - Prawo budowlane	projekt ustawy	projekt dotyczy wyeliminowania wątpliwości dotyczących charakteru prawnego uchwały okręgowej rady izby samorządu zawodowego architektów oraz inżynierów budownictwa podejmowanej w sprawie skreślenia z listy członków okręgowej izby lub zawieszenia w prawach członka	DU/2026/1161	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001161	Projekt ma na celu usunięcie niejasności prawnych wokół uchwał o skreśleniu lub zawieszeniu członków w izbach samorządu zawodowego. Zmiana dotyczy architektów oraz inżynierów budownictwa zrzeszonych w tych izbach.	gemini-3.5-flash-lite
145	10	2694	Rządowy projekt ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy ustanowienia Prezesa Urzędu Komunikacji Elektronicznej głównym organem nadzorującym stosowanie nowych przepisów i pełniącym funkcję koordynatora ds. usług cyfrowych; wprowadzenia nowych mechanizmów rozpatrywania sporów, zgłoszeń nielegalnych treści oraz dostępu do danych dużych platform internetowych, w celach naukowych dotyczących m.in. dezinformacji czy bezpieczeństwa w sieci	\N	\N	Prezes Urzędu Komunikacji Elektronicznej zyska nowe uprawnienia w zakresie nadzoru nad usługami cyfrowymi oraz rozpatrywania zgłoszeń nielegalnych treści. Zmiany te dotyczą dużych platform internetowych oraz użytkowników i badaczy zajmujących się bezpieczeństwem w sieci.	gemini-3.5-flash-lite
148	10	2642	Rządowy projekt ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy zmiany zasad dotyczących powoływania członków organów zarządzających dużymi bankami, nadania Komisji Nadzoru Finansowego nowych uprawnień dotyczących nadzoru nad istotnymi transakcjami prowadzonymi przez banki, uregulowania zasad działania w Polsce oddziałów banków z państw trzecich, mających siedzibę poza Unią Europejską, wprowadzenia zasad zapobiegających konfliktowi interesów po zakończeniu pełnienia funkcji Przewodniczącego KNF i jego zastępców oraz po zakończeniu pracy przez pracowników KNF	DU/2026/1206	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001206	Projekt zmienia zasady powoływania szefów dużych banków, daje urzędowi nadzoru finansowego nowe uprawnienia przy transakcjach oraz wprowadza przepisy zapobiegające konfliktom interesów dla byłych pracowników tego urzędu. Zmiany te dotyczą banków działających w Polsce, oddziałów banków spoza Unii Europejskiej oraz obecnych i byłych pracowników nadzoru finansowego.	gemini-3.5-flash-lite
149	10	2602	Obywatelski projekt ustawy o ochronie bezpieczeństwa wewnętrznego w związku z realizacją polityki migracyjnej Unii Europejskiej	projekt ustawy	projekt dotyczy w ocenie wnioskodawców - zapewnienia, aby w procesie implementacji prawa UE w zakresie polityki migracyjnej, w szczególności tzw. paktu migracyjnego, Rzeczypospolita Polska korzystała z przysługującej jej na gruncie art. 72 TFUE kompetencji do ochrony bezpieczeństwa wewnętrznego i porządku publicznego	\N	\N	Projekt zakłada skorzystanie przez Polskę z prawa do ochrony bezpieczeństwa wewnętrznego i porządku publicznego podczas wdrażania unijnej polityki migracyjnej. Zmiana dotyczy instytucji państwowych odpowiedzialnych za wdrażanie przepisów Unii Europejskiej w naszym kraju.	gemini-3.5-flash-lite
155	10	2413	Poselski projekt ustawy o zmianie ustawy o podatku od towarów i usług	projekt ustawy	projekt dotyczy propozycji wprowadzenia od dnia 1 kwietnia 2026 r. do dnia 31 grudnia 2026 r. stawki 0% na podstawową żywność w ustawie o podatku od towarów i usług	\N	\N	Projekt zakłada wprowadzenie zerowej stawki podatku VAT na podstawową żywność w okresie od 1 kwietnia do 31 grudnia 2026 roku. Zmiana ta dotyczy wszystkich osób kupujących podstawowe artykuły spożywcze.	gemini-3.5-flash-lite
133	10	2842	Rządowy projekt ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej	projekt ustawy	projekt dotyczy stworzenia bezpłatnego e-Dziennika dla szkół. Dostęp do e-Dziennika będzie możliwy również za pośrednictwem aplikacji mObywatel.	\N	\N	Powstanie nowy, bezpłatny dziennik elektroniczny dla szkół, z którego będzie można korzystać także przez aplikację mObywatel. Zmiana ta dotyczy uczniów, ich rodziców oraz pracowników szkół.	gemini-3.5-flash-lite
156	10	2788	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2788	\N	\N	\N	\N	\N	\N
157	10	2796	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia 125. rocznicy urodzin Stanisława Mikołajczyka	projekt uchwały	\N	MP/2026/730	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000730	\N	\N
170	10	2707	Komisyjny projekt uchwały w sprawie ustanowienia dnia 31 lipca Dniem Trenera Sportowego	projekt uchwały	\N	MP/2026/729	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000729	\N	\N
171	10	2646	Poselski projekt uchwały w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach	projekt uchwały	\N	MP/2026/738	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000738	\N	\N
172	10	2780	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2780 i 2794)	\N	\N	\N	\N	\N	\N
173	10	2781	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784)	\N	\N	\N	\N	\N	\N
174	10	2782	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2782 i 2795)	\N	\N	\N	\N	\N	\N
175	10	2783	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2783 i 2816)	\N	\N	\N	\N	\N	\N
178	10	2734	Kandydat na stanowisko Rzecznika Praw Obywatelskich - Pan Adam Borowski	lista kandydatów	\N	\N	\N	\N	\N
176	10	1760	Przedstawiony przez Prezydenta Rzeczypospolitej Polskiej projekt ustawy o zmianie ustawy o Instytucie Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu oraz ustawy - Kodeks karny	projekt ustawy	projekt dotyczy doprecyzowania przepisów określających pojęcie zbrodni dokonanych przez członków i współpracowników Organizacji Ukraińskich Nacjonalistów frakcji Bandery i Ukraińskiej Armii Powstańczej oraz innych ukraińskich formacji kolaborujących z Trzecią Rzeszą Niemiecką	\N	\N	Projekt precyzuje przepisy dotyczące zbrodni popełnionych przez ukraińskie formacje kolaborujące z Trzecią Rzeszą Niemiecką, w tym OUN i UPA. Zmiana dotyczy osób i instytucji zajmujących się badaniem oraz ściganiem zbrodni przeciwko Narodowi Polskiemu.	gemini-3.5-flash-lite
182	10	2819	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
162	10	2677	Rządowy projekt ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników	projekt ustawy	projekt dotyczy wprowadzenia rozwiązań ograniczających część obowiązków administracyjnych dla przedsiębiorców, które ułatwią prowadzenie działalności m.in. poprzez likwidację wybranych obowiązków administracyjnych, tj.: (1) zniesienie obowiązku składania oddzielnej informacji o spisie z natury; (2) rezygnację z obowiązku wykazywania w JPK_VAT podstawy opodatkowania przy zakupach od podatników spoza terytorium Polski, towarów i usług objętych zwolnieniem z podatku; (3) likwidację obowiązku zapłaty VAT w ciągu 14 dni przy zakupie środka transportu z innego państwa UE; (4) ograniczenie naliczania odsetek od VAT przy imporcie w sytuacjach, gdy opóźnienie płatności jest niezależne od podatnika	DU/2026/1270	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001270	Projekt znosi wybrane obowiązki administracyjne i ułatwia rozliczanie podatków, między innymi likwidując obowiązek składania spisu z natury czy zapłaty VAT w ciągu 14 dni przy zakupie auta z UE. Zmiany te dotyczą osób prowadzących działalność gospodarczą i przedsiębiorców.	gemini-3.5-flash-lite
163	10	2699	Rządowy projekt ustawy o zmianie ustawy o nabywaniu nieruchomości przez cudzoziemców oraz ustawy - Prawo o notariacie	projekt ustawy	projekt dotyczy usprawnienia kontroli nabywania przez cudzoziemców nieruchomości w Polsce. Notariusze będą przesyłać dokumenty do Ministerstwa Spraw Wewnętrznych i Administracji wyłącznie w formie elektronicznej. Dzięki temu ich obieg stanie się szybszy, bezpieczniejszy i bardziej przejrzysty. Zmiany wpisują się w proces cyfryzacji administracji publicznej i poprawiają nadzór nad zakupem nieruchomości przez cudzoziemców	DU/2026/1099	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001099	Notariusze będą przesyłać dokumenty dotyczące kupna nieruchomości przez cudzoziemców do ministerstwa wyłącznie w formie elektronicznej. Zmiana ta dotyczy notariuszy oraz obcokrajwców nabywających nieruchomości w Polsce.	gemini-3.5-flash-lite
164	10	2695	Rządowy projekt ustawy o zmianie ustawy o jakości handlowej artykułów rolno-spożywczych oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy wdrożenia nowych przepisów UE dotyczących jakości handlowej produktów sektora owoców i warzyw, bananów i niektórych suszonych owoców oraz zwiększenia efektywności nadzoru nad artykułami rolno-spożywczymi, w tym przede wszystkim nad ich jakością handlową w produkcji i obrocie	DU/2026/1154	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001154	Wprowadza się nowe przepisy Unii Europejskiej dotyczące jakości handlowej między innymi owoców, warzyw, bananów i suszonych owoców oraz zwiększa się nadzór nad artykułami rolno-spożywczymi. Zmiany te dotyczą osób i firm zajmujących się produkcją oraz handlem tymi artykułami.	gemini-3.5-flash-lite
165	10	2701	Komisyjny projekt ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych	projekt ustawy	projekt dotyczy stworzenia odrębnej, szczególnej podstawy prawnej umożliwiającej PEFRON nieodpłatne przekazywanie osobom z niepełnosprawnościami oraz rodzinom, których członkami są osoby z niepełnosprawnościami, środków materialnych i niematerialnych pochodzących z rezerw strategicznych, udostępnionych Funduszowi w celu realizacji programów	DU/2026/1102	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001102	Państwowy Fundusz Rehabilitacji Osób Niepełnosprawnych zyska możliwość bezpłatnego przekazywania różnej pomocy pochodzącej z rezerw strategicznych. Zmiana ta dotyczy osób z niepełnosprawnościami oraz rodzin, które mają wśród swoich członków takie osoby.	gemini-3.5-flash-lite
166	10	2698	Rządowy projekt ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy wprowadzenia nowej formy opieki - punkt opieki dziennej; wprowadzenia nowych uprawnień dla osób pracujących z najmłodszymi dziećmi (w tym m.in.: płatny czas na podnoszenie kwalifikacji zawodowych; 33-procentowa ulga na przejazdy publicznym transportem zbiorowym); nowe wymagania dotyczące plac zabaw przy żłobkach; propozycji ustanowienia 4 kwietnia Dniem Opiekuna Małego Dziecka	DU/2026/1123	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001123	Projekt wprowadza nową formę opieki nad dziećmi w postaci punktu opieki dziennej oraz nowe zasady i wymagania dla placówek. Zmiany te dotyczą opiekunów najmłodszych dzieci, rodziców oraz placówek zajmujących się opieką do lat trzech.	gemini-3.5-flash-lite
167	10	2667	Rządowy projekt ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Republiką Albanii o zabezpieczeniu społecznym, podpisanej w Warszawie dnia 23 lutego 2026 r.	projekt ustawy	projekt dotyczy uregulowania między Polską a Albanią wzajemnych stosunków w dziedzinie zabezpieczenia społecznego, w tym wprowadzenia możliwości korzystania przy ustalaniu prawa do świadczeń długoterminowych (emerytur i rent) z zasady sumowania okresów ubezpieczenia oraz możliwości transferu świadczeń nabytych na podstawie ustawodawstwa Polski, w przypadku przeniesienia swojego miejsca zamieszkania na terytorium Albanii i odwrotnie	DU/2026/1100	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001100	Projekt wprowadza możliwość łączenia okresów ubezpieczenia w Polsce i Albanii przy ustalaniu praw do emerytur i rent oraz pozwala na transfer tych świadczeń po zmianie miejsca zamieszkania. Regulacja dotyczy osób, które pracowały lub będą pracować w obu tych krajach.	gemini-3.5-flash-lite
168	10	2700	Rządowy projekt ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy poprawy dostępności transportu publicznego, szczególnie na obszarach wiejskich i w mniejszych miejscowościach oraz skuteczniejszego przeciwdziałania wykluczeniu transportowemu	\N	\N	Projekt wprowadza zmiany mające na celu poprawę dostępności transportu publicznego, zwłaszcza na wsiach i w mniejszych miejscowościach, oraz skuteczniejsze przeciwdziałanie wykluczeniu transportowemu. Ustawa ta dotyczy mieszkańców oraz organizatorów i operatorów publicznego transportu zbiorowego na obszarach o mniejszej dostępności komunikacyjnej.	gemini-3.5-flash-lite
169	10	2648	Poselski projekt ustawy o zmianie ustawy - Prawo wodne	projekt ustawy	projekt dotyczy wprowadzenia rozwiązania prawnego umożliwiającego wykorzystanie ścieków komunalnych oczyszczonych w stopniu wymaganym przepisami ustawy i poddanych dalszemu oczyszczaniu, w procesach technologicznych w energetyce, w szczególności na cele chłodzenia elektrowni lub elektrociepłowni	DU/2026/1156	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001156	Nowe przepisy pozwolą na wykorzystanie odpowiednio oczyszczonych ścieków komunalnych do celów chłodzenia w elektrowniach i elektrociepłowniach. Rozwiązanie to dotyczy branży energetycznej oraz podmiotów zajmujących się gospodarką wodno-ściekową.	gemini-3.5-flash-lite
177	10	1962	Komisyjny projekt ustawy o zmianie ustawy - Prawo o adwokaturze	projekt ustawy	projekt dotyczy zmian w zakresie finansowania działalności samorządu adwokackiego i gospodarki finansowej jego organów, zadań samorządu i kompetencji jego organów, obowiązków adwokatów i aplikantów adwokackich dotyczących świadczenia pomocy prawnej, obowiązków adwokatów związanych z członkostwem w samorządzie i ich odpowiedzialności dyscyplinarnej	\N	\N	Projekt wprowadza zmiany dotyczące finansów, zadań oraz zasad odpowiedzialności dyscyplinarnej w samorządzie adwokackim, a także obowiązków prawników związanych z udzielaniem pomocy prawnej. Nowe przepisy dotyczą adwokatów, aplikantów adwokackich oraz organów samorządu adwokackiego.	gemini-3.5-flash-lite
180	10	2359	Poselski projekt ustawy o zmianie ustawy o podatku od towarów i usług	projekt ustawy	projekt dotyczy wprowadzenia dobrowolności wystawiania faktur ustrukturyzowanych przy użyciu Krajowego Systemu e-Faktur przez podatnika będącego mikroprzedsiębiorcą, małym lub średnim przedsiębiorcą	\N	\N	Projekt wprowadza możliwość dobrowolnego, a nie obowiązkowego, wystawiania faktur w Krajowym Systemie e-Faktur. Zmiana ta dotyczy mikroprzedsiębiorców oraz małych i średnich firm.	gemini-3.5-flash-lite
181	10	2393	Przedstawiony przez Prezydenta Rzeczypospolitej Polskiej projekt ustawy o zmianie niektórych ustaw w celu obniżenia kosztów energii elektrycznej oraz finansowaniu systemów wsparcia energetyki ze środków z handlu uprawnieniami do emisji CO2	projekt ustawy	projekt dotyczy ograniczenia wysokości zwrotu z zaangażowanego kapitału dla operatorów systemów dystrybucyjnych (OSD) oraz operatora systemu przesyłowego (OSP), jaki w postępowaniu taryfowym może ustalić Prezes Urzędu Regulacji Energetyki (URE)	\N	\N	Projekt zmienia zasady ustalania zysków dla firm przesyłających prąd, co ma na celu obniżenie kosztów energii. Zmiana dotyczy operatorów systemów energetycznych oraz Prezesa Urzędu Regulacji Energetyki.	gemini-3.5-flash-lite
184	10	2730	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	\N	\N	\N	\N	\N	\N
185	10	2729	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 2729 i 2766)	\N	\N	\N	\N	\N	\N
186	10	2728	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o imprezach turystycznych i powiązanych usługach turystycznych (druki nr 2728 i 2741)	\N	\N	\N	\N	\N	\N
187	10	2732	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	\N	\N	\N	\N	\N	\N
188	10	2727	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 2727 i 2760)	\N	\N	\N	\N	\N	\N
192	10	2739	Wniosek Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi	wniosek	\N	MP/2026/674	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000674	\N	\N
194	10	2676	Komisyjny projekt uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej	projekt uchwały	projekt dotyczy przywrócenia obowiązującej do 2015 roku maksymalnej liczby członków Komisji do Spraw Służb Specjalnych - 9 posłów zamiast wprowadzonej wówczas liczby 7 posłów	MP/2026/665	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WMP20260000665	\N	\N
197	10	2731	Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	\N	\N	\N	\N	\N	\N
198	10	2768	Przedstawiony przez Prezydium Sejmu wniosek w sprawie wyboru uzupełniającego do składu Komisji do Spraw Unii Europejskiej	wniosek	\N	\N	\N	\N	\N
199	10	2767	Przedstawiony przez Prezydium Sejmu wniosek w sprawie zmian w składach osobowych komisji sejmowych	wniosek	\N	\N	\N	\N	\N
183	10	2598	Rządowy projekt ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta	projekt ustawy	projekt dotyczy wzmocnienia praw pacjenta i zwiększenia ochrony przed pseudomedycyną. Nowe przepisy mają skuteczniej przeciwdziałać niebezpiecznym praktykom oraz rozszerzyć uprawnienia Rzecznika Praw Pacjenta. Chodzi m.in. o walkę z oferowaniem niesprawdzonych metod leczenia i działalnością osób podszywających się pod specjalistów medycznych. Zmiany mają także ograniczyć działalność osób i firm wykorzystujących niewiedzę pacjentów do sprzedaży terapii oraz usług o niepotwierdzonej skuteczności.	\N	\N	Projekt wzmacnia prawa pacjenta i zwiększa ochronę przed niesprawdzonymi metodami leczenia oraz osobami podszywającymi się pod lekarzy. Zmiany te dotyczą wszystkich pacjentów oraz osób i firm oferujących niesprawdzone terapie.	gemini-3.5-flash-lite
189	10	2410	Rządowy projekt ustawy o zmianie ustawy o przygotowaniu i realizacji inwestycji w zakresie obiektów energetyki jądrowej oraz inwestycji towarzyszących oraz niektórych innych ustaw	projekt ustawy	projekt dotyczy doprecyzowania, które przepisy Prawa budowlanego mają zastosowanie, gdy pozwolenie na budowę dotyczy tylko części obiektu jądrowego lub etapu inwestycji, wprowadzenia nowej kategorii decyzji - pozwolenie na budowę dotyczące wstępnych robót budowlanych przy obiekcie jądrowym.\nProjekt umożliwia podział inwestycji jądrowej na etapy, także dla części obiektów, które nie mogą samodzielnie funkcjonować; wprowadzenie wymogu \nposiadania zgody Prezesa Państwowej Agencji Atomistyki na roboty budowlane, które mają znaczenie dla bezpieczeństwa jądrowego i ochrony radiologicznej	DU/2026/1097	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001097	Projekt wprowadza nową kategorię decyzji na wstępne roboty budowlane oraz precyzuje przepisy dotyczące pozwoleń na budowę i podziału inwestycji jądrowych na etapy. Zmiany te dotyczą osób i podmiotów odpowiedzialnych za przygotowanie i realizację inwestycji w zakresie obiektów energetyki jądrowej.	gemini-3.5-flash-lite
190	10	2580	Rządowy projekt ustawy o osobistych kontach inwestycyjnych	projekt ustawy	projekt dotyczy wprowadzenia nowych, dobrowolnych i bezpłatnych narzędzi do oszczędzania oraz inwestowania - Osobiste Konto Inwestycyjne (OKI). Rozwiązanie umożliwi inwestowanie w akcje, obligacje oraz inne instrumenty finansowe z pełnym zwolnieniem od podatku dochodowego do 100 tys. zł. Dla aktywów oszczędnościowych, takich jak lokaty czy obligacje oszczędnościowe, zwolnienie wyniesie do 25 tys. zł. Projekt stanowi realizację priorytetów rządu. Nowe przepisy zaczną obowiązywać od 2027 roku.	DU/2026/1098	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001098	Projekt wprowadza nowe, bezpłatne Osobiste Konta Inwestycyjne, które pozwalają na oszczędzanie i inwestowanie z częściowym zwolnieniem z podatku dochodowego. Rozwiązanie to dotyczy osób, które chcą odkładać pieniądze na przyszłość i korzystać z nowych instrumentów finansowych.	gemini-3.5-flash-lite
191	10	1526	Poselski projekt ustawy o zmianie ustawy - Prawo oświatowe	projekt ustawy	projekt dotyczy wprowadzenia zasady, zgodnie z którą zakazane jest korzystanie przez uczniów szkół podstawowych na terenie szkół z telefonów komórkowych i innych urządzeń elektronicznych umożliwiających porozumiewanie się na odległość; projekt zakłada możliwość wprowadzenia tego zakazu w szkołach ponadpodstawowych i placówkach, a także możliwość wprowadzenia, w uzasadnionych przypadkach, wyjątków od tego zakazu np. do celów działalności dydaktycznej	DU/2026/1036	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001036	Wprowadzony zostaje zakaz używania telefonów i innych urządzeń komunikacyjnych przez uczniów szkół podstawowych na terenie szkoły, z możliwością stosowania wyjątków w celach naukowych oraz rozszerzenia go na szkoły ponadpodstawowe. Przepisy te dotyczą uczniów, nauczycieli oraz dyrekcji szkół i placówek oświatowych.	gemini-3.5-flash-lite
195	10	2623	Poselski projekt ustawy o zmianie ustawy - Kodeks pracy	projekt ustawy	projekt dotyczy uchylenia przepisów, które ustanowiły po stronie pracodawców obowiązek stosowania w ogłoszeniach o pracę neutralności pod względem płci w zakresie nazw stanowisk pracy oraz treści ogłoszeń o naborze na stanowiska	\N	\N	Projekt znosi obowiązek stosowania neutralności pod względem płci w nazwach stanowisk pracy i treściach ogłoszeń o naborze. Zmiana ta dotyczy wszystkich pracodawców publikujących ogłoszenia o pracę.	gemini-3.5-flash-lite
193	10	2696	Rządowy projekt ustawy o zmianie ustawy o ofercie publicznej i warunkach wprowadzania instrumentów finansowych do zorganizowanego systemu obrotu oraz o spółkach publicznych oraz ustawy o wdrożeniu niektórych przepisów Unii Europejskiej w zakresie równego traktowania	projekt ustawy	projekt dotyczy wyrównania udziału kobiet i mężczyzn w procesach decyzyjnych największych spółek giełdowych, poprzez wprowadzenie przejrzystych zasad wyboru członków zarządów i rad nadzorczych. Rozwiązania mają wspierać równość szans oraz podnosić jakość zarządzania spółkami.	DU/2026/1034	https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20260001034	W największych spółkach giełdowych zostaną wprowadzone przejrzyste zasady wyboru członków zarządów i rad nadzorczych, aby wyrównać udział kobiet i mężczyzn w procesach decyzyjnych. Przepisy te dotyczą osób zarządzających oraz nadzorujących największe spółki giełdowe.	gemini-3.5-flash-lite
196	10	2673	Poselski projekt ustawy o systemie ochrony zdrowia oraz o zmianie niektórych innych ustaw	projekt ustawy	projekt dotyczy m. in. wprowadzenia do polskiego systemu ochrony zdrowia instytucji szpitala wiodącego w regionie, którego zadaniem jest koordynacja opieki szpitalnej na obszarze obejmującym szereg szpitali powiatowych, przeniesienia z Zakładu Ubezpieczeń Społecznych (ZUS) do NFZ kompetencji związanych z zarządzaniem świadczeniami pieniężnymi z tytułu czasowej niezdolności do pracy (ubezpieczenie chorobowe) i modyfikacja zasad finansowania wynagrodzenia za czas choroby, rozszerzenia kręgu osób objętych obowiązkowo ubezpieczeniem chorobowym, poprzez zniesienie dobrowolności podlegania ubezpieczeniu chorobowemu niektórych grup, np. zleceniobiorców, modyfikacji mechanizmu corocznej waloryzacji najniższych wynagrodzeń zasadniczych pracowników podmiotów leczniczych.	\N	\N	Projekt wprowadza szpital wiodący do koordynacji opieki, przenosi obsługę zwolnień lekarskich z ZUS do NFZ, zmienia zasady finansowania chorobowego, obejmuje obowiązkowym ubezpieczeniem chorobowym m.in. zleceniobiorców oraz modyfikuje waloryzację płac w medycynie. Zmiany te dotyczą pacjentów, pracowników ochrony zdrowia, osób pracujących na zlecenie oraz instytucji takich jak ZUS, NFZ i szpitale.	gemini-3.5-flash-lite
\.


--
-- Data for Name: sittings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sittings (id, term, number, title, dates, agenda, description, votings_count, synced_at, votings_synced_at) FROM stdin;
1	10	1	1. Posiedzenie Sejmu RP w dniach 13, 14, 21, 22, 28 i 29 listopada oraz 6, 7, 11, 12, 19, 20 i 21 grudnia 2023 r.	{2023-11-13,2023-11-14,2023-11-21,2023-11-22,2023-11-28,2023-11-29,2023-12-06,2023-12-07,2023-12-11,2023-12-12,2023-12-19,2023-12-20,2023-12-21}	Wybór marszałka Sejmu Rzeczypospolitej Polskiej.\nPoselskie projekty uchwał w sprawie ustalenia liczby wicemarszałków Sejmu Rzeczypospolitej Polskiej (druki nr 1 i 2).\nWybór wicemarszałków Sejmu Rzeczypospolitej Polskiej (druki nr 3, 4, 5, 6, 7 i 8).\nWybór sekretarzy Sejmu (druk nr 9).\nWybór składu osobowego Komisji Regulaminowej, Spraw Poselskich i Immunitetowych (druk nr 11).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie ustalenia liczby członków Komisji do Spraw Służb Specjalnych (druk nr 10).\nWybór posłów-członków Krajowej Rady Sądownictwa (druki nr 12, 13, 14, 15, 16, 17, 18 i 19).\nWybór składów osobowych komisji sejmowych (druk nr 20).\nWybór składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 21).\nWybór składu osobowego Komisji Etyki Poselskiej (druk nr 22).\nWybór składu osobowego Komisji do Spraw Służb Specjalnych (druk nr 23).\nWybór członków Trybunału Stanu (druki nr 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50 i 51).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druk nr 31).\nPowołanie Rzecznika Praw Dziecka (druki nr 52 i 68).\nPowołanie członka Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 (druki nr 53, 54, 60 i 61).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie powołania i wyboru składu osobowego Komisji Nadzwyczajnej do spraw zmian w kodyfikacjach (druk nr 64).\nSprawozdanie Komisji Gospodarki i Rozwoju o poselskim projekcie ustawy o zmianie ustawy o ograniczeniu handlu w niedziele i święta oraz niektóre inne dni (druki nr 63, 67 i 67-A).\nPierwsze czytanie poselskiego projektu uchwały w sprawie powołania Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 roku w formie głosowania korespondencyjnego (druk nr 58).\nPierwsze czytanie poselskiego projektu uchwały w sprawie powołania Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druk nr 57).\nPierwsze czytanie poselskiego projektu uchwały w sprawie powołania Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań, a także występowania nadużyć, zaniedbań i zaniechań w zakresie legalizacji pobytu cudzoziemców na terytorium Rzeczypospolitej Polskiej w okresie od dnia 1 stycznia 2019 r. do dnia 20 listopada 2023 r. (druk nr 56).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o sposobie ustalania najniższego wynagrodzenia zasadniczego niektórych pracowników zatrudnionych w podmiotach leczniczych (druk nr 33).\nSprawozdanie Komisji Zdrowia o obywatelskim projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druki nr 31, 69 i 69-A).\nInformacja Prezesa Rady Ministrów w sprawie protestów polskich transportowców i rolników na granicy polsko-ukraińskiej.\nOdwołanie członków Państwowej Komisji do spraw badania wpływów rosyjskich na bezpieczeństwo wewnętrzne Rzeczypospolitej Polskiej w latach 2007-2022 (druk nr 62).\nZmiany w składach osobowych komisji sejmowych (druk nr 70).\nWybór uzupełniający do składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 76).\nŚlubowanie członka Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustaw w celu wsparcia odbiorców energii elektrycznej, paliw gazowych i ciepła oraz niektórych innych ustaw (druk nr 71).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustaw w celu wsparcia odbiorców energii elektrycznej, paliw gazowych i ciepła oraz niektórych innych ustaw (druki nr 72 i 72-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o funkcjonowaniu górnictwa węgla kamiennego (druki nr 74 i 121).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druk nr 77).\nSprawozdanie Komisji Ustawodawczej o poselskim projekcie uchwały w sprawie powołania Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 roku w formie głosowania korespondencyjnego (druki nr 58 i 78).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Finansów Publicznych o poselskim projekcie ustawy o zmianie ustaw w celu wsparcia odbiorców energii elektrycznej, paliw gazowych i ciepła oraz niektórych innych ustaw (druki nr 72, 72-A i 88).\nWybór Przewodniczącego Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 (druk nr 90).\nZmiany w składach osobowych komisji sejmowych (druk nr 89).\nPrzedstawienie przez Prezesa Rady Ministrów programu działania Rady Ministrów z wnioskiem o udzielenie jej wotum zaufania.\nWybór Prezesa Rady Ministrów (druk nr 95).\nPrzedstawienie przez Prezesa Rady Ministrów programu działania oraz składu Rady Ministrów wraz z wnioskiem w sprawie wyboru członków Rady Ministrów (druk nr 96).\nWybór uzupełniający do składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 91).\nWybór składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 roku w formie głosowania korespondencyjnego (druk nr 93).\nSprawozdanie Komisji Ustawodawczej o poselskim projekcie uchwały w sprawie powołania Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań, a także występowania nadużyć, zaniedbań i zaniechań w zakresie legalizacji pobytu cudzoziemców na terytorium Rzeczypospolitej Polskiej w okresie od dnia 1 stycznia 2019 r. do dnia 20 listopada 2023 r. (druki nr 56 i 80).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o poselskim projekcie ustawy o zmianie ustawy o doręczeniach elektronicznych (druki nr 92 i 94).\nWybór uzupełniający do składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 120).\nZmiany w składach osobowych komisji sejmowych (druk nr 119).\nPierwsze czytanie poselskiego projektu uchwały w sprawie przywrócenia ładu prawnego oraz bezstronności i rzetelności mediów publicznych oraz Polskiej Agencji Prasowej (druk nr 117).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o poselskim projekcie ustawy o szczególnych rozwiązaniach w celu zachowania ważności niektórych orzeczeń o niepełnosprawności oraz orzeczeń o stopniu niepełnosprawności (druki nr 106 i 116).\nŚlubowanie Rzecznika Praw Dziecka.\nPrzedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia 100. rocznicy urodzin Marszałka Sejmu I kadencji Wiesława Chrzanowskiego (druk nr 122).\nZmiany w składach osobowych komisji sejmowych (druk nr 126).\nPierwsze czytanie poselskiego projektu uchwały w sprawie usunięcia skutków kryzysu konstytucyjnego w kontekście pozycji ustrojowej oraz funkcji Krajowej Rady Sądownictwa w demokratycznym państwie prawnym (druki nr 118, 118-A i 118-B).\nPierwsze czytanie rządowego projektu ustawy budżetowej na rok 2024 (druk nr 125).\nWskazanie członków Państwowej Komisji Wyborczej (druki nr 97, 98, 99, 100, 101, 102, 103, 109, 110, 111, 112, 113, 114 i 115).\nWybór składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań, a także występowania nadużyć, zaniedbań i zaniechań w zakresie legalizacji pobytu cudzoziemców na terytorium Rzeczypospolitej Polskiej w okresie od dnia 12 listopada 2019 r. do dnia 20 listopada 2023 r. (druk nr 129).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2023 (druki nr 127 i 130).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2024 (druki nr 128, 128-A, 128-B, 128-BA, 128-C i 131).\nZmiany w składach osobowych komisji sejmowych (druk nr 137).	\N	147	2026-10-03 22:10:52.854297+00	\N
2	10	2	2. Posiedzenie Sejmu RP w dniach 16 i 17 stycznia 2024 r.	{2024-01-16,2024-01-17}	Zmiany w składach osobowych komisji sejmowych (druk nr 161).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2024 (druki nr 142 i 143).\nSprawozdanie Komisji Edukacji, Nauki i Młodzieży o rządowym projekcie ustawy o zmianie ustawy - Przepisy wprowadzające ustawę - Prawo o szkolnictwie wyższym i nauce (druki nr 141, 141-A i 153).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy budżetowej na rok 2024 (druki nr 125 i 144).\nPowołanie Prezesa Urzędu Ochrony Danych Osobowych (druki nr 132, 135, 145 i 148).\nZmiany w składach osobowych komisji sejmowych (druk nr 170).\nSprawozdanie Komisji Ustawodawczej o poselskim projekcie uchwały w sprawie powołania Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druki nr 57 i 79).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nWniosek o wyrażenie wotum nieufności wobec Ministra Kultury i Dziedzictwa Narodowego Bartłomieja Sienkiewicza (druki nr 140 i 150).\nWniosek o odwołanie Wicemarszałka Sejmu Rzeczypospolitej Polskiej pana Krzysztofa Bosaka (druk nr 105).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Okręgowego w Warszawie z dnia 9 stycznia 2024 r. uzupełnionego w dniu 10 stycznia 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Grzegorza Brauna (druk nr 152).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie utworzenia Polskiej Grupy Unii Międzyparlamentarnej (druk nr 162).	\N	28	2026-10-03 22:10:52.854297+00	\N
3	10	3	3. Posiedzenie Sejmu RP w dniu 18 stycznia 2024 r.	{2024-01-18}	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia 170. rocznicy urodzin Jana Ludwika Popławskiego (druk nr 146).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy budżetowej na rok 2024 (druki nr 125, 144 i 144-A) - trzecie czytanie.	\N	15	2026-10-03 22:10:52.854297+00	\N
6	10	6	6. Posiedzenie Sejmu RP w dniach 21 i 22 lutego 2024 r.	{2024-02-21,2024-02-22}	Sprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej (druki nr 199, 200 i 200-A).\nInformacja o działalności Krajowej Rady Sądownictwa w 2022 roku wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 169 i 182).\nSprawozdanie Ministra Sportu i Turystyki z realizacji ustawy z dnia 15 lipca 2020 r. o Polskim Bonie Turystycznym za okres od sierpnia 2020 r. do sierpnia 2023 r. wraz ze stanowiskiem Komisji Kultury Fizycznej, Sportu i Turystyki (druki nr 168 i 189).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nWniosek o wyrażenie wotum nieufności wobec Ministra Sprawiedliwości Adama Bodnara (druki nr 175 i 202).\nPierwsze czytanie obywatelskiego projektu ustawy Tak dla rodziny, nie dla gender (druk nr 25) - kontynuacja.\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy z dnia 24 lipca 2015 r. - Prawo o zgromadzeniach oraz niektórych innych ustaw (druk nr 26) - kontynuacja.\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 185, 197 i 197-A) - trzecie czytanie.\nWybór uzupełniający do składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 roku w formie głosowania korespondencyjnego (druk nr 220).\nInformacja Prezesa Rady Ministrów w sprawie działań rządu w związku z protestem rolników w Polsce.\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie lipiec-grudzień 2023 r. (przewodnictwo Hiszpanii w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 193 i 217).\nZmiany w składach osobowych komisji sejmowych (druk nr 221).\nPrzedstawiony przez Prezydium Sejmu projekt uchwały w sprawie oddania hołdu ofiarom rosyjskiej napaści na Ukrainę (druk nr 214).	\N	19	2026-10-03 22:10:52.854297+00	\N
66	10	66	66. Posiedzenie Sejmu RP w dniach 6, 7, 8 i 9 października 2026 r.	{2026-10-06,2026-10-07,2026-10-08,2026-10-09}	Sprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa oraz Komisji Rolnictwa i Rozwoju Wsi o poselskich projektach ustaw: - o rekompensatach za szkody wyrządzone przez ptaki,- o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 258, 1387, 1661 i 1661-A) - trzecie czytanie - sprawozdawca poseł Mirosław Maliszewski.\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o przywróceniu prawa do niezależnego i bezstronnego sądu ustanowionego na podstawie prawa przez uregulowanie skutków uchwał Krajowej Rady Sądownictwa podjętych w latach 2018-2025 (druki nr 2107 i 3019) - sprawozdawca poseł Iwona Karolewska.\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o pomocy beneficjentom – osobom fizycznym poszkodowanym w związku z realizacją Programu Priorytetowego „Czyste Powietrze” (druki nr 3007 i 3104) - sprawozdawca poseł Gabriela Lenartowicz.\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy – Kodeks postępowania karnego oraz ustawy o doręczeniach elektronicznych (druki nr 2800 i 3059) - sprawozdawca poseł Barbara Dolniak.\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy o zmianie ustawy o narodowym zasobie archiwalnym i archiwach (druki nr 3000 i 3081) - sprawozdawca poseł Urszula Augustyn.\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Republiką Filipin o przekazywaniu osób skazanych, podpisanej w Warszawie dnia 8 czerwca 2026 r. (druki nr 3013 i 3098) - sprawozdawca poseł Anna Wojciechowska.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy – Kodeks postępowania karnego oraz ustawy – Kodeks karny skarbowy (druk nr 3087) - uzasadnia Minister Sprawiedliwości.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie uczczenia Królowej Anny Jagiellonki w 430. rocznicę Jej śmierci (druki nr 3091 i 3103) - sprawozdawca poseł Piotr Babinetz.\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Regionalnego w Poznaniu z dnia 21 lipca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Łukasza Mejzy (druk nr 3116) - sprawozdawca poseł Maria Joanna Koźlakiewicz.\nPierwsze czytanie rządowego projektu ustawy budżetowej na rok 2027 (druk nr ...) - uzasadnia Minister Finansów i Gospodarki.\nPierwsze czytanie rządowego projektu ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2027 (druk nr ...) - uzasadnia Minister Finansów i Gospodarki.\nSprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy – Prawo o ruchu drogowym oraz niektórych innych ustaw (druki nr 3101 i )\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o zmianie ustawy o rybołówstwie morskim oraz ustawy o organizacji rynku rybnego (druki nr 2999 i ) - sprawozdawca poseł Dorota Arciszewska-Mielewczyk.\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o usługach hotelarskich oraz usługach pilotów wycieczek i przewodników turystycznych oraz niektórych innych ustaw (druki nr 2865, 2865-A i )\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druki nr 3074 i )\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej oraz Komisji Infrastruktury o rządowym projekcie ustawy o usprawnieniu procesu inwestycyjnego w zakresie kluczowych inwestycji infrastrukturalnych (druki nr 3030 i ) - sprawozdawca poseł Artur Jarosław Łącki.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy o zabezpieczeniu socjalnym osób wykonujących zawód artystyczny (druki nr 2644 i ) - sprawozdawca poseł Krzysztof Mieszkowski.\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy – Prawo o ustroju sądów powszechnych (druki nr 2868 i ) - sprawozdawca poseł Sylwia Bielawska.\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o ewidencji ludności (druki nr 2996 i ) - sprawozdawca poseł Waldemar Sługocki.\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy – Prawo ochrony środowiska oraz niektórych innych ustaw (druki nr 3001 i ) - sprawozdawca poseł Elżbieta Burkiewicz.\nSprawozdanie Komisji Finansów Publicznych o poselskim projekcie ustawy o zmianie ustawy o Krajowej Administracji Skarbowej (druki nr 604 i ) - sprawozdawca poseł Katarzyna Kierzek-Koperska.\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy – Kodeks postępowania cywilnego (druki nr 3011 i )\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie ustawy o Żandarmerii Wojskowej i wojskowych organach porządkowych oraz niektórych innych ustaw (druki nr 2869 i )\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2026 (druki nr i )\nSprawozdanie Komisji Edukacji i Nauki o uchwale Senatu w sprawie ustawy o Uniwersytecie Mazowieckim w Płocku (druki nr i )\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr i )\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy – Prawo wodne (druki nr i )\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta (druki nr i )\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka (druki nr i )\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy – Kodeks spółek handlowych oraz ustawy o zmianie ustawy – Kodeks spółek handlowych oraz niektórych innych ustaw (druki nr i )\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy – Kodeks wyborczy (druki nr i )\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie ustawy o związkach zawodowych oraz ustawy o informowaniu pracowników i przeprowadzaniu z nimi konsultacji (druki nr i )\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach (druki nr i )\nRozstrzygnięcie przez Sejm wniosku o uzupełnienie porządku dziennego o punkt: Pierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druk nr 2724)	Podczas tego posiedzenia Sejm zajął się projektem budżetu państwa na 2027 rok oraz propozycjami zmian w podatku od towarów i usług. Posłowie omawiali także kwestie bezpieczeństwa w ruchu drogowym, ochrony praw konsumentów, wsparcia dla osób poszkodowanych w programie „Czyste Powietrze” oraz zabezpieczenia socjalnego artystów.	0	2026-10-03 22:10:52.854297+00	\N
7	10	7	7. Posiedzenie Sejmu RP w dniach 6, 7 i 8 marca 2024 r.	{2024-03-06,2024-03-07,2024-03-08}	Sprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy - Prawo pocztowe oraz ustawy o zmianie ustawy - Prawo pocztowe (druki nr 201 i 225).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowej Radzie Sądownictwa (druk nr 219).\nPierwsze czytanie poselskiego projektu uchwały w sprawie usunięcia skutków kryzysu konstytucyjnego lat 2015-2023 w kontekście działalności Trybunału Konstytucyjnego (druk nr 226).\nInformacja o istotnych problemach wynikających z działalności i orzecznictwa Trybunału Konstytucyjnego w 2022 r. wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka oraz Komisji Ustawodawczej (druki nr 84 i 147).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o zmianie zakresu obowiązywania Traktatu o konwencjonalnych siłach zbrojnych w Europie, podpisanego w Paryżu dnia 19 listopada 1990 r. (druki nr 204 i 230).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 209).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie nałożenia sankcji na import rosyjskiej i białoruskiej żywności i produktów rolnych do UE (druki nr 228 i 239).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o konsumenckiej pożyczce lombardowej oraz o zmianie niektórych innych ustaw (druk nr 208).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks cywilny oraz ustawy o kredycie konsumenckim (druk nr 227).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wykroczeń (druk nr 210).\nInformacja Prezesa Rady Ministrów w sprawie działań rządu w związku z protestem rolników w Polsce - głosowanie.\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie lipiec-grudzień 2023 r. (przewodnictwo Hiszpanii w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 193 i 217) - kontynuacja.\nZmiany w składach osobowych komisji sejmowych (druk nr 240).\nInformacja Rządu dotycząca możliwości popełnienia przestępstwa z art. 231 Kodeksu karnego przez Prezesa Rady Ministrów oraz Ministra Właściwego do Spraw Europejskich, polegającego na zaniechaniu urzędniczym, które doprowadziło do bezpowrotnej utraty przez Polskę zaliczki z Krajowego Planu Odbudowy w kwocie 4,7 mld euro.	\N	22	2026-10-03 22:10:52.854297+00	\N
8	10	8	8. Posiedzenie Sejmu RP w dniach 20 i 21 marca 2024 r.	{2024-03-20,2024-03-21}	Zmiany w składach osobowych komisji sejmowych (druk nr 256).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o: - poselskim projekcie ustawy o zmianie ustawy o konsumenckiej pożyczce lombardowej oraz o zmianie niektórych innych ustaw, - rządowym projekcie ustawy o zmianie ustawy - Kodeks cywilny oraz ustawy o kredycie konsumenckim (druki nr 208, 227, 250 i 250-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o rachunkowości oraz niektórych innych ustaw (druki nr 242 i 252).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 90. rocznicy uchwalenia pierwszej ustawy o ochronie przyrody w Polsce (druki nr 234, 249 i 249-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o mniejszościach narodowych i etnicznych oraz o języku regionalnym oraz niektórych innych ustaw (druk nr 233).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 194).\nInformacja Rządu dotycząca możliwości popełnienia przestępstwa z art. 231 Kodeksu karnego przez Prezesa Rady Ministrów oraz Ministra Właściwego do Spraw Europejskich, polegającego na zaniechaniu urzędniczym, które doprowadziło do bezpowrotnej utraty przez Polskę zaliczki z Krajowego Planu Odbudowy w kwocie 4,7 mld euro - głosowanie.\nPytania w sprawach bieżących.\nInformacja bieżąca.\nInformacja o działalności Rzecznika Praw Dziecka w 2023 roku oraz uwagi o stanie przestrzegania praw dziecka w Polsce wraz ze sprawozdaniem Komisji Edukacji, Nauki i Młodzieży oraz Komisji Polityki Społecznej i Rodziny (druki nr 158 i 264).\nSprawozdanie Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo pocztowe oraz ustawy o zmianie ustawy - Prawo pocztowe (druki nr 265 i 266).	\N	21	2026-10-03 22:10:52.854297+00	\N
9	10	9	9. Posiedzenie Sejmu RP w dniach 10, 11 i 12 kwietnia 2024 r.	{2024-04-10,2024-04-11,2024-04-12}	Sprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Krajowej Radzie Sądownictwa (druki nr 219, 280 i 280-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o wsparciu kredytobiorców, którzy zaciągnęli kredyt mieszkaniowy i znajdują się w trudnej sytuacji finansowej oraz ustawy o finansowaniu społecznościowym dla przedsięwzięć gospodarczych i pomocy kredytobiorcom (druki nr 248 i 286).\nWniosek o wyrażenie wotum nieufności wobec Ministra Spraw Wewnętrznych i Administracji Marcina Kierwińskiego (druki nr 255 i 279).\nZmiany w składach osobowych komisji sejmowych (druk nr 304).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie ustawy o uchyleniu ustawy z dnia 13 lipca 2023 r. o zmianie ustawy o ochronie zabytków i opiece nad zabytkami (druki nr 257, 285 i 285-A).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zapewnianiu spełniania wymagań dostępności niektórych produktów i usług przez podmioty gospodarcze (druki nr 241, 288 i 288-A).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym oraz ustawy - Kodeks wyborczy (druki nr 75 i 287).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 176).\nPierwsze czytanie poselskiego projektu ustawy o bezpiecznym przerywaniu ciąży (druk nr 177).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o planowaniu rodziny, ochronie płodu ludzkiego i warunkach dopuszczalności przerywania ciąży (druk nr 223).\nPierwsze czytanie poselskiego projektu ustawy o świadomym rodzicielstwie (druk nr 224).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o ochronie zdrowia przed następstwami używania tytoniu i wyrobów tytoniowych (druki nr 277 i 290).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Protokołu między Rzecząpospolitą Polską a Ukrainą o zmianie Umowy między Rzecząpospolitą Polską a Ukrainą o pomocy prawnej i stosunkach prawnych w sprawach cywilnych i karnych z dnia 24 maja 1993 r., podpisanego w Warszawie dnia 19 września 2023 r. (druki nr 231 i 251).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowej Administracji Skarbowej oraz niektórych innych ustaw (druk nr 268).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druk nr 275).\nInformacja Ministra Spraw Zagranicznych na temat śmierci Damiana Sobola podczas niesienia przez niego pomocy humanitarnej ofiarom konfliktu w Strefie Gazy.\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o rachunkowości oraz niektórych innych ustaw (druki nr 278 i 291).\nOdwołanie członków Komisji do spraw reprywatyzacji nieruchomości warszawskich (druki nr 270, 271, 272, 273, 281, 282, 283 i 284).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie powołania i wyboru składu osobowego Komisji Nadzwyczajnej do rozpatrzenia projektów ustaw dotyczących prawa do przerywania ciąży (druk nr 306).\nZmiany w składach osobowych komisji sejmowych (druk nr 307).	\N	40	2026-10-03 22:10:52.854297+00	\N
10	10	10	10. Posiedzenie Sejmu RP w dniach 24, 25 i 26 kwietnia 2024 r.	{2024-04-24,2024-04-25,2024-04-26}	Sprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie niektórych ustaw związanych z funkcjonowaniem administracji rządowej (druki nr 269, 269-A i 292).\nSprawozdanie Komisji Mniejszości Narodowych i Etnicznych o poselskim projekcie ustawy o zmianie ustawy o mniejszościach narodowych i etnicznych oraz o języku regionalnym oraz niektórych innych ustaw (druki nr 233 i 289).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o pomocy społecznej oraz niektórych innych ustaw (druki nr 274, 305 i 305-A).\nInformacja Prokuratora Generalnego Rzeczypospolitej Polskiej o łącznej liczbie osób, wobec których został skierowany wniosek o zarządzenie kontroli i utrwalania rozmów lub wniosek o zarządzenie kontroli operacyjnej w 2023 r. (druk nr 308).\nPierwsze czytanie poselskiego projektu ustawy o Trybunale Konstytucyjnym (druk nr 253).\nPierwsze czytanie poselskiego projektu ustawy - Przepisy wprowadzające ustawę o Trybunale Konstytucyjnym (druk nr 254).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o wspieraniu rodziny i systemie pieczy zastępczej oraz ustawy o promocji zatrudnienia i instytucjach rynku pracy (druki nr 293 i 312).\nInformacja Ministra Spraw Zagranicznych o zadaniach polskiej polityki zagranicznej w 2024 roku.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o wymianie informacji podatkowych z innymi państwami oraz niektórych innych ustaw (druk nr 311).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 29).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zapewnianiu spełniania wymagań dostępności niektórych produktów i usług przez podmioty gospodarcze (druki nr 309 i 334).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o samorządzie gminnym oraz niektórych innych ustaw (druki nr 310 i 336).\nZmiany w składach osobowych komisji sejmowych (druk nr 339).\nPierwsze czytanie poselskiego projektu ustawy o zmianie niektórych ustaw w celu naprawy ładu korporacyjnego w spółkach z udziałem Skarbu Państwa (druk nr 261).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie obywatelskiego projektu ustawy o ochronie własności w Rzeczypospolitej Polskiej przed roszczeniami dotyczącymi mienia bezdziedzicznego (druk nr 24).\nSprawozdanie Komisji do Spraw Unii Europejskiej o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie uczczenia 20. rocznicy członkostwa Polski w Unii Europejskiej (druki nr 315 i 332).\nPrzedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia 100. rocznicy wprowadzenia polskiego złotego (druk nr 340).	\N	26	2026-10-03 22:10:52.854297+00	\N
11	10	11	11. Posiedzenie Sejmu RP w dniach 8, 9 i 15 maja 2024 r.	{2024-05-08,2024-05-09,2024-05-15}	Zmiany w składach osobowych komisji sejmowych (druk nr 345).\nPierwsze czytanie rządowego projektu ustawy zmieniającej ustawę o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druk nr 341).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz niektórych innych ustaw (druk nr 342).\nPierwsze czytanie poselskiego projektu ustawy o zmianie niektórych ustaw w celu naprawy ładu korporacyjnego w spółkach z udziałem Skarbu Państwa (druk nr 261) - kontynuacja.\nPierwsze czytanie obywatelskiego projektu ustawy o ochronie własności w Rzeczypospolitej Polskiej przed roszczeniami dotyczącymi mienia bezdziedzicznego (druk nr 24) - kontynuacja.\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o Krajowej Administracji Skarbowej oraz niektórych innych ustaw (druki nr 268 i 335).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druki nr 275 i 333).\nPierwsze czytanie rządowego projektu ustawy o wspieraniu rodziców w aktywności zawodowej oraz w wychowaniu dziecka - "Aktywny rodzic" (druk nr 319).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wyborczy (druk nr 296).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druki nr 341 i 373).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks pracy (druk nr 318).\nWniosek o wyrażenie wotum nieufności wobec Minister Klimatu i Środowiska Pauliny Hennig-Kloski (druki nr 344 i 372).\nPierwsze czytanie rządowego projektu ustawy o czasowym ograniczeniu cen za energię elektryczną, gaz ziemny i ciepło systemowe oraz o bonie energetycznym (druk nr 346).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 322).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz niektórych innych ustaw (druki nr 342, 374 i 374-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o czasowym ograniczeniu cen za energię elektryczną, gaz ziemny i ciepło systemowe oraz o bonie energetycznym (druki nr 346, 380 i 380-A).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o zmianie zakresu obowiązywania Umowy o utworzeniu Europejskiego Banku Odbudowy i Rozwoju, sporządzonej w Paryżu dnia 29 maja 1990 r. (druki nr 303 i 314).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o zasadach prowadzenia polityki rozwoju oraz niektórych innych ustaw (druki nr 320 i 375).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o wspieraniu rodziców w aktywności zawodowej oraz w wychowaniu dziecka - "Aktywny rodzic" (druki nr 319 i 376).\nInformacja Ministra Spraw Wewnętrznych i Administracji o podjętych działaniach w celu wyjaśnienia przyczyn i okoliczności wybuchów pożarów w dniach 10-13 maja 2024 r. w różnych miejscach w Polsce.\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw związanych z funkcjonowaniem administracji rządowej (druki nr 377 i 383).\nZmiany w składach osobowych komisji sejmowych (druk nr 390).	\N	58	2026-10-03 22:10:52.854297+00	\N
12	10	12	12. Posiedzenie Sejmu RP w dniach 22 i 23 maja 2024 r.	{2024-05-22,2024-05-23}	Zmiany w składach osobowych komisji sejmowych (druk nr 402).\nInformacja Ministra Obrony Narodowej w sprawie stanu bezpieczeństwa Rzeczypospolitej Polskiej.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o wymianie informacji podatkowych z innymi państwami oraz niektórych innych ustaw (druki nr 311, 388 i 388-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o ochronie sygnalistów (druki nr 317, 381 i 381-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o Planie Strategicznym dla Wspólnej Polityki Rolnej na lata 2023-2027 (druki nr 382 i 400).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy (druki nr 318 i 401).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPowołanie członków Komisji do spraw reprywatyzacji nieruchomości warszawskich (druki nr 366, 367, 368, 369, 370, 371, 379, 393, 394, 395, 396, 397, 398 i 399).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o bonie energetycznym oraz o zmianie niektórych ustaw w celu ograniczenia cen energii elektrycznej, gazu ziemnego i ciepła systemowego (druki nr 416 i 417).\nPrzedstawiony przez Ministra Zdrowia dokument: Narodowy Program Chorób Układu Krążenia na lata 2022-2032 - Sprawozdanie za rok 2022 wraz ze stanowiskiem Komisji Zdrowia (druki nr 82 i 246).	\N	35	2026-10-03 22:10:52.854297+00	\N
13	10	13	13. Posiedzenie Sejmu RP w dniach 12, 13 i 14 czerwca 2024 r.	{2024-06-12,2024-06-13,2024-06-14}	Sprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji do Spraw Unii Europejskiej o rządowym projekcie ustawy o szczególnych rozwiązaniach w związku z przygotowywaniem i sprawowaniem przez Rzeczpospolitą Polską przewodnictwa w Radzie Unii Europejskiej w I połowie 2025 roku (druki nr 347, 391 i 391-A).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks wyborczy (druki nr 296, 392 i 392-A).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o działaniach organów władzy państwowej na wypadek zewnętrznego zagrożenia bezpieczeństwa państwa (druk nr 405).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ograniczeniu handlu w niedziele i święta oraz w niektóre inne dni oraz ustawy - Kodeks pracy (druk nr 384).\nPierwsze czytanie poselskiego projektu ustawy o uchyleniu ustawy o Państwowej Komisji do spraw badania wpływów rosyjskich na bezpieczeństwo wewnętrzne Rzeczypospolitej Polskiej w latach 2007-2022 (druk nr 351).\nPierwsze czytanie rządowego projektu ustawy - Prawo komunikacji elektronicznej (druk nr 423).\nPierwsze czytanie rządowego projektu ustawy - Przepisy wprowadzające ustawę - Prawo komunikacji elektronicznej (druk nr 424).\nŚlubowanie członka Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15.\nPrzedstawiony przez Ministra Zdrowia dokument: Narodowy Program Chorób Układu Krążenia na lata 2022-2032 - Sprawozdanie za rok 2022 wraz ze stanowiskiem Komisji Zdrowia (druki nr 82 i 246) - głosowanie.\nSprawozdanie Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o ochronie sygnalistów (druki nr 427 i 455).\nWybór uzupełniający do składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 roku w formie głosowania korespondencyjnego (druk nr 457).\nWybór uzupełniający do składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań, a także występowania nadużyć, zaniedbań i zaniechań w zakresie legalizacji pobytu cudzoziemców na terytorium Rzeczypospolitej Polskiej w okresie od dnia 12 listopada 2019 r. do dnia 20 listopada 2023 r. (druk nr 458).\nWybór uzupełniający do składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druk nr 459).\nZmiany w składach osobowych komisji sejmowych (druk nr 460).\nPrzedstawiony przez Ministra Infrastruktury dokument: Informacja z wykonania w 2023 roku programu wieloletniego pn.: "Program ochrony brzegów morskich" oraz harmonogram prac na rok 2024 wraz ze stanowiskiem Komisji Gospodarki Morskiej i Żeglugi Śródlądowej (druki nr 298 i 338).	\N	35	2026-10-03 22:10:52.854297+00	\N
14	10	14	14. Posiedzenie Sejmu RP w dniach 26, 27 i 28 czerwca 2024 r.	{2024-06-26,2024-06-27,2024-06-28}	Sprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks karny (druki nr 209 i 247).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o zapewnianiu dostępności osobom ze szczególnymi potrzebami (druki nr 430, 468 i 468-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o dochodzeniu roszczeń w postępowaniu grupowym oraz niektórych innych ustaw (druk nr 437).\nZmiany w składach osobowych komisji sejmowych (druk nr 488).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu usprawnienia działań Sił Zbrojnych Rzeczypospolitej Polskiej, Policji oraz Straży Granicznej na wypadek zagrożenia bezpieczeństwa państwa (druki nr 471 i 471-A).\nSprawozdanie Komisji Kultury i Środków Przekazu o rządowym projekcie ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz niektórych innych ustaw (druki nr 406, 467 i 467-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od czynności cywilnoprawnych (druki nr 419 i 419-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 410).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 409).\nSprawozdanie Komisji do Spraw Unii Europejskiej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o partnerstwie między Unią Europejską i jej państwami członkowskimi, z jednej strony, a członkami Organizacji Państw Afryki, Karaibów i Pacyfiku, z drugiej strony, sporządzonej w Apii dnia 15 listopada 2023 r. (druki nr 348 i 428).\nSprawozdanie Komisji do Spraw Unii Europejskiej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Zaawansowanej umowy ramowej między Unią Europejską i jej państwami członkowskimi, z jednej strony, a Republiką Chile, z drugiej strony, sporządzonej w Brukseli dnia 13 grudnia 2023 r. (druki nr 420 i 429).\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy między Rządem Rzeczypospolitej Polskiej a Organizacją Narodów Zjednoczonych w sprawie utworzenia Przedstawicielstwa Biura Narodów Zjednoczonych do spraw Obsługi Projektów w Warszawie, podpisanej w Nowym Jorku dnia 21 września 2023 r. (druki nr 276 i 456).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 446 i 495).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Krajowego z dnia 28 maja 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Michała Piotra Wosia (druk nr 484).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 10 października 2022 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej za wykroczenie poseł Anity Kucharskiej-Dziedzic (druk nr 411).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 7 września 2022 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej za wykroczenie posła Grzegorza Gaży (druk nr 413).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 29 grudnia 2023 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej za wykroczenie posła Grzegorza Gaży (druk nr 414).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Głównego Inspektora Transportu Drogowego z dnia 20 maja 2022 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej za wykroczenie Prezesa Najwyższej Izby Kontroli Mariana Banasia (druk nr 461).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Łukasza Konrada Piebiaka z dnia 17 lutego 2021 r. przedłożonego przez adwokata Krzysztofa Wąsowskiego, uzupełnionego w dniu 1 kwietnia 2021 r., o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej poseł Katarzyny Lubnauer (druk nr 462).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ograniczeniu handlu w niedziele i święta oraz w niektóre inne dni oraz ustawy - Kodeks pracy (druk nr 384) - kontynuacja.\nWybór uzupełniający posła członka Krajowej Rady Sądownictwa (druki nr 465, 466, 489 i 490).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Prawo budowlane oraz niektórych innych ustaw (druk nr 438).\nSprawozdanie Ministra Spraw Wewnętrznych i Administracji z realizacji w 2023 r. ustawy z dnia 24 marca 1920 r. o nabywaniu nieruchomości przez cudzoziemców wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 299 i 313).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o finansach publicznych oraz niektórych innych ustaw (druki nr 472, 491 i 491-A).\nWybór uzupełniający do składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 roku w formie głosowania korespondencyjnego (druk nr 502).\nZmiany w składach osobowych komisji sejmowych (druk nr 501).	\N	39	2026-10-03 22:10:52.854297+00	\N
15	10	15	15. Posiedzenie Sejmu RP w dniach 11 i 12 lipca 2024 r.	{2024-07-11,2024-07-12}	Sprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks karny (druki nr 176 i 477).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy - Prawo komunikacji elektronicznej (druki nr 423, 506 i 506-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy - Przepisy wprowadzające ustawę - Prawo komunikacji elektronicznej (druki nr 424, 507 i 507-A).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie niektórych ustaw w celu usprawnienia działań Sił Zbrojnych Rzeczypospolitej Polskiej, Policji oraz Straży Granicznej na wypadek zagrożenia bezpieczeństwa państwa (druki nr 471, 471-A,505 i 505-A).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustaw w celu wsparcia odbiorców energii elektrycznej, paliw gazowych i ciepła oraz niektórych innych ustaw (druk nr 494).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Krajowego z dnia 19 czerwca 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Marcina Romanowskiego (druk nr 504).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o poselskim projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 508, 511 i 511-A).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Porozumienia między Rządem Rzeczypospolitej Polskiej a Rządem Królestwa Norwegii o zakończeniu obowiązywania Umowy między Rządem Rzeczypospolitej Polskiej a Rządem Królestwa Norwegii w sprawie popierania i wzajemnej ochrony inwestycji, podpisanej w Warszawie dnia 5 czerwca 1990 r., zawartego dnia 27 czerwca 2023 r. i 18 lipca 2023 r. (druki nr 294 i 476).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie uczczenia 48. rocznicy protestów robotników przeciwko władzy komunistycznej w czerwcu 1976 r. w Radomiu, Ursusie i Płocku (druki nr 478 i 514).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie 68. rocznicy Poznańskiego Czerwca 1956 (druki nr 480 i 515).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Radzie Sądownictwa (druki nr 378 i 510).\nSprawozdanie Komisji Kultury i Środków Przekazu o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie upamiętnienia ofiar ludobójstwa dokonanego na Tatarach krymskich (druki nr 525 i 535).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Tomasza Piotrowskiego reprezentowanego przez adwokata Macieja Syzdoła z dnia 6 maja 2024 r. o wyrażenie zgody na pociągniecie do odpowiedzialności karnej posła Mariusza Błaszczaka (druk nr 512).\nZmiany w składach osobowych komisji sejmowych (druk nr 537).	\N	98	2026-10-03 22:10:52.854297+00	\N
16	10	16	16. Posiedzenie Sejmu RP w dniach 23, 24, 25 i 26 lipca 2024 r.	{2024-07-23,2024-07-24,2024-07-25,2024-07-26}	Przedstawiony przez Prezydium Sejmu projekt uchwały w 80. rocznicę wybuchu Powstania Warszawskiego (druk nr 557).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o poselskim projekcie ustawy o Trybunale Konstytucyjnym (druki nr 253, 543 i 543-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o poselskim projekcie ustawy - Przepisy wprowadzające ustawę o Trybunale Konstytucyjnym (druki nr 254, 544 i 544-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o poselskim projekcie ustawy o zmianie ustawy o gospodarowaniu nieruchomościami rolnymi Skarbu Państwa oraz ustawy o wstrzymaniu sprzedaży nieruchomości Zasobu Własności Rolnej Skarbu Państwa (druki nr 497, 518 i 518-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o poselskim projekcie ustawy o uchyleniu ustawy o Państwowej Komisji do spraw badania wpływów rosyjskich na bezpieczeństwo wewnętrzne Rzeczypospolitej Polskiej w latach 2007-2022 (druki nr 351 i 540).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o dochodzeniu roszczeń w postępowaniu grupowym oraz niektórych innych ustaw (druki nr 437 i 539).\nPrzedstawiony przez Prezesa Rady Ministrów dokument: "Informacja o realizacji ustawy o specjalnych strefach ekonomicznych. Stan na 31 grudnia 2023 r." wraz ze stanowiskiem Komisji Gospodarki i Rozwoju (druki nr 426 i 517).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o: - poselskim projekcie ustawy o zmianie ustawy o świadczeniu pieniężnym z tytułu pełnienia funkcji sołtysa, - senackim projekcie ustawy o zmianie ustawy o świadczeniu pieniężnym z tytułu pełnienia funkcji sołtysa oraz ustawy o świadczeniu uzupełniającym dla osób niezdolnych do samodzielnej egzystencji (druki nr 211, 407 i 567).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 546 i 551).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o rządowym projekcie ustawy o zmianie ustawy o sporcie (druki nr 545 i 549).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o dokumentach publicznych (druki nr 547 i 565).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o publicznej służbie krwi (druki nr 548 i 563).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem 1000-lecia Królestwa Polskiego (druki nr 354 i 473).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem Stefana Żeromskiego (druki nr 329 i 474).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem Olgi Boznańskiej (druki nr 358 i 475).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem Polskich Oficerów z Katynia, Miednoje i Ostaszkowa (druki nr 353 i 492).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem Antoniego Słonimskiego (druki nr 355 i 493).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem Franciszka Duszeńko (druki nr 359 i 531).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 Rokiem Generała Kazimierza Sosnkowskiego (druki nr 360 i 532).\nZmiany w składach osobowych komisji sejmowych (druk nr 570).\nWybór składu osobowego Komisji do Spraw Dzieci i Młodzieży (druk nr 571).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Obrony Narodowej o poselskich projektach uchwał: - w sprawie obrony żołnierzy i funkcjonariuszy strzegących granicy Rzeczypospolitej Polskiej, - w sprawie wyrażenia uznania dla służby i poświęcenia żołnierzy i funkcjonariuszy strzegących bezpieczeństwa granic Rzeczypospolitej Polskiej (druki nr 403, 404 i 521).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Finansów Publicznych w sprawie sprawozdania z wykonania budżetu państwa za okres od 1 stycznia do 31 grudnia 2023 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2023 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 425, 464 i 538).\nSprawozdanie Komisji Finansów Publicznych o przedstawionej przez Prezesa Rady Ministrów "Informacji o poręczeniach i gwarancjach udzielonych w 2023 roku przez Skarb Państwa, niektóre osoby prawne oraz Bank Gospodarstwa Krajowego" (druki nr 387 i 487).\nSprawozdanie z działalności Narodowego Banku Polskiego w 2023 roku wraz ze sprawozdaniem Komisji Finansów Publicznych (druki nr 448 i 486).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o obywatelskim projekcie ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych oraz niektórych innych ustaw w celu wprowadzenia renty wdowiej (druki nr 32, 503 i 503-A).\nSprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2023 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2023 roku wraz z komisyjnym projektem uchwały (druki nr 451 i 520).\nInformacja o działalności Rady Mediów Narodowych w 2023 roku wraz z komisyjnym projektem uchwały (druki nr 452 i 519).\nSprawozdanie Komisji do Spraw Kontroli Państwowej oraz Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie zlecenia Najwyższej Izbie Kontroli przeprowadzenia kontroli działalności Krajowej Rady Radiofonii i Telewizji oraz innych odpowiednich organów w zakresie realizacji konstytucyjnych i ustawowych obowiązków stania na straży wolności słowa, prawa do informacji, interesu publicznego w radiofonii i telewizji oraz zapewnienia otwartego i pluralistycznego charakteru radiofonii i telewizji (druki nr 529 i 580).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druk nr 552).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks karny oraz niektórych innych ustaw (druki nr 577 i 579).\nSprawozdanie Komisji Kultury i Środków Przekazu o uchwale Senatu w sprawie ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych, ustawy o ochronie baz danych oraz ustawy o zbiorowym zarządzaniu prawami autorskimi i prawami pokrewnymi (druki nr 576 i 581).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu usprawnienia działań Sił Zbrojnych Rzeczypospolitej Polskiej, Policji oraz Straży Granicznej na wypadek zagrożenia bezpieczeństwa państwa (druki nr 584 i 587).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskich projektach uchwał: - w sprawie uczczenia 81. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich, - w sprawie oddania hołdu w 81. rocznicę Krwawej Niedzieli ofiarom ludobójstwa dokonanego przez szowinistów ukraińskich na obywatelach II Rzeczypospolitej Polskiej w latach 1943-1945 (druki nr 533, 536, 569 i 569-A).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie uczczenia 119. rocznicy stracenia Stefana Okrzei (druki nr 568 i 572).\nOdwołanie członków Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 - Pani Hanny Elżanowskiej oraz Pani Barbary Chrobak (druki nr 343 i 574)*).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 389 i 575).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o gospodarowaniu nieruchomościami rolnymi Skarbu Państwa oraz ustawy o wstrzymaniu sprzedaży nieruchomości Zasobu Własności Rolnej Skarbu Państwa oraz o zmianie niektórych ustaw (druki nr 586 i 588).\nZmiany w składach osobowych komisji sejmowych (druk nr 585).	\N	85	2026-10-03 22:10:52.854297+00	\N
17	10	17	17. Posiedzenie Sejmu RP w dniach 11, 12 i 13 września 2024 r.	{2024-09-11,2024-09-12,2024-09-13}	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie potępienia uprowadzeń ukraińskich dzieci (druk nr 619).\nZmiany w składach osobowych komisji sejmowych (druk nr 638).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wyborczy (druk nr 556).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o delegowaniu kierowców w transporcie drogowym oraz niektórych innych ustaw (druk nr 602).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz niektórych innych ustaw (druki nr 601 i 601-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 599).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych oraz ustawy o działalności ubezpieczeniowej i reasekuracyjnej (druki nr 553, 639 i 639-A).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 45. rocznicy powstania Konfederacji Polski Niepodległej (druki nr 615 i 637).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw związanych z udzielaniem pomocy de minimis (druk nr 600).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druk nr 522).\nSprawozdanie z działalności Najwyższej Izby Kontroli w 2023 roku wraz z opinią Komisji do Spraw Kontroli Państwowej (druki nr 483 i 566).\nInformacja o działalności Krajowej Rady Sądownictwa w 2023 roku wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 450 i 509).\nPierwsze czytanie rządowego projektu ustawy o dochodach jednostek samorządu terytorialnego (druk nr 622).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o Trybunale Konstytucyjnym (druki nr 590 i 635).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy - Przepisy wprowadzające ustawę o Trybunale Konstytucyjnym (druki nr 591 i 636).\nPowołanie członków Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 (druki nr 592, 593, 594, 595, 596, 598, 624, 625, 626, 627, 628 i 630).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o obywatelskim projekcie ustawy o zmianie ustawy o rencie socjalnej (druki nr 30 i 583).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ochotniczych strażach pożarnych oraz niektórych innych ustaw (druk nr 603).	\N	54	2026-10-03 22:10:52.854297+00	\N
18	10	18	18. Posiedzenie Sejmu RP w dniach 25, 26 i 27 września oraz 1 października 2024 r.	{2024-09-25,2024-09-26,2024-09-27,2024-10-01}	Ślubowanie członków Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ochotniczych strażach pożarnych oraz niektórych innych ustaw (druk nr 603) - kontynuacja.\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o komisyjnym projekcie ustawy o zmianie ustawy o działalności lobbingowej w procesie stanowienia prawa (druki nr 650, 663 i 663-A).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o delegowaniu kierowców w transporcie drogowym oraz niektórych innych ustaw (druki nr 602, 623 i 623-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o poselskim projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 665 i 667).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz niektórych innych ustaw (druki nr 601, 601-A, 657, 657-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o paszach (druki nr 606, 648 i 648-A).\nZmiany w składach osobowych komisji sejmowych (druk nr 676).\nZmiany w składzie osobowym Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druk nr 677).\nInformacja Prezesa Rady Ministrów i członków Rady Ministrów na temat powodzi we wrześniu 2024 r. w południowo-zachodniej części terytorium Rzeczypospolitej Polskiej, działaniach podjętych w celu zapobieżenia jej skutkom oraz w celu ich usunięcia.\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 672 i 672-A).\nPierwsze czytanie poselskiego projektu ustawy o szczególnych rozwiązaniach związanych ze wsparciem finansowym dla poszkodowanych przez powódź w 2024 roku (druk nr 669).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorców zatrudniających żołnierzy Obrony Terytorialnej lub żołnierzy Aktywnej Rezerwy (druk nr 673).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie powołania i wyboru składu osobowego Komisji Nadzwyczajnej do spraw działań przeciwpowodziowych i usuwania skutków powodzi z roku 2024 (druk nr 678).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z utworzeniem oddziałów o profilu mundurowym oraz ułatwieniem powrotu do służby w Policji i Straży Granicznej (druki nr 605, 649 i 649-A).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o zmianie ustawy o udostępnianiu informacji gospodarczych i wymianie danych gospodarczych (druki nr 554, 654 i 654-A).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia Dnia Pamięci Ofiar Zagłady Osób z Zaburzeniami Psychicznymi na terenach okupowanej Polski podczas II wojny światowej (druki nr 614 i 641).\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o ratyfikacji Międzynarodowej Konwencji w sprawie ochrony wszystkich osób przed wymuszonym zaginięciem, przyjętej w Nowym Jorku dnia 20 grudnia 2006 r. (druki nr 589 i 642).\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie styczeń-czerwiec 2024 r. (przewodnictwo Belgii w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 616 i 651).\nPierwsze czytanie rządowego projektu ustawy o ochronie ludności i obronie cywilnej (druk nr 664).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druk nr 656).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 481).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o Krajowej Administracji Skarbowej (druk nr 604).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny (druk nr 643).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 672, 672-A, 683 i 683-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorców zatrudniających żołnierzy Obrony Terytorialnej lub żołnierzy Aktywnej Rezerwy (druki nr 673, 681 i 681-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o kołach gospodyń wiejskich oraz ustawy o społeczno-zawodowych organizacjach rolników (druki nr 655 i 658).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o asystencji osobistej osób z niepełnosprawnościami (druk nr 316).\nInformacja Ministra Spraw Wewnętrznych i Administracji o realizacji w 2023 roku "Programu modernizacji Policji, Straży Granicznej, Państwowej Straży Pożarnej i Służby Ochrony Państwa w latach 2022-2025" wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 364 i 564).\nZmiany w składach osobowych komisji sejmowych (druk nr 680).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o dochodach jednostek samorządu terytorialnego (druki nr 622, 675 i 675-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o obywatelskim projekcie ustawy o zmianie ustawy o rencie socjalnej (druki nr 30, 583 i 583-A) - trzecie czytanie.\nZmiany w składach osobowych komisji sejmowych (druk nr 689).	\N	127	2026-10-03 22:10:52.854297+00	\N
19	10	19	19. Posiedzenie Sejmu RP w dniach 9, 10 i 11 października 2024 r.	{2024-10-09,2024-10-10,2024-10-11}	Sprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o rozwoju lokalnym z udziałem lokalnej społeczności (druki nr 496, 679 i 679-A).\nPierwsze czytanie rządowego projektu ustawy o opodatkowaniu wyrównawczym jednostek składowych grup międzynarodowych i krajowych (druk nr 674).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 692).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o poselskim projekcie ustawy o zmianie ustawy o ochotniczych strażach pożarnych oraz niektórych innych ustaw (druki nr 603, 688 i 688-A).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 180. rocznicy urodzin Wawrzyńca Hajdy, śląskiego działacza niepodległościowego (druki nr 662 i 666).\nZmiany w składach osobowych komisji sejmowych (druk nr 689) - kontynuacja.\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy budżetowej na rok 2025 (druk nr 687).\nPierwsze czytanie rządowego projektu ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2025 (druk nr 693).\nRozpatrzenie wniosku w sprawie odwołania członka Rady Mediów Narodowych - Pana Krzysztofa Czabańskiego (druki nr 694 i 717).\nZmiany w składach osobowych komisji sejmowych (druk nr 708).\nInformacja o działalności Rzecznika Praw Obywatelskich oraz o stanie przestrzegania wolności i praw człowieka i obywatela w 2023 r. wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 621 i 696).\nPrzedstawiony przez Prezesa Rady Ministrów dokument: "Stan bezpieczeństwa ruchu drogowego oraz działania realizowane w tym zakresie w 2023 r." wraz ze stanowiskiem Komisji Infrastruktury (druki nr 422 i 469).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o kołach gospodyń wiejskich oraz ustawy o społeczno-zawodowych organizacjach rolników (druki nr 714 i 720).	\N	21	2026-10-03 22:10:52.854297+00	\N
20	10	20	20. Posiedzenie Sejmu RP w dniach 16, 17 i 18 października 2024 r.	{2024-10-16,2024-10-17,2024-10-18}	Orędzie Prezydenta Rzeczypospolitej Polskiej Pana Andrzeja Dudy.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druki nr 656, 701 i 701-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o działaniach antyterrorystycznych i ustawy o Agencji Bezpieczeństwa Wewnętrznego oraz Agencji Wywiadu (druki nr 661, 706 i 706-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o świadczeniu honorowym z tytułu ukończenia 100 lat życia (druki nr 607 i 709).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o zmianie niektórych ustaw związanych z udzielaniem pomocy de minimis (druki nr 600 i 697).\nSprawozdanie Komisji Kultury i Środków Przekazu o: - przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie upamiętnienia księdza Jerzego Popiełuszki w 40. rocznicę męczeńskiej śmierci, - poselskim projekcie uchwały w sprawie uczczenia błogosławionego księdza Jerzego Popiełuszki w 40. rocznicę męczeńskiej śmierci (druki nr 710, 711 i 723).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Okręgowego w Warszawie z dnia 10 czerwca 2021 r. o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej poseł Joanny Muchy (druk nr 633).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Macieja Lisowskiego reprezentowanego przez radcę prawnego Tomasza A. Kuśmierka z dnia 23 kwietnia 2024 r., uzupełnionego w dniu 14 czerwca 2024 r., o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Marka Sowy (druk nr 631).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Macieja Lisowskiego reprezentowanego przez radcę prawnego Tomasza A. Kuśmierka z dnia 27 czerwca 2024 r. o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Marka Sowy (druk nr 632).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Piotra Gruszczyńskiego reprezentowanego przez adwokata Andrzeja Gozdowskiego z dnia 14 grudnia 2021 r., uzupełnionego w dniu 11 lutego 2022 r., o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Dolaty (druk nr 634).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 692 i 716).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 659).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi (druk nr 698).\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Protokołu między Rządem Rzeczypospolitej Polskiej a Organizacją Bezpieczeństwa i Współpracy w Europie zmieniającego Porozumienie między Rządem Rzeczypospolitej Polskiej a Organizacją Bezpieczeństwa i Współpracy w Europie w sprawie statusu Organizacji Bezpieczeństwa i Współpracy w Europie w Rzeczypospolitej Polskiej, podpisane w Warszawie dnia 28 czerwca 2017 r., podpisanego w Warszawie dnia 5 lipca 2024 r. (druki nr 670 i 707).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz niektórych innych ustaw (druki nr 713 i 724).\nSprawozdanie Komisji Gospodarki i Rozwoju o uchwale Senatu w sprawie ustawy o zmianie ustawy o udostępnianiu informacji gospodarczych i wymianie danych gospodarczych (druki nr 721 i 725).\nZmiany w składach osobowych komisji sejmowych (druk nr 735).\nPrzedstawiony przez Ministra Zdrowia dokument: Narodowa Strategia Onkologiczna - Sprawozdanie za rok 2023 wraz ze stanowiskiem Komisji Zdrowia (druki nr 447 i 578).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w Systemie Wjazdu/Wyjazdu (druki nr 722, 732 i 732-A).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie powołania i wyboru składu osobowego Komisji Nadzwyczajnej do spraw ochrony zwierząt (druk nr 737).	\N	37	2026-10-03 22:10:52.854297+00	\N
21	10	21	21. Posiedzenie Sejmu RP w dniach 6, 7 i 8 listopada 2024 r.	{2024-11-06,2024-11-07,2024-11-08}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o opodatkowaniu wyrównawczym jednostek składowych grup międzynarodowych i krajowych (druki nr 674, 734 i 734-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy budżetowej na rok 2024 (druk nr 754).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2024 (druk nr 755).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku rolnym, ustawy o podatkach i opłatach lokalnych oraz ustawy o opłacie skarbowej (druk nr 741).\nWybór nowego składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 784).\nZmiany w składach osobowych komisji sejmowych (druk nr 783).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 611).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o komisyjnym projekcie ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie (druki nr 445 i 733).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o zmianie niektórych ustaw wspierających rozwój mieszkalnictwa (druki nr 702, 736 i 736-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie nazwy Akademii Wychowania Fizycznego im. Bronisława Czecha w Krakowie (druki nr 727 i 739).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego oraz niektórych innych ustaw (druk nr 728).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o ochronie ludności i obronie cywilnej (druki nr 664, 749 i 749-A).\nPierwsze czytanie rządowego projektu ustawy o Radzie Fiskalnej (druk nr 750).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o gospodarce opakowaniami i odpadami opakowaniowymi oraz niektórych innych ustaw (druk nr 760).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o doręczeniach elektronicznych (druk nr 761).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy budżetowej na rok 2024 (druki nr 754, 787 i 787-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2024 (druki nr 755 i 786).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o finansach publicznych oraz niektórych innych ustaw (druki nr 756 i 785).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 744 i 805).\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o zmianie ustawy o służbie zagranicznej oraz ustawy o ograniczeniu prowadzenia działalności gospodarczej przez osoby pełniące funkcje publiczne (druki nr 753 i 770).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o dniach wolnych od pracy oraz niektórych innych ustaw (druk nr 777).\nDrugie czytanie komisyjnego projektu uchwały w sprawie udziału Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie styczeń-czerwiec 2024 r. (przewodnictwo Belgii w Radzie Unii Europejskiej) (druki nr 651 i 686) - głosowanie.\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Protokołu między Rządem Rzeczypospolitej Polskiej a Organizacją Bezpieczeństwa i Współpracy w Europie zmieniającego Porozumienie między Rządem Rzeczypospolitej Polskiej a Organizacją Bezpieczeństwa i Współpracy w Europie w sprawie statusu Organizacji Bezpieczeństwa i Współpracy w Europie w Rzeczypospolitej Polskiej, podpisane w Warszawie dnia 28 czerwca 2017 r., podpisanego w Warszawie dnia 5 lipca 2024 r. (druki nr 670, 707 i 707-A) - trzecie czytanie.\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druki nr 758 i 768).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały o zmianie uchwały w sprawie powołania i wyboru składu osobowego Komisji Nadzwyczajnej do rozpatrzenia projektów ustaw dotyczących prawa do przerywania ciąży (druk nr 789).\nInformacja Ministra Obrony Narodowej na temat raportu opublikowanego przez Zespół ds. oceny funkcjonowania "Podkomisji Smoleńskiej", w szczególności na temat wykazanych w nim nieprawidłowości w funkcjonowaniu Podkomisji oraz informacja Ministra Sprawiedliwości Prokuratora Generalnego na temat postępów w prowadzonych przez prokuraturę śledztwach dotyczących katastrofy smoleńskiej.\nZmiany w składach osobowych komisji sejmowych (druk nr 806).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o Centrum Medycznym Kształcenia Podyplomowego oraz niektórych innych ustaw (druki nr 757, 793 i 793-A).	\N	87	2026-10-03 22:10:52.854297+00	\N
22	10	22	22. Posiedzenie Sejmu RP w dniach 19, 20, 21, 22 i 27 listopada 2024 r.	{2024-11-19,2024-11-20,2024-11-21,2024-11-22,2024-11-27}	Sprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o likwidacji Fundacji Platforma Przemysłu Przyszłości (druki nr 763 i 795).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druk nr 802).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku rolnym, ustawy o podatkach i opłatach lokalnych oraz ustawy o opłacie skarbowej (druki nr 741, 788 i 788-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2025 (druki nr 693, 769 i 769-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o rachunkowości, ustawy o biegłych rewidentach, firmach audytorskich oraz nadzorze publicznym oraz niektórych innych ustaw (druki nr 726, 767 i 767-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 743, 796 i 796-A).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o odpadach oraz ustawy o zmianie ustawy o odpadach oraz niektórych innych ustaw (druki nr 766 i 818).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o transporcie drogowym (druki nr 752 i 798).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy o systemie oświaty oraz niektórych innych ustaw (druki nr 759, 807 i 807-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o Radzie Fiskalnej (druki nr 750, 821 i 821-A).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o rządowym projekcie ustawy o zmianie ustawy o sporcie oraz niektórych innych ustaw (druki nr 742, 794 i 794-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o doręczeniach elektronicznych (druki nr 761, 809 i 809-A).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o elektromobilności i paliwach alternatywnych oraz niektórych innych ustaw (druki nr 751, 799 i 799-A).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o gospodarce opakowaniami i odpadami opakowaniowymi oraz niektórych innych ustaw (druki nr 760, 834 i 834-A).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie 106. rocznicy powstania rządu Daszyńskiego (druki nr 775 i 797).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Roberta Bąkiewicza reprezentowanego przez adwokatów Adama Janusa oraz Tomasza Mielke z dnia 19 kwietnia 2024 r. o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Konrada Frysztaka (druk nr 695).\nSprawozdanie z działalności Państwowej Inspekcji Pracy w 2023 roku wraz ze stanowiskiem Komisji do Spraw Kontroli Państwowej oraz Komisji Polityki Społecznej i Rodziny (druki nr 482 i 718).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 802, 816 i 816-A).\nSprawozdanie Komisji do Spraw Dzieci i Młodzieży oraz Komisji Polityki Społecznej i Rodziny o rządowym oraz poselskim projektach ustaw o zmianie ustawy o pomocy osobom uprawnionym do alimentów (druki nr 800, 326 i 833).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druki nr 764 i 764-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o podatku dochodowym od osób fizycznych (druk nr 324).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz niektórych innych ustaw (druk nr 838).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o środkach nadzwyczajnych mających na celu ograniczenie wysokości cen energii elektrycznej oraz wsparciu niektórych odbiorców w 2023 roku oraz w 2024 roku oraz niektórych innych ustaw (druk nr 841).\nWniosek o wyrażenie wotum nieufności wobec Minister Zdrowia Izabeli Leszczyny (druki nr 808 i 844).\nInformacja Ministra Obrony Narodowej na temat raportu opublikowanego przez Zespół ds. oceny funkcjonowania "Podkomisji Smoleńskiej", w szczególności na temat wykazanych w nim nieprawidłowości w funkcjonowaniu Podkomisji oraz informacja Ministra Sprawiedliwości Prokuratora Generalnego na temat postępów w prowadzonych przez prokuraturę śledztwach dotyczących katastrofy smoleńskiej - głosowanie.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druk nr 762).\nSprawozdanie Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań podjętych w celu przygotowania i przeprowadzenia wyborów Prezydenta Rzeczypospolitej Polskiej w 2020 r. w formie głosowania korespondencyjnego (druk nr 740).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o ochronie zwierząt oraz zmianie niektórych innych ustaw (druk nr 700).\nPierwsze czytanie obywatelskiego projektu ustawy o zobowiązaniu władz publicznych do realizacji inwestycji Centralnego Portu Komunikacyjnego (druk nr 699).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo geodezyjne i kartograficzne oraz ustawy o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym oraz niektórych innych ustaw (druki nr 801, 815 i 815-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach upraw rolnych i zwierząt gospodarskich (druki nr 804, 820 i 820-A).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy - Prawo ochrony środowiska oraz niektórych innych ustaw (druki nr 813, 863 i 863-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Gospodarki i Rozwoju: - o rządowym projekcie ustawy o zmianie ustawy o środkach nadzwyczajnych mających na celu ograniczenie wysokości cen energii elektrycznej oraz wsparciu niektórych odbiorców w 2023 roku oraz w 2024 roku oraz niektórych innych ustaw, - o obywatelskim projekcie ustawy o zmianie ustaw w celu wsparcia odbiorców energii elektrycznej, paliw gazowych i ciepła oraz niektórych innych ustaw (druki nr 841, 494, 861 i 861-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zapewnieniu finansowania działań zmierzających do zwiększenia zdolności produkcji amunicji (druki nr 839, 858 i 858-A).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druki nr 764, 764-A, 851 i 851-A).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o odpadach oraz niektórych innych ustaw (druki nr 812 i 819).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Polityki Społecznej i Rodziny o poselskim projekcie ustawy o zmianie ustawy o dniach wolnych od pracy oraz niektórych innych ustaw (druki nr 777 i 855).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o promowaniu wytwarzania energii elektrycznej w morskich farmach wiatrowych (druki nr 811 i 850).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 847 i 849).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o Centrum Medycznym Kształcenia Podyplomowego oraz niektórych innych ustaw (druki nr 846 i 848).	\N	177	2026-10-03 22:10:52.854297+00	\N
23	10	23	23. Posiedzenie Sejmu RP w dniach 4 i 5 grudnia 2024 r.	{2024-12-04,2024-12-05}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy budżetowej na rok 2025 (druki nr 687, 857 i 857-A).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy - Prawo lotnicze (druki nr 573, 843 i 843-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz niektórych innych ustaw (druki nr 803 i 845).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o Funduszu Ochrony Rolnictwa oraz niektórych innych ustaw (druki nr 842 i 859).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 852 i 856).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Kultury i Środków Przekazu o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o grach hazardowych (druki nr 840, 860 i 860-A).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o poselskim projekcie ustawy o zmianie ustawy o sporcie (druki nr 560 i 822).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o wypowiedzeniu Porozumienia o zdolności prawnej, przywilejach i immunitetach Międzynarodowej Organizacji Łączności Kosmicznej "Intersputnik", sporządzonego w Berlinie dnia 20 września 1976 r. (druki nr 745 i 779).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o wypowiedzeniu Porozumienia o utworzeniu międzynarodowego systemu i organizacji łączności kosmicznej "Intersputnik", sporządzonego w Moskwie dnia 15 listopada 1971 r., zmienionego Protokołem o wprowadzeniu zmian do Porozumienia sporządzonego w Moskwie dnia 15 listopada 1971 r. o utworzeniu międzynarodowego systemu i organizacji łączności kosmicznej "Intersputnik", przyjętym podczas XXV Jubileuszowej Sesji Rady INTERSPUTNIK w Moskwie dnia 30 listopada 1996 r. (druki nr 746 i 780).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Okręgowego w Zielonej Górze z dnia 1 października 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Łukasza Mejzy (druk nr 862).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku z dnia 7 listopada 2024 r. Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. o wyrażenie przez Sejm zgody na zatrzymanie i przymusowe doprowadzenie na posiedzenie Sejmowej Komisji Śledczej posła Zbigniewa Ziobry (druk nr 870).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Porozumienia w sprawie Środkowoeuropejskiego Programu Wymiany Uniwersyteckiej ("CEEPUS IV"), podpisanego w Warszawie dnia 20 września 2023 r. (druki nr 747 i 792).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o ochronie ludności i obronie cywilnej (druki nr 854 i 869).\nWybór członka Rady Mediów Narodowych (druki nr 778 i 817).\nZmiany w składach osobowych komisji sejmowych (druk nr 882).\nSprawozdanie z działalności Prezesa Urzędu Ochrony Danych Osobowych w roku 2023 wraz ze stanowiskiem Komisji Sprawiedliwości i Praw Człowieka (druki nr 646 i 668).\nPierwsze czytanie poselskiego projektu ustawy o ograniczeniu biurokracji i barier prawnych (druki nr 558 i 558-A).	\N	37	2026-10-03 22:10:52.854297+00	\N
24	10	24	24. Posiedzenie Sejmu RP w dniu 6 grudnia 2024 r.	{2024-12-06}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy budżetowej na rok 2025 (druki nr 687, 857 i 857-A) - trzecie czytanie.\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o rachunkowości, ustawy o biegłych rewidentach, firmach audytorskich oraz nadzorze publicznym oraz niektórych innych ustaw (druki nr 885 i 889).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o uchwale Senatu w sprawie ustawy o zmianie ustawy o gospodarce opakowaniami i odpadami opakowaniowymi oraz niektórych innych ustaw (druki nr 886 i 890).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o uchwale Senatu w sprawie ustawy o zmianie ustawy o odpadach oraz niektórych innych ustaw (druki nr 887 i 891).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druki nr 884 i 888).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zmianie ustawy o dniach wolnych od pracy oraz niektórych innych ustaw (druki nr 892 i 893).\nRozpatrzenie uchwały Senatu w sprawie ustawy o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druk nr 894).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Zbigniewa Komosy reprezentowanego przez adwokata Jerzego Jurka z dnia 10 października 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Jarosława Kaczyńskiego (druk nr 871).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 25 marca 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności za wykroczenie posła Jarosława Kaczyńskiego (druk nr 872).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 25 marca 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności za wykroczenie poseł Anity Czerwińskiej (druk nr 873).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 25 marca 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności za wykroczenie posła Marka Suskiego w sprawie o czyny popełnione w dniu 10 lutego 2024 r. (druk nr 874).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 25 marca 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności za wykroczenie posła Marka Suskiego w sprawie o czyny popełnione w dniu 10 marca 2024 r. (druk nr 875).	\N	183	2026-10-03 22:10:52.854297+00	\N
25	10	25	25. Posiedzenie Sejmu RP w dniach 18, 19 i 20 grudnia 2024 r.	{2024-12-18,2024-12-19,2024-12-20}	Sprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie niektórych ustaw w celu dostosowania do nomenklatury scalonej (druki nr 897, 901 i 901-A).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo lotnicze oraz niektórych innych ustaw (druki nr 810 i 877).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o podmiotach obsługujących kredyty i nabywcach kredytów (druki nr 765 i 902).\nSprawozdanie Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości działań, a także występowania nadużyć, zaniedbań i zaniechań w zakresie legalizacji pobytu cudzoziemców na terytorium Rzeczypospolitej Polskiej w okresie od dnia 12 listopada 2019 r. do dnia 20 listopada 2023 r. (druk nr 883).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy z dnia 29 sierpnia 1997 r. - Ordynacja podatkowa (druk nr 774).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy - Ordynacja podatkowa (druk nr 866).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 876).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 865).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 690).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług, ustawy o podatku akcyzowym oraz niektórych innych ustaw (druk nr 896).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o Radzie Fiskalnej (druki nr 915 i 917).\nSprawozdanie Rady Ministrów z realizacji ustawy z dnia 4 lutego 2011 r. o opiece nad dziećmi w wieku do lat 3 w 2023 r. wraz ze stanowiskiem Komisji Polityki Społecznej i Rodziny (druki nr 731 i 791).\nSprawozdanie Komisji Spraw Zagranicznych o poselskim projekcie uchwały w sprawie wsparcia protestów obywatelskich w Gruzji oraz potępienia stosowania przemocy wobec ich uczestników (druki nr 913 i 914).	\N	23	2026-10-03 22:10:52.854297+00	\N
26	10	26	26. Posiedzenie Sejmu RP w dniach 8, 9 i 10 stycznia 2025 r.	{2025-01-08,2025-01-09,2025-01-10}	Przedłożony przez Ministra do Spraw Unii Europejskiej dokument: "Program Polskiej Prezydencji w Radzie Unii Europejskiej (1 stycznia - 30 czerwca 2025 r.)" (druk nr 904).\nPierwsze czytanie poselskiego projektu ustawy o szczególnych rozwiązaniach w zakresie rozpoznawania przez Sąd Najwyższy spraw, związanych z wyborami Prezydenta Rzeczypospolitej Polskiej oraz wyborami uzupełniającymi do Senatu Rzeczypospolitej Polskiej, zarządzonymi w 2025 r. (druk nr 923).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach w zakresie przeciwdziałania wspieraniu agresji na Ukrainę oraz służących ochronie bezpieczeństwa narodowego, ustawy o Krajowej Administracji Skarbowej oraz ustawy o przeciwdziałaniu praniu pieniędzy oraz finansowaniu terroryzmu (druki nr 878 i 905).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie ustawy o ustanowieniu Narodowego Dnia Pamięci Żołnierzy Armii Krajowej (druki nr 925 i 930).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o rynku mocy (druki nr 927 i 928).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o udzielaniu cudzoziemcom ochrony na terytorium Rzeczypospolitej Polskiej (druk nr 924).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 80. rocznicy Tragedii Górnośląskiej (druki nr 922 i 929).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w związku z przystąpieniem Rzeczypospolitej Polskiej do wzmocnionej współpracy w zakresie Prokuratury Europejskiej (druk nr 906).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego oraz niektórych innych ustaw (druk nr 864).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o broni i amunicji (druk nr 867).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy budżetowej na rok 2025 (druki nr 919 i 940).\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz niektórych innych ustaw (druki nr 916 i 918).\nSprawozdanie Rady Ministrów z realizacji ustawy o pomocy państwa w wychowywaniu dzieci w 2023 r. wraz ze stanowiskiem Komisji Polityki Społecznej i Rodziny (druki nr 704 i 790).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 824).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o drogach publicznych (druk nr 880).\nZmiany w składach osobowych komisji sejmowych (druk nr 947).	\N	52	2026-10-03 22:10:52.854297+00	\N
27	10	27	27. Posiedzenie Sejmu RP w dniach 22, 23 i 24 stycznia 2025 r.	{2025-01-22,2025-01-23,2025-01-24}	Sprawozdanie Komisji Sprawiedliwości i Praw Człowieka o poselskim projekcie ustawy o szczególnych rozwiązaniach w zakresie rozpoznawania przez Sąd Najwyższy spraw, związanych z wyborami Prezydenta Rzeczypospolitej Polskiej oraz wyborami uzupełniającymi do Senatu Rzeczypospolitej Polskiej, zarządzonymi w 2025 r. (druki nr 923, 943 i 943-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o poselskim projekcie ustawy o zmianie ustawy o wykonywaniu mandatu posła i senatora (druki nr 926, 959 i 959-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z przystąpieniem Rzeczypospolitej Polskiej do wzmocnionej współpracy w zakresie Prokuratury Europejskiej (druki nr 906, 958 i 958-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Służbie Więziennej (druki nr 879 i 903).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług, ustawy o podatku akcyzowym oraz niektórych innych ustaw (druki nr 896, 941 i 941-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o zmianie ustawy - Prawo wodne oraz ustawy o zmianie ustawy - Prawo wodne oraz niektórych innych ustaw (druki nr 895 i 931).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia bohaterów Rewolucji 1905 roku w 120. rocznicę jej wybuchu (druki nr 911 i 944).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o rynku pracy i służbach zatrudnienia (druk nr 948).\nPierwsze czytanie rządowego projektu ustawy o warunkach dopuszczalności powierzania pracy cudzoziemcom na terytorium Rzeczypospolitej Polskiej (druk nr 949).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu wyeliminowania nieprawidłowości w systemie wizowym Rzeczypospolitej Polskiej (druk nr 951).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o cudzoziemcach oraz niektórych innych ustaw (druk nr 950).\nPierwsze czytanie poselskiego projektu ustawy o zmianie niektórych ustaw w celu poprawy warunków prowadzenia działalności gospodarczej (druk nr 907).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o środkach nadzwyczajnych mających na celu ograniczenie wysokości cen energii elektrycznej oraz wsparciu niektórych odbiorców w latach 2023-2025 oraz niektórych innych ustaw (druk nr 962).\nSprawozdanie Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo lotnicze oraz niektórych innych ustaw (druki nr 945 i 960).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 824) - kontynuacja.\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie powołania i wyboru składu osobowego Komisji Nadzwyczajnej do rozpatrzenia projektów ustaw dotyczących rynku pracy oraz cudzoziemców przebywających na terytorium Rzeczypospolitej Polskiej (druk nr 972).\nZmiany w składach osobowych komisji sejmowych (druk nr 973).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy (druk nr 934).\nPrzedstawione przez Radę Języka Polskiego "Sprawozdanie o stanie ochrony języka polskiego za lata 2020-2021. Język przekazów rządowych kierowanych do społeczeństwa w czasie kryzysu zdrowotnego" wraz ze stanowiskiem Komisji Kultury i Środków Przekazu (druki nr 180 i 712).\nPierwsze czytanie poselskiego projektu ustawy o zmianie niektórych ustaw w celu ograniczenia nadużywania tymczasowego aresztowania oraz ochrony praw osób tymczasowo aresztowanych (druk nr 935).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustawy o rynku mocy (druki nr 974 i 977).	\N	33	2026-10-03 22:10:52.854297+00	\N
28	10	28	28. Posiedzenie Sejmu RP w dniach 5 i 6 lutego 2025 r.	{2025-02-05,2025-02-06}	Sprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o biokomponentach i biopaliwach ciekłych oraz niektórych innych ustaw (druki nr 956, 979 i 979-A).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo lotnicze (druki nr 952, 961 i 961-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym, ustawy o zdrowiu publicznym oraz niektórych innych ustaw (druk nr 981).\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie ustawy o znakach Sił Zbrojnych Rzeczypospolitej Polskiej (druki nr 932 i 963).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druk nr 964).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo o ustroju sądów powszechnych oraz ustawy - Prawo o ustroju sądów wojskowych (druk nr 988).\nPierwsze czytanie rządowego projektu ustawy o unijnej sieci danych dotyczących poziomu zrównoważenia gospodarstw rolnych (FSDN) (druk nr 989).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 105. rocznicy Zaślubin Polski z Morzem w Pucku (druki nr 910 i 975).\nPytania w sprawach bieżących.\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Zastępcy Prokuratora Regionalnego w Warszawie z dnia 19 grudnia 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Jana Krzysztofa Ardanowskiego (druk nr 986).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy (druk nr 934) - kontynuacja.\nZmiany w składach osobowych komisji sejmowych (druk nr 1013).\nInformacja bieżąca.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o Instytucie Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu oraz ustawy - Kodeks karny (druk nr 908).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 773).	\N	18	2026-10-03 22:10:52.854297+00	\N
29	10	29	29. Posiedzenie Sejmu RP w dniach 20 i 21 lutego 2025 r.	{2025-02-20,2025-02-21}	Sprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o przygotowaniu i realizacji inwestycji w zakresie obiektów energetyki jądrowej oraz inwestycji towarzyszących oraz ustawy o wpłatach z zysku przez jednoosobowe spółki Skarbu Państwa (druki nr 955 i 968).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym, ustawy o zdrowiu publicznym oraz niektórych innych ustaw (druki nr 981 i 1015).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druki nr 964 i 1007).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o funduszach promocji produktów rolno-spożywczych (druki nr 953, 987 i 987-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o zmianie ustawy o obszarach morskich Rzeczypospolitej Polskiej i administracji morskiej (druki nr 933, 957 i 957-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o udzielaniu cudzoziemcom ochrony na terytorium Rzeczypospolitej Polskiej (druki nr 924, 1010 i 1010-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Pawła Bednarza reprezentowanego przez adwokata Michała Ubika z dnia 4 grudnia 2018 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Pawła Kukiza (druk nr 978).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Łukasza Konrada Piebiaka reprezentowanego przez adwokata Krzysztofa Wąsowskiego z dnia 24 kwietnia 2023 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Waldemara Jana Sługockiego (druk nr 1014).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Macieja Wójcika reprezentowanego przez adwokata Adama Kocembę z dnia 22 kwietnia 2024 r., poprawionego w dniu 12 lipca 2024 r., o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posłanki Anity Kucharskiej-Dziedzic (druk nr 1024).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Romana Giertycha reprezentowanego przez adwokata Krzysztofa Pawlaka z dnia 18 grudnia 2023 r., uzupełnionego w dniu 18 czerwca 2024 r., o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry (druk nr 1012).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku z dnia 3 lutego 2025 r. Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. o wyrażenie przez Sejm zgody na aresztowanie w celu zapewnienia stawiennictwa na posiedzeniu Sejmowej Komisji Śledczej posła Zbigniewa Ziobry (druk nr 1025).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Kierownika Zespołu Śledczego Nr 2 Prokuratury Krajowej z dnia 3 lutego 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Marcina Romanowskiego (druk nr 1026).\nWniosek o wyrażenie wotum nieufności wobec Minister do spraw Równości Katarzyny Kotuli (druki nr 990 i 1018).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Zastępcy Prokuratora Regionalnego w Warszawie z dnia 19 grudnia 2024 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Jana Krzysztofa Ardanowskiego (druk nr 986) - głosowanie.\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o ochronie zdrowia przed następstwami używania tytoniu i wyrobów tytoniowych (druki nr 982 i 1029).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o Planie Strategicznym dla Wspólnej Polityki Rolnej na lata 2023-2027 oraz niektórych innych ustaw (druki nr 1009, 1028 i 1028-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o rynku pracy i służbach zatrudnienia (druki nr 948, 1021 i 1021-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o warunkach dopuszczalności powierzania pracy cudzoziemcom na terytorium Rzeczypospolitej Polskiej (druki nr 949, 1022 i 1022-A).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy zmieniającej ustawę o zmianie ustawy o finansowym wsparciu tworzenia lokali socjalnych, mieszkań chronionych, noclegowni i domów dla bezdomnych, ustawy o ochronie praw lokatorów, mieszkaniowym zasobie gminy i o zmianie Kodeksu cywilnego oraz niektórych innych ustaw (druki nr 954 i 1027).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o rynku mocy oraz niektórych innych ustaw (druki nr 1008 i 1031).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nWybór sędziów Trybunału Konstytucyjnego (druki nr 898, 899, 1019 i 1020).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o uchwale Senatu w sprawie ustawy o zmianie ustawy o wykonywaniu mandatu posła i senatora (druki nr 1016 i 1023).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o biokomponentach i biopaliwach ciekłych oraz niektórych innych ustaw (druki nr 1017 i 1033).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o Instytucie Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu oraz ustawy - Kodeks karny (druk nr 908) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 773) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 830).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od spadków i darowizn oraz niektórych innych ustaw (druk nr 825).\nŚlubowanie członka Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15.	\N	78	2026-10-03 22:10:52.854297+00	\N
30	10	30	30. Posiedzenie Sejmu RP w dniach 5, 6 i 7 marca 2025 r.	{2025-03-05,2025-03-06,2025-03-07}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o systemie instytucji rozwoju (druki nr 992 i 1032).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks karny (druki nr 876, 984 i 984-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o notariacie (druki nr 440 i 814).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Prawo o ustroju sądów powszechnych oraz ustawy - Prawo o ustroju sądów wojskowych (druki nr 988, 1047 1047-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 1037).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 1036).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 1035).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 966).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie uczczenia Macieja Kazimierza Sarbiewskiego w 430. rocznicę urodzin (druki nr 1046 i 1048).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Krzysztofa Brejzy reprezentowanego przez adwokat Dorotę Brejzę z dnia 17 stycznia 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Jarosława Kaczyńskiego (druk nr 1049).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Kierownika Zespołu Śledczego Nr 2 Prokuratury Krajowej z dnia 24 lutego 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Dariusza Mateckiego (druk nr 1067).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Zastępcy Prokuratora Okręgowego do Spraw Wojskowych Prokuratury Okręgowej w Warszawie z dnia 31 stycznia 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Mariusza Błaszczaka (druk nr 1066).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Służbie Więziennej oraz niektórych innych ustaw (druk nr 993).\nPierwsze czytanie obywatelskiego projektu ustawy o ochronie małoletnich przed treściami pornograficznymi w Internecie oraz o zmianie ustawy - Prawo telekomunikacyjne (druk nr 1006).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Radzie Ministrów oraz niektórych innych ustaw (druk nr 1059).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 830) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od spadków i darowizn oraz niektórych innych ustaw (druk nr 825) - kontynuacja.\nZmiany w składzie osobowym komisji sejmowej (druk nr 1072).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o unijnej sieci danych dotyczących poziomu zrównoważenia gospodarstw rolnych (FSDN) (druki nr 989 i 1069).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o poselskim projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1050 i 1064).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w 150. rocznicę urodzin Cyryla Ratajskiego (druki nr 1045 i 1071).\nInformacja o istotnych problemach wynikających z działalności i orzecznictwa Trybunału Konstytucyjnego w 2023 roku wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka oraz Komisji Ustawodawczej (druki nr 912 i 991).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo lotnicze (druki nr 1062 i 1070).\nInformacja Prezesa Rady Ministrów w sprawie sytuacji międzynarodowej i bezpieczeństwa Polski po szczycie państw sojuszniczych w Londynie oraz po posiedzeniu Rady Europejskiej.\nZmiany w składach osobowych komisji sejmowych (druk nr 1087).	\N	32	2026-10-03 22:10:52.854297+00	\N
31	10	31	31. Posiedzenie Sejmu RP w dniach 19 i 20 marca 2025 r.	{2025-03-19,2025-03-20}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o współpracy rozwojowej oraz niektórych innych ustaw (druki nr 1034 i 1086).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o Państwowym Ratownictwie Medycznym oraz niektórych innych ustaw (druki nr 1058, 1111 i 1111-A).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz niektórych innych ustaw (druki nr 838 i 1103).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej, Komisji Polityki Społecznej i Rodziny oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Poprawek do Konwencji o pracy na morzu, przyjętej w Genewie dnia 23 lutego 2006 r., zatwierdzonych przez Międzynarodową Konferencję Pracy w Genewie w dniu 6 czerwca 2022 r. (druki nr 994 i 1068).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o poselskim projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1042 i 1063).\nSprawozdanie Komisji Spraw Zagranicznych o poselskim projekcie uchwały w sprawie wyborów prezydenckich na Białorusi (druki nr 1003 i 1088).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o poselskim projekcie ustawy o zmianie ustawy o zawodzie lekarza weterynarii i izbach lekarsko-weterynaryjnych (druki nr 1038 i 1101).\nPierwsze czytanie rządowego projektu ustawy o Krajowej Sieci Kardiologicznej (druk nr 1090).\nPrzedstawiony przez Ministra Zdrowia dokument: "Narodowy Program Chorób Układu Krążenia na lata 2022-2032 - Roczne sprawozdanie z realizacji Programu za 2023 r." wraz ze stanowiskiem Komisji Zdrowia (druki nr 776 i 976).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Łukasza Mejzy, reprezentowanego przez adwokata Huberta Kubika, z dnia 24 marca 2023 r., poprawionego w dniu 25 maja 2023 r., o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej poseł Anity Kucharskiej-Dziedzic w zakresie dotyczącym zachowań opisanych w pkt 1, 2, 3, 5 i 6 wniosku (druk nr 1060).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Łukasza Mejzy, reprezentowanego przez adwokata Huberta Kubika, z dnia 24 marca 2023 r., poprawionego w dniu 25 maja 2023 r., o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej poseł Anity Kucharskiej-Dziedzic w zakresie dotyczącym zachowań opisanych w pkt 4 i 7 wniosku (druk nr 1061).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o uchwale Senatu w sprawie ustawy o zmianie ustawy o obszarach morskich Rzeczypospolitej Polskiej i administracji morskiej oraz ustawy o inwestycjach w zakresie budowy portów zewnętrznych (druki nr 1095 i 1096).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o rynku pracy i służbach zatrudnienia (druki nr 1092 i 1100).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o warunkach dopuszczalności powierzania pracy cudzoziemcom na terytorium Rzeczypospolitej Polskiej (druki nr 1091 i 1099).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy zmieniającej ustawę o zmianie ustawy o finansowym wsparciu tworzenia lokali socjalnych, mieszkań chronionych, noclegowni i domów dla bezdomnych, ustawy o ochronie praw lokatorów, mieszkaniowym zasobie gminy i o zmianie Kodeksu cywilnego oraz niektórych innych ustaw (druki nr 1094 i 1098).\nWybór składu osobowego Komisji do Spraw Deregulacji (druk nr 1102).\nZmiany w składach osobowych komisji sejmowych (druk nr 1122).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o umowach międzynarodowych (druk nr 1077).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Ordynacja podatkowa (druk nr 965).\nSprawozdanie Komisji Obrony Narodowej o poselskich projektach uchwał: - w sprawie poparcia dla rezolucji Parlamentu Europejskiego dotyczącej białej księgi o przyszłości europejskiej obrony, - w sprawie obrony polskiej suwerenności (druki nr 1105, 1121 i 1128).	\N	74	2026-10-03 22:10:52.854297+00	\N
32	10	32	32. Posiedzenie Sejmu RP w dniach 2, 3 i 4 kwietnia 2025 r.	{2025-04-02,2025-04-03,2025-04-04}	Informacja Ministra Rolnictwa i Rozwoju Wsi w sprawie prewencyjnych działań resortu związanych z przeciwdziałaniem wystąpieniu wirusa pryszczycy na terytorium Rzeczypospolitej Polskiej.\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy o cudzoziemcach oraz niektórych innych ustaw (druki nr 950 i 1126).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wyeliminowania nieprawidłowości w systemie wizowym Rzeczypospolitej Polskiej (druki nr 951, 1127 i 1127-A).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy o Narodowym Centrum Nauki (druki nr 1075 i 1104).\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie ustawy o Agencji Mienia Wojskowego (druki nr 1074, 1125 i 1125-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o senackim projekcie ustawy o zmianie ustawy o zagospodarowaniu wspólnot gruntowych (druki nr 995 i 1123).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o Narodowym Instytucie Wolności - Centrum Rozwoju Społeczeństwa Obywatelskiego (druki nr 1129 i 1137).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym oraz niektórych innych ustaw (druki nr 1133, 1136 i 1136-A).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o drogach publicznych (druki nr 880, 1134 i 1134-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu deregulacji prawa gospodarczego i administracyjnego oraz doskonalenia zasad opracowywania prawa gospodarczego (druk nr 1108).\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie lipiec-grudzień 2024 r. (przewodnictwo Węgier w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 1085 i 1124).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w 500. rocznicę Hołdu Pruskiego (druki nr 937 i 1097).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy o ochronie zabytków i opiece nad zabytkami (druki nr 1132 i 1154).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o inwestycjach w zakresie elektrowni wiatrowych oraz niektórych innych ustaw (druk nr 1130).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym oraz ustawy o ochronie konkurencji i konsumentów (druk nr 1112).\nPrzedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia pamięci ofiar w 15. rocznicę katastrofy smoleńskiej (druk nr 1140).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz niektórych innych ustaw (druki nr 838, 1103 i 1103-A) - trzecie czytanie.\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druki nr 1093 i 1135).\nSprawozdanie Komisji Spraw Zagranicznych o poselskim projekcie uchwały w sprawie wyborów prezydenckich na Białorusi (druki nr 1003, 1088 i 1088-A) - głosowanie.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Ordynacja podatkowa (druk nr 965) - kontynuacja.\nZmiany w składach osobowych komisji sejmowych (druk nr 1156).\nInformacja Rady Ministrów o sytuacji osób starszych w Polsce za 2023 r. wraz ze stanowiskiem Komisji Polityki Senioralnej oraz Komisji Polityki Społecznej i Rodziny (druki nr 938 i 946).\nPierwsze czytanie poselskiego projektu ustawy o zmianie niektórych ustaw w celu zwolnienia przedsiębiorców od podatku dochodowego od kwot z ubezpieczeń majątkowych uzyskanych w związku z usuwaniem skutków klęsk żywiołowych (druk nr 1081).	\N	44	2026-10-03 22:10:52.854297+00	\N
33	10	33	33. Posiedzenie Sejmu RP w dniach 23 i 24 kwietnia 2025 r.	{2025-04-23,2025-04-24}	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie upamiętnienia 1000. rocznicy koronacji pierwszych królów Polski (druk nr 1149).\nInformacja Ministra Spraw Zagranicznych o zadaniach polskiej polityki zagranicznej w 2025 roku.\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu deregulacji prawa gospodarczego i administracyjnego oraz doskonalenia zasad opracowywania prawa gospodarczego (druki nr 1108, 1168 i 1168-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach służących ochronie odbiorców energii elektrycznej w 2023 roku oraz w 2024 roku w związku z sytuacją na rynku energii elektrycznej (druki nr 1175 i 1183).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym oraz ustawy o ochronie konkurencji i konsumentów (druki nr 1112 i 1180).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionych przez Prezydium Sejmu projektach uchwał w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1054, 1139 i 1151).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druk nr 1176).\nPierwsze czytanie poselskiego projektu ustawy o zmianie niektórych ustaw w celu zwolnienia przedsiębiorców od podatku dochodowego od kwot z ubezpieczeń majątkowych uzyskanych w związku z usuwaniem skutków klęsk żywiołowych (druk nr 1081) - kontynuacja.\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o Państwowym Ratownictwie Medycznym oraz niektórych innych ustaw (druki nr 1166 i 1198).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o cudzoziemcach oraz niektórych innych ustaw (druki nr 1167 i 1177).\nZmiany w składach osobowych komisji sejmowych (druk nr 1197).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Papieża Franciszka (druki nr 1181 i 1199).	\N	64	2026-10-03 22:10:52.854297+00	\N
34	10	34	34. Posiedzenie Sejmu RP w dniach 7, 8 i 9 maja 2025 r.	{2025-05-07,2025-05-08,2025-05-09}	Sprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Służbie Więziennej oraz niektórych innych ustaw (druki nr 993, 1120 i 1120-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o Krajowej Sieci Kardiologicznej (druki nr 1090 i 1152).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks pracy (druki nr 934, 1153 i 1153-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 1176, 1200 i 1200-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych oraz niektórych innych ustaw (druki nr 1172 i 1195).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Haliny Poświatowskiej w 90. rocznicę urodzin (druki nr 1144 i 1182).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie uczczenia Marszałka Józefa Piłsudskiego w 90. rocznicę śmierci (druki nr 1190 i 1214).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 1131).\nPierwsze czytanie komisyjnego projektu ustawy o zmianie ustawy - Kodeks karny wykonawczy (druk nr 1109).\nPierwsze czytanie komisyjnego projektu ustawy o zmianie ustawy - Kodeks karny wykonawczy (druk nr 1110).\nPierwsze czytanie rządowego projektu ustawy o certyfikacji wykonawców zamówień publicznych (druk nr 1184).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o zmianie niektórych ustaw w celu zapewnienia stosowania przepisów prawa Unii Europejskiej poprawiających funkcjonowanie rynku wewnętrznego (druki nr 1174 i 1179).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o zasadach zarządzania mieniem państwowym oraz niektórych innych ustaw (druk nr 1186).\nPowołanie członka Komisji do spraw reprywatyzacji nieruchomości warszawskich (druki nr 1158, 1159, 1212 i 1213).\nWybór sędziów Trybunału Konstytucyjnego (druki nr 1118, 1119, 1210 i 1211).\nPrzedstawiony przez Radę Ministrów dokument: "Sprawozdanie o pomocy publicznej udzielonej w sektorze rolnictwa lub rybołówstwa w Rzeczypospolitej Polskiej w 2023 roku" wraz ze stanowiskiem Komisji Gospodarki Morskiej i Żeglugi Śródlądowej oraz Komisji Rolnictwa i Rozwoju Wsi (druki nr 832 i 985).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego (druk nr 1143).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Prawo o prokuraturze (druk nr 1205).\nZmiany w składach osobowych komisji sejmowych (druk nr 1230).	\N	52	2026-10-03 22:10:52.854297+00	\N
35	10	35	35. Posiedzenie Sejmu RP w dniach 20 i 21 maja 2025 r.	{2025-05-20,2025-05-21}	Sprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o ochronie zdrowia przed następstwami używania tytoniu i wyrobów tytoniowych (druki nr 983 i 1226).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o ochronie przyrody (druki nr 1171 i 1228).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 1225).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Łączności z Polakami za Granicą o rządowym projekcie ustawy o zmianie ustawy o repatriacji oraz niektórych innych ustaw (druki nr 1201, 1215 i 1215-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1057, 1170 i 1170-A).\nPierwsze czytanie rządowego projektu ustawy o wypowiedzeniu Konwencji o zakazie użycia, składowania, produkcji i przekazywania min przeciwpiechotnych oraz o ich zniszczeniu, sporządzonej w Oslo dnia 18 września 1997 r. (druk nr 1261).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie uczczenia 100-lecia istnienia Uniwersytetu Ekonomicznego w Krakowie (druki nr 1207 i 1224).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Marii Dąbrowskiej w 60. rocznicę jej śmierci (druki nr 1082 i 1155).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej: - o komisyjnym projekcie uchwały w sprawie uczczenia 35. rocznicy odrodzenia samorządu terytorialnego w Polsce, - o poselskim projekcie uchwały na 35-lecie odrodzenia samorządu terytorialnego w Polsce (druki nr 1138, 1165 i 1169).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z wprowadzaniem centralnego systemu informacji rynku energii (druki nr 1209 i 1278).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druk nr 1233).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 1232).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa (druk nr 1235).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowej Administracji Skarbowej oraz ustawy o podatku od towarów i usług (druk nr 1231).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks rodzinny i opiekuńczy (druk nr 1234).\nPierwsze czytanie poselskiego projektu ustawy o Rzeczniku Rolników (druk nr 1113).\nSprawozdanie Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 1248 i 1260).\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu deregulacji prawa gospodarczego i administracyjnego oraz doskonalenia zasad opracowywania prawa gospodarczego (druki nr 1247 i 1253).\nZmiana w składzie osobowym komisji sejmowej (druk nr 1279).	\N	53	2026-10-03 22:10:52.854297+00	\N
36	10	36	36. Posiedzenie Sejmu RP w dniach 3, 4 i 11 czerwca 2025 r.	{2025-06-03,2025-06-04,2025-06-11}	Sprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o aplikacji mObywatel oraz niektórych innych ustaw (druki nr 1241, 1250 i 1250-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 1240 i 1251).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy - Prawo geologiczne i górnicze (druki nr 1208 i 1229).\nPierwsze czytanie rządowego projektu ustawy o likwidacji Akademii Kopernikańskiej i Szkoły Głównej Mikołaja Kopernika (druk nr 1284).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa (druk nr 1265).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druk nr 1281).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od spadków i darowizn (druk nr 1282).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o poselskim projekcie ustawy o zmianie ustawy o ochotniczych strażach pożarnych (druki nr 1142 i 1328).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie ustawy o ustanowieniu 11 lipca Dniem Pamięci o Polakach - ofiarach ludobójstwa dokonanego przez OUN-UPA na Kresach Wschodnich II Rzeczypospolitej Polskiej (druki nr 1271 i 1287).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie Konstytucji Rzeczypospolitej Polskiej (druk nr 1106).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o weteranach działań poza granicami państwa, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o finansach publicznych (druk nr 1280).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druk nr 1264).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks pracy (druki nr 1286 i 1291).\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o Krajowej Sieci Kardiologicznej (druki nr 1285 i 1301).\nSprawozdanie Ministra Spraw Wewnętrznych i Administracji z realizacji w 2024 r. ustawy z dnia 24 marca 1920 r. o nabywaniu nieruchomości przez cudzoziemców wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 1163 i 1178).\nZmiany w składach osobowych komisji sejmowych (druk nr 1339).\nRozpatrzenie wniosku Prezesa Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej wotum zaufania Radzie Ministrów (druk nr 1350).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druk nr 1272).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o funduszach inwestycyjnych i zarządzaniu alternatywnymi funduszami inwestycyjnymi (druki nr 1267 i 1331).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o obrocie instrumentami finansowymi (druki nr 1269 i 1330).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o Krajowej Administracji Skarbowej oraz ustawy o podatku od towarów i usług (druki nr 1231 i 1332).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług (druki nr 1232 i 1333).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 1266 i 1293).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Kodeks rodzinny i opiekuńczy (druki nr 1234 i 1292).	\N	20	2026-10-03 22:10:52.854297+00	\N
37	10	37	37. Posiedzenie Sejmu RP w dniach 24, 25 i 26 czerwca 2025 r.	{2025-06-24,2025-06-25,2025-06-26}	Sprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o funduszach inwestycyjnych i zarządzaniu alternatywnymi funduszami inwestycyjnymi (druki nr 1267 i 1331) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o obrocie instrumentami finansowymi (druki nr 1269 i 1330) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o Krajowej Administracji Skarbowej oraz ustawy o podatku od towarów i usług (druki nr 1231 i 1332) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 1266 i 1293) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Kodeks rodzinny i opiekuńczy (druki nr 1234 i 1292) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług (druki nr 1232, 1333 i 1333-A) - trzecie czytanie.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z zapewnieniem operacyjnej odporności cyfrowej sektora finansowego oraz emitowaniem europejskich zielonych obligacji (druki nr 1262, 1326 i 1326-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druki nr 1246, 1298 i 1298-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Służbie Więziennej oraz ustawy o ustanowieniu "Programu modernizacji Policji, Straży Granicznej, Państwowej Straży Pożarnej i Służby Ochrony Państwa w latach 2022-2025", o ustanowieniu "Programu modernizacji Służby Więziennej w latach 2022-2025" oraz o zmianie ustawy o Policji i niektórych innych ustaw (druki nr 1243, 1296 i 1296-A).\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie ustawy o obronie Ojczyzny oraz niektórych innych ustaw (druki nr 1270 i 1334).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Obrony Narodowej o rządowym projekcie ustawy o szczególnych zasadach przygotowania i realizacji strategicznych oraz kluczowych inwestycji w zakresie potrzeb obronności państwa i bezpieczeństwa publicznego oraz ustanawiania stref ochronnych dla niektórych terenów zamkniętych (druki nr 1203, 1351 i 1351-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o komornikach sądowych (druki nr 1244, 1297 i 1297-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druki nr 1233 i 1336).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druki nr 1281 i 1337).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od spadków i darowizn (druki nr 1282 i 1338).\nSprawozdanie Komisji Edukacji i Nauki o poselskim projekcie ustawy o Instytucie imienia Wincentego Witosa (druki nr 829 i nr 1325).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o komisyjnym projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1283 i 1290).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o poselskim projekcie ustawy o zmianie ustawy o restrukturyzacji zadłużenia podmiotów prowadzących gospodarstwa rolne (druki nr 1315 i 1371).\nSprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2024 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2024 roku wraz z komisyjnym projektem uchwały (druki nr 1146 i 1394).\nInformacja o działalności Rady Mediów Narodowych w 2024 roku wraz z komisyjnym projektem uchwały (druki nr 1147 i 1395).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o inwestycjach w zakresie elektrowni wiatrowych oraz niektórych innych ustaw (druki nr 1130 i 1367).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o krajowym systemie certyfikacji cyberbezpieczeństwa (druki nr 1238 i 1249).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Prawo restrukturyzacyjne oraz niektórych innych ustaw (druki nr 1263, 1354 i 1354-A).\nSprawozdanie Komisji Zdrowia o poselskim projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta oraz niektórych innych ustaw (druki nr 748, 1372 i 1372-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o informatyzacji działalności podmiotów realizujących zadania publiczne oraz niektórych innych ustaw (druki nr 1268 i 1294).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o wypowiedzeniu Konwencji o zakazie użycia, składowania, produkcji i przekazywania min przeciwpiechotnych oraz o ich zniszczeniu, sporządzonej w Oslo dnia 18 września 1997 r. (druki nr 1261 i 1327).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy - Prawo geologiczne i górnicze (druki nr 1208, 1229 i 1229-A) - trzecie czytanie.\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Łączności z Polakami za Granicą o uchwale Senatu w sprawie ustawy o zmianie ustawy o repatriacji oraz niektórych innych ustaw (druki nr 1352 i 1385).\nWybór uzupełniający do składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druk nr 1398).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nInformacja o działalności Rzecznika Praw Dziecka za rok 2024 oraz uwagi o stanie przestrzegania praw dziecka w Polsce wraz ze sprawozdaniem Komisji do Spraw Dzieci i Młodzieży, Komisji Edukacji i Nauki oraz Komisji Polityki Społecznej i Rodziny (druki nr 1162 i 1353).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks karny skarbowy oraz ustawy - Ordynacja podatkowa (druk nr 1313).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego, ustawy - Kodeks cywilny oraz niektórych innych ustaw (druk nr 1304).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowym Rejestrze Sądowym oraz niektórych innych ustaw (druk nr 1311).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o wykonywaniu działalności gospodarczej w zakresie wytwarzania i obrotu materiałami wybuchowymi, bronią, amunicją oraz wyrobami i technologią o przeznaczeniu wojskowym lub policyjnym (druk nr 1316).\nZmiany w składach osobowych komisji sejmowych (druk nr 1399).	\N	81	2026-10-03 22:10:52.854297+00	\N
38	10	38	38. Posiedzenie Sejmu RP w dniach 8, 9 i 10 lipca 2025 r.	{2025-07-08,2025-07-09,2025-07-10}	Sprawozdanie Komisji Finansów Publicznych oraz Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie ustawy o weteranach działań poza granicami państwa, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o finansach publicznych (druki nr 1280, 1397 i 1397-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo zamówień publicznych oraz ustawy o umowie koncesji na roboty budowlane lub usługi (druki nr 1302 i 1360).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o funduszach inwestycyjnych i zarządzaniu alternatywnymi funduszami inwestycyjnymi (druki nr 1305, 1357 i 1357-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druki nr 1306 i 1358).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych oraz ustawy o ewidencji ludności (druki nr 1343 i 1359).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 1309 i 1363).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o uchyleniu ustawy o Centralnej Informacji Emerytalnej (druki nr 1307, 1307-A i 1373).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o przetwarzaniu danych dotyczących przelotu pasażera (druki nr 1314 i 1386).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy o rachunkowości, ustawy o biegłych rewidentach, firmach audytorskich oraz nadzorze publicznym oraz niektórych innych ustaw (druki nr 1375, 1422 i 1422-A).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o zmianie ustawy o kontroli niektórych inwestycji oraz ustawy o dopłatach do oprocentowania kredytów bankowych udzielanych przedsiębiorcom dotkniętym skutkami COVID-19 oraz o uproszczonym postępowaniu o zatwierdzenie układu w związku z wystąpieniem COVID-19 (druki nr 1383 i 1421).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o zapasach ropy naftowej, produktów naftowych i gazu ziemnego oraz zasadach postępowania w sytuacjach zagrożenia bezpieczeństwa paliwowego państwa i zakłóceń na rynku naftowym oraz niektórych innych ustaw (druki nr 1239, 1414 i 1414-A).\nSprawozdanie Komisji do Spraw Unii Europejskiej o poselskich projektach uchwał: - w sprawie niewprowadzania w życie przepisów aktów prawnych składających się na tzw. Pakt o migracji i azylu, - w sprawie zobowiązania Rządu RP do jednostronnego wypowiedzenia Paktu Migracyjnego, - w sprawie polityki migracyjnej i ochrony wschodniej granicy Rzeczypospolitej Polskiej (druki nr 1043, 1044, 1274, 1300 i 1300-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskich projektach uchwał: - w sprawie upamiętnienia ofiar Obławy Augustowskiej w jej 80. rocznicę, - w sprawie upamiętnienia Ofiar Obławy Augustowskiej w 80. rocznicę zbrodni (druki nr 1083, 1392 i 1411).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druki nr 1264, 1362 i 1362-A).\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o zmianie ustawy - Prawo konsularne (druki nr 1342 i 1467).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o likwidacji Akademii Kopernikańskiej i Szkoły Głównej Mikołaja Kopernika (druki nr 1284, 1400 i 1400-A).\nSprawozdanie Komisji Mniejszości Narodowych i Etnicznych o poselskim projekcie ustawy o zmianie ustawy o mniejszościach narodowych i etnicznych oraz o języku regionalnym (druki nr 1076 i 1401).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 1272 i 1408).\nPierwsze czytanie rządowego projektu ustawy o zawodzie psychologa oraz samorządzie zawodowym psychologów (druk nr 1344).\nPierwsze czytanie poselskiego projektu ustawy o zawodzie psychoterapeuty oraz samorządzie zawodowym (druk nr 1345).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług oraz zmieniającej ustawę o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druk nr 1407).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw: - o zmianie ustawy o społecznych formach rozwoju mieszkalnictwa oraz niektórych innych ustaw, - o zmianie ustawy o społecznych formach rozwoju mieszkalnictwa oraz niektórych innych ustaw, - o zmianie ustawy o zmianie ustawy o finansowym wsparciu tworzenia lokali socjalnych, mieszkań chronionych, noclegowni i domów dla bezdomnych oraz niektórych innych ustaw (druki nr 1382, 1319, 1078 i 1410).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 1402).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie ustawy o aplikacji mObywatel oraz niektórych innych ustaw (druki nr 1406 i 1412).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o informatyzacji działalności podmiotów realizujących zadania publiczne oraz niektórych innych ustaw (druk nr 1374).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druk nr 1388).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od niektórych instytucji finansowych (druk nr 1320).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 1348).\nZmiany w składach osobowych komisji sejmowych (druk nr 1474).	\N	69	2026-10-03 22:10:52.854297+00	\N
39	10	39	39. Posiedzenie Sejmu RP w dniach 22, 23, 24 i 25 lipca oraz 4 i 5 sierpnia 2025 r.	{2025-07-22,2025-07-23,2025-07-24,2025-07-25,2025-08-04,2025-08-05}	Pierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druk nr 1426).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druk nr 1404).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o zwrocie podatku akcyzowego zawartego w cenie oleju napędowego wykorzystywanego do produkcji rolnej (druk nr 1428).\nPierwsze czytanie rządowego projektu ustawy o rynku kryptoaktywów (druk nr 1424).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wyborczy (druk nr 1389).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa (druk nr 1439).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druk nr 1441).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks spółek handlowych, ustawy o odpowiedzialności podmiotów zbiorowych za czyny zabronione pod groźbą kary oraz ustawy o przeciwdziałaniu praniu pieniędzy oraz finansowaniu terroryzmu (druk nr 1440).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks cywilny (druk nr 1425).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego (druk nr 1442).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Centralnej Ewidencji i Informacji o Działalności Gospodarczej i Punkcie Informacji dla Przedsiębiorcy oraz ustawy o podatku od towarów i usług (druk nr 1449).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu poprawy bezpieczeństwa ruchu drogowego (druk nr 1451).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych (druk nr 1427).\nZmiany w składach osobowych komisji sejmowych (druk nr 1521).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 1452).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o certyfikacji wykonawców zamówień publicznych (druki nr 1184, 1254 i 1254-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych (druki nr 1380 i 1415).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druki nr 1377 i 1423).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie niektórych ustaw w celu dokonania deregulacji w zakresie energetyki (druki nr 1310, 1453 i 1453-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o kosztach sądowych w sprawach cywilnych (druki nr 1242 i 1416).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo zamówień publicznych oraz niektórych innych ustaw (druki nr 1303 i 1418).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy - Karta Nauczyciela oraz niektórych innych ustaw (druki nr 1472, 1476 i 1476-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy - Karta Nauczyciela (druki nr 1438 i 1509).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy - Karta Nauczyciela (druki nr 1481 i 1511).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o szczególnych rozwiązaniach w zakresie przechowywania nawozów naturalnych (druki nr 1433, 1518 i 1518-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych oraz wsparcia przedsiębiorczości (druki nr 1376, 1419 i 1419-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks karny skarbowy oraz ustawy - Ordynacja podatkowa (druki nr 1313 i 1470).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz zmieniającej ustawę o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druki nr 1407, 1475 i 1475-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o nieodpłatnej pomocy prawnej, nieodpłatnym poradnictwie obywatelskim oraz edukacji prawnej (druki nr 1202 i 1477).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 45. rocznicy Lubelskiego Lipca '80 (druki nr 1491 i 1505).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w 90. rocznicę urodzin Jarosława Marka Rymkiewicza (druki nr 1489 i 1504).\nSprawozdanie Komisji Finansów Publicznych w sprawie sprawozdania z wykonania budżetu państwa za okres od 1 stycznia do 31 grudnia 2024 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2024 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 1295, 1364, 1490 i 1490-A).\nSprawozdanie z działalności Narodowego Banku Polskiego w 2024 roku wraz ze sprawozdaniem Komisji Finansów Publicznych (druki nr 1321 i 1335).\nSprawozdanie Komisji Finansów Publicznych o przedstawionej przez Prezesa Rady Ministrów Informacji o poręczeniach i gwarancjach udzielonych w 2024 roku przez Skarb Państwa, niektóre osoby prawne oraz Bank Gospodarstwa Krajowego (druki nr 1275 i 1396).\nSprawozdanie Komisji Odpowiedzialności Konstytucyjnej z prac nad wnioskiem wstępnym o pociągnięcie do odpowiedzialności konstytucyjnej przed Trybunałem Stanu Przewodniczącego Krajowej Rady Radiofonii i Telewizji Macieja Świrskiego (druk nr 1349).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania cywilnego, ustawy - Kodeks cywilny oraz niektórych innych ustaw (druki nr 1304, 1469 i 1469-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o informatyzacji działalności podmiotów realizujących zadania publiczne oraz niektórych innych ustaw (druki nr 1374 i 1520).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o środkach ochrony roślin (druki nr 1430, 1503 i 1503-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o refundacji leków, środków spożywczych specjalnego przeznaczenia żywieniowego oraz wyrobów medycznych oraz ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druki nr 1429 i 1507).\nPrzedstawiony przez Prezesa Rady Ministrów dokument: Informacja o realizacji ustawy o specjalnych strefach ekonomicznych. Stan na 31 grudnia 2024 r. wraz ze stanowiskiem Komisji Gospodarki i Rozwoju (druki nr 1299 i 1471).\nInformacja o działalności Krajowej Rady Sądownictwa w 2024 roku wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 1323 i 1356).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz niektórych innych ustaw (druk nr 1492).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi: - o poselskim projekcie uchwały w sprawie sprzeciwu wobec zawarcia umowy UE - Mercosur, - o komisyjnym projekcie uchwały w sprawie umowy UE - Mercosur, - o poselskim projekcie uchwały w sprawie wezwania Rządu Rzeczypospolitej Polskiej do działań zmierzających do zablokowania umowy handlowej Unii Europejskiej z krajami Mercosur, - o poselskim projekcie uchwały w sprawie podjęcia działań na rzecz budowania mniejszości blokującej w Radzie Unii Europejskiej wobec umowy o wolnym handlu między Unią Europejską a Mercosur (druki nr 831, 980, 1391, 1393 i 1478).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku z dnia 27 czerwca 2025 r. Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. o wyrażenie przez Sejm zgody na zatrzymanie i przymusowe doprowadzenie na posiedzenie Sejmowej Komisji Śledczej posła Zbigniewa Ziobry (druk nr 1543).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o działalności leczniczej (druki nr 1483, 1538 i 1538-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej oraz Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druki nr 1498 i 1502).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo restrukturyzacyjne, ustawy - Prawo upadłościowe oraz ustawy o Krajowym Rejestrze Zadłużonych (druki nr 1494 i 1512).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Obrony Narodowej o uchwale Senatu w sprawie ustawy o szczególnych zasadach przygotowania i realizacji strategicznych inwestycji w zakresie potrzeb obronności państwa lub kluczowych inwestycji w zakresie potrzeb obronności państwa lub bezpieczeństwa publicznego oraz ustanawiania stref ochronnych terenów zamkniętych (druki nr 1499 i 1552).\nSprawozdanie Komisji Edukacji i Nauki o uchwale Senatu w sprawie ustawy o Instytucie imienia Wincentego Witosa (druki nr 1497 i 1533).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o restrukturyzacji zadłużenia podmiotów prowadzących gospodarstwa rolne (druki nr 1496 i 1519).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od spadków i darowizn (druki nr 1495 i 1547).\nSprawozdanie Komisji Edukacji i Nauki o uchwale Senatu w sprawie ustawy o likwidacji Akademii Kopernikańskiej i Szkoły Głównej Mikołaja Kopernika (druki nr 1500 i 1534).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o społecznych formach rozwoju mieszkalnictwa oraz niektórych innych ustaw (druki nr 1501 i 1506).\nSprawozdanie z działalności Najwyższej Izby Kontroli w 2024 roku wraz z opinią Komisji do Spraw Kontroli Państwowej (druki nr 1405 i 1417).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu: - o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie potępienia wypowiedzi podważających prawdę o tragedii Holokaustu, - o poselskim projekcie uchwały w sprawie potępienia negowania zbrodni nazistowskiego ludobójstwa podczas II wojny światowej (druki nr 1532, 1539 i 1540).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o poselskim projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 1388 i 1554).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji do Spraw Dzieci i Młodzieży o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu zagrożeniom przestępczością na tle seksualnym i ochronie małoletnich, ustawy o Krajowym Rejestrze Karnym oraz ustawy - Prawo oświatowe (druki nr 1381, 1513 i 1513-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych (druki nr 1436 i 1544).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Prawo o postępowaniu przed sądami administracyjnymi (druki nr 1432 i 1541).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych (druki nr 1446 i 1573).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym oraz ustawy o funduszu sołeckim (druki nr 610 i 1550).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku z dnia 4 lipca 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Antoniego Macierewicza, przedłożonego przez prokuratora Prokuratury Okręgowej delegowanego do Prokuratury Krajowej, uzupełnionego w dniu 28 lipca 2025 r. (druk nr 1594).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz niektórych innych ustaw (druki nr 1492, 1588 i 1588-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym i poselskim projektach ustaw: - o ustalaniu wysokości emerytur z Funduszu Ubezpieczeń Społecznych ustalonych w czerwcu w latach 2009-2019 oraz rent rodzinnych po ubezpieczonych, którym ustalono emerytury w czerwcu w latach 2009-2019, - o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych (druki nr 1523, 909 i 1574).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku prokuratora Prokuratury Okręgowej Warszawa-Praga w Warszawie z dnia 11 lipca 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Romana Fritza (druk nr 1595).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Prawo oświatowe (druk nr 1526).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy o inwestycjach w zakresie elektrowni wiatrowych oraz niektórych innych ustaw (druki nr 1493 i 1551).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 1586 i 1593).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustawy o zapasach ropy naftowej, produktów naftowych i gazu ziemnego oraz zasadach postępowania w sytuacjach zagrożenia bezpieczeństwa paliwowego państwa i zakłóceń na rynku naftowym oraz niektórych innych ustaw (druki nr 1585 i 1592).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks postępowania cywilnego, ustawy - Kodeks cywilny oraz niektórych innych ustaw (druki nr 1577 i 1602).\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych oraz ustawy o ewidencji ludności (druki nr 1582 i 1590).\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druki nr 1581 i 1589).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o środkach ochrony roślin (druki nr 1580 i 1618).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o uchyleniu ustawy o Centralnej Informacji Emerytalnej (druki nr 1584 i 1619).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druki nr 1583 i 1617).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Obrony Narodowej o uchwale Senatu w sprawie ustawy o zmianie ustawy o weteranach działań poza granicami państwa, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o finansach publicznych (druki nr 1587 i 1616).\nSprawozdanie Komisji Gospodarki i Rozwoju o uchwale Senatu w sprawie ustawy o certyfikacji wykonawców zamówień publicznych (druki nr 1579 i 1591).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy o nieodpłatnej pomocy prawnej, nieodpłatnym poradnictwie obywatelskim oraz edukacji prawnej (druki nr 1578 i 1597).	\N	205	2026-10-03 22:10:52.854297+00	\N
40	10	40	40. Posiedzenie Sejmu RP w dniach 9, 10, 11 i 12 września 2025 r.	{2025-09-09,2025-09-10,2025-09-11,2025-09-12}	Zmiany w składach osobowych komisji sejmowych (druk nr 1664).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o funduszach inwestycyjnych i zarządzaniu alternatywnymi funduszami inwestycyjnymi (druki nr 1450 i 1545).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o rozpatrywaniu reklamacji przez podmioty rynku finansowego, o Rzeczniku Finansowym i o Funduszu Edukacji Finansowej (druki nr 1434 i 1546).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 1378 i 1508).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego (druki nr 1402 i 1549).\nSprawozdanie Komisji Nadzwyczajnej o rządowym oraz poselskim projektach ustaw o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druki nr 1426, 1404, 1548 i 1548-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o organizacji i funkcjonowaniu funduszy emerytalnych (druki nr 1443 i 1572).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych (druki nr 1522 i 1566).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych (druki nr 1431 i 1571).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w związku z określeniem zasad zakwaterowania funkcjonariuszy Policji, Straży Granicznej, Państwowej Straży Pożarnej, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Służby Ochrony Państwa oraz poprawy niektórych warunków pełnienia służby (druk nr 1623).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o Centralnej Ewidencji i Informacji o Działalności Gospodarczej i Punkcie Informacji dla Przedsiębiorcy oraz ustawy o podatku od towarów i usług (druki nr 1449 i 1565).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania cywilnego (druki nr 1442, 1559 i 1559-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks cywilny (druki nr 1425, 1558 i 1558-A).\nPierwsze czytanie rządowego projektu ustawy o bonie ciepłowniczym oraz o zmianie niektórych innych ustaw (druk nr 1684).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o środkach nadzwyczajnych mających na celu ograniczenie wysokości cen energii elektrycznej oraz wsparciu niektórych odbiorców w latach 2023-2025 oraz ustawy o szczególnych rozwiązaniach służących ochronie odbiorców energii elektrycznej w 2023 roku oraz w 2024 roku w związku z sytuacją na rynku energii elektrycznej (druk nr 1625).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu weryfikacji prawa do świadczeń na rzecz rodziny dla cudzoziemców oraz o warunkach pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa (druk nr 1685).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druki nr 1441, 1620 i 1620-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa (druki nr 1265, 1621 i 1621-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa (druki nr 1439, 1622 i 1622-A).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o rządowym projekcie ustawy o zmianie ustawy o sporcie (druki nr 1482 i 1596).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo pocztowe (druki nr 1448 i 1568).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o produktach pochodzenia zwierzęcego oraz ustawy o bezpieczeństwie żywności i żywienia (druki nr 1435 i 1570).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o zwrocie podatku akcyzowego zawartego w cenie oleju napędowego wykorzystywanego do produkcji rolnej (druki nr 1428, 1569 i 1569-A).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o Międzynarodowej Korporacji Finansowej, sporządzonej w Waszyngtonie dnia 20 lipca 1956 r. (druki nr 1484 i 1514).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o Międzynarodowym Stowarzyszeniu Rozwoju, sporządzonej w Waszyngtonie dnia 26 stycznia 1960 r. (druki nr 1487 i 1517).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o Międzynarodowym Funduszu Walutowym, sporządzonej w Bretton Woods dnia 22 lipca 1944 r., w wersji tej Umowy nadanej Drugą Poprawką przyjętą Rezolucją nr 31-4 Rady Gubernatorów Międzynarodowego Funduszu Walutowego z dnia 30 kwietnia 1976 r., wraz z Trzecią Poprawką przyjętą Rezolucją nr 45-3 Rady Gubernatorów Międzynarodowego Funduszu Walutowego z dnia 28 czerwca 1990 r. oraz z Czwartą Poprawką przyjętą Rezolucją nr 52-4 Rady Gubernatorów Międzynarodowego Funduszu Walutowego z dnia 23 września 1997 r. (druki nr 1486 i 1516).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o Międzynarodowym Banku Odbudowy i Rozwoju, sporządzonej w Bretton Woods dnia 22 lipca 1944 r. wraz z poprawkami, tj. Rezolucjami Rady Gubernatorów Międzynarodowego Banku Odbudowy i Rozwoju o numerach 221, 417, 596, 696, przyjętymi odpowiednio dnia 25 sierpnia 1965 r., 30 czerwca 1987 r., 30 stycznia 2009 r. oraz 10 lipca 2023 r. (druki nr 1485 i 1515).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Mniejszości Narodowych i Etnicznych o komisyjnym projekcie ustawy o zmianie ustawy o mniejszościach narodowych i etnicznych oraz o języku regionalnym oraz niektórych innych ustaw (druki nr 321, 1553 i 1553-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w 150. rocznicę śmierci Albina Węsierskiego (druki nr 1562 i 1599).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 45. rocznicy powstania Niezależnego Zrzeszenia Studentów (druki nr 1052 i 1598).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z określeniem zasad zakwaterowania funkcjonariuszy Policji, Straży Granicznej, Państwowej Straży Pożarnej, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Służby Ochrony Państwa oraz poprawy niektórych warunków pełnienia służby (druki nr 1623, 1687 i 1687-A).\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Traktatu o wzmocnionej współpracy i przyjaźni między Rzecząpospolitą Polską a Republiką Francuską, podpisanego w Nancy dnia 9 maja 2025 r. (druki nr 1384 i 1542).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o Centralnym Porcie Komunikacyjnym (druki nr 1637 i 1686).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o pilnym rządowym projekcie ustawy o zmianie ustawy o zapasach ropy naftowej, produktów naftowych i gazu ziemnego oraz zasadach postępowania w sytuacjach zagrożenia bezpieczeństwa paliwowego państwa i zakłóceń na rynku naftowym oraz ustawy - Prawo energetyczne (druki nr 1683 i 1691).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie niektórych ustaw w celu weryfikacji prawa do świadczeń na rzecz rodziny dla cudzoziemców oraz o warunkach pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa (druki nr 1685 i 1697).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o bonie ciepłowniczym oraz o zmianie niektórych innych ustaw (druki nr 1684 i 1696).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks pracy oraz ustawy o zakładowym funduszu świadczeń socjalnych (druk nr 1601).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druk nr 1600).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wyborczy (druk nr 1529).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 1674).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Prawo o postępowaniu przed sądami administracyjnymi (druki nr 1432, 1541 i 1541-A) - trzecie czytanie.\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym oraz ustawy o funduszu sołeckim (druki nr 610 i 1550) - trzecie czytanie.\nPowołanie Prezesa Najwyższej Izby Kontroli (druki nr 1575, 1576, 1672 i 1673).\nWybór Przewodniczącego Państwowej Komisji do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 (druk nr 1695).\nWybór sędziów Trybunału Konstytucyjnego (druki nr 1454, 1455, 1689 i 1690).\nInformacja Wiceprezesa Rady Ministrów, Ministra Obrony Narodowej na temat naruszenia polskiej przestrzeni powietrznej przez rosyjskie drony.\nZmiany w składach osobowych komisji sejmowych (druk nr 1706).\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie wyrażenia sprzeciwu wobec naruszenia przestrzeni powietrznej Rzeczypospolitej Polskiej przez Federację Rosyjską przy użyciu bezzałogowych statków powietrznych w dniach 9 i 10 września 2025 r. (druk nr 1701).	\N	123	2026-10-03 22:10:52.854297+00	\N
41	10	41	41. Posiedzenie Sejmu RP w dniach 24, 25 i 26 września 2025 r.	{2025-09-24,2025-09-25,2025-09-26}	Złożenie przysięgi przez Prezesa Najwyższej Izby Kontroli.\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o Centralnym Porcie Komunikacyjnym (druki nr 1637 i 1686) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Deregulacji o poselskim projekcie ustawy o ograniczeniu biurokracji i barier prawnych (druki nr 558, 558-A i 1420).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz niektórych innych ustaw (druki nr 1609, 1670 i 1670-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o produktach biobójczych (druki nr 1604, 1669 i 1669-A).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy zmieniającym ustawę o zmianie ustawy - Prawo pocztowe (druki nr 1610 i 1665).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy - Prawo geodezyjne i kartograficzne (druki nr 1525, 1663 i 1663-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o wymianie informacji z organami ścigania państw członkowskich Unii Europejskiej, państw trzecich, agencjami Unii Europejskiej oraz organizacjami międzynarodowymi (druki nr 1605 i 1668).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o zbiorowym zaopatrzeniu w wodę i zbiorowym odprowadzaniu ścieków oraz niektórych innych ustaw (druki nr 1606, 1666 i 1666-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o rynku kryptoaktywów (druki nr 1424 i 1720).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 608, 1662 i 1662-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o pomocy państwa skierowanej do armatorów jednostek pływających w związku z wprowadzeniem zakazu połowu dorsza na Morzu Bałtyckim (druki nr 1612, 1624 i 1624-A).\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie ustawy o języku polskim (druki nr 1611 i 1705).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Profilaktyki Zdrowotnej (druki nr 1711 i 1717).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Józefa Czapskiego (druki nr 1001 i 1255).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem powstania Polskiej Kolei (druki nr 1206 i 1256).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Ignacego Daszyńskiego (druki nr 1217 i 1257).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Sergiusza Piaseckiego (druki nr 1219 i 1258).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Polskiego Radia (druki nr 1216 i 1259).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Stanisława Staszica (druki nr 1116 i 1288).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Mieczysława Fogga (druki nr 1220 i 1289).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2026 Rokiem Józefa Maksymiliana Ossolińskiego (druki nr 1218 i 1368).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym oraz niektórych innych ustaw (druki nr 1312, 1361 i 1361-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym (druki nr 1608 i 1667).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Krajowym Rejestrze Sądowym oraz niektórych innych ustaw (druki nr 1311 i 1682).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Kodeks spółek handlowych, ustawy o odpowiedzialności podmiotów zbiorowych za czyny zabronione pod groźbą kary oraz ustawy o przeciwdziałaniu praniu pieniędzy oraz finansowaniu terroryzmu (druki nr 1440, 1681 i 1681-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych (druki nr 1607 i 1698).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo o ruchu drogowym (druki nr 1437, 1437-A i 1704).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych (druki nr 1427, 1703 i 1703-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o komisyjnym projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1530 i 1556).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1707 i 1738).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zapewnieniu realizacji inwestycji Centralnego Portu Komunikacyjnego (druk nr 1631).\nSprawozdanie Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Traktatu o wzajemnych stosunkach i współpracy w Azji Południowo-Wschodniej, sporządzonego w Denpasarze dnia 24 lutego 1976 r., wraz z Protokołami zmieniającymi (druki nr 1524 i 1671).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o utworzeniu Parku Narodowego Doliny Dolnej Odry (druki nr 1721, 1736 i 1736-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2025 rokiem Franciszka Karpińskiego (druki nr 352 i 1699).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 100. rocznicy urodzin profesora Wiktora Zina (druki nr 1656 i 1700).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia setnej rocznicy powstania Rodziny Wojskowej (druki nr 1709 i 1716).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżycielki prywatnej Małgorzaty Zych, reprezentowanej przez adwokata Pawła Czugę, z dnia 13 maja 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Grzegorza Płaczka (druk nr 1555).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o systemie oświaty oraz ustawy - Prawo oświatowe (druk nr 1603).\nPierwsze czytanie rządowego projektu ustawy o układach zbiorowych pracy i porozumieniach zbiorowych (druk nr 1627).\nPowołanie Prezesa Urzędu Komunikacji Elektronicznej (druki nr 1680 i 1735).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw (druk nr 1677).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks wykroczeń oraz ustawy - Kodeks postępowania w sprawach o wykroczenia (druk nr 1635).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks karny, ustawy - Kodeks wykroczeń oraz ustawy - Kodeks postępowania w sprawach o wykroczenia (druk nr 1636).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym oraz niektórych innych ustaw (druk nr 1638).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks pracy oraz niektórych innych ustaw (druki nr 1734 i 1737).\nZmiany w składach osobowych komisji sejmowych (druk nr 1740).	\N	107	2026-10-03 22:10:52.854297+00	\N
42	10	42	42. Posiedzenie Sejmu RP w dniach 7, 8 i 9 października 2025 r.	{2025-10-07,2025-10-08,2025-10-09}	Sprawozdanie Komisji Polityki Społecznej i Rodziny o poselskim projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 1187 i 1688).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej oraz Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o postępowaniu w sprawach dotyczących pomocy publicznej (druki nr 1626 i 1725).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o ochronie roślin przed agrofagami oraz niektórych innych ustaw (druki nr 1561, 1723 i 1723-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy o zmianie ustawy o ochronie zabytków i opiece nad zabytkami oraz niektórych innych ustaw (druki nr 1445, 1702 i 1702-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o systemie informacji w ochronie zdrowia oraz ustawy o ochronie ludności i obronie cywilnej (druki nr 1560 i 1739).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Prawo o ustroju sądów powszechnych (druki nr 1678, 1718 i 1718-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o rzeczach znalezionych oraz ustawy - Kodeks cywilny (druk nr 1629).\nInformacja o działalności Rzecznika Praw Obywatelskich oraz o stanie przestrzegania wolności i praw człowieka i obywatela w roku 2024 wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 1462 i 1719).\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Republiką Peru o wzajemnej pomocy prawnej w sprawach karnych, podpisanej w Limie dnia 28 maja 2025 r. (druki nr 1639 i 1713).\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o ratyfikacji Umowy między Rządem Rzeczypospolitej Polskiej a Międzynarodowym Trybunałem Karnym w sprawie wykonywania wyroków Międzynarodowego Trybunału Karnego, podpisanej w Hadze dnia 3 grudnia 2024 r. (druki nr 1679 i 1714).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o zawodach pielęgniarki i położnej (druki nr 1727 i 1772).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o doradztwie podatkowym oraz ustawy - Prawo o postępowaniu przed sądami administracyjnymi (druk nr 1729).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 1728).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych i ustawy o podatku od niektórych instytucji finansowych (druk nr 1752).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druk nr 1753).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o promowaniu wytwarzania energii elektrycznej w morskich farmach wiatrowych oraz niektórych innych ustaw (druki nr 1746, 1774 i 1774-A).\nPierwsze czytanie rządowego projektu ustawy budżetowej na rok 2026 (druk nr 1749).\nPierwsze czytanie rządowego projektu ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2026 (druk nr 1750).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks postępowania cywilnego (druki nr 1742 i 1778).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks cywilny (druki nr 1743 i 1779).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o uchwale Senatu w sprawie ustawy o zmianie ustawy o sporcie (druki nr 1745 i 1756).\nSprawozdanie Komisji do Spraw Deregulacji o poselskim projekcie ustawy o ograniczeniu biurokracji i barier prawnych (druki nr 558, 558-A, 1420 i 1420-A) - trzecie czytanie.\nZmiany w składach osobowych komisji sejmowych (druk nr 1795).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 1613).	\N	57	2026-10-03 22:10:52.854297+00	\N
43	10	43	43. Posiedzenie Sejmu RP w dniach 15, 16 i 17 października 2025 r.	{2025-10-15,2025-10-16,2025-10-17}	Sprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o układach zbiorowych pracy i porozumieniach zbiorowych (druki nr 1627 i 1791).\nSprawozdanie Komisji Gospodarki i Rozwoju o senackim projekcie ustawy o zmianie ustawy o rzecznikach patentowych (druki nr 1649, 1722 i 1722-A).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks wyborczy (druki nr 1389, 1715 i 1715-A).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym oraz niektórych innych ustaw (druki nr 1638, 1773 i 1773-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zdrowiu zwierząt (druki nr 1479 i 1803).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o krajowym systemie ewidencji producentów, ewidencji gospodarstw rolnych oraz ewidencji wniosków o przyznanie płatności (druki nr 1634 i 1782).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o cudzoziemcach oraz niektórych innych ustaw (druki nr 1630, 1775 i 1775-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o zdrowiu publicznym (druki nr 1107 i 1793).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób prawnych i ustawy o podatku od niektórych instytucji finansowych (druki nr 1752 i 1802).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druki nr 1753, 1801 i 1801-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 200. rocznicy urodzin Karola Miarki (starszego), wybitnego działacza społecznego Ziemi Śląskiej (druki nr 1710 i 1755).\nSprawozdanie Komisji Nadzwyczajnej o poselskich projektach ustaw o zmianie ustawy o ochronie zwierząt (druki nr 703, 835, 1769 i 1769-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw (druki nr 1677, 1794 i 1794-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Prawo o notariacie oraz ustawy o księgach wieczystych i hipotece (druki nr 1444 i 1675).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druk nr 1798).\nSprawozdanie Komisji do Spraw Unii Europejskiej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o ochronie inwestycji między Unią Europejską i jej państwami członkowskimi, z jednej strony, a Socjalistyczną Republiką Wietnamu, z drugiej strony, sporządzonej w Hanoi dnia 30 czerwca 2019 r. (druki nr 1747 i 1783).\nPierwsze czytanie rządowego projektu ustawy o szczególnych rozwiązaniach w zakresie rozpoznawania spraw dotyczących zawartych z konsumentami umów kredytu denominowanego lub indeksowanego do franka szwajcarskiego (druk nr 1758).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druk nr 1757).\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Centralnej Ewidencji i Informacji o Działalności Gospodarczej i Punkcie Informacji dla Przedsiębiorcy oraz ustawy o podatku od towarów i usług (druki nr 1741 i 1770).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o rozpatrywaniu reklamacji przez podmioty rynku finansowego, o Rzeczniku Finansowym i o Funduszu Edukacji Finansowej (druki nr 1744 i 1771).\nZmiany w składach osobowych komisji sejmowych (druk nr 1832).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz niektórych innych ustaw (druk nr 1726).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 1825).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druk nr 1826).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o uchwale Senatu w sprawie ustawy o utworzeniu Parku Narodowego Doliny Dolnej Odry (druki nr 1834 i 1840).	\N	76	2026-10-03 22:10:52.854297+00	\N
44	10	44	44. Posiedzenie Sejmu RP w dniach 5, 6 i 7 listopada 2025 r.	{2025-11-05,2025-11-06,2025-11-07}	Pierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 1825) - kontynuacja.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druk nr 1826) - kontynuacja.\nZmiany w składach osobowych komisji sejmowych (druk nr 1883).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym oraz niektórych innych ustaw (druki nr 1839 i 1879).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o dochodach jednostek samorządu terytorialnego (druki nr 1824, 1833 i 1833-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2026 (druki nr 1750, 1821 i 1821-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o zdrowiu publicznym oraz ustawy o podatku dochodowym od osób fizycznych (druk nr 1836).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks wykroczeń oraz ustawy - Kodeks postępowania w sprawach o wykroczenia (druki nr 1635 i 1780).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks karny, ustawy - Kodeks wykroczeń oraz ustawy - Kodeks postępowania w sprawach o wykroczenia (druki nr 1636 i 1781).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o układach zbiorowych pracy i porozumieniach zbiorowych (druki nr 1866 i 1875).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o doradztwie podatkowym oraz ustawy - Prawo o postępowaniu przed sądami administracyjnymi (druki nr 1729 i 1831).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druki nr 1798 i 1847).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 1835).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 1838).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od spadków i darowizn (druk nr 1837).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych (druki nr 1628 i 1828).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób prawnych (druki nr 1826 i 1902).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług (druki nr 1728 i 1827).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o nadzorze nad ogólnym bezpieczeństwem produktów (druki nr 1761 i 1823).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 1308, 1829 i 1829-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Kultury Fizycznej, Sportu i Turystyki o rządowym projekcie ustawy o zmianie ustawy o imprezach turystycznych i powiązanych usługach turystycznych oraz niektórych innych ustaw (druki nr 1762 i 1800).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy - Prawo ochrony środowiska oraz niektórych innych ustaw (druki nr 1804, 1909 i 1909-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo budowlane oraz niektórych innych ustaw (druki nr 1379, 1563 i 1563-A).\nRozpatrzenie uchwały Senatu w sprawie ustawy o zmianie ustawy o podatku dochodowym od osób prawnych i ustawy o podatku od niektórych instytucji finansowych (druk nr 1921).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 1825 i 1901).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie niektórych ustaw w celu poprawy bezpieczeństwa ruchu drogowego (druki nr 1451, 1822 i 1822-A).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o zdrowiu publicznym oraz ustawy o podatku dochodowym od osób fizycznych (druki nr 1836, 1911 i 1911-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Kierownika Zespołu Śledczego Nr 2 Prokuratury Krajowej z dnia 28 października 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Zbigniewa Ziobry (druk nr 1914).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o funkcjonowaniu górnictwa węgla kamiennego oraz ustawy o podatku dochodowym od osób fizycznych (druk nr 1880).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od wydobycia niektórych kopalin oraz niektórych innych ustaw (druk nr 1881).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druk nr 1856).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o systemie zarządzania emisjami gazów cieplarnianych i innych substancji oraz niektórych innych ustaw (druk nr 1855).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw związanych z funkcjonowaniem administracji rządowej (druk nr 1859).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 1882).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz niektórych innych ustaw (druk nr 1726) - kontynuacja.\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o ruchu drogowym (druki nr 1842 i 1864).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o rynku kryptoaktywów (druki nr 1843 i 1915).\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o produktach biobójczych (druki nr 1844 i 1870).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o wymianie informacji z organami ścigania państw członkowskich Unii Europejskiej, państw trzecich, agencjami Unii Europejskiej oraz organizacjami międzynarodowymi (druki nr 1845 i 1878).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1846 i 1904).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 1867 i 1876).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie roślin przed agrofagami oraz niektórych innych ustaw (druki nr 1869 i 1908).\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie informacji w ochronie zdrowia oraz ustawy o ochronie ludności i obronie cywilnej (druki nr 1865 i 1871).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1868 i 1905).\nZmiany w składach osobowych komisji sejmowych (druk nr 1918).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks cywilny, ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych oraz ustawy o działalności ubezpieczeniowej i reasekuracyjnej (druk nr 1797).	\N	158	2026-10-03 22:10:52.854297+00	\N
45	10	45	45. Posiedzenie Sejmu RP w dniach 18, 19, 20 i 21 listopada 2025 r.	{2025-11-18,2025-11-19,2025-11-20,2025-11-21}	Wybór Marszałka Sejmu Rzeczypospolitej Polskiej (druk nr 1968).\nWybór Wicemarszałka Sejmu Rzeczypospolitej Polskiej (druk nr 1972).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o ustanowieniu "Programu modernizacji Policji, Straży Granicznej, Państwowej Straży Pożarnej i Służby Ochrony Państwa w latach 2026-2029" (druki nr 1860, 1907 i 1907-A).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz niektórych innych ustaw (druki nr 1857, 1912 i 1912-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy - Prawo oświatowe oraz niektórych innych ustaw, ustawę o systemie informacji oświatowej, ustawę - Prawo oświatowe oraz ustawę - Prawo o szkolnictwie wyższym i nauce (druki nr 1805 i 1872).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druki nr 1835 i 1923).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druki nr 1838 i 1925).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 1930).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Służbie Więziennej oraz niektórych innych ustaw (druk nr 1951).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 1886 i 1974).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy - Kodeks karny oraz niektórych innych ustaw oraz o zmianie niektórych innych ustaw (druki nr 1863, 1926 i 1926-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od spadków i darowizn (druki nr 1837 i 1924).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o systemie zarządzania emisjami gazów cieplarnianych i innych substancji oraz niektórych innych ustaw (druki nr 1855 i 1969).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 1757, 1922 i 1922-A).\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o zmianie niektórych ustaw w celu usprawnienia działań Sił Zbrojnych Rzeczypospolitej Polskiej na wypadek zagrożenia bezpieczeństwa państwa na polskich obszarach morskich oraz zapewnienia bezpieczeństwa na Morzu Bałtyckim (druki nr 1862 i 1928).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o Centralnym Azylu dla Zwierząt (druki nr 1861, 1910 i 1910-A).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Spraw Zagranicznych o poselskim projekcie uchwały w sprawie pilnej potrzeby zabezpieczenia terenu wokół Ministerstwa Obrony Narodowej (druki nr 1724 i 1853).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druki nr 1856 i 1973).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o statystyce publicznej oraz niektórych innych ustaw (druki nr 1806 i 1967).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od wydobycia niektórych kopalin oraz niektórych innych ustaw (druki nr 1881 i 1975).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o Straży Marszałkowskiej oraz ustawy o podatku dochodowym od osób fizycznych (druk nr 1894).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy o Narodowym Centrum Badań i Rozwoju oraz niektórych innych ustaw (druki nr 1807, 1917 i 1917-A).\nSprawozdanie Komisji Edukacji i Nauki o poselskim projekcie ustawy o zmianie ustawy - Karta Nauczyciela (druki nr 1945, 1977 i 1977-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Porozumienia wykonawczego między Rządem Rzeczypospolitej Polskiej a Rządem Stanów Zjednoczonych Ameryki do Umowy między Rządem Rzeczypospolitej Polskiej a Rządem Stanów Zjednoczonych Ameryki o wzmocnionej współpracy obronnej w sprawie zatrudniania lokalnych pracowników cywilnych, podpisanego w Warszawie dnia 20 lutego 2025 r. oraz w Stuttgarcie dnia 3 kwietnia 2025 r. (druki nr 1796 i 1841).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 1930 i 1987).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Służbie Więziennej oraz niektórych innych ustaw (druki nr 1951 i 1989).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o pilnym rządowym projekcie ustawy o zmianie ustawy o środkach ochrony roślin (druki nr 1950 i 1986).\nSprawozdanie Komisji Zdrowia o pilnym rządowym projekcie ustawy o zmianie ustawy o Funduszu Medycznym (druki nr 1995 i 1998).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o zaopatrzeniu emerytalnym funkcjonariuszy Policji, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Straży Granicznej, Straży Marszałkowskiej, Służby Ochrony Państwa, Państwowej Straży Pożarnej, Służby Celno-Skarbowej i Służby Więziennej oraz ich rodzin oraz ustawy o Krajowej Administracji Skarbowej oraz senackim projekcie ustawy o zmianie ustawy o zaopatrzeniu emerytalnym funkcjonariuszy Policji, Agencji Bezpieczeństwa Wewnętrznego, Agencji Wywiadu, Służby Kontrwywiadu Wojskowego, Służby Wywiadu Wojskowego, Centralnego Biura Antykorupcyjnego, Straży Granicznej, Straży Marszałkowskiej, Służby Ochrony Państwa, Państwowej Straży Pożarnej, Służby Celno-Skarbowej i Służby Więziennej oraz ich rodzin (druki nr 1858, 232 i 1997).\nPierwsze czytanie rządowego projektu ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druk nr 1884).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o dokumentach publicznych oraz ustawy o podatku akcyzowym (druk nr 1996).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o notariacie oraz ustawy o księgach wieczystych i hipotece (druki nr 1934 i 1946).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o cudzoziemcach oraz niektórych innych ustaw (druki nr 1935 i 1949).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zdrowiu zwierząt (druki nr 1936 i 2000).\nPowołanie Prezesa Instytutu Pamięci Narodowej - Komisji Ścigania Zbrodni Przeciwko Narodowi Polskiemu (druki nr 1900 i 1976).\nPowołanie członków Rady Fiskalnej (druki nr 1784, 1785, 1786, 1787, 1788, 1789, 1790, 1978, 1979, 1980, 1981, 1982, 1983 i 1984).\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie styczeń-czerwiec 2025 r. (przewodnictwo Polski w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 1748 i 1932).\nPierwsze czytanie rządowego projektu ustawy o asystencji osobistej osób z niepełnosprawnościami (druk nr 1929).\nPierwsze czytanie poselskiego projektu ustawy o asystencji osobistej osób z niepełnosprawnościami (druk nr 1933).\nPierwsze czytanie rządowego projektu ustawy o szczególnych zasadach realizacji zadań związanych z inwestycją w zakresie bezpieczeństwa i obronności realizowaną w ramach Krajowego Planu Odbudowy i Zwiększania Odporności (druk nr 1885).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o broni i amunicji (druk nr 1931).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw (druk nr 1985).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw (druki nr 1985 i 1993).\nZmiany w składzie sekretarzy Sejmu (druk nr 1994).\nZmiany w składach osobowych komisji sejmowych (druk nr 2001).	\N	155	2026-10-03 22:10:52.854297+00	\N
46	10	46	46. Posiedzenie Sejmu RP w dniach 3, 4 i 5 grudnia 2025 r.	{2025-12-03,2025-12-04,2025-12-05}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy budżetowej na rok 2026 (druki nr 1749 i 1999).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie niektórych ustaw związanych z funkcjonowaniem administracji rządowej (druki nr 1859, 1992 i 1992-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o dokumentach publicznych oraz ustawy o podatku akcyzowym (druki nr 1996, 2024 i 2024-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy o zakładowym funduszu świadczeń socjalnych (druki nr 1601, 1906 i 1906-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Kodeks cywilny, ustawy o ubezpieczeniach obowiązkowych, Ubezpieczeniowym Funduszu Gwarancyjnym i Polskim Biurze Ubezpieczycieli Komunikacyjnych oraz ustawy o działalności ubezpieczeniowej i reasekuracyjnej (druki nr 1797 i 1991).\nPoprawione sprawozdanie Komisji do Spraw Deregulacji oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym (druki nr 1608, 1947 i 1947-A).\nSprawozdanie Komisji Obrony Narodowej o rządowym projekcie ustawy o szczególnych zasadach realizacji zadań związanych z inwestycją w zakresie bezpieczeństwa i obronności realizowaną w ramach Krajowego Planu Odbudowy i Zwiększania Odporności (druki nr 1885, 2025 i 2025-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o funkcjonowaniu górnictwa węgla kamiennego oraz ustawy o podatku dochodowym od osób fizycznych (druki nr 1880 i 1970).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o spółdzielniach mieszkaniowych oraz niektórych innych ustaw (druki nr 1938, 1952 i 1952-A).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 1767 i 1948).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustaw w celu usprawnienia mechanizmów wsparcia odbiorców energii elektrycznej i ciepła (druki nr 2026 i 2056).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 60. rocznicy orędzia pojednania, wystosowanego przez polski episkopat do episkopatu Niemiec (druki nr 2008 i 2022).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia Dni Pamięci Rewolty Grudniowej 1970 (druki nr 2011 i 2023).\nSprawozdanie Komisji do Spraw Unii Europejskiej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o ochronie inwestycji między Unią Europejską i jej państwami członkowskimi, z jednej strony, a Republiką Singapuru, z drugiej strony, sporządzonej w Brukseli dnia 19 października 2018 r. (druki nr 1887 i 1954).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o doradztwie podatkowym oraz ustawy - Prawo o postępowaniu przed sądami administracyjnymi (druki nr 2016 i 2050).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo budowlane oraz niektórych innych ustaw (druki nr 2018 i 2020).\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 2015 i 2021).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu poprawy bezpieczeństwa ruchu drogowego (druki nr 2019 i 2043).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy zmieniającej ustawę o zmianie ustawy - Kodeks karny oraz niektórych innych ustaw oraz o zmianie niektórych innych ustaw (druki nr 2017 i 2051).\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie styczeń-czerwiec 2025 r. (przewodnictwo Polski w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 1748 i 1932) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o broni i amunicji (druk nr 1931) - kontynuacja.\nZmiany w składach osobowych komisji sejmowych (druk nr 2045).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o krajowym systemie cyberbezpieczeństwa oraz niektórych innych ustaw (druk nr 1955).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Marka Grechuty w 80. rocznicę urodzin (druki nr 1965 i 2041).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o komisyjnym projekcie uchwały w sprawie ustanowienia Dnia Pamięci Prezydenta Gabriela Narutowicza (druki nr 2012 i 2042).\nInformacja Prezesa Rady Ministrów dotycząca spraw z zakresu bezpieczeństwa Państwa.\nSprawozdanie Komisji Finansów Publicznych o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 7 listopada 2025 r. o rynku kryptoaktywów (druki nr 2048 i 2059).	\N	75	2026-10-03 22:10:52.854297+00	\N
47	10	47	47. Posiedzenie Sejmu RP w dniu 5 grudnia 2025 r.	{2025-12-05}	Sprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy budżetowej na rok 2026 (druki nr 1749, 1999 i 1999-A) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Unii Europejskiej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy o ochronie inwestycji między Unią Europejską i jej państwami członkowskimi, z jednej strony, a Republiką Singapuru, z drugiej strony, sporządzonej w Brukseli dnia 19 października 2018 r. (druki nr 1887 i 1954) - trzecie czytanie.\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustaw w celu usprawnienia mechanizmów wsparcia odbiorców energii elektrycznej i ciepła (druki nr 2026, 2056 i 2056-A) - trzecie czytanie.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Marka Grechuty w 80. rocznicę urodzin (druki nr 1965 i 2041) - głosowanie.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o komisyjnym projekcie uchwały w sprawie ustanowienia Dnia Pamięci Prezydenta Gabriela Narutowicza (druki nr 2012 i 2042) - głosowanie.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o krajowym systemie cyberbezpieczeństwa oraz niektórych innych ustaw (druk nr 1955) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wyborczy (druk nr 2006).	\N	105	2026-10-03 22:10:52.854297+00	\N
48	10	48	48. Posiedzenie Sejmu RP w dniach 17, 18 i 19 grudnia 2025 r.	{2025-12-17,2025-12-18,2025-12-19}	Sprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o dostępie do zasobów genetycznych i podziale korzyści z ich wykorzystania (druki nr 2028 i 2052).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o finansowaniu zadań oświatowych (druki nr 2005 i 2057).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o rzeczach znalezionych oraz ustawy - Kodeks cywilny (druki nr 1629 i 1877).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o gospodarce nieruchomościami, ustawy o ochronie praw lokatorów, mieszkaniowym zasobie gminy i o zmianie Kodeksu cywilnego oraz ustawy o finansowym wsparciu niektórych przedsięwzięć mieszkaniowych (druki nr 1318 i 2062).\nPierwsze czytanie rządowego projektu ustawy o rynku kryptoaktywów (druk nr 2064).\nSprawozdanie Komisji Nadzwyczajnej o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 7 listopada 2025 r. o zmianie ustawy o ochronie zwierząt (druki nr 2049 i 2065).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks wyborczy (druki nr 556, 1990 i 1990-A).\nSprawozdanie Komisji Infrastruktury o senackim projekcie ustawy o zmianie ustawy o transporcie kolejowym (druki nr 2063 i 2073).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw (druk nr 2027).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy o szczególnych zasadach przygotowania do realizacji inwestycji w zakresie budowli przeciwpowodziowych (druki nr 1816 i 2055).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy zmieniającej ustawę o zmianie ustawy o dotacji przeznaczonej dla niektórych podmiotów (druki nr 2072 i 2088).\nSprawozdanie Komisji Obrony Narodowej o poselskim projekcie ustawy o ustanowieniu Dnia Inwalidy Wojennego (druki nr 1730 i 1927).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o rynku kryptoaktywów (druki nr 2064 i 2093).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Adama Chętnika w 140. rocznicę urodzin (druki nr 1614 i 1919).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w 50. rocznicę powstania pierwszego Uniwersytetu Trzeciego Wieku w Polsce (druki nr 1895 i 1913).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 120. rocznicy urodzin Romana Brandstaettera (druki nr 2066 i 2094).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks wyborczy (druk nr 2006) - kontynuacja.\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o uchwale Senatu w sprawie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2069 i 2091).\nSprawozdanie Komisji Obrony Narodowej o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu usprawnienia działań Sił Zbrojnych Rzeczypospolitej Polskiej na wypadek zagrożenia bezpieczeństwa państwa na polskich obszarach morskich oraz zapewnienia bezpieczeństwa na Morzu Bałtyckim (druki nr 2068 i 2095).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie ubezpieczeń społecznych oraz niektórych innych ustaw (druki nr 2070 i 2085).\nSprawozdanie Komisji Edukacji i Nauki o uchwale Senatu w sprawie ustawy o zmianie ustawy o Narodowym Centrum Badań i Rozwoju oraz niektórych innych ustaw (druki nr 2071 i 2090).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu usprawnienia mechanizmów wsparcia odbiorców energii elektrycznej i ciepła (druki nr 2067 i 2089).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o funkcjonowaniu banków spółdzielczych, ich zrzeszaniu się i bankach zrzeszających oraz niektórych innych ustaw (druk nr 1937).\nSprawozdanie Rady Ministrów z wykonania ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 1966 i 2053).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o działaczach opozycji antykomunistycznej oraz osobach represjonowanych z powodów politycznych oraz niektórych innych ustaw (druk nr 1889).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o obywatelstwie polskim (druk nr 1888).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 1731).\nPierwsze czytanie poselskiego projektu ustawy o likwidacji Funduszu Przeciwdziałania COVID-19 (druk nr 1652).\nZmiany w składach osobowych komisji sejmowych (druk nr 2096).	\N	69	2026-10-03 22:10:52.854297+00	\N
49	10	49	49. Posiedzenie Sejmu RP w dniach 8 i 9 stycznia 2026 r.	{2026-01-08,2026-01-09}	Sprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks wyborczy (druki nr 1529 i 2044).\nSprawozdanie Komisji Polityki Społecznej i Rodziny oraz Komisji Zdrowia o rządowym projekcie ustawy o zawodzie psychologa oraz samorządzie zawodowym psychologów (druki nr 1344, 2100 i 2100-A).\nSprawozdanie Komisji Mniejszości Narodowych i Etnicznych o poselskim projekcie ustawy o zmianie ustawy o mniejszościach narodowych i etnicznych oraz o języku regionalnym oraz niektórych innych ustaw (druki nr 1346, 1988 i 1988-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw (druki nr 2027, 2087 i 2087-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o komisyjnym projekcie ustawy o zmianie ustawy o ograniczeniu prowadzenia działalności gospodarczej przez osoby pełniące funkcje publiczne (druki nr 1763 i 2046).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o poselskim projekcie ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz ustawy o kierujących pojazdami (druki nr 1939 i 2114).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o pilnym rządowym projekcie ustawy o zmianie ustawy o księgach wieczystych i hipotece oraz ustawy o Krajowym Rejestrze Sądowym (druki nr 2105 i 2113).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowym Rejestrze Karnym oraz niektórych innych ustaw (druk nr 2075).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o poselskim projekcie ustawy o zmianie ustawy o gospodarce opakowaniami i odpadami opakowaniowymi oraz ustawy o zmianie ustawy o gospodarce opakowaniami i odpadami opakowaniowymi oraz niektórych innych ustaw (druki nr 2112 i 2138).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPierwsze czytanie rządowego projektu ustawy o działalności kosmicznej (druk nr 2078).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o wymianie informacji podatkowych z innymi państwami oraz niektórych innych ustaw (druk nr 2106).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 2118).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy budżetowej na rok 2026 (druki nr 2103 i 2135).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw związanych z funkcjonowaniem administracji rządowej (druki nr 2104 i 2115).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o obywatelstwie polskim (druk nr 1888) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druk nr 1731) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o likwidacji Funduszu Przeciwdziałania COVID-19 (druk nr 1652) - kontynuacja.\nSprawozdanie Rady Ministrów z wykonania ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 1966 i 2053) - głosowanie.\nZmiany w składach osobowych komisji sejmowych (druk nr 2136).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Centralnej Ewidencji i Informacji o Działalności Gospodarczej i Punkcie Informacji dla Przedsiębiorcy oraz niektórych innych ustaw (druk nr 2076).	\N	55	2026-10-03 22:10:52.854297+00	\N
51	10	51	51. Posiedzenie Sejmu RP w dniach 10, 11, 12 i 13 lutego 2026 r.	{2026-02-10,2026-02-11,2026-02-12,2026-02-13}	Sprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o świadczeniach pieniężnych z ubezpieczenia społecznego w razie choroby i macierzyństwa (druki nr 2122 i 2154).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o poselskim projekcie ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych (druki nr 2031 i 2190).\nPierwsze czytanie poselskiego projektu ustawy o Karcie Rodziny Mundurowej (druk nr 1964).\nPierwsze czytanie poselskiego projektu ustawy o zadośćuczynieniu ofiarom i rodzinom ofiar przestępstw popełnionych na tle narodowościowym, religijnym lub rasowym w latach 1945-1946 (druk nr 2030).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Krajowym Rejestrze Karnym oraz niektórych innych ustaw (druki nr 2075, 2149 i 2149-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy o zmianie ustawy o ochronie zabytków i opiece nad zabytkami oraz ustawy o Krajowej Administracji Skarbowej (druki nr 2160 i 2193).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druk nr 2159).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz niektórych innych ustaw (druki nr 2061, 2175 i 2175-A).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy o systemie oświaty oraz ustawy o finansowaniu zadań oświatowych (druki nr 2178 i 2191).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Obrony Narodowej o rządowym projekcie ustawy o działalności kosmicznej (druki nr 2078, 2156 i 2156-A).\nSprawozdanie Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o zmianie ustawy o obrocie z zagranicą towarami, technologiami i usługami o znaczeniu strategicznym dla bezpieczeństwa państwa, a także dla utrzymania międzynarodowego pokoju i bezpieczeństwa oraz ustawy o wykonywaniu działalności gospodarczej w zakresie wytwarzania i obrotu materiałami wybuchowymi, bronią, amunicją oraz wyrobami i technologią o przeznaczeniu wojskowym lub policyjnym (druki nr 2119 i 2157).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o komisyjnym projekcie ustawy o zmianie ustawy o wykonywaniu mandatu posła i senatora (druki nr 2029 i 2187).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Sprawiedliwości i Praw Człowieka o poselskim projekcie ustawy o niekaraniu ochotników broniących wolności i niepodległości Ukrainy (druki nr 1196, 2189 i 2189-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Gospodarki i Rozwoju o rządowym projekcie ustawy o zmianie ustawy o Centralnej Ewidencji i Informacji o Działalności Gospodarczej i Punkcie Informacji dla Przedsiębiorcy oraz niektórych innych ustaw (druki nr 2076 i 2155).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego (druk nr 2033).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego (druk nr 2127).\nPrzedstawiony przez Prezesa Rady Ministrów dokument: "Stan bezpieczeństwa ruchu drogowego oraz działania realizowane w tym zakresie w 2024 r." wraz ze stanowiskiem Komisji Infrastruktury (druki nr 1276 i 1409).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o wymianie informacji podatkowych z innymi państwami oraz niektórych innych ustaw (druki nr 2106, 2219 i 2219-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o Planie Strategicznym dla Wspólnej Polityki Rolnej na lata 2023-2027 (druki nr 2180 i 2194).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Obrony Narodowej o rządowym projekcie ustawy o Finansowym Instrumencie Zwiększenia Bezpieczeństwa SAFE (druki nr 2227, 2228 i 2228-A).\nPierwsze czytanie rządowego projektu ustawy o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druk nr 2110).\nPierwsze czytanie rządowego projektu ustawy - Przepisy wprowadzające ustawę o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druk nr 2111).\nSprawozdanie Komisji Finansów Publicznych o poselskim projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych (druki nr 1348 i 2218).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 100-lecia nadania praw miejskich Gdyni (druki nr 2207 i 2229).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy o szczególnych zasadach przygotowania do realizacji inwestycji w zakresie budowli przeciwpowodziowych (druki nr 1816, 2055 i 2055-A) - trzecie czytanie.\nPierwsze czytanie poselskiego projektu uchwały w sprawie powołania Komisji Nadzwyczajnej do spraw ustaw dotyczących statusu osób najbliższych (druki nr 2202 i 2202-A).\nZmiany w składach osobowych komisji sejmowych (druk nr 2225).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych oraz ustawy o podatku dochodowym od osób fizycznych (druk nr 1708).\nPierwsze czytanie poselskiego projektu ustawy o Prezydencie Elekcie Rzeczypospolitej Polskiej, ochronie kandydatów na urząd Prezydenta oraz statusie Małżonka Prezydenta (druk nr 2034).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od czynności cywilnoprawnych (druk nr 1899).	\N	80	2026-10-03 22:10:52.854297+00	\N
52	10	52	52. Posiedzenie Sejmu RP w dniach 25, 26 i 27 lutego 2026 r.	{2026-02-25,2026-02-26,2026-02-27}	Sprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zarządzaniu danymi (druki nr 2060, 2174 i 2174-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Krajowej Szkole Sądownictwa i Prokuratury (druki nr 2201 i 2226).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o funduszach inwestycyjnych i zarządzaniu alternatywnymi funduszami inwestycyjnymi oraz ustawy o obrocie instrumentami finansowymi (druki nr 2163, 2224 i 2224-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o finansach publicznych oraz niektórych innych ustaw (druki nr 2206, 2234 i 2234-A).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o Wojewódzkich Zespołach Koordynacji do spraw polityki umiejętności (druki nr 2240 i 2251).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Państwowej Inspekcji Pracy oraz niektórych innych ustaw (druk nr 2250).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw oraz o zmianie ustawy - Prawo wodne (druki nr 2223, 2242 i 2242-A).\nSprawozdanie Komisji Infrastruktury o poselskim projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym (druki nr 2245 i 2255).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 100. rocznicy urodzin Andrzeja Wajdy (druki nr 2244 i 2262).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w 100. rocznicę śmierci kardynała Edmunda Dalbora (druki nr 2220 i 2261).\nInformacja Ministra Spraw Zagranicznych o zadaniach polskiej polityki zagranicznej w 2026 roku.\nWniosek o wyrażenie wotum nieufności wobec Ministra Rolnictwa i Rozwoju Wsi Stefana Krajewskiego (druki nr 2214 i 2265).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o poselskim projekcie uchwały w sprawie przywrócenia konstytucyjnych standardów wyboru członków-sędziów Krajowej Rady Sądownictwa (druki nr 2258, 2264 i 2264-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 2150 i 2152).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Spraw Zagranicznych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie wyrażenia solidarności z Ukrainą oraz wsparcia Rzeczypospolitej Polskiej dla osób dotkniętych skutkami rosyjskiej agresji - w czwartą rocznicę jej rozpoczęcia (druki nr 2256 i 2296).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku dochodowym od osób prawnych oraz ustawy o podatku dochodowym od osób fizycznych (druk nr 1708) - kontynuacja.\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druki nr 2249 i 2263).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o stowarzyszeniach, ustawy o Krajowym Rejestrze Sądowym oraz ustawy o kosztach sądowych w sprawach cywilnych (druki nr 2248 i 2254).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o ustroju sądów powszechnych oraz niektórych innych ustaw (druki nr 2247 i 2253).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Obrony Narodowej o uchwale Senatu w sprawie ustawy o Finansowym Instrumencie Zwiększenia Bezpieczeństwa SAFE (druki nr 2246 i 2259).\nWybór składu osobowego Komisji Nadzwyczajnej do rozpatrzenia projektów ustaw dotyczących statusu osoby najbliższej w związku i umowy o wspólnym pożyciu (druki nr 2282 i 2282-A).\nWybór nowego składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 2284).\nZmiana w składzie osobowym Komisji Etyki Poselskiej (druk nr 2285).\nZmiany w składach osobowych komisji sejmowych (druk nr 2283).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 2200).\nInformacja o istotnych problemach wynikających z działalności i orzecznictwa Trybunału Konstytucyjnego w 2024 roku wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka oraz Komisji Ustawodawczej (druki nr 2036 i 2243).\nSprawozdanie Komisji Finansów Publicznych o pilnym rządowym projekcie ustawy o zmianie ustawy o rachunkowości (druki nr 2277 i 2279).	\N	81	2026-10-03 22:10:52.854297+00	\N
50	10	50	50. Posiedzenie Sejmu RP w dniach 21, 22 i 23 stycznia 2026 r.	{2026-01-21,2026-01-22,2026-01-23}	Pierwsze czytanie rządowego projektu ustawy o przywróceniu prawa do niezależnego i bezstronnego sądu ustanowionego na podstawie prawa przez uregulowanie skutków uchwał Krajowej Rady Sądownictwa podjętych w latach 2018-2025 (druk nr 2107).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowej Radzie Sądownictwa oraz ustawy - Kodeks wyborczy (druk nr 2108).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o poselskim projekcie ustawy o zmianie ustawy o gospodarowaniu nieruchomościami rolnymi Skarbu Państwa (druki nr 1732 i 2092).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi: - o poselskim projekcie ustawy o zmianie ustawy o wstrzymaniu sprzedaży nieruchomości Zasobu Własności Rolnej Skarbu Państwa oraz o zmianie niektórych ustaw, - o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej projekcie ustawy o zmianie niektórych ustaw w celu ochrony polskiego rolnictwa, - o rządowym projekcie ustawy o zmianie ustawy o wstrzymaniu sprzedaży nieruchomości Zasobu Własności Rolnej Skarbu Państwa oraz o zmianie niektórych ustaw (druki nr 1390, 1632, 2079, 2137 i 2137-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o funkcjonowaniu banków spółdzielczych, ich zrzeszaniu się i bankach zrzeszających oraz niektórych innych ustaw (druki nr 1937, 2116 i 2116-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o krajowym systemie cyberbezpieczeństwa oraz niektórych innych ustaw (druki nr 1955, 2139 i 2139-A).\nSprawozdanie Komisji Nadzwyczajnej: - o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw, - o poselskim projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego, - o poselskim projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny, - o poselskim projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego, - o poselskim projekcie ustawy o zmianie niektórych ustaw w celu ograniczenia nadużywania tymczasowego aresztowania oraz ochrony praw osób tymczasowo aresztowanych, - o poselskim projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego, - o komisyjnych projektach ustaw o zmianie ustawy - Kodeks karny wykonawczy (druki nr 1600, 410, 643, 865, 935, 1131, 1109, 1110, 2086 i 2086-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o stowarzyszeniach, ustawy o Krajowym Rejestrze Sądowym oraz ustawy o kosztach sądowych w sprawach cywilnych (druki nr 868 i 1953).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie niektórych ustaw związanych z funkcjonowaniem rynku finansowego oraz ochroną uczestników tego rynku (druki nr 2101 i 2176).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wzmocnienia pozycji rolników aktywnych zawodowo (druki nr 2120 i 2158).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 2077, 2117 i 2117-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o ustroju sądów powszechnych (druki nr 1204, 2054 i 2054-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o senackim projekcie ustawy o zmianie ustawy o fundacjach oraz ustawy - Prawo o stowarzyszeniach (druki nr 1808 i 2047).\nInformacja Ministra Finansów i Gospodarki na temat aktualnego stanu wdrożenia Krajowego Systemu e-Faktur (KSeF).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy między Rządem Rzeczypospolitej Polskiej a Rządem Zjednoczonego Królestwa Wielkiej Brytanii i Irlandii Północnej o wygaśnięciu trwających skutków prawnych Artykułu 13 Umowy między Rządem Polskiej Rzeczypospolitej Ludowej a Rządem Zjednoczonego Królestwa Wielkiej Brytanii i Irlandii Północnej w sprawie popierania i wzajemnej ochrony inwestycji, podpisanej w Londynie dnia 8 grudnia 1987 r. (druki nr 2037 i 2074).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Igora Zygmunta Tuleyi, reprezentowanego przez adwokatów Michała Zacharskiego oraz Kamila Rudola, z dnia 12 sierpnia 2025 r., uzupełnionego w dniu 18 września 2025 r., o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej poseł Anny Paluch (druk nr 2097).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Agnieszki Glapiak, reprezentowanej przez adwokata Karola Pachnika, z dnia 28 kwietnia 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Cezarego Tomczyka (druk nr 2098).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o wygaszeniu rozwiązań wynikających z ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa oraz o zmianie niektórych innych ustaw (druki nr 2172, 2182 i 2182-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o Krajowej Radzie Sądownictwa oraz ustawy - Kodeks wyborczy (druki nr 2108 i 2177).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi oraz ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych (druk nr 2007).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi oraz ustawy o radiofonii i telewizji (druk nr 2010).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks rodzinny i opiekuńczy oraz niektórych innych ustaw (druk nr 2121).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Gospodarki i Rozwoju o uchwale Senatu w sprawie ustawy o rynku kryptoaktywów (druki nr 2143 i 2184).\nSprawozdanie Komisji Obrony Narodowej o uchwale Senatu w sprawie ustawy o ustanowieniu Dnia Inwalidy Wojennego (druki nr 2140 i 2153).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks wyborczy (druki nr 2141 i 2173).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy o rzeczach znalezionych oraz ustawy - Kodeks cywilny (druki nr 2142 i 2148).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw (druki nr 2181 i 2183).\nWybór sędziów Trybunału Konstytucyjnego (druki nr 1944, 2009, 2013 i 2014).\nZmiany w składach osobowych komisji sejmowych (druk nr 2179).\nSprawozdanie Komisji Polityki Społecznej i Rodziny oraz Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zawodzie psychologa oraz samorządzie zawodowym psychologów (druki nr 2186 i 2192).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw (druki nr 2185 i 2195).	Posłowie zajmowali się między innymi zmianami w sądownictwie i prawie karnym, w tym ograniczeniem nadużywania tymczasowego aresztowania, a także przepisami dotyczącymi sprzedaży państwowej ziemi rolnej. W porządku obrad znalazły się również projekty dotyczące ograniczeń związanych ze sprzedażą i reklamą alkoholu oraz stopniowego wygaszania dotychczasowych form pomocy dla uchodźców z Ukrainy.	108	2026-10-03 22:10:52.854297+00	\N
53	10	53	53. Posiedzenie Sejmu RP w dniach 11, 12 i 13 marca 2026 r.	{2026-03-11,2026-03-12,2026-03-13}	Sprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o Państwowej Inspekcji Pracy oraz niektórych innych ustaw (druki nr 2250, 2252 i 2252-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks rodzinny i opiekuńczy oraz niektórych innych ustaw (druki nr 2121, 2233 i 2233-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 1884, 2257 i 2257-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2159 i 2260).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o zbiorowym zaopatrzeniu w wodę i zbiorowym odprowadzaniu ścieków oraz niektórych innych ustaw (druki nr 2165, 2235 i 2235-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o senackim projekcie ustawy o zmianie ustawy o działaczach opozycji antykomunistycznej oraz osobach represjonowanych z powodów politycznych (druki nr 1651 i 2280).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765 i 2278).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o poselskich projektach uchwał w sprawie: - zobowiązania Rady Ministrów do podjęcia działań prawnych przed Trybunałem Sprawiedliwości Unii Europejskiej w związku z umową handlową UE-Mercosur, - wezwania do zaskarżenia do Trybunału Sprawiedliwości Unii Europejskiej umowy Unii Europejskiej z państwami MERCOSUR, - zobowiązania Rady Ministrów do zaskarżenia decyzji Rady Unii Europejskiej z dnia 9 stycznia 2026 r. w sprawie tymczasowego stosowania umowy Mercosur do Trybunału Sprawiedliwości Unii Europejskiej (druki nr 2166, 2167, 2199 i 2232).\nSprawozdanie Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy - Prawo lotnicze oraz niektórych innych ustaw (druki nr 2236 i 2281).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o poselskim projekcie uchwały w sprawie działań niezbędnych do zapewnienia spełniania przez Trybunał Konstytucyjny wymogów sądu ustanowionego na mocy prawa, niezawisłego i bezstronnego (druki nr 2316, 2330 i 2330-A).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o rządowym projekcie ustawy o zmianie ustawy o sporcie oraz ustawy o przygotowaniu finałowego turnieju Mistrzostw Europy w Piłce Nożnej UEFA EURO 2012 (druki nr 2162, 2203 i 2203-A).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o poselskim projekcie ustawy o zmianie ustawy o Funduszu Ochrony Rolnictwa (druki nr 2295 i 2329).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druk nr 2287).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druk nr 2288).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druk nr 2272).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 45. rocznicy wydarzeń Kryzysu Bydgoskiego 1981 roku (druki nr 2305 i 2324).\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Republiką Indonezji o wzajemnej pomocy prawnej w sprawach karnych, podpisanej w Warszawie dnia 19 września 2025 r. (druki nr 2161 i 2204).\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o ratyfikacji poprawek do Rzymskiego Statutu Międzynarodowego Trybunału Karnego, sporządzonego w Rzymie dnia 17 lipca 1998 r., przyjętych przez Zgromadzenie Państw-Stron Statutu w dniu 26 listopada 2015 r. (rezolucja nr ICC-ASP/14/Res.2), w dniu 14 grudnia 2017 r. (rezolucja nr ICC-ASP/16/Res.4) oraz w dniu 6 grudnia 2019 r. (rezolucja nr ICC-ASP/18/Res.5) (druki nr 2164 i 2205).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 2308).\nSprawozdanie Komisji Edukacji i Nauki oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo oświatowe oraz niektórych innych ustaw (druki nr 2301 i 2309).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zabytków i opiece nad zabytkami oraz ustawy o Krajowej Administracji Skarbowej (druki nr 2300 i 2323).\nSprawozdanie Komisji Gospodarki i Rozwoju o uchwale Senatu w sprawie ustawy o zmianie ustawy o obrocie z zagranicą towarami, technologiami i usługami o znaczeniu strategicznym dla bezpieczeństwa państwa, a także dla utrzymania międzynarodowego pokoju i bezpieczeństwa oraz ustawy o wykonywaniu działalności gospodarczej w zakresie wytwarzania i obrotu materiałami wybuchowymi, bronią, amunicją oraz wyrobami i technologią o przeznaczeniu wojskowym lub policyjnym (druki nr 2298 i 2314).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o niekaraniu obywateli Rzeczypospolitej Polskiej biorących udział po stronie Ukrainy w konflikcie zbrojnym wywołanym agresją Federacji Rosyjskiej na Ukrainę (druki nr 2297 i 2341).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Gospodarki i Rozwoju o uchwale Senatu w sprawie ustawy o zmianie ustawy o Centralnej Ewidencji i Informacji o Działalności Gospodarczej i Punkcie Informacji dla Przedsiębiorcy oraz niektórych innych ustaw (druki nr 2299 i 2315).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o szczególnych zasadach przygotowania do realizacji inwestycji w zakresie budowli przeciwpowodziowych (druki nr 2302 i 2306).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 2303 i 2328).\nWybór sędziów Trybunału Konstytucyjnego (druki nr 2331, 2332, 2333, 2334, 2335, 2336, 2337, 2338, 2344, 2345, 2346, 2347, 2348, 2349, 2350 i 2351).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 2208).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 2210).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny oraz ustawy - Kodeks wykroczeń (druk nr 2212).\nPierwsze czytanie poselskiego projektu ustawy o klubach seniora (druk nr 2129).	Podczas tego posiedzenia Sejm omawiał zmiany dotyczące uprawnień Państwowej Inspekcji Pracy, prawa rodzinnego oraz wsparcia osób starszych w klubach seniora. Posłowie zajęli się również przepisami podatkowymi, zasadami opłat za wodę i ścieki oraz kolejnymi zmianami w prawie karnym.	132	2026-10-03 22:10:52.854297+00	\N
56	10	56	56. Posiedzenie Sejmu RP w dniach 28, 29 i 30 kwietnia 2026 r.	{2026-04-28,2026-04-29,2026-04-30}	Zmiany w składach osobowych komisji sejmowych (druk nr 2465).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa (druki nr 2352 i 2438).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych, ustawy o podatku dochodowym od osób prawnych oraz ustawy o zryczałtowanym podatku dochodowym od niektórych przychodów osiąganych przez osoby fizyczne (druk nr 2445).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 2457).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo oświatowe, ustawy o systemie oświaty oraz niektórych innych ustaw (druk nr 2449).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z uregulowaniem funkcjonowania lotnictwa służb porządku publicznego (druki nr 2395, 2408 i 2408-A).\nSprawozdanie Komisji Mniejszości Narodowych i Etnicznych o komisyjnym projekcie ustawy o zmianie ustawy o mniejszościach narodowych i etnicznych oraz o języku regionalnym (druki nr 2360 i 2431).\nPierwsze czytanie rządowego projektu ustawy o związku metropolitalnym w województwie pomorskim (druk nr 2446).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2370 i 2434).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 1056, 2433 i 2433-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o kuratorach sądowych (druki nr 2294 i 2399).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druki nr 2288 i 2474).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o planowaniu i zagospodarowaniu przestrzennym oraz niektórych innych ustaw (druki nr 2459, 2461 i 2461-A).\nPierwsze czytanie rządowego projektu ustawy o systemach sztucznej inteligencji (druk nr 2443).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Prokuratora Regionalnego w Warszawie z dnia 17 lutego 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Antoniego Macierewicza (druk nr 2442).\nWniosek o wyrażenie wotum nieufności wobec Ministra Klimatu i Środowiska Pauliny Hennig-Kloski (druki nr 2409 i 2477).\nWniosek o wyrażenie wotum nieufności wobec Ministra Zdrowia Jolanty Sobierańskiej-Grendy (druki nr 2450 i 2486).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku rolnym oraz ustawy o podatkach i opłatach lokalnych (druk nr 2168) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego (druk nr 2197) - kontynuacja.\nSprawozdanie Komisji Edukacji i Nauki o uchwale Senatu w sprawie ustawy o zmianie ustawy o języku polskim oraz ustawy o Narodowej Agencji Wymiany Akademickiej (druki nr 2464 i 2482).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2444).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o ochronie praw lokatorów, mieszkaniowym zasobie gminy i o zmianie Kodeksu cywilnego oraz niektórych innych ustaw (druk nr 2447).\nZmiany w składach osobowych komisji sejmowych (druk nr 2484).	\N	39	2026-10-03 22:10:52.854297+00	\N
5	10	5	5. Posiedzenie Sejmu RP w dniach 7, 8 i 9 lutego 2024 r.	{2024-02-07,2024-02-08,2024-02-09}	Pierwsze czytanie rządowego projektu ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druk nr 188).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych oraz niektórych innych ustaw w celu wprowadzenia renty wdowiej (druk nr 32).\nPrzedstawiony przez Radę Ministrów dokument: "Stan bezpieczeństwa ruchu drogowego oraz działania realizowane w tym zakresie w 2022 r." wraz ze stanowiskiem Komisji Infrastruktury (druki nr 167 i 172).\nInformacja Ministra Infrastruktury o skutkach stosowania ustawy - Prawo wodne wraz ze stanowiskiem Komisji Gospodarki Morskiej i Żeglugi Śródlądowej (druki nr 86 i 149).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia Eugeniusza Romera w 70. rocznicę śmierci (druki nr 178 i 186).\nZmiany w składach osobowych komisji sejmowych (druk nr 195).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o pomocy obywatelom Ukrainy w związku z konfliktem zbrojnym na terytorium tego państwa, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druki nr 188, 196 i 196-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 185 i 197).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych oraz o zmianie niektórych ustaw (druk nr 27).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych oraz niektórych innych ustaw w celu wprowadzenia emerytury stażowej (druk nr 187).\nPierwsze czytanie obywatelskiego projektu ustawy Tak dla rodziny, nie dla gender (druk nr 25).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy z dnia 24 lipca 2015 r. - Prawo o zgromadzeniach oraz niektórych innych ustaw (druk nr 26).\nZmiany w składach osobowych komisji sejmowych (druk nr 198).	Podczas tego posiedzenia Sejm omawiał projekty zmian w systemie emerytalnym, w tym propozycje wprowadzenia renty wdowiej oraz emerytur stażowych. Posłowie zajmowali się także przepisami dotyczącymi Prawa farmaceutycznego, dalszej pomocy dla obywateli Ukrainy oraz stanem bezpieczeństwa na drogach.	29	2026-10-03 22:10:52.854297+00	\N
64	10	64	64. Posiedzenie Sejmu RP w dniach 2, 3 i 4 września 2026 r.	{2026-09-02,2026-09-03,2026-09-04}	Sprawozdanie Komisji Sprawiedliwości i Praw Człowieka o senackim projekcie ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach (druki nr 2769, 2833 i 2833-A).\nSprawozdanie Komisji Nadzwyczajnej o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o związkach zawodowych oraz ustawy o informowaniu pracowników i przeprowadzaniu z nimi konsultacji (druki nr 2801 i 2877).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2693 i 2814).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks spółek handlowych oraz ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw (druki nr 2737 i 2851).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933 i 2792).\nSprawozdanie Komisji Spraw Zagranicznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka (druki nr 2271, 2843 i 2843-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o usługach hotelarskich oraz usługach pilotów wycieczek i przewodników turystycznych oraz niektórych innych ustaw (druki nr 2865 i 2865-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druk nr 2872).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta (druki nr 2799, 3043 i 3043-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 2866, 3021 i 3021-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 2821, 3022 i 3022-A).\nSprawozdanie Komisji Edukacji i Nauki o poselskim projekcie ustawy o utworzeniu Uniwersytetu Mazowieckiego w Płocku (druki nr 3015 i 3051).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2876 i 3017).\nSprawozdanie Komisji Finansów Publicznych o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 15 maja 2026 r. o rynku kryptoaktywów (druki nr 2710 i 2742).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2026 (druki nr 3028 i 3046).\nPierwsze czytanie rządowego projektu ustawy o pomocy beneficjentom - osobom fizycznym poszkodowanym w związku z realizacją Programu Priorytetowego "Czyste Powietrze" (druk nr 3007).\nPierwsze czytanie rządowego projektu ustawy o środkach ograniczających (druk nr 3003).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 3027).\nWybór sędziego Trybunału Konstytucyjnego (druki nr 3005, 3006, 3057 i 3058).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2991 i 3023).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2992 i 3052).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o uchwale Senatu w sprawie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2993 i 3016).\nZmiana w składzie osobowym Komisji do Spraw Służb Specjalnych (druk nr 3060).\nWybór nowego składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 3061).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego (druk nr 3011).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa oraz Komisji Rolnictwa i Rozwoju Wsi o poselskich projektach ustaw: - o rekompensatach za szkody wyrządzone przez ptaki, - o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 258, 1387 i 1661).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Żandarmerii Wojskowej i wojskowych organach porządkowych oraz niektórych innych ustaw (druk nr 2869).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo o ustroju sądów powszechnych oraz niektórych innych ustaw (druk nr 2867).	Podczas posiedzenia Sejm omawiał projekty ustaw dotyczące m.in. wprowadzenia asystencji osobistej dla osób z niepełnosprawnościami, wsparcia dla osób poszkodowanych w programie „Czyste Powietrze” oraz zmian w podatkach. Posłowie zajmowali się również przepisami wzmacniającymi ochronę praw konsumentów, rozwojem odnawialnych źródeł energii oraz rynkiem kryptoaktywów po prezydenckim wecie.	65	2026-10-03 22:10:52.854297+00	2026-10-04 00:39:18.93831+00
60	10	60	60. Posiedzenie Sejmu RP w dniach 17, 18 i 19 czerwca 2026 r.	{2026-06-17,2026-06-18,2026-06-19}	Zmiana w składzie osobowym komisji sejmowej (druk nr 2683).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2620 i 2640).\nPierwsze czytanie rządowego projektu ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druk nr 2684).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2498, 2639 i 2639-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie oraz ustawy o grach hazardowych (druki nr 2597, 2641 i 2641-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 1941, 2633 i 2633-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2468, 2638 i 2638-A).\nPierwsze czytanie rządowego projektu ustawy o instrumentach wspieranego podejmowania decyzji (druk nr 2645).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o komisyjnym projekcie uchwały w sprawie uczczenia 80-lecia działalności Ludowych Zespołów Sportowych (druki nr 2624 i 2637).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2643 i 2691).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druki nr 2684, 2688 i 2688-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia bohaterów wydarzeń Czerwca 1976 roku w Radomiu, Płocku i Ursusie (druki nr 2417 i 2540).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia bohaterów 70. rocznicy Poznańskiego Czerwca 1956 roku (druki nr 2418 i 2541).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o działalności leczniczej (druki nr 2685 i 2690).\nSprawozdanie Komisji Spraw Zagranicznych o komisyjnym projekcie uchwały w sprawie uczczenia 35. rocznicy podpisania Traktatu między Rzecząpospolitą Polską a Republiką Federalną Niemiec o dobrym sąsiedztwie i przyjaznej współpracy (druki nr 2713 i 2714).\nPierwsze czytanie rządowego projektu ustawy o zabezpieczeniu socjalnym osób wykonujących zawód artystyczny (druk nr 2644).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druk nr 2642).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druk nr 2677).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Dariusza Korneluka, reprezentowanego przez adwokata Janusza Kaczmarka, z dnia 30 marca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry (druk nr 2657).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 2081).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy (druk nr 2623).\nPierwsze czytanie poselskiego projektu ustawy o systemie ochrony zdrowia oraz o zmianie niektórych innych ustaw (druk nr 2673).	Posłowie zajmowali się zmianami w ochronie zdrowia, w tym funkcjonowaniem Krajowej Sieci Onkologicznej, a także nowymi rozwiązaniami w prawie pracy i wsparciem socjalnym dla artystów. Dyskutowano również o podatku od nadzwyczajnych zysków ze sprzedaży paliw, zmianach w podatku VAT oraz zwiększeniu ochrony osób kupujących mieszkania od deweloperów.	64	2026-10-03 22:10:52.854297+00	2026-10-04 02:27:44.301399+00
63	10	63	63. Posiedzenie Sejmu RP w dniach 29, 30 i 31 lipca 2026 r.	{2026-07-29,2026-07-30,2026-07-31}	Ślubowanie Rzecznika Praw Obywatelskich.\nPierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie ustalenia liczby członków Komisji do Spraw Służb Specjalnych (druk nr 2811).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o rządowym projekcie ustawy o zmianie ustawy - Prawo ochrony środowiska (druki nr 2778 i 2818).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2411, 2820 i 2820-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o komisyjnym projekcie ustawy zmieniającej ustawę o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 2750, 2793 i 2793-A).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2649, 2682 i 2682-A).\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 2675, 2787 i 2787-A).\nSprawozdanie Komisji Infrastruktury o senackim projekcie ustawy o zmianie ustawy o samorządach zawodowych architektów oraz inżynierów budownictwa oraz ustawy - Prawo budowlane (druki nr 2669 i 2786).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji Infrastruktury o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia zrównoważonego lotnictwa (druki nr 2822 i 2849).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druk nr 2821).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy o doręczeniach elektronicznych (druk nr 2800).\nSprawozdanie Komisji Finansów Publicznych w sprawie sprawozdania z wykonania budżetu państwa za okres od dnia 1 stycznia do dnia 31 grudnia 2025 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2025 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 2629, 2681, 2817 i 2817-A).\nSprawozdanie z działalności Narodowego Banku Polskiego w 2025 roku wraz ze sprawozdaniem Komisji Finansów Publicznych (druki nr 2627 i 2687).\nSprawozdanie Komisji Finansów Publicznych o przedstawionej przez Prezesa Rady Ministrów Informacji o poręczeniach i gwarancjach udzielonych w 2025 roku przez Skarb Państwa, niektóre osoby prawne oraz Bank Gospodarstwa Krajowego (druki nr 2582 i 2718).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druki nr 2642 i 2860).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o poselskim projekcie ustawy o zmianie ustawy o ochotniczych strażach pożarnych (druki nr 2600 i 2858).\nPrzedstawiony przez Prezesa Rady Ministrów dokument: Informacja o realizacji ustawy o specjalnych strefach ekonomicznych. Stan na 31 grudnia 2025 r. wraz ze stanowiskiem Komisji Gospodarki i Rozwoju (druki nr 2630 i 2692).\nPierwsze czytanie obywatelskiego projektu ustawy o ochronie bezpieczeństwa wewnętrznego w związku z realizacją polityki migracyjnej Unii Europejskiej (druk nr 2602).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druk nr 2837).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2838).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 2839).\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2834 i 2862).\nSprawozdanie Komisji do Spraw Dzieci i Młodzieży oraz Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2836 i 2854).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nPrzedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia pamięci uczestników Powstania Warszawskiego oraz ludności cywilnej Warszawy (druk nr 2878).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku z dnia 4 maja 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla, przedłożonego przez Europejskiego Prokuratora Generalnego, uzupełnionego w dniu 28 maja 2026 r. (druk nr 2861).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżyciela prywatnego Artura Szweda, reprezentowanego przez adwokata Lesława Szpalę, z dnia 10 września 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Adama Dziedzica (druk nr 2879).	Sejm zajmował się rozliczeniem wykonania budżetu państwa za ubiegły rok oraz projektami zmian w podatkach dochodowych, VAT i akcyzie. Posłowie omawiali także przepisy dotyczące opieki nad najmłodszymi dziećmi, praw pacjentów, publicznego transportu zbiorowego oraz usuwania skutków powodzi.	74	2026-10-03 22:10:52.854297+00	2026-10-04 02:24:25.090379+00
58	10	58	58. Posiedzenie Sejmu RP w dniach 27, 28 i 29 maja 2026 r.	{2026-05-27,2026-05-28,2026-05-29}	Zmiany w składach osobowych komisji sejmowych (druk nr 2596).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druk nr 2499).\nSprawozdanie Komisji Gospodarki i Rozwoju oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o szczególnych rozwiązaniach w zakresie rozpoznawania spraw dotyczących zawartych z konsumentami umów kredytu denominowanego lub indeksowanego do franka szwajcarskiego (druki nr 1758, 2369 i 2369-A).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe, ustawy o systemie oświaty oraz niektórych innych ustaw (druki nr 2449, 2561 i 2561-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2110, 2593 i 2593-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy - Przepisy wprowadzające ustawę o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2111, 2594 i 2594-A).\nSprawozdanie Komisji Nadzwyczajnej o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz poselskim projektach ustaw o zmianie ustawy o ochronie zwierząt (druki nr 2270, 2274 i 2538).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o pracowniczych planach kapitałowych oraz ustawy o szczególnych rozwiązaniach związanych z zapobieganiem, przeciwdziałaniem i zwalczaniem COVID-19, innych chorób zakaźnych oraz wywołanych nimi sytuacji kryzysowych (druki nr 2497 i 2565).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Edukacji i Nauki o rządowym projekcie ustawy o szczególnych rozwiązaniach związanych z wynikami ewaluacji jakości działalności naukowej za lata 2022-2025 (druki nr 2500, 2566 i 2566-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druk nr 2549).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o związku metropolitalnym w województwie pomorskim (druki nr 2446, 2560 i 2560-A).\nSprawozdanie Komisji Infrastruktury o poselskich projektach ustaw: - o zmianie ustawy o drogach publicznych oraz o zmianie niektórych innych ustaw, - o zmianie ustawy o drogach publicznych (druki nr 2552, 2551, 2576 i 2576-A).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o komisyjnym projekcie ustawy o zmianie ustawy o imprezach turystycznych i powiązanych usługach turystycznych (druki nr 2412 i 2572).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych oraz Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu dokonania deregulacji w zakresie energetyki (druki nr 2578, 2606 i 2606-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w 125. rocznicę urodzin i 45. rocznicę śmierci Bł. Stefana Kardynała Wyszyńskiego (druki nr 2492 i 2569).\nSprawozdanie Komisji Samorządu Terytorialnego i Polityki Regionalnej o poselskim projekcie uchwały w sprawie 25. rocznicy uchwalenia pierwszej ustawy regulującej funkcjonowanie młodzieżowych rad samorządowych w Polsce (druki nr 2469 i 2496).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 90. rocznicy deportacji ludności polskiej do Kazachstanu (druki nr 2470 i 2570).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku oskarżycielki prywatnej Doroty Schnepf, reprezentowanej przez adwokatów Wojciecha Łączewskiego i Justynę Borucką, z dnia 9 grudnia 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry (druk nr 2562).\nSprawozdanie Komisji Spraw Zagranicznych o komisyjnym projekcie uchwały z okazji 250. rocznicy powstania Stanów Zjednoczonych Ameryki (druki nr 2491 i 2568).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy - Ordynacja podatkowa (druki nr 2586 i 2613).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z uregulowaniem funkcjonowania lotnictwa służb porządku publicznego (druki nr 2588 i 2591).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o szczególnych środkach ochrony w postępowaniu cywilnym osób uczestniczących w debacie publicznej (druki nr 2584 i 2590).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Zdrowia o uchwale Senatu w sprawie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2585 i 2616).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druki nr 2587 i 2605).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw (druki nr 2589 i 2592).\nSprawozdanie Komisji Edukacji i Nauki o senackim projekcie ustawy o zmianie ustawy - Prawo oświatowe (druki nr 1650, 2366 i 2366-A) - trzecie czytanie.\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku akcyzowym oraz niektórych innych ustaw (druk nr 2396) - kontynuacja.\nSprawozdanie Ministra Spraw Wewnętrznych i Administracji z realizacji w 2025 r. ustawy z dnia 24 marca 1920 r. o nabywaniu nieruchomości przez cudzoziemców wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 2420 i 2478) - kontynuacja.\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie lipiec-grudzień 2025 r. (przewodnictwo Danii w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 2422 i 2577).\nInformacja o działalności Rzecznika Praw Obywatelskich oraz o stanie przestrzegania wolności i praw człowieka i obywatela w roku 2025 wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 2472 i 2534).\nPierwsze czytanie poselskiego projektu ustawy o minimalnym wynagrodzeniu za pracę (druk nr 1811).\nZmiany w składach osobowych komisji sejmowych (druk nr 2617).	Posłowie pracowali nad przepisami ułatwiającymi prowadzenie spraw sądowych dotyczących kredytów frankowych oraz nad projektem wprowadzającym status osoby najbliższej w związkach nieformalnych. Omawiali także propozycje zmian dotyczące płacy minimalnej, funkcjonowania szkół oraz ochrony zwierząt.	150	2026-10-03 22:10:52.854297+00	\N
59	10	59	59. Posiedzenie Sejmu RP w dniach 9, 10 i 11 czerwca 2026 r.	{2026-06-09,2026-06-10,2026-06-11}	Sprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o ubezpieczeniach upraw rolnych i zwierząt gospodarskich (druki nr 2581, 2607 i 2607-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2499, 2610 i 2610-A).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o pomocy społecznej (druki nr 2550 i 2611).\nPierwsze czytanie rządowego projektu ustawy o osobistych kontach inwestycyjnych (druk nr 2580).\nSprawozdanie Komisji Polityki Senioralnej, Komisji Polityki Społecznej i Rodziny oraz Komisji Zdrowia o rządowym projekcie ustawy o koordynacji opieki długoterminowej i osobach starszych (druki nr 2579, 2612 i 2612-A).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy oraz ustawy o świadczeniach pieniężnych z ubezpieczenia społecznego w razie choroby i macierzyństwa (druk nr 2416).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nWniosek o wyrażenie wotum nieufności wobec Ministra Spraw Wewnętrznych i Administracji Marcina Kierwińskiego (druki nr 2632 i 2654).\nSprawozdanie Komisji Nadzwyczajnej o poselskich projektach ustaw o zmianie ustawy - Kodeks karny (druki nr 2208, 1613, 2608 i 2608-A).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o rządowym projekcie ustawy o systemach sztucznej inteligencji (druki nr 2443, 2614 i 2614-A).\nSprawozdanie Komisji Nadzwyczajnej o poselskich projektach ustaw: - o zmianie ustawy o ochronie zwierząt, - o zmianie ustawy o ochronie zwierząt oraz ustawy o materiałach wybuchowych przeznaczonych do użytku cywilnego (druki nr 350, 729 i 2151).\nInformacja o działalności Rzecznika Praw Dziecka za rok 2025 oraz uwagi o stanie przestrzegania praw dziecka w Polsce wraz ze sprawozdaniem Komisji do Spraw Dzieci i Młodzieży, Komisji Edukacji i Nauki oraz Komisji Polityki Społecznej i Rodziny (druki nr 2425 i 2595).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Komendanta Głównego Policji z dnia 20 marca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności za wykroczenie posła Sławomira Mentzena (druk nr 2615).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289 i 2609).\nPrzedstawiony przez Prezesa Rady Ministrów dokument: "Stan bezpieczeństwa ruchu drogowego oraz działania realizowane w tym zakresie w 2025 r." wraz ze stanowiskiem Komisji Infrastruktury (druki nr 2558 i 2573).\nSprawozdanie Komisji do Spraw Deregulacji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2660 i 2665).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druki nr 2659 i 2663).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o uchwale Senatu w sprawie ustawy o związku metropolitalnym w województwie pomorskim (druki nr 2658 i 2664).\nInformacja dla Sejmu i Senatu RP o udziale Rzeczypospolitej Polskiej w pracach Unii Europejskiej w okresie lipiec-grudzień 2025 r. (przewodnictwo Danii w Radzie Unii Europejskiej) wraz z komisyjnym projektem uchwały (druki nr 2422 i 2577) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o minimalnym wynagrodzeniu za pracę (druk nr 1811) - kontynuacja.\nWybór sędziego Trybunału Konstytucyjnego (druki nr 2618, 2619, 2634 i 2635).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu dokonania deregulacji w zakresie energetyki (druki nr 2661 i 2662).	Sejm zajmował się zmianami w prawie pracy i przepisami o płacy minimalnej oraz rozwiązaniami dotyczącymi pomocy społecznej i opieki nad osobami starszymi. Posłowie omawiali także utworzenie osobistych kont inwestycyjnych, regulacje w zakresie sztucznej inteligencji oraz zaostrzenie przepisów o ochronie zwierząt.	69	2026-10-03 22:10:52.854297+00	\N
57	10	57	57. Posiedzenie Sejmu RP w dniach 12, 13, 14 i 15 maja 2026 r.	{2026-05-12,2026-05-13,2026-05-14,2026-05-15}	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia pamięci ofiar przewrotu majowego 1926 roku (druk nr 2545).\nPierwsze czytanie rządowego projektu ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druk nr 2488).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od spadków i darowizn (druk nr 2489).\nPierwsze czytanie poselskiego projektu ustawy o rynku kryptoaktywów (druk nr 2363).\nPierwsze czytanie poselskiego projektu ustawy o kryptoaktywach (druk nr 2530).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o rynku kryptoaktywów (druk nr 2528).\nPierwsze czytanie rządowego projektu ustawy o rynku kryptoaktywów (druk nr 2529).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druki nr 2287 i 2480).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych, ustawy o podatku dochodowym od osób prawnych oraz ustawy o zryczałtowanym podatku dochodowym od niektórych przychodów osiąganych przez osoby fizyczne (druki nr 2445 i 2487).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o zapobieganiu oraz zwalczaniu zakażeń i chorób zakaźnych u ludzi (druki nr 2456, 2475 i 2475-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia (druki nr 2460, 2544 i 2544-A).\nSprawozdanie Komisji Edukacji i Nauki o senackim projekcie ustawy o zmianie ustawy - Prawo oświatowe (druki nr 1650 i 2366).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2318, 2481 i 2481-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Kodeks karny (druki nr 2398 i 2462).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego (druki nr 2387 i 2463).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druki nr 2372, 2441 i 2441-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw (druki nr 2355, 2531 i 2531-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 2457, 2479 i 2479-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 120. rocznicy urodzin profesora Tadeusza Wacława Korzybskiego (druki nr 2215 i 2437).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 100. rocznicy urodzin Tadeusza Konwickiego (druki nr 2275, 2483 i 2483-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 2501).\nSprawozdanie Komisji Finansów Publicznych: - o poselskim projekcie ustawy o kryptoaktywach, - o poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw (druki nr 2317, 2467 i 2467-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy o podatku od spadków i darowizn (druki nr 2489 i 2535).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Zdrowia o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie upamiętnienia 125. rocznicy strajku dzieci wrzesińskich (druki nr 2493 i 2564).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2444) - kontynuacja.\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druki nr 2288, 2474 i 2474-A) - trzecie czytanie.\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o postępowaniu egzekucyjnym w administracji (druki nr 2522 i 2539).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2524 i 2574).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Infrastruktury o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2523 i 2543).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 2521 i 2532).\nWybór sędziów - członków Krajowej Rady Sądownictwa (druki nr 2526 i 2536).\nZmiany w składach osobowych komisji sejmowych (druk nr 2575).\nSprawozdanie Ministra Spraw Wewnętrznych i Administracji z realizacji w 2025 r. ustawy z dnia 24 marca 1920 r. o nabywaniu nieruchomości przez cudzoziemców wraz ze stanowiskiem Komisji Administracji i Spraw Wewnętrznych (druki nr 2420 i 2478).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku akcyzowym oraz niektórych innych ustaw (druk nr 2396).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2453).	Sejm pracował nad licznymi zmianami w podatkach, między innymi dotyczącymi spadków i darowizn, podatków dochodowych oraz VAT-u, a także nad uregulowaniem rynku kryptowalut. Posłowie zajmowali się również przepisami dotyczącymi rozwoju elektronicznych usług w ochronie zdrowia oraz uproszczeniem procedur w urzędach.	147	2026-10-03 22:10:52.854297+00	2026-10-04 01:35:01.843156+00
61	10	61	61. Posiedzenie Sejmu RP w dniach 1, 2 i 3 lipca 2026 r.	{2026-07-01,2026-07-02,2026-07-03}	Sprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy o przygotowaniu i realizacji inwestycji w zakresie obiektów energetyki jądrowej oraz inwestycji towarzyszących oraz niektórych innych ustaw (druki nr 2410, 2466 i 2466-A).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A).\nSprawozdanie Komisji Edukacji i Nauki o poselskim i rządowym projektach ustaw o zmianie ustawy - Prawo oświatowe (druki nr 1526, 2668, 2680 i 2680-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o jakości handlowej artykułów rolno-spożywczych oraz niektórych innych ustaw (druk nr 2695).\nRozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 2739).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o ofercie publicznej i warunkach wprowadzania instrumentów finansowych do zorganizowanego systemu obrotu oraz o spółkach publicznych oraz ustawy o wdrożeniu niektórych przepisów Unii Europejskiej w zakresie równego traktowania (druki nr 2696, 2733 i 2733-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o komisyjnym projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2676, 2720 i 2720-A).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druk nr 2698).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druk nr 2700).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druk nr 2694).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy (druk nr 2623) - kontynuacja.\nPierwsze czytanie poselskiego projektu ustawy o systemie ochrony zdrowia oraz o zmianie niektórych innych ustaw (druk nr 2673) - kontynuacja.\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762).\nSprawozdanie Komisji Nadzwyczajnej o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 2729 i 2766).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o uchwale Senatu w sprawie ustawy o zmianie ustawy o imprezach turystycznych i powiązanych usługach turystycznych (druki nr 2728 i 2741).\nSprawozdanie Komisji Zdrowia o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765).\nSprawozdanie Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 2727 i 2760).\nZmiany w składach osobowych komisji sejmowych (druk nr 2767).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie ustawy o Instytucie Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu oraz ustawy - Kodeks karny (druk nr 1760).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o samorządzie gminnym (druk nr 2649).\nWybór uzupełniający do składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 2768).	Posłowie zajmowali się przepisami dotyczącymi opieki nad dziećmi do lat trzech, zmianami w Kodeksie pracy oraz funkcjonowaniem ochrony zdrowia, w tym prawami pacjentów i leczeniem onkologicznym. Omawiano także projekty ustaw dotyczące rozwoju transportu publicznego, osobistych kont inwestycyjnych oraz inwestycji w energetykę jądrową.	71	2026-10-03 22:10:52.854297+00	2026-10-04 02:26:19.977365+00
4	10	4	4. Posiedzenie Sejmu RP w dniach 25 i 26 stycznia 2024 r.	{2024-01-25,2024-01-26}	Zmiany w składach osobowych komisji sejmowych (druk nr 174).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy o rencie socjalnej (druk nr 30).\nPierwsze czytanie obywatelskiego projektu ustawy o zmianie ustawy - Karta Nauczyciela (druk nr 28).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o samorządzie gminnym oraz ustawy - Kodeks wyborczy (druk nr 75).\nSprawozdanie Komisji Edukacji, Nauki i Młodzieży o rządowym projekcie ustawy o zmianie ustawy o Narodowym Centrum Badań i Rozwoju oraz ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 171 i 181).\nSprawozdanie Komisji Kultury i Środków Przekazu o poselskim projekcie uchwały w 100. rocznicę wydania pierwszego numeru "Wiadomości Literackich" (druki nr 157 i 173).\nŚlubowanie Prezesa Urzędu Ochrony Danych Osobowych.\nWybór składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druk nr 184).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nInformacja o działalności Rzecznika Praw Obywatelskich oraz o stanie przestrzegania wolności i praw człowieka i obywatela w roku 2022 wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 85 i 183).\nInformacja Rady Ministrów o sytuacji osób starszych w Polsce za 2022 r. wraz ze stanowiskiem Komisji Polityki Senioralnej oraz Komisji Polityki Społecznej i Rodziny (druki nr 83 i 151).	\N	7	2026-10-03 22:10:52.854297+00	2026-10-04 00:36:46.803646+00
65	10	65	65. Posiedzenie Sejmu RP w dniach 15, 16, 17 i 18 września 2026 r.	{2026-09-15,2026-09-16,2026-09-17,2026-09-18}	Sprawozdanie Komisji Zdrowia o poselskich projektach ustaw: - o zmianie ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi oraz ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych; - o zmianie ustawy o wychowaniu w trzeźwości i przeciwdziałaniu alkoholizmowi oraz ustawy o radiofonii i telewizji (druki nr 2007, 2010, 2856 i 2856-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A).\nSprawozdanie z działalności Najwyższej Izby Kontroli w 2025 roku wraz z opinią Komisji do Spraw Kontroli Państwowej (druki nr 2752 i 2855).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druki nr 2837 i 3053).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług (druki nr 2838 i 3054).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 2839 i 3065).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o ochronie funkcji produkcyjnej wsi (druk nr 3032).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu ochrony rolniczych funkcji produkcyjnych wsi (druk nr 3029).\nPierwsze czytanie rządowego projektu ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druk nr 3100).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o szczególnych rozwiązaniach związanych z organizacją XXVI Światowego Jamboree Skautowego w Polsce w 2027 r. (druki nr 2846 i 3024).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o działaniach antyterrorystycznych (druki nr 2870 i 3063).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy o zmianie ustawy o finansowym wspieraniu produkcji audiowizualnej oraz niektórych innych ustaw (druki nr 2998 i 3047).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Konwencji Rady Europy w sprawie koprodukcji utworów audiowizualnych w formie seriali, sporządzonej w Lille dnia 26 marca 2026 r. (druki nr 2841 i 2852).\nSprawozdanie Komisji Edukacji i Nauki o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A).\nSprawozdanie Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Międzynarodowej konwencji z Hongkongu o bezpiecznym i ekologicznie racjonalnym recyklingu statków, sporządzonej w Hongkongu dnia 15 maja 2009 r. (druki nr 2738 i 2844).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o rządowym projekcie ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o grach hazardowych (druki nr 3012 i 3018).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Traktatu między Rzecząpospolitą Polską a Zjednoczonym Królestwem Wielkiej Brytanii i Irlandii Północnej o partnerstwie w dziedzinie bezpieczeństwa i obronności, podpisanego w Londynie dnia 27 maja 2026 r. (druki nr 2840 i 3050).\nSprawozdanie Komisji Polityki Społecznej i Rodziny oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Japonią o zabezpieczeniu społecznym, podpisanej w Tokio dnia 15 kwietnia 2026 r. (druki nr 2810 i 3062).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o poselskim projekcie uchwały o zmianie Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 3071 i 3084).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskich projektach uchwał: - w sprawie upamiętnienia 50. rocznicy powstania Komitetu Obrony Robotników, - w 50. rocznicę powstania Komitetu Obrony Robotników (druki nr 2889, 3056 i 3064).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku prokuratora Prokuratury Okręgowej w Przemyślu z dnia 17 czerwca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana (druk nr 3044).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Konstytucji Rzeczypospolitej Polskiej z dnia 2 kwietnia 1997 r. w 30. rocznicę jej uchwalenia (druki nr 2556 i 2758).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Tadeusza Mazowieckiego (druki nr 2510 i 2717).\nSprawozdanie Komisji Nadzwyczajnej o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 29 maja 2026 r. o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2863 i 3110).\nSprawozdanie Komisji Nadzwyczajnej o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 29 maja 2026 r. - Przepisy wprowadzające ustawę o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2864 i 3111).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem św. Andrzeja Boboli (druki nr 2419 i 2686).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Objawień Matki Bożej Gietrzwałdzkiej (druki nr 2506 i 2759).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Jerzego Żurawlewa (druki nr 2507 i 2757).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Kazimiery Bujwidowej (druki nr 2508 i 2715).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Nauki (druki nr 2509 i 2716).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109).\nSprawozdanie Komisji do Spraw Energii, Klimatu i Aktywów Państwowych o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107).\nSprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2025 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2725 i 2829).\nInformacja o działalności Rady Mediów Narodowych w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2726 i 2830).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku od towarów i usług oraz niektórych innych ustaw (druk nr 3074).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych (druk nr 3099).\nZmiany w składach osobowych komisji sejmowych (druk nr 3106).\nWybór Wicemarszałka Sejmu Rzeczypospolitej Polskiej (druki nr 2875 i 3077).\nPowołanie Przewodniczącego Komisji Rozwoju i Bezpieczeństwa Sztucznej Inteligencji (druki nr 3078 i 3083).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo o ruchu drogowym oraz niektórych innych ustaw (druk nr 3101).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druk nr 3066).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druk nr 2802).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 2746).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 2997).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks karny wykonawczy (druk nr 3009).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o Krajowym Rejestrze Sądowym oraz niektórych innych ustaw (druk nr 3004).\nPierwsze czytanie rządowego projektu ustawy o mediatorach sądowych, instytucjach szkolących w zakresie mediacji i Krajowym Rejestrze Mediatorów (druk nr 3008).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw: - o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych; - o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego; - o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych w sprawie wniosku Europejskiego Prokuratora Generalnego z dnia 29 lipca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla (druk nr 3105).	Sejm zajmował się licznymi zmianami w systemie podatkowym, w tym nowym podatkiem od nadzwyczajnych zysków spółek paliwowych oraz modyfikacjami w VAT, akcyzie i podatkach lokalnych. Posłowie rozpatrywali również projekty dotyczące asystencji osobistej dla osób z niepełnosprawnościami, bezpieczeństwa w ruchu drogowym oraz weto prezydenta do ustawy o związkach i wspólnym pożyciu.	147	2026-10-03 22:10:52.854297+00	2026-10-04 00:43:31.705872+00
54	10	54	54. Posiedzenie Sejmu RP w dniach 25, 26 i 27 marca 2026 r.	{2026-03-25,2026-03-26,2026-03-27}	Sprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego (druki nr 2200 i 2327).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy o kształtowaniu ustroju rolnego (druki nr 2273, 2311 i 2311-A).\nSprawozdanie Komisji do Spraw Deregulacji o rządowym projekcie ustawy o zmianie ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 2291 i 2310).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o biegłych rewidentach, firmach audytorskich oraz nadzorze publicznym oraz ustawy o rachunkowości (druki nr 2292 i 2313).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o komisyjnym projekcie uchwały w sprawie ustanowienia dnia 19 września Dniem Służby Bezpieczeństwa i Higieny Pracy (druki nr 2237 i 2340).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druk nr 2289).\nPierwsze czytanie poselskiego projektu ustawy o uznaniu osobowości prawnej rzeki Odry (druki nr 2082 i 2082-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Nadzwyczajnej o poselskim projekcie ustawy o zmianie ustawy - Kodeks wyborczy (druki nr 2006, 2326 i 2326-A).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2217, 2343 i 2343-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o rządowym projekcie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2307, 2342 i 2342-A).\nSprawozdanie Komisji Nadzwyczajnej o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 27 lutego 2026 r. o zmianie ustawy - Kodeks postępowania karnego oraz niektórych innych ustaw (druki nr 2378 i 2384).\nSprawozdanie Komisji Kultury, Dziedzictwa Narodowego i Środków Przekazu o poselskim projekcie uchwały w 370. rocznicę złożenia Ślubów lwowskich przez króla Jana II Kazimierza (druki nr 2365 i 2382).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks postępowania cywilnego i niektórych innych ustaw (druk nr 1892).\nSprawozdanie Komisji Regulaminowej, Spraw Poselskich i Immunitetowych o uchwale Senatu w sprawie ustawy o zmianie ustawy o wykonywaniu mandatu posła i senatora (druki nr 2304 i 2368).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o uchwale Senatu w sprawie ustawy o zarządzaniu danymi (druki nr 2354 i 2381).\nPierwsze czytanie poselskiego projektu ustawy o klubach seniora (druk nr 2129) - kontynuacja.\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Ordynacja podatkowa (druk nr 2352).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druk nr 1768).\nPierwsze czytanie rządowego projektu ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druk nr 2318).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o zapasach ropy naftowej, produktów naftowych i gazu ziemnego oraz zasadach postępowania w sytuacjach zagrożenia bezpieczeństwa paliwowego państwa i zakłóceń na rynku naftowym oraz ustawy o Krajowej Administracji Skarbowej (druk nr 2389).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 2390).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o zapasach ropy naftowej, produktów naftowych i gazu ziemnego oraz zasadach postępowania w sytuacjach zagrożenia bezpieczeństwa paliwowego państwa i zakłóceń na rynku naftowym oraz ustawy o Krajowej Administracji Skarbowej (druki nr 2389 i 2391).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 2390 i 2392).	Sejm zajmował się zmianami w prawie podatkowym i Kodeksie pracy oraz ułatwieniami w załatwianiu spraw w urzędach. Posłowie omawiali także przepisy dotyczące obrony cywilnej i ochrony ludności, a także propozycje wsparcia dla klubów seniora.	55	2026-10-03 22:10:52.854297+00	\N
55	10	55	55. Posiedzenie Sejmu RP w dniach 14, 15, 16 i 17 kwietnia 2026 r.	{2026-04-14,2026-04-15,2026-04-16,2026-04-17}	Zmiany w składach osobowych komisji sejmowych (druk nr 2407).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o komisyjnym projekcie ustawy o zmianie ustawy o radcach prawnych (druki nr 1963 i 2367).\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o rządowym projekcie ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw (druki nr 2317 i 2364).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o postępowaniu egzekucyjnym w administracji (druki nr 2319 i 2383).\nSprawozdanie Komisji Nadzwyczajnej o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A).\nSprawozdanie Komisji Edukacji i Nauki o rządowym projekcie ustawy o zmianie ustawy o języku polskim oraz ustawy o Narodowej Agencji Wymiany Akademickiej (druki nr 2361, 2385 i 2385-A).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2290, 2312 i 2312-A).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Infrastruktury o rządowym projekcie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2272, 2386 i 2386-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy między Rządem Rzeczypospolitej Polskiej a Gabinetem Ministrów Ukrainy o współpracy w zwalczaniu przestępczości, podpisanej we Lwowie dnia 11 grudnia 2025 r. (druki nr 2276 i 2379).\nPierwsze czytanie poselskiego projektu ustawy o najmie krótkoterminowym (druki nr 2353 i 2353-A).\nPierwsze czytanie rządowego projektu ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka (druk nr 2271).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druk nr 2372).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks postępowania karnego (druk nr 2387).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o wspieraniu rozwoju obszarów wiejskich z udziałem środków Europejskiego Funduszu Rolnego na rzecz Rozwoju Obszarów Wiejskich w ramach Programu Rozwoju Obszarów Wiejskich na lata 2014-2020 oraz niektórych innych ustaw (druki nr 2371 i 2427).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o finansach publicznych oraz niektórych innych ustaw (druki nr 2388 i 2430).\nSprawozdanie Komisji Obrony Narodowej oraz Komisji Zdrowia o rządowym projekcie ustawy o zmianie ustawy o utworzeniu Uniwersytetu Medycznego w Łodzi (druki nr 2404 i 2435).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Gospodarki i Rozwoju o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 18 grudnia 2025 r. o rynku kryptoaktywów (druki nr 2267 i 2436).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Kodeks karny (druk nr 2398).\nSprawozdanie Komisji Ochrony Środowiska, Zasobów Naturalnych i Leśnictwa o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie.\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 2400 i 2405).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii oraz Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o uchwale Senatu w sprawie ustawy o zmianie ustawy o Funduszu Ochrony Rolnictwa (druki nr 2402 i 2428).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406).\nZmiany w składach osobowych komisji sejmowych (druk nr 2439).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku rolnym oraz ustawy o podatkach i opłatach lokalnych (druk nr 2168).\nPierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego (druk nr 2197).\nSprawozdanie Komisji Finansów Publicznych o poselskim projekcie ustawy o zmianie ustawy o systemie instytucji rozwoju (druki nr 2440 i 2448).	Posłowie zajęli się między innymi przepisami dotyczącymi utworzenia ogólnokrajowego rejestru psów i kotów oraz nowymi zasadami najmu krótkoterminowego mieszkań. W porządku obrad znalazły się również projekty zmian w prawie karnym, propozycje dotyczące podatków lokalnych oraz ponowne rozpatrzenie ustawy o rynku kryptoaktywów po wecie prezydenta.	73	2026-10-03 22:10:52.854297+00	2026-10-04 01:16:50.970767+00
62	10	62	62. Posiedzenie Sejmu RP w dniach 15, 16 i 17 lipca 2026 r.	{2026-07-15,2026-07-16,2026-07-17}	Przedstawiony przez Prezydium Sejmu projekt uchwały w sprawie uczczenia 125. rocznicy urodzin Stanisława Mikołajczyka (druk nr 2796).\nSprawozdanie Komisji Finansów Publicznych o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2677, 2761 i 2761-A).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A).\nSprawozdanie Komisji Administracji i Spraw Wewnętrznych oraz Komisji Sprawiedliwości i Praw Człowieka o rządowym projekcie ustawy o zmianie ustawy o nabywaniu nieruchomości przez cudzoziemców oraz ustawy - Prawo o notariacie (druki nr 2699 i 2755).\nSprawozdanie Komisji Rolnictwa i Rozwoju Wsi o rządowym projekcie ustawy o zmianie ustawy o jakości handlowej artykułów rolno-spożywczych oraz niektórych innych ustaw (druki nr 2695 i 2791).\nSprawozdanie Komisji Polityki Społecznej i Rodziny o komisyjnym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 2701 i 2753).\nSprawozdanie Komisji do Spraw Dzieci i Młodzieży oraz Komisji Polityki Społecznej i Rodziny o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788).\nPierwsze czytanie senackiego projektu ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach (druk nr 2769).\nSprawozdanie Komisji Polityki Społecznej i Rodziny oraz Komisji Spraw Zagranicznych o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Republiką Albanii o zabezpieczeniu społecznym, podpisanej w Warszawie dnia 23 lutego 2026 r. (druki nr 2667 i 2744).\nSprawozdanie Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700, 2785 i 2785-A).\nPytania w sprawach bieżących.\nInformacja bieżąca.\nSprawozdanie Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 2648, 2736 i 2736-A).\nSprawozdanie Komisji Kultury Fizycznej, Sportu i Turystyki o komisyjnym projekcie uchwały w sprawie ustanowienia dnia 31 lipca Dniem Trenera Sportowego (druki nr 2707 i 2763).\nSprawozdanie Komisji Spraw Zagranicznych o poselskich projektach uchwał: - w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach; - w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947; - w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770).\nPierwsze czytanie rządowego projektu ustawy o zmianie ustawy- Kodeks spółek handlowych oraz ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw (druk nr 2737).\nPierwsze czytanie senackiego projektu ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druk nr 2670).\nSprawozdanie Komisji do Spraw Deregulacji oraz Komisji Finansów Publicznych o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2780 i 2794).\nSprawozdanie Komisji Finansów Publicznych oraz Komisji Gospodarki Morskiej i Żeglugi Śródlądowej o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784).\nSprawozdanie Komisji Cyfryzacji, Innowacyjności i Nowoczesnych Technologii o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2782 i 2795).\nSprawozdanie Komisji Sprawiedliwości i Praw Człowieka o uchwale Senatu w sprawie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2783 i 2816).\nPierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie ustawy o Instytucie Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu oraz ustawy - Kodeks karny (druk nr 1760) - kontynuacja.\nPowołanie Rzecznika Praw Obywatelskich (druki nr 2734, 2735, 2789 i 2790).\nPowołanie Prezesa Instytutu Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu (druki nr 2455 i 2476).\nInformacja o działalności Krajowej Rady Sądownictwa w 2025 roku wraz ze sprawozdaniem Komisji Sprawiedliwości i Praw Człowieka (druki nr 2583 i 2740).\nZmiany w składach osobowych komisji sejmowych (druk nr 2819).	Posłowie zajmowali się zmianami w przepisach podatkowych, sprawami opieki nad najmłodszymi dziećmi oraz zasadami funkcjonowania transportu publicznego. Omawiano również kwestie ochrony praw osób kupujących mieszkania, wsparcia zatrudnienia osób z niepełnosprawnościami i wyboru Rzecznika Praw Obywatelskich.	115	2026-10-03 22:10:52.854297+00	2026-10-04 02:25:43.321211+00
\.


--
-- Data for Name: voting_club_results; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.voting_club_results (id, voting_id, club, yes, no, abstain, absent) FROM stdin;
1	1	PiS	169	0	1	19
2	1	KO	0	149	0	7
3	1	PSL-TD	0	31	0	1
4	1	Konfederacja	14	0	2	2
5	1	Polska2050-TD	0	33	0	0
6	1	Lewica	0	25	0	1
7	1	Kukiz15	2	0	0	1
8	2	PiS	172	2	0	15
9	2	KO	149	0	0	7
10	2	PSL-TD	31	0	0	1
11	2	Konfederacja	8	0	8	2
12	2	Polska2050-TD	33	0	0	0
13	2	Lewica	25	0	0	1
14	2	Kukiz15	2	0	0	1
15	3	PiS	170	0	0	19
16	3	KO	0	147	0	10
17	3	PSL-TD	0	32	0	0
18	3	Konfederacja	17	0	0	1
19	3	Polska2050-TD	0	33	0	0
20	3	Lewica	0	25	0	1
21	3	Kukiz15	3	0	0	0
22	4	PiS	174	0	0	15
23	4	KO	0	150	0	7
24	4	PSL-TD	0	32	0	0
25	4	Konfederacja	0	17	0	1
26	4	Polska2050-TD	0	33	0	0
27	4	Lewica	0	25	0	1
28	4	Kukiz15	3	0	0	0
29	5	PiS	0	174	0	15
30	5	KO	150	0	0	7
31	5	PSL-TD	32	0	0	0
32	5	Konfederacja	0	0	17	1
33	5	Polska2050-TD	33	0	0	0
34	5	Lewica	25	0	0	1
35	5	Kukiz15	0	3	0	0
36	6	PiS	174	0	0	15
37	6	KO	150	0	0	7
38	6	PSL-TD	32	0	0	0
39	6	Konfederacja	8	5	4	1
40	6	Polska2050-TD	33	0	0	0
41	6	Lewica	25	0	0	1
42	6	Kukiz15	3	0	0	0
43	7	PiS	173	0	1	15
44	7	KO	150	0	0	7
45	7	PSL-TD	32	0	0	0
46	7	Konfederacja	17	0	0	1
47	7	Polska2050-TD	33	0	0	0
48	7	Lewica	25	0	0	1
49	7	Kukiz15	3	0	0	0
50	8	PiS	0	136	0	10
51	8	KO	146	0	0	10
52	8	Demokracja	0	3	0	1
53	8	RozwojPlus	37	0	0	4
54	8	PSL-TD	28	0	0	4
55	8	Konfederacja	0	14	0	2
56	8	Centrum	14	0	0	1
57	8	Lewica	20	0	0	1
58	8	Polska2050	12	0	0	3
59	8	Konfederacja_KP	0	2	0	1
60	8	niez.	4	1	0	2
61	8	Razem	3	0	0	1
62	9	PiS	135	0	0	11
63	9	KO	144	0	0	12
64	9	Demokracja	0	3	0	1
65	9	RozwojPlus	2	0	36	3
66	9	PSL-TD	30	0	0	2
67	9	Konfederacja	0	14	0	2
68	9	Centrum	14	0	0	1
69	9	Lewica	20	0	0	1
70	9	Polska2050	12	0	0	3
71	9	Konfederacja_KP	0	2	0	1
72	9	niez.	4	1	0	2
73	9	Razem	3	0	0	1
74	10	PiS	136	0	0	10
75	10	KO	147	0	0	9
76	10	Demokracja	0	3	0	1
77	10	RozwojPlus	37	0	1	3
78	10	PSL-TD	29	0	0	3
79	10	Konfederacja	0	14	0	2
80	10	Centrum	14	0	0	1
81	10	Lewica	18	0	0	3
82	10	Polska2050	12	0	0	3
83	10	Konfederacja_KP	0	2	0	1
84	10	niez.	4	1	0	2
85	10	Razem	3	0	0	1
86	11	PiS	134	0	0	12
87	11	KO	146	0	0	10
88	11	Demokracja	0	3	0	1
89	11	RozwojPlus	38	0	0	3
90	11	PSL-TD	30	0	0	2
91	11	Konfederacja	0	14	0	2
92	11	Centrum	14	0	0	1
93	11	Lewica	19	0	0	2
94	11	Polska2050	11	0	0	4
95	11	Konfederacja_KP	0	2	0	1
96	11	niez.	4	1	0	2
97	11	Razem	3	0	0	1
98	12	PiS	134	0	0	12
99	12	KO	1	143	0	12
100	12	Demokracja	3	0	0	1
101	12	RozwojPlus	31	0	7	3
102	12	PSL-TD	0	27	0	5
103	12	Konfederacja	13	0	1	2
104	12	Centrum	0	14	0	1
105	12	Lewica	0	20	0	1
106	12	Polska2050	0	12	0	3
107	12	Konfederacja_KP	2	0	0	1
108	12	niez.	2	3	0	2
109	12	Razem	0	0	3	1
110	13	PiS	0	0	0	146
111	13	KO	0	0	0	156
112	13	Demokracja	0	0	0	4
113	13	RozwojPlus	0	0	0	41
114	13	PSL-TD	0	0	0	32
115	13	Konfederacja	0	0	0	16
116	13	Centrum	0	0	0	15
117	13	Lewica	0	0	0	21
118	13	Polska2050	0	0	0	15
119	13	Konfederacja_KP	0	0	0	3
120	13	niez.	0	0	0	7
121	13	Razem	0	0	0	4
122	14	PiS	0	2	132	12
123	14	KO	154	0	0	2
124	14	Demokracja	0	3	0	1
125	14	RozwojPlus	0	7	29	5
126	14	PSL-TD	31	0	0	1
127	14	Konfederacja	0	15	0	1
128	14	Centrum	14	0	0	1
129	14	Lewica	20	0	0	1
130	14	Polska2050	14	0	0	1
131	14	Konfederacja_KP	0	2	0	1
132	14	niez.	3	1	0	3
133	14	Razem	1	0	0	3
134	15	PiS	140	0	0	6
135	15	KO	153	0	0	3
136	15	Demokracja	0	3	0	1
137	15	RozwojPlus	1	0	37	3
138	15	PSL-TD	30	0	0	2
139	15	Konfederacja	0	15	0	1
140	15	Centrum	14	0	0	1
141	15	Lewica	20	0	0	1
142	15	Polska2050	14	0	0	1
143	15	Konfederacja_KP	0	2	0	1
144	15	niez.	3	1	0	3
145	15	Razem	3	0	0	1
146	16	PiS	0	2	139	5
147	16	KO	154	0	0	2
148	16	Demokracja	0	3	0	1
149	16	RozwojPlus	0	0	38	3
150	16	PSL-TD	31	0	0	1
151	16	Konfederacja	0	15	0	1
152	16	Centrum	14	0	0	1
153	16	Lewica	20	0	0	1
154	16	Polska2050	14	0	0	1
155	16	Konfederacja_KP	0	2	0	1
156	16	niez.	3	1	0	3
157	16	Razem	3	0	0	1
158	17	PiS	0	139	0	7
159	17	KO	155	0	0	1
160	17	Demokracja	0	3	0	1
161	17	RozwojPlus	0	3	35	3
162	17	PSL-TD	30	0	0	2
163	17	Konfederacja	0	15	0	1
164	17	Centrum	14	0	0	1
165	17	Lewica	20	0	0	1
166	17	Polska2050	14	0	0	1
167	17	Konfederacja_KP	0	2	0	1
168	17	niez.	3	1	0	3
169	17	Razem	3	0	0	1
170	18	PiS	136	3	0	7
171	18	KO	0	155	0	1
172	18	Demokracja	3	0	0	1
173	18	RozwojPlus	36	0	1	4
174	18	PSL-TD	0	31	0	1
175	18	Konfederacja	11	1	2	2
176	18	Centrum	0	13	0	2
177	18	Lewica	0	20	0	1
178	18	Polska2050	0	14	0	1
179	18	Konfederacja_KP	2	0	0	1
180	18	niez.	2	2	0	3
181	18	Razem	0	3	0	1
182	19	PiS	0	0	0	146
183	19	KO	0	0	0	156
184	19	Demokracja	0	0	0	4
185	19	RozwojPlus	0	0	0	41
186	19	PSL-TD	0	0	0	32
187	19	Konfederacja	0	0	0	16
188	19	Centrum	0	0	0	15
189	19	Lewica	0	0	0	21
190	19	Polska2050	0	0	0	15
191	19	Konfederacja_KP	0	0	0	3
192	19	niez.	0	0	0	7
193	19	Razem	0	0	0	4
194	20	PiS	0	133	0	13
195	20	KO	155	0	0	1
196	20	Demokracja	0	3	0	1
197	20	RozwojPlus	0	37	0	4
198	20	PSL-TD	30	0	0	2
199	20	Konfederacja	1	10	3	2
200	20	Centrum	14	0	0	1
201	20	Lewica	20	0	0	1
202	20	Polska2050	14	0	0	1
203	20	Konfederacja_KP	0	0	2	1
204	20	niez.	2	3	0	2
205	20	Razem	0	3	0	1
206	22	PiS	0	141	0	5
207	22	KO	156	0	0	0
208	22	Demokracja	0	3	0	1
209	22	RozwojPlus	0	38	0	3
210	22	PSL-TD	31	0	0	1
211	22	Konfederacja	0	15	0	1
212	22	Centrum	13	0	0	2
213	22	Lewica	21	0	0	0
214	22	Polska2050	14	0	0	1
215	22	Konfederacja_KP	0	0	2	1
216	22	niez.	3	1	1	2
217	22	Razem	3	0	0	1
218	23	PiS	1	0	136	9
219	23	KO	156	0	0	0
220	23	Demokracja	1	2	0	1
221	23	RozwojPlus	0	0	38	3
222	23	PSL-TD	31	0	0	1
223	23	Konfederacja	13	0	1	2
224	23	Centrum	13	0	0	2
225	23	Lewica	21	0	0	0
226	23	Polska2050	14	0	0	1
227	23	Konfederacja_KP	2	0	0	1
228	23	niez.	5	0	0	2
229	23	Razem	3	0	0	1
230	24	PiS	140	0	0	6
231	24	KO	156	0	0	0
232	24	Demokracja	3	0	0	1
233	24	RozwojPlus	38	0	0	3
234	24	PSL-TD	31	0	0	1
235	24	Konfederacja	14	1	0	1
236	24	Centrum	13	0	0	2
237	24	Lewica	21	0	0	0
238	24	Polska2050	14	0	0	1
239	24	Konfederacja_KP	2	0	0	1
240	24	niez.	4	0	0	3
241	24	Razem	3	0	0	1
242	25	PiS	142	0	0	4
243	25	KO	149	4	1	2
244	25	Demokracja	3	0	0	1
245	25	RozwojPlus	38	0	0	3
246	25	PSL-TD	31	0	0	1
247	25	Konfederacja	15	0	0	1
248	25	Centrum	14	0	0	1
249	25	Lewica	11	6	0	4
250	25	Polska2050	10	1	3	1
251	25	Konfederacja_KP	2	0	0	1
252	25	niez.	3	2	0	2
253	25	Razem	0	3	0	1
254	26	PiS	142	0	0	4
255	26	KO	0	155	0	1
256	26	Demokracja	3	0	0	1
257	26	RozwojPlus	38	0	0	3
258	26	PSL-TD	0	30	0	2
259	26	Konfederacja	15	0	0	1
260	26	Centrum	0	14	0	1
261	26	Lewica	0	21	0	0
262	26	Polska2050	0	14	0	1
263	26	Konfederacja_KP	2	0	0	1
264	26	niez.	1	4	0	2
265	26	Razem	0	3	0	1
266	27	PiS	0	139	0	7
267	27	KO	155	0	0	1
268	27	Demokracja	0	3	0	1
269	27	RozwojPlus	0	38	0	3
270	27	PSL-TD	31	0	0	1
271	27	Konfederacja	0	15	0	1
272	27	Centrum	14	0	0	1
273	27	Lewica	21	0	0	0
274	27	Polska2050	14	0	0	1
275	27	Konfederacja_KP	0	2	0	1
276	27	niez.	4	1	0	2
277	27	Razem	3	0	0	1
278	28	PiS	142	0	0	4
279	28	KO	0	155	0	1
280	28	Demokracja	3	0	0	1
281	28	RozwojPlus	35	1	0	5
282	28	PSL-TD	0	30	0	2
283	28	Konfederacja	15	0	0	1
284	28	Centrum	0	14	0	1
285	28	Lewica	0	21	0	0
286	28	Polska2050	0	14	0	1
287	28	Konfederacja_KP	2	0	0	1
288	28	niez.	2	3	0	2
289	28	Razem	0	0	3	1
290	29	PiS	1	138	0	7
291	29	KO	154	0	0	2
292	29	Demokracja	0	0	3	1
293	29	RozwojPlus	0	38	0	3
294	29	PSL-TD	31	0	0	1
295	29	Konfederacja	0	0	15	1
296	29	Centrum	14	0	0	1
297	29	Lewica	21	0	0	0
298	29	Polska2050	14	0	0	1
299	29	Konfederacja_KP	0	0	2	1
300	29	niez.	4	0	1	2
301	29	Razem	3	0	0	1
302	30	PiS	0	141	0	5
303	30	KO	154	0	0	2
304	30	Demokracja	3	0	0	1
305	30	RozwojPlus	0	38	0	3
306	30	PSL-TD	31	0	0	1
307	30	Konfederacja	15	0	0	1
308	30	Centrum	13	0	0	2
309	30	Lewica	21	0	0	0
310	30	Polska2050	14	0	0	1
311	30	Konfederacja_KP	2	0	0	1
312	30	niez.	4	0	0	3
313	30	Razem	3	0	0	1
314	31	PiS	0	141	0	5
315	31	KO	154	0	0	2
316	31	Demokracja	3	0	0	1
317	31	RozwojPlus	0	37	0	4
318	31	PSL-TD	31	0	0	1
319	31	Konfederacja	15	0	0	1
320	31	Centrum	14	0	0	1
321	31	Lewica	21	0	0	0
322	31	Polska2050	14	0	0	1
323	31	Konfederacja_KP	2	0	0	1
324	31	niez.	5	0	0	2
325	31	Razem	3	0	0	1
326	32	PiS	0	139	0	7
327	32	KO	154	0	0	2
328	32	Demokracja	3	0	0	1
329	32	RozwojPlus	0	3	35	3
330	32	PSL-TD	30	0	0	2
331	32	Konfederacja	15	0	0	1
332	32	Centrum	14	0	0	1
333	32	Lewica	21	0	0	0
334	32	Polska2050	13	0	0	2
335	32	Konfederacja_KP	2	0	0	1
336	32	niez.	5	0	0	2
337	32	Razem	3	0	0	1
338	33	PiS	0	139	0	7
339	33	KO	155	0	0	1
340	33	Demokracja	0	0	2	2
341	33	RozwojPlus	1	36	0	4
342	33	PSL-TD	31	0	0	1
343	33	Konfederacja	0	0	15	1
344	33	Centrum	14	0	0	1
345	33	Lewica	21	0	0	0
346	33	Polska2050	14	0	0	1
347	33	Konfederacja_KP	0	0	2	1
348	33	niez.	3	0	1	3
349	33	Razem	3	0	0	1
350	34	PiS	0	138	0	8
351	34	KO	155	0	0	1
352	34	Demokracja	0	0	3	1
353	34	RozwojPlus	0	28	9	4
354	34	PSL-TD	31	0	0	1
355	34	Konfederacja	0	0	15	1
356	34	Centrum	14	0	0	1
357	34	Lewica	21	0	0	0
358	34	Polska2050	14	0	0	1
359	34	Konfederacja_KP	0	0	2	1
360	34	niez.	3	0	2	2
361	34	Razem	3	0	0	1
362	35	PiS	0	141	0	5
363	35	KO	153	0	0	3
364	35	Demokracja	0	0	3	1
365	35	RozwojPlus	1	2	35	3
366	35	PSL-TD	31	0	0	1
367	35	Konfederacja	0	0	15	1
368	35	Centrum	14	0	0	1
369	35	Lewica	21	0	0	0
370	35	Polska2050	14	0	0	1
371	35	Konfederacja_KP	0	0	2	1
372	35	niez.	3	0	2	2
373	35	Razem	3	0	0	1
374	36	PiS	0	141	0	5
375	36	KO	155	0	0	1
376	36	Demokracja	0	3	0	1
377	36	RozwojPlus	0	37	0	4
378	36	PSL-TD	31	0	0	1
379	36	Konfederacja	0	15	0	1
380	36	Centrum	14	0	0	1
381	36	Lewica	21	0	0	0
382	36	Polska2050	14	0	0	1
383	36	Konfederacja_KP	0	2	0	1
384	36	niez.	3	2	0	2
385	36	Razem	0	0	3	1
386	37	PiS	0	1	140	5
387	37	KO	154	0	0	2
388	37	Demokracja	3	0	0	1
389	37	RozwojPlus	38	0	0	3
390	37	PSL-TD	30	0	0	2
391	37	Konfederacja	15	0	0	1
392	37	Centrum	14	0	0	1
393	37	Lewica	21	0	0	0
394	37	Polska2050	14	0	0	1
395	37	Konfederacja_KP	2	0	0	1
396	37	niez.	5	0	0	2
397	37	Razem	3	0	0	1
398	38	PiS	140	0	0	6
399	38	KO	155	0	0	1
400	38	Demokracja	3	0	0	1
401	38	RozwojPlus	38	0	0	3
402	38	PSL-TD	31	0	0	1
403	38	Konfederacja	15	0	0	1
404	38	Centrum	14	0	0	1
405	38	Lewica	21	0	0	0
406	38	Polska2050	14	0	0	1
407	38	Konfederacja_KP	2	0	0	1
408	38	niez.	5	0	0	2
409	38	Razem	3	0	0	1
410	39	PiS	141	0	0	5
411	39	KO	0	155	0	1
412	39	Demokracja	3	0	0	1
413	39	RozwojPlus	5	0	33	3
414	39	PSL-TD	0	31	0	1
415	39	Konfederacja	15	0	0	1
416	39	Centrum	0	14	0	1
417	39	Lewica	0	21	0	0
418	39	Polska2050	0	14	0	1
419	39	Konfederacja_KP	2	0	0	1
420	39	niez.	1	4	0	2
421	39	Razem	0	3	0	1
422	40	PiS	0	139	1	6
423	40	KO	155	0	0	1
424	40	Demokracja	0	3	0	1
425	40	RozwojPlus	0	1	37	3
426	40	PSL-TD	30	0	0	2
427	40	Konfederacja	0	15	0	1
428	40	Centrum	14	0	0	1
429	40	Lewica	21	0	0	0
430	40	Polska2050	14	0	0	1
431	40	Konfederacja_KP	0	2	0	1
432	40	niez.	4	1	0	2
433	40	Razem	3	0	0	1
434	41	PiS	139	0	0	7
435	41	KO	0	154	0	2
436	41	Demokracja	3	0	0	1
437	41	RozwojPlus	38	0	0	3
438	41	PSL-TD	0	29	0	3
439	41	Konfederacja	15	0	0	1
440	41	Centrum	0	14	0	1
441	41	Lewica	0	21	0	0
442	41	Polska2050	0	14	0	1
443	41	Konfederacja_KP	2	0	0	1
444	41	niez.	1	4	0	2
445	41	Razem	0	3	0	1
446	42	PiS	139	0	0	7
447	42	KO	2	153	0	1
448	42	Demokracja	3	0	0	1
449	42	RozwojPlus	38	0	0	3
450	42	PSL-TD	0	30	0	2
451	42	Konfederacja	15	0	0	1
452	42	Centrum	1	13	0	1
453	42	Lewica	1	20	0	0
454	42	Polska2050	0	14	0	1
455	42	Konfederacja_KP	2	0	0	1
456	42	niez.	2	3	0	2
457	42	Razem	0	3	0	1
458	43	PiS	140	0	0	6
459	43	KO	1	151	0	4
460	43	Demokracja	3	0	0	1
461	43	RozwojPlus	34	0	0	7
462	43	PSL-TD	0	29	0	3
463	43	Konfederacja	15	0	0	1
464	43	Centrum	0	14	0	1
465	43	Lewica	0	19	0	2
466	43	Polska2050	0	14	0	1
467	43	Konfederacja_KP	2	0	0	1
468	43	niez.	1	4	0	2
469	43	Razem	0	3	0	1
470	44	PiS	0	139	0	7
471	44	KO	153	0	0	3
472	44	Demokracja	0	3	0	1
473	44	RozwojPlus	0	38	0	3
474	44	PSL-TD	29	0	0	3
475	44	Konfederacja	0	15	0	1
476	44	Centrum	14	0	0	1
477	44	Lewica	21	0	0	0
478	44	Polska2050	12	1	0	2
479	44	Konfederacja_KP	0	2	0	1
480	44	niez.	4	1	0	2
481	44	Razem	3	0	0	1
482	45	PiS	140	0	0	6
483	45	KO	0	151	0	5
484	45	Demokracja	0	0	3	1
485	45	RozwojPlus	38	0	0	3
486	45	PSL-TD	1	29	0	2
487	45	Konfederacja	0	0	14	2
488	45	Centrum	0	14	0	1
489	45	Lewica	0	21	0	0
490	45	Polska2050	0	14	0	1
491	45	Konfederacja_KP	0	0	2	1
492	45	niez.	1	3	1	2
493	45	Razem	0	3	0	1
494	46	PiS	2	1	135	8
495	46	KO	154	0	0	2
496	46	Demokracja	0	3	0	1
497	46	RozwojPlus	34	1	2	4
498	46	PSL-TD	29	1	0	2
499	46	Konfederacja	0	15	0	1
500	46	Centrum	14	0	0	1
501	46	Lewica	19	0	0	2
502	46	Polska2050	14	0	0	1
503	46	Konfederacja_KP	0	2	0	1
504	46	niez.	4	1	0	2
505	46	Razem	3	0	0	1
506	47	PiS	0	138	0	8
507	47	KO	0	153	0	3
508	47	Demokracja	0	2	1	1
509	47	RozwojPlus	0	38	0	3
510	47	PSL-TD	28	3	0	1
511	47	Konfederacja	0	0	15	1
512	47	Centrum	1	13	0	1
513	47	Lewica	0	21	0	0
514	47	Polska2050	0	14	0	1
515	47	Konfederacja_KP	0	0	2	1
516	47	niez.	2	1	2	2
517	47	Razem	0	0	3	1
518	48	PiS	137	0	0	9
519	48	KO	154	0	0	2
520	48	Demokracja	0	0	3	1
521	48	RozwojPlus	38	0	0	3
522	48	PSL-TD	31	0	0	1
523	48	Konfederacja	0	0	14	2
524	48	Centrum	14	0	0	1
525	48	Lewica	21	0	0	0
526	48	Polska2050	14	0	0	1
527	48	Konfederacja_KP	0	0	2	1
528	48	niez.	5	0	0	2
529	48	Razem	3	0	0	1
530	49	PiS	138	0	0	8
531	49	KO	149	1	0	6
532	49	Demokracja	3	0	0	1
533	49	RozwojPlus	37	0	0	4
534	49	PSL-TD	30	0	0	2
535	49	Konfederacja	15	0	0	1
536	49	Centrum	14	0	0	1
537	49	Lewica	21	0	0	0
538	49	Polska2050	14	0	0	1
539	49	Konfederacja_KP	2	0	0	1
540	49	niez.	4	0	1	2
541	49	Razem	0	0	3	1
542	50	PiS	136	1	1	8
543	50	KO	155	0	0	1
544	50	Demokracja	0	0	3	1
545	50	RozwojPlus	2	1	33	5
546	50	PSL-TD	30	0	0	2
547	50	Konfederacja	0	0	14	2
548	50	Centrum	14	0	0	1
549	50	Lewica	21	0	0	0
550	50	Polska2050	14	0	0	1
551	50	Konfederacja_KP	0	0	2	1
552	50	niez.	5	0	0	2
553	50	Razem	3	0	0	1
554	51	PiS	140	0	0	6
555	51	KO	155	0	0	1
556	51	Demokracja	0	3	0	1
557	51	RozwojPlus	37	0	0	4
558	51	PSL-TD	29	1	0	2
559	51	Konfederacja	0	15	0	1
560	51	Centrum	14	0	0	1
561	51	Lewica	21	0	0	0
562	51	Polska2050	14	0	0	1
563	51	Konfederacja_KP	0	2	0	1
564	51	niez.	4	0	0	3
565	51	Razem	3	0	0	1
566	52	PiS	0	139	0	7
567	52	KO	0	154	0	2
568	52	Demokracja	0	1	2	1
569	52	RozwojPlus	1	37	0	3
570	52	PSL-TD	1	28	0	3
571	52	Konfederacja	0	0	15	1
572	52	Centrum	0	13	0	2
573	52	Lewica	1	20	0	0
574	52	Polska2050	0	14	0	1
575	52	Konfederacja_KP	0	0	2	1
576	52	niez.	0	4	1	2
577	52	Razem	0	3	0	1
578	53	PiS	0	139	0	7
579	53	KO	2	149	0	5
580	53	Demokracja	0	3	0	1
581	53	RozwojPlus	1	37	0	3
582	53	PSL-TD	0	29	0	3
583	53	Konfederacja	0	15	0	1
584	53	Centrum	0	14	0	1
585	53	Lewica	0	21	0	0
586	53	Polska2050	0	13	0	2
587	53	Konfederacja_KP	0	2	0	1
588	53	niez.	0	5	0	2
589	53	Razem	0	3	0	1
590	54	PiS	0	139	0	7
591	54	KO	0	154	0	2
592	54	Demokracja	0	3	0	1
593	54	RozwojPlus	1	36	0	4
594	54	PSL-TD	0	30	0	2
595	54	Konfederacja	0	15	0	1
596	54	Centrum	0	14	0	1
597	54	Lewica	0	21	0	0
598	54	Polska2050	0	13	0	2
599	54	Konfederacja_KP	0	2	0	1
600	54	niez.	0	5	0	2
601	54	Razem	0	3	0	1
602	55	PiS	0	140	0	6
603	55	KO	0	155	0	1
604	55	Demokracja	2	1	0	1
605	55	RozwojPlus	0	36	1	4
606	55	PSL-TD	0	29	0	3
607	55	Konfederacja	15	0	0	1
608	55	Centrum	0	14	0	1
609	55	Lewica	0	21	0	0
610	55	Polska2050	0	14	0	1
611	55	Konfederacja_KP	2	0	0	1
612	55	niez.	1	4	0	2
613	55	Razem	0	3	0	1
614	56	PiS	0	137	0	9
615	56	KO	0	154	0	2
616	56	Demokracja	0	0	0	4
617	56	RozwojPlus	0	37	0	4
618	56	PSL-TD	0	29	0	3
619	56	Konfederacja	0	15	0	1
620	56	Centrum	0	14	0	1
621	56	Lewica	0	21	0	0
622	56	Polska2050	0	14	0	1
623	56	Konfederacja_KP	0	2	0	1
624	56	niez.	0	5	0	2
625	56	Razem	0	3	0	1
626	57	PiS	0	139	0	7
627	57	KO	0	153	0	3
628	57	Demokracja	0	3	0	1
629	57	RozwojPlus	0	36	0	5
630	57	PSL-TD	0	31	0	1
631	57	Konfederacja	0	15	0	1
632	57	Centrum	0	14	0	1
633	57	Lewica	0	21	0	0
634	57	Polska2050	0	13	0	2
635	57	Konfederacja_KP	0	2	0	1
636	57	niez.	0	4	0	3
637	57	Razem	0	3	0	1
638	58	PiS	0	137	0	9
639	58	KO	0	155	0	1
640	58	Demokracja	0	0	3	1
641	58	RozwojPlus	0	38	0	3
642	58	PSL-TD	1	30	0	1
643	58	Konfederacja	0	0	15	1
644	58	Centrum	0	13	0	2
645	58	Lewica	0	21	0	0
646	58	Polska2050	0	13	0	2
647	58	Konfederacja_KP	0	0	2	1
648	58	niez.	0	4	0	3
649	58	Razem	0	3	0	1
650	59	PiS	0	138	0	8
651	59	KO	155	0	0	1
652	59	Demokracja	0	3	0	1
653	59	RozwojPlus	0	38	0	3
654	59	PSL-TD	30	1	0	1
655	59	Konfederacja	0	15	0	1
656	59	Centrum	13	0	0	2
657	59	Lewica	21	0	0	0
658	59	Polska2050	14	0	0	1
659	59	Konfederacja_KP	0	2	0	1
660	59	niez.	3	1	1	2
661	59	Razem	0	0	3	1
662	60	PiS	0	137	0	9
663	60	KO	1	154	0	1
664	60	Demokracja	0	3	0	1
665	60	RozwojPlus	0	38	0	3
666	60	PSL-TD	0	31	0	1
667	60	Konfederacja	0	15	0	1
668	60	Centrum	0	14	0	1
669	60	Lewica	2	19	0	0
670	60	Polska2050	0	14	0	1
671	60	Konfederacja_KP	0	2	0	1
672	60	niez.	0	5	0	2
673	60	Razem	0	3	0	1
674	61	PiS	0	139	0	7
675	61	KO	155	0	0	1
676	61	Demokracja	0	0	3	1
677	61	RozwojPlus	1	37	0	3
678	61	PSL-TD	31	0	0	1
679	61	Konfederacja	0	0	15	1
680	61	Centrum	14	0	0	1
681	61	Lewica	21	0	0	0
682	61	Polska2050	14	0	0	1
683	61	Konfederacja_KP	0	0	2	1
684	61	niez.	3	0	2	2
685	61	Razem	0	0	3	1
686	62	PiS	124	12	0	10
687	62	KO	151	2	0	3
688	62	Demokracja	0	3	0	1
689	62	RozwojPlus	2	35	0	4
690	62	PSL-TD	27	0	0	5
691	62	Konfederacja	0	15	0	1
692	62	Centrum	14	0	0	1
693	62	Lewica	20	1	0	0
694	62	Polska2050	14	0	0	1
695	62	Konfederacja_KP	0	2	0	1
696	62	niez.	3	2	0	2
697	62	Razem	3	0	0	1
698	63	PiS	0	2	136	8
699	63	KO	0	152	0	4
700	63	Demokracja	0	3	0	1
701	63	RozwojPlus	1	37	0	3
702	63	PSL-TD	0	31	0	1
703	63	Konfederacja	0	14	0	2
704	63	Centrum	0	14	0	1
705	63	Lewica	0	21	0	0
706	63	Polska2050	0	14	0	1
707	63	Konfederacja_KP	0	2	0	1
708	63	niez.	0	5	0	2
709	63	Razem	0	3	0	1
710	64	PiS	0	1	137	8
711	64	KO	154	0	0	2
712	64	Demokracja	0	3	0	1
713	64	RozwojPlus	0	36	1	4
714	64	PSL-TD	28	2	0	2
715	64	Konfederacja	0	15	0	1
716	64	Centrum	14	0	0	1
717	64	Lewica	21	0	0	0
718	64	Polska2050	14	0	0	1
719	64	Konfederacja_KP	0	2	0	1
720	64	niez.	3	2	0	2
721	64	Razem	0	3	0	1
722	65	PiS	140	0	0	6
723	65	KO	0	155	0	1
724	65	Demokracja	0	3	0	1
725	65	RozwojPlus	0	34	1	6
726	65	PSL-TD	1	30	0	1
727	65	Konfederacja	0	15	0	1
728	65	Centrum	0	14	0	1
729	65	Lewica	0	21	0	0
730	65	Polska2050	0	14	0	1
731	65	Konfederacja_KP	0	2	0	1
732	65	niez.	0	5	0	2
733	65	Razem	0	0	0	4
734	66	PiS	0	140	0	6
735	66	KO	0	155	0	1
736	66	Demokracja	0	3	0	1
737	66	RozwojPlus	0	36	1	4
738	66	PSL-TD	0	30	0	2
739	66	Konfederacja	0	15	0	1
740	66	Centrum	0	14	0	1
741	66	Lewica	0	21	0	0
742	66	Polska2050	0	14	0	1
743	66	Konfederacja_KP	0	2	0	1
744	66	niez.	0	4	0	3
745	66	Razem	0	3	0	1
746	67	PiS	0	139	0	7
747	67	KO	0	155	0	1
748	67	Demokracja	0	3	0	1
749	67	RozwojPlus	0	37	0	4
750	67	PSL-TD	0	30	0	2
751	67	Konfederacja	0	15	0	1
752	67	Centrum	0	14	0	1
753	67	Lewica	0	21	0	0
754	67	Polska2050	0	13	1	1
755	67	Konfederacja_KP	0	2	0	1
756	67	niez.	0	5	0	2
757	67	Razem	0	3	0	1
758	68	PiS	0	139	0	7
759	68	KO	0	153	0	3
760	68	Demokracja	0	3	0	1
761	68	RozwojPlus	0	37	0	4
762	68	PSL-TD	0	30	0	2
763	68	Konfederacja	1	14	0	1
764	68	Centrum	0	14	0	1
765	68	Lewica	0	21	0	0
766	68	Polska2050	0	13	1	1
767	68	Konfederacja_KP	0	2	0	1
768	68	niez.	0	5	0	2
769	68	Razem	0	3	0	1
770	69	PiS	0	135	0	11
771	69	KO	0	151	0	5
772	69	Demokracja	0	3	0	1
773	69	RozwojPlus	0	37	0	4
774	69	PSL-TD	0	30	0	2
775	69	Konfederacja	0	14	0	2
776	69	Centrum	0	14	0	1
777	69	Lewica	0	21	0	0
778	69	Polska2050	0	13	1	1
779	69	Konfederacja_KP	0	2	0	1
780	69	niez.	0	5	0	2
781	69	Razem	0	2	0	2
782	70	PiS	0	136	0	10
783	70	KO	0	154	0	2
784	70	Demokracja	0	0	3	1
785	70	RozwojPlus	0	35	0	6
786	70	PSL-TD	0	30	0	2
787	70	Konfederacja	0	0	15	1
788	70	Centrum	0	14	0	1
789	70	Lewica	0	19	0	2
790	70	Polska2050	0	14	0	1
791	70	Konfederacja_KP	0	0	2	1
792	70	niez.	0	4	1	2
793	70	Razem	0	3	0	1
794	71	PiS	0	136	0	10
795	71	KO	155	0	0	1
796	71	Demokracja	1	2	0	1
797	71	RozwojPlus	35	0	0	6
798	71	PSL-TD	31	0	0	1
799	71	Konfederacja	14	0	0	2
800	71	Centrum	14	0	0	1
801	71	Lewica	21	0	0	0
802	71	Polska2050	14	0	0	1
803	71	Konfederacja_KP	0	0	2	1
804	71	niez.	5	0	0	2
805	71	Razem	3	0	0	1
806	72	PiS	132	0	0	14
807	72	KO	151	0	0	5
808	72	Demokracja	3	0	0	1
809	72	RozwojPlus	35	0	0	6
810	72	PSL-TD	30	0	0	2
811	72	Konfederacja	15	0	0	1
812	72	Centrum	14	0	0	1
813	72	Lewica	21	0	0	0
814	72	Polska2050	14	0	0	1
815	72	Konfederacja_KP	2	0	0	1
816	72	niez.	5	0	0	2
817	72	Razem	3	0	0	1
818	73	PiS	7	117	1	21
819	73	KO	143	0	0	13
820	73	Demokracja	1	2	0	1
821	73	RozwojPlus	28	8	0	5
822	73	PSL-TD	28	0	0	4
823	73	Konfederacja	0	0	12	4
824	73	Centrum	12	0	0	3
825	73	Lewica	20	0	0	1
826	73	Polska2050	13	0	0	2
827	73	Konfederacja_KP	0	0	2	1
828	73	niez.	4	0	1	2
829	73	Razem	0	4	0	0
830	74	PiS	129	1	0	16
831	74	KO	0	147	0	9
832	74	Demokracja	3	0	0	1
833	74	RozwojPlus	38	0	0	3
834	74	PSL-TD	0	28	0	4
835	74	Konfederacja	6	0	6	4
836	74	Centrum	0	12	0	3
837	74	Lewica	0	20	0	1
838	74	Polska2050	0	13	0	2
839	74	Konfederacja_KP	1	0	1	1
840	74	niez.	1	3	1	2
841	74	Razem	0	4	0	0
842	75	PiS	0	0	0	146
843	75	KO	0	0	0	156
844	75	Demokracja	0	0	0	4
845	75	RozwojPlus	0	0	0	41
846	75	PSL-TD	0	0	0	32
847	75	Konfederacja	0	0	0	16
848	75	Centrum	0	0	0	15
849	75	Lewica	0	0	0	21
850	75	Polska2050	0	0	0	15
851	75	Konfederacja_KP	0	0	0	3
852	75	niez.	0	0	0	7
853	75	Razem	0	0	0	4
854	76	PiS	129	0	0	17
855	76	KO	0	145	0	11
856	76	Demokracja	3	0	0	1
857	76	RozwojPlus	19	18	0	4
858	76	PSL-TD	0	28	0	4
859	76	Konfederacja	10	0	0	6
860	76	Centrum	0	12	0	3
861	76	Lewica	0	20	0	1
862	76	Polska2050	0	13	0	2
863	76	Konfederacja_KP	2	0	0	1
864	76	niez.	0	5	0	2
865	76	Razem	0	4	0	0
866	77	PiS	0	126	0	20
867	77	KO	145	0	0	11
868	77	Demokracja	0	2	0	2
869	77	RozwojPlus	35	1	0	5
870	77	PSL-TD	29	0	0	3
871	77	Konfederacja	0	8	0	8
872	77	Centrum	11	0	0	4
873	77	Lewica	20	0	0	1
874	77	Polska2050	13	0	0	2
875	77	Konfederacja_KP	0	1	0	2
876	77	niez.	4	2	0	1
877	77	Razem	4	0	0	0
878	78	PiS	0	126	0	20
879	78	KO	143	0	0	13
880	78	Demokracja	0	1	1	2
881	78	RozwojPlus	4	32	0	5
882	78	PSL-TD	29	0	0	3
883	78	Konfederacja	0	0	8	8
884	78	Centrum	11	0	0	4
885	78	Lewica	20	0	0	1
886	78	Polska2050	13	0	0	2
887	78	Konfederacja_KP	0	0	1	2
888	78	niez.	4	1	1	1
889	78	Razem	4	0	0	0
890	79	PiS	0	141	0	5
891	79	KO	151	0	0	5
892	79	Demokracja	0	2	0	2
893	79	RozwojPlus	1	33	0	7
894	79	PSL-TD	28	0	0	4
895	79	Konfederacja	0	13	0	3
896	79	Centrum	14	0	0	1
897	79	Lewica	20	0	0	1
898	79	Polska2050	14	0	0	1
899	79	Konfederacja_KP	0	3	0	0
900	79	niez.	4	2	1	0
901	79	Razem	4	0	0	0
902	80	PiS	0	0	141	5
903	80	KO	151	0	0	5
904	80	Demokracja	0	2	0	2
905	80	RozwojPlus	34	0	0	7
906	80	PSL-TD	29	0	0	3
907	80	Konfederacja	0	13	0	3
908	80	Centrum	14	0	0	1
909	80	Lewica	20	0	0	1
910	80	Polska2050	14	0	0	1
911	80	Konfederacja_KP	0	3	0	0
912	80	niez.	5	1	1	0
913	80	Razem	4	0	0	0
914	81	PiS	0	141	0	5
915	81	KO	152	0	0	4
916	81	Demokracja	0	2	0	2
917	81	RozwojPlus	35	0	0	6
918	81	PSL-TD	29	0	0	3
919	81	Konfederacja	0	13	0	3
920	81	Centrum	14	0	0	1
921	81	Lewica	20	0	0	1
922	81	Polska2050	14	0	0	1
923	81	Konfederacja_KP	0	3	0	0
924	81	niez.	5	2	0	0
925	81	Razem	4	0	0	0
926	82	PiS	0	140	0	6
927	82	KO	152	0	0	4
928	82	Demokracja	0	2	0	2
929	82	RozwojPlus	0	35	0	6
930	82	PSL-TD	23	5	0	4
931	82	Konfederacja	0	12	0	4
932	82	Centrum	14	0	0	1
933	82	Lewica	20	0	0	1
934	82	Polska2050	14	0	0	1
935	82	Konfederacja_KP	0	3	0	0
936	82	niez.	5	2	0	0
937	82	Razem	4	0	0	0
938	83	PiS	0	141	0	5
939	83	KO	152	0	0	4
940	83	Demokracja	0	2	0	2
941	83	RozwojPlus	0	35	0	6
942	83	PSL-TD	23	5	0	4
943	83	Konfederacja	0	12	0	4
944	83	Centrum	14	0	0	1
945	83	Lewica	20	0	0	1
946	83	Polska2050	14	0	0	1
947	83	Konfederacja_KP	0	3	0	0
948	83	niez.	5	2	0	0
949	83	Razem	4	0	0	0
950	84	PiS	140	0	0	6
951	84	KO	151	0	0	5
952	84	Demokracja	2	0	0	2
953	84	RozwojPlus	35	0	0	6
954	84	PSL-TD	29	0	0	3
955	84	Konfederacja	10	1	1	4
956	84	Centrum	14	0	0	1
957	84	Lewica	19	0	0	2
958	84	Polska2050	12	2	0	1
959	84	Konfederacja_KP	0	0	3	0
960	84	niez.	6	0	1	0
961	84	Razem	4	0	0	0
962	85	PiS	0	138	0	8
963	85	KO	152	0	0	4
964	85	Demokracja	0	0	2	2
965	85	RozwojPlus	0	0	35	6
966	85	PSL-TD	29	0	0	3
967	85	Konfederacja	0	1	12	3
968	85	Centrum	14	0	0	1
969	85	Lewica	19	0	0	2
970	85	Polska2050	14	0	0	1
971	85	Konfederacja_KP	0	0	0	3
972	85	niez.	4	1	2	0
973	85	Razem	0	4	0	0
974	86	PiS	0	1	139	6
975	86	KO	150	0	0	6
976	86	Demokracja	0	3	0	1
977	86	RozwojPlus	38	1	2	0
978	86	PSL-TD	31	0	0	1
979	86	Konfederacja	0	15	0	1
980	86	Centrum	15	0	0	0
981	86	Lewica	19	0	0	2
982	86	Polska2050	12	0	0	3
983	86	Konfederacja_KP	0	3	0	0
984	86	niez.	5	1	1	0
985	86	Razem	4	0	0	0
986	87	PiS	138	0	1	7
987	87	KO	1	150	0	5
988	87	Demokracja	3	0	0	1
989	87	RozwojPlus	12	12	16	1
990	87	PSL-TD	2	27	0	3
991	87	Konfederacja	12	0	3	1
992	87	Centrum	0	15	0	0
993	87	Lewica	0	17	0	4
994	87	Polska2050	0	12	0	3
995	87	Konfederacja_KP	3	0	0	0
996	87	niez.	1	5	1	0
997	87	Razem	0	4	0	0
998	88	PiS	0	0	0	146
999	88	KO	0	0	0	156
1000	88	Demokracja	0	0	0	4
1001	88	RozwojPlus	0	0	0	41
1002	88	PSL-TD	0	0	0	32
1003	88	Konfederacja	0	0	0	16
1004	88	Centrum	0	0	0	15
1005	88	Lewica	0	0	0	21
1006	88	Polska2050	0	0	0	15
1007	88	Konfederacja_KP	0	0	0	3
1008	88	niez.	0	0	0	7
1009	88	Razem	0	0	0	4
1010	89	PiS	127	12	2	5
1011	89	KO	0	149	0	7
1012	89	Demokracja	3	0	0	1
1013	89	RozwojPlus	4	2	34	1
1014	89	PSL-TD	0	31	0	1
1015	89	Konfederacja	3	9	3	1
1016	89	Centrum	1	14	0	0
1017	89	Lewica	0	20	0	1
1018	89	Polska2050	0	11	1	3
1019	89	Konfederacja_KP	0	0	3	0
1020	89	niez.	2	4	1	0
1021	89	Razem	0	4	0	0
1022	90	PiS	0	141	0	5
1023	90	KO	151	0	0	5
1024	90	Demokracja	0	3	0	1
1025	90	RozwojPlus	1	38	0	2
1026	90	PSL-TD	31	0	0	1
1027	90	Konfederacja	0	16	0	0
1028	90	Centrum	15	0	0	0
1029	90	Lewica	20	0	0	1
1030	90	Polska2050	12	0	0	3
1031	90	Konfederacja_KP	0	3	0	0
1032	90	niez.	5	1	0	1
1033	90	Razem	4	0	0	0
1034	91	PiS	142	0	0	4
1035	91	KO	4	147	0	5
1036	91	Demokracja	3	0	0	1
1037	91	RozwojPlus	41	0	0	0
1038	91	PSL-TD	3	26	0	3
1039	91	Konfederacja	16	0	0	0
1040	91	Centrum	1	14	0	0
1041	91	Lewica	0	20	0	1
1042	91	Polska2050	0	12	0	3
1043	91	Konfederacja_KP	2	1	0	0
1044	91	niez.	3	4	0	0
1045	91	Razem	0	0	0	4
1046	92	PiS	128	0	1	17
1047	92	KO	151	0	0	5
1048	92	Demokracja	0	0	3	1
1049	92	RozwojPlus	37	0	4	0
1050	92	PSL-TD	31	0	0	1
1051	92	Konfederacja	0	0	16	0
1052	92	Centrum	15	0	0	0
1053	92	Lewica	20	0	0	1
1054	92	Polska2050	12	0	0	3
1055	92	Konfederacja_KP	0	0	3	0
1056	92	niez.	6	0	1	0
1057	92	Razem	4	0	0	0
1058	93	PiS	140	1	0	5
1059	93	KO	150	0	0	6
1060	93	Demokracja	3	0	0	1
1061	93	RozwojPlus	41	0	0	0
1062	93	PSL-TD	31	0	0	1
1063	93	Konfederacja	16	0	0	0
1064	93	Centrum	15	0	0	0
1065	93	Lewica	20	0	0	1
1066	93	Polska2050	12	0	0	3
1067	93	Konfederacja_KP	3	0	0	0
1068	93	niez.	6	1	0	0
1069	93	Razem	4	0	0	0
1070	95	PiS	0	4	132	10
1071	95	KO	149	0	0	7
1072	95	Demokracja	0	3	0	1
1073	95	RozwojPlus	41	0	0	0
1074	95	PSL-TD	31	0	0	1
1075	95	Konfederacja	0	13	3	0
1076	95	Centrum	15	0	0	0
1077	95	Lewica	20	0	0	1
1078	95	Polska2050	10	0	0	5
1079	95	Konfederacja_KP	0	3	0	0
1080	95	niez.	5	1	1	0
1081	95	Razem	0	0	4	0
1082	96	PiS	0	142	0	4
1083	96	KO	0	148	1	7
1084	96	Demokracja	0	3	0	1
1085	96	RozwojPlus	0	41	0	0
1086	96	PSL-TD	0	31	0	1
1087	96	Konfederacja	0	16	0	0
1088	96	Centrum	0	15	0	0
1089	96	Lewica	0	19	0	2
1090	96	Polska2050	0	12	0	3
1091	96	Konfederacja_KP	0	3	0	0
1092	96	niez.	1	6	0	0
1093	96	Razem	0	4	0	0
1094	97	PiS	0	142	0	4
1095	97	KO	0	147	1	8
1096	97	Demokracja	0	3	0	1
1097	97	RozwojPlus	0	41	0	0
1098	97	PSL-TD	0	31	0	1
1099	97	Konfederacja	0	16	0	0
1100	97	Centrum	0	15	0	0
1101	97	Lewica	0	17	0	4
1102	97	Polska2050	0	12	0	3
1103	97	Konfederacja_KP	0	3	0	0
1104	97	niez.	1	6	0	0
1105	97	Razem	0	4	0	0
1106	98	PiS	141	0	0	5
1107	98	KO	0	151	0	5
1108	98	Demokracja	0	3	0	1
1109	98	RozwojPlus	39	1	0	1
1110	98	PSL-TD	0	31	0	1
1111	98	Konfederacja	14	2	0	0
1112	98	Centrum	0	15	0	0
1113	98	Lewica	0	20	0	1
1114	98	Polska2050	0	11	0	4
1115	98	Konfederacja_KP	0	3	0	0
1116	98	niez.	2	5	0	0
1117	98	Razem	0	4	0	0
1118	99	PiS	5	1	126	14
1119	99	KO	145	3	0	8
1120	99	Demokracja	1	0	1	2
1121	99	RozwojPlus	38	0	1	2
1122	99	PSL-TD	30	1	0	1
1123	99	Konfederacja	15	0	0	1
1124	99	Centrum	15	0	0	0
1125	99	Lewica	19	0	0	2
1126	99	Polska2050	11	1	0	3
1127	99	Konfederacja_KP	3	0	0	0
1128	99	niez.	6	0	1	0
1129	99	Razem	4	0	0	0
1130	100	PiS	142	0	0	4
1131	100	KO	0	151	0	5
1132	100	Demokracja	0	0	3	1
1133	100	RozwojPlus	40	0	0	1
1134	100	PSL-TD	0	30	0	2
1135	100	Konfederacja	0	1	15	0
1136	100	Centrum	0	15	0	0
1137	100	Lewica	0	20	0	1
1138	100	Polska2050	0	12	0	3
1139	100	Konfederacja_KP	0	0	3	0
1140	100	niez.	2	3	2	0
1141	100	Razem	4	0	0	0
1142	101	PiS	141	0	0	5
1143	101	KO	0	148	0	8
1144	101	Demokracja	0	0	2	2
1145	101	RozwojPlus	39	0	1	1
1146	101	PSL-TD	0	29	0	3
1147	101	Konfederacja	0	4	12	0
1148	101	Centrum	0	15	0	0
1149	101	Lewica	1	19	0	1
1150	101	Polska2050	0	12	0	3
1151	101	Konfederacja_KP	0	0	3	0
1152	101	niez.	3	3	1	0
1153	101	Razem	4	0	0	0
1154	102	PiS	139	0	0	7
1155	102	KO	0	149	0	7
1156	102	Demokracja	2	0	1	1
1157	102	RozwojPlus	39	0	0	2
1158	102	PSL-TD	0	30	0	2
1159	102	Konfederacja	0	4	12	0
1160	102	Centrum	0	15	0	0
1161	102	Lewica	0	20	0	1
1162	102	Polska2050	0	10	0	5
1163	102	Konfederacja_KP	0	0	3	0
1164	102	niez.	3	3	1	0
1165	102	Razem	4	0	0	0
1166	103	PiS	139	0	0	7
1167	103	KO	0	151	0	5
1168	103	Demokracja	2	0	1	1
1169	103	RozwojPlus	38	0	0	3
1170	103	PSL-TD	0	31	0	1
1171	103	Konfederacja	0	4	12	0
1172	103	Centrum	0	15	0	0
1173	103	Lewica	1	18	0	2
1174	103	Polska2050	0	12	0	3
1175	103	Konfederacja_KP	0	0	3	0
1176	103	niez.	3	3	1	0
1177	103	Razem	4	0	0	0
1178	104	PiS	141	0	0	5
1179	104	KO	0	149	0	7
1180	104	Demokracja	3	0	0	1
1181	104	RozwojPlus	39	0	0	2
1182	104	PSL-TD	0	29	0	3
1183	104	Konfederacja	15	1	0	0
1184	104	Centrum	0	15	0	0
1185	104	Lewica	0	20	0	1
1186	104	Polska2050	0	11	0	4
1187	104	Konfederacja_KP	3	0	0	0
1188	104	niez.	4	3	0	0
1189	104	Razem	4	0	0	0
1190	105	PiS	141	0	0	5
1191	105	KO	0	150	0	6
1192	105	Demokracja	2	0	1	1
1193	105	RozwojPlus	39	0	0	2
1194	105	PSL-TD	0	28	0	4
1195	105	Konfederacja	0	1	15	0
1196	105	Centrum	0	14	0	1
1197	105	Lewica	0	19	0	2
1198	105	Polska2050	0	12	0	3
1199	105	Konfederacja_KP	0	0	3	0
1200	105	niez.	2	3	2	0
1201	105	Razem	3	0	0	1
1202	106	PiS	135	0	0	11
1203	106	KO	1	149	0	6
1204	106	Demokracja	2	0	1	1
1205	106	RozwojPlus	39	0	0	2
1206	106	PSL-TD	0	30	0	2
1207	106	Konfederacja	0	1	15	0
1208	106	Centrum	0	15	0	0
1209	106	Lewica	1	18	0	2
1210	106	Polska2050	0	12	0	3
1211	106	Konfederacja_KP	0	0	3	0
1212	106	niez.	3	3	1	0
1213	106	Razem	4	0	0	0
1214	107	PiS	137	0	0	9
1215	107	KO	1	148	0	7
1216	107	Demokracja	2	0	1	1
1217	107	RozwojPlus	39	0	0	2
1218	107	PSL-TD	0	31	0	1
1219	107	Konfederacja	0	1	15	0
1220	107	Centrum	0	15	0	0
1221	107	Lewica	1	19	0	1
1222	107	Polska2050	0	12	0	3
1223	107	Konfederacja_KP	0	0	3	0
1224	107	niez.	2	3	2	0
1225	107	Razem	4	0	0	0
1226	108	PiS	4	135	0	7
1227	108	KO	150	1	0	5
1228	108	Demokracja	2	1	0	1
1229	108	RozwojPlus	39	0	0	2
1230	108	PSL-TD	30	0	0	2
1231	108	Konfederacja	0	16	0	0
1232	108	Centrum	15	0	0	0
1233	108	Lewica	20	0	0	1
1234	108	Polska2050	11	1	0	3
1235	108	Konfederacja_KP	0	3	0	0
1236	108	niez.	5	2	0	0
1237	108	Razem	4	0	0	0
1238	109	PiS	140	1	0	5
1239	109	KO	1	150	0	5
1240	109	Demokracja	3	0	0	1
1241	109	RozwojPlus	39	0	0	2
1242	109	PSL-TD	0	30	0	2
1243	109	Konfederacja	13	3	0	0
1244	109	Centrum	0	14	0	1
1245	109	Lewica	0	19	0	2
1246	109	Polska2050	0	12	0	3
1247	109	Konfederacja_KP	3	0	0	0
1248	109	niez.	4	3	0	0
1249	109	Razem	4	0	0	0
1250	110	PiS	4	137	0	5
1251	110	KO	151	0	0	5
1252	110	Demokracja	0	0	3	1
1253	110	RozwojPlus	39	0	0	2
1254	110	PSL-TD	31	0	0	1
1255	110	Konfederacja	0	0	16	0
1256	110	Centrum	15	0	0	0
1257	110	Lewica	20	0	0	1
1258	110	Polska2050	12	0	0	3
1259	110	Konfederacja_KP	0	0	3	0
1260	110	niez.	5	0	2	0
1261	110	Razem	0	0	4	0
1262	111	PiS	140	0	0	6
1263	111	KO	148	0	0	8
1264	111	Demokracja	0	0	3	1
1265	111	RozwojPlus	38	0	0	3
1266	111	PSL-TD	31	0	0	1
1267	111	Konfederacja	16	0	0	0
1268	111	Centrum	14	0	0	1
1269	111	Lewica	19	0	0	2
1270	111	Polska2050	11	0	0	4
1271	111	Konfederacja_KP	3	0	0	0
1272	111	niez.	6	0	0	1
1273	111	Razem	4	0	0	0
1274	112	PiS	141	1	0	4
1275	112	KO	0	150	0	6
1276	112	Demokracja	0	0	3	1
1277	112	RozwojPlus	38	0	0	3
1278	112	PSL-TD	0	31	0	1
1279	112	Konfederacja	0	0	16	0
1280	112	Centrum	0	15	0	0
1281	112	Lewica	2	17	0	2
1282	112	Polska2050	0	12	0	3
1283	112	Konfederacja_KP	0	0	3	0
1284	112	niez.	2	3	2	0
1285	112	Razem	4	0	0	0
1286	113	PiS	140	0	0	6
1287	113	KO	2	149	0	5
1288	113	Demokracja	0	0	3	1
1289	113	RozwojPlus	38	0	0	3
1290	113	PSL-TD	0	31	0	1
1291	113	Konfederacja	2	0	13	1
1292	113	Centrum	0	15	0	0
1293	113	Lewica	2	17	0	2
1294	113	Polska2050	11	0	0	4
1295	113	Konfederacja_KP	0	0	3	0
1296	113	niez.	4	3	0	0
1297	113	Razem	4	0	0	0
1298	114	PiS	141	0	0	5
1299	114	KO	2	149	0	5
1300	114	Demokracja	3	0	0	1
1301	114	RozwojPlus	39	0	0	2
1302	114	PSL-TD	0	31	0	1
1303	114	Konfederacja	13	3	0	0
1304	114	Centrum	0	15	0	0
1305	114	Lewica	17	2	0	2
1306	114	Polska2050	6	6	0	3
1307	114	Konfederacja_KP	3	0	0	0
1308	114	niez.	4	3	0	0
1309	114	Razem	4	0	0	0
1310	115	PiS	142	0	0	4
1311	115	KO	0	150	0	6
1312	115	Demokracja	3	0	0	1
1313	115	RozwojPlus	38	0	0	3
1314	115	PSL-TD	0	31	0	1
1315	115	Konfederacja	16	0	0	0
1316	115	Centrum	0	15	0	0
1317	115	Lewica	0	20	0	1
1318	115	Polska2050	0	12	0	3
1319	115	Konfederacja_KP	3	0	0	0
1320	115	niez.	4	3	0	0
1321	115	Razem	4	0	0	0
1322	116	PiS	133	0	0	13
1323	116	KO	0	146	0	10
1324	116	Demokracja	3	0	0	1
1325	116	RozwojPlus	40	0	0	1
1326	116	PSL-TD	0	31	0	1
1327	116	Konfederacja	16	0	0	0
1328	116	Centrum	0	15	0	0
1329	116	Lewica	1	19	0	1
1330	116	Polska2050	2	10	0	3
1331	116	Konfederacja_KP	3	0	0	0
1332	116	niez.	4	3	0	0
1333	116	Razem	4	0	0	0
1334	117	PiS	128	0	0	18
1335	117	KO	0	146	0	10
1336	117	Demokracja	3	0	0	1
1337	117	RozwojPlus	38	0	0	3
1338	117	PSL-TD	2	26	0	4
1339	117	Konfederacja	16	0	0	0
1340	117	Centrum	0	13	0	2
1341	117	Lewica	0	19	0	2
1342	117	Polska2050	0	11	0	4
1343	117	Konfederacja_KP	3	0	0	0
1344	117	niez.	3	2	1	1
1345	117	Razem	4	0	0	0
1346	118	PiS	12	0	125	9
1347	118	KO	1	149	0	6
1348	118	Demokracja	3	0	0	1
1349	118	RozwojPlus	39	0	0	2
1350	118	PSL-TD	1	29	0	2
1351	118	Konfederacja	16	0	0	0
1352	118	Centrum	0	15	0	0
1353	118	Lewica	2	18	0	1
1354	118	Polska2050	2	10	0	3
1355	118	Konfederacja_KP	3	0	0	0
1356	118	niez.	4	3	0	0
1357	118	Razem	4	0	0	0
1358	119	PiS	141	1	0	4
1359	119	KO	149	1	0	6
1360	119	Demokracja	0	0	3	1
1361	119	RozwojPlus	40	0	0	1
1362	119	PSL-TD	31	0	0	1
1363	119	Konfederacja	0	0	16	0
1364	119	Centrum	15	0	0	0
1365	119	Lewica	20	0	0	1
1366	119	Polska2050	12	0	0	3
1367	119	Konfederacja_KP	0	0	3	0
1368	119	niez.	6	0	1	0
1369	119	Razem	4	0	0	0
1370	120	PiS	139	0	0	7
1371	120	KO	0	150	0	6
1372	120	Demokracja	0	0	3	1
1373	120	RozwojPlus	39	0	0	2
1374	120	PSL-TD	0	31	0	1
1375	120	Konfederacja	0	0	15	1
1376	120	Centrum	0	15	0	0
1377	120	Lewica	1	18	0	2
1378	120	Polska2050	0	12	0	3
1379	120	Konfederacja_KP	0	0	3	0
1380	120	niez.	2	3	1	1
1381	120	Razem	4	0	0	0
1382	121	PiS	142	0	0	4
1383	121	KO	148	1	0	7
1384	121	Demokracja	0	0	3	1
1385	121	RozwojPlus	40	0	0	1
1386	121	PSL-TD	31	0	0	1
1387	121	Konfederacja	0	0	16	0
1388	121	Centrum	15	0	0	0
1389	121	Lewica	20	0	0	1
1390	121	Polska2050	12	0	0	3
1391	121	Konfederacja_KP	0	0	3	0
1392	121	niez.	6	0	1	0
1393	121	Razem	4	0	0	0
1394	122	PiS	136	0	0	10
1395	122	KO	1	147	0	8
1396	122	Demokracja	3	0	0	1
1397	122	RozwojPlus	38	0	0	3
1398	122	PSL-TD	0	30	0	2
1399	122	Konfederacja	16	0	0	0
1400	122	Centrum	0	15	0	0
1401	122	Lewica	0	20	0	1
1402	122	Polska2050	0	12	0	3
1403	122	Konfederacja_KP	3	0	0	0
1404	122	niez.	4	3	0	0
1405	122	Razem	4	0	0	0
1406	123	PiS	137	1	0	8
1407	123	KO	1	148	0	7
1408	123	Demokracja	3	0	0	1
1409	123	RozwojPlus	40	0	0	1
1410	123	PSL-TD	0	31	0	1
1411	123	Konfederacja	16	0	0	0
1412	123	Centrum	0	15	0	0
1413	123	Lewica	0	20	0	1
1414	123	Polska2050	0	12	0	3
1415	123	Konfederacja_KP	3	0	0	0
1416	123	niez.	2	5	0	0
1417	123	Razem	0	4	0	0
1418	124	PiS	136	0	0	10
1419	124	KO	144	5	0	7
1420	124	Demokracja	2	1	0	1
1421	124	RozwojPlus	40	0	0	1
1422	124	PSL-TD	28	2	0	2
1423	124	Konfederacja	0	15	0	1
1424	124	Centrum	13	0	0	2
1425	124	Lewica	20	0	0	1
1426	124	Polska2050	10	0	0	5
1427	124	Konfederacja_KP	0	3	0	0
1428	124	niez.	5	2	0	0
1429	124	Razem	3	0	0	1
1430	125	PiS	140	0	0	6
1431	125	KO	149	1	0	6
1432	125	Demokracja	3	0	0	1
1433	125	RozwojPlus	39	0	0	2
1434	125	PSL-TD	30	0	0	2
1435	125	Konfederacja	16	0	0	0
1436	125	Centrum	15	0	0	0
1437	125	Lewica	20	0	0	1
1438	125	Polska2050	12	0	0	3
1439	125	Konfederacja_KP	3	0	0	0
1440	125	niez.	7	0	0	0
1441	125	Razem	4	0	0	0
1442	126	PiS	142	0	0	4
1443	126	KO	0	151	0	5
1444	126	Demokracja	3	0	0	1
1445	126	RozwojPlus	40	0	0	1
1446	126	PSL-TD	0	31	0	1
1447	126	Konfederacja	16	0	0	0
1448	126	Centrum	0	15	0	0
1449	126	Lewica	2	8	1	10
1450	126	Polska2050	1	11	0	3
1451	126	Konfederacja_KP	3	0	0	0
1452	126	niez.	4	3	0	0
1453	126	Razem	4	0	0	0
1454	127	PiS	142	0	0	4
1455	127	KO	149	0	0	7
1456	127	Demokracja	2	1	0	1
1457	127	RozwojPlus	40	0	0	1
1458	127	PSL-TD	31	0	0	1
1459	127	Konfederacja	0	16	0	0
1460	127	Centrum	15	0	0	0
1461	127	Lewica	19	0	0	2
1462	127	Polska2050	10	2	0	3
1463	127	Konfederacja_KP	0	3	0	0
1464	127	niez.	6	1	0	0
1465	127	Razem	4	0	0	0
1466	128	PiS	136	0	0	10
1467	128	KO	151	0	0	5
1468	128	Demokracja	2	1	0	1
1469	128	RozwojPlus	39	0	0	2
1470	128	PSL-TD	31	0	0	1
1471	128	Konfederacja	0	16	0	0
1472	128	Centrum	15	0	0	0
1473	128	Lewica	19	1	0	1
1474	128	Polska2050	10	2	0	3
1475	128	Konfederacja_KP	0	3	0	0
1476	128	niez.	3	3	0	1
1477	128	Razem	0	4	0	0
1478	129	PiS	142	0	0	4
1479	129	KO	0	151	0	5
1480	129	Demokracja	2	1	0	1
1481	129	RozwojPlus	40	0	0	1
1482	129	PSL-TD	0	31	0	1
1483	129	Konfederacja	0	16	0	0
1484	129	Centrum	0	15	0	0
1485	129	Lewica	0	17	0	4
1486	129	Polska2050	0	12	0	3
1487	129	Konfederacja_KP	0	3	0	0
1488	129	niez.	3	4	0	0
1489	129	Razem	4	0	0	0
1490	130	PiS	141	0	0	5
1491	130	KO	1	149	0	6
1492	130	Demokracja	2	1	0	1
1493	130	RozwojPlus	40	0	0	1
1494	130	PSL-TD	1	29	0	2
1495	130	Konfederacja	0	15	0	1
1496	130	Centrum	0	15	0	0
1497	130	Lewica	3	16	0	2
1498	130	Polska2050	0	11	0	4
1499	130	Konfederacja_KP	0	3	0	0
1500	130	niez.	3	4	0	0
1501	130	Razem	4	0	0	0
1502	131	PiS	20	3	117	6
1503	131	KO	148	0	0	8
1504	131	Demokracja	2	1	0	1
1505	131	RozwojPlus	40	0	0	1
1506	131	PSL-TD	30	0	0	2
1507	131	Konfederacja	0	16	0	0
1508	131	Centrum	15	0	0	0
1509	131	Lewica	20	0	0	1
1510	131	Polska2050	11	0	0	4
1511	131	Konfederacja_KP	0	3	0	0
1512	131	niez.	5	1	0	1
1513	131	Razem	4	0	0	0
1514	132	PiS	142	0	0	4
1515	132	KO	1	150	0	5
1516	132	Demokracja	2	1	0	1
1517	132	RozwojPlus	38	0	0	3
1518	132	PSL-TD	0	31	0	1
1519	132	Konfederacja	0	15	0	1
1520	132	Centrum	0	15	0	0
1521	132	Lewica	9	3	0	9
1522	132	Polska2050	2	10	0	3
1523	132	Konfederacja_KP	0	3	0	0
1524	132	niez.	3	4	0	0
1525	132	Razem	4	0	0	0
1526	133	PiS	2	139	0	5
1527	133	KO	147	2	0	7
1528	133	Demokracja	1	2	0	1
1529	133	RozwojPlus	5	35	0	1
1530	133	PSL-TD	30	0	0	2
1531	133	Konfederacja	0	14	0	2
1532	133	Centrum	15	0	0	0
1533	133	Lewica	17	1	0	3
1534	133	Polska2050	12	0	0	3
1535	133	Konfederacja_KP	0	3	0	0
1536	133	niez.	3	4	0	0
1537	133	Razem	0	4	0	0
1538	134	PiS	140	0	0	6
1539	134	KO	1	150	0	5
1540	134	Demokracja	2	0	1	1
1541	134	RozwojPlus	39	0	0	2
1542	134	PSL-TD	0	31	0	1
1543	134	Konfederacja	0	0	16	0
1544	134	Centrum	0	15	0	0
1545	134	Lewica	2	17	0	2
1546	134	Polska2050	0	12	0	3
1547	134	Konfederacja_KP	0	0	3	0
1548	134	niez.	3	3	1	0
1549	134	Razem	4	0	0	0
1550	135	PiS	9	122	4	11
1551	135	KO	148	1	0	7
1552	135	Demokracja	0	3	0	1
1553	135	RozwojPlus	0	36	0	5
1554	135	PSL-TD	31	0	0	1
1555	135	Konfederacja	0	16	0	0
1556	135	Centrum	15	0	0	0
1557	135	Lewica	18	2	0	1
1558	135	Polska2050	1	10	1	3
1559	135	Konfederacja_KP	0	3	0	0
1560	135	niez.	3	4	0	0
1561	135	Razem	0	4	0	0
1562	136	PiS	1	1	137	7
1563	136	KO	4	142	0	10
1564	136	Demokracja	0	3	0	1
1565	136	RozwojPlus	0	40	0	1
1566	136	PSL-TD	4	27	0	1
1567	136	Konfederacja	0	16	0	0
1568	136	Centrum	0	15	0	0
1569	136	Lewica	18	0	0	3
1570	136	Polska2050	11	0	0	4
1571	136	Konfederacja_KP	0	3	0	0
1572	136	niez.	2	4	1	0
1573	136	Razem	3	0	0	1
1574	137	PiS	5	1	136	4
1575	137	KO	151	0	0	5
1576	137	Demokracja	1	0	2	1
1577	137	RozwojPlus	40	0	0	1
1578	137	PSL-TD	31	0	0	1
1579	137	Konfederacja	16	0	0	0
1580	137	Centrum	15	0	0	0
1581	137	Lewica	20	0	0	1
1582	137	Polska2050	12	0	0	3
1583	137	Konfederacja_KP	3	0	0	0
1584	137	niez.	6	0	1	0
1585	137	Razem	4	0	0	0
1586	138	PiS	140	0	0	6
1587	138	KO	3	145	0	8
1588	138	Demokracja	0	0	3	1
1589	138	RozwojPlus	40	0	0	1
1590	138	PSL-TD	0	30	0	2
1591	138	Konfederacja	0	0	16	0
1592	138	Centrum	1	13	0	1
1593	138	Lewica	0	19	0	2
1594	138	Polska2050	0	12	0	3
1595	138	Konfederacja_KP	0	0	3	0
1596	138	niez.	2	4	1	0
1597	138	Razem	3	0	0	1
1598	139	PiS	5	1	134	6
1599	139	KO	150	0	0	6
1600	139	Demokracja	0	0	3	1
1601	139	RozwojPlus	40	0	0	1
1602	139	PSL-TD	31	0	0	1
1603	139	Konfederacja	0	0	15	1
1604	139	Centrum	15	0	0	0
1605	139	Lewica	20	0	0	1
1606	139	Polska2050	12	0	0	3
1607	139	Konfederacja_KP	0	0	3	0
1608	139	niez.	5	0	2	0
1609	139	Razem	4	0	0	0
1610	140	PiS	141	0	0	5
1611	140	KO	151	0	0	5
1612	140	Demokracja	3	0	0	1
1613	140	RozwojPlus	40	0	0	1
1614	140	PSL-TD	31	0	0	1
1615	140	Konfederacja	16	0	0	0
1616	140	Centrum	15	0	0	0
1617	140	Lewica	20	0	0	1
1618	140	Polska2050	12	0	0	3
1619	140	Konfederacja_KP	3	0	0	0
1620	140	niez.	7	0	0	0
1621	140	Razem	4	0	0	0
1622	141	PiS	0	142	0	4
1623	141	KO	148	0	0	8
1624	141	Demokracja	0	3	0	1
1625	141	RozwojPlus	0	38	0	3
1626	141	PSL-TD	31	0	0	1
1627	141	Konfederacja	0	16	0	0
1628	141	Centrum	15	0	0	0
1629	141	Lewica	20	0	0	1
1630	141	Polska2050	12	0	0	3
1631	141	Konfederacja_KP	0	3	0	0
1632	141	niez.	3	3	1	0
1633	141	Razem	0	4	0	0
1634	142	PiS	0	131	0	15
1635	142	KO	146	0	0	10
1636	142	Demokracja	1	1	0	2
1637	142	RozwojPlus	0	37	0	4
1638	142	PSL-TD	28	0	0	4
1639	142	Konfederacja	0	15	0	1
1640	142	Centrum	12	0	0	3
1641	142	Lewica	20	0	0	1
1642	142	Polska2050	11	0	0	4
1643	142	Konfederacja_KP	0	3	0	0
1644	142	niez.	4	2	0	1
1645	142	Razem	0	4	0	0
1646	143	PiS	0	137	0	9
1647	143	KO	150	0	0	6
1648	143	Demokracja	0	3	0	1
1649	143	RozwojPlus	0	40	0	1
1650	143	PSL-TD	31	0	0	1
1651	143	Konfederacja	0	16	0	0
1652	143	Centrum	11	4	0	0
1653	143	Lewica	20	0	0	1
1654	143	Polska2050	11	1	0	3
1655	143	Konfederacja_KP	0	3	0	0
1656	143	niez.	3	3	1	0
1657	143	Razem	0	4	0	0
1658	144	PiS	3	130	1	12
1659	144	KO	141	4	0	11
1660	144	Demokracja	0	3	0	1
1661	144	RozwojPlus	0	37	1	3
1662	144	PSL-TD	27	1	0	4
1663	144	Konfederacja	0	14	2	0
1664	144	Centrum	9	3	0	3
1665	144	Lewica	16	0	0	5
1666	144	Polska2050	3	7	0	5
1667	144	Konfederacja_KP	0	3	0	0
1668	144	niez.	3	4	0	0
1669	144	Razem	2	0	1	1
1670	145	PiS	21	116	1	8
1671	145	KO	136	11	0	9
1672	145	Demokracja	0	3	0	1
1673	145	RozwojPlus	1	36	1	3
1674	145	PSL-TD	29	0	0	3
1675	145	Konfederacja	0	16	0	0
1676	145	Centrum	15	0	0	0
1677	145	Lewica	19	0	0	2
1678	145	Polska2050	4	8	0	3
1679	145	Konfederacja_KP	0	3	0	0
1680	145	niez.	5	2	0	0
1681	145	Razem	4	0	0	0
1682	146	PiS	0	132	0	14
1683	146	KO	143	0	0	13
1684	146	Demokracja	0	3	0	1
1685	146	RozwojPlus	0	32	0	9
1686	146	PSL-TD	22	0	1	9
1687	146	Konfederacja	0	13	0	3
1688	146	Centrum	10	0	0	5
1689	146	Lewica	17	0	0	4
1690	146	Polska2050	12	0	0	3
1691	146	Konfederacja_KP	0	3	0	0
1692	146	niez.	4	3	0	0
1693	146	Razem	0	3	0	1
1694	147	PiS	118	5	2	21
1695	147	KO	2	144	0	10
1696	147	Demokracja	0	0	2	2
1697	147	RozwojPlus	35	1	0	5
1698	147	PSL-TD	0	30	0	2
1699	147	Konfederacja	3	0	13	0
1700	147	Centrum	0	15	0	0
1701	147	Lewica	1	12	0	8
1702	147	Polska2050	0	10	0	5
1703	147	Konfederacja_KP	1	0	2	0
1704	147	niez.	0	3	2	2
1705	147	Razem	0	4	0	0
1706	148	PiS	126	2	0	18
1707	148	KO	0	149	0	7
1708	148	Demokracja	3	0	0	1
1709	148	RozwojPlus	39	0	0	2
1710	148	PSL-TD	5	25	0	2
1711	148	Konfederacja	15	0	0	1
1712	148	Centrum	0	14	0	1
1713	148	Lewica	0	16	0	5
1714	148	Polska2050	0	12	0	3
1715	148	Konfederacja_KP	3	0	0	0
1716	148	niez.	1	4	1	1
1717	148	Razem	0	3	0	1
1718	149	PiS	137	0	0	9
1719	149	KO	1	144	0	11
1720	149	Demokracja	3	0	0	1
1721	149	RozwojPlus	39	0	0	2
1722	149	PSL-TD	0	31	0	1
1723	149	Konfederacja	15	0	0	1
1724	149	Centrum	0	14	0	1
1725	149	Lewica	0	17	0	4
1726	149	Polska2050	0	12	0	3
1727	149	Konfederacja_KP	3	0	0	0
1728	149	niez.	2	4	1	0
1729	149	Razem	0	4	0	0
1730	150	PiS	133	0	0	13
1731	150	KO	2	146	0	8
1732	150	Demokracja	3	0	0	1
1733	150	RozwojPlus	39	0	0	2
1734	150	PSL-TD	0	30	0	2
1735	150	Konfederacja	16	0	0	0
1736	150	Centrum	1	12	0	2
1737	150	Lewica	0	17	0	4
1738	150	Polska2050	0	12	0	3
1739	150	Konfederacja_KP	3	0	0	0
1740	150	niez.	1	4	1	1
1741	150	Razem	0	4	0	0
1742	151	PiS	137	0	0	9
1743	151	KO	0	145	0	11
1744	151	Demokracja	3	0	0	1
1745	151	RozwojPlus	38	0	0	3
1746	151	PSL-TD	0	29	0	3
1747	151	Konfederacja	16	0	0	0
1748	151	Centrum	0	15	0	0
1749	151	Lewica	0	18	0	3
1750	151	Polska2050	0	12	0	3
1751	151	Konfederacja_KP	3	0	0	0
1752	151	niez.	2	4	1	0
1753	151	Razem	0	4	0	0
1754	152	PiS	139	0	0	7
1755	152	KO	0	150	0	6
1756	152	Demokracja	3	0	0	1
1757	152	RozwojPlus	39	0	0	2
1758	152	PSL-TD	0	31	0	1
1759	152	Konfederacja	15	0	0	1
1760	152	Centrum	0	14	0	1
1761	152	Lewica	0	18	0	3
1762	152	Polska2050	0	12	0	3
1763	152	Konfederacja_KP	3	0	0	0
1764	152	niez.	2	4	1	0
1765	152	Razem	0	4	0	0
1766	153	PiS	134	0	0	12
1767	153	KO	0	147	0	9
1768	153	Demokracja	3	0	0	1
1769	153	RozwojPlus	39	0	0	2
1770	153	PSL-TD	0	30	0	2
1771	153	Konfederacja	16	0	0	0
1772	153	Centrum	0	15	0	0
1773	153	Lewica	0	20	0	1
1774	153	Polska2050	0	11	0	4
1775	153	Konfederacja_KP	3	0	0	0
1776	153	niez.	1	4	1	1
1777	153	Razem	0	4	0	0
1778	154	PiS	0	140	0	6
1779	154	KO	146	4	0	6
1780	154	Demokracja	3	0	0	1
1781	154	RozwojPlus	0	0	39	2
1782	154	PSL-TD	30	1	0	1
1783	154	Konfederacja	16	0	0	0
1784	154	Centrum	15	0	0	0
1785	154	Lewica	18	2	0	1
1786	154	Polska2050	12	0	0	3
1787	154	Konfederacja_KP	3	0	0	0
1788	154	niez.	5	1	1	0
1789	154	Razem	4	0	0	0
1790	155	PiS	0	139	0	7
1791	155	KO	149	0	0	7
1792	155	Demokracja	3	0	0	1
1793	155	RozwojPlus	37	1	1	2
1794	155	PSL-TD	31	0	0	1
1795	155	Konfederacja	16	0	0	0
1796	155	Centrum	15	0	0	0
1797	155	Lewica	20	0	0	1
1798	155	Polska2050	12	0	0	3
1799	155	Konfederacja_KP	3	0	0	0
1800	155	niez.	6	1	0	0
1801	155	Razem	4	0	0	0
1802	156	PiS	134	2	0	10
1803	156	KO	146	0	0	10
1804	156	Demokracja	2	0	0	2
1805	156	RozwojPlus	10	0	16	15
1806	156	PSL-TD	29	0	0	3
1807	156	Konfederacja	16	0	0	0
1808	156	Centrum	14	0	0	1
1809	156	Lewica	20	0	0	1
1810	156	Polska2050	11	0	0	4
1811	156	Konfederacja_KP	3	0	0	0
1812	156	niez.	5	0	0	2
1813	156	Razem	3	0	0	1
1814	157	PiS	1	2	131	12
1815	157	KO	147	0	0	9
1816	157	Demokracja	2	1	0	1
1817	157	RozwojPlus	6	0	32	3
1818	157	PSL-TD	31	0	0	1
1819	157	Konfederacja	1	14	1	0
1820	157	Centrum	15	0	0	0
1821	157	Lewica	19	0	0	2
1822	157	Polska2050	11	0	0	4
1823	157	Konfederacja_KP	0	3	0	0
1824	157	niez.	5	1	1	0
1825	157	Razem	4	0	0	0
1826	158	PiS	136	0	0	10
1827	158	KO	149	0	0	7
1828	158	Demokracja	0	3	0	1
1829	158	RozwojPlus	38	1	0	2
1830	158	PSL-TD	30	0	0	2
1831	158	Konfederacja	1	15	0	0
1832	158	Centrum	15	0	0	0
1833	158	Lewica	20	0	0	1
1834	158	Polska2050	12	0	0	3
1835	158	Konfederacja_KP	0	3	0	0
1836	158	niez.	6	1	0	0
1837	158	Razem	4	0	0	0
1838	159	PiS	2	1	135	8
1839	159	KO	149	0	0	7
1840	159	Demokracja	0	0	3	1
1841	159	RozwojPlus	37	0	2	2
1842	159	PSL-TD	30	0	0	2
1843	159	Konfederacja	1	0	14	1
1844	159	Centrum	14	0	0	1
1845	159	Lewica	20	0	0	1
1846	159	Polska2050	12	0	0	3
1847	159	Konfederacja_KP	0	0	3	0
1848	159	niez.	6	0	1	0
1849	159	Razem	0	1	3	0
1850	160	PiS	1	0	137	8
1851	160	KO	150	0	0	6
1852	160	Demokracja	0	3	0	1
1853	160	RozwojPlus	38	0	1	2
1854	160	PSL-TD	31	0	0	1
1855	160	Konfederacja	1	15	0	0
1856	160	Centrum	15	0	0	0
1857	160	Lewica	20	0	0	1
1858	160	Polska2050	12	0	0	3
1859	160	Konfederacja_KP	0	3	0	0
1860	160	niez.	5	1	1	0
1861	160	Razem	4	0	0	0
1862	161	PiS	0	0	139	7
1863	161	KO	0	149	0	7
1864	161	Demokracja	0	1	2	1
1865	161	RozwojPlus	0	0	38	3
1866	161	PSL-TD	1	30	0	1
1867	161	Konfederacja	0	15	1	0
1868	161	Centrum	0	15	0	0
1869	161	Lewica	0	20	0	1
1870	161	Polska2050	0	12	0	3
1871	161	Konfederacja_KP	0	3	0	0
1872	161	niez.	2	4	1	0
1873	161	Razem	4	0	0	0
1874	162	PiS	0	1	124	21
1875	162	KO	1	148	0	7
1876	162	Demokracja	3	0	0	1
1877	162	RozwojPlus	0	0	37	4
1878	162	PSL-TD	26	3	0	3
1879	162	Konfederacja	15	0	0	1
1880	162	Centrum	0	13	0	2
1881	162	Lewica	0	19	0	2
1882	162	Polska2050	0	10	0	5
1883	162	Konfederacja_KP	3	0	0	0
1884	162	niez.	1	5	1	0
1885	162	Razem	0	4	0	0
1886	163	PiS	130	0	3	13
1887	163	KO	0	147	0	9
1888	163	Demokracja	3	0	0	1
1889	163	RozwojPlus	23	0	7	11
1890	163	PSL-TD	1	27	0	4
1891	163	Konfederacja	15	0	0	1
1892	163	Centrum	0	15	0	0
1893	163	Lewica	0	19	0	2
1894	163	Polska2050	0	12	0	3
1895	163	Konfederacja_KP	3	0	0	0
1896	163	niez.	3	3	0	1
1897	163	Razem	3	0	0	1
1898	164	PiS	0	0	139	7
1899	164	KO	146	4	0	6
1900	164	Demokracja	1	0	2	1
1901	164	RozwojPlus	1	0	38	2
1902	164	PSL-TD	31	0	0	1
1903	164	Konfederacja	16	0	0	0
1904	164	Centrum	15	0	0	0
1905	164	Lewica	20	0	0	1
1906	164	Polska2050	12	0	0	3
1907	164	Konfederacja_KP	3	0	0	0
1908	164	niez.	6	0	1	0
1909	164	Razem	4	0	0	0
1910	165	PiS	1	0	137	8
1911	165	KO	150	0	0	6
1912	165	Demokracja	3	0	0	1
1913	165	RozwojPlus	0	0	39	2
1914	165	PSL-TD	30	0	0	2
1915	165	Konfederacja	16	0	0	0
1916	165	Centrum	14	1	0	0
1917	165	Lewica	20	0	0	1
1918	165	Polska2050	12	0	0	3
1919	165	Konfederacja_KP	3	0	0	0
1920	165	niez.	5	0	2	0
1921	165	Razem	4	0	0	0
1922	166	PiS	131	1	8	6
1923	166	KO	0	148	0	8
1924	166	Demokracja	2	0	1	1
1925	166	RozwojPlus	39	0	0	2
1926	166	PSL-TD	0	31	0	1
1927	166	Konfederacja	1	0	15	0
1928	166	Centrum	0	15	0	0
1929	166	Lewica	0	20	0	1
1930	166	Polska2050	0	12	0	3
1931	166	Konfederacja_KP	0	0	3	0
1932	166	niez.	3	3	1	0
1933	166	Razem	4	0	0	0
1934	167	PiS	7	0	133	6
1935	167	KO	149	1	0	6
1936	167	Demokracja	0	3	0	1
1937	167	RozwojPlus	0	2	37	2
1938	167	PSL-TD	31	0	0	1
1939	167	Konfederacja	0	16	0	0
1940	167	Centrum	15	0	0	0
1941	167	Lewica	20	0	0	1
1942	167	Polska2050	12	0	0	3
1943	167	Konfederacja_KP	0	3	0	0
1944	167	niez.	5	1	1	0
1945	167	Razem	4	0	0	0
1946	168	PiS	0	135	1	10
1947	168	KO	150	0	0	6
1948	168	Demokracja	0	3	0	1
1949	168	RozwojPlus	0	37	1	3
1950	168	PSL-TD	31	0	0	1
1951	168	Konfederacja	0	16	0	0
1952	168	Centrum	15	0	0	0
1953	168	Lewica	12	8	0	1
1954	168	Polska2050	2	10	0	3
1955	168	Konfederacja_KP	0	3	0	0
1956	168	niez.	4	1	1	1
1957	168	Razem	4	0	0	0
1958	169	PiS	0	138	0	8
1959	169	KO	148	1	0	7
1960	169	Demokracja	0	0	3	1
1961	169	RozwojPlus	0	38	1	2
1962	169	PSL-TD	31	0	0	1
1963	169	Konfederacja	0	2	14	0
1964	169	Centrum	13	2	0	0
1965	169	Lewica	20	0	0	1
1966	169	Polska2050	12	0	0	3
1967	169	Konfederacja_KP	0	0	3	0
1968	169	niez.	5	2	0	0
1969	169	Razem	4	0	0	0
1970	170	PiS	1	3	135	7
1971	170	KO	0	149	0	7
1972	170	Demokracja	3	0	0	1
1973	170	RozwojPlus	1	1	35	4
1974	170	PSL-TD	0	31	0	1
1975	170	Konfederacja	14	1	0	1
1976	170	Centrum	0	15	0	0
1977	170	Lewica	0	20	0	1
1978	170	Polska2050	1	10	0	4
1979	170	Konfederacja_KP	2	0	0	1
1980	170	niez.	2	4	1	0
1981	170	Razem	0	4	0	0
1982	171	PiS	0	131	0	15
1983	171	KO	149	1	0	6
1984	171	Demokracja	0	3	0	1
1985	171	RozwojPlus	0	39	0	2
1986	171	PSL-TD	31	0	0	1
1987	171	Konfederacja	0	16	0	0
1988	171	Centrum	14	0	1	0
1989	171	Lewica	14	0	2	5
1990	171	Polska2050	12	0	0	3
1991	171	Konfederacja_KP	0	3	0	0
1992	171	niez.	3	4	0	0
1993	171	Razem	0	0	4	0
1994	172	PiS	137	1	0	8
1995	172	KO	1	148	0	7
1996	172	Demokracja	0	3	0	1
1997	172	RozwojPlus	34	2	2	3
1998	172	PSL-TD	0	31	0	1
1999	172	Konfederacja	1	15	0	0
2000	172	Centrum	0	15	0	0
2001	172	Lewica	0	20	0	1
2002	172	Polska2050	0	11	0	4
2003	172	Konfederacja_KP	0	3	0	0
2004	172	niez.	2	5	0	0
2005	172	Razem	4	0	0	0
2006	173	PiS	1	2	134	9
2007	173	KO	0	145	0	11
2008	173	Demokracja	0	1	2	1
2009	173	RozwojPlus	37	0	0	4
2010	173	PSL-TD	0	30	0	2
2011	173	Konfederacja	0	16	0	0
2012	173	Centrum	12	3	0	0
2013	173	Lewica	0	20	0	1
2014	173	Polska2050	2	9	0	4
2015	173	Konfederacja_KP	0	3	0	0
2016	173	niez.	2	2	3	0
2017	173	Razem	0	0	4	0
2018	174	PiS	133	1	1	11
2019	174	KO	0	149	0	7
2020	174	Demokracja	2	1	0	1
2021	174	RozwojPlus	38	1	0	2
2022	174	PSL-TD	0	29	0	3
2023	174	Konfederacja	0	16	0	0
2024	174	Centrum	0	15	0	0
2025	174	Lewica	1	19	0	1
2026	174	Polska2050	0	12	0	3
2027	174	Konfederacja_KP	0	3	0	0
2028	174	niez.	2	5	0	0
2029	174	Razem	4	0	0	0
2030	175	PiS	1	0	138	7
2031	175	KO	150	0	0	6
2032	175	Demokracja	0	1	2	1
2033	175	RozwojPlus	38	0	1	2
2034	175	PSL-TD	29	0	0	3
2035	175	Konfederacja	2	14	0	0
2036	175	Centrum	15	0	0	0
2037	175	Lewica	20	0	0	1
2038	175	Polska2050	11	0	0	4
2039	175	Konfederacja_KP	0	3	0	0
2040	175	niez.	5	1	0	1
2041	175	Razem	4	0	0	0
2042	176	PiS	4	0	132	10
2043	176	KO	150	0	0	6
2044	176	Demokracja	2	0	1	1
2045	176	RozwojPlus	39	0	0	2
2046	176	PSL-TD	25	3	0	4
2047	176	Konfederacja	16	0	0	0
2048	176	Centrum	15	0	0	0
2049	176	Lewica	19	0	0	2
2050	176	Polska2050	12	0	0	3
2051	176	Konfederacja_KP	3	0	0	0
2052	176	niez.	5	0	1	1
2053	176	Razem	4	0	0	0
2054	177	PiS	139	0	0	7
2055	177	KO	0	150	0	6
2056	177	Demokracja	2	1	0	1
2057	177	RozwojPlus	39	0	0	2
2058	177	PSL-TD	0	29	0	3
2059	177	Konfederacja	0	16	0	0
2060	177	Centrum	0	15	0	0
2061	177	Lewica	0	20	0	1
2062	177	Polska2050	0	12	0	3
2063	177	Konfederacja_KP	0	3	0	0
2064	177	niez.	2	5	0	0
2065	177	Razem	4	0	0	0
2066	178	PiS	23	0	109	14
2067	178	KO	1	146	0	9
2068	178	Demokracja	0	1	2	1
2069	178	RozwojPlus	37	0	1	3
2070	178	PSL-TD	0	29	0	3
2071	178	Konfederacja	0	15	0	1
2072	178	Centrum	13	2	0	0
2073	178	Lewica	0	19	0	2
2074	178	Polska2050	0	11	0	4
2075	178	Konfederacja_KP	0	3	0	0
2076	178	niez.	5	1	1	0
2077	178	Razem	4	0	0	0
2078	179	PiS	4	0	135	7
2079	179	KO	148	1	0	7
2080	179	Demokracja	0	1	2	1
2081	179	RozwojPlus	38	0	1	2
2082	179	PSL-TD	31	0	0	1
2083	179	Konfederacja	0	16	0	0
2084	179	Centrum	15	0	0	0
2085	179	Lewica	20	0	0	1
2086	179	Polska2050	12	0	0	3
2087	179	Konfederacja_KP	0	3	0	0
2088	179	niez.	5	1	1	0
2089	179	Razem	4	0	0	0
2090	180	PiS	0	1	139	6
2091	180	KO	149	0	1	6
2092	180	Demokracja	1	0	2	1
2093	180	RozwojPlus	7	0	31	3
2094	180	PSL-TD	31	0	0	1
2095	180	Konfederacja	11	0	5	0
2096	180	Centrum	15	0	0	0
2097	180	Lewica	19	0	0	2
2098	180	Polska2050	12	0	0	3
2099	180	Konfederacja_KP	0	0	3	0
2100	180	niez.	5	1	1	0
2101	180	Razem	4	0	0	0
2102	181	PiS	136	0	1	9
2103	181	KO	149	0	0	7
2104	181	Demokracja	0	3	0	1
2105	181	RozwojPlus	37	0	0	4
2106	181	PSL-TD	31	0	0	1
2107	181	Konfederacja	0	16	0	0
2108	181	Centrum	15	0	0	0
2109	181	Lewica	20	0	0	1
2110	181	Polska2050	12	0	0	3
2111	181	Konfederacja_KP	0	3	0	0
2112	181	niez.	6	1	0	0
2113	181	Razem	4	0	0	0
2114	182	PiS	2	136	0	8
2115	182	KO	149	0	0	7
2116	182	Demokracja	0	3	0	1
2117	182	RozwojPlus	6	33	0	2
2118	182	PSL-TD	31	0	0	1
2119	182	Konfederacja	0	16	0	0
2120	182	Centrum	15	0	0	0
2121	182	Lewica	20	0	0	1
2122	182	Polska2050	12	0	0	3
2123	182	Konfederacja_KP	0	3	0	0
2124	182	niez.	4	3	0	0
2125	182	Razem	4	0	0	0
2126	183	PiS	135	0	1	10
2127	183	KO	16	131	0	9
2128	183	Demokracja	2	0	1	1
2129	183	RozwojPlus	39	0	0	2
2130	183	PSL-TD	0	29	0	3
2131	183	Konfederacja	0	5	11	0
2132	183	Centrum	1	14	0	0
2133	183	Lewica	0	19	0	2
2134	183	Polska2050	0	12	0	3
2135	183	Konfederacja_KP	0	0	3	0
2136	183	niez.	2	2	3	0
2137	183	Razem	0	0	4	0
2138	184	PiS	20	2	115	9
2139	184	KO	145	1	0	10
2140	184	Demokracja	0	3	0	1
2141	184	RozwojPlus	39	0	0	2
2142	184	PSL-TD	30	0	0	2
2143	184	Konfederacja	0	14	0	2
2144	184	Centrum	15	0	0	0
2145	184	Lewica	20	0	0	1
2146	184	Polska2050	12	0	0	3
2147	184	Konfederacja_KP	0	3	0	0
2148	184	niez.	4	1	2	0
2149	184	Razem	4	0	0	0
2150	185	PiS	140	0	0	6
2151	185	KO	0	149	0	7
2152	185	Demokracja	3	0	0	1
2153	185	RozwojPlus	39	0	0	2
2154	185	PSL-TD	0	31	0	1
2155	185	Konfederacja	16	0	0	0
2156	185	Centrum	0	15	0	0
2157	185	Lewica	0	20	0	1
2158	185	Polska2050	0	11	0	4
2159	185	Konfederacja_KP	2	0	0	1
2160	185	niez.	1	2	3	1
2161	185	Razem	0	0	4	0
2162	186	PiS	2	0	136	8
2163	186	KO	146	1	0	9
2164	186	Demokracja	2	0	0	2
2165	186	RozwojPlus	5	0	34	2
2166	186	PSL-TD	31	0	0	1
2167	186	Konfederacja	16	0	0	0
2168	186	Centrum	14	1	0	0
2169	186	Lewica	20	0	0	1
2170	186	Polska2050	12	0	0	3
2171	186	Konfederacja_KP	3	0	0	0
2172	186	niez.	5	0	2	0
2173	186	Razem	4	0	0	0
2174	187	PiS	0	140	0	6
2175	187	KO	150	0	0	6
2176	187	Demokracja	0	3	0	1
2177	187	RozwojPlus	0	39	0	2
2178	187	PSL-TD	31	0	0	1
2179	187	Konfederacja	0	16	0	0
2180	187	Centrum	15	0	0	0
2181	187	Lewica	20	0	0	1
2182	187	Polska2050	12	0	0	3
2183	187	Konfederacja_KP	0	3	0	0
2184	187	niez.	5	1	1	0
2185	187	Razem	4	0	0	0
2186	188	PiS	1	0	137	8
2187	188	KO	148	0	0	8
2188	188	Demokracja	0	3	0	1
2189	188	RozwojPlus	20	0	8	13
2190	188	PSL-TD	31	0	0	1
2191	188	Konfederacja	0	16	0	0
2192	188	Centrum	15	0	0	0
2193	188	Lewica	19	0	0	2
2194	188	Polska2050	12	0	0	3
2195	188	Konfederacja_KP	0	3	0	0
2196	188	niez.	4	1	2	0
2197	188	Razem	0	0	4	0
2198	189	PiS	1	0	133	12
2199	189	KO	147	0	0	9
2200	189	Demokracja	0	0	3	1
2201	189	RozwojPlus	18	0	20	3
2202	189	PSL-TD	29	0	0	3
2203	189	Konfederacja	0	0	15	1
2204	189	Centrum	14	0	0	1
2205	189	Lewica	20	0	0	1
2206	189	Polska2050	11	0	0	4
2207	189	Konfederacja_KP	0	0	3	0
2208	189	niez.	4	0	3	0
2209	189	Razem	0	0	4	0
2210	190	PiS	0	1	132	13
2211	190	KO	145	0	0	11
2212	190	Demokracja	0	0	3	1
2213	190	RozwojPlus	12	0	26	3
2214	190	PSL-TD	30	0	0	2
2215	190	Konfederacja	0	0	16	0
2216	190	Centrum	11	0	0	4
2217	190	Lewica	17	0	0	4
2218	190	Polska2050	12	0	0	3
2219	190	Konfederacja_KP	0	0	3	0
2220	190	niez.	4	0	3	0
2221	190	Razem	0	0	4	0
2222	191	PiS	1	0	134	11
2223	191	KO	149	0	0	7
2224	191	Demokracja	0	0	3	1
2225	191	RozwojPlus	13	0	23	5
2226	191	PSL-TD	31	0	0	1
2227	191	Konfederacja	0	0	15	1
2228	191	Centrum	14	0	0	1
2229	191	Lewica	18	0	0	3
2230	191	Polska2050	12	0	0	3
2231	191	Konfederacja_KP	0	0	3	0
2232	191	niez.	4	0	3	0
2233	191	Razem	0	0	4	0
2234	192	PiS	0	0	134	12
2235	192	KO	148	0	0	8
2236	192	Demokracja	0	3	0	1
2237	192	RozwojPlus	12	0	23	6
2238	192	PSL-TD	31	0	0	1
2239	192	Konfederacja	0	14	2	0
2240	192	Centrum	14	0	0	1
2241	192	Lewica	18	0	0	3
2242	192	Polska2050	11	0	0	4
2243	192	Konfederacja_KP	0	2	0	1
2244	192	niez.	4	1	2	0
2245	192	Razem	0	0	4	0
2246	193	PiS	0	0	134	12
2247	193	KO	149	0	0	7
2248	193	Demokracja	0	3	0	1
2249	193	RozwojPlus	7	0	31	3
2250	193	PSL-TD	30	0	0	2
2251	193	Konfederacja	0	16	0	0
2252	193	Centrum	14	0	0	1
2253	193	Lewica	20	0	0	1
2254	193	Polska2050	12	0	0	3
2255	193	Konfederacja_KP	0	3	0	0
2256	193	niez.	4	1	2	0
2257	193	Razem	0	0	4	0
2258	194	PiS	0	0	137	9
2259	194	KO	150	0	0	6
2260	194	Demokracja	0	0	3	1
2261	194	RozwojPlus	10	0	29	2
2262	194	PSL-TD	31	0	0	1
2263	194	Konfederacja	0	0	15	1
2264	194	Centrum	14	0	0	1
2265	194	Lewica	20	0	0	1
2266	194	Polska2050	12	0	0	3
2267	194	Konfederacja_KP	0	0	3	0
2268	194	niez.	4	0	3	0
2269	194	Razem	0	0	4	0
2270	195	PiS	0	0	136	10
2271	195	KO	150	0	0	6
2272	195	Demokracja	0	0	3	1
2273	195	RozwojPlus	10	0	28	3
2274	195	PSL-TD	30	0	0	2
2275	195	Konfederacja	0	0	16	0
2276	195	Centrum	14	0	0	1
2277	195	Lewica	20	0	0	1
2278	195	Polska2050	12	0	0	3
2279	195	Konfederacja_KP	0	0	3	0
2280	195	niez.	4	0	3	0
2281	195	Razem	0	0	4	0
2282	196	PiS	0	0	134	12
2283	196	KO	149	0	0	7
2284	196	Demokracja	0	1	2	1
2285	196	RozwojPlus	0	0	39	2
2286	196	PSL-TD	31	0	0	1
2287	196	Konfederacja	0	0	16	0
2288	196	Centrum	14	0	0	1
2289	196	Lewica	20	0	0	1
2290	196	Polska2050	10	0	0	5
2291	196	Konfederacja_KP	0	0	3	0
2292	196	niez.	4	0	3	0
2293	196	Razem	0	0	4	0
2294	197	PiS	0	0	137	9
2295	197	KO	150	0	0	6
2296	197	Demokracja	0	0	3	1
2297	197	RozwojPlus	7	0	31	3
2298	197	PSL-TD	31	0	0	1
2299	197	Konfederacja	0	0	16	0
2300	197	Centrum	14	0	0	1
2301	197	Lewica	20	0	0	1
2302	197	Polska2050	11	0	0	4
2303	197	Konfederacja_KP	0	0	3	0
2304	197	niez.	4	0	3	0
2305	197	Razem	4	0	0	0
2306	198	PiS	0	138	0	8
2307	198	KO	150	0	0	6
2308	198	Demokracja	0	3	0	1
2309	198	RozwojPlus	35	2	2	2
2310	198	PSL-TD	31	0	0	1
2311	198	Konfederacja	0	16	0	0
2312	198	Centrum	14	0	0	1
2313	198	Lewica	20	0	0	1
2314	198	Polska2050	12	0	0	3
2315	198	Konfederacja_KP	0	3	0	0
2316	198	niez.	4	3	0	0
2317	198	Razem	4	0	0	0
2318	199	PiS	0	138	0	8
2319	199	KO	1	149	0	6
2320	199	Demokracja	0	3	0	1
2321	199	RozwojPlus	0	38	1	2
2322	199	PSL-TD	0	31	0	1
2323	199	Konfederacja	0	16	0	0
2324	199	Centrum	2	11	0	2
2325	199	Lewica	15	2	0	4
2326	199	Polska2050	0	12	0	3
2327	199	Konfederacja_KP	0	3	0	0
2328	199	niez.	1	6	0	0
2329	199	Razem	4	0	0	0
2330	200	PiS	1	137	0	8
2331	200	KO	1	147	0	8
2332	200	Demokracja	0	3	0	1
2333	200	RozwojPlus	36	0	2	3
2334	200	PSL-TD	30	1	0	1
2335	200	Konfederacja	1	15	0	0
2336	200	Centrum	3	11	0	1
2337	200	Lewica	15	3	0	3
2338	200	Polska2050	0	12	0	3
2339	200	Konfederacja_KP	0	3	0	0
2340	200	niez.	1	6	0	0
2341	200	Razem	4	0	0	0
2342	201	PiS	1	133	1	11
2343	201	KO	1	147	0	8
2344	201	Demokracja	0	3	0	1
2345	201	RozwojPlus	35	0	2	4
2346	201	PSL-TD	0	31	0	1
2347	201	Konfederacja	0	16	0	0
2348	201	Centrum	1	13	0	1
2349	201	Lewica	18	1	0	2
2350	201	Polska2050	0	12	0	3
2351	201	Konfederacja_KP	0	3	0	0
2352	201	niez.	1	6	0	0
2353	201	Razem	4	0	0	0
2354	202	PiS	0	136	0	10
2355	202	KO	149	1	0	6
2356	202	Demokracja	0	0	3	1
2357	202	RozwojPlus	35	1	2	3
2358	202	PSL-TD	0	31	0	1
2359	202	Konfederacja	0	0	16	0
2360	202	Centrum	2	12	0	1
2361	202	Lewica	20	0	0	1
2362	202	Polska2050	0	11	1	3
2363	202	Konfederacja_KP	0	0	3	0
2364	202	niez.	2	4	1	0
2365	202	Razem	4	0	0	0
2366	203	PiS	0	139	0	7
2367	203	KO	2	147	0	7
2368	203	Demokracja	0	3	0	1
2369	203	RozwojPlus	36	0	3	2
2370	203	PSL-TD	31	0	0	1
2371	203	Konfederacja	3	12	0	1
2372	203	Centrum	0	14	0	1
2373	203	Lewica	4	16	0	1
2374	203	Polska2050	0	11	0	4
2375	203	Konfederacja_KP	0	3	0	0
2376	203	niez.	0	7	0	0
2377	203	Razem	0	4	0	0
2378	204	PiS	0	140	0	6
2379	204	KO	150	0	0	6
2380	204	Demokracja	0	0	3	1
2381	204	RozwojPlus	34	0	4	3
2382	204	PSL-TD	31	0	0	1
2383	204	Konfederacja	0	0	16	0
2384	204	Centrum	14	0	0	1
2385	204	Lewica	20	0	0	1
2386	204	Polska2050	12	0	0	3
2387	204	Konfederacja_KP	0	0	3	0
2388	204	niez.	4	1	2	0
2389	204	Razem	4	0	0	0
2390	205	PiS	136	1	2	7
2391	205	KO	150	0	0	6
2392	205	Demokracja	0	3	0	1
2393	205	RozwojPlus	0	6	33	2
2394	205	PSL-TD	31	0	0	1
2395	205	Konfederacja	0	16	0	0
2396	205	Centrum	14	0	0	1
2397	205	Lewica	20	0	0	1
2398	205	Polska2050	12	0	0	3
2399	205	Konfederacja_KP	0	3	0	0
2400	205	niez.	6	1	0	0
2401	205	Razem	4	0	0	0
2402	206	PiS	129	1	4	12
2403	206	KO	150	0	0	6
2404	206	Demokracja	0	3	0	1
2405	206	RozwojPlus	18	2	19	2
2406	206	PSL-TD	30	0	0	2
2407	206	Konfederacja	0	16	0	0
2408	206	Centrum	14	0	0	1
2409	206	Lewica	20	0	0	1
2410	206	Polska2050	12	0	0	3
2411	206	Konfederacja_KP	0	3	0	0
2412	206	niez.	6	1	0	0
2413	206	Razem	4	0	0	0
2414	207	PiS	140	0	0	6
2415	207	KO	139	3	2	12
2416	207	Demokracja	3	0	0	1
2417	207	RozwojPlus	39	0	0	2
2418	207	PSL-TD	31	0	0	1
2419	207	Konfederacja	16	0	0	0
2420	207	Centrum	6	3	2	4
2421	207	Lewica	3	5	7	6
2422	207	Polska2050	12	0	0	3
2423	207	Konfederacja_KP	3	0	0	0
2424	207	niez.	6	1	0	0
2425	207	Razem	3	0	0	1
2426	208	PiS	136	0	0	10
2427	208	KO	130	7	2	17
2428	208	Demokracja	3	0	0	1
2429	208	RozwojPlus	38	0	0	3
2430	208	PSL-TD	31	0	0	1
2431	208	Konfederacja	15	0	0	1
2432	208	Centrum	4	1	5	5
2433	208	Lewica	4	12	2	3
2434	208	Polska2050	9	0	3	3
2435	208	Konfederacja_KP	3	0	0	0
2436	208	niez.	4	1	0	2
2437	208	Razem	0	4	0	0
2438	209	PiS	132	0	0	14
2439	209	KO	150	0	0	6
2440	209	Demokracja	3	0	0	1
2441	209	RozwojPlus	36	0	0	5
2442	209	PSL-TD	28	0	0	4
2443	209	Konfederacja	15	0	0	1
2444	209	Centrum	13	0	0	2
2445	209	Lewica	18	0	0	3
2446	209	Polska2050	12	0	0	3
2447	209	Konfederacja_KP	3	0	0	0
2448	209	niez.	7	0	0	0
2449	209	Razem	4	0	0	0
2450	210	PiS	123	2	5	16
2451	210	KO	150	0	0	6
2452	210	Demokracja	0	1	2	1
2453	210	RozwojPlus	36	0	3	2
2454	210	PSL-TD	30	0	0	2
2455	210	Konfederacja	0	16	0	0
2456	210	Centrum	13	0	0	2
2457	210	Lewica	20	0	0	1
2458	210	Polska2050	12	0	0	3
2459	210	Konfederacja_KP	0	3	0	0
2460	210	niez.	5	1	1	0
2461	210	Razem	4	0	0	0
2462	211	PiS	129	0	0	17
2463	211	KO	150	0	0	6
2464	211	Demokracja	3	0	0	1
2465	211	RozwojPlus	39	0	0	2
2466	211	PSL-TD	30	0	0	2
2467	211	Konfederacja	15	1	0	0
2468	211	Centrum	13	0	0	2
2469	211	Lewica	20	0	0	1
2470	211	Polska2050	12	0	0	3
2471	211	Konfederacja_KP	1	0	2	0
2472	211	niez.	7	0	0	0
2473	211	Razem	4	0	0	0
2474	212	PiS	126	0	2	18
2475	212	KO	149	0	0	7
2476	212	Demokracja	0	0	3	1
2477	212	RozwojPlus	37	0	1	3
2478	212	PSL-TD	30	0	0	2
2479	212	Konfederacja	0	0	15	1
2480	212	Centrum	13	0	0	2
2481	212	Lewica	20	0	0	1
2482	212	Polska2050	11	0	0	4
2483	212	Konfederacja_KP	1	0	2	0
2484	212	niez.	6	0	1	0
2485	212	Razem	4	0	0	0
2486	213	PiS	126	0	0	20
2487	213	KO	150	0	0	6
2488	213	Demokracja	1	0	0	3
2489	213	RozwojPlus	39	0	0	2
2490	213	PSL-TD	30	0	0	2
2491	213	Konfederacja	15	0	1	0
2492	213	Centrum	13	0	0	2
2493	213	Lewica	20	0	0	1
2494	213	Polska2050	10	0	0	5
2495	213	Konfederacja_KP	3	0	0	0
2496	213	niez.	7	0	0	0
2497	213	Razem	4	0	0	0
2498	214	PiS	122	0	0	24
2499	214	KO	150	0	0	6
2500	214	Demokracja	0	0	3	1
2501	214	RozwojPlus	37	0	1	3
2502	214	PSL-TD	30	0	0	2
2503	214	Konfederacja	0	0	15	1
2504	214	Centrum	13	0	0	2
2505	214	Lewica	20	0	0	1
2506	214	Polska2050	11	0	0	4
2507	214	Konfederacja_KP	0	3	0	0
2508	214	niez.	5	0	1	1
2509	214	Razem	4	0	0	0
2510	215	PiS	124	0	0	22
2511	215	KO	146	0	0	10
2512	215	Demokracja	0	3	0	1
2513	215	RozwojPlus	39	0	0	2
2514	215	PSL-TD	27	0	0	5
2515	215	Konfederacja	0	15	1	0
2516	215	Centrum	13	0	0	2
2517	215	Lewica	20	0	0	1
2518	215	Polska2050	11	0	0	4
2519	215	Konfederacja_KP	0	3	0	0
2520	215	niez.	5	1	0	1
2521	215	Razem	4	0	0	0
2522	216	PiS	121	0	0	25
2523	216	KO	0	150	0	6
2524	216	Demokracja	2	1	0	1
2525	216	RozwojPlus	38	0	0	3
2526	216	PSL-TD	0	29	0	3
2527	216	Konfederacja	12	4	0	0
2528	216	Centrum	0	12	0	3
2529	216	Lewica	1	19	0	1
2530	216	Polska2050	0	11	0	4
2531	216	Konfederacja_KP	0	3	0	0
2532	216	niez.	1	4	0	2
2533	216	Razem	0	4	0	0
2534	217	PiS	0	122	0	24
2535	217	KO	150	0	0	6
2536	217	Demokracja	0	3	0	1
2537	217	RozwojPlus	0	38	0	3
2538	217	PSL-TD	29	0	0	3
2539	217	Konfederacja	0	16	0	0
2540	217	Centrum	13	0	0	2
2541	217	Lewica	20	0	0	1
2542	217	Polska2050	11	0	0	4
2543	217	Konfederacja_KP	0	3	0	0
2544	217	niez.	4	2	0	1
2545	217	Razem	0	4	0	0
2546	218	PiS	122	0	0	24
2547	218	KO	0	150	0	6
2548	218	Demokracja	3	0	0	1
2549	218	RozwojPlus	38	0	0	3
2550	218	PSL-TD	0	29	0	3
2551	218	Konfederacja	11	5	0	0
2552	218	Centrum	0	13	0	2
2553	218	Lewica	0	20	0	1
2554	218	Polska2050	0	11	0	4
2555	218	Konfederacja_KP	0	3	0	0
2556	218	niez.	2	3	0	2
2557	218	Razem	0	4	0	0
2558	219	PiS	0	121	0	25
2559	219	KO	146	2	0	8
2560	219	Demokracja	0	3	0	1
2561	219	RozwojPlus	0	38	0	3
2562	219	PSL-TD	29	0	0	3
2563	219	Konfederacja	0	15	0	1
2564	219	Centrum	13	0	0	2
2565	219	Lewica	19	1	0	1
2566	219	Polska2050	11	0	0	4
2567	219	Konfederacja_KP	0	3	0	0
2568	219	niez.	2	2	1	2
2569	219	Razem	0	4	0	0
2570	220	PiS	0	159	0	29
2571	220	KO	146	0	0	10
2572	220	Demokracja	0	0	4	0
2573	220	PSL-TD	28	0	0	4
2574	220	Konfederacja	10	0	2	4
2575	220	Centrum	14	0	0	1
2576	220	Polska2050	10	0	0	5
2577	220	Lewica	17	0	0	4
2578	220	Konfederacja_KP	0	0	3	0
2579	220	niez.	3	3	0	0
2580	220	Razem	0	0	4	0
2581	221	PiS	159	1	0	28
2582	221	KO	0	147	0	9
2583	221	Demokracja	4	0	0	0
2584	221	PSL-TD	0	28	0	4
2585	221	Konfederacja	11	0	1	4
2586	221	Centrum	0	14	0	1
2587	221	Polska2050	0	10	0	5
2588	221	Lewica	0	17	0	4
2589	221	Konfederacja_KP	3	0	0	0
2590	221	niez.	1	4	1	0
2591	221	Razem	0	4	0	0
2592	222	PiS	0	0	0	188
2593	222	KO	0	0	0	156
2594	222	Demokracja	0	0	0	4
2595	222	PSL-TD	0	0	0	32
2596	222	Konfederacja	0	0	0	16
2597	222	Centrum	0	0	0	15
2598	222	Polska2050	0	0	0	15
2599	222	Lewica	0	0	0	21
2600	222	Konfederacja_KP	0	0	0	3
2601	222	niez.	0	0	0	6
2602	222	Razem	0	0	0	4
2603	223	PiS	0	170	0	18
2604	223	KO	147	0	0	9
2605	223	Demokracja	0	0	4	0
2606	223	PSL-TD	27	0	0	5
2607	223	Konfederacja	0	0	11	5
2608	223	Centrum	13	0	0	2
2609	223	Polska2050	12	0	0	3
2610	223	Lewica	18	0	0	3
2611	223	Konfederacja_KP	0	0	3	0
2612	223	niez.	3	1	0	2
2613	223	Razem	4	0	0	0
2614	224	PiS	169	0	1	18
2615	224	KO	148	0	0	8
2616	224	Demokracja	0	0	4	0
2617	224	PSL-TD	27	0	0	5
2618	224	Konfederacja	0	0	11	5
2619	224	Centrum	13	0	0	2
2620	224	Polska2050	12	0	0	3
2621	224	Lewica	18	0	0	3
2622	224	Konfederacja_KP	0	0	3	0
2623	224	niez.	5	0	0	1
2624	224	Razem	4	0	0	0
2625	225	PiS	169	0	0	19
2626	225	KO	148	0	0	8
2627	225	Demokracja	4	0	0	0
2628	225	PSL-TD	27	0	0	5
2629	225	Konfederacja	11	0	0	5
2630	225	Centrum	13	0	0	2
2631	225	Polska2050	12	0	0	3
2632	225	Lewica	18	0	0	3
2633	225	Konfederacja_KP	3	0	0	0
2634	225	niez.	3	1	1	1
2635	225	Razem	2	0	2	0
2636	226	PiS	2	167	0	19
2637	226	KO	148	0	0	8
2638	226	Demokracja	0	2	2	0
2639	226	PSL-TD	26	0	0	6
2640	226	Konfederacja	0	0	10	6
2641	226	Centrum	13	0	0	2
2642	226	Polska2050	11	0	0	4
2643	226	Lewica	18	0	0	3
2644	226	Konfederacja_KP	0	2	1	0
2645	226	niez.	5	0	0	1
2646	226	Razem	4	0	0	0
2647	227	PiS	45	120	4	19
2648	227	KO	0	155	0	1
2649	227	Demokracja	3	0	0	1
2650	227	PSL-TD	0	31	0	1
2651	227	Konfederacja	0	14	0	2
2652	227	Centrum	2	13	0	0
2653	227	Polska2050	1	10	0	4
2654	227	Lewica	0	18	0	3
2655	227	Konfederacja_KP	0	1	2	0
2656	227	niez.	1	4	0	1
2657	227	Razem	0	1	3	0
2658	228	PiS	0	0	0	188
2659	228	KO	0	0	0	156
2660	228	Demokracja	0	0	0	4
2661	228	PSL-TD	0	0	0	32
2662	228	Konfederacja	0	0	0	16
2663	228	Centrum	0	0	0	15
2664	228	Polska2050	0	0	0	15
2665	228	Lewica	0	0	0	21
2666	228	Konfederacja_KP	0	0	0	3
2667	228	niez.	0	0	0	6
2668	228	Razem	0	0	0	4
2669	229	PiS	1	0	171	16
2670	229	KO	156	0	0	0
2671	229	Demokracja	2	0	1	1
2672	229	PSL-TD	32	0	0	0
2673	229	Konfederacja	15	0	0	1
2674	229	Centrum	13	0	0	2
2675	229	Polska2050	11	0	0	4
2676	229	Lewica	19	0	0	2
2677	229	Konfederacja_KP	3	0	0	0
2678	229	niez.	5	0	1	0
2679	229	Razem	4	0	0	0
2680	230	PiS	175	0	0	13
2681	230	KO	0	155	0	1
2682	230	Demokracja	4	0	0	0
2683	230	PSL-TD	0	32	0	0
2684	230	Konfederacja	15	0	0	1
2685	230	Centrum	0	14	0	1
2686	230	Polska2050	0	12	0	3
2687	230	Lewica	0	19	0	2
2688	230	Konfederacja_KP	3	0	0	0
2689	230	niez.	1	5	0	0
2690	230	Razem	0	4	0	0
2691	231	PiS	175	1	0	12
2692	231	KO	156	0	0	0
2693	231	Demokracja	4	0	0	0
2694	231	PSL-TD	32	0	0	0
2695	231	Konfederacja	14	0	0	2
2696	231	Centrum	15	0	0	0
2697	231	Polska2050	11	0	0	4
2698	231	Lewica	19	0	0	2
2699	231	Konfederacja_KP	2	0	0	1
2700	231	niez.	6	0	0	0
2701	231	Razem	4	0	0	0
2702	232	PiS	0	171	0	17
2703	232	KO	156	0	0	0
2704	232	Demokracja	0	4	0	0
2705	232	PSL-TD	32	0	0	0
2706	232	Konfederacja	0	15	0	1
2707	232	Centrum	15	0	0	0
2708	232	Polska2050	12	0	0	3
2709	232	Lewica	19	0	0	2
2710	232	Konfederacja_KP	0	0	3	0
2711	232	niez.	5	1	0	0
2712	232	Razem	4	0	0	0
2713	233	PiS	176	0	0	12
2714	233	KO	0	156	0	0
2715	233	Demokracja	3	0	0	1
2716	233	PSL-TD	0	31	0	1
2717	233	Konfederacja	15	0	0	1
2718	233	Centrum	0	15	0	0
2719	233	Polska2050	0	12	0	3
2720	233	Lewica	0	17	0	4
2721	233	Konfederacja_KP	3	0	0	0
2722	233	niez.	1	5	0	0
2723	233	Razem	0	4	0	0
2724	234	PiS	2	0	175	11
2725	234	KO	156	0	0	0
2726	234	Demokracja	0	0	3	1
2727	234	PSL-TD	30	1	0	1
2728	234	Konfederacja	0	0	14	2
2729	234	Centrum	15	0	0	0
2730	234	Polska2050	12	0	0	3
2731	234	Lewica	19	0	0	2
2732	234	Konfederacja_KP	0	0	3	0
2733	234	niez.	5	0	1	0
2734	234	Razem	4	0	0	0
2735	235	PiS	172	0	0	16
2736	235	KO	153	3	0	0
2737	235	Demokracja	0	0	3	1
2738	235	PSL-TD	32	0	0	0
2739	235	Konfederacja	0	0	15	1
2740	235	Centrum	15	0	0	0
2741	235	Polska2050	12	0	0	3
2742	235	Lewica	19	0	0	2
2743	235	Konfederacja_KP	0	0	3	0
2744	235	niez.	6	0	0	0
2745	235	Razem	4	0	0	0
2746	236	PiS	0	175	0	13
2747	236	KO	2	153	0	1
2748	236	Demokracja	0	3	0	1
2749	236	PSL-TD	0	29	0	3
2750	236	Konfederacja	1	13	0	2
2751	236	Centrum	0	15	0	0
2752	236	Polska2050	0	12	0	3
2753	236	Lewica	1	18	0	2
2754	236	Konfederacja_KP	0	3	0	0
2755	236	niez.	1	4	0	1
2756	236	Razem	4	0	0	0
2757	237	PiS	0	5	165	18
2758	237	KO	156	0	0	0
2759	237	Demokracja	3	0	0	1
2760	237	PSL-TD	30	0	0	2
2761	237	Konfederacja	15	0	0	1
2762	237	Centrum	15	0	0	0
2763	237	Polska2050	12	0	0	3
2764	237	Lewica	19	0	0	2
2765	237	Konfederacja_KP	3	0	0	0
2766	237	niez.	4	0	1	1
2767	237	Razem	4	0	0	0
2768	238	PiS	1	2	170	15
2769	238	KO	154	0	0	2
2770	238	Demokracja	3	0	0	1
2771	238	PSL-TD	31	0	0	1
2772	238	Konfederacja	15	0	0	1
2773	238	Centrum	15	0	0	0
2774	238	Polska2050	11	0	0	4
2775	238	Lewica	19	0	0	2
2776	238	Konfederacja_KP	3	0	0	0
2777	238	niez.	4	0	1	1
2778	238	Razem	4	0	0	0
2779	239	PiS	176	0	0	12
2780	239	KO	3	150	0	3
2781	239	Demokracja	3	0	0	1
2782	239	PSL-TD	0	32	0	0
2783	239	Konfederacja	15	0	0	1
2784	239	Centrum	0	15	0	0
2785	239	Polska2050	1	10	0	4
2786	239	Lewica	0	19	0	2
2787	239	Konfederacja_KP	3	0	0	0
2788	239	niez.	1	3	1	1
2789	239	Razem	0	0	4	0
2790	240	PiS	171	0	0	17
2791	240	KO	154	0	0	2
2792	240	Demokracja	3	0	0	1
2793	240	PSL-TD	32	0	0	0
2794	240	Konfederacja	15	0	0	1
2795	240	Centrum	15	0	0	0
2796	240	Polska2050	11	0	0	4
2797	240	Lewica	19	0	0	2
2798	240	Konfederacja_KP	3	0	0	0
2799	240	niez.	5	0	0	1
2800	240	Razem	4	0	0	0
2801	241	PiS	5	0	170	13
2802	241	KO	155	0	0	1
2803	241	Demokracja	3	0	0	1
2804	241	PSL-TD	31	0	0	1
2805	241	Konfederacja	14	0	0	2
2806	241	Centrum	15	0	0	0
2807	241	Polska2050	12	0	0	3
2808	241	Lewica	18	0	0	3
2809	241	Konfederacja_KP	3	0	0	0
2810	241	niez.	4	0	1	1
2811	241	Razem	4	0	0	0
2812	242	PiS	169	0	5	14
2813	242	KO	155	0	0	1
2814	242	Demokracja	3	0	0	1
2815	242	PSL-TD	32	0	0	0
2816	242	Konfederacja	15	0	0	1
2817	242	Centrum	15	0	0	0
2818	242	Polska2050	11	0	0	4
2819	242	Lewica	19	0	0	2
2820	242	Konfederacja_KP	3	0	0	0
2821	242	niez.	6	0	0	0
2822	242	Razem	4	0	0	0
2823	243	PiS	1	1	171	15
2824	243	KO	155	0	0	1
2825	243	Demokracja	0	0	3	1
2826	243	PSL-TD	31	0	0	1
2827	243	Konfederacja	0	0	14	2
2828	243	Centrum	15	0	0	0
2829	243	Polska2050	11	0	0	4
2830	243	Lewica	18	0	0	3
2831	243	Konfederacja_KP	0	0	3	0
2832	243	niez.	5	0	1	0
2833	243	Razem	4	0	0	0
2834	244	PiS	0	0	172	16
2835	244	KO	155	0	0	1
2836	244	Demokracja	1	0	2	1
2837	244	PSL-TD	32	0	0	0
2838	244	Konfederacja	0	0	15	1
2839	244	Centrum	15	0	0	0
2840	244	Polska2050	10	0	0	5
2841	244	Lewica	19	0	0	2
2842	244	Konfederacja_KP	0	0	3	0
2843	244	niez.	5	0	1	0
2844	244	Razem	4	0	0	0
2845	245	PiS	169	0	5	14
2846	245	KO	1	152	0	3
2847	245	Demokracja	0	0	3	1
2848	245	PSL-TD	1	31	0	0
2849	245	Konfederacja	0	0	15	1
2850	245	Centrum	0	15	0	0
2851	245	Polska2050	0	12	0	3
2852	245	Lewica	0	19	0	2
2853	245	Konfederacja_KP	0	0	3	0
2854	245	niez.	2	4	0	0
2855	245	Razem	4	0	0	0
2856	246	PiS	177	0	1	10
2857	246	KO	156	0	0	0
2858	246	Demokracja	0	0	3	1
2859	246	PSL-TD	32	0	0	0
2860	246	Konfederacja	0	0	15	1
2861	246	Centrum	15	0	0	0
2862	246	Polska2050	11	0	0	4
2863	246	Lewica	19	0	0	2
2864	246	Konfederacja_KP	0	0	3	0
2865	246	niez.	6	0	0	0
2866	246	Razem	4	0	0	0
2867	247	PiS	0	0	177	11
2868	247	KO	156	0	0	0
2869	247	Demokracja	3	0	0	1
2870	247	PSL-TD	32	0	0	0
2871	247	Konfederacja	15	0	0	1
2872	247	Centrum	15	0	0	0
2873	247	Polska2050	12	0	0	3
2874	247	Lewica	19	0	0	2
2875	247	Konfederacja_KP	3	0	0	0
2876	247	niez.	5	0	1	0
2877	247	Razem	4	0	0	0
2878	248	PiS	175	0	2	11
2879	248	KO	156	0	0	0
2880	248	Demokracja	3	0	0	1
2881	248	PSL-TD	31	1	0	0
2882	248	Konfederacja	15	0	0	1
2883	248	Centrum	14	0	0	1
2884	248	Polska2050	12	0	0	3
2885	248	Lewica	19	0	0	2
2886	248	Konfederacja_KP	3	0	0	0
2887	248	niez.	6	0	0	0
2888	248	Razem	4	0	0	0
2889	249	PiS	178	0	0	10
2890	249	KO	1	153	0	2
2891	249	Demokracja	3	0	0	1
2892	249	PSL-TD	0	32	0	0
2893	249	Konfederacja	15	0	0	1
2894	249	Centrum	0	15	0	0
2895	249	Polska2050	0	12	0	3
2896	249	Lewica	1	17	0	3
2897	249	Konfederacja_KP	3	0	0	0
2898	249	niez.	2	4	0	0
2899	249	Razem	4	0	0	0
2900	250	PiS	172	0	1	15
2901	250	KO	0	154	0	2
2902	250	Demokracja	0	0	3	1
2903	250	PSL-TD	0	32	0	0
2904	250	Konfederacja	0	0	14	2
2905	250	Centrum	0	15	0	0
2906	250	Polska2050	0	12	0	3
2907	250	Lewica	0	19	0	2
2908	250	Konfederacja_KP	0	0	3	0
2909	250	niez.	1	5	0	0
2910	250	Razem	0	4	0	0
2911	251	PiS	2	4	167	15
2912	251	KO	156	0	0	0
2913	251	Demokracja	0	3	0	1
2914	251	PSL-TD	32	0	0	0
2915	251	Konfederacja	0	15	0	1
2916	251	Centrum	15	0	0	0
2917	251	Polska2050	12	0	0	3
2918	251	Lewica	19	0	0	2
2919	251	Konfederacja_KP	0	0	3	0
2920	251	niez.	5	0	1	0
2921	251	Razem	4	0	0	0
2922	252	PiS	159	0	1	28
2923	252	KO	0	145	0	11
2924	252	Demokracja	0	3	0	1
2925	252	PSL-TD	1	30	0	1
2926	252	Konfederacja	0	15	0	1
2927	252	Centrum	0	11	0	4
2928	252	Polska2050	0	12	0	3
2929	252	Lewica	0	19	0	2
2930	252	Konfederacja_KP	0	3	0	0
2931	252	niez.	1	4	1	0
2932	252	Razem	0	0	4	0
2933	253	PiS	0	169	1	18
2934	253	KO	150	0	1	5
2935	253	Demokracja	0	0	3	1
2936	253	PSL-TD	32	0	0	0
2937	253	Konfederacja	0	15	0	1
2938	253	Centrum	12	0	0	3
2939	253	Polska2050	12	0	0	3
2940	253	Lewica	19	0	0	2
2941	253	Konfederacja_KP	0	3	0	0
2942	253	niez.	5	1	0	0
2943	253	Razem	4	0	0	0
2944	254	PiS	6	15	147	20
2945	254	KO	3	152	0	1
2946	254	Demokracja	2	1	0	1
2947	254	PSL-TD	1	30	0	1
2948	254	Konfederacja	14	0	0	2
2949	254	Centrum	0	15	0	0
2950	254	Polska2050	0	12	0	3
2951	254	Lewica	0	19	0	2
2952	254	Konfederacja_KP	3	0	0	0
2953	254	niez.	0	5	1	0
2954	254	Razem	0	4	0	0
2955	255	PiS	166	1	0	21
2956	255	KO	0	156	0	0
2957	255	Demokracja	3	0	0	1
2958	255	PSL-TD	0	30	0	2
2959	255	Konfederacja	15	0	0	1
2960	255	Centrum	0	15	0	0
2961	255	Polska2050	0	11	1	3
2962	255	Lewica	0	19	0	2
2963	255	Konfederacja_KP	2	0	0	1
2964	255	niez.	2	4	0	0
2965	255	Razem	0	4	0	0
2966	256	PiS	2	173	0	13
2967	256	KO	155	0	0	1
2968	256	Demokracja	0	0	3	1
2969	256	PSL-TD	31	0	0	1
2970	256	Konfederacja	0	0	15	1
2971	256	Centrum	15	0	0	0
2972	256	Polska2050	12	0	0	3
2973	256	Lewica	19	0	0	2
2974	256	Konfederacja_KP	0	0	3	0
2975	256	niez.	4	2	0	0
2976	256	Razem	0	4	0	0
2977	257	PiS	176	0	0	12
2978	257	KO	2	154	0	0
2979	257	Demokracja	3	0	0	1
2980	257	PSL-TD	3	29	0	0
2981	257	Konfederacja	15	0	0	1
2982	257	Centrum	0	14	0	1
2983	257	Polska2050	0	12	0	3
2984	257	Lewica	0	19	0	2
2985	257	Konfederacja_KP	3	0	0	0
2986	257	niez.	1	5	0	0
2987	257	Razem	0	4	0	0
2988	258	PiS	1	172	0	15
2989	258	KO	151	0	0	5
2990	258	Demokracja	0	3	0	1
2991	258	PSL-TD	30	0	0	2
2992	258	Konfederacja	0	15	0	1
2993	258	Centrum	15	0	0	0
2994	258	Polska2050	12	0	0	3
2995	258	Lewica	19	0	0	2
2996	258	Konfederacja_KP	0	3	0	0
2997	258	niez.	4	1	0	1
2998	258	Razem	4	0	0	0
2999	259	PiS	0	2	172	14
3000	259	KO	155	0	0	1
3001	259	Demokracja	0	0	3	1
3002	259	PSL-TD	32	0	0	0
3003	259	Konfederacja	0	8	6	2
3004	259	Centrum	15	0	0	0
3005	259	Polska2050	12	0	0	3
3006	259	Lewica	19	0	0	2
3007	259	Konfederacja_KP	0	0	3	0
3008	259	niez.	5	0	1	0
3009	259	Razem	4	0	0	0
3010	260	PiS	0	175	3	10
3011	260	KO	1	154	0	1
3012	260	Demokracja	3	0	0	1
3013	260	PSL-TD	0	32	0	0
3014	260	Konfederacja	15	0	0	1
3015	260	Centrum	0	15	0	0
3016	260	Polska2050	0	12	0	3
3017	260	Lewica	0	19	0	2
3018	260	Konfederacja_KP	3	0	0	0
3019	260	niez.	0	6	0	0
3020	260	Razem	0	4	0	0
3021	261	PiS	0	177	0	11
3022	261	KO	0	156	0	0
3023	261	Demokracja	0	3	0	1
3024	261	PSL-TD	0	32	0	0
3025	261	Konfederacja	0	15	0	1
3026	261	Centrum	0	15	0	0
3027	261	Polska2050	10	2	0	3
3028	261	Lewica	1	18	0	2
3029	261	Konfederacja_KP	0	3	0	0
3030	261	niez.	2	4	0	0
3031	261	Razem	4	0	0	0
3032	262	PiS	178	0	0	10
3033	262	KO	156	0	0	0
3034	262	Demokracja	0	3	0	1
3035	262	PSL-TD	31	1	0	0
3036	262	Konfederacja	14	1	0	1
3037	262	Centrum	15	0	0	0
3038	262	Polska2050	0	12	0	3
3039	262	Lewica	19	0	0	2
3040	262	Konfederacja_KP	0	3	0	0
3041	262	niez.	6	0	0	0
3042	262	Razem	0	4	0	0
3043	263	PiS	178	0	0	10
3044	263	KO	156	0	0	0
3045	263	Demokracja	1	0	2	1
3046	263	PSL-TD	32	0	0	0
3047	263	Konfederacja	0	0	15	1
3048	263	Centrum	15	0	0	0
3049	263	Polska2050	10	0	0	5
3050	263	Lewica	19	0	0	2
3051	263	Konfederacja_KP	0	0	3	0
3052	263	niez.	6	0	0	0
3053	263	Razem	4	0	0	0
3054	264	PiS	112	61	2	13
3055	264	KO	154	0	0	2
3056	264	Demokracja	0	0	3	1
3057	264	PSL-TD	30	0	0	2
3058	264	Konfederacja	2	0	11	3
3059	264	Centrum	15	0	0	0
3060	264	Polska2050	12	0	0	3
3061	264	Lewica	19	0	0	2
3062	264	Konfederacja_KP	0	0	3	0
3063	264	niez.	5	1	0	0
3064	264	Razem	4	0	0	0
3065	265	PiS	172	4	0	12
3066	265	KO	154	0	0	2
3067	265	Demokracja	3	0	0	1
3068	265	PSL-TD	31	0	0	1
3069	265	Konfederacja	14	0	0	2
3070	265	Centrum	15	0	0	0
3071	265	Polska2050	12	0	0	3
3072	265	Lewica	19	0	0	2
3073	265	Konfederacja_KP	3	0	0	0
3074	265	niez.	6	0	0	0
3075	265	Razem	4	0	0	0
3076	266	PiS	178	0	0	10
3077	266	KO	1	155	0	0
3078	266	Demokracja	3	0	0	1
3079	266	PSL-TD	0	26	0	6
3080	266	Konfederacja	15	0	0	1
3081	266	Centrum	0	15	0	0
3082	266	Polska2050	0	12	0	3
3083	266	Lewica	0	19	0	2
3084	266	Konfederacja_KP	3	0	0	0
3085	266	niez.	1	5	0	0
3086	266	Razem	0	4	0	0
3087	267	PiS	177	0	0	11
3088	267	KO	156	0	0	0
3089	267	Demokracja	2	0	0	2
3090	267	PSL-TD	32	0	0	0
3091	267	Konfederacja	15	0	0	1
3092	267	Centrum	15	0	0	0
3093	267	Polska2050	12	0	0	3
3094	267	Lewica	19	0	0	2
3095	267	Konfederacja_KP	3	0	0	0
3096	267	niez.	6	0	0	0
3097	267	Razem	3	0	0	1
3098	268	PiS	178	0	0	10
3099	268	KO	0	154	0	2
3100	268	Demokracja	3	0	0	1
3101	268	PSL-TD	1	6	22	3
3102	268	Konfederacja	15	0	0	1
3103	268	Centrum	0	15	0	0
3104	268	Polska2050	0	10	2	3
3105	268	Lewica	0	19	0	2
3106	268	Konfederacja_KP	3	0	0	0
3107	268	niez.	1	3	2	0
3108	268	Razem	0	4	0	0
3109	269	PiS	174	0	1	13
3110	269	KO	0	154	0	2
3111	269	Demokracja	3	0	0	1
3112	269	PSL-TD	0	32	0	0
3113	269	Konfederacja	15	0	0	1
3114	269	Centrum	0	15	0	0
3115	269	Polska2050	0	12	0	3
3116	269	Lewica	0	19	0	2
3117	269	Konfederacja_KP	3	0	0	0
3118	269	niez.	1	4	1	0
3119	269	Razem	0	4	0	0
3120	270	PiS	173	0	0	15
3121	270	KO	154	1	0	1
3122	270	Demokracja	2	0	0	2
3123	270	PSL-TD	31	0	0	1
3124	270	Konfederacja	15	0	0	1
3125	270	Centrum	15	0	0	0
3126	270	Polska2050	12	0	0	3
3127	270	Lewica	19	0	0	2
3128	270	Konfederacja_KP	3	0	0	0
3129	270	niez.	6	0	0	0
3130	270	Razem	4	0	0	0
3131	271	PiS	1	170	4	13
3132	271	KO	154	1	0	1
3133	271	Demokracja	0	3	0	1
3134	271	PSL-TD	0	32	0	0
3135	271	Konfederacja	0	15	0	1
3136	271	Centrum	14	1	0	0
3137	271	Polska2050	0	12	0	3
3138	271	Lewica	19	0	0	2
3139	271	Konfederacja_KP	0	2	0	1
3140	271	niez.	4	2	0	0
3141	271	Razem	4	0	0	0
3142	272	PiS	177	0	0	11
3143	272	KO	1	153	0	2
3144	272	Demokracja	3	0	0	1
3145	272	PSL-TD	1	31	0	0
3146	272	Konfederacja	15	0	0	1
3147	272	Centrum	0	15	0	0
3148	272	Polska2050	5	5	0	5
3149	272	Lewica	0	19	0	2
3150	272	Konfederacja_KP	3	0	0	0
3151	272	niez.	1	4	1	0
3152	272	Razem	0	4	0	0
3153	273	PiS	0	4	166	18
3154	273	KO	156	0	0	0
3155	273	Demokracja	2	1	0	1
3156	273	PSL-TD	32	0	0	0
3157	273	Konfederacja	15	0	0	1
3158	273	Centrum	15	0	0	0
3159	273	Polska2050	12	0	0	3
3160	273	Lewica	16	0	0	5
3161	273	Konfederacja_KP	3	0	0	0
3162	273	niez.	5	1	0	0
3163	273	Razem	4	0	0	0
3164	274	PiS	175	1	0	12
3165	274	KO	1	155	0	0
3166	274	Demokracja	0	3	0	1
3167	274	PSL-TD	0	32	0	0
3168	274	Konfederacja	0	15	0	1
3169	274	Centrum	0	14	0	1
3170	274	Polska2050	0	12	0	3
3171	274	Lewica	0	19	0	2
3172	274	Konfederacja_KP	0	3	0	0
3173	274	niez.	2	4	0	0
3174	274	Razem	0	0	4	0
3175	275	PiS	173	0	0	15
3176	275	KO	0	155	0	1
3177	275	Demokracja	0	3	0	1
3178	275	PSL-TD	0	31	0	1
3179	275	Konfederacja	0	15	0	1
3180	275	Centrum	0	15	0	0
3181	275	Polska2050	0	12	0	3
3182	275	Lewica	0	19	0	2
3183	275	Konfederacja_KP	0	3	0	0
3184	275	niez.	2	4	0	0
3185	275	Razem	0	0	4	0
3186	276	PiS	176	0	0	12
3187	276	KO	0	156	0	0
3188	276	Demokracja	0	3	0	1
3189	276	PSL-TD	0	31	0	1
3190	276	Konfederacja	0	15	0	1
3191	276	Centrum	0	15	0	0
3192	276	Polska2050	0	12	0	3
3193	276	Lewica	0	19	0	2
3194	276	Konfederacja_KP	0	3	0	0
3195	276	niez.	2	4	0	0
3196	276	Razem	0	0	4	0
3197	277	PiS	165	0	12	11
3198	277	KO	0	156	0	0
3199	277	Demokracja	0	3	0	1
3200	277	PSL-TD	0	32	0	0
3201	277	Konfederacja	0	15	0	1
3202	277	Centrum	0	15	0	0
3203	277	Polska2050	0	12	0	3
3204	277	Lewica	0	19	0	2
3205	277	Konfederacja_KP	0	3	0	0
3206	277	niez.	2	4	0	0
3207	277	Razem	0	0	4	0
3208	278	PiS	0	0	174	14
3209	278	KO	0	156	0	0
3210	278	Demokracja	0	2	0	2
3211	278	PSL-TD	0	30	0	2
3212	278	Konfederacja	0	15	0	1
3213	278	Centrum	0	15	0	0
3214	278	Polska2050	0	12	0	3
3215	278	Lewica	0	19	0	2
3216	278	Konfederacja_KP	0	3	0	0
3217	278	niez.	0	5	1	0
3218	278	Razem	0	4	0	0
3219	279	PiS	0	1	172	15
3220	279	KO	0	156	0	0
3221	279	Demokracja	0	3	0	1
3222	279	PSL-TD	0	32	0	0
3223	279	Konfederacja	0	15	0	1
3224	279	Centrum	0	14	0	1
3225	279	Polska2050	0	12	0	3
3226	279	Lewica	0	19	0	2
3227	279	Konfederacja_KP	0	1	1	1
3228	279	niez.	0	5	1	0
3229	279	Razem	0	4	0	0
3230	280	PiS	0	1	172	15
3231	280	KO	0	154	0	2
3232	280	Demokracja	0	3	0	1
3233	280	PSL-TD	0	32	0	0
3234	280	Konfederacja	0	14	1	1
3235	280	Centrum	0	15	0	0
3236	280	Polska2050	0	12	0	3
3237	280	Lewica	0	19	0	2
3238	280	Konfederacja_KP	0	3	0	0
3239	280	niez.	0	5	0	1
3240	280	Razem	0	4	0	0
3241	281	PiS	0	1	172	15
3242	281	KO	0	156	0	0
3243	281	Demokracja	0	3	0	1
3244	281	PSL-TD	0	32	0	0
3245	281	Konfederacja	1	14	0	1
3246	281	Centrum	0	15	0	0
3247	281	Polska2050	0	12	0	3
3248	281	Lewica	0	19	0	2
3249	281	Konfederacja_KP	0	3	0	0
3250	281	niez.	0	5	1	0
3251	281	Razem	0	4	0	0
3252	282	PiS	1	0	175	12
3253	282	KO	0	152	0	4
3254	282	Demokracja	0	3	0	1
3255	282	PSL-TD	0	32	0	0
3256	282	Konfederacja	0	15	0	1
3257	282	Centrum	0	14	0	1
3258	282	Polska2050	0	12	0	3
3259	282	Lewica	0	19	0	2
3260	282	Konfederacja_KP	0	3	0	0
3261	282	niez.	0	5	1	0
3262	282	Razem	0	4	0	0
3263	283	PiS	0	167	5	16
3264	283	KO	0	155	0	1
3265	283	Demokracja	0	3	0	1
3266	283	PSL-TD	0	32	0	0
3267	283	Konfederacja	0	15	0	1
3268	283	Centrum	0	15	0	0
3269	283	Polska2050	0	12	0	3
3270	283	Lewica	0	19	0	2
3271	283	Konfederacja_KP	0	3	0	0
3272	283	niez.	0	5	1	0
3273	283	Razem	0	4	0	0
3274	284	PiS	0	1	172	15
3275	284	KO	0	151	0	5
3276	284	Demokracja	0	0	3	1
3277	284	PSL-TD	0	30	0	2
3278	284	Konfederacja	0	0	15	1
3279	284	Centrum	0	13	0	2
3280	284	Polska2050	0	12	0	3
3281	284	Lewica	0	18	0	3
3282	284	Konfederacja_KP	0	0	3	0
3283	284	niez.	0	5	1	0
3284	284	Razem	0	4	0	0
3285	285	PiS	0	172	3	13
3286	285	KO	0	153	1	2
3287	285	Demokracja	0	3	0	1
3288	285	PSL-TD	0	32	0	0
3289	285	Konfederacja	0	15	0	1
3290	285	Centrum	0	15	0	0
3291	285	Polska2050	0	11	0	4
3292	285	Lewica	0	19	0	2
3293	285	Konfederacja_KP	0	3	0	0
3294	285	niez.	0	6	0	0
3295	285	Razem	0	4	0	0
3296	286	PiS	0	3	173	12
3297	286	KO	0	154	0	2
3298	286	Demokracja	0	3	0	1
3299	286	PSL-TD	0	29	1	2
3300	286	Konfederacja	0	15	0	1
3301	286	Centrum	0	15	0	0
3302	286	Polska2050	0	12	0	3
3303	286	Lewica	0	19	0	2
3304	286	Konfederacja_KP	0	3	0	0
3305	286	niez.	0	5	1	0
3306	286	Razem	0	4	0	0
3307	287	PiS	1	0	173	14
3308	287	KO	0	155	0	1
3309	287	Demokracja	0	0	3	1
3310	287	PSL-TD	0	31	0	1
3311	287	Konfederacja	0	0	15	1
3312	287	Centrum	0	15	0	0
3313	287	Polska2050	0	12	0	3
3314	287	Lewica	0	19	0	2
3315	287	Konfederacja_KP	0	0	3	0
3316	287	niez.	0	5	1	0
3317	287	Razem	0	4	0	0
3318	288	PiS	161	4	6	17
3319	288	KO	0	154	0	2
3320	288	Demokracja	0	3	0	1
3321	288	PSL-TD	0	31	0	1
3322	288	Konfederacja	0	15	0	1
3323	288	Centrum	0	15	0	0
3324	288	Polska2050	0	11	0	4
3325	288	Lewica	0	18	0	3
3326	288	Konfederacja_KP	0	3	0	0
3327	288	niez.	1	5	0	0
3328	288	Razem	0	4	0	0
3329	289	PiS	0	173	1	14
3330	289	KO	0	155	0	1
3331	289	Demokracja	0	3	0	1
3332	289	PSL-TD	0	32	0	0
3333	289	Konfederacja	0	15	0	1
3334	289	Centrum	0	15	0	0
3335	289	Polska2050	0	11	0	4
3336	289	Lewica	0	19	0	2
3337	289	Konfederacja_KP	0	3	0	0
3338	289	niez.	0	5	1	0
3339	289	Razem	0	4	0	0
3340	290	PiS	0	0	171	17
3341	290	KO	0	154	0	2
3342	290	Demokracja	0	3	0	1
3343	290	PSL-TD	0	31	0	1
3344	290	Konfederacja	0	15	0	1
3345	290	Centrum	0	15	0	0
3346	290	Polska2050	0	12	0	3
3347	290	Lewica	0	19	0	2
3348	290	Konfederacja_KP	0	3	0	0
3349	290	niez.	0	5	1	0
3350	290	Razem	0	4	0	0
3351	291	PiS	0	0	174	14
3352	291	KO	0	152	0	4
3353	291	Demokracja	0	3	0	1
3354	291	PSL-TD	0	32	0	0
3355	291	Konfederacja	0	15	0	1
3356	291	Centrum	0	15	0	0
3357	291	Polska2050	0	12	0	3
3358	291	Lewica	0	19	0	2
3359	291	Konfederacja_KP	0	3	0	0
3360	291	niez.	0	4	1	1
3361	291	Razem	0	4	0	0
3362	292	PiS	166	0	1	21
3363	292	KO	147	2	0	7
3364	292	Demokracja	3	0	0	1
3365	292	PSL-TD	27	2	0	3
3366	292	Konfederacja	15	0	0	1
3367	292	Centrum	13	0	1	1
3368	292	Polska2050	9	1	0	5
3369	292	Lewica	19	0	0	2
3370	292	Konfederacja_KP	3	0	0	0
3371	292	niez.	4	0	2	0
3372	292	Razem	4	0	0	0
3373	293	PiS	0	162	0	25
3374	293	KO	139	0	0	17
3375	293	Demokracja	0	2	0	2
3376	293	PSL-TD	31	0	0	1
3377	293	Konfederacja	0	11	0	5
3378	293	Centrum	13	0	0	2
3379	293	Polska2050	12	0	0	3
3380	293	Lewica	17	0	0	3
3381	293	Konfederacja_KP	0	2	0	1
3382	293	niez.	3	2	1	1
3383	293	Razem	0	0	4	0
3384	294	PiS	0	164	0	23
3385	294	KO	141	0	0	15
3386	294	Demokracja	0	2	0	2
3387	294	PSL-TD	31	0	0	1
3388	294	Konfederacja	0	11	0	5
3389	294	Centrum	13	0	0	2
3390	294	Polska2050	12	0	0	3
3391	294	Lewica	17	0	0	3
3392	294	Konfederacja_KP	0	2	0	1
3393	294	niez.	4	2	0	1
3394	294	Razem	4	0	0	0
3395	295	PiS	161	0	0	26
3396	295	KO	0	140	0	16
3397	295	Demokracja	2	0	0	2
3398	295	PSL-TD	0	32	0	0
3399	295	Konfederacja	8	1	2	5
3400	295	Centrum	0	13	0	2
3401	295	Polska2050	0	12	0	3
3402	295	Lewica	0	17	0	3
3403	295	Konfederacja_KP	2	0	0	1
3404	295	niez.	2	3	0	2
3405	295	Razem	0	4	0	0
3406	296	PiS	1	1	171	14
3407	296	KO	0	143	0	13
3408	296	Demokracja	0	0	3	1
3409	296	PSL-TD	0	27	0	5
3410	296	Konfederacja	9	0	0	7
3411	296	Centrum	0	15	0	0
3412	296	Polska2050	0	11	0	4
3413	296	Lewica	0	17	0	3
3414	296	Konfederacja_KP	1	0	0	2
3415	296	niez.	1	4	1	1
3416	296	Razem	0	4	0	0
3417	297	PiS	173	0	0	14
3418	297	KO	0	143	0	13
3419	297	Demokracja	3	0	0	1
3420	297	PSL-TD	0	28	0	4
3421	297	Konfederacja	9	0	0	7
3422	297	Centrum	0	15	0	0
3423	297	Polska2050	0	11	0	4
3424	297	Lewica	0	17	0	3
3425	297	Konfederacja_KP	0	0	1	2
3426	297	niez.	1	5	0	1
3427	297	Razem	0	4	0	0
3428	298	PiS	173	0	0	14
3429	298	KO	0	143	0	13
3430	298	Demokracja	3	0	0	1
3431	298	PSL-TD	0	28	0	4
3432	298	Konfederacja	9	0	0	7
3433	298	Centrum	0	15	0	0
3434	298	Polska2050	0	11	0	4
3435	298	Lewica	0	17	0	3
3436	298	Konfederacja_KP	1	0	0	2
3437	298	niez.	2	4	0	1
3438	298	Razem	0	4	0	0
3439	299	PiS	171	0	0	16
3440	299	KO	145	0	0	11
3441	299	Demokracja	4	0	0	0
3442	299	PSL-TD	30	0	0	2
3443	299	Konfederacja	11	0	0	5
3444	299	Centrum	14	0	0	1
3445	299	Polska2050	11	0	0	4
3446	299	Lewica	18	0	0	2
3447	299	Konfederacja_KP	3	0	0	0
3448	299	niez.	6	0	0	1
3449	299	Razem	4	0	0	0
3450	300	PiS	171	0	0	16
3451	300	KO	143	0	0	13
3452	300	Demokracja	4	0	0	0
3453	300	PSL-TD	28	0	0	4
3454	300	Konfederacja	11	0	0	5
3455	300	Centrum	14	0	0	1
3456	300	Polska2050	11	0	0	4
3457	300	Lewica	17	0	0	3
3458	300	Konfederacja_KP	3	0	0	0
3459	300	niez.	6	0	0	1
3460	300	Razem	4	0	0	0
3461	301	PiS	171	0	0	16
3462	301	KO	142	3	0	11
3463	301	Demokracja	4	0	0	0
3464	301	PSL-TD	30	0	0	2
3465	301	Konfederacja	11	0	0	5
3466	301	Centrum	14	0	0	1
3467	301	Polska2050	10	0	1	4
3468	301	Lewica	10	3	2	5
3469	301	Konfederacja_KP	3	0	0	0
3470	301	niez.	4	2	0	1
3471	301	Razem	0	4	0	0
3472	302	PiS	0	176	1	10
3473	302	KO	150	0	0	6
3474	302	Demokracja	0	0	4	0
3475	302	PSL-TD	29	0	0	3
3476	302	Konfederacja	0	0	11	5
3477	302	Centrum	15	0	0	0
3478	302	Lewica	20	0	0	1
3479	302	Polska2050	12	0	0	3
3480	302	Konfederacja_KP	0	0	3	0
3481	302	niez.	5	1	1	0
3482	302	Razem	4	0	0	0
3483	303	PiS	1	173	0	13
3484	303	KO	150	0	0	6
3485	303	Demokracja	0	4	0	0
3486	303	PSL-TD	30	0	0	2
3487	303	Konfederacja	0	11	0	5
3488	303	Centrum	15	0	0	0
3489	303	Lewica	20	0	0	1
3490	303	Polska2050	13	0	0	2
3491	303	Konfederacja_KP	0	3	0	0
3492	303	niez.	5	2	0	0
3493	303	Razem	4	0	0	0
3494	304	PiS	0	175	0	12
3495	304	KO	150	0	0	6
3496	304	Demokracja	0	0	4	0
3497	304	PSL-TD	30	0	0	2
3498	304	Konfederacja	0	0	11	5
3499	304	Centrum	15	0	0	0
3500	304	Lewica	20	0	0	1
3501	304	Polska2050	12	0	0	3
3502	304	Konfederacja_KP	0	0	3	0
3503	304	niez.	5	1	1	0
3504	304	Razem	4	0	0	0
3505	305	PiS	0	179	0	8
3506	305	KO	152	0	0	4
3507	305	Demokracja	0	4	0	0
3508	305	PSL-TD	31	0	0	1
3509	305	Konfederacja	0	11	0	5
3510	305	Centrum	15	0	0	0
3511	305	Lewica	20	0	0	1
3512	305	Polska2050	13	0	0	2
3513	305	Konfederacja_KP	0	3	0	0
3514	305	niez.	4	2	1	0
3515	305	Razem	0	0	4	0
3516	306	PiS	170	1	0	16
3517	306	KO	0	150	0	6
3518	306	Demokracja	4	0	0	0
3519	306	PSL-TD	0	30	0	2
3520	306	Konfederacja	9	0	1	6
3521	306	Centrum	0	14	0	1
3522	306	Lewica	0	20	0	1
3523	306	Polska2050	0	12	0	3
3524	306	Konfederacja_KP	3	0	0	0
3525	306	niez.	2	5	0	0
3526	306	Razem	4	0	0	0
3527	307	PiS	0	0	0	187
3528	307	KO	0	0	0	156
3529	307	Demokracja	0	0	0	4
3530	307	PSL-TD	0	0	0	32
3531	307	Konfederacja	0	0	0	16
3532	307	Centrum	0	0	0	15
3533	307	Lewica	0	0	0	21
3534	307	Polska2050	0	0	0	15
3535	307	Konfederacja_KP	0	0	0	3
3536	307	niez.	0	0	0	7
3537	307	Razem	0	0	0	4
3538	308	PiS	6	168	3	10
3539	308	KO	0	152	0	4
3540	308	Demokracja	1	3	0	0
3541	308	PSL-TD	0	31	0	1
3542	308	Konfederacja	0	12	0	4
3543	308	Centrum	0	15	0	0
3544	308	Lewica	0	18	1	2
3545	308	Polska2050	0	12	1	2
3546	308	Konfederacja_KP	0	3	0	0
3547	308	niez.	0	6	0	1
3548	308	Razem	0	2	1	1
3549	309	PiS	179	0	0	8
3550	309	KO	153	0	0	3
3551	309	Demokracja	4	0	0	0
3552	309	PSL-TD	31	0	0	1
3553	309	Konfederacja	13	0	0	3
3554	309	Centrum	15	0	0	0
3555	309	Lewica	20	0	0	1
3556	309	Polska2050	13	0	0	2
3557	309	Konfederacja_KP	3	0	0	0
3558	309	niez.	7	0	0	0
3559	309	Razem	4	0	0	0
3560	310	PiS	167	2	2	16
3561	310	KO	4	148	0	4
3562	310	Demokracja	3	0	0	1
3563	310	PSL-TD	1	23	0	8
3564	310	Konfederacja	13	0	0	3
3565	310	Centrum	1	11	0	3
3566	310	Lewica	0	20	0	1
3567	310	Polska2050	0	13	0	2
3568	310	Konfederacja_KP	2	0	0	1
3569	310	niez.	4	3	0	0
3570	310	Razem	0	4	0	0
3571	311	PiS	2	2	164	19
3572	311	KO	152	0	0	4
3573	311	Demokracja	4	0	0	0
3574	311	PSL-TD	31	0	0	1
3575	311	Konfederacja	13	0	0	3
3576	311	Centrum	15	0	0	0
3577	311	Lewica	20	0	0	1
3578	311	Polska2050	13	0	0	2
3579	311	Konfederacja_KP	0	0	3	0
3580	311	niez.	6	0	1	0
3581	311	Razem	4	0	0	0
3582	312	PiS	178	1	0	8
3583	312	KO	151	1	0	4
3584	312	Demokracja	4	0	0	0
3585	312	PSL-TD	31	0	0	1
3586	312	Konfederacja	13	0	0	3
3587	312	Centrum	15	0	0	0
3588	312	Lewica	20	0	0	1
3589	312	Polska2050	13	0	0	2
3590	312	Konfederacja_KP	3	0	0	0
3591	312	niez.	7	0	0	0
3592	312	Razem	4	0	0	0
3593	313	PiS	176	0	0	11
3594	313	KO	0	152	0	4
3595	313	Demokracja	4	0	0	0
3596	313	PSL-TD	0	30	0	2
3597	313	Konfederacja	12	1	0	3
3598	313	Centrum	0	15	0	0
3599	313	Lewica	0	20	0	1
3600	313	Polska2050	0	13	0	2
3601	313	Konfederacja_KP	3	0	0	0
3602	313	niez.	2	4	1	0
3603	313	Razem	0	4	0	0
3604	314	PiS	4	161	0	22
3605	314	KO	0	151	0	5
3606	314	Demokracja	4	0	0	0
3607	314	PSL-TD	0	27	0	5
3608	314	Konfederacja	13	0	0	3
3609	314	Centrum	0	14	0	1
3610	314	Lewica	0	19	0	2
3611	314	Polska2050	0	12	0	3
3612	314	Konfederacja_KP	2	0	0	1
3613	314	niez.	1	6	0	0
3614	314	Razem	0	4	0	0
3615	315	PiS	1	174	0	12
3616	315	KO	0	151	0	5
3617	315	Demokracja	4	0	0	0
3618	315	PSL-TD	0	31	0	1
3619	315	Konfederacja	10	0	0	6
3620	315	Centrum	0	15	0	0
3621	315	Lewica	0	20	0	1
3622	315	Polska2050	0	13	0	2
3623	315	Konfederacja_KP	2	0	0	1
3624	315	niez.	1	6	0	0
3625	315	Razem	0	3	0	1
3626	316	PiS	3	172	0	12
3627	316	KO	0	151	0	5
3628	316	Demokracja	4	0	0	0
3629	316	PSL-TD	0	30	0	2
3630	316	Konfederacja	12	0	0	4
3631	316	Centrum	0	15	0	0
3632	316	Lewica	0	20	0	1
3633	316	Polska2050	0	13	0	2
3634	316	Konfederacja_KP	3	0	0	0
3635	316	niez.	1	6	0	0
3636	316	Razem	0	4	0	0
3637	317	PiS	178	0	0	9
3638	317	KO	0	153	0	3
3639	317	Demokracja	4	0	0	0
3640	317	PSL-TD	0	29	0	3
3641	317	Konfederacja	12	0	0	4
3642	317	Centrum	0	15	0	0
3643	317	Lewica	0	19	0	2
3644	317	Polska2050	0	12	0	3
3645	317	Konfederacja_KP	3	0	0	0
3646	317	niez.	2	3	2	0
3647	317	Razem	0	0	4	0
3648	318	PiS	175	1	0	11
3649	318	KO	0	151	0	5
3650	318	Demokracja	4	0	0	0
3651	318	PSL-TD	0	31	0	1
3652	318	Konfederacja	13	0	0	3
3653	318	Centrum	0	14	0	1
3654	318	Lewica	0	20	0	1
3655	318	Polska2050	0	13	0	2
3656	318	Konfederacja_KP	3	0	0	0
3657	318	niez.	2	5	0	0
3658	318	Razem	0	4	0	0
3659	319	PiS	179	0	0	8
3660	319	KO	0	152	0	4
3661	319	Demokracja	4	0	0	0
3662	319	PSL-TD	0	31	0	1
3663	319	Konfederacja	13	0	0	3
3664	319	Centrum	0	15	0	0
3665	319	Lewica	0	19	0	2
3666	319	Polska2050	0	12	0	3
3667	319	Konfederacja_KP	3	0	0	0
3668	319	niez.	2	3	2	0
3669	319	Razem	0	0	4	0
3670	320	PiS	177	1	0	9
3671	320	KO	1	150	0	5
3672	320	Demokracja	4	0	0	0
3673	320	PSL-TD	0	30	0	2
3674	320	Konfederacja	13	0	0	3
3675	320	Centrum	2	13	0	0
3676	320	Lewica	0	20	0	1
3677	320	Polska2050	10	1	0	4
3678	320	Konfederacja_KP	3	0	0	0
3679	320	niez.	4	3	0	0
3680	320	Razem	4	0	0	0
3681	321	PiS	4	167	0	16
3682	321	KO	0	153	0	3
3683	321	Demokracja	4	0	0	0
3684	321	PSL-TD	0	31	0	1
3685	321	Konfederacja	12	1	0	3
3686	321	Centrum	0	15	0	0
3687	321	Lewica	0	20	0	1
3688	321	Polska2050	0	12	0	3
3689	321	Konfederacja_KP	3	0	0	0
3690	321	niez.	1	6	0	0
3691	321	Razem	0	4	0	0
3692	322	PiS	2	171	0	14
3693	322	KO	0	151	0	5
3694	322	Demokracja	4	0	0	0
3695	322	PSL-TD	1	29	0	2
3696	322	Konfederacja	13	0	0	3
3697	322	Centrum	0	14	0	1
3698	322	Lewica	0	18	0	3
3699	322	Polska2050	0	13	0	2
3700	322	Konfederacja_KP	3	0	0	0
3701	322	niez.	0	6	0	1
3702	322	Razem	0	4	0	0
3703	323	PiS	177	2	0	8
3704	323	KO	1	152	0	3
3705	323	Demokracja	4	0	0	0
3706	323	PSL-TD	0	31	0	1
3707	323	Konfederacja	13	0	0	3
3708	323	Centrum	0	15	0	0
3709	323	Lewica	0	20	0	1
3710	323	Polska2050	0	13	0	2
3711	323	Konfederacja_KP	3	0	0	0
3712	323	niez.	2	5	0	0
3713	323	Razem	0	4	0	0
3714	324	PiS	174	1	0	12
3715	324	KO	0	152	0	4
3716	324	Demokracja	4	0	0	0
3717	324	PSL-TD	0	31	0	1
3718	324	Konfederacja	13	0	0	3
3719	324	Centrum	0	15	0	0
3720	324	Lewica	0	20	0	1
3721	324	Polska2050	0	13	0	2
3722	324	Konfederacja_KP	3	0	0	0
3723	324	niez.	2	5	0	0
3724	324	Razem	0	3	0	1
3725	325	PiS	174	2	0	11
3726	325	KO	0	152	0	4
3727	325	Demokracja	4	0	0	0
3728	325	PSL-TD	0	31	0	1
3729	325	Konfederacja	13	0	0	3
3730	325	Centrum	0	15	0	0
3731	325	Lewica	0	20	0	1
3732	325	Polska2050	0	13	0	2
3733	325	Konfederacja_KP	3	0	0	0
3734	325	niez.	1	5	0	1
3735	325	Razem	0	4	0	0
3736	326	PiS	177	0	0	10
3737	326	KO	0	152	0	4
3738	326	Demokracja	3	0	0	1
3739	326	PSL-TD	0	31	0	1
3740	326	Konfederacja	13	0	0	3
3741	326	Centrum	1	14	0	0
3742	326	Lewica	0	19	0	2
3743	326	Polska2050	11	1	0	3
3744	326	Konfederacja_KP	3	0	0	0
3745	326	niez.	4	3	0	0
3746	326	Razem	0	4	0	0
3747	327	PiS	176	0	0	11
3748	327	KO	0	153	0	3
3749	327	Demokracja	4	0	0	0
3750	327	PSL-TD	0	30	0	2
3751	327	Konfederacja	13	0	0	3
3752	327	Centrum	0	15	0	0
3753	327	Lewica	0	20	0	1
3754	327	Polska2050	0	12	0	3
3755	327	Konfederacja_KP	3	0	0	0
3756	327	niez.	2	5	0	0
3757	327	Razem	0	4	0	0
3758	328	PiS	4	171	0	12
3759	328	KO	0	152	0	4
3760	328	Demokracja	4	0	0	0
3761	328	PSL-TD	0	31	0	1
3762	328	Konfederacja	12	0	0	4
3763	328	Centrum	0	15	0	0
3764	328	Lewica	0	20	0	1
3765	328	Polska2050	0	13	0	2
3766	328	Konfederacja_KP	3	0	0	0
3767	328	niez.	1	6	0	0
3768	328	Razem	0	4	0	0
3769	329	PiS	0	179	0	8
3770	329	KO	0	153	0	3
3771	329	Demokracja	4	0	0	0
3772	329	PSL-TD	0	30	0	2
3773	329	Konfederacja	13	0	0	3
3774	329	Centrum	0	15	0	0
3775	329	Lewica	0	20	0	1
3776	329	Polska2050	0	13	0	2
3777	329	Konfederacja_KP	3	0	0	0
3778	329	niez.	1	6	0	0
3779	329	Razem	0	4	0	0
3780	330	PiS	1	174	0	12
3781	330	KO	0	151	0	5
3782	330	Demokracja	4	0	0	0
3783	330	PSL-TD	0	30	0	2
3784	330	Konfederacja	13	0	0	3
3785	330	Centrum	0	15	0	0
3786	330	Lewica	0	20	0	1
3787	330	Polska2050	0	13	0	2
3788	330	Konfederacja_KP	3	0	0	0
3789	330	niez.	1	6	0	0
3790	330	Razem	0	4	0	0
3791	331	PiS	1	174	0	12
3792	331	KO	0	152	0	4
3793	331	Demokracja	4	0	0	0
3794	331	PSL-TD	0	31	0	1
3795	331	Konfederacja	13	0	0	3
3796	331	Centrum	0	15	0	0
3797	331	Lewica	0	18	0	3
3798	331	Polska2050	0	13	0	2
3799	331	Konfederacja_KP	3	0	0	0
3800	331	niez.	1	6	0	0
3801	331	Razem	0	4	0	0
3802	332	PiS	3	174	0	10
3803	332	KO	0	152	0	4
3804	332	Demokracja	4	0	0	0
3805	332	PSL-TD	0	30	0	2
3806	332	Konfederacja	12	0	0	4
3807	332	Centrum	0	15	0	0
3808	332	Lewica	0	20	0	1
3809	332	Polska2050	0	12	0	3
3810	332	Konfederacja_KP	3	0	0	0
3811	332	niez.	1	6	0	0
3812	332	Razem	0	4	0	0
3813	333	PiS	179	0	0	8
3814	333	KO	0	153	0	3
3815	333	Demokracja	4	0	0	0
3816	333	PSL-TD	0	31	0	1
3817	333	Konfederacja	13	0	0	3
3818	333	Centrum	1	14	0	0
3819	333	Lewica	0	20	0	1
3820	333	Polska2050	11	1	0	3
3821	333	Konfederacja_KP	3	0	0	0
3822	333	niez.	4	3	0	0
3823	333	Razem	0	4	0	0
3824	334	PiS	175	0	0	12
3825	334	KO	0	151	0	5
3826	334	Demokracja	4	0	0	0
3827	334	PSL-TD	0	30	0	2
3828	334	Konfederacja	13	0	0	3
3829	334	Centrum	0	15	0	0
3830	334	Lewica	0	20	0	1
3831	334	Polska2050	0	13	0	2
3832	334	Konfederacja_KP	3	0	0	0
3833	334	niez.	2	5	0	0
3834	334	Razem	0	4	0	0
3835	335	PiS	0	178	0	9
3836	335	KO	0	151	0	5
3837	335	Demokracja	4	0	0	0
3838	335	PSL-TD	0	31	0	1
3839	335	Konfederacja	12	0	0	4
3840	335	Centrum	0	15	0	0
3841	335	Lewica	0	19	0	2
3842	335	Polska2050	0	13	0	2
3843	335	Konfederacja_KP	3	0	0	0
3844	335	niez.	1	6	0	0
3845	335	Razem	0	4	0	0
3846	336	PiS	1	177	0	9
3847	336	KO	0	151	0	5
3848	336	Demokracja	4	0	0	0
3849	336	PSL-TD	0	30	0	2
3850	336	Konfederacja	13	0	0	3
3851	336	Centrum	0	15	0	0
3852	336	Lewica	0	19	0	2
3853	336	Polska2050	0	11	0	4
3854	336	Konfederacja_KP	3	0	0	0
3855	336	niez.	1	6	0	0
3856	336	Razem	0	4	0	0
3857	337	PiS	0	178	0	9
3858	337	KO	153	0	0	3
3859	337	Demokracja	0	4	0	0
3860	337	PSL-TD	31	0	0	1
3861	337	Konfederacja	0	13	0	3
3862	337	Centrum	15	0	0	0
3863	337	Lewica	20	0	0	1
3864	337	Polska2050	13	0	0	2
3865	337	Konfederacja_KP	0	3	0	0
3866	337	niez.	5	2	0	0
3867	337	Razem	4	0	0	0
3868	338	PiS	2	8	143	34
3869	338	KO	5	146	0	5
3870	338	Demokracja	4	0	0	0
3871	338	PSL-TD	4	26	0	2
3872	338	Konfederacja	13	0	0	3
3873	338	Centrum	0	15	0	0
3874	338	Lewica	0	20	0	1
3875	338	Polska2050	0	13	0	2
3876	338	Konfederacja_KP	3	0	0	0
3877	338	niez.	1	5	1	0
3878	338	Razem	0	0	4	0
3879	339	PiS	0	2	172	13
3880	339	KO	149	0	0	7
3881	339	Demokracja	0	4	0	0
3882	339	PSL-TD	28	0	0	4
3883	339	Konfederacja	1	12	0	3
3884	339	Centrum	13	1	1	0
3885	339	Lewica	18	0	0	3
3886	339	Polska2050	13	0	0	2
3887	339	Konfederacja_KP	0	3	0	0
3888	339	niez.	5	1	1	0
3889	339	Razem	4	0	0	0
3890	340	PiS	175	0	1	11
3891	340	KO	153	0	0	3
3892	340	Demokracja	4	0	0	0
3893	340	PSL-TD	30	0	0	2
3894	340	Konfederacja	13	0	0	3
3895	340	Centrum	15	0	0	0
3896	340	Lewica	20	0	0	1
3897	340	Polska2050	13	0	0	2
3898	340	Konfederacja_KP	3	0	0	0
3899	340	niez.	7	0	0	0
3900	340	Razem	4	0	0	0
3901	341	PiS	2	0	173	12
3902	341	KO	153	0	0	3
3903	341	Demokracja	0	0	4	0
3904	341	PSL-TD	31	0	0	1
3905	341	Konfederacja	1	0	12	3
3906	341	Centrum	14	0	0	1
3907	341	Lewica	20	0	0	1
3908	341	Polska2050	13	0	0	2
3909	341	Konfederacja_KP	0	0	3	0
3910	341	niez.	5	0	2	0
3911	341	Razem	4	0	0	0
3912	342	PiS	178	0	0	9
3913	342	KO	152	0	0	4
3914	342	Demokracja	4	0	0	0
3915	342	PSL-TD	31	0	0	1
3916	342	Konfederacja	13	0	0	3
3917	342	Centrum	14	0	0	1
3918	342	Lewica	20	0	0	1
3919	342	Polska2050	13	0	0	2
3920	342	Konfederacja_KP	3	0	0	0
3921	342	niez.	7	0	0	0
3922	342	Razem	4	0	0	0
3923	343	PiS	171	0	6	10
3924	343	KO	0	153	0	3
3925	343	Demokracja	4	0	0	0
3926	343	PSL-TD	1	27	0	4
3927	343	Konfederacja	13	0	0	3
3928	343	Centrum	0	15	0	0
3929	343	Lewica	0	20	0	1
3930	343	Polska2050	0	13	0	2
3931	343	Konfederacja_KP	3	0	0	0
3932	343	niez.	4	3	0	0
3933	343	Razem	4	0	0	0
3934	344	PiS	0	1	176	10
3935	344	KO	153	0	0	3
3936	344	Demokracja	0	4	0	0
3937	344	PSL-TD	31	0	0	1
3938	344	Konfederacja	0	13	0	3
3939	344	Centrum	14	0	0	1
3940	344	Lewica	20	0	0	1
3941	344	Polska2050	13	0	0	2
3942	344	Konfederacja_KP	0	3	0	0
3943	344	niez.	4	1	2	0
3944	344	Razem	0	0	4	0
3945	345	PiS	174	0	1	12
3946	345	KO	0	151	0	5
3947	345	Demokracja	1	0	3	0
3948	345	PSL-TD	0	29	0	3
3949	345	Konfederacja	0	0	13	3
3950	345	Centrum	0	14	0	1
3951	345	Lewica	0	20	0	1
3952	345	Polska2050	0	13	0	2
3953	345	Konfederacja_KP	0	0	3	0
3954	345	niez.	3	3	1	0
3955	345	Razem	4	0	0	0
3956	346	PiS	179	0	0	8
3957	346	KO	151	1	0	4
3958	346	Demokracja	4	0	0	0
3959	346	PSL-TD	29	0	0	3
3960	346	Konfederacja	13	0	0	3
3961	346	Centrum	15	0	0	0
3962	346	Lewica	20	0	0	1
3963	346	Polska2050	13	0	0	2
3964	346	Konfederacja_KP	3	0	0	0
3965	346	niez.	7	0	0	0
3966	346	Razem	4	0	0	0
3967	347	PiS	172	0	0	15
3968	347	KO	0	149	0	7
3969	347	Demokracja	4	0	0	0
3970	347	PSL-TD	1	29	0	2
3971	347	Konfederacja	13	0	0	3
3972	347	Centrum	0	15	0	0
3973	347	Lewica	0	20	0	1
3974	347	Polska2050	0	13	0	2
3975	347	Konfederacja_KP	3	0	0	0
3976	347	niez.	4	3	0	0
3977	347	Razem	3	0	0	1
3978	348	PiS	178	0	0	9
3979	348	KO	153	0	0	3
3980	348	Demokracja	4	0	0	0
3981	348	PSL-TD	31	0	0	1
3982	348	Konfederacja	13	0	0	3
3983	348	Centrum	15	0	0	0
3984	348	Lewica	20	0	0	1
3985	348	Polska2050	13	0	0	2
3986	348	Konfederacja_KP	3	0	0	0
3987	348	niez.	7	0	0	0
3988	348	Razem	4	0	0	0
3989	349	PiS	179	0	0	8
3990	349	KO	153	0	0	3
3991	349	Demokracja	0	0	4	0
3992	349	PSL-TD	31	0	0	1
3993	349	Konfederacja	0	0	12	4
3994	349	Centrum	14	0	0	1
3995	349	Lewica	20	0	0	1
3996	349	Polska2050	13	0	0	2
3997	349	Konfederacja_KP	0	0	3	0
3998	349	niez.	5	0	2	0
3999	349	Razem	0	0	4	0
4000	350	PiS	172	0	0	15
4001	350	KO	0	150	0	6
4002	350	Demokracja	3	0	0	1
4003	350	PSL-TD	0	26	0	6
4004	350	Konfederacja	0	0	13	3
4005	350	Centrum	1	13	0	1
4006	350	Lewica	0	20	0	1
4007	350	Polska2050	0	11	0	4
4008	350	Konfederacja_KP	0	0	2	1
4009	350	niez.	2	4	1	0
4010	350	Razem	3	0	0	1
4011	351	PiS	177	0	0	10
4012	351	KO	1	148	0	7
4013	351	Demokracja	3	0	1	0
4014	351	PSL-TD	0	31	0	1
4015	351	Konfederacja	0	0	13	3
4016	351	Centrum	1	13	0	1
4017	351	Lewica	0	20	0	1
4018	351	Polska2050	1	12	0	2
4019	351	Konfederacja_KP	0	0	3	0
4020	351	niez.	2	5	0	0
4021	351	Razem	4	0	0	0
4022	352	PiS	1	175	0	11
4023	352	KO	2	150	0	4
4024	352	Demokracja	0	3	1	0
4025	352	PSL-TD	2	28	0	2
4026	352	Konfederacja	0	0	13	3
4027	352	Centrum	0	15	0	0
4028	352	Lewica	1	19	0	1
4029	352	Polska2050	7	4	0	4
4030	352	Konfederacja_KP	2	0	1	0
4031	352	niez.	2	5	0	0
4032	352	Razem	4	0	0	0
4033	353	PiS	176	0	0	11
4034	353	KO	0	151	0	5
4035	353	Demokracja	4	0	0	0
4036	353	PSL-TD	0	30	0	2
4037	353	Konfederacja	9	1	0	6
4038	353	Centrum	0	15	0	0
4039	353	Lewica	1	19	0	1
4040	353	Polska2050	0	13	0	2
4041	353	Konfederacja_KP	3	0	0	0
4042	353	niez.	3	4	0	0
4043	353	Razem	4	0	0	0
4044	354	PiS	175	0	0	12
4045	354	KO	152	0	0	4
4046	354	Demokracja	1	0	3	0
4047	354	PSL-TD	29	0	0	3
4048	354	Konfederacja	0	0	13	3
4049	354	Centrum	15	0	0	0
4050	354	Lewica	20	0	0	1
4051	354	Polska2050	13	0	0	2
4052	354	Konfederacja_KP	0	0	3	0
4053	354	niez.	5	1	1	0
4054	354	Razem	0	4	0	0
4055	355	PiS	176	0	1	10
4056	355	KO	153	0	0	3
4057	355	Demokracja	4	0	0	0
4058	355	PSL-TD	31	0	0	1
4059	355	Konfederacja	13	0	0	3
4060	355	Centrum	15	0	0	0
4061	355	Lewica	19	0	0	2
4062	355	Polska2050	13	0	0	2
4063	355	Konfederacja_KP	0	0	3	0
4064	355	niez.	7	0	0	0
4065	355	Razem	4	0	0	0
4066	356	PiS	2	3	174	8
4067	356	KO	153	0	0	3
4068	356	Demokracja	0	4	0	0
4069	356	PSL-TD	30	0	0	2
4070	356	Konfederacja	0	13	0	3
4071	356	Centrum	15	0	0	0
4072	356	Lewica	20	0	0	1
4073	356	Polska2050	13	0	0	2
4074	356	Konfederacja_KP	0	3	0	0
4075	356	niez.	5	1	1	0
4076	356	Razem	4	0	0	0
4077	357	PiS	178	0	0	9
4078	357	KO	0	150	0	6
4079	357	Demokracja	4	0	0	0
4080	357	PSL-TD	0	30	0	2
4081	357	Konfederacja	13	0	0	3
4082	357	Centrum	1	14	0	0
4083	357	Lewica	0	20	0	1
4084	357	Polska2050	0	13	0	2
4085	357	Konfederacja_KP	3	0	0	0
4086	357	niez.	3	4	0	0
4087	357	Razem	4	0	0	0
4088	358	PiS	178	0	0	9
4089	358	KO	0	150	0	6
4090	358	Demokracja	4	0	0	0
4091	358	PSL-TD	0	31	0	1
4092	358	Konfederacja	12	0	0	4
4093	358	Centrum	0	15	0	0
4094	358	Lewica	0	20	0	1
4095	358	Polska2050	0	13	0	2
4096	358	Konfederacja_KP	3	0	0	0
4097	358	niez.	3	4	0	0
4098	358	Razem	4	0	0	0
4099	359	PiS	170	0	0	17
4100	359	KO	0	148	0	8
4101	359	Demokracja	3	0	0	1
4102	359	PSL-TD	0	31	0	1
4103	359	Konfederacja	13	0	0	3
4104	359	Centrum	0	15	0	0
4105	359	Lewica	0	20	0	1
4106	359	Polska2050	0	13	0	2
4107	359	Konfederacja_KP	3	0	0	0
4108	359	niez.	4	3	0	0
4109	359	Razem	4	0	0	0
4110	360	PiS	177	0	0	10
4111	360	KO	151	0	0	5
4112	360	Demokracja	4	0	0	0
4113	360	PSL-TD	30	1	0	1
4114	360	Konfederacja	13	0	0	3
4115	360	Centrum	15	0	0	0
4116	360	Lewica	20	0	0	1
4117	360	Polska2050	12	0	0	3
4118	360	Konfederacja_KP	3	0	0	0
4119	360	niez.	7	0	0	0
4120	360	Razem	3	0	0	1
4121	361	PiS	176	0	0	11
4122	361	KO	0	153	0	3
4123	361	Demokracja	4	0	0	0
4124	361	PSL-TD	0	30	0	2
4125	361	Konfederacja	13	0	0	3
4126	361	Centrum	0	15	0	0
4127	361	Lewica	0	20	0	1
4128	361	Polska2050	0	13	0	2
4129	361	Konfederacja_KP	3	0	0	0
4130	361	niez.	1	5	0	1
4131	361	Razem	0	4	0	0
4132	362	PiS	2	1	171	13
4133	362	KO	151	0	0	5
4134	362	Demokracja	4	0	0	0
4135	362	PSL-TD	31	0	0	1
4136	362	Konfederacja	13	0	0	3
4137	362	Centrum	15	0	0	0
4138	362	Lewica	20	0	0	1
4139	362	Polska2050	13	0	0	2
4140	362	Konfederacja_KP	3	0	0	0
4141	362	niez.	6	0	1	0
4142	362	Razem	1	0	0	3
4143	363	PiS	178	0	0	9
4144	363	KO	1	151	0	4
4145	363	Demokracja	4	0	0	0
4146	363	PSL-TD	0	31	0	1
4147	363	Konfederacja	13	0	0	3
4148	363	Centrum	0	15	0	0
4149	363	Lewica	0	20	0	1
4150	363	Polska2050	0	13	0	2
4151	363	Konfederacja_KP	3	0	0	0
4152	363	niez.	4	3	0	0
4153	363	Razem	4	0	0	0
4154	364	PiS	4	0	173	10
4155	364	KO	153	0	0	3
4156	364	Demokracja	4	0	0	0
4157	364	PSL-TD	27	4	0	1
4158	364	Konfederacja	13	0	0	3
4159	364	Centrum	15	0	0	0
4160	364	Lewica	20	0	0	1
4161	364	Polska2050	13	0	0	2
4162	364	Konfederacja_KP	3	0	0	0
4163	364	niez.	6	0	1	0
4164	364	Razem	4	0	0	0
4165	365	PiS	2	2	162	21
4166	365	KO	149	0	0	7
4167	365	Demokracja	3	0	1	0
4168	365	PSL-TD	30	0	0	2
4169	365	Konfederacja	0	1	11	4
4170	365	Centrum	15	0	0	0
4171	365	Lewica	20	0	0	1
4172	365	Polska2050	11	1	0	3
4173	365	Konfederacja_KP	0	0	3	0
4174	365	niez.	6	0	1	0
4175	365	Razem	4	0	0	0
4176	366	PiS	177	0	0	10
4177	366	KO	0	147	0	9
4178	366	Demokracja	4	0	0	0
4179	366	PSL-TD	0	30	0	2
4180	366	Konfederacja	11	0	0	5
4181	366	Centrum	0	15	0	0
4182	366	Lewica	0	20	0	1
4183	366	Polska2050	0	13	0	2
4184	366	Konfederacja_KP	3	0	0	0
4185	366	niez.	4	3	0	0
4186	366	Razem	4	0	0	0
4187	367	PiS	175	0	0	12
4188	367	KO	153	0	0	3
4189	367	Demokracja	4	0	0	0
4190	367	PSL-TD	31	0	0	1
4191	367	Konfederacja	13	0	0	3
4192	367	Centrum	14	1	0	0
4193	367	Lewica	20	0	0	1
4194	367	Polska2050	13	0	0	2
4195	367	Konfederacja_KP	3	0	0	0
4196	367	niez.	7	0	0	0
4197	367	Razem	4	0	0	0
4198	368	PiS	1	0	178	8
4199	368	KO	151	0	0	5
4200	368	Demokracja	0	0	4	0
4201	368	PSL-TD	30	0	0	2
4202	368	Konfederacja	0	0	13	3
4203	368	Centrum	15	0	0	0
4204	368	Lewica	17	2	0	2
4205	368	Polska2050	13	0	0	2
4206	368	Konfederacja_KP	0	0	3	0
4207	368	niez.	5	0	2	0
4208	368	Razem	4	0	0	0
4209	369	PiS	1	1	165	20
4210	369	KO	3	148	0	5
4211	369	Demokracja	0	0	4	0
4212	369	PSL-TD	1	28	0	3
4213	369	Konfederacja	0	0	13	3
4214	369	Centrum	0	15	0	0
4215	369	Lewica	12	6	0	3
4216	369	Polska2050	0	13	0	2
4217	369	Konfederacja_KP	0	0	3	0
4218	369	niez.	4	1	2	0
4219	369	Razem	4	0	0	0
4220	370	PiS	170	0	1	16
4221	370	KO	149	2	0	5
4222	370	Demokracja	1	0	0	3
4223	370	PSL-TD	31	0	0	1
4224	370	Konfederacja	11	0	2	3
4225	370	Centrum	15	0	0	0
4226	370	Lewica	17	1	0	3
4227	370	Polska2050	11	0	0	4
4228	370	Konfederacja_KP	3	0	0	0
4229	370	niez.	7	0	0	0
4230	370	Razem	4	0	0	0
4231	371	PiS	177	0	2	8
4232	371	KO	152	0	0	4
4233	371	Demokracja	0	0	4	0
4234	371	PSL-TD	31	0	0	1
4235	371	Konfederacja	0	0	13	3
4236	371	Centrum	15	0	0	0
4237	371	Lewica	20	0	0	1
4238	371	Polska2050	13	0	0	2
4239	371	Konfederacja_KP	0	0	3	0
4240	371	niez.	6	0	1	0
4241	371	Razem	4	0	0	0
4242	372	PiS	1	2	176	8
4243	372	KO	151	0	0	5
4244	372	Demokracja	0	0	4	0
4245	372	PSL-TD	28	0	0	4
4246	372	Konfederacja	0	0	13	3
4247	372	Centrum	15	0	0	0
4248	372	Lewica	19	0	0	2
4249	372	Polska2050	13	0	0	2
4250	372	Konfederacja_KP	0	0	3	0
4251	372	niez.	5	0	2	0
4252	372	Razem	4	0	0	0
4253	373	PiS	0	177	0	10
4254	373	KO	3	149	0	4
4255	373	Demokracja	0	4	0	0
4256	373	PSL-TD	0	29	0	3
4257	373	Konfederacja	0	13	0	3
4258	373	Centrum	1	14	0	0
4259	373	Lewica	17	3	0	1
4260	373	Polska2050	1	12	0	2
4261	373	Konfederacja_KP	0	3	0	0
4262	373	niez.	3	4	0	0
4263	373	Razem	3	0	0	1
4264	374	PiS	175	1	0	11
4265	374	KO	153	0	0	3
4266	374	Demokracja	0	0	4	0
4267	374	PSL-TD	28	0	0	4
4268	374	Konfederacja	0	0	12	4
4269	374	Centrum	14	0	0	1
4270	374	Lewica	20	0	0	1
4271	374	Polska2050	13	0	0	2
4272	374	Konfederacja_KP	0	0	3	0
4273	374	niez.	6	0	1	0
4274	374	Razem	3	0	0	1
4275	375	PiS	0	178	0	9
4276	375	KO	3	150	0	3
4277	375	Demokracja	0	0	4	0
4278	375	PSL-TD	0	30	0	2
4279	375	Konfederacja	0	0	13	3
4280	375	Centrum	1	14	0	0
4281	375	Lewica	17	2	0	2
4282	375	Polska2050	0	11	0	4
4283	375	Konfederacja_KP	0	0	3	0
4284	375	niez.	4	2	1	0
4285	375	Razem	4	0	0	0
4286	376	PiS	1	176	0	10
4287	376	KO	6	142	0	8
4288	376	Demokracja	0	4	0	0
4289	376	PSL-TD	0	31	0	1
4290	376	Konfederacja	0	13	0	3
4291	376	Centrum	1	14	0	0
4292	376	Lewica	20	0	0	1
4293	376	Polska2050	3	10	0	2
4294	376	Konfederacja_KP	0	3	0	0
4295	376	niez.	3	4	0	0
4296	376	Razem	4	0	0	0
4297	377	PiS	177	0	0	10
4298	377	KO	152	0	0	4
4299	377	Demokracja	0	0	4	0
4300	377	PSL-TD	31	0	0	1
4301	377	Konfederacja	0	0	13	3
4302	377	Centrum	15	0	0	0
4303	377	Lewica	19	0	0	2
4304	377	Polska2050	12	0	0	3
4305	377	Konfederacja_KP	0	0	3	0
4306	377	niez.	6	0	1	0
4307	377	Razem	4	0	0	0
4308	378	PiS	177	0	0	10
4309	378	KO	150	0	0	6
4310	378	Demokracja	1	0	3	0
4311	378	PSL-TD	29	0	0	3
4312	378	Konfederacja	0	0	13	3
4313	378	Centrum	15	0	0	0
4314	378	Lewica	20	0	0	1
4315	378	Polska2050	13	0	0	2
4316	378	Konfederacja_KP	0	0	3	0
4317	378	niez.	6	0	1	0
4318	378	Razem	4	0	0	0
4319	379	PiS	2	2	167	16
4320	379	KO	152	0	0	4
4321	379	Demokracja	0	3	1	0
4322	379	PSL-TD	30	0	0	2
4323	379	Konfederacja	0	12	1	3
4324	379	Centrum	14	0	0	1
4325	379	Lewica	20	0	0	1
4326	379	Polska2050	13	0	0	2
4327	379	Konfederacja_KP	0	3	0	0
4328	379	niez.	5	1	1	0
4329	379	Razem	4	0	0	0
4330	380	PiS	177	0	0	10
4331	380	KO	153	0	0	3
4332	380	Demokracja	4	0	0	0
4333	380	PSL-TD	29	0	0	3
4334	380	Konfederacja	13	0	0	3
4335	380	Centrum	15	0	0	0
4336	380	Lewica	20	0	0	1
4337	380	Polska2050	13	0	0	2
4338	380	Konfederacja_KP	3	0	0	0
4339	380	niez.	7	0	0	0
4340	380	Razem	3	0	0	1
4341	381	PiS	178	0	0	9
4342	381	KO	152	0	0	4
4343	381	Demokracja	0	0	4	0
4344	381	PSL-TD	30	0	0	2
4345	381	Konfederacja	0	0	13	3
4346	381	Centrum	15	0	0	0
4347	381	Lewica	20	0	0	1
4348	381	Polska2050	13	0	0	2
4349	381	Konfederacja_KP	0	0	3	0
4350	381	niez.	6	0	1	0
4351	381	Razem	4	0	0	0
4352	382	PiS	0	178	0	9
4353	382	KO	153	0	0	3
4354	382	Demokracja	0	0	4	0
4355	382	PSL-TD	31	0	0	1
4356	382	Konfederacja	0	0	13	3
4357	382	Centrum	15	0	0	0
4358	382	Lewica	20	0	0	1
4359	382	Polska2050	13	0	0	2
4360	382	Konfederacja_KP	0	0	3	0
4361	382	niez.	5	1	1	0
4362	382	Razem	4	0	0	0
4363	383	PiS	117	2	59	9
4364	383	KO	153	0	0	3
4365	383	Demokracja	0	4	0	0
4366	383	PSL-TD	31	0	0	1
4367	383	Konfederacja	0	13	0	3
4368	383	Centrum	15	0	0	0
4369	383	Lewica	20	0	0	1
4370	383	Polska2050	13	0	0	2
4371	383	Konfederacja_KP	0	3	0	0
4372	383	niez.	6	1	0	0
4373	383	Razem	4	0	0	0
4374	384	PiS	176	0	0	11
4375	384	KO	152	0	0	4
4376	384	Demokracja	4	0	0	0
4377	384	PSL-TD	31	0	0	1
4378	384	Konfederacja	13	0	0	3
4379	384	Centrum	14	0	0	1
4380	384	Lewica	20	0	0	1
4381	384	Polska2050	13	0	0	2
4382	384	Konfederacja_KP	3	0	0	0
4383	384	niez.	6	0	0	1
4384	384	Razem	3	0	0	1
4385	385	PiS	4	2	159	22
4386	385	KO	149	0	0	7
4387	385	Demokracja	4	0	0	0
4388	385	PSL-TD	31	0	0	1
4389	385	Konfederacja	13	0	0	3
4390	385	Centrum	14	0	0	1
4391	385	Lewica	20	0	0	1
4392	385	Polska2050	13	0	0	2
4393	385	Konfederacja_KP	3	0	0	0
4394	385	niez.	5	0	1	1
4395	385	Razem	4	0	0	0
4396	386	PiS	172	0	2	13
4397	386	KO	153	0	0	3
4398	386	Demokracja	4	0	0	0
4399	386	PSL-TD	30	0	0	2
4400	386	Konfederacja	13	0	0	3
4401	386	Centrum	14	0	0	1
4402	386	Lewica	20	0	0	1
4403	386	Polska2050	13	0	0	2
4404	386	Konfederacja_KP	2	0	0	1
4405	386	niez.	6	0	0	1
4406	386	Razem	4	0	0	0
4407	387	PiS	179	0	0	8
4408	387	KO	151	0	0	5
4409	387	Demokracja	4	0	0	0
4410	387	PSL-TD	30	0	0	2
4411	387	Konfederacja	13	0	0	3
4412	387	Centrum	14	0	0	1
4413	387	Lewica	20	0	0	1
4414	387	Polska2050	13	0	0	2
4415	387	Konfederacja_KP	3	0	0	0
4416	387	niez.	6	0	0	1
4417	387	Razem	4	0	0	0
4418	388	PiS	168	1	0	18
4419	388	KO	146	0	0	10
4420	388	Demokracja	4	0	0	0
4421	388	PSL-TD	30	0	0	2
4422	388	Konfederacja	13	0	0	3
4423	388	Centrum	14	0	0	1
4424	388	Lewica	20	0	0	1
4425	388	Polska2050	13	0	0	2
4426	388	Konfederacja_KP	3	0	0	0
4427	388	niez.	4	0	1	2
4428	388	Razem	4	0	0	0
4429	389	PiS	9	1	157	20
4430	389	KO	149	0	0	7
4431	389	Demokracja	4	0	0	0
4432	389	PSL-TD	28	0	0	4
4433	389	Konfederacja	13	0	0	3
4434	389	Centrum	13	0	0	2
4435	389	Lewica	19	0	0	2
4436	389	Polska2050	12	0	0	3
4437	389	Konfederacja_KP	3	0	0	0
4438	389	niez.	5	0	1	1
4439	389	Razem	4	0	0	0
4440	390	PiS	174	0	0	13
4441	390	KO	152	0	0	4
4442	390	Demokracja	4	0	0	0
4443	390	PSL-TD	30	0	0	2
4444	390	Konfederacja	13	0	0	3
4445	390	Centrum	15	0	0	0
4446	390	Lewica	20	0	0	1
4447	390	Polska2050	12	0	0	3
4448	390	Konfederacja_KP	2	0	0	1
4449	390	niez.	7	0	0	0
4450	390	Razem	4	0	0	0
4451	391	PiS	175	2	0	10
4452	391	KO	151	0	0	5
4453	391	Demokracja	4	0	0	0
4454	391	PSL-TD	30	0	0	2
4455	391	Konfederacja	13	0	0	3
4456	391	Centrum	15	0	0	0
4457	391	Lewica	20	0	0	1
4458	391	Polska2050	13	0	0	2
4459	391	Konfederacja_KP	3	0	0	0
4460	391	niez.	7	0	0	0
4461	391	Razem	4	0	0	0
4462	392	PiS	177	0	0	10
4463	392	KO	153	0	0	3
4464	392	Demokracja	4	0	0	0
4465	392	PSL-TD	31	0	0	1
4466	392	Konfederacja	13	0	0	3
4467	392	Centrum	15	0	0	0
4468	392	Lewica	20	0	0	1
4469	392	Polska2050	13	0	0	2
4470	392	Konfederacja_KP	3	0	0	0
4471	392	niez.	7	0	0	0
4472	392	Razem	4	0	0	0
4473	393	PiS	172	1	0	14
4474	393	KO	153	0	0	3
4475	393	Demokracja	4	0	0	0
4476	393	PSL-TD	29	0	0	3
4477	393	Konfederacja	13	0	0	3
4478	393	Centrum	15	0	0	0
4479	393	Lewica	20	0	0	1
4480	393	Polska2050	13	0	0	2
4481	393	Konfederacja_KP	3	0	0	0
4482	393	niez.	7	0	0	0
4483	393	Razem	4	0	0	0
4484	394	PiS	177	0	0	10
4485	394	KO	144	0	0	12
4486	394	Demokracja	4	0	0	0
4487	394	PSL-TD	31	0	0	1
4488	394	Konfederacja	13	0	0	3
4489	394	Centrum	15	0	0	0
4490	394	Lewica	20	0	0	1
4491	394	Polska2050	12	0	1	2
4492	394	Konfederacja_KP	3	0	0	0
4493	394	niez.	7	0	0	0
4494	394	Razem	4	0	0	0
4495	395	PiS	178	0	0	9
4496	395	KO	151	0	0	5
4497	395	Demokracja	3	0	0	1
4498	395	PSL-TD	30	0	0	2
4499	395	Konfederacja	13	0	0	3
4500	395	Centrum	15	0	0	0
4501	395	Lewica	19	0	0	2
4502	395	Polska2050	13	0	0	2
4503	395	Konfederacja_KP	3	0	0	0
4504	395	niez.	7	0	0	0
4505	395	Razem	4	0	0	0
4506	396	PiS	0	176	0	11
4507	396	KO	152	0	0	4
4508	396	Demokracja	4	0	0	0
4509	396	PSL-TD	31	0	0	1
4510	396	Konfederacja	0	12	1	3
4511	396	Centrum	15	0	0	0
4512	396	Lewica	20	0	0	1
4513	396	Polska2050	13	0	0	2
4514	396	Konfederacja_KP	0	3	0	0
4515	396	niez.	4	3	0	0
4516	396	Razem	0	4	0	0
4517	397	PiS	178	0	1	8
4518	397	KO	0	153	0	3
4519	397	Demokracja	4	0	0	0
4520	397	PSL-TD	0	30	0	2
4521	397	Konfederacja	12	0	0	4
4522	397	Centrum	0	15	0	0
4523	397	Lewica	0	20	0	1
4524	397	Polska2050	0	13	0	2
4525	397	Konfederacja_KP	3	0	0	0
4526	397	niez.	2	5	0	0
4527	397	Razem	0	4	0	0
4528	398	PiS	3	7	167	10
4529	398	KO	0	153	0	3
4530	398	Demokracja	4	0	0	0
4531	398	PSL-TD	0	31	0	1
4532	398	Konfederacja	12	0	0	4
4533	398	Centrum	0	15	0	0
4534	398	Lewica	0	20	0	1
4535	398	Polska2050	0	12	0	3
4536	398	Konfederacja_KP	3	0	0	0
4537	398	niez.	1	4	2	0
4538	398	Razem	0	0	4	0
4539	399	PiS	0	178	0	9
4540	399	KO	153	0	0	3
4541	399	Demokracja	0	4	0	0
4542	399	PSL-TD	31	0	0	1
4543	399	Konfederacja	0	12	0	4
4544	399	Centrum	15	0	0	0
4545	399	Lewica	20	0	0	1
4546	399	Polska2050	13	0	0	2
4547	399	Konfederacja_KP	0	3	0	0
4548	399	niez.	5	2	0	0
4549	399	Razem	4	0	0	0
4550	400	PiS	2	173	0	12
4551	400	KO	151	0	0	5
4552	400	Demokracja	0	4	0	0
4553	400	PSL-TD	31	0	0	1
4554	400	Konfederacja	10	3	0	3
4555	400	Centrum	15	0	0	0
4556	400	Lewica	20	0	0	1
4557	400	Polska2050	13	0	0	2
4558	400	Konfederacja_KP	0	3	0	0
4559	400	niez.	5	2	0	0
4560	400	Razem	4	0	0	0
4561	401	PiS	0	134	0	53
4562	401	KO	142	0	0	14
4563	401	Demokracja	0	3	0	1
4564	401	PSL-TD	30	0	0	2
4565	401	Konfederacja	0	13	0	3
4566	401	Centrum	15	0	0	0
4567	401	Lewica	17	0	0	4
4568	401	Polska2050	13	0	0	2
4569	401	Konfederacja_KP	0	3	0	0
4570	401	niez.	5	2	0	0
4571	401	Razem	4	0	0	0
4572	402	PiS	0	177	0	10
4573	402	KO	151	0	0	5
4574	402	Demokracja	0	4	0	0
4575	402	PSL-TD	30	0	0	2
4576	402	Konfederacja	0	13	0	3
4577	402	Centrum	15	0	0	0
4578	402	Lewica	19	0	0	2
4579	402	Polska2050	13	0	0	2
4580	402	Konfederacja_KP	0	3	0	0
4581	402	niez.	5	2	0	0
4582	402	Razem	4	0	0	0
4583	403	PiS	163	1	10	13
4584	403	KO	0	152	0	4
4585	403	Demokracja	0	4	0	0
4586	403	PSL-TD	0	30	0	2
4587	403	Konfederacja	1	12	0	3
4588	403	Centrum	0	15	0	0
4589	403	Lewica	0	20	0	1
4590	403	Polska2050	0	13	0	2
4591	403	Konfederacja_KP	0	3	0	0
4592	403	niez.	1	5	0	1
4593	403	Razem	0	4	0	0
4594	404	PiS	178	0	0	9
4595	404	KO	152	0	0	4
4596	404	Demokracja	4	0	0	0
4597	404	PSL-TD	30	0	0	2
4598	404	Konfederacja	13	0	0	3
4599	404	Centrum	15	0	0	0
4600	404	Lewica	20	0	0	1
4601	404	Polska2050	13	0	0	2
4602	404	Konfederacja_KP	3	0	0	0
4603	404	niez.	7	0	0	0
4604	404	Razem	4	0	0	0
4605	405	PiS	178	0	0	9
4606	405	KO	1	152	0	3
4607	405	Demokracja	4	0	0	0
4608	405	PSL-TD	2	29	0	1
4609	405	Konfederacja	13	0	0	3
4610	405	Centrum	4	11	0	0
4611	405	Lewica	0	20	0	1
4612	405	Polska2050	0	13	0	2
4613	405	Konfederacja_KP	3	0	0	0
4614	405	niez.	3	4	0	0
4615	405	Razem	4	0	0	0
4616	406	PiS	178	0	0	9
4617	406	KO	153	0	0	3
4618	406	Demokracja	4	0	0	0
4619	406	PSL-TD	31	0	0	1
4620	406	Konfederacja	13	0	0	3
4621	406	Centrum	15	0	0	0
4622	406	Lewica	20	0	0	1
4623	406	Polska2050	13	0	0	2
4624	406	Konfederacja_KP	3	0	0	0
4625	406	niez.	7	0	0	0
4626	406	Razem	4	0	0	0
4627	407	PiS	177	0	0	10
4628	407	KO	152	0	0	4
4629	407	Demokracja	0	0	4	0
4630	407	PSL-TD	31	0	0	1
4631	407	Konfederacja	0	0	13	3
4632	407	Centrum	14	0	0	1
4633	407	Lewica	20	0	0	1
4634	407	Polska2050	13	0	0	2
4635	407	Konfederacja_KP	0	0	3	0
4636	407	niez.	6	0	1	0
4637	407	Razem	4	0	0	0
4638	408	PiS	178	0	0	9
4639	408	KO	1	150	0	5
4640	408	Demokracja	0	4	0	0
4641	408	PSL-TD	0	31	0	1
4642	408	Konfederacja	0	13	0	3
4643	408	Centrum	0	15	0	0
4644	408	Lewica	0	20	0	1
4645	408	Polska2050	0	13	0	2
4646	408	Konfederacja_KP	0	3	0	0
4647	408	niez.	1	6	0	0
4648	408	Razem	0	4	0	0
4649	409	PiS	173	4	0	10
4650	409	KO	2	150	0	4
4651	409	Demokracja	0	4	0	0
4652	409	PSL-TD	0	31	0	1
4653	409	Konfederacja	0	13	0	3
4654	409	Centrum	0	15	0	0
4655	409	Lewica	2	17	0	2
4656	409	Polska2050	0	13	0	2
4657	409	Konfederacja_KP	0	3	0	0
4658	409	niez.	1	6	0	0
4659	409	Razem	0	4	0	0
4660	410	PiS	178	0	0	9
4661	410	KO	153	0	0	3
4662	410	Demokracja	0	0	4	0
4663	410	PSL-TD	30	0	0	2
4664	410	Konfederacja	0	0	13	3
4665	410	Centrum	15	0	0	0
4666	410	Lewica	20	0	0	1
4667	410	Polska2050	13	0	0	2
4668	410	Konfederacja_KP	0	0	3	0
4669	410	niez.	6	0	1	0
4670	410	Razem	4	0	0	0
4671	411	PiS	176	0	0	11
4672	411	KO	152	0	0	4
4673	411	Demokracja	0	0	4	0
4674	411	PSL-TD	30	0	0	2
4675	411	Konfederacja	0	0	12	4
4676	411	Centrum	15	0	0	0
4677	411	Lewica	19	0	0	2
4678	411	Polska2050	13	0	0	2
4679	411	Konfederacja_KP	0	0	3	0
4680	411	niez.	6	0	1	0
4681	411	Razem	4	0	0	0
4682	412	PiS	177	0	0	10
4683	412	KO	153	0	0	3
4684	412	Demokracja	4	0	0	0
4685	412	PSL-TD	30	0	0	2
4686	412	Konfederacja	13	0	0	3
4687	412	Centrum	15	0	0	0
4688	412	Lewica	19	0	0	2
4689	412	Polska2050	13	0	0	2
4690	412	Konfederacja_KP	3	0	0	0
4691	412	niez.	7	0	0	0
4692	412	Razem	4	0	0	0
4693	413	PiS	19	1	157	10
4694	413	KO	152	0	0	4
4695	413	Demokracja	4	0	0	0
4696	413	PSL-TD	31	0	0	1
4697	413	Konfederacja	13	0	0	3
4698	413	Centrum	15	0	0	0
4699	413	Lewica	20	0	0	1
4700	413	Polska2050	13	0	0	2
4701	413	Konfederacja_KP	3	0	0	0
4702	413	niez.	5	0	2	0
4703	413	Razem	0	0	4	0
4704	414	PiS	4	1	172	10
4705	414	KO	0	151	0	5
4706	414	Demokracja	0	0	4	0
4707	414	PSL-TD	0	31	0	1
4708	414	Konfederacja	0	0	13	3
4709	414	Centrum	1	14	0	0
4710	414	Lewica	0	20	0	1
4711	414	Polska2050	0	13	0	2
4712	414	Konfederacja_KP	0	0	3	0
4713	414	niez.	0	5	2	0
4714	414	Razem	0	4	0	0
4715	415	PiS	1	0	177	9
4716	415	KO	0	152	0	4
4717	415	Demokracja	0	0	4	0
4718	415	PSL-TD	0	30	0	2
4719	415	Konfederacja	0	0	13	3
4720	415	Centrum	0	15	0	0
4721	415	Lewica	0	20	0	1
4722	415	Polska2050	0	13	0	2
4723	415	Konfederacja_KP	0	0	3	0
4724	415	niez.	0	5	2	0
4725	415	Razem	0	4	0	0
4726	416	PiS	1	2	174	10
4727	416	KO	0	153	0	3
4728	416	Demokracja	0	0	4	0
4729	416	PSL-TD	0	30	0	2
4730	416	Konfederacja	1	0	11	4
4731	416	Centrum	0	15	0	0
4732	416	Lewica	0	20	0	1
4733	416	Polska2050	0	13	0	2
4734	416	Konfederacja_KP	0	0	3	0
4735	416	niez.	0	5	2	0
4736	416	Razem	0	4	0	0
4737	417	PiS	171	3	2	11
4738	417	KO	0	150	0	6
4739	417	Demokracja	0	0	4	0
4740	417	PSL-TD	0	28	0	4
4741	417	Konfederacja	0	0	12	4
4742	417	Centrum	0	15	0	0
4743	417	Lewica	0	20	0	1
4744	417	Polska2050	0	13	0	2
4745	417	Konfederacja_KP	0	0	3	0
4746	417	niez.	1	5	1	0
4747	417	Razem	0	4	0	0
4748	418	PiS	1	2	168	16
4749	418	KO	0	152	0	4
4750	418	Demokracja	0	0	4	0
4751	418	PSL-TD	0	29	0	3
4752	418	Konfederacja	0	0	13	3
4753	418	Centrum	0	15	0	0
4754	418	Lewica	0	20	0	1
4755	418	Polska2050	0	12	0	3
4756	418	Konfederacja_KP	0	0	3	0
4757	418	niez.	0	5	2	0
4758	418	Razem	0	4	0	0
4759	419	PiS	1	173	0	13
4760	419	KO	0	151	0	5
4761	419	Demokracja	0	4	0	0
4762	419	PSL-TD	0	29	0	3
4763	419	Konfederacja	0	13	0	3
4764	419	Centrum	0	15	0	0
4765	419	Lewica	0	19	0	2
4766	419	Polska2050	0	13	0	2
4767	419	Konfederacja_KP	0	3	0	0
4768	419	niez.	0	6	1	0
4769	419	Razem	0	4	0	0
4770	420	PiS	0	0	174	13
4771	420	KO	0	153	0	3
4772	420	Demokracja	0	0	4	0
4773	420	PSL-TD	0	31	0	1
4774	420	Konfederacja	0	0	12	4
4775	420	Centrum	0	14	0	1
4776	420	Lewica	0	20	0	1
4777	420	Polska2050	0	13	0	2
4778	420	Konfederacja_KP	0	0	2	1
4779	420	niez.	0	5	2	0
4780	420	Razem	0	4	0	0
4781	421	PiS	1	1	171	14
4782	421	KO	0	153	0	3
4783	421	Demokracja	4	0	0	0
4784	421	PSL-TD	0	28	0	4
4785	421	Konfederacja	13	0	0	3
4786	421	Centrum	0	15	0	0
4787	421	Lewica	0	20	0	1
4788	421	Polska2050	0	13	0	2
4789	421	Konfederacja_KP	3	0	0	0
4790	421	niez.	1	5	1	0
4791	421	Razem	0	4	0	0
4792	422	PiS	0	0	169	18
4793	422	KO	0	150	0	6
4794	422	Demokracja	4	0	0	0
4795	422	PSL-TD	0	30	0	2
4796	422	Konfederacja	12	0	0	4
4797	422	Centrum	0	15	0	0
4798	422	Lewica	0	20	0	1
4799	422	Polska2050	0	13	0	2
4800	422	Konfederacja_KP	2	0	0	1
4801	422	niez.	1	5	1	0
4802	422	Razem	0	4	0	0
4803	423	PiS	1	1	174	11
4804	423	KO	0	151	0	5
4805	423	Demokracja	4	0	0	0
4806	423	PSL-TD	0	31	0	1
4807	423	Konfederacja	13	0	0	3
4808	423	Centrum	0	15	0	0
4809	423	Lewica	0	20	0	1
4810	423	Polska2050	0	13	0	2
4811	423	Konfederacja_KP	3	0	0	0
4812	423	niez.	1	5	1	0
4813	423	Razem	0	4	0	0
4814	424	PiS	1	1	174	11
4815	424	KO	0	152	0	4
4816	424	Demokracja	4	0	0	0
4817	424	PSL-TD	0	31	0	1
4818	424	Konfederacja	13	0	0	3
4819	424	Centrum	0	15	0	0
4820	424	Lewica	0	20	0	1
4821	424	Polska2050	0	13	0	2
4822	424	Konfederacja_KP	3	0	0	0
4823	424	niez.	1	5	1	0
4824	424	Razem	0	4	0	0
4825	425	PiS	2	0	171	14
4826	425	KO	1	151	0	4
4827	425	Demokracja	4	0	0	0
4828	425	PSL-TD	0	31	0	1
4829	425	Konfederacja	13	0	0	3
4830	425	Centrum	0	15	0	0
4831	425	Lewica	0	20	0	1
4832	425	Polska2050	0	13	0	2
4833	425	Konfederacja_KP	3	0	0	0
4834	425	niez.	1	5	1	0
4835	425	Razem	0	4	0	0
4836	426	PiS	2	1	173	11
4837	426	KO	1	151	0	4
4838	426	Demokracja	4	0	0	0
4839	426	PSL-TD	0	31	0	1
4840	426	Konfederacja	11	0	1	4
4841	426	Centrum	0	15	0	0
4842	426	Lewica	1	19	0	1
4843	426	Polska2050	0	13	0	2
4844	426	Konfederacja_KP	3	0	0	0
4845	426	niez.	1	5	1	0
4846	426	Razem	0	4	0	0
4847	427	PiS	1	0	174	12
4848	427	KO	0	153	0	3
4849	427	Demokracja	0	0	4	0
4850	427	PSL-TD	0	31	0	1
4851	427	Konfederacja	0	0	13	3
4852	427	Centrum	0	15	0	0
4853	427	Lewica	0	19	0	2
4854	427	Polska2050	0	13	0	2
4855	427	Konfederacja_KP	0	0	3	0
4856	427	niez.	1	5	1	0
4857	427	Razem	0	4	0	0
4858	428	PiS	0	0	178	9
4859	428	KO	0	153	0	3
4860	428	Demokracja	4	0	0	0
4861	428	PSL-TD	2	28	0	2
4862	428	Konfederacja	13	0	0	3
4863	428	Centrum	0	15	0	0
4864	428	Lewica	0	20	0	1
4865	428	Polska2050	0	12	0	3
4866	428	Konfederacja_KP	3	0	0	0
4867	428	niez.	1	5	1	0
4868	428	Razem	0	4	0	0
4869	429	PiS	0	0	177	10
4870	429	KO	0	153	0	3
4871	429	Demokracja	0	0	4	0
4872	429	PSL-TD	0	31	0	1
4873	429	Konfederacja	0	0	13	3
4874	429	Centrum	0	13	0	2
4875	429	Lewica	0	19	0	2
4876	429	Polska2050	0	13	0	2
4877	429	Konfederacja_KP	0	0	3	0
4878	429	niez.	0	5	2	0
4879	429	Razem	0	4	0	0
4880	430	PiS	0	0	173	14
4881	430	KO	0	151	0	5
4882	430	Demokracja	0	0	3	1
4883	430	PSL-TD	0	30	0	2
4884	430	Konfederacja	0	0	13	3
4885	430	Centrum	0	15	0	0
4886	430	Lewica	0	19	0	2
4887	430	Polska2050	0	13	0	2
4888	430	Konfederacja_KP	0	0	3	0
4889	430	niez.	0	5	2	0
4890	430	Razem	0	4	0	0
4891	431	PiS	1	0	174	12
4892	431	KO	0	153	0	3
4893	431	Demokracja	0	0	3	1
4894	431	PSL-TD	0	31	0	1
4895	431	Konfederacja	0	0	13	3
4896	431	Centrum	0	14	0	1
4897	431	Lewica	0	20	0	1
4898	431	Polska2050	0	13	0	2
4899	431	Konfederacja_KP	0	0	3	0
4900	431	niez.	0	4	2	1
4901	431	Razem	0	4	0	0
4902	432	PiS	0	0	177	10
4903	432	KO	0	152	0	4
4904	432	Demokracja	0	0	3	1
4905	432	PSL-TD	0	29	0	3
4906	432	Konfederacja	0	0	12	4
4907	432	Centrum	0	15	0	0
4908	432	Lewica	0	20	0	1
4909	432	Polska2050	0	13	0	2
4910	432	Konfederacja_KP	0	0	3	0
4911	432	niez.	0	5	2	0
4912	432	Razem	0	4	0	0
4913	433	PiS	0	2	173	12
4914	433	KO	0	153	0	3
4915	433	Demokracja	0	0	3	1
4916	433	PSL-TD	0	31	0	1
4917	433	Konfederacja	0	0	13	3
4918	433	Centrum	0	15	0	0
4919	433	Lewica	0	19	0	2
4920	433	Polska2050	0	13	0	2
4921	433	Konfederacja_KP	0	0	3	0
4922	433	niez.	0	5	2	0
4923	433	Razem	0	4	0	0
4924	434	PiS	0	169	6	12
4925	434	KO	0	152	0	4
4926	434	Demokracja	0	3	0	1
4927	434	PSL-TD	0	31	0	1
4928	434	Konfederacja	0	13	0	3
4929	434	Centrum	0	15	0	0
4930	434	Lewica	0	19	0	2
4931	434	Polska2050	0	12	0	3
4932	434	Konfederacja_KP	0	3	0	0
4933	434	niez.	1	6	0	0
4934	434	Razem	0	4	0	0
4935	435	PiS	2	0	172	13
4936	435	KO	0	153	0	3
4937	435	Demokracja	0	0	3	1
4938	435	PSL-TD	0	31	0	1
4939	435	Konfederacja	0	0	13	3
4940	435	Centrum	0	15	0	0
4941	435	Lewica	0	20	0	1
4942	435	Polska2050	0	13	0	2
4943	435	Konfederacja_KP	0	0	3	0
4944	435	niez.	0	5	2	0
4945	435	Razem	0	4	0	0
4946	436	PiS	0	175	1	11
4947	436	KO	3	149	0	4
4948	436	Demokracja	0	3	0	1
4949	436	PSL-TD	0	31	0	1
4950	436	Konfederacja	0	13	0	3
4951	436	Centrum	0	15	0	0
4952	436	Lewica	19	1	0	1
4953	436	Polska2050	0	13	0	2
4954	436	Konfederacja_KP	0	3	0	0
4955	436	niez.	2	5	0	0
4956	436	Razem	4	0	0	0
4957	437	PiS	0	176	0	11
4958	437	KO	3	149	0	4
4959	437	Demokracja	0	3	0	1
4960	437	PSL-TD	0	31	0	1
4961	437	Konfederacja	0	13	0	3
4962	437	Centrum	0	15	0	0
4963	437	Lewica	19	1	0	1
4964	437	Polska2050	0	12	1	2
4965	437	Konfederacja_KP	0	3	0	0
4966	437	niez.	2	5	0	0
4967	437	Razem	4	0	0	0
4968	438	PiS	0	0	0	187
4969	438	KO	153	0	0	3
4970	438	Demokracja	1	2	0	1
4971	438	PSL-TD	31	0	0	1
4972	438	Konfederacja	0	12	0	4
4973	438	Centrum	15	0	0	0
4974	438	Lewica	20	0	0	1
4975	438	Polska2050	13	0	0	2
4976	438	Konfederacja_KP	0	3	0	0
4977	438	niez.	2	1	1	3
4978	438	Razem	0	0	4	0
4979	439	PiS	2	136	1	48
4980	439	KO	146	0	2	8
4981	439	Demokracja	3	0	0	1
4982	439	PSL-TD	28	1	0	3
4983	439	Konfederacja	11	0	0	5
4984	439	Centrum	15	0	0	0
4985	439	Lewica	20	0	0	1
4986	439	Polska2050	12	0	0	3
4987	439	Konfederacja_KP	3	0	0	0
4988	439	niez.	6	0	1	0
4989	439	Razem	4	0	0	0
4990	440	PiS	0	176	0	10
4991	440	KO	149	2	0	5
4992	440	Demokracja	0	3	0	1
4993	440	PSL-TD	0	30	0	2
4994	440	Konfederacja	0	12	0	4
4995	440	Centrum	1	14	0	0
4996	440	Lewica	20	0	0	1
4997	440	Polska2050	7	5	0	3
4998	440	Konfederacja_KP	0	3	0	0
4999	440	niez.	2	5	0	1
5000	440	Razem	4	0	0	0
5001	441	PiS	177	1	0	8
5002	441	KO	152	0	0	4
5003	441	Demokracja	0	0	3	1
5004	441	PSL-TD	31	0	0	1
5005	441	Konfederacja	1	0	11	4
5006	441	Centrum	15	0	0	0
5007	441	Lewica	20	0	0	1
5008	441	Polska2050	13	0	0	2
5009	441	Konfederacja_KP	0	0	3	0
5010	441	niez.	6	0	1	1
5011	441	Razem	4	0	0	0
5012	442	PiS	0	178	0	8
5013	442	KO	151	0	0	5
5014	442	Demokracja	0	3	0	1
5015	442	PSL-TD	31	0	0	1
5016	442	Konfederacja	1	11	0	4
5017	442	Centrum	15	0	0	0
5018	442	Lewica	20	0	0	1
5019	442	Polska2050	13	0	0	2
5020	442	Konfederacja_KP	0	3	0	0
5021	442	niez.	4	3	0	1
5022	442	Razem	4	0	0	0
5023	443	PiS	0	178	0	8
5024	443	KO	151	0	0	5
5025	443	Demokracja	0	3	0	1
5026	443	PSL-TD	31	0	0	1
5027	443	Konfederacja	0	11	0	5
5028	443	Centrum	15	0	0	0
5029	443	Lewica	20	0	0	1
5030	443	Polska2050	14	0	0	1
5031	443	Konfederacja_KP	0	3	0	0
5032	443	niez.	5	2	0	1
5033	443	Razem	4	0	0	0
5034	444	PiS	1	176	0	9
5035	444	KO	150	1	0	5
5036	444	Demokracja	0	3	0	1
5037	444	PSL-TD	30	1	0	1
5038	444	Konfederacja	0	12	0	4
5039	444	Centrum	14	1	0	0
5040	444	Lewica	20	0	0	1
5041	444	Polska2050	13	1	0	1
5042	444	Konfederacja_KP	0	3	0	0
5043	444	niez.	4	2	1	1
5044	444	Razem	0	0	4	0
5045	445	PiS	161	12	4	9
5046	445	KO	0	152	0	4
5047	445	Demokracja	3	0	0	1
5048	445	PSL-TD	2	28	0	2
5049	445	Konfederacja	11	0	1	4
5050	445	Centrum	0	15	0	0
5051	445	Lewica	0	20	0	1
5052	445	Polska2050	0	14	0	1
5053	445	Konfederacja_KP	3	0	0	0
5054	445	niez.	1	6	0	1
5055	445	Razem	0	1	3	0
5056	446	PiS	0	0	0	186
5057	446	KO	0	0	0	156
5058	446	Demokracja	0	0	0	4
5059	446	PSL-TD	0	0	0	32
5060	446	Konfederacja	0	0	0	16
5061	446	Centrum	0	0	0	15
5062	446	Lewica	0	0	0	21
5063	446	Polska2050	0	0	0	15
5064	446	Konfederacja_KP	0	0	0	3
5065	446	niez.	0	0	0	8
5066	446	Razem	0	0	0	4
5067	447	PiS	0	140	0	7
5068	447	KO	153	0	0	3
5069	447	Demokracja	0	2	0	2
5070	447	RozwojPlus	0	37	0	3
5071	447	PSL-TD	30	1	0	1
5072	447	Konfederacja	0	14	0	2
5073	447	Centrum	14	0	0	1
5074	447	Lewica	20	0	0	1
5075	447	Polska2050	14	0	0	1
5076	447	Konfederacja_KP	0	3	0	0
5077	447	niez.	5	2	0	0
5078	447	Razem	4	0	0	0
5079	448	PiS	140	0	0	7
5080	448	KO	154	0	0	2
5081	448	Demokracja	2	0	0	2
5082	448	RozwojPlus	37	1	0	2
5083	448	PSL-TD	31	0	0	1
5084	448	Konfederacja	11	2	0	3
5085	448	Centrum	15	0	0	0
5086	448	Lewica	21	0	0	0
5087	448	Polska2050	14	0	0	1
5088	448	Konfederacja_KP	3	0	0	0
5089	448	niez.	7	0	0	0
5090	448	Razem	4	0	0	0
5091	449	PiS	0	141	0	6
5092	449	KO	155	0	0	1
5093	449	Demokracja	0	2	0	2
5094	449	RozwojPlus	0	38	0	2
5095	449	PSL-TD	31	0	0	1
5096	449	Konfederacja	0	11	3	2
5097	449	Centrum	15	0	0	0
5098	449	Lewica	21	0	0	0
5099	449	Polska2050	12	0	0	3
5100	449	Konfederacja_KP	0	0	3	0
5101	449	niez.	4	2	1	0
5102	449	Razem	0	4	0	0
5103	450	PiS	141	0	0	6
5104	450	KO	155	0	0	1
5105	450	Demokracja	2	0	0	2
5106	450	RozwojPlus	37	1	0	2
5107	450	PSL-TD	32	0	0	0
5108	450	Konfederacja	14	0	0	2
5109	450	Centrum	15	0	0	0
5110	450	Lewica	21	0	0	0
5111	450	Polska2050	14	0	0	1
5112	450	Konfederacja_KP	3	0	0	0
5113	450	niez.	7	0	0	0
5114	450	Razem	4	0	0	0
5115	451	PiS	141	0	0	6
5116	451	KO	0	155	0	1
5117	451	Demokracja	3	0	0	1
5118	451	RozwojPlus	36	1	0	3
5119	451	PSL-TD	0	32	0	0
5120	451	Konfederacja	12	0	2	2
5121	451	Centrum	0	15	0	0
5122	451	Lewica	0	21	0	0
5123	451	Polska2050	0	14	0	1
5124	451	Konfederacja_KP	3	0	0	0
5125	451	niez.	3	4	0	0
5126	451	Razem	4	0	0	0
5127	452	PiS	0	0	0	147
5128	452	KO	0	0	0	156
5129	452	Demokracja	0	0	0	4
5130	452	RozwojPlus	0	0	0	40
5131	452	PSL-TD	0	0	0	32
5132	452	Konfederacja	0	0	0	16
5133	452	Centrum	0	0	0	15
5134	452	Lewica	0	0	0	21
5135	452	Polska2050	0	0	0	15
5136	452	Konfederacja_KP	0	0	0	3
5137	452	niez.	0	0	0	7
5138	452	Razem	0	0	0	4
5139	453	PiS	125	0	0	22
5140	453	KO	0	151	0	5
5141	453	Demokracja	3	0	0	1
5142	453	RozwojPlus	33	0	0	7
5143	453	PSL-TD	1	28	0	3
5144	453	Konfederacja	12	0	0	4
5145	453	Centrum	0	11	0	4
5146	453	Lewica	0	20	0	1
5147	453	Polska2050	0	13	0	2
5148	453	Konfederacja_KP	3	0	0	0
5149	453	niez.	1	5	0	1
5150	453	Razem	0	4	0	0
5151	454	PiS	136	0	0	11
5152	454	KO	0	155	0	1
5153	454	Demokracja	3	0	0	1
5154	454	RozwojPlus	33	0	0	7
5155	454	PSL-TD	0	31	0	1
5156	454	Konfederacja	13	0	1	2
5157	454	Centrum	0	15	0	0
5158	454	Lewica	0	20	0	1
5159	454	Polska2050	0	14	0	1
5160	454	Konfederacja_KP	3	0	0	0
5161	454	niez.	2	5	0	0
5162	454	Razem	0	4	0	0
5163	455	PiS	0	136	1	10
5164	455	KO	155	0	0	1
5165	455	Demokracja	3	0	0	1
5166	455	RozwojPlus	0	38	0	2
5167	455	PSL-TD	32	0	0	0
5168	455	Konfederacja	14	0	0	2
5169	455	Centrum	15	0	0	0
5170	455	Lewica	20	0	0	1
5171	455	Polska2050	14	0	0	1
5172	455	Konfederacja_KP	3	0	0	0
5173	455	niez.	6	1	0	0
5174	455	Razem	4	0	0	0
5175	456	PiS	0	0	139	8
5176	456	KO	0	155	0	1
5177	456	Demokracja	0	0	3	1
5178	456	RozwojPlus	1	0	36	3
5179	456	PSL-TD	0	31	0	1
5180	456	Konfederacja	1	0	13	2
5181	456	Centrum	0	15	0	0
5182	456	Lewica	0	21	0	0
5183	456	Polska2050	0	14	0	1
5184	456	Konfederacja_KP	0	0	2	1
5185	456	niez.	1	3	3	0
5186	456	Razem	4	0	0	0
5187	457	PiS	0	1	138	8
5188	457	KO	154	0	0	2
5189	457	Demokracja	3	0	0	1
5190	457	RozwojPlus	3	0	34	3
5191	457	PSL-TD	32	0	0	0
5192	457	Konfederacja	14	0	0	2
5193	457	Centrum	15	0	0	0
5194	457	Lewica	21	0	0	0
5195	457	Polska2050	14	0	0	1
5196	457	Konfederacja_KP	0	0	3	0
5197	457	niez.	4	0	1	2
5198	457	Razem	4	0	0	0
5199	458	PiS	9	0	125	13
5200	458	KO	153	0	0	3
5201	458	Demokracja	1	0	1	2
5202	458	RozwojPlus	8	0	26	6
5203	458	PSL-TD	31	0	0	1
5204	458	Konfederacja	0	0	13	3
5205	458	Centrum	15	0	0	0
5206	458	Lewica	20	0	0	1
5207	458	Polska2050	14	0	0	1
5208	458	Konfederacja_KP	0	0	3	0
5209	458	niez.	5	0	2	0
5210	458	Razem	4	0	0	0
5211	459	PiS	0	0	137	10
5212	459	KO	155	0	0	1
5213	459	Demokracja	0	0	3	1
5214	459	RozwojPlus	3	0	35	2
5215	459	PSL-TD	29	0	0	3
5216	459	Konfederacja	0	0	14	2
5217	459	Centrum	15	0	0	0
5218	459	Lewica	21	0	0	0
5219	459	Polska2050	14	0	0	1
5220	459	Konfederacja_KP	0	0	3	0
5221	459	niez.	5	0	2	0
5222	459	Razem	4	0	0	0
5223	460	PiS	1	0	135	11
5224	460	KO	155	0	0	1
5225	460	Demokracja	0	0	3	1
5226	460	RozwojPlus	3	0	35	2
5227	460	PSL-TD	32	0	0	0
5228	460	Konfederacja	0	0	14	2
5229	460	Centrum	15	0	0	0
5230	460	Lewica	21	0	0	0
5231	460	Polska2050	14	0	0	1
5232	460	Konfederacja_KP	0	0	3	0
5233	460	niez.	5	0	2	0
5234	460	Razem	4	0	0	0
5235	461	PiS	137	0	0	10
5236	461	KO	150	1	0	5
5237	461	Demokracja	0	3	0	1
5238	461	RozwojPlus	37	1	0	2
5239	461	PSL-TD	31	0	0	1
5240	461	Konfederacja	0	12	0	4
5241	461	Centrum	15	0	0	0
5242	461	Lewica	21	0	0	0
5243	461	Polska2050	1	11	0	3
5244	461	Konfederacja_KP	0	3	0	0
5245	461	niez.	6	1	0	0
5246	461	Razem	4	0	0	0
5247	462	PiS	137	0	2	8
5248	462	KO	0	154	0	2
5249	462	Demokracja	0	0	3	1
5250	462	RozwojPlus	37	0	1	2
5251	462	PSL-TD	0	30	0	2
5252	462	Konfederacja	5	0	8	3
5253	462	Centrum	0	15	0	0
5254	462	Lewica	0	21	0	0
5255	462	Polska2050	0	14	0	1
5256	462	Konfederacja_KP	0	0	3	0
5257	462	niez.	2	4	1	0
5258	462	Razem	4	0	0	0
5259	463	PiS	138	1	0	8
5260	463	KO	154	1	0	1
5261	463	Demokracja	3	0	0	1
5262	463	RozwojPlus	38	0	0	2
5263	463	PSL-TD	32	0	0	0
5264	463	Konfederacja	13	0	0	3
5265	463	Centrum	14	0	0	1
5266	463	Lewica	21	0	0	0
5267	463	Polska2050	9	5	0	1
5268	463	Konfederacja_KP	3	0	0	0
5269	463	niez.	7	0	0	0
5270	463	Razem	4	0	0	0
5271	464	PiS	141	0	0	6
5272	464	KO	155	0	0	1
5273	464	Demokracja	0	0	3	1
5274	464	RozwojPlus	36	0	1	3
5275	464	PSL-TD	32	0	0	0
5276	464	Konfederacja	1	0	13	2
5277	464	Centrum	15	0	0	0
5278	464	Lewica	20	0	0	1
5279	464	Polska2050	13	0	1	1
5280	464	Konfederacja_KP	0	0	3	0
5281	464	niez.	6	0	1	0
5282	464	Razem	4	0	0	0
5283	465	PiS	137	0	1	9
5284	465	KO	152	1	0	3
5285	465	Demokracja	2	0	1	1
5286	465	RozwojPlus	35	0	0	5
5287	465	PSL-TD	32	0	0	0
5288	465	Konfederacja	1	0	13	2
5289	465	Centrum	15	0	0	0
5290	465	Lewica	20	0	0	1
5291	465	Polska2050	13	0	0	2
5292	465	Konfederacja_KP	0	0	3	0
5293	465	niez.	6	0	1	0
5294	465	Razem	4	0	0	0
5295	466	PiS	138	0	0	9
5296	466	KO	154	0	0	2
5297	466	Demokracja	2	0	1	1
5298	466	RozwojPlus	36	0	1	3
5299	466	PSL-TD	31	0	0	1
5300	466	Konfederacja	0	0	12	4
5301	466	Centrum	15	0	0	0
5302	466	Lewica	21	0	0	0
5303	466	Polska2050	14	0	0	1
5304	466	Konfederacja_KP	0	0	3	0
5305	466	niez.	6	0	1	0
5306	466	Razem	1	0	0	3
5307	467	PiS	142	0	0	5
5308	467	KO	155	0	0	1
5309	467	Demokracja	3	0	0	1
5310	467	RozwojPlus	38	0	0	2
5311	467	PSL-TD	32	0	0	0
5312	467	Konfederacja	12	0	1	3
5313	467	Centrum	15	0	0	0
5314	467	Lewica	21	0	0	0
5315	467	Polska2050	14	0	0	1
5316	467	Konfederacja_KP	3	0	0	0
5317	467	niez.	7	0	0	0
5318	467	Razem	4	0	0	0
5319	468	PiS	139	0	1	7
5320	468	KO	153	0	0	3
5321	468	Demokracja	2	0	1	1
5322	468	RozwojPlus	35	1	1	3
5323	468	PSL-TD	32	0	0	0
5324	468	Konfederacja	0	0	14	2
5325	468	Centrum	15	0	0	0
5326	468	Lewica	21	0	0	0
5327	468	Polska2050	14	0	0	1
5328	468	Konfederacja_KP	0	0	3	0
5329	468	niez.	6	0	1	0
5330	468	Razem	4	0	0	0
5331	469	PiS	137	0	0	10
5332	469	KO	152	0	0	4
5333	469	Demokracja	2	1	0	1
5334	469	RozwojPlus	35	1	0	4
5335	469	PSL-TD	25	0	0	7
5336	469	Konfederacja	0	13	1	2
5337	469	Centrum	15	0	0	0
5338	469	Lewica	21	0	0	0
5339	469	Polska2050	14	0	0	1
5340	469	Konfederacja_KP	0	3	0	0
5341	469	niez.	5	1	0	1
5342	469	Razem	4	0	0	0
5343	470	PiS	6	136	0	5
5344	470	KO	155	0	0	1
5345	470	Demokracja	0	3	0	1
5346	470	RozwojPlus	1	37	0	2
5347	470	PSL-TD	32	0	0	0
5348	470	Konfederacja	11	2	1	2
5349	470	Centrum	15	0	0	0
5350	470	Lewica	21	0	0	0
5351	470	Polska2050	14	0	0	1
5352	470	Konfederacja_KP	0	3	0	0
5353	470	niez.	5	2	0	0
5354	470	Razem	4	0	0	0
5355	471	PiS	139	0	0	8
5356	471	KO	0	155	0	1
5357	471	Demokracja	3	0	0	1
5358	471	RozwojPlus	36	0	1	3
5359	471	PSL-TD	0	32	0	0
5360	471	Konfederacja	13	0	1	2
5361	471	Centrum	0	15	0	0
5362	471	Lewica	1	20	0	0
5363	471	Polska2050	0	14	0	1
5364	471	Konfederacja_KP	3	0	0	0
5365	471	niez.	2	4	1	0
5366	471	Razem	0	0	4	0
5367	472	PiS	140	0	0	7
5368	472	KO	153	2	0	1
5369	472	Demokracja	3	0	0	1
5370	472	RozwojPlus	34	0	2	4
5371	472	PSL-TD	31	1	0	0
5372	472	Konfederacja	0	0	14	2
5373	472	Centrum	15	0	0	0
5374	472	Lewica	21	0	0	0
5375	472	Polska2050	14	0	0	1
5376	472	Konfederacja_KP	0	0	3	0
5377	472	niez.	6	0	1	0
5378	472	Razem	4	0	0	0
5379	473	PiS	139	0	0	8
5380	473	KO	0	153	0	3
5381	473	Demokracja	3	0	0	1
5382	473	RozwojPlus	37	0	0	3
5383	473	PSL-TD	1	31	0	0
5384	473	Konfederacja	14	0	0	2
5385	473	Centrum	0	15	0	0
5386	473	Lewica	0	21	0	0
5387	473	Polska2050	0	14	0	1
5388	473	Konfederacja_KP	3	0	0	0
5389	473	niez.	3	3	1	0
5390	473	Razem	4	0	0	0
5391	474	PiS	139	1	0	7
5392	474	KO	155	0	0	1
5393	474	Demokracja	0	0	3	1
5394	474	RozwojPlus	36	0	1	3
5395	474	PSL-TD	32	0	0	0
5396	474	Konfederacja	0	0	14	2
5397	474	Centrum	14	1	0	0
5398	474	Lewica	21	0	0	0
5399	474	Polska2050	13	0	0	2
5400	474	Konfederacja_KP	0	0	3	0
5401	474	niez.	5	0	1	1
5402	474	Razem	4	0	0	0
5403	475	PiS	2	1	137	7
5404	475	KO	155	0	0	1
5405	475	Demokracja	0	0	3	1
5406	475	RozwojPlus	0	0	37	3
5407	475	PSL-TD	32	0	0	0
5408	475	Konfederacja	0	2	12	2
5409	475	Centrum	15	0	0	0
5410	475	Lewica	21	0	0	0
5411	475	Polska2050	14	0	0	1
5412	475	Konfederacja_KP	0	3	0	0
5413	475	niez.	6	0	1	0
5414	475	Razem	4	0	0	0
5415	476	PiS	0	0	140	7
5416	476	KO	155	0	0	1
5417	476	Demokracja	0	3	0	1
5418	476	RozwojPlus	0	1	36	3
5419	476	PSL-TD	32	0	0	0
5420	476	Konfederacja	0	14	0	2
5421	476	Centrum	15	0	0	0
5422	476	Lewica	21	0	0	0
5423	476	Polska2050	14	0	0	1
5424	476	Konfederacja_KP	0	3	0	0
5425	476	niez.	5	1	1	0
5426	476	Razem	4	0	0	0
5427	477	PiS	138	1	1	7
5428	477	KO	0	155	0	1
5429	477	Demokracja	3	0	0	1
5430	477	RozwojPlus	37	0	0	3
5431	477	PSL-TD	0	31	0	1
5432	477	Konfederacja	13	0	1	2
5433	477	Centrum	0	15	0	0
5434	477	Lewica	0	21	0	0
5435	477	Polska2050	0	14	0	1
5436	477	Konfederacja_KP	3	0	0	0
5437	477	niez.	2	4	1	0
5438	477	Razem	0	0	4	0
5439	478	PiS	140	0	0	7
5440	478	KO	0	154	0	2
5441	478	Demokracja	3	0	0	1
5442	478	RozwojPlus	35	1	0	4
5443	478	PSL-TD	0	30	0	2
5444	478	Konfederacja	13	0	1	2
5445	478	Centrum	0	15	0	0
5446	478	Lewica	0	21	0	0
5447	478	Polska2050	1	13	0	1
5448	478	Konfederacja_KP	3	0	0	0
5449	478	niez.	2	3	2	0
5450	478	Razem	0	0	4	0
5451	479	PiS	139	2	0	6
5452	479	KO	0	155	0	1
5453	479	Demokracja	0	3	0	1
5454	479	RozwojPlus	36	1	0	3
5455	479	PSL-TD	0	31	0	1
5456	479	Konfederacja	0	13	1	2
5457	479	Centrum	0	15	0	0
5458	479	Lewica	0	21	0	0
5459	479	Polska2050	0	14	0	1
5460	479	Konfederacja_KP	0	3	0	0
5461	479	niez.	1	6	0	0
5462	479	Razem	0	4	0	0
5463	480	PiS	0	141	0	6
5464	480	KO	155	0	0	1
5465	480	Demokracja	0	3	0	1
5466	480	RozwojPlus	0	37	0	3
5467	480	PSL-TD	32	0	0	0
5468	480	Konfederacja	0	14	0	2
5469	480	Centrum	15	0	0	0
5470	480	Lewica	21	0	0	0
5471	480	Polska2050	14	0	0	1
5472	480	Konfederacja_KP	0	3	0	0
5473	480	niez.	3	3	1	0
5474	480	Razem	0	4	0	0
5475	481	PiS	0	140	1	6
5476	481	KO	155	0	0	1
5477	481	Demokracja	0	3	0	1
5478	481	RozwojPlus	0	37	0	3
5479	481	PSL-TD	32	0	0	0
5480	481	Konfederacja	0	14	0	2
5481	481	Centrum	15	0	0	0
5482	481	Lewica	21	0	0	0
5483	481	Polska2050	14	0	0	1
5484	481	Konfederacja_KP	0	3	0	0
5485	481	niez.	5	2	0	0
5486	481	Razem	4	0	0	0
5487	482	PiS	138	1	0	8
5488	482	KO	153	0	0	3
5489	482	Demokracja	3	0	0	1
5490	482	RozwojPlus	37	0	0	3
5491	482	PSL-TD	32	0	0	0
5492	482	Konfederacja	13	0	1	2
5493	482	Centrum	15	0	0	0
5494	482	Lewica	21	0	0	0
5495	482	Polska2050	14	0	0	1
5496	482	Konfederacja_KP	2	1	0	0
5497	482	niez.	7	0	0	0
5498	482	Razem	3	0	0	1
5499	483	PiS	0	141	0	6
5500	483	KO	155	0	0	1
5501	483	Demokracja	0	3	0	1
5502	483	RozwojPlus	0	37	0	3
5503	483	PSL-TD	32	0	0	0
5504	483	Konfederacja	1	13	0	2
5505	483	Centrum	15	0	0	0
5506	483	Lewica	21	0	0	0
5507	483	Polska2050	14	0	0	1
5508	483	Konfederacja_KP	0	3	0	0
5509	483	niez.	5	2	0	0
5510	483	Razem	4	0	0	0
5511	484	PiS	0	0	140	7
5512	484	KO	0	155	0	1
5513	484	Demokracja	3	0	0	1
5514	484	RozwojPlus	0	0	37	3
5515	484	PSL-TD	1	29	0	2
5516	484	Konfederacja	14	0	0	2
5517	484	Centrum	1	14	0	0
5518	484	Lewica	0	21	0	0
5519	484	Polska2050	0	14	0	1
5520	484	Konfederacja_KP	3	0	0	0
5521	484	niez.	1	5	1	0
5522	484	Razem	0	4	0	0
5523	485	PiS	3	0	138	6
5524	485	KO	0	155	0	1
5525	485	Demokracja	2	0	1	1
5526	485	RozwojPlus	3	0	32	5
5527	485	PSL-TD	0	32	0	0
5528	485	Konfederacja	12	0	1	3
5529	485	Centrum	0	15	0	0
5530	485	Lewica	0	21	0	0
5531	485	Polska2050	0	14	0	1
5532	485	Konfederacja_KP	3	0	0	0
5533	485	niez.	2	4	1	0
5534	485	Razem	0	4	0	0
5535	486	PiS	0	1	140	6
5536	486	KO	0	155	0	1
5537	486	Demokracja	0	3	0	1
5538	486	RozwojPlus	0	1	36	3
5539	486	PSL-TD	0	29	0	3
5540	486	Konfederacja	0	14	0	2
5541	486	Centrum	0	15	0	0
5542	486	Lewica	0	20	0	1
5543	486	Polska2050	0	10	4	1
5544	486	Konfederacja_KP	0	3	0	0
5545	486	niez.	1	4	2	0
5546	486	Razem	0	0	2	2
5547	487	PiS	0	0	139	8
5548	487	KO	1	154	0	1
5549	487	Demokracja	3	0	0	1
5550	487	RozwojPlus	1	0	35	4
5551	487	PSL-TD	0	32	0	0
5552	487	Konfederacja	13	0	1	2
5553	487	Centrum	4	10	0	1
5554	487	Lewica	0	21	0	0
5555	487	Polska2050	0	10	4	1
5556	487	Konfederacja_KP	3	0	0	0
5557	487	niez.	3	2	2	0
5558	487	Razem	0	0	4	0
5559	488	PiS	0	0	136	11
5560	488	KO	0	155	0	1
5561	488	Demokracja	2	0	1	1
5562	488	RozwojPlus	0	1	35	4
5563	488	PSL-TD	0	32	0	0
5564	488	Konfederacja	0	14	0	2
5565	488	Centrum	0	15	0	0
5566	488	Lewica	0	20	0	1
5567	488	Polska2050	0	10	4	1
5568	488	Konfederacja_KP	0	3	0	0
5569	488	niez.	1	4	2	0
5570	488	Razem	0	0	4	0
5571	489	PiS	0	0	141	6
5572	489	KO	0	154	0	2
5573	489	Demokracja	0	0	3	1
5574	489	RozwojPlus	0	0	37	3
5575	489	PSL-TD	0	32	0	0
5576	489	Konfederacja	0	0	14	2
5577	489	Centrum	0	15	0	0
5578	489	Lewica	0	21	0	0
5579	489	Polska2050	0	10	4	1
5580	489	Konfederacja_KP	0	0	3	0
5581	489	niez.	1	3	3	0
5582	489	Razem	0	0	4	0
5583	490	PiS	0	0	140	7
5584	490	KO	154	0	0	2
5585	490	Demokracja	0	0	3	1
5586	490	RozwojPlus	0	0	35	5
5587	490	PSL-TD	31	0	0	1
5588	490	Konfederacja	0	0	14	2
5589	490	Centrum	15	0	0	0
5590	490	Lewica	21	0	0	0
5591	490	Polska2050	14	0	0	1
5592	490	Konfederacja_KP	0	0	3	0
5593	490	niez.	4	0	2	1
5594	490	Razem	4	0	0	0
5595	491	PiS	0	2	137	8
5596	491	KO	0	153	0	3
5597	491	Demokracja	0	3	0	1
5598	491	RozwojPlus	0	1	33	6
5599	491	PSL-TD	0	30	0	2
5600	491	Konfederacja	0	14	0	2
5601	491	Centrum	0	15	0	0
5602	491	Lewica	0	21	0	0
5603	491	Polska2050	0	10	4	1
5604	491	Konfederacja_KP	0	3	0	0
5605	491	niez.	1	4	2	0
5606	491	Razem	0	0	4	0
5607	492	PiS	0	0	137	10
5608	492	KO	0	155	0	1
5609	492	Demokracja	0	1	2	1
5610	492	RozwojPlus	0	1	35	4
5611	492	PSL-TD	0	32	0	0
5612	492	Konfederacja	0	14	0	2
5613	492	Centrum	0	15	0	0
5614	492	Lewica	0	21	0	0
5615	492	Polska2050	0	10	4	1
5616	492	Konfederacja_KP	0	3	0	0
5617	492	niez.	1	4	2	0
5618	492	Razem	0	0	4	0
5619	493	PiS	1	0	139	7
5620	493	KO	0	155	0	1
5621	493	Demokracja	3	0	0	1
5622	493	RozwojPlus	2	0	35	3
5623	493	PSL-TD	2	28	0	2
5624	493	Konfederacja	14	0	0	2
5625	493	Centrum	0	15	0	0
5626	493	Lewica	0	21	0	0
5627	493	Polska2050	0	10	4	1
5628	493	Konfederacja_KP	3	0	0	0
5629	493	niez.	2	3	2	0
5630	493	Razem	0	0	4	0
5631	494	PiS	0	0	139	8
5632	494	KO	154	0	0	2
5633	494	Demokracja	0	0	3	1
5634	494	RozwojPlus	0	0	36	4
5635	494	PSL-TD	29	1	1	1
5636	494	Konfederacja	1	0	13	2
5637	494	Centrum	15	0	0	0
5638	494	Lewica	21	0	0	0
5639	494	Polska2050	14	0	0	1
5640	494	Konfederacja_KP	0	0	3	0
5641	494	niez.	5	0	1	1
5642	494	Razem	4	0	0	0
5643	495	PiS	0	0	131	16
5644	495	KO	0	147	0	9
5645	495	Demokracja	0	1	2	1
5646	495	RozwojPlus	0	0	33	7
5647	495	PSL-TD	0	32	0	0
5648	495	Konfederacja	0	14	0	2
5649	495	Centrum	0	15	0	0
5650	495	Lewica	0	21	0	0
5651	495	Polska2050	0	9	4	2
5652	495	Konfederacja_KP	0	3	0	0
5653	495	niez.	1	4	2	0
5654	495	Razem	0	0	4	0
5655	496	PiS	0	0	141	6
5656	496	KO	0	155	0	1
5657	496	Demokracja	0	0	3	1
5658	496	RozwojPlus	0	0	36	4
5659	496	PSL-TD	0	32	0	0
5660	496	Konfederacja	0	3	11	2
5661	496	Centrum	0	15	0	0
5662	496	Lewica	0	21	0	0
5663	496	Polska2050	0	10	4	1
5664	496	Konfederacja_KP	0	0	3	0
5665	496	niez.	1	3	3	0
5666	496	Razem	0	0	4	0
5667	497	PiS	5	3	131	8
5668	497	KO	155	0	0	1
5669	497	Demokracja	0	1	2	1
5670	497	RozwojPlus	1	1	35	3
5671	497	PSL-TD	32	0	0	0
5672	497	Konfederacja	0	14	0	2
5673	497	Centrum	15	0	0	0
5674	497	Lewica	21	0	0	0
5675	497	Polska2050	14	0	0	1
5676	497	Konfederacja_KP	0	3	0	0
5677	497	niez.	4	2	0	1
5678	497	Razem	4	0	0	0
5679	498	PiS	0	9	127	11
5680	498	KO	0	155	0	1
5681	498	Demokracja	0	3	0	1
5682	498	RozwojPlus	1	2	33	4
5683	498	PSL-TD	1	31	0	0
5684	498	Konfederacja	0	14	0	2
5685	498	Centrum	0	15	0	0
5686	498	Lewica	0	21	0	0
5687	498	Polska2050	0	14	0	1
5688	498	Konfederacja_KP	0	3	0	0
5689	498	niez.	0	7	0	0
5690	498	Razem	0	4	0	0
5691	499	PiS	0	9	132	6
5692	499	KO	0	153	0	3
5693	499	Demokracja	0	3	0	1
5694	499	RozwojPlus	0	0	36	4
5695	499	PSL-TD	0	32	0	0
5696	499	Konfederacja	1	12	0	3
5697	499	Centrum	0	15	0	0
5698	499	Lewica	0	21	0	0
5699	499	Polska2050	0	14	0	1
5700	499	Konfederacja_KP	0	3	0	0
5701	499	niez.	0	7	0	0
5702	499	Razem	0	4	0	0
5703	500	PiS	0	140	1	6
5704	500	KO	0	154	0	2
5705	500	Demokracja	0	3	0	1
5706	500	RozwojPlus	1	35	0	4
5707	500	PSL-TD	0	30	0	2
5708	500	Konfederacja	0	14	0	2
5709	500	Centrum	0	15	0	0
5710	500	Lewica	0	21	0	0
5711	500	Polska2050	0	14	0	1
5712	500	Konfederacja_KP	0	3	0	0
5713	500	niez.	0	7	0	0
5714	500	Razem	0	4	0	0
5715	501	PiS	0	139	0	8
5716	501	KO	0	151	0	5
5717	501	Demokracja	0	3	0	1
5718	501	RozwojPlus	0	35	0	5
5719	501	PSL-TD	0	32	0	0
5720	501	Konfederacja	0	13	1	2
5721	501	Centrum	0	15	0	0
5722	501	Lewica	0	21	0	0
5723	501	Polska2050	0	14	0	1
5724	501	Konfederacja_KP	0	3	0	0
5725	501	niez.	0	6	0	1
5726	501	Razem	0	4	0	0
5727	502	PiS	0	137	0	10
5728	502	KO	0	154	0	2
5729	502	Demokracja	0	3	0	1
5730	502	RozwojPlus	0	37	0	3
5731	502	PSL-TD	0	32	0	0
5732	502	Konfederacja	0	13	1	2
5733	502	Centrum	0	15	0	0
5734	502	Lewica	0	19	0	2
5735	502	Polska2050	0	13	0	2
5736	502	Konfederacja_KP	0	3	0	0
5737	502	niez.	0	7	0	0
5738	502	Razem	0	4	0	0
5739	503	PiS	0	139	0	8
5740	503	KO	0	154	0	2
5741	503	Demokracja	0	3	0	1
5742	503	RozwojPlus	0	37	0	3
5743	503	PSL-TD	0	31	0	1
5744	503	Konfederacja	0	13	1	2
5745	503	Centrum	0	15	0	0
5746	503	Lewica	0	21	0	0
5747	503	Polska2050	0	14	0	1
5748	503	Konfederacja_KP	0	3	0	0
5749	503	niez.	0	7	0	0
5750	503	Razem	0	4	0	0
5751	504	PiS	1	134	1	11
5752	504	KO	0	153	0	3
5753	504	Demokracja	0	3	0	1
5754	504	RozwojPlus	0	35	1	4
5755	504	PSL-TD	0	32	0	0
5756	504	Konfederacja	0	13	1	2
5757	504	Centrum	0	15	0	0
5758	504	Lewica	0	21	0	0
5759	504	Polska2050	0	14	0	1
5760	504	Konfederacja_KP	0	3	0	0
5761	504	niez.	0	7	0	0
5762	504	Razem	0	4	0	0
5763	505	PiS	0	140	0	7
5764	505	KO	0	154	0	2
5765	505	Demokracja	0	3	0	1
5766	505	RozwojPlus	0	37	0	3
5767	505	PSL-TD	0	30	0	2
5768	505	Konfederacja	0	13	1	2
5769	505	Centrum	0	15	0	0
5770	505	Lewica	0	21	0	0
5771	505	Polska2050	0	14	0	1
5772	505	Konfederacja_KP	0	3	0	0
5773	505	niez.	0	7	0	0
5774	505	Razem	0	4	0	0
5775	506	PiS	140	0	0	7
5776	506	KO	0	155	0	1
5777	506	Demokracja	1	2	0	1
5778	506	RozwojPlus	36	0	0	4
5779	506	PSL-TD	0	31	0	1
5780	506	Konfederacja	0	13	1	2
5781	506	Centrum	0	15	0	0
5782	506	Lewica	0	21	0	0
5783	506	Polska2050	0	14	0	1
5784	506	Konfederacja_KP	0	3	0	0
5785	506	niez.	1	6	0	0
5786	506	Razem	0	4	0	0
5787	507	PiS	139	0	0	8
5788	507	KO	0	155	0	1
5789	507	Demokracja	1	0	2	1
5790	507	RozwojPlus	36	0	0	4
5791	507	PSL-TD	0	31	0	1
5792	507	Konfederacja	0	0	14	2
5793	507	Centrum	0	15	0	0
5794	507	Lewica	0	21	0	0
5795	507	Polska2050	0	14	0	1
5796	507	Konfederacja_KP	0	0	3	0
5797	507	niez.	1	5	1	0
5798	507	Razem	0	4	0	0
5799	508	PiS	140	0	0	7
5800	508	KO	153	0	0	3
5801	508	Demokracja	3	0	0	1
5802	508	RozwojPlus	36	0	0	4
5803	508	PSL-TD	32	0	0	0
5804	508	Konfederacja	14	0	0	2
5805	508	Centrum	15	0	0	0
5806	508	Lewica	20	0	0	1
5807	508	Polska2050	13	1	0	1
5808	508	Konfederacja_KP	0	0	3	0
5809	508	niez.	6	1	0	0
5810	508	Razem	4	0	0	0
5811	509	PiS	140	0	0	7
5812	509	KO	153	0	0	3
5813	509	Demokracja	3	0	0	1
5814	509	RozwojPlus	36	0	0	4
5815	509	PSL-TD	32	0	0	0
5816	509	Konfederacja	14	0	0	2
5817	509	Centrum	15	0	0	0
5818	509	Lewica	21	0	0	0
5819	509	Polska2050	13	1	0	1
5820	509	Konfederacja_KP	0	0	3	0
5821	509	niez.	6	1	0	0
5822	509	Razem	4	0	0	0
5823	510	PiS	134	0	0	13
5824	510	KO	0	154	0	2
5825	510	Demokracja	3	0	0	1
5826	510	RozwojPlus	36	0	0	4
5827	510	PSL-TD	0	32	0	0
5828	510	Konfederacja	1	13	0	2
5829	510	Centrum	0	13	2	0
5830	510	Lewica	0	21	0	0
5831	510	Polska2050	0	14	0	1
5832	510	Konfederacja_KP	0	0	3	0
5833	510	niez.	3	4	0	0
5834	510	Razem	4	0	0	0
5835	511	PiS	128	1	4	14
5836	511	KO	1	152	0	3
5837	511	Demokracja	0	3	0	1
5838	511	RozwojPlus	29	1	2	8
5839	511	PSL-TD	0	32	0	0
5840	511	Konfederacja	0	13	1	2
5841	511	Centrum	0	15	0	0
5842	511	Lewica	1	19	0	1
5843	511	Polska2050	0	14	0	1
5844	511	Konfederacja_KP	0	3	0	0
5845	511	niez.	2	4	1	0
5846	511	Razem	4	0	0	0
5847	512	PiS	137	0	0	10
5848	512	KO	0	154	0	2
5849	512	Demokracja	2	0	1	1
5850	512	RozwojPlus	34	0	0	6
5851	512	PSL-TD	0	32	0	0
5852	512	Konfederacja	1	0	13	2
5853	512	Centrum	1	14	0	0
5854	512	Lewica	0	21	0	0
5855	512	Polska2050	0	14	0	1
5856	512	Konfederacja_KP	3	0	0	0
5857	512	niez.	2	3	1	1
5858	512	Razem	0	0	0	4
5859	513	PiS	137	0	0	10
5860	513	KO	0	151	0	5
5861	513	Demokracja	2	0	1	1
5862	513	RozwojPlus	36	0	0	4
5863	513	PSL-TD	0	32	0	0
5864	513	Konfederacja	0	1	13	2
5865	513	Centrum	0	14	0	1
5866	513	Lewica	0	21	0	0
5867	513	Polska2050	0	14	0	1
5868	513	Konfederacja_KP	0	0	2	1
5869	513	niez.	3	3	1	0
5870	513	Razem	4	0	0	0
5871	514	PiS	0	175	0	11
5872	514	KO	148	0	0	8
5873	514	Demokracja	0	0	3	1
5874	514	PSL-TD	29	0	0	3
5875	514	Konfederacja	0	0	13	3
5876	514	Centrum	12	0	0	3
5877	514	Lewica	20	0	0	1
5878	514	Polska2050	12	0	0	3
5879	514	Konfederacja_KP	0	3	0	0
5880	514	niez.	5	1	1	1
5881	514	Razem	4	0	0	0
5882	515	PiS	0	174	0	12
5883	515	KO	149	0	0	7
5884	515	Demokracja	0	0	3	1
5885	515	PSL-TD	30	0	0	2
5886	515	Konfederacja	0	1	12	3
5887	515	Centrum	12	0	0	3
5888	515	Lewica	20	0	0	1
5889	515	Polska2050	11	0	0	4
5890	515	Konfederacja_KP	0	3	0	0
5891	515	niez.	4	3	0	1
5892	515	Razem	0	4	0	0
5893	516	PiS	174	0	0	12
5894	516	KO	149	0	0	7
5895	516	Demokracja	2	1	0	1
5896	516	PSL-TD	30	0	0	2
5897	516	Konfederacja	7	0	6	3
5898	516	Centrum	12	0	0	3
5899	516	Lewica	20	0	0	1
5900	516	Polska2050	12	0	0	3
5901	516	Konfederacja_KP	3	0	0	0
5902	516	niez.	7	0	0	1
5903	516	Razem	4	0	0	0
5904	517	PiS	174	1	0	11
5905	517	KO	0	149	0	7
5906	517	Demokracja	3	0	0	1
5907	517	PSL-TD	0	30	0	2
5908	517	Konfederacja	7	4	1	4
5909	517	Centrum	0	12	0	3
5910	517	Lewica	0	20	0	1
5911	517	Polska2050	0	12	0	3
5912	517	Konfederacja_KP	3	0	0	0
5913	517	niez.	4	3	0	1
5914	517	Razem	4	0	0	0
5915	518	PiS	0	0	0	186
5916	518	KO	0	0	0	156
5917	518	Demokracja	0	0	0	4
5918	518	PSL-TD	0	0	0	32
5919	518	Konfederacja	0	0	0	16
5920	518	Centrum	0	0	0	15
5921	518	Lewica	0	0	0	21
5922	518	Polska2050	0	0	0	15
5923	518	Konfederacja_KP	0	0	0	3
5924	518	niez.	0	0	0	8
5925	518	Razem	0	0	0	4
5926	519	PiS	77	95	2	12
5927	519	KO	0	149	0	7
5928	519	Demokracja	3	0	0	1
5929	519	PSL-TD	0	30	0	2
5930	519	Konfederacja	10	0	3	3
5931	519	Centrum	0	12	0	3
5932	519	Lewica	0	20	0	1
5933	519	Polska2050	0	12	0	3
5934	519	Konfederacja_KP	3	0	0	0
5935	519	niez.	4	3	0	1
5936	519	Razem	0	0	4	0
5937	520	PiS	0	180	0	6
5938	520	KO	149	0	0	7
5939	520	Demokracja	0	3	0	1
5940	520	PSL-TD	31	0	0	1
5941	520	Konfederacja	0	13	0	3
5942	520	Centrum	14	0	0	1
5943	520	Lewica	21	0	0	0
5944	520	Polska2050	13	0	0	2
5945	520	Konfederacja_KP	0	3	0	0
5946	520	niez.	5	3	0	0
5947	520	Razem	4	0	0	0
5948	521	PiS	178	0	0	8
5949	521	KO	149	0	0	7
5950	521	Demokracja	0	3	0	1
5951	521	PSL-TD	31	0	0	1
5952	521	Konfederacja	0	13	0	3
5953	521	Centrum	14	0	0	1
5954	521	Lewica	21	0	0	0
5955	521	Polska2050	13	0	0	2
5956	521	Konfederacja_KP	0	3	0	0
5957	521	niez.	7	1	0	0
5958	521	Razem	0	0	4	0
5959	522	PiS	0	178	0	8
5960	522	KO	149	0	0	7
5961	522	Demokracja	0	3	0	1
5962	522	PSL-TD	29	0	0	3
5963	522	Konfederacja	0	13	0	3
5964	522	Centrum	14	0	0	1
5965	522	Lewica	19	0	0	2
5966	522	Polska2050	13	0	0	2
5967	522	Konfederacja_KP	0	3	0	0
5968	522	niez.	5	3	0	0
5969	522	Razem	4	0	0	0
5970	523	PiS	0	181	0	5
5971	523	KO	149	0	0	7
5972	523	Demokracja	0	3	0	1
5973	523	PSL-TD	32	0	0	0
5974	523	Konfederacja	0	14	0	2
5975	523	Centrum	14	0	0	1
5976	523	Lewica	21	0	0	0
5977	523	Polska2050	13	0	0	2
5978	523	Konfederacja_KP	0	3	0	0
5979	523	niez.	5	3	0	0
5980	523	Razem	4	0	0	0
5981	524	PiS	23	158	0	5
5982	524	KO	0	148	0	8
5983	524	Demokracja	3	0	0	1
5984	524	PSL-TD	2	30	0	0
5985	524	Konfederacja	11	0	3	2
5986	524	Centrum	0	14	0	1
5987	524	Lewica	0	21	0	0
5988	524	Polska2050	0	12	0	3
5989	524	Konfederacja_KP	3	0	0	0
5990	524	niez.	0	7	1	0
5991	524	Razem	0	4	0	0
5992	525	PiS	0	0	0	186
5993	525	KO	0	0	0	156
5994	525	Demokracja	0	0	0	4
5995	525	PSL-TD	0	0	0	32
5996	525	Konfederacja	0	0	0	16
5997	525	Centrum	0	0	0	15
5998	525	Lewica	0	0	0	21
5999	525	Polska2050	0	0	0	15
6000	525	Konfederacja_KP	0	0	0	3
6001	525	niez.	0	0	0	8
6002	525	Razem	0	0	0	4
6003	526	PiS	177	0	0	9
6004	526	KO	2	149	0	5
6005	526	Demokracja	3	0	0	1
6006	526	PSL-TD	0	32	0	0
6007	526	Konfederacja	13	0	0	3
6008	526	Centrum	0	14	0	1
6009	526	Lewica	0	21	0	0
6010	526	Polska2050	0	13	0	2
6011	526	Konfederacja_KP	3	0	0	0
6012	526	niez.	3	5	0	0
6013	526	Razem	0	4	0	0
6014	527	PiS	174	1	0	11
6015	527	KO	0	152	0	4
6016	527	Demokracja	3	0	0	1
6017	527	PSL-TD	0	32	0	0
6018	527	Konfederacja	13	0	0	3
6019	527	Centrum	0	14	0	1
6020	527	Lewica	0	21	0	0
6021	527	Polska2050	0	13	0	2
6022	527	Konfederacja_KP	3	0	0	0
6023	527	niez.	3	5	0	0
6024	527	Razem	0	4	0	0
6025	528	PiS	178	0	0	8
6026	528	KO	151	0	0	5
6027	528	Demokracja	0	3	0	1
6028	528	PSL-TD	32	0	0	0
6029	528	Konfederacja	0	14	0	2
6030	528	Centrum	14	0	0	1
6031	528	Lewica	21	0	0	0
6032	528	Polska2050	13	0	0	2
6033	528	Konfederacja_KP	0	3	0	0
6034	528	niez.	7	1	0	0
6035	528	Razem	4	0	0	0
6036	529	PiS	2	0	178	6
6037	529	KO	152	0	0	4
6038	529	Demokracja	1	0	2	1
6039	529	PSL-TD	31	0	0	1
6040	529	Konfederacja	14	0	0	2
6041	529	Centrum	14	0	0	1
6042	529	Lewica	21	0	0	0
6043	529	Polska2050	13	0	0	2
6044	529	Konfederacja_KP	3	0	0	0
6045	529	niez.	6	0	2	0
6046	529	Razem	4	0	0	0
6047	530	PiS	179	0	0	7
6048	530	KO	152	0	0	4
6049	530	Demokracja	1	0	2	1
6050	530	PSL-TD	32	0	0	0
6051	530	Konfederacja	0	0	14	2
6052	530	Centrum	14	0	0	1
6053	530	Lewica	20	0	1	0
6054	530	Polska2050	13	0	0	2
6055	530	Konfederacja_KP	0	0	3	0
6056	530	niez.	6	0	1	1
6057	530	Razem	4	0	0	0
6058	531	PiS	5	2	171	8
6059	531	KO	152	0	0	4
6060	531	Demokracja	0	3	0	1
6061	531	PSL-TD	32	0	0	0
6062	531	Konfederacja	0	14	0	2
6063	531	Centrum	14	0	0	1
6064	531	Lewica	21	0	0	0
6065	531	Polska2050	13	0	0	2
6066	531	Konfederacja_KP	0	3	0	0
6067	531	niez.	4	2	1	1
6068	531	Razem	0	0	4	0
6069	532	PiS	0	0	179	7
6070	532	KO	152	0	0	4
6071	532	Demokracja	0	0	3	1
6072	532	PSL-TD	32	0	0	0
6073	532	Konfederacja	0	0	13	3
6074	532	Centrum	14	0	0	1
6075	532	Lewica	21	0	0	0
6076	532	Polska2050	12	0	0	3
6077	532	Konfederacja_KP	0	0	3	0
6078	532	niez.	5	0	2	1
6079	532	Razem	3	0	0	1
6080	533	PiS	0	0	179	7
6081	533	KO	150	1	0	5
6082	533	Demokracja	0	0	3	1
6083	533	PSL-TD	32	0	0	0
6084	533	Konfederacja	0	0	14	2
6085	533	Centrum	14	0	0	1
6086	533	Lewica	21	0	0	0
6087	533	Polska2050	12	0	0	3
6088	533	Konfederacja_KP	0	0	3	0
6089	533	niez.	5	0	2	1
6090	533	Razem	4	0	0	0
6091	534	PiS	0	0	178	8
6092	534	KO	151	0	0	5
6093	534	Demokracja	0	0	3	1
6094	534	PSL-TD	32	0	0	0
6095	534	Konfederacja	0	0	14	2
6096	534	Centrum	14	0	0	1
6097	534	Lewica	21	0	0	0
6098	534	Polska2050	13	0	0	2
6099	534	Konfederacja_KP	0	0	3	0
6100	534	niez.	5	0	2	1
6101	534	Razem	3	0	0	1
6102	535	PiS	0	0	180	6
6103	535	KO	151	0	0	5
6104	535	Demokracja	0	0	3	1
6105	535	PSL-TD	32	0	0	0
6106	535	Konfederacja	0	0	14	2
6107	535	Centrum	14	0	0	1
6108	535	Lewica	21	0	0	0
6109	535	Polska2050	13	0	0	2
6110	535	Konfederacja_KP	0	0	3	0
6111	535	niez.	4	0	3	1
6112	535	Razem	0	0	4	0
6113	536	PiS	5	0	175	6
6114	536	KO	152	0	0	4
6115	536	Demokracja	0	1	2	1
6116	536	PSL-TD	32	0	0	0
6117	536	Konfederacja	0	13	0	3
6118	536	Centrum	14	0	0	1
6119	536	Lewica	21	0	0	0
6120	536	Polska2050	13	0	0	2
6121	536	Konfederacja_KP	0	3	0	0
6122	536	niez.	6	1	1	0
6123	536	Razem	4	0	0	0
6124	537	PiS	172	1	6	7
6125	537	KO	7	144	0	5
6126	537	Demokracja	2	0	0	2
6127	537	PSL-TD	6	26	0	0
6128	537	Konfederacja	13	0	0	3
6129	537	Centrum	0	14	0	1
6130	537	Lewica	0	21	0	0
6131	537	Polska2050	0	13	0	2
6132	537	Konfederacja_KP	3	0	0	0
6133	537	niez.	2	5	0	1
6134	537	Razem	0	4	0	0
6135	538	PiS	177	1	0	8
6136	538	KO	0	144	0	12
6137	538	Demokracja	3	0	0	1
6138	538	PSL-TD	0	30	0	2
6139	538	Konfederacja	14	0	0	2
6140	538	Centrum	0	14	0	1
6141	538	Lewica	1	18	0	2
6142	538	Polska2050	0	13	0	2
6143	538	Konfederacja_KP	3	0	0	0
6144	538	niez.	3	5	0	0
6145	538	Razem	0	3	0	1
6146	539	PiS	181	0	0	5
6147	539	KO	0	150	0	6
6148	539	Demokracja	3	0	0	1
6149	539	PSL-TD	0	32	0	0
6150	539	Konfederacja	14	0	0	2
6151	539	Centrum	0	14	0	1
6152	539	Lewica	0	21	0	0
6153	539	Polska2050	0	12	0	3
6154	539	Konfederacja_KP	3	0	0	0
6155	539	niez.	3	5	0	0
6156	539	Razem	0	4	0	0
6157	540	PiS	181	0	0	5
6158	540	KO	0	149	0	7
6159	540	Demokracja	3	0	0	1
6160	540	PSL-TD	1	31	0	0
6161	540	Konfederacja	14	0	0	2
6162	540	Centrum	0	13	0	2
6163	540	Lewica	0	21	0	0
6164	540	Polska2050	0	13	0	2
6165	540	Konfederacja_KP	3	0	0	0
6166	540	niez.	3	5	0	0
6167	540	Razem	0	4	0	0
6168	541	PiS	179	0	0	7
6169	541	KO	0	152	0	4
6170	541	Demokracja	3	0	0	1
6171	541	PSL-TD	0	32	0	0
6172	541	Konfederacja	14	0	0	2
6173	541	Centrum	0	14	0	1
6174	541	Lewica	0	21	0	0
6175	541	Polska2050	0	13	0	2
6176	541	Konfederacja_KP	3	0	0	0
6177	541	niez.	3	5	0	0
6178	541	Razem	0	4	0	0
6179	542	PiS	178	0	0	8
6180	542	KO	10	142	0	4
6181	542	Demokracja	3	0	0	1
6182	542	PSL-TD	0	32	0	0
6183	542	Konfederacja	14	0	0	2
6184	542	Centrum	0	13	0	2
6185	542	Lewica	0	21	0	0
6186	542	Polska2050	0	13	0	2
6187	542	Konfederacja_KP	3	0	0	0
6188	542	niez.	3	5	0	0
6189	542	Razem	0	4	0	0
6190	543	PiS	178	0	0	8
6191	543	KO	0	152	0	4
6192	543	Demokracja	3	0	0	1
6193	543	PSL-TD	0	32	0	0
6194	543	Konfederacja	14	0	0	2
6195	543	Centrum	0	14	0	1
6196	543	Lewica	1	20	0	0
6197	543	Polska2050	0	13	0	2
6198	543	Konfederacja_KP	3	0	0	0
6199	543	niez.	2	5	0	1
6200	543	Razem	0	4	0	0
6201	544	PiS	178	0	0	8
6202	544	KO	152	0	0	4
6203	544	Demokracja	0	0	3	1
6204	544	PSL-TD	32	0	0	0
6205	544	Konfederacja	0	0	14	2
6206	544	Centrum	14	0	0	1
6207	544	Lewica	21	0	0	0
6208	544	Polska2050	13	0	0	2
6209	544	Konfederacja_KP	0	0	3	0
6210	544	niez.	7	0	1	0
6211	544	Razem	4	0	0	0
6212	545	PiS	176	0	0	10
6213	545	KO	0	148	0	8
6214	545	Demokracja	3	0	0	1
6215	545	PSL-TD	0	31	0	1
6216	545	Konfederacja	14	0	0	2
6217	545	Centrum	0	14	0	1
6218	545	Lewica	0	20	0	1
6219	545	Polska2050	0	13	0	2
6220	545	Konfederacja_KP	3	0	0	0
6221	545	niez.	2	5	0	1
6222	545	Razem	0	4	0	0
6223	546	PiS	3	0	176	7
6224	546	KO	152	0	0	4
6225	546	Demokracja	1	0	2	1
6226	546	PSL-TD	32	0	0	0
6227	546	Konfederacja	0	0	14	2
6228	546	Centrum	14	0	0	1
6229	546	Lewica	21	0	0	0
6230	546	Polska2050	13	0	0	2
6231	546	Konfederacja_KP	0	0	3	0
6232	546	niez.	5	0	3	0
6233	546	Razem	4	0	0	0
6234	547	PiS	180	0	1	5
6235	547	KO	151	0	0	5
6236	547	Demokracja	0	0	3	1
6237	547	PSL-TD	32	0	0	0
6238	547	Konfederacja	8	0	6	2
6239	547	Centrum	14	0	0	1
6240	547	Lewica	20	1	0	0
6241	547	Polska2050	13	0	0	2
6242	547	Konfederacja_KP	0	0	3	0
6243	547	niez.	8	0	0	0
6244	547	Razem	4	0	0	0
6245	548	PiS	180	0	0	6
6246	548	KO	0	152	0	4
6247	548	Demokracja	3	0	0	1
6248	548	PSL-TD	0	32	0	0
6249	548	Konfederacja	14	0	0	2
6250	548	Centrum	0	14	0	1
6251	548	Lewica	0	21	0	0
6252	548	Polska2050	0	13	0	2
6253	548	Konfederacja_KP	3	0	0	0
6254	548	niez.	3	5	0	0
6255	548	Razem	0	4	0	0
6256	549	PiS	1	1	177	7
6257	549	KO	152	0	0	4
6258	549	Demokracja	0	3	0	1
6259	549	PSL-TD	32	0	0	0
6260	549	Konfederacja	0	14	0	2
6261	549	Centrum	14	0	0	1
6262	549	Lewica	21	0	0	0
6263	549	Polska2050	13	0	0	2
6264	549	Konfederacja_KP	0	3	0	0
6265	549	niez.	5	1	2	0
6266	549	Razem	4	0	0	0
6267	550	PiS	178	1	0	7
6268	550	KO	1	150	0	5
6269	550	Demokracja	2	1	0	1
6270	550	PSL-TD	0	32	0	0
6271	550	Konfederacja	1	5	8	2
6272	550	Centrum	0	14	0	1
6273	550	Lewica	0	21	0	0
6274	550	Polska2050	0	13	0	2
6275	550	Konfederacja_KP	0	2	1	0
6276	550	niez.	3	4	0	1
6277	550	Razem	4	0	0	0
6278	551	PiS	175	0	1	10
6279	551	KO	0	150	0	6
6280	551	Demokracja	2	1	0	1
6281	551	PSL-TD	0	31	0	1
6282	551	Konfederacja	0	7	7	2
6283	551	Centrum	0	14	0	1
6284	551	Lewica	0	21	0	0
6285	551	Polska2050	0	13	0	2
6286	551	Konfederacja_KP	0	2	1	0
6287	551	niez.	4	4	0	0
6288	551	Razem	3	0	0	1
6289	552	PiS	179	0	0	7
6290	552	KO	0	148	0	8
6291	552	Demokracja	2	1	0	1
6292	552	PSL-TD	0	32	0	0
6293	552	Konfederacja	0	7	7	2
6294	552	Centrum	0	14	0	1
6295	552	Lewica	0	21	0	0
6296	552	Polska2050	0	13	0	2
6297	552	Konfederacja_KP	0	2	1	0
6298	552	niez.	4	4	0	0
6299	552	Razem	4	0	0	0
6300	553	PiS	181	0	0	5
6301	553	KO	0	152	0	4
6302	553	Demokracja	2	1	0	1
6303	553	PSL-TD	0	32	0	0
6304	553	Konfederacja	0	7	7	2
6305	553	Centrum	0	14	0	1
6306	553	Lewica	0	21	0	0
6307	553	Polska2050	0	13	0	2
6308	553	Konfederacja_KP	0	2	1	0
6309	553	niez.	4	4	0	0
6310	553	Razem	4	0	0	0
6311	554	PiS	179	0	0	7
6312	554	KO	0	151	0	5
6313	554	Demokracja	2	1	0	1
6314	554	PSL-TD	0	32	0	0
6315	554	Konfederacja	0	6	7	3
6316	554	Centrum	0	14	0	1
6317	554	Lewica	0	21	0	0
6318	554	Polska2050	0	13	0	2
6319	554	Konfederacja_KP	0	3	0	0
6320	554	niez.	3	4	1	0
6321	554	Razem	4	0	0	0
6322	555	PiS	177	2	0	7
6323	555	KO	0	152	0	4
6324	555	Demokracja	2	1	0	1
6325	555	PSL-TD	0	32	0	0
6326	555	Konfederacja	0	7	7	2
6327	555	Centrum	0	14	0	1
6328	555	Lewica	0	21	0	0
6329	555	Polska2050	0	13	0	2
6330	555	Konfederacja_KP	0	3	0	0
6331	555	niez.	3	4	1	0
6332	555	Razem	4	0	0	0
6333	556	PiS	5	175	0	6
6334	556	KO	0	150	0	6
6335	556	Demokracja	0	3	0	1
6336	556	PSL-TD	0	32	0	0
6337	556	Konfederacja	0	6	8	2
6338	556	Centrum	0	14	0	1
6339	556	Lewica	0	21	0	0
6340	556	Polska2050	0	13	0	2
6341	556	Konfederacja_KP	0	3	0	0
6342	556	niez.	2	5	1	0
6343	556	Razem	4	0	0	0
6344	557	PiS	0	175	1	10
6345	557	KO	0	152	0	4
6346	557	Demokracja	0	3	0	1
6347	557	PSL-TD	0	32	0	0
6348	557	Konfederacja	0	14	0	2
6349	557	Centrum	0	14	0	1
6350	557	Lewica	0	21	0	0
6351	557	Polska2050	0	13	0	2
6352	557	Konfederacja_KP	0	3	0	0
6353	557	niez.	1	6	1	0
6354	557	Razem	4	0	0	0
6355	558	PiS	178	0	0	8
6356	558	KO	152	0	0	4
6357	558	Demokracja	2	1	0	1
6358	558	PSL-TD	32	0	0	0
6359	558	Konfederacja	0	7	7	2
6360	558	Centrum	14	0	0	1
6361	558	Lewica	21	0	0	0
6362	558	Polska2050	13	0	0	2
6363	558	Konfederacja_KP	0	3	0	0
6364	558	niez.	6	1	1	0
6365	558	Razem	4	0	0	0
6366	559	PiS	176	0	0	10
6367	559	KO	0	152	0	4
6368	559	Demokracja	2	1	0	1
6369	559	PSL-TD	0	30	0	2
6370	559	Konfederacja	0	7	7	2
6371	559	Centrum	0	14	0	1
6372	559	Lewica	0	21	0	0
6373	559	Polska2050	0	13	0	2
6374	559	Konfederacja_KP	0	2	0	1
6375	559	niez.	3	4	1	0
6376	559	Razem	4	0	0	0
6377	560	PiS	179	0	0	7
6378	560	KO	0	152	0	4
6379	560	Demokracja	2	1	0	1
6380	560	PSL-TD	0	31	0	1
6381	560	Konfederacja	0	7	7	2
6382	560	Centrum	0	14	0	1
6383	560	Lewica	0	21	0	0
6384	560	Polska2050	0	13	0	2
6385	560	Konfederacja_KP	0	3	0	0
6386	560	niez.	3	4	1	0
6387	560	Razem	4	0	0	0
6388	561	PiS	180	0	0	6
6389	561	KO	0	152	0	4
6390	561	Demokracja	2	1	0	1
6391	561	PSL-TD	0	32	0	0
6392	561	Konfederacja	0	7	7	2
6393	561	Centrum	0	14	0	1
6394	561	Lewica	0	20	0	1
6395	561	Polska2050	0	13	0	2
6396	561	Konfederacja_KP	0	3	0	0
6397	561	niez.	3	4	1	0
6398	561	Razem	4	0	0	0
6399	562	PiS	179	0	0	7
6400	562	KO	0	152	0	4
6401	562	Demokracja	2	1	0	1
6402	562	PSL-TD	0	27	0	5
6403	562	Konfederacja	0	8	6	2
6404	562	Centrum	0	14	0	1
6405	562	Lewica	0	21	0	0
6406	562	Polska2050	0	12	0	3
6407	562	Konfederacja_KP	0	3	0	0
6408	562	niez.	3	4	1	0
6409	562	Razem	4	0	0	0
6410	563	PiS	178	0	0	8
6411	563	KO	0	150	0	6
6412	563	Demokracja	2	1	0	1
6413	563	PSL-TD	0	32	0	0
6414	563	Konfederacja	0	6	8	2
6415	563	Centrum	0	14	0	1
6416	563	Lewica	0	21	0	0
6417	563	Polska2050	0	13	0	2
6418	563	Konfederacja_KP	0	3	0	0
6419	563	niez.	3	4	1	0
6420	563	Razem	4	0	0	0
6421	564	PiS	176	1	0	9
6422	564	KO	0	151	0	5
6423	564	Demokracja	2	1	0	1
6424	564	PSL-TD	0	31	0	1
6425	564	Konfederacja	0	7	7	2
6426	564	Centrum	0	14	0	1
6427	564	Lewica	0	21	0	0
6428	564	Polska2050	0	13	0	2
6429	564	Konfederacja_KP	0	3	0	0
6430	564	niez.	3	4	1	0
6431	564	Razem	4	0	0	0
6432	565	PiS	179	0	0	7
6433	565	KO	0	151	0	5
6434	565	Demokracja	2	1	0	1
6435	565	PSL-TD	0	32	0	0
6436	565	Konfederacja	0	7	7	2
6437	565	Centrum	0	14	0	1
6438	565	Lewica	0	21	0	0
6439	565	Polska2050	0	13	0	2
6440	565	Konfederacja_KP	0	3	0	0
6441	565	niez.	3	4	1	0
6442	565	Razem	4	0	0	0
6443	566	PiS	177	1	0	8
6444	566	KO	0	149	1	6
6445	566	Demokracja	2	1	0	1
6446	566	PSL-TD	0	31	0	1
6447	566	Konfederacja	0	7	7	2
6448	566	Centrum	0	14	0	1
6449	566	Lewica	0	21	0	0
6450	566	Polska2050	0	12	0	3
6451	566	Konfederacja_KP	0	3	0	0
6452	566	niez.	3	4	1	0
6453	566	Razem	4	0	0	0
6454	567	PiS	179	0	0	7
6455	567	KO	0	152	0	4
6456	567	Demokracja	2	1	0	1
6457	567	PSL-TD	0	32	0	0
6458	567	Konfederacja	0	6	7	3
6459	567	Centrum	0	14	0	1
6460	567	Lewica	0	21	0	0
6461	567	Polska2050	0	14	0	1
6462	567	Konfederacja_KP	0	3	0	0
6463	567	niez.	3	4	1	0
6464	567	Razem	4	0	0	0
6465	568	PiS	178	0	0	8
6466	568	KO	0	151	0	5
6467	568	Demokracja	1	1	0	2
6468	568	PSL-TD	0	31	0	1
6469	568	Konfederacja	0	7	7	2
6470	568	Centrum	0	13	0	2
6471	568	Lewica	0	21	0	0
6472	568	Polska2050	0	14	0	1
6473	568	Konfederacja_KP	0	3	0	0
6474	568	niez.	3	3	1	1
6475	568	Razem	4	0	0	0
6476	569	PiS	177	0	1	8
6477	569	KO	0	152	0	4
6478	569	Demokracja	2	1	0	1
6479	569	PSL-TD	0	32	0	0
6480	569	Konfederacja	0	7	7	2
6481	569	Centrum	0	13	0	2
6482	569	Lewica	0	21	0	0
6483	569	Polska2050	0	14	0	1
6484	569	Konfederacja_KP	0	3	0	0
6485	569	niez.	3	3	1	1
6486	569	Razem	4	0	0	0
6487	570	PiS	178	0	0	8
6488	570	KO	0	152	0	4
6489	570	Demokracja	2	1	0	1
6490	570	PSL-TD	0	32	0	0
6491	570	Konfederacja	0	7	7	2
6492	570	Centrum	0	14	0	1
6493	570	Lewica	0	21	0	0
6494	570	Polska2050	0	14	0	1
6495	570	Konfederacja_KP	0	3	0	0
6496	570	niez.	3	4	1	0
6497	570	Razem	4	0	0	0
6498	571	PiS	175	0	2	9
6499	571	KO	0	152	0	4
6500	571	Demokracja	2	1	0	1
6501	571	PSL-TD	0	31	0	1
6502	571	Konfederacja	0	6	7	3
6503	571	Centrum	0	14	0	1
6504	571	Lewica	0	21	0	0
6505	571	Polska2050	0	14	0	1
6506	571	Konfederacja_KP	0	3	0	0
6507	571	niez.	3	4	1	0
6508	571	Razem	4	0	0	0
6509	572	PiS	6	172	0	8
6510	572	KO	0	152	0	4
6511	572	Demokracja	0	3	0	1
6512	572	PSL-TD	0	31	0	1
6513	572	Konfederacja	0	6	8	2
6514	572	Centrum	0	14	0	1
6515	572	Lewica	0	21	0	0
6516	572	Polska2050	0	14	0	1
6517	572	Konfederacja_KP	0	3	0	0
6518	572	niez.	2	5	1	0
6519	572	Razem	4	0	0	0
6520	573	PiS	177	1	0	8
6521	573	KO	0	152	0	4
6522	573	Demokracja	2	1	0	1
6523	573	PSL-TD	0	31	0	1
6524	573	Konfederacja	0	7	7	2
6525	573	Centrum	0	14	0	1
6526	573	Lewica	0	21	0	0
6527	573	Polska2050	0	14	0	1
6528	573	Konfederacja_KP	0	3	0	0
6529	573	niez.	3	4	1	0
6530	573	Razem	4	0	0	0
6531	574	PiS	179	0	0	7
6532	574	KO	0	152	0	4
6533	574	Demokracja	2	1	0	1
6534	574	PSL-TD	0	30	0	2
6535	574	Konfederacja	0	14	0	2
6536	574	Centrum	0	14	0	1
6537	574	Lewica	0	21	0	0
6538	574	Polska2050	0	14	0	1
6539	574	Konfederacja_KP	0	3	0	0
6540	574	niez.	2	4	1	1
6541	574	Razem	4	0	0	0
6542	575	PiS	179	0	0	7
6543	575	KO	0	152	0	4
6544	575	Demokracja	2	1	0	1
6545	575	PSL-TD	0	31	0	1
6546	575	Konfederacja	0	7	7	2
6547	575	Centrum	0	14	0	1
6548	575	Lewica	0	21	0	0
6549	575	Polska2050	0	14	0	1
6550	575	Konfederacja_KP	0	3	0	0
6551	575	niez.	3	4	1	0
6552	575	Razem	4	0	0	0
6553	576	PiS	179	0	0	7
6554	576	KO	152	0	0	4
6555	576	Demokracja	2	1	0	1
6556	576	PSL-TD	30	2	0	0
6557	576	Konfederacja	0	7	7	2
6558	576	Centrum	14	0	0	1
6559	576	Lewica	21	0	0	0
6560	576	Polska2050	13	0	0	2
6561	576	Konfederacja_KP	0	3	0	0
6562	576	niez.	6	1	1	0
6563	576	Razem	3	0	0	1
6564	577	PiS	179	0	0	7
6565	577	KO	0	151	0	5
6566	577	Demokracja	2	1	0	1
6567	577	PSL-TD	0	31	0	1
6568	577	Konfederacja	0	7	7	2
6569	577	Centrum	0	14	0	1
6570	577	Lewica	0	21	0	0
6571	577	Polska2050	0	14	0	1
6572	577	Konfederacja_KP	0	3	0	0
6573	577	niez.	3	4	1	0
6574	577	Razem	4	0	0	0
6575	578	PiS	177	0	0	9
6576	578	KO	0	151	0	5
6577	578	Demokracja	2	1	0	1
6578	578	PSL-TD	0	32	0	0
6579	578	Konfederacja	0	14	0	2
6580	578	Centrum	0	14	0	1
6581	578	Lewica	0	21	0	0
6582	578	Polska2050	0	14	0	1
6583	578	Konfederacja_KP	0	3	0	0
6584	578	niez.	3	4	1	0
6585	578	Razem	4	0	0	0
6586	579	PiS	179	0	0	7
6587	579	KO	0	151	0	5
6588	579	Demokracja	2	1	0	1
6589	579	PSL-TD	0	32	0	0
6590	579	Konfederacja	0	7	7	2
6591	579	Centrum	0	13	0	2
6592	579	Lewica	0	21	0	0
6593	579	Polska2050	0	14	0	1
6594	579	Konfederacja_KP	0	3	0	0
6595	579	niez.	3	4	1	0
6596	579	Razem	4	0	0	0
6597	580	PiS	179	0	0	7
6598	580	KO	0	152	0	4
6599	580	Demokracja	2	0	1	1
6600	580	PSL-TD	0	32	0	0
6601	580	Konfederacja	0	0	14	2
6602	580	Centrum	0	14	0	1
6603	580	Lewica	0	21	0	0
6604	580	Polska2050	0	14	0	1
6605	580	Konfederacja_KP	2	1	0	0
6606	580	niez.	3	3	2	0
6607	580	Razem	4	0	0	0
6608	581	PiS	0	177	0	9
6609	581	KO	152	0	0	4
6610	581	Demokracja	0	3	0	1
6611	581	PSL-TD	32	0	0	0
6612	581	Konfederacja	0	7	7	2
6613	581	Centrum	14	0	0	1
6614	581	Lewica	21	0	0	0
6615	581	Polska2050	14	0	0	1
6616	581	Konfederacja_KP	0	0	3	0
6617	581	niez.	4	4	0	0
6618	581	Razem	0	4	0	0
6619	582	PiS	2	0	177	7
6620	582	KO	149	0	0	7
6621	582	Demokracja	3	0	0	1
6622	582	PSL-TD	32	0	0	0
6623	582	Konfederacja	14	0	0	2
6624	582	Centrum	14	0	0	1
6625	582	Lewica	21	0	0	0
6626	582	Polska2050	14	0	0	1
6627	582	Konfederacja_KP	3	0	0	0
6628	582	niez.	5	0	2	1
6629	582	Razem	4	0	0	0
6630	583	PiS	1	0	178	7
6631	583	KO	151	0	0	5
6632	583	Demokracja	1	0	2	1
6633	583	PSL-TD	32	0	0	0
6634	583	Konfederacja	13	0	1	2
6635	583	Centrum	14	0	0	1
6636	583	Lewica	21	0	0	0
6637	583	Polska2050	12	2	0	1
6638	583	Konfederacja_KP	3	0	0	0
6639	583	niez.	6	0	2	0
6640	583	Razem	4	0	0	0
6641	584	PiS	179	0	0	7
6642	584	KO	150	0	1	5
6643	584	Demokracja	2	1	0	1
6644	584	PSL-TD	31	1	0	0
6645	584	Konfederacja	10	3	1	2
6646	584	Centrum	14	0	0	1
6647	584	Lewica	21	0	0	0
6648	584	Polska2050	14	0	0	1
6649	584	Konfederacja_KP	0	2	1	0
6650	584	niez.	8	0	0	0
6651	584	Razem	4	0	0	0
6652	585	PiS	179	0	0	7
6653	585	KO	0	151	0	5
6654	585	Demokracja	3	0	0	1
6655	585	PSL-TD	0	32	0	0
6656	585	Konfederacja	13	0	0	3
6657	585	Centrum	0	14	0	1
6658	585	Lewica	0	20	0	1
6659	585	Polska2050	0	14	0	1
6660	585	Konfederacja_KP	3	0	0	0
6661	585	niez.	4	3	1	0
6662	585	Razem	0	0	4	0
6663	586	PiS	178	0	0	8
6664	586	KO	0	152	0	4
6665	586	Demokracja	3	0	0	1
6666	586	PSL-TD	0	32	0	0
6667	586	Konfederacja	13	0	0	3
6668	586	Centrum	0	14	0	1
6669	586	Lewica	0	21	0	0
6670	586	Polska2050	0	14	0	1
6671	586	Konfederacja_KP	1	0	2	0
6672	586	niez.	4	3	1	0
6673	586	Razem	0	0	4	0
6674	587	PiS	179	0	0	7
6675	587	KO	0	150	0	6
6676	587	Demokracja	3	0	0	1
6677	587	PSL-TD	2	29	0	1
6678	587	Konfederacja	14	0	0	2
6679	587	Centrum	0	13	0	2
6680	587	Lewica	0	21	0	0
6681	587	Polska2050	0	13	0	2
6682	587	Konfederacja_KP	3	0	0	0
6683	587	niez.	4	3	1	0
6684	587	Razem	0	0	3	1
6685	588	PiS	178	0	1	7
6686	588	KO	0	152	0	4
6687	588	Demokracja	3	0	0	1
6688	588	PSL-TD	0	30	0	2
6689	588	Konfederacja	14	0	0	2
6690	588	Centrum	0	14	0	1
6691	588	Lewica	0	20	0	1
6692	588	Polska2050	0	13	0	2
6693	588	Konfederacja_KP	3	0	0	0
6694	588	niez.	4	3	1	0
6695	588	Razem	0	0	4	0
6696	589	PiS	179	0	0	7
6697	589	KO	0	152	0	4
6698	589	Demokracja	3	0	0	1
6699	589	PSL-TD	0	32	0	0
6700	589	Konfederacja	13	0	0	3
6701	589	Centrum	0	14	0	1
6702	589	Lewica	0	21	0	0
6703	589	Polska2050	0	14	0	1
6704	589	Konfederacja_KP	3	0	0	0
6705	589	niez.	3	3	2	0
6706	589	Razem	0	0	4	0
6707	590	PiS	179	0	0	7
6708	590	KO	0	152	0	4
6709	590	Demokracja	3	0	0	1
6710	590	PSL-TD	2	30	0	0
6711	590	Konfederacja	14	0	0	2
6712	590	Centrum	0	14	0	1
6713	590	Lewica	0	21	0	0
6714	590	Polska2050	0	14	0	1
6715	590	Konfederacja_KP	3	0	0	0
6716	590	niez.	3	3	2	0
6717	590	Razem	0	0	4	0
6718	591	PiS	179	0	0	7
6719	591	KO	0	152	0	4
6720	591	Demokracja	3	0	0	1
6721	591	PSL-TD	3	29	0	0
6722	591	Konfederacja	13	0	0	3
6723	591	Centrum	0	14	0	1
6724	591	Lewica	0	21	0	0
6725	591	Polska2050	0	14	0	1
6726	591	Konfederacja_KP	3	0	0	0
6727	591	niez.	4	3	1	0
6728	591	Razem	0	0	4	0
6729	592	PiS	179	0	0	7
6730	592	KO	150	0	0	6
6731	592	Demokracja	3	0	0	1
6732	592	PSL-TD	31	0	0	1
6733	592	Konfederacja	14	0	0	2
6734	592	Centrum	14	0	0	1
6735	592	Lewica	21	0	0	0
6736	592	Polska2050	14	0	0	1
6737	592	Konfederacja_KP	3	0	0	0
6738	592	niez.	8	0	0	0
6739	592	Razem	4	0	0	0
6740	593	PiS	178	0	0	8
6741	593	KO	0	151	0	5
6742	593	Demokracja	3	0	0	1
6743	593	PSL-TD	0	32	0	0
6744	593	Konfederacja	14	0	0	2
6745	593	Centrum	0	14	0	1
6746	593	Lewica	0	21	0	0
6747	593	Polska2050	0	14	0	1
6748	593	Konfederacja_KP	3	0	0	0
6749	593	niez.	4	4	0	0
6750	593	Razem	4	0	0	0
6751	594	PiS	178	0	0	8
6752	594	KO	152	0	0	4
6753	594	Demokracja	2	1	0	1
6754	594	PSL-TD	31	1	0	0
6755	594	Konfederacja	0	14	0	2
6756	594	Centrum	14	0	0	1
6757	594	Lewica	21	0	0	0
6758	594	Polska2050	14	0	0	1
6759	594	Konfederacja_KP	0	3	0	0
6760	594	niez.	6	1	1	0
6761	594	Razem	0	0	4	0
6762	595	PiS	8	164	0	14
6763	595	KO	0	148	0	8
6764	595	Demokracja	0	3	0	1
6765	595	PSL-TD	0	32	0	0
6766	595	Konfederacja	0	14	0	2
6767	595	Centrum	0	14	0	1
6768	595	Lewica	0	21	0	0
6769	595	Polska2050	0	14	0	1
6770	595	Konfederacja_KP	0	3	0	0
6771	595	niez.	1	7	0	0
6772	595	Razem	0	4	0	0
6773	596	PiS	1	168	0	17
6774	596	KO	0	149	0	7
6775	596	Demokracja	0	3	0	1
6776	596	PSL-TD	0	31	0	1
6777	596	Konfederacja	0	13	0	3
6778	596	Centrum	0	13	0	2
6779	596	Lewica	0	20	0	1
6780	596	Polska2050	0	14	0	1
6781	596	Konfederacja_KP	0	3	0	0
6782	596	niez.	0	7	0	1
6783	596	Razem	0	4	0	0
6784	597	PiS	0	178	0	8
6785	597	KO	0	152	0	4
6786	597	Demokracja	0	3	0	1
6787	597	PSL-TD	0	32	0	0
6788	597	Konfederacja	0	14	0	2
6789	597	Centrum	0	14	0	1
6790	597	Lewica	0	21	0	0
6791	597	Polska2050	0	14	0	1
6792	597	Konfederacja_KP	0	3	0	0
6793	597	niez.	0	8	0	0
6794	597	Razem	0	4	0	0
6795	598	PiS	3	157	0	26
6796	598	KO	0	149	0	7
6797	598	Demokracja	0	3	0	1
6798	598	PSL-TD	0	29	0	3
6799	598	Konfederacja	0	13	0	3
6800	598	Centrum	0	14	0	1
6801	598	Lewica	0	21	0	0
6802	598	Polska2050	0	14	0	1
6803	598	Konfederacja_KP	0	3	0	0
6804	598	niez.	0	7	0	1
6805	598	Razem	0	3	0	1
6806	599	PiS	0	168	0	18
6807	599	KO	0	147	0	9
6808	599	Demokracja	0	3	0	1
6809	599	PSL-TD	0	31	0	1
6810	599	Konfederacja	0	14	0	2
6811	599	Centrum	0	13	0	2
6812	599	Lewica	0	20	0	1
6813	599	Polska2050	0	14	0	1
6814	599	Konfederacja_KP	0	3	0	0
6815	599	niez.	0	7	0	1
6816	599	Razem	0	4	0	0
6817	600	PiS	2	172	1	11
6818	600	KO	0	151	0	5
6819	600	Demokracja	0	3	0	1
6820	600	PSL-TD	0	32	0	0
6821	600	Konfederacja	0	14	0	2
6822	600	Centrum	0	14	0	1
6823	600	Lewica	0	21	0	0
6824	600	Polska2050	0	14	0	1
6825	600	Konfederacja_KP	0	3	0	0
6826	600	niez.	0	7	0	1
6827	600	Razem	0	4	0	0
6828	601	PiS	1	175	0	10
6829	601	KO	0	149	0	7
6830	601	Demokracja	0	3	0	1
6831	601	PSL-TD	0	30	0	2
6832	601	Konfederacja	0	14	0	2
6833	601	Centrum	0	14	0	1
6834	601	Lewica	0	21	0	0
6835	601	Polska2050	0	13	0	2
6836	601	Konfederacja_KP	0	3	0	0
6837	601	niez.	0	7	0	1
6838	601	Razem	0	3	0	1
6839	602	PiS	0	0	177	9
6840	602	KO	148	4	0	4
6841	602	Demokracja	0	3	0	1
6842	602	PSL-TD	23	6	0	3
6843	602	Konfederacja	0	14	0	2
6844	602	Centrum	14	0	0	1
6845	602	Lewica	21	0	0	0
6846	602	Polska2050	14	0	0	1
6847	602	Konfederacja_KP	0	3	0	0
6848	602	niez.	4	1	2	1
6849	602	Razem	0	0	2	2
6850	603	PiS	0	8	167	11
6851	603	KO	0	151	0	5
6852	603	Demokracja	0	0	3	1
6853	603	PSL-TD	0	32	0	0
6854	603	Konfederacja	0	0	14	2
6855	603	Centrum	0	14	0	1
6856	603	Lewica	0	21	0	0
6857	603	Polska2050	0	14	0	1
6858	603	Konfederacja_KP	0	0	3	0
6859	603	niez.	0	5	2	1
6860	603	Razem	0	4	0	0
6861	604	PiS	0	174	2	10
6862	604	KO	1	149	0	6
6863	604	Demokracja	0	3	0	1
6864	604	PSL-TD	0	32	0	0
6865	604	Konfederacja	0	14	0	2
6866	604	Centrum	0	14	0	1
6867	604	Lewica	0	21	0	0
6868	604	Polska2050	0	14	0	1
6869	604	Konfederacja_KP	0	3	0	0
6870	604	niez.	0	7	0	1
6871	604	Razem	0	4	0	0
6872	605	PiS	174	3	0	9
6873	605	KO	146	1	0	9
6874	605	Demokracja	2	1	0	1
6875	605	PSL-TD	32	0	0	0
6876	605	Konfederacja	0	14	0	2
6877	605	Centrum	14	0	0	1
6878	605	Lewica	21	0	0	0
6879	605	Polska2050	13	0	0	2
6880	605	Konfederacja_KP	0	3	0	0
6881	605	niez.	6	1	0	1
6882	605	Razem	4	0	0	0
6883	606	PiS	172	0	0	14
6884	606	KO	0	150	0	6
6885	606	Demokracja	2	1	0	1
6886	606	PSL-TD	0	32	0	0
6887	606	Konfederacja	0	14	0	2
6888	606	Centrum	0	14	0	1
6889	606	Lewica	0	21	0	0
6890	606	Polska2050	0	14	0	1
6891	606	Konfederacja_KP	0	3	0	0
6892	606	niez.	1	6	0	1
6893	606	Razem	0	4	0	0
6894	607	PiS	176	0	0	10
6895	607	KO	0	152	0	4
6896	607	Demokracja	3	0	0	1
6897	607	PSL-TD	0	32	0	0
6898	607	Konfederacja	14	0	0	2
6899	607	Centrum	0	14	0	1
6900	607	Lewica	0	21	0	0
6901	607	Polska2050	0	14	0	1
6902	607	Konfederacja_KP	3	0	0	0
6903	607	niez.	3	4	0	1
6904	607	Razem	0	4	0	0
6905	608	PiS	0	1	172	13
6906	608	KO	151	0	0	5
6907	608	Demokracja	0	0	3	1
6908	608	PSL-TD	30	0	0	2
6909	608	Konfederacja	0	0	13	3
6910	608	Centrum	14	0	0	1
6911	608	Lewica	21	0	0	0
6912	608	Polska2050	14	0	0	1
6913	608	Konfederacja_KP	0	0	3	0
6914	608	niez.	4	1	2	1
6915	608	Razem	4	0	0	0
6916	609	PiS	0	0	152	34
6917	609	KO	148	0	0	8
6918	609	Demokracja	3	0	0	1
6919	609	PSL-TD	28	0	0	4
6920	609	Konfederacja	13	0	0	3
6921	609	Centrum	12	0	0	3
6922	609	Lewica	21	0	0	0
6923	609	Polska2050	14	0	0	1
6924	609	Konfederacja_KP	3	0	0	0
6925	609	niez.	4	1	1	2
6926	609	Razem	4	0	0	0
6927	610	PiS	0	2	157	27
6928	610	KO	151	0	0	5
6929	610	Demokracja	0	0	2	2
6930	610	PSL-TD	31	0	0	1
6931	610	Konfederacja	0	0	12	4
6932	610	Centrum	14	0	0	1
6933	610	Lewica	21	0	0	0
6934	610	Polska2050	13	0	0	2
6935	610	Konfederacja_KP	0	0	3	0
6936	610	niez.	4	1	2	1
6937	610	Razem	4	0	0	0
6938	611	PiS	1	1	169	15
6939	611	KO	152	0	0	4
6940	611	Demokracja	3	0	0	1
6941	611	PSL-TD	28	0	0	4
6942	611	Konfederacja	14	0	0	2
6943	611	Centrum	14	0	0	1
6944	611	Lewica	21	0	0	0
6945	611	Polska2050	14	0	0	1
6946	611	Konfederacja_KP	3	0	0	0
6947	611	niez.	5	1	1	1
6948	611	Razem	4	0	0	0
6949	612	PiS	166	1	9	10
6950	612	KO	151	1	0	4
6951	612	Demokracja	0	0	3	1
6952	612	PSL-TD	32	0	0	0
6953	612	Konfederacja	0	0	14	2
6954	612	Centrum	14	0	0	1
6955	612	Lewica	21	0	0	0
6956	612	Polska2050	13	1	0	1
6957	612	Konfederacja_KP	0	0	3	0
6958	612	niez.	5	1	1	1
6959	612	Razem	4	0	0	0
6960	613	PiS	2	0	173	11
6961	613	KO	152	0	0	4
6962	613	Demokracja	2	0	1	1
6963	613	PSL-TD	32	0	0	0
6964	613	Konfederacja	14	0	0	2
6965	613	Centrum	14	0	0	1
6966	613	Lewica	21	0	0	0
6967	613	Polska2050	14	0	0	1
6968	613	Konfederacja_KP	3	0	0	0
6969	613	niez.	5	1	1	1
6970	613	Razem	4	0	0	0
6971	614	PiS	0	0	175	11
6972	614	KO	152	0	0	4
6973	614	Demokracja	0	0	3	1
6974	614	PSL-TD	32	0	0	0
6975	614	Konfederacja	0	0	14	2
6976	614	Centrum	14	0	0	1
6977	614	Lewica	21	0	0	0
6978	614	Polska2050	14	0	0	1
6979	614	Konfederacja_KP	0	0	3	0
6980	614	niez.	3	1	2	2
6981	614	Razem	4	0	0	0
6982	615	PiS	1	1	171	13
6983	615	KO	151	0	0	5
6984	615	Demokracja	2	0	1	1
6985	615	PSL-TD	30	0	0	2
6986	615	Konfederacja	14	0	0	2
6987	615	Centrum	14	0	0	1
6988	615	Lewica	21	0	0	0
6989	615	Polska2050	14	0	0	1
6990	615	Konfederacja_KP	3	0	0	0
6991	615	niez.	5	1	1	1
6992	615	Razem	4	0	0	0
6993	616	PiS	0	0	175	11
6994	616	KO	151	0	0	5
6995	616	Demokracja	3	0	0	1
6996	616	PSL-TD	32	0	0	0
6997	616	Konfederacja	14	0	0	2
6998	616	Centrum	14	0	0	1
6999	616	Lewica	21	0	0	0
7000	616	Polska2050	14	0	0	1
7001	616	Konfederacja_KP	3	0	0	0
7002	616	niez.	5	1	1	1
7003	616	Razem	4	0	0	0
7004	617	PiS	0	0	175	11
7005	617	KO	147	0	0	9
7006	617	Demokracja	3	0	0	1
7007	617	PSL-TD	32	0	0	0
7008	617	Konfederacja	14	0	0	2
7009	617	Centrum	14	0	0	1
7010	617	Lewica	21	0	0	0
7011	617	Polska2050	14	0	0	1
7012	617	Konfederacja_KP	3	0	0	0
7013	617	niez.	5	1	1	1
7014	617	Razem	4	0	0	0
7015	618	PiS	0	159	17	10
7016	618	KO	149	0	0	7
7017	618	Demokracja	0	0	3	1
7018	618	PSL-TD	31	0	0	1
7019	618	Konfederacja	0	0	14	2
7020	618	Centrum	14	0	0	1
7021	618	Lewica	21	0	0	0
7022	618	Polska2050	13	0	0	2
7023	618	Konfederacja_KP	0	0	3	0
7024	618	niez.	4	2	1	1
7025	618	Razem	4	0	0	0
7026	619	PiS	0	0	172	14
7027	619	KO	152	0	0	4
7028	619	Demokracja	3	0	0	1
7029	619	PSL-TD	32	0	0	0
7030	619	Konfederacja	13	0	0	3
7031	619	Centrum	13	0	0	2
7032	619	Lewica	21	0	0	0
7033	619	Polska2050	14	0	0	1
7034	619	Konfederacja_KP	3	0	0	0
7035	619	niez.	4	1	2	1
7036	619	Razem	4	0	0	0
7037	620	PiS	1	1	171	13
7038	620	KO	152	0	0	4
7039	620	Demokracja	0	0	2	2
7040	620	PSL-TD	31	0	0	1
7041	620	Konfederacja	0	0	14	2
7042	620	Centrum	14	0	0	1
7043	620	Lewica	20	0	0	1
7044	620	Polska2050	14	0	0	1
7045	620	Konfederacja_KP	0	0	3	0
7046	620	niez.	4	1	1	2
7047	620	Razem	4	0	0	0
7048	621	PiS	0	0	176	10
7049	621	KO	152	0	0	4
7050	621	Demokracja	0	0	3	1
7051	621	PSL-TD	31	0	0	1
7052	621	Konfederacja	0	0	14	2
7053	621	Centrum	14	0	0	1
7054	621	Lewica	21	0	0	0
7055	621	Polska2050	14	0	0	1
7056	621	Konfederacja_KP	0	0	3	0
7057	621	niez.	3	1	3	1
7058	621	Razem	4	0	0	0
7059	622	PiS	0	173	0	13
7060	622	KO	147	0	0	9
7061	622	Demokracja	0	3	0	1
7062	622	PSL-TD	32	0	0	0
7063	622	Konfederacja	0	2	9	5
7064	622	Centrum	14	0	0	1
7065	622	Lewica	21	0	0	0
7066	622	Polska2050	13	0	0	2
7067	622	Konfederacja_KP	0	1	2	0
7068	622	niez.	4	3	0	1
7069	622	Razem	0	3	0	1
7070	624	PiS	168	0	0	18
7071	624	KO	0	150	0	6
7072	624	Demokracja	3	0	0	1
7073	624	PSL-TD	32	0	0	0
7074	624	Konfederacja	12	0	0	4
7075	624	Centrum	0	11	1	3
7076	624	Lewica	0	21	0	0
7077	624	Polska2050	8	3	2	2
7078	624	Konfederacja_KP	0	3	0	0
7079	624	niez.	3	2	1	2
7080	624	Razem	0	4	0	0
7081	625	PiS	159	0	0	27
7082	625	KO	0	151	0	5
7083	625	Demokracja	3	0	0	1
7084	625	PSL-TD	0	31	0	1
7085	625	Konfederacja	12	0	0	4
7086	625	Centrum	0	12	0	3
7087	625	Lewica	0	21	0	0
7088	625	Polska2050	0	12	0	3
7089	625	Konfederacja_KP	3	0	0	0
7090	625	niez.	3	4	0	1
7091	625	Razem	0	4	0	0
7092	626	PiS	151	0	0	35
7093	626	KO	2	145	0	9
7094	626	Demokracja	3	0	0	1
7095	626	PSL-TD	1	25	0	6
7096	626	Konfederacja	12	0	0	4
7097	626	Centrum	0	12	0	3
7098	626	Lewica	0	20	0	1
7099	626	Polska2050	0	11	0	4
7100	626	Konfederacja_KP	3	0	0	0
7101	626	niez.	3	4	0	1
7102	626	Razem	0	4	0	0
7103	627	PiS	150	0	0	36
7104	627	KO	0	151	0	5
7105	627	Demokracja	3	0	0	1
7106	627	PSL-TD	0	29	0	3
7107	627	Konfederacja	12	0	0	4
7108	627	Centrum	0	12	0	3
7109	627	Lewica	1	20	0	0
7110	627	Polska2050	0	13	0	2
7111	627	Konfederacja_KP	3	0	0	0
7112	627	niez.	3	2	0	3
7113	627	Razem	4	0	0	0
7114	628	PiS	7	147	0	32
7115	628	KO	145	1	2	8
7116	628	Demokracja	1	2	0	1
7117	628	PSL-TD	28	0	0	4
7118	628	Konfederacja	11	0	1	4
7119	628	Centrum	12	0	0	3
7120	628	Lewica	21	0	0	0
7121	628	Polska2050	13	0	0	2
7122	628	Konfederacja_KP	2	0	0	1
7123	628	niez.	5	1	1	1
7124	628	Razem	4	0	0	0
7125	629	PiS	0	169	0	17
7126	629	KO	144	0	0	12
7127	629	Demokracja	0	4	0	0
7128	629	PSL-TD	30	0	0	2
7129	629	Konfederacja	0	12	0	4
7130	629	Centrum	13	0	0	2
7131	629	Lewica	21	0	0	0
7132	629	Polska2050	13	0	0	2
7133	629	Konfederacja_KP	0	0	0	3
7134	629	niez.	5	1	0	2
7135	629	Razem	4	0	0	0
7136	630	PiS	168	1	0	17
7137	630	KO	0	145	0	11
7138	630	Demokracja	4	0	0	0
7139	630	PSL-TD	0	32	0	0
7140	630	Konfederacja	12	0	0	4
7141	630	Centrum	0	13	0	2
7142	630	Lewica	0	21	0	0
7143	630	Polska2050	0	13	0	2
7144	630	Konfederacja_KP	0	0	0	3
7145	630	niez.	4	3	0	1
7146	630	Razem	4	0	0	0
7147	631	PiS	0	0	0	186
7148	631	KO	0	0	0	156
7149	631	Demokracja	0	0	0	4
7150	631	PSL-TD	0	0	0	32
7151	631	Konfederacja	0	0	0	16
7152	631	Centrum	0	0	0	15
7153	631	Lewica	0	0	0	21
7154	631	Polska2050	0	0	0	15
7155	631	Konfederacja_KP	0	0	0	3
7156	631	niez.	0	0	0	8
7157	631	Razem	0	0	0	4
7158	632	PiS	0	159	0	27
7159	632	KO	150	0	0	6
7160	632	Demokracja	0	3	0	1
7161	632	PSL-TD	31	0	0	1
7162	632	Konfederacja	0	12	0	4
7163	632	Centrum	11	0	0	4
7164	632	Lewica	18	0	0	3
7165	632	Polska2050	11	0	0	4
7166	632	Konfederacja_KP	0	3	0	0
7167	632	niez.	4	3	0	1
7168	632	Razem	4	0	0	0
7169	633	PiS	155	0	4	27
7170	633	KO	149	0	0	7
7171	633	Demokracja	1	2	0	1
7172	633	PSL-TD	31	0	0	1
7173	633	Konfederacja	0	12	0	4
7174	633	Centrum	11	0	0	4
7175	633	Lewica	19	0	0	2
7176	633	Polska2050	10	0	0	5
7177	633	Konfederacja_KP	0	3	0	0
7178	633	niez.	6	1	0	1
7179	633	Razem	4	0	0	0
7180	634	PiS	160	0	0	26
7181	634	KO	147	0	0	9
7182	634	Demokracja	3	0	0	1
7183	634	PSL-TD	32	0	0	0
7184	634	Konfederacja	0	12	0	4
7185	634	Centrum	11	0	0	4
7186	634	Lewica	18	0	0	3
7187	634	Polska2050	10	0	0	5
7188	634	Konfederacja_KP	0	3	0	0
7189	634	niez.	6	1	0	1
7190	634	Razem	4	0	0	0
7191	635	PiS	162	1	0	23
7192	635	KO	150	0	0	6
7193	635	Demokracja	3	0	0	1
7194	635	PSL-TD	32	0	0	0
7195	635	Konfederacja	0	12	0	4
7196	635	Centrum	10	0	0	5
7197	635	Lewica	19	0	0	2
7198	635	Polska2050	12	0	0	3
7199	635	Konfederacja_KP	0	3	0	0
7200	635	niez.	6	1	0	1
7201	635	Razem	4	0	0	0
7202	636	PiS	0	164	0	22
7203	636	KO	149	0	1	6
7204	636	Demokracja	0	3	0	1
7205	636	PSL-TD	32	0	0	0
7206	636	Konfederacja	0	12	0	4
7207	636	Centrum	12	0	0	3
7208	636	Lewica	19	0	0	2
7209	636	Polska2050	13	0	0	2
7210	636	Konfederacja_KP	0	3	0	0
7211	636	niez.	4	3	0	1
7212	636	Razem	4	0	0	0
7213	637	PiS	163	0	4	19
7214	637	KO	1	148	0	7
7215	637	Demokracja	2	0	0	2
7216	637	PSL-TD	1	30	0	1
7217	637	Konfederacja	5	5	2	4
7218	637	Centrum	0	13	0	2
7219	637	Lewica	0	21	0	0
7220	637	Polska2050	0	13	0	2
7221	637	Konfederacja_KP	3	0	0	0
7222	637	niez.	3	3	0	2
7223	637	Razem	4	0	0	0
7224	638	PiS	0	0	0	186
7225	638	KO	0	0	0	156
7226	638	Demokracja	0	0	0	4
7227	638	PSL-TD	0	0	0	32
7228	638	Konfederacja	0	0	0	16
7229	638	Centrum	0	0	0	15
7230	638	Lewica	0	0	0	21
7231	638	Polska2050	0	0	0	15
7232	638	Konfederacja_KP	0	0	0	3
7233	638	niez.	0	0	0	8
7234	638	Razem	0	0	0	4
7235	639	PiS	163	1	1	21
7236	639	KO	153	0	0	3
7237	639	Demokracja	3	0	0	1
7238	639	PSL-TD	32	0	0	0
7239	639	Konfederacja	13	0	0	3
7240	639	Centrum	11	0	0	4
7241	639	Lewica	21	0	0	0
7242	639	Polska2050	11	0	0	4
7243	639	Konfederacja_KP	3	0	0	0
7244	639	niez.	8	0	0	0
7245	639	Razem	4	0	0	0
7246	640	PiS	168	0	1	17
7247	640	KO	153	0	0	3
7248	640	Demokracja	3	0	0	1
7249	640	PSL-TD	32	0	0	0
7250	640	Konfederacja	13	0	0	3
7251	640	Centrum	13	0	0	2
7252	640	Lewica	21	0	0	0
7253	640	Polska2050	13	0	0	2
7254	640	Konfederacja_KP	3	0	0	0
7255	640	niez.	8	0	0	0
7256	640	Razem	4	0	0	0
7257	641	PiS	168	0	1	17
7258	641	KO	148	1	1	6
7259	641	Demokracja	3	0	0	1
7260	641	PSL-TD	32	0	0	0
7261	641	Konfederacja	13	0	0	3
7262	641	Centrum	12	0	0	3
7263	641	Lewica	21	0	0	0
7264	641	Polska2050	13	0	0	2
7265	641	Konfederacja_KP	3	0	0	0
7266	641	niez.	8	0	0	0
7267	641	Razem	4	0	0	0
7268	642	PiS	166	0	0	20
7269	642	KO	152	0	1	3
7270	642	Demokracja	3	0	0	1
7271	642	PSL-TD	32	0	0	0
7272	642	Konfederacja	0	0	13	3
7273	642	Centrum	13	0	0	2
7274	642	Lewica	21	0	0	0
7275	642	Polska2050	13	0	0	2
7276	642	Konfederacja_KP	0	0	3	0
7277	642	niez.	6	0	2	0
7278	642	Razem	0	0	4	0
7279	643	PiS	163	0	0	23
7280	643	KO	151	0	1	4
7281	643	Demokracja	3	0	0	1
7282	643	PSL-TD	32	0	0	0
7283	643	Konfederacja	1	0	12	3
7284	643	Centrum	13	0	0	2
7285	643	Lewica	21	0	0	0
7286	643	Polska2050	13	0	0	2
7287	643	Konfederacja_KP	0	0	3	0
7288	643	niez.	6	0	2	0
7289	643	Razem	0	0	4	0
7290	644	PiS	163	0	1	22
7291	644	KO	152	0	1	3
7292	644	Demokracja	3	0	0	1
7293	644	PSL-TD	31	0	0	1
7294	644	Konfederacja	0	0	13	3
7295	644	Centrum	13	0	0	2
7296	644	Lewica	21	0	0	0
7297	644	Polska2050	12	0	0	3
7298	644	Konfederacja_KP	0	0	2	1
7299	644	niez.	6	0	2	0
7300	644	Razem	0	0	4	0
7301	645	PiS	167	0	0	19
7302	645	KO	2	150	1	3
7303	645	Demokracja	3	0	0	1
7304	645	PSL-TD	2	23	0	7
7305	645	Konfederacja	14	0	0	2
7306	645	Centrum	0	13	0	2
7307	645	Lewica	0	21	0	0
7308	645	Polska2050	0	13	0	2
7309	645	Konfederacja_KP	3	0	0	0
7310	645	niez.	2	4	1	1
7311	645	Razem	0	0	4	0
7312	646	PiS	167	0	0	19
7313	646	KO	152	0	1	3
7314	646	Demokracja	3	0	0	1
7315	646	PSL-TD	32	0	0	0
7316	646	Konfederacja	0	0	14	2
7317	646	Centrum	13	0	0	2
7318	646	Lewica	21	0	0	0
7319	646	Polska2050	13	0	0	2
7320	646	Konfederacja_KP	0	0	3	0
7321	646	niez.	6	0	2	0
7322	646	Razem	0	0	4	0
7323	647	PiS	166	0	0	20
7324	647	KO	151	0	1	4
7325	647	Demokracja	3	0	0	1
7326	647	PSL-TD	32	0	0	0
7327	647	Konfederacja	0	0	14	2
7328	647	Centrum	13	0	0	2
7329	647	Lewica	21	0	0	0
7330	647	Polska2050	13	0	0	2
7331	647	Konfederacja_KP	0	0	3	0
7332	647	niez.	6	0	2	0
7333	647	Razem	0	0	4	0
7334	648	PiS	168	0	0	18
7335	648	KO	3	149	1	3
7336	648	Demokracja	3	0	0	1
7337	648	PSL-TD	0	32	0	0
7338	648	Konfederacja	0	0	12	4
7339	648	Centrum	0	12	0	3
7340	648	Lewica	0	21	0	0
7341	648	Polska2050	1	12	0	2
7342	648	Konfederacja_KP	0	0	3	0
7343	648	niez.	3	4	1	0
7344	648	Razem	0	0	3	1
7345	649	PiS	170	0	0	16
7346	649	KO	151	0	1	4
7347	649	Demokracja	3	0	0	1
7348	649	PSL-TD	32	0	0	0
7349	649	Konfederacja	14	0	0	2
7350	649	Centrum	13	0	0	2
7351	649	Lewica	21	0	0	0
7352	649	Polska2050	13	0	0	2
7353	649	Konfederacja_KP	3	0	0	0
7354	649	niez.	7	1	0	0
7355	649	Razem	0	4	0	0
7356	650	PiS	168	0	0	18
7357	650	KO	151	0	0	5
7358	650	Demokracja	3	0	0	1
7359	650	PSL-TD	32	0	0	0
7360	650	Konfederacja	0	13	1	2
7361	650	Centrum	13	0	0	2
7362	650	Lewica	20	0	0	1
7363	650	Polska2050	13	0	0	2
7364	650	Konfederacja_KP	0	3	0	0
7365	650	niez.	8	0	0	0
7366	650	Razem	4	0	0	0
7367	651	PiS	165	1	0	20
7368	651	KO	149	0	0	7
7369	651	Demokracja	2	0	0	2
7370	651	PSL-TD	31	0	0	1
7371	651	Konfederacja	7	6	1	2
7372	651	Centrum	13	0	0	2
7373	651	Lewica	20	0	0	1
7374	651	Polska2050	13	0	0	2
7375	651	Konfederacja_KP	0	0	3	0
7376	651	niez.	8	0	0	0
7377	651	Razem	4	0	0	0
7378	652	PiS	167	0	0	19
7379	652	KO	144	6	0	6
7380	652	Demokracja	3	0	0	1
7381	652	PSL-TD	27	2	0	3
7382	652	Konfederacja	12	0	1	3
7383	652	Centrum	12	1	0	2
7384	652	Lewica	7	13	0	1
7385	652	Polska2050	2	10	0	3
7386	652	Konfederacja_KP	3	0	0	0
7387	652	niez.	6	1	1	0
7388	652	Razem	0	0	3	1
7389	653	PiS	167	0	1	18
7390	653	KO	153	0	0	3
7391	653	Demokracja	3	0	0	1
7392	653	PSL-TD	32	0	0	0
7393	653	Konfederacja	7	6	0	3
7394	653	Centrum	13	0	0	2
7395	653	Lewica	21	0	0	0
7396	653	Polska2050	13	0	0	2
7397	653	Konfederacja_KP	0	0	3	0
7398	653	niez.	7	0	0	1
7399	653	Razem	4	0	0	0
7400	654	PiS	169	0	0	17
7401	654	KO	146	4	0	6
7402	654	Demokracja	3	0	0	1
7403	654	PSL-TD	32	0	0	0
7404	654	Konfederacja	13	0	0	3
7405	654	Centrum	13	0	0	2
7406	654	Lewica	10	5	4	2
7407	654	Polska2050	11	1	1	2
7408	654	Konfederacja_KP	3	0	0	0
7409	654	niez.	6	2	0	0
7410	654	Razem	0	4	0	0
7411	655	PiS	170	0	0	16
7412	655	KO	0	152	1	3
7413	655	Demokracja	3	0	0	1
7414	655	PSL-TD	0	30	1	1
7415	655	Konfederacja	14	0	0	2
7416	655	Centrum	0	13	0	2
7417	655	Lewica	0	21	0	0
7418	655	Polska2050	0	13	0	2
7419	655	Konfederacja_KP	3	0	0	0
7420	655	niez.	4	4	0	0
7421	655	Razem	0	4	0	0
7422	656	PiS	1	166	1	18
7423	656	KO	152	0	1	3
7424	656	Demokracja	1	2	0	1
7425	656	PSL-TD	31	0	0	1
7426	656	Konfederacja	0	1	13	2
7427	656	Centrum	13	0	0	2
7428	656	Lewica	21	0	0	0
7429	656	Polska2050	13	0	0	2
7430	656	Konfederacja_KP	0	0	3	0
7431	656	niez.	4	4	0	0
7432	656	Razem	4	0	0	0
7433	657	PiS	0	165	0	21
7434	657	KO	148	0	1	7
7435	657	Demokracja	0	3	0	1
7436	657	PSL-TD	30	0	0	2
7437	657	Konfederacja	0	1	13	2
7438	657	Centrum	13	0	0	2
7439	657	Lewica	20	0	0	1
7440	657	Polska2050	13	0	0	2
7441	657	Konfederacja_KP	0	0	3	0
7442	657	niez.	5	2	0	1
7443	657	Razem	4	0	0	0
7444	658	PiS	0	170	0	16
7445	658	KO	152	0	1	3
7446	658	Demokracja	0	3	0	1
7447	658	PSL-TD	31	0	1	0
7448	658	Konfederacja	0	14	0	2
7449	658	Centrum	13	0	0	2
7450	658	Lewica	21	0	0	0
7451	658	Polska2050	13	0	0	2
7452	658	Konfederacja_KP	0	3	0	0
7453	658	niez.	4	4	0	0
7454	658	Razem	4	0	0	0
7455	659	PiS	6	155	3	22
7456	659	KO	0	152	0	4
7457	659	Demokracja	2	1	0	1
7458	659	PSL-TD	1	31	0	0
7459	659	Konfederacja	14	0	0	2
7460	659	Centrum	0	13	0	2
7461	659	Lewica	0	21	0	0
7462	659	Polska2050	0	13	0	2
7463	659	Konfederacja_KP	3	0	0	0
7464	659	niez.	2	6	0	0
7465	659	Razem	0	4	0	0
7466	660	PiS	1	24	145	16
7467	660	KO	0	152	0	4
7468	660	Demokracja	0	2	1	1
7469	660	PSL-TD	0	32	0	0
7470	660	Konfederacja	0	14	0	2
7471	660	Centrum	0	13	0	2
7472	660	Lewica	0	21	0	0
7473	660	Polska2050	0	13	0	2
7474	660	Konfederacja_KP	0	3	0	0
7475	660	niez.	1	4	3	0
7476	660	Razem	4	0	0	0
7477	661	PiS	5	2	162	17
7478	661	KO	0	153	0	3
7479	661	Demokracja	0	2	1	1
7480	661	PSL-TD	0	32	0	0
7481	661	Konfederacja	0	14	0	2
7482	661	Centrum	0	13	0	2
7483	661	Lewica	0	20	0	1
7484	661	Polska2050	0	13	0	2
7485	661	Konfederacja_KP	0	3	0	0
7486	661	niez.	2	4	2	0
7487	661	Razem	4	0	0	0
7488	662	PiS	2	4	161	19
7489	662	KO	0	153	0	3
7490	662	Demokracja	3	0	0	1
7491	662	PSL-TD	0	32	0	0
7492	662	Konfederacja	14	0	0	2
7493	662	Centrum	0	13	0	2
7494	662	Lewica	0	21	0	0
7495	662	Polska2050	0	13	0	2
7496	662	Konfederacja_KP	3	0	0	0
7497	662	niez.	1	4	3	0
7498	662	Razem	0	4	0	0
7499	663	PiS	2	1	166	17
7500	663	KO	0	153	0	3
7501	663	Demokracja	3	0	0	1
7502	663	PSL-TD	1	30	0	1
7503	663	Konfederacja	12	0	0	4
7504	663	Centrum	0	12	0	3
7505	663	Lewica	0	21	0	0
7506	663	Polska2050	0	13	0	2
7507	663	Konfederacja_KP	3	0	0	0
7508	663	niez.	1	4	2	1
7509	663	Razem	0	4	0	0
7510	664	PiS	1	0	166	19
7511	664	KO	0	153	0	3
7512	664	Demokracja	3	0	0	1
7513	664	PSL-TD	1	31	0	0
7514	664	Konfederacja	14	0	0	2
7515	664	Centrum	0	13	0	2
7516	664	Lewica	0	21	0	0
7517	664	Polska2050	0	13	0	2
7518	664	Konfederacja_KP	3	0	0	0
7519	664	niez.	1	3	3	1
7520	664	Razem	0	4	0	0
7521	665	PiS	0	7	160	19
7522	665	KO	153	0	0	3
7523	665	Demokracja	0	2	1	1
7524	665	PSL-TD	27	5	0	0
7525	665	Konfederacja	0	14	0	2
7526	665	Centrum	13	0	0	2
7527	665	Lewica	21	0	0	0
7528	665	Polska2050	9	1	0	5
7529	665	Konfederacja_KP	0	3	0	0
7530	665	niez.	5	2	1	0
7531	665	Razem	4	0	0	0
7532	666	PiS	168	2	0	16
7533	666	KO	0	152	0	4
7534	666	Demokracja	1	2	0	1
7535	666	PSL-TD	0	31	0	1
7536	666	Konfederacja	0	14	0	2
7537	666	Centrum	0	13	0	2
7538	666	Lewica	1	20	0	0
7539	666	Polska2050	0	13	0	2
7540	666	Konfederacja_KP	0	3	0	0
7541	666	niez.	1	5	1	1
7542	666	Razem	0	0	4	0
7543	667	PiS	0	170	0	16
7544	667	KO	153	0	0	3
7545	667	Demokracja	0	3	0	1
7546	667	PSL-TD	32	0	0	0
7547	667	Konfederacja	0	13	0	3
7548	667	Centrum	13	0	0	2
7549	667	Lewica	21	0	0	0
7550	667	Polska2050	13	0	0	2
7551	667	Konfederacja_KP	0	3	0	0
7552	667	niez.	4	3	1	0
7553	667	Razem	0	0	4	0
7554	668	PiS	0	171	0	15
7555	668	KO	152	0	0	4
7556	668	Demokracja	0	3	0	1
7557	668	PSL-TD	31	0	0	1
7558	668	Konfederacja	0	14	0	2
7559	668	Centrum	13	0	0	2
7560	668	Lewica	20	0	0	1
7561	668	Polska2050	13	0	0	2
7562	668	Konfederacja_KP	0	3	0	0
7563	668	niez.	4	4	0	0
7564	668	Razem	4	0	0	0
7565	669	PiS	169	0	0	17
7566	669	KO	0	152	0	4
7567	669	Demokracja	1	0	2	1
7568	669	PSL-TD	0	31	0	1
7569	669	Konfederacja	0	0	14	2
7570	669	Centrum	0	13	0	2
7571	669	Lewica	0	1	20	0
7572	669	Polska2050	0	13	0	2
7573	669	Konfederacja_KP	0	0	3	0
7574	669	niez.	3	4	1	0
7575	669	Razem	4	0	0	0
7576	670	PiS	1	7	148	30
7577	670	KO	0	151	0	5
7578	670	Demokracja	0	1	2	1
7579	670	PSL-TD	0	30	0	2
7580	670	Konfederacja	0	13	0	3
7581	670	Centrum	0	13	0	2
7582	670	Lewica	2	17	0	2
7583	670	Polska2050	0	13	0	2
7584	670	Konfederacja_KP	0	3	0	0
7585	670	niez.	0	5	1	2
7586	670	Razem	0	4	0	0
7587	671	PiS	0	0	166	20
7588	671	KO	0	151	0	5
7589	671	Demokracja	0	0	3	1
7590	671	PSL-TD	0	32	0	0
7591	671	Konfederacja	0	14	0	2
7592	671	Centrum	0	13	0	2
7593	671	Lewica	0	21	0	0
7594	671	Polska2050	0	13	0	2
7595	671	Konfederacja_KP	0	3	0	0
7596	671	niez.	0	6	2	0
7597	671	Razem	0	4	0	0
7598	672	PiS	0	0	171	15
7599	672	KO	0	153	0	3
7600	672	Demokracja	0	0	3	1
7601	672	PSL-TD	0	32	0	0
7602	672	Konfederacja	0	14	0	2
7603	672	Centrum	0	12	0	3
7604	672	Lewica	0	21	0	0
7605	672	Polska2050	0	13	0	2
7606	672	Konfederacja_KP	0	3	0	0
7607	672	niez.	0	5	3	0
7608	672	Razem	0	4	0	0
7609	673	PiS	1	1	163	21
7610	673	KO	0	149	0	7
7611	673	Demokracja	0	0	2	2
7612	673	PSL-TD	0	32	0	0
7613	673	Konfederacja	0	14	0	2
7614	673	Centrum	0	13	0	2
7615	673	Lewica	0	21	0	0
7616	673	Polska2050	0	13	0	2
7617	673	Konfederacja_KP	0	3	0	0
7618	673	niez.	0	5	3	0
7619	673	Razem	0	4	0	0
7620	674	PiS	0	0	167	19
7621	674	KO	0	151	0	5
7622	674	Demokracja	0	0	3	1
7623	674	PSL-TD	0	31	0	1
7624	674	Konfederacja	0	13	0	3
7625	674	Centrum	0	13	0	2
7626	674	Lewica	0	21	0	0
7627	674	Polska2050	0	13	0	2
7628	674	Konfederacja_KP	0	3	0	0
7629	674	niez.	0	5	2	1
7630	674	Razem	0	4	0	0
7631	675	PiS	0	1	168	17
7632	675	KO	0	152	0	4
7633	675	Demokracja	0	0	3	1
7634	675	PSL-TD	0	30	0	2
7635	675	Konfederacja	0	14	0	2
7636	675	Centrum	0	13	0	2
7637	675	Lewica	0	21	0	0
7638	675	Polska2050	0	13	0	2
7639	675	Konfederacja_KP	0	3	0	0
7640	675	niez.	0	5	3	0
7641	675	Razem	0	4	0	0
7642	676	PiS	0	1	165	20
7643	676	KO	0	150	0	6
7644	676	Demokracja	0	0	3	1
7645	676	PSL-TD	0	30	1	1
7646	676	Konfederacja	0	14	0	2
7647	676	Centrum	0	13	0	2
7648	676	Lewica	0	21	0	0
7649	676	Polska2050	0	13	0	2
7650	676	Konfederacja_KP	0	3	0	0
7651	676	niez.	0	5	3	0
7652	676	Razem	0	4	0	0
7653	677	PiS	0	1	168	17
7654	677	KO	0	146	0	10
7655	677	Demokracja	0	0	3	1
7656	677	PSL-TD	0	31	0	1
7657	677	Konfederacja	0	14	0	2
7658	677	Centrum	0	13	0	2
7659	677	Lewica	0	21	0	0
7660	677	Polska2050	0	13	0	2
7661	677	Konfederacja_KP	0	3	0	0
7662	677	niez.	0	5	3	0
7663	677	Razem	0	3	0	1
7664	678	PiS	0	3	167	16
7665	678	KO	0	152	0	4
7666	678	Demokracja	0	2	1	1
7667	678	PSL-TD	0	32	0	0
7668	678	Konfederacja	0	14	0	2
7669	678	Centrum	0	13	0	2
7670	678	Lewica	0	21	0	0
7671	678	Polska2050	0	13	0	2
7672	678	Konfederacja_KP	0	3	0	0
7673	678	niez.	0	5	3	0
7674	678	Razem	0	4	0	0
7675	679	PiS	0	170	0	16
7676	679	KO	0	147	0	9
7677	679	Demokracja	0	3	0	1
7678	679	PSL-TD	0	32	0	0
7679	679	Konfederacja	0	1	13	2
7680	679	Centrum	0	13	0	2
7681	679	Lewica	0	21	0	0
7682	679	Polska2050	0	13	0	2
7683	679	Konfederacja_KP	0	0	3	0
7684	679	niez.	0	7	1	0
7685	679	Razem	0	4	0	0
7686	680	PiS	0	163	4	19
7687	680	KO	0	151	0	5
7688	680	Demokracja	0	3	0	1
7689	680	PSL-TD	0	29	0	3
7690	680	Konfederacja	0	13	0	3
7691	680	Centrum	0	13	0	2
7692	680	Lewica	0	21	0	0
7693	680	Polska2050	0	12	0	3
7694	680	Konfederacja_KP	0	3	0	0
7695	680	niez.	0	8	0	0
7696	680	Razem	0	3	0	1
7697	681	PiS	0	9	161	16
7698	681	KO	0	153	0	3
7699	681	Demokracja	0	0	3	1
7700	681	PSL-TD	0	32	0	0
7701	681	Konfederacja	0	14	0	2
7702	681	Centrum	0	13	0	2
7703	681	Lewica	0	20	0	1
7704	681	Polska2050	0	13	0	2
7705	681	Konfederacja_KP	0	3	0	0
7706	681	niez.	0	4	3	1
7707	681	Razem	0	4	0	0
7708	682	PiS	0	167	1	18
7709	682	KO	0	151	0	5
7710	682	Demokracja	0	3	0	1
7711	682	PSL-TD	0	31	0	1
7712	682	Konfederacja	0	14	0	2
7713	682	Centrum	0	13	0	2
7714	682	Lewica	0	19	0	2
7715	682	Polska2050	0	12	0	3
7716	682	Konfederacja_KP	0	1	0	2
7717	682	niez.	0	8	0	0
7718	682	Razem	0	4	0	0
7719	683	PiS	0	170	0	16
7720	683	KO	0	153	0	3
7721	683	Demokracja	0	3	0	1
7722	683	PSL-TD	0	32	0	0
7723	683	Konfederacja	0	14	0	2
7724	683	Centrum	0	12	0	3
7725	683	Lewica	0	21	0	0
7726	683	Polska2050	0	13	0	2
7727	683	Konfederacja_KP	0	3	0	0
7728	683	niez.	0	8	0	0
7729	683	Razem	0	4	0	0
7730	684	PiS	0	165	1	20
7731	684	KO	0	145	0	11
7732	684	Demokracja	0	3	0	1
7733	684	PSL-TD	0	27	0	5
7734	684	Konfederacja	0	10	4	2
7735	684	Centrum	0	13	0	2
7736	684	Lewica	0	20	0	1
7737	684	Polska2050	0	13	0	2
7738	684	Konfederacja_KP	0	2	0	1
7739	684	niez.	0	8	0	0
7740	684	Razem	0	4	0	0
7741	685	PiS	1	167	3	15
7742	685	KO	0	153	0	3
7743	685	Demokracja	0	3	0	1
7744	685	PSL-TD	0	31	0	1
7745	685	Konfederacja	0	0	14	2
7746	685	Centrum	0	13	0	2
7747	685	Lewica	0	21	0	0
7748	685	Polska2050	0	13	0	2
7749	685	Konfederacja_KP	0	0	3	0
7750	685	niez.	0	7	1	0
7751	685	Razem	0	3	0	1
7752	686	PiS	166	5	0	15
7753	686	KO	152	1	0	3
7754	686	Demokracja	3	0	0	1
7755	686	PSL-TD	30	2	0	0
7756	686	Konfederacja	0	0	14	2
7757	686	Centrum	13	0	0	2
7758	686	Lewica	21	0	0	0
7759	686	Polska2050	13	0	0	2
7760	686	Konfederacja_KP	0	0	3	0
7761	686	niez.	7	1	0	0
7762	686	Razem	0	4	0	0
7763	687	PiS	0	162	5	19
7764	687	KO	0	152	0	4
7765	687	Demokracja	0	3	0	1
7766	687	PSL-TD	0	32	0	0
7767	687	Konfederacja	0	14	0	2
7768	687	Centrum	0	13	0	2
7769	687	Lewica	0	21	0	0
7770	687	Polska2050	0	13	0	2
7771	687	Konfederacja_KP	0	3	0	0
7772	687	niez.	0	6	1	1
7773	687	Razem	0	4	0	0
7774	688	PiS	0	165	1	20
7775	688	KO	0	153	0	3
7776	688	Demokracja	0	3	0	1
7777	688	PSL-TD	0	32	0	0
7778	688	Konfederacja	0	14	0	2
7779	688	Centrum	0	13	0	2
7780	688	Lewica	0	21	0	0
7781	688	Polska2050	0	13	0	2
7782	688	Konfederacja_KP	0	3	0	0
7783	688	niez.	0	8	0	0
7784	688	Razem	0	4	0	0
7785	689	PiS	0	170	0	16
7786	689	KO	0	152	0	4
7787	689	Demokracja	0	3	0	1
7788	689	PSL-TD	0	30	0	2
7789	689	Konfederacja	0	14	0	2
7790	689	Centrum	0	13	0	2
7791	689	Lewica	0	21	0	0
7792	689	Polska2050	0	13	0	2
7793	689	Konfederacja_KP	0	3	0	0
7794	689	niez.	0	8	0	0
7795	689	Razem	0	3	0	1
7796	690	PiS	0	165	0	21
7797	690	KO	0	151	0	5
7798	690	Demokracja	0	3	0	1
7799	690	PSL-TD	0	30	0	2
7800	690	Konfederacja	0	2	11	3
7801	690	Centrum	0	13	0	2
7802	690	Lewica	0	21	0	0
7803	690	Polska2050	0	12	0	3
7804	690	Konfederacja_KP	0	1	2	0
7805	690	niez.	0	7	0	1
7806	690	Razem	0	3	0	1
7807	691	PiS	1	164	0	21
7808	691	KO	0	149	0	7
7809	691	Demokracja	0	3	0	1
7810	691	PSL-TD	0	32	0	0
7811	691	Konfederacja	0	14	0	2
7812	691	Centrum	0	13	0	2
7813	691	Lewica	0	21	0	0
7814	691	Polska2050	0	13	0	2
7815	691	Konfederacja_KP	0	2	0	1
7816	691	niez.	0	7	0	1
7817	691	Razem	0	4	0	0
7818	692	PiS	0	165	0	21
7819	692	KO	0	151	0	5
7820	692	Demokracja	0	3	0	1
7821	692	PSL-TD	0	31	0	1
7822	692	Konfederacja	0	14	0	2
7823	692	Centrum	0	13	0	2
7824	692	Lewica	0	18	0	3
7825	692	Polska2050	0	13	0	2
7826	692	Konfederacja_KP	0	3	0	0
7827	692	niez.	0	8	0	0
7828	692	Razem	0	4	0	0
7829	693	PiS	0	167	0	19
7830	693	KO	0	149	0	7
7831	693	Demokracja	0	3	0	1
7832	693	PSL-TD	0	32	0	0
7833	693	Konfederacja	0	0	14	2
7834	693	Centrum	0	13	0	2
7835	693	Lewica	0	21	0	0
7836	693	Polska2050	0	13	0	2
7837	693	Konfederacja_KP	0	0	3	0
7838	693	niez.	0	8	0	0
7839	693	Razem	0	4	0	0
7840	694	PiS	0	170	0	16
7841	694	KO	0	151	0	5
7842	694	Demokracja	0	3	0	1
7843	694	PSL-TD	0	32	0	0
7844	694	Konfederacja	0	0	14	2
7845	694	Centrum	0	13	0	2
7846	694	Lewica	0	21	0	0
7847	694	Polska2050	0	13	0	2
7848	694	Konfederacja_KP	0	0	3	0
7849	694	niez.	0	8	0	0
7850	694	Razem	0	4	0	0
7851	695	PiS	0	169	0	17
7852	695	KO	0	152	0	4
7853	695	Demokracja	0	3	0	1
7854	695	PSL-TD	0	31	0	1
7855	695	Konfederacja	0	0	14	2
7856	695	Centrum	0	13	0	2
7857	695	Lewica	0	21	0	0
7858	695	Polska2050	0	13	0	2
7859	695	Konfederacja_KP	0	0	3	0
7860	695	niez.	0	8	0	0
7861	695	Razem	0	4	0	0
7862	696	PiS	0	169	0	17
7863	696	KO	0	153	0	3
7864	696	Demokracja	0	3	0	1
7865	696	PSL-TD	0	32	0	0
7866	696	Konfederacja	0	14	0	2
7867	696	Centrum	0	12	0	3
7868	696	Lewica	0	21	0	0
7869	696	Polska2050	0	11	0	4
7870	696	Konfederacja_KP	0	3	0	0
7871	696	niez.	0	8	0	0
7872	696	Razem	0	4	0	0
7873	697	PiS	0	166	0	20
7874	697	KO	7	144	0	5
7875	697	Demokracja	0	3	0	1
7876	697	PSL-TD	0	31	0	1
7877	697	Konfederacja	0	14	0	2
7878	697	Centrum	0	13	0	2
7879	697	Lewica	1	20	0	0
7880	697	Polska2050	0	12	0	3
7881	697	Konfederacja_KP	0	3	0	0
7882	697	niez.	0	8	0	0
7883	697	Razem	0	4	0	0
7884	698	PiS	2	168	0	16
7885	698	KO	151	0	1	4
7886	698	Demokracja	0	3	0	1
7887	698	PSL-TD	32	0	0	0
7888	698	Konfederacja	14	0	0	2
7889	698	Centrum	13	0	0	2
7890	698	Lewica	21	0	0	0
7891	698	Polska2050	12	0	0	3
7892	698	Konfederacja_KP	3	0	0	0
7893	698	niez.	3	3	1	1
7894	698	Razem	3	0	0	1
7895	699	PiS	166	1	3	16
7896	699	KO	151	0	2	3
7897	699	Demokracja	3	0	0	1
7898	699	PSL-TD	31	0	0	1
7899	699	Konfederacja	14	0	0	2
7900	699	Centrum	12	0	0	3
7901	699	Lewica	21	0	0	0
7902	699	Polska2050	12	0	0	3
7903	699	Konfederacja_KP	3	0	0	0
7904	699	niez.	6	1	1	0
7905	699	Razem	4	0	0	0
7906	700	PiS	0	170	0	16
7907	700	KO	145	0	0	11
7908	700	Demokracja	0	4	0	0
7909	700	PSL-TD	32	0	0	0
7910	700	Konfederacja	0	14	0	2
7911	700	Centrum	13	0	0	2
7912	700	Lewica	19	0	0	2
7913	700	Polska2050	11	0	0	4
7914	700	Konfederacja_KP	0	2	0	1
7915	700	niez.	3	4	0	1
7916	700	Razem	4	0	0	0
7917	701	PiS	171	0	0	15
7918	701	KO	145	0	0	11
7919	701	Demokracja	2	0	2	0
7920	701	PSL-TD	32	0	0	0
7921	701	Konfederacja	0	0	14	2
7922	701	Centrum	13	0	0	2
7923	701	Lewica	19	0	0	2
7924	701	Polska2050	11	0	0	4
7925	701	Konfederacja_KP	0	0	2	1
7926	701	niez.	7	0	0	1
7927	701	Razem	4	0	0	0
7928	702	PiS	0	171	0	15
7929	702	KO	145	0	0	11
7930	702	Demokracja	0	4	0	0
7931	702	PSL-TD	32	0	0	0
7932	702	Konfederacja	0	14	0	2
7933	702	Centrum	13	0	0	2
7934	702	Lewica	19	0	0	2
7935	702	Polska2050	11	0	0	4
7936	702	Konfederacja_KP	0	2	0	1
7937	702	niez.	4	3	0	1
7938	702	Razem	4	0	0	0
7939	703	PiS	0	172	0	14
7940	703	KO	145	0	0	11
7941	703	Demokracja	1	1	2	0
7942	703	PSL-TD	32	0	0	0
7943	703	Konfederacja	14	0	0	2
7944	703	Centrum	13	0	0	2
7945	703	Lewica	19	0	0	2
7946	703	Polska2050	11	0	0	4
7947	703	Konfederacja_KP	2	0	0	1
7948	703	niez.	4	3	0	1
7949	703	Razem	4	0	0	0
7950	704	PiS	171	0	0	15
7951	704	KO	0	146	0	10
7952	704	Demokracja	4	0	0	0
7953	704	PSL-TD	0	32	0	0
7954	704	Konfederacja	13	0	1	2
7955	704	Centrum	0	13	0	2
7956	704	Lewica	0	19	0	2
7957	704	Polska2050	0	11	0	4
7958	704	Konfederacja_KP	2	0	0	1
7959	704	niez.	4	3	0	1
7960	704	Razem	4	0	0	0
7961	705	PiS	0	0	0	186
7962	705	KO	0	0	0	156
7963	705	Demokracja	0	0	0	4
7964	705	PSL-TD	0	0	0	32
7965	705	Konfederacja	0	0	0	16
7966	705	Centrum	0	0	0	15
7967	705	Lewica	0	0	0	21
7968	705	Polska2050	0	0	0	15
7969	705	Konfederacja_KP	0	0	0	3
7970	705	niez.	0	0	0	8
7971	705	Razem	0	0	0	4
7972	706	PiS	157	1	0	28
7973	706	KO	0	142	0	14
7974	706	Demokracja	1	0	0	3
7975	706	PSL-TD	0	24	0	8
7976	706	Konfederacja	6	0	0	10
7977	706	Centrum	0	12	0	3
7978	706	Lewica	0	18	0	3
7979	706	Polska2050	0	12	0	3
7980	706	Konfederacja_KP	2	0	0	1
7981	706	niez.	3	4	1	0
7982	706	Razem	0	4	0	0
7983	707	PiS	167	0	2	17
7984	707	KO	143	0	0	13
7985	707	Demokracja	2	1	0	1
7986	707	PSL-TD	30	0	0	2
7987	707	Konfederacja	0	12	0	4
7988	707	Centrum	14	0	0	1
7989	707	Lewica	19	0	0	2
7990	707	Polska2050	13	0	0	2
7991	707	Konfederacja_KP	0	3	0	0
7992	707	niez.	5	0	0	3
7993	707	Razem	4	0	0	0
7994	708	PiS	0	171	0	15
7995	708	KO	144	0	0	12
7996	708	Demokracja	0	3	0	1
7997	708	PSL-TD	30	0	0	2
7998	708	Konfederacja	0	12	0	4
7999	708	Centrum	14	0	0	1
8000	708	Lewica	19	0	0	2
8001	708	Polska2050	13	0	0	2
8002	708	Konfederacja_KP	0	3	0	0
8003	708	niez.	2	2	1	3
8004	708	Razem	4	0	0	0
8005	709	PiS	0	1	169	16
8006	709	KO	144	0	0	12
8007	709	Demokracja	0	0	3	1
8008	709	PSL-TD	28	0	0	4
8009	709	Konfederacja	0	0	12	4
8010	709	Centrum	14	0	0	1
8011	709	Lewica	19	0	0	2
8012	709	Polska2050	13	0	0	2
8013	709	Konfederacja_KP	0	0	3	0
8014	709	niez.	3	0	2	3
8015	709	Razem	4	0	0	0
8016	710	PiS	0	170	0	16
8017	710	KO	144	0	0	12
8018	710	Demokracja	0	3	0	1
8019	710	PSL-TD	30	0	0	2
8020	710	Konfederacja	0	12	0	4
8021	710	Centrum	14	0	0	1
8022	710	Lewica	19	0	0	2
8023	710	Polska2050	13	0	0	2
8024	710	Konfederacja_KP	0	3	0	0
8025	710	niez.	3	2	0	3
8026	710	Razem	4	0	0	0
8027	711	PiS	166	1	0	19
8028	711	KO	0	148	0	8
8029	711	Demokracja	4	0	0	0
8030	711	PSL-TD	0	29	0	3
8031	711	Konfederacja	11	0	1	4
8032	711	Centrum	1	12	0	2
8033	711	Lewica	0	18	0	3
8034	711	Polska2050	0	12	0	3
8035	711	Konfederacja_KP	3	0	0	0
8036	711	niez.	3	3	0	2
8037	711	Razem	1	0	3	0
8038	712	PiS	0	0	0	186
8039	712	KO	0	0	0	156
8040	712	Demokracja	0	0	0	4
8041	712	PSL-TD	0	0	0	32
8042	712	Konfederacja	0	0	0	16
8043	712	Centrum	0	0	0	15
8044	712	Lewica	0	0	0	21
8045	712	Polska2050	0	0	0	15
8046	712	Konfederacja_KP	0	0	0	3
8047	712	niez.	0	0	0	8
8048	712	Razem	0	0	0	4
8049	713	PiS	0	174	0	12
8050	713	KO	151	0	0	5
8051	713	Demokracja	0	2	2	0
8052	713	PSL-TD	30	0	0	2
8053	713	Konfederacja	0	0	15	1
8054	713	Centrum	14	0	0	1
8055	713	Lewica	19	0	0	2
8056	713	Polska2050	13	0	0	2
8057	713	Konfederacja_KP	0	3	0	0
8058	713	niez.	4	2	0	2
8059	713	Razem	4	0	0	0
8060	714	PiS	177	0	0	9
8061	714	KO	151	0	0	5
8062	714	Demokracja	4	0	0	0
8063	714	PSL-TD	31	0	0	1
8064	714	Konfederacja	15	0	0	1
8065	714	Centrum	14	0	0	1
8066	714	Lewica	19	0	0	2
8067	714	Polska2050	13	0	0	2
8068	714	Konfederacja_KP	3	0	0	0
8069	714	niez.	6	0	0	2
8070	714	Razem	4	0	0	0
8071	715	PiS	177	0	0	9
8072	715	KO	151	0	0	5
8073	715	Demokracja	4	0	0	0
8074	715	PSL-TD	31	0	0	1
8075	715	Konfederacja	15	0	0	1
8076	715	Centrum	14	0	0	1
8077	715	Lewica	19	0	0	2
8078	715	Polska2050	13	0	0	2
8079	715	Konfederacja_KP	3	0	0	0
8080	715	niez.	6	0	0	2
8081	715	Razem	4	0	0	0
8082	716	PiS	178	0	0	8
8083	716	KO	150	0	0	6
8084	716	Demokracja	4	0	0	0
8085	716	PSL-TD	31	0	0	1
8086	716	Konfederacja	15	0	0	1
8087	716	Centrum	14	0	0	1
8088	716	Lewica	19	0	0	2
8089	716	Polska2050	13	0	0	2
8090	716	Konfederacja_KP	3	0	0	0
8091	716	niez.	6	0	0	2
8092	716	Razem	4	0	0	0
8093	717	PiS	178	0	0	8
8094	717	KO	151	0	0	5
8095	717	Demokracja	1	0	3	0
8096	717	PSL-TD	30	0	0	2
8097	717	Konfederacja	0	0	15	1
8098	717	Centrum	13	0	0	2
8099	717	Lewica	19	0	0	2
8100	717	Polska2050	13	0	0	2
8101	717	Konfederacja_KP	0	0	3	0
8102	717	niez.	5	0	1	2
8103	717	Razem	4	0	0	0
8104	718	PiS	176	0	0	10
8105	718	KO	0	150	1	5
8106	718	Demokracja	3	0	0	1
8107	718	PSL-TD	0	31	0	1
8108	718	Konfederacja	14	0	0	2
8109	718	Centrum	0	14	0	1
8110	718	Lewica	0	19	0	2
8111	718	Polska2050	0	13	0	2
8112	718	Konfederacja_KP	3	0	0	0
8113	718	niez.	3	3	0	2
8114	718	Razem	0	4	0	0
8115	719	PiS	1	177	0	8
8116	719	KO	147	0	1	8
8117	719	Demokracja	0	3	0	1
8118	719	PSL-TD	29	1	0	2
8119	719	Konfederacja	0	15	0	1
8120	719	Centrum	14	0	0	1
8121	719	Lewica	19	0	0	2
8122	719	Polska2050	13	0	0	2
8123	719	Konfederacja_KP	0	3	0	0
8124	719	niez.	4	2	0	2
8125	719	Razem	4	0	0	0
8126	720	PiS	0	176	0	10
8127	720	KO	150	0	1	5
8128	720	Demokracja	0	4	0	0
8129	720	PSL-TD	31	0	0	1
8130	720	Konfederacja	1	14	0	1
8131	720	Centrum	13	0	0	2
8132	720	Lewica	19	0	0	2
8133	720	Polska2050	13	0	0	2
8134	720	Konfederacja_KP	0	2	0	1
8135	720	niez.	4	2	0	2
8136	720	Razem	4	0	0	0
8137	721	PiS	0	178	0	8
8138	721	KO	149	0	1	6
8139	721	Demokracja	0	4	0	0
8140	721	PSL-TD	30	0	0	2
8141	721	Konfederacja	0	15	0	1
8142	721	Centrum	14	0	0	1
8143	721	Lewica	19	0	0	2
8144	721	Polska2050	13	0	0	2
8145	721	Konfederacja_KP	0	3	0	0
8146	721	niez.	4	2	0	2
8147	721	Razem	4	0	0	0
8148	722	PiS	0	176	0	10
8149	722	KO	148	0	1	7
8150	722	Demokracja	0	4	0	0
8151	722	PSL-TD	31	0	0	1
8152	722	Konfederacja	0	15	0	1
8153	722	Centrum	13	0	0	2
8154	722	Lewica	19	0	0	2
8155	722	Polska2050	13	0	0	2
8156	722	Konfederacja_KP	0	3	0	0
8157	722	niez.	3	3	0	2
8158	722	Razem	4	0	0	0
8159	723	PiS	1	0	177	8
8160	723	KO	149	1	0	6
8161	723	Demokracja	3	0	1	0
8162	723	PSL-TD	31	0	0	1
8163	723	Konfederacja	15	0	0	1
8164	723	Centrum	14	0	0	1
8165	723	Lewica	19	0	0	2
8166	723	Polska2050	13	0	0	2
8167	723	Konfederacja_KP	3	0	0	0
8168	723	niez.	4	0	2	2
8169	723	Razem	0	0	4	0
8170	724	PiS	0	0	177	9
8171	724	KO	150	0	0	6
8172	724	Demokracja	0	3	1	0
8173	724	PSL-TD	31	0	0	1
8174	724	Konfederacja	0	15	0	1
8175	724	Centrum	14	0	0	1
8176	724	Lewica	19	0	0	2
8177	724	Polska2050	13	0	0	2
8178	724	Konfederacja_KP	0	3	0	0
8179	724	niez.	4	1	1	2
8180	724	Razem	4	0	0	0
8181	725	PiS	0	0	176	10
8182	725	KO	150	0	0	6
8183	725	Demokracja	0	4	0	0
8184	725	PSL-TD	29	0	0	3
8185	725	Konfederacja	1	14	0	1
8186	725	Centrum	12	0	0	3
8187	725	Lewica	19	0	0	2
8188	725	Polska2050	13	0	0	2
8189	725	Konfederacja_KP	0	3	0	0
8190	725	niez.	4	1	1	2
8191	725	Razem	4	0	0	0
8192	726	PiS	0	1	176	9
8193	726	KO	151	0	0	5
8194	726	Demokracja	0	2	1	1
8195	726	PSL-TD	31	0	0	1
8196	726	Konfederacja	0	15	0	1
8197	726	Centrum	14	0	0	1
8198	726	Lewica	19	0	0	2
8199	726	Polska2050	13	0	0	2
8200	726	Konfederacja_KP	0	3	0	0
8201	726	niez.	4	1	1	2
8202	726	Razem	4	0	0	0
8203	727	PiS	0	1	175	10
8204	727	KO	151	0	0	5
8205	727	Demokracja	1	0	3	0
8206	727	PSL-TD	31	0	0	1
8207	727	Konfederacja	15	0	0	1
8208	727	Centrum	14	0	0	1
8209	727	Lewica	19	0	0	2
8210	727	Polska2050	13	0	0	2
8211	727	Konfederacja_KP	3	0	0	0
8212	727	niez.	5	0	1	2
8213	727	Razem	4	0	0	0
8214	728	PiS	0	0	176	10
8215	728	KO	149	0	0	7
8216	728	Demokracja	0	1	3	0
8217	728	PSL-TD	31	0	0	1
8218	728	Konfederacja	0	14	1	1
8219	728	Centrum	14	0	0	1
8220	728	Lewica	18	0	0	3
8221	728	Polska2050	13	0	0	2
8222	728	Konfederacja_KP	0	3	0	0
8223	728	niez.	4	1	1	2
8224	728	Razem	4	0	0	0
8225	729	PiS	1	0	174	11
8226	729	KO	150	0	0	6
8227	729	Demokracja	4	0	0	0
8228	729	PSL-TD	31	0	0	1
8229	729	Konfederacja	14	0	1	1
8230	729	Centrum	14	0	0	1
8231	729	Lewica	19	0	0	2
8232	729	Polska2050	13	0	0	2
8233	729	Konfederacja_KP	3	0	0	0
8234	729	niez.	4	0	2	2
8235	729	Razem	0	0	4	0
8236	730	PiS	0	1	177	8
8237	730	KO	151	0	0	5
8238	730	Demokracja	0	4	0	0
8239	730	PSL-TD	31	0	0	1
8240	730	Konfederacja	0	15	0	1
8241	730	Centrum	14	0	0	1
8242	730	Lewica	19	0	0	2
8243	730	Polska2050	13	0	0	2
8244	730	Konfederacja_KP	0	3	0	0
8245	730	niez.	4	1	1	2
8246	730	Razem	4	0	0	0
8247	731	PiS	174	1	3	8
8248	731	KO	151	0	0	5
8249	731	Demokracja	1	3	0	0
8250	731	PSL-TD	29	0	0	3
8251	731	Konfederacja	0	15	0	1
8252	731	Centrum	14	0	0	1
8253	731	Lewica	18	1	0	2
8254	731	Polska2050	13	0	0	2
8255	731	Konfederacja_KP	0	3	0	0
8256	731	niez.	5	1	0	2
8257	731	Razem	4	0	0	0
8258	732	PiS	173	1	0	12
8259	732	KO	8	143	0	5
8260	732	Demokracja	4	0	0	0
8261	732	PSL-TD	0	31	0	1
8262	732	Konfederacja	15	0	0	1
8263	732	Centrum	0	14	0	1
8264	732	Lewica	0	19	0	2
8265	732	Polska2050	1	12	0	2
8266	732	Konfederacja_KP	3	0	0	0
8267	732	niez.	3	2	1	2
8268	732	Razem	0	0	4	0
8269	733	PiS	175	0	0	11
8270	733	KO	0	152	0	4
8271	733	Demokracja	4	0	0	0
8272	733	PSL-TD	0	30	0	2
8273	733	Konfederacja	15	0	0	1
8274	733	Centrum	0	14	0	1
8275	733	Lewica	0	19	0	2
8276	733	Polska2050	0	12	0	3
8277	733	Konfederacja_KP	3	0	0	0
8278	733	niez.	2	2	2	2
8279	733	Razem	0	0	4	0
8280	734	PiS	173	0	0	13
8281	734	KO	0	151	0	5
8282	734	Demokracja	4	0	0	0
8283	734	PSL-TD	3	28	0	1
8284	734	Konfederacja	15	0	0	1
8285	734	Centrum	0	14	0	1
8286	734	Lewica	0	19	0	2
8287	734	Polska2050	0	13	0	2
8288	734	Konfederacja_KP	3	0	0	0
8289	734	niez.	2	2	2	2
8290	734	Razem	0	0	4	0
8291	735	PiS	178	0	0	8
8292	735	KO	150	2	0	4
8293	735	Demokracja	4	0	0	0
8294	735	PSL-TD	31	0	0	1
8295	735	Konfederacja	15	0	0	1
8296	735	Centrum	14	0	0	1
8297	735	Lewica	19	0	0	2
8298	735	Polska2050	13	0	0	2
8299	735	Konfederacja_KP	3	0	0	0
8300	735	niez.	6	0	0	2
8301	735	Razem	4	0	0	0
8302	736	PiS	175	0	0	11
8303	736	KO	0	152	0	4
8304	736	Demokracja	4	0	0	0
8305	736	PSL-TD	0	31	0	1
8306	736	Konfederacja	15	0	0	1
8307	736	Centrum	0	14	0	1
8308	736	Lewica	1	18	0	2
8309	736	Polska2050	0	13	0	2
8310	736	Konfederacja_KP	3	0	0	0
8311	736	niez.	2	2	2	2
8312	736	Razem	0	0	4	0
8313	737	PiS	175	0	0	11
8314	737	KO	0	152	0	4
8315	737	Demokracja	4	0	0	0
8316	737	PSL-TD	0	30	0	2
8317	737	Konfederacja	15	0	0	1
8318	737	Centrum	0	14	0	1
8319	737	Lewica	0	19	0	2
8320	737	Polska2050	0	13	0	2
8321	737	Konfederacja_KP	3	0	0	0
8322	737	niez.	2	2	2	2
8323	737	Razem	0	0	4	0
8324	738	PiS	176	0	0	10
8325	738	KO	0	152	0	4
8326	738	Demokracja	4	0	0	0
8327	738	PSL-TD	0	31	0	1
8328	738	Konfederacja	15	0	0	1
8329	738	Centrum	0	14	0	1
8330	738	Lewica	0	19	0	2
8331	738	Polska2050	0	13	0	2
8332	738	Konfederacja_KP	3	0	0	0
8333	738	niez.	2	2	2	2
8334	738	Razem	0	0	4	0
8335	739	PiS	175	0	0	11
8336	739	KO	152	0	0	4
8337	739	Demokracja	4	0	0	0
8338	739	PSL-TD	31	0	0	1
8339	739	Konfederacja	15	0	0	1
8340	739	Centrum	14	0	0	1
8341	739	Lewica	19	0	0	2
8342	739	Polska2050	13	0	0	2
8343	739	Konfederacja_KP	3	0	0	0
8344	739	niez.	6	0	0	2
8345	739	Razem	4	0	0	0
8346	740	PiS	177	0	0	9
8347	740	KO	1	151	0	4
8348	740	Demokracja	3	0	0	1
8349	740	PSL-TD	0	30	0	2
8350	740	Konfederacja	15	0	0	1
8351	740	Centrum	0	14	0	1
8352	740	Lewica	0	17	0	4
8353	740	Polska2050	0	12	0	3
8354	740	Konfederacja_KP	3	0	0	0
8355	740	niez.	4	2	0	2
8356	740	Razem	4	0	0	0
8357	741	PiS	176	0	0	10
8358	741	KO	0	152	0	4
8359	741	Demokracja	4	0	0	0
8360	741	PSL-TD	0	27	0	5
8361	741	Konfederacja	14	0	0	2
8362	741	Centrum	0	14	0	1
8363	741	Lewica	0	19	0	2
8364	741	Polska2050	0	13	0	2
8365	741	Konfederacja_KP	3	0	0	0
8366	741	niez.	2	2	2	2
8367	741	Razem	0	0	4	0
8368	742	PiS	177	0	0	9
8369	742	KO	152	0	0	4
8370	742	Demokracja	4	0	0	0
8371	742	PSL-TD	29	0	0	3
8372	742	Konfederacja	15	0	0	1
8373	742	Centrum	14	0	0	1
8374	742	Lewica	19	0	0	2
8375	742	Polska2050	12	0	0	3
8376	742	Konfederacja_KP	3	0	0	0
8377	742	niez.	6	0	0	2
8378	742	Razem	0	0	4	0
8379	743	PiS	4	173	0	9
8380	743	KO	152	0	0	4
8381	743	Demokracja	0	1	3	0
8382	743	PSL-TD	30	0	0	2
8383	743	Konfederacja	0	0	15	1
8384	743	Centrum	14	0	0	1
8385	743	Lewica	19	0	0	2
8386	743	Polska2050	13	0	0	2
8387	743	Konfederacja_KP	0	0	3	0
8388	743	niez.	4	1	1	2
8389	743	Razem	4	0	0	0
8390	744	PiS	0	175	1	10
8391	744	KO	150	0	0	6
8392	744	Demokracja	0	1	3	0
8393	744	PSL-TD	30	0	0	2
8394	744	Konfederacja	0	0	15	1
8395	744	Centrum	13	0	0	2
8396	744	Lewica	19	0	0	2
8397	744	Polska2050	13	0	0	2
8398	744	Konfederacja_KP	0	0	3	0
8399	744	niez.	4	1	1	2
8400	744	Razem	4	0	0	0
8401	745	PiS	1	177	0	8
8402	745	KO	152	0	0	4
8403	745	Demokracja	0	2	2	0
8404	745	PSL-TD	31	0	0	1
8405	745	Konfederacja	0	0	15	1
8406	745	Centrum	14	0	0	1
8407	745	Lewica	19	0	0	2
8408	745	Polska2050	13	0	0	2
8409	745	Konfederacja_KP	0	0	3	0
8410	745	niez.	4	1	1	2
8411	745	Razem	4	0	0	0
8412	746	PiS	0	178	0	8
8413	746	KO	150	0	0	6
8414	746	Demokracja	0	0	4	0
8415	746	PSL-TD	31	0	0	1
8416	746	Konfederacja	0	0	14	2
8417	746	Centrum	14	0	0	1
8418	746	Lewica	19	0	0	2
8419	746	Polska2050	13	0	0	2
8420	746	Konfederacja_KP	0	0	3	0
8421	746	niez.	4	1	1	2
8422	746	Razem	4	0	0	0
8423	747	PiS	1	176	1	8
8424	747	KO	151	0	0	5
8425	747	Demokracja	0	3	1	0
8426	747	PSL-TD	31	0	0	1
8427	747	Konfederacja	2	0	13	1
8428	747	Centrum	14	0	0	1
8429	747	Lewica	18	0	0	3
8430	747	Polska2050	13	0	0	2
8431	747	Konfederacja_KP	0	0	3	0
8432	747	niez.	4	1	1	2
8433	747	Razem	4	0	0	0
8434	748	PiS	178	0	0	8
8435	748	KO	0	152	0	4
8436	748	Demokracja	4	0	0	0
8437	748	PSL-TD	2	29	0	1
8438	748	Konfederacja	15	0	0	1
8439	748	Centrum	0	14	0	1
8440	748	Lewica	0	19	0	2
8441	748	Polska2050	1	12	0	2
8442	748	Konfederacja_KP	3	0	0	0
8443	748	niez.	2	3	1	2
8444	748	Razem	0	4	0	0
8445	749	PiS	0	178	0	8
8446	749	KO	150	0	0	6
8447	749	Demokracja	0	4	0	0
8448	749	PSL-TD	31	0	0	1
8449	749	Konfederacja	0	0	15	1
8450	749	Centrum	14	0	0	1
8451	749	Lewica	19	0	0	2
8452	749	Polska2050	13	0	0	2
8453	749	Konfederacja_KP	0	0	3	0
8454	749	niez.	4	1	1	2
8455	749	Razem	4	0	0	0
8456	750	PiS	1	175	0	10
8457	750	KO	151	0	0	5
8458	750	Demokracja	0	3	1	0
8459	750	PSL-TD	31	0	0	1
8460	750	Konfederacja	0	0	15	1
8461	750	Centrum	13	0	0	2
8462	750	Lewica	19	0	0	2
8463	750	Polska2050	13	0	0	2
8464	750	Konfederacja_KP	0	0	3	0
8465	750	niez.	4	1	1	2
8466	750	Razem	4	0	0	0
8467	751	PiS	0	3	175	8
8468	751	KO	151	0	0	5
8469	751	Demokracja	0	1	3	0
8470	751	PSL-TD	31	0	0	1
8471	751	Konfederacja	0	15	0	1
8472	751	Centrum	14	0	0	1
8473	751	Lewica	17	1	0	3
8474	751	Polska2050	13	0	0	2
8475	751	Konfederacja_KP	0	0	3	0
8476	751	niez.	4	1	1	2
8477	751	Razem	4	0	0	0
8478	752	PiS	1	175	1	9
8479	752	KO	0	151	0	5
8480	752	Demokracja	4	0	0	0
8481	752	PSL-TD	0	31	0	1
8482	752	Konfederacja	15	0	0	1
8483	752	Centrum	0	14	0	1
8484	752	Lewica	0	19	0	2
8485	752	Polska2050	0	13	0	2
8486	752	Konfederacja_KP	3	0	0	0
8487	752	niez.	1	5	0	2
8488	752	Razem	0	4	0	0
8489	753	PiS	177	1	0	8
8490	753	KO	152	0	0	4
8491	753	Demokracja	4	0	0	0
8492	753	PSL-TD	31	0	0	1
8493	753	Konfederacja	14	0	0	2
8494	753	Centrum	14	0	0	1
8495	753	Lewica	19	0	0	2
8496	753	Polska2050	13	0	0	2
8497	753	Konfederacja_KP	3	0	0	0
8498	753	niez.	6	0	0	2
8499	753	Razem	4	0	0	0
8500	754	PiS	1	2	175	8
8501	754	KO	149	0	0	7
8502	754	Demokracja	0	4	0	0
8503	754	PSL-TD	30	0	0	2
8504	754	Konfederacja	0	15	0	1
8505	754	Centrum	14	0	0	1
8506	754	Lewica	19	0	0	2
8507	754	Polska2050	11	0	0	4
8508	754	Konfederacja_KP	0	3	0	0
8509	754	niez.	3	1	1	3
8510	754	Razem	4	0	0	0
8511	755	PiS	177	1	0	8
8512	755	KO	1	151	0	4
8513	755	Demokracja	4	0	0	0
8514	755	PSL-TD	1	30	0	1
8515	755	Konfederacja	15	0	0	1
8516	755	Centrum	1	13	0	1
8517	755	Lewica	0	19	0	2
8518	755	Polska2050	0	13	0	2
8519	755	Konfederacja_KP	3	0	0	0
8520	755	niez.	3	3	0	2
8521	755	Razem	0	4	0	0
8522	756	PiS	1	0	175	10
8523	756	KO	152	0	0	4
8524	756	Demokracja	4	0	0	0
8525	756	PSL-TD	30	0	0	2
8526	756	Konfederacja	15	0	0	1
8527	756	Centrum	14	0	0	1
8528	756	Lewica	19	0	0	2
8529	756	Polska2050	13	0	0	2
8530	756	Konfederacja_KP	3	0	0	0
8531	756	niez.	5	0	1	2
8532	756	Razem	4	0	0	0
8533	757	PiS	2	0	175	9
8534	757	KO	152	0	0	4
8535	757	Demokracja	2	1	1	0
8536	757	PSL-TD	31	0	0	1
8537	757	Konfederacja	15	0	0	1
8538	757	Centrum	14	0	0	1
8539	757	Lewica	19	0	0	2
8540	757	Polska2050	13	0	0	2
8541	757	Konfederacja_KP	3	0	0	0
8542	757	niez.	5	0	1	2
8543	757	Razem	4	0	0	0
8544	758	PiS	173	0	0	13
8545	758	KO	0	151	0	5
8546	758	Demokracja	3	0	0	1
8547	758	PSL-TD	0	31	0	1
8548	758	Konfederacja	0	0	14	2
8549	758	Centrum	0	14	0	1
8550	758	Lewica	0	17	0	4
8551	758	Polska2050	0	13	0	2
8552	758	Konfederacja_KP	0	0	3	0
8553	758	niez.	2	2	2	2
8554	758	Razem	4	0	0	0
8555	759	PiS	2	0	173	11
8556	759	KO	150	0	0	6
8557	759	Demokracja	3	0	1	0
8558	759	PSL-TD	31	0	0	1
8559	759	Konfederacja	13	0	1	2
8560	759	Centrum	13	0	0	2
8561	759	Lewica	17	0	0	4
8562	759	Polska2050	13	0	0	2
8563	759	Konfederacja_KP	3	0	0	0
8564	759	niez.	4	0	2	2
8565	759	Razem	4	0	0	0
8566	760	PiS	175	0	0	11
8567	760	KO	0	152	0	4
8568	760	Demokracja	4	0	0	0
8569	760	PSL-TD	0	31	0	1
8570	760	Konfederacja	14	0	0	2
8571	760	Centrum	1	12	0	2
8572	760	Lewica	0	18	0	3
8573	760	Polska2050	0	13	0	2
8574	760	Konfederacja_KP	3	0	0	0
8575	760	niez.	2	3	1	2
8576	760	Razem	0	4	0	0
8577	761	PiS	3	0	172	11
8578	761	KO	0	152	0	4
8579	761	Demokracja	1	0	3	0
8580	761	PSL-TD	0	31	0	1
8581	761	Konfederacja	14	0	0	2
8582	761	Centrum	14	0	0	1
8583	761	Lewica	0	18	0	3
8584	761	Polska2050	0	13	0	2
8585	761	Konfederacja_KP	3	0	0	0
8586	761	niez.	3	2	1	2
8587	761	Razem	0	4	0	0
8588	762	PiS	1	0	173	12
8589	762	KO	0	152	0	4
8590	762	Demokracja	4	0	0	0
8591	762	PSL-TD	0	31	0	1
8592	762	Konfederacja	14	0	0	2
8593	762	Centrum	0	14	0	1
8594	762	Lewica	6	13	0	2
8595	762	Polska2050	0	13	0	2
8596	762	Konfederacja_KP	3	0	0	0
8597	762	niez.	1	4	1	2
8598	762	Razem	0	4	0	0
8599	763	PiS	0	176	0	10
8600	763	KO	152	0	0	4
8601	763	Demokracja	1	2	0	1
8602	763	PSL-TD	31	0	0	1
8603	763	Konfederacja	0	15	0	1
8604	763	Centrum	14	0	0	1
8605	763	Lewica	19	0	0	2
8606	763	Polska2050	13	0	0	2
8607	763	Konfederacja_KP	0	3	0	0
8608	763	niez.	4	2	0	2
8609	763	Razem	4	0	0	0
\.


--
-- Data for Name: votings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votings (id, sitting_id, bill_id, number, held_at, kind, title, topic, description, is_final, yes, no, abstain, not_participating, majority_votes) FROM stdin;
1	4	\N	1	2024-01-25 10:12:10	ELECTRONIC	4. posiedzenie Sejmu RP w dniach 25 i 26 stycznia 2024 r.	Wniosek o przerwę	\N	f	185	238	3	31	239
2	4	1	2	2024-01-25 10:37:40	ELECTRONIC	Pkt. 1 Zmiany w składach osobowych komisji sejmowych (druk nr 174)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 174	f	420	2	8	27	3
3	4	\N	3	2024-01-26 09:14:49	ELECTRONIC	4. posiedzenie Sejmu RP w dniach 25 i 26 stycznia 2024 r.	Wniosek o przerwę	\N	f	190	237	0	31	238
4	4	2	4	2024-01-26 09:16:00	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o Narodowym Centrum Badań i Rozwoju oraz ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 171 i 181)	wniosek mniejszości 1	\N	f	177	257	0	24	258
5	4	2	5	2024-01-26 09:16:38	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o Narodowym Centrum Badań i Rozwoju oraz ustawy - Prawo o szkolnictwie wyższym i nauce (druki nr 171 i 181)	głosowanie nad całością projektu.	całość projektu ustawy	t	240	177	17	24	178
6	4	3	6	2024-01-26 09:17:33	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o poselskim projekcie uchwały w 100. rocznicę wydania pierwszego numeru "Wiadomości Literackich" (druki nr 157 i 173)	głosowanie nad całością projektu.	całość projektu uchwały	t	425	5	4	24	6
7	4	4	7	2024-01-26 09:36:46	ELECTRONIC	Pkt. 8 Wybór składu osobowego Komisji Śledczej do zbadania legalności, prawidłowości oraz celowości czynności operacyjno-rozpoznawczych podejmowanych m.in. z wykorzystaniem oprogramowania Pegasus przez członków Rady Ministrów, służby specjalne, Policję, organy kontroli skarbowej oraz celno-skarbowej, organy powołane do ścigania przestępstw i prokuraturę w okresie od dnia 16 listopada 2015 r. do dnia 20 listopada 2023 r. (druk nr 184)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 184	f	433	0	1	24	218
8	64	5	1	2026-09-02 11:13:57	ELECTRONIC	Głosowanie proceduralne dotyczące druku 2876	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie druku nr 2876	\N	f	264	156	0	40	157
9	64	6	2	2026-09-02 11:15:49	ELECTRONIC	Głosowanie proceduralne dotyczące druku 2821	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie druku nr 2821	\N	f	364	20	36	40	21
10	64	7	3	2026-09-02 11:16:28	ELECTRONIC	Głosowanie proceduralne dotyczące druku 3015	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie druku nr 3015	\N	f	400	20	1	39	21
11	64	8	4	2026-09-02 11:17:17	ELECTRONIC	Głosowanie proceduralne dotyczące druku 3028	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie druku nr 3028	\N	f	399	20	0	41	21
12	64	\N	5	2026-09-02 11:24:48	ELECTRONIC	64. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 2, 3 i 4 września 2026 r.	Wniosek o przerwę	\N	f	186	219	11	44	220
13	64	\N	6	2026-09-02 11:33:54	ELECTRONIC	64. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 2, 3 i 4 września 2026 r.	Głosowanie kworum	\N	f	0	0	0	46	230
14	64	9	7	2026-09-04 09:10:42	ELECTRONIC	Głosowanie proceduralne dotyczące druku 3045	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 3045	\N	f	237	30	161	32	31
15	64	10	8	2026-09-04 09:11:27	ELECTRONIC	Głosowanie proceduralne dotyczące druku 3014	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 3014	\N	f	378	21	37	24	22
16	64	11	9	2026-09-04 09:12:09	ELECTRONIC	Głosowanie proceduralne dotyczące druku 3023	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 3023	\N	f	239	23	177	21	24
17	64	12	10	2026-09-04 09:12:47	ELECTRONIC	Głosowanie proceduralne dotyczące druku 3052	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 3052	\N	f	239	163	35	23	164
18	64	\N	11	2026-09-04 09:16:07	ELECTRONIC	64. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 2, 3 i 4 września 2026 r.	Wniosek o przerwę	\N	f	190	242	3	25	243
19	64	\N	12	2026-09-04 09:21:40	ELECTRONIC	64. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 2, 3 i 4 września 2026 r.	Głosowanie kworum	\N	f	0	0	0	40	230
20	64	\N	13	2026-09-04 09:44:21	ELECTRONIC	64. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 2, 3 i 4 września 2026 r.	ustalenie czasów debat	\N	f	236	189	5	30	190
21	64	13	14	2026-09-04 10:25:12	ON_LIST	Wybór sędziego Trybunału Konstytucyjnego (druki nr 3005, 3006, 3057 i 3058)	Wybór sędziego Trybunału Konstytucyjnego	wybór sędziego Trybunału Konstytucyjnego	f	0	0	0	23	219
22	64	14	15	2026-09-04 11:31:35	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 15 maja 2026 r. o rynku kryptoaktywów (druki nr 2710 i 2742)	głosowanie nad przyjęciem wniosku o ponowne rozpatrzenie ustawy	wniosek Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy	f	241	198	3	18	266
23	64	5	16	2026-09-04 11:33:42	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2876 i 3017)	głosowanie nad całością projektu.	całość projektu uchwały	t	260	2	175	23	3
24	64	7	17	2026-09-04 11:34:32	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskim projekcie ustawy o utworzeniu Uniwersytetu Mazowieckiego w Płocku (druki nr 3015 i 3051)	głosowanie nad całością projektu.	całość projektu ustawy	t	439	1	0	20	2
25	64	15	18	2026-09-04 11:36:16	ELECTRONIC	Pkt. 21 Rozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 3027)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 3027	f	418	16	4	22	17
26	64	16	19	2026-09-04 11:38:55	ELECTRONIC	Pkt. 1 Sprawozdanie Komisji o senackim projekcie ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach (druki nr 2769, 2833 i 2833-A)	wniosek o odrzucenie w całości projektu.	\N	f	201	241	0	18	242
27	64	16	20	2026-09-04 11:39:22	ELECTRONIC	Pkt. 1 Sprawozdanie Komisji o senackim projekcie ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach (druki nr 2769, 2833 i 2833-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	242	198	0	20	199
28	64	17	21	2026-09-04 11:41:20	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	wniosek o odrzucenie w całości projektu.	\N	f	199	238	3	20	239
29	64	17	22	2026-09-04 11:42:00	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawka 1	\N	f	242	176	21	21	177
30	64	17	23	2026-09-04 11:42:32	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawka 2	\N	f	260	179	0	21	180
31	64	17	24	2026-09-04 11:43:02	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawka 3	\N	f	262	178	0	20	179
32	64	17	25	2026-09-04 11:43:28	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawka 4	\N	f	260	142	35	23	143
33	64	17	26	2026-09-04 11:44:00	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawki nr 5 i 8	\N	f	242	175	20	23	176
34	64	17	27	2026-09-04 11:44:34	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawki nr 6 i 11	\N	f	241	166	31	22	167
35	64	17	28	2026-09-04 11:45:13	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	poprawki nr 9-10	\N	f	240	143	57	20	144
36	64	17	29	2026-09-04 11:45:40	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druki nr 2670, 2850 i 2850-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	238	200	3	19	201
37	64	18	30	2026-09-04 11:46:29	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o związkach zawodowych oraz ustawy o informowaniu pracowników i przeprowadzaniu z nimi konsultacji (druki nr 2801 i 2877)	głosowanie nad całością projektu.	całość projektu ustawy	t	299	1	140	20	2
38	64	19	31	2026-09-04 11:47:26	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks spółek handlowych oraz ustawy o zmianie ustawy - Kodeks spółek handlowych oraz niektórych innych ustaw (druki nr 2737 i 2851)	głosowanie nad całością projektu.	całość projektu ustawy	t	441	0	0	19	1
39	64	20	32	2026-09-04 11:49:30	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka (druki nr 2271, 2843 i )	wniosek o odrzucenie w całości projektu.	\N	f	167	242	33	18	243
40	64	20	33	2026-09-04 11:50:01	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka (druki nr 2271, 2843 i )	głosowanie nad całością projektu.	całość projektu ustawy	t	241	161	38	20	162
41	64	21	34	2026-09-04 11:51:40	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta (druki nr 2799, 3043 i 3043-A)	wniosek o odrzucenie w całości projektu.	\N	f	198	239	0	23	240
42	64	21	35	2026-09-04 11:52:10	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta (druki nr 2799, 3043 i 3043-A)	poprawka 1	\N	f	203	236	0	21	237
43	64	21	36	2026-09-04 11:52:36	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta (druki nr 2799, 3043 i 3043-A)	poprawka 2	\N	f	196	234	0	30	235
44	64	21	37	2026-09-04 11:53:00	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przeciwdziałaniu nieuczciwym praktykom rynkowym oraz ustawy o prawach konsumenta (druki nr 2799, 3043 i 3043-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	236	199	0	25	200
45	64	22	38	2026-09-04 11:54:36	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 2866, 3021 i 3021-A)	poprawki nr 1-3	\N	f	180	235	20	25	236
46	64	22	39	2026-09-04 11:55:02	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 2866, 3021 i 3021-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	273	24	137	26	25
47	64	6	40	2026-09-04 11:56:29	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 2821, 3022 i 3022-A)	poprawka 1	\N	f	31	383	23	23	384
48	64	6	41	2026-09-04 11:56:58	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 2821, 3022 i 3022-A)	poprawka 2	\N	f	417	0	19	24	1
49	64	6	42	2026-09-04 11:57:25	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 2821, 3022 i 3022-A)	poprawka 3	\N	f	427	1	4	28	2
50	64	6	43	2026-09-04 11:57:52	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o odnawialnych źródłach energii oraz niektórych innych ustaw (druki nr 2821, 3022 i 3022-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	380	2	53	25	3
51	64	8	44	2026-09-04 11:58:41	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach służących realizacji ustawy budżetowej na rok 2026 (druki nr 3028 i 3046)	głosowanie nad całością projektu.	całość projektu ustawy	t	417	21	0	22	22
52	64	23	45	2026-09-04 12:00:37	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	poprawki nr 1-2, 4 oraz 9-10	\N	f	3	413	20	24	219
53	64	23	46	2026-09-04 12:01:40	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	poprawka 3	\N	f	3	430	0	27	217
54	64	23	47	2026-09-04 12:02:18	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	poprawka 5	\N	f	1	435	0	24	219
55	64	23	48	2026-09-04 12:02:54	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	poprawka 6	\N	f	20	417	1	22	220
56	64	23	49	2026-09-04 12:03:26	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	poprawka 7	\N	f	0	431	0	29	216
57	64	23	50	2026-09-04 12:04:03	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2990 i 3045)	poprawka 8	\N	f	0	434	0	26	218
58	64	24	51	2026-09-04 12:05:55	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014)	poprawki nr 1, 16 i 18	\N	f	1	414	20	25	218
59	64	24	52	2026-09-04 12:06:39	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014)	poprawki nr 2-6, 8-9 i 14	\N	f	236	198	4	22	220
60	64	24	53	2026-09-04 12:07:23	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014)	poprawki nr 7, 11-13 i 17	\N	f	3	435	0	22	220
61	64	24	54	2026-09-04 12:07:55	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014)	poprawka 10	\N	f	239	176	25	20	221
62	64	24	55	2026-09-04 12:08:28	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy - Prawo o adwokaturze oraz ustawy o świadczeniu przez prawników zagranicznych pomocy prawnej w Rzeczypospolitej Polskiej (druki nr 2994 i 3014)	poprawka 15	\N	f	358	72	0	30	216
63	64	25	56	2026-09-04 12:10:38	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2991 i 3023)	poprawki nr 1, 4, 7, 10, 13, 16, 20 i 23	\N	f	1	298	136	25	218
64	64	25	57	2026-09-04 12:11:27	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2991 i 3023)	poprawki nr 2, 5, 8, 11, 14, 17, 21 i 24	\N	f	234	64	138	24	219
65	64	25	58	2026-09-04 12:12:16	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2991 i 3023)	poprawki nr 3, 6, 9, 12, 15, 18, 22 oraz 25-26	\N	f	141	293	1	25	218
66	64	25	59	2026-09-04 12:12:48	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2991 i 3023)	poprawka 19	\N	f	0	437	1	22	220
67	64	26	60	2026-09-04 12:14:55	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2992 i 3052)	poprawka 1	\N	f	0	437	1	22	220
68	64	26	61	2026-09-04 12:15:29	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2992 i 3052)	poprawka 2	\N	f	1	434	1	24	219
69	64	26	62	2026-09-04 12:16:02	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2992 i 3052)	poprawka 3	\N	f	0	427	1	32	215
70	64	27	63	2026-09-04 12:17:26	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2993 i 3016)	poprawka 1	\N	f	0	409	21	30	216
71	64	28	64	2026-09-04 12:19:11	ELECTRONIC	Pkt. 28 Zmiana w składzie osobowym Komisji do Spraw Służb Specjalnych (druk nr 3060)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 3060	f	293	138	2	27	139
72	64	29	65	2026-09-04 12:20:10	ELECTRONIC	Pkt. 29 Wybór nowego składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 3061)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 3061	f	425	0	0	35	1
73	65	30	1	2026-09-15 11:10:35	ELECTRONIC	Głosowanie proceduralne dotyczące projektu uchwały z druku nr 3071	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania dotyczącego projektu z druku nr 3071	\N	f	256	131	16	57	132
74	65	\N	2	2026-09-15 11:18:08	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	Wniosek o przerwę	\N	f	178	228	8	46	229
75	65	\N	3	2026-09-15 11:22:12	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	Głosowanie kworum	\N	f	0	0	0	58	230
76	65	\N	4	2026-09-15 11:38:28	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	wniosek o odroczenie posiedzenia	\N	f	163	245	0	52	246
77	65	31	5	2026-09-16 09:08:39	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 3100	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr 3100	\N	f	261	140	0	59	141
78	65	32	6	2026-09-16 09:09:18	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 3099	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr 3099	\N	f	228	160	11	61	161
79	65	33	7	2026-09-17 16:58:13	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 3109	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 3109	\N	f	236	194	1	29	195
80	65	34	8	2026-09-17 16:58:56	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 3107	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 3107	\N	f	271	19	142	28	20
81	65	35	9	2026-09-17 16:59:50	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 3118	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 3118	\N	f	273	161	0	26	162
82	65	36	10	2026-09-17 17:22:31	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 29 maja 2026 r. o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2863 i 3110)	głosowanie nad ponownym uchwaleniem ustawy	wniosek Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy	f	232	199	0	29	259
83	65	37	11	2026-09-17 17:24:41	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 29 maja 2026 r. - Przepisy wprowadzające ustawę o statusie osoby najbliższej w związku i umowie o wspólnym pożyciu (druki nr 2864 i 3111)	głosowanie nad ponownym uchwaleniem ustawy	wniosek Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy	f	232	200	0	28	260
224	55	72	5	2026-04-16 14:25:55	ELECTRONIC	Głosowanie proceduralne dotyczące druku 2435	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2435	\N	f	396	0	19	45	1
84	65	38	12	2026-09-17 17:27:21	ELECTRONIC	Pkt. 54 Sprawozdanie Komisji w sprawie wniosku Europejskiego Prokuratora Generalnego z dnia 29 lipca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla (druk nr 3105)	głosowanie nad przyjęciem wnioskuo wyrażenie zgody przez Sejm na zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla	wniosek o wyrażenie zgody na zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla	f	422	3	5	30	231
85	65	30	13	2026-09-17 17:28:28	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o poselskim projekcie uchwały o zmianie Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 3071 i 3084)	głosowanie nad całością projektu.	całość projektu uchwały	t	232	144	51	33	145
86	65	39	14	2026-09-18 09:11:34	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 3101	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr 3101	\N	f	274	24	142	20	25
87	65	\N	15	2026-09-18 09:17:52	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	Wniosek o przerwę	\N	f	172	242	21	25	243
88	65	\N	16	2026-09-18 09:30:34	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	Głosowanie kworum	\N	f	0	0	0	19	230
89	65	\N	17	2026-09-18 09:35:56	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	wniosek o zamknięcie posiedzenia	\N	f	140	256	44	20	257
90	65	40	18	2026-09-18 09:46:44	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie upamiętnienia 50. rocznicy powstania Komitetu Obrony Robotników,- w 50. rocznicę powstania Komitetu Obrony Robotników (druki nr 2889, 3056 i 3064)	wniosek o przystąpienie do głosowania bez kierowania projektu uchwały do komisji	\N	f	239	202	0	19	203
91	65	40	19	2026-09-18 09:47:38	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie upamiętnienia 50. rocznicy powstania Komitetu Obrony Robotników,- w 50. rocznicę powstania Komitetu Obrony Robotników (druki nr 2889, 3056 i 3064)	poprawki nr 1-2	\N	f	215	224	0	21	225
92	65	40	20	2026-09-18 09:48:09	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie upamiętnienia 50. rocznicy powstania Komitetu Obrony Robotników,- w 50. rocznicę powstania Komitetu Obrony Robotników (druki nr 2889, 3056 i 3064)	głosowanie nad całością projektu.	całość projektu uchwały	t	404	0	28	28	1
93	65	41	21	2026-09-18 09:49:06	ELECTRONIC	Pkt. 40 Zmiany w składach osobowych komisji sejmowych (druk nr 3106)	głosowanie nad przyjęciem wniosku z druku nr 3106	wniosek z druku	f	441	2	0	17	3
94	65	42	22	2026-09-18 10:12:38	ON_LIST	Wybór Wicemarszałka Sejmu Rzeczypospolitej Polskiej (druki nr 2875 i 3077)	Wybór Wicemarszałka Sejmu Rzeczypospolitej Polskiej	\N	f	0	0	0	32	215
95	65	43	23	2026-09-18 10:21:14	ELECTRONIC	Pkt. 43 Powołanie Przewodniczącego Komisji Rozwoju i Bezpieczeństwa Sztucznej Inteligencji (druki nr 3078 i 3083)	głosowanie nad powołaniem Pani Pameli Krzypkowskiej na Przewodniczącego Komisji Rozwoju i Bezpieczeństwa Sztucznej Inteligencji	głosowanie nad kandydaturą pani Pameli Krzypkowskiej	f	271	24	140	25	218
96	65	44	24	2026-09-18 10:23:42	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji w sprawie wniosku prokuratora Prokuratury Okręgowej w Przemyślu z dnia 17 czerwca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana (druk nr 3044)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana za czyn określony w pkt 1.	wniosek o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana - za czyn określony w punkcie pierwszym wniosku	f	1	440	1	18	231
97	65	44	25	2026-09-18 10:24:44	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji w sprawie wniosku prokuratora Prokuratury Okręgowej w Przemyślu z dnia 17 czerwca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana (druk nr 3044)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana za czyn określony w pkt 2.	wniosek o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Tadeusza Chrzana - za czyn określony w punkcie drugim wniosku	f	1	437	1	21	231
98	65	45	26	2026-09-18 10:27:11	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 1	\N	f	196	246	0	18	247
99	65	45	27	2026-09-18 10:27:41	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 2	\N	f	292	6	129	33	7
100	65	45	28	2026-09-18 10:28:32	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	wnioski mniejszości nr 1, 9 oraz 12-14	\N	f	188	232	23	17	233
101	65	45	29	2026-09-18 10:29:16	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 3, 41 i 45	\N	f	188	230	19	23	231
102	65	45	30	2026-09-18 10:29:53	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	wnioski mniejszości nr 2 i 10	\N	f	187	231	17	25	232
103	65	45	31	2026-09-18 10:30:23	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 4	\N	f	187	234	17	22	235
104	65	45	32	2026-09-18 10:31:03	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 5, 40 i 46	\N	f	209	228	0	23	229
105	65	45	33	2026-09-18 10:31:32	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	wniosek mniejszości 3	\N	f	187	227	21	25	228
445	63	\N	6	2026-07-29 10:24:23	ELECTRONIC	63. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 29, 30 i 31 lipca 2026 r.	Wniosek o przerwę	\N	f	181	248	8	23	249
106	65	45	34	2026-09-18 10:31:59	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 6	\N	f	185	228	20	27	229
107	65	45	35	2026-09-18 10:32:26	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	wniosek mniejszości 4	\N	f	186	229	21	24	230
108	65	45	36	2026-09-18 10:32:54	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 7	\N	f	280	159	0	21	160
109	65	45	37	2026-09-18 10:33:25	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 8 i 10	\N	f	207	232	0	21	233
110	65	45	38	2026-09-18 10:34:00	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 9, 26, 31 i 38	\N	f	277	137	28	18	138
111	65	45	39	2026-09-18 10:34:29	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 11	\N	f	430	0	3	27	1
112	65	45	40	2026-09-18 10:35:08	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 12-13, wniosek mniejszości nr 5	\N	f	187	229	24	20	230
113	65	45	41	2026-09-18 10:35:36	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	wniosek mniejszości 6	\N	f	203	215	19	23	216
114	65	45	42	2026-09-18 10:36:12	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka nr 14, wniosek mniejszości nr 7	\N	f	232	209	0	19	210
115	65	45	43	2026-09-18 10:36:50	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	wnioski mniejszości nr 8 i 11	\N	f	210	231	0	19	232
116	65	45	44	2026-09-18 10:37:18	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 15	\N	f	206	224	0	30	225
117	65	45	45	2026-09-18 10:37:41	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 16	\N	f	197	217	1	45	218
118	65	45	46	2026-09-18 10:38:08	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 17	\N	f	87	224	125	24	225
119	65	45	47	2026-09-18 10:38:34	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 18	\N	f	418	2	23	17	3
120	65	45	48	2026-09-18 10:39:02	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 19	\N	f	185	229	22	24	230
121	65	45	49	2026-09-18 10:39:30	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 20	\N	f	418	1	23	18	2
122	65	45	50	2026-09-18 10:39:57	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 21	\N	f	205	227	0	28	228
123	65	45	51	2026-09-18 10:40:31	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 22-25 i 35	\N	f	202	236	0	22	237
124	65	45	52	2026-09-18 10:40:56	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 27	\N	f	401	28	0	31	29
125	65	45	53	2026-09-18 10:41:21	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 28	\N	f	438	1	0	21	2
126	65	45	54	2026-09-18 10:41:47	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 29	\N	f	215	219	1	25	220
127	65	45	55	2026-09-18 10:42:15	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 30	\N	f	418	23	0	19	24
128	65	45	56	2026-09-18 10:42:39	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 32	\N	f	406	30	0	24	31
129	65	45	57	2026-09-18 10:43:14	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 33 i 49	\N	f	191	250	0	19	251
130	65	45	58	2026-09-18 10:43:42	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 34	\N	f	195	243	0	22	244
131	65	45	59	2026-09-18 10:44:09	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 36	\N	f	295	24	117	24	25
132	65	45	60	2026-09-18 10:44:40	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 37	\N	f	201	232	0	27	233
133	65	45	61	2026-09-18 10:45:06	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 39	\N	f	232	204	0	24	205
134	65	45	62	2026-09-18 10:45:45	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawki nr 42-43	\N	f	191	228	21	20	229
135	65	45	63	2026-09-18 10:46:16	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 44	\N	f	225	201	5	29	202
136	65	45	64	2026-09-18 10:46:46	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 47	\N	f	43	251	138	28	252
137	65	45	65	2026-09-18 10:47:19	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 48	\N	f	304	1	139	16	2
138	65	45	66	2026-09-18 10:47:50	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 50	\N	f	189	223	23	25	224
139	65	45	67	2026-09-18 10:48:21	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	poprawka 51	\N	f	282	1	157	20	2
140	65	45	68	2026-09-18 10:48:50	ELECTRONIC	Pkt. 44 Sprawozdanie Komisji o przedstawionym przez Prezydenta Rzeczypospolitej Polskiej, rządowym oraz poselskim projektach ustaw o asystencji osobistej osób z niepełnosprawnościami (druki nr 316, 1929, 1933, 2792 i 2792-A) - trzecie czytanie	głosowanie nad całością projektu.	całość projektu ustawy	t	443	0	0	17	1
141	65	46	69	2026-09-18 10:50:15	ELECTRONIC	Pkt. 36 Sprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2025 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2725 i 2829)	wniosek o przystąpienie do drugiego czytania  bez kierowania projektu do komisji	\N	f	229	209	1	21	210
142	65	46	70	2026-09-18 10:55:25	ELECTRONIC	Pkt. 36 Sprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2025 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2725 i 2829)	wniosek o przystąpienie do głosowania bez kierowania projektu uchwały do komisji	\N	f	222	193	0	45	194
143	65	47	71	2026-09-18 10:56:46	ELECTRONIC	Pkt. 37 Informacja o działalności Rady Mediów Narodowych w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2726 i 2830)	wniosek o przystąpienie do drugiego czytania  bez kierowania projektu do komisji	\N	f	226	211	1	22	212
144	65	\N	72	2026-09-18 10:58:08	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	ustalenie czasów debat	\N	f	204	206	5	45	207
145	65	\N	73	2026-09-18 10:58:55	ELECTRONIC	65. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16, 17 i 18 września 2026 r.	ustalenie czasów debat	\N	f	234	195	2	29	196
146	65	47	74	2026-09-18 11:07:34	ELECTRONIC	Pkt. 37 Informacja o działalności Rady Mediów Narodowych w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2726 i 2830)	wniosek o przystąpienie do głosowania bez kierowania projektu uchwały do komisji	\N	f	208	189	1	62	190
147	65	48	75	2026-09-18 11:09:19	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawka 1	\N	f	160	224	21	55	225
148	65	48	76	2026-09-18 11:09:45	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawka 2	\N	f	192	225	1	42	226
149	65	48	77	2026-09-18 11:10:12	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawka 3	\N	f	200	226	1	33	227
150	65	48	78	2026-09-18 11:10:40	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawka 4	\N	f	198	225	1	36	226
151	65	48	79	2026-09-18 11:11:14	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawki nr 5-6 i 8	\N	f	199	227	1	33	228
152	65	48	80	2026-09-18 11:11:44	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawka 7	\N	f	201	233	1	25	234
153	65	48	81	2026-09-18 11:12:08	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	poprawka 9	\N	f	196	231	1	32	232
154	65	48	82	2026-09-18 11:12:41	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o umorzeniu należności dochodzonych przez Zakład Ubezpieczeń Społecznych powstałych przed dniem 1 stycznia 1999 r. (druki nr 3010, 3055 i 3055-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	252	148	40	20	149
155	65	49	83	2026-09-18 11:13:34	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku dochodowym od osób prawnych (druki nr 2837 i 3053)	głosowanie nad całością projektu.	całość projektu ustawy	t	296	141	1	22	142
156	65	50	84	2026-09-18 11:14:19	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług (druki nr 2838 i 3054)	głosowanie nad całością projektu.	całość projektu ustawy	t	393	2	16	49	3
157	65	51	85	2026-09-18 11:14:58	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 2839 i 3065)	głosowanie nad całością projektu.	całość projektu ustawy	t	242	21	165	32	22
158	65	52	86	2026-09-18 11:15:44	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych rozwiązaniach związanych z organizacją XXVI Światowego Jamboree Skautowego w Polsce w 2027 r. (druki nr 2846 i 3024)	głosowanie nad całością projektu.	całość projektu ustawy	t	411	23	0	26	24
159	65	53	87	2026-09-18 11:16:29	ELECTRONIC	Pkt. 11 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o działaniach antyterrorystycznych (druki nr 2870 i 3063)	głosowanie nad całością projektu.	całość projektu ustawy	t	271	2	161	26	3
160	65	54	88	2026-09-18 11:17:14	ELECTRONIC	Pkt. 12 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o finansowym wspieraniu produkcji audiowizualnej oraz niektórych innych ustaw (druki nr 2998 i 3047)	głosowanie nad całością projektu.	całość projektu ustawy	t	277	22	139	22	23
161	65	55	89	2026-09-18 11:19:23	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	wniosek mniejszości 1	\N	f	7	249	181	23	250
162	65	55	90	2026-09-18 11:19:54	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	poprawka 1	\N	f	49	203	162	46	204
163	65	55	91	2026-09-18 11:20:16	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	wniosek mniejszości 2	\N	f	181	223	10	46	224
164	65	55	92	2026-09-18 11:20:51	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	poprawki nr 2 i 4	\N	f	255	4	180	21	5
165	65	55	93	2026-09-18 11:21:41	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	poprawki nr 3 i 10	\N	f	258	1	178	23	2
166	65	55	94	2026-09-18 11:22:22	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	wniosek mniejszości 6	\N	f	180	230	28	22	231
167	65	55	95	2026-09-18 11:22:53	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	poprawka 5	\N	f	243	26	171	20	27
168	65	55	96	2026-09-18 11:23:29	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	poprawka 6	\N	f	218	213	3	26	214
169	65	55	97	2026-09-18 11:24:11	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	poprawka 9	\N	f	233	183	21	23	184
170	65	55	98	2026-09-18 11:24:36	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	wniosek mniejszości 7	\N	f	24	238	171	27	239
171	65	55	99	2026-09-18 11:25:03	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o poselskim projekcie ustawy o wychowaniu patriotycznym zmieniającej niektóre ustawy (druki nr 671, 2881 i 2881-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	223	197	7	33	198
172	65	56	100	2026-09-18 11:26:52	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawka 1	\N	f	179	254	2	25	255
173	65	56	101	2026-09-18 11:27:18	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawka 2	\N	f	54	231	143	32	232
174	65	56	102	2026-09-18 11:27:47	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawka 3	\N	f	180	251	1	28	252
175	65	56	103	2026-09-18 11:28:23	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawki nr 4 i 8	\N	f	275	19	141	25	20
176	65	56	104	2026-09-18 11:28:52	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawka 5	\N	f	294	3	134	29	4
177	65	56	105	2026-09-18 11:29:39	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawki nr 7, 9, 11 i 14	\N	f	186	251	0	23	252
178	65	56	106	2026-09-18 11:30:04	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawka 10	\N	f	83	227	113	37	228
179	65	56	107	2026-09-18 11:30:41	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	poprawki nr 12-13	\N	f	277	22	139	22	23
180	65	56	108	2026-09-18 11:31:12	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo farmaceutyczne (druki nr 3002, 3020 i 3020-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	254	2	182	22	3
181	65	57	109	2026-09-18 11:32:01	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o zmianie ustawy o prawie autorskim i prawach pokrewnych oraz ustawy o grach hazardowych (druki nr 3012 i 3018)	głosowanie nad całością projektu.	całość projektu ustawy	t	410	23	1	26	24
182	65	31	110	2026-09-18 11:33:17	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109)	wniosek o przystąpienie do trzeciego czytania bez kierowania projektu do komisji	\N	f	243	194	0	23	195
183	65	31	111	2026-09-18 11:34:15	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109)	poprawka nr 1, wniosek mniejszości nr 1	\N	f	195	212	23	30	213
184	65	31	112	2026-09-18 11:34:44	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109)	poprawka 2	\N	f	289	24	117	30	25
185	65	31	113	2026-09-18 11:35:22	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109)	poprawki nr 3 i 5	\N	f	201	228	7	24	229
186	65	31	114	2026-09-18 11:35:48	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109)	poprawka 4	\N	f	260	2	172	26	3
187	65	31	115	2026-09-18 11:36:17	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 3100 i 3109)	głosowanie nad całością projektu.	całość projektu ustawy	t	237	202	1	20	203
188	65	58	116	2026-09-18 11:37:34	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	wniosek o przystąpienie do trzeciego czytania bez kierowania projektu do komisji	\N	f	250	23	151	36	24
189	65	58	117	2026-09-18 11:38:34	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawki nr 1-2	\N	f	244	0	181	35	1
190	65	58	118	2026-09-18 11:39:03	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawka 3	\N	f	231	1	187	41	2
191	65	58	119	2026-09-18 11:39:38	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawka 4	\N	f	242	0	185	33	1
192	65	58	120	2026-09-18 11:40:13	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawka 5	\N	f	238	20	165	37	21
193	65	58	121	2026-09-18 11:40:38	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawka 6	\N	f	236	23	171	30	24
194	65	58	122	2026-09-18 11:41:14	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawki nr 7 i 10	\N	f	241	0	194	25	1
195	65	58	123	2026-09-18 11:41:43	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawka 8	\N	f	240	0	193	27	1
196	65	58	124	2026-09-18 11:42:08	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	poprawka 9	\N	f	228	1	201	30	2
197	65	58	125	2026-09-18 11:42:35	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 3102 i 3107)	głosowanie nad całością projektu.	całość projektu ustawy	t	241	0	193	26	1
198	65	32	126	2026-09-18 11:44:11	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	wniosek o przystąpienie do trzeciego czytania bez kierowania projektu do komisji	\N	f	270	165	2	23	166
199	65	32	127	2026-09-18 11:45:24	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	wniosek mniejszości 1	\N	f	23	409	1	27	410
200	65	32	128	2026-09-18 11:45:58	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	wniosek mniejszości 2	\N	f	92	338	2	28	339
201	65	32	129	2026-09-18 11:46:26	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	poprawka 1	\N	f	61	365	3	31	366
414	57	123	122	2026-05-15 10:55:31	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537)	poprawka 1	\N	f	5	239	194	22	220
202	65	32	130	2026-09-18 11:46:56	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	poprawka 2	\N	f	212	196	26	26	197
203	65	32	131	2026-09-18 11:47:22	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	wniosek mniejszości 3	\N	f	76	356	3	25	357
204	65	32	132	2026-09-18 11:47:51	ELECTRONIC	Pkt. 53 Sprawozdanie Komisji Finansów Publicznych oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej o rządowym oraz poselskich projektach ustaw:- o zmianie ustawy o podatkach i opłatach lokalnych, ustawy o podatku dochodowym od osób fizycznych oraz ustawy o podatku od czynności cywilnoprawnych;- o zmianie ustawy o podatkach i opłatach lokalnych oraz ustawy o dochodach jednostek samorządu terytorialnego;- o zmianie ustawy o podatkach i opłatach lokalnych oraz o zmianie niektórych innych ustaw (druki nr 3099, 2033, 2127, 2872 i 3118)	głosowanie nad całością projektu.	całość projektu ustawy	t	269	141	28	22	142
205	65	59	133	2026-09-18 11:48:57	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o przedstawionym przez Prezydium Sejmu projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Konstytucji Rzeczypospolitej Polskiej z dnia 2 kwietnia 1997 r. w 30. rocznicę jej uchwalenia (druki nr 2556 i 2758)	głosowanie nad całością projektu.	całość projektu uchwały	t	373	30	35	22	31
206	65	60	134	2026-09-18 11:49:53	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Tadeusza Mazowieckiego (druki nr 2510 i 2717)	głosowanie nad całością projektu.	całość projektu uchwały	t	383	26	23	28	27
207	65	61	135	2026-09-18 11:50:44	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem św. Andrzeja Boboli (druki nr 2419 i 2686)	głosowanie nad całością projektu.	całość projektu uchwały	t	401	12	11	36	13
208	65	62	136	2026-09-18 11:53:26	ELECTRONIC	Pkt. 30 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Objawień Matki Bożej Gietrzwałdzkiej (druki nr 2506 i 2759)	głosowanie nad całością projektu.	całość projektu uchwały	t	377	25	12	46	26
209	65	63	137	2026-09-18 11:54:23	ELECTRONIC	Pkt. 31 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Jerzego Żurawlewa (druki nr 2507 i 2757)	głosowanie nad całością projektu.	całość projektu uchwały	t	421	0	0	39	1
210	65	64	138	2026-09-18 11:55:19	ELECTRONIC	Pkt. 32 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Kazimiery Bujwidowej (druki nr 2508 i 2715)	głosowanie nad całością projektu.	całość projektu uchwały	t	393	23	11	33	24
211	65	65	139	2026-09-18 11:56:11	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie ustanowienia roku 2027 Rokiem Nauki (druki nr 2509 i 2716)	głosowanie nad całością projektu.	całość projektu uchwały	t	423	1	2	34	2
212	65	66	140	2026-09-18 11:57:18	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o ratyfikacji Konwencji Rady Europy w sprawie koprodukcji utworów audiowizualnych w formie seriali, sporządzonej w Lille dnia 26 marca 2026 r. (druki nr 2841 i 2852)	głosowanie nad całością projektu.	całość projektu ustawy	t	397	0	24	39	1
213	65	67	141	2026-09-18 11:58:25	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o rządowym projekcie ustawy o ratyfikacji Międzynarodowej konwencji z Hongkongu o bezpiecznym i ekologicznie racjonalnym recyklingu statków, sporządzonej w Hongkongu dnia 15 maja 2009 r. (druki nr 2738 i 2844)	głosowanie nad całością projektu.	całość projektu ustawy	t	418	0	1	41	1
214	65	68	142	2026-09-18 11:59:36	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o rządowym projekcie ustawy o ratyfikacji Traktatu między Rzecząpospolitą Polską a Zjednoczonym Królestwem Wielkiej Brytanii i Irlandii Północnej o partnerstwie w dziedzinie bezpieczeństwa i obronności, podpisanego w Londynie dnia 27 maja 2026 r. (druki nr 2840 i 3050)	głosowanie nad całością projektu.	całość projektu ustawy	t	392	3	20	45	4
215	65	69	143	2026-09-18 12:00:44	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Japonią o zabezpieczeniu społecznym, podpisanej w Tokio dnia 15 kwietnia 2026 r. (druki nr 2810 i 3062)	głosowanie nad całością projektu.	całość projektu ustawy	t	389	22	1	48	23
216	65	46	144	2026-09-18 12:02:06	ELECTRONIC	Pkt. 36 Sprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2025 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2725 i 2829)	poprawka 1	\N	f	175	237	0	48	238
217	65	46	145	2026-09-18 12:02:40	ELECTRONIC	Pkt. 36 Sprawozdanie Krajowej Rady Radiofonii i Telewizji z działalności w 2025 roku oraz Informacja o podstawowych problemach radiofonii i telewizji w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2725 i 2829)	głosowanie nad całością projektu.	całość projektu uchwały	t	227	188	0	45	189
218	65	47	146	2026-09-18 12:03:53	ELECTRONIC	Pkt. 37 Informacja o działalności Rady Mediów Narodowych w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2726 i 2830)	poprawka 1	\N	f	176	238	0	46	239
219	65	47	147	2026-09-18 12:04:23	ELECTRONIC	Pkt. 37 Informacja o działalności Rady Mediów Narodowych w 2025 roku wraz z komisyjnym projektem uchwały (druki nr 2726 i 2830)	głosowanie nad całością projektu.	całość projektu uchwały	t	220	189	1	50	190
220	55	70	1	2026-04-14 11:11:29	ELECTRONIC	Pkt. 1 Zmiany w składach osobowych komisji sejmowych (druk nr 2407)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku	f	228	162	13	57	163
221	55	\N	2	2026-04-14 11:13:43	ELECTRONIC	55. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 14, 15, 16 i 17 kwietnia 2026 r.	Wniosek o przerwę	\N	f	178	225	2	55	226
222	55	\N	3	2026-04-14 11:19:55	ELECTRONIC	55. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 14, 15, 16 i 17 kwietnia 2026 r.	Głosowanie kworum	\N	f	0	0	0	60	230
223	55	71	4	2026-04-16 14:25:14	ELECTRONIC	Głosowanie proceduralne dotyczące druku 2430	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2430	\N	f	224	171	18	47	172
225	55	73	6	2026-04-16 14:27:09	ELECTRONIC	Głosowanie proceduralne dotyczące planowanego sprawozdania do druku 2440	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie planowanego sprawozdania do druku nr 2440	\N	f	410	1	3	46	2
226	55	\N	7	2026-04-16 14:28:21	ELECTRONIC	55. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 14, 15, 16 i 17 kwietnia 2026 r.	ustalenie czasów debat	\N	f	227	171	13	49	172
227	55	\N	8	2026-04-17 09:09:32	ELECTRONIC	55. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 14, 15, 16 i 17 kwietnia 2026 r.	Wniosek o przerwę	\N	f	52	367	9	32	368
228	55	\N	9	2026-04-17 09:11:50	ELECTRONIC	55. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 14, 15, 16 i 17 kwietnia 2026 r.	Głosowanie kworum	\N	f	0	0	0	33	230
229	55	74	10	2026-04-17 09:26:08	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy o radcach prawnych (druki nr 1963 i 2367)	głosowanie nad całością projektu.	całość projektu ustawy	t	261	0	173	26	1
230	55	75	11	2026-04-17 09:27:39	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw (druki nr 2317 i 2364)	głosowanie nad wnioskiem komisji o odrzucenie projektu ustawy	wniosek Komisji o odrzucenie projektu ustawy	f	198	241	0	21	242
231	55	76	12	2026-04-17 09:45:36	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o postępowaniu egzekucyjnym w administracji (druki nr 2319 i 2383)	głosowanie nad całością projektu.	całość projektu ustawy	t	438	1	0	21	2
232	55	77	13	2026-04-17 10:06:49	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o wniosku Prezydenta Rzeczypospolitej Polskiej o ponowne rozpatrzenie ustawy z dnia 18 grudnia 2025 r. o rynku kryptoaktywów (druki nr 2267 i 2436)	głosowanie nad wnioskiem o ponowne uchwalenie ustawy	wniosek o ponowne uchwalenie ustawy	f	243	191	3	23	263
233	55	78	14	2026-04-17 10:09:27	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawki nr 1, 8, 11-12 i 16	\N	f	198	240	0	22	241
234	55	78	15	2026-04-17 10:10:08	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawki nr 2 i 13	\N	f	243	1	196	20	2
235	55	78	16	2026-04-17 10:10:45	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawki nr 3 oraz 14-15	\N	f	413	3	21	23	4
236	55	78	17	2026-04-17 10:11:15	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 4	\N	f	9	425	0	26	426
237	55	78	18	2026-04-17 10:11:50	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawki nr 5-6	\N	f	261	5	166	28	6
238	55	78	19	2026-04-17 10:12:24	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 7	\N	f	260	2	171	27	3
239	55	78	20	2026-04-17 10:12:55	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 9	\N	f	202	229	5	24	230
240	55	78	21	2026-04-17 10:13:22	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 10	\N	f	432	0	0	28	1
241	55	78	22	2026-04-17 10:13:49	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 17	\N	f	264	0	171	25	1
242	55	78	23	2026-04-17 10:14:19	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 18	\N	f	432	0	5	23	1
243	55	78	24	2026-04-17 10:14:56	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawki nr 19-20 i 29	\N	f	240	1	192	27	2
244	55	78	25	2026-04-17 10:15:28	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 21	\N	f	241	0	193	26	1
245	55	78	26	2026-04-17 10:16:03	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 22	\N	f	177	233	26	24	234
246	55	78	27	2026-04-17 10:16:44	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawki nr 23-25 i 31	\N	f	420	0	22	18	1
247	55	78	28	2026-04-17 10:17:25	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 26	\N	f	264	0	178	18	1
248	55	78	29	2026-04-17 10:17:59	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 27	\N	f	438	1	2	19	2
249	55	78	30	2026-04-17 10:18:30	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 28	\N	f	207	233	0	20	234
250	55	78	31	2026-04-17 10:18:57	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	poprawka 30	\N	f	173	241	21	25	242
251	55	78	32	2026-04-17 10:19:27	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2293, 2380 i 2380-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	245	22	171	22	23
252	55	79	33	2026-04-17 10:22:24	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o języku polskim oraz ustawy o Narodowej Agencji Wymiany Akademickiej (druki nr 2361, 2385 i 2385-A)	poprawka 1	\N	f	161	242	6	51	243
253	55	79	34	2026-04-17 10:22:54	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o języku polskim oraz ustawy o Narodowej Agencji Wymiany Akademickiej (druki nr 2361, 2385 i 2385-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	234	188	5	33	189
254	55	80	35	2026-04-17 10:24:41	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2290, 2312 i 2312-A)	poprawki nr 1-2	\N	f	29	253	148	30	254
255	55	80	36	2026-04-17 10:25:09	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2290, 2312 i 2312-A)	wniosek mniejszości 1	\N	f	188	240	1	31	241
256	55	80	37	2026-04-17 10:25:38	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2290, 2312 i 2312-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	238	179	21	22	180
257	55	81	38	2026-04-17 10:27:29	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2272, 2386 i 2386-A)	wniosek o odrzucenie w całości projektu.	\N	f	203	237	0	20	238
258	55	81	39	2026-04-17 10:27:55	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2272, 2386 i 2386-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	236	194	0	30	195
259	55	82	40	2026-04-17 10:28:56	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o ratyfikacji Umowy między Rządem Rzeczypospolitej Polskiej a Gabinetem Ministrów Ukrainy o współpracy w zwalczaniu przestępczości, podpisanej we Lwowie dnia 11 grudnia 2025 r. (druki nr 2276 i 2379)	głosowanie nad całością projektu.	całość projektu ustawy	t	242	10	185	23	11
260	55	83	41	2026-04-17 10:30:02	ELECTRONIC	Pkt. 10 Pierwsze czytanie poselskiego projektu ustawy o najmie krótkoterminowym (druki nr 2353 i 2353-A)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	22	417	3	18	418
261	55	83	42	2026-04-17 10:31:29	ELECTRONIC	Pkt. 10 Pierwsze czytanie poselskiego projektu ustawy o najmie krótkoterminowym (druki nr 2353 i 2353-A)	wniosek o przystąpienie do drugiego czytania  bez kierowania projektu do komisji	\N	f	17	425	0	18	426
262	55	83	43	2026-04-17 10:32:39	ELECTRONIC	Pkt. 10 Pierwsze czytanie poselskiego projektu ustawy o najmie krótkoterminowym (druki nr 2353 i 2353-A)	wniosek o skierowanie projektu ustawy do Komisji Infrastruktury oraz Komisji Samorządu Terytorialnego i Polityki Regionalnej	\N	f	419	24	0	17	25
263	55	84	44	2026-04-17 10:33:34	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o wspieraniu rozwoju obszarów wiejskich z udziałem środków Europejskiego Funduszu Rolnego na rzecz Rozwoju Obszarów Wiejskich w ramach Programu Rozwoju Obszarów Wiejskich na lata 2014-2020 oraz niektórych innych ustaw (druki nr 2371 i 2427)	głosowanie nad całością projektu.	całość projektu ustawy	t	421	0	20	19	1
264	55	85	45	2026-04-17 10:34:32	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o finansach publicznych oraz niektórych innych ustaw (druki nr 2388 i 2430)	głosowanie nad całością projektu.	całość projektu ustawy	t	353	62	19	26	63
265	55	86	46	2026-04-17 10:35:19	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o utworzeniu Uniwersytetu Medycznego w Łodzi (druki nr 2404 i 2435)	głosowanie nad całością projektu.	całość projektu ustawy	t	433	4	0	23	5
266	55	20	47	2026-04-17 10:36:14	ELECTRONIC	Pkt. 11 Pierwsze czytanie rządowego projektu ustawy o wykonywaniu orzeczeń Europejskiego Trybunału Praw Człowieka (druk nr 2271)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	201	236	0	23	237
267	55	73	48	2026-04-17 10:37:02	ELECTRONIC	Pkt. 30 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o systemie instytucji rozwoju (druki nr 2440 i 2448)	głosowanie nad całością projektu.	całość projektu ustawy	t	440	0	0	20	1
268	55	87	49	2026-04-17 10:40:24	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie	poprawka 1	\N	f	201	211	26	22	212
269	55	87	50	2026-04-17 10:40:53	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie	poprawka 2	\N	f	196	240	2	22	241
270	55	87	51	2026-04-17 10:41:26	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie	poprawka 3	\N	f	434	1	0	25	2
271	55	87	52	2026-04-17 10:42:08	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie	poprawki nr 4 i 6	\N	f	196	238	4	22	239
272	55	87	53	2026-04-17 10:42:39	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie	poprawka 5	\N	f	206	231	1	22	232
273	55	87	54	2026-04-17 10:43:09	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 1765, 2278 i 2278-A) - trzecie czytanie	głosowanie nad całością projektu.	całość projektu ustawy	t	260	6	166	28	7
274	55	88	55	2026-04-17 10:45:59	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 2400 i 2405)	poprawki nr 1-2, 5-6 i 10	\N	f	178	258	4	20	221
275	55	88	56	2026-04-17 10:46:44	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 2400 i 2405)	poprawki nr 3-4 oraz 7-8	\N	f	175	257	4	24	219
276	55	88	57	2026-04-17 10:47:26	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 2400 i 2405)	poprawka 9	\N	f	178	258	4	20	221
277	55	88	58	2026-04-17 10:48:08	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o koordynacji działań antykorupcyjnych oraz o likwidacji Centralnego Biura Antykorupcyjnego (druki nr 2400 i 2405)	poprawka 11	\N	f	167	259	16	18	222
278	55	89	59	2026-04-17 10:50:48	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429)	poprawki nr 1-4, 7-11, 13-14, 16, 18 oraz 20-21	\N	f	0	261	175	24	219
279	55	89	60	2026-04-17 10:51:35	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429)	poprawki nr 5, 15 i 17	\N	f	0	262	174	24	219
415	57	123	123	2026-05-15 10:56:07	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537)	poprawka 2	\N	f	1	239	199	21	220
280	55	89	61	2026-04-17 10:52:18	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429)	poprawka 6	\N	f	0	262	173	25	218
281	55	89	62	2026-04-17 10:52:57	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429)	poprawka 12	\N	f	1	264	173	22	220
282	55	89	63	2026-04-17 10:53:40	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z przekazywaniem informacji do europejskiego pojedynczego punktu dostępu (druki nr 2403 i 2429)	poprawka 19	\N	f	1	259	176	24	219
283	55	90	64	2026-04-17 10:55:22	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Funduszu Ochrony Rolnictwa (druki nr 2402 i 2428)	poprawka 1	\N	f	0	430	6	24	219
284	55	91	65	2026-04-17 10:57:16	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 1	\N	f	0	234	194	32	215
285	55	91	66	2026-04-17 10:57:52	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 2	\N	f	0	433	4	23	219
286	55	91	67	2026-04-17 10:58:25	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 3	\N	f	0	262	175	23	219
287	55	91	68	2026-04-17 10:59:03	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawki nr 4-7, 10 oraz 13-14	\N	f	1	241	195	23	219
288	55	91	69	2026-04-17 10:59:36	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 8	\N	f	162	263	6	29	216
289	55	91	70	2026-04-17 11:00:13	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 9	\N	f	0	435	2	23	219
290	55	91	71	2026-04-17 11:00:47	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 11	\N	f	0	261	172	27	217
291	55	91	72	2026-04-17 11:01:21	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie ludności i obronie cywilnej oraz niektórych innych ustaw (druki nr 2401 i 2406)	poprawka 12	\N	f	0	259	175	26	218
292	55	92	73	2026-04-17 11:02:25	ELECTRONIC	Pkt. 26 Zmiany w składach osobowych komisji sejmowych (druk nr 2439)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku	f	410	5	4	41	6
293	57	93	1	2026-05-12 12:13:11	ELECTRONIC	Głosowanie proceduralne dotyczące planowanego sprawozdania do druku nr 2460	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie planowanego sprawozdania do druku nr 2460	\N	f	215	179	5	60	180
294	57	\N	2	2026-05-12 12:14:33	ELECTRONIC	57. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 12, 13, 14 i 15 maja 2026 r.	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu	\N	f	222	181	0	56	182
295	57	\N	3	2026-05-12 12:22:02	ELECTRONIC	57. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 12, 13, 14 i 15 maja 2026 r.	Wniosek o przerwę	\N	f	175	222	2	60	223
296	57	94	4	2026-05-12 18:51:55	ELECTRONIC	Pkt. 4 Pierwsze czytanie poselskiego projektu ustawy o rynku kryptoaktywów (druk nr 2363)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	12	222	175	50	223
297	57	95	5	2026-05-12 18:54:21	ELECTRONIC	Pkt. 6 Pierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o rynku kryptoaktywów (druk nr 2528)	wniosek o przystąpienie do drugiego czytania  bez kierowania projektu do komisji	\N	f	186	223	1	49	224
298	57	96	6	2026-05-12 18:55:52	ELECTRONIC	Pkt. 7 Pierwsze czytanie rządowego projektu ustawy o rynku kryptoaktywów (druk nr 2529)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	188	222	0	49	223
299	57	97	7	2026-05-14 14:12:51	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2535	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2535	\N	f	417	0	0	42	1
300	57	98	8	2026-05-14 14:13:38	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2564	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2564	\N	f	412	0	0	47	1
301	57	99	9	2026-05-14 14:15:18	ELECTRONIC	Pkt. 23 Rozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 2501)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej	wniosek z druku	f	399	12	3	45	13
302	57	100	10	2026-05-15 09:15:06	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2537	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2537	\N	f	235	177	20	28	178
303	57	101	11	2026-05-15 09:15:43	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2571	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2571	\N	f	238	193	0	29	194
304	57	102	12	2026-05-15 09:16:22	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2574	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2574	\N	f	236	176	19	29	177
305	57	103	13	2026-05-15 09:17:03	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2543	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2543	\N	f	235	199	5	21	200
306	57	\N	14	2026-05-15 09:20:21	ELECTRONIC	57. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 12, 13, 14 i 15 maja 2026 r.	Wniosek o przerwę	\N	f	192	232	1	35	233
307	57	\N	15	2026-05-15 09:24:13	ELECTRONIC	57. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 12, 13, 14 i 15 maja 2026 r.	Głosowanie kworum	\N	f	0	0	0	33	230
308	57	\N	16	2026-05-15 09:34:31	ELECTRONIC	57. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 12, 13, 14 i 15 maja 2026 r.	wniosek o odroczenie posiedzenia	\N	f	7	422	6	25	423
309	57	104	17	2026-05-15 09:35:25	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie upamiętnienia 120. rocznicy urodzin profesora Tadeusza Wacława Korzybskiego (druki nr 2215 i 2437)	głosowanie nad całością projektu.	całość projektu uchwały	t	442	0	0	18	1
310	57	105	18	2026-05-15 09:37:15	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie upamiętnienia 100. rocznicy urodzin Tadeusza Konwickiego (druki nr 2275, 2483 i 2483-A)	poprawka 1	\N	f	195	224	2	39	225
311	57	105	19	2026-05-15 09:37:42	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie upamiętnienia 100. rocznicy urodzin Tadeusza Konwickiego (druki nr 2275, 2483 i 2483-A)	głosowanie nad całością projektu.	całość projektu uchwały	t	260	2	168	30	3
312	57	106	20	2026-05-15 09:38:33	ELECTRONIC	Pkt. 30 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie upamiętnienia 125. rocznicy strajku dzieci wrzesińskich (druki nr 2493 i 2564)	głosowanie nad całością projektu.	całość projektu uchwały	t	439	2	0	19	3
313	57	107	21	2026-05-15 09:42:16	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 1	\N	f	197	239	1	23	240
314	57	107	22	2026-05-15 09:42:45	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 2	\N	f	24	394	0	42	395
315	57	107	23	2026-05-15 09:43:12	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 3	\N	f	18	413	0	29	414
316	57	107	24	2026-05-15 09:43:45	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 4	\N	f	23	411	0	26	412
317	57	107	25	2026-05-15 09:44:25	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawki nr 5-8 i 32	\N	f	199	231	6	24	232
318	57	107	26	2026-05-15 09:44:51	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 9	\N	f	197	239	0	24	240
319	57	107	27	2026-05-15 09:45:34	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawki nr 10, 12-13, 15-18 i 27	\N	f	201	232	6	21	233
320	57	107	28	2026-05-15 09:46:09	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawki nr 11 i 14	\N	f	218	218	0	24	219
321	57	107	29	2026-05-15 09:46:40	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 19	\N	f	24	409	0	27	410
322	57	107	30	2026-05-15 09:47:09	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 20	\N	f	23	406	0	31	407
323	57	107	31	2026-05-15 09:47:40	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 21	\N	f	200	242	0	18	243
324	57	107	32	2026-05-15 09:48:08	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 22	\N	f	196	240	0	24	241
325	57	107	33	2026-05-15 09:48:39	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 23	\N	f	195	242	0	23	243
326	57	107	34	2026-05-15 09:49:07	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 24	\N	f	212	224	0	24	225
327	57	107	35	2026-05-15 09:49:37	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 25	\N	f	198	239	0	23	240
328	57	107	36	2026-05-15 09:50:10	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 26	\N	f	24	412	0	24	413
329	57	107	37	2026-05-15 09:50:38	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 28	\N	f	21	420	0	19	421
330	57	107	38	2026-05-15 09:51:04	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 29	\N	f	22	413	0	25	414
382	57	118	90	2026-05-15 10:33:01	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 20	\N	f	241	179	21	19	180
331	57	107	39	2026-05-15 09:51:31	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 30	\N	f	22	413	0	25	414
332	57	107	40	2026-05-15 09:51:57	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 31	\N	f	23	413	0	24	414
333	57	107	41	2026-05-15 09:52:33	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawki nr 33-36	\N	f	215	226	0	19	227
334	57	107	42	2026-05-15 09:53:04	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 37	\N	f	197	238	0	25	239
335	57	107	43	2026-05-15 09:53:31	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 38	\N	f	20	417	0	23	418
336	57	107	44	2026-05-15 09:54:06	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	poprawka 39	\N	f	22	413	0	25	414
337	57	107	45	2026-05-15 09:58:17	ELECTRONIC	Pkt. 24 Sprawozdanie Komisji o:- poselskim projekcie ustawy o kryptoaktywach,- poselskim, przedstawionym przez Prezydenta Rzeczypospolitej Polskiej oraz rządowym projektach ustaw o rynku kryptoaktywów (druki nr 2530, 2363, 2528, 2529, 2563 i 2563-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	241	200	0	19	201
338	57	108	46	2026-05-15 10:00:08	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 2457, 2479 i 2479-A)	poprawka 1	\N	f	32	233	148	47	234
339	57	108	47	2026-05-15 10:00:35	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku akcyzowym (druki nr 2457, 2479 i 2479-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	231	23	174	32	24
340	57	109	48	2026-05-15 10:01:19	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku od spadków i darowizn (druki nr 2489 i 2535)	głosowanie nad całością projektu.	całość projektu ustawy	t	437	0	1	22	1
341	57	110	49	2026-05-15 10:02:02	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz niektórych innych ustaw (druki nr 2287 i 2480)	głosowanie nad całością projektu.	całość projektu ustawy	t	243	0	194	23	1
342	57	111	50	2026-05-15 10:02:55	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku dochodowym od osób fizycznych, ustawy o podatku dochodowym od osób prawnych oraz ustawy o zryczałtowanym podatku dochodowym od niektórych przychodów osiąganych przez osoby fizyczne (druki nr 2445 i 2487)	głosowanie nad całością projektu.	całość projektu ustawy	t	439	0	0	21	1
343	57	112	51	2026-05-15 10:05:00	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o zapobieganiu oraz zwalczaniu zakażeń i chorób zakaźnych u ludzi (druki nr 2456, 2475 i 2475-A)	poprawki nr 1-2	\N	f	200	231	6	23	232
344	57	112	52	2026-05-15 10:05:31	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o zapobieganiu oraz zwalczaniu zakażeń i chorób zakaźnych u ludzi (druki nr 2456, 2475 i 2475-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	235	22	182	21	23
345	57	93	53	2026-05-15 10:07:18	ELECTRONIC	Pkt. 11 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia (druki nr 2460, 2544 i 2544-A)	wniosek mniejszości 1	\N	f	182	230	21	27	231
346	57	93	54	2026-05-15 10:08:06	ELECTRONIC	Pkt. 11 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia (druki nr 2460, 2544 i 2544-A)	poprawki nr 1-2	\N	f	438	1	0	21	2
347	57	93	55	2026-05-15 10:08:35	ELECTRONIC	Pkt. 11 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia (druki nr 2460, 2544 i 2544-A)	wniosek mniejszości 2	\N	f	200	229	0	31	230
348	57	93	56	2026-05-15 10:09:22	ELECTRONIC	Pkt. 11 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia (druki nr 2460, 2544 i 2544-A)	poprawka nr 3, wniosek mniejszości nr 3	\N	f	441	0	0	19	1
349	57	93	57	2026-05-15 10:09:49	ELECTRONIC	Pkt. 11 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z rozwojem usług e-zdrowia (druki nr 2460, 2544 i 2544-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	415	0	25	20	1
350	57	113	58	2026-05-15 10:11:40	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2318, 2481 i 2481-A)	poprawka 1	\N	f	181	224	16	39	225
351	57	113	59	2026-05-15 10:12:13	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2318, 2481 i 2481-A)	poprawka 2	\N	f	189	229	17	25	230
352	57	113	60	2026-05-15 10:12:52	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2318, 2481 i 2481-A)	poprawki nr 3 i 5	\N	f	21	399	15	25	400
353	57	113	61	2026-05-15 10:13:25	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2318, 2481 i 2481-A)	poprawka 4	\N	f	200	233	0	27	234
383	57	118	91	2026-05-15 10:33:34	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	359	23	59	19	24
354	57	113	62	2026-05-15 10:13:51	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu uproszczenia procedur administracyjnych w sprawach rozstrzyganych w drodze decyzji administracyjnych albo załatwianych milcząco (druki nr 2318, 2481 i 2481-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	410	5	20	25	6
355	57	114	63	2026-05-15 10:14:41	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks karny (druki nr 2398 i 2462)	głosowanie nad całością projektu.	całość projektu ustawy	t	435	0	4	21	1
356	57	115	64	2026-05-15 10:15:24	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego (druki nr 2387 i 2463)	głosowanie nad całością projektu.	całość projektu ustawy	t	242	24	175	19	25
357	57	116	65	2026-05-15 10:17:16	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druki nr 2372, 2441 i 2441-A)	poprawki nr 1-2 oraz 5-7	\N	f	206	231	0	23	232
358	57	116	66	2026-05-15 10:18:05	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druki nr 2372, 2441 i 2441-A)	poprawka 3	\N	f	204	233	0	23	234
359	57	116	67	2026-05-15 10:18:34	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druki nr 2372, 2441 i 2441-A)	poprawka 4	\N	f	197	230	0	33	231
360	57	116	68	2026-05-15 10:18:59	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks postępowania karnego oraz ustawy - Kodeks karny skarbowy (druki nr 2372, 2441 i 2441-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	435	1	0	24	2
361	57	117	69	2026-05-15 10:21:40	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw (druki nr 2355, 2531 i 2531-A)	poprawka 1	\N	f	197	240	0	23	241
362	57	117	70	2026-05-15 10:22:23	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw (druki nr 2355, 2531 i 2531-A)	poprawki nr 2-4	\N	f	259	1	172	28	2
363	57	117	71	2026-05-15 10:23:03	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw (druki nr 2355, 2531 i 2531-A)	poprawka 6	\N	f	207	233	0	20	234
364	57	117	72	2026-05-15 10:23:31	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zarządzaniu kryzysowym oraz niektórych innych ustaw (druki nr 2355, 2531 i 2531-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	262	4	174	20	5
365	57	118	73	2026-05-15 10:24:52	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 1	\N	f	240	4	178	38	5
366	57	118	74	2026-05-15 10:25:26	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 2	\N	f	203	228	0	29	229
367	57	118	75	2026-05-15 10:25:56	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 3	\N	f	437	1	0	22	2
368	57	118	76	2026-05-15 10:26:27	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 4	\N	f	236	2	200	22	3
369	57	118	77	2026-05-15 10:26:53	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 5	\N	f	25	212	187	36	213
370	57	118	78	2026-05-15 10:27:19	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 6	\N	f	419	3	3	35	4
371	57	118	79	2026-05-15 10:27:50	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawki nr 7-8	\N	f	418	0	23	19	1
372	57	118	80	2026-05-15 10:28:20	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 9	\N	f	236	2	198	24	3
373	57	118	81	2026-05-15 10:28:48	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 10	\N	f	28	408	0	24	409
374	57	118	82	2026-05-15 10:29:18	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawki nr 11 i 17	\N	f	412	1	20	27	2
375	57	118	83	2026-05-15 10:29:46	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 12	\N	f	29	387	21	23	388
376	57	118	84	2026-05-15 10:30:14	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 13	\N	f	38	397	0	25	398
377	57	118	85	2026-05-15 10:30:43	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 14	\N	f	416	0	21	23	1
378	57	118	86	2026-05-15 10:31:10	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 15	\N	f	415	0	20	25	1
379	57	118	87	2026-05-15 10:31:36	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 16	\N	f	240	21	170	29	22
380	57	118	88	2026-05-15 10:32:02	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 18	\N	f	437	0	0	23	1
381	57	118	89	2026-05-15 10:32:28	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o rządowym projekcie ustawy o szczególnych środkach ochrony osób uczestniczących w debacie publicznej (druki nr 2488, 2542 i 2542-A)	poprawka 19	\N	f	418	0	21	21	1
384	57	119	92	2026-05-15 10:35:21	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawki nr 1-5, 7 oraz 16-17	\N	f	435	0	0	25	1
385	57	119	93	2026-05-15 10:35:45	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 6	\N	f	260	2	160	38	3
386	57	119	94	2026-05-15 10:36:11	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 8	\N	f	431	0	2	27	1
387	57	119	95	2026-05-15 10:36:39	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 9	\N	f	437	0	0	23	1
388	57	119	96	2026-05-15 10:37:03	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 10	\N	f	419	1	1	39	2
389	57	119	97	2026-05-15 10:37:31	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 11	\N	f	259	1	158	42	2
390	57	119	98	2026-05-15 10:37:58	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 12	\N	f	433	0	0	27	1
391	57	119	99	2026-05-15 10:38:23	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 13	\N	f	435	2	0	23	3
392	57	119	100	2026-05-15 10:38:51	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 14	\N	f	440	0	0	20	1
393	57	119	101	2026-05-15 10:39:15	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 15	\N	f	433	1	0	26	2
394	57	119	102	2026-05-15 10:39:40	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	poprawka 18	\N	f	430	0	1	29	1
395	57	119	103	2026-05-15 10:40:08	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o rządowym projekcie ustawy o udziale Rzeczypospolitej Polskiej w systemie Eurodac (druki nr 2533, 2567 i 2567-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	436	0	0	24	1
396	57	120	104	2026-05-15 10:41:02	ELECTRONIC	Pkt. 31 Pierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2444) - kontynuacja	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	239	198	1	22	199
397	57	121	105	2026-05-15 10:42:32	ELECTRONIC	Pkt. 32 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druki nr 2288, 2474 i 2474-A) - trzecie czytanie	wniosek o odrzucenie w całości projektu.	\N	f	199	240	1	20	241
398	57	121	106	2026-05-15 10:43:06	ELECTRONIC	Pkt. 32 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druki nr 2288, 2474 i 2474-A) - trzecie czytanie	poprawki nr 1-2	\N	f	23	242	173	22	243
399	57	121	107	2026-05-15 10:43:36	ELECTRONIC	Pkt. 32 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Ordynacja podatkowa oraz ustawy - Kodeks karny skarbowy (druki nr 2288, 2474 i 2474-A) - trzecie czytanie	głosowanie nad całością projektu.	całość projektu ustawy	t	241	199	0	20	200
400	57	75	108	2026-05-15 10:45:22	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw (druki nr 2317, 2467 i 2467-A)	poprawki nr 1-3	\N	f	251	185	0	24	186
401	57	75	109	2026-05-15 10:45:48	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw (druki nr 2317, 2467 i 2467-A)	poprawka 4	\N	f	226	155	0	79	156
402	57	75	110	2026-05-15 10:46:17	ELECTRONIC	Pkt. 25 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zapobieganiu zanieczyszczaniu morza przez statki oraz niektórych innych ustaw (druki nr 2317, 2467 i 2467-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	237	199	0	24	200
403	57	122	111	2026-05-15 10:48:54	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawki nr 1, 4 i 16	\N	f	165	259	10	26	260
404	57	122	112	2026-05-15 10:49:29	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 2	\N	f	439	0	0	21	1
405	57	122	113	2026-05-15 10:49:58	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 3	\N	f	212	229	0	19	230
406	57	122	114	2026-05-15 10:50:28	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 5	\N	f	441	0	0	19	1
407	57	122	115	2026-05-15 10:51:02	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawki nr 6-7	\N	f	417	0	21	22	1
408	57	122	116	2026-05-15 10:51:31	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 8	\N	f	180	259	0	21	260
409	57	122	117	2026-05-15 10:51:59	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 9	\N	f	178	260	0	22	261
410	57	122	118	2026-05-15 10:52:35	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawki nr 10-13	\N	f	419	0	21	20	1
411	57	122	119	2026-05-15 10:53:03	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 14	\N	f	415	0	20	25	1
412	57	122	120	2026-05-15 10:53:33	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	poprawka 15	\N	f	438	0	0	22	1
413	57	122	121	2026-05-15 10:54:01	ELECTRONIC	Pkt. 29 Sprawozdanie Komisji o rządowym projekcie ustawy o utworzeniu Wojskowej Akademii Medycznej (druki nr 2458, 2485 i 2485-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	275	1	163	21	2
416	57	123	124	2026-05-15 10:56:50	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537)	poprawka 3	\N	f	2	242	194	22	220
417	57	123	125	2026-05-15 10:57:24	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537)	poprawka 4	\N	f	172	238	22	28	217
418	57	123	126	2026-05-15 10:57:57	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o radcach prawnych (druki nr 2525 i 2537)	poprawka 5	\N	f	1	239	190	30	216
419	57	124	127	2026-05-15 10:59:33	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o postępowaniu egzekucyjnym w administracji (druki nr 2522 i 2539)	poprawka 1	\N	f	1	430	1	28	217
420	57	125	128	2026-05-15 11:01:16	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawki nr 1, 3-7, 9-10, 12, 15, 17-23 oraz 26-27	\N	f	0	240	194	26	218
421	57	125	129	2026-05-15 11:01:50	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 2	\N	f	22	239	172	27	217
422	57	125	130	2026-05-15 11:02:25	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 8	\N	f	19	237	170	34	214
423	57	125	131	2026-05-15 11:03:02	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 11	\N	f	22	240	175	23	219
424	57	125	132	2026-05-15 11:03:36	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 13	\N	f	22	241	175	22	220
425	57	125	133	2026-05-15 11:04:12	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 14	\N	f	24	239	172	25	218
426	57	125	134	2026-05-15 11:04:45	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 16	\N	f	23	239	175	23	219
427	57	125	135	2026-05-15 11:05:22	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 24	\N	f	2	240	195	23	219
428	57	125	136	2026-05-15 11:06:00	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 25	\N	f	23	237	179	21	220
429	57	125	137	2026-05-15 11:06:35	ELECTRONIC	Pkt. 35 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o Krajowym Rejestrze Oznakowanych Psów i Kotów (druki nr 2520 i 2571)	poprawka 28	\N	f	0	238	199	23	219
430	57	126	138	2026-05-15 11:08:09	ELECTRONIC	Pkt. 36 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2524 i 2574)	poprawka 1	\N	f	0	237	194	29	216
431	57	126	139	2026-05-15 11:08:41	ELECTRONIC	Pkt. 36 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2524 i 2574)	poprawka 2	\N	f	1	239	195	25	218
432	57	126	140	2026-05-15 11:09:13	ELECTRONIC	Pkt. 36 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie teleinformatycznym do obsługi niektórych umów oraz niektórych innych ustaw (druki nr 2524 i 2574)	poprawka 3	\N	f	0	238	197	25	218
433	57	127	141	2026-05-15 11:11:06	ELECTRONIC	Pkt. 37 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2523 i 2543)	poprawki nr 1-2 i 4	\N	f	0	242	194	24	219
434	57	127	142	2026-05-15 11:11:40	ELECTRONIC	Pkt. 37 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o systemie monitorowania drogowego i kolejowego przewozu towarów oraz obrotu paliwami opałowymi oraz niektórych innych ustaw (druki nr 2523 i 2543)	poprawka 3	\N	f	1	427	6	26	218
435	57	128	143	2026-05-15 11:13:24	ELECTRONIC	Pkt. 38 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 2521 i 2532)	poprawki nr 1-2	\N	f	2	241	193	24	219
436	57	128	144	2026-05-15 11:14:01	ELECTRONIC	Pkt. 38 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 2521 i 2532)	poprawka 3	\N	f	28	408	1	23	219
437	57	128	145	2026-05-15 11:14:36	ELECTRONIC	Pkt. 38 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie przyrody oraz niektórych innych ustaw (druki nr 2521 i 2532)	poprawka 4	\N	f	28	408	1	23	219
438	57	129	146	2026-05-15 11:28:24	ELECTRONIC	Pkt. 39 Wybór sędziów - członków Krajowej Rady Sądownictwa (druki nr 2526 i 2536)	Głosowanie nad wyborem sędziów-członków Krajowej Rady Sądownictwa	lista kandydatów ustalona przez komisję	f	235	18	5	202	155
439	57	130	147	2026-05-15 11:30:29	ELECTRONIC	Pkt. 41 Zmiany w składach osobowych komisji sejmowych (druk nr 2575)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku	f	250	137	4	69	138
440	63	131	1	2026-07-29 10:10:41	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2848	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr 2848	\N	f	183	250	0	27	251
441	63	132	2	2026-07-29 10:12:14	ELECTRONIC	Głosowanie proceduralne dotyczące planowanego sprawozdania do druku nr 2600	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie planowanego sprawozdania do druku nr 2600	\N	f	419	1	18	22	2
442	63	133	3	2026-07-29 10:12:52	ELECTRONIC	Głosowanie proceduralne dotyczące planowanego sprawozdania do druku nr 2842	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu  w sprawie planowanego sprawozdania do druku nr 2842	\N	f	239	198	0	23	199
443	63	134	4	2026-07-29 10:20:44	ELECTRONIC	Pkt. 2 Pierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie ustalenia liczby członków Komisji do Spraw Służb Specjalnych (druk nr 2811)	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu, w sprawie uchwały z druku nr 2811	wniosek o przystąpienie do drugiego czytania bez kierowania projektu do komisji	f	240	197	0	23	198
444	63	134	5	2026-07-29 10:21:22	ELECTRONIC	Pkt. 2 Pierwsze czytanie przedstawionego przez Prezydium Sejmu projektu uchwały w sprawie ustalenia liczby członków Komisji do Spraw Służb Specjalnych (druk nr 2811)	głosowanie nad całością projektu.	całość projektu uchwały	t	232	200	5	23	201
446	63	\N	7	2026-07-29 10:25:57	ELECTRONIC	63. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 29, 30 i 31 lipca 2026 r.	Głosowanie kworum	\N	f	0	0	0	21	230
447	63	135	8	2026-07-31 10:42:52	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2862	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2862	\N	f	240	199	0	21	200
448	63	136	9	2026-07-31 10:43:35	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2847	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2847	\N	f	439	3	0	18	4
449	63	137	10	2026-07-31 10:44:15	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2854	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2854	\N	f	238	198	7	17	199
450	63	138	11	2026-07-31 10:45:37	ELECTRONIC	Głosowanie proceduralne dotyczące druku nr 2878	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr 2878	\N	f	445	1	0	14	2
451	63	\N	12	2026-07-31 10:54:05	ELECTRONIC	63. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 29, 30 i 31 lipca 2026 r.	Wniosek o przerwę	\N	f	202	242	2	14	243
452	63	\N	13	2026-07-31 10:58:03	ELECTRONIC	63. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 29, 30 i 31 lipca 2026 r.	Głosowanie kworum	\N	f	0	0	0	36	230
453	63	139	14	2026-07-31 11:45:34	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo ochrony środowiska (druki nr 2778 i 2818)	wniosek mniejszości 1	\N	f	178	232	0	50	233
454	63	139	15	2026-07-31 11:46:12	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo ochrony środowiska (druki nr 2778 i 2818)	wnioski mniejszości nr 2-5	\N	f	190	244	1	25	245
455	63	139	16	2026-07-31 11:46:42	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo ochrony środowiska (druki nr 2778 i 2818)	głosowanie nad całością projektu.	całość projektu ustawy	t	266	175	1	18	176
456	63	140	17	2026-07-31 11:48:17	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2411, 2820 i 2820-A)	poprawki nr 1-18	\N	f	7	239	196	18	240
457	63	140	18	2026-07-31 11:48:48	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wzmocnienia nadzoru sądowego nad kontrolą operacyjną (druki nr 2411, 2820 i 2820-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	264	1	176	19	2
458	63	141	19	2026-07-31 11:50:14	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o komisyjnym projekcie ustawy zmieniającej ustawę o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 2750, 2793 i 2793-A)	poprawka 1	\N	f	260	0	170	30	1
459	63	141	20	2026-07-31 11:50:48	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o komisyjnym projekcie ustawy zmieniającej ustawę o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 2750, 2793 i 2793-A)	poprawki nr 2-4	\N	f	246	0	194	20	1
460	63	141	21	2026-07-31 11:51:15	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o komisyjnym projekcie ustawy zmieniającej ustawę o zmianie ustawy - Prawo energetyczne oraz niektórych innych ustaw (druki nr 2750, 2793 i 2793-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	250	0	192	18	1
461	63	142	22	2026-07-31 11:52:45	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2649, 2682 i 2682-A)	poprawka 1	\N	f	402	32	0	26	33
462	63	142	23	2026-07-31 11:53:26	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2649, 2682 i 2682-A)	poprawka 3	\N	f	185	238	18	19	239
463	63	142	24	2026-07-31 11:53:56	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2649, 2682 i 2682-A)	poprawka 4	\N	f	436	7	0	17	8
464	63	142	25	2026-07-31 11:54:24	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o samorządzie gminnym (druki nr 2649, 2682 i 2682-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	423	0	22	15	1
465	63	143	26	2026-07-31 11:55:56	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 2675, 2787 i 2787-A)	poprawka 1	\N	f	417	1	19	23	2
466	63	143	27	2026-07-31 11:56:23	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o szczególnych rozwiązaniach związanych z usuwaniem skutków powodzi oraz niektórych innych ustaw (druki nr 2675, 2787 i 2787-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	418	0	18	24	1
467	63	144	28	2026-07-31 11:57:16	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o senackim projekcie ustawy o zmianie ustawy o samorządach zawodowych architektów oraz inżynierów budownictwa oraz ustawy - Prawo budowlane (druki nr 2669 i 2786)	głosowanie nad całością projektu.	całość projektu ustawy	t	446	0	1	13	1
468	63	145	29	2026-07-31 11:58:49	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawka 1	\N	f	421	1	21	17	2
469	63	145	30	2026-07-31 11:59:18	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawka 2	\N	f	410	19	1	30	20
470	63	145	31	2026-07-31 11:59:56	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawki nr 3 i 5	\N	f	264	183	1	12	184
471	63	145	32	2026-07-31 12:00:36	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawka 7	\N	f	197	240	7	16	241
472	63	145	33	2026-07-31 12:01:09	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawka 8	\N	f	421	3	20	16	4
473	63	145	34	2026-07-31 12:01:38	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawka 9	\N	f	204	237	1	18	238
474	63	145	35	2026-07-31 12:02:11	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	poprawka 10	\N	f	419	2	22	17	3
475	63	145	36	2026-07-31 12:02:39	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniu usług drogą elektroniczną oraz niektórych innych ustaw (druki nr 2694, 2815 i 2815-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	249	6	190	15	7
476	63	146	37	2026-07-31 12:03:31	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia zrównoważonego lotnictwa (druki nr 2822 i 2849)	głosowanie nad całością projektu.	całość projektu ustawy	t	246	22	177	15	23
477	63	147	38	2026-07-31 12:05:17	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji w sprawie sprawozdania z wykonania budżetu państwa za okres od dnia 1 stycznia do dnia 31 grudnia 2025 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2025 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 2629, 2681, 2817 i 2817-A)	poprawka 1	\N	f	196	241	7	16	242
478	63	147	39	2026-07-31 12:05:46	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji w sprawie sprawozdania z wykonania budżetu państwa za okres od dnia 1 stycznia do dnia 31 grudnia 2025 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2025 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 2629, 2681, 2817 i 2817-A)	poprawka 2	\N	f	197	237	7	19	238
479	63	147	40	2026-07-31 12:06:14	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji w sprawie sprawozdania z wykonania budżetu państwa za okres od dnia 1 stycznia do dnia 31 grudnia 2025 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2025 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 2629, 2681, 2817 i 2817-A)	poprawka 3	\N	f	176	268	1	15	269
480	63	147	41	2026-07-31 12:06:56	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji w sprawie sprawozdania z wykonania budżetu państwa za okres od dnia 1 stycznia do dnia 31 grudnia 2025 r. wraz z przedstawioną przez Najwyższą Izbę Kontroli analizą wykonania budżetu państwa i założeń polityki pieniężnej w 2025 r. oraz komisyjnym projektem uchwały w przedmiocie absolutorium (druki nr 2629, 2681, 2817 i 2817-A)	głosowanie nad całością projektu.	całość projektu uchwały	t	240	205	1	14	206
481	63	148	42	2026-07-31 12:08:02	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druki nr 2642 i 2860)	głosowanie nad całością projektu.	całość projektu ustawy	t	246	199	1	14	200
482	63	132	43	2026-07-31 12:08:50	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochotniczych strażach pożarnych (druki nr 2600 i 2858)	głosowanie nad całością projektu.	całość projektu ustawy	t	438	2	1	19	3
483	63	149	44	2026-07-31 12:09:46	ELECTRONIC	Pkt. 22 Pierwsze czytanie obywatelskiego projektu ustawy o ochronie bezpieczeństwa wewnętrznego w związku z realizacją polityki migracyjnej Unii Europejskiej (druk nr 2602)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	247	199	0	14	200
484	63	51	45	2026-07-31 12:10:40	ELECTRONIC	Pkt. 25 Pierwsze czytanie rządowego projektu ustawy o zmianie ustawy o podatku akcyzowym (druk nr 2839)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	23	242	178	17	243
485	63	133	46	2026-07-31 12:12:38	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	poprawki nr 1 oraz 4-8	\N	f	25	245	173	17	246
486	63	133	47	2026-07-31 12:13:17	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wnioski mniejszości nr 1, 3, 7 i 20	\N	f	1	255	184	20	256
487	63	133	48	2026-07-31 12:13:48	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wniosek mniejszości 2	\N	f	28	229	185	18	230
488	63	133	49	2026-07-31 12:14:28	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wnioski mniejszości nr 4, 6, 13, 16 i 19	\N	f	3	254	182	21	255
489	63	133	50	2026-07-31 12:15:12	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wnioski mniejszości nr 5 i 11	\N	f	1	235	209	15	236
490	63	133	51	2026-07-31 12:15:45	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	poprawka 2	\N	f	243	0	197	20	1
491	63	133	52	2026-07-31 12:16:26	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wnioski mniejszości nr 8, 12, 15, 18 i 21	\N	f	1	256	180	23	257
492	63	133	53	2026-07-31 12:17:10	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wnioski mniejszości nr 9-10 i 17	\N	f	1	256	184	19	257
493	63	133	54	2026-07-31 12:17:44	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wniosek mniejszości 14	\N	f	27	232	184	17	233
494	63	133	55	2026-07-31 12:18:17	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	poprawka 3	\N	f	243	1	196	20	2
495	63	133	56	2026-07-31 12:18:46	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wniosek mniejszości 22	\N	f	1	246	176	37	247
496	63	133	57	2026-07-31 12:19:18	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	wniosek mniejszości 23	\N	f	1	239	205	15	240
497	63	133	58	2026-07-31 12:19:49	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Prawo oświatowe oraz ustawy o systemie informacji oświatowej (druki nr 2842, 2857 i 2857-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	251	24	168	17	25
498	63	150	59	2026-07-31 12:21:39	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2834 i 2862)	poprawka 1	\N	f	2	278	160	20	221
499	63	150	60	2026-07-31 12:22:18	ELECTRONIC	Pkt. 26 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2834 i 2862)	poprawki nr 2-4	\N	f	1	273	168	18	222
500	63	151	61	2026-07-31 12:23:50	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	poprawki nr 1-3, 5-6 oraz 8-9	\N	f	1	440	1	18	222
501	63	151	62	2026-07-31 12:24:27	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	poprawki nr 4 i 10	\N	f	0	436	1	23	219
502	63	151	63	2026-07-31 12:25:00	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	poprawka 7	\N	f	0	437	1	22	220
503	63	151	64	2026-07-31 12:25:32	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	poprawka 11	\N	f	0	441	1	18	222
504	63	151	65	2026-07-31 12:26:04	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	poprawka 12	\N	f	1	434	3	22	220
505	63	151	66	2026-07-31 12:26:38	ELECTRONIC	Pkt. 27 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2835 i 2847)	poprawka 13	\N	f	0	441	1	18	222
506	63	152	67	2026-07-31 12:28:11	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2836 i 2854)	poprawki nr 1-10 i 12	\N	f	178	264	1	17	222
507	63	152	68	2026-07-31 12:28:46	ELECTRONIC	Pkt. 28 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2836 i 2854)	poprawka 11	\N	f	177	245	20	18	222
508	63	153	69	2026-07-31 12:31:34	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji w sprawie wniosku z dnia 4 maja 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla, przedłożonego przez Europejskiego Prokuratora Generalnego, uzupełnionego w dniu 28 maja 2026 r. (druk nr 2861)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Wojciecha Króla za czyn określony w punkcie pierwszym tego wniosku	wniosek o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Wojciecha Króla za czyn określony w punkcie pierwszym wniosku	f	436	2	3	19	231
509	63	153	70	2026-07-31 12:32:44	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji w sprawie wniosku z dnia 4 maja 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla, przedłożonego przez Europejskiego Prokuratora Generalnego, uzupełnionego w dniu 28 maja 2026 r. (druk nr 2861)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Wojciecha Króla za czyn określony w punkcie drugim tego wniosku	wniosek o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Wojciecha Króla za czyn określony w punkcie drugim wniosku	f	437	2	3	18	231
510	63	153	71	2026-07-31 12:33:54	ELECTRONIC	Pkt. 33 Sprawozdanie Komisji w sprawie wniosku z dnia 4 maja 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej oraz zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla, przedłożonego przez Europejskiego Prokuratora Generalnego, uzupełnionego w dniu 28 maja 2026 r. (druk nr 2861)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla	wniosek o wyrażenie zgody na zatrzymanie i tymczasowe aresztowanie posła Wojciecha Króla	f	181	251	5	23	231
511	63	154	72	2026-07-31 12:36:12	ELECTRONIC	Pkt. 34 Sprawozdanie Komisji w sprawie wniosku oskarżyciela prywatnego Artura Szweda, reprezentowanego przez adwokata Lesława Szpalę, z dnia 10 września 2025 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Adama Dziedzica (druk nr 2879)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Adama Dziedzica	wniosek o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Adama Dziedzica	f	165	257	8	30	231
512	63	\N	73	2026-07-31 12:37:41	ELECTRONIC	Rozstrzygnięcie przez Sejm wniosku o uzupełnienie porządku dziennego o punkt: Odwołanie Pani Moniki Wielichowskiej z funkcji Wicemarszałka Sejmu Rzeczypospolitej Polskiej	wniosek o uzupełnienie porządku dziennego.	\N	f	180	238	15	27	239
513	63	155	74	2026-07-31 12:38:18	ELECTRONIC	Rozstrzygnięcie przez Sejm wniosku o uzupełnienie porządku dziennego o punkt: Pierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2413)	wniosek o uzupełnienie porządku dziennego.	\N	f	182	236	17	25	237
514	62	156	1	2026-07-15 10:11:17	ELECTRONIC	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2788	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2788	\N	f	230	179	17	34	180
515	62	\N	2	2026-07-15 10:12:43	ELECTRONIC	Głosowanie proceduralne dotyczące projektu ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie planowanego sprawozdania do druku nr 2700	\N	f	226	185	15	34	186
516	62	157	3	2026-07-15 10:14:07	ELECTRONIC	Głosowanie proceduralne dotyczące projektu uchwały z druku nr 2796	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr 2796	\N	f	420	1	6	33	2
517	62	\N	4	2026-07-15 10:24:03	ELECTRONIC	62. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16 i 17 lipca 2026 r.	Wniosek o przerwę	\N	f	195	231	1	33	232
518	62	\N	5	2026-07-15 10:25:57	ELECTRONIC	62. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16 i 17 lipca 2026 r.	Głosowanie kworum	\N	f	0	0	0	39	230
519	62	\N	6	2026-07-15 10:27:20	ELECTRONIC	62. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16 i 17 lipca 2026 r.	wniosek o odroczenie posiedzenia	\N	f	97	321	9	33	322
520	62	158	7	2026-07-17 09:12:36	ELECTRONIC	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2794	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2794	\N	f	237	202	0	21	203
521	62	159	8	2026-07-17 09:13:20	ELECTRONIC	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2784	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2784	\N	f	413	20	4	23	21
522	62	160	9	2026-07-17 09:14:05	ELECTRONIC	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2795	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2795	\N	f	233	200	0	27	201
523	62	161	10	2026-07-17 09:15:26	ELECTRONIC	Głosowanie proceduralne dotyczące sprawozdania z druku nr 2816	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2816	\N	f	238	204	0	18	205
524	62	\N	11	2026-07-17 09:21:37	ELECTRONIC	62. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16 i 17 lipca 2026 r.	Wniosek o przerwę	\N	f	42	394	4	20	395
525	62	\N	12	2026-07-17 09:25:44	ELECTRONIC	62. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16 i 17 lipca 2026 r.	Głosowanie kworum	\N	f	0	0	0	20	230
526	62	162	13	2026-07-17 09:42:19	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2677, 2761 i 2761-A)	poprawki nr 1-3	\N	f	201	238	0	21	239
527	62	162	14	2026-07-17 09:42:51	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2677, 2761 i 2761-A)	wniosek mniejszości 1	\N	f	196	242	0	22	243
528	62	162	15	2026-07-17 09:43:20	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o podatku od towarów i usług oraz ustawy o zasadach ewidencji i identyfikacji podatników i płatników (druki nr 2677, 2761 i 2761-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	420	21	0	19	22
529	62	163	16	2026-07-17 09:45:59	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o nabywaniu nieruchomości przez cudzoziemców oraz ustawy - Prawo o notariacie (druki nr 2699 i 2755)	głosowanie nad całością projektu.	całość projektu ustawy	t	261	0	182	17	1
530	62	164	17	2026-07-17 09:46:59	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o jakości handlowej artykułów rolno-spożywczych oraz niektórych innych ustaw (druki nr 2695 i 2791)	głosowanie nad całością projektu.	całość projektu ustawy	t	421	0	21	18	1
531	62	165	18	2026-07-17 09:48:24	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 2701 i 2753)	wniosek o przystąpienie do trzeciego czytania bez kierowania projektu do komisji	\N	f	241	24	176	19	25
532	62	165	19	2026-07-17 09:49:15	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 2701 i 2753)	poprawka 1	\N	f	239	0	200	21	1
533	62	165	20	2026-07-17 09:49:44	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 2701 i 2753)	poprawka 2	\N	f	238	1	201	20	2
534	62	165	21	2026-07-17 09:50:11	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 2701 i 2753)	poprawka 3	\N	f	239	0	200	21	1
535	62	165	22	2026-07-17 09:50:41	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy o rehabilitacji zawodowej i społecznej oraz zatrudnianiu osób niepełnosprawnych (druki nr 2701 i 2753)	głosowanie nad całością projektu.	całość projektu ustawy	t	235	0	207	18	1
536	62	166	23	2026-07-17 09:52:01	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	wniosek o przystąpienie do trzeciego czytania bez kierowania projektu do komisji	\N	f	247	18	178	17	19
537	62	166	24	2026-07-17 09:52:58	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 1	\N	f	205	228	6	21	229
538	62	166	25	2026-07-17 09:53:25	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 2	\N	f	201	228	0	31	229
539	62	166	26	2026-07-17 09:53:56	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 3	\N	f	204	238	0	18	239
540	62	166	27	2026-07-17 09:54:26	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 4	\N	f	205	236	0	19	237
541	62	166	28	2026-07-17 09:54:54	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 5	\N	f	202	241	0	17	242
542	62	166	29	2026-07-17 09:55:22	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 6	\N	f	211	230	0	19	231
543	62	166	30	2026-07-17 09:55:49	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 7	\N	f	201	240	0	19	241
544	62	166	31	2026-07-17 09:56:24	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 8	\N	f	421	0	21	18	1
545	62	166	32	2026-07-17 09:56:58	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawki nr 9-10	\N	f	198	235	0	27	236
546	62	166	33	2026-07-17 09:57:30	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	poprawka 11	\N	f	245	0	198	17	1
547	62	166	34	2026-07-17 09:58:01	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o opiece nad dziećmi w wieku do lat 3 oraz niektórych innych ustaw (druki nr 2698 i 2788)	głosowanie nad całością projektu.	całość projektu ustawy	t	430	1	13	16	2
548	62	16	35	2026-07-17 09:59:04	ELECTRONIC	Pkt. 8 Pierwsze czytanie senackiego projektu ustawy o organach właściwych i postępowaniach w sprawach reklamy politycznej oraz odpowiedzialności za naruszenie obowiązków w tych sprawach (druk nr 2769)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	203	241	0	16	242
549	62	167	36	2026-07-17 10:00:14	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o ratyfikacji Umowy między Rzecząpospolitą Polską a Republiką Albanii o zabezpieczeniu społecznym, podpisanej w Warszawie dnia 23 lutego 2026 r. (druki nr 2667 i 2744)	głosowanie nad całością projektu.	całość projektu ustawy	t	242	22	179	17	23
550	62	168	37	2026-07-17 10:01:51	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 1	\N	f	189	243	9	19	244
551	62	168	38	2026-07-17 10:02:22	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 2	\N	f	184	243	9	24	244
552	62	168	39	2026-07-17 10:02:52	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 3	\N	f	189	242	8	21	243
553	62	168	40	2026-07-17 10:03:34	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 1	\N	f	191	246	8	15	247
554	62	168	41	2026-07-17 10:04:03	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 2	\N	f	188	245	8	19	246
555	62	168	42	2026-07-17 10:04:36	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 3	\N	f	186	249	8	17	250
556	62	168	43	2026-07-17 10:05:06	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 4	\N	f	11	422	9	18	423
557	62	168	44	2026-07-17 10:05:36	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 5	\N	f	5	433	2	20	434
558	62	168	45	2026-07-17 10:06:06	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 6	\N	f	422	12	8	18	13
559	62	168	46	2026-07-17 10:06:34	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 4	\N	f	185	244	8	23	245
560	62	168	47	2026-07-17 10:07:04	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 7	\N	f	188	246	8	18	247
561	62	168	48	2026-07-17 10:07:56	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wnioski mniejszości nr 5, 8-19, 25-27 i 29	\N	f	189	246	8	17	247
562	62	168	49	2026-07-17 10:08:28	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 8	\N	f	188	242	7	23	243
563	62	168	50	2026-07-17 10:09:22	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 9	\N	f	187	244	9	20	245
564	62	168	51	2026-07-17 10:09:54	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 10	\N	f	185	246	8	21	247
565	62	168	52	2026-07-17 10:10:27	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 11	\N	f	188	246	8	18	247
566	62	168	53	2026-07-17 10:11:01	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 12	\N	f	186	243	9	22	244
567	62	168	54	2026-07-17 10:11:31	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 6	\N	f	188	247	8	17	248
568	62	168	55	2026-07-17 10:11:59	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 7	\N	f	186	244	8	22	245
569	62	168	56	2026-07-17 10:12:28	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 20	\N	f	186	246	9	19	247
570	62	168	57	2026-07-17 10:13:05	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 21	\N	f	187	248	8	17	249
571	62	168	58	2026-07-17 10:13:36	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 13	\N	f	184	246	10	20	247
572	62	168	59	2026-07-17 10:14:12	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawki nr 14-15	\N	f	12	421	9	18	422
573	62	168	60	2026-07-17 10:14:51	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawki nr 16-17	\N	f	186	248	8	18	249
574	62	168	61	2026-07-17 10:15:23	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 22	\N	f	187	253	1	19	254
575	62	168	62	2026-07-17 10:15:56	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 18	\N	f	188	247	8	17	248
576	62	168	63	2026-07-17 10:16:27	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 19	\N	f	420	14	8	18	15
712	60	\N	13	2026-06-19 09:12:44	ELECTRONIC	60. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 17, 18 i 19 czerwca 2026 r.	Głosowanie kworum	\N	f	0	0	0	61	230
577	62	168	64	2026-07-17 10:16:58	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 20	\N	f	188	246	8	18	247
578	62	168	65	2026-07-17 10:17:29	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wniosek mniejszości 23	\N	f	186	254	1	19	255
579	62	168	66	2026-07-17 10:18:10	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	wnioski mniejszości nr 24 i 28	\N	f	188	246	8	18	247
580	62	168	67	2026-07-17 10:18:43	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	poprawka 21	\N	f	190	237	17	16	238
581	62	168	68	2026-07-17 10:19:18	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o publicznym transporcie zbiorowym oraz niektórych innych ustaw (druki nr 2700 i 2785)	głosowanie nad całością projektu.	całość projektu ustawy	t	237	195	10	18	196
582	62	169	69	2026-07-17 10:21:00	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 2648, 2736 i 2736-A)	poprawki nr 1, 3, 5 oraz 7-8	\N	f	261	0	179	20	1
583	62	169	70	2026-07-17 10:21:54	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 2648, 2736 i 2736-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	258	2	183	17	3
584	62	170	71	2026-07-17 10:22:47	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o komisyjnym projekcie uchwały w sprawie ustanowienia dnia 31 lipca Dniem Trenera Sportowego (druki nr 2707 i 2763)	głosowanie nad całością projektu.	całość projektu uchwały	t	433	7	3	17	8
585	62	171	72	2026-07-17 10:24:02	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 1	\N	f	202	234	5	19	235
586	62	171	73	2026-07-17 10:24:32	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 2	\N	f	199	236	7	18	237
587	62	171	74	2026-07-17 10:25:02	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 3	\N	f	205	229	4	22	230
588	62	171	75	2026-07-17 10:25:31	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 4	\N	f	202	232	6	20	233
589	62	171	76	2026-07-17 10:25:59	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 5	\N	f	201	236	6	17	237
590	62	171	77	2026-07-17 10:26:28	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 6	\N	f	204	234	6	16	235
591	62	171	78	2026-07-17 10:26:57	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	wniosek mniejszości 7	\N	f	205	233	5	17	234
592	62	171	79	2026-07-17 10:27:30	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskich projektach uchwał:- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego przez ukraińskich nacjonalistów na Polakach;- w sprawie uczczenia pamięci ofiar ludobójstwa dokonanego na Kresach Wschodnich przez nacjonalistów ukraińskich w latach 1939-1947;- w sprawie uczczenia 83. rocznicy zbrodni ludobójstwa dokonanej na Polakach przez nacjonalistów ukraińskich (druki nr 2646, 2653, 2678 i 2770)	głosowanie nad całością projektu.	całość projektu uchwały	t	441	0	0	19	1
593	62	17	80	2026-07-17 10:28:42	ELECTRONIC	Pkt. 17 Pierwsze czytanie senackiego projektu ustawy o zmianie ustawy - Kodeks wyborczy oraz ustawy o referendum lokalnym (druk nr 2670)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	206	236	0	18	237
594	62	172	81	2026-07-17 10:30:56	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2780 i 2794)	poprawki nr 1 oraz 3-5	\N	f	418	20	5	17	222
595	62	172	82	2026-07-17 10:31:31	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2780 i 2794)	poprawka 2	\N	f	9	424	0	27	217
596	62	172	83	2026-07-17 10:32:02	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2780 i 2794)	poprawka 6	\N	f	1	425	0	34	214
597	62	173	84	2026-07-17 10:33:39	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784)	poprawki nr 1 i 3	\N	f	0	443	0	17	222
598	62	173	85	2026-07-17 10:34:13	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784)	poprawka 2	\N	f	3	413	0	44	209
599	62	173	86	2026-07-17 10:34:46	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784)	poprawka 4	\N	f	0	424	0	36	213
600	62	173	87	2026-07-17 10:35:25	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784)	poprawki nr 5-6	\N	f	2	435	1	22	220
601	62	173	88	2026-07-17 10:35:57	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2781 i 2784)	poprawka 7	\N	f	1	432	0	27	217
602	62	174	89	2026-07-17 10:37:50	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2782 i 2795)	poprawka 1	\N	f	224	31	181	24	219
603	62	174	90	2026-07-17 10:38:26	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2782 i 2795)	poprawka 2	\N	f	0	249	189	22	220
604	62	174	91	2026-07-17 10:39:00	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2782 i 2795)	poprawka 3	\N	f	1	435	2	22	220
605	62	175	92	2026-07-17 10:40:55	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2783 i 2816)	poprawka 1	\N	f	412	23	0	25	218
606	62	175	93	2026-07-17 10:41:34	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2783 i 2816)	poprawki nr 2-3	\N	f	175	259	0	26	218
607	62	176	94	2026-07-17 10:43:04	ELECTRONIC	Pkt. 23 Pierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie ustawy o Instytucie Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu oraz ustawy - Kodeks karny (druk nr 1760) - kontynuacja	wniosek o przystąpienie do drugiego czytania  bez kierowania projektu do komisji	wniosek o przejście do drugiego czytania bez kierowania projektu ustawy do Komisji	f	199	241	0	20	242
608	62	177	95	2026-07-17 10:44:51	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawki nr 1, 15 i 17	\N	f	238	2	193	27	3
609	62	177	96	2026-07-17 10:45:28	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 2	\N	f	250	1	153	56	2
610	62	177	97	2026-07-17 10:45:59	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 3	\N	f	238	3	176	43	4
611	62	177	98	2026-07-17 10:46:29	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 4	\N	f	259	2	170	29	3
612	62	177	99	2026-07-17 10:47:00	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 5	\N	f	406	4	30	20	5
613	62	177	100	2026-07-17 10:47:32	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 6	\N	f	263	1	175	21	2
614	62	177	101	2026-07-17 10:48:04	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 7	\N	f	240	1	197	22	2
615	62	177	102	2026-07-17 10:48:34	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 8	\N	f	259	2	173	26	3
616	62	177	103	2026-07-17 10:49:11	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawki nr 9-11	\N	f	261	1	176	22	2
617	62	177	104	2026-07-17 10:49:40	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 12	\N	f	257	1	176	26	2
618	62	177	105	2026-07-17 10:50:11	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 13	\N	f	236	161	38	25	162
619	62	177	106	2026-07-17 10:50:44	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 14	\N	f	259	1	174	26	2
620	62	177	107	2026-07-17 10:51:16	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	poprawka 16	\N	f	240	2	191	27	3
621	62	177	108	2026-07-17 10:51:47	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o komisyjnym projekcie ustawy o zmianie ustawy - Prawo o adwokaturze (druki nr 1962, 2689 i 2689-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	239	1	199	21	2
622	62	\N	109	2026-07-17 11:17:21	ELECTRONIC	62. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 15, 16 i 17 lipca 2026 r.	ustalenie czasów debat	\N	f	231	185	11	33	186
623	62	178	110	2026-07-17 11:37:45	ON_LIST	Powołanie Rzecznika Praw Obywatelskich (druki nr 2734, 2735, 2789 i 2790)	Powołanie Rzecznika Praw Obywatelskich	\N	f	0	0	0	27	217
624	62	179	111	2026-07-17 12:01:58	ELECTRONIC	Pkt. 25 Powołanie Prezesa Instytutu Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu (druki nr 2455 i 2476)	głosowanie nad powołaniem Mateusza Szpytmy na Prezesa Instytutu Pamięci Narodowej	wniosek o powołanie Pana Mateusza Szpytmy na Prezesa Instytutu Pamięci Narodowej - Komisji Ścigania Zbrodni przeciwko Narodowi Polskiemu	f	226	194	4	36	195
625	62	180	112	2026-07-17 12:04:19	ELECTRONIC	Rozstrzygnięcie przez Sejm wniosku o uzupełnienie porządku dziennego o punkt: Pierwsze czytanie poselskiego projektu ustawy o zmianie ustawy o podatku od towarów i usług (druk nr 2359)	wniosek o uzupełnienie porządku dziennego.	\N	f	180	235	0	45	236
626	62	\N	113	2026-07-17 12:05:03	ELECTRONIC	Rozstrzygnięcie przez Sejm wniosku o uzupełnienie porządku dziennego o punkt: Informacja Prezesa Rady Ministrów na temat zapaści polskich finansów publicznych ze szczególnym uwzględnieniem drastycznego wzrostu długu publicznego oraz konsekwencji nieudolnych działań prowadzonych przez rząd dla zachowania stabilności finansowej oraz bezpieczeństwa Polski	wniosek o uzupełnienie porządku dziennego.	\N	f	175	221	0	64	222
627	62	181	114	2026-07-17 12:05:50	ELECTRONIC	Rozstrzygnięcie przez Sejm wniosku o uzupełnienie porządku dziennego o punkt: Pierwsze czytanie przedstawionego przez Prezydenta Rzeczypospolitej Polskiej projektu ustawy o zmianie niektórych ustaw w celu obniżenia kosztów energii elektrycznej oraz finansowaniu systemów wsparcia energetyki ze środków z handlu uprawnieniami do emisji CO2 (druk nr 2393)	wniosek o uzupełnienie porządku dziennego.	\N	f	176	227	0	57	228
628	62	182	115	2026-07-17 12:06:46	ELECTRONIC	Pkt. 27 Zmiany w składach osobowych komisji sejmowych (druk nr 2819)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 2819	f	249	151	4	56	152
629	61	183	1	2026-07-01 10:10:44	ELECTRONIC	Głosowanie proceduralne dotyczące planowanego sprawozdania do druku nr 2598	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie planowanego sprawozdania do druku nr 2598	\N	f	230	186	0	44	187
630	61	\N	2	2026-07-01 10:17:02	ELECTRONIC	61. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 1, 2 i 3 lipca 2026 r.	Wniosek o przerwę	\N	f	192	228	0	40	229
631	61	\N	3	2026-07-01 10:18:35	ELECTRONIC	61. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 1, 2 i 3 lipca 2026 r.	Głosowanie kworum	\N	f	0	0	0	46	230
632	61	184	4	2026-07-03 09:09:07	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2730 i 2764	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2764	\N	f	229	180	0	51	181
633	61	185	5	2026-07-03 09:09:45	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2729 i 2766	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2766	\N	f	386	18	4	52	19
634	61	186	6	2026-07-03 09:10:26	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2728 i 2741	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2741	\N	f	391	16	0	53	17
635	61	187	7	2026-07-03 09:11:04	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2732 i 2765	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2765	\N	f	398	17	0	45	18
636	61	188	8	2026-07-03 09:11:49	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2727 i 2760	wniosek o skrócenie terminu, o którym mowa w art. 54 ust. 5 regulaminu Sejmu w sprawie sprawozdania z druku nr 2760	\N	f	233	185	1	41	186
637	61	\N	9	2026-07-03 09:16:12	ELECTRONIC	61. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 1, 2 i 3 lipca 2026 r.	Wniosek o przerwę	\N	f	182	233	6	39	234
638	61	\N	10	2026-07-03 09:18:48	ELECTRONIC	61. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 1, 2 i 3 lipca 2026 r.	Głosowanie kworum	\N	f	0	0	0	36	230
639	61	189	11	2026-07-03 09:30:36	ELECTRONIC	Pkt. 1 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przygotowaniu i realizacji inwestycji w zakresie obiektów energetyki jądrowej oraz inwestycji towarzyszących oraz niektórych innych ustaw (druki nr 2410, 2466 i 2466-A)	poprawka 1	\N	f	422	1	1	36	2
640	61	189	12	2026-07-03 09:31:06	ELECTRONIC	Pkt. 1 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przygotowaniu i realizacji inwestycji w zakresie obiektów energetyki jądrowej oraz inwestycji towarzyszących oraz niektórych innych ustaw (druki nr 2410, 2466 i 2466-A)	poprawka 2	\N	f	431	0	1	28	1
641	61	189	13	2026-07-03 09:31:34	ELECTRONIC	Pkt. 1 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o przygotowaniu i realizacji inwestycji w zakresie obiektów energetyki jądrowej oraz inwestycji towarzyszących oraz niektórych innych ustaw (druki nr 2410, 2466 i 2466-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	425	1	2	32	2
642	61	190	14	2026-07-03 09:33:21	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	poprawka 1	\N	f	406	0	23	31	1
643	61	190	15	2026-07-03 09:33:51	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	poprawka 2	\N	f	403	0	22	35	1
644	61	190	16	2026-07-03 09:34:21	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	poprawka 3	\N	f	401	0	23	36	1
645	61	190	17	2026-07-03 09:36:10	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	wnioski mniejszości nr 1-4	\N	f	193	224	6	37	225
646	61	190	18	2026-07-03 09:36:40	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	poprawka 4	\N	f	407	0	24	29	1
647	61	190	19	2026-07-03 09:37:19	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	poprawki nr 5-7	\N	f	405	0	24	31	1
648	61	190	20	2026-07-03 09:37:46	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	wniosek mniejszości 5	\N	f	178	230	20	32	231
649	61	190	21	2026-07-03 09:38:17	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o osobistych kontach inwestycyjnych (druki nr 2580, 2719 i 2719-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	427	5	1	27	6
650	61	191	22	2026-07-03 09:39:56	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o poselskim i rządowym projektach ustaw o zmianie ustawy - Prawo oświatowe (druki nr 1526, 2668, 2680 i 2680-A)	poprawka 1	\N	f	412	16	1	31	17
651	61	191	23	2026-07-03 09:40:27	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o poselskim i rządowym projektach ustaw o zmianie ustawy - Prawo oświatowe (druki nr 1526, 2668, 2680 i 2680-A)	poprawki nr 2-3	\N	f	412	7	4	37	8
652	61	191	24	2026-07-03 09:40:57	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o poselskim i rządowym projektach ustaw o zmianie ustawy - Prawo oświatowe (druki nr 1526, 2668, 2680 i 2680-A)	wniosek mniejszości 1	\N	f	383	33	5	39	34
653	61	191	25	2026-07-03 09:43:14	ELECTRONIC	Pkt. 3 Sprawozdanie Komisji o poselskim i rządowym projektach ustaw o zmianie ustawy - Prawo oświatowe (druki nr 1526, 2668, 2680 i 2680-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	420	6	4	30	7
654	61	192	26	2026-07-03 09:44:38	ELECTRONIC	Pkt. 5 Rozpatrzenie wniosku Rady Ministrów o wyrażenie przez Sejm Rzeczypospolitej Polskiej zgody na przedłużenie czasowego ograniczenia prawa do złożenia wniosku o udzielenie ochrony międzynarodowej na granicy państwowej z Republiką Białorusi (druk nr 2739)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 2739	f	406	16	5	33	17
655	61	193	27	2026-07-03 09:47:18	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o ofercie publicznej i warunkach wprowadzania instrumentów finansowych do zorganizowanego systemu obrotu oraz o spółkach publicznych oraz ustawy o wdrożeniu niektórych przepisów Unii Europejskiej w zakresie równego traktowania (druki nr 2696, 2733 i 2733-A)	wniosek o odrzucenie w całości projektu.	\N	f	194	237	2	27	238
656	61	193	28	2026-07-03 09:48:04	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o ofercie publicznej i warunkach wprowadzania instrumentów finansowych do zorganizowanego systemu obrotu oraz o spółkach publicznych oraz ustawy o wdrożeniu niektórych przepisów Unii Europejskiej w zakresie równego traktowania (druki nr 2696, 2733 i 2733-A)	poprawka 1	\N	f	240	173	18	29	174
657	61	193	29	2026-07-03 09:48:37	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o ofercie publicznej i warunkach wprowadzania instrumentów finansowych do zorganizowanego systemu obrotu oraz o spółkach publicznych oraz ustawy o wdrożeniu niektórych przepisów Unii Europejskiej w zakresie równego traktowania (druki nr 2696, 2733 i 2733-A)	poprawki nr 2-3	\N	f	233	171	17	39	172
658	61	193	30	2026-07-03 09:49:06	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o ofercie publicznej i warunkach wprowadzania instrumentów finansowych do zorganizowanego systemu obrotu oraz o spółkach publicznych oraz ustawy o wdrożeniu niektórych przepisów Unii Europejskiej w zakresie równego traktowania (druki nr 2696, 2733 i 2733-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	238	194	2	26	195
659	61	183	31	2026-07-03 09:51:48	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	wniosek o odrzucenie w całości projektu.	\N	f	28	396	3	33	397
660	61	183	32	2026-07-03 09:52:34	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	poprawka 1	\N	f	6	278	149	27	279
661	61	183	33	2026-07-03 09:53:05	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	poprawka 2	\N	f	11	256	165	28	257
662	61	183	34	2026-07-03 09:53:35	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	poprawka 3	\N	f	23	244	164	29	245
663	61	183	35	2026-07-03 09:54:10	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	poprawki nr 4 oraz 6-8	\N	f	22	238	168	32	239
664	61	183	36	2026-07-03 09:54:39	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	poprawka 5	\N	f	23	238	169	30	239
665	61	183	37	2026-07-03 09:55:07	ELECTRONIC	Pkt. 9 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o prawach pacjenta i Rzeczniku Praw Pacjenta (druki nr 2598, 2756 i 2756-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	232	34	162	32	35
666	61	194	38	2026-07-03 09:56:39	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o komisyjnym projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2676, 2720 i 2720-A)	poprawka 1	\N	f	171	255	5	29	256
667	61	194	39	2026-07-03 09:57:05	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o komisyjnym projekcie uchwały w sprawie zmiany Regulaminu Sejmu Rzeczypospolitej Polskiej (druki nr 2676, 2720 i 2720-A)	głosowanie nad całością projektu.	całość projektu uchwały	t	236	192	5	27	193
668	61	195	40	2026-07-03 09:57:57	ELECTRONIC	Pkt. 14 Pierwsze czytanie poselskiego projektu ustawy o zmianie ustawy - Kodeks pracy (druk nr 2623) - kontynuacja	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	237	195	0	28	196
669	61	196	41	2026-07-03 09:58:50	ELECTRONIC	Pkt. 15 Pierwsze czytanie poselskiego projektu ustawy o systemie ochrony zdrowia oraz o zmianie niektórych innych ustaw (druk nr 2673) - kontynuacja	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	177	214	40	29	215
670	61	184	42	2026-07-03 10:00:44	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 1	\N	f	3	257	151	49	206
671	61	184	43	2026-07-03 10:01:21	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 2	\N	f	0	257	171	32	215
672	61	184	44	2026-07-03 10:01:56	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 3	\N	f	0	257	177	26	218
673	61	184	45	2026-07-03 10:02:29	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 4	\N	f	1	255	168	36	213
674	61	184	46	2026-07-03 10:03:01	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 5	\N	f	0	254	172	34	214
675	61	184	47	2026-07-03 10:03:39	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawki nr 6 i 9	\N	f	0	256	174	30	216
676	61	184	48	2026-07-03 10:04:08	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 7	\N	f	0	254	172	34	214
677	61	184	49	2026-07-03 10:04:37	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o przeciwdziałaniu narkomanii oraz niektórych innych ustaw (druki nr 2730 i 2764)	poprawka 8	\N	f	0	250	174	36	213
678	61	197	50	2026-07-03 10:06:30	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawki nr 1-3, 5, 9-10, 14-15, 17-18 oraz 20-22	\N	f	0	262	171	27	217
679	61	197	51	2026-07-03 10:07:01	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawka 4	\N	f	0	411	17	32	215
680	61	197	52	2026-07-03 10:07:38	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawki nr 6, 8 i 12	\N	f	0	419	4	37	212
681	61	197	53	2026-07-03 10:08:13	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawki nr 7 i 24	\N	f	0	265	167	28	217
682	61	197	54	2026-07-03 10:08:48	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawki nr 11 i 16	\N	f	0	423	1	36	213
683	61	197	55	2026-07-03 10:09:20	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawka 13	\N	f	0	433	0	27	217
684	61	197	56	2026-07-03 10:09:51	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawka 19	\N	f	0	410	5	45	208
685	61	197	57	2026-07-03 10:10:33	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawka 23	\N	f	1	411	21	27	217
686	61	197	58	2026-07-03 10:11:08	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o systemach sztucznej inteligencji (druki nr 2731 i 2762)	poprawka 25	\N	f	405	13	17	25	218
687	61	185	59	2026-07-03 10:12:47	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 2729 i 2766)	poprawka 1	\N	f	0	423	6	31	215
688	61	185	60	2026-07-03 10:13:23	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o ochronie zwierząt (druki nr 2729 i 2766)	poprawka 2	\N	f	0	429	1	30	216
689	61	186	61	2026-07-03 10:15:13	ELECTRONIC	Pkt. 19 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o imprezach turystycznych i powiązanych usługach turystycznych (druki nr 2728 i 2741)	poprawki nr 1-2	\N	f	0	430	0	30	216
690	61	187	62	2026-07-03 10:16:45	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawka 1	\N	f	0	408	13	39	211
691	61	187	63	2026-07-03 10:17:16	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawka 2	\N	f	1	422	0	37	212
692	61	187	64	2026-07-03 10:17:55	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawki nr 3 i 7	\N	f	0	423	0	37	212
693	61	187	65	2026-07-03 10:18:26	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawka 4	\N	f	0	410	17	33	214
694	61	187	66	2026-07-03 10:19:03	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawka 5	\N	f	0	415	17	28	217
695	61	187	67	2026-07-03 10:19:37	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawka 6	\N	f	0	414	17	29	216
696	61	187	68	2026-07-03 10:20:13	ELECTRONIC	Pkt. 20 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2732 i 2765)	poprawka 8	\N	f	0	430	0	30	216
697	61	188	69	2026-07-03 10:21:42	ELECTRONIC	Pkt. 21 Sprawozdanie Komisji o uchwale Senatu w sprawie ustawy o podatku od nadzwyczajnych zysków osiągniętych w okresie od marca do grudnia 2026 r. ze zbycia paliw ciekłych (druki nr 2727 i 2760)	poprawki nr 1-2	\N	f	8	418	0	34	214
698	61	198	70	2026-07-03 10:23:22	ELECTRONIC	Pkt. 25 Wybór uzupełniający do składu osobowego Komisji do Spraw Unii Europejskiej (druk nr 2768)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 2768	f	254	174	2	30	175
699	61	199	71	2026-07-03 10:24:54	ELECTRONIC	Pkt. 22 Zmiany w składach osobowych komisji sejmowych (druk nr 2767)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 2767	f	423	2	6	29	3
700	60	200	1	2026-06-17 10:10:33	ELECTRONIC	Głosowanie proceduralne w sprawie druku nr 2684	wniosek o skrócenie terminu, o którym mowa w art. 37 ust. 4 regulaminu Sejmu w sprawie przedłożenia z druku nr ...	\N	f	227	194	0	39	195
701	60	201	2	2026-06-17 10:12:20	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2549 i 2636	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2636	\N	f	404	0	18	38	1
702	60	202	3	2026-06-17 10:13:05	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2498 i 2639	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2639	\N	f	228	194	0	38	195
703	60	203	4	2026-06-17 10:16:57	ELECTRONIC	Pkt. 1 Zmiana w składzie osobowym komisji sejmowej (druk nr 2683)	głosowanie nad przyjęciem wniosku z druku.	wniosek z druku nr 2683	f	245	176	2	37	177
704	60	\N	5	2026-06-17 10:20:13	ELECTRONIC	60. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 17, 18 i 19 czerwca 2026 r.	Wniosek o przerwę	\N	f	198	224	1	37	225
705	60	\N	6	2026-06-17 10:21:34	ELECTRONIC	60. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 17, 18 i 19 czerwca 2026 r.	Głosowanie kworum	\N	f	0	0	0	40	230
706	60	200	7	2026-06-17 13:05:08	ELECTRONIC	Pkt. 3 Pierwsze czytanie rządowego projektu ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druk nr 2684)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	169	217	1	73	218
707	60	204	8	2026-06-18 12:51:00	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2643 i 2691	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2691	\N	f	397	16	2	45	17
708	60	200	9	2026-06-18 12:51:54	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2684 i 2688	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2688	\N	f	226	191	1	42	192
709	60	205	10	2026-06-18 12:52:41	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2685 i 2690	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2690	\N	f	225	1	189	45	2
710	60	206	11	2026-06-18 12:53:38	ELECTRONIC	Głosowanie proceduralne w sprawie druków nr 2713 i 2714	wniosek o skrócenie terminu, o którym mowa w art. 44 ust. 3 regulaminu Sejmu w sprawie sprawozdania z druku nr 2714	\N	f	227	190	0	43	191
711	60	\N	12	2026-06-19 09:09:49	ELECTRONIC	60. posiedzenie Sejmu Rzeczypospolitej Polskiej w dniach 17, 18 i 19 czerwca 2026 r.	Wniosek o przerwę	\N	f	189	223	4	44	224
713	60	206	14	2026-06-19 09:28:11	ELECTRONIC	Pkt. 18 Sprawozdanie Komisji o komisyjnym projekcie uchwały w sprawie uczczenia 35. rocznicy podpisania Traktatu między Rzecząpospolitą Polską a Republiką Federalną Niemiec o dobrym sąsiedztwie i przyjaznej współpracy (druki nr 2713 i 2714)	głosowanie nad całością projektu.	całość projektu uchwały	t	235	181	17	27	182
714	60	207	15	2026-06-19 09:29:27	ELECTRONIC	Pkt. 10 Sprawozdanie Komisji o komisyjnym projekcie uchwały w sprawie uczczenia 80-lecia działalności Ludowych Zespołów Sportowych (druki nr 2624 i 2637)	głosowanie nad całością projektu.	całość projektu uchwały	t	437	0	0	23	1
715	60	208	16	2026-06-19 09:30:22	ELECTRONIC	Pkt. 15 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie upamiętnienia bohaterów wydarzeń Czerwca 1976 roku w Radomiu, Płocku i Ursusie (druki nr 2417 i 2540)	głosowanie nad całością projektu.	całość projektu uchwały	t	437	0	0	23	1
716	60	209	17	2026-06-19 09:31:16	ELECTRONIC	Pkt. 16 Sprawozdanie Komisji o poselskim projekcie uchwały w sprawie upamiętnienia bohaterów 70. rocznicy Poznańskiego Czerwca 1956 roku (druki nr 2418 i 2541)	głosowanie nad całością projektu.	całość projektu uchwały	t	437	0	0	23	1
717	60	204	18	2026-06-19 09:32:13	ELECTRONIC	Pkt. 13 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o Krajowej Sieci Onkologicznej oraz niektórych innych ustaw (druki nr 2643 i 2691)	głosowanie nad całością projektu.	całość projektu ustawy	t	414	0	22	24	1
718	60	200	19	2026-06-19 09:34:00	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druki nr 2684, 2688 i 2688-A)	wniosek o odrzucenie w całości projektu.	\N	f	199	234	1	26	235
719	60	200	20	2026-06-19 09:34:35	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druki nr 2684, 2688 i 2688-A)	poprawka 1	\N	f	231	201	1	27	202
720	60	200	21	2026-06-19 09:35:07	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druki nr 2684, 2688 i 2688-A)	poprawka 2	\N	f	235	198	1	26	199
721	60	200	22	2026-06-19 09:35:40	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druki nr 2684, 2688 i 2688-A)	poprawka 3	\N	f	233	202	1	24	203
722	60	200	23	2026-06-19 09:36:10	ELECTRONIC	Pkt. 14 Sprawozdanie Komisji o rządowym projekcie ustawy o podatku od nadzwyczajnych zysków ze zbycia paliw ciekłych osiągniętych w okresie od marca do grudnia 2026 r. (druki nr 2684, 2688 i 2688-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	231	201	1	27	202
723	60	210	24	2026-06-19 09:37:40	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawka 1	\N	f	252	1	184	23	2
724	60	210	25	2026-06-19 09:38:16	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawki nr 2-3	\N	f	235	22	179	24	23
725	60	210	26	2026-06-19 09:38:46	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawka 4	\N	f	232	22	177	29	23
726	60	210	27	2026-06-19 09:39:21	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawki nr 5 i 8	\N	f	236	22	178	24	23
727	60	210	28	2026-06-19 09:39:52	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawka 6	\N	f	256	1	179	24	2
728	60	210	29	2026-06-19 09:40:22	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawka 7	\N	f	233	19	181	27	20
729	60	210	30	2026-06-19 09:40:51	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	poprawka 9	\N	f	253	0	181	26	1
730	60	210	31	2026-06-19 09:41:20	ELECTRONIC	Pkt. 23 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy - Kodeks pracy oraz ustawy - Kodeks postępowania cywilnego (druki nr 2289, 2609 i 2609-A) - trzecie czytanie	głosowanie nad całością projektu.	całość projektu ustawy	t	236	24	178	22	25
731	60	211	32	2026-06-19 09:42:15	ELECTRONIC	Pkt. 2 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w związku z opłatami uiszczanymi na rzecz Komisji Nadzoru Finansowego (druki nr 2620 i 2640)	głosowanie nad całością projektu.	całość projektu ustawy	t	409	24	3	24	25
732	60	201	33	2026-06-19 09:44:39	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 1	\N	f	207	222	5	26	223
733	60	201	34	2026-06-19 09:45:14	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawki nr 2-4	\N	f	199	229	6	26	230
734	60	201	35	2026-06-19 09:45:52	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 5	\N	f	200	227	6	27	228
735	60	201	36	2026-06-19 09:46:25	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 6	\N	f	437	2	0	21	3
736	60	201	37	2026-06-19 09:47:00	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	wniosek mniejszości 1	\N	f	200	230	6	24	231
737	60	201	38	2026-06-19 09:47:27	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	wniosek mniejszości 2	\N	f	199	230	6	25	231
738	60	201	39	2026-06-19 09:48:08	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 7	\N	f	200	231	6	23	232
739	60	201	40	2026-06-19 09:48:37	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 8	\N	f	436	0	0	24	1
740	60	201	41	2026-06-19 09:49:03	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 9	\N	f	207	226	0	27	227
741	60	201	42	2026-06-19 09:49:32	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	poprawka 10	\N	f	199	227	6	28	228
742	60	201	43	2026-06-19 09:50:02	ELECTRONIC	Pkt. 4 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie niektórych ustaw w celu wsparcia przedsiębiorstw żeglugowych oraz stworzenia warunków ich funkcjonowania pod polską banderą (druki nr 2549, 2636 i 2636-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	431	0	4	25	1
743	60	202	44	2026-06-19 09:51:55	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2498, 2639 i 2639-A)	poprawka 1	\N	f	240	175	22	23	176
744	60	202	45	2026-06-19 09:52:25	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2498, 2639 i 2639-A)	poprawka 2	\N	f	233	177	23	27	178
745	60	202	46	2026-06-19 09:53:48	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2498, 2639 i 2639-A)	poprawka 3	\N	f	238	180	21	21	181
746	60	202	47	2026-06-19 09:54:22	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2498, 2639 i 2639-A)	poprawka 4	\N	f	235	179	22	24	180
747	60	202	48	2026-06-19 09:55:09	ELECTRONIC	Pkt. 5 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o zastawie rejestrowym i rejestrze zastawów oraz ustawy - Prawo o ruchu drogowym (druki nr 2498, 2639 i 2639-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	238	180	19	23	181
748	60	212	49	2026-06-19 09:56:48	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie oraz ustawy o grach hazardowych (druki nr 2597, 2641 i 2641-A)	poprawka 1	\N	f	205	233	1	21	234
749	60	212	50	2026-06-19 09:57:18	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie oraz ustawy o grach hazardowych (druki nr 2597, 2641 i 2641-A)	poprawka 2	\N	f	235	183	19	23	184
750	60	212	51	2026-06-19 09:57:48	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie oraz ustawy o grach hazardowych (druki nr 2597, 2641 i 2641-A)	poprawka 3	\N	f	236	179	20	25	180
751	60	212	52	2026-06-19 09:58:18	ELECTRONIC	Pkt. 6 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o działalności pożytku publicznego i o wolontariacie oraz ustawy o grach hazardowych (druki nr 2597, 2641 i 2641-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	234	21	182	23	22
752	60	213	53	2026-06-19 09:59:45	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 1941, 2633 i 2633-A)	wniosek o odrzucenie w całości projektu.	\N	f	24	412	1	23	413
753	60	213	54	2026-06-19 10:00:20	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 1941, 2633 i 2633-A)	poprawka	\N	f	437	1	0	22	2
754	60	213	55	2026-06-19 10:00:47	ELECTRONIC	Pkt. 7 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy - Prawo wodne (druki nr 1941, 2633 i 2633-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	231	25	176	28	26
755	60	214	56	2026-06-19 10:02:29	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2468, 2638 i 2638-A)	poprawka 1	\N	f	205	234	0	21	235
756	60	214	57	2026-06-19 10:02:59	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2468, 2638 i 2638-A)	poprawka 2	\N	f	260	0	176	24	1
757	60	214	58	2026-06-19 10:03:28	ELECTRONIC	Pkt. 8 Sprawozdanie Komisji o poselskim projekcie ustawy o zmianie ustawy o ochronie praw nabywcy lokalu mieszkalnego lub domu jednorodzinnego oraz Deweloperskim Funduszu Gwarancyjnym (druki nr 2468, 2638 i 2638-A)	głosowanie nad całością projektu.	całość projektu ustawy	t	260	1	177	22	2
758	60	205	59	2026-06-19 10:10:21	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o działalności leczniczej (druki nr 2685 i 2690)	wnioski mniejszości nr 1-3	\N	f	182	228	19	31	229
759	60	205	60	2026-06-19 10:10:53	ELECTRONIC	Pkt. 17 Sprawozdanie Komisji o rządowym projekcie ustawy o zmianie ustawy o świadczeniach opieki zdrowotnej finansowanych ze środków publicznych oraz ustawy o działalności leczniczej (druki nr 2685 i 2690)	głosowanie nad całością projektu.	całość projektu ustawy	t	253	0	177	30	1
760	60	215	61	2026-06-19 10:12:01	ELECTRONIC	Pkt. 19 Pierwsze czytanie rządowego projektu ustawy o zabezpieczeniu socjalnym osób wykonujących zawód artystyczny (druk nr 2644)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	199	233	1	27	234
761	60	215	62	2026-06-19 10:13:10	ELECTRONIC	Pkt. 19 Pierwsze czytanie rządowego projektu ustawy o zabezpieczeniu socjalnym osób wykonujących zawód artystyczny (druk nr 2644)	wniosek o dodatkowe skierowanie projektu do Komisji ds. Deregulacji	wniosek o skierowanie projektu ustawy dodatkowo do Komisji do Spraw Deregulacji	f	38	220	176	26	221
762	60	148	63	2026-06-19 10:14:11	ELECTRONIC	Pkt. 20 Pierwsze czytanie rządowego projektu ustawy o zmianie ustawy - Prawo bankowe oraz niektórych innych ustaw (druk nr 2642)	wniosek o odrzucenie projektu w pierwszym czytaniu.	wniosek o odrzucenie projektu ustawy w pierwszym czytaniu	f	29	231	174	26	232
763	60	216	64	2026-06-19 10:16:24	ELECTRONIC	Pkt. 22 Sprawozdanie Komisji w sprawie wniosku oskarżyciela prywatnego Dariusza Korneluka, reprezentowanego przez adwokata Janusza Kaczmarka, z dnia 30 marca 2026 r. o wyrażenie zgody przez Sejm na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry (druk nr 2657)	głosowanie nad przyjęciem wniosku o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry	wniosek o wyrażenie zgody na pociągnięcie do odpowiedzialności karnej posła Zbigniewa Ziobry	f	238	198	0	24	231
\.


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bills_id_seq', 216, true);


--
-- Name: sittings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sittings_id_seq', 66, true);


--
-- Name: voting_club_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.voting_club_results_id_seq', 8609, true);


--
-- Name: votings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.votings_id_seq', 763, true);


--
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- Name: bills bills_term_print_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_term_print_number_key UNIQUE (term, print_number);


--
-- Name: sittings sittings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sittings
    ADD CONSTRAINT sittings_pkey PRIMARY KEY (id);


--
-- Name: sittings sittings_term_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sittings
    ADD CONSTRAINT sittings_term_number_key UNIQUE (term, number);


--
-- Name: voting_club_results voting_club_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_club_results
    ADD CONSTRAINT voting_club_results_pkey PRIMARY KEY (id);


--
-- Name: voting_club_results voting_club_results_voting_id_club_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_club_results
    ADD CONSTRAINT voting_club_results_voting_id_club_key UNIQUE (voting_id, club);


--
-- Name: votings votings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votings
    ADD CONSTRAINT votings_pkey PRIMARY KEY (id);


--
-- Name: votings votings_sitting_id_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votings
    ADD CONSTRAINT votings_sitting_id_number_key UNIQUE (sitting_id, number);


--
-- Name: voting_club_results voting_club_results_voting_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_club_results
    ADD CONSTRAINT voting_club_results_voting_id_fkey FOREIGN KEY (voting_id) REFERENCES public.votings(id) ON DELETE CASCADE;


--
-- Name: votings votings_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votings
    ADD CONSTRAINT votings_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bills(id) ON DELETE SET NULL;


--
-- Name: votings votings_sitting_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votings
    ADD CONSTRAINT votings_sitting_id_fkey FOREIGN KEY (sitting_id) REFERENCES public.sittings(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict cX8h3wwykYPHHLk7O7GAPumlzJYRZfeJmCHs8OcvtZoGlkvM8aCKctg9pbX5CDJ

