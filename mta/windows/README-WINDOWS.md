# Mrucznik RP MTA — gotowa paczka Windows

Paczka instaluje lokalnie przetestowany port Mrucznika na 32-bitowym serwerze
MTA 1.6 oraz MySQL 5.7. Nie wymaga Visual Studio, CMake, vcpkg, Git ani Git LFS.
Wymaga 64-bitowego Windows 10/11, połączenia z internetem, PowerShell 5.1 lub
nowszego, około 10 GB wolnego miejsca i uruchomienia PowerShell jako
administrator.

## Instalacja

1. Wypakuj cały ZIP, np. do `C:\MRP-PACZKA`.
2. Otwórz PowerShell jako administrator.
3. Przejdź do wypakowanego katalogu i wykonaj:

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force
.\Install-MrucznikMTA.ps1
```

Dla pełnych map i interiorów podaj katalog GTA z zainstalowanym SA-MP 0.3.7
(wymagany jest także Python 3 w `PATH`):

```powershell
.\Install-MrucznikMTA.ps1 -GtaPath "C:\GTA San Andreas"
```

Instalator:

- sprawdza binaria `king.dll`, `ColAndreas.dll` i lokalny instalator 7-Zip;
- pobiera przypięte MTA 1.6 x86 i MySQL 5.7.44 oraz sprawdza SHA-256;
- tworzy i importuje bazę `mrucznik` z użytkownikiem `samp` / `funia`;
- instaluje dokładny AMX, filterscripty, pluginy, modele i zasoby MTA;
- z `-GtaPath` importuje pełny katalog obiektów SA-MP, w tym podłogi LSPD;
- nadaje wymagane ACL;
- wykonuje 70-sekundowy test pełnego startu gamemodu.

Domyślny katalog instalacji to `C:\Mrucznik-RP-MTA`. Można go zmienić:

```powershell
.\Install-MrucznikMTA.ps1 -InstallRoot "D:\Serwery\Mrucznik-RP-MTA"
```

## Uruchamianie

Po instalacji:

```powershell
cd C:\Mrucznik-RP-MTA
.\Start-MrucznikMTA.ps1
```

W kliencie MTA połącz się z `127.0.0.1:22003`. Komendy i czat wpisuje się
klawiszem `T` lub `F6`, tak jak w SA-MP. Konsola `F8` jest konsolą MTA.

Zatrzymanie serwera i MySQL:

```powershell
.\Stop-MrucznikMTA.ps1
```

Ponowny test runtime:

```powershell
.\Test-MrucznikMTA.ps1
```

Log testu znajduje się w
`C:\Mrucznik-RP-MTA\logs\mta-smoke-test.log`, a logi MTA w katalogu wskazanym
przez `serverRoot` w `C:\Mrucznik-RP-MTA\installation.json`.

## Ważne

- Nie instaluj serwera MTA x64 — warstwa AMX i pluginy wymagają x86.
- Port MySQL 3306 musi być wolny. Jeśli działa inny MySQL, zatrzymaj go albo
  przekaż instalatorowi inny `-MysqlPort`.
- Redis nie jest wymagany: używane przez gamemode API Redis jest zachowane przez
  trwały lokalny adapter SQLite z TTL.
- Sześć modeli DFF, których nie było w oryginalnym archiwum Mrucznika, pozostaje
  jedynym znanym brakiem materiału źródłowego.

