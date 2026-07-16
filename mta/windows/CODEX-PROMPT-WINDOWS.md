# Prompt dla Codexa na Windows

Skopiuj poniższy tekst do Codexa uruchomionego na komputerze Windows po
wypakowaniu paczki.

---

Masz przed sobą wypakowaną paczkę `M-RP-MTA-Windows`. Twoim zadaniem jest
zainstalować i uruchomić ją lokalnie na tym komputerze Windows, a następnie
potwierdzić działanie na podstawie pełnych logów. Wykonaj pracę samodzielnie do
końca; pytaj mnie tylko wtedy, gdy Windows wymaga ręcznego zatwierdzenia UAC lub
brakuje połączenia z internetem.

Zasady:

1. Nie zmieniaj przypiętych wersji, adresów ani sum SHA-256. Nie zamieniaj MTA
   x86 na x64 i nie podmieniaj `king.dll`, `ColAndreas.dll` ani AMX.
2. Najpierw sprawdź, czy paczka zawiera `payload\serverfiles.tar.gz`,
   `payload\mta\setup.ps1`, `payload\database`, `binaries\king.dll`,
   `binaries\ColAndreas.dll` i `binaries\7z2601-x64.exe`.
3. Sprawdź, czy jest co najmniej 10 GB wolnego miejsca i czy porty 3306 oraz
   22003 nie są zajęte. Jeśli 3306 jest zajęty przez obcy MySQL, nie zabijaj go
   bez mojej zgody — użyj wolnego portu przez parametr `-MysqlPort`.
4. Otwórz/wykorzystaj PowerShell z prawami administratora, ustaw tylko dla
   bieżącego procesu:
   `Set-ExecutionPolicy -Scope Process Bypass -Force`.
5. W katalogu paczki uruchom:
   `.\Install-MrucznikMTA.ps1 -InstallRoot "C:\M-RP-MTA"`.
   Instalator automatycznie wykona test runtime. Nie przerywaj go podczas
   pobierania, wypakowywania modeli ani inicjalizacji mapy.
6. Jeśli instalator zgłosi błąd sieciowy, ponów go. Jeśli zgłosi inny błąd,
   przeczytaj pełny stack trace oraz logi w `C:\M-RP-MTA\logs`, znajdź
   przyczynę i popraw wyłącznie lokalny skrypt instalacyjny. Nie omijaj
   sprawdzania sum i nie osłabiaj asercji testu.
7. Sukces uznaj dopiero, gdy `Test-MrucznikMTA.ps1` wypisze `TEST OK`, a log
   zawiera wszystkie frazy:
   - `Server started and is ready to accept connections!`
   - `Loading 'Mrucznik-RP.amx'`
   - `MYSQL: Polaczono sie z baza MySQL`
   - `REDIS: Po`
   - `Loading Map.` oraz `Loaded Map.`
   - `Wczytano 50 organizacji`
   oraz nie zawiera `FATAL ERROR MYSQL`, `Run time error`, błędu brakujących
   natywów ani awarii procesu.
8. Po zaliczonym teście uruchom serwer poleceniami:
   `cd C:\M-RP-MTA`
   `.\Start-MrucznikMTA.ps1`
9. Potwierdź, że proces `MTA Server.exe` działa, MySQL odpowiada i port 22003
   nasłuchuje. Podaj mi dokładną ścieżkę logów oraz informację, że w kliencie
   MTA mam połączyć się z `127.0.0.1:22003`.

Nie kończ na samej instalacji plików — wymagany jest działający proces serwera i
sprawdzony pełny start gamemodu.

---

