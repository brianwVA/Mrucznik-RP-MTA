# KotnikRP → MTA:SA — stan portu

Ten wariant jest przygotowywany wyłącznie do testów izolowanych. Nie wolno
instalować go na działającym serwerze Mrucznik MTA.

## Zweryfikowane wejście

- `KotnikRP-main` i `KotnikRP-main 2` są identyczne.
- Główny kod kompiluje się kompilatorem Pawn 3.10.10 w trybie Release.
- Wariant produkcyjny używa `-d2 -O2`; `Kotnik-RP.amx` ma 225 242 341 bajtów.
- SHA-256: `9f1c8c7b4b43126d4a850280f5656bf6a8f29252c774b0445a73d00acee64f3b`.
- Obraz AMX deklaruje 223 044 080 bajtów kodu, danych, stosu i sterty.
- Paczka modeli zawiera 209 modeli postaci i 37 modeli obiektów.
- Generator kopiuje 457 wymaganych plików DFF/TXD oraz 12 plików `scriptfiles`.
- Vice City nie jest częścią wariantu KotnikRP.

## Stan zgodności

Skompilowany AMX importuje 522 unikalne funkcje natywne (544 wpisy). Pełna
lista jest w `kotnik_natives.json`.

Najważniejsze różnice względem działającego Mrucznika:

1. Kotnik używa MySQL R41-4, w tym cache, zapytań asynchronicznych i ORM.
   Obecna warstwa MTA emuluje starszy interfejs MySQL R5. Funkcje o takich
   samych nazwach mają inne sygnatury, więc nie można ich bezpiecznie podpiąć
   bez osobnego adaptera R41.
2. Gamemode importuje funkcje Streamera dla obiektów, pickupów, checkpointów,
   aktorów, obszarów i etykiet 3D. Wariant ustawia limit 2000 widocznych
   elementów, więc przed testem graczy potrzebny jest test pamięci i churnu.
3. Kod zależy od PawnPlus (task/handle), Pawn.RakNet (PR_/BS_), Discord
   Connector, pawn-memory, ColAndreas, sscanf, Whirlpool, chrono i FileManager.
4. `config.json` odwołuje się do trzech filtrów skryptowych, których nie ma w
   przekazanej paczce: `animy`, `realtime` i `sobeitblock`.
5. Źródłowy `config.json` zawiera dane uwierzytelniające. Generator celowo go
   nie kopiuje. Przed jakimkolwiek publicznym uruchomieniem token Discord i
   hasło RCON należy zmienić.

## Zbudowany wariant ewaluacyjny

`build_kotnik_variant.py` tworzy oddzielne zasoby:

- `amx-kotnik` — prawdziwy `Kotnik-RP.amx` i jego `scriptfiles`;
- `mrp_models` — modele Kotnika bez katalogu Vice City.

Generator nie nadpisuje `amx-mrucznik`, nie kopiuje pluginów open.mp ani
sekretów i oznacza wynik jako `compatibility-audit-required`.

## Kolejność dalszych prac

1. Dodać osobny adapter MySQL R41-4 (cache, callbacki i ORM).
2. Uzupełnić prototypy i fallbacki PawnPlus, Pawn.RakNet, Discord i FileManager.
3. Uruchomić AMX w izolowanym serwerze testowym i zebrać pierwszą brakującą
   funkcję natywną bez dotykania produkcji.
4. Przetestować inicjalizację bazy z `db/server.sql`, `db/mru_groups.sql` i
   `db/drug_systems.sql`.
5. Dopiero po czystym starcie wykonać test obiektów, logowania i podstawowych
   komend.
