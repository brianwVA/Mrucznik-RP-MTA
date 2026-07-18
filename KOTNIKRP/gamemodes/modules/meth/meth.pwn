
// Etapy: Start -> Lithium -> Toluene -> Acetone -> Collect
// UWAGA: Jesli nie dodasz skladnika na czas - van eksploduje!

#include <YSI_Coding\y_hooks>

//------------------<[ Funkcje: ]>-------------------

stock Meth_IsValidVan(vehicleid)
{
    new model = GetVehicleModel(vehicleid);
    return (model == METH_VEHICLE_JOURNEY || model == METH_VEHICLE_RUMPO || model == METH_VEHICLE_BURRITO);
}

stock Meth_IsJourneyVan(vehicleid)
{
    return (GetVehicleModel(vehicleid) == METH_VEHICLE_JOURNEY);
}

stock Meth_GetSafetyChance(vehicleid)
{
    if(GetVehicleModel(vehicleid) == METH_VEHICLE_JOURNEY)
        return METH_SAFETY_JOURNEY;
    return METH_SAFETY_OTHER;
}

stock Meth_GetStageName(stage)
{
    new szName[32];
    switch(stage)
    {
        case METH_STAGE_NONE: szName = "Brak";
        case METH_STAGE_STARTED: szName = "Rozpoczeto";
        case METH_STAGE_LITHIUM: szName = "Dodano Lithium";
        case METH_STAGE_TOLUENE: szName = "Dodano Toluene";
        case METH_STAGE_ACETONE: szName = "Dodano Acetone";
        case METH_STAGE_READY: szName = "GOTOWE!";
    }
    return szName;
}

stock Meth_GetNextIngredient(stage)
{
    new szName[32];
    switch(stage)
    {
        case METH_STAGE_STARTED: szName = "Lithium";
        case METH_STAGE_LITHIUM: szName = "Toluene";
        case METH_STAGE_TOLUENE: szName = "Aceton";
        case METH_STAGE_ACETONE: szName = "Gotowe - /meth zbierz";
        default: szName = "Brak";
    }
    return szName;
}

