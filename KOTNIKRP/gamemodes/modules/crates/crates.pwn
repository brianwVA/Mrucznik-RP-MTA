
// Opis: System skrzynek (Fabrics, Metals, Materials, Cocaine)

#include <YSI_Coding\y_hooks>

//------------------<[ Funkcje: ]>-------------------

stock Crates_GetTypeName(type)
{
    new szName[24] = "Brak";
    switch(type)
    {
        case CRATE_TYPE_FABRICS: szName = "Tkaniny";
        case CRATE_TYPE_METALS: szName = "Metale";
        case CRATE_TYPE_MATS: szName = "Materialy";
        case CRATE_TYPE_COCAINE: szName = "Kokaina";
        case CRATE_TYPE_CHEMICALS: szName = "Chemikalia";
    }
    return szName;
}

stock Crates_IsPlayerCarrying(playerid)
{
    return (gPlayerCrate[playerid][player_crate_type] != CRATE_TYPE_NONE);
}

stock Crates_GetPlayerCrateType(playerid)
{
    return gPlayerCrate[playerid][player_crate_type];
}

stock Crates_ClearPlayer(playerid)
{
    gPlayerCrate[playerid][player_crate_type] = CRATE_TYPE_NONE;
    gPlayerCrate[playerid][player_crate_last_taken] = 0;
    RemovePlayerAttachedObject(playerid, CRATE_ATTACHMENT_SLOT);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
}

stock Crates_GivePlayerCrate(playerid, type)
{
    gPlayerCrate[playerid][player_crate_type] = type;
    gPlayerCrate[playerid][player_crate_last_taken] = GetTickCount();
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    SetPlayerAttachedObject(playerid, CRATE_ATTACHMENT_SLOT, CRATE_OBJECT_MODEL, 1, 0.15, 0.4, 0.0, 0.0, 90.0, 0.0, 1.0, 1.0, 1.0);
}

stock Crates_AddDepot(const name[], type, amount, price, Float:x, Float:y, Float:z)
{
    if(gTotalCrateDepots >= MAX_CRATE_DEPOTS) return -1;
    
    new id = gTotalCrateDepots;
    
    format(gCrateDepots[id][crate_depot_name], 48, name);
    gCrateDepots[id][crate_depot_type] = type;
    gCrateDepots[id][crate_depot_amount] = amount;
    gCrateDepots[id][crate_depot_price] = price;
    gCrateDepots[id][crate_depot_x] = x;
    gCrateDepots[id][crate_depot_y] = y;
    gCrateDepots[id][crate_depot_z] = z;
    
    new szString[200];
    format(szString, sizeof(szString), 
        "{00FF00}Skrzynki\n{FFFFFF}Typ: {00FF00}%s\n{FFFFFF}Cena: {00FF00}$%d\n{FFFFFF}Ilosc: {00FF00}%d/500\n{FFFFFF}Nacisnij {00FF00}Y{FFFFFF} aby kupic", 
        gCrateDepots[id][crate_depot_name], 
        gCrateDepots[id][crate_depot_price], 
        gCrateDepots[id][crate_depot_amount]);
    
    gCrateDepots[id][crate_depot_label] = CreateDynamic3DTextLabel(szString, 0xFFFFFFFF, x, y, z, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1);
    
    gTotalCrateDepots++;
    return id;
}

stock Crates_RefreshDepotLabel(id)
{
    if(id < 0 || id >= gTotalCrateDepots) return 0;
    
    new szString[200];
    format(szString, sizeof(szString), 
        "{00FF00}Skrzynki\n{FFFFFF}Typ: {00FF00}%s\n{FFFFFF}Cena: {00FF00}$%d\n{FFFFFF}Ilosc: {00FF00}%d/500\n{FFFFFF}Nacisnij {00FF00}Y{FFFFFF} aby kupic", 
        gCrateDepots[id][crate_depot_name], 
        gCrateDepots[id][crate_depot_price], 
        gCrateDepots[id][crate_depot_amount]);
    
    UpdateDynamic3DTextLabelText(gCrateDepots[id][crate_depot_label], 0xFFFFFFFF, szString);
    return 1;
}

