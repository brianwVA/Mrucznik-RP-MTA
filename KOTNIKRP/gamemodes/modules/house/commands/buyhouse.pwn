forward command_buyhouse();
public command_buyhouse()
{

    Command_AddAltNamed("buyhouse", "kupdom");
}

YCMD:buyhouse(playerid, params[])
{
    new houseid = House_PlayerGetID(playerid);
    if(houseid == -1) return sendErrorMessage(playerid, "Nie znajdujesz się w pobliżu żadnego domu");
    if(House[houseid][h_Owner] > 0) return sendTipMessage(playerid, "Ten dom nie jest do kupienia");
    if(kaska[playerid] < House[houseid][h_Price]) return sendTipMessage(playerid, "Nie stać Cie na ten dom");

    ZabierzKase(playerid, House[houseid][h_Price]);
    House[houseid][h_Owner] = PlayerInfo[playerid][pUID];
    House_Save(houseid);
    House_UpdateLabel(houseid);
    House_UpdatePickup(houseid);
    _MruGracz(playerid, sprintf("Kupiłeś dom %s za %d$!", House[houseid][h_Name], House[houseid][h_Price]));
    RunCommand(playerid, "/house", "");
    Log(houseLog, INFO, "%s bought house %s for %d$", GetPlayerLogName(playerid), GetHouseLogName(houseid), House[houseid][h_Price]);
    return 1;
}