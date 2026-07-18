
// Opis: System laboratoriow narkotykowych z NPC workerami do produkcji kokainy

#include <YSI_Coding\y_hooks>

forward Crates_IsPlayerCarrying(playerid);
forward Crates_GetPlayerCrateType(playerid);
forward Crates_ClearPlayer(playerid);

//------------------<[ Funkcje: ]>-------------------

stock DrugLab_FindPlayerCocaine(playerid, const name[])
{
    foreach(new x : PlayerItems[playerid])
    {
        new i = PlayerItem[playerid][x][player_item_id];
        if(i == -1) continue;
        if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER || Item[i][i_Owner] != PlayerInfo[playerid][pUID])
            continue;
        if(Item[i][i_ItemType] == ITEM_TYPE_OTHER && !strcmp(Item[i][i_Name], name, true))
            return i;
    }
    return -1;
}

stock DrugLab_GetActorSkin(level)
{
    switch(level)
    {
        case 1: return 145;
        case 2: return 146;
        case 3: return 147;
        case 4: return 148;
    }
    return 145;
}

stock DrugLab_GetCocaineName(type)
{
    new szName[32];
    switch(type)
    {
        case COCAINE_TYPE_P: szName = "Kokaina (P)";
        case COCAINE_TYPE_N: szName = "Kokaina (N)";
        case COCAINE_TYPE_G: szName = "Kokaina (G)";
        case COCAINE_TYPE_E: szName = "Kokaina (E)";
    }
    return szName;
}

stock DrugLab_GetUpgradeCost(level)
{
    switch(level)
    {
        case 1: return NPC_UPGRADE_COST_1;
        case 2: return NPC_UPGRADE_COST_2;
        case 3: return NPC_UPGRADE_COST_3;
        case 4: return NPC_UPGRADE_COST_4;
    }
    return 0;
}

stock DrugLab_RefreshActors(dlid, actorid = -1)
{
    if(dlid < 0 || dlid >= gTotalDrugLabs) return 0;
    if(gDrugLabData[dlid][dl_sql_id] <= 0) return 0;
    
    // Jesli podano konkretnego aktora - usun go
    if(actorid != -1 && actorid < MAX_LAB_ACTORS)
    {
        if(IsValidActor(gDrugLabData[dlid][dl_actor][actorid]))
            DestroyActor(gDrugLabData[dlid][dl_actor][actorid]);
        gDrugLabData[dlid][dl_actor][actorid] = INVALID_ACTOR_ID;
    }
    
    // Utworz/odswierz aktorow
    for(new i = 0; i < MAX_LAB_ACTORS; i++)
    {
        if(gDrugLabData[dlid][dl_actor_level][i] > 0)
        {
            if(!IsValidActor(gDrugLabData[dlid][dl_actor][i]))
            {
                gDrugLabData[dlid][dl_actor][i] = CreateActor(
                    DrugLab_GetActorSkin(gDrugLabData[dlid][dl_actor_level][i]),
                    gActorPositions[i][0],
                    gActorPositions[i][1],
                    gActorPositions[i][2],
                    gActorPositions[i][3]);
                
                if(IsValidActor(gDrugLabData[dlid][dl_actor][i]))
                {
                    SetActorHealth(gDrugLabData[dlid][dl_actor][i], 100.0);
                    SetActorVirtualWorld(gDrugLabData[dlid][dl_actor][i], 1000 + dlid);
                    ApplyActorAnimation(gDrugLabData[dlid][dl_actor][i], 
                        gActorAnimations[i][0], gActorAnimations[i][1], 
                        4.0, 1, 0, 0, 0, 0);
                }
            }
        }
    }
    
    return 1;
}

