
// Opis: System skrytek osobistych dla cywili - przechowywanie materialow i produkcja legalnych produktow

#include <YSI_Coding\y_hooks>

forward Crates_GetChemicalLootItem();

//------------------<[ Funkcje: ]>-------------------

stock Storage_GetCapacity(tier)
{
    switch(tier)
    {
        case STORAGE_TIER_BASIC: return STORAGE_BASIC_CAPACITY;
        case STORAGE_TIER_ADVANCED: return STORAGE_ADVANCED_CAPACITY;
        case STORAGE_TIER_GARAGE: return STORAGE_GARAGE_CAPACITY;
    }
    return 0;
}

stock Storage_GetMaxBots(tier)
{
    switch(tier)
    {
        case STORAGE_TIER_BASIC: return 1;
        case STORAGE_TIER_ADVANCED: return 2;
        case STORAGE_TIER_GARAGE: return 3;
    }
    return 0;
}

stock Storage_GetPrice(tier)
{
    switch(tier)
    {
        case STORAGE_TIER_BASIC: return PRICE_STORAGE_BASIC;
        case STORAGE_TIER_ADVANCED: return PRICE_STORAGE_ADVANCED;
        case STORAGE_TIER_GARAGE: return PRICE_STORAGE_GARAGE;
    }
    return 0;
}

stock Storage_GetTierName(tier)
{
    new szName[24] = "Nieznany";
    switch(tier)
    {
        case STORAGE_TIER_BASIC: szName = "Podstawowa";
        case STORAGE_TIER_ADVANCED: szName = "Zaawansowana";
        case STORAGE_TIER_GARAGE: szName = "Garaz";
    }
    return szName;
}

stock Storage_GetProductionTypeName(type)
{
    new szName[24] = "Brak";
    switch(type)
    {
        case PRODUCTION_TYPE_TOOLS: szName = "Narzedzia";
        case PRODUCTION_TYPE_CLOTHES: szName = "Ubrania";
        case PRODUCTION_TYPE_FURNITURE: szName = "Meble";
        case PRODUCTION_TYPE_ELECTRONICS: szName = "Elektronika";
    }
    return szName;
}

stock Storage_GetTotalMaterials(stid)
{
    return gStorageData[stid][st_fabrics] + gStorageData[stid][st_metals] + 
           gStorageData[stid][st_mats] + gStorageData[stid][st_chemicals] +
           gStorageData[stid][st_acetone] + gStorageData[stid][st_toluene] +
           gStorageData[stid][st_lithium] + gStorageData[stid][st_sodium] +
           gStorageData[stid][st_calcium];
}

stock Storage_GetTotalProducts(stid)
{
    return gStorageData[stid][st_tools] + gStorageData[stid][st_clothes] + 
           gStorageData[stid][st_furniture] + gStorageData[stid][st_electronics];
}

stock Storage_GetUsedCapacity(stid)
{
    return Storage_GetTotalMaterials(stid) + Storage_GetTotalProducts(stid);
}

stock Storage_CanStore(stid, amount)
{
    new capacity = Storage_GetCapacity(gStorageData[stid][st_tier]);
    new used = Storage_GetUsedCapacity(stid);
    return (used + amount <= capacity);
}

stock Storage_GetNearest(playerid, Float:range = 3.0)
{
    for(new i = 0; i < gTotalStorages; i++)
    {
        if(gStorageData[i][st_sql_id] <= 0) continue;
        if(IsPlayerInRangeOfPoint(playerid, range, 
            gStorageData[i][st_ent_pos][0], 
            gStorageData[i][st_ent_pos][1], 
            gStorageData[i][st_ent_pos][2]))
        {
            // Wejscie do skrytki jest w swiecie glownym (VW 0, Interior 0)
            if(GetPlayerInterior(playerid) == 0 &&
               GetPlayerVirtualWorld(playerid) == 0)
                return i;
        }
    }
    return -1;
}

stock Storage_GetPlayerStorage(playerid)
{
    new uid = PlayerInfo[playerid][pUID];
    for(new i = 0; i < gTotalStorages; i++)
    {
        if(gStorageData[i][st_sql_id] > 0 && gStorageData[i][st_owner_uid] == uid)
            return i;
    }
    return -1;
}

stock Storage_IsPlayerInStorage(playerid)
{
    return (gPlayerInStorage[playerid] != -1);
}

// Sprawdz czy pozycja jest zbyt blisko depotow
stock Storage_IsTooCloseToDepot(Float:x, Float:y, Float:z)
{

    new Float:depotPositions[][3] = {
        {638.8908, 851.9096, -42.9609},      // Skrzynki Tkanin
        {2119.2893, -1969.7300, 13.782},    // Skrzynki Metali
        {-744.4017, -129.8114, 66.11},      // Skrzynki Materialow
        {-2160.3679, 654.5424, 52.3672},    // Skrzynki Kokainy
        {2085.9185, 2070.8342, 10.8203}     // Skrzynki Chemikaliow
    };
    
    for(new i = 0; i < sizeof(depotPositions); i++)
    {
        new Float:distance = GetDistanceBetweenPoints(x, y, z, 
            depotPositions[i][0], 
            depotPositions[i][1], 
            depotPositions[i][2]);
        
        if(distance < STORAGE_MIN_DISTANCE_FROM_DEPOT)
            return 1; // Zbyt blisko depotu
    }
    return 0; // OK
}

// Sprawdz czy pozycja jest zbyt blisko innych skrytek
stock Storage_IsTooCloseToStorage(Float:x, Float:y, Float:z)
{
    for(new i = 0; i < gTotalStorages; i++)
    {
        if(gStorageData[i][st_sql_id] <= 0) continue;
        
        new Float:distance = GetDistanceBetweenPoints(x, y, z,
            gStorageData[i][st_ent_pos][0],
            gStorageData[i][st_ent_pos][1],
            gStorageData[i][st_ent_pos][2]);
        
        if(distance < STORAGE_MIN_DISTANCE_FROM_STORAGE)
            return 1; // Zbyt blisko innej skrytki
    }
    return 0; // OK
}

// Sprawdz czy pozycja jest odpowiednia do postawienia skrytki
stock Storage_IsValidLocation(Float:x, Float:y, Float:z)
{
    // Sprawdz odleglosc od depotow
    if(Storage_IsTooCloseToDepot(x, y, z))
        return 0;
    
    // Sprawdz odleglosc od innych skrytek
    if(Storage_IsTooCloseToStorage(x, y, z))
        return 0;
    
    return 1; // Pozycja jest OK
}

stock Storage_Refresh(stid)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    if(gStorageData[stid][st_sql_id] <= 0) return 0;
    
    // Usun stare elementy
    if(IsValidDynamic3DTextLabel(gStorageData[stid][st_label]))
        DestroyDynamic3DTextLabel(gStorageData[stid][st_label]);
    
    if(IsValidDynamicPickup(gStorageData[stid][st_pickup]))
        DestroyDynamicPickup(gStorageData[stid][st_pickup]);
    
    if(IsValidDynamicArea(gStorageData[stid][st_area]))
        DestroyDynamicArea(gStorageData[stid][st_area]);
    
    // Utworz obszar
    gStorageData[stid][st_area] = CreateDynamicCircle(
        gStorageData[stid][st_ent_pos][0], 
        gStorageData[stid][st_ent_pos][1], 
        3.0);
    
    new szString[300];
    new tierName[24];
    format(tierName, sizeof(tierName), "%s", Storage_GetTierName(gStorageData[stid][st_tier]));
    
    new ownerName[MAX_PLAYER_NAME + 1];
    ownerName = MruMySQL_GetNameFromUID(gStorageData[stid][st_owner_uid]);
    
    format(szString, sizeof(szString), 
        "{FFFFFF}[ SKRYTKA - %s ]\n{00FF00}Wlasciciel: {FFFFFF}%s\n{FFFFFF}Pojemnosc: {00FF00}%d/%d\n{FFFFFF}Wejscie: Nacisnij {00FF00}Y",
        tierName, ownerName, 
        Storage_GetUsedCapacity(stid), Storage_GetCapacity(gStorageData[stid][st_tier]));
    
    // Pickup i label przy wejsciu sa w Virtual World 0 (swiat glowny)
    gStorageData[stid][st_pickup] = CreateDynamicPickup(1274, 1, 
        gStorageData[stid][st_ent_pos][0], 
        gStorageData[stid][st_ent_pos][1], 
        gStorageData[stid][st_ent_pos][2], 
        0, 0);
    
    gStorageData[stid][st_label] = CreateDynamic3DTextLabel(szString, 0xFFFFFFFF, 
        gStorageData[stid][st_ent_pos][0], 
        gStorageData[stid][st_ent_pos][1], 
        gStorageData[stid][st_ent_pos][2], 
        8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
    
    // Odswiez boty
    Storage_RefreshBots(stid);
    
    // Utworz pickup i label przy wyjsciu (wewnatrz skrytki)
    if(IsValidDynamicPickup(gStorageData[stid][st_exit_pickup]))
        DestroyDynamicPickup(gStorageData[stid][st_exit_pickup]);
    if(IsValidDynamic3DTextLabel(gStorageData[stid][st_exit_label]))
        DestroyDynamic3DTextLabel(gStorageData[stid][st_exit_label]);
    
    gStorageData[stid][st_exit_pickup] = CreateDynamicPickup(1318, 1, 
        gStorageData[stid][st_exit_pos][0], 
        gStorageData[stid][st_exit_pos][1], 
        gStorageData[stid][st_exit_pos][2], 
        gStorageData[stid][st_virtualworld], gStorageData[stid][st_interior]);
    
    gStorageData[stid][st_exit_label] = CreateDynamic3DTextLabel(
        "{FFFFFF}[ WYJSCIE ]\n{00FF00}Nacisnij Y", 0xFFFFFFFF, 
        gStorageData[stid][st_exit_pos][0], 
        gStorageData[stid][st_exit_pos][1], 
        gStorageData[stid][st_exit_pos][2], 
        5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 
        gStorageData[stid][st_virtualworld], gStorageData[stid][st_interior]);
    
    return 1;
}

stock Storage_GetProdAnim(botNum)
{
    if(botNum < 1 || botNum > 3) return 0;
    return botNum - 1; // Zwroc indeks (0-2)
}

stock Storage_ApplyProdAnim(stid, botNum)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    
    new actorId = INVALID_ACTOR_ID;
    if(botNum == 1) actorId = gStorageData[stid][st_bot1_actor];
    else if(botNum == 2) actorId = gStorageData[stid][st_bot2_actor];
    else if(botNum == 3) actorId = gStorageData[stid][st_bot3_actor];
    
    if(!IsValidActor(actorId)) return 0;
    
    new animIndex = Storage_GetProdAnim(botNum);
    new animations[3][2][32] = {
        {"BOMBER", "BOM_Plant"},      // Bot 1 - praca z narzedziami
        {"CARRY", "liftup"},          // Bot 2 - podnoszenie przedmiotow
        {"BAR", "Barserve_bottle"}     // Bot 3 - praca z przedmiotami
    };
    
    ApplyActorAnimation(actorId, animations[animIndex][0], animations[animIndex][1], 4.0, 1, 0, 0, 0, 0);
    return 1;
}

