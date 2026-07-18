//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ demorgan ]-----------------------------------------------//
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

YCMD:demorgan(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] < 20)
        {
            noAccessMessage(playerid);
            return 1;
        }
        new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "Użyj /demorgan [playerid/CzęśćNicku]");
			return 1;
		}

	    if(IsPlayerConnected(giveplayerid))
	    {
	        if(giveplayerid != INVALID_PLAYER_ID)
	        {
	            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "* Uwięziłeś %s w Fort DeMorgan.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTRED, string);
				format(string, sizeof(string), "* Zostałeś uwięziony w Forcie DeMorgan przez Administratora %s.", GetNickEx(playerid));
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, string);
				GameTextForPlayer(giveplayerid, "~w~Witamy w ~n~~r~Fort DeMorgan", 5000, 3);
				PoziomPoszukiwania[giveplayerid] = 0;
				PlayerInfo[giveplayerid][pJailed] = 2;
				PlayerInfo[giveplayerid][pJailTime] = 3600;
				ResetPlayerWeapons(giveplayerid);
				UsunBron(giveplayerid);

                format(string, sizeof(string), "CMD_Info: /demorgan użyte przez %s [%d]", GetNickEx(playerid), playerid);
                SendMessageToAdmin(string, 0x9ACD32AA);
        		Log(adminLog, WARNING, "Admin %s użył /demorgan na graczu %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
				JailDeMorgan(giveplayerid);
	        }
		}
		else
		{
		    sendErrorMessage(playerid, "Nie ma takiego gracza !");
		    return 1;
		}
    }
    return 1;
}
