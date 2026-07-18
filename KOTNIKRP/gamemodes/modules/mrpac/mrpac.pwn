//-----------------------------------------------<< Source >>------------------------------------------------//
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

	// ----- RAKNET ----- //
	- Anty Fake Car Despawn (https://github.com/katursis/Pawn.RakNet/wiki/AntiVehicleSpawn)
	- Anty Weapon Hack
	- Anty Ammo Hack
	- Anty Vehicle Health Hack
	- Anty Upside Down Cheat (https://github.com/samp-anti-cheat/OnPlayerTurnUpsideDown)
	- Anty Slapper (by Neproify)
    - Anty Silent Aim
    - Anty Aimbot
    - Anty No Spread 
    - Anty Zoom Hack

	// ----- SKRYPTOWE ----- //
	- Anty Fake Kill (https://github.com/RogueDrifter/Anti_cheat_pack/blob/master/Anti-Cheat/FakeKill.inc)
    - Anty Fake Wanted Level
	- Anty AFK Shoot
	- Anty Speedfire (https://github.com/samp-anti-cheat/rapid-fire)
	- Anty Speedhack
	- Anty Anim Troll + Invis
	- Anty Spam
    - Anty FlyHack
    - Anty Reconnect (po kicku z AC)
    - Anty NoReload (https://github.com/samp-anti-cheat/no-reload)
    - Anty NameTag Wallhack
    - Anty NoFuel

*/

//
#include <rapid-fire>
#include <no-reload>

//-----------------<[ Funkcje: ]>-------------------
public OnAntiCheatFireRate(playerid, weaponid, interval)
{
	OnCheatDetected(playerid, "", 0, 54);
}
public OnAntiCheatNoReload(playerid, roundsfired)
{
    OnCheatDetected(playerid, "", 0, 72);
}
// ----------- < Anty Fake Car Despawn > ----------- //
stock IsVehicleUpsideDown(vehicleid)
{
    new Float:quat_w, Float:quat_x, Float:quat_y, Float:quat_z;
    GetVehicleRotationQuat(vehicleid, quat_w, quat_x, quat_y, quat_z);
    return (
        floatabs(
            atan2(
                2 * ((quat_y * quat_z) + (quat_w * quat_x)),
                (quat_w * quat_w) - (quat_x * quat_x) - (quat_y * quat_y) + (quat_z * quat_z)
            )
        ) > 90.0
    );
}


stock TestVehicle(playerid, model, color1, color2)
{
    //BPR_SendRPC()
}

IRPC:VehicleDestroyed(playerid, BitStream:bs)
{
    new vehicleid;

    BS_ReadUint16(bs, vehicleid);

    if (GetVehicleModel(vehicleid) < 400)
    {
        return 0;
    }

    return OnVehicleRequestDeath(vehicleid, playerid);
}

forward OnVehicleRequestDeath(vehicleid, killerid);
public OnVehicleRequestDeath(vehicleid, killerid)
{
    new Float:health, Float:depth, Float:vehicledepth;

    GetVehicleHealth(vehicleid, health);

    if(GetSVarInt("CA_Initialized") == 1)
    {
        if(health >= 250.0 &&
        !CA_IsVehicleInWater(vehicleid, depth, vehicledepth) &&
        !IsVehicleUpsideDown(vehicleid))
        {
            return 0;
        }
    }
    else
    {
        if (health >= 250.0 && !IsVehicleUpsideDown(vehicleid))
        {
            return 0;
        }
    }

    return 1;
}

IPacket:UNOCCUPIED_SYNC(playerid, BitStream:bs)
{
    new unoccupiedData[PR_UnoccupiedSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadUnoccupiedSync(bs, unoccupiedData);
    if(!IsAProductionServer())
    {
        /*printf(
            "UNOCCUPIED_SYNC[%d]:\nvehicleId %d \nseatId %d \nroll %.2f %.2f %.2f \ndirection %.2f %.2f %.2f \nposition %.2f %.2f %.2f \nvelocity %.2f %.2f %.2f \nangularVelocity %.2f %.2f %.2f \nvehicleHealth %.2f",
            playerid,
            unoccupiedData[PR_vehicleId],
            unoccupiedData[PR_seatId],
            unoccupiedData[PR_roll][0],
            unoccupiedData[PR_roll][1],
            unoccupiedData[PR_roll][2],
            unoccupiedData[PmR_direction][0],
            unoccupiedData[PR_direction][1],
            unoccupiedData[PR_direction][2],
            unoccupiedData[PR_position][0],
            unoccupiedData[PR_position][1],
            unoccupiedData[PR_position][2],
            unoccupiedData[PR_velocity][0],
            unoccupiedData[PR_velocity][1],
            unoccupiedData[PR_velocity][2],
            unoccupiedData[PR_angularVelocity][0],
            unoccupiedData[PR_angularVelocity][1],
            unoccupiedData[PR_angularVelocity][2],
            unoccupiedData[PR_vehicleHealth]
        );*/
    }
    return 1;
}

IPacket:AIM_SYNC(playerid, BitStream:bs)
{
    new aimData[PR_AimSync];
    
    BS_IgnoreBits(bs, 8); // ignore packetid (byte)
    BS_ReadAimSync(bs, aimData);

    // ----------- < Anty Aimbot > ----------- //
    if(aimData[PR_camMode] == 53 || aimData[PR_camMode] == 7) // aiming with gun / sniper
    {
        if(PlayerAC[playerid][acLastWarn_ZoomHack] <= gettime() && PlayerAC[playerid][acLastWarn_ZoomHack] != 0)
        {
            PlayerAC[playerid][acLastWarn_ZoomHack] = 0;
            PlayerAC[playerid][acWarn_ZoomHack] = 0;
        }
        if(aimData[PR_camMode] == 7 && aimData[PR_camZoom] < 30) return 1;
        else if(aimData[PR_camMode] == 53 && (aimData[PR_camZoom] < 26 || aimData[PR_camZoom] > 63))
        {
            if(GetPlayerWeapon(playerid) != 33) // rifle kickuje, wyłaczam i ez
            {
                // okomoskwy.cs
                if(PlayerAC[playerid][acWarn_ZoomHack] >= AC_MAX_ZOOMHACK_WARNS)
                {
                    OnCheatDetected(playerid, "", 0, 71);
                }
            }
            PlayerAC[playerid][acWarn_ZoomHack]++;
            PlayerAC[playerid][acLastWarn_ZoomHack] = gettime()+AC_RESET_TIME;
            return 1;
        }
        if(PlayerAC[playerid][acLastWarn_Aimbot] <= gettime() && PlayerAC[playerid][acLastWarn_Aimbot] != 0) // reset timera + warningów
        {
            PlayerAC[playerid][acLastWarn_Aimbot] = 0;
            PlayerAC[playerid][acWarn_Aimbot] = 0;
        }
        
        new Float:diff = abs_f(abs_f(PlayerAC[playerid][acAim_lastAimZ])-abs_f(aimData[PR_aimZ])); // kalkulacja róznicy w celowaniu
        if(diff > 0)
        {
            for (new i = 9; i > 0; i--) {
                PlayerAC[playerid][acAim_meanAim][i] = PlayerAC[playerid][acAim_meanAim][i-1];
            }
            PlayerAC[playerid][acAim_meanAim][0] = diff;
            new Float:sum = 0.0;
            for (new i = 0; i < 10; i++) {
                sum += PlayerAC[playerid][acAim_meanAim][i];
            }
            new Float:mean = sum / 10.0;
        
            if(mean > 0 && mean <= 0.0009)
            {
                if(!IsPlayerAimingEx(playerid) && GetPlayerWeapon(playerid) <= 18) return 1; // gracz nie celuje, nie wykonuje kodu (prawdopodobny fix do camhunta (?))
                if(mean < 0.00000005) return 1; // jakieś bugi
                if(PlayerAC[playerid][acWarn_Aimbot] >= AC_MAX_AIMBOT_WARNS)
                {
                    printf("%d - %s aimbot (mean test confident) - mean: %.10f", playerid, GetNick(playerid), mean);
                    //SendClientMessageToAll(COLOR_WHITE, sprintf("%d - %s aimbot (mean test confident) - mean: %.10f", playerid, GetNick(playerid), mean));
                    OnCheatDetected(playerid, "", 0, 70); // wywołanie funkcji AC
                    return 1;
                }
                PlayerAC[playerid][acWarn_Aimbot]++;

                if(PlayerAC[playerid][acLastWarn_Aimbot] == 0) PlayerAC[playerid][acLastWarn_Aimbot] = gettime()+20; // aktualizacja timera tylko gdy timer nie jest aktywny
            }
        }  
        PlayerAC[playerid][acAim_lastAimZ] = aimData[PR_aimZ];
    }

    // ----------- < Fix Aim Z > ----------- //
    if (aimData[PR_aimZ] != aimData[PR_aimZ]) // is NaN
    {
        aimData[PR_aimZ] = 0.0;

        BS_SetWriteOffset(bs, 8);
        BS_WriteAimSync(bs, aimData); // rewrite
    }
    return 1;
}

// ----------- < Anty Ammo/Weap Hack > ----------- //
IPacket:WEAPONS_UPDATE_SYNC(playerid, BitStream:bs)
{
    new weaponsUpdate[PR_WeaponsUpdate];
    BS_IgnoreBits(bs, 8);
    BS_ReadWeaponsUpdate(bs, weaponsUpdate); // zbieranie informacji o update broni i zapisywanie zaaktualizowanych broni do tablicy

    if(GetPVarInt(playerid, "CheatDetected") == 1) return 1; // poprawka do zdublowanego zapisywania starych wartości broni 

    for(new i = 0; i<13; i++) 
    {
        if(weaponsUpdate[PR_slotWeaponId][i] != 46 && weaponsUpdate[PR_slotWeaponId][i] != 40 && weaponsUpdate[PR_slotWeaponId][i] != 43) // detonator i spadochron jest nadawany przez samp - ominięcie AC // camera też bo coś sie rozjebało
        {
            if(rgRakNet_PlayerWeapons[playerid][i][0] < weaponsUpdate[PR_slotWeaponId][i]) // jeżeli wartość z tablicy nie zgadza się z tablicą zaaktualizowaną
            {
                if(rgAllowPlayerPacket[playerid][WEAPONS_UPDATE_SYNC] == 1) rgRakNet_PlayerWeapons[playerid][i][0] = weaponsUpdate[PR_slotWeaponId][i]; // akceptowanie zmiany broni gdy wywołane przez customową funkcję
                else 
				{
					rgRakNet_SaveWeapons[playerid] = 1;
					OnCheatDetected(playerid, "", 0, 59); // wywoływanie funckji AC
				}
            }
            else 
            {
                if(weaponsUpdate[PR_slotWeaponId][i] != 0) rgRakNet_PlayerWeapons[playerid][i][0] = weaponsUpdate[PR_slotWeaponId][i];
            }
    
            if(rgRakNet_PlayerWeapons[playerid][i][1] < weaponsUpdate[PR_slotWeaponAmmo][i]) // jeżeli wartość z tablicy nie zgadza się z tablicą zaaktualizowaną
            {
               if(rgAllowPlayerPacket[playerid][WEAPONS_UPDATE_SYNC] == 1) rgRakNet_PlayerWeapons[playerid][i][1] = weaponsUpdate[PR_slotWeaponAmmo][i]; // akceptowanie zmiany broni gdy wywołane przez customową funkcję
               else 
			   {
				   rgRakNet_SaveWeapons[playerid] = 1;
				   OnCheatDetected(playerid, "", 0, 60); // wywoływanie funckji AC
			   }
            }
            else 
            {
                if(weaponsUpdate[PR_slotWeaponAmmo][i] != 0) rgRakNet_PlayerWeapons[playerid][i][1] = weaponsUpdate[PR_slotWeaponAmmo][i];
            }
        }
    }
    return 1;
}

public OnIncomingPacket(playerid, packetid, BitStream:bs)
{
    if (packetid == PLAYER_SYNC)
    {
        new onFootData[PR_OnFootSync];

        BS_IgnoreBits(bs, 8); // ignore packetid (byte)
        BS_ReadOnFootSync(bs, onFootData);

        // ----------- < Fix Player Sync > ----------- //
        if (onFootData[PR_surfingVehicleId] != 0 &&
            onFootData[PR_surfingVehicleId] != INVALID_VEHICLE_ID
        ) {
            if ((floatabs(onFootData[PR_surfingOffsets][0]) >= 50.0) ||
                (floatabs(onFootData[PR_surfingOffsets][1]) >= 50.0) ||
                (floatabs(onFootData[PR_surfingOffsets][2]) >= 50.0)
            ) {
                onFootData[PR_surfingOffsets][0] = onFootData[PR_surfingOffsets][1] = onFootData[PR_surfingOffsets][2] = 0.0;

                BS_SetWriteOffset(bs, 8);
                BS_WriteOnFootSync(bs, onFootData); // rewrite
            } 
        }
    }
	// ----------- < Anty Upside Down > ----------- //
	if(packetid == 0xCF)
    {
        new Float:OPTUD_w, Float:OPTUD_x, Float:OPTUD_y, Float:OPTUD_z;
        
        BS_SetReadOffset(bs, 0x98);
        
        BS_ReadValue(
            bs,
            PR_FLOAT, OPTUD_w,
            PR_FLOAT, OPTUD_x,
            PR_FLOAT, OPTUD_y,
            PR_FLOAT, OPTUD_z
        );
            
        BS_ResetReadPointer(bs);
            
        new const Float:OPTUD_angle = atan2(2 * ((OPTUD_y * OPTUD_z) + (OPTUD_w * OPTUD_x)), (OPTUD_w * OPTUD_w) - (OPTUD_x * OPTUD_x) - (OPTUD_y * OPTUD_y) + (OPTUD_z * OPTUD_z));
        
        if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_NONE) 
        {
            if((OPTUD_angle > 85.0 || OPTUD_angle < -85.0) && OPTUD_angle == OPTUD_angle)
            {
                if(gettime() > ARQ_callback[playerid])
                {
                    ARQ_callback[playerid] = gettime();
					OnCheatDetected(playerid, "", 0, 62);
                }
            }
        }
    }
    return 1;
}

public OnIncomingRPC(playerid, rpcid, BitStream:bs)
{
    if(rpcid == 164)
    {
        new
            wVehicleID,
            ModelID,
            Float:X,
            Float:Y,
            Float:Z,
            Float:Angle,
            InteriorColor1,
            InteriorColor2,
            Float:Health,
            interior,
            DoorDamageStatus,
            PanelDamageStatus,
            LightDamageStatus,
            tireDamageStatus,
            addsiren,
            modslot0,
            modslot1,
            modslot2,
            modslot3,
            modslot4,
            modslot5,
            modslot6,
            modslot7,
            modslot8,
            modslot9,
            modslot10,
            modslot11,
            modslot12,
            modslot13,
            PaintJob,
            BodyColor1,
            BodyColor2;

        BS_ReadValue(
            bs,
            PR_INT16, wVehicleID,
            PR_INT32, ModelID,
            PR_FLOAT, X,
            PR_FLOAT, Y,
            PR_FLOAT, Z,
            PR_FLOAT, Angle,
            PR_INT8, InteriorColor1,
            PR_INT8, InteriorColor2,
            PR_FLOAT, Health,
            PR_INT8, interior,
            PR_INT32, DoorDamageStatus,
            PR_INT32, PanelDamageStatus,
            PR_INT8, LightDamageStatus,
            PR_INT8, tireDamageStatus,
            PR_INT8, addsiren,
            PR_INT8, modslot0,
            PR_INT8, modslot1,
            PR_INT8, modslot2,
            PR_INT8, modslot3,
            PR_INT8, modslot4,
            PR_INT8, modslot5,
            PR_INT8, modslot6,
            PR_INT8, modslot7,
            PR_INT8, modslot8,
            PR_INT8, modslot9,
            PR_INT8, modslot10,
            PR_INT8, modslot11,
            PR_INT8, modslot12,
            PR_INT8, modslot13,
            PR_INT8, PaintJob,
            PR_INT32, BodyColor1,
            PR_INT32, BodyColor2
        );

        printf("INCOMING playerid %d\n\
        vehicleid %d\n\
        modelid %d\n", playerid, wVehicleID, ModelID);
    }
    return 1;
}

ORPC:RPC_SET_VEHICLE_HEALTH(playerid, BitStream:bs)
{
    new vehicleid;
    BS_ReadInt16(bs, vehicleid); // zbieranie z bitstreamu id pojazdu
    if(vehicleid != INVALID_VEHICLE_ID)  // anty fake vehicleid
    {
        new Float:health;
        GetVehicleHealth(vehicleid, Float:health); // zbieranie hp pojazdu
        if(rgAllowVehicleRPC[vehicleid][RPC_SET_VEHICLE_HEALTH] == 0 && health > 300) // jezeli nie została wywołana prawdziwa funkcja SetVehicleHealth i HP pojazdu jest powyżej 300 (ze względu na bugi sampa)
        {
            if(rgRakNet_VehicleDriver[vehicleid] == INVALID_PLAYER_ID) // szukanie kierowcy jeżeli nie został jeszcze przypisany
            {
                for(new i = 0; i<MAX_PLAYERS; i++)
                {
                    if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER) // szukanie kierowcy
                    {
                        rgRakNet_VehicleDriver[vehicleid] = i; // dodawanie id kierowcy do tablicy
                    }
                }
            }

            if(rgRakNet_VehicleDriver[vehicleid] != INVALID_PLAYER_ID) 
            {
                if(IsPlayerConnected(rgRakNet_VehicleDriver[vehicleid]))
                {   
                    new Float:x, Float:y, Float:z;
                    GetPlayerPos(rgRakNet_VehicleDriver[vehicleid], x, y, z);
                    SetPlayerPos(rgRakNet_VehicleDriver[vehicleid], x, y, z+1);
                    ClearAnimations(rgRakNet_VehicleDriver[vehicleid], 1); // wyrzucenie z pojazdu poprzez czyszczenie animacji
                    if(GetPVarInt(playerid, "CheatDetected") == 1) return 0;
                    OnCheatDetected(rgRakNet_VehicleDriver[vehicleid], "", 0, 58); // wywołanie funkcji AC
                    return 0;
                }
            }
            
        }
    }
    return 1;
}

// ----------- < Anty Slapper > ----------- //
IPacket:PLAYER_SYNC(playerid, BitStream:bs)
{
    new onFootData[PR_OnFootSync];

	// Skip the packet id
    BS_IgnoreBits(bs, 8);
    BS_ReadOnFootSync(bs, onFootData);
    
    new Float:currentVelocity = floatsqroot(floatabs(floatpower(onFootData[PR_velocity][0] + onFootData[PR_velocity][1] + onFootData[PR_velocity][2], 2)));
	new Float:velocityChange = floatabs(currentVelocity - lastVelocityAmount[playerid]);
	
	lastVelocityAmount[playerid] = currentVelocity;

	packetCounter[playerid] = packetCounter[playerid] + 1;

	// If acceleration is more than maximum add one warning.
	if(velocityChange > MAX_VELOCITY_CHANGE && packetWarningCounter[playerid] < MAX_WARNINGS)
	{
		packetWarningCounter[playerid] = packetWarningCounter[playerid] + 1;
	}

	if(packetWarningCounter[playerid] >= MAX_WARNINGS)
	{
		packetWarningCounter[playerid] = 0;
		//Action to do when detected
        OnCheatDetected(playerid, "", 0, 61); // wywołanie funkcji AC
		// -------
		return 0;
	}
	
	// Reset counter after maximum value.
	if(packetCounter[playerid] > PACKETS_TO_COUNT)
	{
	    packetCounter[playerid] = 0;
	    packetWarningCounter[playerid] = 0;
	}

    return 1;
}

stock Float:AC_GetDistanceBetweenPlayers(p1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2))
	{
		return -1.00;
	}
	GetPlayerPos(p1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid))
	{
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

IPacket:BULLET_SYNC(playerid, BitStream:bs)
{
    new bulletData[PR_BulletSync];
    BS_IgnoreBits(bs, 8);
    BS_ReadBulletSync(bs, bulletData);

    // printf(
    //    "BULLET_SYNC[%d]:\nhitType %d \nhitId %d \norigin %.2f %.2f %.2f \nhitPos %.2f %.2f %.2f \noffsets %.2f %.2f %.2f \nweaponId %d",
    //    playerid,
    //    bulletData[PR_hitType],
    //    bulletData[PR_hitId],
    //    bulletData[PR_origin][0],
    //    bulletData[PR_origin][1],
    //    bulletData[PR_origin][2],
    //    bulletData[PR_hitPos][0],
    //    bulletData[PR_hitPos][1],
    //    bulletData[PR_hitPos][2],
    //    bulletData[PR_offsets][0],
    //    bulletData[PR_offsets][1],
    //    bulletData[PR_offsets][2],
    //    bulletData[PR_weaponId]
    //);
    if(bulletData[PR_weaponId] == WEAPON_MINIGUN) return 1;
    if(bulletData[PR_hitType] == 1)
    {
        PlayerAC[playerid][acNoSpread_lastHitPos][0] = bulletData[PR_hitPos][0];
        PlayerAC[playerid][acNoSpread_lastHitPos][1] = bulletData[PR_hitPos][1];
        PlayerAC[playerid][acNoSpread_lastHitPos][2] = bulletData[PR_hitPos][2];

        if(bulletData[PR_hitId] != INVALID_PLAYER_ID)
        {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(bulletData[PR_hitId], x, y, z);
            if(x == bulletData[PR_hitPos][0] && y == bulletData[PR_hitPos][1] && z == bulletData[PR_hitPos][2] && bulletData[PR_hitPos][2] != 0)
            {
                PlayerAC[playerid][acWarn_SilentAim]++;
                if(PlayerAC[playerid][acWarn_SilentAim] >= AC_MAX_SILENT_WARNS)
                {
                    printf("%d - silent aim (1)", playerid);
                    OnCheatDetected(playerid, "", 0, 68); // wywołanie funkcji AC
                }
                return 0;
            }
            
            if(PlayerAC[playerid][acLastWarn_SilentAim2] <= gettime() && PlayerAC[playerid][acLastWarn_SilentAim2] != 0)
            {
                PlayerAC[playerid][acLastWarn_SilentAim2] = 0;
                PlayerAC[playerid][acWarn_SilentAim2] = 0;
            }

            if(IsPlayerAimingEx(playerid))
            {
                new Float:ax, Float:ay;
                GetXYInFrontOfPlayer(playerid, ax, ay, AC_GetDistanceBetweenPlayers(playerid, bulletData[PR_hitId]));
                if(abs_f(ax-x) > 4 || abs_f(ay-y) > 4)
                {
                    if(PlayerAC[playerid][acWarn_SilentAim2] >= AC_MAX_SILENT2_WARNS)
                    {
                        printf("%d - silent aim (2)", playerid);
                        return OnCheatDetected(playerid, "", 0, 73); // wywołanie funkcji AC
                    }

                    PlayerAC[playerid][acWarn_SilentAim2]++;
                    if(PlayerAC[playerid][acLastWarn_SilentAim2] == 0) PlayerAC[playerid][acLastWarn_SilentAim2] = gettime()+AC_RESET_TIME;
                    return 0;
                }
            }

            if(PlayerAC[playerid][acLastWarn_NoSpread] <= gettime() && PlayerAC[playerid][acLastWarn_NoSpread] != 0)
            {
                PlayerAC[playerid][acLastWarn_NoSpread] = 0;
                PlayerAC[playerid][acWarn_NoSpread] = 0;
            }

            if(GetPlayerCameraMode(playerid) != 53) return 1; // aiming with gun

            if(bulletData[PR_offsets][0] != 0)
            {
                new Float:dist = AC_GetDistanceBetweenPlayers(playerid, bulletData[PR_hitId]);
                if((abs_f(PlayerAC[playerid][acNoSpread_lastOffsets][0])-abs_f(bulletData[PR_offsets][0]) <= 0.01 && abs_f(PlayerAC[playerid][acNoSpread_lastOffsets][0])-abs_f(bulletData[PR_offsets][0]) >= -0.01)
                || (abs_f(PlayerAC[playerid][acNoSpread_lastOffsets][1])-abs_f(bulletData[PR_offsets][1]) <= 0.01 && abs_f(PlayerAC[playerid][acNoSpread_lastOffsets][1])-abs_f(bulletData[PR_offsets][1]) >= -0.01)
                || (abs_f(PlayerAC[playerid][acNoSpread_lastOffsets][2])-abs_f(bulletData[PR_offsets][0]) <= 0.01 && abs_f(PlayerAC[playerid][acNoSpread_lastOffsets][2])-abs_f(bulletData[PR_offsets][2]) >= -0.01))
                {
                    if(dist < 4) return 1;
                    else if(dist < 10)
                    {
                        if(PlayerAC[playerid][acWarn_NoSpread] >= AC_MAX_NOSPREAD2_WARNS+4)
                        {
                            printf("%d nospread (low dist) - dist: %.2f", playerid, dist);
                            OnCheatDetected(playerid, "", 0, 69); // wywołanie funkcji AC
                        }
                    } 
                    else 
                    {
                        if(PlayerAC[playerid][acWarn_NoSpread] >= AC_MAX_NOSPREAD2_WARNS)
                        {
                            printf("%d nospread (high dist) - dist: %.2f", playerid, dist);
                            OnCheatDetected(playerid, "", 0, 69); // wywołanie funkcji AC
                        }
                    }
                    PlayerAC[playerid][acWarn_NoSpread]++;
                    if(PlayerAC[playerid][acLastWarn_NoSpread] == 0) PlayerAC[playerid][acLastWarn_NoSpread] = gettime()+AC_RESET_TIME;
                    return 0;
                }
                //printf("%f == %f || %f == %f || %f == %f", PlayerAC[playerid][acNoSpread_lastOffsets][0], bulletData[PR_offsets][0], PlayerAC[playerid][acNoSpread_lastOffsets][1], bulletData[PR_offsets][1], PlayerAC[playerid][acNoSpread_lastOffsets][2], bulletData[PR_offsets][2]);
                if(PlayerAC[playerid][acNoSpread_lastOffsets][0] == bulletData[PR_offsets][0] || PlayerAC[playerid][acNoSpread_lastOffsets][1] == bulletData[PR_offsets][1] || PlayerAC[playerid][acNoSpread_lastOffsets][2] == bulletData[PR_offsets][2])
                {
                   
                    if(dist < 4) return 1;
                    else if(dist < 10)
                    {
                        if(PlayerAC[playerid][acWarn_NoSpread] >= AC_MAX_NOSPREAD2_WARNS+8)
                        {
                            printf("%d - no spread (2) (low dist)", playerid);
                            OnCheatDetected(playerid, "", 0, 69); // wywołanie funkcji AC
                        }
                    }
                    else
                    { 
                        if(PlayerAC[playerid][acWarn_NoSpread] >= AC_MAX_NOSPREAD_WARNS)
                        {
                            printf("%d - no spread (2) (high dist)", playerid);
                            OnCheatDetected(playerid, "", 0, 69); // wywołanie funkcji AC
                        }
                    }
                    if(PlayerAC[playerid][acLastWarn_NoSpread] == 0) PlayerAC[playerid][acLastWarn_NoSpread] = gettime()+AC_RESET_TIME;
                    PlayerAC[playerid][acWarn_NoSpread]++;
                    return 0;
                }
            }
        }
    }

    if(GetPlayerCameraMode(playerid) != 53) return 1; // aiming with gun
    if(bulletData[PR_offsets][0] != 0)
    {
        if( PlayerAC[playerid][acNoSpread_lastOffsets][0] == bulletData[PR_offsets][0] &&
            PlayerAC[playerid][acNoSpread_lastOffsets][1] == bulletData[PR_offsets][1] &&
            PlayerAC[playerid][acNoSpread_lastOffsets][2] == bulletData[PR_offsets][2])
        {
            PlayerAC[playerid][acWarn_NoSpread]++;
            if(PlayerAC[playerid][acWarn_NoSpread] >= AC_MAX_NOSPREAD_WARNS)
            {
                printf("%d - no spread (1)", playerid);
                OnCheatDetected(playerid, "", 0, 69); // wywołanie funkcji AC
            }
            if(PlayerAC[playerid][acLastWarn_NoSpread] == 0) PlayerAC[playerid][acLastWarn_NoSpread] = gettime()+AC_RESET_TIME;
            return 0;
        }
        PlayerAC[playerid][acNoSpread_lastOffsets][0] = bulletData[PR_offsets][0];
        PlayerAC[playerid][acNoSpread_lastOffsets][1] = bulletData[PR_offsets][1];
        PlayerAC[playerid][acNoSpread_lastOffsets][2] = bulletData[PR_offsets][2];
    }
    return 1;
}

public TogglePlayerRPC(playerid, rpc, toggle)
{
    rgAllowPlayerRPC[playerid][rpc] = toggle;
    return 1;
}

public ToggleVehicleRPC(vehicleid, rpc, toggle)
{
    rgAllowVehicleRPC[vehicleid][rpc] = toggle;
    rgRakNet_VehicleDriver[vehicleid] = INVALID_PLAYER_ID;
    return 1;
}

public TogglePlayerPacket(playerid, packet, toggle)
{
    rgAllowPlayerPacket[playerid][packet] = toggle;
    return 1;
}

stock CheckDriver(vehicleid)
{
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, vehicleid))
			{
				if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
				{
					return i;
				}
			}
		}
	}
	return INVALID_PLAYER_ID;
}

