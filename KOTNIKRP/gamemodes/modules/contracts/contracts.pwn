
// Opis: System kontraktów - organizacje wystawiaj? zlecenia na skrzynki z nagrod?

#include <YSI_Coding\y_hooks>

//------------------<[ Funkcje: ]>-------------------

stock Contracts_GetTypeName(type)
{
    new name[32];
    switch(type)
    {
        case CONTRACT_TYPE_FABRICS: name = "Tkaniny";
        case CONTRACT_TYPE_METALS: name = "Metale";
        case CONTRACT_TYPE_MATS: name = "Materialy";
        case CONTRACT_TYPE_CHEMICALS: name = "Chemikalia";
        default: name = "Nieznany";
    }
    return name;
}

stock Contracts_GetCrateType(contractType)
{
    switch(contractType)
    {
        case CONTRACT_TYPE_FABRICS: return CRATE_TYPE_FABRICS;
        case CONTRACT_TYPE_METALS: return CRATE_TYPE_METALS;
        case CONTRACT_TYPE_MATS: return CRATE_TYPE_MATS;
        case CONTRACT_TYPE_CHEMICALS: return CRATE_TYPE_CHEMICALS;
    }
    return -1;
}

stock Contracts_GetCratePrice(contractType)
{
    switch(contractType)
    {
        case CONTRACT_TYPE_FABRICS: return PRICE_CRATE_FABRICS;
        case CONTRACT_TYPE_METALS: return PRICE_CRATE_METALS;
        case CONTRACT_TYPE_MATS: return PRICE_CRATE_MATS;
        case CONTRACT_TYPE_CHEMICALS: return PRICE_CRATE_CHEMICALS;
    }
    return 0;
}

stock Contracts_GetFreeSlot()
{
    for(new i = 0; i < MAX_CONTRACTS; i++)
    {
        if(gContracts[i][ct_state] != CONTRACT_STATE_ACTIVE)
            return i;
    }
    return -1;
}

stock Contracts_Create(orgid, type, amount, reward, warehouseid, owneruid = 0, storageid = -1)
{
    new slot = Contracts_GetFreeSlot();
    if(slot == -1) return -1;
    
    gContracts[slot][ct_id] = slot;
    gContracts[slot][ct_org_id] = orgid;
    gContracts[slot][ct_owner_uid] = owneruid;
    gContracts[slot][ct_type] = type;
    gContracts[slot][ct_amount] = amount;
    gContracts[slot][ct_amount_delivered] = 0;
    gContracts[slot][ct_reward] = reward;
    gContracts[slot][ct_state] = CONTRACT_STATE_ACTIVE;
    gContracts[slot][ct_created] = gettime();
    gContracts[slot][ct_accepted_by] = 0;
    gContracts[slot][ct_warehouse_id] = warehouseid;
    gContracts[slot][ct_storage_id] = storageid;
    
    gTotalContracts++;
    
    // Zapisz do bazy
    Contracts_Save(slot);
    
    return slot;
}

stock Contracts_Cancel(slot)
{
    if(slot < 0 || slot >= MAX_CONTRACTS) return 0;
    if(gContracts[slot][ct_state] != CONTRACT_STATE_ACTIVE) return 0;
    
    new orgid = gContracts[slot][ct_org_id];
    if(orgid > 0 && IsValidGroup(orgid))
    {
        // Zwroc kase organizacji
        GroupInfo[orgid][g_Money] += gContracts[slot][ct_reward];
    }
    else if(gContracts[slot][ct_owner_uid] > 0)
    {
        // Zwroc kase cywilowi
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if(!IsPlayerConnected(i)) continue;
            if(PlayerInfo[i][pUID] == gContracts[slot][ct_owner_uid])
            {
                DajKaseDone(i, gContracts[slot][ct_reward]);
                va_SendClientMessage(i, COLOR_YELLOW, "* Twoj kontrakt zostal anulowany. Zwrocono $%d.", gContracts[slot][ct_reward]);
                break;
            }
        }
    }
    
    gContracts[slot][ct_state] = CONTRACT_STATE_CANCELLED;
    Contracts_Save(slot);
    
    return 1;
}

