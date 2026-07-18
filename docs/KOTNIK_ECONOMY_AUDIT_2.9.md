# Audyt ekonomii M-RP 2.9 (Kotnik na MTA)

Data: 2026-07-17

## Zakres i źródła

Audyt obejmuje przepływy gotówki, ceny stałe, prace, kontrakty, handel, laboratoria narkotykowe, biznesy, domy i komendy administracyjne. Główne źródła prawdy to:

- `KOTNIKRP/gamemodes/system/ceny.pwn` — centralne stałe cenowe;
- `KOTNIKRP/gamemodes/modules/money/money.pwn` — operacje na portfelu;
- moduły `contracts`, `crates`, `dealers`, `shops`, `druglab`, `premium`, `biznesy`;
- dane dynamiczne bazy: ceny aut, domów, biznesów i wypłaty tras transportowych.

Nie wszystkie wartości są stałe w kodzie. Ceny pojazdów, domów, maksymalny dochód biznesu i część tras są danymi bazy, dlatego po uruchomieniu trzeba je monitorować raportem SQL, a nie tylko przez `ceny.pwn`.

## Najważniejsze wnioski

1. Skala cen jest niespójna. Podstawowe przedmioty kosztują 1–500$, a wypłaty frakcyjne za payday wynoszą 3000–6700$. Gracz szybko przestaje odczuwać większość małych kosztów.
2. Największym generatorem inflacji było laboratorium narkotykowe. Przy cyklu 60 sekund, 10 pracownikach i najlepszej kokainie mogło generować około 2,1 mln $ brutto na godzinę. Cykl w M-RP 2.9 został zmieniony na 10 minut, co obniża teoretyczny sufit do około 210 tys. $/h przed kosztem nasion i logistyką.
3. Skill kuriera miał błąd wykładniczy: przyznawał dotychczasowy skill ponownie razem z nowym. Zostało to poprawione na zwykłe dodanie zdobytego skilla.
4. `/addmc` akceptowało liczbę ujemną i mogło zwiększać budżet MC. `/setmc` aktualizowało forum administratora zamiast celu. Oba błędy zostały usunięte.
5. Operacje gotówkowe nie miały ochrony przed przepełnieniem 32-bitowej liczby całkowitej. Dodano limit salda 2 mld $, dolny limit długu -10 mln $ i odrzucanie niebezpiecznych operacji.
6. Sprzedaż całych stosów u dealerów/sklepów mnożyła cenę bez kontroli przepełnienia. Dodano limit bezpiecznej wartości transakcji 100 mln $.
7. Pickup upuszczonych pieniędzy wypłacał środki przed unieważnieniem obiektu. Kolejność odwrócono, co blokuje podwójną wypłatę z powtórzonego callbacku.

## Ceny życia codziennego

| Pozycja | Cena |
|---|---:|
| Sprunk | 15$ |
| Piwo / wino | 7$ / 5$ |
| Woda | 50$ |
| Telefon | 45$ |
| Aparat | 50$ |
| MP3 | 15$ |
| CB radio | 40$ |
| Tempomat | 75$ |
| Apteczka | 500$ |
| Kamizelka | 150$ |
| Maska / torba | 200$ / 250$ |
| Zestaw naprawczy | 90$ |
| Pay'n'Spray | 250$ |
| Respawn auta | 50$ |
| SMS | 8$ |
| Ślub | 8000$ |
| Zmiana płci | 2000$ |
| Reset ulepszeń | 1000$ |

Ocena: przedmioty codzienne są bardzo tanie wobec payday. Jeśli celem ma być gospodarka długoterminowa, podstawowy koszyk powinien kosztować około 2–5% przeciętnego godzinowego zarobku, a nie ułamek procenta.

## Legalne zarobki i usługi