public RestoreOldWeapons(playerid, UID)
{
	new query[1024];
	format(query, sizeof(query), 
		"UPDATE `mru_konta` SET \
		`Gun0` = '%d', `Ammo0` = '%d', \
		`Gun1` = '%d', `Ammo1` = '%d', \
		`Gun2` = '%d', `Ammo2` = '%d', \
		`Gun3` = '%d', `Ammo3` = '%d', \
		`Gun4` = '%d', `Ammo4` = '%d', \
		`Gun5` = '%d', `Ammo5` = '%d', \
		`Gun6` = '%d', `Ammo6` = '%d', \
		`Gun7` = '%d', `Ammo7` = '%d', \
		`Gun8` = '%d', `Ammo8` = '%d', \
		`Gun9` = '%d', `Ammo9` = '%d', \
		`Gun10`= '%d', `Ammo10`= '%d', \
		`Gun11`= '%d', `Ammo11`= '%d', \
		`Gun12`= '%d', `Ammo12`= '%d'  \
		WHERE `UID` = '%d'",
		rgRakNet_PlayerWeapons[playerid][0][0], rgRakNet_PlayerWeapons[playerid][0][1],
		rgRakNet_PlayerWeapons[playerid][1][0], rgRakNet_PlayerWeapons[playerid][1][1],
		rgRakNet_PlayerWeapons[playerid][2][0], rgRakNet_PlayerWeapons[playerid][2][1],
		rgRakNet_PlayerWeapons[playerid][3][0], rgRakNet_PlayerWeapons[playerid][3][1],
		rgRakNet_PlayerWeapons[playerid][4][0], rgRakNet_PlayerWeapons[playerid][4][1],
		rgRakNet_PlayerWeapons[playerid][5][0], rgRakNet_PlayerWeapons[playerid][5][1],
		rgRakNet_PlayerWeapons[playerid][6][0], rgRakNet_PlayerWeapons[playerid][6][1],
		rgRakNet_PlayerWeapons[playerid][7][0], rgRakNet_PlayerWeapons[playerid][7][1],
		rgRakNet_PlayerWeapons[playerid][8][0], rgRakNet_PlayerWeapons[playerid][8][1],
		rgRakNet_PlayerWeapons[playerid][9][0], rgRakNet_PlayerWeapons[playerid][9][1],
		rgRakNet_PlayerWeapons[playerid][10][0], rgRakNet_PlayerWeapons[playerid][10][1],
		rgRakNet_PlayerWeapons[playerid][11][0], rgRakNet_PlayerWeapons[playerid][11][1],
		rgRakNet_PlayerWeapons[playerid][12][0], rgRakNet_PlayerWeapons[playerid][12][1],
        UID);

	mysql_query(Database, query);
	return 1;
}