stock Storage_ClearProdAnim(stid, botNum)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    
    new actorId = INVALID_ACTOR_ID;
    if(botNum == 1) actorId = gStorageData[stid][st_bot1_actor];
    else if(botNum == 2) actorId = gStorageData[stid][st_bot2_actor];
    else if(botNum == 3) actorId = gStorageData[stid][st_bot3_actor];
    
    if(!IsValidActor(actorId)) return 0;
    
    ClearActorAnimations(actorId);
    // Ustaw animacje ambientowa (stojaca)
    ApplyActorAnimation(actorId, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0);
    return 1;
}

stock Storage_RefreshBots(stid)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    
    // Pozycje botow w skrytce (interior 1, podobny do warehouse)
    new Float:botPositions[3][4] = {
        {1408.0, -10.0, 1000.9, 90.0},   // Bot 1
        {1412.0, -10.0, 1000.9, 90.0},   // Bot 2
        {1416.0, -10.0, 1000.9, 90.0}    // Bot 3
    };
    
    new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
    new vw = 3000 + gStorageData[stid][st_sql_id];
    
    // Sprawdz czy boty produkuja (zapisz stan przed usunieciem)
    new bool:bot1_producing = (gStorageData[stid][st_bot1_timer] > 0);
    new bool:bot2_producing = (gStorageData[stid][st_bot2_timer] > 0);
    new bool:bot3_producing = (gStorageData[stid][st_bot3_timer] > 0);
    
    // Usun stare boty
    if(IsValidActor(gStorageData[stid][st_bot1_actor]))
        DestroyActor(gStorageData[stid][st_bot1_actor]);
    if(IsValidActor(gStorageData[stid][st_bot2_actor]))
        DestroyActor(gStorageData[stid][st_bot2_actor]);
    if(IsValidActor(gStorageData[stid][st_bot3_actor]))
        DestroyActor(gStorageData[stid][st_bot3_actor]);
    
    gStorageData[stid][st_bot1_actor] = INVALID_ACTOR_ID;
    gStorageData[stid][st_bot2_actor] = INVALID_ACTOR_ID;
    gStorageData[stid][st_bot3_actor] = INVALID_ACTOR_ID;
    
    // Utworz boty w zaleznosci od tier i typu produkcji
    if(maxBots >= 1 && gStorageData[stid][st_bot1_type] != PRODUCTION_TYPE_NONE)
    {
        gStorageData[stid][st_bot1_actor] = CreateActor(28, 
            botPositions[0][0], botPositions[0][1], botPositions[0][2], botPositions[0][3]);
        SetActorVirtualWorld(gStorageData[stid][st_bot1_actor], vw);
        
        // Ustaw animacje w zaleznosci od tego czy produkuje
        if(bot1_producing)
            Storage_ApplyProdAnim(stid, 1);
        else
            ApplyActorAnimation(gStorageData[stid][st_bot1_actor], "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0);
    }
    
    if(maxBots >= 2 && gStorageData[stid][st_bot2_type] != PRODUCTION_TYPE_NONE)
    {
        gStorageData[stid][st_bot2_actor] = CreateActor(28, 
            botPositions[1][0], botPositions[1][1], botPositions[1][2], botPositions[1][3]);
        SetActorVirtualWorld(gStorageData[stid][st_bot2_actor], vw);
        
        // Ustaw animacje w zaleznosci od tego czy produkuje
        if(bot2_producing)
            Storage_ApplyProdAnim(stid, 2);
        else
            ApplyActorAnimation(gStorageData[stid][st_bot2_actor], "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0);
    }
    
    if(maxBots >= 3 && gStorageData[stid][st_bot3_type] != PRODUCTION_TYPE_NONE)
    {
        gStorageData[stid][st_bot3_actor] = CreateActor(28, 
            botPositions[2][0], botPositions[2][1], botPositions[2][2], botPositions[2][3]);
        SetActorVirtualWorld(gStorageData[stid][st_bot3_actor], vw);
        
        // Ustaw animacje w zaleznosci od tego czy produkuje
        if(bot3_producing)
            Storage_ApplyProdAnim(stid, 3);
        else
            ApplyActorAnimation(gStorageData[stid][st_bot3_actor], "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0);
    }
    
    return 1;
}

stock Storage_InitProdRates()
{
    // Losowe kursy produkcji (zmieniaja sie co restart)
    // Wartosci w sekundach - ile czasu potrzeba na wyprodukowanie 1 sztuki
    
    // Narzedzia: 60-120 sekund (1-2 minuty)
    gProductionRates[rate_tools_min] = 60;
    gProductionRates[rate_tools_max] = 120;
    
    // Ubrania: 45-90 sekund
    gProductionRates[rate_clothes_min] = 45;
    gProductionRates[rate_clothes_max] = 90;
    
    // Meble: 30-60 sekund
    gProductionRates[rate_furniture_min] = 30;
    gProductionRates[rate_furniture_max] = 60;
    
    // Elektronika: 90-180 sekund (1.5-3 minuty)
    gProductionRates[rate_electronics_min] = 90;
    gProductionRates[rate_electronics_max] = 180;
    
    printf("[STORAGE] Zainicjalizowano kursy produkcji: Tools=%d-%ds, Clothes=%d-%ds, Furniture=%d-%ds, Electronics=%d-%ds",
        gProductionRates[rate_tools_min], gProductionRates[rate_tools_max],
        gProductionRates[rate_clothes_min], gProductionRates[rate_clothes_max],
        gProductionRates[rate_furniture_min], gProductionRates[rate_furniture_max],
        gProductionRates[rate_electronics_min], gProductionRates[rate_electronics_max]);
}

stock Storage_GetProductionTime(type)
{
    switch(type)
    {
        case PRODUCTION_TYPE_TOOLS: 
            return gProductionRates[rate_tools_min] + random(gProductionRates[rate_tools_max] - gProductionRates[rate_tools_min] + 1);
        case PRODUCTION_TYPE_CLOTHES: 
            return gProductionRates[rate_clothes_min] + random(gProductionRates[rate_clothes_max] - gProductionRates[rate_clothes_min] + 1);
        case PRODUCTION_TYPE_FURNITURE: 
            return gProductionRates[rate_furniture_min] + random(gProductionRates[rate_furniture_max] - gProductionRates[rate_furniture_min] + 1);
        case PRODUCTION_TYPE_ELECTRONICS: 
            return gProductionRates[rate_electronics_min] + random(gProductionRates[rate_electronics_max] - gProductionRates[rate_electronics_min] + 1);
    }
    return 0;
}

stock Storage_CanProduce(stid, type)
{
    // Sprawdz czy sa materialy do produkcji
    switch(type)
    {
        case PRODUCTION_TYPE_TOOLS:
            return (gStorageData[stid][st_fabrics] >= CRAFT_TOOLS_FABRICS && 
                    gStorageData[stid][st_metals] >= CRAFT_TOOLS_METALS);
        case PRODUCTION_TYPE_CLOTHES:
            return (gStorageData[stid][st_fabrics] >= CRAFT_CLOTHES_FABRICS);
        case PRODUCTION_TYPE_FURNITURE:
            return (gStorageData[stid][st_mats] >= CRAFT_FURNITURE_MATS && 
                    gStorageData[stid][st_metals] >= CRAFT_FURNITURE_METALS);
        case PRODUCTION_TYPE_ELECTRONICS:
            return (gStorageData[stid][st_metals] >= CRAFT_ELECTRONICS_METALS && 
                    gStorageData[stid][st_chemicals] >= CRAFT_ELECTRONICS_CHEMICALS);
    }
    return 0;
}

stock Storage_StartProduction(stid, botNum, type)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    if(type == PRODUCTION_TYPE_NONE) return 0;
    if(!gStorageData[stid][st_production_enabled]) return 0; // Sprawdz czy produkcja jest wlaczona
    
    // Sprawdz czy wlasciciel jest online
    new ownerid = GetPlayerIDFromUID(gStorageData[stid][st_owner_uid]);
    if(!IsPlayerConnected(ownerid)) return 0;
    
    // Sprawdz czy mozna produkowac
    if(!Storage_CanProduce(stid, type)) return 0;
    
    // Sprawdz czy bot nie produkuje juz czegos
    if(botNum == 1 && gStorageData[stid][st_bot1_timer] > 0) return 0;
    if(botNum == 2 && gStorageData[stid][st_bot2_timer] > 0) return 0;
    if(botNum == 3 && gStorageData[stid][st_bot3_timer] > 0) return 0;
    
    
    // Oblicz czas produkcji
    new productionTime = Storage_GetProductionTime(type);
    
    // Ustaw animacje produkcyjna dla bota
    Storage_ApplyProdAnim(stid, botNum);
    
    // Uruchom timer produkcji
    new timerName[32];
    format(timerName, sizeof(timerName), "Storage_Produce_%d_%d", stid, botNum);
    
    if(botNum == 1)
        gStorageData[stid][st_bot1_timer] = SetTimerEx("Storage_OnProductionComplete", productionTime * 1000, false, "ddd", stid, botNum, type);
    else if(botNum == 2)
        gStorageData[stid][st_bot2_timer] = SetTimerEx("Storage_OnProductionComplete", productionTime * 1000, false, "ddd", stid, botNum, type);
    else if(botNum == 3)
        gStorageData[stid][st_bot3_timer] = SetTimerEx("Storage_OnProductionComplete", productionTime * 1000, false, "ddd", stid, botNum, type);
    
    // Usun materialy
    if(type == PRODUCTION_TYPE_TOOLS)
    {
        gStorageData[stid][st_fabrics] -= CRAFT_TOOLS_FABRICS;
        gStorageData[stid][st_metals] -= CRAFT_TOOLS_METALS;
    }
    else if(type == PRODUCTION_TYPE_CLOTHES)
    {
        gStorageData[stid][st_fabrics] -= CRAFT_CLOTHES_FABRICS;
    }
    else if(type == PRODUCTION_TYPE_FURNITURE)
    {
        gStorageData[stid][st_mats] -= CRAFT_FURNITURE_MATS;
        gStorageData[stid][st_metals] -= CRAFT_FURNITURE_METALS;
    }
    else if(type == PRODUCTION_TYPE_ELECTRONICS)
    {
        gStorageData[stid][st_metals] -= CRAFT_ELECTRONICS_METALS;
        gStorageData[stid][st_chemicals] -= CRAFT_ELECTRONICS_CHEMICALS;
    }
    
    Storage_Save(stid);
    Storage_Refresh(stid);
    
    return 1;
}

forward Storage_OnProductionComplete(stid, botNum, type);
public Storage_OnProductionComplete(stid, botNum, type)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    if(gStorageData[stid][st_sql_id] <= 0) return 0;
    
    // Dodaj produkt
    switch(type)
    {
        case PRODUCTION_TYPE_TOOLS:
            gStorageData[stid][st_tools]++;
        case PRODUCTION_TYPE_CLOTHES:
            gStorageData[stid][st_clothes]++;
        case PRODUCTION_TYPE_FURNITURE:
            gStorageData[stid][st_furniture]++;
        case PRODUCTION_TYPE_ELECTRONICS:
            gStorageData[stid][st_electronics]++;
    }
    
    // Wyczysc timer
    if(botNum == 1) gStorageData[stid][st_bot1_timer] = 0;
    else if(botNum == 2) gStorageData[stid][st_bot2_timer] = 0;
    else if(botNum == 3) gStorageData[stid][st_bot3_timer] = 0;
    
    // Powiadom wlasciciela jesli jest online
    new ownerid = GetPlayerIDFromUID(gStorageData[stid][st_owner_uid]);
    if(IsPlayerConnected(ownerid))
    {
        // Pokaz komunikat o wyprodukowaniu tylko gdy gracz jest w skrytce
        if(gPlayerInStorage[ownerid] == stid)
        {
            va_SendClientMessage(ownerid, COLOR_GREEN, "* Bot #%d wyprodukowal 1x %s w twojej skrytce.", 
                botNum, Storage_GetProductionTypeName(type));
        }
    }
    
    // Kontynuuj produkcje jesli sa materialy i wlasciciel jest online
    if(Storage_CanProduce(stid, type) && IsPlayerConnected(ownerid))
    {
        // Animacja juz jest ustawiona, kontynuuj produkcje
        Storage_StartProduction(stid, botNum, type);
    }
    else
    {
        // Zatrzymaj produkcje i animacje (ale NIE resetuj typu produkcji)
        Storage_ClearProdAnim(stid, botNum);
        
        // Typ produkcji pozostaje zapisany, aby bot mogl wznowic produkcje gdy materialy zostana dodane
        // NIE resetujemy: st_bot1_type, st_bot2_type, st_bot3_type
        
        if(IsPlayerConnected(ownerid))
        {
            if(!Storage_CanProduce(stid, type))
            {
                // Komunikat o braku materialow - zawsze pokazuj (nawet gdy gracz jest na zewnatrz)
                SendClientMessage(ownerid, COLOR_YELLOW, "* Bot #%d zatrzymal produkcje - brak materialow. Dodaj materialy aby wznowic.", botNum);
            }
            else
            {
                // Komunikat o wylogowaniu - tylko gdy gracz jest w skrytce
                if(gPlayerInStorage[ownerid] == stid)
                {
                    SendClientMessage(ownerid, COLOR_YELLOW, "* Bot #%d zatrzymal produkcje - wylogowales sie.", botNum);
                }
            }
        }
    }
    
    Storage_Save(stid);
    Storage_Refresh(stid);
    
    return 1;
}

