# KotnikRP na MTA — stan portu i plan dalszych prac

Data diagnozy: 2026-07-27

## Decyzja operacyjna

KotnikRP uruchamia się obecnie na warstwie AMX/MTA, ale nie jest jeszcze
funkcjonalnym portem 1:1. Do czasu zakończenia etapów opisanych poniżej serwer
produkcyjny powinien działać na sprawdzonym gamemode MRP. Kotnik należy rozwijać
i testować na osobnej instancji lub w odseparowanym katalogu oraz bazie.

Punkt odniesienia kodu:

- branch: `codex/kotnik-mta-integration`
- ostatni działający etap startu AMX: `facd5ff6af34034f0a8b3d0eee22cc74654a7716`
- paczka diagnostyczna: `KotnikRP-MTA-runtime-fix-v5-2026-07-27.zip`
- paczka uruchamia AMX bez brakujących natywów MySQL/ORM, ale nie zapewnia
  jeszcze zgodności funkcjonalnej

## Potwierdzone problemy

### 1. Kolejka startowa klienta

Po wejściu gracza warstwa AMX generuje około 3300 zdarzeń klienckich. Obecne
opróżnianie kolejki po jednej operacji co 16 ms trwa około 53 sekund. W tym
czasie HUD, dialogi, textdrawy, obiekty gracza i część interakcji są niepełne.

Do zrobienia:

- klasyfikować zdarzenia: logowanie i stan gracza, obiekty, HUD, textdrawy,
  efekty kosmetyczne;
- scalać wielokrotne aktualizacje tego samego elementu;
- wysyłać małe paczki na klatkę z limitem czasu, zamiast jednej operacji;
- odrzucać zdarzenia zastąpione nowszą wartością;
- dodać pomiar czasu do pełnej gotowości klienta i rozmiaru kolejki.

Kryterium odbioru: pełna gotowość gracza w czasie poniżej 3 sekund bez
zauważalnego przycięcia.

### 2. Streamer obiektów i pickupów

W teście plugin zgłaszał 882 obiekty, lecz tylko 542 zostały zmaterializowane
jako elementy MTA. Diagnostyka wykazała także 1200+ pickupów oraz przypadki
odczytu pozycji `0,0,0`. Funkcje streamera SA-MP nie mają pełnego odpowiednika
w obecnym adapterze.

Do zrobienia:

- zweryfikować wszystkie sygnatury Streamer 2.9.6 używane przez Kotnika;
- odwzorować world, interior, player, area, priority, stream distance i draw
  distance;
- materializować pełny inwentarz, a nie tylko elementy widoczne dla pierwszego
  gracza;
- obsłużyć tworzenie, usuwanie, ruch, materiały, tekst, załączniki i zmianę
  danych elementu;
- zastąpić lub poprawić `Streamer_GetAllVisibleItems`, jeżeli plugin pod AMX
  zwraca niepełne dane;
- dodać test porównujący liczbę i właściwości obiektów SA-MP z MTA.

Kryterium odbioru: identyczna liczba obiektów/pickupów w każdym świecie i
interiorze oraz poprawne bramy, windy i obiekty przypisane do gracza.

### 3. Schemat bazy danych

Kotnik został uruchomiony na bazie używanej przez MRP. Schematy nie są zgodne.
W logu potwierdzono między innymi brak kolumny `OgloszeniaTyp` w tabeli
`mru_personalization`. Kod Kotnika oczekuje też pól `KomunikatyAresztowania` i
`KomunikatyNews`. Błąd jednego zapytania blokuje dalsze ładowanie lub zapis
części stanu postaci.

Do zrobienia:

- utworzyć oddzielną bazę testową Kotnika;
- wygenerować migrację schematu na podstawie wszystkich zapytań w gamemode;
- porównać każdą tabelę, kolumnę, typ, wartość domyślną i indeks;
- wdrożyć migrację transakcyjnie na kopii danych;
- dodać kontrolę schematu podczas startu serwera;
- przetestować pełny cykl: konto, postać, personalizacja, pojazdy, domy,
  biznesy, grupy, ekwipunek i zapis pozycji.

Nie należy ponownie testować Kotnika na produkcyjnej bazie MRP.

### 4. BlueG MySQL R41 i ORM

Adapter Lua udostępnia wymagane natywy i pozwala załadować AMX, ale wymaga testów
zgodności zachowania:

