# Pochodzenie binariów

- `king.dll`: artefakt zielonego workflow `Build patched MTA AMX module x86`,
  run `29326202108`, z kodu w `mta/vendor/mta-amx/amx-deps/src`.
- `ColAndreas.dll`: artefakt zielonego workflow `Build ColAndreas x86`, run
  `29317134248`, z dokładnego forka w `mta/vendor/colandreas`.
- `7z2601-x64.exe`: oficjalny instalator 7-Zip 26.01 z
  `https://www.7-zip.org/a/7z2601-x64.exe`. Służy wyłącznie do wypakowania
  przypiętego instalatora MTA; licencja 7-Zip jest wyświetlana i instalowana
  razem z jego plikami.

Instalator odrzuca każdy plik, którego SHA-256 nie zgadza się z
`SHA256SUMS.txt`.