stock Storage_ShowMenu(playerid)
{
    new stid = -1;
    new uid = PlayerInfo[playerid][pUID];
    
    // Sprawdz czy gracz jest w skrytce
    if(gPlayerInStorage[playerid] != -1)
    {
        stid = gPlayerInStorage[playerid];
        // Sprawdz czy to jego skrytka
        if(gStorageData[stid][st_owner_uid] != uid)
        {
            return sendErrorMessage(playerid, "To nie jest twoja skrytka.");
        }
    }
    else
    {
        // Sprawdz czy gracz jest przy swojej skrytce (na zewnatrz)
        stid = Storage_GetNearest(playerid);
        if(stid == -1)
            return sendErrorMessage(playerid, "Musisz byc w skrytce lub przy swojej skrytce.");
        
        // Sprawdz czy to jego skrytka
        if(gStorageData[stid][st_owner_uid] != uid)
            return sendErrorMessage(playerid, "To nie jest twoja skrytka.");
    }
    
    new szDialog[200], szTitle[64];
    format(szTitle, sizeof(szTitle), "Skrytka - %s", Storage_GetTierName(gStorageData[stid][st_tier]));
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}1. Sprawdz stan skrytki\n"\
        "{FFFFFF}2. Zarzadzaj skrytka");
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_MENU, DIALOG_STYLE_LIST, szTitle, szDialog, "Wybierz", "Anuluj");
    
    SetPVarInt(playerid, "Storage_Selected", stid);
    return 1;
}

stock Storage_ShowStatus(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
    new szDialog[800], szTitle[64];
    format(szTitle, sizeof(szTitle), "Stan Skrytki - %s", Storage_GetTierName(gStorageData[stid][st_tier]));
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}Pojemnosc: {00FF00}%d/%d\n\n"\
        "{FFFFFF}Materialy:\n"\
        "{FFFFFF}Tkaniny: {00FF00}%d{FFFFFF} | Metale: {00FF00}%d\n"\
        "{FFFFFF}Materialy: {00FF00}%d\n"\
        "{FFFFFF}Chemikalia: Aceton: {00FF00}%d{FFFFFF} | Toluen: {00FF00}%d{FFFFFF} | Lit: {00FF00}%d{FFFFFF} | Sod: {00FF00}%d{FFFFFF} | Wapno: {00FF00}%d\n\n"\
        "{FFFFFF}Produkty:\n"\
        "{FFFFFF}Narzedzia: {00FF00}%d{FFFFFF} | Ubrania: {00FF00}%d\n"\
        "{FFFFFF}Meble: {00FF00}%d{FFFFFF} | Elektronika: {00FF00}%d\n\n"\
        "{FFFFFF}Boty produkcyjne:\n"\
        "{FFFFFF}Bot 1: {00FF00}%s\n",
        Storage_GetUsedCapacity(stid), Storage_GetCapacity(gStorageData[stid][st_tier]),
        gStorageData[stid][st_fabrics], gStorageData[stid][st_metals],
        gStorageData[stid][st_mats],
        gStorageData[stid][st_acetone], gStorageData[stid][st_toluene],
        gStorageData[stid][st_lithium], gStorageData[stid][st_sodium],
        gStorageData[stid][st_calcium],
        gStorageData[stid][st_tools], gStorageData[stid][st_clothes],
        gStorageData[stid][st_furniture], gStorageData[stid][st_electronics],
        Storage_GetProductionTypeName(gStorageData[stid][st_bot1_type]));
    
    if(maxBots >= 2)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}Bot 2: {00FF00}%s\n", Storage_GetProductionTypeName(gStorageData[stid][st_bot2_type]));
        strcat(szDialog, szLine);
    }
    if(maxBots >= 3)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}Bot 3: {00FF00}%s\n", Storage_GetProductionTypeName(gStorageData[stid][st_bot3_type]));
        strcat(szDialog, szLine);
    }
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_MENU + 100, DIALOG_STYLE_MSGBOX, szTitle, szDialog, "OK", "");
    return 1;
}

stock Storage_ShowManagementMenu(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    new szDialog[300], szTitle[64];
    format(szTitle, sizeof(szTitle), "Zarzadzanie Skrytka");
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}1. Przechowaj skrzynki\n"\
        "{FFFFFF}2. Przechowaj przedmioty\n"\
        "{FFFFFF}3. Wyjmij produkty\n"\
        "{FFFFFF}4. Wyjmij materialy\n"\
        "{FFFFFF}5. Zarzadzaj botami\n"\
        "{FFFFFF}6. %s produkcje\n", gStorageData[stid][st_production_enabled] ? "Wylacz" : "Wlacz");
    
    if(gStorageData[stid][st_tier] < STORAGE_TIER_GARAGE)
        strcat(szDialog, "{FFFFFF}7. Ulepsz skrytke\n");
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_MENU + 200, DIALOG_STYLE_LIST, szTitle, szDialog, "Wybierz", "Wroc");
    return 1;
}

stock Storage_ShowBotSetup(playerid, botNum)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
    if(botNum > maxBots) return 0;
    
    new szDialog[300], szTitle[128];
    
    new currentType = PRODUCTION_TYPE_NONE;
    if(botNum == 1) currentType = gStorageData[stid][st_bot1_type];
    else if(botNum == 2) currentType = gStorageData[stid][st_bot2_type];
    else if(botNum == 3) currentType = gStorageData[stid][st_bot3_type];
    
    format(szTitle, sizeof(szTitle), "Zarzadzanie Botem #%d - Aktualnie: %s", 
        botNum, Storage_GetProductionTypeName(currentType));
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}1. Brak produkcji\n"\
        "{FFFFFF}2. Narzedzia\n"\
        "{FFFFFF}3. Ubrania\n"\
        "{FFFFFF}4. Meble\n"\
        "{FFFFFF}5. Elektronika\n");
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_BOT_SETUP, DIALOG_STYLE_LIST, szTitle, szDialog, "Ustaw", "Anuluj");
    
    SetPVarInt(playerid, "Storage_BotNum", botNum);
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja
    for(new i = 0; i < MAX_PERSONAL_STORAGES; i++)
    {
        gStorageData[i][st_sql_id] = 0;
        gStorageData[i][st_owner_uid] = 0;
        gStorageData[i][st_pickup] = -1;
        gStorageData[i][st_area] = -1;
        gStorageData[i][st_label] = Text3D:-1;
        gStorageData[i][st_exit_pickup] = -1;
        gStorageData[i][st_exit_label] = Text3D:-1;
        gStorageData[i][st_bot1_actor] = INVALID_ACTOR_ID;
        gStorageData[i][st_bot2_actor] = INVALID_ACTOR_ID;
        gStorageData[i][st_bot3_actor] = INVALID_ACTOR_ID;
        gStorageData[i][st_production_enabled] = true; // Domyslnie wlaczona
    }
    
    for(new i = 0; i < MAX_PLAYERS; i++)
        gPlayerInStorage[i] = -1;
    
    // Inicjalizuj kursy produkcji
    Storage_InitProdRates();
    
    print("[STORAGE] System skrytek osobistych zaladowany.");
    return 1;
}

hook OnPlayerConnect(playerid)
{
    gPlayerInStorage[playerid] = -1;
    return 1;
}

// Uruchom produkcje dla skrytki gracza po zalogowaniu
stock Storage_ResumePlayerProd(playerid)
{
    new stid = Storage_GetPlayerStorage(playerid);
    if(stid == -1) return 0;
    if(!gStorageData[stid][st_production_enabled]) return 0; // Sprawdz czy produkcja jest wlaczona
    
    // Uruchom produkcje dla wszystkich botow jesli maja ustawiony typ
    if(gStorageData[stid][st_bot1_type] != PRODUCTION_TYPE_NONE && Storage_CanProduce(stid, gStorageData[stid][st_bot1_type]))
        Storage_StartProduction(stid, 1, gStorageData[stid][st_bot1_type]);
    if(gStorageData[stid][st_bot2_type] != PRODUCTION_TYPE_NONE && Storage_CanProduce(stid, gStorageData[stid][st_bot2_type]))
        Storage_StartProduction(stid, 2, gStorageData[stid][st_bot2_type]);
    if(gStorageData[stid][st_bot3_type] != PRODUCTION_TYPE_NONE && Storage_CanProduce(stid, gStorageData[stid][st_bot3_type]))
        Storage_StartProduction(stid, 3, gStorageData[stid][st_bot3_type]);
    
    return 1;
}

