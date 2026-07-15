# Audyt ekonomii M-RP 2.9

Stan analizy: 15 lipca 2026 r.

Zakres: kod gamemode, konfiguracja MTA/AMX, lokalna baza `mrucznik` oraz aktywne pliki domów.

Cel: opisać aktualne źródła i odpływy pieniędzy, ceny, zarobki, ryzyka oraz zaproponować stabilną gospodarkę.

## 1. Podsumowanie zarządcze

Obecna ekonomia nie ma jednego źródła konfiguracji. Ceny i wypłaty są rozrzucone między stałymi Pawn, dialogami, bazą MySQL i plikami INI. Utrudnia to strojenie i prowadzi do rozbieżności między ceną pokazywaną graczowi a kwotą rzeczywiście pobieraną.

Najważniejsze ustalenia:

1. **Payday nie pobiera skutecznie podatku ani rachunku za prąd.** Kod zapisuje stan banku do zmiennej `account`, odejmuje opłaty, a następnie ustawia konto na `account + interest`. W ten sposób przywraca saldo sprzed opłat.
2. **Czynsz jest tylko wyświetlany.** W paydayu pojawia się komunikat `Wynajem: -$...`, ale w analizowanej ścieżce nie ma odpowiadającego mu pobrania pieniędzy.
3. **Biznesy tworzą pieniądze z dodatnią wartością oczekiwaną.** Dla zwykłego konta średnia zmiana to około `+27,78%` maksymalnego zysku biznesu na payday, a dla Premium około `+44,44%`. Straty można częściowo ominąć przez trzymanie środków w banku.
4. **Jedna gałąź losowania biznesu jest martwa.** `random(10)` daje wartości 0–9, więc warunek `randomValue == 10` nigdy nie wystąpi.
5. **Świat pochodzi ze starej, bogatej gospodarki.** Łączna katalogowa wartość domów wynosi około 29,0 mld $, a aktywna lokalna baza ma tylko jedno konto z majątkiem poniżej 1 mln $. Większość nieruchomości i najdroższych pojazdów jest więc poza zasięgiem świeżej populacji.
6. **Sejfy frakcji i organizacji mają około 408,0 mln $.** To ponad 411 razy więcej niż płynny majątek jedynego aktualnego konta gracza.
7. **Brakuje centralnej księgi transakcji z powodem operacji.** Istnieje log tekstowy, ale nie pozwala łatwo policzyć inflacji, podaży pieniądza i źródła każdego przyrostu.
8. **Część interfejsów pokazuje inne ceny niż stałe używane przez kod.** Przykład: dialog zakupu wodolotu pokazuje 25 mln $, tabela pojazdów 0 $, a stała kosztu wynajęcia wynosi 500 tys. $. Są to różne operacje, ale nazwy i rozproszenie konfiguracji zwiększają ryzyko pomyłki.

### Ocena ogólna

| Obszar | Ocena | Uzasadnienie |
|---|---:|---|
| Czytelność konfiguracji | 2/5 | Ceny są rozrzucone po wielu plikach i bazie |
| Kontrola inflacji | 1/5 | Nieskuteczne podatki, odsetki i dodatnie biznesy |
| Odpływy pieniądza | 2/5 | Istnieją, ale część jest za mała lub nie działa |
| Zarobki aktywne | 3/5 | Dużo aktywności, lecz brak wspólnego limitu $/h |
| Bezpieczeństwo operacji | 2/5 | Logi są, ale funkcje przyjmują wartości ujemne |
| Możliwość strojenia | 2/5 | Niektóre ceny są ustawialne w grze, większość wymaga kompilacji |
| Fundament do poprawy | 4/5 | Istnieją centralne funkcje gotówki i dużo danych do migracji |

## 2. Aktualny stan lokalnej gospodarki

To jest migawka lokalnej bazy używanej podczas testów, a nie prognoza dla przyszłego serwera produkcyjnego.

### Konta graczy