| Źródło | Wartość |
|---|---:|
| Payday zwykły | 1000–1700$ |
| Payday restauracja | 3000–4000$ |
| Payday medyk | 4500–5000$ |
| Payday policja | 6000–6700$ |
| Magazynier (jednostka zadania) | 75$ |
| Gazeciarz (jednostka zadania) | 75$ |
| Szmugler (jednostka zadania) | 150$ |
| Usunięcie plamy przez ERS | 150$ dla gracza + 150$ do sejfu |
| Mechanik — naprawa | 90–250$ |
| Mechanik — tankowanie | 80–160$ |
| Taxi — taryfa | 1–35$ |
| Lot — taryfa | 20–150$ |
| Pociąg KT | 10–100$ |

Ryzyko: payday frakcji jest wielokrotnie wyższy niż drobne prace. Należy ustalić dokładny czas payday i realne zadania/h, a następnie mierzyć dochód na aktywną godzinę. Proponowany cel startowy:

- praca podstawowa: 2500–4500$/h;
- praca ze skillem: 4000–7000$/h;
- frakcja publiczna: 4500–7500$/h razem z payday, ale tylko za aktywność;
- biznes/pasywny dochód: najwyżej 20–35% typowego aktywnego dochodu właściciela.

## Przestępczość i ryzyko

| System | Wartość |
|---|---:|
| Napad | 1500–10000$ |
| Kara za nieudany napad | 250$ |
| Kradzież auta | 250 / 450 / 650 / 850 / maks. 1050$ |
| Hitman — minimum/maksimum | 100–10000$ |
| Grzywna | 100–700$ |
| Kaucja | 2000–15000$ |
| Kostka | 1–100000$ |

Ocena: kara za nieudany napad jest zbyt mała wobec maksymalnej nagrody. Przy powtarzalnym napadzie oczekiwana wartość może być dodatnia nawet przy bardzo niskiej skuteczności. Rekomendacja: cooldown, dowód aktywnego przygotowania, koszt wejścia 10–20% maksymalnej wypłaty i logowanie wypłat per UID/IP/serial MTA.

## Skrzynki, kontrakty i crafting

| Skrzynka | Cena bazowa |
|---|---:|
| Tkaniny | 400$ |
| Metale | 250$ |
| Materiały | 150$ |
| Kokaina | 150$ |
| Chemikalia | 2000$ |

Kontrakty cywilne: 1–3 skrzynki, nagroda 300–5000$. Kontrakty organizacji: nagroda 2000–25000$. Wykonawca otrzymuje nagrodę escrow, zwrot ceny skrzynek i bonus 15% kosztu skrzynek.

Zabezpieczenia 2.9:

- nagroda jest walidowana przed wypłatą;
- kontrakt jest najpierw oznaczany jako zakończony i zapisywany, dopiero potem następuje wypłata;
- escrow gracza używa funkcji odejmowania dodatniej kwoty;
- nieprawidłowa wypłata powyżej 100 mln $ jest blokowana i logowana.

## Handel i crafting

| Towar | Skup sklepu | Crafting |
|---|---:|---:|
| Narzędzia | 300–450$ | 800–1200$ |
| Ubrania | 350–550$ | 600–900$ |
| Meble | 200–320$ | 500–800$ |
| Elektronika | 400–650$ | 1500–2200$ |

Same widełki nie wskazują exploita, ale trzeba sprawdzić koszt materiałów. Jeżeli crafting tworzy przedmiot za mniej niż cena skupu, powstaje nieskończona pętla pieniądza. Zalecenie: koszt pełnego kompletu wejść powinien wynosić co najmniej 70–85% średniej ceny skupu, z limitem produkcji/cooldownem.

## Narkotyki i laboratoria

| Towar | Cena dealera za jednostkę |
|---|---:|
| Kokaina P | 25–60$ |
| Kokaina N | 60–110$ |
| Kokaina G | 130–200$ |
| Kokaina E | 220–350$ |
| Heroina | 150–300$ |
| Metaamfetamina | 250–400$ |
| Nasiono do laboratorium | 5$ |

Każdy aktywny pracownik laboratorium produkuje 10 jednostek na cykl i zużywa nasiona według poziomu. Maksymalny magazyn nasion to 1000. Po zmianie cyklu na 10 minut system nadal może być najbardziej dochodowym źródłem pieniędzy, ale wymaga dostarczenia nasion i sprzedaży towaru.

