

#include <YSI_Coding\y_hooks>

//------------------<[ Funkcje: ]>-------------------

stock Warehouse_Refresh(whid)
{
    if(whid < 0 || whid >= gTotalWarehouses) return 0;
    if(gWarehouseData[whid][wh_sql_id] <= 0) return 0;
    
    // Usun stare elementy
    if(IsValidDynamic3DTextLabel(gWarehouseData[whid][wh_label]))
        DestroyDynamic3DTextLabel(gWarehouseData[whid][wh_label]);
    
    if(IsValidDynamicPickup(gWarehouseData[whid][wh_pickup]))
        DestroyDynamicPickup(gWarehouseData[whid][wh_pickup]);
    
    if(IsValidDynamicArea(gWarehouseData[whid][wh_area]))
        DestroyDynamicArea(gWarehouseData[whid][wh_area]);
    
    // Utworz nowy obszar
    gWarehouseData[whid][wh_area] = CreateDynamicCircle(
        gWarehouseData[whid][wh_ent_pos][0], 
        gWarehouseData[whid][wh_ent_pos][1], 
        3.0);
    
    new szString[300];
    
    if(gWarehouseData[whid][wh_org_owner] != -1)
    {
        // Magazyn nalezacy do organizacji
        gWarehouseData[whid][wh_pickup] = CreateDynamicPickup(
            WAREHOUSE_PICKUP_MODEL, 1, 
            gWarehouseData[whid][wh_ent_pos][0], 
            gWarehouseData[whid][wh_ent_pos][1], 
            gWarehouseData[whid][wh_ent_pos][2], 
            gWarehouseData[whid][wh_virtualworld], gWarehouseData[whid][wh_interior]);
        
        new orgName[64];
        if(gWarehouseData[whid][wh_org_owner] > 0 && gWarehouseData[whid][wh_org_owner] < MAX_GROUPS && GroupInfo[gWarehouseData[whid][wh_org_owner]][g_UID] > 0)
            format(orgName, sizeof(orgName), "%s", GroupInfo[gWarehouseData[whid][wh_org_owner]][g_Name]);
        else
            format(orgName, sizeof(orgName), "Organizacja #%d", gWarehouseData[whid][wh_org_owner]);
        
        format(szString, sizeof(szString), 
            "{FFFFFF}[ MAGAZYN #%d ]\n{00FF00}Wlasciciel: {FFFFFF}%s\n{FFFFFF}Wejscie: Nacisnij {00FF00}Y",
            whid, orgName);
    }
    else
    {
        // Magazyn na sprzedaz
        gWarehouseData[whid][wh_pickup] = CreateDynamicPickup(
            WAREHOUSE_PICKUP_MODEL, 1, 
            gWarehouseData[whid][wh_ent_pos][0], 
            gWarehouseData[whid][wh_ent_pos][1], 
            gWarehouseData[whid][wh_ent_pos][2], 
            gWarehouseData[whid][wh_virtualworld], gWarehouseData[whid][wh_interior]);
        
        format(szString, sizeof(szString), 
            "{FFFFFF}Magazyn\n{00FF00}Wlasciciel: {FFFFFF}Na sprzedaz\n{00FF00}Cena: {FFFFFF}$%d\n{FFFFFF}Komenda: {00FF00}/kupmagazyn",
            gWarehouseData[whid][wh_price]);
    }
    
    gWarehouseData[whid][wh_label] = CreateDynamic3DTextLabel(szString, 0xFFFFFFFF, 
        gWarehouseData[whid][wh_ent_pos][0], 
        gWarehouseData[whid][wh_ent_pos][1], 
        gWarehouseData[whid][wh_ent_pos][2], 
        8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
    
    // Utworz pickup i label przy wyjsciu wewnatrz magazynu
    CreateDynamicPickup(1318, 1, 1405.3120, -8.2928, 1000.9130, 2000 + whid, 1);
    CreateDynamic3DTextLabel("{FFFFFF}[ WYJSCIE ]\n{00FF00}Nacisnij Y", 0xFFFFFFFF, 
        1405.3120, -8.2928, 1000.9130, 5.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 
        2000 + whid, 1);
    
    return 1;
}

stock Warehouse_GetNearest(playerid, Float:range = 3.0)
{
    for(new i = 0; i < gTotalWarehouses; i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, range, 
            gWarehouseData[i][wh_ent_pos][0], 
            gWarehouseData[i][wh_ent_pos][1], 
            gWarehouseData[i][wh_ent_pos][2]))
            return i;
    }
    return -1;
}

stock Warehouse_GetByArea(playerid)
{
    for(new i = 0; i < gTotalWarehouses; i++)
    {
        if(IsPlayerInDynamicArea(playerid, gWarehouseData[i][wh_area]))
            return i;
    }
    return -1;
}

stock Warehouse_GetPlayerWarehouse(playerid)
{
    // Jesli zmienna jest ustawiona, uzyj jej
    if(gPlayerInWarehouse[playerid] != -1)
        return gPlayerInWarehouse[playerid];
    
    // W przeciwnym razie sprawdz VW gracza (np. po reconnect)
    new vw = GetPlayerVirtualWorld(playerid);
    if(vw >= 2000 && vw < 3000)
    {
        new whid = vw - 2000;
        if(whid >= 0 && whid < gTotalWarehouses)
        {
            gPlayerInWarehouse[playerid] = whid;
            return whid;
        }
    }
    return -1;
}