| Wskaźnik | Wartość |
|---|---:|
| Liczba kont | 1 |
| Gotówka | 986 856 $ |
| Bank | 5 006 $ |
| Łączny majątek płynny | 991 862 $ |
| Konta z co najmniej 1 mln $ | 0 |
| Konto testowe | `Miroslaw_Zlotowa` |

### Biznesy

| Wskaźnik | Wartość |
|---|---:|
| Rekordy biznesów | 131 |
| Suma maksymalnych wypłat godzinowych | 628 000 $ |
| Minimalny / maksymalny parametr wypłaty | 0 $ / 18 500 $ |
| Suma cen zakupu w bazie | 10 000 $ |
| Biznesy z ceną zakupu większą od zera | 1 |
| Stan kieszeni biznesów | 0 $ |

Prawie wszystkie biznesy mają cenę zakupu `0`, mimo że część ma właścicieli pochodzących ze starego zestawu danych. Przed otwarciem serwera trzeba wyczyścić właścicieli nieistniejących kont i ustawić realistyczne ceny zakupu.

### Sejfy świata

| Typ | Liczba | Suma gotówki | Średnia | Maksimum |
|---|---:|---:|---:|---:|
| Frakcje | 19 | 267 050 088 $ | 14 055 268 $ | 91 933 211 $ |
| Organizacje | 49 | 140 919 133 $ | 2 875 901 $ | 52 381 373 $ |
| Razem | 68 | 407 969 221 $ | — | — |

W sejfach organizacji znajduje się też 382 183 materiałów oraz 95 jednostek kontrabandy. Te zapasy powinny być albo wyzerowane na świeży start, albo jawnie uznane za część starej gospodarki.

### Domy z aktywnych plików INI

| Wskaźnik | Wartość |
|---|---:|
| Liczba domów | 1 260 |
| Domy z ceną | 1 237 |
| Domy oznaczone jako kupione | 386 |
| Cena minimalna | 250 000 $ |
| Mediana ceny | 7 500 000 $ |
| Średnia cena | 23 464 048 $ |
| Cena maksymalna | 600 000 000 $ |
| Suma cen katalogowych | 29 025 027 342 $ |
| Czynsz minimalny / maksymalny | 1 000 $ / 1 000 000 $ |
| Gotówka w sejfach domów | 1 772 511 $ |

Mediana 7,5 mln $ oznacza około 190 godzin samego maksymalnego bazowego paydayu gracza 21+ bez innych wydatków. Dla nowych graczy nieruchomości nie pełnią obecnie roli osiągalnej progresji.

## 3. Jak obecnie powstają pieniądze

### 3.1. Bazowy payday

`pPayCheck` rośnie co sekundę aktywnej gry zależnie od poziomu. Maksymalna teoretyczna stawka na pełną godzinę:

| Poziom | Przyrost na sekundę | Maksimum na godzinę |
|---:|---:|---:|
| 0–2 | 1 $ | 3 600 $ |
| 3–4 | 2 $ | 7 200 $ |
| 5–6 | 3 $ | 10 800 $ |
| 7–8 | 4 $ | 14 400 $ |
| 9–10 | 5 $ | 18 000 $ |
| 11–12 | 6 $ | 21 600 $ |
| 13–14 | 7 $ | 25 200 $ |
| 15–16 | 8 $ | 28 800 $ |
| 17–18 | 9 $ | 32 400 $ |
| 19–20 | 10 $ | 36 000 $ |
| 21+ | 11 $ | 39 600 $ |

Payday wymaga pięciu zaliczeń aktywności. Jedno zaliczenie pojawia się co pięć minut, więc minimalnie potrzeba około 25 aktywnych minut. Wypłata trafia do gotówki, nie do banku.

Źródła: `gamemodes/system/timery.pwn` (naliczanie `pPayCheck`, `pPayDay`) i `gamemodes/Mrucznik-RP.pwn` (`PayDay`).