// Sprawdz czy boty moga wznowic produkcje po dodaniu materialow
stock Storage_CheckResumeProduction(stid)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    if(!gStorageData[stid][st_production_enabled]) return 0; // Sprawdz czy produkcja jest wlaczona
    
    new ownerid = GetPlayerIDFromUID(gStorageData[stid][st_owner_uid]);
    if(!IsPlayerConnected(ownerid)) return 0;
    
    // Sprawdz kazdego bota - jesli ma ustawiony typ i nie produkuje, ale moze produkowac, wznow produkcje
    if(gStorageData[stid][st_bot1_type] != PRODUCTION_TYPE_NONE && 
       gStorageData[stid][st_bot1_timer] == 0 && 
       Storage_CanProduce(stid, gStorageData[stid][st_bot1_type]))
    {
        Storage_StartProduction(stid, 1, gStorageData[stid][st_bot1_type]);
    }
    
    if(gStorageData[stid][st_bot2_type] != PRODUCTION_TYPE_NONE && 
       gStorageData[stid][st_bot2_timer] == 0 && 
       Storage_CanProduce(stid, gStorageData[stid][st_bot2_type]))
    {
        Storage_StartProduction(stid, 2, gStorageData[stid][st_bot2_type]);
    }
    
    if(gStorageData[stid][st_bot3_type] != PRODUCTION_TYPE_NONE && 
       gStorageData[stid][st_bot3_timer] == 0 && 
       Storage_CanProduce(stid, gStorageData[stid][st_bot3_type]))
    {
        Storage_StartProduction(stid, 3, gStorageData[stid][st_bot3_type]);
    }
    
    return 1;
}

forward Storage_CheckPlayerOnSpawn(playerid);
public Storage_CheckPlayerOnSpawn(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    
    new interior = GetPlayerInterior(playerid);
    new vw = GetPlayerVirtualWorld(playerid);
    
    if(interior == 1 && vw >= 3000)
    {
        new storage_sql_id = vw - 3000;
        new uid = PlayerInfo[playerid][pUID];
        
        for(new i = 0; i < gTotalStorages; i++)
        {
            if(gStorageData[i][st_sql_id] == storage_sql_id && gStorageData[i][st_owner_uid] == uid)
            {
                gPlayerInStorage[playerid] = i;
                break;
            }
        }
    }
    return 1;
}

// Hook wywolywany po zalogowaniu gracza - uruchom produkcje dla jego skrytki
hook OnPlayerLogin(playerid)
{
    // Uruchom produkcje z opoznieniem, zeby dane gracza byly juz zaladowane
    SetTimerEx("Storage_ResumePlayerProd", 1000, false, "i", playerid);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_YES))
    {
        // Wejscie do skrytki
        if(gPlayerInStorage[playerid] == -1)
        {
            new stid = Storage_GetNearest(playerid);
            if(stid != -1)
            {
                new uid = PlayerInfo[playerid][pUID];
                if(gStorageData[stid][st_owner_uid] == uid)
                {
                    SetPlayerPos(playerid, gStorageData[stid][st_exit_pos][0], 
                        gStorageData[stid][st_exit_pos][1], gStorageData[stid][st_exit_pos][2]);
                    SetPlayerInterior(playerid, gStorageData[stid][st_interior]);
                    SetPlayerVirtualWorld(playerid, gStorageData[stid][st_virtualworld]);
                    gPlayerInStorage[playerid] = stid;
                    SendClientMessage(playerid, COLOR_GREEN, "* Wszedles do swojej skrytki.");
                    Storage_ShowMenu(playerid);
                }
                else
                {
                    sendErrorMessage(playerid, "To nie jest twoja skrytka.");
                }
            }
        }
        // Wyjscie ze skrytki
        else
        {
            new stid = gPlayerInStorage[playerid];
            if(IsPlayerInRangeOfPoint(playerid, 3.0, 
                gStorageData[stid][st_exit_pos][0], 
                gStorageData[stid][st_exit_pos][1], 
                gStorageData[stid][st_exit_pos][2]))
            {
                SetPlayerPos(playerid, gStorageData[stid][st_ent_pos][0], 
                    gStorageData[stid][st_ent_pos][1], gStorageData[stid][st_ent_pos][2]);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, 0);
                gPlayerInStorage[playerid] = -1;
                SendClientMessage(playerid, COLOR_GREEN, "* Wyszedles ze skrytki.");
            }
        }
    }
    return 1;
}

