//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ zwiaz ]-------------------------------------------------//
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

YCMD:zwiaz(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		if(IsAPrzestepca(playerid))
		{
		    if(GroupPlayerDutyRank(playerid) < 2)
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Potrzebujesz 2 rangi aby związywać ludzi !");
		        return 1;
		    }
		    new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "Użyj /zwiaz [playerid/CzęśćNicku]");
				return 1;
			}

		    if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
		        	if(Kajdanki_JestemSkuty[giveplayerid] != 0)
		        	{
		        	    sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz związać skutego gracza !");
		        	    return 1;
		        	}
				    if(PlayerTied[giveplayerid] > 0)
				    {
				        sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz jest już związany !");
				        return 1;
				    }
					if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    new car = GetPlayerVehicleID(playerid);
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz związać samego siebie!"); return 1; }
					    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2 && IsPlayerInVehicle(giveplayerid, car))
					    {
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
					        format(string, sizeof(string), "* Zostałeś związany przez %s.", sendername);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Związałeś %s tak aby nie mógł się rozwiązać.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s wyciąga linę i związuje %s aby nigdzie nie uciekł.", sendername ,giveplayer);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							GameTextForPlayer(giveplayerid, "~r~Zwiazany", 2500, 3);
							TogglePlayerControllable(giveplayerid, 0);
							PlayerTied[giveplayerid] = 1;
							PlayerCuffedTime[giveplayerid] = 5*60;
							pobity[giveplayerid] = 0;
							CreateNewCombatLog(giveplayerid);
					    }
					    else
					    {
					        sendTipMessageEx(playerid, COLOR_GREY, "Gracz nie jest w twoim wozie / nie jesteś kierowcą !");
					        return 1;
					    }
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
					    return 1;
					}
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza !");
			    return 1;
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
