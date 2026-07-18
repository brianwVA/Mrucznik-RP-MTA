//-----------------------------------------------<< Source >>------------------------------------------------//
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
// Data utworzenia: 22.05.2021
//Opis:
/*
	
*/

//

//TODO:
/*
    - Więcej behaviourów
    - Strzelanie
    - Spróbować wyłaczyć funkcje gracza, takie jak "KLIENT TAXI OPUSCIŁ GRĘ"
    
*/

//-----------------<[ Funkcje: ]>-------------------
forward SpawnNPCOnRandomNode(npcid);
public SpawnNPCOnRandomNode(npcid)
{
    new bool:found = false;
    new area, node;
    while(!found)
    {
        area = NPC_GoodAreas[random(sizeof(NPC_GoodAreas)-1)];
        node = random(NPC_Nodes_MaxNode[area])+NPC_Nodes_FirstNode[area];
        if(NPC_Nodes[area][node][nodeNodeId] != -1) 
        {
            found = true;
            break;
        }
    }
    new Float:x, Float:y, Float:z;
	x = abs_f(float(NPC_Nodes[area][node][nodeX])) > 3000.0 ? NPC_Nodes[area][node][nodeX] : float(NPC_Nodes[area][node][nodeX]);
	y = abs_f(float(NPC_Nodes[area][node][nodeY])) > 3000.0 ? NPC_Nodes[area][node][nodeY] : float(NPC_Nodes[area][node][nodeY]);
	z = abs_f(float(NPC_Nodes[area][node][nodeZ])) > 3000.0 ? NPC_Nodes[area][node][nodeZ] : float(NPC_Nodes[area][node][nodeZ]);
    z+=0.5;
    //printf("found: (%d/%d) %f %f %f", area, node, x, y, z);
    NPCInfo[npcid][npcPos][0] = x;
    NPCInfo[npcid][npcPos][1] = y;
    NPCInfo[npcid][npcPos][2] = z;

    NPCInfo[npcid][npcArea] = area;
    NPCInfo[npcid][npcNode] = node;
    //printf("test: (%d/%d) %f %f %f", NPCInfo[npcid][npcArea], NPCInfo[npcid][npcNode], NPCInfo[npcid][npcPos][0], NPCInfo[npcid][npcPos][1], NPCInfo[npcid][npcPos][2]);

    SetSpawnInfo(npcid, 0, NPCInfo[npcid][npcSkin], NPCInfo[npcid][npcPos][0], NPCInfo[npcid][npcPos][1], NPCInfo[npcid][npcPos][2], NPCInfo[npcid][npcPos][3], 0, 0, 0, 0, 0, 0 );
    SpawnPlayer(npcid);

    return 1;
}

//12 walking from (20/1382) (link: 2855) 672.750000 -1286.125000 13.125000 to (20/1384) (should be: 20/1385) 672.500000 -1303.625000 13.125000
//9 walking from (20/1267) (link: 2619) 483.750000 -1476.750000 18.875000 to (20/1266) (should be: 20/1267) 481.875000 -1483.875000 19.250000
//8 walking from (15/1541) (link: 3204) 2299.125000 -1651.625000 14.125000 to (15/1541) (should be: 15/1542) 2299.125000 -1651.625000 14.125000
//3 walking from (20/1207) (link: 2495) 508.250000 -1325.375000 15.500000 to (20/1216) (should be: 20/1216) 501.750000 -1313.625000 15.250000
stock GotoNextNode(npcid, bool:teleport = false)
{  
    new area = NPCInfo[npcid][npcArea];
    new node = NPCInfo[npcid][npcNode];
    new linkcount = (NPC_Nodes[area][node][nodeFlags] & 0b1111);
    new link = -1;

    for(new i = 0; i<10; i++)
    {
        link = NPC_Nodes[area][node][nodeLinkId] + 1 + random(linkcount);
        new testnode = NPC_Links[area][link][linkNodeId];
        if(testnode != NPCInfo[npcid][npcLastNode][0] && testnode != NPCInfo[npcid][npcLastNode][1] && testnode != NPCInfo[npcid][npcLastNode][2]) break;
        else if(i == 9)
        {
            if(linkcount > 0)
            {
                link+=1;
                break;
            }
        }
    }
    
    new newarea = NPC_Links[area][link][linkAreaId];
    new newnode = NPC_Links[area][link][linkNodeId];

    new Float:x, Float:y, Float:z;
	x = abs_f(float(NPC_Nodes[newarea][newnode][nodeX])) > 3000.0 ? NPC_Nodes[newarea][newnode][nodeX] : float(NPC_Nodes[newarea][newnode][nodeX]);
	y = abs_f(float(NPC_Nodes[newarea][newnode][nodeY])) > 3000.0 ? NPC_Nodes[newarea][newnode][nodeY] : float(NPC_Nodes[newarea][newnode][nodeY]);
	z = abs_f(float(NPC_Nodes[newarea][newnode][nodeZ])) > 3000.0 ? NPC_Nodes[newarea][newnode][nodeZ] : float(NPC_Nodes[newarea][newnode][nodeZ]);
    z+=0.5;


    //printf("%d walking from (%d/%d) (link: %d) %f %f %f to (%d/%d) (should be: %d/%d) %f %f %f", npcid,  area, NPC_Nodes[area][node][nodeNodeId], NPC_Nodes[area][node][nodeLinkId], NPCInfo[npcid][npcPos][0], NPCInfo[npcid][npcPos][1], NPCInfo[npcid][npcPos][2], newarea, NPC_Nodes[newarea][newnode][nodeNodeId], NPC_Links[area][link][linkAreaId], NPC_Links[area][link][linkNodeId], x, y, z);

    NPCInfo[npcid][npcPos][0] = x;
    NPCInfo[npcid][npcPos][1] = y;
    NPCInfo[npcid][npcPos][2] = z;
    //printf("%d LastNode: %d/%d/%d, newlink: %d", npcid, NPCInfo[npcid][npcLastNode][0], NPCInfo[npcid][npcLastNode][1], NPCInfo[npcid][npcLastNode][2], link);
    NPCInfo[npcid][npcLastNode][2] = NPCInfo[npcid][npcLastNode][1];
    NPCInfo[npcid][npcLastNode][1] = NPCInfo[npcid][npcLastNode][0];
    NPCInfo[npcid][npcLastNode][0] = newnode;
    NPCInfo[npcid][npcLastArea][2] = NPCInfo[npcid][npcLastArea][1];
    NPCInfo[npcid][npcLastArea][1] = NPCInfo[npcid][npcLastArea][0];
    NPCInfo[npcid][npcLastArea][0] = newarea;
    NPCInfo[npcid][npcArea] = newarea;
    NPCInfo[npcid][npcNode] = newnode;
    NPCInfo[npcid][npcSkipSearch] = 0;

    

    if(teleport)
    {
        RNPCTeleportTo(npcid, x, y, z);
        //NPCInfo[npcid][npcWalkType] = NPC_WALKTYPE_WALK;
    }
    else
        NPCGoToPos(npcid, x, y, z);
    return 1;
}

