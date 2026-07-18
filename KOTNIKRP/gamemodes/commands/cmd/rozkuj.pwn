//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ rozkuj ]------------------------------------------------//
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

YCMD:rozkuj(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
    {
		new string[128];

		if(GroupPlayerDutyPerm(playerid, PERM_POLICE) || GroupPlayerDutyPerm(playerid, PERM_BOR))
		{
		    new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "Użyj /rozkuj [playerid/CzęśćNicku]");
				return 1;
			}
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
				    if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz odkuć samego siebie!"); return 1; }
						if(PlayerCuffed[giveplayerid] == 2 || Kajdanki_JestemSkuty[giveplayerid] >= 1)
						{
							UnCuffedAction(giveplayerid);
						    format(string, sizeof(string), "* Zostałeś rozkuty przez %s.", GetNick(playerid));
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Rozkułeś %s.", GetNick(giveplayerid));
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							GameTextForPlayer(giveplayerid, "~g~Rozkuty", 2500, 3);
						}
						else
						{
						    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest skuty !");
						}
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
					}
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza !");
			}
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Twoja grupa nie ma takich uprawnień lub nie jesteś na służbie!");
		}
	}//not connected
	return 1;
}
