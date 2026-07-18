#include <a_samp>
#include <YSI_Coding\y_hooks>

#define Holding(%0) \
	((newkeys & (%0)) == (%0))
#define MaxFire 80
forward systempozarow_OnPlayerUpdate(playerid);
forward systempozarow_init();
forward OnFire();

public systempozarow_init()
{
		SetTimer("OnFire", 1000, 1);
}	


new
    FireObj[MaxFire],
    Float:FirePos[MaxFire][3],
	TotalFires = 0,
	FireHealth[MaxFire],
	FireHealthMax[MaxFire],
	//
	SmokeObj[MaxFire],
	FireSmoke[MaxFire];

stock AddFire(Float:x, Float:y, Float:z, Health)
{
    //TotalFires++;
	//new ID = TotalFires;
	//FireObj[ID] = CreateObject(18689, x, y, z, 0, 0, 0.0, 150.0);
	//FirePos[ID][0] = x, FirePos[ID][1] = y, FirePos[ID][2] = z;
	//FireHealth[ID] = Health;
	//FireHealthMax[ID] = Health;
	//FireSmoke[ID] = 0;
}
stock DeleteFire(ID)
{
	DestroyObject(FireObj[ID]);
	TotalFires--;
	FirePos[ID][0] = 0, FirePos[ID][1] = 0, FirePos[ID][2] = 0;
}
forward EndSmoke(id);
public EndSmoke(id)
{
	if(FireSmoke[id] == 1)
	{
		DestroyObject(SmokeObj[id]);
		FireSmoke[id] = 0;
	}
	return 1;
}
stock DeleteAllFire()
{
	new ID;
	for(ID = 0; ID<MaxFire; ID++)
	{
		DestroyObject(FireObj[ID]);
		TotalFires= 0;
		FirePos[ID][0] = 0, FirePos[ID][1] = 0, FirePos[ID][2] = 0;
	}
}
stock IsValidFire(ID)
{
	if( (FirePos[ID][0] != 0) && (FirePos[ID][1] != 0) && (FirePos[ID][2] != 0) ) return true;
	else return false;
}

stock GetClosestFire(playerid)
{
	new i;
	for(i = 0; i<MaxFire; i++)
	{
	    if(IsValidFire(i) && IsPlayerInRangeOfPoint(playerid, 2, FirePos[i][0],  FirePos[i][1],  FirePos[i][2]))
	    {
	        return i;
		}
	}
	return 0;
}


