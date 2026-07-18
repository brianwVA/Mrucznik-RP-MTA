//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wywaz ]-------------------------------------------------//
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

YCMD:wywaz(playerid, params[], help)
{
	new string[128];
    if(IsPlayerConnected(playerid))
    {
        if(!IsAPolicja(playerid))
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś policjantem!");
		    return 1;
		}
        if(OnDuty[playerid] != 1 && IsAPolicja(playerid))
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś na służbie!");
		    return 1;
		}
    	new giveplayerid, dom;
		if( sscanf(params, "k<fix>d", giveplayerid, dom))
		{
			sendTipMessage(playerid, "Użyj /wywaz [playerid/CzęśćNicku] [ID domu]");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
  			if(giveplayerid != INVALID_PLAYER_ID)
		    {
		        if (ProxDetectorS(8.0, playerid, giveplayerid))
				{
				    if (!IsPlayerInRangeOfPoint(playerid, 2.0, Dom[dom][hWej_X], Dom[dom][hWej_Y], Dom[dom][hWej_Z]))
				    {
				       	sendTipMessageEx(playerid, COLOR_GREY, "Ten dom jest za daleko !");
				        return 1;
				    }
				    if (!IsAPolicja(giveplayerid) && OnDuty[giveplayerid] < 1)
				    {
				       	sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest policjantem na służbie!");
				        return 1;
				    }
				    if (giveplayerid == playerid)
				    {
				       	sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz sam wyważyć drzwi!");
				        return 1;
				    }
				    if(Dom[dom][hKupiony] == 0)
				    {
				       	sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz wyważyć tych drzwi!");
				        return 1;
				    }
                    if(Dom[dom][hZamek] == 0)
					{
                        Dom[dom][hZamek] = 1;
                        format(string, sizeof(string),"* Policjanci %s oraz %s biorą taran policyjny i uderzają nim w drzwi wyważając je.",GetNick(playerid), GetNick(giveplayerid));
						ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						format(string, sizeof(string), "* Drzwi zostały wyważone (( %s ))", GetNick(playerid));
						ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						format(string, sizeof(string), "[ALARM DOMOWY] Twoje drzwi zostały wyważone! Sprawdź to! (Podejrzany: %s)", GetNick(playerid));
						sendTipMessageEx(GetPlayerIDFromName(Dom[dom][hWlasciciel]), COLOR_RED, string); 
                        return 1;
					}
					else
					{
                        sendTipMessageEx(playerid, COLOR_GREY, "Te drzwi są otwarte!");
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
	return 1;
}
