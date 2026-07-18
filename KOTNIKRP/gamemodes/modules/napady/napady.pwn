//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Moduł: napady.pwn ]------------------------------------------//
//----------------------------------------[ Autor: renosk ]----------------------------------------//

#include <YSI_Coding\y_hooks>

//-----------------<[ Funkcje: ]>-------------------

stock IsValidHeist(heistid)
{
    if(Iter_Contains(Heists, heistid) && Heist[heistid][h_UID]) return 1;
    return 0;
}

stock GetClosestHeist(playerid)
{
    foreach(new i : Heists)
        if(IsPlayerInRangeOfPoint(playerid, 2.0, Heist[i][h_Pos][0], Heist[i][h_Pos][1], Heist[i][h_Pos][2])) return i;
    return -1;
}

//-----------------<[ MySQL: ]>-------------------

LoadHeists()
{
    new Cache:result;
    result = mysql_query(Database, sprintf("SELECT * FROM `mru_napady` LIMIT %d", MAX_HEISTS));
    for(new i = 0; i < cache_num_rows(); i++)
    {
        //print(query);
        new id = Iter_Free(Heists);
        if(id == -1)
            return print("[LOAD] Wystąpił nieoczekiwany błąd. Brak wolnego slotu na napad, wczytywanie przerwane.");
        cache_get_value_index_int(i, 0,     Heist[id][h_UID]);
        cache_get_value_index(i, 1,         Heist[id][h_Name]);
        cache_get_value_index_float(i, 2,         Heist[id][h_Pos][0]);
        cache_get_value_index_float(i, 3,         Heist[id][h_Pos][1]);
        cache_get_value_index_float(i, 4,         Heist[id][h_Pos][2]);
        cache_get_value_index_float(i, 5,         Heist[id][h_Pos][3]);
        cache_get_value_index_float(i, 6,         Heist[id][h_Pos][4]);
        cache_get_value_index_float(i, 7,         Heist[id][h_Pos][5]);
        cache_get_value_index_int(i, 8,         Heist[id][h_VW]);
        cache_get_value_index_int(i, 9,         Heist[id][h_INT]);
        cache_get_value_index_int(i, 10,         Heist[id][h_Cash]);
        Heist[id][h_Label] = CreateDynamic3DTextLabel(sprintf("Sejf %s(%d)\n/zrobnapad", Heist[id][h_Name], id), COLOR_PURPLE, Heist[id][h_Pos][0],Heist[id][h_Pos][1],Heist[id][h_Pos][2], 6.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, Heist[id][h_VW], Heist[id][h_INT]);
        Heist[id][h_CP] = CreateDynamicCP(Heist[id][h_Pos][0],Heist[id][h_Pos][1],Heist[id][h_Pos][2], 3.0, Heist[id][h_VW], Heist[id][h_INT]);
        Heist[id][h_OccupiedBy] = INVALID_PLAYER_ID;
        Iter_Add(Heists, id);
    }
    cache_delete(result);
    printf("[LOAD] Załadowano %d napad[ów/y]", Iter_Count(Heists));
    return 1;
}

//-----------------<[ Funkcje: ]>-------------------

