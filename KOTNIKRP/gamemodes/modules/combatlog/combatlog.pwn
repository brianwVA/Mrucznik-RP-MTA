stock InitCombatLogTextdraw(playerid)
{
    PlayerInfo[playerid][pCombatLog] = CreatePlayerTextDraw(playerid, 496.500000, 4.000000, "~r~graj do: 15:41");
    PlayerTextDrawFont(playerid, PlayerInfo[playerid][pCombatLog], 3);
    PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pCombatLog], 0.341666, 1.500000);
    PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pCombatLog], 632.500000, 11.000000);
    PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pCombatLog], 1);
    PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pCombatLog], 0);
    PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pCombatLog], 1);
    PlayerTextDrawColour(playerid, PlayerInfo[playerid][pCombatLog], -1);
    PlayerTextDrawBackgroundColour(playerid, PlayerInfo[playerid][pCombatLog], 255);
    PlayerTextDrawBoxColour(playerid, PlayerInfo[playerid][pCombatLog], 50);
    PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pCombatLog], 0);
    PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pCombatLog], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pCombatLog], 0);
}

stock DestroyTDDCombatLog(playerid)
{
    PlayerTextDrawHide(playerid, PlayerInfo[playerid][pCombatLog]);
    PlayerTextDrawDestroy(playerid, PlayerInfo[playerid][pCombatLog]);
}

stock GetEmptyCombatLogSlot()
{
    for(new i = 0; i < MAX_COMBATLOGS; i++) {
        if(CombatLogs[i][CombatPUID] <= 0) {
            return i;
        }
    }
    return -1;
}

stock GetCombatLogByPUID(puid)
{
    for(new i = 0; i!=MAX_COMBATLOGS; i++) {
        if(CombatLogs[i][CombatPUID] == puid) {
            return i;
        }
    }
    return -1;
}

stock DestroyCombatData(slot)
{
    CombatLogs[slot][CombatTimerType] = 0;
    CombatLogs[slot][CombatTimer] = 0;
    CombatLogs[slot][CombatPUID] = -1;
    CombatLogs[slot][CombatX] = -1;
    CombatLogs[slot][CombatY] = -1;
    CombatLogs[slot][CombatZ] = -1;
    CombatLogs[slot][CombatVW] = -1;
    CombatLogs[slot][CombatInt] = -1;
}

stock CreateNewCombatLog(playerid)
{
    if(playerid == INVALID_PLAYER_ID) return 0;
    if(gPlayerLogged[playerid] == 0) return 0;
    new puid = PlayerInfo[playerid][pUID];
    new activelog = GetCombatLogByPUID(puid);

    // wykrywnie starego combat loga by nie zasmiecac
    new slot;
    if(activelog != -1) {
        slot = activelog;
    }
    else {
        slot = GetEmptyCombatLogSlot(); 
        InitCombatLogTextdraw(playerid);
    }

    // tworzenie textdrawa
    new CalcTime = gettime() + 120; 
    new year, month, day, hour, minute, second;
    TimestampToDate(CalcTime, year, month, day, hour, minute, second, 1);
    PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pCombatLog], sprintf("~r~Graj do: %s:%s", AddZeroToTime(hour), AddZeroToTime(minute))); /* %s:%s */
    PlayerTextDrawShow(playerid, PlayerInfo[playerid][pCombatLog]);

    // tworzenie nowego timera combatloga
    CombatLogs[slot][CombatTimer] = 2;
    CombatLogs[slot][CombatTimerType] = 1;
    CombatLogs[slot][CombatPUID] = puid;
    return 1;
}

stock CombatLogDisconnect(playerid)
{
    new slot = GetCombatLogByPUID(PlayerInfo[playerid][pUID]);
    if(gPlayerLogged[playerid] == 0) return 1;
    if(slot != -1) {
        new Float:x, Float:y, Float:z;
		GetPlayerPos( playerid, x, y, z );
        CombatLogs[slot][CombatX] = x;
        CombatLogs[slot][CombatY] = y;
        CombatLogs[slot][CombatZ] = z;
        CombatLogs[slot][CombatVW] = GetPlayerVirtualWorld(playerid);
        CombatLogs[slot][CombatInt] = GetPlayerInterior(playerid);
        CombatLogs[slot][CombatTimer] = 11;
        CombatLogs[slot][CombatTimerType] = 2;
        Log(combatLog, WARNING, "%s wyszedł z gry podczas combat logu [%f %f %f]", GetPlayerLogName(playerid), CombatLogs[slot][CombatX], CombatLogs[slot][CombatY], CombatLogs[slot][CombatZ]);
    }
    return 1;
}