stock DrugLab_Refresh(dlid)
{
    if(dlid < 0 || dlid >= gTotalDrugLabs) return 0;
    if(gDrugLabData[dlid][dl_sql_id] <= 0) return 0;
    
    // Usun stare elementy
    if(IsValidDynamic3DTextLabel(gDrugLabData[dlid][dl_label]))
        DestroyDynamic3DTextLabel(gDrugLabData[dlid][dl_label]);
    
    if(IsValidDynamicPickup(gDrugLabData[dlid][dl_pickup]))
        DestroyDynamicPickup(gDrugLabData[dlid][dl_pickup]);
    
    if(IsValidDynamic3DTextLabel(gDrugLabData[dlid][dl_seeds_label]))
        DestroyDynamic3DTextLabel(gDrugLabData[dlid][dl_seeds_label]);
    
    if(IsValidDynamicPickup(gDrugLabData[dlid][dl_seeds_pickup]))
        DestroyDynamicPickup(gDrugLabData[dlid][dl_seeds_pickup]);
    
    if(IsValidDynamicArea(gDrugLabData[dlid][dl_area]))
        DestroyDynamicArea(gDrugLabData[dlid][dl_area]);
    
    new szString[300];
    
    gDrugLabData[dlid][dl_pickup] = CreateDynamicPickup(
        DRUGLAB_PICKUP_MODEL, 1, 
        gDrugLabData[dlid][dl_ent_pos][0], 
        gDrugLabData[dlid][dl_ent_pos][1], 
        gDrugLabData[dlid][dl_ent_pos][2], 
        0, 0);
    
    if(gDrugLabData[dlid][dl_org_owner] != -1)
    {
        // Lab nalezacy do organizacji
        new orgName[64];
        if(gDrugLabData[dlid][dl_org_owner] > 0 && gDrugLabData[dlid][dl_org_owner] < MAX_GROUPS && GroupInfo[gDrugLabData[dlid][dl_org_owner]][g_UID] > 0)
            format(orgName, sizeof(orgName), "%s", GroupInfo[gDrugLabData[dlid][dl_org_owner]][g_Name]);
        else
            format(orgName, sizeof(orgName), "Organizacja #%d", gDrugLabData[dlid][dl_org_owner]);
        
        format(szString, sizeof(szString), 
            "{FFFFFF}[ LABORATORIUM #%d ]\n{00FF00}Wlasciciel: {FFFFFF}%s\n{FFFFFF}Wejscie: Nacisnij {00FF00}Y",
            dlid, orgName);
    }
    else if(gDrugLabData[dlid][dl_player_owner] != 0)
    {
        // Lab nalezacy do gracza prywatnie
        format(szString, sizeof(szString), 
            "{FFFFFF}[ LABORATORIUM #%d ]\n{00FF00}Wlasciciel: {FFFFFF}Prywatne\n{FFFFFF}Wejscie: Nacisnij {00FF00}Y",
            dlid);
    }
    else
    {
        // Lab na sprzedaz
        format(szString, sizeof(szString), 
            "{FFFFFF}[ LABORATORIUM #%d ]\n{00FF00}Na sprzedaz\n{FFFFFF}Cena: {00FF00}$%d\n{FFFFFF}Komenda: {00FF00}/kuplab",
            dlid, gDrugLabData[dlid][dl_price]);
    }
    
    gDrugLabData[dlid][dl_label] = CreateDynamic3DTextLabel(szString, 0xFFFFFFFF, 
        gDrugLabData[dlid][dl_ent_pos][0], 
        gDrugLabData[dlid][dl_ent_pos][1], 
        gDrugLabData[dlid][dl_ent_pos][2], 
        5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
    
    // Utworz pickup i label dla nasion wewnatrz laboratorium (interior 1, VW = 1000 + dlid)
    gDrugLabData[dlid][dl_seeds_pickup] = CreateDynamicPickup(
        1239, 1, 1412.5, -1.5, 1000.9130, 
        1000 + dlid, 1);
    
    format(szString, sizeof(szString), 
        "{FFFFFF}[ NASIONA ]\n{00FF00}Ilosc: {FFFFFF}%d/%d\n{FFFFFF}Komenda: {00FF00}/weznasiona",
        gDrugLabData[dlid][dl_seeds], MAX_LAB_SEEDS);
    
    gDrugLabData[dlid][dl_seeds_label] = CreateDynamic3DTextLabel(szString, 0xFFFFFFFF, 
        1412.5, -1.5, 1000.9130, 5.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 
        1000 + dlid, 1);
    
    // Utworz pickup i label przy wyjsciu
    CreateDynamicPickup(1318, 1, 1405.3120, -8.2928, 1000.9130, 1000 + dlid, 1);
    CreateDynamic3DTextLabel("{FFFFFF}[ WYJSCIE ]\n{00FF00}Nacisnij Y", 0xFFFFFFFF, 
        1405.3120, -8.2928, 1000.9130, 5.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 
        1000 + dlid, 1);
    
    // Utworz obszar do rozladunku skrzynek (tylko jesli laboratorium ma wlasciciela)
    if(gDrugLabData[dlid][dl_org_owner] != -1 || gDrugLabData[dlid][dl_player_owner] != 0)
    {
        gDrugLabData[dlid][dl_area] = CreateDynamicCircle(
            gDrugLabData[dlid][dl_ent_pos][0], 
            gDrugLabData[dlid][dl_ent_pos][1], 
            3.0);
    }
    
    // Odswierz aktorow
    DrugLab_RefreshActors(dlid);
    
    return 1;
}

stock DrugLab_RefreshSeedsLabel(dlid)
{
    if(dlid < 0 || dlid >= gTotalDrugLabs) return 0;
    
    new szString[128];
    format(szString, sizeof(szString), 
        "{FFFFFF}[ NASIONA ]\n{00FF00}Ilosc: {FFFFFF}%d/%d\n{FFFFFF}Komenda: {00FF00}/weznasiona",
        gDrugLabData[dlid][dl_seeds], MAX_LAB_SEEDS);
    
    UpdateDynamic3DTextLabelText(gDrugLabData[dlid][dl_seeds_label], 0xFFFFFFFF, szString);
    return 1;
}

stock DrugLab_GetNearest(playerid, Float:range = 3.0)
{
    for(new i = 0; i < gTotalDrugLabs; i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, range, 
            gDrugLabData[i][dl_ent_pos][0], 
            gDrugLabData[i][dl_ent_pos][1], 
            gDrugLabData[i][dl_ent_pos][2]))
            return i;
    }
    return -1;
}

stock DrugLab_GetPlayerLab(playerid)
{
    // Jesli zmienna jest ustawiona, uzyj jej
    if(gPlayerInDrugLab[playerid] != -1)
        return gPlayerInDrugLab[playerid];
    
    // W przeciwnym razie sprawdz VW gracza (np. po reconnect)
    new vw = GetPlayerVirtualWorld(playerid);
    if(vw >= 1000 && vw < 2000)
    {
        new dlid = vw - 1000;
        if(dlid >= 0 && dlid < gTotalDrugLabs)
        {
            gPlayerInDrugLab[playerid] = dlid;
            return dlid;
        }
    }
    return -1;
}

stock DrugLab_ShowMenu(playerid)
{
    new dlid = DrugLab_GetPlayerLab(playerid);
    if(dlid == -1)
        return sendErrorMessage(playerid, "Nie jestes w zadnym laboratorium.");
    
    new szTitle[128], szDialog[200];
    format(szTitle, sizeof(szTitle), "Laboratorium (Nasiona: %d, P:%dg N:%dg G:%dg E:%dg)",
        gDrugLabData[dlid][dl_seeds],
        gDrugLabData[dlid][dl_safe_cocaine][0],
        gDrugLabData[dlid][dl_safe_cocaine][1],
        gDrugLabData[dlid][dl_safe_cocaine][2],
        gDrugLabData[dlid][dl_safe_cocaine][3]);
    
    format(szDialog, sizeof(szDialog), 
        "Wez kokaine z sejfu\n\
Zarzadzaj NPC pracownikami\n\
Kup nasiona\n\
%s produkcje", gDrugLabData[dlid][dl_production_enabled] ? "Wylacz" : "Wlacz");
    
    ShowPlayerDialog(playerid, DIALOG_DRUGLAB_MENU, DIALOG_STYLE_LIST, 
        szTitle, szDialog, "Wybierz", "Zamknij");
    
    return 1;
}