stock Heist_Fail(playerid, killerid)
{
    if(PlayerHeist[playerid][p_Heist] == -1) return 0;
    Heist_Reset(PlayerHeist[playerid][p_Heist]);
    PlayerHeist[playerid][p_Heist] = -1;
    PlayerHeist[playerid][p_RobTime] = 0;
    PlayerHeist[playerid][p_MoneyStolen] = 0;
    PlayerTextDrawHide(playerid, RobberyText[playerid]);
    if(killerid != INVALID_PLAYER_ID)
    {
        if(IsAPolicja(killerid))
        {
            DajKaseDone(killerid, PRICE_NAPAD_FAIL);
			GameTextForPlayer(killerid, "~w~Niebezpieczny przestepca~r~Zabity~n~Nagroda~g~$"#PRICE_NAPAD_FAIL"!", 5000, 1);
			OOCNews(COLOR_LIGHTRED, sprintf("<< Policjant %s powstrzymał napad prowadzony przez %s >>", GetNick(killerid), GetNick(playerid)));
        }
    }
    return 1;
}

stock CreateHeist(name[], cash, Float:x, Float:y, Float:z, int, vw)
{
    new id = Iter_Free(Heists);
    if(id==-1) return 0;
    format(Heist[id][h_Name], 64, name);
    Heist[id][h_Pos][0] = x;
    Heist[id][h_Pos][1] = y;
    Heist[id][h_Pos][2] = z;
    Heist[id][h_VW] = vw;
    Heist[id][h_INT] = int;
    Heist[id][h_Cash] = cash;
    Heist[id][h_Label] = CreateDynamic3DTextLabel(sprintf("Sejf %s(%d)\n/zrobnapad", Heist[id][h_Name], id), COLOR_PURPLE, Heist[id][h_Pos][0],Heist[id][h_Pos][1],Heist[id][h_Pos][2], 6.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, Heist[id][h_VW], Heist[id][h_INT]);
    Heist[id][h_CP] = CreateDynamicCP(Heist[id][h_Pos][0],Heist[id][h_Pos][1],Heist[id][h_Pos][2], 3.0, Heist[id][h_VW], Heist[id][h_INT]);
    Heist[id][h_OccupiedBy] = INVALID_PLAYER_ID;
    Iter_Add(Heists, id);
    new query[248];
    format(query, sizeof query, "INSERT INTO `mru_napady` (`Name`, `X`, `Y`, `Z`, `VW`, `INT`, `Cash`) VALUES ('%s', '%f', '%f', '%f', '%d', '%d', '%d')", name, x, y, z, vw, int, cash);
    if(mysql_query(Database, query)) {
        Heist[id][h_UID] = cache_insert_id();
        return id;
    }
    return -1;
}

stock Heist_Reset(heistid)
{
    if(IsValidDynamicObject(Heist[heistid][h_Object][0])) DestroyDynamicObject(Heist[heistid][h_Object][0]);
    if(IsValidDynamicObject(Heist[heistid][h_Object][1])) DestroyDynamicObject(Heist[heistid][h_Object][1]);
    Heist[heistid][h_OccupiedBy] = INVALID_PLAYER_ID;
    return 1;
}

stock Heist_Init(playerid, heistid)
{
    if(!IsValidHeist(heistid)) return 0;
	//todo  if(!PlayerInfo[playerid][pMaska])
	new nick[32];
	if(GetPVarString(playerid, "maska_nick", nick, 24))
    {
        if (PoziomPoszukiwania[playerid] < 6) {
            PoziomPoszukiwania[playerid] = 6;
            SetPlayerWantedLevelEx(playerid, PoziomPoszukiwania[playerid]);
        }
		SetPlayerCriminal(playerid,INVALID_PLAYER_ID, "Napad, twarz rozpoznana przez kamery");
        _MruGracz(playerid, "Kamery zarejestrowały twoją twarz.");
    }
    new Float:x, Float:y, Float:z, Float:a;
    
    GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

    x += (1.25 * floatsin(-a, degrees));
	y += (1.25 * floatcos(-a, degrees));
	Heist[heistid][h_Object][0] = CreateDynamicObject(SAFE_ID, x, y, z-0.55, 0.0, 0.0, a, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

    a += 90.0;
	x += (0.42 * floatsin(-a, degrees)) + (-0.22 * floatsin(-(a - 90.0), degrees));
	y += (0.42 * floatcos(-a, degrees)) + (-0.22 * floatcos(-(a - 90.0), degrees));
    Heist[heistid][h_Object][1] = CreateDynamicObject(SAFEDOOR_ID, x, y, z-0.55, 0.0, 0.0, a + 270.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

    SetPlayerAttachedObject(playerid, 4, 18634, 6, 0.054000, 0.013999, -0.087999, -94.399963, -25.899974, 175.799911);
	ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_LOOP", 4.0, 1, 0, 0, 0, 0);
    //TogglePlayerControllable(playerid, 0);
    //GameTextForPlayer(playerid, "~b~~h~Sejf~n~~n~~w~Otwieranie sejfu...~n~Czas wykonania: 30s", 30000, 1);

    PlayerHeist[playerid][p_MoneyStolen] = 0;
    PlayerHeist[playerid][p_RobTime] = OPEN_SAFETIME;
    PlayerHeist[playerid][p_State] = STATE_OPENING;

    new string[128];
	format(string, sizeof(string), "~b~~h~Sejf~n~~n~~w~Otwieranie sejfu...~n~Ukonczone w ~r~%s", ConvertToMinutes(PlayerHeist[playerid][p_RobTime]));
	PlayerTextDrawSetString(playerid, RobberyText[playerid], string);
	PlayerTextDrawShow(playerid, RobberyText[playerid]);

    Streamer_Update(playerid);
    return 1;
}

stock Heist_Delete(heistid)
{
    if(Heist[heistid][h_OccupiedBy] != INVALID_PLAYER_ID) return 0;

    new query[248];
    format(query, sizeof query, "DELETE FROM `mru_napady` WHERE `UID` = '%d'", Heist[heistid][h_UID]);
    Heist[heistid][h_UID] = -1;
    if(IsValidDynamic3DTextLabel(Heist[heistid][h_Label])) DestroyDynamic3DTextLabel(Heist[heistid][h_Label]);
    if(IsValidDynamicCP(Heist[heistid][h_CP])) DestroyDynamicCP(Heist[heistid][h_CP]);
    Iter_Remove(Heists, heistid);
    if(mysql_query(Database, query)) {
        return 1;
    }
    return 0;
}

ConvertToMinutes(time)
{
    // http://forum.sa-mp.com/showpost.php?p=3223897&postcount=11
    new string[15];//-2000000000:00 could happen, so make the string 15 chars to avoid any errors
    format(string, sizeof(string), "%02d:%02d", time / 60, time % 60);
    return string;
}

formatInt(intVariable, iThousandSeparator = ',', iCurrencyChar = '$')
{
    /*
		By Kar
		https://gist.github.com/Kar2k/bfb0eafb2caf71a1237b349684e091b9/8849dad7baa863afb1048f40badd103567c005a5#file-formatint-function
	*/
	static
		s_szReturn[ 32 ],
		s_szThousandSeparator[ 2 ] = { ' ', EOS },
		s_szCurrencyChar[ 2 ] = { ' ', EOS },
		s_iVariableLen,
		s_iChar,
		s_iSepPos,
		bool:s_isNegative
	;

	format( s_szReturn, sizeof( s_szReturn ), "%d", intVariable );

	if(s_szReturn[0] == '-')
		s_isNegative = true;
	else
		s_isNegative = false;

	s_iVariableLen = strlen( s_szReturn );

	if ( s_iVariableLen >= 4 && iThousandSeparator)
	{
		s_szThousandSeparator[ 0 ] = iThousandSeparator;

		s_iChar = s_iVariableLen;
		s_iSepPos = 0;

		while ( --s_iChar > _:s_isNegative )
		{
			if ( ++s_iSepPos == 3 )
			{
				strins( s_szReturn, s_szThousandSeparator, s_iChar );

				s_iSepPos = 0;
			}
		}
	}
	if(iCurrencyChar) {
		s_szCurrencyChar[ 0 ] = iCurrencyChar;
		strins( s_szReturn, s_szCurrencyChar, _:s_isNegative );
	}
	return s_szReturn;
}

//-----------------<[ Komendy: ]>-------------------

YCMD:zrobnapad(playerid, params[], help)
{
    if(!IsAPrzestepca(playerid)) return noAccessMessage(playerid);
    if(GroupPlayerDutyRank(playerid) < 7) return sendErrorMessage(playerid, "Napad można zacząć od 7 rangi!");

    new heist = GetClosestHeist(playerid), cops, criminals;
    if(heist == -1) return sendTipMessage(playerid, "Nie znajdujesz się przy sejfie.");
    if(IsPlayerConnected(Heist[heist][h_OccupiedBy])) return sendTipMessage(playerid, "Napad już trwa.");

    if( gettime() < Heist[heist][h_Cooldown] ) return sendTipMessage(playerid, "Napady można robić co 5 godzin.");
    if(shifthour < 15) return sendTipMessage(playerid, "Napad można robić od godziny 15!");

    if(HasItemType(playerid, ITEM_TYPE_LOM) == -1) return sendErrorMessage(playerid, "Do napadu potrzebny Ci łom. Kup go w 24/7 !");
    foreach(new i : Player)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(i, x, y, z);
        if(IsAPolicja(i) && OnDuty[i]) cops++;
        if(IsPlayerInRangeOfPoint(i, 50.0, x, y, z) && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid) && GetPlayerInterior(i) == GetPlayerInterior(playerid) && IsAPrzestepca(i)) criminals++;
    }
    if(cops < 3) return sendTipMessage(playerid, "Za mało policjantów na służbie, żeby móc zrobić ten napad. (minimum: 3)");
    if(criminals < 5) return sendTipMessage(playerid, "W pomieszczeniu musi być conajmniej 5 osób z organizacji przestępczej.");
    new radioMsg[256];
    format(radioMsg, sizeof radioMsg, "W pomieszczeniu %s został uruchomiony alarm. Udaj się tam jak najszybciej!!! Zgloszona ilosc kryminalistow: %d", Heist[heist][h_Name], criminals);
    SendRadioMessage(1, COLOR_YELLOW2, radioMsg);
    SendRadioMessage(2, COLOR_YELLOW2, radioMsg);
    SendRadioMessage(1, COLOR_YELLOW2, radioMsg);
    SendRadioMessage(2, COLOR_YELLOW2, radioMsg);
    Heist[heist][h_OccupiedBy] = playerid;
    PlayerHeist[playerid][p_Heist] = heist;
    PlayerHeist[playerid][p_VW] = GetPlayerVirtualWorld(playerid);
    Heist_Init(playerid, heist);
    return 1;
}

YCMD:napad(playerid, params[], help)
{
    if(PlayerInfo[playerid][pAdmin] < 5000)
        return noAccessMessage(playerid);
    new opt[64], opt2[64];
    if(sscanf(params, "s[64]S()[64]", opt, opt2))
        return sendTipMessage(playerid, "Użyj: /napad [stworz | usun | lista]");
    switch(YHash(opt))
    {
        case _H<stworz>:
        {
            if(Iter_Count(Heists) >= MAX_HEISTS) return sendTipMessage(playerid, "Nie można stworzyć więcej napadów.");
            if(GetPlayerVirtualWorld(playerid) < 1) return sendTipMessage(playerid, "Chcesz stworzyć napad na otwartym świecie?");
            new cash, name[64];
            if(sscanf(opt2, "s[64]d", name, cash)) return sendTipMessage(playerid, "Użyj: /napad stworz [nazwa] [kasa za napad]");
            if(cash<PRICE_NAPAD_MIN || cash>PRICE_NAPAD_MAX) return sendTipMessage(playerid, "Kasa od $"#PRICE_NAPAD_MIN" do $"#PRICE_NAPAD_MAX"!");
            SetPVarInt(playerid, "Heist-Cash", cash);
            SetPVarString(playerid, "Heist-Name", name);
            ShowPlayerDialogEx(playerid, D_NAPAD_C_CONFIRM, DIALOG_STYLE_MSGBOX, "Tworzenie napadu", sprintf("Czy na pewno chcesz stworzyć napad w pozycji, w której aktualnie się znajdujesz?\nNazwa:\t%s\nKasa:\t${00FF00}%d", name, cash), "Potwierdź", "Wyjdź");
        }
        case _H<usun>:
        {
            new id;
            if(sscanf(opt2, "d", id)) return sendTipMessage(playerid, "Użyj: /napad usun [id]");
            if(!IsValidHeist(id)) return sendTipMessage(playerid, "Napad o takim ID nie istnieje.");
            if(Heist_Delete(id)) return _MruGracz(playerid, sprintf(" Pomyślnie usunięto napad o ID: %d", id));
            else return _MruGracz(playerid, "Coś poszło nie tak.");
        }
        case _H<lista>:
        {
            if(Iter_Count(Heists) < 1)  return sendTipMessage(playerid, "Na serwerze nie istnieją żadne napady. Stwórz go za pomocą /napad stworz.");
            new lstring[2048];
            lstring = "#\tUID\tNAZWA\tKASA";
            foreach(new i : Heists)
                strcat(lstring, sprintf("\n%d\t%d\t%s\t${00FF00}%d", i, Heist[i][h_UID], Heist[i][h_Name], Heist[i][h_Cash]));
            ShowPlayerDialogEx(playerid, D_LISTANAPADOW, DIALOG_STYLE_TABLIST_HEADERS, "M-RP »» Lista napadów", lstring, "Teleportuj", "Wyjdź");
        }
        default: 
            sendTipMessage(playerid, "Zła opcja.");
    }
    return 1;
}