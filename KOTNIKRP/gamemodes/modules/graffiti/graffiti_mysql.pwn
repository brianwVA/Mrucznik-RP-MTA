//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                  graffiti                                                 //
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
// Autor: Sandał
// Data utworzenia: 01.02.2020
//Opis:
/*
	System graffiti
*/

//

//------------------<[ MySQL: ]>--------------------
stock graffiti_LoadMySQL(id = -1)
{
	new query[1024];
	new lStr[263]; 
	new string[128];
	new valueGraffiti;
	new loadedGraffiti;
	new Cache:result;
	format(lStr, sizeof(lStr), "SELECT COUNT(*) FROM `mru_graffiti`");
	result = mysql_query(Database, lStr);
	cache_get_value_index_int(0, 0, valueGraffiti);
	cache_delete(result);
	new i = -1;

	inline OnGraffitiLoaded()
	{
		if (cache_num_rows())
		{
			cache_get_value_index(0, 0,                     GraffitiInfo[i][pOwner]);
			cache_get_value_index(0, 1,                     GraffitiInfo[i][grafText]);
			cache_get_value_index_int(0, 2,                         GraffitiInfo[i][gColor]);
			cache_get_value_index_float(0, 3,                       GraffitiInfo[i][grafXpos]);
			cache_get_value_index_float(0, 4,                       GraffitiInfo[i][grafYpos]);
			cache_get_value_index_float(0, 5,                       GraffitiInfo[i][grafZpos]);
			cache_get_value_index_float(0, 6,                       GraffitiInfo[i][grafXYpos]);
			cache_get_value_index_float(0, 7,                       GraffitiInfo[i][grafYYpos]);
			cache_get_value_index_float(0, 8,                       GraffitiInfo[i][grafZYpos]);
			loadedGraffiti++;

			graffiti_DefineColor(i);
			strreplace(GraffitiInfo[i][grafText], "~n~", "\n", .ignorecase = true);
			strreplace(GraffitiInfo[i][grafText], "'", "\'", .ignorecase = true);
			GraffitiInfo[i][gID] = CreateDynamicObject(19482, GraffitiInfo[i][grafXpos], GraffitiInfo[i][grafYpos], GraffitiInfo[i][grafZpos], GraffitiInfo[i][grafXYpos], GraffitiInfo[i][grafYYpos], GraffitiInfo[i][grafZYpos], 0, 0, -1, 200);
			SetDynamicObjectMaterialText(GraffitiInfo[i][gID], 0, GraffitiInfo[i][grafText], OBJECT_MATERIAL_SIZE_512x128, "Arial", 24, 0, GraffitiInfo[i][gColor], 0, 1);
		}
		else graffiti_Zeruj(i);
	}

	if(id == -1)
	{
		for(new x; x < GRAFFITI_MAX; x++) 
		{
			lStr = "`ownerName`, `text`, `kolor`, `x`, `y`, `z`, `xy`, `yy`, `zy`";
			format(query, sizeof(query), "SELECT %s FROM `mru_graffiti` WHERE `id`='%d'", lStr, x);
			i = x;
			MySQL_TQueryInline(Database, using inline OnGraffitiLoaded, query); 
		}
		format(string, sizeof(string), "Zaladowano %d graffiti z %d w bazie", loadedGraffiti, valueGraffiti);
		print(string);
	}
	else
	{
		lStr = "`ownerName`, `text`, `kolor`, `x`, `y`, `z`, `xy`, `yy`, `zy`";
		format(query, sizeof(query), "SELECT %s FROM `mru_graffiti` WHERE `id`='%d'", lStr, id);
		i = id;
		MySQL_TQueryInline(Database, using inline OnGraffitiLoaded, query); 
	}
	return 0;
}
stock graffiti_SaveMySQL(id, playerid)
{
	new query[1024], escaped_text[128];
	mysql_escape_string(GraffitiInfo[id][grafText], escaped_text);
	format(query, sizeof(query), "INSERT INTO `mru_graffiti`(`id`, `ownerName`, `text`, `kolor`, `x`, `y`, `z`, `xy`, `yy`, `zy`) VALUES ('%d', '%s', '%s', '%d', '%f', '%f', '%f', '%f', '%f', '%f')",
	id,
	GetNickEx(playerid),
	escaped_text,
	GraffitiInfo[id][gColor],
	GraffitiInfo[id][grafXpos],
	GraffitiInfo[id][grafYpos],
	GraffitiInfo[id][grafZpos],
	GraffitiInfo[id][grafXYpos],
	GraffitiInfo[id][grafYYpos],
	GraffitiInfo[id][grafZYpos]);
	mysql_query(Database, query);
}

stock graffiti_UpdateMySQL(id, type = 1)
{
	new query[1024], escaped_text[128];
	if(type == 1)
	{
		format(query, sizeof(query), "UPDATE `mru_graffiti` SET `x`='%f',`y`='%f',`z`='%f',`xy`='%f',`yy`='%f',`zy`='%f' WHERE `id`='%d'",
		GraffitiInfo[id][grafXpos],
		GraffitiInfo[id][grafYpos],
		GraffitiInfo[id][grafZpos],
		GraffitiInfo[id][grafXYpos],
		GraffitiInfo[id][grafYYpos],
		GraffitiInfo[id][grafZYpos],
		id);
		mysql_tquery(Database, query);
	}
	else if(type == 2)
	{
		if(strlen(GraffitiInfo[id][grafText]) <= 1)
		{
			DestroyDynamicObject(GraffitiInfo[id][gID]);
			graffiti_DeleteMySQL(id);
			graffiti_Zeruj(id);
		}
		else
		{
			mysql_escape_string(GraffitiInfo[id][grafText], escaped_text);
			format(query, sizeof(query), "UPDATE `mru_graffiti` SET `text`='%s',`kolor`='%d' WHERE `id`='%d'",
			escaped_text,
			GraffitiInfo[id][gColor],
			id);
			mysql_tquery(Database, query);
		}
	}
}

stock graffiti_DeleteMySQL(id)
{
	DestroyDynamicObject(GraffitiInfo[id][gID]);
	new query[1024];
	format(query, sizeof(query), "DELETE FROM `mru_graffiti` WHERE `id`='%d'", id);
	mysql_tquery(Database, query);
	graffiti_Zeruj(id);
}

//stock graffiti_UpdateMySQL(id)
//end