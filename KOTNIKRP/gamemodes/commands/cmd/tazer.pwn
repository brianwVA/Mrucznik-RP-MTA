forward Tazer_UseDelayed(playerid, itemid);

YCMD:tazer(playerid, params[])
{
    if(IsAPolicja(playerid)) {
        if(gettime() - GetPVarInt(playerid, "lastDamage") < 60) return sendErrorMessage(playerid, "Nie możesz tego użyć podczas walki!");

        new has_tazer = 0;
        foreach(new x : PlayerItems[playerid])
        {
            new itemid = PlayerItem[playerid][x][player_item_id];
            if(Item[itemid][i_ItemType] != ITEM_TYPE_WEAPON) continue;
            if(Item[itemid][i_ValueSecret] != 2) continue;
            if(Item[itemid][i_Value1] != 23) continue;
            if(Item[itemid][i_Value2] < 1) continue;

            if(Item[itemid][i_Used]) {
                return sendErrorMessage(playerid, "Masz juz wyciagniety paralizator!");
            }
            has_tazer = itemid;
            break;
        }

        if(has_tazer == 0) {
            return sendErrorMessage(playerid, "Nie posiadasz paralizatora lub skonczyla sie w nim amunicja!");
        }

        foreach(new x : PlayerItems[playerid])
        {
            new itemid = PlayerItem[playerid][x][player_item_id];
            if(Item[itemid][i_ItemType] != ITEM_TYPE_WEAPON) continue;
            if(!Item[itemid][i_Used]) continue;
            new weaponid = Item[itemid][i_Value1];

            if(weaponid == 22 || weaponid == 23 || weaponid == 24)
            {
                Item_Use(playerid, itemid);
                break;
            }
        }

        SetTimerEx("Tazer_UseDelayed", 60, false, "ii", playerid, has_tazer);
    }
    else {
        sendErrorMessage(playerid, "Nie jesteś w służbie policji.");
    }
    return 1;
}

public Tazer_UseDelayed(playerid, itemid)
{
    if(!IsPlayerConnected(playerid)) return 1;
    Item_Use(playerid, itemid);
    return 1;
}