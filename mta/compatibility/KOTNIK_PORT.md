# KotnikRP → MTA:SA — stan portu

Ten wariant jest przygotowywany wyłącznie do testów izolowanych. Nie wolno
instalować go na działającym serwerze Mrucznik MTA.

## Zweryfikowane wejście i gałąź integracyjna

- `KotnikRP-main` i `KotnikRP-main 2` są identyczne.
- Kod portu z wcześniejszej gałęzi Kotnika został połączony z aktualnym,
  działającym runtime MTA i poprawkami streamingu na osobnej gałęzi
  `codex/kotnik-mta-integration`.
- Wejście `Kotnik-RP-MTA.pwn` kompiluje się kompilatorem Pawn 3.10.10 Release
  z profilem debug zgodnym z mostkiem MTA.
- Zweryfikowany `Kotnik-RP-MTA.amx` ma 232 810 563 bajty.
- Każda paczka dostaje własny `MANIFEST.sha256`. Profil `-d3` zapisuje czas
  kompilacji w sekcji debug, dlatego hash AMX zmienia się pomiędzy poprawnymi
  buildami mimo identycznego kodu wykonywalnego.
- Paczka modeli zawiera 209 modeli postaci i 37 modeli obiektów.
- Generator kopiuje 457 wymaganych plików DFF/TXD oraz 12 plików `scriptfiles`.
- Vice City nie jest częścią wariantu KotnikRP.

## Stan zgodności

Skompilowany wariant MTA importuje 515 unikalnych funkcji natywnych
(537 wpisów). Pełny katalog należy odświeżać z gotowego
`Kotnik-RP-MTA.amx`.

Wcześniejszy port zawiera już adaptery obiektów, eventów, kont i bazy danych
oraz ładowanie pluginów Kotnika. Nadal wymagają sprawdzenia:

1. MySQL R41-4 (cache, zapytania asynchroniczne i ORM) musi przejść test
   inicjalizacji na izolowanej bazie. Samo dopasowanie nazw funkcji nie
   potwierdza zgodności ich sygnatur ani callbacków.
2. Gamemode importuje funkcje Streamera dla obiektów, pickupów, checkpointów,
   aktorów, obszarów i etykiet 3D. Wariant ustawia limit 2000 widocznych
   elementów, więc przed testem graczy potrzebny jest test pamięci i churnu.
3. Docelowy hosting ładuje crashdetect, sscanf, Whirlpool, pawn-memory,
   requests, profiler, ColAndreas i pozostałe wymagane pluginy. Chrono
   (`Now`, `TimeFormat`) oraz używane przez Kotnika funkcje FileManagera
   (`file_write`, `dir_create`) są obsługiwane bezpośrednio przez adapter Lua,
   aby nie uzależniać serwera od starych binariów. Dokładny zestaw 29
   natywnych funkcji MySQL R41 importowanych przez AMX jest obsługiwany przez
   adapter Lua korzystający z wbudowanego sterownika MySQL MTA. Obejmuje
   zapytania synchroniczne i callbacki, cache oraz ORM używany do danych
   gracza; dzięki temu Kotnik nie ładuje niezgodnego `mysql.so`. Streamer musi
   być uruchamiany dokładnie w wersji 2.9.6 zgodnej z dołączonym include.
   Discord Connector jest celowo zastąpiony bezpiecznymi stubami.
4. `config.json` odwołuje się do trzech filtrów skryptowych, których nie ma w
   przekazanej paczce: `animy`, `realtime` i `sobeitblock`.
5. Źródłowy `config.json` zawiera dane uwierzytelniające. Generator celowo go
   nie kopiuje. Przed jakimkolwiek publicznym uruchomieniem token Discord i
   hasło RCON należy zmienić.

## Zbudowany wariant ewaluacyjny

`build_kotnik_variant.py` tworzy oddzielne zasoby:

- `amx-kotnik` — wariant `Kotnik-RP-MTA.amx` i jego `scriptfiles`;
- `mrp_models` — modele Kotnika bez katalogu Vice City.

Generator nie nadpisuje `amx-mrucznik`, nie kopiuje pluginów open.mp ani
sekretów i oznacza wynik jako `compatibility-audit-required`.

## Kolejność dalszych prac

1. Uruchomić AMX w izolowanym serwerze testowym i zebrać pierwszą brakującą
   funkcję natywną bez dotykania produkcji.
2. Przetestować inicjalizację bazy z `db/server.sql`, `db/mru_groups.sql` i
   `db/drug_systems.sql`.
3. Zweryfikować ładowanie pluginów na docelowym runtime Linux i poprawić
   wyłącznie te adaptery, które zgłosi log startowy.
4. Dopiero po czystym starcie wykonać test obiektów, logowania i podstawowych
   komend.
