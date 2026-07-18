
// Opis: System produkcji heroiny - gotowanie w garnkach z dodatkami
// Etapy: Heating -> Water -> Calcium -> Sodium -> Acetone -> Collect

#include <YSI_Coding\y_hooks>

// Forward do funkcji z storage.pwn
forward Storage_IsPlayerInStorage(playerid);

//------------------<[ Funkcje: ]>-------------------

stock Heroin_GetNearestPot(playerid, Float:range = 5.0)
{
    for(new i = 0; i < MAX_HEROIN_POTS; i++)
    {
        if(gHeroinPots[i][heroin_created])
        {
            if(IsPlayerInRangeOfPoint(playerid, range, 
                gHeroinPots[i][heroin_pos][0], 
                gHeroinPots[i][heroin_pos][1], 
                gHeroinPots[i][heroin_pos][2]))
                return i;
        }
    }
    return -1;
}

stock Heroin_GetPlayerPotCount(playerid)
{
    new uid = PlayerInfo[playerid][pUID];
    new count = 0;
    for(new i = 0; i < MAX_HEROIN_POTS; i++)
    {
        if(gHeroinPots[i][heroin_created] && gHeroinPots[i][heroin_owner] == uid)
            count++;
    }
    return count;
}

stock Heroin_GetFreePot()
{
    for(new i = 0; i < MAX_HEROIN_POTS; i++)
    {
        if(!gHeroinPots[i][heroin_created])
            return i;
    }
    return -1;
}

stock Heroin_UpdateLabel(potid)
{
    if(potid < 0 || potid >= MAX_HEROIN_POTS) return 0;
    if(!gHeroinPots[potid][heroin_created]) return 0;
    
    new szLabel[200];
    new stage = gHeroinPots[potid][heroin_stage];
    new mixState = gHeroinPots[potid][heroin_mix_state];
    
    if(stage < HEROIN_STAGE_ADD_WATER)
    {
        format(szLabel, sizeof(szLabel), "{CC330B}Grzanie\n{FFFFFF}Etap: %d%%\n{FFFFFF}Gotowe przy 100%%", stage);
    }
    else if(stage == HEROIN_STAGE_ADD_WATER && mixState == HEROIN_STATE_NONE)
    {
        format(szLabel, sizeof(szLabel), "{F5D373}Dodaj Wode\n{FFFFFF}Etap: %d%%\n{FFFFFF}/heroina woda", stage);
    }
    else if(stage < HEROIN_STAGE_ADD_CALCIUM && mixState == HEROIN_STATE_WATER)
    {
        format(szLabel, sizeof(szLabel), "{CC330B}Gotowanie Wody\n{FFFFFF}Etap: %d%%\n{FFFFFF}Gotowe przy 100%%", stage);
    }
    else if(stage == HEROIN_STAGE_ADD_CALCIUM && mixState == HEROIN_STATE_WATER)
    {
        format(szLabel, sizeof(szLabel), "{F5D373}Dodaj Wapno\n{FFFFFF}Etap: %d%%\n{FFFFFF}/heroina wapno", stage);
    }
    else if(stage < HEROIN_STAGE_ADD_SODIUM && mixState == HEROIN_STATE_CALCIUM)
    {
        format(szLabel, sizeof(szLabel), "{44D80C}Mieszanie Wapna\n{FFFFFF}Etap: %d%%\n{FFFFFF}Gotowe przy 100%%", stage);
    }
    else if(stage == HEROIN_STAGE_ADD_SODIUM && mixState == HEROIN_STATE_CALCIUM)
    {
        format(szLabel, sizeof(szLabel), "{F5D373}Dodaj Sod\n{FFFFFF}Etap: %d%%\n{FFFFFF}/heroina sod", stage);
    }
    else if(stage < HEROIN_STAGE_ADD_ACETONE && mixState == HEROIN_STATE_SODIUM)
    {
        format(szLabel, sizeof(szLabel), "{44D80C}Mieszanie Sodu\n{FFFFFF}Etap: %d%%\n{FFFFFF}Gotowe przy 100%%", stage);
    }
    else if(stage == HEROIN_STAGE_ADD_ACETONE && mixState == HEROIN_STATE_SODIUM)
    {
        format(szLabel, sizeof(szLabel), "{D8AA0C}Dodaj Aceton\n{FFFFFF}Etap: %d%%\n{FFFFFF}/heroina aceton", stage);
    }
    else if(stage < HEROIN_STAGE_READY && mixState == HEROIN_STATE_ACETONE)
    {
        format(szLabel, sizeof(szLabel), "{44D80C}Mieszanie Acetonu\n{FFFFFF}Etap: %d%%\n{FFFFFF}Gotowe przy 100%%", stage);
    }
    else if(stage == HEROIN_STAGE_READY && mixState == HEROIN_STATE_ACETONE)
    {
        format(szLabel, sizeof(szLabel), "{44D80C}GOTOWE!\n{FFFFFF}Etap: %d%%\n{FFFFFF}/heroina zbierz", stage);
    }
    
    if(IsValidDynamic3DTextLabel(gHeroinPots[potid][heroin_label]))
        UpdateDynamic3DTextLabelText(gHeroinPots[potid][heroin_label], 0xFFFFFFFF, szLabel);
    
    return 1;
}