stock Crates_GetNearestDepot(playerid, Float:range = 3.0)
{
    for(new i = 0; i < gTotalCrateDepots; i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, range, gCrateDepots[i][crate_depot_x], gCrateDepots[i][crate_depot_y], gCrateDepots[i][crate_depot_z]))
            return i;
    }
    return -1;
}

stock Crates_GetNearestDroppedCrate(playerid, Float:range = 3.0)
{
    foreach(new i : I_Crates)
    {
        if(IsPlayerInRangeOfPoint(playerid, range, gDroppedCrates[i][crate_drop_x], gDroppedCrates[i][crate_drop_y], gDroppedCrates[i][crate_drop_z]))
        {
            if(GetPlayerVirtualWorld(playerid) == gDroppedCrates[i][crate_drop_world] && 
               GetPlayerInterior(playerid) == gDroppedCrates[i][crate_drop_interior])
                return i;
        }
    }
    return -1;
}

stock Crates_CreateDroppedCrate(playerid, type)
{
    new id = Iter_Free(I_Crates);
    if(id == ITER_NONE) return -1;
    
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // Pozycja przed graczem
    new Float:angle;
    GetPlayerFacingAngle(playerid, angle);
    x += 1.0 * floatsin(-angle, degrees);
    y += 1.0 * floatcos(-angle, degrees);
    
    gDroppedCrates[id][crate_drop_type] = type;
    gDroppedCrates[id][crate_drop_x] = x;
    gDroppedCrates[id][crate_drop_y] = y;
    gDroppedCrates[id][crate_drop_z] = z;
    gDroppedCrates[id][crate_drop_world] = GetPlayerVirtualWorld(playerid);
    gDroppedCrates[id][crate_drop_interior] = GetPlayerInterior(playerid);
    gDroppedCrates[id][crate_drop_time] = GetTickCount();
    
    gDroppedCrates[id][crate_drop_object] = CreateDynamicObject(CRATE_OBJECT_MODEL, x, y, z - 0.9, 0.0, 0.0, 0.0, 
        gDroppedCrates[id][crate_drop_world], gDroppedCrates[id][crate_drop_interior], -1, 50.0, 50.0);
    
    new szLabel[150];
    format(szLabel, sizeof(szLabel), "{FFFFFF}Skrzynka\n{FFFFFF}Typ: {00FF00}%s\n{FFFFFF}Nacisnij {00FF00}Y{FFFFFF} aby podniesc", Crates_GetTypeName(type));
    gDroppedCrates[id][crate_drop_text] = CreateDynamic3DTextLabel(szLabel, 0xFFFFFFFF, x, y, z - 0.8, 5.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, gDroppedCrates[id][crate_drop_world], gDroppedCrates[id][crate_drop_interior], -1, 20.0);
    
    Iter_Add(I_Crates, id);
    return id;
}

stock Crates_DestroyDroppedCrate(id)
{
    if(!Iter_Contains(I_Crates, id)) return 0;
    
    if(IsValidDynamicObject(gDroppedCrates[id][crate_drop_object]))
        DestroyDynamicObject(gDroppedCrates[id][crate_drop_object]);
    gDroppedCrates[id][crate_drop_object] = -1;
    
    if(IsValidDynamic3DTextLabel(gDroppedCrates[id][crate_drop_text]))
        DestroyDynamic3DTextLabel(gDroppedCrates[id][crate_drop_text]);
    gDroppedCrates[id][crate_drop_text] = Text3D:-1;
    
    gDroppedCrates[id][crate_drop_type] = CRATE_TYPE_NONE;
    
    Iter_Remove(I_Crates, id);
    return 1;
}

stock Crates_GetChemicalLootItem()
{
    new roll = random(100);
    if(roll < CHEMICALS_LOOT_LITHIUM_CHANCE)
        return ITEM_TYPE_LITHIUM;
    else if(roll < CHEMICALS_LOOT_LITHIUM_CHANCE + CHEMICALS_LOOT_TOLUENE_CHANCE)
        return ITEM_TYPE_TOLUENE;
    else if(roll < CHEMICALS_LOOT_LITHIUM_CHANCE + CHEMICALS_LOOT_TOLUENE_CHANCE + CHEMICALS_LOOT_ACETONE_CHANCE)
        return ITEM_TYPE_ACETONE;
    else if(roll < CHEMICALS_LOOT_LITHIUM_CHANCE + CHEMICALS_LOOT_TOLUENE_CHANCE + CHEMICALS_LOOT_ACETONE_CHANCE + CHEMICALS_LOOT_CALCIUM_CHANCE)
        return ITEM_TYPE_CALCIUM;
    else
        return ITEM_TYPE_SODIUM;
}

