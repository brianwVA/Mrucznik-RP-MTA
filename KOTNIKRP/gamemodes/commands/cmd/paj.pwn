//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ paj ]--------------------------------------------------//
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

YCMD:paj(playerid, params[], help)
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

	   		new nick[MAX_PLAYER_NAME + 1], czas, result[64];
			if( sscanf(params, "s[21]ds[64]", nick, czas, result))
			{
                sendTipMessage(playerid, "Użyj /paj [NICK GRACZA OFFLINE] [czas] [powod]"); //
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
				sendErrorMessage(playerid, "Brak pliku gracza, nie można zAJotować (konto nie istnieje).");
				return 1;
			}
			//SetPlayerPAdminJail(nick, playerid, czas, result);
			if(AddPunishment(-1, nick, playerid, gettime(), PENALTY_AJ, czas, result, 0) == 1) {
				if(kary_TXD_Status == 1)
				{
					PAJPlayerTXD(nick, playerid, czas, result); 
				}
				else if(kary_TXD_Status == 0)
				{
					format(string, sizeof(string), "AdmCmd: Konto gracza offline %s dostało AJ na %d min od %s, Powod: %s", nick, czas, GetNickEx(playerid), (result));
					SendPunishMessage(string, playerid);
				}
			}
		}
    }
	return 1;
}
