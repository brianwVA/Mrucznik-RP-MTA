YCMD:house(playerid, params[])
{
    new houseid = House_PlayerGetID(playerid);
    if(houseid == -1)
    {
        //house list
        new string[512], count = 0;
        DynamicGui_Init(playerid);
        strcat(string, "#\tDom");
        foreach(new i : House_iterator)
        {
            if(House[i][h_Owner] != PlayerInfo[playerid][pUID]) continue;
            strcat(string, sprintf("\n%d\t%s", i, House[i][h_Name]));
            DynamicGui_AddRow(playerid, i);
            count++;
        }
        if(count == 0) return sendErrorMessage(playerid, "Nie masz żadnych domów.");
        ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Twoje domy", string, "Zarządzaj", "Zamknij");
        return 1;
    }
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");
    House_ManageDialog(playerid, houseid);
    return 1;
}

