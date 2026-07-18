
// Opis: System dilerow NPC - punkty skupu narkotykow dla solo graczy

#include <YSI_Coding\y_hooks>

//------------------<[ Funkcje: ]>-------------------

stock Dealers_Add(const name[], Float:x, Float:y, Float:z, Float:angle, interior = 0, virtualworld = 0)
{
    if(gTotalDrugDealers >= MAX_DRUG_DEALERS) return -1;
    
    new id = gTotalDrugDealers;
    
    gDrugDealers[id][dealer_id] = id;
    format(gDrugDealers[id][dealer_name], 48, name);
    gDrugDealers[id][dealer_x] = x;
    gDrugDealers[id][dealer_y] = y;
    gDrugDealers[id][dealer_z] = z;
    gDrugDealers[id][dealer_angle] = angle;
    gDrugDealers[id][dealer_interior] = interior;
    gDrugDealers[id][dealer_virtualworld] = virtualworld;
    
    // Utworz NPC aktora
    gDrugDealers[id][dealer_actor] = CreateActor(28, x, y, z, angle); // Skin 28 - dealer
    SetActorVirtualWorld(gDrugDealers[id][dealer_actor], virtualworld);
    
    // Utworz label
    new szLabel[150];
    format(szLabel, sizeof(szLabel), "{FF6600}%s\n{FFFFFF}Skup narkotykow\n{AAAAAA}Uzyj: {FFFFFF}/sprzedajdiler", name);
    gDrugDealers[id][dealer_label] = CreateDynamic3DTextLabel(szLabel, 0xFFFFFFFF, x, y, z + 0.5, 10.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, virtualworld, interior, -1, 20.0);
    
    
    // Zapisz bazowe ceny
    for(new i = 0; i < 6; i++)
    {
        gDrugDealers[id][dealer_base_prices][i] = gDealerPrices[i];
    }
    
    gTotalDrugDealers++;
    return id;
}

stock Dealers_GetNearest(playerid, Float:range = 3.0)
{
    for(new i = 0; i < gTotalDrugDealers; i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, range, gDrugDealers[i][dealer_x], gDrugDealers[i][dealer_y], gDrugDealers[i][dealer_z]))
        {
            if(GetPlayerInterior(playerid) == gDrugDealers[i][dealer_interior] &&
               GetPlayerVirtualWorld(playerid) == gDrugDealers[i][dealer_virtualworld])
                return i;
        }
    }
    return -1;
}

stock Dealers_GetDrugPrice(itemType, dealerid = -1)
{
    new basePrice = 0;
    new priceIndex = -1;
    
    switch(itemType)
    {
        case ITEM_TYPE_COCAINE_P: { basePrice = gDealerPrices[0]; priceIndex = 0; }
        case ITEM_TYPE_COCAINE_N: { basePrice = gDealerPrices[1]; priceIndex = 1; }
        case ITEM_TYPE_COCAINE_G: { basePrice = gDealerPrices[2]; priceIndex = 2; }
        case ITEM_TYPE_COCAINE_E: { basePrice = gDealerPrices[3]; priceIndex = 3; }
        case ITEM_TYPE_HEROIN: { basePrice = gDealerPrices[4]; priceIndex = 4; }
        case ITEM_TYPE_METH: { basePrice = gDealerPrices[5]; priceIndex = 5; }
    }
    
    if(basePrice == 0 || priceIndex == -1) return 0;
    
    return basePrice;
}

stock Dealers_AddLocation(Float:x, Float:y, Float:z, Float:angle, interior = 0, virtualworld = 0)
{
    if(gTotalDealerLocations >= MAX_DEALER_LOCATIONS) return -1;
    
    new id = gTotalDealerLocations;
    gDealerLocations[id][loc_x] = x;
    gDealerLocations[id][loc_y] = y;
    gDealerLocations[id][loc_z] = z;
    gDealerLocations[id][loc_angle] = angle;
    gDealerLocations[id][loc_interior] = interior;
    gDealerLocations[id][loc_virtualworld] = virtualworld;
    gTotalDealerLocations++;
    return id;
}

