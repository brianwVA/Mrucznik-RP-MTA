//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                  biznesy                                                  //
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
// Autor: 2.5
// Data utworzenia: 04.05.2019
//Opis:
/*
	System biznesów.
*/

//

//------------------<[ MySQL: ]>--------------------
LoadBusiness()//?adowanie biznesów z bazy danych
{
	new lStr[1024], Cache:result;
	lStr = "`ID`, `ownerUID`, `ownerName`, `Name`, `enX`, `enY`, `enZ`, `exX`, `exY`, `exZ`, `exVW`, `exINT`, `pLocal`, `Money`, `Cost`, `Location`, `MoneyPocket`";

	format(lStr, 1024, "SELECT %s FROM `mru_business` LIMIT "#MAX_BIZNES"", lStr);
	result = mysql_query(Database, lStr);
	for(new i = 0; i < cache_num_rows(); i++)
	{
		new CurrentBID;
		cache_get_value_index_int(i, 0, CurrentBID);
		if(CurrentBID < 1) continue;
		//ds[32]s[64]ffffffddddds[64]d
		Business[CurrentBID][b_ID] = CurrentBID; 

		cache_get_value_index_int(i, 1, Business[CurrentBID][b_ownerUID]);
		cache_get_value_index(i, 2, Business[CurrentBID][b_Name_Owner]);
		cache_get_value_index(i, 3, Business[CurrentBID][b_Name]);
		cache_get_value_index_float(i, 4, Business[CurrentBID][b_enX]);
		cache_get_value_index_float(i, 5, Business[CurrentBID][b_enY]);
		cache_get_value_index_float(i, 6, Business[CurrentBID][b_enZ]);
		cache_get_value_index_float(i, 7, Business[CurrentBID][b_exX]);
		cache_get_value_index_float(i, 8, Business[CurrentBID][b_exY]);
		cache_get_value_index_float(i, 9, Business[CurrentBID][b_exZ]);
		cache_get_value_index_int(i, 10, Business[CurrentBID][b_vw]);
		cache_get_value_index_int(i, 11, Business[CurrentBID][b_int]);
		cache_get_value_index_int(i, 12, Business[CurrentBID][b_pLocal]);
		cache_get_value_index_int(i, 13, Business[CurrentBID][b_maxMoney]);
		cache_get_value_index_int(i, 14, Business[CurrentBID][b_cost]);
		cache_get_value_index(i, 15, Business[CurrentBID][b_Location]);
		cache_get_value_index_int(i, 16, Business[CurrentBID][b_moneyPocket]);
	}
	cache_delete(result);
	return 1;
}
ClearBusinessOwner(businessID)
{
	new query[256];
	format(query, sizeof(query), "UPDATE `mru_konta` SET \
	`bizz`='%d' \
	WHERE `bizz`='%d'", INVALID_BIZ_ID, businessID); 
	mysql_query(Database, query); 
	format(query, sizeof(query), "UPDATE `mru_business` SET \
	`ownerUID`='%d', \
	`ownerName`='Brak' \
	WHERE `ID`='%d'", 0, businessID);
	mysql_query(Database, query); 
	return 1;
}
Create_BusinessMySQL()
{
	new query[1024];

	format(query, sizeof(query), "INSERT INTO `mru_business` (`ownerUID`, `ownerName`, `Name`, `enX`, `enY`, `enZ`, `exX`, `exY`, `exZ`, `exVW`, `exINT`, `pLocal`, `Money`, `Cost`, `Location`, `MoneyPocket`) VALUES\
	('0', 'Brak - na sprzedaż', 'Brak', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '0', '0', '0', '0', 'Los Santos', '0')");

	mysql_query(Database, query);
	return cache_insert_id();
}
SaveBusiness(busID)//Zapis biznesów do bazy danych
{
	mysql_escape_string(Business[busID][b_Name_Owner], Business[busID][b_Name_Owner]);
	mysql_escape_string(Business[busID][b_Name], Business[busID][b_Name]);
	new query[1024];
	format(query, sizeof(query), "UPDATE `mru_business` SET \
	`ownerUID`='%d', \
	`ownerName`='%s', \
	`Name`='%s', \
	`enX`='%f', \
	`enY`='%f', \
	`enZ`='%f', \
	`exX`='%f', \
	`exY`= '%f', \
	`exZ`= '%f', \
	`exVW`= '%d', \
	`exINT` = '%d', \
	`pLocal` = '%d', \
	`Money` = '%d', \
	`Cost` = '%d', \
	`Location` = '%s', \
	`MoneyPocket` = '%d' \
	WHERE `ID`='%d'", 
	Business[busID][b_ownerUID],
	Business[busID][b_Name_Owner],
	Business[busID][b_Name],
	Business[busID][b_enX], 
	Business[busID][b_enY],
	Business[busID][b_enZ],
	Business[busID][b_exX],
	Business[busID][b_exY],
	Business[busID][b_exZ],
	Business[busID][b_vw],
	Business[busID][b_int],
	Business[busID][b_pLocal],
	Business[busID][b_maxMoney],
	Business[busID][b_cost],
	Business[busID][b_Location],
	Business[busID][b_moneyPocket],
	busID); 
	mysql_query(Database, query);
	return 1;
}

//end