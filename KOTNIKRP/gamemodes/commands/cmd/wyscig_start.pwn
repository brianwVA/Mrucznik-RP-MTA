//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ wyscig_start ]---------------------------------------------//
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

YCMD:wyscig_start(playerid, params[], help)
{
    if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
    {
		if(GroupPlayerDutyRank(playerid) >= 3)
		{
            if(owyscig[playerid] != 666)
            {
                if(Scigamy == 666)
                {
					if(tworzenietrasy[playerid] == 666)
					{
						sendErrorMessage(playerid, "Nie wybrałeś trasy wyścigu!");
						return 1;
					}

	            	ScigaSie[playerid] = owyscig[playerid];
	            	owyscig[playerid] = 666;
	            	Scigamy = ScigaSie[playerid];
	            	SetTimerEx("Odlicz",5000,0,"d",Scigamy);
	            	foreach(new i : Player)
	            	{
	            	    if(ScigaSie[i] == Scigamy)
	            	    {
	            	        if(IsPlayerInRangeOfPoint(i, 10.0, wCheckpoint[Scigamy][0][0], wCheckpoint[Scigamy][0][1], wCheckpoint[Scigamy][0][2]))
	            	        {
	            	            TogglePlayerControllable(i, 0);
					            GameTextForPlayer(i, "Za chwile rozpocznie sie wyscig", 5000, 6);
					            IloscZawodnikow ++;//rupxnup69
								Ukonczyl = 1;
	            	        }
	            	        else
	            	        {
	            	            DisablePlayerRaceCheckpoint(i);
	            	            ScigaSie[i] = 666;
	            	        }
	            	    }
	            	}

					new string[256];
					if(IsANoA(playerid) || HasPerm(playerid, PERM_RACING))
					{
						GroupSendMessage(1, COLOR_YELLOW, "UWAGA!");
						format(string, sizeof(string), "DO WSZYSTKICH JEDNOSTEK: ktoś zorganizował nielegalny wyścig %s", Wyscig[tworzenietrasy[playerid]][wNazwa]);
						GroupSendMessage(1, COLOR_DBLUE, string);
						GroupSendMessage(1, COLOR_YELLOW, "UWAGA!");
					}
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "Wyscig zaraz się zacznie!!");
	            }
	            else
	            {
	                sendErrorMessage(playerid, "Już trwa jeden wyścig! Poczekaj, aż się skończy lub użyj /wyscig_stop");
	            }
			}
			else
			{
			    sendErrorMessage(playerid, "Nie organizujesz wyścigu, aby to zrobić, użyj panelu tras (/wyscigi)");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie posiadasz uprawnień (wymagana 3 ranga)");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jesteś z NoA");
	}
	//rup
	return 1;
}
