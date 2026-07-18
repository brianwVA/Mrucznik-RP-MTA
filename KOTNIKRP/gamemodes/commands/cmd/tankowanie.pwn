//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ tankowanie ]----------------------------------------------//
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

YCMD:tankowanie(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	    if(PlayerInfo[playerid][pJob] == 7 || IsANoA(playerid) || CheckPlayerPerm(playerid, PERM_MECHANIC))
	    {
			new playa, money;
			if( sscanf(params, "k<fix>d", playa, money))
			{
				sendTipMessage(playerid, "Użyj /tankowanie [playerid/CzęśćNicku] [cena]");
				return 1;
			}
			if(money < PRICE_MECH_TANK_MIN || money > PRICE_MECH_TANK_MAX) { sendTipMessageEx(playerid, COLOR_GREY, "Cena od "#PRICE_MECH_TANK_MIN"$ do "#PRICE_MECH_TANK_MAX"$!"); return 1; }
			if(IsPlayerConnected(playa))
			{
			    if(playa != INVALID_PLAYER_ID)
			    {
			        if(ProxDetectorS(8.0, playerid, playa) && IsPlayerInAnyVehicle(playa) && Spectate[playa] == INVALID_PLAYER_ID)
					{
					    if(SpamujeMechanik[playerid] == 0)
					    {
					        if(!IsPlayerInAnyVehicle(playerid))
					        {
							    //if(playa == playerid) { SendClientMessage(playerid, COLOR_GREY, "   Nie możesz zatankować swojego auta!"); return 1; }
							    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
							    format(string, sizeof(string), "* Oferujesz %s zatankowanie jego auta za $%d .",giveplayer,money);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* Mechanik %s proponuje ci dotankowanie twojego auta za $%d, (wpisz /akceptuj tankowanie) aby akceptować.",sendername,money);
								SendClientMessage(playa, COLOR_LIGHTBLUE, string);
								RefillOffer[playa] = playerid;
								RefillPrice[playa] = money;
								SpamujeMechanik[playerid] = 1;
								SetTimerEx("AntySpamMechanik",30000,0,"d",playerid);
							}
							else
							{
							    sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz tankować auta będąc w wozie.");
							}
                        }
						else
						{
						    sendTipMessageEx(playerid, COLOR_GREY, "Poczekaj 30 sekund.");
						}
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie / nie jest w samochodzie.");
					}
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza.");
			}
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś mechanikiem!");
	        return 1;
	    }
	}
	return 1;
}