stock DrugLab_ShowActorsMenu(playerid)
{
    new dlid = DrugLab_GetPlayerLab(playerid);
    if(dlid == -1)
        return sendErrorMessage(playerid, "Nie jestes w zadnym laboratorium.");
    
    new szTitle[128], szDialog[128];
    
    // Policz pracownikow
    new actorCount = 0;
    for(new i = 0; i < MAX_LAB_ACTORS; i++)
    {
        if(gDrugLabData[dlid][dl_actor_level][i] > 0)
            actorCount++;
    }
    
    format(szTitle, sizeof(szTitle), "NPC Pracownicy (%d/%d zatrudnionych)", actorCount, MAX_LAB_ACTORS);
    format(szDialog, sizeof(szDialog), 
        "Zatrudnij pracownika\n\
Ulepsz pracownika\n\
Zwolnij pracownika");
    
    ShowPlayerDialog(playerid, DIALOG_DRUGLAB_ACTORS, DIALOG_STYLE_LIST, 
        szTitle, szDialog, "Wybierz", "Powrot");
    
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja
    for(new i = 0; i < MAX_DRUG_LABS; i++)
    {
        gDrugLabData[i][dl_sql_id] = 0;
        gDrugLabData[i][dl_org_owner] = -1;
        gDrugLabData[i][dl_pickup] = -1;
        gDrugLabData[i][dl_label] = Text3D:-1;
        gDrugLabData[i][dl_seeds_pickup] = -1;
        gDrugLabData[i][dl_seeds_label] = Text3D:-1;
        gDrugLabData[i][dl_area] = -1;
        
        for(new j = 0; j < MAX_LAB_ACTORS; j++)
        {
            gDrugLabData[i][dl_actor_level][j] = 0;
            gDrugLabData[i][dl_actor][j] = INVALID_ACTOR_ID;
        }
        
        for(new j = 0; j < 4; j++)
            gDrugLabData[i][dl_safe_cocaine][j] = 0;
        gDrugLabData[i][dl_production_enabled] = true; // Domyslnie wlaczona
    }
    
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        gPlayerInDrugLab[i] = -1;
        gPlayerChosenDrugSlot[i] = -1;
        gPlayerChosenActorSlot[i] = -1;
    }
    
    // Jeden cykl co 10 minut. Poprzednie 60 sekund pozwalalo jednemu laboratorium
    // generowac do ok. 2,1 mln $/h przy maksymalnej obsadzie i cenie dilera.
    SetTimer("DrugLab_ProductionCycle", 600000, true);
    return 1;
}

hook OnPlayerConnect(playerid)
{
    gPlayerInDrugLab[playerid] = -1;
    gPlayerChosenDrugSlot[playerid] = -1;
    gPlayerChosenActorSlot[playerid] = -1;
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_YES)) // Klawisz Y
    {
        // Wejscie do laboratorium
        if(gPlayerInDrugLab[playerid] == -1)
        {
            new dlid = DrugLab_GetNearest(playerid);
            if(dlid != -1)
            {
                if(gDrugLabData[dlid][dl_org_owner] == -1 && gDrugLabData[dlid][dl_player_owner] == 0)
                {
                    sendErrorMessage(playerid, "To laboratorium nie jest jeszcze kupione. Uzyj /kuplab");
                }
                else
                {
                    // Blokada dla sluzb porzadkowych
                    if(IsPlayerInGovOrg(playerid))
                    {
                        sendErrorMessage(playerid, "Jako funkcjonariusz sluzb porzadkowych nie mozesz korzystac z laboratorium.");
                        return 1;
                    }
                    
                    new bool:canEnter = false;
                    
                    // Sprawdz czy gracz jest wlascicielem prywatnym
                    if(gDrugLabData[dlid][dl_player_owner] == PlayerInfo[playerid][pUID])
                        canEnter = true;
                    
                    // Sprawdz czy gracz nalezy do organizacji-wlasciciela
                    if(!canEnter && gDrugLabData[dlid][dl_org_owner] != -1)
                    {
                        new orgid = GetPlayerIllegalOrg(playerid);
                        if(orgid == gDrugLabData[dlid][dl_org_owner])
                            canEnter = true;
                    }
                    
                    if(canEnter)
                    {
                        SetPlayerPos(playerid, 1405.3120, -8.2928, 1000.9130);
                        SetPlayerInterior(playerid, 1);
                        SetPlayerVirtualWorld(playerid, 1000 + dlid);
                        gPlayerInDrugLab[playerid] = dlid;
                        SendClientMessage(playerid, COLOR_GREEN, "* Wszedles do laboratorium.");
                    }
                    else
                    {
                        sendErrorMessage(playerid, "Nie jestes wlascicielem tego laboratorium.");
                    }
                }
            }
        }
        // Wyjscie z laboratorium
        else
        {
            new dlid = DrugLab_GetPlayerLab(playerid);
            if(dlid != -1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1405.3120, -8.2928, 1000.9130))
            {
                SetPlayerPos(playerid, gDrugLabData[dlid][dl_ent_pos][0], gDrugLabData[dlid][dl_ent_pos][1], gDrugLabData[dlid][dl_ent_pos][2]);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, 0);
                gPlayerInDrugLab[playerid] = -1;
                SendClientMessage(playerid, COLOR_GREEN, "* Wyszedles z laboratorium.");
            }
        }
    }
    return 1;
}

