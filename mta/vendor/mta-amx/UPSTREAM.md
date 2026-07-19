# Pochodzenie warstwy MTA AMX

- Repozytorium: `https://github.com/multitheftauto/amx`
- Gałąź: `develop`
- Commit: `6a55e642f88de29531c1c6cc57516e16a94247a1`
- Licencja: zlib, zachowana w pliku `LICENSE`

Kod został przypięty do wskazanego commita, aby zachowanie portu było powtarzalne. Nie jest przedstawiany jako oficjalna, zmodyfikowana dystrybucja MTA AMX.

## Lokalne modyfikacje

- obsługa identyfikatorów skinów SA-MP 0.3.DL przez zasób `mrp_models`;
- zachowanie oryginalnego ID skina w `mrp:customSkin` przy ustawianiu oraz odradzaniu gracza;
- rejestracja obiektów 0.3.DL z `AddSimpleModel` i zachowanie ich ujemnych ID logicznych;
- obsługa modeli pedów, pojazdów i obiektów w textdrawach przez Object Preview;
- edytor doczepionych obiektów z podglądem, zapisem i callbackiem Pawn;
- przekazywanie materiałów obiektów gracza do zasobu `mrp_models`;
- mapowanie raportu policyjnego, trybu kamery, premii za stunt, nagrywania gracza,
  statystyk sieci i statusu NPC na odpowiedniki MTA;
- bezpieczne odpowiedniki natywów pobierania modeli, kontroli klienta i Pawn.RakNet,
  których adresy procesu oraz protokół nie istnieją w MTA.
- statyczne dołączenie runtime Pawn AMX do `king.so`, wymagane przez MTA 1.5.9,
  które nie eksportuje funkcji `amx_*` udostępnianych przez MTA 1.6.
- pominięcie opcjonalnych właściwości świata z MTA 1.6 podczas pracy na 1.5.9.
