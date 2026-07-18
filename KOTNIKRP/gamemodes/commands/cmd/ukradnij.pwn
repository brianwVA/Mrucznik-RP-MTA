//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ ukradnij ]-----------------------------------------------//
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

YCMD:ukradnij(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
   	{
        if(PlayerInfo[playerid][pJob] == 5)
		{
		    if(PlayerOnMission[playerid] > 0)
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Jesteś na misji, nie możesz tego użyć!");
		        return 1;
		    }
	        if(PlayerInfo[playerid][pCarTime] == 0)
	        {
	            GameTextForPlayer(playerid, "~w~Ukradles woz ~n~~r~Dostarcz go do zurawia", 5000, 1);
	            CP[playerid] = 1;
	            SetPlayerCheckpoint(playerid, -1548.3618,123.6438,3.2966,8.0);
	        }
	        else
	        {
	            //sendTipMessageEx(playerid, COLOR_GREY, "Ukradłeś już wcześniej wóz, poczekaj aż policja się uspokoi!");
				sendTipMessageEx(playerid, COLOR_GREY, sprintf("Ukradłeś już wcześniej wóz, poczekaj %d minut!", floatround( PlayerInfo[playerid][pCarTime] / 60 % 60 ) ));
	        }
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś złodziejem aut!");
		}
	}//not connected
	return 1;
}
