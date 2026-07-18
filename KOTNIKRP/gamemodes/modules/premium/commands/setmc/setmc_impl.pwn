//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   setmc                                                   //
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
// Data utworzenia: 09.06.2019


//

//------------------<[ Implementacja: ]>-------------------
command_setmc_Impl(playerid, giveplayerid, value)
{
	if(IsAKox(playerid))
	{
		if(value < 0 || value > 1000000)
			return sendErrorMessage(playerid, "Wartosc MC musi miescic sie w zakresie 0-1000000.");

		new query[256];
		new previousValue = PremiumInfo[giveplayerid][pMC];
		PremiumInfo[giveplayerid][pMC] = value;

		format(query, sizeof(query), "UPDATE `mybb_users` SET `samp_kc`='%d' WHERE `uid` = '%d'", PremiumInfo[giveplayerid][pMC], PlayerInfo[giveplayerid][pGID]);
		mysql_tquery(Database, query);
		MruMySQL_SaveMc(giveplayerid);

		Log(premiumLog, WARNING, "Admin %s dał %s %dMC, poprzedni stan: %dMC", 
			GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), value, previousValue
		);
		_MruAdmin(playerid, sprintf("Dałeś %d MC graczowi %s [ID: %d]", value, GetNickEx(giveplayerid), giveplayerid));
		if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dostałeś %d MC od Admina %s [ID: %d]", value, GetNickEx(playerid), playerid));

		return 1;

	}
	else return noAccessMessage(playerid);
}


//end
