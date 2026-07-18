//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ koxubankot ]----------------------------------------------//
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

YCMD:koxubankot(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		new para1, level;
		if( sscanf(params, "k<fix>d", para1, level))
		{
			sendTipMessage(playerid, "Użyj /koxubankot [playerid/CzęśćNicku] [level(1-5000) - level 0 zabiera admina]");
			return 1;
		}

		if(IsPlayerAdmin(playerid))
		{
            if(Uprawnienia(playerid, ACCESS_GIVEHALF))
			{
				if(IsPlayerConnected(para1))
				{
					if(para1 != INVALID_PLAYER_ID)
					{
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						PlayerInfo[para1][pAdmin] = level;
						format(string, sizeof(string), "   Zostałeś mianowany na %d level admina przez %s", level, GetNickEx(playerid));
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "   Dałeś %s admina o levelu %d.", giveplayer,level);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
           	 			Log(adminLog, WARNING, "Admin %s mianował %s na %d level admina", GetPlayerLogName(playerid), GetPlayerLogName(para1), level);
					}
				}
				
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