hook OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    // Sprawdz czy gracz niesie skrzynke i wchodzi do obszaru skrytki
    if(Crates_IsPlayerCarrying(playerid))
    {
        for(new i = 0; i < gTotalStorages; i++)
        {
            if(gStorageData[i][st_sql_id] <= 0) continue;
            if(areaid == gStorageData[i][st_area])
            {
                new uid = PlayerInfo[playerid][pUID];
                if(gStorageData[i][st_owner_uid] == uid)
                {
                    new crateType = Crates_GetPlayerCrateType(playerid);
                    new amount = 5;
                    if(crateType == CRATE_TYPE_CHEMICALS)
                        amount = 1 + random(4);
                    
                    if(!Storage_CanStore(i, amount))
                    {
                        sendErrorMessage(playerid, "Skrytka jest pelna.");
                        return 1;
                    }
                    
                    // Dodaj materialy
                    if(crateType == CRATE_TYPE_FABRICS)
                        gStorageData[i][st_fabrics] += amount;
                    else if(crateType == CRATE_TYPE_METALS)
                        gStorageData[i][st_metals] += amount;
                    else if(crateType == CRATE_TYPE_MATS)
                        gStorageData[i][st_mats] += amount;
                    else if(crateType == CRATE_TYPE_CHEMICALS)
                    {
                        // Rozklad na poszczegolne chemikalia (jak w magazynach)
                        new acetone = random(4) + 1;  // 1-4
                        new toluene = random(4) + 1;  // 1-4
                        new lithium = random(3) + 1;  // 1-3
                        new sodium = random(3) + 1;   // 1-3
                        new calcium = random(3) + 1;  // 1-3
                        
                        gStorageData[i][st_acetone] += acetone;
                        gStorageData[i][st_toluene] += toluene;
                        gStorageData[i][st_lithium] += lithium;
                        gStorageData[i][st_sodium] += sodium;
                        gStorageData[i][st_calcium] += calcium;
                        
                        // Zachowaj kompatybilnosc - dodaj tez do st_chemicals
                        gStorageData[i][st_chemicals] += (acetone + toluene + lithium + sodium + calcium);
                        
                        va_SendClientMessage(playerid, COLOR_GREEN, "* Wlozyles skrzynke %s do skrytki:", 
                            Crates_GetTypeName(crateType));
                        va_SendClientMessage(playerid, COLOR_WHITE, "  Aceton: +%d | Toluen: +%d | Lit: +%d | Sod: +%d | Wapno: +%d", 
                            acetone, toluene, lithium, sodium, calcium);
                    }
                    else
                    {
                        sendErrorMessage(playerid, "Ten typ skrzynki nie moze byc przechowany w skrytce.");
                        return 1;
                    }
                    
                    Crates_ClearPlayer(playerid);
                    Storage_Save(i);
                    Storage_Refresh(i);
                    
                    if(crateType != CRATE_TYPE_CHEMICALS)
                    {
                        va_SendClientMessage(playerid, COLOR_GREEN, "* Wlozyles skrzynke %s do skrytki (+%d jednostek).", 
                            Crates_GetTypeName(crateType), amount);
                    }
                    
                    // Sprawdz czy boty moga wznowic produkcje po dodaniu materialow
                    Storage_CheckResumeProduction(i);
                    
                    // Sprawdz czy gracz realizuje kontrakt na ta skrytke
                    Contracts_Deliver(playerid, crateType);
                }
                break;
            }
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_STORAGE_MENU)
    {
        if(!response) return 1;
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        // Walidacja listitem: 0-1 (Sprawdz stan, Zarzadzaj)
        if(listitem < 0 || listitem > 1) return 0;
        
        if(listitem == 0) // Sprawdz stan
        {
            Storage_ShowStatus(playerid);
        }
        else if(listitem == 1) // Zarzadzaj
        {
            Storage_ShowManagementMenu(playerid);
        }
        
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_MENU + 200) // Menu zarzadzania
    {
        if(!response)
        {
            // Wroc do glownego menu
            Storage_ShowMenu(playerid);
            return 1;
        }
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        new maxOptions = (gStorageData[stid][st_tier] < STORAGE_TIER_GARAGE) ? 7 : 6;
        if(listitem < 0 || listitem >= maxOptions) return 0;
        
        if(listitem == 0) // Przechowaj skrzynki
        {
            Storage_ShowStoreMenu(playerid);
        }
        else if(listitem == 1) // Przechowaj przedmioty
        {
            Storage_ShowStoreItemsMenu(playerid);
        }
        else if(listitem == 2) // Wyjmij produkty
        {
            Storage_ShowTakeMenu(playerid);
        }
        else if(listitem == 3) // Wyjmij materialy
        {
            Storage_ShowTakeMaterialsMenu(playerid);
        }
        else if(listitem == 4) // Zarzadzaj botami
        {
            new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
            new szDialog[200], szTitle[64];
            format(szTitle, sizeof(szTitle), "Zarzadzanie Botami");
            format(szDialog, sizeof(szDialog), "{FFFFFF}1. Bot #1 - %s\n", 
                Storage_GetProductionTypeName(gStorageData[stid][st_bot1_type]));
            
            if(maxBots >= 2)
            {
                new szLine[64];
                format(szLine, sizeof(szLine), "{FFFFFF}2. Bot #2 - %s\n", 
                    Storage_GetProductionTypeName(gStorageData[stid][st_bot2_type]));
                strcat(szDialog, szLine);
            }
            if(maxBots >= 3)
            {
                new szLine[64];
                format(szLine, sizeof(szLine), "{FFFFFF}3. Bot #3 - %s\n", 
                    Storage_GetProductionTypeName(gStorageData[stid][st_bot3_type]));
                strcat(szDialog, szLine);
            }
            
            ShowPlayerDialog(playerid, DIALOG_STORAGE_PRODUCTION, DIALOG_STYLE_LIST, szTitle, szDialog, "Wybierz", "Wroc");
        }
        else if(listitem == 5) // Wlacz/Wylacz produkcje
        {
            gStorageData[stid][st_production_enabled] = !gStorageData[stid][st_production_enabled];
            Storage_Save(stid);
            
            if(gStorageData[stid][st_production_enabled])
            {
                SendClientMessage(playerid, COLOR_GREEN, "* Produkcja zostala wlaczona.");
                // Sprawdz czy boty moga wznowic produkcje
                Storage_CheckResumeProduction(stid);
            }
            else
            {
                SendClientMessage(playerid, COLOR_YELLOW, "* Produkcja zostala wylaczona.");
                // Zatrzymaj wszystkie aktywne produkcje
                if(gStorageData[stid][st_bot1_timer] > 0)
                {
                    KillTimer(gStorageData[stid][st_bot1_timer]);
                    gStorageData[stid][st_bot1_timer] = 0;
                    Storage_ClearProdAnim(stid, 1);
                }
                if(gStorageData[stid][st_bot2_timer] > 0)
                {
                    KillTimer(gStorageData[stid][st_bot2_timer]);
                    gStorageData[stid][st_bot2_timer] = 0;
                    Storage_ClearProdAnim(stid, 2);
                }
                if(gStorageData[stid][st_bot3_timer] > 0)
                {
                    KillTimer(gStorageData[stid][st_bot3_timer]);
                    gStorageData[stid][st_bot3_timer] = 0;
                    Storage_ClearProdAnim(stid, 3);
                }
            }
            Storage_ShowManagementMenu(playerid);
        }
        else if(listitem == 6 && gStorageData[stid][st_tier] < STORAGE_TIER_GARAGE) // Ulepsz skrytke
        {
            Storage_ShowUpgradeDialog(playerid);
        }
        
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_PRODUCTION)
    {
        if(!response)
        {
            // Wroc do menu zarzadzania
            Storage_ShowManagementMenu(playerid);
            return 1;
        }
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
        if(listitem < 0 || listitem >= maxBots) return 0;
        
        new botNum = listitem + 1;
        Storage_ShowBotSetup(playerid, botNum);
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_BOT_SETUP)
    {
        if(!response)
        {
            // Wroc do wyboru botow
            new stid = GetPVarInt(playerid, "Storage_Selected");
            if(stid == -1) return 0;
            
            new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
            new szDialog[200], szTitle[64];
            format(szTitle, sizeof(szTitle), "Zarzadzanie Botami");
            format(szDialog, sizeof(szDialog), "{FFFFFF}1. Bot #1 - %s\n", 
                Storage_GetProductionTypeName(gStorageData[stid][st_bot1_type]));
            
            if(maxBots >= 2)
            {
                new szLine[64];
                format(szLine, sizeof(szLine), "{FFFFFF}2. Bot #2 - %s\n", 
                    Storage_GetProductionTypeName(gStorageData[stid][st_bot2_type]));
                strcat(szDialog, szLine);
            }
            if(maxBots >= 3)
            {
                new szLine[64];
                format(szLine, sizeof(szLine), "{FFFFFF}3. Bot #3 - %s\n", 
                    Storage_GetProductionTypeName(gStorageData[stid][st_bot3_type]));
                strcat(szDialog, szLine);
            }
            
            ShowPlayerDialog(playerid, DIALOG_STORAGE_PRODUCTION, DIALOG_STYLE_LIST, szTitle, szDialog, "Wybierz", "Wroc");
            return 1;
        }
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        new botNum = GetPVarInt(playerid, "Storage_BotNum");
        
        if(stid == -1) return 0;
        if(botNum < 1 || botNum > 3)
        {
            // PVar moze byc nieustawione - wroc do wyboru botow
            new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
            new szDialog[200], szTitle[64];
            format(szTitle, sizeof(szTitle), "Zarzadzanie Botami");
            format(szDialog, sizeof(szDialog), "{FFFFFF}1. Bot #1 - %s\n", 
                Storage_GetProductionTypeName(gStorageData[stid][st_bot1_type]));
            
            if(maxBots >= 2)
            {
                new szLine[64];
                format(szLine, sizeof(szLine), "{FFFFFF}2. Bot #2 - %s\n", 
                    Storage_GetProductionTypeName(gStorageData[stid][st_bot2_type]));
                strcat(szDialog, szLine);
            }
            if(maxBots >= 3)
            {
                new szLine[64];
                format(szLine, sizeof(szLine), "{FFFFFF}3. Bot #3 - %s\n", 
                    Storage_GetProductionTypeName(gStorageData[stid][st_bot3_type]));
                strcat(szDialog, szLine);
            }
            
            ShowPlayerDialog(playerid, DIALOG_STORAGE_PRODUCTION, DIALOG_STYLE_LIST, szTitle, szDialog, "Wybierz", "Wroc");
            return 1;
        }
        
        // Walidacja listitem: 0-4 (Brak, Narzedzia, Ubrania, Meble, Elektronika)
        if(listitem < 0 || listitem > 4) return 0;
        
        new newType = listitem; // 0=Brak, 1=Narzedzia, 2=Ubrania, 3=Meble, 4=Elektronika
        
        // Zatrzymaj aktualna produkcje jesli trwa
        if(botNum == 1 && gStorageData[stid][st_bot1_timer] > 0)
        {
            KillTimer(gStorageData[stid][st_bot1_timer]);
            gStorageData[stid][st_bot1_timer] = 0;
            Storage_ClearProdAnim(stid, botNum);
        }
        else if(botNum == 2 && gStorageData[stid][st_bot2_timer] > 0)
        {
            KillTimer(gStorageData[stid][st_bot2_timer]);
            gStorageData[stid][st_bot2_timer] = 0;
            Storage_ClearProdAnim(stid, botNum);
        }
        else if(botNum == 3 && gStorageData[stid][st_bot3_timer] > 0)
        {
            KillTimer(gStorageData[stid][st_bot3_timer]);
            gStorageData[stid][st_bot3_timer] = 0;
            Storage_ClearProdAnim(stid, botNum);
        }
        
        // Ustaw nowy typ - uzywamy osobnych if-else dla pewnosci
        if(botNum == 1)
        {
            gStorageData[stid][st_bot1_type] = newType;
        }
        else if(botNum == 2)
        {
            gStorageData[stid][st_bot2_type] = newType;
        }
        else if(botNum == 3)
        {
            gStorageData[stid][st_bot3_type] = newType;
        }
        
        // Uruchom produkcje jesli wybrano typ i sa materialy
        if(newType != PRODUCTION_TYPE_NONE)
        {
            if(Storage_CanProduce(stid, newType))
            {
                Storage_StartProduction(stid, botNum, newType);
                va_SendClientMessage(playerid, COLOR_GREEN, "* Bot #%d rozpoczal produkcje %s.", 
                    botNum, Storage_GetProductionTypeName(newType));
            }
            else
            {
                sendErrorMessage(playerid, "Brak materialow do produkcji tego produktu.");
            }
        }
        else
        {
            Storage_ClearProdAnim(stid, botNum);
            va_SendClientMessage(playerid, COLOR_GREEN, "* Bot #%d zatrzymany.", botNum);
        }
        
        Storage_Save(stid);
        Storage_Refresh(stid);
        
        // Wroc do wyboru botow
        new maxBots = Storage_GetMaxBots(gStorageData[stid][st_tier]);
        new szDialog[200], szTitle[64];
        format(szTitle, sizeof(szTitle), "Zarzadzanie Botami");
        format(szDialog, sizeof(szDialog), "{FFFFFF}1. Bot #1 - %s\n", 
            Storage_GetProductionTypeName(gStorageData[stid][st_bot1_type]));
        
        if(maxBots >= 2)
        {
            new szLine[64];
            format(szLine, sizeof(szLine), "{FFFFFF}2. Bot #2 - %s\n", 
                Storage_GetProductionTypeName(gStorageData[stid][st_bot2_type]));
            strcat(szDialog, szLine);
        }
        if(maxBots >= 3)
        {
            new szLine[64];
            format(szLine, sizeof(szLine), "{FFFFFF}3. Bot #3 - %s\n", 
                Storage_GetProductionTypeName(gStorageData[stid][st_bot3_type]));
            strcat(szDialog, szLine);
        }
        
        ShowPlayerDialog(playerid, DIALOG_STORAGE_PRODUCTION, DIALOG_STYLE_LIST, szTitle, szDialog, "Wybierz", "Wroc");
        
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_UPGRADE)
    {
        if(!response) return 1;
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        new currentTier = gStorageData[stid][st_tier];
        if(currentTier >= STORAGE_TIER_GARAGE)
            return sendErrorMessage(playerid, "Twoja skrytka jest juz na maksymalnym poziomie.");
        
        new nextTier = currentTier + 1;
        new price = Storage_GetPrice(nextTier);
        
        if(kaska[playerid] < price)
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        DajKaseDone(playerid, -price);
        gStorageData[stid][st_tier] = nextTier;
        
        new szQuery[128];
        format(szQuery, sizeof(szQuery), "UPDATE `personal_storages` SET `tier` = %d WHERE `id` = %d", 
            nextTier, gStorageData[stid][st_sql_id]);
        mysql_tquery(Database, szQuery, "", "");
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Ulepszyles skrytke do poziomu %s za $%d.", 
            Storage_GetTierName(nextTier), price);
        
        Storage_Save(stid);
        Storage_Refresh(stid);
        Storage_ShowManagementMenu(playerid);
        
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_TAKE)
    {
        if(!response) return 1;
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        // Walidacja listitem: 0-3 (Tools, Clothes, Furniture, Electronics)
        // listitem: 0=Tools, 1=Clothes, 2=Furniture, 3=Electronics
        if(listitem < 0 || listitem > 3) return 0;
        
        new productTypes[] = {ITEM_TYPE_TOOLS, ITEM_TYPE_CLOTHES, ITEM_TYPE_FURNITURE, ITEM_TYPE_ELECTRONICS};
        new selectedType = productTypes[listitem];
        
        new amount = 0;
        new productName[32] = "Nieznany";
        
        switch(selectedType)
        {
            case ITEM_TYPE_TOOLS:
            {
                amount = gStorageData[stid][st_tools];
                productName = "Narzedzia";
            }
            case ITEM_TYPE_CLOTHES:
            {
                amount = gStorageData[stid][st_clothes];
                productName = "Ubrania";
            }
            case ITEM_TYPE_FURNITURE:
            {
                amount = gStorageData[stid][st_furniture];
                productName = "Meble";
            }
            case ITEM_TYPE_ELECTRONICS:
            {
                amount = gStorageData[stid][st_electronics];
                productName = "Elektronika";
            }
        }
        
        if(amount <= 0)
            return sendErrorMessage(playerid, "Nie masz tego produktu w skrytce.");
        
        // Sprawdz limit przedmiotow gracza
        if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
            return sendErrorMessage(playerid, "Nie pomiescisz wiecej przedmiotow w ekwipunku.");
        
        // Utworz przedmiot
        new itemId = Item_Add(productName, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
            selectedType, 0, 0, true, playerid, amount, 0);
        
        if(itemId == -1)
            return sendErrorMessage(playerid, "Nie udalo sie utworzyc przedmiotu.");
        
        // Usun z skrytki
        switch(selectedType)
        {
            case ITEM_TYPE_TOOLS: gStorageData[stid][st_tools] = 0;
            case ITEM_TYPE_CLOTHES: gStorageData[stid][st_clothes] = 0;
            case ITEM_TYPE_FURNITURE: gStorageData[stid][st_furniture] = 0;
            case ITEM_TYPE_ELECTRONICS: gStorageData[stid][st_electronics] = 0;
        }
        
        Storage_Save(stid);
        Storage_Refresh(stid);
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Wyjales %s (x%d) ze skrytki.", productName, amount);
        Storage_ShowManagementMenu(playerid);
        
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_STORE_ITEMS)
    {
        if(!response)
        {
            Storage_ShowManagementMenu(playerid);
            return 1;
        }
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        // Okresl typ przedmiotu na podstawie listitem
        // Musimy sprawdzic jakie przedmioty ma gracz i dopasowac listitem
        new itemType = -1;
        new itemTypes[8];
        new itemCount = 0;
        
        if(PlayerItemTotal(playerid, ITEM_TYPE_FABRICS) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_FABRICS;
        if(PlayerItemTotal(playerid, ITEM_TYPE_METALS) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_METALS;
        if(PlayerItemTotal(playerid, ITEM_TYPE_MATS) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_MATS;
        if(PlayerItemTotal(playerid, ITEM_TYPE_ACETONE) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_ACETONE;
        if(PlayerItemTotal(playerid, ITEM_TYPE_TOLUENE) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_TOLUENE;
        if(PlayerItemTotal(playerid, ITEM_TYPE_LITHIUM) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_LITHIUM;
        if(PlayerItemTotal(playerid, ITEM_TYPE_SODIUM) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_SODIUM;
        if(PlayerItemTotal(playerid, ITEM_TYPE_CALCIUM) > 0)
            itemTypes[itemCount++] = ITEM_TYPE_CALCIUM;
        
        if(listitem < 0 || listitem >= itemCount) return 0;
        
        itemType = itemTypes[listitem];
        
        Storage_StoreItemAsMaterial(playerid, itemType);
        Storage_ShowManagementMenu(playerid);
        
        return 1;
    }
    else if(dialogid == DIALOG_STORAGE_TAKE_MATERIALS)
    {
        if(!response) 
        {
            Storage_ShowManagementMenu(playerid);
            return 1;
        }
        
        new stid = GetPVarInt(playerid, "Storage_Selected");
        if(stid == -1) return 0;
        
        if(listitem < 0 || listitem > 7) return 0;
        
        new amount = 1;
        switch(listitem)
        {
            case 0: amount = gStorageData[stid][st_fabrics];
            case 1: amount = gStorageData[stid][st_metals];
            case 2: amount = gStorageData[stid][st_mats];
            case 3: amount = gStorageData[stid][st_acetone];
            case 4: amount = gStorageData[stid][st_toluene];
            case 5: amount = gStorageData[stid][st_lithium];
            case 6: amount = gStorageData[stid][st_sodium];
            case 7: amount = gStorageData[stid][st_calcium];
        }
        
        if(amount <= 0)
            return sendErrorMessage(playerid, "Nie masz tego materialu w skrytce.");
        
        Storage_TakeMaterialAsItem(playerid, listitem, amount);
        Storage_ShowManagementMenu(playerid);
        
        return 1;
    }
    return 1;
}

stock Storage_ShowUpgradeDialog(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    new currentTier = gStorageData[stid][st_tier];
    if(currentTier >= STORAGE_TIER_GARAGE)
    {
        return sendErrorMessage(playerid, "Twoja skrytka jest juz na maksymalnym poziomie.");
    }
    
    new nextTier = currentTier + 1;
    new price = Storage_GetPrice(nextTier);
    
    new szDialog[256];
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}Aktualny poziom: {00FF00}%s\n"\
        "{FFFFFF}Nowy poziom: {00FF00}%s\n"\
        "{FFFFFF}Koszt: {00FF00}$%d\n\n"\
        "{FFFFFF}Czy chcesz ulepszyc skrytke?",
        Storage_GetTierName(currentTier),
        Storage_GetTierName(nextTier),
        price);
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_UPGRADE, DIALOG_STYLE_MSGBOX, 
        "Ulepsz Skrytke", szDialog, "Tak", "Nie");
    
    return 1;
}

stock Storage_ShowStoreMenu(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    // Sprawdz czy gracz niesie skrzynke
    if(!Crates_IsPlayerCarrying(playerid))
        return sendErrorMessage(playerid, "Nie niesiesz zadnej skrzynki. Kup skrzynke w depocie.");
    
    new crateType = Crates_GetPlayerCrateType(playerid);
    
    // Automatycznie przechowaj materialy ze skrzynki
    new amount = 5;
    if(crateType == CRATE_TYPE_CHEMICALS)
    {
        // Rozklad na poszczegolne chemikalia (jak w magazynach)
        new acetone = random(4) + 1;  // 1-4
        new toluene = random(4) + 1;  // 1-4
        new lithium = random(3) + 1;  // 1-3
        new sodium = random(3) + 1;   // 1-3
        new calcium = random(3) + 1;  // 1-3
        
        amount = acetone + toluene + lithium + sodium + calcium;
        
        if(!Storage_CanStore(stid, amount))
            return sendErrorMessage(playerid, "Skrytka jest pelna.");
        
        gStorageData[stid][st_acetone] += acetone;
        gStorageData[stid][st_toluene] += toluene;
        gStorageData[stid][st_lithium] += lithium;
        gStorageData[stid][st_sodium] += sodium;
        gStorageData[stid][st_calcium] += calcium;
        
        // Zachowaj kompatybilnosc
        gStorageData[stid][st_chemicals] += amount;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Przechowales skrzynke %s w skrytce:", 
            Crates_GetTypeName(crateType));
        va_SendClientMessage(playerid, COLOR_WHITE, "  Aceton: +%d | Toluen: +%d | Lit: +%d | Sod: +%d | Wapno: +%d", 
            acetone, toluene, lithium, sodium, calcium);
    }
    else if(crateType == CRATE_TYPE_FABRICS || crateType == CRATE_TYPE_METALS || crateType == CRATE_TYPE_MATS)
    {
        if(!Storage_CanStore(stid, amount))
            return sendErrorMessage(playerid, "Skrytka jest pelna.");
        
        // Dodaj materialy
        if(crateType == CRATE_TYPE_FABRICS)
            gStorageData[stid][st_fabrics] += amount;
        else if(crateType == CRATE_TYPE_METALS)
            gStorageData[stid][st_metals] += amount;
        else if(crateType == CRATE_TYPE_MATS)
            gStorageData[stid][st_mats] += amount;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Przechowales skrzynke %s w skrytce (+%d jednostek).", 
            Crates_GetTypeName(crateType), amount);
    }
    else
    {
        return sendErrorMessage(playerid, "Ten typ skrzynki nie moze byc przechowany w skrytce.");
    }
    
    Crates_ClearPlayer(playerid);
    Storage_Save(stid);
    Storage_Refresh(stid);
    
    // Sprawdz czy boty moga wznowic produkcje po dodaniu materialow
    Storage_CheckResumeProduction(stid);
    
    // Sprawdz czy gracz realizuje kontrakt na ta skrytke
    Contracts_Deliver(playerid, crateType);
    
    return 1;
}

stock Storage_ShowTakeMenu(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    new szDialog[300], szTitle[64];
    format(szTitle, sizeof(szTitle), "Wyjmij Produkty");
    
    format(szDialog, sizeof(szDialog),
        "Narzedzia - {00FF00}%d szt\n"\
        "Ubrania - {00FF00}%d szt\n"\
        "Meble - {00FF00}%d szt\n"\
        "Elektronika - {00FF00}%d szt",
        gStorageData[stid][st_tools],
        gStorageData[stid][st_clothes],
        gStorageData[stid][st_furniture],
        gStorageData[stid][st_electronics]);
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_TAKE, DIALOG_STYLE_LIST, szTitle, szDialog, "Wyjmij", "Anuluj");
    
    return 1;
}