stock Dealers_RandomizePrices()
{
    gDealerPrices[0] = DEALER_PRICE_COCAINE_P_MIN + random(DEALER_PRICE_COCAINE_P_MAX - DEALER_PRICE_COCAINE_P_MIN + 1);
    gDealerPrices[1] = DEALER_PRICE_COCAINE_N_MIN + random(DEALER_PRICE_COCAINE_N_MAX - DEALER_PRICE_COCAINE_N_MIN + 1);
    gDealerPrices[2] = DEALER_PRICE_COCAINE_G_MIN + random(DEALER_PRICE_COCAINE_G_MAX - DEALER_PRICE_COCAINE_G_MIN + 1);
    gDealerPrices[3] = DEALER_PRICE_COCAINE_E_MIN + random(DEALER_PRICE_COCAINE_E_MAX - DEALER_PRICE_COCAINE_E_MIN + 1);
    gDealerPrices[4] = DEALER_PRICE_HEROIN_MIN + random(DEALER_PRICE_HEROIN_MAX - DEALER_PRICE_HEROIN_MIN + 1);
    gDealerPrices[5] = DEALER_PRICE_METH_MIN + random(DEALER_PRICE_METH_MAX - DEALER_PRICE_METH_MIN + 1);
    
    printf("[DEALERS] Wylosowano ceny: Coke P=$%d, N=$%d, G=$%d, E=$%d, Hero=$%d, Meth=$%d",
        gDealerPrices[0], gDealerPrices[1], gDealerPrices[2], gDealerPrices[3], gDealerPrices[4], gDealerPrices[5]);
    
    // Zaktualizuj bazowe ceny dla wszystkich aktywnych dilerow
    for(new i = 0; i < gTotalDrugDealers; i++)
    {
        for(new j = 0; j < 6; j++)
        {
            gDrugDealers[i][dealer_base_prices][j] = gDealerPrices[j];
        }
    }
}

stock Dealers_ClearAll()
{
    for(new i = 0; i < gTotalDrugDealers; i++)
    {
        if(gDrugDealers[i][dealer_actor] != INVALID_ACTOR_ID)
        {
            DestroyActor(gDrugDealers[i][dealer_actor]);
            gDrugDealers[i][dealer_actor] = INVALID_ACTOR_ID;
        }
        if(IsValidDynamic3DTextLabel(gDrugDealers[i][dealer_label]))
        {
            DestroyDynamic3DTextLabel(gDrugDealers[i][dealer_label]);
            gDrugDealers[i][dealer_label] = Text3D:-1;
        }
    }
    gTotalDrugDealers = 0;
}

stock Dealers_SpawnRandom(count = 3)
{
    if(gTotalDealerLocations < count) count = gTotalDealerLocations;
    if(count <= 0) return 0;
    
    // Tablica uzytych lokalizacji
    new bool:usedLocations[MAX_DEALER_LOCATIONS];
    for(new i = 0; i < MAX_DEALER_LOCATIONS; i++) usedLocations[i] = false;
    
    new names[][] = {"Shady Pete", "Vince", "El Serpiente", "Rico", "Manny", "The Ghost", "Snake", "Diablo"};
    new spawned = 0;
    
    while(spawned < count)
    {
        new locId = random(gTotalDealerLocations);
        if(usedLocations[locId]) continue;
        
        usedLocations[locId] = true;
        new nameId = random(sizeof(names));
        
        Dealers_Add(names[nameId], 
            gDealerLocations[locId][loc_x],
            gDealerLocations[locId][loc_y],
            gDealerLocations[locId][loc_z],
            gDealerLocations[locId][loc_angle],
            gDealerLocations[locId][loc_interior],
            gDealerLocations[locId][loc_virtualworld]);
        
        spawned++;
    }
    
    return spawned;
}