stock Heroin_CreatePot(playerid)
{
    new potid = Heroin_GetFreePot();
    if(potid == -1) return -1;
    
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // Pozycja przed graczem
    new Float:angle;
    GetPlayerFacingAngle(playerid, angle);
    x += 1.0 * floatsin(-angle, degrees);
    y += 1.0 * floatcos(-angle, degrees);
    
    gHeroinPots[potid][heroin_pos][0] = x;
    gHeroinPots[potid][heroin_pos][1] = y;
    gHeroinPots[potid][heroin_pos][2] = z;
    gHeroinPots[potid][heroin_created] = true;
    gHeroinPots[potid][heroin_stage] = 0;
    gHeroinPots[potid][heroin_mix_state] = HEROIN_STATE_NONE;
    gHeroinPots[potid][heroin_mistakes] = 0;
    gHeroinPots[potid][heroin_owner] = PlayerInfo[playerid][pUID];
    
    // Utworz obiekt garnka
    gHeroinPots[potid][heroin_object] = CreateDynamicObject(HEROIN_POT_MODEL, x, y, z, 0.0, 0.0, 0.0);
    
    // Utworz obiekt 743 przy garnku
    gHeroinPots[potid][heroin_object_743] = CreateDynamicObject(743, x, y, z-0.5, 0.0, 0.0, 0.0);
    
    // Utworz label (nizszy - 0.3 zamiast 1.5)
    new szLabel[150];
    format(szLabel, sizeof(szLabel), "{CC330B}Grzanie\n{FFFFFF}Etap: 0%%\n{FFFFFF}Gotowe przy 100%%");
    gHeroinPots[potid][heroin_label] = CreateDynamic3DTextLabel(szLabel, 0xFFFFFFFF, x, y, z + 0.1, 10.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 20.0);
    
    return potid;
}

stock Heroin_DestroyPot(potid)
{
    if(potid < 0 || potid >= MAX_HEROIN_POTS) return 0;
    if(!gHeroinPots[potid][heroin_created]) return 0;
    
    if(IsValidDynamicObject(gHeroinPots[potid][heroin_object]))
        DestroyDynamicObject(gHeroinPots[potid][heroin_object]);
    gHeroinPots[potid][heroin_object] = -1;
    
    if(IsValidDynamicObject(gHeroinPots[potid][heroin_object_743]))
        DestroyDynamicObject(gHeroinPots[potid][heroin_object_743]);
    gHeroinPots[potid][heroin_object_743] = -1;
    
    if(IsValidDynamic3DTextLabel(gHeroinPots[potid][heroin_label]))
        DestroyDynamic3DTextLabel(gHeroinPots[potid][heroin_label]);
    gHeroinPots[potid][heroin_label] = Text3D:-1;
    
    gHeroinPots[potid][heroin_created] = false;
    gHeroinPots[potid][heroin_stage] = 0;
    gHeroinPots[potid][heroin_mix_state] = HEROIN_STATE_NONE;
    gHeroinPots[potid][heroin_mistakes] = 0;
    gHeroinPots[potid][heroin_pos][0] = 0.0;
    gHeroinPots[potid][heroin_pos][1] = 0.0;
    gHeroinPots[potid][heroin_pos][2] = 0.0;
    gHeroinPots[potid][heroin_owner] = 0;
    
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Inicjalizacja
    for(new i = 0; i < MAX_HEROIN_POTS; i++)
    {
        gHeroinPots[i][heroin_created] = false;
        gHeroinPots[i][heroin_object] = -1;
        gHeroinPots[i][heroin_object_743] = -1;
        gHeroinPots[i][heroin_label] = Text3D:-1;
        gHeroinPots[i][heroin_stage] = 0;
        gHeroinPots[i][heroin_mix_state] = HEROIN_STATE_NONE;
    }
    
    // Timer produkcji (co 30 sekund zwiekszamy etap)
    SetTimer("Heroin_ProductionCycle", 30000, true);
    
    print("[HEROIN] System produkcji heroiny zaladowany.");
    return 1;
}

