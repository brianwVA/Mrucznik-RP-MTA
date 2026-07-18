//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ setplocal ]-----------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:setplocal(playerid, params[], help)
{
	new giveplayerid, wartosc, string[128];
	if(IsPlayerConnected(playerid))
	{
		if(sscanf(params, "k<fix>d", giveplayerid, wartosc))
		{
			sendTipMessage(playerid, "Użyj /setplocal [id] [wartosc]");
			return 1;
		}
		if(!IsPlayerConnected(giveplayerid))
		{
			sendTipMessage(playerid, "Nie ma takiego gracza"); 
			return 1;
		}
		if(!IsAScripter(playerid) || PlayerInfo[playerid][pAdmin] <= 200)
		{
			sendTipMessage(playerid, "Brak uprawnień"); 
			return 1;
		}
		format(string, sizeof(string), "PLocal gracza %s został zmieniony przez admina %s na %d", GetNick(giveplayerid), GetNickEx(playerid), wartosc);
		SendPunishMessage(string, giveplayerid);
		SetPLocal(giveplayerid, wartosc);
	}
	return 1;
}
