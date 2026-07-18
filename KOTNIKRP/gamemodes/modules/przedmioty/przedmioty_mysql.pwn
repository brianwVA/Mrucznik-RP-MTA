//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                 przedmioty                                                //
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Autor: renosk
// Data utworzenia: 06.05.2021
//Opis:
/*
	System przedmiotów
*/

//

//------------------<[ MySQL: ]>--------------------

SaveItem(itemid)
{
	if(Item[itemid][i_UID] == 0) return 0;
	mysql_tquery_format("UPDATE `mru_items` SET `name` = '%s', \
	`X` = '%f', `Y` = '%f', `Z` = '%f', \
	`vw` = '%d', `int` = '%d', \
	`dropped` = '%d', \
	`owner_type` = '%d', `owner` = '%d', \
	`item_type` = '%d', \
	`value1` = '%d', `value2` = '%d', \
	`used` = '%d', \
	`quantity` = '%d', \
	`secretValue` = '%d', \
	`receive_time` = '%d', \
	`last_update` = '%d'\
	WHERE UID = '%d'", 
	Item[itemid][i_Name],
	Item[itemid][i_Pos][0], Item[itemid][i_Pos][1], Item[itemid][i_Pos][2], 
	Item[itemid][i_VW], Item[itemid][i_INT],
	Item[itemid][i_Dropped],
	Item[itemid][i_OwnerType], Item[itemid][i_Owner],
	Item[itemid][i_ItemType],
	Item[itemid][i_Value1], Item[itemid][i_Value2], 
	Item[itemid][i_Used],
	Item[itemid][i_Quantity],
	Item[itemid][i_ValueSecret],
Item[itemid][i_ReceiveTime],
	gettime(),
	Item[itemid][i_UID]);
	return 1;
}

