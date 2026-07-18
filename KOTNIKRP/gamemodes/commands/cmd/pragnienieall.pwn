YCMD:pragnienieall(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1000)
        return noAccessMessage(playerid);

    foreach(new i : Player){
        PlayerInfo[i][pThirst] = 0.0;
        SetPlayerDrunkLevel(i, 2000);
        _MruGracz(i, sprintf("   Administrator %s ustawił Tobie pragnienie na 0.0!", GetNick(playerid)));
    }
    SendClientMessage(playerid, COLOR_GRAD1, "Ustawiłeś każdemu pragnienie na 0.0!");
    return 1;
}