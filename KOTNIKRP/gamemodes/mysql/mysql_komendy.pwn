
MruMySQL_ClearZone(zoneid)
{
    new str[64];
    format(str, 64, "UPDATE `mru_strefy` SET `gang`='0' WHERE `id`='%d'", zoneid);
    mysql_query(Database, str);
}

MruMySQL_CzyjToNumer(playerid, number)
{
    new string[128], string_two[144], connected_status, selectedplayer = INVALID_PLAYER_ID, nick[MAX_PLAYER_NAME + 1], Cache:result;
    format(string, sizeof(string), "SELECT `owner` FROM mru_items WHERE `value1`='%d' AND `owner_type` = '%d' AND `item_type` = '%d'", number, ITEM_OWNER_TYPE_PLAYER, ITEM_TYPE_PHONE);
    result = mysql_query(Database, string);
    if(cache_num_rows())
    {
        new uid;
        cache_get_value_index_int(0, 0, uid);
        cache_delete(result);
        format(string, sizeof(string), "SELECT `Nick`, `connected` FROM mru_konta WHERE `UID`='%d'", uid);
        result = mysql_query(Database, string);
        for(new i = 0; i < cache_num_rows(); i++)
        {
            cache_get_value_index(i, 0, nick);
            cache_get_value_index_int(i, 1, connected_status);
            if(connected_status)
            {
                foreach(new x : Player)
                {
                    if(gPlayerLogged[x] != 0)
                    {
                        if(strcmp(GetNickEx(x), nick, true, strlen(nick)) == 0)
                        {
                            selectedplayer = x;
                        }
                    }
                }
            }
            format(string_two, sizeof(string_two), "{%s}(%s) {FFFFFF}%s%s", 
                connected_status > 0 ? "00FF00" : "FF0000",
                connected_status > 0 ? "Online" : "Offline",
                nick,
                selectedplayer != INVALID_PLAYER_ID ? sprintf(" [%d]", selectedplayer) : ""
            );
            
            SendClientMessage(playerid, COLOR_WHITE, string_two);
            selectedplayer = INVALID_PLAYER_ID;
        }
    }
    cache_delete(result);
}

MruMySQL_Gangzone(zoneid)
{
    new str[64];
    format(str, sizeof(str), "UPDATE `mru_config` SET `gangzone`='%d'", zoneid);
    mysql_tquery(Database, str);
}

MruMySQL_KodStanowca(code)
{
    new lStr[64];
    format(lStr, sizeof(lStr), "UPDATE `mru_config` SET `stanowe_key`='%d'", code);
    mysql_tquery(Database, lStr);
}

MruMySQL_SetZoneControl(frac, id)
{
    new str[128];
    format(str, 128, "UPDATE `mru_strefy` SET `gang`='%d' WHERE `id`='%d'", frac, id);
    mysql_tquery(Database, str);
}

MruMySQL_ChangePassword(nick[], password[])
{
    new string[256];
    new escaped_nick[MAX_PLAYER_NAME + 1];
    new hashedPassword[WHIRLPOOL_LEN], salt[SALT_LENGTH];
    randomString(salt, sizeof(salt));
    WP_Hash(hashedPassword, sizeof(hashedPassword), sprintf("%s%s%s", ServerSecret, password, salt));
    mysql_escape_string(nick, escaped_nick);
    format(string, sizeof(string), "UPDATE `mru_konta` SET `Key` = '%s', `Salt` = '%s' WHERE `Nick` = '%s'", hashedPassword, salt, escaped_nick);
    mysql_tquery(Database, string);
}

MruMySQL_ZoneDelay(zoneid)
{
    new str[64];
    format(str, sizeof(str), "UPDATE `mru_config` SET `gangtimedelay`='%d'", zoneid);
    mysql_tquery(Database, str);
}
