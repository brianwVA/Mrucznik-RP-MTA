//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ elo ]--------------------------------------------------//
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

YCMD:elo(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		new playa;
		if( sscanf(params, "k<fix>", playa))
		{
			sendTipMessage(playerid, "Użyj /elo [ID gracza]");
			return 1;
		}

		if(dialAccess[playerid] == 1)
		{
			sendErrorMessage(playerid, "Musisz odczekać 15 sekund przed ponowną interakcją!"); 
			return 1;
		}

		if (ProxDetectorS(5.0, playerid, playa) && Spectate[playa] == INVALID_PLAYER_ID)
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
		            if(Spectate[playa] != INVALID_PLAYER_ID)
					{
						sendErrorMessage(playerid, "Ten gracz jest za daleko.");
						return 1;
					}
                    new string[128], nick[MAX_PLAYER_NAME + 1], witany[MAX_PLAYER_NAME + 1];
                    GetPlayerName(playa, witany, sizeof(witany));
                    GetPlayerName(playerid, nick, sizeof(nick));
                    format(string, sizeof(string), "Witasz się z %s", witany);
                    SendClientMessage(playerid, COLOR_WHITE, string);
                    format(string, sizeof(string), "Witasz się z %s", nick);
                    SendClientMessage(playa, COLOR_WHITE, string);
					dialTimer[playerid] = SetTimerEx("timerDialogs", 5000, true, "i", playerid);
					dialAccess[playerid] = 1; 
					//SendClientMessage(playa, COLOR_WHITE, "Witasz się");
					ApplyAnimation(playerid,"GANGS","hndshkcb",4.1,0,1,1,1,1);//8
					ApplyAnimation(playa,"GANGS","hndshkcb",4.1,0,1,1,1,1);//8
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Jesteś za daleko !");
		}
	}
	return 1;
}
