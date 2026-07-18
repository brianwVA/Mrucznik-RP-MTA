//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 bilboard                                                  //
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
// Autor: xSeLeCTx
// Data utworzenia: 17.07.2022
//Opis:
/*
	System bilboard
*/

//

//-----------------<[ Funkcje: ]>-------------------
stock ConvertBilboardText(bilbtext[])
{
	new tempstring[158];
	format(tempstring, 158, bilbtext);
	strins(tempstring, "{FFFFFF}", 0);
	for(;;)
	{
		new linijka = strfind(tempstring, "/n");
		if(linijka == -1) break;
		else
		{
			strdel(tempstring, linijka, linijka + 2);
			strins(tempstring, "\n", linijka);
		}
	}
	return tempstring;
}

stock CreateBilboard(index)
{
	new string[256];
	if(Bilboard[index][bcreated] == false)
	{
		Bilboard[index][bobjid] = CreateDynamicObject(1260,  Bilboard[index][bposx], Bilboard[index][bposy], Bilboard[index][bposz], 0.0, 0.0, Bilboard[index][brotz], -1, -1, -1, 300, 300, -1, 1);
		Bilboard[index][btextobjid] = CreateDynamicObject(4732, Bilboard[index][bposx], Bilboard[index][bposy], Bilboard[index][bposz] + 6, 0.0, 0.0, Bilboard[index][brotz] + 55, -1, -1, -1, 300, 300, -1, 1);
		format(string, sizeof string, "{FF5E5E}Bilboard\n{FFFF00}ID: %i", index);
		Bilboard[index][btdtid] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, Bilboard[index][bposx], Bilboard[index][bposy], Bilboard[index][bposz], 20);
		Bilboard[index][bcreated] = true;
		UpdateBilboard(index);
	}
	return 1;
}

stock UpdateBilboard(bilbid)
{
	new string[256];
	if(Bilboard[bilbid][btime] == -1)
		format(string, sizeof string, "{FFFFFF}Tutaj moze byc Twoja reklama!\n$%i za dzien", Bilboard[bilbid][bcost]),
		SetDynamicObjectMaterialText(Bilboard[bilbid][btextobjid], 0, string, OBJECT_MATERIAL_SIZE_512x128, "Frutiger Light Cn", 41, 0, 0xFFFF8200, 0xFF000000, 1);
	else
		SetDynamicObjectMaterialText(Bilboard[bilbid][btextobjid], 0, ConvertBilboardText(Bilboard[bilbid][btext]), OBJECT_MATERIAL_SIZE_512x128, "Frutiger Light Cn", 41, 0, 0xFFFF8200, 0xFF000000, 1);
	return 1;
}

stock SaveBilboards()
{
	foreach(new i : Bilboards_Iter)
	{
		if(Bilboard[i][bcreated] && Bilboard[i][bloaded] && Bilboard[i][btime] != -1)
		{
			new query[128];
			format(query, sizeof query, "UPDATE mru_bilboard SET time = '%i' WHERE uid = '%i'", Bilboard[i][btime], Bilboard[i][buid]);
			mysql_tquery(Database, query);
		}
	}
	return 1;
}

stock CreateNewBilboard(Float:x, Float:y, Float:z, Float:rz)
{
	mysql_query_format("INSERT INTO mru_bilboard(`posx`, `posy`, `posz`, `rotz`, `text`, `time`, `cost`, `rentuid`) VALUES('%f', '%f', '%f', '%f', '%s', '%i', '%i', '%i')", x, y, z, rz, "_", -1, 1500, 0);
	OnBilboardCreate(cache_insert_id(), x, y, z, rz);
}

public OnBilboardCreate(id, Float:x, Float:y, Float:z, Float:rz)
{
	new i = Iter_Free(Bilboards_Iter);
	Bilboard[i][bloaded] = true;
	Bilboard[i][bcreated] = false;
	Bilboard[i][buid] = id;
	Bilboard[i][bposx] = x;
	Bilboard[i][bposy] = y;
	Bilboard[i][bposz] = z;
	Bilboard[i][brotz] = rz;
	format(Bilboard[i][btext], 128, "_");
	Bilboard[i][btime] = -1;
	Bilboard[i][bcost] = 1500;
	Bilboard[i][bruid] = 0;
	CreateBilboard(i);
	Iter_Add(Bilboards_Iter, i);
	return 0;
}


public DestroyRentBilboard(playerid, bilbid)
{
	DestroyDynamicObject(PlayerInfo[playerid][RentBilboardPreviewOID]);
	Streamer_ToggleItem(playerid, STREAMER_TYPE_OBJECT, Bilboard[bilbid][btextobjid], true);
	Streamer_Update(playerid);
	PlayerInfo[playerid][RentBilboardPreviewOID] = -1;
	PlayerInfo[playerid][RentBilboardTimer] = -1;
	return 1;
}