stock Warehouse_ProcessCrateDrop(playerid, crateType, whid)
{
    if(whid < 0 || whid >= gTotalWarehouses) return 0;
    if(gWarehouseData[whid][wh_org_owner] == -1) return 0;
    
    switch(crateType)
    {
        case CRATE_TYPE_FABRICS:
        {
            gWarehouseData[whid][wh_fabrics] += 5;
            SendClientMessage(playerid, COLOR_GREEN, "* Dostarczyles 5 tkanin do magazynu.");
        }
        case CRATE_TYPE_METALS:
        {
            gWarehouseData[whid][wh_metals] += 5;
            SendClientMessage(playerid, COLOR_GREEN, "* Dostarczyles 5 metali do magazynu.");
        }
        case CRATE_TYPE_MATS:
        {
            gWarehouseData[whid][wh_mats] += 5;
            SendClientMessage(playerid, COLOR_GREEN, "* Dostarczyles 5 materialow do magazynu.");
        }
        case CRATE_TYPE_CHEMICALS:
        {
            // Losowy rozklad chemikaliow (lacznie 10 jednostek)
            new acetone = random(4) + 1;  // 1-4
            new toluene = random(4) + 1;  // 1-4
            new lithium = random(3) + 1;  // 1-3
            new sodium = random(3) + 1;   // 1-3
            new calcium = random(3) + 1;  // 1-3
            
            gWarehouseData[whid][wh_acetone] += acetone;
            gWarehouseData[whid][wh_toluene] += toluene;
            gWarehouseData[whid][wh_lithium] += lithium;
            gWarehouseData[whid][wh_sodium] += sodium;
            gWarehouseData[whid][wh_calcium] += calcium;
            
            va_SendClientMessage(playerid, COLOR_GREEN, "* Dostarczyles chemikalia do magazynu:");
            va_SendClientMessage(playerid, COLOR_WHITE, "  Aceton: +%d | Toluen: +%d | Lit: +%d | Sod: +%d | Wapno: +%d", 
                acetone, toluene, lithium, sodium, calcium);
        }
        default:
            return 0;
    }
    
    // Jesli mamy rowna ilosc metali i tkanin - tworzymy gunparts
    if(gWarehouseData[whid][wh_metals] > 0 && gWarehouseData[whid][wh_fabrics] > 0)
    {
        new minAmount = (gWarehouseData[whid][wh_metals] < gWarehouseData[whid][wh_fabrics]) 
            ? gWarehouseData[whid][wh_metals] 
            : gWarehouseData[whid][wh_fabrics];
        
        if(minAmount >= 5)
        {
            new parts = minAmount / 5 * 5; // Zaokraglenie w dol do wielokrotnosci 5
            gWarehouseData[whid][wh_gunparts] += parts;
            gWarehouseData[whid][wh_fabrics] -= parts;
            gWarehouseData[whid][wh_metals] -= parts;
            
            va_SendClientMessage(playerid, COLOR_GREEN, "* Wytworzono %d czesci broni z tkanin i metali.", parts);
        }
    }
    
    // Sprawdz czy gracz realizuje kontrakt na ten magazyn
    Contracts_Deliver(playerid, crateType);
    
    Warehouse_Refresh(whid);
    Warehouse_Save(whid);
    
    return 1;
}

stock Warehouse_ShowMenu(playerid)
{
    new whid = Warehouse_GetNearest(playerid);
    if(whid == -1)
    {
        whid = Warehouse_GetPlayerWarehouse(playerid);
        if(whid == -1)
            return sendErrorMessage(playerid, "Nie jestes przy zadnym magazynie.");
    }
    
    if(gWarehouseData[whid][wh_org_owner] == -1)
    {
        // Magazyn na sprzedaz
        new szDialog[200];
        format(szDialog, sizeof(szDialog), 
            "{FFFFFF}Ten magazyn jest na sprzedaz.\n{00FF00}Cena: {FFFFFF}$%d\n\n{FFFFFF}Czy chcesz kupic ten magazyn?",
            gWarehouseData[whid][wh_price]);
        
        ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_BUY, DIALOG_STYLE_MSGBOX, 
            "Kup magazyn", szDialog, "Kup", "Anuluj");
    }
    else
    {
        // Pokaz menu magazynu
        new szDialog[700];
        new capacity = Warehouse_GetCapacity(whid);
        new used = Warehouse_GetTotalResources(whid);
        
        format(szDialog, sizeof(szDialog), \
            "{00FF00}Magazyn Tier %d {FFFFFF}| Pojemnosc: {00FF00}%d/%d\n\n"\
            "{00FF00}Zasoby:\n"\
            "{FFFFFF}Tkaniny: {00FF00}%d {FFFFFF}| Metale: {00FF00}%d {FFFFFF}| Materialy: {00FF00}%d {FFFFFF}| GP: {00FF00}%d\n"\
            "{FFFFFF}Aceton: {00FF00}%d {FFFFFF}| Toluen: {00FF00}%d {FFFFFF}| Lit: {00FF00}%d\n"\
            "{FFFFFF}Sod: {00FF00}%d {FFFFFF}| Wapno: {00FF00}%d\n\n"\
            "{FFFFFF}Dostepne opcje:\n"\
            "Craftowanie broni\n"\
            "Wyjmij materialy\n"\
            "Wyjmij chemikalia\n"\
            "Ulepsz magazyn",\
            gWarehouseData[whid][wh_tier],
            used, capacity,
            gWarehouseData[whid][wh_fabrics],
            gWarehouseData[whid][wh_metals],
            gWarehouseData[whid][wh_mats],
            gWarehouseData[whid][wh_gunparts],
            gWarehouseData[whid][wh_acetone],
            gWarehouseData[whid][wh_toluene],
            gWarehouseData[whid][wh_lithium],
            gWarehouseData[whid][wh_sodium],
            gWarehouseData[whid][wh_calcium]);
        
        ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_MENU, DIALOG_STYLE_LIST, 
            "Magazyn", szDialog, "Wybierz", "Zamknij");
        
        SetPVarInt(playerid, "Warehouse_Selected", whid);
    }
    
    return 1;
}

