//house.pwn

stock House_Load()
{
    print("[house] Ladowanie domow...");
    Iter_Init(House_iterator);

    new Cache:result;
    result = mysql_query(Database, "SELECT `UID`, `owner`, `price`, `enter_x`, `enter_y`, `enter_z`, `enter_vw`, `exit_x`, `exit_y`, `exit_z`, `exit_int`, `interior_type`, `isClosed`, `sejf_level` FROM `mru_domy` LIMIT "#MAX_HOUSE);
    if(!cache_is_valid(result))
    {
        printf("[house] ERROR: invalid cache result %d", result);
    }
    cache_set_active(result);
    new rows = cache_num_rows();
    for(new i = 0; i < rows; i++)
    {
        new id = Iter_Free(House_iterator);
        if(id == -1)
        {
            printf("[house] ERROR: no free slot while loading houses, at row %d of %d", i, rows);
            return print("[LOAD] Wystąpił nieoczekiwany błąd. Brak wolnego slotu na dom, wczytywanie przerwane.");
        }
        if(!cache_get_value_name_int(i, "UID", House[id][h_ID]))
        {
            printf("[house] WARN: failed to read UID at row %d", i);
            House[id][h_ID] = 0;
        }
        cache_get_value_name_int(i, "owner", House[id][h_Owner]);
        cache_get_value_name_int(i, "price", House[id][h_Price]);
        printf("[house] row %d -> owner:%d price:%d", i, House[id][h_Owner], House[id][h_Price]);

        cache_get_value_name_float(i, "enter_x", House[id][h_enter_pos][0]);
        cache_get_value_name_float(i, "enter_y", House[id][h_enter_pos][1]);
        cache_get_value_name_float(i, "enter_z", House[id][h_enter_pos][2]);
        cache_get_value_name_int(i, "enter_vw", House[id][h_enter_vw]);

        cache_get_value_index_float(i, 7, House[id][h_exit_pos][0]);
        cache_get_value_index_float(i, 8, House[id][h_exit_pos][1]);
        cache_get_value_index_float(i, 9, House[id][h_exit_pos][2]);
        cache_get_value_index_int(i, 10, House[id][h_exit_int]);
        cache_get_value_index_int(i, 11, House[id][h_interior_type]);
        cache_get_value_index_bool(i, 12, House[id][h_isClosed]);
        cache_get_value_index_int(i, 13, House[id][h_sejf_level]);

        House[id][h_exit_vw] = HOUSE_INT_VW + House[id][h_ID];

        Iter_Add(House_iterator, id);
	}
    cache_delete(result);
    foreach(new i : House_iterator)
    {
        House[i][h_Pickup] = CreateDynamicPickup((House[i][h_Owner] > 0 ? 1272 : 1273), 1, House[i][h_enter_pos][0], House[i][h_enter_pos][1], House[i][h_enter_pos][2], House[i][h_enter_vw]);
        House[i][h_Label] = CreateDynamic3DTextLabel("", -1, House[i][h_enter_pos][0], House[i][h_enter_pos][1], House[i][h_enter_pos][2], 6.0, .worldid = House[i][h_enter_vw]);
        House_GetName(i);
        House_UpdateLabel(i);
    }
    printf("[house] Zaladowano: %d domow", Iter_Count(House_iterator));
	return 1;
}

stock House_Save(id)
{
    if(!Iter_Contains(House_iterator, id)) return 0;
    mysql_tquery_format("UPDATE `mru_domy` SET \
    `enter_x` = '%f', `enter_y` = '%f', `enter_z` = '%f', `enter_vw` = '%d', \
    `exit_x` = '%f', `exit_y` = '%f', `exit_z` = '%f', `exit_int` = '%d', \
    `price` = '%d', `interior_type` = '%d', `owner` = '%d', `isClosed` = '%d', `sejf_level` = '%d' \
    WHERE `UID` = '%d'", \
    House[id][h_enter_pos][0], House[id][h_enter_pos][1], House[id][h_enter_pos][2], House[id][h_enter_vw],
    House[id][h_exit_pos][0], House[id][h_exit_pos][1], House[id][h_exit_pos][2], House[id][h_exit_int], House[id][h_Price], House[id][h_interior_type],
    House[id][h_Owner], House[id][h_isClosed], House[id][h_sejf_level],
    House[id][h_ID]);
    return 1;
}

stock House_Create(Float:enter_x, Float:enter_y, Float:enter_z, enter_vw, Float:exit_x, Float:exit_y, Float:exit_z, exit_int, price, interior_type)
{
    new id = Iter_Free(House_iterator), uid = 0;
    if(id == -1)            return -2;
    if(House_FindNearest(enter_x, enter_y, enter_z, enter_vw) != -1)  return -3;
    mysql_query_format("INSERT INTO `mru_domy`  \
    (`enter_x`, `enter_y`, `enter_z`, `enter_vw`, `exit_x`, `exit_y`, `exit_z`, `exit_int`, `price`, `interior_type`, `sejf_level`) \
    VALUES ('%f', '%f', '%f', '%d', '%f', '%f', '%f', '%d', '%d', '%d', '%d')", \
    enter_x, enter_y, enter_z, enter_vw, exit_x, exit_y, exit_z, exit_int, (price < 0) ? 0 : price, interior_type, 0);
    uid = cache_insert_id();
    if(uid < 1)                     return -1;

    House[id][h_ID] = uid;
    House[id][h_Owner] = 0;
    House[id][h_Price] = (price < 0) ? 0 : price;
    House[id][h_enter_pos][0] = enter_x;
    House[id][h_enter_pos][1] = enter_y;
    House[id][h_enter_pos][2] = enter_z;
    House[id][h_enter_vw] = enter_vw;
    House[id][h_exit_pos][0] = exit_x;
    House[id][h_exit_pos][1] = exit_y;
    House[id][h_exit_pos][2] = exit_z;
    House[id][h_exit_vw] = HOUSE_INT_VW + uid;
    House[id][h_exit_int] = exit_int;
    House[id][h_interior_type] = interior_type;

    House[id][h_sejf_level] = 0;

    House[id][h_Pickup] = CreateDynamicPickup(1273, 1, House[id][h_enter_pos][0], House[id][h_enter_pos][1], House[id][h_enter_pos][2], House[id][h_enter_vw]);
    House[id][h_Label] = CreateDynamic3DTextLabel("", -1, House[id][h_enter_pos][0], House[id][h_enter_pos][1], House[id][h_enter_pos][2], 6.0, .worldid = House[id][h_enter_vw]);
    //Streamer_SetIntData(STREAMER_TYPE_PICKUP, House[id][h_Pickup], E_STREAMER_EXTRA_ID, 1968+id);
    House_GetName(id);
    House_UpdateLabel(id);
    Iter_Add(House_iterator, id);
    return uid;

}

stock House_GetName(id)
{
    new pZone[MAX_ZONE_NAME];
    GetPos2DZone(pZone, MAX_ZONE_NAME, House[id][h_enter_pos][0], House[id][h_enter_pos][1]);
    format(House[id][h_Name], 64, "Dom przy %s", pZone);
    return 1;
}

stock House_Delete(id)
{
    if(!Iter_Contains(House_iterator, id)) return 0;
    if(!House[id][h_ID]) return 0;
    mysql_tquery_format("DELETE FROM `mru_domy` WHERE `UID` = '%d'", House[id][h_ID]);
    House[id][h_ID] = 0;
    DestroyDynamicPickup(House[id][h_Pickup]);
    DestroyDynamic3DTextLabel(House[id][h_Label]);
    Iter_Remove(House_iterator, id);
    return 1;
}

stock House_UpdateLabel(id)
{
    if(!IsValidDynamic3DTextLabel(House[id][h_Label])) return 0;

    new pZone[MAX_ZONE_NAME];
    GetPos2DZone(pZone, MAX_ZONE_NAME, House[id][h_enter_pos][0], House[id][h_enter_pos][1]);
    if(House[id][h_Owner] > 0)
    {
        //{3094cf}
        UpdateDynamic3DTextLabelText(House[id][h_Label], -1, sprintf("{3094cf}(%d) Dom {FFFFFF}%s\n{3094cf}Lokalizacja: {FFFFFF}%s", id, MruMySQL_GetNameFromUID(House[id][h_Owner]), pZone));
    }
    else
    {
        UpdateDynamic3DTextLabelText(House[id][h_Label], -1, sprintf("{FFFFFF}(%d) Dom {00ff00}na sprzedaż\n{ffffff}Lokalizacja: {00ff00}%s\n{ffffff}Cena: {00ff00}${FFFFFF}%d", id, pZone, House[id][h_Price]));
    }
    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, House[id][h_Label], E_STREAMER_X, House[id][h_enter_pos][0]);
    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, House[id][h_Label], E_STREAMER_Y, House[id][h_enter_pos][1]);
    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, House[id][h_Label], E_STREAMER_Z, House[id][h_enter_pos][2]);
    Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, House[id][h_Label], E_STREAMER_WORLD_ID, House[id][h_enter_vw]);
    return 1;
}

