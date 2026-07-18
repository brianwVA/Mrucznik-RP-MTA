//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ unblock ]------------------------------------------------//
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

YCMD:unblock(playerid, params[], help)
{
	new string[128];
	new nick[MAX_PLAYER_NAME + 1], result[128];
	
    if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		if( sscanf(params, "s[24] s[128]", nick, result))
		{
			sendTipMessage(playerid, "Użyj /unblock [nick] [powod]");
			return 1;
		}
		if(AddPunishment(-1, nick, playerid, gettime(), PENALTY_UNBLOCK, 0, result, 0) == 1)
		{
    		format(string, sizeof(string), "Administrator %s nadał unblocka na postać %s powod %s", GetNickEx(playerid), nick, result);
            //SendPunishMessage(string);
            ABroadCast(COLOR_YELLOW,string,1);
            Log(punishmentLog, WARNING, "Admin %s odblokował %s powod %s", GetPlayerLogName(playerid), nick, result);
        }
	}
	return 1;
}
