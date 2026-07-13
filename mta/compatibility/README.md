# Rejestr zgodności komend

Pliki `commands.json` i `commands.csv` są generowane bezpośrednio z kodu Pawn oraz 745 plików `command.json`. Nie należy edytować ich ręcznie.

Aktualizacja:

```shell
python3 mta/tools/build_command_catalog.py
```

Pole `runtime` opisuje aktualny sposób wykonania komendy. `amx-baseline` oznacza wykonywanie oryginalnej implementacji Pawn przez warstwę zgodności MTA AMX. Pole `native_mta_status` śledzi niezależny port Lua.

Pole `variants` zachowuje wszystkie konkurujące definicje tej samej nazwy. Jest to istotne m.in. dla dwóch różnych implementacji `/ustawcena` obecnych w kodzie źródłowym.
