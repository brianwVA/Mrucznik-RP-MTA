//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                   mrp_ac                                                  //
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
// Autor: xSeLeCTx
// Data utworzenia: 22.05.2021
//Opis:
/*
	System AC M-RP zawierajacy raknet i inne rozwiazania
*/

//

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
stock SetPlayerArmourEx(playerid, Float:armour)
{
	PlayerInfo[playerid][pLastArmour] = armour;
    SetPlayerArmour(playerid, armour);
	HUD_HealthArmorUpdate(playerid);
	return 1;
}

#if defined _ALS_SetPlayerArmour
  #undef SetPlayerArmour
#else
  #define _ALS_SetPlayerArmour
#endif
#define SetPlayerArmour SetPlayerArmourEx

stock SetPlayerHealthEx(playerid, Float:health)
{
	PlayerInfo[playerid][pLastHP] = health;
    SetPlayerHealth(playerid, health);
	HUD_HealthArmorUpdate(playerid);
	return 1;
}

#if defined _ALS_SetPlayerHealth
  #undef SetPlayerHealth
#else
  #define _ALS_SetPlayerHealth
#endif
#define SetPlayerHealth SetPlayerHealthEx

stock SetVehicleHealthEx(vehicleid, Float:health)
{
    new pid = CheckDriver(vehicleid);
    
    ToggleVehicleRPC(vehicleid, RPC_SET_VEHICLE_HEALTH, 1);
    SetTimerEx("ToggleVehicleRPC", 500, false, "ddd", vehicleid, RPC_SET_VEHICLE_HEALTH, 0);
    if(pid != INVALID_PLAYER_ID) rgRakNet_VehicleDriver[vehicleid] = pid;

    SetVehicleHealth(vehicleid, Float:health);
}

#if defined _ALS_SetVehicleHealth
  #undef SetVehicleHealth
#else
  #define _ALS_SetVehicleHealth
#endif
#define SetVehicleHealth SetVehicleHealthEx

stock RepairVehicleEx(vehicleid)
{
    new pid = CheckDriver(vehicleid);

    ToggleVehicleRPC(vehicleid, RPC_SET_VEHICLE_HEALTH, 1);
    SetTimerEx("ToggleVehicleRPC", 500, false, "ddd", vehicleid, RPC_SET_VEHICLE_HEALTH, 0);
    if(pid != INVALID_PLAYER_ID) rgRakNet_VehicleDriver[vehicleid] = pid;

    RepairVehicle(vehicleid);
}

#if defined _ALS_RepairVehicle
  #undef RepairVehicle
#else
  #define _ALS_RepairVehicle
#endif
#define RepairVehicle RepairVehicleEx

stock GivePlayerWeaponEx(playerid, weaponid, ammo)
{
    TogglePlayerPacket(playerid, WEAPONS_UPDATE_SYNC, 1);
    SetTimerEx("TogglePlayerPacket", 300, false, "ddd", playerid, WEAPONS_UPDATE_SYNC, 0);
    rgRakNet_PlayerWeapons[playerid][GetWeaponSlot(weaponid)][0] = weaponid;
    rgRakNet_PlayerWeapons[playerid][GetWeaponSlot(weaponid)][1] += ammo;

    GivePlayerWeapon(playerid, weaponid, ammo);
}

#if defined _ALS_GivePlayerWeapon
  #undef GivePlayerWeapon
#else
  #define _ALS_GivePlayerWeapon
#endif
#define GivePlayerWeapon GivePlayerWeaponEx

stock SetPlayerAmmoEx(playerid, weaponid, ammo)
{
    TogglePlayerPacket(playerid, WEAPONS_UPDATE_SYNC, 1);
    SetTimerEx("TogglePlayerPacket", 300, false, "ddd", playerid, WEAPONS_UPDATE_SYNC, 0);
    rgRakNet_PlayerWeapons[playerid][GetWeaponSlot(weaponid)][1] = ammo;

    SetPlayerAmmo(playerid, weaponid, ammo);
}

