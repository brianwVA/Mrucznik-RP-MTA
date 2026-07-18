//-------<[ initialize ]>-------
command_gotonode()
{
    new command = Command_GetID("gotonode");

    //aliases
    

    //permissions
    Group_SetGlobalCommand(command, true);
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:gotonode(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Teleportuje na wybrany path node");
        return 1;
    }
    if(PlayerInfo[playerid][pAdmin] < 100) return noAccessMessage(playerid);
    new area, node;
	if(sscanf(params, "dd", area, node)) return sendTipMessage(playerid, "Użyj: /gotonode [area] [node]");
	new Float:x, Float:y, Float:z;
	x = abs_f(float(NPC_Nodes[area][node][nodeX])) > 3000.0 ? NPC_Nodes[area][node][nodeX] : float(NPC_Nodes[area][node][nodeX]);
	y = abs_f(float(NPC_Nodes[area][node][nodeY])) > 3000.0 ? NPC_Nodes[area][node][nodeY] : float(NPC_Nodes[area][node][nodeY]);
	z = abs_f(float(NPC_Nodes[area][node][nodeZ])) > 3000.0 ? NPC_Nodes[area][node][nodeZ] : float(NPC_Nodes[area][node][nodeZ]);
	SetPlayerPos(playerid, x, y, z+0.5);
	sendTipMessage(playerid, sprintf("Teleportuję na AREA: %d, NODE: %d | %f, %f, %f", area, node, x, y, z+0.5));
	return 1;
}