stock Storage_ShowStoreItemsMenu(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    // Sprawdz jakie przedmioty materialowe ma gracz
    new fabricsCount = PlayerItemTotal(playerid, ITEM_TYPE_FABRICS);
    new metalsCount = PlayerItemTotal(playerid, ITEM_TYPE_METALS);
    new matsCount = PlayerItemTotal(playerid, ITEM_TYPE_MATS);
    new acetoneCount = PlayerItemTotal(playerid, ITEM_TYPE_ACETONE);
    new tolueneCount = PlayerItemTotal(playerid, ITEM_TYPE_TOLUENE);
    new lithiumCount = PlayerItemTotal(playerid, ITEM_TYPE_LITHIUM);
    new sodiumCount = PlayerItemTotal(playerid, ITEM_TYPE_SODIUM);
    new calciumCount = PlayerItemTotal(playerid, ITEM_TYPE_CALCIUM);
    
    if(fabricsCount == 0 && metalsCount == 0 && matsCount == 0 && 
       acetoneCount == 0 && tolueneCount == 0 && lithiumCount == 0 && 
       sodiumCount == 0 && calciumCount == 0)
    {
        return sendErrorMessage(playerid, "Nie masz zadnych przedmiotow materialowych w ekwipunku.");
    }
    
    new szDialog[500], szTitle[64];
    format(szTitle, sizeof(szTitle), "Przechowaj Przedmioty");
    
    new optionCount = 0;
    szDialog[0] = '\0';
    
    if(fabricsCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}1. Tkaniny - {00FF00}%d szt\n", fabricsCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(metalsCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Metale - {00FF00}%d szt\n", optionCount + 1, metalsCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(matsCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Materialy - {00FF00}%d szt\n", optionCount + 1, matsCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(acetoneCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Acetone - {00FF00}%d szt\n", optionCount + 1, acetoneCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(tolueneCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Toluene - {00FF00}%d szt\n", optionCount + 1, tolueneCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(lithiumCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Lithium - {00FF00}%d szt\n", optionCount + 1, lithiumCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(sodiumCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Sodium - {00FF00}%d szt\n", optionCount + 1, sodiumCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    if(calciumCount > 0)
    {
        new szLine[64];
        format(szLine, sizeof(szLine), "{FFFFFF}%d. Calcium - {00FF00}%d szt\n", optionCount + 1, calciumCount);
        strcat(szDialog, szLine);
        optionCount++;
    }
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_STORE_ITEMS, DIALOG_STYLE_LIST, szTitle, szDialog, "Przechowaj", "Anuluj");
    
    return 1;
}

stock Storage_StoreItemAsMaterial(playerid, itemType)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    if(IsPlayerInAnyVehicle(playerid))
        return sendErrorMessage(playerid, "Nie mozesz przechowywac przedmiotow w pojezdzie.");
    
    new totalAmount = PlayerItemTotal(playerid, itemType);
    if(totalAmount <= 0)
        return sendErrorMessage(playerid, "Nie masz tego przedmiotu w ekwipunku.");
    
    new itemName[40];
    new amountToStore = 0;
    new canStore = 0;
    
    switch(itemType)
    {
        case ITEM_TYPE_FABRICS:
        {
            itemName = "Tkaniny";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_fabrics] += amountToStore;
            canStore = 1;
        }
        case ITEM_TYPE_METALS:
        {
            itemName = "Metale";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_metals] += amountToStore;
            canStore = 1;
        }
        case ITEM_TYPE_MATS:
        {
            itemName = "Materialy";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_mats] += amountToStore;
            canStore = 1;
        }
        case ITEM_TYPE_ACETONE:
        {
            itemName = "Acetone";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_acetone] += amountToStore;
            gStorageData[stid][st_chemicals] += amountToStore; // Kompatybilnosc
            canStore = 1;
        }
        case ITEM_TYPE_TOLUENE:
        {
            itemName = "Toluene";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_toluene] += amountToStore;
            gStorageData[stid][st_chemicals] += amountToStore; // Kompatybilnosc
            canStore = 1;
        }
        case ITEM_TYPE_LITHIUM:
        {
            itemName = "Lithium";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_lithium] += amountToStore;
            gStorageData[stid][st_chemicals] += amountToStore; // Kompatybilnosc
            canStore = 1;
        }
        case ITEM_TYPE_SODIUM:
        {
            itemName = "Sodium";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_sodium] += amountToStore;
            gStorageData[stid][st_chemicals] += amountToStore; // Kompatybilnosc
            canStore = 1;
        }
        case ITEM_TYPE_CALCIUM:
        {
            itemName = "Calcium";
            amountToStore = totalAmount;
            if(!Storage_CanStore(stid, amountToStore))
                return sendErrorMessage(playerid, "Skrytka jest pelna.");
            gStorageData[stid][st_calcium] += amountToStore;
            gStorageData[stid][st_chemicals] += amountToStore; // Kompatybilnosc
            canStore = 1;
        }
        default: return sendErrorMessage(playerid, "Ten typ przedmiotu nie moze byc przechowany w skrytce.");
    }
    
    if(!canStore) return 0;
    
    // Usun przedmioty z ekwipunku
    RemovePlayerItemQuantity(playerid, itemType, amountToStore);
    
    Storage_Save(stid);
    Storage_Refresh(stid);
    
    // Sprawdz czy boty moga wznowic produkcje po dodaniu materialow
    Storage_CheckResumeProduction(stid);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Przechowales %d %s w skrytce.", amountToStore, itemName);
    
    new szLog[256];
    format(szLog, sizeof(szLog), "%s przechowal %d %s w skrytce %d", 
        GetPlayerLogName(playerid), amountToStore, itemName, gStorageData[stid][st_sql_id]);
    Log(itemLog, INFO, szLog);
    
    return 1;
}

