//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ worek ]-------------------------------------------------//
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
	Creative 27 luty 2020
*/


// Notatki skryptera:
/*
	
*/

YCMD:worek(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		if(IsAPrzestepca(playerid))
		{
		    new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "Użyj /worek [playerid/CzęśćNicku]");
				return 1;
			}

			if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz założyć/ściągnąć sobie samemu worka!"); return 1; }

		    if(IsPlayerConnected(giveplayerid))
			{
				if(!ProxDetectorS(8.0, playerid, giveplayerid))
				{
					sendTipMessageEx(playerid, COLOR_GREY, "Użyj /worek [playerid/CzęśćNicku] będąc w pobliżu ofiary !");
					return 1;
				}

				if(Worek_MamWorek[giveplayerid])
				{
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* %s ściągnął Ci worek z głowy, odzyskałeś orientację w terenie.", sendername);
					SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "* Ściągnąłeś %s worek z głowy.", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "* %s ściąga %s worek z głowy.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					
					Worek_MamWorek[giveplayerid] = 0;
					Worek_KomuZalozylem[Worek_KtoZalozyl[giveplayerid]] = INVALID_PLAYER_ID;
					Worek_Uzyty[Worek_KtoZalozyl[giveplayerid]] = 0;
					Worek_KtoZalozyl[giveplayerid] = INVALID_PLAYER_ID;
					UnHave_Worek(giveplayerid);
				}
				else
				{	
					if(Worek_Uzyty[playerid])
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Masz tylko jeden worek, zdejmij go poprzedniej osobie !");
						return 1;
					}
					else
					{
						if(PlayerInfo[giveplayerid][pInjury] == 0 && PlayerTied[giveplayerid] == 0 && pobity[giveplayerid] == 0)
						{
							sendErrorMessage(playerid, "Możesz założyć worek na głowę tylko graczowi, który jest pobity/związany lub ranny.");
							return 1;
						}

						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* %s założył Ci worek na głowę, straciłeś orientację w terenie.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Założyłeś %s worek na głowę.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s zakłada %s worek na głowę.", sendername ,giveplayer);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

						Worek_MamWorek[giveplayerid] = 1;
						Worek_KomuZalozylem[playerid] = giveplayerid;
						Worek_Uzyty[playerid] = 1;
						Worek_KtoZalozyl[giveplayerid] = playerid;

						Have_Worek(giveplayerid);

						//SetTimerEx("timer_MaWorek",2000,0,"d",giveplayerid);
						//todo timer:
						//osoba musi byc ranna/pobita, jezeli zakladajacy worek oddali sie na ~50 metrow lub wyjdzie z gry lub pojdzie afk dluzej niz 2 minuty worek zostanie zdjety
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
