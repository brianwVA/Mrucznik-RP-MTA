//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                 system-kary                                                 //
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
// Autor: never
// Data utworzenia: 24.06.2021
//Opis:
/*
	System kary
*/
stock OnDialogResponseKary(playerid, dialogid, response, listitem, inputtext[])
{
	//#pragma unused playerid, dialogid, response, listitem, inputtext
	if(dialogid == D_SHOWWARNS)
	{
		if(!response) return 1;
		if(PlayerInfo[playerid][pAdmin] == 0) return 1;
		new penalty_id = strval(inputtext);
		SetPVarInt(playerid, "UnwarnPenaltyId", penalty_id);
		new giveplayerid = GetPVarInt(playerid, "UnwarnGivePlayer");

		return ShowPlayerDialogEx(playerid, D_SHOWWARNS_CONFIRM, DIALOG_STYLE_INPUT, sprintf("Warn #%d - %s", penalty_id, MruMySQL_GetNameFromUID(giveplayerid)), "Podaj powód", "Unwarn", "Anuluj");
	}
	else if(dialogid == D_SHOWWARNS_CONFIRM)
	{
		if(!response) return 1;
		if(PlayerInfo[playerid][pAdmin] == 0) return 1;
		new penalty_id = GetPVarInt(playerid, "UnwarnPenaltyId");
		new giveplayerid = GetPVarInt(playerid, "UnwarnGivePlayer");
		new giveplayer[24] = "";
		new connected = -1;
		foreach(new i : Player)
		{
			if(IsPlayerConnected(i) && gPlayerLogged[i] && PlayerInfo[i][pUID] == giveplayerid)
			{
				connected = i;
				break;
			}
		}
		if(connected >= 0) format(giveplayer, sizeof giveplayer, "%s", GetNick(connected));
		else format(giveplayer, sizeof giveplayer, "%s", MruMySQL_GetNameFromUID(giveplayerid));
		new powod[128];
		format(powod, sizeof(powod), "%s / #%d", inputtext, penalty_id);
		if(AddPunishment(connected, giveplayer, playerid, gettime(), PENALTY_UNWARN, 0, powod, 0) == 1) {
			if(connected >= 0)
			{
				SendClientMessage(playerid, COLOR_LIGHTRED, "Dałeś UN-warna %s, powód: %s", giveplayer, (powod));
				SendClientMessage(connected, COLOR_LIGHTRED, "Dostałeś UN-warna od %s, powód: %s", GetNickEx(playerid), (powod));
			}
			
			new str[128];
			format(str, sizeof(str), "AdmCmd: Konto gracza %s zostało unwarnowane przez %s, powod: %s", giveplayer, GetNickEx(playerid), powod);
			ABroadCast(COLOR_YELLOW,str,1);
			Log(punishmentLog, WARNING, "Admin %s unwarnował %s, powód: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), powod);
			if(GetPlayerAdminDutyStatus(playerid) == 1)
			{
				iloscWarn[playerid] = iloscWarn[playerid]+1;
			}
			mysql_tquery_format("UPDATE `mru_kary` SET `active` = 0 WHERE `penalty_id` = '%d'", penalty_id);
			return 1;
		}
		return 1;
	}
	return 0;
}

//end