hook OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    // Sprawdz czy gracz niesie skrzynke i wchodzi do obszaru laboratorium
    if(Crates_IsPlayerCarrying(playerid))
    {
        for(new i = 0; i < gTotalDrugLabs; i++)
        {
            if(areaid == gDrugLabData[i][dl_area] && 
               (gDrugLabData[i][dl_org_owner] != -1 || gDrugLabData[i][dl_player_owner] != 0))
            {
                new crateType = Crates_GetPlayerCrateType(playerid);
                
                if(crateType == CRATE_TYPE_COCAINE)
                {
                    // Rozladunek skrzynki kokainy jako nasiona (10-20 nasion)
                    new seedsAmount = 10 + random(11); // 10-20 nasion
                    
                    if(gDrugLabData[i][dl_seeds] + seedsAmount > MAX_LAB_SEEDS)
                    {
                        new szMsg[128];
                        format(szMsg, sizeof(szMsg), "Laboratorium nie ma miejsca na wiecej nasion. Maksymalna ilosc: %d", MAX_LAB_SEEDS);
                        sendErrorMessage(playerid, szMsg);
                        return 1;
                    }
                    
                    gDrugLabData[i][dl_seeds] += seedsAmount;
                    Crates_ClearPlayer(playerid);
                    
                    DrugLab_Save(i);
                    DrugLab_RefreshSeedsLabel(i);
                    
                    va_SendClientMessage(playerid, COLOR_GREEN, "* Dostarczyles skrzynke kokainy do laboratorium. Dodano %d nasion.", seedsAmount);
                    
                    new szAction[128];
                    format(szAction, sizeof(szAction), "* %s wklada skrzynke do laboratorium.", GetNick(playerid));
                    ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
                    
                    new szLog[256];
                    format(szLog, sizeof(szLog), "%s dostarczyl skrzynke kokainy do laboratorium %d. Dodano %d nasion.", 
                        GetPlayerLogName(playerid), gDrugLabData[i][dl_sql_id], seedsAmount);
                    Log(itemLog, INFO, szLog);
                }
                break;
            }
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_DRUGLAB_MENU)
    {
        if(!response) return 1;
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1)
            return sendErrorMessage(playerid, "Nie jestes w laboratorium.");
        
        switch(listitem)
        {
            case 0: // Wez kokaine
            {
                new szDialog[400];
                format(szDialog, sizeof(szDialog), \
                    "Kokaina (P) - %dg\n"\
                    "Kokaina (N) - %dg\n"\
                    "Kokaina (G) - %dg\n"\
                    "Kokaina (E) - %dg",
                    gDrugLabData[dlid][dl_safe_cocaine][0],
                    gDrugLabData[dlid][dl_safe_cocaine][1],
                    gDrugLabData[dlid][dl_safe_cocaine][2],
                    gDrugLabData[dlid][dl_safe_cocaine][3]);
                
                ShowPlayerDialog(playerid, DIALOG_DRUGLAB_SAFE_TAKE, DIALOG_STYLE_LIST,
                    "Wez kokaine", szDialog, "Wybierz", "Powrot");
            }
            case 1: // NPC
            {
                DrugLab_ShowActorsMenu(playerid);
            }
            case 2: // Kup nasiona
            {
                new szDialog[128];
                format(szDialog, sizeof(szDialog), "{FFFFFF}Wpisz ilosc nasion do kupienia.\n{00FF00}Cena: {FFFFFF}$%d za nasiono", PRICE_DRUGLAB_SEED);
                ShowPlayerDialog(playerid, DIALOG_DRUGLAB_BUY_SEEDS, DIALOG_STYLE_INPUT,
                    "Kup nasiona", 
                    szDialog,
                    "Kup", "Anuluj");
            }
            case 3: // Wlacz/Wylacz produkcje
            {
                gDrugLabData[dlid][dl_production_enabled] = !gDrugLabData[dlid][dl_production_enabled];
                DrugLab_Save(dlid);
                
                if(gDrugLabData[dlid][dl_production_enabled])
                {
                    SendClientMessage(playerid, COLOR_GREEN, "* Produkcja zostala wlaczona.");
                }
                else
                {
                    SendClientMessage(playerid, COLOR_YELLOW, "* Produkcja zostala wylaczona.");
                    // Zatrzymaj animacje aktorow
                    for(new i = 0; i < MAX_LAB_ACTORS; i++)
                    {
                        if(IsValidActor(gDrugLabData[dlid][dl_actor][i]))
                        {
                            ClearActorAnimations(gDrugLabData[dlid][dl_actor][i]);
                        }
                    }
                }
                DrugLab_ShowMenu(playerid);
            }
        }
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_SAFE_TAKE)
    {
        if(!response) return DrugLab_ShowMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        gPlayerChosenDrugSlot[playerid] = listitem;
        
        new szDialog[200];
        format(szDialog, sizeof(szDialog), 
            "{FFFFFF}Dostepne: %dg %s\n\n{FFFFFF}Wpisz ilosc do zabrania:",
            gDrugLabData[dlid][dl_safe_cocaine][listitem],
            DrugLab_GetCocaineName(listitem));
        
        ShowPlayerDialog(playerid, DIALOG_DRUGLAB_SELL, DIALOG_STYLE_INPUT,
            "Wez kokaine", szDialog, "Wez", "Powrot");
        
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_SELL)
    {
        if(!response) return DrugLab_ShowMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        new amount = strval(inputtext);
        new slot = gPlayerChosenDrugSlot[playerid];
        
        if(amount <= 0)
            return sendErrorMessage(playerid, "Nieprawidlowa ilosc.");
        
        if(amount > gDrugLabData[dlid][dl_safe_cocaine][slot])
            return sendErrorMessage(playerid, "Nie ma tyle kokainy w sejfie.");
        
        // Sprawdz miejsce w ekwipunku
        new limit = GetPlayerItemLimit(playerid);
        if(Item_Count(playerid) >= limit)
            return sendErrorMessage(playerid, "Nie masz miejsca w ekwipunku.");
        
        // Nazwy przedmiotow kokainy
        new itemName[32];
        new itemType = -1;
        switch(slot)
        {
            case 0: { itemName = "Kokaina(P)"; itemType = ITEM_TYPE_COCAINE_P; }
            case 1: { itemName = "Kokaina(N)"; itemType = ITEM_TYPE_COCAINE_N; }
            case 2: { itemName = "Kokaina(G)"; itemType = ITEM_TYPE_COCAINE_G; }
            case 3: { itemName = "Kokaina(E)"; itemType = ITEM_TYPE_COCAINE_E; }
        }
        
        if(itemType == -1) return sendErrorMessage(playerid, "Nieprawidlowy typ kokainy.");
        
        gDrugLabData[dlid][dl_safe_cocaine][slot] -= amount;
        
        // Sprawdz czy gracz ma juz taka kokaine - jesli tak, dolacz do istniejacej
        new existingItem = HasItemType(playerid, itemType);
        new newItemId = -1;
        if(existingItem != -1)
        {
            Item[existingItem][i_Quantity] += amount;
            SaveItem(existingItem);
            newItemId = existingItem;
        }
        else
        {
            newItemId = Item_Add(itemName, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], itemType, 0, 0, true, playerid, amount, 4);
        }
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Zabrales %dg %s z sejfu laboratorium.", amount, DrugLab_GetCocaineName(slot));
        
        // Log operacji
        Log(itemLog, WARNING, "%s wyjal kokaine z laboratorium: %s (x%d g). Laboratorium ID: %d, SQL ID: %d, Pozostalo w sejfie: %d g",
            GetPlayerLogName(playerid),
            DrugLab_GetCocaineName(slot),
            amount,
            dlid,
            gDrugLabData[dlid][dl_sql_id],
            gDrugLabData[dlid][dl_safe_cocaine][slot]);
        
        if(newItemId != -1)
        {
            Log(itemLog, WARNING, "%s otrzymal przedmiot z laboratorium: %s (x%d), Item UID: %d",
                GetPlayerLogName(playerid),
                itemName,
                amount,
                Item[newItemId][i_UID]);
        }
        
        DrugLab_Save(dlid);
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_BUY_SEEDS)
    {
        if(!response) return DrugLab_ShowMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        new amount = strval(inputtext);
        
        if(amount <= 0)
            return sendErrorMessage(playerid, "Nieprawidlowa ilosc.");
        
        new cost = amount * PRICE_DRUGLAB_SEED;
        
        if(kaska[playerid] < cost)
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        if(gDrugLabData[dlid][dl_seeds] + amount > MAX_LAB_SEEDS)
            return sendErrorMessage(playerid, "Laboratorium nie moze pomiescic tylu nasion.");
        
        DajKaseDone(playerid, -cost);
        gDrugLabData[dlid][dl_seeds] += amount;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Kupiles %d nasion za $%d.", amount, cost);
        
        // Log transakcji
        Log(payLog, WARNING, "%s kupil nasiona w laboratorium: %d nasion za $%d. Laboratorium ID: %d, SQL ID: %d",
            GetPlayerLogName(playerid),
            amount,
            cost,
            dlid,
            gDrugLabData[dlid][dl_sql_id]);
        
        DrugLab_Refresh(dlid);
        DrugLab_Save(dlid);
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_ACTORS)
    {
        if(!response) return DrugLab_ShowMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        switch(listitem)
        {
            case 0: // Zatrudnij
            {
                // Znajdz wolny slot
                new freeSlot = -1;
                for(new i = 0; i < MAX_LAB_ACTORS; i++)
                {
                    if(gDrugLabData[dlid][dl_actor_level][i] == 0)
                    {
                        freeSlot = i;
                        break;
                    }
                }
                
                if(freeSlot == -1)
                    return sendErrorMessage(playerid, "Wszystkie miejsca pracy sa zajete.");
                
                gPlayerChosenActorSlot[playerid] = freeSlot;
                
                new szDialog[300];
                format(szDialog, sizeof(szDialog), \
                    "{FFFFFF}Zatrudnienie pracownika na miejsce #%d\n\n"\
                    "{00FF00}Koszt: {FFFFFF}$%d\n\n"\
                    "{FFFFFF}Pracownik poziomu 1 produkuje Kokaine (P)",\
                    freeSlot + 1, NPC_UPGRADE_COST_1);
                
                ShowPlayerDialog(playerid, DIALOG_DRUGLAB_ACTOR_BUY, DIALOG_STYLE_MSGBOX,
                    "Zatrudnij pracownika", szDialog, "Zatrudnij", "Anuluj");
            }
            case 1: // Ulepsz
            {
                new szDialog[500];
                szDialog[0] = EOS;
                new count = 0;
                
                for(new i = 0; i < MAX_LAB_ACTORS; i++)
                {
                    if(gDrugLabData[dlid][dl_actor_level][i] > 0 && gDrugLabData[dlid][dl_actor_level][i] < 4)
                    {
                        new nextLevel = gDrugLabData[dlid][dl_actor_level][i] + 1;
                        format(szDialog, sizeof(szDialog), "%sPracownik #%d (Poz.%d -> %d) - $%d\n",
                            szDialog, i+1, gDrugLabData[dlid][dl_actor_level][i], nextLevel, DrugLab_GetUpgradeCost(nextLevel));
                        count++;
                    }
                }
                
                if(count == 0)
                    return sendErrorMessage(playerid, "Brak pracownikow do ulepszenia.");
                
                ShowPlayerDialog(playerid, DIALOG_DRUGLAB_ACTOR_UPG, DIALOG_STYLE_LIST,
                    "Ulepsz pracownika", szDialog, "Wybierz", "Powrot");
            }
            case 2: // Zwolnij
            {
                new szDialog[400];
                szDialog[0] = EOS;
                new count = 0;
                
                for(new i = 0; i < MAX_LAB_ACTORS; i++)
                {
                    if(gDrugLabData[dlid][dl_actor_level][i] > 0)
                    {
                        format(szDialog, sizeof(szDialog), "%sPracownik #%d (Poziom %d)\n",
                            szDialog, i+1, gDrugLabData[dlid][dl_actor_level][i]);
                        count++;
                    }
                }
                
                if(count == 0)
                    return sendErrorMessage(playerid, "Brak pracownikow do zwolnienia.");
                
                ShowPlayerDialog(playerid, DIALOG_DRUGLAB_ACTOR_REM, DIALOG_STYLE_LIST,
                    "Zwolnij pracownika", szDialog, "Zwolnij", "Powrot");
            }
        }
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_ACTOR_BUY)
    {
        if(!response) return DrugLab_ShowActorsMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        new slot = gPlayerChosenActorSlot[playerid];
        
        if(kaska[playerid] < NPC_UPGRADE_COST_1)
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        DajKaseDone(playerid, -NPC_UPGRADE_COST_1);
        gDrugLabData[dlid][dl_actor_level][slot] = 1;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Zatrudniles pracownika #%d za $%d.", slot+1, NPC_UPGRADE_COST_1);
        
        // Log transakcji
        Log(payLog, WARNING, "%s zatrudnil pracownika w laboratorium: Slot #%d, Poziom 1, za $%d. Laboratorium ID: %d, SQL ID: %d",
            GetPlayerLogName(playerid),
            slot+1,
            NPC_UPGRADE_COST_1,
            dlid,
            gDrugLabData[dlid][dl_sql_id]);
        
        DrugLab_RefreshActors(dlid);
        DrugLab_Save(dlid);
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_ACTOR_UPG)
    {
        if(!response) return DrugLab_ShowActorsMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        // Znajdz pracownika po listiemie
        new count = 0;
        new selectedSlot = -1;
        for(new i = 0; i < MAX_LAB_ACTORS; i++)
        {
            if(gDrugLabData[dlid][dl_actor_level][i] > 0 && gDrugLabData[dlid][dl_actor_level][i] < 4)
            {
                if(count == listitem)
                {
                    selectedSlot = i;
                    break;
                }
                count++;
            }
        }
        
        if(selectedSlot == -1)
            return sendErrorMessage(playerid, "Nie znaleziono pracownika.");
        
        new nextLevel = gDrugLabData[dlid][dl_actor_level][selectedSlot] + 1;
        new cost = DrugLab_GetUpgradeCost(nextLevel);
        
        if(kaska[playerid] < cost)
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        DajKaseDone(playerid, -cost);
        gDrugLabData[dlid][dl_actor_level][selectedSlot] = nextLevel;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Ulepszyles pracownika #%d do poziomu %d za $%d.", selectedSlot+1, nextLevel, cost);
        
        // Log transakcji
        Log(payLog, WARNING, "%s ulepszyl pracownika w laboratorium: Slot #%d, Poziom %d -> %d, za $%d. Laboratorium ID: %d, SQL ID: %d",
            GetPlayerLogName(playerid),
            selectedSlot+1,
            gDrugLabData[dlid][dl_actor_level][selectedSlot]-1,
            nextLevel,
            cost,
            dlid,
            gDrugLabData[dlid][dl_sql_id]);
        
        DrugLab_RefreshActors(dlid, selectedSlot);
        DrugLab_Save(dlid);
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_ACTOR_REM)
    {
        if(!response) return DrugLab_ShowActorsMenu(playerid);
        
        new dlid = DrugLab_GetPlayerLab(playerid);
        if(dlid == -1) return 1;
        
        // Znajdz pracownika po listiemie
        new count = 0;
        new selectedSlot = -1;
        for(new i = 0; i < MAX_LAB_ACTORS; i++)
        {
            if(gDrugLabData[dlid][dl_actor_level][i] > 0)
            {
                if(count == listitem)
                {
                    selectedSlot = i;
                    break;
                }
                count++;
            }
        }
        
        if(selectedSlot == -1)
            return sendErrorMessage(playerid, "Nie znaleziono pracownika.");
        
        // Usun aktora
        if(IsValidActor(gDrugLabData[dlid][dl_actor][selectedSlot]))
            DestroyActor(gDrugLabData[dlid][dl_actor][selectedSlot]);
        
        gDrugLabData[dlid][dl_actor][selectedSlot] = INVALID_ACTOR_ID;
        gDrugLabData[dlid][dl_actor_level][selectedSlot] = 0;
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Zwolniles pracownika #%d.", selectedSlot+1);
        
        DrugLab_Save(dlid);
        return 1;
    }
    
    if(dialogid == DIALOG_DRUGLAB_BUY)
    {
        if(!response) return 1;
        
        new dlid = DrugLab_GetNearest(playerid);
        if(dlid == -1) return 1;
        
        if(gDrugLabData[dlid][dl_org_owner] != -1 || gDrugLabData[dlid][dl_player_owner] != 0)
            return sendErrorMessage(playerid, "To laboratorium jest juz zajete.");
        
        // Blokada dla sluzb porzadkowych
        if(IsPlayerInGovOrg(playerid))
            return sendErrorMessage(playerid, "Jako funkcjonariusz sluzb porzadkowych nie mozesz kupic laboratorium.");
        
        // Sprawdz czy gracz juz posiada laboratorium
        for(new i = 0; i < gTotalDrugLabs; i++)
        {
            if(gDrugLabData[i][dl_player_owner] == PlayerInfo[playerid][pUID])
                return sendErrorMessage(playerid, "Posiadasz juz laboratorium.");
        }
        
        // Sprawdz czy organizacja gracza juz posiada laboratorium
        new orgid = GetPlayerIllegalOrg(playerid);
        if(orgid > 0)
        {
            for(new i = 0; i < gTotalDrugLabs; i++)
            {
                if(gDrugLabData[i][dl_org_owner] == orgid)
                    return sendErrorMessage(playerid, "Twoja organizacja posiada juz laboratorium.");
            }
        }
        
        if(kaska[playerid] < gDrugLabData[dlid][dl_price])
            return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
        
        DajKaseDone(playerid, -gDrugLabData[dlid][dl_price]);
        
        // Jesli gracz jest liderem/v-liderem organizacji przestepczej - przypisz do organizacji
        if(orgid > 0)
        {
            new group_slot = GetPlayerGroupSlot(playerid, orgid);
            if(group_slot > 0 && group_slot <= MAX_PLAYER_GROUPS && PlayerInfo[playerid][pLider] == orgid)
            {
                gDrugLabData[dlid][dl_org_owner] = orgid;
                gDrugLabData[dlid][dl_player_owner] = 0;
                va_SendClientMessage(playerid, COLOR_GREEN, "* Kupiles laboratorium dla organizacji %s!", GroupInfo[orgid][g_Name]);
            }
            else
            {
                // Gracz jest w organizacji ale nie jest liderem - kupuje prywatnie
                gDrugLabData[dlid][dl_player_owner] = PlayerInfo[playerid][pUID];
                gDrugLabData[dlid][dl_org_owner] = -1;
                SendClientMessage(playerid, COLOR_GREEN, "* Kupiles laboratorium prywatnie!");
            }
        }
        else
        {
            // Cywil - kupuje prywatnie
            gDrugLabData[dlid][dl_player_owner] = PlayerInfo[playerid][pUID];
            gDrugLabData[dlid][dl_org_owner] = -1;
            SendClientMessage(playerid, COLOR_GREEN, "* Kupiles laboratorium prywatnie!");
        }
        
        DrugLab_Refresh(dlid);
        DrugLab_Save(dlid);
        return 1;
    }
    
    return 0;
}

