# Mrucznik Role Play dla MTA:SA

Port zachowuje oryginalny gamemode Pawn jako wykonywalną bazę zgodności wewnątrz MTA 1.6. Równoległy zasób `mrp_bridge` implementuje różnice silników i jest miejscem stopniowego przenoszenia funkcji do natywnego Lua bez zmiany zachowania widocznego dla gracza.

## Wymagania wersji bazowej

- MTA:SA Server 1.6, Windows x86 (32-bit)
- PowerShell 5.1 lub nowszy
- repozytorium pobrane wraz z Git LFS
- MySQL zgodny z dostarczonym schematem

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
  -MysqlHost "127.0.0.1" -MysqlUser "samp" `
  -MysqlDatabase "mrucznik" -MysqlPassword "funia" `
  -RedisHost "127.0.0.1" -RedisPort 6379
```

DLL ColAndreas jest artefaktem workflow `Build ColAndreas x86`; lokalnie można ją
utworzyć przez `mta/build-colandreas.ps1`. Instalator weryfikuje sumy SHA-256
warstwy AMX, zasobu Object Preview 0.7.0 i wszystkich gotowych pluginów, wypakowuje dokładny
`Mrucznik-RP.amx` z oryginalnego archiwum Git LFS oraz kopiuje `scriptfiles`,
cztery aktywne filterscripty, 81 skinów i komplet 4426 plików Vice City. Publiczne hasło `funia` służy wyłącznie
lokalnej bazie deweloperskiej; dane produkcyjne i tokeny nie są wpisywane do
repozytorium.

Instalator sam pobiera zgodne pluginy wymienione w `mta/plugins.lock.json` i
wpisuje je do ustawienia `amx.plugins`. Parametry MySQL są zapisywane wyłącznie
w instalacji serwera MTA. Ręcznie trzeba zezwolić zasobowi `amx` na żądane
prawa ACL, a następnie zrestartować `amx` i `amx-mrucznik`. Gamemode
`amx-mrucznik` oraz cztery aktywne filterscripty są skonfigurowane do
automatycznego startu. Pawn.RakNet i
`bscrashfix`, które ingerują w proces lub protokół serwera SA-MP, są zastąpione
przez warstwę zgodności i zabezpieczenia MTA.

## Kontrola kompletności komend

```shell
python3 mta/tools/check_command_catalog.py
python3 mta/tools/build_native_catalog.py
```

Pierwszy test porównuje zatwierdzony katalog z aktualnym kodem Pawn. Drugi odczytuje
tablicę 579 importów natywnych głównego AMX i czterech filterscriptów bezpośrednio
z dokładnych plików w archiwum Git LFS.
Brak choć jednej komendy, aliasu, grupy uprawnień albo wymaganego natywu powoduje
błąd walidacji projektu.