stock House_UpdatePickup(id)
{
    if(!IsValidDynamicPickup(House[id][h_Pickup])) return 0;

    Streamer_SetIntData(STREAMER_TYPE_PICKUP, House[id][h_Pickup], E_STREAMER_MODEL_ID, (House[id][h_Owner] > 0) ? 1272 : 1273);
    Streamer_SetFloatData(STREAMER_TYPE_PICKUP, House[id][h_Pickup], E_STREAMER_X, House[id][h_enter_pos][0]);
    Streamer_SetFloatData(STREAMER_TYPE_PICKUP, House[id][h_Pickup], E_STREAMER_Y, House[id][h_enter_pos][1]);
    Streamer_SetFloatData(STREAMER_TYPE_PICKUP, House[id][h_Pickup], E_STREAMER_Z, House[id][h_enter_pos][2]);
    Streamer_SetIntData(STREAMER_TYPE_PICKUP, House[id][h_Pickup], E_STREAMER_WORLD_ID, House[id][h_enter_vw]);
    return 1;
}

stock House_SafeCount(houseUID)
{
    new count = 0;
    foreach(new i : Items)
    {
        if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_HOUSE || Item[i][i_Owner] != houseUID) continue;
        count++;
    }
    return count;
}

stock House_GetSafeCapacity(houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    new level = House[houseid][h_sejf_level];
    if(level < 1) return 0;
    if(level > 5) level = 5;
    new capacity = 5000 * (100 + 25 * (level - 1)) / 100;
    return capacity;
}

