# M-RP dla MTA:SA

Port zachowuje oryginalny gamemode Pawn jako wykonywalną bazę zgodności wewnątrz MTA 1.6. Równoległy zasób `mrp_bridge` implementuje różnice silników i jest miejscem stopniowego przenoszenia funkcji do natywnego Lua bez zmiany zachowania widocznego dla gracza.

## Wymagania wersji bazowej

- MTA:SA Server 1.6, Windows x86 (32-bit)
- PowerShell 5.1 lub nowszy
- repozytorium pobrane wraz z Git LFS
- MySQL 5.7 zgodny z dostarczonym schematem i API starego pluginu R5
- uprawnienia administratora do cichej instalacji oficjalnego Visual C++ 2010 x86

Wersja x86 jest obecnie wymagana przez wydanie binarne modułu MTA AMX. Nie należy traktować jej jako finalnej platformy produkcyjnej; służy do testów zgodności podczas natywnej migracji Lua.

## Instalacja bazy zgodności

Najpierw uruchom gotową bazę deweloperską:

```shell
docker compose -f mta/docker-compose.database.yml up -d
```

```powershell
.\mta\setup.ps1 `
  -MtaServerRoot "C:\Program Files (x86)\MTA San Andreas 1.6\server" `
  -ColAndreasDll ".\artifacts\ColAndreas.dll" `
  -KingDll ".\artifacts\king.dll" `
  -MysqlHost "127.0.0.1" -MysqlUser "samp" `
  -MysqlDatabase "mrucznik" -MysqlPassword "funia" `
  -RedisHost "127.0.0.1" -RedisPort 6379 `
  -GtaPath "C:\GTA San Andreas"
```

DLL ColAndreas jest artefaktem workflow `Build ColAndreas x86`; lokalnie można ją
utworzyć przez `mta/build-colandreas.ps1`. Zmodyfikowany moduł `king.dll` jest
artefaktem workflow `Build patched MTA AMX module x86` i lokalnie powstaje przez
`mta/build-amx.ps1`. Ma zwiększony, wymagany przez pełny katalog Mrucznika limit
natywów Pawn. Instalator weryfikuje sumy SHA-256
warstwy AMX, oficjalnego Visual C++ 2010 x86 wymaganego przez profiler, zasobu
Object Preview 0.7.0 i wszystkich gotowych pluginów, wypakowuje dokładny
`Mrucznik-RP.amx` z oryginalnego archiwum Git LFS oraz kopiuje `scriptfiles`,
cztery aktywne filterscripty, pełny łańcuch dynamicznych skryptów `fixes.inc`,
bazę kolizji i modele DFF dla ColAndreas, 81 skinów,
obiekt SA-MP 19377 z dokładnym DFF/TXD/COL oraz komplet 4426 plików Vice City.
Parametr `-GtaPath` dodatkowo importuje pełny katalog obiektów SA-MP 0.3.7
(DFF, TXD i COL); jest wymagany dla rozbudowanych map, między innymi obu
interiorów LSPD. Pliki są pobierane z lokalnej, legalnie posiadanej instalacji
GTA/SA-MP i dlatego nie są przechowywane w repozytorium.

Katalog Vice City jest generowany deterministycznie z `vicecity_map.pwn`:

```powershell
python .\mta\tools\build_vc_model_catalog.py `
  --source .\gamemodes\modules\vicecity\vicecity_map.pwn `
  --assets C:\Mrucznik-RP-MTA\mta-distribution\server\mods\deathmatch\resources\mrp_models\assets\vc4samp `
  --output .\mta\server\mods\deathmatch\resources\mrp_models\shared\vc_objects.lua
```

Aktualna paczka ładuje 2747 z 2754 rejestrowanych definicji IDE. Siedem
używanych obiektów lotniska i doków korzysta z zgodnych nazw paczki GTA United
(`subcratesvc.txd` i `docksvc.txd`). Cztery definicje źródłowe nie mają plików
w archiwum: trzy nie występują na mapie, a `man_dooropen.dff` występuje raz jako
otwarte drzwi w interiorze rezydencji. Walidator pilnuje liczby modeli i obu
naprawionych słowników tekstur.

Publiczne hasło `funia` służy wyłącznie
lokalnej bazie deweloperskiej; dane produkcyjne i tokeny nie są wpisywane do
repozytorium.

Instalator sam pobiera zgodne pluginy wymienione w `mta/plugins.lock.json` i
wpisuje je do ustawienia `amx.plugins`. Nieutrzymywane binaria MySQL R5 i
pawn-redis zastępuje `mrp_databases.lua`: zachowuje ich API oczekiwane przez
AMX, a używa sterownika MySQL MTA i trwałego magazynu key-value z TTL.
Parametry MySQL są zapisywane wyłącznie
w instalacji serwera MTA. Ręcznie trzeba zezwolić zasobowi `amx` na żądane
prawa ACL, a następnie zrestartować `amx` i `amx-mrucznik`. Gamemode
Warstwa AMX oraz cztery aktywne filterscripty są skonfigurowane do
automatycznego startu; mapę `amx-mrucznik` uruchamia mapmanager/most dopiero po
gotowości AMX, a `fs-count-A`…`fs-count-P` i `callbackfix` ładuje dynamicznie
oryginalny kod Pawn. Pawn.RakNet i
`bscrashfix`, które ingerują w proces lub protokół serwera SA-MP, są zastąpione
przez warstwę zgodności i zabezpieczenia MTA.

Komendy i zwykły czat wpisuje się tak jak w SA-MP, klawiszem `T` lub `F6`.
Własny pasek wejściowy przekazuje pełną linię bezpośrednio do oryginalnych
callbacków Pawn. Jest to konieczne dla zachowania dokładnych nazw `/help`,
`/login` i `/say`, które w standardowym polu MTA są zarezerwowane przez klienta
lub serwer. Konsola `F8` pozostaje konsolą techniczną MTA.

## Kontrola kompletności komend

```shell
python3 mta/tools/check_command_catalog.py
python3 mta/tools/build_native_catalog.py
```

Pierwszy test porównuje zatwierdzony katalog z aktualnym kodem Pawn i tablicą
publicznych handlerów dokładnego AMX. Repozytorium zawiera 787 nazw komend, z
których 745 jest faktycznie aktywnych w wydaniu v2.9; 42 stare lub warunkowe
definicje źródłowe są raportowane osobno. Drugi test odczytuje
tablicę 598 importów natywnych głównego AMX i wszystkich 21 filterscriptów
bezpośrednio z dokładnych plików w archiwum Git LFS.
Brak choć jednej aktywnej komendy, aliasu, grupy uprawnień albo wymaganego natywu powoduje
błąd walidacji projektu.
