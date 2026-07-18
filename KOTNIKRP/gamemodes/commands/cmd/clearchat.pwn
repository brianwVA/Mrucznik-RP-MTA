YCMD:clearchat(playerid, params[], help)
{
    if(gettime() < GetPVarInt(playerid, "last-clear")) return sendTipMessage(playerid, "Musisz odczekać 30 sekund przed ponownym użyciem tej komendy!");

    ClearChat(playerid);
    SetPVarInt(playerid, "last-clear", gettime() + 30);
    return 1;
}