// ----------- < Anty Fake Wanted Level > ----------- //
AntyFakeWL(playerid, killerid)
{
    // return 0;
	if(PlayerAC[playerid][acWarn_FakeWL] >= 1)
	{
		OnCheatDetected(playerid, "", 1, 56);
		return 1;
	}
	if(AC_GetDistanceBetweenPlayers(playerid, killerid) > 500)
	{
		PlayerAC[playerid][acWarn_FakeWL]++;
		return 1;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
	{
		PlayerAC[playerid][acWarn_FakeWL]++;
		return 1;
	}
	if(TutTime[playerid] > 0 && TutTime[playerid] < 114)
	{
		OnCheatDetected(playerid, "", 1, 56);
		return 1;
	}
	if(gPlayerLogged[playerid] == 0)
	{
		OnCheatDetected(playerid, "", 1, 56);
		return 1;
	}
	return 0;
}

// ----------- < Anty Fake Kill > ----------- //
public OnPlayerFakeKill2(playerid, spoofedid, spoofedreason, faketype)
{
	new string[128];
	if(faketype == 2)
	{
		format(string, sizeof(string), "[FakeKill] %s[%d] użył fake killa na %s[%d], reason: %d", GetNick(playerid), playerid, GetNick(spoofedid), spoofedid, spoofedreason);
		SendCommandLogMessage(string);
		OnCheatDetected(playerid, "", 1, 57);
	}
	else
	{
		format(string, sizeof(string), "[FakeKill] %s[%d] prawdopodobnie użył fake killa na %s[%d], reason: %d", GetNick(playerid), playerid, GetNick(spoofedid), spoofedid, spoofedreason);
		SendCommandLogMessage(string);
	}
}

// ----------- < Anty SpeedHack > ----------- //
stock GetPlayerSpeed(playerid)
{
	new Float:ST[4];
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid), ST[0], ST[1], ST[2]);
	else GetPlayerVelocity(playerid, ST[0], ST[1], ST[2]);
	ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
	return floatround(ST[3]);
}

