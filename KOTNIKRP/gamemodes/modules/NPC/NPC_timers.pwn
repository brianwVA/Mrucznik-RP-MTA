//-----------------------------------------------<< Timers >>------------------------------------------------//
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
// Data utworzenia: 01.05.2021
//Opis:
/*
	System NPC
*/

//-----------------<[ Timery: ]>-------------------
ptask CheckNPC[1500](playerid)
{
	//printf("%d. %d", playerid, IsPlayerRNPC(playerid));
	if(!IsPlayerRNPC(playerid)) 
	{
		//printf("%d. %d", playerid, IsPlayerRNPC(playerid));
		return 1;
	}
	if(NPCInfo[playerid][npcBehaviour] >= 100 && NPCInfo[playerid][npcInQueue] == 0)
	{
		if(GetPlayerDistanceFromPoint(playerid, 0, 0, 0) < 100 || GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		{
			TogglePlayerSpectating(playerid, true);
			TogglePlayerSpectating(playerid, false);
			SetPlayerHealth(playerid, 0.0);
		}
		if(GetPlayerVehicleID(playerid) != 0)
		{
			SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
		}
		return 1;
	} 
		// zbugowany 											// lotnisko LS (brak wyjścia, chodzi w kółko)	
	if(GetPlayerDistanceFromPoint(playerid, 0, 0, 0) < 100 || GetPlayerDistanceFromPoint(playerid, 1909.65, -2362.35, 14) < 50 || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_WASTED && NPCInfo[playerid][npcInQueue] == 0)
		{
			if(NPCInfo[playerid][npcBehaviour] < 100)
			{
				printf("%d. bugged", playerid);
				TogglePlayerSpectating(playerid, true);
				TogglePlayerSpectating(playerid, false);
				SetPlayerHealth(playerid, 0.0);
			}
		}
	}
	if(NPCInfo[playerid][npcSpookCount] > 0 && NPCInfo[playerid][npcSpooked] == 1)
    {
        NPCInfo[playerid][npcSpookCount]--;
		if(NPCInfo[playerid][npcSpookedBy] != -1)
		{
			if(GetDistanceBetweenPlayers(playerid, NPCInfo[playerid][npcSpookedBy]) < 30) NPCInfo[playerid][npcSpookCount] = 5;
		}
		if(NPCInfo[playerid][npcSpookCount] == 0)
        {
			if(NPCInfo[playerid][npcWalkType] == NPC_WALKTYPE_STOP)
			{
				NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_WALK;
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				NPCGoToPos(playerid, x, y, z); // Zatrzymanie NPC w miejscu
			}
			NPCInfo[playerid][npcSpooked] = 0;
			NPCInfo[playerid][npcSpookedBy] = 0;
            NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_WALK;
			return 1;
        }
    }

	new Float:x, Float:y, Float:z, Float:fX, Float:fY;
	GetPlayerPos(playerid, x, y, z);
	new Float:range = 3.0;
	new bool:found = false;
	if(NPCInfo[playerid][npcWalkType] == NPC_WALKTYPE_RUN) range = 7.0;
	GetXYInFrontOfPlayer(playerid, fX, fY, range);
	new Float:obstacle[3];
	new Float:radius = 2.5;
	foreach(new i : Vehicle)
	{
		if(GetVehicleDistanceFromPoint(i, fX, fY, z) > range) continue;
		GetVehiclePos(i, obstacle[0], obstacle[1], obstacle[2]);
		radius = 5.5;
		found = true;
		break;
	}
	if(!found)
	{
		foreach(new i : Player) 
		{
			if(GetPlayerDistanceFromPoint(i, fX, fY, z) > range) continue;
			GetPlayerPos(i, obstacle[0], obstacle[1], obstacle[2]);
			radius = 2.5;
			found = true;
			break;
		}
	}

	if(found)
	{
		if(NPCInfo[playerid][npcWalkType] != NPC_WALKTYPE_STOP && (NPCInfo[playerid][npcSpooked] != 1 || NPCInfo[playerid][npcWalkType] == NPC_WALKTYPE_RUN))
		{
			if(NPCInfo[playerid][npcAntiStuck] < 7)
			{
				// Obliczanie nowego punktu obok przeszkody
				new Float:direction[3],
					Float:normalizedDirection[3],
					Float:offset[3],
					Float:points[2][3];
				
				// Obliczanie wektora kierunku
				direction[0] = NPCInfo[playerid][npcPos][0] - x;
				direction[1] = NPCInfo[playerid][npcPos][1] - y;
				direction[2] = NPCInfo[playerid][npcPos][2] - z;

				// Normalizowanie wektora kierunku
				new Float:directionLength = floatsqroot(direction[0] * direction[0] + direction[1] * direction[1] + direction[2] * direction[2]);
				normalizedDirection[0] = direction[0] / directionLength;
				normalizedDirection[1] = direction[1] / directionLength;
				normalizedDirection[2] = direction[2] / directionLength;

				// Obliczanie wektora przesunięcia
				offset[0] = -1.0 * normalizedDirection[1];  // Zamiana znaku y
				offset[1] = normalizedDirection[0];
				offset[2] = 0.0;

				// Skalowanie wektora przesunięcia
				offset[0] *= radius;
				offset[1] *= radius;
				new size = 4;
				
				// Obliczanie nowych punktów
				points[0][0] = obstacle[0] + offset[0];
				points[0][1] = obstacle[1] + offset[1];
				points[0][2] = obstacle[2] + offset[2];
				points[1][0] = obstacle[0] - offset[0];
				points[1][1] = obstacle[1] - offset[1];
				points[1][2] = obstacle[2] - offset[2];
				

				new Float:nodes_array[4][3], rand = 1 /*= random(2)*/;
				new Float:distance1 = GetDistanceBetweenPoints(points[0][0], points[0][1], points[0][2], NPCInfo[playerid][npcPos][0], NPCInfo[playerid][npcPos][1], NPCInfo[playerid][npcPos][2]);
				new Float:distance2 = GetDistanceBetweenPoints(points[1][0], points[1][1], points[1][2], NPCInfo[playerid][npcPos][0], NPCInfo[playerid][npcPos][1], NPCInfo[playerid][npcPos][2]);

				if(distance1 < distance2)
					rand = 0;

				if(rand == 1)
				{
					offset[0] = -offset[0];
					offset[1] = -offset[1];
					offset[2] = -offset[2];
				}

				new Float:distance3 = GetDistanceBetweenPoints(x, y, z, points[rand][0], points[rand][1], points[rand][2]); // to obstacle
				new Float:distance4 = GetDistanceBetweenPoints(x, y, z, NPCInfo[playerid][npcPos][0], NPCInfo[playerid][npcPos][1], NPCInfo[playerid][npcPos][2]); // to final point
				if(distance3 >= distance4)
					size = 2;

				nodes_array[0][0] = (x + (points[rand][0] - x) * 0.33) + (offset[0]*0.3);
				nodes_array[0][1] = (y + (points[rand][1] - y) * 0.33) + (offset[1]*0.3);
				nodes_array[0][2] = (z + (points[rand][2] - z) * 0.33) + (offset[2]*0.3);
				nodes_array[1][0] = points[rand][0];
				nodes_array[1][1] = points[rand][1];
				nodes_array[1][2] = points[rand][2];
				if(size > 2)
				{
					nodes_array[2][0] = ((2.0 * points[rand][0] + NPCInfo[playerid][npcPos][0]) / 3.0) + (offset[0]*0.2);
					nodes_array[2][1] = ((2.0 * points[rand][1] + NPCInfo[playerid][npcPos][1]) / 3.0) + (offset[1]*0.2);
					nodes_array[2][2] = ((2.0 * points[rand][2] + NPCInfo[playerid][npcPos][2]) / 3.0) + (offset[2]*0.2);
					nodes_array[3][0] = NPCInfo[playerid][npcPos][0];
					nodes_array[3][1] = NPCInfo[playerid][npcPos][1];
					nodes_array[3][2] = NPCInfo[playerid][npcPos][2];
				}
				NPCInfo[playerid][npcAntiStuck]++;
				/*if(playerid == 185)
				{
					printf("%f, %f, %f", x, y, z);
					for(new i = 0; i<4; i++)
					{
						printf("%f, %f, %f", nodes_array[i][0], nodes_array[i][1], nodes_array[i][2]);
					}
				}*/
				//RNPC_PathFinderMovement(x, y, Float:start_z, nodes_array, nodes_array_size, Float:speed=RNPC_SPEED_RUN);
				RNPCPathFindTo(playerid, x, y, z, nodes_array, size);
				return 1;
			}
			else if(NPCInfo[playerid][npcAntiStuck] >= 7 && NPCInfo[playerid][npcAntiStuck] < 15)
			{
				new newnode = NPCInfo[playerid][npcLastNode][1];
				new newarea = NPCInfo[playerid][npcLastArea][1];
				if(newnode == 0)
				{
					NPCInfo[playerid][npcSkipSearch] = 1;
					NPCInfo[playerid][npcSpooked] = 1;
					NPCInfo[playerid][npcSpookedBy] = -1;
					NPCGoToPos(playerid, x, y, z); // Zatrzymanie NPC w miejscu
					NPCInfo[playerid][npcWalkType] = NPC_WALKTYPE_STOP;
					NPCInfo[playerid][npcSpookCount] = 1;
					return 1;
				}
				// TODO: Poprawić zawracanie (kolejność lastNodeów?)
				NPCInfo[playerid][npcLastNode][0] = NPCInfo[playerid][npcLastNode][2];
				NPCInfo[playerid][npcLastArea][0] = NPCInfo[playerid][npcLastArea][2];
				NPCInfo[playerid][npcLastNode][1] = NPCInfo[playerid][npcLastNode][0];
				NPCInfo[playerid][npcLastArea][1] = NPCInfo[playerid][npcLastArea][0];
				NPCInfo[playerid][npcArea] = newarea;
				NPCInfo[playerid][npcNode] = newnode;
				x = abs_f(float(NPC_Nodes[newarea][newnode][nodeX])) > 3000.0 ? NPC_Nodes[newarea][newnode][nodeX] : float(NPC_Nodes[newarea][newnode][nodeX]);
				y = abs_f(float(NPC_Nodes[newarea][newnode][nodeY])) > 3000.0 ? NPC_Nodes[newarea][newnode][nodeY] : float(NPC_Nodes[newarea][newnode][nodeY]);
				z = abs_f(float(NPC_Nodes[newarea][newnode][nodeZ])) > 3000.0 ? NPC_Nodes[newarea][newnode][nodeZ] : float(NPC_Nodes[newarea][newnode][nodeZ]);
				z+=0.5;
				NPCInfo[playerid][npcAntiStuck]++;
				NPCGoToPos(playerid, x, y, z);
				return 1;
			}
			else if(NPCInfo[playerid][npcAntiStuck] >= 15 && NPCInfo[playerid][npcAntiStuck] < 17)
			{
				NPCInfo[playerid][npcAntiStuck]++;
				return 1;
			}
			NPCInfo[playerid][npcAntiStuck] = 0;
			return 1;
		}
	}
	NPCInfo[playerid][npcAntiStuck] = 0;
	return 1;
}

task CheckQueue[1500]()
{
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(!IsPlayerRNPC(i)) continue;
		if(NPCInfo[i][npcInQueue] == 1)
		{
			if(strfind(GetNick(i), "Mieszkaniec", true) != -1) SpawnNPCOnRandomNode(i);
			else
			{
				SetSpawnInfo(i, 0, NPCInfo[i][npcSkin], NPCInfo[i][npcPos][0], NPCInfo[i][npcPos][1], NPCInfo[i][npcPos][2], NPCInfo[i][npcPos][3], 0, 0, 0, 0, 0, 0 );
    			SpawnPlayer(i);
			}

			NPCInfo[i][npcInQueue] = 0;
			return 1;
		}
	}
	return 1;
}