stock Warehouse_ShowCraftMenu(playerid)
{
    new whid = Warehouse_GetPlayerWarehouse(playerid);
    if(whid == -1)
    {
        whid = Warehouse_GetNearest(playerid);
        if(whid == -1)
            return sendErrorMessage(playerid, "Nie jestes w zadnym magazynie.");
    }
    
    new szDialog[512], szTitle[64];
    format(szTitle, sizeof(szTitle), "Craftowanie broni (Czesci: %d)", gWarehouseData[whid][wh_gunparts]);
    format(szDialog, sizeof(szDialog), 
        "{FFFFFF}Zasoby: Tkaniny: {00FF00}%d{FFFFFF}, Metale: {00FF00}%d{FFFFFF}, Czesci: {00FF00}%d\n\n\
        Sniper (25 czesci)\n\
        M4 (10 czesci)\n\
        AK47 (8 czesci)\n\
        RPG (50 czesci)\n\
        Kamizelka (5 czesci)",
        gWarehouseData[whid][wh_fabrics],
        gWarehouseData[whid][wh_metals],
        gWarehouseData[whid][wh_gunparts]);
    
    ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_CRAFT, DIALOG_STYLE_LIST, 
        szTitle, szDialog, "Wybierz", "Anuluj");
    
    SetPVarInt(playerid, "Warehouse_Selected", whid);
    return 1;
}

stock Warehouse_ShowTakeMaterialsMenu(playerid)
{
    new whid = GetPVarInt(playerid, "Warehouse_Selected");
    if(whid == -1)
    {
        whid = Warehouse_GetPlayerWarehouse(playerid);
        if(whid == -1) whid = Warehouse_GetNearest(playerid);
    }
    if(whid == -1) return sendErrorMessage(playerid, "Nie jestes przy magazynie.");
    
    new szDialog[300], szTitle[64];
    format(szTitle, sizeof(szTitle), "Wyjmij Materialy");
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}Dostepne materialy:\n\n"\
        "{FFFFFF}1. Tkaniny - {00FF00}%d jednostek\n"\
        "{FFFFFF}2. Metale - {00FF00}%d jednostek\n"\
        "{FFFFFF}3. Materialy - {00FF00}%d jednostek\n",
        gWarehouseData[whid][wh_fabrics],
        gWarehouseData[whid][wh_metals],
        gWarehouseData[whid][wh_mats]);
    
    ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_TAKE_MATERIALS, DIALOG_STYLE_LIST, szTitle, szDialog, "Wyjmij", "Anuluj");
    
    SetPVarInt(playerid, "Warehouse_Selected", whid);
    return 1;
}

stock Warehouse_TakeMaterialAsItem(playerid, materialType, amount)
{
    new whid = GetPVarInt(playerid, "Warehouse_Selected");
    if(whid == -1)
    {
        whid = Warehouse_GetPlayerWarehouse(playerid);
        if(whid == -1) whid = Warehouse_GetNearest(playerid);
    }
    if(whid == -1) return 0;
    
    if(IsPlayerInAnyVehicle(playerid))
        return sendErrorMessage(playerid, "Nie mozesz wyjmowac materialow w pojezdzie.");
    
    if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
        return sendErrorMessage(playerid, "Brak miejsca w ekwipunku.");
    
    new itemType = -1;
    new itemName[40];
    new available = 0;
    
    switch(materialType)
    {
        case 0: // Fabrics
        {
            available = gWarehouseData[whid][wh_fabrics];
            itemType = ITEM_TYPE_FABRICS;
            itemName = "Tkaniny";
        }
        case 1: // Metals
        {
            available = gWarehouseData[whid][wh_metals];
            itemType = ITEM_TYPE_METALS;
            itemName = "Metale";
        }
        case 2: // Materials
        {
            available = gWarehouseData[whid][wh_mats];
            itemType = ITEM_TYPE_MATS;
            itemName = "Materialy";
        }
        default: return 0;
    }
    
    if(available < amount)
    {
        new szMsg[128];
        format(szMsg, sizeof(szMsg), "Brak wystarczajacej ilosci %s w magazynie.", itemName);
        return sendErrorMessage(playerid, szMsg);
    }
    
    if(amount <= 0)
        return sendErrorMessage(playerid, "Nieprawidlowa ilosc.");
    
    new actualAmount = 0;
    for(new i = 0; i < amount; i++)
    {
        if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
        {
            va_SendClientMessage(playerid, COLOR_RED, "[!] Brak miejsca w ekwipunku. Dodano tylko %d przedmiotow.", actualAmount);
            // Zwroc materialy
            switch(materialType)
            {
                case 0: gWarehouseData[whid][wh_fabrics] += (amount - actualAmount);
                case 1: gWarehouseData[whid][wh_metals] += (amount - actualAmount);
                case 2: gWarehouseData[whid][wh_mats] += (amount - actualAmount);
            }
            break;
        }
        
        new itemId = Item_Add(itemName, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
            itemType, 0, 0, true, playerid, 1, 0);
        
        if(itemId == -1)
        {
            va_SendClientMessage(playerid, COLOR_RED, "[!] Nie udalo sie utworzyc przedmiotu. Dodano tylko %d przedmiotow.", actualAmount);
            // Zwroc materialy
            switch(materialType)
            {
                case 0: gWarehouseData[whid][wh_fabrics] += (amount - actualAmount);
                case 1: gWarehouseData[whid][wh_metals] += (amount - actualAmount);
                case 2: gWarehouseData[whid][wh_mats] += (amount - actualAmount);
            }
            break;
        }
        
        switch(materialType)
        {
            case 0: gWarehouseData[whid][wh_fabrics]--;
            case 1: gWarehouseData[whid][wh_metals]--;
            case 2: gWarehouseData[whid][wh_mats]--;
        }
        
        actualAmount++;
    }
    
    Warehouse_Save(whid);
    Warehouse_Refresh(whid);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Wyciagnieto %d %s z magazynu.", actualAmount, itemName);
    
    new szLog[256];
    format(szLog, sizeof(szLog), "%s wyciagnal %d %s z magazynu %d", 
        GetPlayerLogName(playerid), actualAmount, itemName, gWarehouseData[whid][wh_sql_id]);
    Log(itemLog, INFO, szLog);
    
    return 1;
}

