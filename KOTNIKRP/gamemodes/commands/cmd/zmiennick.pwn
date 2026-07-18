//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zmiennick ]-----------------------------------------------//
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

YCMD:zmiennick(playerid, params[], help)
{
	new sendername[MAX_PLAYER_NAME + 1];

	if (PlayerInfo[playerid][pLevel] >= 2)
	{
        //Nowy system
        if(PlayerInfo[playerid][pZmienilNick] < 1) return sendTipMessage(playerid, "Nie posidasz pakietu zmiany nicku.");

        if(PlayerInfo[playerid][pDom] == 0)
	    {
	        if(PlayerInfo[playerid][pPbiskey] == 255)
	        {
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(isnull(params))
				{
					sendTipMessage(playerid, "Użyj /zmiennick [nowy nick]");
                    sendTipMessage(playerid, "UWAGA!! Przy zmianie nicku kasuje ci się frakcja/rodzina.", COLOR_PANICRED);
					return 1;
				}
				else
				{
					new nick[24];
					if(GetPVarString(playerid, "maska_nick", nick, 24))
					{
						SendClientMessage(playerid, COLOR_GREY, " Musisz ściągnąć maskę z twarzy! (/maska).");
						return 1;
					}

                    if(ChangePlayerName(playerid, params))
                    {
                    	SendClientMessageToAll(COLOR_LIGHTRED, sprintf("%s[%d] zmienił sobie nick - Nowy nick: %s", sendername,PlayerInfo[playerid][pUID],params));
                    	Log(nickLog, WARNING, "{Player: %s[%d]} zmienił nick na: %s", sendername, PlayerInfo[playerid][pUID], params);
						PlayerPersonalization[playerid][PERS_GUNSCROLL] = 1;
						ShowPlayerDialogEx(playerid, 70, DIALOG_STYLE_MSGBOX, "Zmiana nicku", "Właśnie zmieniłeś nick. Następujące elementy zostały wyzerowane:\n\nPraca\nFrakcja\nWanted Level\nRodzina\nLider\nRanga\nSkin\nZaufany Gracz\n\n\nPamiętaj, że każda zmiana nicku jest na wagę złota więc nie trwoń ich pochopnie!\nJeżeli doszło do błędnej zmiany zgłoś ten fakt prędko na forum w panelu strat!\nPamiętaj: nowa postać = nowe życie.", "Dalej", "");
                    }
                }
			}
			else
			{
			    sendTipMessage(playerid, "Masz biznes, nie możesz zmienić nicku");
			}
		}
		else
		{
		    sendTipMessage(playerid, "Masz lub wynajmujesz dom, nie możesz zmienić nicku");
		    sendTipMessage(playerid, "Użyj /sprzedajdom lub /unrent");
		}
	}
	else
 	{
 		sendTipMessage(playerid, "Musisz mieć 3 level aby zmienić sobie nick.");
  	}
	return 1;
}