### 3.2. Odsetki bankowe

Odsetki są liczone wzorem zależnym od logarytmu salda. Dom podwaja mnożnik, Premium ponownie go podwaja, więc oba bonusy razem dają `x4`. Dla salda powyżej 100 mln $ payday nie dopisuje odsetek.

Problemy:

- odsetki są generatorem pieniędzy bez odpowiadającego źródła;
- posiadacz domu i Premium ma czterokrotną przewagę;
- stan po odsetkach może przekroczyć limit, jeśli saldo przed paydayem było jeszcze poniżej limitu;
- naliczenie używa salda sprzed skutecznego rozliczenia opłat.

### 3.3. Biznesy klasyczne

Dla parametru `B = b_maxMoney` wartość oczekiwana jednego paydayu wynosi:

- konto zwykłe: około `+0,2778 × B`;
- konto Premium: około `+0,4444 × B`.

Przy sumie `B = 628 000 $` pełne rozdanie wszystkich aktywnych biznesów może średnio stworzyć około 174 000 $ na zwykłych kontach lub 279 000 $ na kontach Premium na godzinę. To wartość teoretyczna, zależna od faktycznych właścicieli online.

Wady implementacji:

- strata jest pobierana tylko, gdy gracz ma wystarczającą gotówkę;
- brak gotówki zamienia stratę na punkt WL, więc bank chroni kapitał;
- `randomValue == 10` jest nieosiągalne;
- wywołanie rekurencyjne dla zera jest zbędne i może zostać zastąpione poprawnym zakresem losowania;
- Premium zwiększa oczekiwany przyrost o około 60% względem zwykłego konta.

### 3.4. Front biznesy organizacji

Każdy członek otrzymuje wypłatę zależną od `BaseIncome + IncomePerPlayer × log2(gracze online)`, pomniejszoną o udział lidera. Udział lidera trafia do sejfu organizacji.

Ryzyko: emisja skaluje się jednocześnie z liczbą członków i liczbą graczy online. Bez globalnego limitu jeden front może wypłacać tę samą korzyść wielu osobom i szybko zwiększać podaż pieniądza.

### 3.5. Napady i prace przestępcze

| Aktywność | Aktualna wypłata / koszt |
|---|---:|
| Napad na sklep | 55 000–79 999 $ na uprawnionego uczestnika |
| Cooldown napadu | 35 minut globalnie |
| Wymagana policja | 4 funkcjonariuszy na służbie |
| Start przemytu | 1 000 000 $ |
| Zniszczenie paczki przemytu | 500 $ za paczkę |
| Kradzież auta, skill 1 | około 3 000–4 000 $ + modyfikatory |
| Kradzież auta, skill 5 | około 7 100–7 500 $ + modyfikatory |
| Zlecenie hitmana | finansowane wartością kontraktu gracza |

Napad ma dobre warunki aktywności i cooldown, ale wypłata jest mnożona przez liczbę uczestników. Należy mierzyć średni czas całej akcji i wynik w `$ / aktywną godzinę`.

### 3.6. Legalne prace i handel

| Aktywność | Aktualna wartość |
|---|---:|
| Sprzedaż ryby | 14 $/kg |
| Sprzedaż ryby we własnej restauracji | 21 $/kg |
| Zakup materiałów | 1 200 $/szt. |
| Sprzedaż materiałów botowi | 50 $/szt. |
| Medyk – wybrane nagrody bezpośrednie | 1 000 $ lub 5 000 $ |
| Sprzedaż apteczki przez lekarza | klient płaci 30 000 $; 20 000 $ lekarz, 10 000 $ sejf |
| Łowca nagród – martwy cel | 5 000 $ × WL przed dodatkami |
| Łowca nagród – żywy cel | 10 000 $ × WL przed dodatkami |
| Grzywna więzienna | 4 000 $ × WL |
| Nagroda za aresztowanie | zależna od WL i sposobu zatrzymania |
| Skrzynka konwoju | losowo 1 000–50 999 $ |

