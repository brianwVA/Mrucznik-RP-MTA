//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ laptop ]------------------------------------------------//
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

YCMD:laptop(playerid, params[], help)
{
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	    if(IsPlayerInGroup(playerid, 8) || PlayerInfo[playerid][pLider] == 8)
	    {
			if(OnDuty[playerid] != GetPlayerGroupSlot(playerid, 8))
				return sendErrorMessage(playerid, "Musisz być na duty!");
		    if(ConnectedToPC[playerid] == 255)
		    {
		        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wyłączyłeś swój laptop i zerwałeś połączenie z agencją.");
		        ConnectedToPC[playerid] = 0;
		        return 1;
		    }
		    GetPlayerName(playerid, sendername, sizeof(sendername));
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Włączyłeś swój laptop i połączyłeś się z agencją.");
		    SendClientMessage(playerid, COLOR_WHITE, "|___ Hitman Agency ___|");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - News");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Kontrakty");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Givehit");
		    //SendClientMessage(playerid, COLOR_YELLOW2, "| - Backup");
		    //SendClientMessage(playerid, COLOR_YELLOW2, "| - Order");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Rangi");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Wyloguj");
			SendClientMessage(playerid, COLOR_WHITE, "|______________|00:00|");
			ConnectedToPC[playerid] = 255;
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś pracownikiem Hitman Agency !");
	        return 1;
	    }
	}
    return 1;
}
