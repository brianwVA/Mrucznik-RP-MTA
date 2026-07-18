//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ dajapteczke ]----------------------------------------------//
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

YCMD:dajapteczke(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		new playa, ilosc;
		if( sscanf(params, "k<fix>D(0)", playa, ilosc))
		{
			sendTipMessage(playerid, "Użyj /dajapteczke [playerid/CzęśćNicku] [ilosc]");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 100 || IsAScripter(playerid))
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
					new string[144];
					if(ilosc > MAX_HEALTH_PACKS)
					{
						format(string, sizeof(string), "Tip: Maksymalna ilość apteczek na gracza to [%d]", MAX_HEALTH_PACKS);
						return sendTipMessage(playerid, string);
					}
					
					new giveplayer[MAX_PLAYER_NAME + 1], sendername[MAX_PLAYER_NAME + 1];
					GetPlayerName(playa, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					if(GetPlayerAdminDutyStatus(playerid) == 1)
					{
						iloscInne[playerid] = iloscInne[playerid]+1;
					}

					PlayerInfo[playa][pHealthPacks] = ilosc;
					Item_Add("Apteczka", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playa][pUID], ITEM_TYPE_APTECZKA, 0, 0, true, playa, ilosc);
					Log(adminLog, WARNING, "Admin %s ustawił %s apteczki na %d", GetPlayerLogName(playerid), GetPlayerLogName(playa), ilosc);
					format(string, sizeof(string), "%s ustawił %d apteczki dla %s", sendername, ilosc, giveplayer);
					SendMessageToAdmin(string, COLOR_P@);
					if(playerid != playa) _MruAdmin(playa, sprintf("Admin %s [%d] ustawił Ci poziom apteczek na [%d]", GetNickEx(playerid), playerid, ilosc));
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
