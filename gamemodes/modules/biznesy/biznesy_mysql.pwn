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
LoadBusiness()// Ladowanie biznesów z bazy danych
{
	//Tworzenie BIZ na ID 0
	mysql_real_escape_string("Testowy Biznes", Business[0][b_Name]); 
	Business[0][b_ownerUID] = 0; 
	Business[0][b_enX] = 0.0;
	Business[0][b_enY] = 0.0;
	Business[0][b_enZ] = -2.0; 
	Business[0][b_exX] = 0.0;
	Business[0][b_exY] = 0.0;
	Business[0][b_exZ] = -2.0; 
	Business[0][b_int] = 0;   
	Business[0][b_vw] = 0; 
	Business[0][b_pLocal] = 255; 
	Business[0][b_maxMoney] = 0;
	Business[0][b_cost] = 100000000;
	mysql_real_escape_string("Szmulowice Dolne", Business[0][b_Location]); 
	mysql_real_escape_string("Brak - na sprzeda¿", Business[0][b_Name_Owner]);
	BusinessLoaded=1; 
	new query[1024];

	new CurrentBID = 1;
	while(CurrentBID < MAX_BIZNES)
	{
		new fields[256], result[1024];
		format(fields, sizeof(fields), "`ID`, `ownerUID`, `ownerName`, `Name`, `enX`, `enY`, `enZ`, `exX`, `exY`, `exZ`, `enVw`, `enInt`, `exVW`, `exINT`, `pLocal`, `Money`, `Cost`, `Location`, `MoneyPocket`, `Icon`");

		format(query, sizeof(query), "SELECT %s FROM `mru_business` WHERE `ID`='%d'", fields, CurrentBID);
		mysql_query(query);
		mysql_store_result();
		if (mysql_num_rows())
		{
			// Odczyt po nazwach kolumn jest odporny na roznice w kolejnosci
			// wyniku pomiedzy starym pluginem MySQL a warstwa zgodnosci MTA.
			// Dlugi sscanf zerowal wspolrzedne i przy wylaczeniu nadpisywal nimi baze.
			mysql_fetch_field_row(result, "ID"); Business[CurrentBID][b_ID] = strval(result);
			mysql_fetch_field_row(result, "ownerUID"); Business[CurrentBID][b_ownerUID] = strval(result);
			mysql_fetch_field_row(Business[CurrentBID][b_Name_Owner], "ownerName");
			mysql_fetch_field_row(Business[CurrentBID][b_Name], "Name");
			mysql_fetch_field_row(result, "enX"); Business[CurrentBID][b_enX] = floatstr(result);
			mysql_fetch_field_row(result, "enY"); Business[CurrentBID][b_enY] = floatstr(result);
			mysql_fetch_field_row(result, "enZ"); Business[CurrentBID][b_enZ] = floatstr(result);
			mysql_fetch_field_row(result, "exX"); Business[CurrentBID][b_exX] = floatstr(result);
			mysql_fetch_field_row(result, "exY"); Business[CurrentBID][b_exY] = floatstr(result);
			mysql_fetch_field_row(result, "exZ"); Business[CurrentBID][b_exZ] = floatstr(result);
			mysql_fetch_field_row(result, "enVw"); Business[CurrentBID][b_enVw] = strval(result);
			mysql_fetch_field_row(result, "enInt"); Business[CurrentBID][b_enInt] = strval(result);
			mysql_fetch_field_row(result, "exVW"); Business[CurrentBID][b_vw] = strval(result);
			mysql_fetch_field_row(result, "exINT"); Business[CurrentBID][b_int] = strval(result);
			mysql_fetch_field_row(result, "pLocal"); Business[CurrentBID][b_pLocal] = strval(result);
			mysql_fetch_field_row(result, "Money"); Business[CurrentBID][b_maxMoney] = strval(result);
			mysql_fetch_field_row(result, "Cost"); Business[CurrentBID][b_cost] = strval(result);
			mysql_fetch_field_row(Business[CurrentBID][b_Location], "Location");
			mysql_fetch_field_row(result, "MoneyPocket"); Business[CurrentBID][b_moneyPocket] = strval(result);
			mysql_fetch_field_row(result, "Icon"); Business[CurrentBID][b_icon] = strval(result);

			if(strlen(Business[CurrentBID][b_Name]) >= 3)
			{
				BusinessLoaded++; 
			}
		}
		CurrentBID++;
		mysql_free_result();
	}
	return 1;
}
ClearBusinessOwner_MySQL(businessID)
{
	new query[256];
	format(query, sizeof(query), "UPDATE `mru_konta` SET \
	`bizz`='%d' \
	WHERE `bizz`='%d'", INVALID_BIZ_ID, businessID); 
	mysql_query(query); 
	format(query, sizeof(query), "UPDATE `mru_business` SET \
	`ownerUID`='%d', \
	`ownerName`='Brak' \
	WHERE `ID`='%d'", 0, businessID);
	mysql_query(query); 
	return 1;
}
Create_BusinessMySQL(bus_ID)
{
	new query[1536];
	new ownerNameEscaped[65], nameEscaped[129], locationEscaped[129];
	mysql_real_escape_string(Business[bus_ID][b_Name_Owner], ownerNameEscaped);
	mysql_real_escape_string(Business[bus_ID][b_Name], nameEscaped);
	mysql_real_escape_string(Business[bus_ID][b_Location], locationEscaped);

	format(query, sizeof(query), "INSERT INTO `mru_business` (`ID`, `ownerUID`, `ownerName`, `Name`, `enX`, `enY`, `enZ`, `exX`, `exY`, `exZ`, `exVW`, `exINT`, `pLocal`, `Money`, `Cost`, `Location`, `MoneyPocket`, `Icon`) VALUES\
	('%d', '%d', '%s', '%s', '%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d', '%d', '%d', '%d', '%s', '%d', '%d')", 
	bus_ID, 
	Business[bus_ID][b_ownerUID],
	ownerNameEscaped,
	nameEscaped,
	Business[bus_ID][b_enX], 
	Business[bus_ID][b_enY],
	Business[bus_ID][b_enZ],
	Business[bus_ID][b_exX],
	Business[bus_ID][b_exY],
	Business[bus_ID][b_exZ],
	Business[bus_ID][b_vw],
	Business[bus_ID][b_int],
	Business[bus_ID][b_pLocal],
	Business[bus_ID][b_maxMoney],
	Business[bus_ID][b_cost],
	locationEscaped,
	Business[bus_ID][b_moneyPocket],
	Business[bus_ID][b_icon]);

	mysql_query(query);
	return 1;
}
SaveBusiness(busID)//Zapis biznesów do bazy danych
{
	new query[1536];
	new ownerNameEscaped[65], nameEscaped[129], locationEscaped[129];
	mysql_real_escape_string(Business[busID][b_Name_Owner], ownerNameEscaped);
	mysql_real_escape_string(Business[busID][b_Name], nameEscaped);
	mysql_real_escape_string(Business[busID][b_Location], locationEscaped);
	format(query, sizeof(query), "UPDATE `mru_business` SET \
	`ID`='%d', \
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
	Business[busID][b_ID], 
	Business[busID][b_ownerUID],
	ownerNameEscaped,
	nameEscaped,
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
	locationEscaped,
	Business[busID][b_moneyPocket],
	busID); 
	mysql_query(query);
	return 1;
}

//end
