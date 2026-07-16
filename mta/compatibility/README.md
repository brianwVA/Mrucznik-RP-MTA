# Rejestr zgodności komend

Pliki `commands.json` i `commands.csv` są generowane bezpośrednio z kodu Pawn,
746 plików `command.json` oraz tablicy publicznych funkcji dokładnego AMX. Nie
należy edytować ich ręcznie.

Katalog rozróżnia 788 nazw znalezionych w całym drzewie źródeł od 746 komend
rzeczywiście wyeksportowanych jako `@yC_*` przez wydany `Mrucznik-RP.amx`
v2.9. Pole `compiled_runtime` jest prawdziwe wyłącznie dla komend działających
na bazowym serwerze SA-MP. Pozostałe 42 definicje są zachowane jako inwentarz
starego lub warunkowo wyłączonego kodu i nie są przedstawiane jako część
działającego portu.

Aktualizacja:

```shell
python3 mta/tools/build_command_catalog.py
```

Pole `runtime` opisuje aktualny sposób wykonania komendy. `amx-baseline` oznacza wykonywanie oryginalnej implementacji Pawn przez warstwę zgodności MTA AMX. `source-only-inactive` oznacza definicję nieobecną w wydanym AMX. Pole `native_mta_status` śledzi niezależny port Lua.

Pole `variants` zachowuje wszystkie konkurujące definicje tej samej nazwy. Jest to istotne m.in. dla dwóch różnych implementacji `/ustawcena` obecnych w kodzie źródłowym.
