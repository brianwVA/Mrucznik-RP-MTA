//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ sprawdztest ]----------------------------------------------//
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

YCMD:sprawdztest(playerid, params[], help)
{
	new string[256];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsAUrzednik(playerid) && PlayerInfo[playerid][pLocal] == 108)
    {
        new giveplayerid;
    	if( sscanf(params, "k<fix>", giveplayerid))
    	{
    		sendTipMessage(playerid, "Użyj /sprawdztest [ID/Nick]");
    		return 1;
    	}

		if(!IsPlayerConnected(giveplayerid)) 
		{
			return sendErrorMessage(playerid, "Nie ma takiego gracza.");
		}

        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		if(PlayerInfo[giveplayerid][pWtrakcietestprawa]==1)
		{
			format(string, sizeof(string), "* Gracz %s nadal rozwiązuje test.", giveplayer);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			return 1;
		}
        else
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* Urzędnik %s sprawdza test %s", sendername, giveplayer);
			ProxDetector(40.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(PlayerInfo[giveplayerid][pMinalczasnazdpr] == 1)
			{
				format(string, sizeof(string), "* Gracz %s nie zdążył odpowiedzieć w wyznaczonym czasie! Nie zdał.", giveplayer);
				SendClientMessage(playerid, COLOR_GREEN, string);
				return 1;
			}
			else if(PlayerInfo[giveplayerid][pCarLic] == 1)
			{
				format(string, sizeof(string), "%s posiada już prawo jazdy", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				return 1;
			}
			else if(PlayerInfo[giveplayerid][pSprawdzczyzdalprawko] == 1 || PlayerInfo[giveplayerid][pCarLic] == 2)
			{
				format(string, sizeof(string), "Gracz %s ZDAŁ egzamin teoretyczny i może rozpocząć egzamin praktyczny", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				return 1;
			}
			else if(PlayerInfo[giveplayerid][pCarLic] == 3)
			{
				format(string, sizeof(string), "Gracz %s ZDAŁ egzamin teoretyczny oraz praktyczny i może odebrać prawo jazdy", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				return 1;
			}
            else if(PlayerInfo[giveplayerid][pCarLic] > 1000)
			{
				format(string, sizeof(string), "Gracz %s stracił prawo jazdy za przekroczoną ilosć punktów karnych", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				return 1;
			}
			else
			{
				format(string, sizeof(string), "Gracz %s NIE ZDAŁ testu! Dobrze: %d Źle: %d (liczniki pokazujące zero również niezaliczają testu)", giveplayer, PlayerInfo[giveplayerid][pPrawojazdydobreodp], 3 - PlayerInfo[giveplayerid][pPrawojazdydobreodp]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				return 1;
			}
        }
    }
    else return sendErrorMessage(playerid, "* Nie jesteś Urzędnikiem!");
}