stock Warehouse_ShowTakeChemicalsMenu(playerid)
{
    new whid = GetPVarInt(playerid, "Warehouse_Selected");
    if(whid == -1)
    {
        whid = Warehouse_GetPlayerWarehouse(playerid);
        if(whid == -1) whid = Warehouse_GetNearest(playerid);
    }
    if(whid == -1) return sendErrorMessage(playerid, "Nie jestes przy magazynie.");
    
    new szDialog[400], szTitle[64];
    format(szTitle, sizeof(szTitle), "Wyjmij Chemikalia");
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}Dostepne chemikalia:\n\n"\
        "{FFFFFF}1. Acetone - {00FF00}%d jednostek\n"\
        "{FFFFFF}2. Toluene - {00FF00}%d jednostek\n"\
        "{FFFFFF}3. Lithium - {00FF00}%d jednostek\n"\
        "{FFFFFF}4. Sodium - {00FF00}%d jednostek\n"\
        "{FFFFFF}5. Calcium - {00FF00}%d jednostek\n",
        gWarehouseData[whid][wh_acetone],
        gWarehouseData[whid][wh_toluene],
        gWarehouseData[whid][wh_lithium],
        gWarehouseData[whid][wh_sodium],
        gWarehouseData[whid][wh_calcium]);
    
    ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_TAKE_CHEMICALS, DIALOG_STYLE_LIST, szTitle, szDialog, "Wyjmij", "Anuluj");
    
    SetPVarInt(playerid, "Warehouse_Selected", whid);
    return 1;
}

stock Warehouse_TakeChemicalAsItem(playerid, chemicalType, amount)
{
    new whid = GetPVarInt(playerid, "Warehouse_Selected");
    if(whid == -1)
    {
        whid = Warehouse_GetPlayerWarehouse(playerid);
        if(whid == -1) whid = Warehouse_GetNearest(playerid);
    }
    if(whid == -1) return 0;
    
    if(IsPlayerInAnyVehicle(playerid))
        return sendErrorMessage(playerid, "Nie mozesz wyjmowac chemikaliow w pojezdzie.");
    
    if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
        return sendErrorMessage(playerid, "Brak miejsca w ekwipunku.");
    
    new itemType = -1;
    new itemName[40];
    new available = 0;
    
    switch(chemicalType)
    {
        case 0: // Acetone
        {
            available = gWarehouseData[whid][wh_acetone];
            itemType = ITEM_TYPE_ACETONE;
            itemName = "Acetone";
        }
        case 1: // Toluene
        {
            available = gWarehouseData[whid][wh_toluene];
            itemType = ITEM_TYPE_TOLUENE;
            itemName = "Toluene";
        }
        case 2: // Lithium
        {
            available = gWarehouseData[whid][wh_lithium];
            itemType = ITEM_TYPE_LITHIUM;
            itemName = "Lithium";
        }
        case 3: // Sodium
        {
            available = gWarehouseData[whid][wh_sodium];
            itemType = ITEM_TYPE_SODIUM;
            itemName = "Sodium";
        }
        case 4: // Calcium
        {
            available = gWarehouseData[whid][wh_calcium];
            itemType = ITEM_TYPE_CALCIUM;
            itemName = "Calcium";
        }
        default: return 0;
    }
    
    if(available < amount)
    {
        new szMsg[128];
        format(szMsg, sizeof(szMsg), "Brak wystarczajacej ilosci %s w magazynie.", itemName);
        return sendErrorMessage(playerid, szMsg);
    }
    
    if(amount <= 0)
        return sendErrorMessage(playerid, "Nieprawidlowa ilosc.");
    
    new actualAmount = 0;
    for(new i = 0; i < amount; i++)
    {
        if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
        {
            va_SendClientMessage(playerid, COLOR_RED, "[!] Brak miejsca w ekwipunku. Dodano tylko %d przedmiotow.", actualAmount);
            // Zwroc materialy
            switch(chemicalType)
            {
                case 0: gWarehouseData[whid][wh_acetone] += (amount - actualAmount);
                case 1: gWarehouseData[whid][wh_toluene] += (amount - actualAmount);
                case 2: gWarehouseData[whid][wh_lithium] += (amount - actualAmount);
                case 3: gWarehouseData[whid][wh_sodium] += (amount - actualAmount);
                case 4: gWarehouseData[whid][wh_calcium] += (amount - actualAmount);
            }
            break;
        }
        
        new itemId = Item_Add(itemName, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
            itemType, 0, 0, true, playerid, 1, 0);
        
        if(itemId == -1)
        {
            va_SendClientMessage(playerid, COLOR_RED, "[!] Nie udalo sie utworzyc przedmiotu. Dodano tylko %d przedmiotow.", actualAmount);
            // Zwroc materialy
            switch(chemicalType)
            {
                case 0: gWarehouseData[whid][wh_acetone] += (amount - actualAmount);
                case 1: gWarehouseData[whid][wh_toluene] += (amount - actualAmount);
                case 2: gWarehouseData[whid][wh_lithium] += (amount - actualAmount);
                case 3: gWarehouseData[whid][wh_sodium] += (amount - actualAmount);
                case 4: gWarehouseData[whid][wh_calcium] += (amount - actualAmount);
            }
            break;
        }
        
        switch(chemicalType)
        {
            case 0: gWarehouseData[whid][wh_acetone]--;
            case 1: gWarehouseData[whid][wh_toluene]--;
            case 2: gWarehouseData[whid][wh_lithium]--;
            case 3: gWarehouseData[whid][wh_sodium]--;
            case 4: gWarehouseData[whid][wh_calcium]--;
        }
        
        actualAmount++;
    }
    
    Warehouse_Save(whid);
    Warehouse_Refresh(whid);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Wyciagnieto %d %s z magazynu.", actualAmount, itemName);
    
    new szLog[256];
    format(szLog, sizeof(szLog), "%s wyciagnal %d %s z magazynu %d", 
        GetPlayerLogName(playerid), actualAmount, itemName, gWarehouseData[whid][wh_sql_id]);
    Log(itemLog, INFO, szLog);
    
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja
    for(new i = 0; i < MAX_WAREHOUSES; i++)
    {
        gWarehouseData[i][wh_sql_id] = 0;
        gWarehouseData[i][wh_org_owner] = -1;
        gWarehouseData[i][wh_pickup] = -1;
        gWarehouseData[i][wh_area] = -1;
        gWarehouseData[i][wh_label] = Text3D:-1;
    }
    
    for(new i = 0; i < MAX_PLAYERS; i++)
        gPlayerInWarehouse[i] = -1;

    return 1;
}