Opis pracy w grze deklaruje też orientacyjne zarobki, np. kierowca około 30 tys. $/h, kurier 34,1 tys. $/h, mechanik 3–7 tys. $/h na początku, prawnik zwykle około 30 tys. $/h. Te komunikaty nie są gwarancją realnej stawki i powinny zostać porównane z telemetrią.

## 4. Aktualne ceny i odpływy pieniędzy

### 4.1. Dokumenty i licencje

| Pozycja | Cena |
|---|---:|
| Dowód osobisty | 5 000 $ |
| Karta wędkarska | 10 000 $ |
| Licencja na broń | 50 000 $ |
| Licencja na łódź | 100 000 $ |
| Prawo jazdy – teoria | 5 000 $ |
| Prawo jazdy – praktyka | 7 500 $ |
| Prawo jazdy – odbiór dokumentu | 5 000 $ |
| Licencja pilota | 500 000 $ |
| Bilet kolejowy | 10 000 $ |

Ceny urzędu i biletu można zmieniać komendą administracyjną/rządową bez rekompilacji. To dobry kierunek, który należy rozszerzyć na resztę cennika.

### 4.2. Sklep 24/7

| Pozycja | Cena |
|---|---:|
| Zdrapka | 56 500 $ |
| Telefon | 500 $ |
| Książka telefoniczna | 5 000 $ |
| Kostka | 500 $ |
| Aparat | 5 000 $ |
| Kondom | 50 $ |
| MP3 | 2 500 $ |
| Piwo | 20 $ |
| Wino | 25 $ |
| Sprunk | 15 $ |
| CB-Radio | 2 500 $ |
| Cygara | 200 $ |
| Kij baseballowy | 15 000 $ |
| Tempomat | 35 000 $ |
| Mrożony kurczak | 15 $ |
| Mrożona pizza | 30 $ |
| Mrożony hamburger | 25 $ |
| Maseczka ochronna | 15 000 $ |

Uwagi: pozycje „zamek” i „prędkościomierz” są wyświetlane po 10 000 $ i 5 000 $, ale ich gałęzie zgłaszają brak towaru albo mają wyłączone pobranie. Interfejs powinien ukrywać niedostępne towary.

### 4.3. Usługi i stałe opłaty

| Usługa | Cena |
|---|---:|
| Leczenie szpitalne po BW | 2 000 $ |
| Naprawa pojazdu w wybranej ścieżce | 7 500 $ |
| Paliwo | `liczba jednostek × 120 $` |
| Rozmowa telefoniczna | 5 $/s |
| Następny poziom | `10 000 $ × nowy poziom` |
| Pozwolenie | 35 000 $ (15 000 $ pracownik, 20 000 $ sejf) |
| Winyl pojazdu | 50 000 $ |
| Winyl VIP | 80 000 $ |
| Transport pojazdu do Vice City | 20 000 $ |
| Scena San News | 2 000 000 $ |
| Neon pierwszy | 3 000 000 $ + prowizja |
| Zmiana istniejącego neonu | 1 000 000 $ + prowizja |

### 4.4. Mechanik i tuning

| Usługa | Koszt bazowy |
|---|---:|
| Nitro | 5 000 $ |
| Hydraulika | 10 000 $ |
| Zderzaki | 10 000 $ |
| Felgi | 15 000 $ |
| Lakier | 20 000 $ |
| Spoiler | 25 000 $ |

Usługi graczy powinny rozdzielać kwotę na koszt systemowy i marżę pracownika. Obecnie część komunikatów sugeruje ręczne pobieranie 2–4 razy większej ceny, co utrudnia kontrolę inflacji i analizę marż.

### 4.5. Basen i Ibiza

