//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
//---------------------------------------[ Moduł: system-kary.pwn ]------------------------------------------//
//----------------------------------------[ Autor: never ]----------------------------------------//

KickPlayerTXD(playerid, adminid, reason[])
{
    //PlayerLogged[playerid]=0;
    new str[128], adminname[MAX_PLAYER_NAME + 1];
	if(adminid != INVALID_PLAYER_ID) format(adminname, sizeof adminname, GetNickEx(adminid));
	else format(adminname, sizeof adminname, "System");
    format(str, sizeof(str), "~r~Kick~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", GetNick(playerid), adminname, Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
    return 1;
}

AJPlayerTXD(playerid, adminid, reason[], timeVal)
{
	new str[256];
    format(str, sizeof(str), "~r~AdminJail [%d minut]~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", timeVal, GetNick(playerid), GetNickEx(adminid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
BPPlayerTXD(playerid, adminid, timeVal, reason[])
{
	new str[256];
    format(str, sizeof(str), "~r~Blokada pisania & opisu [%d godzin]~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s",timeVal, GetNick(playerid), GetNickEx(adminid),Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
BanPlayerTXD(playerid, reason[])
{
	new str[128];
    format(str, sizeof(str), "~r~Banicja~n~~w~Dla: ~y~%s~n~~w~Powod: ~y~%s", GetNickEx(playerid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}

	return 1;
}
WarnPlayerTXD(playerid, adminid, reason[])
{
	new str[128];
    format(str, sizeof(str), "~r~Warn~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", GetNick(playerid), GetNickEx(adminid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
BlockPlayerTXD(playerid, adminid, reason[])
{
	new str[128];
    format(str, sizeof(str), "~r~Block~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", GetNick(playerid), GetNickEx(adminid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
PWarnPlayerTXD(player[], adminid, result[])
{
	new str[128];
	new nickDoWarna[MAX_PLAYER_NAME + 1]; 
	strcat(nickDoWarna, player); 
    format(str, sizeof(str), "~r~Warn Offline~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", nickDoWarna, GetNickEx(adminid), Odpolszcz(result));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}

N_GivePWarnForPlayer(player[], adminid, result[]) 
{
	new nickDoWarna[MAX_PLAYER_NAME + 1];
	strcat(nickDoWarna, player); 
	new string[256];
	if(strfind(result, "/q") != -1 || strfind(result, "ucieczka") != -1 || strfind(result, "q podczas akcji") != -1) MruMySQL_SetAccInt("Jailed", nickDoWarna, 0);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscWarn[adminid] = iloscWarn[adminid]+1;
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	Log(punishmentLog, WARNING, "Admin %s ukarał offline %s karą warna, powód: %s", 
		GetPlayerLogName(adminid),
		player,
		result
	);

	format(string, sizeof(string), "AdmCmd: Konto gracza OFFLINE %s zostalo zwarnowane przez %s, Powod: %s", nickDoWarna, GetNickEx(adminid), Odpolszcz(result));
	SendMessageToAdmin(string, COLOR_RED); 
	return 1;
}

N_GiveWarnForPlayer(playerid, adminid, result[], nokick = 1)
{
	new str[256], query[256];
	new nickDoWarna[MAX_PLAYER_NAME + 1];
	strcat(nickDoWarna, GetNick(playerid));
	PlayerInfo[playerid][pWarns] += 1;
	format(query, sizeof(query), "UPDATE `mybb_users` SET `samp_warns` = `samp_warns`+1 WHERE `uid` = '%d'", PlayerInfo[playerid][pGID]);
	mysql_query(Database, query);
	if(PlayerInfo[playerid][pWarns] >= 3)
	{
		KickEx(playerid);
		return 1;	
	}
	
	format(str, sizeof(str), "Dostałeś warna od %s, powód: %s", GetNickEx(adminid), (result));
	SendClientMessage(playerid, COLOR_LIGHTRED, str);
	Log(punishmentLog, WARNING, "Admin %s ukarał %s karą warna, powód: %s", 
		GetPlayerLogName(adminid),
		GetPlayerLogName(playerid),
		result
	);
	if(!nokick)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "Lepiej żebyś ochłonął. Dostajesz warn & kick - wróć jak tylko przemyślisz swoje postępowanie.");
		KickEx(playerid);
	}
	return 1;
}
N_GiveBanForPlayer(playerid, adminid, result[])
{
	new str[256], adminnick[32], adminlognick[200];
	if(adminid == -1) {
		adminnick = "SYSTEM";
		adminlognick = "SYSTEM";
	} else {
		adminnick = GetNickEx(adminid);
		format(adminlognick, sizeof(adminlognick), "%s", GetPlayerLogName(adminid));
		
		format(str, sizeof(str), "Admini/%s.ini", adminnick);
		dini_IntSet(str, "Ilosc_Banow", dini_Int(str, "Ilosc_Banow")+1 );
	}
	SendClientMessage(playerid, COLOR_NEWS, "Jeśli uważasz ze ban jest niesłuszny wejd na M-RP i złóż prosbę o UN-BAN");
	format(str, sizeof(str), "Dostałeś bana, powód: %s", result);
	SendClientMessage(playerid, COLOR_LIGHTRED, str);
	Log(punishmentLog, WARNING, "Admin %s ukarał %s karą bana, powód: %s", 
		adminlognick,
		GetPlayerLogName(playerid),
		result
	);

	PlayerInfo[playerid][pBlock] += 2;
	KickEx(playerid);
	if(PlayerInfo[playerid][pAdmin] >= 1 && adminid != -1)
	{
		//MruMySQL_Banuj(adminid, result, playerid); #todo
		AddPunishment(adminid, GetNick(adminid), -1, gettime(), PENALTY_BAN, 0, "Zbanowanie admina", 0);
		Log(punishmentLog, WARNING, "Admin %s został zbanowany za zbanowanie admina %s", 
			adminlognick,
			GetPlayerLogName(playerid));
		KickEx(adminid);
	}
	return 1;
}
PBlockPlayerTXD(player[], adminid, reason[])
{
	new str[128];
	new nickOdbieracza[MAX_PLAYER_NAME + 1];
	strcat(nickOdbieracza, player); 
    format(str, sizeof(str), "~r~Block Offline~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", nickOdbieracza, GetNickEx(adminid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
PBanPlayerTXD(player[], adminid, reason[])
{
	new str[128];
	new nickOdbieracza[MAX_PLAYER_NAME + 1];
	strcat(nickOdbieracza, player); 
    format(str, sizeof(str), "~r~Ban Offline~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", nickOdbieracza, GetNickEx(adminid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
PAJPlayerTXD(player[], adminid, timeVal, reason[])
{
	new nickOdbieracza[MAX_PLAYER_NAME + 1];
	strcat(nickOdbieracza, player); 
	new str[128];
    format(str, sizeof(str), "~r~O-AdminJail [%d minut]~n~~w~Dla: ~y~%s~n~~w~Admin: ~y~%s~n~~w~Powod: ~y~%s", timeVal, nickOdbieracza, GetNickEx(adminid), Odpolszcz(reason));
	karaTimer = SetTimer("StopDraw", 15000, false);
	foreach(new i : Player)
	{
		PlayerTextDrawSetString(i, Kary[i] , str);
		PlayerTextDrawShow(i, Kary[i] ); 
		if(togADMTXD[i] == 1)
		{
			PlayerTextDrawHide(i, Kary[i] ); 
		}
	}
	return 1;
}
N_SetPlayerPAdminJail(player[], adminid, timeVal, result[])
{
	new nickOdbieracza[MAX_PLAYER_NAME + 1];
	strcat(nickOdbieracza, player); 
	new string[256];
	format(string, sizeof(string), "AdmCmd: Konto gracza offline %s dostało AJ na %d min od %s, Powod: %s", nickOdbieracza, timeVal, GetNickEx(adminid), (result));
	SendMessageToAdmin(string, COLOR_RED); 
	
	Log(punishmentLog, WARNING, "Admin %s ukarał offline %s karą AJ %d minut, powód: %s", 
		GetPlayerLogName(adminid),
		nickOdbieracza,
		timeVal,
		result);

	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscAJ[adminid] = iloscAJ[adminid]+1;
	
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	new actual_aj_time = MruMySQL_GetAccInt("JailTime", nickOdbieracza);
	MruMySQL_SetAccInt("Jailed", nickOdbieracza, 3);
	MruMySQL_SetAccInt("JailTime", nickOdbieracza, actual_aj_time + (timeVal * 60));
	MruMySQL_SetAccString("AJreason", nickOdbieracza, result);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	return 1;
}


N_SetPlayerAdminJail(playerid, adminid, timeVal, result[])
{
	new string[256];
	format(string, sizeof(string), "* Zostałeś uwieziony w Admin Jailu przez Admina %s, Czas: %d. Powod: %s", GetNickEx(adminid), timeVal, (result));
	SendClientMessage(playerid, COLOR_LIGHTRED, string);
	PlayerInfo[playerid][pJailed] = 3;
	PlayerInfo[playerid][pJailTime] = timeVal*60;
	format(PlayerInfo[playerid][pAJreason], MAX_AJ_REASON, result);
	RemovePlayerFromVehicle(playerid);
	SetPlayerVirtualWorld(playerid, 1000+playerid);
	PlayerInfo[playerid][pMuted] = 1;
	SetPlayerPos(playerid, 1481.1666259766,-1790.2204589844,156.7875213623);
	poscig[playerid] = 0;
	format(string, sizeof(string), "%s zostal uwieziony w AJ przez %s na %d min, powód: %s", GetNick(playerid), GetNickEx(adminid), timeVal, (result)); 
	SendMessageToAdmin(string, COLOR_RED); 
	Log(punishmentLog, WARNING, "Admin %s ukarał %s karą AJ %d minut, powód: %s", 
		GetPlayerLogName(adminid),
		GetPlayerLogName(playerid),
		timeVal,
		result);
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscAJ[adminid]++; 
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	//adminowe logi
	format(string, sizeof(string), "Admini/%s.ini", GetNickEx(adminid));
	dini_IntSet(string, "Ilosc_AJ", dini_Int(string, "Ilosc_AJ")+1 );
	SendClientMessage(playerid, COLOR_NEWS, "Sprawdź czy otrzymana kara jest zgodna z listą kar i zasad, znajdziesz ją na M-RP");
	Wchodzenie(playerid);		
	return 1;
}


N_GiveKickForPlayer(playerid, adminid, result[])//zjebane
{
	new string[256];
	SendClientMessage(playerid, COLOR_NEWS, "Sprawdź czy otrzymana kara jest zgodna z listą kar i zasad, znajdziesz ją na M-RP");
	format(string, sizeof(string), "AdmCmd: Admin %s zkickował %s, Powód: %s", GetNickEx(adminid), GetNick(playerid), (result));
	SendMessageToAdmin(string, COLOR_RED); 
	Log(punishmentLog, WARNING, "Admin %s ukarał %s karą kick, powód: %s", 
		GetPlayerLogName(adminid),
		GetPlayerLogName(playerid),
		result);
	//adminduty
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscKick[adminid]++;
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}

	format(string, sizeof(string), "Admini/%s.ini", GetNickEx(adminid));
	dini_IntSet(string, "Ilosc_Kickow", dini_Int(string, "Ilosc_Kickow")+1 );
	KickEx(playerid);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	return 1;
}

GiveBPForPlayer(playerid, adminid, timeVal, result[])
{
	new string[256];
	PlayerInfo[playerid][pBP] = timeVal;
	SendClientMessage(playerid, COLOR_NEWS, "Sprawdź czy otrzymana kara jest zgodna z listą kar i zasad, znajdziesz ją na M-RP");
	format(string, sizeof(string), "AdmCmd: %s dostal BP od %s na %d godzin, z powodem %s", GetNick(playerid), GetNickEx(adminid), timeVal, result);
	SendMessageToAdmin(string, COLOR_RED); 
	Log(punishmentLog, WARNING, "Admin %s ukarał %s karą blokady pisania na %d godzin, powód: %s", 
		GetPlayerLogName(adminid),
		GetPlayerLogName(playerid),
		timeVal,
		result);
	//opis
	//Opis_Usun(giveplayerid);
	Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, " ");
	PlayerInfo[playerid][pDesc][0] = EOS;
	if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscInne[adminid]++; 
	}
	return 1;
}
N_GiveBlockForPlayer(playerid, adminid, result[])
{
	new string[256];
	new nickDoBlocka[MAX_PLAYER_NAME + 1];
	strcat(nickDoBlocka, GetNick(playerid)); 
	format(string, sizeof(string), "AdmCmd: Konto gracza %s zostalo zablokowane przez %s, Powod: %s", GetNick(playerid), GetNickEx(adminid), (result));
	SendMessageToAdmin(string, COLOR_RED); 
	Log(punishmentLog, WARNING, "Admin %s ukarał %s karą blocka, powód: %s", 
			GetPlayerLogName(adminid),
			GetPlayerLogName(playerid),
			result);
	PlayerInfo[playerid][pBlock] += 1;
	KickEx(playerid);
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	//MruMySQL_Blockuj(nickDoBlocka, adminid, (result));
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscBan[adminid] = iloscBan[adminid]+1;
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	return 1;
}
N_GivePBanForPlayer(player[], adminid, result[])
{
	new nickDoBlocka[MAX_PLAYER_NAME + 1];
	strcat(nickDoBlocka, player);
	new string[256], query[128];
	format(string, sizeof(string), "AdmCmd: Konto gracza OFFLINE %s zostalo zbanowane przez %s, Powod: %s ", nickDoBlocka, GetNickEx(adminid), (result));
	SendMessageToAdmin(string, COLOR_RED); 
	Log(punishmentLog, WARNING, "Admin %s ukarał offline %s karą bana, powód: %s", 
		GetPlayerLogName(adminid),
		player,
		result);
		
	format(query, sizeof(query), "UPDATE `mru_konta` SET Block = Block + 2 WHERE `Nick`='%s'", nickDoBlocka);
	mysql_query(Database, query);
	
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscBan[adminid] = iloscBan[adminid]+1;
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	return 1;
}	
N_GivePBlockForPlayer(player[], adminid, result[])
{
	new string[256], query[128];
	new nickDoBlocka[MAX_PLAYER_NAME + 1];
	strcat(nickDoBlocka, player); 
	format(string, sizeof(string), "AdmCmd: Konto gracza OFFLINE %s zostalo zablokowane przez %s, Powod: %s", player, GetNickEx(adminid), (result));
	SendMessageToAdmin(string, COLOR_RED); 
	Log(punishmentLog, WARNING, "Admin %s ukarał offline %s karą blocka, powód: %s", 
		GetPlayerLogName(adminid),
		player,
		result);
		
		
	format(query, sizeof(query), "UPDATE `mru_konta` SET Block = Block + 1 WHERE `Nick`='%s'", nickDoBlocka);
	mysql_query(Database, query);
	
	
	SetTimerEx("AntySpamTimer",5000,0,"d",adminid);
	AntySpam[adminid] = 1;
	if(GetPlayerAdminDutyStatus(adminid) == 1)
	{
		iloscBan[adminid] = iloscBan[adminid]+1;
	}
	else if(GetPlayerAdminDutyStatus(adminid) == 0)
	{
		iloscPozaDuty[adminid]++; 
	}
	return 1;
}

stock GetPunishmentType(type) {
	new wartosc[56];
	switch(type)
	{
		case PENALTY_KICK:    wartosc = "Kick";
		case PENALTY_WARN:    wartosc = "Warn";
		case PENALTY_BAN:     wartosc = "Ban";
		case PENALTY_AJ:	  wartosc = "Admin Jail";
		case PENALTY_BLOCK:   wartosc = "Blokada postaci";
		case PENALTY_UNBLOCK: wartosc = "UnBlock";
		case PENALTY_UNBAN:   wartosc = "UnBan";
		case PENALTY_UNWARN:  wartosc = "UnWarn";
	}
	return wartosc;
}

	
stock ShowPlayerWarns(playerid, giveplayerid, forplayer = 0)
{
	inline OnWarnsLoaded()
    {
		new dialogStr[256];
		format(dialogStr, sizeof(dialogStr), "ID\tAdmin\tData\tPowód");
		if(cache_num_rows()>0)
		{
			new penalty_id, admin_uid, admin_gid, time, reason[128], year, month, day, hour, minute, second, admin_nick[24];
			for(new i = 0; i < cache_num_rows(); i++)
			{
				cache_get_value_int(i, 0, penalty_id);
				cache_get_value_int(i, 1, admin_uid);
				cache_get_value_int(i, 2, admin_gid);
				cache_get_value_int(i, 3, time);
				cache_get_value(i, 4, reason, 128);
				cache_get_value(i, 5, admin_nick, sizeof(admin_nick));

				TimestampToDate(time, year, month, day, hour, minute, second, 1);
				if(admin_uid == -1) format(admin_nick, sizeof(admin_nick), "System");
			
				format(dialogStr, sizeof(dialogStr), "%s\n%d\t%s (%d|%d)\t%02d.%02d.%d %02d:%02d\t%s", dialogStr, penalty_id, admin_nick, admin_uid, admin_gid, day, month, year, hour, minute, reason);
			}
			SetPVarInt(playerid, "UnwarnGivePlayer", giveplayerid);
			if(forplayer == 0) ShowPlayerDialogEx(playerid, D_SHOWWARNS, DIALOG_STYLE_TABLIST_HEADERS, sprintf("Warny %s (UID: %d)", MruMySQL_GetNameFromUID(giveplayerid), giveplayerid), dialogStr, "Wybierz", "Anuluj");
			else  ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_TABLIST_HEADERS, sprintf("Warny %s (UID: %d)", MruMySQL_GetNameFromUID(giveplayerid), giveplayerid), dialogStr, "OK", "");
		} else { ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, sprintf("Warny %s (UID: %d)", MruMySQL_GetNameFromUID(giveplayerid),  giveplayerid), "Ten gracz nie posiada żadnych warnów, które mógłbyś ściągnąć\nJeśli nie masz uprawnień zobaczysz tu tylko warny nadane przez Ciebie.", "OK", ""); }
	}

	new string[64] = "";
	if(PlayerInfo[playerid][pAdmin] < 1000 && forplayer == 0) format(string, sizeof(string), " AND `admin_uid` = '%d'", PlayerInfo[playerid][pUID]);

	MySQL_TQueryInline(Database, using inline OnWarnsLoaded, 
    "SELECT k.penalty_id, k.admin_uid, k.admin_gid, k.time, k.reason, a.Nick \
     FROM `mru_kary` k \
     LEFT JOIN `mru_konta` a ON k.admin_uid = a.UID \
     WHERE k.player_uid='%d' AND k.active = 1 AND k.type = 1%s", 
    giveplayerid, string);
	return 1;
}