hook OnPlayerConnect(playerid)
{
    gPlayerInWarehouse[playerid] = -1;
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_YES)) // Klawisz Y
    {
        // Wejscie do magazynu
        if(gPlayerInWarehouse[playerid] == -1)
        {
            new whid = Warehouse_GetNearest(playerid);
            if(whid != -1)
            {
                if(gWarehouseData[whid][wh_org_owner] == -1)
                {
                    sendErrorMessage(playerid, "Ten magazyn nie jest jeszcze kupiony. Uzyj /kupmagazyn");
                }
                else
                {
                    // Sprawdz czy gracz nalezy do organizacji
                    new orgid = GetPlayerIllegalOrg(playerid);
                    if(orgid == gWarehouseData[whid][wh_org_owner])
                    {
                        SetPlayerPos(playerid, 1405.3120, -8.2928, 1000.9130);
                        SetPlayerInterior(playerid, 1);
                        SetPlayerVirtualWorld(playerid, 2000 + whid);
                        gPlayerInWarehouse[playerid] = whid;
                        SendClientMessage(playerid, COLOR_GREEN, "* Wszedles do magazynu.");
                    }
                    else
                    {
                        sendErrorMessage(playerid, "Nie nalezysz do organizacji posiadajacej ten magazyn.");
                    }
                }
            }
        }
        // Wyjscie z magazynu
        else
        {
            new whid = gPlayerInWarehouse[playerid];
            if(IsPlayerInRangeOfPoint(playerid, 3.0, 1405.3120, -8.2928, 1000.9130))
            {
                SetPlayerPos(playerid, gWarehouseData[whid][wh_ent_pos][0], gWarehouseData[whid][wh_ent_pos][1], gWarehouseData[whid][wh_ent_pos][2]);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, 0);
                gPlayerInWarehouse[playerid] = -1;
                SendClientMessage(playerid, COLOR_GREEN, "* Wyszedles z magazynu.");
            }
        }
    }
    return 1;
}