stock House_SetBoostsDialog(playerid, houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return 0;

    SetPVarInt(playerid, "p-house-manage", houseid);
    new string[256];
    new level = House[houseid][h_sejf_level];
    format(string, sizeof(string), "Sejf (%d/5)", level);
    ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_BOOSTS, DIALOG_STYLE_LIST, "Ulepszenia domu", string, (level < 5) ? "Ulepsz" : "Zamknij", "Zamknij");
    return 1;
}

stock House_GetSafeUpgradePrice(nextlevel)
{
    if(nextlevel < 1) nextlevel = 1;
    if(nextlevel > 5) nextlevel = 5;
    return 10000 * nextlevel;
}

stock House_ManageDialog(playerid, houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return 0;

    SetPVarInt(playerid, "p-house-manage", houseid);
    ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_MANAGE, DIALOG_STYLE_LIST, sprintf("Zarządzanie domem %s", House[houseid][h_Name]), 
    sprintf("\
    1. Informacje o domu\n \
    2. %s\n \
    3. Wynajem\n \
    4. Zmień wnętrze\n \
    5. Ustaw spawn\n \
    6. Ulepszenia\n \
    7. {FF0000}Złomuj dom\n \
    ", House[houseid][h_isClosed] ? ("Otwórz") : ("Zamknij")), "Dalej", "Zamknij");
    return 1;
}

stock House_SetInteriorDialog(playerid, houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return 0;

    new string[512];
    string = "Nazwa\tCena";
    DynamicGui_Init(playerid);
    for(new i = 0; i < sizeof(HOUSE_INTERIORS); i++)
    {
        if(HOUSE_INTERIORS[i][__h_inttype] != House[houseid][h_interior_type]) continue;
        format(string, sizeof(string), "%s\n{FFFFFF}%s\t%d{00FF00}$", string, HOUSE_INTERIORS[i][__h_name], (House[houseid][h_exit_pos][0] == 0.0) ? 0 : HOUSE_INTERIORS[i][__h_price]);
        DynamicGui_AddRow(playerid, i);
    }
    ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_CHANGE_INTERIOR, DIALOG_STYLE_TABLIST_HEADERS, "Zmiana wnętrza domu", string, "Zmień", "Cofnij");
    return 1;
}