stock IsPlayerFalling(playerid)
{
    new Float:z, Float:zv, Float:unused;
    GetPlayerPos(playerid, unused, unused, z);
    GetPlayerVelocity(playerid, unused, unused, zv);
    if(z < PlayerAC[playerid][acPos][2] && zv < -0.3) return true;
    return false;
}

stock abs(int) 
{
	if(int < 0) {
		return -int;
	}
	return int;
}

public Float:abs_f(Float:float) 
{
    if(float < 0) {
        return Float:-float;
    }
    return Float:float;
}

public Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
{
    return VectorSize(x1-x2, y1-y2, z1-z2);
}

public SetACCode(playerid, code, toggle)
{
    EnableAntiCheatForPlayer(playerid, code, toggle);
}


// ----------- < Anty VPN > ----------- //
// Anty VPN with multiple services

VPNPrepare(playerid)
{
    if(!VPNTurnedOn) return 1;
    if(PlayerAC[playerid][acVPN_count] >= sizeof(VPNServices)) return 1;

    new ip[16], name[MAX_PLAYER_NAME + 1], string[256];

    GetPlayerIp(playerid, ip, sizeof ip);
    GetPlayerName(playerid, name, sizeof(name));

    if(!strcmp(ip, "127.0.0.1",true)) return 1;

    format(string, sizeof(string), "%s%s%s&name=%s", VPNServices[PlayerAC[playerid][acVPN_count]][0], ip, VPNServices[PlayerAC[playerid][acVPN_count]][1], name);
    printf("%s", string);
    HTTP(playerid, HTTP_GET, string, "", "VPNCheck");
    return 1;
}

