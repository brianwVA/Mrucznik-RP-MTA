//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                  wypadek                                                  //
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
// Autor: Mrucznik
// Data utworzenia: 11.06.2019
//Opis:
/*
	System wypadków. Dawny filterscript scanhp.
*/

//

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------

hook OnGameModeInit()
{ 
	return 1;
}

hook OnPlayerConnect(playerid)
{
	scantimer[playerid] = -1;
    incar[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(incar[playerid] == 1) 
	{
		KillScanhpTimer(playerid);
	}
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if(incar[playerid] == 1)
		KillScanhpTimer(playerid);

	pasy[playerid] = 0;
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	GetVehicleHealth(vehicleid,newhealth[playerid]);
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		StarScanhpTimer(playerid);
	    GetVehicleHealth(vehicleid,oldhealth[playerid]);
	    incar[playerid] = 1;
		return 1;
	}
	if((oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT) || (oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_ONFOOT))
	{
		KillScanhpTimer(playerid);
		new nick[MAX_PLAYER_NAME + 1];
	   	new string[256];
		GetPlayerName(playerid, nick, sizeof(nick));
		if(pasy[playerid] == 1)
		{
		   	format(string, sizeof(string), "* %s odpina pasy.", nick);
			ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
			pasy[playerid] = 0;
		}
		if(kask[playerid] == 1)
		{
		   	format(string, sizeof(string), "* %s ściąga kask z głowy.", nick);
			ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
			RemovePlayerAttachedObject(playerid, 3);
			kask[playerid] = 0;
		}
		incar[playerid] = 0;
		return 1;
	}
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    SetTimerEx("EnterCar",15000,0,"d",playerid);
	WszedlDoPojazdu[playerid] = 1;
}

//end