/*
CMD:createcombat(playerid, params[])
{
    CreateNewCombatLog(playerid);
    return 1;
}
*/

stock DestroyCombatLog(playerid)
{
    new slot = GetCombatLogByPUID(PlayerInfo[playerid][pUID]);
    if(slot != -1) {
        DestroyCombatData(slot);
        DestroyTDDCombatLog(playerid);
    }
}

CMD:combatlog(playerid, params[])
{
    new slot = GetCombatLogByPUID(PlayerInfo[playerid][pUID]);
    if(slot == -1) {
        sendTipMessage(playerid, "Nie posiadasz aktywnego combatloga.");
        return 1;
    }

    new minutes = CombatLogs[slot][CombatTimer];
    new msg[128];
    format(msg, sizeof(msg), "{A52A2A}Posiadasz combatloga jeszcze: %d minut.", minutes);
    SendClientMessage(playerid, COLOR_LIGHTRED, msg);
    return 1;
}

CMD:startcombatlog(playerid, params[])
{
    new targetid = INVALID_PLAYER_ID;

    if(!IsPlayerConnected(playerid)) return 1;

    if(PlayerInfo[playerid][pAdmin] < 1 && !IsAScripter(playerid)) {
        return noAccessMessage(playerid);
    }

    if(sscanf(params, "k<fix>", targetid)) {
        sendTipMessage(playerid, "Użyj /startcombatlog [id/nick]");
        return 1;
    }

    if(!IsPlayerConnected(targetid)) {
        sendErrorMessage(playerid, "Nie ma takiego gracza !");
        return 1;
    }

    CreateNewCombatLog(targetid);
    new msg[128];
    format(msg, sizeof(msg), "{A52A2A}Twoj combatlog zostal stworzony przez administratora %s.", GetNickEx(playerid));
    SendClientMessage(targetid, COLOR_LIGHTRED, msg);
    Log(combatLog, WARNING, "Admin %s stworzył combatlog gracza %s", GetPlayerLogName(playerid), GetPlayerLogName(targetid));
    sendTipMessage(playerid, "Stworzyłeś combatlog wybranego gracza.");
    return 1;
}

CMD:stopcombatlog(playerid, params[])
{
    new targetid = INVALID_PLAYER_ID;

    if(!IsPlayerConnected(playerid)) return 1;

    if(PlayerInfo[playerid][pAdmin] < 1 && !IsAScripter(playerid)) {
        return noAccessMessage(playerid);
    }

    if(sscanf(params, "k<fix>", targetid)) {
        sendTipMessage(playerid, "Użyj /stopcombatlog [id/nick]");
        return 1;
    }

    if(!IsPlayerConnected(targetid)) {
        sendErrorMessage(playerid, "Nie ma takiego gracza !");
        return 1;
    }

    new slot = GetCombatLogByPUID(PlayerInfo[targetid][pUID]);
    if(slot == -1) {
        sendTipMessage(playerid, "Ten gracz nie posiada aktywnego combatloga.");
        return 1;
    }

    new msg[128];
    format(msg, sizeof(msg), "{A52A2A}Twoj combatlog zostal usuniety przez administratora %s.", GetNickEx(playerid));
    SendClientMessage(targetid, COLOR_LIGHTRED, msg);
    DestroyCombatLog(targetid);
    Log(combatLog, WARNING, "Admin %s usunal combatlog gracza %s", GetPlayerLogName(playerid), GetPlayerLogName(targetid));
    sendTipMessage(playerid, "Usunąłeś combatlog wybranego gracza.");
    return 1;
}


stock CombatLogOnLogin(playerid)
{
    new slot = GetCombatLogByPUID(PlayerInfo[playerid][pUID]);
    if(slot != -1) {
        SendClientMessage(playerid, -1, "{A52A2A}Posiadałeś CombatLoga na 10 minut, jednak udało ci się wejść do gry w tym czasie. Twoje przedmioty są dalej twoje.");
        DestroyCombatData(slot);
        CreateNewCombatLog(playerid);
    }
    return 1;
}

