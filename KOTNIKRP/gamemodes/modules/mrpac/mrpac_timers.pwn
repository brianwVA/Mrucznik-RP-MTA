//-----------------------------------------------<< Timers >>------------------------------------------------//
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

//-----------------<[ Timery: ]>-------------------
ptask CheckAccelerate[100](playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	if(!IsPlayerConnected(playerid)) return 1;
	if(!gPlayerLogged[playerid]) return 1;
	if(IsPlayerConnected(playerid))
	{
		if(PlayerAC[playerid][acLastWarn_SpeedHack] <= gettime() && PlayerAC[playerid][acLastWarn_SpeedHack] != 0)
		{
			PlayerAC[playerid][acWarn_SpeedHack] = 0;
			PlayerAC[playerid][acLastWarn_SpeedHack] = 0;
		}
		switch(GetPlayerState(playerid))
		{
			case PLAYER_STATE_DRIVER:
			{
				if(NetStats_PacketLossPercent(playerid) >= 5.0 || GetPlayerPing(playerid) >= 250 || GetServerTickRate() < 50) 
				{
					return 1;
				}
				if(PlayerAC[playerid][acSpeed_lastSpeed]+AC_MAX_VEH_ACCELERATE <= GetPlayerSpeed(playerid) && !IsPlayerFalling(playerid))
				{
					PlayerAC[playerid][acWarn_SpeedHack]++;
					if(PlayerAC[playerid][acWarn_SpeedHack] >= AC_MAX_SH_VEH_WARNS)
					{
						OnCheatDetected(playerid, "", 0, 63);
					}
					PlayerAC[playerid][acLastWarn_SpeedHack] = gettime()+AC_RESET_TIME;
				}
			}
			case PLAYER_STATE_ONFOOT:
			{
                if(GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && !IsPlayerFalling(playerid))
                {
                    new speed = GetPlayerSpeed(playerid);
	                new index = GetPlayerAnimationIndex(playerid);
                    new weapon = GetPlayerWeapon(playerid);
                    // ----------- < Anty Slide Bug > ----------- //
	                if(index >= 1160 && index <= 1163 && speed > 23 && weapon >= 22 && weapon <= 38) 
	                {
	                	PlayerAC[playerid][acWarn_Slide]++;
	                	if(PlayerAC[playerid][acWarn_Slide] >= 5)
	                	{
	                		new Float:x, Float:y, Float:z;
	                		GetPlayerPos(playerid, x, y, z);
	                		ClearAnimations(playerid, 1);
	                		SetPlayerPos(playerid, x, y, z+0.4);
	                		PlayerAC[playerid][acWarn_Slide] = 0;
	                	}
	                }
					if(NetStats_PacketLossPercent(playerid) >= 5.0 || GetPlayerPing(playerid) >= 250 || GetServerTickRate() < 50) 
					{
						return 1;
					}
                    // ----------- < Anty On Foot Speed > ----------- //
                    if((index >= 1158 && index <= 1161) || // crouching with gun
	                   (index >= 1224 && index <= 1236) || // running anims
	                   (index >= 1257 && index <= 1273) || // male animations
	                   (index >= 1276 && index <= 1287))   // female animations
	                {
	                	new maxspeed = 40;
	                	if(speed > maxspeed)
	                	{
	                		new diff = abs(speed-PlayerAC[playerid][acSpeed_lastSpeed]);
	                		if(diff <= 3)
	                		{
	                			PlayerAC[playerid][acWarn_SpeedHack]++;
	                			if(PlayerAC[playerid][acWarn_SpeedHack] >= AC_MAX_SH_ONFOOT_WARNS)
	                			{
	                				OnCheatDetected(playerid, "", 0, 64);
	                			}
                                PlayerAC[playerid][acLastWarn_SpeedHack] = gettime()+AC_RESET_TIME;
	                		}
	                	}
	                }
                    else
                    {
                        // ----------- < Other > ----------- //
				        if(speed >= AC_MAX_ONFOOT_SPEED)
				        {
				        	PlayerAC[playerid][acWarn_SpeedHack]++;
				        	if(PlayerAC[playerid][acWarn_SpeedHack] >= AC_MAX_SH_ONFOOT_WARNS)
				        	{
                                if(PlayerInfo[playerid][pAdmin] == 0 && PlayerInfo[playerid][pNewAP] == 0) ClearAnimations(playerid);
                                if(PlayerAC[playerid][acWarn_SpeedHack] >= AC_MAX_SH_ONFOOT_WARNS+3)
                                {
				        		    OnCheatDetected(playerid, "", 0, 64);
                                }
				        	}
				        	PlayerAC[playerid][acLastWarn_SpeedHack] = gettime()+AC_RESET_TIME;
				        }
                    }
                }
				//printf("%d", GetPlayerSpeed(i));
			}
		}
		PlayerAC[playerid][acSpeed_lastSpeed] = GetPlayerSpeed(playerid);
		GetPlayerPos(playerid, PlayerAC[playerid][acPos][0], PlayerAC[playerid][acPos][1], PlayerAC[playerid][acPos][2]);
	}
	return 1;
}