public systempozarow_OnPlayerUpdate(playerid)
{
	new newkeys,l,u;
	GetPlayerKeys(playerid, newkeys, l, u);
	new i;
	if(Holding(KEY_FIRE))
	{
        if(GetPlayerWeapon(playerid) == 42)
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
							SmokeObj[i] = CreateObject(18716,  FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 0, 0, 0.0);
							SetTimerEx("EndSmoke", 500, false, "i", i);
						}
			    		if(FireHealth[i] <= 0 && TotalFires == 1)
			    		{
							if(FireSmoke[i] == 1)
							{
								DestroyObject(SmokeObj[i]);
							}
			    		    DeleteFire(i);
			    		    SendRadioMessage(4, 0xFFFFFFAA, "--------[Emergency Medical Services]--------");
    						SendRadioMessage(4, 0xAA3333AA, "[RADIO] Centrala do EMS: Po¿ar zosta³ ugaszony!");
    						SendRadioMessage(4, 0x33AA33AA, "[EMS] Do sejfu frakcji wp³ywa 300$! [EMS]");
			    		    Sejf_Add(4, 300);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
			    		}
					    if(FireHealth[i] <= 0 && TotalFires != 1)
					    {
							if(FireSmoke[i] == 1)
							{
								DestroyObject(SmokeObj[i]);
							}
							DeleteFire(i);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
						}
					}
				}
			}
		}
		else if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 407 && PLAYER_STATE_DRIVER)
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
							SmokeObj[i] = CreateObject(18716,  FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 0, 0, 0.0);
							SetTimerEx("EndSmoke", 500, false, "i", i);
						}
			    		if(FireHealth[i] <= 0 && TotalFires == 1)
			    		{
							if(FireSmoke[i] == 1)
							{
								DestroyObject(SmokeObj[i]);
							}
			    		    DeleteFire(i);
			    		    SendRadioMessage(4, 0xFFFFFFAA, "--------[Emergency Medical Services]--------");
    						SendRadioMessage(4, 0xAA3333AA, "[RADIO] Centrala do EMS: Po¿ar zosta³ ugaszony!");
    						SendRadioMessage(4, 0x33AA33AA, "[EMS] Do sejfu frakcji wp³ywa 300$! [EMS]");
			    		    Sejf_Add(4, 300);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
			    		}
					    else if(FireHealth[i] <= 0)
					    {
							if(FireSmoke[i] == 1)
							{
								DestroyObject(SmokeObj[i]);
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
							SmokeObj[i] = CreateObject(18716,  FirePos[i][0],  FirePos[i][1],  FirePos[i][2], 0, 0, 0.0);
							SetTimerEx("EndSmoke", 500, false, "i", i);
						}
			    		if(FireHealth[i] <= 0 && TotalFires == 1)
			    		{
							if(FireSmoke[i] == 1)
							{
								DestroyObject(SmokeObj[i]);
							}
			    		    DeleteFire(i);
			    		    SendRadioMessage(4, 0xFFFFFFAA, "--------[Emergency Medical Services]--------");
    						SendRadioMessage(4, 0xAA3333AA, "[RADIO] Centrala do EMS: Po¿ar zosta³ ugaszony!");
    						SendRadioMessage(4, 0x33AA33AA, "[EMS] Do sejfu frakcji wp³ywa 300$! [EMS]");
			    		    Sejf_Add(4, 300);
							CallRemoteFunction("OnFireDeath", "dd", i, playerid);
			    		}
					    else if(FireHealth[i] <= 0)
					    {
							if(FireSmoke[i] == 1)
							{
								DestroyObject(SmokeObj[i]);
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


Float:DistanceCameraTargetToLocation(Float:CamX, Float:CamY, Float:CamZ,   Float:ObjX, Float:ObjY, Float:ObjZ,   Float:FrX, Float:FrY, Float:FrZ) {

	new Float:TGTDistance;
	TGTDistance = floatsqroot((CamX - ObjX) * (CamX - ObjX) + (CamY - ObjY) * (CamY - ObjY) + (CamZ - ObjZ) * (CamZ - ObjZ));
	new Float:tmpX, Float:tmpY, Float:tmpZ;
	tmpX = FrX * TGTDistance + CamX;
	tmpY = FrY * TGTDistance + CamY;
	tmpZ = FrZ * TGTDistance + CamZ;
	return floatsqroot((tmpX - ObjX) * (tmpX - ObjX) + (tmpY - ObjY) * (tmpY - ObjY) + (tmpZ - ObjZ) * (tmpZ - ObjZ));
}

stock PlayerFaces(playerid, Float:x, Float:y, Float:z, Float:radius)
{
        new Float:cx,Float:cy,Float:cz,Float:fx,Float:fy,Float:fz;
        GetPlayerCameraPos(playerid, cx, cy, cz);
        GetPlayerCameraFrontVector(playerid, fx, fy, fz);
        return (radius >= DistanceCameraTargetToLocation(cx, cy, cz, x, y, z, fx, fy, fz));
}
IsAFireman(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new skin = GetPlayerSkin(playerid);
	    if(skin==277 || skin==278 || skin==279)
		{
		    return 1;
		}
	}
	return 0;
}

//optymalizacje
new LastFireVehicles[MAX_VEHICLES];
hook OnVehicleDeath(vehicleid, killerid)
{
	LastFireVehicles[vehicleid] = false;
	return 1;
}

public OnFire()
{
	for(new i = 0; i<MaxFire; i++)
	{
		if(IsValidFire(i))
		{
			foreach(new p : Player)
			{
				if(IsPlayerInAnyVehicle(p))
				{
					LastFireVehicles[GetPlayerVehicleID(p)] = false;
				}
				else if(!IsAFireman(p) && IsPlayerInRangeOfPoint(p, 2, FirePos[i][0], FirePos[i][1], FirePos[i][2]))
				{
	  				new Float:HP;
		    		GetPlayerHealth(p, HP);
	  				SetPlayerHealth(p, HP-4);
				}	
			}
			for(new v = 0; v < MAX_VEHICLES; v++)
			{
				if(LastFireVehicles[v] || (IsValidVehicle(v) && GetVehicleModel(v) != 407 && GetVehicleDistanceFromPoint(v, FirePos[i][0], FirePos[i][1], FirePos[i][2]) < 5.0))
				{
					new Float:HP;
					GetVehicleHealth(v, HP);
					SetVehicleHealth(v, HP-30);
					LastFireVehicles[v] = true;
				}
			}
		}
	}
}