hook OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    // Sprawdz czy gracz niesie skrzynke i wchodzi do obszaru magazynu
    if(Crates_IsPlayerCarrying(playerid))
    {
        for(new i = 0; i < gTotalWarehouses; i++)
        {
            if(areaid == gWarehouseData[i][wh_area] && gWarehouseData[i][wh_org_owner] != -1)
            {
                new crateType = Crates_GetPlayerCrateType(playerid);
                
                if(crateType == CRATE_TYPE_FABRICS || crateType == CRATE_TYPE_METALS)
                {
                    Warehouse_ProcessCrateDrop(playerid, crateType, i);
                    Crates_ClearPlayer(playerid);
                    
                    new szAction[128];
                    format(szAction, sizeof(szAction), "* %s wklada skrzynke do magazynu.", GetNick(playerid));
                    ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
                }
                break;
            }
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_WAREHOUSE_MENU)
    {
        if(!response) return 1;
        
        new whid = GetPVarInt(playerid, "Warehouse_Selected");
        if(whid == -1)
        {
            whid = Warehouse_GetNearest(playerid);
            if(whid == -1) whid = Warehouse_GetPlayerWarehouse(playerid);
        }
        if(whid == -1) return sendErrorMessage(playerid, "Nie jestes przy magazynie.");
        
        // Opcje: Craftowanie broni, Wyjmij materialy, Wyjmij chemikalia, Ulepsz magazyn
        // Format: header (1) + pusta (1) + "Zasoby:" (1) + zasoby (3) + pusta (1) + "Dostepne opcje:" (1) + opcje (4) = 12 linii
        // listitem 0-7 to header/zasoby, 8-11 to opcje
        
        if(listitem >= 8)
        {
            new optionIndex = listitem - 8;
            if(optionIndex == 0) // Craftowanie broni
            {
                return Warehouse_ShowCraftMenu(playerid);
            }
            else if(optionIndex == 1) // Wyjmij materialy
            {
                return Warehouse_ShowTakeMaterialsMenu(playerid);
            }
            else if(optionIndex == 2) // Wyjmij chemikalia
            {
                return Warehouse_ShowTakeChemicalsMenu(playerid);
            }
            else if(optionIndex == 3) // Ulepsz magazyn
            {
                if(gWarehouseData[whid][wh_tier] >= WAREHOUSE_TIER_2)
                {
                    return sendErrorMessage(playerid, "Ten magazyn jest juz ulepszony do maksymalnego poziomu.");
                }
                
                new szDialog2[256];
                format(szDialog2, sizeof(szDialog2), 
                    "{FFFFFF}Aktualny tier: {00FF00}%d\n"\
                    "{FFFFFF}Pojemnosc: {00FF00}%d\n\n"\
                    "{FFFFFF}Ulepsz do Tier 2:\n"\
                    "{FFFFFF}Nowa pojemnosc: {00FF00}%d\n"\
                    "{FFFFFF}Koszt: {FF6600}$%d",
                    gWarehouseData[whid][wh_tier],
                    Warehouse_GetCapacity(whid),
                    WAREHOUSE_TIER_2_CAPACITY,
                    WAREHOUSE_TIER_2_COST);
                
                ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_UPGRADE, DIALOG_STYLE_MSGBOX, 
                    "Ulepsz Magazyn", szDialog2, "Ulepsz", "Anuluj");
            }
        }
        return 1;
    }
    if(dialogid == DIALOG_WAREHOUSE_TAKE_MATERIALS)
    {
        if(!response)
        {
            Warehouse_ShowMenu(playerid);
            return 1;
        }
        
        new whid = GetPVarInt(playerid, "Warehouse_Selected");
        if(whid == -1)
        {
            whid = Warehouse_GetPlayerWarehouse(playerid);
            if(whid == -1) whid = Warehouse_GetNearest(playerid);
        }
        if(whid == -1) return sendErrorMessage(playerid, "Nie jestes przy magazynie.");
        
        if(listitem < 0 || listitem > 2) return 0;
        
        new available = 0;
        switch(listitem)
        {
            case 0: available = gWarehouseData[whid][wh_fabrics];
            case 1: available = gWarehouseData[whid][wh_metals];
            case 2: available = gWarehouseData[whid][wh_mats];
        }
        
        if(available <= 0)
            return sendErrorMessage(playerid, "Brak tego materialu w magazynie.");
        
        Warehouse_TakeMaterialAsItem(playerid, listitem, 1);
        Warehouse_ShowMenu(playerid);
        
        return 1;
    }
    if(dialogid == DIALOG_WAREHOUSE_TAKE_CHEMICALS)
    {
        if(!response)
        {
            Warehouse_ShowMenu(playerid);
            return 1;
        }
        
        new whid = GetPVarInt(playerid, "Warehouse_Selected");
        if(whid == -1)
        {
            whid = Warehouse_GetPlayerWarehouse(playerid);
            if(whid == -1) whid = Warehouse_GetNearest(playerid);
        }
        if(whid == -1) return sendErrorMessage(playerid, "Nie jestes przy magazynie.");
        
        if(listitem < 0 || listitem > 4) return 0;
        
        new available = 0;
        switch(listitem)
        {
            case 0: available = gWarehouseData[whid][wh_acetone];
            case 1: available = gWarehouseData[whid][wh_toluene];
            case 2: available = gWarehouseData[whid][wh_lithium];
            case 3: available = gWarehouseData[whid][wh_sodium];
            case 4: available = gWarehouseData[whid][wh_calcium];
        }
        
        if(available <= 0)
            return sendErrorMessage(playerid, "Brak tego chemikalu w magazynie.");
        
        Warehouse_TakeChemicalAsItem(playerid, listitem, 1);
        Warehouse_ShowMenu(playerid);
        
        return 1;
    }
    
    if(dialogid == DIALOG_WAREHOUSE_UPGRADE)
    {
        if(!response) return 1;
        
        new whid = Warehouse_GetNearest(playerid);
        if(whid == -1) whid = Warehouse_GetPlayerWarehouse(playerid);
        if(whid == -1) return sendErrorMessage(playerid, "Nie jestes przy magazynie.");
        
        if(gWarehouseData[whid][wh_tier] >= WAREHOUSE_TIER_2)
            return sendErrorMessage(playerid, "Ten magazyn jest juz ulepszony.");
        
        new orgid = GetPlayerIllegalOrg(playerid);
        if(orgid != gWarehouseData[whid][wh_org_owner])
            return sendErrorMessage(playerid, "Nie nalezysz do organizacji posiadajacej ten magazyn.");
        
        if(kaska[playerid] < WAREHOUSE_TIER_2_COST)
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        DajKaseDone(playerid, -WAREHOUSE_TIER_2_COST);
        gWarehouseData[whid][wh_tier] = WAREHOUSE_TIER_2;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Ulepszyles magazyn do Tier 2! Nowa pojemnosc: %d", WAREHOUSE_TIER_2_CAPACITY);
        
        Warehouse_Refresh(whid);
        Warehouse_Save(whid);
        return 1;
    }
    
    if(dialogid == DIALOG_WAREHOUSE_CRAFT)
    {
        if(!response) return 1;
        
        new whid = gPlayerInWarehouse[playerid];
        if(whid == -1)
            return sendErrorMessage(playerid, "Nie jestes w magazynie.");
        
        new requiredParts = 0;
        new itemName[32];

        // listitem 0 = info o zasobach (pomijamy), reszta to bronie
        new craftItem = listitem - 1;
        
        switch(craftItem)
        {
            case 0: { requiredParts = GUNPARTS_SNIPER; itemName = "Skrzynka z Snajperka"; }
            case 1: { requiredParts = GUNPARTS_M4; itemName = "Skrzynka z M4"; }
            case 2: { requiredParts = GUNPARTS_AK47; itemName = "Skrzynka z AK47"; }
            case 3: { requiredParts = GUNPARTS_RPG; itemName = "Skrzynka z RPG"; }
            case 4: { requiredParts = GUNPARTS_ARMOUR; itemName = "Skrzynka z Kamizelka"; }
            default: return 1; // Kliknieto na info
        }
        
        if(gWarehouseData[whid][wh_gunparts] < requiredParts)
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci czesci broni w magazynie.");
        
        // Kamizelka wymaga dodatkowych materialow
        if(craftItem == 4 && gWarehouseData[whid][wh_mats] < MATS_ARMOUR)
            return sendErrorMessage(playerid, "Potrzebujesz takze 2 materialow do skraftowania kamizelki.");
        
        gWarehouseData[whid][wh_gunparts] -= requiredParts;
        
        if(craftItem == 0) Item_Add("Skrzynka z Snajperka", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, WEAPON_SNIPER, 10, true, playerid, 1, 0);
        else if(craftItem == 1) Item_Add("Skrzynka z M4", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, WEAPON_M4, 350, true, playerid, 1, 0);
        else if(craftItem == 2) Item_Add("Skrzynka z AK47", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, WEAPON_AK47, 350, true, playerid, 1, 0);
        else if(craftItem == 3) Item_Add("Skrzynka z RPG", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, WEAPON_ROCKETLAUNCHER, 5, true, playerid, 1, 0);
        else if(craftItem == 4) 
        {
            gWarehouseData[whid][wh_mats] -= MATS_ARMOUR;
            Item_Add("Skrzynka z Kamizelka", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_ARMOUR, 0, 100, true, playerid, 1, 0);
        }
         
        va_SendClientMessage(playerid, COLOR_GREEN, "* Skraftowales %s uzywajac %d czesci broni.", itemName, requiredParts);
        
        Warehouse_Refresh(whid);
        Warehouse_Save(whid);
        
        return 1;
    }
    
    if(dialogid == DIALOG_WAREHOUSE_BUY)
    {
        if(!response) return 1;
        
        new whid = Warehouse_GetNearest(playerid);
        if(whid == -1)
            return sendErrorMessage(playerid, "Oddalliles sie od magazynu.");
        
        if(gWarehouseData[whid][wh_org_owner] != -1)
            return sendErrorMessage(playerid, "Ten magazyn jest juz zajety.");
        
        new orgid = GetPlayerIllegalOrg(playerid);
        if(orgid == 0)
            return sendErrorMessage(playerid, "Musisz nalezec do organizacji przestepczej, aby kupic magazyn.");
        
        // Sprawdz czy organizacja juz posiada magazyn
        for(new i = 0; i < gTotalWarehouses; i++)
        {
            if(gWarehouseData[i][wh_org_owner] == orgid)
                return sendErrorMessage(playerid, "Twoja organizacja posiada juz magazyn.");
        }
        
        new group_slot = GetPlayerGroupSlot(playerid, orgid);
        if(group_slot <= 0 || group_slot > MAX_PLAYER_GROUPS)
            return sendErrorMessage(playerid, "Blad: nieprawidlowy slot grupy.");
        
        if(kaska[playerid] < gWarehouseData[whid][wh_price])
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        DajKaseDone(playerid, -gWarehouseData[whid][wh_price]);
        gWarehouseData[whid][wh_org_owner] = orgid;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Kupiles magazyn dla organizacji %s!", GroupInfo[orgid][g_Name]);
        
        Warehouse_Refresh(whid);
        Warehouse_Save(whid);
        
        return 1;
    }
    
    return 0;
}