//------------------<[ Publiczne: ]>-------------------

public Heroin_ProductionCycle()
{
    for(new i = 0; i < MAX_HEROIN_POTS; i++)
    {
        if(!gHeroinPots[i][heroin_created]) continue;
        
        new stage = gHeroinPots[i][heroin_stage];
        new mixState = gHeroinPots[i][heroin_mix_state];
        
        // Automatyczny postep w zaleznosci od stanu
        if(stage < HEROIN_STAGE_ADD_WATER && mixState == HEROIN_STATE_NONE)
        {
            gHeroinPots[i][heroin_stage]++;
        }
        else if(stage < HEROIN_STAGE_ADD_CALCIUM && mixState == HEROIN_STATE_WATER)
        {
            gHeroinPots[i][heroin_stage]++;
        }
        else if(stage < HEROIN_STAGE_ADD_SODIUM && mixState == HEROIN_STATE_CALCIUM)
        {
            gHeroinPots[i][heroin_stage]++;
        }
        else if(stage < HEROIN_STAGE_ADD_ACETONE && mixState == HEROIN_STATE_SODIUM)
        {
            gHeroinPots[i][heroin_stage]++;
        }
        else if(stage < HEROIN_STAGE_READY && mixState == HEROIN_STATE_ACETONE)
        {
            gHeroinPots[i][heroin_stage]++;
        }
        
        Heroin_UpdateLabel(i);
    }
    
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:heroina(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /heroina [start/woda/wapno/sod/aceton/zbierz/oproznij]");
    
    new action[32];
    if(sscanf(params, "s[32]", action))
        return sendTipMessage(playerid, "Uzycie: /heroina [start/woda/wapno/sod/aceton/zbierz/oproznij]");
    
    if(!strcmp(action, "start", true))
    {
        // Sprawdz czy gracz jest w skrytce
        if(!Storage_IsPlayerInStorage(playerid))
            return sendErrorMessage(playerid, "Musisz byc w swojej skrytce aby rozpoczac produkcje heroiny.");
        
        // Sprawdz ile garnkow ma gracz (max 2)
        new potCount = Heroin_GetPlayerPotCount(playerid);
        if(potCount >= 2)
            return sendErrorMessage(playerid, "Mozesz miec maksymalnie 2 garnki jednoczesnie. Uzyj /heroina oproznij aby usunac.");
        
        // Sprawdz czy juz jest garnek w poblizu
        new existingPot = Heroin_GetNearestPot(playerid);
        if(existingPot != -1)
            return sendErrorMessage(playerid, "W poblizu juz jest garnek. Uzyj /heroina oproznij aby go usunac.");

        
        new potid = Heroin_CreatePot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie mozna utworzyc wiecej garnkow.");
        
        SendClientMessage(playerid, COLOR_GREEN, "* Rozpoczales produkcje heroiny. Poczekaj az mieszanka sie zagrzeje.");
        
        new szAction[128];
        format(szAction, sizeof(szAction), "* %s rozpoczyna przygotowywanie heroiny.", GetNick(playerid));
        ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        
        return 1;
    }
    else if(!strcmp(action, "woda", true))
    {
        new potid = Heroin_GetNearestPot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie jestes blisko zadnego garnka.");
        
        if(gHeroinPots[potid][heroin_mix_state] >= HEROIN_STATE_WATER)
            return sendErrorMessage(playerid, "Woda juz zostala dodana.");
        
        // Sprawdz czy gracz ma wode w ekwipunku
        new waterItem = HasItemType(playerid, ITEM_TYPE_WATER);
        if(waterItem == -1)
            return sendErrorMessage(playerid, "Nie masz wody w ekwipunku!");
        
        Item_Delete(waterItem, true, 1);
        
        // Sprawdz czy dodano w odpowiednim momencie
        if(gHeroinPots[potid][heroin_stage] != HEROIN_STAGE_ADD_WATER)
        {
            gHeroinPots[potid][heroin_mistakes]++;
            SendClientMessage(playerid, COLOR_YELLOW, "* Dodales wode w zlym momencie - jakosc heroiny bedzie nizsza!");
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREEN, "* Dodales wode do mieszanki.");
        }
        
        gHeroinPots[potid][heroin_mix_state] = HEROIN_STATE_WATER;
        Heroin_UpdateLabel(potid);
        
        return 1;
    }
    else if(!strcmp(action, "wapno", true))
    {
        new potid = Heroin_GetNearestPot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie jestes blisko zadnego garnka.");
        
        if(gHeroinPots[potid][heroin_mix_state] < HEROIN_STATE_WATER)
            return sendErrorMessage(playerid, "Najpierw musisz dodac wode.");
        if(gHeroinPots[potid][heroin_mix_state] >= HEROIN_STATE_CALCIUM)
            return sendErrorMessage(playerid, "Wapno juz zostalo dodane.");
        
        // Sprawdz czy gracz ma Calcium
        new calciumItem = HasItemType(playerid, ITEM_TYPE_CALCIUM);
        if(calciumItem == -1)
            return sendErrorMessage(playerid, "Nie masz wapna (Calcium) w ekwipunku!");
        
        Item_Delete(calciumItem, true, 1);
        
        // Sprawdz czy dodano w odpowiednim momencie
        if(gHeroinPots[potid][heroin_stage] != HEROIN_STAGE_ADD_CALCIUM)
        {
            gHeroinPots[potid][heroin_mistakes]++;
            SendClientMessage(playerid, COLOR_YELLOW, "* Dodales wapno w zlym momencie - jakosc heroiny bedzie nizsza!");
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREEN, "* Dodales wapno do mieszanki.");
        }
        
        gHeroinPots[potid][heroin_mix_state] = HEROIN_STATE_CALCIUM;
        Heroin_UpdateLabel(potid);
        
        return 1;
    }
    else if(!strcmp(action, "sod", true))
    {
        new potid = Heroin_GetNearestPot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie jestes blisko zadnego garnka.");
        
        if(gHeroinPots[potid][heroin_mix_state] < HEROIN_STATE_CALCIUM)
            return sendErrorMessage(playerid, "Najpierw musisz dodac wapno.");
        if(gHeroinPots[potid][heroin_mix_state] >= HEROIN_STATE_SODIUM)
            return sendErrorMessage(playerid, "Sod juz zostal dodany.");
        
        // Sprawdz czy gracz ma Sodium
        new sodiumItem = HasItemType(playerid, ITEM_TYPE_SODIUM);
        if(sodiumItem == -1)
            return sendErrorMessage(playerid, "Nie masz sodu (Sodium) w ekwipunku!");
        
        Item_Delete(sodiumItem, true, 1);
        
        // Sprawdz czy dodano w odpowiednim momencie
        if(gHeroinPots[potid][heroin_stage] != HEROIN_STAGE_ADD_SODIUM)
        {
            gHeroinPots[potid][heroin_mistakes]++;
            SendClientMessage(playerid, COLOR_YELLOW, "* Dodales sod w zlym momencie - jakosc heroiny bedzie nizsza!");
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREEN, "* Dodales sod do mieszanki.");
        }
        
        gHeroinPots[potid][heroin_mix_state] = HEROIN_STATE_SODIUM;
        Heroin_UpdateLabel(potid);
        
        return 1;
    }
    else if(!strcmp(action, "aceton", true))
    {
        new potid = Heroin_GetNearestPot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie jestes blisko zadnego garnka.");
        
        if(gHeroinPots[potid][heroin_mix_state] < HEROIN_STATE_SODIUM)
            return sendErrorMessage(playerid, "Najpierw musisz dodac sod.");
        if(gHeroinPots[potid][heroin_mix_state] >= HEROIN_STATE_ACETONE)
            return sendErrorMessage(playerid, "Aceton juz zostal dodany.");
        
        // Sprawdz czy gracz ma Acetone
        new acetoneItem = HasItemType(playerid, ITEM_TYPE_ACETONE);
        if(acetoneItem == -1)
            return sendErrorMessage(playerid, "Nie masz acetonu w ekwipunku!");
        
        Item_Delete(acetoneItem, true, 1);
        
        // Sprawdz czy dodano w odpowiednim momencie
        if(gHeroinPots[potid][heroin_stage] != HEROIN_STAGE_ADD_ACETONE)
        {
            gHeroinPots[potid][heroin_mistakes]++;
            SendClientMessage(playerid, COLOR_YELLOW, "* Dodales aceton w zlym momencie - jakosc heroiny bedzie nizsza!");
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREEN, "* Dodales aceton do mieszanki.");
        }
        
        gHeroinPots[potid][heroin_mix_state] = HEROIN_STATE_ACETONE;
        Heroin_UpdateLabel(potid);
        
        return 1;
    }
    else if(!strcmp(action, "zbierz", true))
    {
        new potid = Heroin_GetNearestPot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie jestes blisko zadnego garnka.");
        
        if(gHeroinPots[potid][heroin_mix_state] != HEROIN_STATE_ACETONE)
            return sendErrorMessage(playerid, "Mieszanka nie jest jeszcze gotowa - dodaj wszystkie skladniki.");
        
        if(gHeroinPots[potid][heroin_stage] < HEROIN_STAGE_READY)
            return sendErrorMessage(playerid, "Mieszanka nie jest jeszcze gotowa - poczekaj do 100%%.");
        
        // Ilosc zalezy od bledow (0 bledow = 10-15g, 4 bledy = 2-5g)
        new mistakes = gHeroinPots[potid][heroin_mistakes];
        new baseAmount, bonusAmount;
        new qualityName[32];
        
        if(mistakes == 0)
        {
            baseAmount = 10;
            bonusAmount = 6;
            qualityName = "doskonalej jakosci";
        }
        else if(mistakes == 1)
        {
            baseAmount = 7;
            bonusAmount = 5;
            qualityName = "dobrej jakosci";
        }
        else if(mistakes == 2)
        {
            baseAmount = 5;
            bonusAmount = 4;
            qualityName = "sredniej jakosci";
        }
        else if(mistakes == 3)
        {
            baseAmount = 3;
            bonusAmount = 3;
            qualityName = "slabej jakosci";
        }
        else
        {
            baseAmount = 2;
            bonusAmount = 2;
            qualityName = "bardzo slabej jakosci";
        }
        
        new amount = baseAmount + random(bonusAmount);
        
        Item_Add("Heroina", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_HEROIN, 19182, 0, true, playerid, amount);
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Zebrales %dg heroiny %s!", amount, qualityName);
        
        if(mistakes > 0)
            va_SendClientMessage(playerid, COLOR_YELLOW, "* Popelniles %d bledow w procesie - mniej heroiny.", mistakes);
        
        new szAction[128];
        format(szAction, sizeof(szAction), "* %s zbiera gotowa heroine.", GetNick(playerid));
        ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        
        Heroin_DestroyPot(potid);
        
        return 1;
    }
    else if(!strcmp(action, "oproznij", true))
    {
        new potid = Heroin_GetNearestPot(playerid);
        if(potid == -1)
            return sendErrorMessage(playerid, "Nie jestes blisko zadnego garnka.");
        
        Heroin_DestroyPot(potid);
        SendClientMessage(playerid, COLOR_GREEN, "* Oprozniles garnek.");
        
        return 1;
    }
    
    return sendTipMessage(playerid, "Uzycie: /heroina [start/woda/wapno/sod/aceton/zbierz/oproznij]");
}

//end