stock Meth_StartProduction(playerid, vehicleid)
{
    if(gMethVehicles[vehicleid][meth_stage] != METH_STAGE_NONE)
        return sendErrorMessage(playerid, "W tym vanie juz trwa produkcja meth.");
    
    gMethVehicles[vehicleid][meth_veh_id] = vehicleid;
    gMethVehicles[vehicleid][meth_stage] = METH_STAGE_STARTED;
    gMethVehicles[vehicleid][meth_owner] = PlayerInfo[playerid][pUID];
    
    // Utworz obiekt wewnatrz vana (sprzet do gotowania)
    gMethVehicles[vehicleid][meth_object] = CreateDynamicObject(2690, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachDynamicObjectToVehicle(gMethVehicles[vehicleid][meth_object], vehicleid, 0.0, -1.5, 0.3, 0.0, 0.0, 0.0);
    
    // Ustaw timer - gracz ma 60 sekund na dodanie nastepnego skladnika
    gMethVehicles[vehicleid][meth_timer] = SetTimerEx("Meth_StageProgress", METH_STAGE_TIME * 1000, false, "d", vehicleid);
    // Timer ostrzezenia - 15 sekund przed koncem
    gMethVehicles[vehicleid][meth_warn_timer] = SetTimerEx("Meth_Warning", METH_WARNING_TIME * 1000, false, "d", vehicleid);
    
    SendClientMessage(playerid, COLOR_GREEN, "* Rozpoczales produkcje metamfetaminy!");
    SendClientMessage(playerid, COLOR_YELLOW, "* Za chwile bedziesz musial dodac Lithium. Uzyj /meth lithium");
    SendClientMessage(playerid, COLOR_LIGHTRED, "* UWAGA: Jesli nie dodasz skladnika na czas - van eksploduje!");
    
    return 1;
}

stock Meth_StopProduction(vehicleid, bool:explode = false)
{
    if(gMethVehicles[vehicleid][meth_stage] == METH_STAGE_NONE) return 0;
    
    // Usun timery
    if(gMethVehicles[vehicleid][meth_timer] != 0)
    {
        KillTimer(gMethVehicles[vehicleid][meth_timer]);
        gMethVehicles[vehicleid][meth_timer] = 0;
    }
    if(gMethVehicles[vehicleid][meth_warn_timer] != 0)
    {
        KillTimer(gMethVehicles[vehicleid][meth_warn_timer]);
        gMethVehicles[vehicleid][meth_warn_timer] = 0;
    }
    
    // Usun obiekt
    if(IsValidDynamicObject(gMethVehicles[vehicleid][meth_object]))
        DestroyDynamicObject(gMethVehicles[vehicleid][meth_object]);
    gMethVehicles[vehicleid][meth_object] = -1;
    
    if(explode)
    {
        // Eksplozja vana
        new Float:x, Float:y, Float:z;
        GetVehiclePos(vehicleid, x, y, z);
        CreateExplosion(x, y, z, 7, 10.0);
        SetVehicleHealth(vehicleid, 0.0);
    }
    
    gMethVehicles[vehicleid][meth_stage] = METH_STAGE_NONE;
    gMethVehicles[vehicleid][meth_owner] = 0;
    
    return 1;
}

stock Meth_AddIngredient(playerid, vehicleid, ingredient)
{
    new currentStage = gMethVehicles[vehicleid][meth_stage];
    new requiredStage = -1;
    new nextStage = -1;
    new itemType = -1;
    new ingredientName[32];
    
    switch(ingredient)
    {
        case 1: // Lithium
        {
            requiredStage = METH_STAGE_STARTED;
            nextStage = METH_STAGE_LITHIUM;
            itemType = ITEM_TYPE_LITHIUM;
            ingredientName = "Lithium";
        }
        case 2: // Toluene
        {
            requiredStage = METH_STAGE_LITHIUM;
            nextStage = METH_STAGE_TOLUENE;
            itemType = ITEM_TYPE_TOLUENE;
            ingredientName = "Toluene";
        }
        case 3: // Acetone
        {
            requiredStage = METH_STAGE_TOLUENE;
            nextStage = METH_STAGE_ACETONE;
            itemType = ITEM_TYPE_ACETONE;
            ingredientName = "Aceton";
        }
    }
    
    if(currentStage != requiredStage)
    {
        va_SendClientMessage(playerid, COLOR_LIGHTRED, "* Teraz nie mozesz dodac %s. Aktualny etap: %s", ingredientName, Meth_GetStageName(currentStage));
        return 0;
    }
    
    // Sprawdz czy gracz ma skladnik
    new itemId = HasItemType(playerid, itemType);
    if(itemId == -1)
    {
        va_SendClientMessage(playerid, COLOR_LIGHTRED, "* Nie masz %s w ekwipunku!", ingredientName);
        return 0;
    }
    
    // Usun skladnik
    Item_Delete(itemId, true, 1);
    
    // Zatrzymaj stare timery i ustaw nowe
    KillTimer(gMethVehicles[vehicleid][meth_timer]);
    KillTimer(gMethVehicles[vehicleid][meth_warn_timer]);
    
    gMethVehicles[vehicleid][meth_stage] = nextStage;
    
    // Ustaw nowe timery
    gMethVehicles[vehicleid][meth_timer] = SetTimerEx("Meth_StageProgress", METH_STAGE_TIME * 1000, false, "d", vehicleid);
    gMethVehicles[vehicleid][meth_warn_timer] = SetTimerEx("Meth_Warning", METH_WARNING_TIME * 1000, false, "d", vehicleid);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Dodales %s do mieszanki!", ingredientName);
    va_SendClientMessage(playerid, COLOR_YELLOW, "* Nastepny skladnik: %s", Meth_GetNextIngredient(nextStage));
    
    return 1;
}

stock Meth_Collect(playerid, vehicleid)
{
    if(gMethVehicles[vehicleid][meth_stage] != METH_STAGE_READY)
        return sendErrorMessage(playerid, "Meth nie jest jeszcze gotowe.");
    
    // Daj graczowi meth - losowa ilosc 10-25g
    new amount = 10 + random(16);
    
    Item_Add("Metamfetamina", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_METH, 1576, 0, true, playerid, amount);
    
    va_SendClientMessage(playerid, COLOR_GREEN, "* Zebrales %dg metamfetaminy!", amount);
    
    new szAction[128];
    format(szAction, sizeof(szAction), "* %s zbiera gotowa metamfetamine.", GetNick(playerid));
    ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    
    Meth_StopProduction(vehicleid, false);
    
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja
    for(new i = 0; i < MAX_VEHICLES; i++)
    {
        gMethVehicles[i][meth_veh_id] = 0;
        gMethVehicles[i][meth_stage] = METH_STAGE_NONE;
        gMethVehicles[i][meth_object] = -1;
        gMethVehicles[i][meth_timer] = 0;
        gMethVehicles[i][meth_warn_timer] = 0;
        gMethVehicles[i][meth_owner] = 0;
    }
    
    print("[METH] System produkcji metamfetaminy zaladowany.");
    return 1;
}

hook OnVehicleDeath(vehicleid, killerid)
{
    // Zatrzymaj produkcje jesli van zostal zniszczony
    if(gMethVehicles[vehicleid][meth_stage] != METH_STAGE_NONE)
    {
        Meth_StopProduction(vehicleid, false);
    }
    return 1;
}

hook OnPlayerExitVehicle(playerid, vehicleid)
{
    // Ostrzezenie jesli gracz wychodzi z vana podczas produkcji
    if(gMethVehicles[vehicleid][meth_stage] != METH_STAGE_NONE && gMethVehicles[vehicleid][meth_stage] != METH_STAGE_READY)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "* UWAGA: Produkcja meth nadal trwa! Nie odchodz za daleko!");
    }
    return 1;
}