public VPNCheck(playerid, response_code, data[])
{
    new name[MAX_PLAYER_NAME + 1], ip[16];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerIp(playerid, ip, sizeof(ip));

    if(response_code == 200)
    {
        if(strcmp(data, "allowed", true) == 0) return 1;
        if(strfind(data, "1", true) != -1)
        {
            if(PlayerAC[playerid][acVPN_count] == 0) printf("[VPN INFO] %s[%d] - %s found in local database.", name, playerid, ip);
            else VPNAddIP(playerid, ip);
            VPNKick(playerid, name, ip);
        }
        else if(strfind(data, "-2", true) != -1)
        {
            printf("[VPN ERROR] Error! Request for %s[%d], response: %s (%d)", name, playerid, data, response_code);
            PlayerAC[playerid][acVPN_count]++;
            VPNPrepare(playerid);
        }
        else
        {
            if(PlayerAC[playerid][acVPN_count] == 0)
            {
                PlayerAC[playerid][acVPN_count]++;
                VPNPrepare(playerid);
            }
        }
    }
    else
    {
        printf("[VPN ERROR] Error! Request for %s[%d], response: %s (%d)", name, playerid, data, response_code);
        PlayerAC[playerid][acVPN_count]++;
        VPNPrepare(playerid);
    }
    return 1;
}