Rekomendacje:

- zebrać przez tydzień medianę i 95 percentyl produkcji/sprzedaży per laboratorium;
- ograniczyć dzienny skup dealera albo zastosować malejącą cenę wraz z podażą;
- zapisywać każdą sprzedaż z UID, ilością, ceną jednostkową i bilansem po operacji;
- nie podnosić cen dealera bez równoczesnego zwiększenia kosztu nasion/logistyki.

## Domy, auta i duże aktywa

- Do MTA przenoszony jest stary plikowy system domów Mrucznika, a nie nowy moduł SQL Kotnika.
- Zakres komend sprzedaży domu wynosi 500–2 000 000$; faktyczna cena domu pochodzi z pliku domu.
- Zakres sprzedaży auta wynosi 1–9 000 000$; ceny katalogowe pochodzą z bazy `mru_ceny_pojazdy`/danych pojazdów.
- Skrytki kosztują 10 000$, 25 000$ i 60 000$.

Ryzyko: aktywa są głównym magazynem wartości. Zmiana cen bez migracji istniejących aktywów tworzy ogromną przewagę starych kont. Zalecane jest raportowanie majątku netto per UID: portfel + bank + auta + dom + biznes + towary.

## Naprawione podatności i błędy

| Problem | Skutek przed poprawką | Stan 2.9 |
|---|---|---|
| Ujemne `/addmc` | zwiększenie budżetu MC | zablokowane |
| `/setmc` z GID admina | zapis MC złemu kontu forum | poprawione na GID celu |
| Skill kuriera | wzrost wykładniczy | poprawiony przyrost liniowy |
| Overflow gotówki | zmiana dużej kwoty w ujemną/dodatnią | limity i walidacja |
| Overflow sprzedaży stosu | sztucznie wysoka/ujemna wypłata | limit wartości 100 mln $ |
| Pickup pieniędzy | ryzyko podwójnego callbacku | unieważnienie przed wypłatą |
| Kontrakt | wypłata przed trwałym zamknięciem | zapis stanu przed wypłatą |
| Laboratorium co 60 s | do ok. 2,1 mln $/h | cykl 10 min |
| Ujemne `/dajkase` i `/kasa` | odwrócenie działania/obejście logiki | zakres 0–100 mln $ |

## Plan stabilnej gospodarki

1. Przez 7–14 dni nie zmieniać wszystkich cen naraz. Zbierać dziennie: pieniądz utworzony, spalony, transfery między graczami, medianę salda i majątku.
2. Ustawić docelowy aktywny zarobek godzinowy i dopasować do niego koszyk codzienny, naprawy, paliwo oraz aktywa.
3. Każdy generator musi mieć limit częstotliwości, walidację dodatniej kwoty i trwały zapis stanu przed wypłatą.
4. Źródła pasywne ograniczyć procentowo względem aktywnej gry.
5. Wprowadzić pochłaniacze pieniądza: utrzymanie drogich aut, podatki od dużych aktywów, opłaty biznesowe — ale bez karania nowych graczy.
6. Po każdej zmianie porównywać tygodniową inflację mediany majątku. Rozsądny cel startowy to 1–3% tygodniowo, a nie kilkadziesiąt procent.

## Raporty, które warto dodać

- suma wypłat według źródła i dnia;
- suma wydatków według systemu i dnia;
- top 50 przyrostów majątku netto;
- transakcje przekraczające 100 000$;
- wielokrotne wypłaty tego samego kontraktu/zadania;
- produkcja i sprzedaż narkotyków per laboratorium;
- rozbieżności między gotówką PAWN, HUD MTA i wartością zapisaną w bazie.

Ten plik opisuje stan startowy 2.9. Po testach publicznych powinien zostać uzupełniony realnymi danymi godzinowymi, bo sama analiza stałych nie pokaże cooldownów, czasu dojazdu ani zachowania graczy.
