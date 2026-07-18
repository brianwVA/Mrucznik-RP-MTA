//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zmienplec ]-----------------------------------------------//
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

YCMD:zmienplec(playerid, params[], help)
{
	new playa;
	if(sscanf(params, "k<fix>", playa))
	{
		sendTipMessage(playerid, "Użyj /zmienplec [ID gracza]");
		return 1;
	}
	if (IsPlayerInGroup(playerid, 4) || PlayerInfo[playerid][pLider] == 4)
	{
		new string[128], sendername[MAX_PLAYER_NAME + 1], giveplayer[MAX_PLAYER_NAME + 1];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		if(GetDistanceBetweenPlayers(playerid,playa) < 5)
		{
			if(IsPlayerConnected(playa))
			{
				if(playa != INVALID_PLAYER_ID)
				{
					//if(GetPlayerVirtualWorld(playerid) > 90 && IsPlayerInRangeOfPoint(playerid, 100.0, 1103.4714,-1298.0918,21.552))
					if(PlayerInfo[playerid][pLocal] == PLOCAL_FRAC_LSMC || IsAtHealingPlace(playerid))
					{
                        if(kaska[playerid] < PRICE_ZMIANA_PLCI) return sendErrorMessage(playerid, "Nie masz "#PRICE_ZMIANA_PLCI"$ na operację.");
						format(string, sizeof(string),"Przeprowadziłeś operacje zmiany płci na %s. Koszt: "#PRICE_ZMIANA_PLCI"$", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        ZabierzKaseDone(playerid, PRICE_ZMIANA_PLCI);
                        Sejf_Add(FRAC_ERS, PRICE_ZMIANA_PLCI);
						if(PlayerInfo[playa][pSex] == 1)
						{
							format(string, sizeof(string), "Lekarz %s przeprowadził na tobie operacje zmiany płci. Jesteś teraz kobietą!", giveplayer);
							SendClientMessage(playa, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Operacja zmiany płci powiodła się! %s jest teraz kobietą ((%s))", giveplayer, sendername);
							ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							PlayerInfo[playa][pSex] = 2;
						}
						else
						{
							format(string, sizeof(string), "Lekarz %s przeprowadził na tobie operacje zmiany płci. Jesteś teraz mężczyzną!", giveplayer);
							SendClientMessage(playa, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Operacja zmiany płci powiodła się! %s jest teraz mężczyzną ((%s))", giveplayer, sendername);
							ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							PlayerInfo[playa][pSex] = 1;
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie jesteś w szpitalu!");
					}
				}
			}
		}
		else
		{
			format(string, sizeof(string),"Jesteś zbyt daleko od gracza %s.", playa);
			sendErrorMessage(playerid, string);
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz 3 rangi lub nie jesteś medykiem!");
	}
	return 1;
}