#if defined _ALS_SetPlayerAmmo
  #undef SetPlayerAmmo
#else
  #define _ALS_SetPlayerAmmo
#endif
#define SetPlayerAmmo SetPlayerAmmoEx

stock ResetPlayerWeaponsEx(playerid)
{
    TogglePlayerPacket(playerid, WEAPONS_UPDATE_SYNC, 1);
    SetTimerEx("TogglePlayerPacket", 300, false, "ddd", playerid, WEAPONS_UPDATE_SYNC, 0);
    for(new i = 0; i<13; i++)
    {
        rgRakNet_PlayerWeapons[playerid][i][0] = 0;
        rgRakNet_PlayerWeapons[playerid][i][1] = 0;
    }

    ResetPlayerWeapons(playerid);
}

#if defined _ALS_ResetPlayerWeapons
  #undef ResetPlayerWeapons
#else
  #define _ALS_ResetPlayerWeapons
#endif
#define ResetPlayerWeapons ResetPlayerWeaponsEx


hook OnPlayerConnect(playerid)
{
 	rgRakNet_SaveWeapons[playerid] = 0;
	for(new i=0;i<13;i++) 
	{
	    rgRakNet_PlayerWeapons[playerid][i][0] = 0;
	    rgRakNet_PlayerWeapons[playerid][i][1] = 0;
	}
	for(new i = 0; i<300; i++)
    {
        rgAllowPlayerRPC[playerid][i] = 0;
        rgAllowPlayerPacket[playerid][i] = 0;
    }
	
	new ip[16];
	GetPlayerIp(playerid, ip, sizeof(ip));
	format(PlayerAC[playerid][acPlayerIP], 16, "%s", ip);
	PlayerAC[playerid][acPos][0] = 0;
	PlayerAC[playerid][acPos][1] = 0;
	PlayerAC[playerid][acPos][2] = 0;
    PlayerAC[playerid][acWarn_SpeedHack] = 0;
    PlayerAC[playerid][acWarn_FlyHack] = 0;
    PlayerAC[playerid][acWarn_SilentAim] = 0;
    PlayerAC[playerid][acWarn_Aimbot] = 0;
    PlayerAC[playerid][acWarn_NoSpread] = 0;
    PlayerAC[playerid][acWarn_AfkShot] = 0;
    PlayerAC[playerid][acWarn_Slide] = 0;
    PlayerAC[playerid][acWarn_FakeWL] = 0;
	PlayerAC[playerid][acWarn_SilentAim2] = 0;
	PlayerAC[playerid][acWarn_ZoomHack] = 0;
    PlayerAC[playerid][acLastWarn_SpeedHack] = 0;
    PlayerAC[playerid][acLastWarn_FlyHack] = 0;
    PlayerAC[playerid][acLastWarn_Aimbot] = 0;
    PlayerAC[playerid][acLastWarn_NoSpread] = 0;
	PlayerAC[playerid][acLastWarn_SilentAim2] = 0;
	PlayerAC[playerid][acLastWarn_ZoomHack] = 0;
	PlayerAC[playerid][acLastWarn_NoFuel] = 0;
	PlayerAC[playerid][acCarEngine_Tick] = 0;
    PlayerAC[playerid][acAim_lastAimZ] = 0;
	for(new i = 0; i<10; i++)
	{
		PlayerAC[playerid][acAim_meanAim][i] = 0;
	}
    PlayerAC[playerid][acNoSpread_lastHitPos][0] = 0;
	PlayerAC[playerid][acNoSpread_lastHitPos][1] = 0;
	PlayerAC[playerid][acNoSpread_lastHitPos][2] = 0;
    PlayerAC[playerid][acNoSpread_lastOffsets][0] = 0;
	PlayerAC[playerid][acNoSpread_lastOffsets][1] = 0;
	PlayerAC[playerid][acNoSpread_lastOffsets][2] = 0;
    PlayerAC[playerid][acSpeed_lastSpeed] = 0;
    PlayerAC[playerid][acSpam_lastTick] = 0;
    PlayerAC[playerid][acSpam_count] = 0;
    PlayerAC[playerid][acSpam_unmuteTime] = 0;
    PlayerAC[playerid][acVPN_count] = 0;

	PlayerAC[playerid][acCleo] = 0;
	PlayerAC[playerid][acSampFuncs] = 0;
	PlayerAC[playerid][acSilentPatch] = 0;
	PlayerAC[playerid][acSobeit] = 0;
	PlayerAC[playerid][acWh] = 0;
	PlayerAC[playerid][acVorbis] = 0;
	PlayerAC[playerid][acSilentAim] = 0;
	//PlayerAC[playerid][PlayerAimed] = 0;
	//PlayerAC[playerid][acWarn_Triggerbot] = 0;

	new kicked = false;
	for(new i = 0; i < sizeof(AntiReconnectIPs); i++)
	{
		if(!isnull(AntiReconnectIPs[i][0]) && strval(AntiReconnectIPs[i][1]) <= gettime())
		{
			strdel(AntiReconnectIPs[i][0], 0, 16);
			strdel(AntiReconnectIPs[i][1], 0, 16);
		}
		if(!kicked)
		{
			if(strcmp(AntiReconnectIPs[i][0], PlayerAC[playerid][acPlayerIP], true) == 0)
			{
				kicked = true;
				KickEx(playerid);
			}
		}
	}

	if(IsAProductionServer() && !kicked) VPNPrepare(playerid);
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid, "CheatDetected") == 1)
	{
		for(new i = 0; i < sizeof(AntiReconnectIPs); i++)
		{
			if(isnull(AntiReconnectIPs[i][0]))
			{
				valstr(AntiReconnectIPs[i][1], gettime()+10);
				//printf("%d. %s %s", i, AntiReconnectIPs[i][0], AntiReconnectIPs[i][1]); 
				break;
			}
		}
	}
}

