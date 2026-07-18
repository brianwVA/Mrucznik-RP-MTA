//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                   NPC                                                  //
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
// Data utworzenia: 01.05.2023
//Opis:
/*
	System NPC
*/

//
#include <a_rnpc>
#include <YSI_Coding\y_hooks>


//-----------------<[ Callbacki: ]>-----------------

hook OnGameModeInit()
{ 
	NPC_Ready = false;
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerNPC(i))
			Kick(i);
	}
	//SetTimer("SpawnNPCs", 5000, false);
	/*new string[1024];
	new curr = 0;
	for(new i = 0; i<64; i++)
	{
		curr = 0;
		for(new j = 0; j<2550; j++)
		{
			if(NPC_Nodes[i][j][nodeNodeId] != -1)
			{
				curr++;
			}
			else
			{
				break;
			}
		}
		format(string, sizeof(string), "%s%d ,", string, curr);
	}
	printf("%s", string);*/
}

hook OnGameModeExit()
{
	DestroyVehicle(NPCVehicles[0]);
	DestroyVehicle(NPCVehicles[1]);
}

forward SpawnNPCs();
public SpawnNPCs()
{
	new highest = 0;
	new maxplayers = GetMaxPlayers()-NPC_MAX_NPC-5;
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i)) highest = i;
	}
	printf("MAXPLAYERS: %d | highest: %d | MAX_NPC: %d | CALC: %d", maxplayers, highest, NPC_MAX_NPC, maxplayers-highest);
	printf("================= Spawning NPCs =================");
	SetTimerEx("SpawnFakeNPC", 100, false, "dd", highest, maxplayers-highest);
    //SetTimer("SpawnWorkingNPC", 500, false);
	//printf("================= Spawning NPCs =================");
	//SetTimerEx("SpawnNPC", 1500, false, "d", 0);
    /*for(new i = 0; i<NPC_MAX_NPC-5; i++)
    { 
        
        //CreateRNPC(sprintf("Mieszkaniec_%d", i));
    }*/
}

forward SpawnFakeNPC(npcid, max);
public SpawnFakeNPC(npcid, max)
{
    ConnectNPC(sprintf("FakeNPC_%d", npcid), "test");
	if(npcid < max)
		SetTimerEx("SpawnFakeNPC", 100, false, "dd", npcid+1, max);
	else
		SetTimerEx("SpawnNPC", 1250, false, "d", npcid+1);
}

forward SpawnWorkingNPC();
public SpawnWorkingNPC()
{
	CreateRNPC("Pilot_0");
	CreateRNPC("Maszynista_0");
	CreateRNPC("FakeNPC_000");
	NPCVehicles[0] = AddStaticVehicleEx(577, 1447.0, -2436.0, 18.0, 315.1902, -1, -1, 0); // at400
	SetVehicleParamsEx(NPCVehicles[0], 1, 1, 0, 1, 0, 0, 0);
	//printf("======== AT400:  %d",NPCVehicles[0]);
	NPCVehicles[1] = AddStaticVehicleEx(538, 1700.7551, -1953.6531, 14.8756, 90, -1, -1, 0); // pociag
	SetVehicleParamsEx(NPCVehicles[1], 1, 1, 0, 1, 0, 0, 0);
	//printf("======== POCIAG:  %d",NPCVehicles[1]);
	SetTimer("KickFakeNPC", 5500, false);
}

forward SpawnNPC(npcid);
public SpawnNPC(npcid)
{
	printf("SpawnNPC called for %d", npcid);
    CreateRNPC(sprintf("Mieszkaniec_%d", npcid));
	if(npcid < GetMaxPlayers()-5)
		SetTimerEx("SpawnNPC", 200, false, "d", npcid+1);
	else
		SetTimer("SpawnWorkingNPC", 500, false);
}

forward KickFakeNPC();
public KickFakeNPC()
{
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(strfind(GetNick(i), "FakeNPC", true) != -1)
		{
			Kick(i);
		}
	}
	NPC_Ready = true;
}