| Pozycja | Cena |
|---|---:|
| Basen dziecięcy | 50 000 $ |
| Basen podstawowy | 75 000 $ |
| Basen zaawansowany | 100 000 $ |
| Basen Premium | 150 000 $ |
| Ibiza – wejście zwykłe | 30 000 $ |
| Ibiza – wejście VIP | 100 000 $ |
| Maksimum ustawiane dla zwykłego | 250 000 $ |
| Maksimum ustawiane dla VIP | 500 000 $ |

### 4.6. Domy i ulepszenia

| Ulepszenie | Cena / zasada |
|---|---:|
| Sejf poziomy 1–10 | `100 000 $ × kolejny poziom` + materiały/narkotyki |
| Sejf powyżej 10 | skala od 1 000 000 $ + rosnące zasoby |
| Zbrojownia | 1 000 000 $ |
| Lądowisko poziom 1 | 10 000 000 $ |
| Następne poziomy lądowiska | rosnąca skala milionowa |
| Zwrot za sprzedaż domu państwu | około 50% ceny |

Dom daje też mnożnik odsetek. Łączenie wysokiej ceny, odsetek i bonusów zwiększa dystans między nowym a bogatym graczem. Lepszy jest niewielki koszt utrzymania domu oraz bonus użytkowy, a nie mnożnik tworzenia pieniędzy.

### 4.7. Pojazdy

Tabela `CarPrices` obejmuje 212 modeli:

- 112 modeli ma cenę większą od zera;
- 100 modeli ma cenę `0` i jest niedostępne lub obsługiwane specjalną ścieżką;
- najtańszy wyceniony model: Mover 7 500 $;
- mediana wycenionych modeli: 750 000 $;
- średnia: około 20,69 mln $ (mocno podniesiona przez lotnictwo);
- najdroższy: Shamal 515 250 000 $.

Wybrane ceny reprezentatywne:

| Segment | Model | Cena |
|---|---|---:|
| Budżet | Faggio | 17 000 $ |
| Budżet | Clover | 45 000 $ |
| Budżet | Perennial | 60 000 $ |
| Użytkowy | Walton | 80 000 $ |
| Osobowy | Bravura | 160 000 $ |
| Osobowy | Premier | 280 000 $ |
| Osobowy | Sentinel | 600 000 $ |
| Terenowy | Rancher | 600 000 $ |
| Sportowy | Buffalo | 3 000 000 $ |
| Sportowy | Elegy | 4 000 000 $ |
| Sportowy | Banshee | 6 000 000 $ |
| Sportowy | Cheetah | 7 000 000 $ |
| Sportowy | Bullet | 8 000 000 $ |
| Sportowy | Turismo | 10 000 000 $ |
| Motocykl | NRG-500 | 11 500 000 $ |
| Sportowy | Infernus | 12 500 000 $ |
| Samolot | Dodo | 30 000 000 $ w tabeli; dialog pokazuje 50 000 000 $ |
| Helikopter | Sparrow | 125 000 000 $ |
| Samolot | Beagle | 170 000 000 $ |
| Helikopter | Maverick | 200 000 000 $ |
| Helikopter | Raindance | 325 000 000 $ |
| Samolot | Shamal | 515 250 000 $ |

Pełny cennik źródłowy: `gamemodes/modules/pojazdy/pojazdy.hwn`. Dialogi zakupu: `gamemodes/modules/pojazdy/pojazdy_callbacks.pwn`. Te dwa miejsca należy zastąpić jedną tabelą, z której generowany będzie zarówno tekst, jak i pobierana kwota.

## 5. Hazard i losowość

| Mechanizm | Koszt | Rzeczywista wypłata systemowa |
|---|---:|---:|
| Blackjack – pobranie karty | 100 $ | 0 $; służy do RP między graczami |
| Ruletka – zakręcenie | 10 000 $ | 0 $; wynik jest tylko wyświetlany |
| Koło fortuny | 5 000 $ | 0 $; wyświetla 1–40 $, ale nie dopisuje nagrody |
| Lotto | 5 000 $ | 4 500 $ trafia do jackpotu, 500 $ znika jako podatek |
| Zdrapka | 56 500 $ | możliwe 15 000–200 000 $ zależnie od losowania |