stock Crates_OpenCrate(playerid)
{
    if(!Crates_IsPlayerCarrying(playerid))
        return 0;
    
    if(IsPlayerInAnyVehicle(playerid))
        return 0;
    
    new crateType = gPlayerCrate[playerid][player_crate_type];
    new itemCount = 0;
    new itemsGiven[10];
    new itemTypes[10];
    
    switch(crateType)
    {
        case CRATE_TYPE_CHEMICALS:
        {
            new lootCount = CHEMICALS_LOOT_MIN_ITEMS + random(CHEMICALS_LOOT_MAX_ITEMS - CHEMICALS_LOOT_MIN_ITEMS + 1);
            
            for(new i = 0; i < lootCount; i++)
            {
                new itemType = Crates_GetChemicalLootItem();
                new itemName[40];
                
                switch(itemType)
                {
                    case ITEM_TYPE_LITHIUM: itemName = "Lithium";
                    case ITEM_TYPE_TOLUENE: itemName = "Toluene";
                    case ITEM_TYPE_ACETONE: itemName = "Acetone";
                    case ITEM_TYPE_CALCIUM: itemName = "Calcium";
                    case ITEM_TYPE_SODIUM: itemName = "Sodium";
                    default: continue;
                }
                
                if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
                {
                    va_SendClientMessage(playerid, COLOR_RED, "[!] Brak miejsca w ekwipunku. Dodano tylko %d przedmiotow.", itemCount);
                    break;
                }
                
                new itemId = Item_Add(itemName, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
                    itemType, 0, 0, true, playerid, 1, 0);
                
                if(itemId != -1)
                {
                    itemsGiven[itemCount] = itemId;
                    itemTypes[itemCount] = itemType;
                    itemCount++;
                }
            }
        }
        case CRATE_TYPE_MATS:
        {
            if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
                return 0;
            
            new itemId = Item_Add("Materialy", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
                ITEM_TYPE_MATS, 0, 0, true, playerid, 5, 0);
            
            if(itemId != -1)
            {
                itemsGiven[0] = itemId;
                itemTypes[0] = ITEM_TYPE_MATS;
                itemCount = 1;
            }
        }
        case CRATE_TYPE_COCAINE:
        {
            // Otwieranie skrzynki kokainy jako nasiona (10-20 nasion)
            new seedsAmount = 10 + random(11); // 10-20 nasion
            
            if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
                return 0;
            
            new itemId = Item_Add("Nasiona", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
                ITEM_TYPE_OTHER, 2247, 0, true, playerid, seedsAmount, 4);
            
            if(itemId != -1)
            {
                itemsGiven[0] = itemId;
                itemTypes[0] = ITEM_TYPE_OTHER;
                itemCount = 1;
            }
        }
        default:
        {
            return 0;
        }
    }
    
    if(itemCount > 0)
    {
        Crates_ClearPlayer(playerid);
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Otworzyles skrzynke: %s. Otrzymales %d przedmiot(ow).", 
            Crates_GetTypeName(crateType), itemCount);
        
        new szLog[256];
        format(szLog, sizeof(szLog), "%s otworzyl skrzynke typu %d i otrzymal %d przedmiotow", 
            GetPlayerLogName(playerid), crateType, itemCount);
        Log(itemLog, INFO, szLog);
        
        return 1;
    }
    
    return 0;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja iteratora
    Iter_Init(I_Crates);
    
    // Czyszczenie danych upuszczonych skrzynek
    for(new i = 0; i < MAX_CRATE_DROPS; i++)
    {
        gDroppedCrates[i][crate_drop_type] = CRATE_TYPE_NONE;
        gDroppedCrates[i][crate_drop_object] = -1;
        gDroppedCrates[i][crate_drop_text] = Text3D:-1;
    }
    
    // Czyszczenie skrzynek w pojazdach
    for(new v = 0; v < MAX_VEHICLES; v++)
    {
        gVehicleCrates[v][vehicle_crate_count] = 0;
        for(new c = 0; c < MAX_VEHICLE_CRATES; c++)
            gVehicleCrates[v][vehicle_crate_types][c] = CRATE_TYPE_NONE;
    }
    
    // Timer do sprawdzania despawnu skrzynek (co 60 sekund)
    SetTimer("Crates_CheckDespawn", 60000, true);
    
    print("[CRATES] System skrzynek zaladowany.");
    return 1;
}