stock LoadBilboards()
{
	new i = 0, Cache:result;
	result = mysql_query(Database, "SELECT * FROM `mru_bilboard`");
	for(i = 0; i < cache_num_rows(); i++)
    {
		Bilboard[i][bloaded] = true;
		Bilboard[i][bcreated] = false;

		cache_get_value_index_int(i, 0,                 Bilboard[i][buid]);
		cache_get_value_index_float(i, 1,               Bilboard[i][bposx]);
		cache_get_value_index_float(i, 2,               Bilboard[i][bposy]);
		cache_get_value_index_float(i, 3,               Bilboard[i][bposz]);
		cache_get_value_index_float(i, 4,               Bilboard[i][brotx]);
		cache_get_value_index_float(i, 5,               Bilboard[i][broty]);
		cache_get_value_index_float(i, 6,               Bilboard[i][brotz]);
		cache_get_value_index(i, 7,             		Bilboard[i][btext]);
		cache_get_value_index_int(i, 8,                 Bilboard[i][btime]);
		cache_get_value_index_int(i, 9,                 Bilboard[i][bcost]);
		cache_get_value_index_int(i, 10,                Bilboard[i][bruid]);

		CreateBilboard(i);
		Iter_Add(Bilboards_Iter, i);
	}
	cache_delete(result);
	printf("Załadowano %d bilboardów", i);
	return 1;
}


stock RentBilboard(playerid)
{
	new bilbid = PlayerInfo[playerid][SelectedBilboard];
	if(Bilboard[bilbid][btime] != -1) return -1;
	if(kaska[playerid] >= (PlayerInfo[playerid][SelectedBilboardDays] * Bilboard[bilbid][bcost]))
	{
		format(Bilboard[bilbid][btext], 130, PlayerInfo[playerid][SelectedBilboardText]);
		new year, month, day, hour, minute, second;
		new ts = Timestamp:Now();
		Bilboard[bilbid][btime] = ts + (PlayerInfo[playerid][SelectedBilboardDays] * 24 * 60 * 60);
		Bilboard[bilbid][bruid] = PlayerInfo[playerid][pUID];
		SetDynamicObjectMaterialText(Bilboard[bilbid][btextobjid], 0, ConvertBilboardText(Bilboard[bilbid][btext]), OBJECT_MATERIAL_SIZE_512x128, "Frutiger Light Cn", 41, 0, 0xFFFF8200, 0xFF000000, 1);
		DajKaseDone(playerid, -(PlayerInfo[playerid][SelectedBilboardDays] * Bilboard[bilbid][bcost]));
		mysql_tquery_format("UPDATE mru_bilboard SET text = '%s', time = '%i', rentuid = '%i' WHERE uid = '%i'", PlayerInfo[playerid][SelectedBilboardText], Bilboard[bilbid][btime], PlayerInfo[playerid][pUID], Bilboard[bilbid][buid]);

		Streamer_ToggleItem(playerid, STREAMER_TYPE_OBJECT, Bilboard[bilbid][btextobjid], true);
		Streamer_Update(playerid);
		return 1;
	}
	else return 0;
}

stock UnrentBilboard(playerid)
{
	new bilbid = PlayerInfo[playerid][SelectedBilboard];
	if(Bilboard[bilbid][btime] != -1)
	{
		format(Bilboard[bilbid][btext], 128, "_");
		Bilboard[bilbid][btime] = -1;
		Bilboard[bilbid][bruid] = 0;
		mysql_tquery_format("UPDATE mru_bilboard SET text = '%s', time = '%i', rentuid = '%i' WHERE uid = '%i'", Bilboard[bilbid][btext], Bilboard[bilbid][btime], Bilboard[bilbid][bruid], Bilboard[bilbid][buid]);
		UpdateBilboard(bilbid);
		new string[64];
		format(string, sizeof string, "{FF5E5E}Bilboard\n{FFFF00}ID: %i", bilbid);
		UpdateDynamic3DTextLabelText(Bilboard[bilbid][btdtid], -1, string);
		return 1;
	}
	return 0;
}

stock ForceUnrentBilboard(bilbid)
{
	if(Bilboard[bilbid][btime] != -1)
	{
		format(Bilboard[bilbid][btext], 128, "_");
		Bilboard[bilbid][btime] = -1;
		Bilboard[bilbid][bruid] = 0;
		mysql_tquery_format("UPDATE mru_bilboard SET text = '%s', time = '%i', rentuid = '%i' WHERE uid = '%i'", Bilboard[bilbid][btext], Bilboard[bilbid][btime], Bilboard[bilbid][bruid], Bilboard[bilbid][buid]);
		UpdateBilboard(bilbid);
		new string[64];
		format(string, sizeof string, "{FF5E5E}Bilboard\n{FFFF00}ID: %i", bilbid);
		UpdateDynamic3DTextLabelText(Bilboard[bilbid][btdtid], -1, string);
		return 1;
	}
	return 1;
}

stock CheckBilboardsRent()
{
	new ts = Timestamp:Now();
	foreach(new i : Bilboards_Iter)
	{
		if(Bilboard[i][bcreated] && Bilboard[i][bloaded] && Bilboard[i][btime] <= ts)
		{
			ForceUnrentBilboard(i);
		}
	}
}

//end