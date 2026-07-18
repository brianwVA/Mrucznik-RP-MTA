//

stock ItemBags_ShowBag(playerid, bagid)
{
    if(!Iter_Contains(Items, bagid)) return 0;

    new string[1024], count = 0;
    string = "#\tNazwa\tInfo";
    DynamicGui_Init(playerid);
    DynamicGui_SetDialogValue(playerid, bagid);
    foreach(new itemid : Items)
    {
        if(Item[itemid][i_UID] <= 0 || Item[itemid][i_Owner] != Item[bagid][i_UID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_BAG) continue;
        if(count >= MAX_ITEM_BAG) break;
        format(string, sizeof(string), "%s\n%d\t{196e75}%s x%d\t{000000}(%d, %d)", string, itemid, Item[itemid][i_Name], Item[itemid][i_Quantity], Item[itemid][i_Value1], Item[itemid][i_Value2]);
        DynamicGui_AddRow(playerid, itemid);
        count += (Item[itemid][i_ValueSecret] == ITEM_NOT_COUNT) ? 1 : Item[itemid][i_Quantity];
    }

    if(count < MAX_ITEM_BAG) strcat(string, "\n{dae3dc}Schowaj przedmiot");
    DynamicGui_AddRow(playerid, -1234);
    ShowPlayerDialogEx(playerid, D_BAG_ITEMS, DIALOG_STYLE_TABLIST_HEADERS, sprintf("%s (%d/%d)", Item[bagid][i_Name], count, MAX_ITEM_BAG), string, "Dalej", "Zamknij");
    return 1;
}

stock ItemBags_ItemCount(bagid)
{
    if(!Iter_Contains(Items, bagid)) return 0;
    new count = 0;
    foreach(new i : Items)
    {
        if(Item[i][i_OwnerType] == ITEM_OWNER_TYPE_BAG && Item[i][i_Owner] == Item[bagid][i_UID])
        {
            if(Item[i][i_ValueSecret] == ITEM_NOT_COUNT)
			    count += 1;
            else
                count += Item[i][i_Quantity];
        }
    }
    return count;
}

stock ItemBags_PutItemDialog(playerid, bagid)
{
    if(!Iter_Contains(Items, bagid)) return 0;

    new string[2048], count = 0;
    string = "Przedmiot\tInfo";

    DynamicGui_Init(playerid);
    DynamicGui_SetDialogValue(playerid, bagid);
    foreach(new x : PlayerItems[playerid])
    {
        new itemid = PlayerItem[playerid][x][player_item_id];
        if(!Iter_Contains(Items, itemid)) continue;
        if(Item[itemid][i_Used] || !CanDrop(Item[itemid][i_ItemType], itemid) || Item[itemid][i_ItemType] == ITEM_TYPE_BAG) continue;

        format(string, sizeof(string), "%s\n{196e75}%s x%d\t{000000}(%d, %d)", string, Item[itemid][i_Name], Item[itemid][i_Quantity], Item[itemid][i_Value1], Item[itemid][i_Value2]);
        DynamicGui_AddRow(playerid, itemid);
        count++;
    }
    if(count <= 0)
    {
        ItemBags_ShowBag(playerid, bagid);
        sendErrorMessage(playerid, "Nie posiadasz żadnych przedmiotów do schowania.");
        return 0;
    }
    ShowPlayerDialogEx(playerid, D_BAG_PUT_ITEM, DIALOG_STYLE_TABLIST_HEADERS, Item[bagid][i_Name], string, "Schowaj", "Wróć");
    return 1;
}

stock ItemBags_PutItemInBag(playerid, itemid, bagid, quant = 1)
{
    if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
    if(Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER || Item[itemid][i_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela obiektu.");

    //fix quant
    new item_quant = Item[itemid][i_Quantity];
    if(quant > item_quant) quant = item_quant;
    if(quant < 1)          quant = 1;
    if(item_quant <= 0)    return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem ilości przedmiotów.");
    if( (ItemBags_ItemCount(bagid) + quant) > MAX_ITEM_BAG )
        return sendErrorMessage(playerid, sprintf("Tyle przedmiotów nie pomieści się w tym plecaku. (%d/%d)", ItemBags_ItemCount(bagid) + quant, MAX_ITEM_BAG));
    //

    Log(itemLog, INFO, "%s put item %s in bag %s (x%d)", GetPlayerLogName(playerid), GetItemLogName(itemid), GetItemLogName(bagid), quant);
    if(quant > 1 && quant != item_quant)
    {
        Item[itemid][i_Quantity] -= quant;
        new newid = Item_Add(Item[itemid][i_Name], ITEM_OWNER_TYPE_BAG, Item[bagid][i_UID], Item[itemid][i_ItemType], Item[itemid][i_Value1], Item[itemid][i_Value2], true, INVALID_PLAYER_ID, quant, Item[itemid][i_ValueSecret]);
        if(Item[itemid][i_Quantity] <= 0)
        {
            Item_Delete(itemid);
        }
        Log(itemLog, INFO, "%s put item %s in bag %s (x%d) and created new item %s", GetPlayerLogName(playerid), GetItemLogName(itemid), GetItemLogName(bagid), quant, GetItemLogName(newid));
    }
    else
    {
        Item_SetOwner(itemid, ITEM_OWNER_TYPE_BAG, Item[bagid][i_UID]);
        ItemBags_ShowBag(playerid, bagid);
    }
    return 1;
}

stock ItemBags_GetItemFromBag(playerid, itemid, bagid, quant = 1)
{
    if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
    if(Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_BAG || Item[itemid][i_Owner] != Item[bagid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela obiektu.");

    //fix quant
    new item_quant = Item[itemid][i_Quantity];
    if(quant > item_quant) quant = item_quant;
    if(quant < 1)          quant = 1;
    if(item_quant <= 0)    return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem ilości przedmiotów.");
    if( (Item_Count(playerid) + quant) > GetPlayerItemLimit(playerid) ) 
        return sendErrorMessage(playerid, sprintf("Nie pomieścisz tylu przedmiotów w swoim ekwipunku. (%d/%d)", Item_Count(playerid) + quant, GetPlayerItemLimit(playerid)));
    //

    Log(itemLog, INFO, "%s got item %s from bag %s (x%d)", GetPlayerLogName(playerid), GetItemLogName(itemid), GetItemLogName(bagid), quant);
    return Item_Pickup(playerid, itemid, quant, false);
}