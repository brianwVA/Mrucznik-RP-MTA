//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ unwarn ]------------------------------------------------//
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

YCMD:unwarn(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
    	new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "Użyj /unwarn [playerid/CzęśćNicku]");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 1 || Uprawnienia(playerid, ACCESS_KARY_UNBAN))
		{
		    if(IsPlayerConnected(giveplayerid))
		    {
		        if(giveplayerid != INVALID_PLAYER_ID)
		        {
                    if(PlayerInfo[giveplayerid][pWarns] <= 0) return sendTipMessageEx(playerid, COLOR_GRAD1, "Ten gracz nie ma warnów!");
					ShowPlayerWarns(playerid, PlayerInfo[giveplayerid][pUID]);
					return 1;
					
					/*new str[128];
				    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					//PlayerInfo[giveplayerid][pWarns] -= 1;
					
					if(AddPunishment(giveplayerid, GetNick(giveplayerid), playerid, gettime(), PENALTY_UNWARN, 0, result, 0) == 1) {
						format(str, sizeof(str), "Dałeś UN-warna %s, powód: %s", giveplayer, (result));
						SendClientMessage(playerid, COLOR_LIGHTRED, str);
						format(str, sizeof(str), "Dostałeś UN-warna od %s, powód: %s", sendername, (result));
						SendClientMessage(giveplayerid, COLOR_LIGHTRED, str);
						format(string, sizeof(string), "AdmCmd: %s został UN-warnowany przez Admina %s, powód: %s", giveplayer, sendername, (result));
						ABroadCast(COLOR_YELLOW,string,1);
						Log(punishmentLog, WARNING, "Admin %s unwarnował %s, powód: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), result);
						if(GetPlayerAdminDutyStatus(playerid) == 1)
						{
							iloscWarn[playerid] = iloscWarn[playerid]+1;
						}
						return 1;
					}*/
				}
			} else {
			sendErrorMessage(playerid, "Takiego gracza nie ma na serwerze!");
			}
		}
	}
	return 1;
}