stock House_SetSpawnConfirmDialog(playerid, houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return 0;

    new string[512];
    format(string, sizeof(string), "{FFFFFF}Czy na pewno chcesz spawnowac sie w domu?.");
    ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_SETSPAWN_CONFIRM, DIALOG_STYLE_MSGBOX, "Spawnowanie w domu", string, "{00FF00}Tak", "Nie");
    return 1;
}

stock House_ScrapHouseConfirmDialog(playerid, houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return 0;
    new price = House[houseid][h_Price];
    new refund = (price * 75) / 100;
    new string[512];
    format(string, sizeof(string), "{FFFFFF}Czy na pewno chcesz złomować swój dom?\n\
    Otrzymasz {00FF00}$%d{FFFFFF} zwrotu z ceny zakupu (75%%).", refund);
    ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_SCRAPHOUSE_CONFIRM, DIALOG_STYLE_MSGBOX, "Zlomowanie domu", string, "{FF0000}Tak", "Nie");
    return 1;
}

stock House_Lock(playerid, houseid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    House[houseid][h_isClosed] = !House[houseid][h_isClosed];
    sendTipMessage(playerid, sprintf("Zamek w domu %s.", (House[houseid][h_isClosed] ? ("zablokowany") : ("odblokowany"))));
    return 1;
}

stock House_FindNearest(Float:enter_x, Float:enter_y, Float:enter_z, enter_vw, Float:range = 2.0)
{
    foreach(new i : House_iterator)
    {
        if(House[i][h_ID] <= 0) continue;
        if(GetDistanceBetweenPoints(enter_x, enter_y, enter_z, House[i][h_enter_pos][0], House[i][h_enter_pos][1], House[i][h_enter_pos][2]) < range && enter_vw == House[i][h_enter_vw])
            return i;
    }
    return -1;
}

stock House_PlayerGetID(playerid, bool:inside = false)
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    if(inside)
    {
        new houseid = PlayerInfo[playerid][pDomWKJ];
        if(houseid > 0 && Iter_Contains(House_iterator, houseid))
        {
            if(House[houseid][h_exit_vw] == GetPlayerVirtualWorld(playerid) && House[houseid][h_exit_int] == GetPlayerInterior(playerid))
                return houseid;
        }
        return -1;
    }
    else return House_FindNearest(x, y, z, GetPlayerVirtualWorld(playerid), 1);
}

stock House_Enter(playerid)
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendErrorMessage(playerid, "Musisz być pieszo, aby wejść do domu.");
    
    new houseid = House_PlayerGetID(playerid);
    if(houseid == -1) return 0;
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(House[houseid][h_Owner] <= 0 || House[houseid][h_exit_pos][0] == 0.0 || House[houseid][h_exit_vw] <= HOUSE_INT_VW) return sendErrorMessage(playerid, "Ten dom nie posiada ustalonego wnętrza.");
    if(House[houseid][h_isClosed]) return sendTipMessage(playerid, "Ten dom jest zamknięty.");
    SetPlayerVirtualWorld(playerid, House[houseid][h_exit_vw]);
    SetPlayerInterior(playerid, House[houseid][h_exit_int]);
    SetPlayerPos(playerid, House[houseid][h_exit_pos][0], House[houseid][h_exit_pos][1], House[houseid][h_exit_pos][2]);
    SetPlayerFacingAngle(playerid, 0);
    Wchodzenie(playerid);
    PlayerInfo[playerid][pDomWKJ] = houseid;
    return 1;
}