hook OnPlayerConnect(playerid)
{
    gPlayerCrate[playerid][player_crate_type] = CRATE_TYPE_NONE;
    gPlayerCrate[playerid][player_crate_last_taken] = 0;
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    // Jesli gracz niesie skrzynke - upusc ja
    if(Crates_IsPlayerCarrying(playerid))
    {
        Crates_CreateDroppedCrate(playerid, gPlayerCrate[playerid][player_crate_type]);
        Crates_ClearPlayer(playerid);
    }
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    // Jesli gracz niesie skrzynke - upusc ja
    if(Crates_IsPlayerCarrying(playerid))
    {
        Crates_CreateDroppedCrate(playerid, gPlayerCrate[playerid][player_crate_type]);
        Crates_ClearPlayer(playerid);
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_YES) && !IsPlayerInAnyVehicle(playerid))
    {
        // Jesli gracz niesie skrzynke - moze zapakowac do auta
        if(Crates_IsPlayerCarrying(playerid))
        {
            new vehicleid = GetClosestCar(playerid, 5.0);
            if(vehicleid != INVALID_VEHICLE_ID && vehicleid != -1 && vehicleid >= 0 && vehicleid < MAX_VEHICLES)
            {
                // Sprawdz czy bagaznik jest otwarty
                new engine, lights, alarm, doors, bonnet, boot, objective;
                GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
                if(boot != 1)
                {
                    sendErrorMessage(playerid, "Bagaznik tego pojazdu jest zamkniety.");
                    return 1;
                }
                
                if(gVehicleCrates[vehicleid][vehicle_crate_count] >= MAX_VEHICLE_CRATES)
                {
                    sendErrorMessage(playerid, "Ten pojazd ma juz maksymalna ilosc skrzynek (5).");
                    return 1;
                }
                
                new type = gPlayerCrate[playerid][player_crate_type];
                new slot = gVehicleCrates[vehicleid][vehicle_crate_count];
                
                gVehicleCrates[vehicleid][vehicle_crate_types][slot] = type;
                gVehicleCrates[vehicleid][vehicle_crate_count]++;
                
                Crates_ClearPlayer(playerid);
                
                va_SendClientMessage(playerid, COLOR_GREEN, "* Zapakowales skrzynke %s do pojazdu. (%d/%d)", 
                    Crates_GetTypeName(type), gVehicleCrates[vehicleid][vehicle_crate_count], MAX_VEHICLE_CRATES);
                
                new szAction[128];
                format(szAction, sizeof(szAction), "* %s pakuje skrzynke do pojazdu.", GetNick(playerid));
                ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
                return 1;
            }
        }
        // Jesli gracz NIE niesie skrzynki - moze podniesc lub wypakowac z auta
        else
        {
            // Sprawdz czy jest auto ze skrzynkami w poblizu
            new vehicleid = GetClosestCar(playerid, 5.0);
            if(vehicleid >= 0 && vehicleid < MAX_VEHICLES)
            if(gVehicleCrates[vehicleid][vehicle_crate_count] > 0)
            {
                // Sprawdz czy bagaznik jest otwarty
                new engine, lights, alarm, doors, bonnet, boot, objective;
                GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
                if(boot != 1)
                {
                    sendErrorMessage(playerid, "Bagaznik tego pojazdu jest zamkniety.");
                    return 1;
                }
                
                new slot = gVehicleCrates[vehicleid][vehicle_crate_count] - 1;
                new type = gVehicleCrates[vehicleid][vehicle_crate_types][slot];
                
                gVehicleCrates[vehicleid][vehicle_crate_types][slot] = CRATE_TYPE_NONE;
                gVehicleCrates[vehicleid][vehicle_crate_count]--;
                
                Crates_GivePlayerCrate(playerid, type);
                
                va_SendClientMessage(playerid, COLOR_GREEN, "* Wypakowales skrzynke %s z pojazdu. (Pozostalo: %d/%d)", 
                    Crates_GetTypeName(type), gVehicleCrates[vehicleid][vehicle_crate_count], MAX_VEHICLE_CRATES);
                
                new szAction[128];
                format(szAction, sizeof(szAction), "* %s wypakowuje skrzynke z pojazdu.", GetNick(playerid));
                ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
                return 1;
            }
            
            // Sprawdz depot
            new depotId = Crates_GetNearestDepot(playerid);
            if(depotId != -1)
            {
                // Sprawdz czy jest wystarczajaco skrzynek
                if(gCrateDepots[depotId][crate_depot_amount] < 1)
                {
                    sendErrorMessage(playerid, "Brak skrzynek w tym miejscu.");
                    return 1;
                }
                
                // Sprawdz kase
                if(kaska[playerid] < gCrateDepots[depotId][crate_depot_price])
                {
                    sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
                    return 1;
                }
                
                // Kup skrzynke
                DajKaseDone(playerid, -gCrateDepots[depotId][crate_depot_price]);
                gCrateDepots[depotId][crate_depot_amount]--;
                Crates_RefreshDepotLabel(depotId);
                
                new crateType = gCrateDepots[depotId][crate_depot_type];
                Crates_GivePlayerCrate(playerid, crateType);
                
                va_SendClientMessage(playerid, COLOR_GREEN, "* Kupiles skrzynke %s za $%d.", 
                    Crates_GetTypeName(crateType), gCrateDepots[depotId][crate_depot_price]);
                
                return 1;
            }
            
            // Sprawdz upuszczone skrzynki
            new crateId = Crates_GetNearestDroppedCrate(playerid);
            if(crateId != -1)
            {
                Crates_GivePlayerCrate(playerid, gDroppedCrates[crateId][crate_drop_type]);
                Crates_DestroyDroppedCrate(crateId);
                
                SendClientMessage(playerid, COLOR_GREEN, "* Podniosles skrzynke z ziemi.");
                return 1;
            }
        }
    }
    return 1;
}