stock CombatLogTimer()
{
    // CombatLog
	for(new i = 0; i < MAX_COMBATLOGS; i++)
	{
		if(CombatLogs[i][CombatPUID] <= 0) continue;
		if(CombatLogs[i][CombatTimer] <= 0) continue;

		CombatLogs[i][CombatTimer] -= 1;
		if(CombatLogs[i][CombatTimer] == 1) {
			if(CombatLogs[i][CombatTimerType] == 1) {
				new pid = GetPlayerIDFromUID(CombatLogs[i][CombatPUID]);
                if(pid != INVALID_PLAYER_ID) {
                    PlayerTextDrawHide(pid, PlayerInfo[pid][pCombatLog]);
                }
				DestroyCombatData(i);
                continue;
			}
			else if(CombatLogs[i][CombatTimerType] == 2) {
                new check_bug = GetPlayerIDFromUID(CombatLogs[i][CombatPUID]);
                if(check_bug != INVALID_PLAYER_ID) {
                    DestroyCombatData(i);
                    continue;
                }
                
                new id = Item_Add(sprintf("Portfel %s",  MruMySQL_GetNameFromUID(CombatLogs[i][CombatPUID])), ITEM_OWNER_TYPE_DROPPED, CombatLogs[i][CombatPUID], ITEM_TYPE_PORTFEL, MruMySQL_GetAccInt("Money", MruMySQL_GetNameFromUID(CombatLogs[i][CombatPUID])), 0);
                Item[id][i_3DText] = CreateDynamic3DTextLabel(sprintf("(ID: %d) %s x%d", id, Item[id][i_Name], Item[id][i_Quantity]), COLOR_WHITE, CombatLogs[i][CombatX], CombatLogs[i][CombatY], CombatLogs[i][CombatZ], 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, CombatLogs[i][CombatVW], CombatLogs[i][CombatInt]);
                Item[id][i_Dropped] = 1;
                Item[id][i_Pos][0] = CombatLogs[i][CombatX];
                Item[id][i_Pos][1] = CombatLogs[i][CombatY];
                Item[id][i_Pos][2] = CombatLogs[i][CombatZ];
                Item[id][i_VW] = CombatLogs[i][CombatVW];
                Item[id][i_INT] = CombatLogs[i][CombatInt];
                SaveItem(id);
                MruMySQL_SetAccInt("Money", MruMySQL_GetNameFromUID(CombatLogs[i][CombatPUID]), 0);

                mysql_tquery_format("UPDATE `mru_items` SET `dropped` = 1, `owner_type` = '0', `X` = '%f', `Y` = '%f', `Z` = '%f', `vw` = '%d', `int` = '%d', `used` = '0' WHERE `owner` = '%d' AND `owner_type` = '1'",  CombatLogs[i][CombatX], CombatLogs[i][CombatY], CombatLogs[i][CombatZ], CombatLogs[i][CombatVW], CombatLogs[i][CombatInt], CombatLogs[i][CombatPUID]);
                foreach(new j : Items)
                {
                    if(Item[j][i_Owner] == CombatLogs[i][CombatPUID] && Item[j][i_OwnerType] == ITEM_OWNER_TYPE_PLAYER)
                    {
                        Item[j][i_3DText] = CreateDynamic3DTextLabel(sprintf("(ID: %d) %s x%d", j, Item[j][i_Name], Item[j][i_Quantity]), COLOR_WHITE, CombatLogs[i][CombatX], CombatLogs[i][CombatY], CombatLogs[i][CombatZ], 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, CombatLogs[i][CombatVW], CombatLogs[i][CombatInt]);
                        Item[j][i_Dropped] = 1;
                        Item[j][i_OwnerType] = ITEM_OWNER_TYPE_DROPPED;
                        Item[j][i_Pos][0] = CombatLogs[i][CombatX];
                        Item[j][i_Pos][1] = CombatLogs[i][CombatY];
                        Item[j][i_Pos][2] = CombatLogs[i][CombatZ];
                        Item[j][i_VW] = CombatLogs[i][CombatVW];
                        Item[j][i_INT] = CombatLogs[i][CombatInt];
                        Item[j][i_Used] = 0;
                    }
                }
                SetTimerEx("LoadDroppedPlayerItems", 2500, false, "d", CombatLogs[i][CombatPUID]);
                Log(combatLog, WARNING, "{Player: %s[%d]} wydropił itemy z powodu combat loga  [%f %f %f]", MruMySQL_GetNameFromUID(CombatLogs[i][CombatPUID]), CombatLogs[i][CombatPUID], CombatLogs[i][CombatX], CombatLogs[i][CombatY], CombatLogs[i][CombatZ]);
            	DestroyCombatData(i);
                continue;
			}
		}
	}
    return 1;
}


stock CheckPlayerInAction(playerid)
{
    if(PlayerTied[playerid] >= 1 || PlayerCuffed[playerid] >= 1 || Kajdanki_JestemSkuty[playerid] >= 1 || poscig[playerid] >= 1)
    {
       CreateNewCombatLog(playerid);
    }
}