stock House_SetInterior(houseid, interiorid)
{
    if(!Iter_Contains(House_iterator, houseid)) return 0;
    if(interiorid < 0 || interiorid >= sizeof(HOUSE_INTERIORS)) return 0;

    if(House[houseid][h_exit_vw] <= HOUSE_INT_VW) House[houseid][h_exit_vw] = HOUSE_INT_VW + House[houseid][h_ID];
    if(HOUSE_INTERIORS[interiorid][__h_isempty] == true)
    {
        foreach(new i : DynamicObjects)
        {
            if(ObjectInfo[i][o_VW] == House[houseid][h_exit_vw] && House[houseid][h_exit_vw] != 0)
            {
                UsunObiekt(i);
            }
        }
        //House_CreateEmptyInterior(houseid, HOUSE_INTERIORS[interiorid][__h_inttype]);
        switch(HOUSE_INTERIORS[interiorid][__h_inttype])
        {
            case INTERIOR_TYPE_SMALL:
            {
                CreateInteriorSquare(
                House[houseid][h_enter_pos][0], House[houseid][h_enter_pos][1], House[houseid][h_enter_pos][2]+100,   // środek
                12.0, 10.0,      // width, depth
                19379,
                19379,
                19379,
                House[houseid][h_exit_vw], House[houseid][h_exit_int],           // worldid, interiorid
                houseid                // ownerid
                );
            }
            case INTERIOR_TYPE_MEDIUM:
            {
                CreateInteriorSquare(
                House[houseid][h_enter_pos][0], House[houseid][h_enter_pos][1], House[houseid][h_enter_pos][2]+100,   // środek
                18.0, 20.0,      // width, depth
                19379,
                19379,
                19379,
                House[houseid][h_exit_vw], House[houseid][h_exit_int],           // worldid, interiorid
                houseid                // ownerid
                );
            }
            case INTERIOR_TYPE_LARGE:
            {
                CreateInteriorSquare(
                House[houseid][h_enter_pos][0], House[houseid][h_enter_pos][1], House[houseid][h_enter_pos][2]+100,   // środek
                25.0, 35.0,      // width, depth
                19379,
                19379,
                19379,
                House[houseid][h_exit_vw], House[houseid][h_exit_int],           // worldid, interiorid
                houseid                // ownerid
                );
            }
        }
    }

    if(!HOUSE_INTERIORS[interiorid][__h_isempty])
    {
        House[houseid][h_exit_pos][0] = HOUSE_INTERIORS[interiorid][__h_x];
        House[houseid][h_exit_pos][1] = HOUSE_INTERIORS[interiorid][__h_y];
        House[houseid][h_exit_pos][2] = HOUSE_INTERIORS[interiorid][__h_z];
        House[houseid][h_exit_int]    = HOUSE_INTERIORS[interiorid][__h_interiorid];
    }
    House_Save(houseid);
    return 1;
}

stock House_Exit(playerid)
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendErrorMessage(playerid, "Musisz być pieszo, aby wejść do domu.");
    
    new houseid = PlayerInfo[playerid][pDomWKJ];
    if(houseid == -1) return 0;
    if(GetPlayerVirtualWorld(playerid) != House[houseid][h_exit_vw]) return 0;
    if(House[houseid][h_isClosed]) return sendTipMessage(playerid, "Ten dom jest zamknięty.");
    SetPlayerVirtualWorld(playerid, House[houseid][h_enter_vw]);
    SetPlayerPos(playerid, House[houseid][h_enter_pos][0], House[houseid][h_enter_pos][1], House[houseid][h_enter_pos][2]);
    SetPlayerInterior(playerid, 0);
    Wchodzenie(playerid);
    PlayerInfo[playerid][pDomWKJ] = -1;
    return 1;
}

ptask CheckHouse[1000](playerid)
{
    if(PlayerInfo[playerid][pDomWKJ] != -1)
    {
        new houseid = PlayerInfo[playerid][pDomWKJ];
        if(!Iter_Contains(House_iterator, houseid)) 
            PlayerInfo[playerid][pDomWKJ] = -1;
        if(!House[houseid][h_ID] || House[houseid][h_exit_vw] != GetPlayerVirtualWorld(playerid) || !IsPlayerInRangeOfPoint(playerid, 200, House[houseid][h_exit_pos][0], House[houseid][h_exit_pos][1], House[houseid][h_exit_pos][2]))
            PlayerInfo[playerid][pDomWKJ] = -1;
    }
    return 1;
}