LoadItems()
{
	mysql_query(Database, "ALTER TABLE `mru_items` ADD COLUMN IF NOT EXISTS `receive_time` INT(11) NOT NULL DEFAULT 0");

	new query[456], Cache:result;
	query = "`UID`, `name`, `X`, `Y`, `Z`, `vw`, `int`, `dropped`, `owner_type`, `owner`, `item_type`, `value1`, `value2`, `used`, `quantity`, `secretValue`, `receive_time`";
	format(query, sizeof query, "SELECT %s FROM `mru_items` WHERE `owner_type` != '"#ITEM_OWNER_TYPE_PLAYER"' LIMIT %d", query, MAX_ITEMS);
	result = mysql_query(Database, query);
	for(new i = 0; i < cache_num_rows(); i++)
	{
		new id = Iter_Free(Items);
		if(id == -1) return 0;
		cache_get_value_index_int(i, 0,                 Item[id][i_UID]);
		cache_get_value_index(i, 1,             		Item[id][i_Name]);
		cache_get_value_index_float(i, 2,               Item[id][i_Pos][0]);
		cache_get_value_index_float(i, 3,               Item[id][i_Pos][1]);
		cache_get_value_index_float(i, 4,               Item[id][i_Pos][2]);
		cache_get_value_index_int(i, 5,                 Item[id][i_VW]);
		cache_get_value_index_int(i, 6,                 Item[id][i_INT]);
		cache_get_value_index_int(i, 7,                 Item[id][i_Dropped]);
		cache_get_value_index_int(i, 8,                 Item[id][i_OwnerType]);
		cache_get_value_index_int(i, 9,                 Item[id][i_Owner]);
		cache_get_value_index_int(i, 10,                Item[id][i_ItemType]);
		cache_get_value_index_int(i, 11,                Item[id][i_Value1]);
		cache_get_value_index_int(i, 12,                Item[id][i_Value2]);
		cache_get_value_index_int(i, 13,                Item[id][i_Used]);
		cache_get_value_index_int(i, 14,                Item[id][i_Quantity]);
		cache_get_value_index_int(i, 15,                Item[id][i_ValueSecret]);
		cache_get_value_index_int(i, 16,                Item[id][i_ReceiveTime]);
		Iter_Add(Items, id);
	}
	cache_delete(result);
	printf("[ITEM-LOAD] Załadowano łącznie %d przedmiotów", Iter_Count(Items));
	return 1;
}

LoadItem(uid, loadedby = INVALID_PLAYER_ID)
{
	inline OnItemLoaded()
	{
		if(!cache_num_rows())
		{
			if(IsPlayerConnected(loadedby)) sendErrorMessage(loadedby, "Przedmiot o podanym UID nie istnieje w bazie danych.");
			return 1;
		}
		new id = Iter_Free(Items);
		if(id == -1) return 0;

		cache_get_value_index_int(0, 0,                 Item[id][i_UID]);
		cache_get_value_index(0, 1,             		Item[id][i_Name]);
		cache_get_value_index_float(0, 2,               Item[id][i_Pos][0]);
		cache_get_value_index_float(0, 3,               Item[id][i_Pos][1]);
		cache_get_value_index_float(0, 4,               Item[id][i_Pos][2]);
		cache_get_value_index_int(0, 5,                 Item[id][i_VW]);
		cache_get_value_index_int(0, 6,                 Item[id][i_INT]);
		cache_get_value_index_int(0, 7,                 Item[id][i_Dropped]);
		cache_get_value_index_int(0, 8,                 Item[id][i_OwnerType]);
		cache_get_value_index_int(0, 9,                 Item[id][i_Owner]);
		cache_get_value_index_int(0, 10,                Item[id][i_ItemType]);
		cache_get_value_index_int(0, 11,                Item[id][i_Value1]);
		cache_get_value_index_int(0, 12,                Item[id][i_Value2]);
		cache_get_value_index_int(0, 13,                Item[id][i_Used]);
		cache_get_value_index_int(0, 14,                Item[id][i_Quantity]);
		cache_get_value_index_int(0, 15,                Item[id][i_ValueSecret]);
		cache_get_value_index_int(0, 16,                Item[id][i_ReceiveTime]);
		Iter_Add(Items, id);

		if(IsPlayerConnected(loadedby))
		{
			sendTipMessage(loadedby, sprintf("Załadowano obiekt o UID: %d (%s, id: %d)", uid, Item[id][i_Name], id));
		}
	}

	new query[428];
	query = "`UID`, `name`, `X`, `Y`, `Z`, `vw`, `int`, `dropped`, `owner_type`, `owner`, `item_type`, `value1`, `value2`, `used`, `quantity`, `secretValue`, `receive_time`";
	format(query, sizeof query, "SELECT %s FROM `mru_items` WHERE `UID` = '%d'", query, uid);
	MySQL_TQueryInline(Database, using inline OnItemLoaded, query);
	return 1;
}

LoadPlayerItems(playerid)
{
	inline OnPlayerItemsLoaded()
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			new id = Iter_Free(Items), pid = Iter_Free(PlayerItems[playerid]);
			if(id == -1 || pid == -1) break;

			new uid, isLoaded = -1;
			cache_get_value_index_int(i, 0,                 uid);
			//anti copying items
			isLoaded = Memory_IsItemLoaded(uid);
			if(isLoaded != -1) //Item is already saved in memory
			{
				//sprawdzic
				if(Item[isLoaded][i_Owner] == PlayerInfo[playerid][pUID] && Item[isLoaded][i_OwnerType] == ITEM_OWNER_TYPE_PLAYER){
					Memory_LoadItemForPlayer(playerid, isLoaded, pid);
				}
				else{
					Log(errorLog, ERROR, "BLAD DUPLIKACJI: %s probowal zaladowac przedmiot %s ktory nalezy do innego gracza (Owner: %d, OwnerType: %d)", GetPlayerLogName(playerid), GetItemLogName(isLoaded), Item[isLoaded][i_Owner], Item[isLoaded][i_OwnerType]);
				}
				continue;
			}
			//
			cache_get_value_index(i, 1,             Item[id][i_Name]);
			cache_get_value_index_float(i, 2,               Item[id][i_Pos][0]);
			cache_get_value_index_float(i, 3,               Item[id][i_Pos][1]);
			cache_get_value_index_float(i, 4,               Item[id][i_Pos][2]);
			cache_get_value_index_int(i, 5,                 Item[id][i_VW]);
			cache_get_value_index_int(i, 6,                 Item[id][i_INT]);
			cache_get_value_index_int(i, 7,                 Item[id][i_Dropped]);
			cache_get_value_index_int(i, 8,                 Item[id][i_OwnerType]);
			cache_get_value_index_int(i, 9,                 Item[id][i_Owner]);
			cache_get_value_index_int(i, 10,                Item[id][i_ItemType]);
			cache_get_value_index_int(i, 11,                Item[id][i_Value1]);
			cache_get_value_index_int(i, 12,                Item[id][i_Value2]);
			cache_get_value_index_int(i, 13,                Item[id][i_Used]);
			cache_get_value_index_int(i, 14,                Item[id][i_Quantity]);
			cache_get_value_index_int(i, 15,                Item[id][i_ValueSecret]);
			cache_get_value_index_int(i, 16,                Item[id][i_ReceiveTime]);
			Item[id][i_UID] = uid;
			Iter_Add(Items, id);

			////////////////////////////////////////////////////////////////////////////////
			Memory_LoadItemForPlayer(playerid, id, pid);
		}
	}

	if(PlayerInfo[playerid][pUID] < 1) return 0;
	new query[428];
	query = "`UID`, `name`, `X`, `Y`, `Z`, `vw`, `int`, `dropped`, `owner_type`, `owner`, `item_type`, `value1`, `value2`, `used`, `quantity`, `secretValue`, `receive_time`";
	format(query, sizeof query, "SELECT %s FROM `mru_items` WHERE `owner_type` = '"#ITEM_OWNER_TYPE_PLAYER"' AND `owner` = '%d' LIMIT %d", query, PlayerInfo[playerid][pUID], MAX_ITEMS);
	MySQL_TQueryInline(Database, using inline OnPlayerItemsLoaded, query);
	return 1;
}