//------------------<[ Publiczne: ]>-------------------

public DrugLab_Load()
{
    mysql_tquery(Database, "SELECT * FROM `drug_labs`", "DrugLab_OnLoad", "");
    return 1;
}

forward DrugLab_OnLoad();
public DrugLab_OnLoad()
{
    new rows = cache_num_rows();
    
    for(new i = 0; i < rows && i < MAX_DRUG_LABS; i++)
    {
        cache_get_value_name_int(i, "id", gDrugLabData[i][dl_sql_id]);
        cache_get_value_name_float(i, "ent_x", gDrugLabData[i][dl_ent_pos][0]);
        cache_get_value_name_float(i, "ent_y", gDrugLabData[i][dl_ent_pos][1]);
        cache_get_value_name_float(i, "ent_z", gDrugLabData[i][dl_ent_pos][2]);
        cache_get_value_name_int(i, "price", gDrugLabData[i][dl_price]);
        cache_get_value_name_int(i, "org_owner", gDrugLabData[i][dl_org_owner]);
        cache_get_value_name_int(i, "player_owner", gDrugLabData[i][dl_player_owner]);
        cache_get_value_name_int(i, "seeds", gDrugLabData[i][dl_seeds]);
        
        // Kokaina w sejfie
        cache_get_value_name_int(i, "cocaine_p", gDrugLabData[i][dl_safe_cocaine][0]);
        cache_get_value_name_int(i, "cocaine_n", gDrugLabData[i][dl_safe_cocaine][1]);
        cache_get_value_name_int(i, "cocaine_g", gDrugLabData[i][dl_safe_cocaine][2]);
        cache_get_value_name_int(i, "cocaine_e", gDrugLabData[i][dl_safe_cocaine][3]);
        
        // Wczytaj flage produkcji (domyslnie true jesli nie ma w bazie)
        new productionEnabled;
        if(cache_get_value_name_int(i, "production_enabled", productionEnabled))
            gDrugLabData[i][dl_production_enabled] = (productionEnabled == 1);
        else
            gDrugLabData[i][dl_production_enabled] = true;
        
        // Poziomy aktorow
        for(new j = 0; j < MAX_LAB_ACTORS; j++)
        {
            new szField[32];
            format(szField, sizeof(szField), "actor_%d", j+1);
            cache_get_value_name_int(i, szField, gDrugLabData[i][dl_actor_level][j]);
        }
        
        if(gDrugLabData[i][dl_org_owner] == 0)
            gDrugLabData[i][dl_org_owner] = -1;
        
        gTotalDrugLabs++;
        DrugLab_Refresh(i);
    }
    
    printf("[DRUGLAB] Zaladowano %d laboratoriow.", gTotalDrugLabs);
    return 1;
}

