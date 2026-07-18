//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ federalne ]-----------------------------------------------//
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

YCMD:federalne(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	 	if(!IsAPolicja(playerid))
	 	{
	 		sendErrorMessage(playerid, "Nie jesteś z służb porządkowych!");
		    return 1;
		}
	    if(OnDuty[playerid] == 0 )
		{
		    sendErrorMessage(playerid, "Nie jesteś na służbie!");
		    return 1;
		}
		new giveplayerid, result[128];
		if( sscanf(params, "k<fix>s[128]", giveplayerid, result))
		{
			sendTipMessage(playerid, "Użyj (/fed)eralne [playerid/CzęśćNicku] [popelnione przestepstwo]");
			return 1;
		}

		if (IsAPolicja(playerid) || IsAFBI(playerid))
		{
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if (!(IsAPolicja(giveplayerid) && OnDuty[giveplayerid] > 0))
					{
						if(spamwl[giveplayerid] == 0)
						{
						    if(PoziomPoszukiwania[giveplayerid] <= 3)
						    {
								GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								PoziomPoszukiwania[giveplayerid] = 3;
								spamwl[giveplayerid] = 1;
								SetTimerEx("spamujewl",60000,0,"d",giveplayerid);
								PlayCrimeReportForPlayer(playerid,giveplayerid,5);
								SetPlayerCriminal(giveplayerid,playerid, result);
								SendClientMessage(giveplayerid, COLOR_LFBI, "   Popełniłeś przestępstwo federalne, twoją sprawę przejęło FBI !");
								SendClientMessage(playerid, COLOR_LFBI, "   Oskarżyłeś gracza o przestępstwo federalne. Ma on teraz 3 Poziom Poszukiwania !");
								
								if(IsReasonAPursuitReason(result))
								{
									PursuitMode(playerid, giveplayerid);
								}
								return 1;
							}
							else
							{
							    sendErrorMessage(playerid, "Ten gracz jest już ścigany za przestępstwo federalne");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Dałeś już poziom poszukiwania, poczekaj 1 minute (zapobiega spamowaniu WL)");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie możesz dawać Wanted Level policjantom na służbie!");
					}
				}
			}
			else
 			{
				format(string, sizeof(string), "Gracz o ID %d nie istnieje.", giveplayerid);
				sendErrorMessage(playerid, string);
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jesteś z służb porządkowych!");
		}
	}
	return 1;
}