//------------------<[ Publiczne: ]>-------------------

public Meth_StageProgress(vehicleid)
{
    if(gMethVehicles[vehicleid][meth_stage] == METH_STAGE_NONE) return 0;
    
    new stage = gMethVehicles[vehicleid][meth_stage];
    
    // Jesli etap nie zostal ukonczony (gracz nie dodal skladnika) - szansa na eksplozje
    if(stage == METH_STAGE_STARTED || stage == METH_STAGE_LITHIUM || stage == METH_STAGE_TOLUENE)
    {
        new safetyChance = Meth_GetSafetyChance(vehicleid);
        new Float:x, Float:y, Float:z;
        GetVehiclePos(vehicleid, x, y, z);
        
        // Szansa na unikniecie eksplozji
        if(random(100) < safetyChance)
        {
            // Udalo sie! Van nie eksplodowal, ale produkcja przerwana
            foreach(new i : Player)
            {
                if(PlayerInfo[i][pUID] == gMethVehicles[vehicleid][meth_owner])
                {
                    SendClientMessage(i, COLOR_YELLOW, "* Miales szczescie! Van nie eksplodowal, ale produkcja zostala przerwana.");
                    SendClientMessage(i, COLOR_YELLOW, "* Straciles skladniki - musisz zaczac od nowa.");
                    break;
                }
            }
            Meth_StopProduction(vehicleid, false);
            return 1;
        }
        
        // BOOM!
        foreach(new i : Player)
        {
            if(IsPlayerInRangeOfPoint(i, 50.0, x, y, z))
            {
                SendClientMessage(i, COLOR_LIGHTRED, "* BOOM! Laboratorium meth eksplodowalo!");
            }
        }
        
        Meth_StopProduction(vehicleid, true);
        return 1;
    }
    
    // Po acetonie - meth jest gotowe
    if(stage == METH_STAGE_ACETONE)
    {
        gMethVehicles[vehicleid][meth_stage] = METH_STAGE_READY;
        
        // Powiadom wlasciciela
        foreach(new i : Player)
        {
            if(PlayerInfo[i][pUID] == gMethVehicles[vehicleid][meth_owner])
            {
                SendClientMessage(i, COLOR_GREEN, "* Twoja metamfetamina jest gotowa! Wejdz do vana i uzyj /meth zbierz");
                break;
            }
        }
    }
    
    return 1;
}

