//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ setstrong ]-----------------------------------------------//
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

YCMD:setstrong(playerid, params[], help)
{
	new valueStrong, giveplayerid;
	new string[128];
	if( sscanf(params, "k<fix>d", giveplayerid, valueStrong))
	{
		sendTipMessage(playerid, "Użyj /setstrong [ID] [Wartość] ");
		return 1;
	}
	if(valueStrong >= MAX_STRONG_VALUE)
	{
		format(string, sizeof(string), "Nie możesz ustalić wartości większej jak %d", MAX_STRONG_VALUE);
		sendTipMessage(playerid, string); 
		return 1;
	}
	if(IsPlayerConnected(playerid) && IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[giveplayerid][pStrong] != MAX_STRONG_VALUE)
		{
			if(PlayerInfo[playerid][pAdmin] >= 3500 || IsAScripter(playerid))
			{
				format(string, sizeof(string), "Administrator %s ustalił Ci wartość siły na %d [Poprzednia wartość %d]", GetNickEx(playerid), valueStrong, PlayerInfo[giveplayerid][pStrong]);
				sendTipMessageEx(giveplayerid, COLOR_P@, string);
				format(string, sizeof(string), "Ustaliłeś wartość siły %s na %d - jego poprzednia wartość to %d", GetNick(giveplayerid), valueStrong, PlayerInfo[giveplayerid][pStrong]); 
				sendTipMessageEx(playerid, COLOR_P@, string); 
				PlayerInfo[giveplayerid][pStrong] = valueStrong;
			}
			else
			{
				sendTipMessage(playerid, "Brak wystarczających uprawnień"); 
				return 1;
			}
		}
		else
		{
			sendTipMessage(playerid, "Ten gracz ma już maksymalną wartość siły!"); 
			return 1;
		}
	
	}
	else
	{
		sendTipMessage(playerid, "Gracz nie jest podłączony"); 
	}
	return 1;
}
