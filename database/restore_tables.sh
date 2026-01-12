#!/bin/bash
set -e

read -p "Podaj nazwę bazy danych do przywrócenia: " DB
read -p "Podaj katalog dumpa (np. dump_mojabaza_20260112_143000): " DUMPDIR

if [ ! -d "$DUMPDIR/schema" ] || [ ! -d "$DUMPDIR/data" ]; then
    echo "❌ Nieprawidłowa struktura dumpa. Wymagane: schema/ i data/"
    exit 1
fi

echo "➡️ Tworzę bazę jeśli nie istnieje..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB\`;"

echo "➡️ Import schematów tabel..."
for F in "$DUMPDIR/schema/"*.sql; do
    echo "  → $(basename "$F")"
    sudo mysql "$DB" < "$F"
done

echo "➡️ Import danych..."
for F in "$DUMPDIR/data/"*.sql; do
    echo "  → $(basename "$F")"
    sudo mysql "$DB" < "$F"
done

if [ -f "$DUMPDIR/routines.sql" ]; then
    echo "➡️ Import procedures / functions..."
    sudo mysql "$DB" < "$DUMPDIR/routines.sql"
else
    echo "ℹ️ Brak routines.sql — pomijam"
fi

echo "✅ Przywracanie zakończone."