Koło fortuny i ruletka nie są klasycznym kasynem systemowym, tylko płatnymi generatorami wyniku do gry RP. Komunikaty powinny jasno to mówić. Dla zdrapki trzeba policzyć dokładne prawdopodobieństwa i oczekiwaną wartość w teście automatycznym; obecna konstrukcja opiera się na porównaniu dwóch liczb losowych i jest trudna do zweryfikowania przez administratora.

## 6. Najważniejsze słabe punkty

### P0 — naprawić przed otwarciem ekonomii

1. **Przywracanie salda w paydayu.** Rozliczenie powinno mieć kolejność: saldo początkowe → podatek → rachunki → czynsz → odsetki → zapis salda końcowego. Nie wolno ponownie używać niezmienionego `account`.
2. **Brak realnego czynszu.** Albo pobierać czynsz i przekazywać go właścicielowi/podatkowi, albo usunąć komunikat.
3. **Brak centralnej walidacji kwot.** `DajKase` i `ZabierzKase` logują wartości ujemne, ale nadal wykonują operację. Wartość `money <= 0` powinna być odrzucona, a transfery powinny mieć osobną, atomową funkcję.
4. **Brak centralnego powodu transakcji.** Bez identyfikatora źródła nie da się szybko znaleźć exploita ani policzyć emisji.
5. **Stare środki i właściciele.** Trzeba zdecydować: pełny wipe, migracja kontrolowana albo zachowanie starej gospodarki. Stan pośredni jest niespójny.

### P1 — wysoki wpływ na inflację i uczciwość

1. Naprawić rozkład `BusinessPayDay`, pobierać straty z całego majątku lub z kieszeni biznesu i ustawić docelową wartość oczekiwaną blisko zera przed podatkiem.
2. Ograniczyć odsetki do małego bonusu z limitem nominalnym, np. maks. 1 000–2 000 $ na payday; usunąć mnożnik x4.
3. Ustawić ceny zakupu wszystkich biznesów oraz wyczyścić właścicieli bez istniejących kont.
4. Ujednolicić ceny pojazdów pokazywane i pobierane.
5. Wprowadzić dzienny limit emisji z front biznesów na organizację.
6. Zweryfikować puste ceny sklepu z bronią; lokalna tabela `mru_gspanel` ma 0 rekordów.

### P2 — jakość i strojenie

1. Przenieść cenniki do jednej tabeli MySQL lub jednego modułu konfiguracyjnego.
2. Automatycznie generować dialogi z aktualnej konfiguracji.
3. Dodać dashboard: pieniądz utworzony, spalony i przeniesiony na godzinę/dzień.
4. Ujednolicić kwoty w tekstach pomocy z rzeczywistymi wypłatami.
5. Dodać test symulujący 10 000 paydayów, biznesów, zdrapek i napadów.

## 7. Mocne strony obecnej gospodarki

- Gotówka przechodzi głównie przez `DajKase`, `ZabierzKase` i `UstawKase`, więc istnieje punkt wyjścia do centralizacji.
- Operacje są logowane w `moneyLog`, `payLog` i logach błędów.
- Payday ma zabezpieczenie przed pełną wypłatą za krótkie wejście lub AFK.
- Bank ma limit 100 mln $ w wielu ścieżkach transferu.
- Napady wymagają policji, czasu, pojazdu, grupy i mają globalny cooldown.
- Sprzedaż domu i części majątku do systemu zwraca tylko część ceny, co jest dobrym odpływem pieniądza.
- Część cen urzędowych można zmieniać w trakcie działania serwera.
- Wiele usług przekazuje część pieniędzy innym graczom lub sejfom, wspierając gospodarkę obiegową zamiast samej emisji.

## 8. Proponowany model dobrej gospodarki

### 8.1. Docelowe tempo zarobku

Proponowana kotwica dla aktywnej godziny gry:

| Etap gracza | Cel netto / aktywną godzinę |
|---|---:|
| Nowy gracz | 20 000–30 000 $ |
| Rozwinięty legalny zawód | 35 000–55 000 $ |
| Zaawansowana praca / ryzyko | 55 000–80 000 $ |
| Zorganizowana akcja z cooldownem | 70 000–100 000 $ ekwiwalentu na osobę |
| Dochód pasywny | maks. 15–25% aktywnego zarobku |

Wszystkie ceny należy wyrażać także w „godzinach aktywnej gry”. Przykładowy cel:

- telefon: poniżej 5 minut;
- podstawowe prawo jazdy: 30–60 minut łącznie;
- pierwszy tani pojazd: 2–4 godziny;
- typowy samochód: 10–25 godzin;
- pierwszy mały dom: 25–50 godzin;
- luksusowy pojazd/dom: cel długoterminowy 100+ godzin;
- lotnictwo: zawartość końcowa, organizacyjna albo sezonowa.

### 8.2. Źródła i odpływy

Docelowo miesięczna emisja netto powinna być dodatnia dla rozwijającej się populacji, ale kontrolowana. Na stabilnym serwerze proponuję:

- aktywne prace i zadania: 60–70% nowego pieniądza;
- payday bazowy: 15–20%;
- organizacje/biznesy pasywne: maks. 10–15%;
- eventy i administracja: maks. 5%;
- odpływy stałe powinny usuwać 70–90% emisji w dojrzałej gospodarce.

Odpływy powinny być przewidywalne i użytkowe: paliwo, serwis, ubezpieczenie, podatek od nieruchomości, rejestracja, ulepszenia kosmetyczne, opłaty organizacji i aukcje. Kara za samo granie nie może dominować.

### 8.3. Premium

Premium nie powinno bezpośrednio mnożyć emisji pieniędzy. Lepsze bonusy:

- dodatkowy slot kosmetyczny;
- krótszy cooldown usługi;
- niższa prowizja wygody, ale nie niższy koszt bazowy gospodarki;
- szybsza informacja, kolejka lub funkcje interfejsu;
- bonus doświadczenia ograniczony dziennie.

## 9. Plan wdrożenia zmian ekonomii

### Etap A — bezpieczeństwo i pomiar

1. Naprawić payday i czynsz.
2. Dodać `MoneyTransaction(playerid, amount, reason, relatedId)`.
3. Zapisywać do MySQL: UID, czas, kwota, saldo przed/po, powód, powiązany gracz/pojazd/dom.
4. Odrzucać kwoty zerowe, ujemne i przekraczające limit.
5. Dodać alerty dla nietypowej emisji, np. ponad 500 tys. $/h na konto.

### Etap B — normalizacja danych

1. Ustalić politykę wipe/migracji.
2. Wyczyścić nieistniejących właścicieli.
3. Ustawić ceny biznesów i broni.
4. Przenieść ceny do tabel konfiguracyjnych.
5. Wygenerować interfejsy z tych samych danych.

### Etap C — balans

1. Przez 7–14 dni mierzyć realne `$ / aktywną godzinę` każdej pracy.
2. Zmieniać maksymalnie jedną rodzinę stawek na dobę.
3. Ustawić medianę pierwszego samochodu na 3 godziny, typowego na 15 godzin i małego domu na 35 godzin.
4. Zredukować pasywne biznesy i odsetki.
5. Co tydzień publikować krótkie zestawienie zmian gospodarki.

## 10. Miejsca w kodzie do zmiany cen