public DrugLab_Save(dlid)
{
    if(dlid < 0 || dlid >= gTotalDrugLabs) return 0;
    
    new szQuery[950];
    format(szQuery, sizeof(szQuery), \
        "UPDATE `drug_labs` SET `org_owner` = %d, `player_owner` = %d, `seeds` = %d, "\
        "`cocaine_p` = %d, `cocaine_n` = %d, `cocaine_g` = %d, `cocaine_e` = %d, "\
        "`actor_1` = %d, `actor_2` = %d, `actor_3` = %d, `actor_4` = %d, `actor_5` = %d, "\
        "`actor_6` = %d, `actor_7` = %d, `actor_8` = %d, `actor_9` = %d, `actor_10` = %d, "\
        "`production_enabled` = %d "\
        "WHERE `id` = %d",\
        (gDrugLabData[dlid][dl_org_owner] == -1) ? 0 : gDrugLabData[dlid][dl_org_owner],
        gDrugLabData[dlid][dl_player_owner],
        gDrugLabData[dlid][dl_seeds],
        gDrugLabData[dlid][dl_safe_cocaine][0],
        gDrugLabData[dlid][dl_safe_cocaine][1],
        gDrugLabData[dlid][dl_safe_cocaine][2],
        gDrugLabData[dlid][dl_safe_cocaine][3],
        gDrugLabData[dlid][dl_actor_level][0],
        gDrugLabData[dlid][dl_actor_level][1],
        gDrugLabData[dlid][dl_actor_level][2],
        gDrugLabData[dlid][dl_actor_level][3],
        gDrugLabData[dlid][dl_actor_level][4],
        gDrugLabData[dlid][dl_actor_level][5],
        gDrugLabData[dlid][dl_actor_level][6],
        gDrugLabData[dlid][dl_actor_level][7],
        gDrugLabData[dlid][dl_actor_level][8],
        gDrugLabData[dlid][dl_actor_level][9],
        gDrugLabData[dlid][dl_production_enabled] ? 1 : 0,
        gDrugLabData[dlid][dl_sql_id]);
    
    mysql_tquery(Database, szQuery, "", "");
    return 1;
}