stock Storage_ShowTakeMaterialsMenu(playerid)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    new szDialog[400], szTitle[64];
    format(szTitle, sizeof(szTitle), "Wyjmij Materialy");
    
    format(szDialog, sizeof(szDialog),
        "{FFFFFF}Dostepne materialy:\n\n"\
        "{FFFFFF}1. Tkaniny - {00FF00}%d jednostek\n"\
        "{FFFFFF}2. Metale - {00FF00}%d jednostek\n"\
        "{FFFFFF}3. Materialy - {00FF00}%d jednostek\n\n"\
        "{FFFFFF}Chemikalia:\n"\
        "{FFFFFF}4. Acetone - {00FF00}%d jednostek\n"\
        "{FFFFFF}5. Toluene - {00FF00}%d jednostek\n"\
        "{FFFFFF}6. Lithium - {00FF00}%d jednostek\n"\
        "{FFFFFF}7. Sodium - {00FF00}%d jednostek\n"\
        "{FFFFFF}8. Calcium - {00FF00}%d jednostek\n",
        gStorageData[stid][st_fabrics],
        gStorageData[stid][st_metals],
        gStorageData[stid][st_mats],
        gStorageData[stid][st_acetone],
        gStorageData[stid][st_toluene],
        gStorageData[stid][st_lithium],
        gStorageData[stid][st_sodium],
        gStorageData[stid][st_calcium]);
    
    ShowPlayerDialog(playerid, DIALOG_STORAGE_TAKE_MATERIALS, DIALOG_STYLE_LIST, szTitle, szDialog, "Wyjmij", "Anuluj");
    
    return 1;
}

stock Storage_TakeMaterialAsItem(playerid, materialType, amount)
{
    new stid = GetPVarInt(playerid, "Storage_Selected");
    if(stid == -1) return 0;
    
    if(IsPlayerInAnyVehicle(playerid))
        return sendErrorMessage(playerid, "Nie mozesz wyjmowac materialow w pojezdzie.");
    
    if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
        return sendErrorMessage(playerid, "Brak miejsca w ekwipunku.");
    
    new itemType = -1;
    new itemName[40];
    new actualAmount = 0;
    
    switch(materialType)
    {
        case 0: // Fabrics
        {
            if(gStorageData[stid][st_fabrics] < amount)
                return sendErrorMessage(playerid, "Brak tkanin w skrytce.");
            itemType = ITEM_TYPE_FABRICS;
            itemName = "Tkaniny";
            actualAmount = amount;
            gStorageData[stid][st_fabrics] -= amount;
        }
        case 1: // Metals
        {
            if(gStorageData[stid][st_metals] < amount)
                return sendErrorMessage(playerid, "Brak metali w skrytce.");
            itemType = ITEM_TYPE_METALS;
            itemName = "Metale";
            actualAmount = amount;
            gStorageData[stid][st_metals] -= amount;
        }
        case 2: // Materials
        {
            if(gStorageData[stid][st_mats] < amount)
                return sendErrorMessage(playerid, "Brak materialow w skrytce.");
            itemType = ITEM_TYPE_MATS;
            itemName = "Materialy";
            actualAmount = amount;
            gStorageData[stid][st_mats] -= amount;
        }
        case 3: // Acetone
        {
            if(gStorageData[stid][st_acetone] < amount)
                return sendErrorMessage(playerid, "Brak acetonu w skrytce.");
            itemType = ITEM_TYPE_ACETONE;
            itemName = "Acetone";
            actualAmount = amount;
            gStorageData[stid][st_acetone] -= amount;
        }
        case 4: // Toluene
        {
            if(gStorageData[stid][st_toluene] < amount)
                return sendErrorMessage(playerid, "Brak toluenu w skrytce.");
            itemType = ITEM_TYPE_TOLUENE;
            itemName = "Toluene";
            actualAmount = amount;
            gStorageData[stid][st_toluene] -= amount;
        }
        case 5: // Lithium
        {
            if(gStorageData[stid][st_lithium] < amount)
                return sendErrorMessage(playerid, "Brak litu w skrytce.");
            itemType = ITEM_TYPE_LITHIUM;
            itemName = "Lithium";
            actualAmount = amount;
            gStorageData[stid][st_lithium] -= amount;
        }
        case 6: // Sodium
        {
            if(gStorageData[stid][st_sodium] < amount)
                return sendErrorMessage(playerid, "Brak sodu w skrytce.");
            itemType = ITEM_TYPE_SODIUM;
            itemName = "Sodium";
            actualAmount = amount;
            gStorageData[stid][st_sodium] -= amount;
        }
        case 7: // Calcium
        {
            if(gStorageData[stid][st_calcium] < amount)
                return sendErrorMessage(playerid, "Brak wapna w skrytce.");
            itemType = ITEM_TYPE_CALCIUM;
            itemName = "Calcium";
            actualAmount = amount;
            gStorageData[stid][st_calcium] -= amount;
        }
        default: return 0;
    }
    
    if(itemType == -1)
    {
        return sendErrorMessage(playerid, "Ten typ materialu nie moze byc jeszcze wyciagniety jako przedmioty.");
    }
    
    for(new i = 0; i < actualAmount; i++)
    {
        if(Item_Count(playerid) + 1 > GetPlayerItemLimit(playerid))
        {
            va_SendClientMessage(playerid, COLOR_RED, "[!] Brak miejsca w ekwipunku. Dodano tylko %d przedmiotow.", i);
            // Zwroc materialy
            switch(materialType)
            {
                case 0: gStorageData[stid][st_fabrics] += (actualAmount - i);
                case 1: gStorageData[stid][st_metals] += (actualAmount - i);
                case 2: gStorageData[stid][st_mats] += (actualAmount - i);
                case 3: gStorageData[stid][st_acetone] += (actualAmount - i);
                case 4: gStorageData[stid][st_toluene] += (actualAmount - i);
                case 5: gStorageData[stid][st_lithium] += (actualAmount - i);
                case 6: gStorageData[stid][st_sodium] += (actualAmount - i);
                case 7: gStorageData[stid][st_calcium] += (actualAmount - i);
            }
            actualAmount = i;
            break;
        }
        
        new itemId = Item_Add(itemName, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], 
            itemType, 0, 0, true, playerid, 1, 0);
        
        if(itemId == -1)
        {
            va_SendClientMessage(playerid, COLOR_RED, "[!] Nie udalo sie utworzyc przedmiotu. Dodano tylko %d przedmiotow.", i);
            // Zwroc materialy
            switch(materialType)
            {
                case 0: gStorageData[stid][st_fabrics] += (actualAmount - i);
                case 1: gStorageData[stid][st_metals] += (actualAmount - i);
                case 2: gStorageData[stid][st_mats] += (actualAmount - i);
                case 3: gStorageData[stid][st_acetone] += (actualAmount - i);
                case 4: gStorageData[stid][st_toluene] += (actualAmount - i);
                case 5: gStorageData[stid][st_lithium] += (actualAmount - i);
                case 6: gStorageData[stid][st_sodium] += (actualAmount - i);
                case 7: gStorageData[stid][st_calcium] += (actualAmount - i);
            }
            actualAmount = i;
            break;
        }
    }
    
    Storage_Save(stid);
    Storage_Refresh(stid);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Wyciagnieto %d %s ze skrytki.", actualAmount, itemName);
    
    new szLog[256];
    format(szLog, sizeof(szLog), "%s wyciagnal %d %s ze skrytki %d", 
        GetPlayerLogName(playerid), actualAmount, itemName, gStorageData[stid][st_sql_id]);
    Log(itemLog, INFO, szLog);
    
    return 1;
}

//------------------<[ Publiczne - MySQL: ]>-------------------

public Storage_Load()
{
    mysql_tquery(Database, "SELECT * FROM `personal_storages`", "Storage_OnLoad", "");
    return 1;
}

