//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                praca_medyk                                                //
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
// Autor: PECET & mrucznik
// Data utworzenia: 16.10.2024
//Opis:
/*
	Praca medyka
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
public systempozarow_init()
{
	SetTimer("OnFire", 1000, 1);
}	

public EndSmoke(id)
{
	if(FireSmoke[id] == 1)
	{
		DestroyDynamicObject(SmokeObj[id]);
		FireSmoke[id] = 0;
	}
	return 1;
}

public systempozarow_OnPlayerUpdate(playerid, vehicleid)
{
	new weapon = GetPlayerWeapon(playerid);
	new bool:isFireTruckDriver = vehicleid != 0
		&& GetVehicleModel(vehicleid) == 407
		&& GetPlayerState(playerid) == PLAYER_STATE_DRIVER;
	if(weapon != 42 && !isFireTruckDriver && GetPVarInt(playerid, "firehose_on") != 1)
	{
		return 1;
	}

	new newkeys,l,u;
	GetPlayerKeys(playerid, newkeys, l, u);
	new i;
	if(Holding(KEY_FIRE))
	{
        if(weapon == 42)
        {
            for(i = 0; i<MaxFire; i++)
 	    	{
 	        	if(IsValidFire(i))
 	        	{
 	        	    if(PlayerFaces(playerid, FirePos[i][0],  FirePos[i][1],  FirePos[i][2]+2, 1) && IsPlayerInRangeOfPoint(playerid, 10, FirePos[i][0],  FirePos[i][1],  FirePos[i][2]))
 	        		{
			    		FireHealth[i]-=2;
						if(FireSmoke[i] == 0)
						{
							FireSmoke[i]=1;
							SmokeObj[i] = CreateDynamicObject(18716,  FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 0, 0, 0.0);
							SetTimerEx("EndSmoke", 500, false, "i", i);
						}
			    		if(FireHealth[i] <= 0 && TotalFires == 1)
			    		{
			    		    PozarUgaszony(i, playerid);
			    		}
					    if(FireHealth[i] <= 0 && TotalFires != 1)
					    {
							if(FireSmoke[i] == 1)
							{
								DestroyDynamicObject(SmokeObj[i]);
							}
							OgienUgaszony(playerid);
							DeleteFire(i);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
						}
					}
				}
			}
		}
		else if(isFireTruckDriver)
        {
            for(i = 0; i<MaxFire; i++)
 	    	{
 	        	if(IsValidFire(i))
 	        	{
 	        	    if(PlayerFaces(playerid, FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 5) && IsPlayerInRangeOfPoint(playerid, 20, FirePos[i][0],  FirePos[i][1],  FirePos[i][2]))
 	        		{
			    		FireHealth[i]-=1;
						if(FireSmoke[i] == 0)
						{
							FireSmoke[i]=1;
							SmokeObj[i] = CreateDynamicObject(18716,  FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 0, 0, 0.0);
							SetTimerEx("EndSmoke", 500, false, "i", i);
						}
			    		if(FireHealth[i] <= 0 && TotalFires == 1)
			    		{
			    		    PozarUgaszony(i, playerid);
			    		}
					    else if(FireHealth[i] <= 0)
					    {
							if(FireSmoke[i] == 1)
							{
								DestroyDynamicObject(SmokeObj[i]);
							}
							DeleteFire(i);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
						}
					}
				}
			}
		}
	}
	else if(Holding(KEY_HANDBRAKE))
	{
        if(GetPVarInt(playerid, "firehose_on") == 1)
        {
			
            for(i = 0; i<MaxFire; i++)
 	    	{
 	        	if(IsValidFire(i))
 	        	{
 	        	    if(PlayerFaces(playerid, FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 1) && IsPlayerInRangeOfPoint(playerid, 10, FirePos[i][0],  FirePos[i][1],  FirePos[i][2]))
 	        		{
			    		FireHealth[i]-=2;
						if(FireSmoke[i] == 0)
						{
							FireSmoke[i]=1;
							SmokeObj[i] = CreateDynamicObject(18716,  FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 0, 0, 0.0);
							SetTimerEx("EndSmoke", 500, false, "i", i);
						}
			    		if(FireHealth[i] <= 0 && TotalFires == 1)
			    		{
			    		    PozarUgaszony(i, playerid);
			    		}
					    else if(FireHealth[i] <= 0)
					    {
							if(FireSmoke[i] == 1)
							{
								DestroyDynamicObject(SmokeObj[i]);
							}
							DeleteFire(i);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
						}
					}
				}
			}
		}
	}
	return 1;
}

hook OnVehicleDeath(vehicleid, killerid)
{
	LastFireVehicles[vehicleid] = false;
	return 1;
}

public OnFire()
{
	// Read each streamed entity position once, then do the fire-distance checks
	// in Pawn.  The old fire -> all 2000 vehicle slots nesting crossed the
	// MTA compatibility bridge up to 160,000 times every second.
	foreach(new p : Player)
	{
		if(IsPlayerInAnyVehicle(p) || IsAFireman(p)) continue;

		new Float:px, Float:py, Float:pz;
		GetPlayerPos(p, px, py, pz);
		for(new i = 0; i < MaxFire; i++)
		{
			if(!IsValidFire(i)) continue;
			new Float:dx = px - FirePos[i][0];
			new Float:dy = py - FirePos[i][1];
			new Float:dz = pz - FirePos[i][2];
			if(dx*dx + dy*dy + dz*dz < 4.0)
			{
				new Float:HP;
				GetPlayerHealth(p, HP);
				SetPlayerHealth(p, HP-4);
				break;
			}
		}
	}

	foreach(new v : Vehicle)
	{
		if(GetVehicleModel(v) == 407) continue;

		new Float:vx, Float:vy, Float:vz;
		GetVehiclePos(v, vx, vy, vz);
		for(new i = 0; i < MaxFire; i++)
		{
			if(!IsValidFire(i)) continue;
			new Float:dx = vx - FirePos[i][0];
			new Float:dy = vy - FirePos[i][1];
			new Float:dz = vz - FirePos[i][2];
			if(dx*dx + dy*dy + dz*dz < 25.0)
			{
				new Float:HP;
				GetVehicleHealth(v, HP);
				SetVehicleHealth(v, HP-30);
				break;
			}
		}
	}
}

//end