//------------------<[ Publiczne: ]>-------------------

public Crates_Load()
{
    // Domyslne lokalizacje depotow skrzynek (mozna zmienic/dodac wiecej)
    // Format: nazwa, typ, ilosc, cena, x, y, z
    
    Crates_AddDepot("Skrzynki Tkanin", CRATE_TYPE_FABRICS, 500, PRICE_CRATE_FABRICS, 638.8908, 851.9096, -42.9609);
    Crates_AddDepot("Skrzynki Metali", CRATE_TYPE_METALS, 500, PRICE_CRATE_METALS, 2119.2893, -1969.7300, 13.782);
    Crates_AddDepot("Skrzynki Materialow", CRATE_TYPE_MATS, 500, PRICE_CRATE_MATS, -744.4017, -129.8114, 66.11);
    Crates_AddDepot("Skrzynki Kokainy", CRATE_TYPE_COCAINE, 500, PRICE_CRATE_COCAINE, -2160.3679, 654.5424, 52.3672);
    Crates_AddDepot("Skrzynki Chemikaliow", CRATE_TYPE_CHEMICALS, 500, PRICE_CRATE_CHEMICALS, 2085.9185, 2070.8342, 10.8203);
    
    printf("[CRATES] Zaladowano %d depotow skrzynek.", gTotalCrateDepots);
    return 1;
}

public Crates_RestockDepots()
{
    for(new i = 0; i < gTotalCrateDepots; i++)
    {
        gCrateDepots[i][crate_depot_amount] = 500;
        Crates_RefreshDepotLabel(i);
    }
    return 1;
}

