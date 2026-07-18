//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ alkomat ]------------------------------------------------//
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

YCMD:alkomat(playerid, params[], help)
{
	new giveplayerid;
	if(sscanf(params, "k<fix>", giveplayerid))
	{
		sendTipMessage(playerid, "Użyj /alkomat [ID gracza]");
		return 1;
	}
	if (IsAPolicja(playerid) || IsAHA(playerid))
	{
		if(!GroupPlayerDutyPerm(playerid, PERM_POLICE))
		{
			sendErrorMessage(playerid, "Nie jesteś na służbie");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(GetDistanceBetweenPlayers(giveplayerid,playerid) < 10)
			{
				new string[128], sendername[MAX_PLAYER_NAME + 1], giveplayer[MAX_PLAYER_NAME + 1];
				GetPlayerName(giveplayerid,giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid,sendername, sizeof(sendername));
				if(PlayerStoned[giveplayerid] >= 1 && PlayerStoned[giveplayerid] <= 2)
				{
					format(string, sizeof(string), "Gracz %s jest pod wpływem narkotyków (mało).", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
				}
				else if(PlayerStoned[giveplayerid] >= 3)
				{
					format(string, sizeof(string), "Gracz %s jest pod wpływem narkotyków (dużo).", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
				}
				else
				{
					format(string, sizeof(string), "Gracz %s jest czysty(narkotyki).", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
				}
				if(PlayerDrunk[giveplayerid] >= 1 && PlayerDrunk[giveplayerid] <= 2 || GetPlayerDrunkLevel(playerid) >= 2000 && GetPlayerDrunkLevel(playerid) < 10000)
				{
					format(string, sizeof(string), "Gracz %s jest pod wpływem alkoholu(mało).", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
				}
				else if(PlayerDrunk[giveplayerid] >= 3 || GetPlayerDrunkLevel(playerid) > 10000)
				{
					format(string, sizeof(string), "Gracz %s jest pod wpływem alkoholu(dużo).", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
				}
				else
				{
					format(string, sizeof(string), "Gracz %s jest trzeźwy(alkohol).", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
				}
				format(string, sizeof(string), "* %s bada alkomatem %s", sendername, giveplayer);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else
			{
				sendErrorMessage(playerid, "Gracz nie znajduje sie obok ciebie.");
			}
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jesteś policjantem, ani agentem FBI");
	}
	return 1;
}
