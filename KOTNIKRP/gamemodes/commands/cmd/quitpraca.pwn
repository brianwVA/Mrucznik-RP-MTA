//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ quitpraca ]-----------------------------------------------//
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

YCMD:quitpraca(playerid, params[], help)
{
	new string[128];

    if(IsPlayerConnected(playerid))
   	{
		new job = PlayerInfo[playerid][pJob];
	    if(job > 0)
	    {
	        if(IsPlayerPremiumOld(playerid))
	        {
	            if(PlayerInfo[playerid][pContractTime] >= 2)
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wypełniłeś 1 godzinny kontrakt więc możesz zwolnić się z pracy.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zwolniłeś się ze swojej pracy, jesteś bezrobotny.");
				    PlayerInfo[playerid][pJob] = 0;
				    PlayerInfo[playerid][pContractTime] = 0;
				}
				else
				{
				    new chours = 2 - PlayerInfo[playerid][pContractTime];
				    format(string, sizeof(string), "* Masz jeszcze %d godzin do końca kontraktu, dopiero wtedy bedziesz mógł się zwolnić.", chours / 2);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					return 1;
				}
	        }
	        else
	        {
				if(PlayerInfo[playerid][pContractTime] >= 3)
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wypełniłeś 2.5 godzinny kontrakt więc możesz zwolnić się z pracy.");
				    PlayerInfo[playerid][pJob] = 0;
				    PlayerInfo[playerid][pContractTime] = 0;
				}
				else
				{
				    new chours = 10 - PlayerInfo[playerid][pContractTime];
				    format(string, sizeof(string), "* Masz jeszcze %d godzin do końca kontraktu, dopiero wtedy bedziesz mógł się zwolnić.", chours / 2);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					return 1;
				}
			}
			
			Log(serverLog, WARNING, "Gracz %s opuścił pracę %d.", GetPlayerLogName(playerid), job);
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz pracy (jeśli jesteś we frakcji wpisz /quitfrakcja) !");
		}
	}//not connected
	return 1;
}