stock Contracts_GetOrgWarehouse(orgid)
{
    for(new i = 0; i < gTotalWarehouses; i++)
    {
        if(gWarehouseData[i][wh_org_owner] == orgid)
            return i;
    }
    return -1;
}

stock Contracts_ShowList(playerid)
{
    new szDialog[2048], szLine[128];
    new count = 0;
    
    szDialog[0] = '\0';
    strcat(szDialog, "Typ\tIlosc\tLacznie\tZleceniodawca\n");
    
    for(new i = 0; i < MAX_CONTRACTS; i++)
    {
        if(gContracts[i][ct_state] != CONTRACT_STATE_ACTIVE) continue;
        if(gContracts[i][ct_accepted_by] != 0) continue; // Juz ktos przyjal
        
        new ownerName[64] = "Nieznany";
        if(gContracts[i][ct_org_id] > 0 && IsValidGroup(gContracts[i][ct_org_id]))
        {
            format(ownerName, sizeof(ownerName), "%s", GroupInfo[gContracts[i][ct_org_id]][g_Name]);
        }
        else if(gContracts[i][ct_owner_uid] > 0)
        {
            format(ownerName, sizeof(ownerName), "Cywil");
        }
        
        // Oblicz calkowita wypłate
        new cratePrice = Contracts_GetCratePrice(gContracts[i][ct_type]);
        new totalCrateCost = cratePrice * gContracts[i][ct_amount];
        new bonus = floatround(float(totalCrateCost) * 0.15, floatround_floor);
        new totalReward = gContracts[i][ct_reward] + totalCrateCost + bonus;
        
        format(szLine, sizeof(szLine), "%s\t%d\t$%d\t%s\n",
            Contracts_GetTypeName(gContracts[i][ct_type]),
            gContracts[i][ct_amount],
            totalReward,
            ownerName);
        strcat(szDialog, szLine);
        count++;
    }
    
    if(count == 0)
    {
        sendErrorMessage(playerid, "Brak dostepnych kontraktow.");
        return 0;
    }
    
    ShowPlayerDialog(playerid, DIALOG_CONTRACT_LIST, DIALOG_STYLE_TABLIST_HEADERS, 
        "Dostepne kontrakty", szDialog, "Przyjmij", "Anuluj");
    
    return 1;
}

stock Contracts_ShowMyContract(playerid)
{
    new playerUID = PlayerInfo[playerid][pUID];
    
    for(new i = 0; i < MAX_CONTRACTS; i++)
    {
        if(gContracts[i][ct_state] != CONTRACT_STATE_ACTIVE) continue;
        if(gContracts[i][ct_accepted_by] != playerUID) continue;
        
        new ownerName[64] = "Nieznany";
        if(gContracts[i][ct_org_id] > 0 && IsValidGroup(gContracts[i][ct_org_id]))
        {
            format(ownerName, sizeof(ownerName), "%s", GroupInfo[gContracts[i][ct_org_id]][g_Name]);
        }
        else if(gContracts[i][ct_owner_uid] > 0)
        {
            format(ownerName, sizeof(ownerName), "Cywil");
        }
        
        // Oblicz calkowita wypłate
        new cratePrice = Contracts_GetCratePrice(gContracts[i][ct_type]);
        new totalCrateCost = cratePrice * gContracts[i][ct_amount];
        new bonus = floatround(float(totalCrateCost) * 0.15, floatround_floor);
        new totalReward = gContracts[i][ct_reward] + totalCrateCost + bonus;
        
        new szDialog[600];
        format(szDialog, sizeof(szDialog),
            "Zleceniodawca: %s\n\
            Typ: %s\n\
            Postep: %d/%d skrzynek\n\n\
            Nagroda: $%d\n\
            Zwrot kosztow skrzynek: $%d\n\
            Bonus (15%%): $%d\n\
            Lacznie otrzymasz: $%d\n\n\
            Dostarcz skrzynki do miejsca oznaczonego na GPS.",
            ownerName,
            Contracts_GetTypeName(gContracts[i][ct_type]),
            gContracts[i][ct_amount_delivered],
            gContracts[i][ct_amount],
            gContracts[i][ct_reward],
            totalCrateCost,
            bonus,
            totalReward);
        
        ShowPlayerDialog(playerid, DIALOG_CONTRACT_MY, DIALOG_STYLE_MSGBOX,
            "Twoj aktywny kontrakt", szDialog, "OK", "Zrezygnuj");
        
        return 1;
    }
    
    sendErrorMessage(playerid, "Nie masz zadnego aktywnego kontraktu.");
    return 0;
}