- kolejność i asynchroniczność `mysql_tquery`;
- aktywny cache i czas jego życia;
- wywołania callbacków z argumentami;
- `cache_set_active`, `cache_delete`, `cache_insert_id`;
- wartości NULL, kodowanie i escapowanie;
- pełny cykl `orm_create/load/select/update/save/destroy`.

Kryterium odbioru: testy kontraktowe wykonujące te same zapytania na SA-MP i MTA
oraz porównujące wyniki i kolejność callbacków.

### 5. Pojazdy

Pojazdy Kotnika są ładowane z `mru_cars` i zależą od poprawnego cache/ORM.
Samo działanie `CreateVehicle` w adapterze nie potwierdza poprawnego wczytania
rekordów i późniejszych modyfikacji.

Do zrobienia:

- dodać licznik rekordów bazy, prób utworzenia i faktycznie istniejących
  elementów MTA;
- sprawdzić kolory `-1`, sireny, respawn `-1`, tuning, komponenty, paliwo,
  uszkodzenia, virtual world i interior;
- sprawdzić mapowanie identyfikatora bazy na identyfikator pojazdu SA-MP/MTA;
- przetestować komendy `/car`, `/auto`, `/mojeauta`, wejście, wyjście, śmierć
  pojazdu i zapis po restarcie.

### 6. Obrażenia, śmierć i BW

Kotnik opiera obrażenia na `weapon-config`, Pawn.RakNet, własnych callbackach
oraz rozbudowanym `OnPlayerDeath`. MTA ma inny model synchronizacji obrażeń.

Do zrobienia:

- zbudować jedno źródło prawdy dla zdrowia i pancerza po stronie serwera;
- odwzorować killer ID, weapon/reason, bodypart i obrażenia od pojazdu;
- zapewnić dokładnie jedno wywołanie `OnPlayerDeath`;
- wyłączyć lub zastąpić przechwyty RPC niemożliwe do odtworzenia w MTA;
- przetestować BW, dobicie, admin duty, samobójstwo, upadek, ogień, pojazd,
  eksplozję i respawn;
- sprawdzić wszystkie timery i zapis danych uruchamiane po śmierci.

### 7. Komendy YSI

Komendy są rejestrowane przez `YSI_Visual/y_commands`. Przekazanie tekstu do
`OnPlayerCommandText` nie wystarcza, jeżeli kolejność callbacków, stan logowania
lub dane wymagane przez komendę są niekompletne.

Do zrobienia:

- zapisać liczbę zarejestrowanych komend i ID komend krytycznych podczas startu;
- dodać śledzenie wejścia i wyniku `OnPlayerCommandText`;
- sprawdzić hooki `OnPlayerCommandReceived` i `OnPlayerCommandPerformed`;
- przygotować automatyczny zestaw testów komend dla zwykłego gracza i
  administratora;
- rozdzielić błąd parsera od błędu danych wymaganych przez komendę.

## Zalecana kolejność realizacji

1. Oddzielna instancja MTA i oddzielna baza Kotnika.
2. Migracja i walidator schematu bazy.
3. Testy kontraktowe BlueG MySQL/ORM.
4. Optymalizacja kolejki startowej klienta.
5. Pełny adapter streamera.
6. Pojazdy i ich zapis.
7. Obrażenia, śmierć oraz BW.
8. Audyt i automatyczne testy komend.
9. Testy regresji wszystkich systemów RP.
10. Dopiero po spełnieniu kryteriów — kontrolowane wdrożenie na hosting.

## Minimalny zestaw testów przed wdrożeniem

- start serwera bez błędów i ostrzeżeń bazy;
- wejście dwóch graczy jednocześnie;
- logowanie oraz wylogowanie istniejącej postaci;
- pełna mapa obiektów w kilku interiorach i virtual worlds;
- pojazdy publiczne, prywatne i frakcyjne;
- co najmniej 30 kluczowych komend;
- śmierć każdym głównym typem obrażeń oraz pełna ścieżka BW;
- restart z zachowaniem pozycji, ekwipunku i pojazdów;
- godzina jazdy po mapie bez wzrostu pamięci i bez mikroprzycięć;
- porównanie rezultatów z referencyjnym serwerem SA-MP.

## Zasady bezpieczeństwa wdrożeń

- przed każdym testem tworzyć archiwum plików i dump bazy;
- nigdy nie nadpisywać działającego MRP paczką Kotnika bez gotowego rollbacku;
- każdą paczkę oznaczać wersją, commitem i SHA-256;
- utrzymywać manifest plików oraz instrukcję odtworzenia;
- nie przechowywać haseł ani tokenów w dokumentacji lub repozytorium.
