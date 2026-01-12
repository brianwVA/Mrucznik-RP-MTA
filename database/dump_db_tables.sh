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

# listy filtrów
NO_DATA_TABLES=(
actions
mru_bany
mru_discord
mru_diseases
mru_graffiti
mru_gspanel
mru_konta
mru_kontakty
mru_last_logons
mru_liderzy
mru_logowania
mru_opisy
mru_partie_akcje
mru_partie
mru_partie_hasla
mru_partie_podpisy
mru_partie_m
mru_personalization
mru_player_cooking
mru_playeritems
mru_pp
mru_premium
mru_premium_skins
mru_premiumcode
mru_premiumsales
mru_prop_owners
mru_ryby
mru_uprawnienia
mru_weaponskill
mru_wybory
)

TABLES=$(sudo mysql -N -e "SHOW TABLES FROM \`$DB\`;")

for T in $TABLES; do
    COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM \`$DB\`.\`$T\`;")
    echo "Tabela: $T | wiersze: $COUNT"

    echo "  → zapis schematu..."
    sudo mysqldump --no-data "$DB" "$T" > "$OUTDIR/schema/${T}_schema.sql"

    SKIP_DATA=false

    # knex* i view*
    if [[ "$T" == knex* ]] || [[ "$T" == view* ]]; then
        SKIP_DATA=true
    fi

    # dokładne nazwy
    for X in "${NO_DATA_TABLES[@]}"; do
        if [[ "$T" == "$X" ]]; then
            SKIP_DATA=true
            break
        fi
    done

    # wyjątek: mru_cars (tylko ownertype 4,5,6)
    if [[ "$T" == "mru_cars" ]]; then
        echo "  → zapis danych (ownertype IN 4,5,6)..."
        sudo mysqldump --no-create-info --where="ownertype IN (4,5,6)" "$DB" "$T" > "$OUTDIR/data/${T}_data.sql"
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
    sudo mysqldump --no-create-info "$DB" "$T" > "$OUTDIR/data/${T}_data.sql"
    echo "  ✔ zapisano"
    echo
done

echo "  → zrzut procedur i funkcji..."
sudo mysqldump --no-data --no-create-info --routines --triggers --databases "$DB" > "$OUTDIR/routines.sql"
echo "  ✔ zapisano"

echo "✅ Gotowe."