stock Dealers_GetDrugName(itemType)
{
    new szName[32];
    switch(itemType)
    {
        case ITEM_TYPE_COCAINE_P: szName = "Kokaina (P)";
        case ITEM_TYPE_COCAINE_N: szName = "Kokaina (N)";
        case ITEM_TYPE_COCAINE_G: szName = "Kokaina (G)";
        case ITEM_TYPE_COCAINE_E: szName = "Kokaina (E)";
        case ITEM_TYPE_HEROIN: szName = "Heroina";
        case ITEM_TYPE_METH: szName = "Metamfetamina";
        default: szName = "Nieznany";
    }
    return szName;
}

stock Dealers_ShowSellMenu(playerid)
{
    new dealerid = Dealers_GetNearest(playerid);
    if(dealerid == -1)
        return sendErrorMessage(playerid, "Nie jestes przy zadnym dilerze.");
    
    // Znajdz przedmioty gracza ktore moze sprzedac
    new szDialog[600], count = 0;
    
    format(szDialog, sizeof(szDialog), "{FFFFFF}Wybierz co chcesz sprzedac:\n\n");
    
    // Sprawdz kazdy typ narkotyku
    new itemTypes[] = {ITEM_TYPE_COCAINE_P, ITEM_TYPE_COCAINE_N, ITEM_TYPE_COCAINE_G, ITEM_TYPE_COCAINE_E, ITEM_TYPE_HEROIN, ITEM_TYPE_METH};
    
    for(new i = 0; i < sizeof(itemTypes); i++)
    {
        new itemId = HasItemType(playerid, itemTypes[i]);
        if(itemId != -1)
        {
            new amount = Item[itemId][i_Quantity];
            if(amount <= 0) amount = 1;
            
            new price = Dealers_GetDrugPrice(itemTypes[i], dealerid);
            if(price <= 0 || amount > 100000000 / price) continue;
            new totalPrice = price * amount;
            
            new szLine[100];
            format(szLine, sizeof(szLine), "%s (x%d) - {00FF00}$%d\n", 
                Dealers_GetDrugName(itemTypes[i]), amount, totalPrice);
            strcat(szDialog, szLine);
            count++;
        }
    }
    
    if(count == 0)
    {
        return sendErrorMessage(playerid, "Nie masz zadnych narkotykow do sprzedania.");
    }
    
    ShowPlayerDialog(playerid, DIALOG_DEALER_SELL, DIALOG_STYLE_LIST, 
        "Sprzedaj narkotyki", szDialog, "Sprzedaj", "Anuluj");
    
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja dilerow
    for(new i = 0; i < MAX_DRUG_DEALERS; i++)
    {
        gDrugDealers[i][dealer_actor] = INVALID_ACTOR_ID;
        gDrugDealers[i][dealer_label] = Text3D:-1;
    }
    
    // Zaladuj dilerow (z opoznieniem aby baza danych byla gotowa)
    SetTimerEx("Dealers_Load", 3000, false, "");
    
    print("[DEALERS] System dilerow NPC zaladowany.");
    return 1;
}

//------------------<[ Publiczne: ]>-------------------

public Dealers_Load()
{
    // Dodaj mozliwe lokalizacje dilerow
    Dealers_AddLocation(2166.5, -1675.3, 15.0, 180.0, 0, 0);      // Idlewood
    Dealers_AddLocation(2495.3, -1687.5, 13.5, 0.0, 0, 0);        // Ganton
    Dealers_AddLocation(1480.0, -1770.5, 18.7, 90.0, 0, 0);       // El Corona
    Dealers_AddLocation(2352.1, -1170.2, 28.0, 270.0, 0, 0);      // Jefferson
    Dealers_AddLocation(-2027.4, 156.5, 28.8, 180.0, 0, 0);       // SF Chinatown
    Dealers_AddLocation(2135.5, 2358.7, 10.8, 0.0, 0, 0);         // LV area
    
    // Losuj ceny
    Dealers_RandomizePrices();
    
    // Losowo spawn 2 dilerow z dostepnych lokalizacji
    new spawned = Dealers_SpawnRandom(2);
    
    
    printf("[DEALERS] Zaladowano %d lokalizacji, zespawnowano %d dilerow NPC.", gTotalDealerLocations, spawned);
    return 1;
}

