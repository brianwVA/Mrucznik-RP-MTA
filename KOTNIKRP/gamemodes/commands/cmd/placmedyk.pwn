//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ placmedyk ]-----------------------------------------------//
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

YCMD:placmedyk(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

	new giveplayerid, money;
	if( sscanf(params, "k<fix>d", giveplayerid, money))
	{
		sendTipMessage(playerid, "Użyj /placmedyk [playerid/CzęśćNicku] [cena]");
		return 1;
	}

	if(money < 1 || money > 1000) { sendTipMessageEx(playerid, COLOR_GREY, "Cena od 1 do 1000!"); return 1; }
	if(IsPlayerConnected(giveplayerid))
	{
	    if(giveplayerid != INVALID_PLAYER_ID)
	    {
	        if(ProxDetectorS(8.0, playerid, giveplayerid) && IsPlayerInGroup(giveplayerid, 4))
			{
			    if(giveplayerid == playerid)
			    {
			        sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz płacić samemu sobie!");
			        return 1;
			    }
			    if(kaska[playerid] >= money)
		        {
                	if(GroupInfo[4][g_Money] + money > 1_000_000_000)
                    {
                     	sendTipMessageEx(playerid, -1, "Sejf się przepełni!");
                      	return 1;
                	}
		          	GetPlayerName(playerid, sendername, sizeof(sendername));
		          	GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		           	ZabierzKaseDone(playerid, money);
                   	Sejf_Add(4, money);

			      	new komunikat[256];
			      	format(string, sizeof(string), "* %s wyciąga z portfela pieniądze i daje je medykowi %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			     	format(komunikat, sizeof(komunikat), "Zapłaciłeś %d$ medykowi.", money);
			        SendClientMessage(playerid, COLOR_P@, komunikat);
			        format(komunikat, sizeof(komunikat), "Na konto frakcji wpłynęło %d$ od gracza.", money);
			        SendClientMessage(giveplayerid, COLOR_P@, komunikat);
			        Log(payLog, WARNING, "%s dał medykowi %s kwotę %d$, która trafiła do sejfu LSMC (stan: %d$)", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), money, GroupInfo[4][g_Money]);
			        return 1;
				}
				else
				{
					sendTipMessageEx(playerid, COLOR_P@, "Nie masz aż tyle przy sobie !");
					return 1;
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie ma przy tobie medyka!");
			}
		}
	}
	else
	{
	    sendErrorMessage(playerid, "Nie ma takiego gracza!");
	}
	return 1;
}