public DrugLab_OnCreate(dlid)
{
    gDrugLabData[dlid][dl_sql_id] = cache_insert_id();
    DrugLab_Refresh(dlid);
    return 1;
}

public DrugLab_ProductionCycle()
{
    // Co cykl produkcyjny (10 minut rzeczywistego czasu) - NPC produkuja kokaine
    for(new dl = 0; dl < gTotalDrugLabs; dl++)
    {
        if(gDrugLabData[dl][dl_sql_id] <= 0) continue;
        if(!gDrugLabData[dl][dl_production_enabled]) continue; // Sprawdz czy produkcja jest wlaczona
        
        for(new i = 0; i < MAX_LAB_ACTORS; i++)
        {
            new level = gDrugLabData[dl][dl_actor_level][i];
            
            if(level > 0)
            {
                if(gDrugLabData[dl][dl_seeds] >= level)
                {
                    // Zuzyj nasiona i wyprodukuj kokaine
                    gDrugLabData[dl][dl_seeds] -= level;
                    gDrugLabData[dl][dl_safe_cocaine][level - 1] += 10; // 10g kokainy na cykl
                    
                    // Upewnij sie ze aktor ma animacje
                    if(IsValidActor(gDrugLabData[dl][dl_actor][i]))
                    {
                        ApplyActorAnimation(gDrugLabData[dl][dl_actor][i], 
                            gActorAnimations[i][0], gActorAnimations[i][1], 
                            4.0, 1, 0, 0, 0, 0);
                    }
                }
                else
                {
                    // Brak nasion - zatrzymaj animacje aktora
                    if(IsValidActor(gDrugLabData[dl][dl_actor][i]))
                    {
                        ClearActorAnimations(gDrugLabData[dl][dl_actor][i]);
                    }
                }
            }
        }
        
        DrugLab_RefreshSeedsLabel(dl);
        DrugLab_Save(dl);
    }
    
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:lab(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /lab - otwiera menu laboratorium");
    
    return DrugLab_ShowMenu(playerid);
}

YCMD:kuplab(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /kuplab - kupuje laboratorium");
    
    new dlid = DrugLab_GetNearest(playerid);
    if(dlid == -1)
        return sendErrorMessage(playerid, "Nie jestes przy zadnym laboratorium.");
    
    if(gDrugLabData[dlid][dl_org_owner] != -1)
        return sendErrorMessage(playerid, "To laboratorium jest juz zajete.");
    
    new szDialog[200];
    format(szDialog, sizeof(szDialog), 
        "{FFFFFF}To laboratorium jest na sprzedaz.\n{00FF00}Cena: {FFFFFF}$%d\n\n{FFFFFF}Czy chcesz je kupic?",
        gDrugLabData[dlid][dl_price]);
    
    ShowPlayerDialog(playerid, DIALOG_DRUGLAB_BUY, DIALOG_STYLE_MSGBOX, 
        "Kup laboratorium", szDialog, "Kup", "Anuluj");
    
    return 1;
}

YCMD:weznasiona(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /weznasiona [ilosc] - bierze nasiona z laboratorium");
    
    new dlid = DrugLab_GetPlayerLab(playerid);
    if(dlid == -1)
        return sendErrorMessage(playerid, "Nie jestes w zadnym laboratorium.");
    
    new amount;
    if(sscanf(params, "d", amount))
        return sendTipMessage(playerid, "Uzycie: /weznasiona [ilosc]");
    
    if(amount <= 0)
        return sendErrorMessage(playerid, "Nieprawidlowa ilosc.");
    
    if(amount > gDrugLabData[dlid][dl_seeds])
        return sendErrorMessage(playerid, "Nie ma tylu nasion w laboratorium.");
    
    gDrugLabData[dlid][dl_seeds] -= amount;
    
    // Dodaj nasiona do ekwipunku
    Item_Add("Nasiona", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_OTHER, 2247, 0, true, playerid, amount, 4);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Zabrales %d nasion z laboratorium.", amount);
    
    DrugLab_Refresh(dlid);
    DrugLab_Save(dlid);
    
    return 1;
}

YCMD:odloznasiona(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /odloznasiona [ilosc] - odklada nasiona do laboratorium");
    
    new dlid = DrugLab_GetPlayerLab(playerid);
    if(dlid == -1)
        return sendErrorMessage(playerid, "Nie jestes w zadnym laboratorium.");
    
    new amount;
    if(sscanf(params, "d", amount))
        return sendTipMessage(playerid, "Uzycie: /odloznasiona [ilosc]");
    
    if(amount <= 0)
        return sendErrorMessage(playerid, "Nieprawidlowa ilosc.");
    
    // Sprawdz czy gracz ma nasiona w ekwipunku
    new itemid = HasItemType(playerid, ITEM_TYPE_OTHER);
    if(itemid == -1 || strcmp(Item[itemid][i_Name], "Nasiona", true) != 0)
        return sendErrorMessage(playerid, "Nie masz nasion w ekwipunku.");
    
    if(Item[itemid][i_Quantity] < amount)
        return sendErrorMessage(playerid, "Nie masz tylu nasion.");
    
    if(gDrugLabData[dlid][dl_seeds] + amount > MAX_LAB_SEEDS)
        return sendErrorMessage(playerid, "Laboratorium nie moze pomiescic tylu nasion.");
    
    // Usun nasiona z ekwipunku
    Item_Delete(itemid, true, amount);
    
    gDrugLabData[dlid][dl_seeds] += amount;
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Odlozyles %d nasion do laboratorium.", amount);
    
    DrugLab_Refresh(dlid);
    DrugLab_Save(dlid);
    
    return 1;
}

YCMD:createdruglab(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /createdruglab [cena] - tworzy laboratorium");
    
    if(PlayerInfo[playerid][pAdmin] < 5)
        return sendErrorMessage(playerid, "Brak uprawnien.");
    
    new price;
    if(sscanf(params, "d", price))
        return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /createdruglab [cena]");
    
    if(gTotalDrugLabs >= MAX_DRUG_LABS)
        return sendErrorMessage(playerid, "Osiagnieto maksymalna liczbe laboratoriow.");
    
    new dlid = gTotalDrugLabs;
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    gDrugLabData[dlid][dl_ent_pos][0] = x;
    gDrugLabData[dlid][dl_ent_pos][1] = y;
    gDrugLabData[dlid][dl_ent_pos][2] = z;
    gDrugLabData[dlid][dl_price] = price;
    gDrugLabData[dlid][dl_org_owner] = -1;
    gDrugLabData[dlid][dl_seeds] = 0;
    
    for(new i = 0; i < 4; i++)
        gDrugLabData[dlid][dl_safe_cocaine][i] = 0;
    
    for(new i = 0; i < MAX_LAB_ACTORS; i++)
        gDrugLabData[dlid][dl_actor_level][i] = 0;
    
    new szQuery[256];
    format(szQuery, sizeof(szQuery), 
        "INSERT INTO `drug_labs` (`ent_x`, `ent_y`, `ent_z`, `price`, `org_owner`) VALUES (%f, %f, %f, %d, 0)",
        x, y, z, price);
    
    mysql_tquery(Database, szQuery, "DrugLab_OnCreate", "d", dlid);
    gTotalDrugLabs++;
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Stworzono laboratorium #%d za $%d.", dlid, price);
    return 1;
}

//end