forward Crates_CheckDespawn();
public Crates_CheckDespawn()
{
    new currentTick = GetTickCount();
    
    // Sprawdz upuszczone skrzynki (15 min timeout)
    foreach(new i : I_Crates)
    {
        if(currentTick - gDroppedCrates[i][crate_drop_time] >= CRATE_DROP_TIMEOUT)
        {
            Crates_DestroyDroppedCrate(i);
        }
    }
    
    // Sprawdz noszone skrzynki (20 min timeout)
    foreach(new playerid : Player)
    {
        if(Crates_IsPlayerCarrying(playerid))
        {
            new elapsed = currentTick - gPlayerCrate[playerid][player_crate_last_taken];
            
            // Ostrzezenie 2 minuty przed despawnem
            if(elapsed >= CRATE_CARRY_TIMEOUT - 120000 && elapsed < CRATE_CARRY_TIMEOUT - 60000)
            {
                SendClientMessage(playerid, COLOR_YELLOW, "[!] Twoja skrzynka zniknie za 2 minuty! Dostarcz ja lub upusc.");
            }
            // Ostrzezenie 1 minute przed despawnem
            else if(elapsed >= CRATE_CARRY_TIMEOUT - 60000 && elapsed < CRATE_CARRY_TIMEOUT)
            {
                SendClientMessage(playerid, COLOR_RED, "[!] Twoja skrzynka zniknie za 1 minute!");
            }
            // Despawn
            else if(elapsed >= CRATE_CARRY_TIMEOUT)
            {
                Crates_ClearPlayer(playerid);
                SendClientMessage(playerid, COLOR_RED, "[!] Twoja skrzynka zniknela - zbyt dlugo ja nosiles.");
            }
        }
    }
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:upuscskrzynke(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /upuscskrzynke - upuszcza noszona skrzynke");
    
    if(!Crates_IsPlayerCarrying(playerid))
        return sendErrorMessage(playerid, "Nie nosisz zadnej skrzynki.");
    
    // Sprawdz czy nie jest blisko depot
    new depotId = Crates_GetNearestDepot(playerid, 5.0);
    if(depotId != -1)
        return sendErrorMessage(playerid, "Nie mozesz upuscic skrzynki blisko punktu zakupu.");
    
    new type = gPlayerCrate[playerid][player_crate_type];
    Crates_CreateDroppedCrate(playerid, type);
    Crates_ClearPlayer(playerid);
    
    SendClientMessage(playerid, COLOR_GREEN, "* Upusciles skrzynke na ziemie.");
    
    new szAction[128];
    format(szAction, sizeof(szAction), "* %s upuscil skrzynke na ziemie.", GetNick(playerid));
    ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    
    return 1;
}

YCMD:skrzynkiauto(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /skrzynkiauto - sprawdza skrzynki w pobliskiem pojezdzie");
    
    new vehicleid = GetClosestCar(playerid, 5.0);
    if(vehicleid == INVALID_VEHICLE_ID)
        return sendErrorMessage(playerid, "Nie ma zadnego pojazdu w poblizu.");
    
    if(gVehicleCrates[vehicleid][vehicle_crate_count] <= 0)
        return SendClientMessage(playerid, COLOR_GREY, "W tym pojezdzie nie ma zadnych skrzynek.");
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Skrzynki w pojezdzie (%d/%d):", 
        gVehicleCrates[vehicleid][vehicle_crate_count], MAX_VEHICLE_CRATES);
    
    for(new i = 0; i < gVehicleCrates[vehicleid][vehicle_crate_count]; i++)
    {
        va_SendClientMessage(playerid, COLOR_WHITE, "  %d. %s", 
            i + 1, Crates_GetTypeName(gVehicleCrates[vehicleid][vehicle_crate_types][i]));
    }
    
    return 1;
}

YCMD:otworzskrzynke(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /otworzskrzynke - otwiera noszona skrzynke i daje przedmioty do ekwipunku");
    
    if(!Crates_IsPlayerCarrying(playerid))
        return sendErrorMessage(playerid, "Nie nosisz zadnej skrzynki.");
    
    if(IsPlayerInAnyVehicle(playerid))
        return sendErrorMessage(playerid, "Nie mozesz otworzyc skrzynki w pojezdzie.");
    
    new crateType = gPlayerCrate[playerid][player_crate_type];
    
    if(crateType != CRATE_TYPE_CHEMICALS && crateType != CRATE_TYPE_MATS)
        return sendErrorMessage(playerid, "Ten typ skrzynki nie moze byc otwarty. Uzyj /rozladujskrzynki dla magazynow/skrytek.");
    
    if(!Crates_OpenCrate(playerid))
        return sendErrorMessage(playerid, "Nie udalo sie otworzyc skrzynki. Sprawdz miejsce w ekwipunku.");
    
    return 1;
}