| Obszar | Główne źródło |
|---|---|
| Wersja serwera | `gamemodes/VERSION.pwn` |
| Payday i odsetki | `gamemodes/Mrucznik-RP.pwn` |
| Przyrost wypłaty poziomu | `gamemodes/system/timery.pwn` |
| Limity i proste stałe | `gamemodes/system/definicje.pwn` |
| Zmienne ceny globalne | `gamemodes/system/zmienne.pwn` |
| Pojazdy | `gamemodes/modules/pojazdy/pojazdy.hwn` |
| Dialogi salonów | `gamemodes/modules/pojazdy/pojazdy_callbacks.pwn` |
| Biznesy klasyczne | `gamemodes/modules/biznesy/biznesy.pwn` i MySQL `mru_business` |
| Front biznesy | `gamemodes/modules/front_business/front_business.hwn` |
| Licencje i urząd | `gamemodes/modules/urzadls/urzadls.pwn` |
| Sklep 24/7 | `gamemodes/modules/komendy/commands/kup/kup_impl.pwn`, `gamemodes/dialogs/OnDialogResponse.pwn` |
| Domy i ulepszenia | `gamemodes/dialogs/OnDialogResponse.pwn`, pliki `scriptfiles/Domy` |
| Napady | `gamemodes/modules/napady/napady.def` |
| Przemyt | `gamemodes/modules/praca_przemytnik/praca_przemytnik.def` |
| Hospitalizacja | `gamemodes/modules/bw/bw.def` |
| Konwój | `gamemodes/modules/convoy/convoy.def` |
| Ryby | `gamemodes/modules/fishing/commands/sprzedajrybe/sprzedajrybe_impl.pwn` |
| Materiały | `gamemodes/modules/komendy/commands/materialy/materialy_impl.pwn` i `gamemodes/modules/komendy/commands/sprzedajmaterialy/sprzedajmaterialy_impl.pwn` |
| Hazard | `gamemodes/modules/komendy/commands/{blackjack,ruleta,kolo,lotto}` i dialog zdrapki |

## 11. Wskaźniki, które trzeba mierzyć

Minimalny dzienny raport:

- łączna gotówka graczy;
- łączny bank graczy;
- środki w domach, biznesach, organizacjach i frakcjach;
- emisja i odpływ według `reason`;
- mediana, P90 i P99 majątku;
- mediana zarobku netto na aktywną godzinę według pracy;
- liczba kupionych pojazdów/domów oraz ich mediana ceny;
- udział Premium w emisji;
- liczba ręcznych operacji administratorów;
- konta z przyrostem ponad ustalony próg;
- stosunek odpływów do emisji;
- czas do pierwszego telefonu, prawa jazdy, auta i domu.

Proponowane alarmy:

- saldo powyżej limitu bankowego;
- pojedyncza transakcja powyżej 100 mln $;
- ponad 500 tys. $ emisji na konto w godzinę bez napadu/eventu;
- ujemna kwota przekazana do `DajKase` albo `ZabierzKase`;
- więcej niż 10% dziennej emisji z komend administracyjnych;
- biznes z ceną 0 i przypisanym właścicielem;
- cena w dialogu inna niż cena pobrana.

## 12. Rekomendacja końcowa

Nie należy zaczynać od masowej zmiany wszystkich cen. Najpierw trzeba naprawić przepływ pieniędzy, włączyć pomiar i zdecydować, czy serwer startuje ze świeżą gospodarką. Dopiero dane z tygodnia testów pokażą rzeczywiste zarobki na godzinę.

Najbezpieczniejsza kolejność decyzji:

1. wybrać wipe albo kontrolowaną migrację;
2. naprawić payday, czynsz i biznesy;
3. ustawić centralny rejestr transakcji;
4. przyjąć cel 25–50 tys. $ netto na aktywną godzinę dla większości graczy;
5. obniżyć ceny wejściowe domów i zweryfikować pojazdy lotnicze;
6. przez dwa tygodnie stroić stawki na podstawie telemetrii;
7. dopiero potem otworzyć pasywne biznesy i odsetki.

Audyt opisuje aktualny stan i rekomendacje. Nie zmienia samych stawek gospodarki, aby nie narzucać właścicielowi serwera decyzji o wipe, tempie progresji i roli Premium bez zatwierdzenia.