public OnRNPCCreated(npcid)
//hook OnPlayerConnect(playerid)
{
	new playerid = npcid;
	//printf("%d IsPlayerRNPC: %d", playerid, IsPlayerRNPC(playerid));
	if(IsPlayerRNPC(playerid))
	{
		if(strfind(GetNick(playerid), "Mieszkaniec", true) != -1)
		{
			NPCInfo[playerid][npcID] = playerid;
			format(NPCInfo[playerid][npcName], 24, "%s", GetNick(playerid));
			new rskin = random(sizeof(NPC_Skins));
			rskin = NPC_Skins[rskin];
			PlayerInfo[playerid][pSkin] = NPCInfo[playerid][npcSkin] = rskin;
			NPCInfo[playerid][npcPos][0] = 1958.33;
			NPCInfo[playerid][npcPos][1] = 1343.12;
			NPCInfo[playerid][npcPos][2] = 15.36;
			NPCInfo[playerid][npcPos][3] = 269.15;
			NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_WALK;
			NPCInfo[playerid][npcBehaviour] = random(2);
			NPCInfo[playerid][npcInQueue] = 1;
		}
		else if(strfind(GetNick(playerid), "Pilot", true) != -1)
		{
			NPCInfo[playerid][npcID] = playerid;
			format(NPCInfo[playerid][npcName], 24, "%s", GetNick(playerid));
			PlayerInfo[playerid][pSkin] = NPCInfo[playerid][npcSkin] = 61;
			NPCInfo[playerid][npcPos][0] = 1958.33;
			NPCInfo[playerid][npcPos][1] = 1343.12;
			NPCInfo[playerid][npcPos][2] = 15.36;
			NPCInfo[playerid][npcPos][3] = 269.15;
			NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_WALK;
			NPCInfo[playerid][npcBehaviour] = 100;
			NPCInfo[playerid][npcInQueue] = 1;
			SetSpawnInfo(playerid, 0, NPCInfo[playerid][npcSkin], NPCInfo[playerid][npcPos][0], NPCInfo[playerid][npcPos][1], NPCInfo[playerid][npcPos][2], NPCInfo[playerid][npcPos][3], 0, 0, 0, 0, 0, 0 );
			if(NPC_Ready) 
			{
				TogglePlayerSpectating(playerid, true);
				TogglePlayerSpectating(playerid, false);
				SpawnPlayer(playerid);
			}
		}
		else if(strfind(GetNick(playerid), "Maszynista", true) != -1)
		{
			NPCInfo[playerid][npcID] = playerid;
			format(NPCInfo[playerid][npcName], 24, "%s", GetNick(playerid));
			PlayerInfo[playerid][pSkin] = NPCInfo[playerid][npcSkin] = 7;
			NPCInfo[playerid][npcPos][0] = 1700.7551;
			NPCInfo[playerid][npcPos][1] = -1953.6531;
			NPCInfo[playerid][npcPos][2] = 15.36;
			NPCInfo[playerid][npcPos][3] = 269.15;
			NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_WALK;
			NPCInfo[playerid][npcBehaviour] = 101;
			NPCInfo[playerid][npcInQueue] = 1;
			SetSpawnInfo(playerid, 0, NPCInfo[playerid][npcSkin], NPCInfo[playerid][npcPos][0], NPCInfo[playerid][npcPos][1], NPCInfo[playerid][npcPos][2], NPCInfo[playerid][npcPos][3], 0, 0, 0, 0, 0, 0 );
			if(NPC_Ready) 
			{
				TogglePlayerSpectating(playerid, true);
				TogglePlayerSpectating(playerid, false);
				SpawnPlayer(playerid);
			}
		}
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(IsPlayerNPC(playerid) && NPC_Ready)
	{
		SetTimerEx("ReconnectRNPC", 5000, false, "d", NPCInfo[playerid][npcBehaviour]);
	}
	if(IsPlayerRNPC(playerid))
	{
		return 1;
	}
	return 1;
}

forward ReconnectRNPC(behaviour);
public ReconnectRNPC(behaviour)
{
	//new id = -1;
	if(behaviour == 100)
	{
		//print("reconnecting pilot");
		ConnectRNPC(sprintf("Pilot_%d", random(99)));
	}
	else if(behaviour == 101)
	{
		//print("reconnecting maszynista");
		ConnectRNPC(sprintf("Maszynista_%d", random(99)));
	}
	else
	{
		//print("reconnecting else");
		ConnectRNPC(sprintf("Mieszkaniec_%d", random(9999)));
	}
	//printf("recconected slot/id, %d", id);
}

hook OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerRNPC(playerid))
	{
		NPCInfo[playerid][npcInQueue] = 1;
		//SpawnNPCOnRandomNode(playerid);
		return 1;
	}
	return 0;
}

