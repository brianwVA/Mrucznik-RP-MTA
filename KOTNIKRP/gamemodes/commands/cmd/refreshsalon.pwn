YCMD:refreshsalon(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1000) 
        return noAccessMessage(playerid);
        
	RefreshSalon();
    SendClientMessage(playerid, COLOR_BLUE, "Przeładowano salon aut.");
	return 1;
}