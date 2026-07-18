//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ gotoszpital ]----------------------------------------------//
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

YCMD:gotoszpital(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
		{
			if(!CanUseAdminCommand(playerid)) return sendErrorMessage(playerid, "Musisz być na admin-duty.");
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1177.5322,-1323.6294,14.0753);
			}
			else
			{
				SetPlayerPos(playerid, 1177.5322,-1323.6294,14.0753);
			}
			sendTipMessageEx(playerid, COLOR_GRAD1, "Zostałeś teleportowany!");
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
