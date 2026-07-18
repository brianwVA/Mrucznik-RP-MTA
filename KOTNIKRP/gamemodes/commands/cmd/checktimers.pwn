
YCMD:checktimers(playerid, params[], help)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if (PlayerInfo[playerid][pAdmin] < 5000 && !IsAScripter(playerid)) noAccessMessage(playerid);
    return SendClientMessage(playerid, -1, "Running timers: %d", CountRunningTimers());
}