//------------------<[ Publiczne - MySQL: ]>-------------------

public Warehouse_Load()
{
    mysql_tquery(Database, "SELECT * FROM `warehouses`", "Warehouse_OnLoad", "");
    return 1;
}

forward Warehouse_OnLoad();
public Warehouse_OnLoad()
{
    new rows = cache_num_rows();
    
    for(new i = 0; i < rows && i < MAX_WAREHOUSES; i++)
    {
        cache_get_value_name_int(i, "id", gWarehouseData[i][wh_sql_id]);
        cache_get_value_name_float(i, "ent_x", gWarehouseData[i][wh_ent_pos][0]);
        cache_get_value_name_float(i, "ent_y", gWarehouseData[i][wh_ent_pos][1]);
        cache_get_value_name_float(i, "ent_z", gWarehouseData[i][wh_ent_pos][2]);
        cache_get_value_name_int(i, "price", gWarehouseData[i][wh_price]);
        cache_get_value_name_int(i, "org_owner", gWarehouseData[i][wh_org_owner]);
        cache_get_value_name_int(i, "fabrics", gWarehouseData[i][wh_fabrics]);
        cache_get_value_name_int(i, "metals", gWarehouseData[i][wh_metals]);
        cache_get_value_name_int(i, "mats", gWarehouseData[i][wh_mats]);
        cache_get_value_name_int(i, "gunparts", gWarehouseData[i][wh_gunparts]);
        cache_get_value_name_int(i, "acetone", gWarehouseData[i][wh_acetone]);
        cache_get_value_name_int(i, "toluene", gWarehouseData[i][wh_toluene]);
        cache_get_value_name_int(i, "lithium", gWarehouseData[i][wh_lithium]);
        cache_get_value_name_int(i, "sodium", gWarehouseData[i][wh_sodium]);
        cache_get_value_name_int(i, "calcium", gWarehouseData[i][wh_calcium]);
        cache_get_value_name_int(i, "tier", gWarehouseData[i][wh_tier]);
        
        if(gWarehouseData[i][wh_org_owner] == 0)
            gWarehouseData[i][wh_org_owner] = -1;
        
        if(gWarehouseData[i][wh_tier] < WAREHOUSE_TIER_1)
            gWarehouseData[i][wh_tier] = WAREHOUSE_TIER_1;
        
        gTotalWarehouses++;
        Warehouse_Refresh(i);
    }
    
    printf("[WAREHOUSE] Zaladowano %d magazynow.", gTotalWarehouses);
    return 1;
}

public Warehouse_Save(whid)
{
    if(whid < 0 || whid >= gTotalWarehouses) return 0;
    
    new szQuery[900];
    format(szQuery, sizeof(szQuery), 
        "UPDATE `warehouses` SET `org_owner` = %d, `fabrics` = %d, `metals` = %d, `mats` = %d, `gunparts` = %d, \
        `acetone` = %d, `toluene` = %d, `lithium` = %d, `sodium` = %d, `calcium` = %d, `tier` = %d WHERE `id` = %d",
        (gWarehouseData[whid][wh_org_owner] == -1) ? 0 : gWarehouseData[whid][wh_org_owner],
        gWarehouseData[whid][wh_fabrics],
        gWarehouseData[whid][wh_metals],
        gWarehouseData[whid][wh_mats],
        gWarehouseData[whid][wh_gunparts],
        gWarehouseData[whid][wh_acetone],
        gWarehouseData[whid][wh_toluene],
        gWarehouseData[whid][wh_lithium],
        gWarehouseData[whid][wh_sodium],
        gWarehouseData[whid][wh_calcium],
        gWarehouseData[whid][wh_tier],
        gWarehouseData[whid][wh_sql_id]);
    
    mysql_tquery(Database, szQuery, "", "");
    return 1;
}

stock Warehouse_GetCapacity(whid)
{
    if(gWarehouseData[whid][wh_tier] >= WAREHOUSE_TIER_2)
        return WAREHOUSE_TIER_2_CAPACITY;
    return WAREHOUSE_TIER_1_CAPACITY;
}

