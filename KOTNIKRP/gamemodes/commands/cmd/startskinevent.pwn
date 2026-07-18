//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------[ startskinevent ]---------------------------------------------------//
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

YCMD:startskinevent(playerid, params[], help)
{
	// new string[256];
	// new value; 
	// if(sscanf(params, "d", value))
	// {
	// 	sendTipMessage(playerid, "Użyj: /startskinevent [ID]"); 
	// 	return 1;
	// }
	// if(PlayerInfo[playerid][pAdmin] >= 3500 || IsAScripter(playerid))
	// {
	// 	if(value >= 20001 && value <= skinsLoaded_Event)
	// 	{
	// 		if(eventForSkin[value-20000] == 0)
	// 		{
	// 			eventForSkin[value-20000] = 1;
	// 			format(string, sizeof(string), "%s włączył event dla skina %d", GetNick(playerid), value); 
	// 			SendMessageToAdmin(string, COLOR_YELLOW);
	// 		}
	// 		else if(eventForSkin[value-20000] == 1)
	// 		{
	// 			eventForSkin[value-20000] = 0;
	// 			format(string, sizeof(string), "%s wyłączył event dla skina %d", GetNick(playerid), value); 
	// 			SendMessageToAdmin(string, COLOR_YELLOW);
	// 		}
	// 	}
	// 	else
	// 	{
	// 		sendErrorMessage(playerid, "Ten skin nie istnieje dla eventów!"); 
	// 	}
	// }
	sendErrorMessage(playerid, "Komenda wyłączona.");
	return 1;
}