hook OnPlayerSpawn(playerid)
{
	if(IsPlayerRNPC(playerid))
	{
		if(strfind(GetNick(playerid), "Mieszkaniec", true) != -1)
		{
			TogglePlayerSpectating(playerid, false);
			TogglePlayerControllable(playerid, false);
			SetRNPCPos(playerid, NPCInfo[playerid][npcPos][0], NPCInfo[playerid][npcPos][1], NPCInfo[playerid][npcPos][2]);
			SetRNPCSkin(playerid, NPCInfo[playerid][npcSkin]);
			TogglePlayerControllable(playerid, true);
			GotoNextNode(playerid, true);
		}
		if(NPCInfo[playerid][npcInQueue] == 1) return 1;
		if(strfind(GetNick(playerid), "Pilot", true) != -1)
		{
			TogglePlayerSpectating(playerid, false);
			TogglePlayerControllable(playerid, false);
			new Float:x, Float:y, Float:z;
			GetVehiclePos(NPCVehicles[0], x, y, z);
			SetRNPCPos(playerid, x, y, z);
			SetRNPCSkin(playerid, NPCInfo[playerid][npcSkin]);
			TogglePlayerControllable(playerid, true);
		}
		else if(strfind(GetNick(playerid), "Maszynista", true) != -1)
		{
			TogglePlayerSpectating(playerid, false);
			TogglePlayerControllable(playerid, false);
			SetRNPCPos(playerid, 1700.7551, -1953.6531, 14.8756);
			SetRNPCSkin(playerid, NPCInfo[playerid][npcSkin]);
			TogglePlayerControllable(playerid, true);
			PutRNPCInVehicle(playerid, NPCVehicles[1], 0);
			NPCInfo[playerid][npcArea] = 0;
		}
	}
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if(IsPlayerRNPC(playerid))
	{
		//if(strfind(GetNick(playerid), "Mieszkaniec", true) != -1)
		//{
			SetTimerEx("RespawnNPC", 5000, false, "d", playerid);
			return 1;
		//}
	}
	return 1;
}