forward Storage_OnLoad();
public Storage_OnLoad()
{
    new rows = cache_num_rows();
    
    for(new i = 0; i < rows && i < MAX_PERSONAL_STORAGES; i++)
    {
        cache_get_value_name_int(i, "id", gStorageData[i][st_sql_id]);
        cache_get_value_name_int(i, "owner_uid", gStorageData[i][st_owner_uid]);
        cache_get_value_name_int(i, "tier", gStorageData[i][st_tier]);
        cache_get_value_name_float(i, "ent_x", gStorageData[i][st_ent_pos][0]);
        cache_get_value_name_float(i, "ent_y", gStorageData[i][st_ent_pos][1]);
        cache_get_value_name_float(i, "ent_z", gStorageData[i][st_ent_pos][2]);
        cache_get_value_name_float(i, "exit_x", gStorageData[i][st_exit_pos][0]);
        cache_get_value_name_float(i, "exit_y", gStorageData[i][st_exit_pos][1]);
        cache_get_value_name_float(i, "exit_z", gStorageData[i][st_exit_pos][2]);
        cache_get_value_name_int(i, "fabrics", gStorageData[i][st_fabrics]);
        cache_get_value_name_int(i, "metals", gStorageData[i][st_metals]);
        cache_get_value_name_int(i, "mats", gStorageData[i][st_mats]);
        cache_get_value_name_int(i, "chemicals", gStorageData[i][st_chemicals]);
        cache_get_value_name_int(i, "acetone", gStorageData[i][st_acetone]);
        cache_get_value_name_int(i, "toluene", gStorageData[i][st_toluene]);
        cache_get_value_name_int(i, "lithium", gStorageData[i][st_lithium]);
        cache_get_value_name_int(i, "sodium", gStorageData[i][st_sodium]);
        cache_get_value_name_int(i, "calcium", gStorageData[i][st_calcium]);
        cache_get_value_name_int(i, "tools", gStorageData[i][st_tools]);
        cache_get_value_name_int(i, "clothes", gStorageData[i][st_clothes]);
        cache_get_value_name_int(i, "furniture", gStorageData[i][st_furniture]);
        cache_get_value_name_int(i, "electronics", gStorageData[i][st_electronics]);
        cache_get_value_name_int(i, "bot1_type", gStorageData[i][st_bot1_type]);
        cache_get_value_name_int(i, "bot2_type", gStorageData[i][st_bot2_type]);
        cache_get_value_name_int(i, "bot3_type", gStorageData[i][st_bot3_type]);
        
        // Wczytaj flage produkcji (domyslnie true jesli nie ma w bazie)
        new productionEnabled;
        if(cache_get_value_name_int(i, "production_enabled", productionEnabled))
            gStorageData[i][st_production_enabled] = (productionEnabled == 1);
        else
            gStorageData[i][st_production_enabled] = true;
        
        gStorageData[i][st_interior] = 1;
        gStorageData[i][st_virtualworld] = 3000 + gStorageData[i][st_sql_id];
        
        gTotalStorages++;
        Storage_Refresh(i);
        
        // Wznow produkcje jesli boty maja ustawiony typ i wlasciciel jest online (tylko jesli produkcja jest wlaczona)
        new ownerid = GetPlayerIDFromUID(gStorageData[i][st_owner_uid]);
        if(IsPlayerConnected(ownerid) && gStorageData[i][st_production_enabled])
        {
            if(gStorageData[i][st_bot1_type] != PRODUCTION_TYPE_NONE && Storage_CanProduce(i, gStorageData[i][st_bot1_type]))
                Storage_StartProduction(i, 1, gStorageData[i][st_bot1_type]);
            if(gStorageData[i][st_bot2_type] != PRODUCTION_TYPE_NONE && Storage_CanProduce(i, gStorageData[i][st_bot2_type]))
                Storage_StartProduction(i, 2, gStorageData[i][st_bot2_type]);
            if(gStorageData[i][st_bot3_type] != PRODUCTION_TYPE_NONE && Storage_CanProduce(i, gStorageData[i][st_bot3_type]))
                Storage_StartProduction(i, 3, gStorageData[i][st_bot3_type]);
        }
    }
    
    printf("[STORAGE] Zaladowano %d skrytek osobistych.", gTotalStorages);
    return 1;
}

stock Storage_Save(stid)
{
    if(stid < 0 || stid >= gTotalStorages) return 0;
    if(gStorageData[stid][st_sql_id] <= 0) return 0;
    
    new szQuery[750];
    format(szQuery, sizeof(szQuery),
        "UPDATE `personal_storages` SET `fabrics` = %d, `metals` = %d, `mats` = %d, `chemicals` = %d, \
        `acetone` = %d, `toluene` = %d, `lithium` = %d, `sodium` = %d, `calcium` = %d, \
        `tools` = %d, `clothes` = %d, `furniture` = %d, `electronics` = %d, \
        `bot1_type` = %d, `bot2_type` = %d, `bot3_type` = %d, \
        `production_enabled` = %d \
        WHERE `id` = %d",
        gStorageData[stid][st_fabrics], gStorageData[stid][st_metals], 
        gStorageData[stid][st_mats], gStorageData[stid][st_chemicals],
        gStorageData[stid][st_acetone], gStorageData[stid][st_toluene],
        gStorageData[stid][st_lithium], gStorageData[stid][st_sodium],
        gStorageData[stid][st_calcium],
        gStorageData[stid][st_tools], gStorageData[stid][st_clothes],
        gStorageData[stid][st_furniture], gStorageData[stid][st_electronics],
        gStorageData[stid][st_bot1_type], gStorageData[stid][st_bot2_type], 
        gStorageData[stid][st_bot3_type],
        gStorageData[stid][st_production_enabled] ? 1 : 0,
        gStorageData[stid][st_sql_id]);
    
    mysql_tquery(Database, szQuery, "", "");
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:skrytka(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /skrytka - zarzadzaj swoja skrytka");
    
    return Storage_ShowMenu(playerid);
}

YCMD:kupskrytke(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /kupskrytke [tier] - kup skrytke (1=Podstawowa, 2=Zaawansowana, 3=Garaz)");
    
    new tier;
    if(sscanf(params, "d", tier))
        return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /kupskrytke [1-3]");
    
    if(tier < 1 || tier > 3)
        return sendErrorMessage(playerid, "Nieprawidlowy poziom. Wybierz 1, 2 lub 3.");
    
    // Sprawdz czy gracz ma juz skrytke
    new stid = Storage_GetPlayerStorage(playerid);
    if(stid != -1)
        return sendErrorMessage(playerid, "Masz juz skrytke. Uzyj /skrytka aby ja otworzyc.");
    
    new price = Storage_GetPrice(tier);
    if(kaska[playerid] < price)
        return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
    
    // Sprawdz pozycje gracza
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // Walidacja lokalizacji
    if(!Storage_IsValidLocation(x, y, z))
    {
        new szMsg[256];
        if(Storage_IsTooCloseToDepot(x, y, z))
            format(szMsg, sizeof(szMsg), "Nie mozesz postawic skrytki tak blisko depotow. Minimalna odleglosc: %.0f metrow.", STORAGE_MIN_DISTANCE_FROM_DEPOT);
        else if(Storage_IsTooCloseToStorage(x, y, z))
            format(szMsg, sizeof(szMsg), "Nie mozesz postawic skrytki tak blisko innej skrytki. Minimalna odleglosc: %.0f metrow.", STORAGE_MIN_DISTANCE_FROM_STORAGE);
        else
            format(szMsg, sizeof(szMsg), "Ta lokalizacja nie jest odpowiednia do postawienia skrytki.");
        
        return sendErrorMessage(playerid, szMsg);
    }
    
    // Utworz skrytke
    
    new id = gTotalStorages;
    gStorageData[id][st_owner_uid] = PlayerInfo[playerid][pUID];
    gStorageData[id][st_tier] = tier;
    gStorageData[id][st_ent_pos][0] = x;
    gStorageData[id][st_ent_pos][1] = y;
    gStorageData[id][st_ent_pos][2] = z;
    gStorageData[id][st_exit_pos][0] = 1405.3120;
    gStorageData[id][st_exit_pos][1] = -8.2928;
    gStorageData[id][st_exit_pos][2] = 1000.9130;
    gStorageData[id][st_interior] = 1;
    // Virtual World zostanie ustawiony po utworzeniu w bazie (w Storage_OnCreate)
    gStorageData[id][st_fabrics] = 0;
    gStorageData[id][st_metals] = 0;
    gStorageData[id][st_mats] = 0;
    gStorageData[id][st_chemicals] = 0;
    gStorageData[id][st_acetone] = 0;
    gStorageData[id][st_toluene] = 0;
    gStorageData[id][st_lithium] = 0;
    gStorageData[id][st_sodium] = 0;
    gStorageData[id][st_calcium] = 0;
    gStorageData[id][st_tools] = 0;
    gStorageData[id][st_clothes] = 0;
    gStorageData[id][st_furniture] = 0;
    gStorageData[id][st_electronics] = 0;
    gStorageData[id][st_bot1_type] = PRODUCTION_TYPE_NONE;
    gStorageData[id][st_bot2_type] = PRODUCTION_TYPE_NONE;
    gStorageData[id][st_bot3_type] = PRODUCTION_TYPE_NONE;
    gStorageData[id][st_production_enabled] = true; // Domyslnie wlaczona
    
    new szQuery[512];
    format(szQuery, sizeof(szQuery),
        "INSERT INTO `personal_storages` (`owner_uid`, `tier`, `ent_x`, `ent_y`, `ent_z`, `exit_x`, `exit_y`, `exit_z`) \
        VALUES (%d, %d, %f, %f, %f, %f, %f, %f)",
        PlayerInfo[playerid][pUID], tier, x, y, z, 
        gStorageData[id][st_exit_pos][0], gStorageData[id][st_exit_pos][1], gStorageData[id][st_exit_pos][2]);
    
    mysql_tquery(Database, szQuery, "Storage_OnCreate", "d", id);
    gTotalStorages++;
    
    DajKaseDone(playerid, -price);
    va_SendClientMessage(playerid, COLOR_GREEN, "* Kupiles skrytke poziomu %s za $%d.", Storage_GetTierName(tier), price);
    
    return 1;
}

forward Storage_OnCreate(stid);
public Storage_OnCreate(stid)
{
    gStorageData[stid][st_sql_id] = cache_insert_id();
    gStorageData[stid][st_virtualworld] = 3000 + gStorageData[stid][st_sql_id];
    Storage_Save(stid);
    Storage_Refresh(stid);
    return 1;
}

YCMD:getpos(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /getpos - pokazuje swoja pozycje");
    
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    SendClientMessage(playerid, COLOR_WHITE, "Twoja pozycja to: %.2f, %.2f, %.2f", x, y, z);

    return 1;
}

//end
