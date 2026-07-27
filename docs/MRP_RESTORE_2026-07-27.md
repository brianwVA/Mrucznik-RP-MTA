# Przywrócenie działającego M-RP — 2026-07-27

Ten dokument opisuje stan, do którego należy wrócić po eksperymentach
z KotnikRP. KotnikRP nie jest częścią aktywnego zestawu serwera.

## Pliki MTA

- Usługa ServerProject: `119342`
- Katalog produkcyjny: `/mods/deathmatch`
- Referencyjne archiwum MRP:
  `/svpj-archive-2026-07-27-07-23-46.zip`
- Diagnostyczne archiwum wycofanego KotnikRP:
  `/svpj-archive-2026-07-27-09-24-26.zip`

## Baza MRP

- Usługa ServerProject: `119343`
- Lokalny punkt przywracania:
  `backups/production-mrp-2026-07-27/database-current-v3.sql.gz`
- SHA-256:
  `0f27e13dfbddbcc3b2e12a8d0a9002d6b46af04389c6713f267062d9cb7f66b1`
- Po odtworzeniu potwierdzono 73 tabele, 1229 wykonanych instrukcji SQL,
  tabele `mru_konta`, `mru_personalization`, `mru_cars` i konto testowe.

## Jedyna różnica względem referencyjnego MRP

Kamera okna logowania korzysta z nieruchomego ujęcia KotnikRP:

```lua
setCameraMatrix(1288.0, -793.0, 109.0, 1288.0, -794.0, 109.0)
```

Zmiana jest ograniczona do klienta MTA i dialogu logowania MRP (`230`).
Po zamknięciu dialogu sterowanie kamerą wraca do gry.

- Commit: `6bcfdea62`
- Nakładka wdrożeniowa:
  `MRP-login-camera-kotnik-2026-07-27.zip`
- SHA-256 nakładki:
  `81ab302d95ae50f5ab2b8749dabcef5c0658935bf44bed6240b644b97597bdc0`

## Potwierdzony start

Po odtworzeniu panel potwierdził stan online oraz:

- uruchomienie warstwy AMX i wymaganych pluginów,
- mapę `M-RP v2.9`,
- załadowanie `Mrucznik-RP.amx`,
- uruchomienie zasobu `amx-mrucznik`.

MRP ma długi etap inicjalizacji. W logu występują ostrzeżenia
`mrp_databases.lua:69` i brak prawa `startResource` dla `mrp_bridge`,
ale nie zatrzymują uruchomienia `amx-mrucznik`. Nie należy mieszać ich
z pracami nad KotnikRP.

## Kolejność kolejnego przywracania

1. Zatrzymać usługę MTA.
2. Zachować diagnostyczną kopię zastępowanego stanu.
3. Odtworzyć bazę MRP z podanego zrzutu.
4. Rozpakować referencyjne archiwum MRP do `/`.
5. Nałożyć paczkę kamery logowania do `/`.
6. Uruchomić usługę i poczekać na `startResource: Resource
   'amx-mrucznik' started`.
7. Sprawdzić logowanie gracza, kamerę, pojazdy, obiekty i komendy.