// jak te kurwy zrespić ja kurwie
forward RespawnNPC(npcid);
public RespawnNPC(npcid)
{
	SetTimerEx("RestartNPC", 5500, false, "d", npcid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(npcid, x, y, z);
	NPCInfo[npcid][npcSkipSearch] = 1;
	NPCGoToPos(npcid, x, y, z); // Zatrzymanie NPC w miejscu
	TogglePlayerSpectating(npcid, true);
	TogglePlayerSpectating(npcid, false);
	NPCInfo[npcid][npcWalkType] = NPC_WALKTYPE_STOP;
	NPCInfo[npcid][npcSkipSearch] = 1;

	if(strfind(GetNick(npcid), "Mieszkaniec", true) != -1) SpawnNPCOnRandomNode(npcid);
	//SpawnPlayer(npcid);
}

forward RestartNPC(npcid);
public RestartNPC(npcid)
{
	NPCInfo[npcid][npcSkipSearch] = 0;
	NPCInfo[npcid][npcWalkType] = NPC_WALKTYPE_WALK;
	NPCInfo[npcid][npcSpooked] = 0;
	if(strfind(GetNick(npcid), "Mieszkaniec", true) != -1) GotoNextNode(npcid);
}

public OnRNPCPlaybackFinished(npcid)
{
	if(NPCInfo[npcid][npcInQueue] == 1) return;
	if(strfind(GetNick(npcid), "Mieszkaniec", true) != -1)
	{
		if(NPCInfo[npcid][npcSkipSearch] == 0)
		{
			GotoNextNode(npcid);
		}
		else
		{
			if(NPCInfo[npcid][npcWalkType] == NPC_WALKTYPE_STOP) return;
			NPCInfo[npcid][npcSkipSearch] = 0;
			NPCGoToPos(npcid, NPCInfo[npcid][npcPos][0], NPCInfo[npcid][npcPos][1], NPCInfo[npcid][npcPos][2]);
		}
	} 
	else if(strfind(GetNick(npcid), "Pilot", true) != -1)
	{
		if(GetPlayerVehicleID(npcid) == 0)
		{
			//PutPlayerInVehicle(npcid, NPCVehicles[0], 0);
			PutRNPCInVehicle(npcid, NPCVehicles[0], 0);
			NPCInfo[npcid][npcArea] = 0;
			return;
		}
		else
		{
			new rand = random(2);
			switch(NPCInfo[npcid][npcArea])
			{
				case 0:
				{
					if(rand == 0)
					{
						//printf("ls-lv");
						RNPC_StartPlayback(npcid, "at400_ls_lv");
						NPCInfo[npcid][npcArea] = 1;
					}
					else
					{
						//printf("ls-sf");
						RNPC_StartPlayback(npcid, "at400_ls_sf");
						NPCInfo[npcid][npcArea] = 2;
					}
				}
				case 1:
				{
					if(rand == 0)
					{
						//printf("lv-sf");
						RNPC_StartPlayback(npcid, "at400_lv_sf");
						NPCInfo[npcid][npcArea] = 2;
					}
					else
					{
						//printf("lv-ls");
						RNPC_StartPlayback(npcid, "at400_lv_ls");
						NPCInfo[npcid][npcArea] = 0;
					}
				}
				case 2:
				{
					if(rand == 0)
					{
						//printf("sf-ls");
						RNPC_StartPlayback(npcid, "at400_sf_ls");
						NPCInfo[npcid][npcArea] = 0;
					}
					else
					{
						//printf("sf-lv");
						RNPC_StartPlayback(npcid, "at400_sf_lv");
						NPCInfo[npcid][npcArea] = 1;
					}
				}
				default:
				{
					//printf("default ls-lv");
					RNPC_StartPlayback(npcid, "at400_ls_lv");
					NPCInfo[npcid][npcArea] = 1;
				}

			}
		}
	}
	else if(strfind(GetNick(npcid), "Maszynista", true) != -1)
	{
		if(GetPlayerVehicleID(npcid) == 0)
		{
			NPCInfo[npcid][npcArea] = 0;
			return;
		}
		else
		{
			SetTimerEx("RNPC_StartPlaybackDelayed_Train", 6000, false, "dd", npcid, NPCInfo[npcid][npcArea]);
			NPCInfo[npcid][npcArea]++;
			if(NPCInfo[npcid][npcArea] > 5) NPCInfo[npcid][npcArea] = 0;
		}
	}
}

forward RNPC_StartPlaybackDelayed_Train(npcid, area);
public RNPC_StartPlaybackDelayed_Train(npcid, area)
{
	switch(area)
	{
		case 0: { RNPC_StartPlayback(npcid, "train_ls1_ls2"); }
		case 1: { RNPC_StartPlayback(npcid, "train_ls2_lv1"); }
		case 2: { RNPC_StartPlayback(npcid, "train_lv1_lv2"); }
		case 3: { RNPC_StartPlayback(npcid, "train_lv2_sf1"); }
		case 4: { RNPC_StartPlayback(npcid, "train_sf1_ls3"); }
		case 5: { RNPC_StartPlayback(npcid, "train_ls3_ls1"); }
	}
}

hook OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
	if(IsPlayerRNPC(playerid))
	{
		if(strfind(GetNick(playerid), "Mieszkaniec", true) != -1)
		{
			if(bodypart == BODY_PART_HEAD)
			{
				new Float:health;
				GetPlayerHealth(playerid, health);
				amount = health;
			}
		}
		else return 0;
	}
	return 1;
}

hook OnPlayerDamageDone(playerid, Float:amount, issuerid, weapon, bodypart)
{
	if(IsPlayerRNPC(playerid))
	{
		NPCInfo[playerid][npcSpooked] = 1;
		NPCInfo[playerid][npcSpookedBy] = issuerid;
		if(NPCInfo[playerid][npcWalkType] != NPC_WALKTYPE_RUN && NPCInfo[playerid][npcBehaviour] <= NPC_BEHAVIOUR_SURRENDER) // Jeśli już nie biegnie i jest zwykłym npcem
		{
			if(strfind(GetNick(playerid), "Mieszkaniec", true) != -1)
			{
				SetRNPCSpecialAction(playerid, SPECIAL_ACTION_NONE);
				NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_RUN; // Zacznie biec
				NPCInfo[playerid][npcSkipSearch] = 1;
				NPCInfo[playerid][npcSpookCount] = 5;
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				NPCGoToPos(playerid, x, y, z); // Zatrzymanie NPC w miejscu
			}
		}
		//GetPlayerHealth(playerid, health);
		//if(health <= 0) return 1;
		//if(health-amount <= 0)
		//	WC_OnPlayerDeath(playerid, issuerid, weapon);
		//else
		//	SetPlayerHealth(playerid, health-amount);
	}
	return 1;
}



//end