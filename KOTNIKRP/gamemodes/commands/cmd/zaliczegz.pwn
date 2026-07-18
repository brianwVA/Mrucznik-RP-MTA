//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zaliczegz ]-----------------------------------------------//
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

YCMD:zaliczegz(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(IsAnInstructor(playerid))
        {
            new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
			    sendTipMessage(playerid, "Użyj /zaliczegz [playerid/CzęśćNicku]");
			    return 1;
			}

			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(TakingLesson[giveplayerid] != 1)
			        {
			            sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie zaczął lekcji !");
			            return 1;
			        }
			        GetPlayerName(playerid, sendername, sizeof(sendername));
			        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			        format(string, sizeof(string), "* %s otrzymał zaliczenie egzaminu praktycznego.",giveplayer);
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			        format(string, sizeof(string), "* Gratulacje! Urzędnik %s wystawił ci ocenę poztywna z egzaminu! Idź do okienka odebrać prawo jazdy!",sendername);
			        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			        TakingLesson[giveplayerid] = 0;
			        PlayerInfo[giveplayerid][pCarLic] = 3;
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
            sendErrorMessage(playerid, "Nie jesteś urzędnikiem !");
            return 1;
        }
    }
    return 1;
}