stock Contracts_GetPlayerContract(playerid)
{
    new playerUID = PlayerInfo[playerid][pUID];
    
    for(new i = 0; i < MAX_CONTRACTS; i++)
    {
        if(gContracts[i][ct_state] != CONTRACT_STATE_ACTIVE) continue;
        if(gContracts[i][ct_accepted_by] == playerUID)
            return i;
    }
    return -1;
}

stock Contracts_Deliver(playerid, crateType)
{
    new contract = Contracts_GetPlayerContract(playerid);
    if(contract == -1) return 0;
    
    // Sprawdz czy typ skrzynki pasuje
    new expectedCrateType = Contracts_GetCrateType(gContracts[contract][ct_type]);
    if(crateType != expectedCrateType) return 0;
    
    // Sprawdz czy to kontrakt organizacji czy cywila
    if(gContracts[contract][ct_org_id] > 0)
    {
        // Kontrakt organizacji - dostarcz do magazynu
        new whid = gContracts[contract][ct_warehouse_id];
        if(whid < 0 || whid >= gTotalWarehouses) return 0;
        
        if(!IsPlayerInRangeOfPoint(playerid, 10.0, 
            gWarehouseData[whid][wh_ent_pos][0],
            gWarehouseData[whid][wh_ent_pos][1],
            gWarehouseData[whid][wh_ent_pos][2]))
            return 0;
    }
    else if(gContracts[contract][ct_owner_uid] > 0)
    {
        // Kontrakt cywila - dostarcz do skrytki
        new stid = gContracts[contract][ct_storage_id];
        if(stid < 0 || stid >= gTotalStorages) return 0;
        
        if(!IsPlayerInRangeOfPoint(playerid, 10.0, 
            gStorageData[stid][st_ent_pos][0],
            gStorageData[stid][st_ent_pos][1],
            gStorageData[stid][st_ent_pos][2]))
            return 0;
    }
    else
    {
        return 0;
    }
    
    // Dostarcz
    gContracts[contract][ct_amount_delivered]++;
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Dostarczyles skrzynke! Postep: %d/%d",
        gContracts[contract][ct_amount_delivered], gContracts[contract][ct_amount]);
    
    // Sprawdz czy kontrakt ukonczony
    if(gContracts[contract][ct_amount_delivered] >= gContracts[contract][ct_amount])
    {
        // Oblicz koszt skrzynek (zwrot kosztow)
        new cratePrice = Contracts_GetCratePrice(gContracts[contract][ct_type]);
        new totalCrateCost = cratePrice * gContracts[contract][ct_amount];
        
        // Oblicz bonus (15% od kosztu skrzynek jako zachęta)
        new bonus = floatround(float(totalCrateCost) * 0.15, floatround_floor);
        
        // Calkowita wypłata = nagroda + zwrot kosztów skrzynek + bonus
        new totalReward = gContracts[contract][ct_reward] + totalCrateCost + bonus;
        
        if(totalReward <= 0 || totalReward > 100000000)
        {
            Log(errorLog, ERROR, "CONTRACTS: zablokowano nieprawidlowa wyplate %d$ dla %s (kontrakt %d)", totalReward, GetPlayerLogName(playerid), contract);
            return sendErrorMessage(playerid, "Wyplata kontraktu ma nieprawidlowa wartosc. Zglos to administracji.");
        }

        // Najpierw zamknij i zapisz kontrakt, aby ponowiony callback nie wyplacil go drugi raz.
        gContracts[contract][ct_state] = CONTRACT_STATE_COMPLETED;
        Contracts_Save(contract);

        DajKaseDone(playerid, totalReward);
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Ukonczyles kontrakt! Otrzymales:");
        va_SendClientMessage(playerid, COLOR_WHITE, "  - Nagroda: $%d", gContracts[contract][ct_reward]);
        va_SendClientMessage(playerid, COLOR_WHITE, "  - Zwrot kosztow skrzynek: $%d (%d x $%d)", 
            totalCrateCost, gContracts[contract][ct_amount], cratePrice);
        va_SendClientMessage(playerid, COLOR_WHITE, "  - Bonus: $%d (15%% od kosztu skrzynek)", bonus);
        va_SendClientMessage(playerid, COLOR_GREEN, "  - Lacznie: $%d", totalReward);
        
        // Usun checkpoint
        DisablePlayerCheckpoint(playerid);
        
    }
    else
    {
        Contracts_Save(contract);
    }
    
    return 1;
}