NPCGoToPos(npcid, Float:x, Float:y, Float:z)
{
    switch(NPCInfo[npcid][npcWalkType])
    {
        case NPC_WALKTYPE_WALK: // Standardowe chodzenie
        {
            RNPCWalkTo(npcid, x, y, z);
        }
        case NPC_WALKTYPE_RUN: // Ucieczka / FastRun
        {
            RNPCFastRunTo(npcid, x, y, z);
        }
    }
}

/*CheckPlayersAimAtNPC(playerid)
{   
    for(new npcid = 0; npcid<MAX_PLAYERS; npcid++)
    {
        
        if(!IsPlayerRNPC(npcid)) continue;
        if(GetPlayerWeapon(playerid) == 0) continue;
        if(GetDistanceBetweenPlayers(playerid, npcid) > 20) continue;
        if(GetPlayerDistanceFromPoint(playerid, 0, 0, 0) < 50) continue; 
        if(!IsPlayerAimingEx(playerid)) continue;
        if(IsPlayerBehindPlayer(playerid, npcid)) continue;
        if(GetPlayerCameraTargetPlayer(playerid) != npcid) continue;
        OnPlayerAimAtNPC(playerid, npcid);
        return 1;
    }
    return 1;
}

OnPlayerAimAtNPC(playerid, npcid)
{
    switch(NPCInfo[npcid][npcBehaviour])
    {
        case NPC_BEHAVIOUR_RUN: // Zwykły ped, ucieczka
        {
            if(NPCInfo[npcid][npcWalkType] != NPC_WALKTYPE_RUN && NPCInfo[npcid][npcSpooked] != 1)
            {
                NPCInfo[npcid][npcSkipSearch] = 1;
                NPCInfo[npcid][npcSpooked] = 1;
                NPCInfo[npcid][npcSpookedBy] = playerid;
                new Float:x, Float:y, Float:z;
                GetPlayerPos(npcid, x, y, z);
                NPCGoToPos(npcid, x, y, z); // Zatrzymanie NPC w miejscu
            }
            NPCInfo[npcid][npcSpookCount] = 5;
            NPCInfo[npcid][npcWalkType] = NPC_WALKTYPE_RUN;
        }
        case NPC_BEHAVIOUR_SURRENDER: // Poddanie się
        {
            if(NPCInfo[npcid][npcWalkType] != NPC_WALKTYPE_STOP && NPCInfo[npcid][npcSpooked] != 1)
            {
                NPCInfo[npcid][npcSkipSearch] = 1;
                NPCInfo[npcid][npcSpooked] = 1;
                NPCInfo[npcid][npcSpookedBy] = playerid;
                new Float:x, Float:y, Float:z, Float:ang;
                GetPlayerPos(npcid, x, y, z);
                GetPlayerFacingAngle(npcid, ang);
                
                NPCGoToPos(npcid, x, y, z); // Zatrzymanie NPC w miejscu

                SetRNPCFacingAngle(npcid, ang);
                SetRNPCSpecialAction(npcid, SPECIAL_ACTION_HANDSUP);
            }
            NPCInfo[npcid][npcSpookCount] = 5;
            NPCInfo[npcid][npcWalkType] = NPC_WALKTYPE_STOP;
        }
        case 2: // Gangus, zacznie strzelać lub bić
        {
            
        }
    }
}*/
//end