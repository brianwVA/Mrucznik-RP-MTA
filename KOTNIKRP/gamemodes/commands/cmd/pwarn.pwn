//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ pwarn ]-------------------------------------------------//
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

YCMD:pwarn(playerid, params[], help)
{
	new string[128];
    if(IsPlayerConnected(playerid))
    {
        if (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1 || IsAScripter(playerid))
		{
		    if(AntySpam[playerid] == 1)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Odczekaj 5 sekund");
		        return 1;
		    }

	   		new nick[MAX_PLAYER_NAME + 1], result[64];
			if( sscanf(params, "s[21]s[64]", nick, result))
			{
                sendTipMessage(playerid, "Użyj /pwarn [NICK GRACZA OFFLINE] [powod]");
                return 1;
            }
			new giveplayerid;
			sscanf(nick, "k<fix>", giveplayerid);
            if(IsPlayerConnected(giveplayerid))
			{
			    sendErrorMessage(playerid, "Nie możesz zablokować tego gracza (jest online (na serwerze))");
				return 1;
			}

			if(!MruMySQL_DoesAccountExist(nick))
			{
				sendErrorMessage(playerid, "Brak pliku gracza, nie można zwarnować (konto nie istnieje).");
				return 1;
			}
			//GivePWarnForPlayer(nick, playerid, result);
			if(AddPunishment(-1, nick, playerid, gettime(), PENALTY_WARN, 0, result, 0) == 1) {
				if(kary_TXD_Status == 1)
				{
					PWarnPlayerTXD(nick, playerid, result);
				}
				else if(kary_TXD_Status == 0)
				{
					format(string, sizeof(string), "Admin %s nadał warna (offline) dla %s. Powód: %s", GetNickEx(playerid), nick, result);
					SendPunishMessage(string, playerid);
				}
			}
		}
    }
	return 1;
}