stock Contracts_Accept(playerid, contractIndex)
{
    if(contractIndex < 0 || contractIndex >= MAX_CONTRACTS) return 0;
    if(gContracts[contractIndex][ct_state] != CONTRACT_STATE_ACTIVE) return 0;
    if(gContracts[contractIndex][ct_accepted_by] != 0) return 0;
    
    // Sprawdz czy gracz nie ma juz kontraktu
    if(Contracts_GetPlayerContract(playerid) != -1)
    {
        sendErrorMessage(playerid, "Masz juz aktywny kontrakt. Najpierw go ukoncz lub zrezygnuj.");
        return 0;
    }
    
    gContracts[contractIndex][ct_accepted_by] = PlayerInfo[playerid][pUID];
    Contracts_Save(contractIndex);
    
    new ownerName[64] = "Nieznany";
    new Float:destX, Float:destY, Float:destZ;
    new hasLocation = 0;
    
    if(gContracts[contractIndex][ct_org_id] > 0 && IsValidGroup(gContracts[contractIndex][ct_org_id]))
    {
        format(ownerName, sizeof(ownerName), "%s", GroupInfo[gContracts[contractIndex][ct_org_id]][g_Name]);
        
        // Pobierz lokalizacj? magazynu
        new whid = gContracts[contractIndex][ct_warehouse_id];
        if(whid >= 0 && whid < gTotalWarehouses)
        {
            destX = gWarehouseData[whid][wh_ent_pos][0];
            destY = gWarehouseData[whid][wh_ent_pos][1];
            destZ = gWarehouseData[whid][wh_ent_pos][2];
            hasLocation = 1;
        }
    }
    else if(gContracts[contractIndex][ct_owner_uid] > 0)
    {
        format(ownerName, sizeof(ownerName), "Cywila");
        
        // Pobierz lokalizacj? skrytki
        new stid = gContracts[contractIndex][ct_storage_id];
        if(stid >= 0 && stid < gTotalStorages)
        {
            destX = gStorageData[stid][st_ent_pos][0];
            destY = gStorageData[stid][st_ent_pos][1];
            destZ = gStorageData[stid][st_ent_pos][2];
            hasLocation = 1;
        }
    }
    
    // Oblicz calkowita wypłate
    new cratePrice = Contracts_GetCratePrice(gContracts[contractIndex][ct_type]);
    new totalCrateCost = cratePrice * gContracts[contractIndex][ct_amount];
    new bonus = floatround(float(totalCrateCost) * 0.15, floatround_floor);
    new totalReward = gContracts[contractIndex][ct_reward] + totalCrateCost + bonus;
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Przyjales kontrakt od %s!", ownerName);
    va_SendClientMessage(playerid, COLOR_WHITE, "* Dostarcz %d skrzynek typu '%s'", 
        gContracts[contractIndex][ct_amount],
        Contracts_GetTypeName(gContracts[contractIndex][ct_type]));
    va_SendClientMessage(playerid, COLOR_WHITE, "* Nagroda: $%d | Zwrot kosztow: $%d | Bonus: $%d", 
        gContracts[contractIndex][ct_reward], totalCrateCost, bonus);
    va_SendClientMessage(playerid, COLOR_GREEN, "* Lacznie otrzymasz: $%d", totalReward);
    
    // Ustaw GPS
    if(hasLocation)
    {
        SetPlayerCheckpoint(playerid, destX, destY, destZ, 10.0);
        SendClientMessage(playerid, COLOR_YELLOW, "* Lokalizacja dostawy zostala zaznaczona na GPS.");
    }
    
    return 1;
}

