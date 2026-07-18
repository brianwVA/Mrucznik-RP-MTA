//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ dajzaufanego ]---------------------------------------------//
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

YCMD:dajzaufanego(playerid, params[], help)
{
    if(Uprawnienia(playerid, ACCESS_ZG))
    {
		new para1, level;
        new string[128];
    	new giveplayer[MAX_PLAYER_NAME + 1];
    	new sendername[MAX_PLAYER_NAME + 1];
		if( sscanf(params, "k<fix>d", para1, level))
		{
			sendTipMessage(playerid, "Użyj /dajzaufanego [playerid/CzęśćNicku] [1- 10]");
			return 1;
		}
	    if(IsPlayerConnected(para1))
	    {
            if(level >= 0 && level <= 10)
            {
                GetPlayerName(para1, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "Zostałeś mianowany na %d level zaufanego gracza przez %s", level, sendername);
				SendClientMessage(para1, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "Dałeś %s zaufanego o levelu %d.", giveplayer,level);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            	Log(adminLog, WARNING, "Admin %s mianował %s na %d level zaufanego", GetPlayerLogName(playerid), GetPlayerLogName(para1), level);

                PlayerInfo[para1][pZG] = level;
            }
			else
			{
				sendTipMessageEx(playerid, COLOR_NEWS, "Level od 1 do 10 !");
			}
		}
	}
	return 1;
}