YCMD:rozladujskrzynki(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /rozladujskrzynki - rozladowuje wszystkie skrzynki z pojazdu do magazynu");
    
    // Sprawdz czy gracz jest przy magazynie
    new whid = Warehouse_GetNearest(playerid, 5.0);
    if(whid == -1)
        return sendErrorMessage(playerid, "Musisz byc przy magazynie swojej organizacji.");
    
    if(gWarehouseData[whid][wh_org_owner] == -1)
        return sendErrorMessage(playerid, "Ten magazyn nie jest jeszcze kupiony.");
    
    new orgid = GetPlayerIllegalOrg(playerid);
    if(orgid != gWarehouseData[whid][wh_org_owner])
        return sendErrorMessage(playerid, "Nie nalezysz do organizacji posiadajacej ten magazyn.");
    
    new vehicleid = GetClosestCar(playerid, 8.0);
    if(vehicleid == INVALID_VEHICLE_ID)
        return sendErrorMessage(playerid, "Nie ma zadnego pojazdu w poblizu.");
    
    if(gVehicleCrates[vehicleid][vehicle_crate_count] <= 0)
        return sendErrorMessage(playerid, "W tym pojezdzie nie ma zadnych skrzynek.");
    
    new fabricsAdded = 0, metalsAdded = 0, otherCount = 0;
    
    for(new i = 0; i < gVehicleCrates[vehicleid][vehicle_crate_count]; i++)
    {
        new type = gVehicleCrates[vehicleid][vehicle_crate_types][i];
        
        if(type == CRATE_TYPE_FABRICS)
        {
            gWarehouseData[whid][wh_fabrics] += 5;
            fabricsAdded += 5;
        }
        else if(type == CRATE_TYPE_METALS)
        {
            gWarehouseData[whid][wh_metals] += 5;
            metalsAdded += 5;
        }
        else
        {
            otherCount++;
        }
        
        gVehicleCrates[vehicleid][vehicle_crate_types][i] = CRATE_TYPE_NONE;
    }
    
    new totalCrates = gVehicleCrates[vehicleid][vehicle_crate_count];
    gVehicleCrates[vehicleid][vehicle_crate_count] = 0;
    
    // Utworz gunparts jesli mamy tkaniny i metale
    if(gWarehouseData[whid][wh_metals] > 0 && gWarehouseData[whid][wh_fabrics] > 0)
    {
        new minAmount = (gWarehouseData[whid][wh_metals] < gWarehouseData[whid][wh_fabrics]) 
            ? gWarehouseData[whid][wh_metals] 
            : gWarehouseData[whid][wh_fabrics];
        
        if(minAmount >= 5)
        {
            new parts = minAmount / 5 * 5;
            gWarehouseData[whid][wh_gunparts] += parts;
            gWarehouseData[whid][wh_fabrics] -= parts;
            gWarehouseData[whid][wh_metals] -= parts;
            
            va_SendClientMessage(playerid, COLOR_GREEN, "* Wytworzono %d czesci broni z tkanin i metali.", parts);
        }
    }
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Rozladowano %d skrzynek do magazynu.", totalCrates);
    if(fabricsAdded > 0) va_SendClientMessage(playerid, COLOR_WHITE, "  - Tkaniny: +%d", fabricsAdded);
    if(metalsAdded > 0) va_SendClientMessage(playerid, COLOR_WHITE, "  - Metale: +%d", metalsAdded);
    if(otherCount > 0) va_SendClientMessage(playerid, COLOR_GREY, "  - %d skrzynek zostalo odrzuconych (nieobslugiwany typ)", otherCount);
    
    Warehouse_Refresh(whid);
    Warehouse_Save(whid);
    
    new szAction[128];
    format(szAction, sizeof(szAction), "* %s rozladowuje skrzynki z pojazdu do magazynu.", GetNick(playerid));
    ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    
    return 1;
}

//end