MRPAC_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_AC_VPN)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				VPNTurnedOn = !VPNTurnedOn;
				HTTP(playerid, HTTP_GET, sprintf(AC_VPN_IP "/vpn/vpn.php?adm&vpn=%d", VPNTurnedOn), "", "VPNNullResponse");
				sendTipMessage(playerid, sprintf("VPN %s", (VPNTurnedOn == 1 ? "ON" : "OFF")));
				printf("[VPN INFO] %s [%d] %s VPN", GetPlayerLogName(playerid), playerid, (VPNTurnedOn == 1 ? "wlaczyl" : "wylaczyl"));
				command_vpn_Impl(playerid);
			}
			case 1:
			{
				ShowPlayerDialogEx(playerid, DIALOG_AC_VPN_ADD, DIALOG_STYLE_INPUT, "Panel VPN » Dodaj wyjątek", "Wpisz poniżej nick osoby, która ma omijać system Anty-VPN", "Akceptuj", "Anuluj");
			}
			case 2:
			{
				HTTP(playerid, HTTP_GET, AC_VPN_IP "/vpn/vpn.php?adm&reloadlist", "", "VPNNullResponse");
				sendTipMessage(playerid, "Lista VPN przeładowana!");
				printf("[VPN INFO] %s [%d] przeladowal liste VPN", GetPlayerLogName(playerid), playerid);
				command_vpn_Impl(playerid);
			}
			case 3:
			{
				command_vpn_Impl(playerid);
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_AC_VPN_ADD)
	{
		if(!response) return command_vpn_Impl(playerid);
		HTTP(playerid, HTTP_GET, sprintf(AC_VPN_IP "/vpn/vpn.php?adm&addname=%s", inputtext), "", "VPNNullResponse");
		sendTipMessage(playerid, sprintf("Dodałeś %s do listy wyjątków", inputtext));
		printf("[VPN INFO] %s [%d] dodal %s do listy wyjatkow", GetPlayerLogName(playerid), playerid, inputtext);
		command_vpn_Impl(playerid);
		return 1;
	}
	return 0;
}

//end