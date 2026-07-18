//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ hud ]-------------------------------------------------//
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

YCMD:hud(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if (gPlayerLogged[playerid] != 0)
		{
			new opcja[16];
			if(sscanf(params, "s[16]", opcja))
			{
				SendClientMessage(playerid, COLOR_WHITE, "Użyj: /hud on/off");
				return 1;
			}
			
			if(strcmp(opcja, "off", true) == 0)
			{
				if(HUDShown[playerid] == 0)
				{
					SendClientMessage(playerid, COLOR_GREY, "HUD jest już wyłączony!");
					return 1;
				}
				HUD_Hide(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "HUD został {ff0000}wyłączony{ffffff}. Statystyki głodu i pragnienia dostępne pod /staty.");
				return 1;
			}
			else if(strcmp(opcja, "on", true) == 0)
			{
				if(HUDShown[playerid] == 1)
				{
					SendClientMessage(playerid, COLOR_GREY, "HUD jest już włączony!");
					return 1;
				}
				HUD_Show(playerid);
				SendClientMessage(playerid, COLOR_WHITE, "HUD został {00ff00}włączony{ffffff}.");
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Niepoprawna opcja! Użyj: on lub off");
				return 1;
			}
		}
	}
	return 1;
}

