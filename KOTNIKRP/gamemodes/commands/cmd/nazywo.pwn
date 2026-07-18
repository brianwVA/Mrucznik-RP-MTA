//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ nazywo ]------------------------------------------------//
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

YCMD:nazywo(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		if(IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
		{
		    if(TalkingLive[playerid] != INVALID_PLAYER_ID)
		    {
		        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wywiad zakonczony.");
		        SendClientMessage(TalkingLive[playerid], COLOR_LIGHTBLUE, "* Wywiad zakończony.");
	            TalkingLive[TalkingLive[playerid]] = INVALID_PLAYER_ID;
                TalkingLive[playerid] = INVALID_PLAYER_ID;
		        return 1;
		    }
			
			new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "Użyj /wywiad [playerid/CzęśćNicku]");
				return 1;
			}
			if(GetPlayerAdminDutyStatus(playerid) == 1)
			{
				sendErrorMessage(playerid, "Nie możesz dawać wywiadu podczas @Duty!");
				return 1;
			}
			if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
			{
				sendErrorMessage(playerid, "Ta osoba jest podczas służby administratora!");
				return 1;
			}


			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if (ProxDetectorS(5.0, playerid, giveplayerid) || Mobile[playerid] == giveplayerid)
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "Nie możesz robić wywiadu z samym sobą!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* Oferujesz %s wywiad na żywo.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s chce z tobą przeprowadzić wywiad, wpisz (/akceptuj wywiad) aby akceptować.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						LiveOffer[giveplayerid] = playerid;
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Jesteś za daleko od tego gracza.");
					    sendTipMessageEx(playerid, COLOR_GREY, "Możesz przeprowadzić wywiad telefoniczny dzwoniąc do gracza i oferując mu wywiad komendą /wywiad.");
					    return 1;
					}
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza!");
			    return 1;
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś Reporterem !");
		}
	}
	return 1;
}
