YCMD:sejf(playerid, params[], help)
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
        return sendErrorMessage(playerid, "Musisz być pieszo.");
    new houseid = PlayerInfo[playerid][pDomWKJ];
    if(houseid == -1)
        return sendErrorMessage(playerid, "Nie znajdujesz się w żadnym domu!");
    if(houseid < 0 || houseid >= MAX_HOUSE || !Iter_Contains(House_iterator, houseid)) return sendErrorMessage(playerid, "Nieprawidłowy dom.");
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");
    if(House[houseid][h_sejf_level] < 1) return sendErrorMessage(playerid, "Ten dom nie posiada sejfu.");

    new houseUID = House[houseid][h_ID];
    new string[2048];
    DynamicGui_Init(playerid);
    new itemCount = 0;
    foreach(new i : Items)
    {
        if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_HOUSE || Item[i][i_Owner] != houseUID) continue;
        if(itemCount > House_GetSafeCapacity(houseid)) break;
        format(string, sizeof(string), "%s\n%s (x%d)", string, Item[i][i_Name], Item[i][i_Quantity]);
        DynamicGui_AddRow(playerid, i);
        itemCount++;
    }
    if(itemCount < House_GetSafeCapacity(houseid)) {
        strcat(string, "\n»» Schowaj przedmiot");
        DynamicGui_AddRow(playerid, -1);
    }
    SetPVarInt(playerid, "sejf-id", houseid);
    ShowPlayerDialogEx(playerid, D_HOUSE_SAFE_ITEMS, DIALOG_STYLE_LIST, MruTitle("Sejf"), string, "Wyciągnij", "Zamknij");
    return 1;
}
