YCMD:setsadzonki(playerid, params[], help)
{
    if (help)
    {
        return 1;
    }
    
    if(PlayerInfo[playerid][pAdmin] < 3000 && !IsAScripter(playerid))
        return noAccessMessage(playerid);
    new targetid, value;
    if (sscanf(params, "d d", targetid, value))
        return SendClientMessage(playerid, COLOR_GRAD3, "Użyj: /setsadzonki [id gracza] [wartosc]");

    if (!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
        return SendClientMessage(playerid, COLOR_GRAD3, "Gracz o podanym ID nie jest połączony z serwerem.");

    PlayerInfo[targetid][pMaxSadzonkiBoost] = value;
    new string[258];
    new string2[258];
    new adminName[24];
    new targetName[24];
    GetPlayerName(playerid, adminName, sizeof adminName);
    GetPlayerName(targetid, targetName, sizeof targetName);
    format(string, sizeof(string), "Twój maksymalny boost sadzonki został ustawiony na %d przez administratora %s", value, adminName);
    sendTipMessage(targetid, string);
    format(string2, sizeof(string2), "Ustawiono wartość dla gracza %s (ID %d) na %d", targetName, targetid, value);
    sendTipMessage(playerid, string2);
    return 1;
}