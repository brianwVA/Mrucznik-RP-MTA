//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                  premium                                                  //
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
// Autor: Mrucznik
// Data utworzenia: 04.05.2019
//Opis:
/*
	Monetyzacja, usługi premium.
*/

//

//------------------<[ MySQL: ]>--------------------
MruMySQL_LoadPremiumData(playerid, &kpMC, &kpEnds, &kpStarted, &kpLastLogin, &kpActive)
{
	new qr[256], Cache:result;
	format(qr, sizeof(qr), "SELECT `p_MC`, UNIX_TIMESTAMP(`p_endDate`), UNIX_TIMESTAMP(`p_startDate`), UNIX_TIMESTAMP(`p_LastCheck`), `p_activeKp` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	result = mysql_query(Database, qr);
	cache_get_value_index_int(0, 0, kpMC);
	cache_get_value_index_int(0, 1, kpEnds);
	cache_get_value_index_int(0, 2, kpStarted);
	cache_get_value_index_int(0, 3, kpLastLogin);
	cache_get_value_index_int(0, 4, kpActive);
	cache_delete(result);
}


MruMySQL_SetKP(playerid, time)
{
	new query[256], Cache:result;
	format(query, sizeof(query), "SELECT `p_charUID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	result = mysql_query(Database, query);
	if(cache_num_rows())
	{
		format(query, sizeof(query), "UPDATE `mru_premium` SET `p_endDate`=FROM_UNIXTIME('%d'), `p_startDate`=NOW(), `p_LastCheck`=NOW(), `p_activeKp`=1 WHERE `p_charUID`='%d'", 
			time, PlayerInfo[playerid][pUID]);
		mysql_tquery(Database, query);
	}
	else
	{
		format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_endDate`, `p_charUID`, `p_LastCheck`, `p_startDate`, `p_activeKp`) VALUES(FROM_UNIXTIME('%d'), '%d', NOW(), NOW(), 1)", 
			time, PlayerInfo[playerid][pUID]);
		mysql_tquery(Database, query);
	}
	cache_delete(result);
}

MruMySQL_InsertSkin(playerid, id)
{
	new string[128];
	format(string, sizeof(string), "INSERT INTO `mru_premium_skins` (`s_charUID`, `s_ID`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], SkinyPremium[id][Model]);
    mysql_tquery(Database, string);
}

MruMySQL_RemoveKP(playerid)
{
	new query[128], Cache:result;
	format(query, sizeof(query), "SELECT `p_charUID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(Database, query);
	if(cache_num_rows())
	{
		format(query, sizeof(query), "UPDATE `mru_premium` SET `p_activeKp`=0, `p_endDate`=NOW() WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
		mysql_tquery(Database, query);
	}
	else
	{
		Log(premiumLog, ERROR, "ERROR: ZabierzKP zostało wykonane na osobie, która nie posiadała premium! %s", GetPlayerLogName(playerid));
	}
	cache_delete(result);
}

MruMySQL_SaveMc(playerid)
{
	new query[128], Cache:result;
    format(query, sizeof(query), "SELECT `p_charUID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	result = mysql_query(Database, query);
    if(cache_num_rows())
    {
        cache_delete(result);
        format(query, sizeof(query), "UPDATE `mru_premium` SET `p_MC`='%d' WHERE `p_charUID`='%d'", PremiumInfo[playerid][pMC], PlayerInfo[playerid][pUID]);
        mysql_tquery(Database, query);
    }
    else
    {
        cache_delete(result);
        if(PremiumInfo[playerid][pMC] > 0)
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_charUID`, `p_MC`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], PremiumInfo[playerid][pMC]);
            mysql_tquery(Database, query);
        }
    }
}

MruMySQL_LoadPlayerPremiumSkins(playerid)
{
	new qr[256], Cache:result;
	format(qr, sizeof(qr), "SELECT `s_ID` FROM `mru_premium_skins` WHERE `s_charUID`='%d'", PlayerInfo[playerid][pUID]);
	result = mysql_query(Database, qr);
	new skinID;
	if(cache_num_rows()>0)
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_index_int(i, 0, skinID);
			VECTOR_push_back_val(VPremiumSkins[playerid], skinID);
		}
	}
	cache_delete(result);
}

MruMySQL_IsPhoneNumberAvailable(number) {
    
    if(100 <= number && number <= 150) return false;
    if(number == 555) return false;
    new string[128], Cache:result;
	format(string, sizeof(string), "SELECT `UID` FROM `mru_items` WHERE `item_type` = 0 AND `value1` = %d", number);
    //format(string, sizeof(string), "SELECT `UID` FROM `mru_konta` WHERE `PhoneNr` = %d", number);
    result = mysql_query(Database, string);
    if(cache_num_rows() > 0)
    {
        cache_delete(result);
        return false;
    }
    cache_delete(result);
    return true;
}
//end