stock Contracts_Resign(playerid)
{
    new contract = Contracts_GetPlayerContract(playerid);
    if(contract == -1) return 0;
    
    gContracts[contract][ct_accepted_by] = 0;
    
    // Usun checkpoint
    DisablePlayerCheckpoint(playerid);
    
    Contracts_Save(contract);
    
    SendClientMessage(playerid, COLOR_YELLOW, "* Zrezygnowaels z kontraktu. Kontrakt wraca na liste dostepnych.");
    return 1;
}

stock Contracts_Save(slot)
{
    new szQuery[512];
    
    if(gContracts[slot][ct_id] == 0 && gContracts[slot][ct_org_id] == 0 && gContracts[slot][ct_owner_uid] == 0)
        return 0;
    
    mysql_format(Database, szQuery, sizeof(szQuery),
        "INSERT INTO `contracts` (`id`, `org_id`, `owner_uid`, `type`, `amount`, `amount_delivered`, `reward`, `state`, `created`, `accepted_by`, `warehouse_id`, `storage_id`) \
        VALUES (%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d) \
        ON DUPLICATE KEY UPDATE `amount_delivered`=%d, `state`=%d, `accepted_by`=%d",
        slot,
        gContracts[slot][ct_org_id],
        gContracts[slot][ct_owner_uid],
        gContracts[slot][ct_type],
        gContracts[slot][ct_amount],
        gContracts[slot][ct_amount_delivered],
        gContracts[slot][ct_reward],
        gContracts[slot][ct_state],
        gContracts[slot][ct_created],
        gContracts[slot][ct_accepted_by],
        gContracts[slot][ct_warehouse_id],
        gContracts[slot][ct_storage_id],
        gContracts[slot][ct_amount_delivered],
        gContracts[slot][ct_state],
        gContracts[slot][ct_accepted_by]);
    
    mysql_tquery(Database, szQuery);
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja
    for(new i = 0; i < MAX_CONTRACTS; i++)
    {
        gContracts[i][ct_org_id] = 0;
        gContracts[i][ct_owner_uid] = 0;
        gContracts[i][ct_storage_id] = -1;
        gContracts[i][ct_state] = CONTRACT_STATE_CANCELLED;
    }
    
    // Zaladuj kontrakty
    SetTimerEx("Contracts_Load", 3000, false, "");
    
    print("[CONTRACTS] System kontraktow zaladowany.");
    return 1;
}

//------------------<[ Publiczne - MySQL: ]>-------------------

forward Contracts_Load();
public Contracts_Load()
{
    mysql_tquery(Database, "SELECT * FROM `contracts` WHERE `state` = 0", "Contracts_OnLoad", "");
    return 1;
}

forward Contracts_OnLoad();
public Contracts_OnLoad()
{
    new rows = cache_num_rows();
    
    for(new i = 0; i < rows && i < MAX_CONTRACTS; i++)
    {
        new slot;
        cache_get_value_name_int(i, "id", slot);
        
        if(slot < 0 || slot >= MAX_CONTRACTS) continue;
        
        cache_get_value_name_int(i, "org_id", gContracts[slot][ct_org_id]);
        cache_get_value_name_int(i, "owner_uid", gContracts[slot][ct_owner_uid]);
        cache_get_value_name_int(i, "type", gContracts[slot][ct_type]);
        cache_get_value_name_int(i, "amount", gContracts[slot][ct_amount]);
        cache_get_value_name_int(i, "amount_delivered", gContracts[slot][ct_amount_delivered]);
        cache_get_value_name_int(i, "reward", gContracts[slot][ct_reward]);
        cache_get_value_name_int(i, "state", gContracts[slot][ct_state]);
        cache_get_value_name_int(i, "created", gContracts[slot][ct_created]);
        cache_get_value_name_int(i, "accepted_by", gContracts[slot][ct_accepted_by]);
        cache_get_value_name_int(i, "warehouse_id", gContracts[slot][ct_warehouse_id]);
        cache_get_value_name_int(i, "storage_id", gContracts[slot][ct_storage_id]);
        
        gContracts[slot][ct_id] = slot;
        gTotalContracts++;
    }
    
    printf("[CONTRACTS] Zaladowano %d aktywnych kontraktow.", gTotalContracts);
    return 1;
}

