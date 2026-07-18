//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                   convoy                                                  //
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
// Data utworzenia: 20.10.2019
//Opis:
/*
	System konwojów.
*/

//

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_CROUCH))
	{
		new boxid = GetNearestBox(playerid);
		if(boxid != -1)
		{
			sendTipMessage(playerid, "Podniosłeś dynię z narkotykami. Aby ją upuścić, naciśnij enter.");
			if(IsInAConvoyTeam(playerid)) {
				sendTipMessage(playerid, "Upuść paczkę przy pojeździe konwojowym, aby wrzucić ją spowrotem do środka.");
			} else {
				sendTipMessage(playerid, "Dostarcz dynię do upiornych handlarzy, aby otrzymać nagrodę.");
			}
			ChatMe(playerid, "podnosi dynię.");
			PickupBox(playerid, boxid);
		}
	}
	else if(PRESSED(KEY_SECONDARY_ATTACK))
	{
		if(IsPlayerCarryingBox(playerid) && !IsPlayerInAnyVehicle(playerid))
		{
			DropBox(playerid);
   			ApplyAnimation(playerid,"CARRY","putdwn", 4.0, 0, 0, 0, 0, 0); 
			ChatMe(playerid, "upuszcza dynię.");
		}
	}
	return 1;
}

hook OnPlayerDeath(playerid)
{
	if(IsPlayerCarryingBox(playerid)) 
	{
		ChatMe(playerid, "upuszcza dynię.");
		DropBox(playerid);
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(IsPlayerCarryingBox(playerid)) 
	{
		ChatMe(playerid, "upuszcza dynię.");
		DropBox(playerid);
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	carryingBox[playerid] = -1;
	return 1;
}

//end