VPNKick(playerid, name[], ip[])
{
    new string[128];
    format(string, sizeof(string), "[VPN WYKRYTY - %d] %s[%d] zostal wyrzucony z powodu posiadania VPN/proxy.", PlayerAC[playerid][acVPN_count], name, playerid);
	printf("%s", string);
    format(string, sizeof(string), "banip %s", ip);
    SendRconCommand(string);

    SendClientMessage(playerid, 0xFF0000FF, "Używanie VPN'a na serwerze jest zabronione! Zostajesz skickowany.");
    CallLocalFunction("KickEx", "i", playerid);
}

VPNAddIP(playerid, ip[])
{
    new string[128];
    format(string, sizeof(string), AC_VPN_IP "/vpn/vpn.php?add=%s", ip);
    HTTP(playerid, HTTP_GET, string, "", "VPNNullResponse");
    return 1;
}

public VPNNullResponse(playerid, response_code, data[])
{
    return 1;
}

public VPNPanel(playerid, response_code, data[])
{
    if(response_code == 200)
    {
        new string[256];
        format(string, sizeof(string), "» VPN: %s\n» Dodaj wyjątek\n» Przeładuj listę (OSTROŻNIE)\n» Pozostało zapytań: %s", (VPNTurnedOn == 1 ? "ON" : "OFF"), data);
        ShowPlayerDialogEx(playerid, DIALOG_AC_VPN, DIALOG_STYLE_LIST, "Panel VPN", string, "Wybierz", "Anuluj");
    }
    else
    {
        printf("[VPN PANEL] %s[%d] probowal otworzyc panel VPN, ale wystapil blad: %s [%d]",GetNick(playerid), playerid, data, response_code);
        sendErrorMessage(playerid, "Nie można otworzyć panelu VPN!");
    }
    return 1;
}

public VPNLoadState(playerid, response_code, data[])
{
    if(response_code == 200)
    {
        VPNTurnedOn = strval(data);
    }
    else VPNTurnedOn = 0;
}
//end