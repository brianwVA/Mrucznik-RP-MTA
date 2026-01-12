#!/bin/bash

read -p "Podaj nazwę bazy danych: " DB

if ! sudo mysql -e "USE \`$DB\`;" 2>/dev/null; then
    echo "❌ Baza danych '$DB' nie istnieje lub brak dostępu."
    exit 1
fi

OUTDIR="dump_${DB}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTDIR/schema" "$OUTDIR/data"

echo "📦 Zrzuty będą zapisane w: $OUTDIR"
echo

# listy filtrów (bez danych)
NO_DATA_TABLES=(
actions
mru_bany
mru_diseases
mru_graffiti
mru_gspanel
mru_konta
mru_kontakty
mru_last_logons
mru_liderzy
mru_logowania
mru_opisy
mru_personalization
mru_player_cooking
mru_playeritems
mru_premium
mru_premium_skins
mru_ryby
mru_uprawnienia
)

# lista wszystkich tabel i widoków
OBJECTS=$(sudo mysql -N -e "SHOW FULL TABLES FROM \`$DB\`;")

while read -r NAME TYPE; do
    # knex*
    if [[ "$NAME" == knex* ]]; then
        continue
    fi

    COUNT="-"
    if [[ "$TYPE" == "BASE TABLE" ]]; then
        COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM \`$DB\`.\`$NAME\`;")
    fi

    echo "Obiekt: $NAME | typ: $TYPE | wiersze: $COUNT"

    echo "  → zapis schematu..."
    sudo mysqldump \
        --no-data \
        --skip-triggers \
        --set-gtid-purged=OFF \
        "$DB" "$NAME" > "$OUTDIR/schema/${NAME}_schema.sql"

    # jeśli to VIEW → nie dumpujemy danych
    if [[ "$TYPE" == "VIEW" ]]; then
        echo "  ⏭ widok — dane pominięte"
        echo
        continue
    fi

    SKIP_DATA=false

    # dokładne nazwy
    for X in "${NO_DATA_TABLES[@]}"; do
        if [[ "$NAME" == "$X" ]]; then
            SKIP_DATA=true
            break
        fi
    done

    # wyjątek: mru_cars (tylko ownertype 4,5,6)
    if [[ "$NAME" == "mru_cars" ]]; then
        echo "  → zapis danych (ownertype IN 4,5,6)..."
        sudo mysqldump --no-create-info --where="ownertype IN (4,5,6)" \
            "$DB" "$NAME" > "$OUTDIR/data/${NAME}_data.sql"
        echo "  ✔ zapisano"
        echo
        continue
    fi

    if [[ "$SKIP_DATA" == true ]]; then
        echo "  ⏭ pominięto dane"
        echo
        continue
    fi

    echo "  → zapis danych..."
    sudo mysqldump --no-create-info "$DB" "$NAME" > "$OUTDIR/data/${NAME}_data.sql"
    echo "  ✔ zapisano"
    echo

done <<< "$OBJECTS"

echo "  → zrzut procedur i funkcji..."
sudo mysqldump --no-data --no-create-info --routines --triggers --databases "$DB" > "$OUTDIR/routines.sql"
echo "  ✔ zapisano"

echo "✅ Gotowe."