//------------------<[ Dialogi: ]>-------------------

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_CONTRACT_MENU:
        {
            if(!response) return 1;
            
            switch(listitem)
            {
                case 0: // Lista kontraktow
                {
                    Contracts_ShowList(playerid);
                }
                case 1: // Moj kontrakt
                {
                    Contracts_ShowMyContract(playerid);
                }
                case 2: // Wystaw kontrakt (organizacja)
                {
                    new orgid = GetPlayerIllegalOrg(playerid);
                    if(orgid == 0)
                        return sendErrorMessage(playerid, "Musisz nalezec do organizacji przestepczej.");
                    
                    new whid = Contracts_GetOrgWarehouse(orgid);
                    if(whid == -1)
                        return sendErrorMessage(playerid, "Twoja organizacja nie posiada magazynu.");
                    
                    SetPVarInt(playerid, "Contract_IsOrg", 1);
                    ShowPlayerDialog(playerid, DIALOG_CONTRACT_TYPE, DIALOG_STYLE_LIST,
                        "Wystaw kontrakt - wybierz typ",
                        "Tkaniny\nMetale\nMaterialy\nChemikalia",
                        "Dalej", "Anuluj");
                }
                case 3: // Wystaw kontrakt (cywil)
                {
                    new stid = Storage_GetPlayerStorage(playerid);
                    if(stid == -1)
                        return sendErrorMessage(playerid, "Musisz posiadac skrytke aby wystawic kontrakt.");
                    
                    SetPVarInt(playerid, "Contract_IsOrg", 0);
                    SetPVarInt(playerid, "Contract_StorageID", stid);
                    ShowPlayerDialog(playerid, DIALOG_CONTRACT_TYPE, DIALOG_STYLE_LIST,
                        "Wystaw kontrakt - wybierz typ",
                        "Tkaniny\nMetale\nMaterialy\nChemikalia",
                        "Dalej", "Anuluj");
                }
            }
            return 1;
        }
        
        case DIALOG_CONTRACT_TYPE:
        {
            if(!response) return 1;
            
            gPlayerContractType[playerid] = listitem;
            
            ShowPlayerDialog(playerid, DIALOG_CONTRACT_AMOUNT, DIALOG_STYLE_INPUT,
                "Wystaw kontrakt - ilosc skrzynek",
                "Podaj ile skrzynek ma dostarczyc wykonawca (1-20):",
                "Dalej", "Anuluj");
            return 1;
        }
        
        case DIALOG_CONTRACT_AMOUNT:
        {
            if(!response) return 1;
            
            new amount = strval(inputtext);
            if(amount < 1 || amount > 20)
                return sendErrorMessage(playerid, "Podaj liczbe od 1 do 20.");
            
            gPlayerContractAmount[playerid] = amount;
            
            // Oblicz minimalna nagrode na podstawie kosztu skrzynek (110% kosztu)
            new cratePrice = Contracts_GetCratePrice(gPlayerContractType[playerid]);
            new totalCrateCost = cratePrice * amount;
            new minRewardBasedOnCost = floatround(float(totalCrateCost) * 1.1, floatround_ceil); // 110% kosztu skrzynek
            
            new isOrg = GetPVarInt(playerid, "Contract_IsOrg");
            new baseMinReward, maxReward;
            if(isOrg)
            {
                baseMinReward = CONTRACT_ORG_MIN_REWARD;
                maxReward = CONTRACT_ORG_MAX_REWARD;
            }
            else
            {
                baseMinReward = CONTRACT_CIVIL_MIN_REWARD;
                maxReward = CONTRACT_CIVIL_MAX_REWARD;
            }
            
            // Uzyj wiekszej wartosci: bazowa minimalna nagroda lub 110% kosztu skrzynek
            new finalMinReward = (minRewardBasedOnCost > baseMinReward) ? minRewardBasedOnCost : baseMinReward;
            
            // Minimalna nagroda to co najmniej $1000
            if(finalMinReward < 1000)
                finalMinReward = 1000;
            
            // Zapisz minimalna nagrode do PVar dla walidacji
            SetPVarInt(playerid, "Contract_MinReward", finalMinReward);
            
            new szMsg[256];
            if(isOrg)
            {
                format(szMsg, sizeof(szMsg), "Podaj nagrode dla wykonawcy ($%d - $%d):\n\nMinimalna nagroda: $%d (110%% kosztu skrzynek)\nPieniadze zostana pobrane z kasy organizacji.",
                    finalMinReward, maxReward, minRewardBasedOnCost);
            }
            else
            {
                format(szMsg, sizeof(szMsg), "Podaj nagrode dla wykonawcy ($%d - $%d):\n\nMinimalna nagroda: $%d (110%% kosztu skrzynek)\nPieniadze zostana pobrane z twojego konta.",
                    finalMinReward, maxReward, minRewardBasedOnCost);
            }
            
            ShowPlayerDialog(playerid, DIALOG_CONTRACT_REWARD, DIALOG_STYLE_INPUT,
                "Wystaw kontrakt - nagroda", szMsg, "Dalej", "Anuluj");
            return 1;
        }
        
        case DIALOG_CONTRACT_REWARD:
        {
            if(!response)
            {
                DeletePVar(playerid, "Contract_MinReward");
                return 1;
            }
            
            new isOrg = GetPVarInt(playerid, "Contract_IsOrg");
            new reward = strval(inputtext);
            new minReward = GetPVarInt(playerid, "Contract_MinReward");
            new maxReward;
            
            if(isOrg)
            {
                maxReward = CONTRACT_ORG_MAX_REWARD;
            }
            else
            {
                maxReward = CONTRACT_CIVIL_MAX_REWARD;
            }
            
            if(reward < minReward || reward > maxReward)
            {
                new szMsg[128];
                format(szMsg, sizeof(szMsg), "Podaj kwote od $%d do $%d.", minReward, maxReward);
                return sendErrorMessage(playerid, szMsg);
            }
            
            // Usun PVar po uzyciu
            DeletePVar(playerid, "Contract_MinReward");
            
            gPlayerContractReward[playerid] = reward;
            
            new szDialog[256];
            format(szDialog, sizeof(szDialog),
                "Typ: %s\nIlosc skrzynek: %d\nNagroda: $%d\n\nPotwierdz wystawienie kontraktu.",
                Contracts_GetTypeName(gPlayerContractType[playerid]),
                gPlayerContractAmount[playerid],
                gPlayerContractReward[playerid]);
            
            ShowPlayerDialog(playerid, DIALOG_CONTRACT_CONFIRM, DIALOG_STYLE_MSGBOX,
                "Potwierdz kontrakt", szDialog, "Wystaw", "Anuluj");
            return 1;
        }
        
        case DIALOG_CONTRACT_CONFIRM:
        {
            if(!response) return 1;
            
            new isOrg = GetPVarInt(playerid, "Contract_IsOrg");
            new slot = -1;
            
            if(isOrg)
            {
                new orgid = GetPlayerIllegalOrg(playerid);
                if(orgid == 0)
                    return sendErrorMessage(playerid, "Musisz nalezec do organizacji przestepczej.");
                
                new whid = Contracts_GetOrgWarehouse(orgid);
                if(whid == -1)
                    return sendErrorMessage(playerid, "Twoja organizacja nie posiada magazynu.");
                
                // Sprawdz kase organizacji
                if(GroupInfo[orgid][g_Money] < gPlayerContractReward[playerid])
                    return sendErrorMessage(playerid, "Organizacja nie ma wystarczajacej ilosci pieniedzy.");
                
                // Pobierz kase z organizacji (escrow)
                GroupInfo[orgid][g_Money] -= gPlayerContractReward[playerid];
                
                slot = Contracts_Create(orgid, gPlayerContractType[playerid], 
                    gPlayerContractAmount[playerid], gPlayerContractReward[playerid], whid);
                
                if(slot == -1)
                {
                    GroupInfo[orgid][g_Money] += gPlayerContractReward[playerid];
                    return sendErrorMessage(playerid, "Nie mozna utworzyc kontraktu - brak wolnych slotow.");
                }
            }
            else
            {
                new stid = GetPVarInt(playerid, "Contract_StorageID");
                if(stid == -1)
                    return sendErrorMessage(playerid, "Blad: nie znaleziono skrytki.");
                
                // Sprawdz kase gracza
                if(PlayerInfo[playerid][pCash] < gPlayerContractReward[playerid])
                    return sendErrorMessage(playerid, "Nie masz wystarczajacej ilosci pieniedzy.");
                
                // Pobierz kase z konta gracza (escrow)
                ZabierzKaseDone(playerid, gPlayerContractReward[playerid]);
                
                slot = Contracts_Create(0, gPlayerContractType[playerid], 
                    gPlayerContractAmount[playerid], gPlayerContractReward[playerid], -1, 
                    PlayerInfo[playerid][pUID], stid);
                
                if(slot == -1)
                {
                    DajKaseDone(playerid, gPlayerContractReward[playerid]);
                    return sendErrorMessage(playerid, "Nie mozna utworzyc kontraktu - brak wolnych slotow.");
                }
            }
            
            DeletePVar(playerid, "Contract_IsOrg");
            DeletePVar(playerid, "Contract_StorageID");
            
            va_SendClientMessage(playerid, COLOR_GREEN, "* Wystawiles kontrakt na %d skrzynek '%s' z nagroda $%d!",
                gPlayerContractAmount[playerid],
                Contracts_GetTypeName(gPlayerContractType[playerid]),
                gPlayerContractReward[playerid]);
            
            return 1;
        }
        
        case DIALOG_CONTRACT_LIST:
        {
            if(!response) return 1;
            
            // Znajdz kontrakt po indexie listy
            new count = 0;
            for(new i = 0; i < MAX_CONTRACTS; i++)
            {
                if(gContracts[i][ct_state] != CONTRACT_STATE_ACTIVE) continue;
                if(gContracts[i][ct_accepted_by] != 0) continue;
                
                if(count == listitem)
                {
                    Contracts_Accept(playerid, i);
                    return 1;
                }
                count++;
            }
            return 1;
        }
        
        case DIALOG_CONTRACT_MY:
        {
            if(!response)
            {
                // Zrezygnuj
                Contracts_Resign(playerid);
            }
            return 1;
        }
    }
    return 0;
}

//------------------<[ Komendy: ]>-------------------

YCMD:kontrakty(playerid, params[], help)
{
    if(help)
        return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /kontrakty - otwiera menu kontraktow");
    
    new szMenu[256];
    format(szMenu, sizeof(szMenu), "1. Dostepne kontrakty\n2. Moj aktywny kontrakt\n3. Wystaw kontrakt (organizacja)");
    
    // Sprawdz czy gracz ma skrytke (moze wystawic kontrakt jako cywil)
    if(Storage_GetPlayerStorage(playerid) != -1)
    {
        format(szMenu, sizeof(szMenu), "%s\n4. Wystaw kontrakt (cywil)", szMenu);
    }
    
    ShowPlayerDialog(playerid, DIALOG_CONTRACT_MENU, DIALOG_STYLE_LIST,
        "Menu kontraktow", szMenu, "Wybierz", "Anuluj");
    
    return 1;
}

YCMD:mojkontrakt(playerid, params[], help)
{
    if(help)
        return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /mojkontrakt - sprawdza aktywny kontrakt");
    
    Contracts_ShowMyContract(playerid);
    return 1;
}

//end