//------------------<[ Dialogi: ]>-------------------

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_DEALER_SELL)
    {
        if(!response) return 1;
        
        new dealerid = Dealers_GetNearest(playerid);
        if(dealerid == -1)
            return sendErrorMessage(playerid, "Oddalliles sie od dilera.");
        
        // Znajdz przedmiot na podstawie listitem
        new itemTypes[] = {ITEM_TYPE_COCAINE_P, ITEM_TYPE_COCAINE_N, ITEM_TYPE_COCAINE_G, ITEM_TYPE_COCAINE_E, ITEM_TYPE_HEROIN, ITEM_TYPE_METH};
        new selectedType = -1;
        new currentIndex = 0;
        
        for(new i = 0; i < sizeof(itemTypes); i++)
        {
            new itemId = HasItemType(playerid, itemTypes[i]);
            if(itemId != -1)
            {
                if(currentIndex == listitem)
                {
                    selectedType = itemTypes[i];
                    break;
                }
                currentIndex++;
            }
        }
        
        if(selectedType == -1)
            return sendErrorMessage(playerid, "Nie znaleziono przedmiotu.");
        
        new itemId = HasItemType(playerid, selectedType);
        if(itemId == -1)
            return sendErrorMessage(playerid, "Nie masz juz tego przedmiotu.");
        
        new amount = Item[itemId][i_Quantity];
        if(amount <= 0) amount = 1;
        
        new price = Dealers_GetDrugPrice(selectedType, dealerid);
        if(price <= 0 || amount <= 0 || amount > 100000000 / price)
            return sendErrorMessage(playerid, "Ilosc lub wartosc przedmiotu jest nieprawidlowa.");
        new totalPrice = price * amount;
        
        // Usun przedmiot i daj kase
        Item_Delete(itemId, true, amount);
        DajKaseDone(playerid, totalPrice);
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Sprzedales %s (x%d) za $%d.", 
            Dealers_GetDrugName(selectedType), amount, totalPrice);
        
        // Log transakcji
        Log(payLog, WARNING, "%s sprzedal dilerowi %s: %s (x%d) za $%d. Diler: %s [ID:%d]",
            GetPlayerLogName(playerid),
            gDrugDealers[dealerid][dealer_name],
            Dealers_GetDrugName(selectedType),
            amount,
            totalPrice,
            gDrugDealers[dealerid][dealer_name],
            dealerid);
        
        Log(itemLog, WARNING, "%s sprzedal przedmiot dilerowi: %s (x%d), Item UID: %d",
            GetPlayerLogName(playerid),
            Dealers_GetDrugName(selectedType),
            amount,
            Item[itemId][i_UID]);
        
        new szAction[128];
        format(szAction, sizeof(szAction), "* %s sprzedaje cos dilerowi.", GetNick(playerid));
        ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        
        return 1;
    }
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:sprzedajdiler(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /sprzedajdiler - sprzedaj narkotyki dilerowi NPC");
    
    return Dealers_ShowSellMenu(playerid);
}

YCMD:dilerzy(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /dilerzy - lista dilerow i ich cen");
    
    SendClientMessage(playerid, COLOR_GREEN, "=== AKTUALNE CENY SKUPU U DILEROW ===");
    va_SendClientMessage(playerid, COLOR_WHITE, "Kokaina (P): $%d/szt | Kokaina (N): $%d/szt", gDealerPrices[0], gDealerPrices[1]);
    va_SendClientMessage(playerid, COLOR_WHITE, "Kokaina (G): $%d/szt | Kokaina (E): $%d/szt", gDealerPrices[2], gDealerPrices[3]);
    va_SendClientMessage(playerid, COLOR_WHITE, "Heroina: $%d/g | Metamfetamina: $%d/g", gDealerPrices[4], gDealerPrices[5]);
    return 1;
}

//end