stock Warehouse_GetTotalResources(whid)
{
    return gWarehouseData[whid][wh_fabrics] + gWarehouseData[whid][wh_metals] + 
           gWarehouseData[whid][wh_mats] + gWarehouseData[whid][wh_gunparts] + 
           gWarehouseData[whid][wh_acetone] + gWarehouseData[whid][wh_toluene] + 
           gWarehouseData[whid][wh_lithium] + gWarehouseData[whid][wh_sodium] + 
           gWarehouseData[whid][wh_calcium];
}

public Warehouse_OnCreate(whid)
{
    gWarehouseData[whid][wh_sql_id] = cache_insert_id();
    Warehouse_Refresh(whid);
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:magazyn(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /magazyn - pokazuje menu magazynu");
    
    new whid = Warehouse_GetNearest(playerid);
    if(whid == -1)
        return sendErrorMessage(playerid, "Nie jestes przy zadnym magazynie.");
    
    if(gWarehouseData[whid][wh_org_owner] == -1)
    {
        // Magazyn na sprzedaz
        new szDialog[200];
        format(szDialog, sizeof(szDialog), 
            "{FFFFFF}Ten magazyn jest na sprzedaz.\n{00FF00}Cena: {FFFFFF}$%d\n\n{FFFFFF}Czy chcesz kupic ten magazyn?",
            gWarehouseData[whid][wh_price]);
        
        ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_BUY, DIALOG_STYLE_MSGBOX, 
            "Kup magazyn", szDialog, "Kup", "Anuluj");
    }
    else
    {
        // Pokaz menu magazynu
        new szDialog[700];
        new capacity = Warehouse_GetCapacity(whid);
        new used = Warehouse_GetTotalResources(whid);
        
        format(szDialog, sizeof(szDialog), \
            "{00FF00}Magazyn Tier %d {FFFFFF}| Pojemnosc: {00FF00}%d/%d\n\n"\
            "{00FF00}Zasoby:\n"\
            "{FFFFFF}Tkaniny: {00FF00}%d {FFFFFF}| Metale: {00FF00}%d {FFFFFF}| Materialy: {00FF00}%d {FFFFFF}| GP: {00FF00}%d\n"\
            "{FFFFFF}Aceton: {00FF00}%d {FFFFFF}| Toluen: {00FF00}%d {FFFFFF}| Lit: {00FF00}%d\n"\
            "{FFFFFF}Sod: {00FF00}%d {FFFFFF}| Wapno: {00FF00}%d\n\n"\
            "{FFFFFF}Dostepne opcje:\n"\
            "Craftowanie broni\n"\
            "Wyjmij materialy\n"\
            "Wyjmij chemikalia\n"\
            "Ulepsz magazyn",\
            gWarehouseData[whid][wh_tier],
            used, capacity,
            gWarehouseData[whid][wh_fabrics],
            gWarehouseData[whid][wh_metals],
            gWarehouseData[whid][wh_mats],
            gWarehouseData[whid][wh_gunparts],
            gWarehouseData[whid][wh_acetone],
            gWarehouseData[whid][wh_toluene],
            gWarehouseData[whid][wh_lithium],
            gWarehouseData[whid][wh_sodium],
            gWarehouseData[whid][wh_calcium]);
        
        ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_MENU, DIALOG_STYLE_LIST, 
            "Magazyn", szDialog, "Wybierz", "Zamknij");
        
        SetPVarInt(playerid, "Warehouse_Selected", whid);
    }
    
    return 1;
}

YCMD:craftbron(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /craftbron - craftuje bron w magazynie");
    
    return Warehouse_ShowCraftMenu(playerid);
}

YCMD:kupmagazyn(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /kupmagazyn - kupuje magazyn");
    
    new whid = Warehouse_GetNearest(playerid);
    if(whid == -1)
        return sendErrorMessage(playerid, "Nie jestes przy zadnym magazynie.");
    
    if(gWarehouseData[whid][wh_org_owner] != -1)
        return sendErrorMessage(playerid, "Ten magazyn jest juz zajety.");
    
    new szDialog[200];
    format(szDialog, sizeof(szDialog), 
        "{FFFFFF}Ten magazyn jest na sprzedaz.\n{00FF00}Cena: {FFFFFF}$%d\n\n{FFFFFF}Czy chcesz kupic ten magazyn?",
        gWarehouseData[whid][wh_price]);
    
    ShowPlayerDialog(playerid, DIALOG_WAREHOUSE_BUY, DIALOG_STYLE_MSGBOX, 
        "Kup magazyn", szDialog, "Kup", "Anuluj");
    
    return 1;
}

YCMD:createwarehouse(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /createwarehouse [cena] - tworzy magazyn");
    
    if(PlayerInfo[playerid][pAdmin] < 5)
        return sendErrorMessage(playerid, "Brak uprawnien.");
    
    new price;
    if(sscanf(params, "d", price))
        return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /createwarehouse [cena]");
    
    if(gTotalWarehouses >= MAX_WAREHOUSES)
        return sendErrorMessage(playerid, "Osiagnieto maksymalna liczbe magazynow.");
    
    new whid = gTotalWarehouses;
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    gWarehouseData[whid][wh_ent_pos][0] = x;
    gWarehouseData[whid][wh_ent_pos][1] = y;
    gWarehouseData[whid][wh_ent_pos][2] = z;
    gWarehouseData[whid][wh_price] = price;
    gWarehouseData[whid][wh_org_owner] = -1;
    gWarehouseData[whid][wh_fabrics] = 0;
    gWarehouseData[whid][wh_metals] = 0;
    gWarehouseData[whid][wh_gunparts] = 0;
    
    new szQuery[256];
    format(szQuery, sizeof(szQuery), 
        "INSERT INTO `warehouses` (`ent_x`, `ent_y`, `ent_z`, `price`, `org_owner`) VALUES (%f, %f, %f, %d, 0)",
        x, y, z, price);
    
    mysql_tquery(Database, szQuery, "Warehouse_OnCreate", "d", whid);
    gTotalWarehouses++;
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Stworzono magazyn #%d za $%d.", whid, price);
    return 1;
}

//end