ptask Check[1000](playerid)
{
	// Anty NameTag Wallhack
    if(IsPlayerConnected(playerid))
    {
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(playerid != i)
				{
					if(AC_GetDistanceBetweenPlayers(playerid, i) <= 70)
		        	{
						if(GetPVarInt(playerid, "tognick") == 0)
						{
		        	    	ShowPlayerNameTagForPlayer(playerid, i, true);
						}
		        	}
		        	else
		        	{
		        	    ShowPlayerNameTagForPlayer(playerid, i, false);
		        	}
				}
			}
		}

		// Anim Hacks
		new index = GetPlayerAnimationIndex(playerid);
        for(new j = 0; j < sizeof(BannedAnimations); j++)
        {
            if(index == BannedAnimations[j])
            {
                OnCheatDetected(playerid, "", 0, 66);
            }
        }
        if(index == 402) // Anti invis underground
        {
            OnCheatDetected(playerid, "", 0, 65);
        }

		//FlyHack
        if(GetSVarInt("CA_Initialized") == 1)
        {
            if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
            {
                if(PlayerAC[playerid][acLastWarn_FlyHack] <= gettime() && PlayerAC[playerid][acLastWarn_FlyHack] != 0)
		        {
		        	PlayerAC[playerid][acWarn_FlyHack] = 0;
		        	PlayerAC[playerid][acLastWarn_FlyHack] = 0;
		        }
                if(GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 0 && !IsPlayerFalling(playerid) && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID)
                {
                    new Float:x, Float:y, Float:z, Float:pos;
                    GetPlayerPos(playerid, x, y, z);
                    CA_FindZ_For2DCoord(x, y, pos);
                    //printf("%f %f %f", z, pos, pos+AC_MAX_HEIGHT);
                    if(z > pos+AC_MAX_HEIGHT)
                    {
                        PlayerAC[playerid][acWarn_FlyHack]++;
                        if(PlayerAC[playerid][acWarn_FlyHack] >= AC_MAX_HEIGHT_WARNS)
                        {
                            OnCheatDetected(playerid, "", 0, 67);
                        }
                        PlayerAC[playerid][acLastWarn_FlyHack] = gettime()+AC_RESET_TIME+AC_RESET_TIME;
                    }
                    GetPlayerPos(playerid, PlayerAC[playerid][acPos][0], PlayerAC[playerid][acPos][1], PlayerAC[playerid][acPos][2]);
                }
            }
        }
		//Anty No Fuel (engine cheat)
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new veh = GetPlayerVehicleID(playerid);
			if(veh != INVALID_VEHICLE_ID && !IsARower(veh) && !IsABike(veh) && !IsABoat(veh) && !IsAPlane(veh))
			{
				if(PlayerInfo[playerid][pAdmin] < 100)
				{
					new Float:carhp;
					GetVehicleHealth(veh, carhp);
					if(Car_IsValid(veh)) //gdy pojazd istnieje w bazie danych
					{
						if(!getEngineState(veh) && GetCarSpeed(veh) >= 40 && PlayerAC[playerid][acCarEngine_Tick] < gettime() && (Gas[veh] <= 3 || carhp <= 250.0))
						{
							PlayerAC[playerid][acLastWarn_NoFuel]++;
							if(PlayerAC[playerid][acLastWarn_NoFuel] == 1) 
								SendAdminMessage(COLOR_LIGHTRED, sprintf("%s [ID: %d] może jeździć bez odpalonego silnika, sprawdź to!", GetNick(playerid), playerid));
							else
								SendAdminMessage(COLOR_LIGHTRED, sprintf("%s [ID: %d] jeździ bez odpalonego silnika (%d/%d)", GetNick(playerid), playerid, PlayerAC[playerid][acLastWarn_NoFuel], AC_MAX_NOFUEL_WARNS+1));
							if(PlayerAC[playerid][acLastWarn_NoFuel] >= AC_MAX_NOFUEL_WARNS+1)
							{
								SendAdminMessage(COLOR_LIGHTRED, sprintf("%s [ID: %d] został wyrzucony za jazdę bez odpalonego silnika.", GetNick(playerid), playerid));
								OnCheatDetected(playerid, "", 0, 74);
							}
						}
					}
					else //gdy pojazd jest kradziony
					{
						if(!getEngineState(veh) && GetCarSpeed(veh) >= 30 && PlayerAC[playerid][acCarEngine_Tick] < gettime())
						{
							PlayerAC[playerid][acLastWarn_NoFuel]++;
							if(PlayerAC[playerid][acLastWarn_NoFuel] == 1) 
								SendAdminMessage(COLOR_LIGHTRED, sprintf("%s [ID: %d] może jeździć kradzionym pojazdem bez odpalonego silnika, sprawdź to!", GetNick(playerid), playerid));
							else
								SendAdminMessage(COLOR_LIGHTRED, sprintf("%s [ID: %d] jeździ kradzionym pojazdem bez odpalonego silnika (%d/%d)", GetNick(playerid), playerid, PlayerAC[playerid][acLastWarn_NoFuel], AC_MAX_NOFUEL_WARNS));
							if(PlayerAC[playerid][acLastWarn_NoFuel] >= AC_MAX_NOFUEL_WARNS)
							{
								SendAdminMessage(COLOR_LIGHTRED, sprintf("%s [ID: %d] został wyrzucony za jazdę bez odpalonego silnika kradzionym pojazdem.", GetNick(playerid), playerid));
								OnCheatDetected(playerid, "", 0, 74);
							}
						}
					}
				}
			}
		}
    }
}