forward LoadDroppedPlayerItems(puid);
public LoadDroppedPlayerItems(puid)
{
	new query[456], Cache:result;
	query = "`UID`, `name`, `X`, `Y`, `Z`, `vw`, `int`, `dropped`, `owner_type`, `owner`, `item_type`, `value1`, `value2`, `used`, `quantity`, `secretValue`";
	format(query, sizeof query, "SELECT %s FROM `mru_items` WHERE `owner_type` = '"#ITEM_OWNER_TYPE_DROPPED"' AND `owner` = '%d' LIMIT %d", query, puid, MAX_ITEMS);
	result = mysql_query(Database, query);
	for(new i = 0; i < cache_num_rows(); i++)
	{
		new id = Iter_Free(Items);
		if(id == -1) return 0;
		new uid, isLoaded = -1;
		
		cache_get_value_index_int(i, 0,                 uid);
		//anti copying items
		isLoaded = Memory_IsItemLoaded(uid);
		if(isLoaded != -1) //Item is already saved in memory
		{
			continue;
		}
		cache_get_value_index_int(i, 0,                 Item[id][i_UID]);
		cache_get_value_index(i, 1,             		Item[id][i_Name]);
		cache_get_value_index_float(i, 2,               Item[id][i_Pos][0]);
		cache_get_value_index_float(i, 3,               Item[id][i_Pos][1]);
		cache_get_value_index_float(i, 4,               Item[id][i_Pos][2]);
		cache_get_value_index_int(i, 5,                 Item[id][i_VW]);
		cache_get_value_index_int(i, 6,                 Item[id][i_INT]);
		cache_get_value_index_int(i, 7,                 Item[id][i_Dropped]);
		cache_get_value_index_int(i, 8,                 Item[id][i_OwnerType]);
		cache_get_value_index_int(i, 9,                 Item[id][i_Owner]);
		cache_get_value_index_int(i, 10,                Item[id][i_ItemType]);
		cache_get_value_index_int(i, 11,                Item[id][i_Value1]);
		cache_get_value_index_int(i, 12,                Item[id][i_Value2]);
		cache_get_value_index_int(i, 13,                Item[id][i_Used]);
		cache_get_value_index_int(i, 14,                Item[id][i_Quantity]);
		cache_get_value_index_int(i, 15,                Item[id][i_ValueSecret]);
		cache_get_value_index_int(i, 16,                Item[id][i_ReceiveTime]);
		Iter_Add(Items, id);
		Item[id][i_3DText] = CreateDynamic3DTextLabel(sprintf("(ID: %d) %s x%d", id, Item[id][i_Name], Item[id][i_Quantity]), COLOR_WHITE, Item[id][i_Pos][0], Item[id][i_Pos][1], Item[id][i_Pos][2], 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, Item[id][i_VW], Item[id][i_INT]);
	}
	cache_delete(result);
	return 1;
}

SaveItems()
{
	foreach(new i : Items)
		SaveItem(i);
	return 1;
}

//end