public Meth_Explode(vehicleid)
{
    Meth_StopProduction(vehicleid, true);
    return 1;
}

forward Meth_Warning(vehicleid);
public Meth_Warning(vehicleid)
{
    if(gMethVehicles[vehicleid][meth_stage] == METH_STAGE_NONE) return 0;
    if(gMethVehicles[vehicleid][meth_stage] == METH_STAGE_READY) return 0;
    
    new stage = gMethVehicles[vehicleid][meth_stage];
    new nextIngredient[32];
    
    switch(stage)
    {
        case METH_STAGE_STARTED: nextIngredient = "Lithium (/meth lithium)";
        case METH_STAGE_LITHIUM: nextIngredient = "Toluene (/meth toluene)";
        case METH_STAGE_TOLUENE: nextIngredient = "Aceton (/meth aceton)";
    }
    
    // Powiadom wlasciciela
    foreach(new i : Player)
    {
        if(PlayerInfo[i][pUID] == gMethVehicles[vehicleid][meth_owner])
        {
            SendClientMessage(i, COLOR_LIGHTRED, "===========================================");
            va_SendClientMessage(i, COLOR_LIGHTRED, "[!] UWAGA! Zostalo 15 sekund na dodanie: %s", nextIngredient);
            SendClientMessage(i, COLOR_LIGHTRED, "[!] Jesli nie dodasz skladnika - VAN EKSPLODUJE!");
            SendClientMessage(i, COLOR_LIGHTRED, "===========================================");
            PlayerPlaySound(i, 1085, 0.0, 0.0, 0.0); // Alarm sound
            break;
        }
    }
    
    gMethVehicles[vehicleid][meth_warn_timer] = 0;
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:meth(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /meth [start/lithium/toluene/aceton/zbierz/status]");
    
    new action[32];
    if(sscanf(params, "s[32]", action))
        return sendTipMessage(playerid, "Uzycie: /meth [start/lithium/toluene/aceton/zbierz/status]");
    
    // Sprawdz czy gracz jest w odpowiednim vanie
    if(!IsPlayerInAnyVehicle(playerid))
        return sendErrorMessage(playerid, "Musisz byc w vanie (Journey/Rumpo/Burrito) aby produkowac meth.");
    
    new vehicleid = GetPlayerVehicleID(playerid);
    
    if(!Meth_IsValidVan(vehicleid))
        return sendErrorMessage(playerid, "Musisz byc w vanie (Journey/Rumpo/Burrito) aby produkowac meth.");
    
    if(!strcmp(action, "start", true))
    {
        return Meth_StartProduction(playerid, vehicleid);
    }
    else if(!strcmp(action, "lithium", true))
    {
        return Meth_AddIngredient(playerid, vehicleid, 1);
    }
    else if(!strcmp(action, "toluene", true))
    {
        return Meth_AddIngredient(playerid, vehicleid, 2);
    }
    else if(!strcmp(action, "aceton", true))
    {
        return Meth_AddIngredient(playerid, vehicleid, 3);
    }
    else if(!strcmp(action, "zbierz", true))
    {
        return Meth_Collect(playerid, vehicleid);
    }
    else if(!strcmp(action, "status", true))
    {
        if(gMethVehicles[vehicleid][meth_stage] == METH_STAGE_NONE)
            return SendClientMessage(playerid, COLOR_GREY, "* W tym vanie nie ma aktywnej produkcji meth.");
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Status produkcji: %s", Meth_GetStageName(gMethVehicles[vehicleid][meth_stage]));
        va_SendClientMessage(playerid, COLOR_YELLOW, "* Nastepny skladnik: %s", Meth_GetNextIngredient(gMethVehicles[vehicleid][meth_stage]));
        return 1;
    }
    
    return sendTipMessage(playerid, "Uzycie: /meth [start/lithium/toluene/aceton/zbierz/status]");
}

//end
