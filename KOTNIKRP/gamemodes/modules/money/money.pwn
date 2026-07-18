//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   money                                                   //
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
// Data utworzenia: 01.07.2019
//Opis:
/*
	Moduł odpowiadający za operacje na pieniądzach gracza.
*/

//

//-----------------<[ Funkcje: ]>-------------------
#define MRP_MIN_PLAYER_CASH (-10000000)
#define MRP_MAX_PLAYER_CASH (2000000000)

stock bool:Money_CanApplyDelta(playerid, money)
{
	if(money > MRP_MAX_PLAYER_CASH || money < -MRP_MAX_PLAYER_CASH)
		return false;

	if(money > 0 && kaska[playerid] > MRP_MAX_PLAYER_CASH - money)
		return false;

	if(money < 0 && kaska[playerid] < MRP_MIN_PLAYER_CASH - money)
		return false;

	return true;
}

stock Money_RejectUnsafeOperation(playerid, money, const operation[])
{
	Log(errorLog, ERROR, "%s: zablokowano operacje %s na %d$ [kasa: %d$]", GetPlayerLogName(playerid), operation, money, kaska[playerid]);
	if(IsPlayerConnected(playerid))
		sendErrorMessage(playerid, "Operacja finansowa zostala odrzucona (nieprawidlowa kwota lub limit salda).");
	return 0;
}

public DajKase(playerid, money)
{
	if(!Money_CanApplyDelta(playerid, money))
		return Money_RejectUnsafeOperation(playerid, money, "DajKase");

	new logstring[256];
	format(logstring, sizeof(logstring), "%s dostal %d$ [kasa: %d$][bank: %d$]", GetPlayerLogName(playerid), money, kaska[playerid], PlayerInfo[playerid][pAccount]);
	new oldmoney = kaska[playerid];
	kaska[playerid] += money;
	GivePlayerMoney(playerid, money);
	HUD_MoneyUpdate(playerid, oldmoney);

	if(money < 0)
	{
		Log(errorLog, ERROR, logstring);
	}
	else
	{
		Log(moneyLog, WARNING, logstring);
	}

	ZabezpieczenieUjemnyHajs(playerid);
	return 1;
}

public DajKaseDone(playerid, money)
{
	if(!Money_CanApplyDelta(playerid, money))
		return Money_RejectUnsafeOperation(playerid, money, "DajKaseDone");

	new logstring[256];
	format(logstring, sizeof(logstring), "%s dostal %d$ [kasa: %d$][bank: %d$]", GetPlayerLogName(playerid), money, kaska[playerid], PlayerInfo[playerid][pAccount]);
	new oldmoney = kaska[playerid];

	kaska[playerid] += money;
	GivePlayerMoney(playerid, money);
	HUD_MoneyUpdate(playerid, oldmoney);

	if(money < 0)
	{
		Log(errorLog, ERROR, logstring);
	}
	else
	{
		Log(moneyLog, WARNING, logstring);
	}

	ZabezpieczenieUjemnyHajs(playerid);
	return 1;
}

public ZabierzKase(playerid, money)
{
	if(money < 0 || !Money_CanApplyDelta(playerid, -money))
		return Money_RejectUnsafeOperation(playerid, money, "ZabierzKase");

	new logstring[256];
	format(logstring, sizeof(logstring), "%s zabrano %d$ [kasa: %d$][bank: %d$]", GetPlayerLogName(playerid), money, kaska[playerid], PlayerInfo[playerid][pAccount]);
	new oldmoney = kaska[playerid];
	kaska[playerid] -= money;
	GivePlayerMoney(playerid, -money);
	HUD_MoneyUpdate(playerid, oldmoney);

	if(money < 0)
	{
		Log(errorLog, ERROR, logstring);
	}
	else
	{
		Log(moneyLog, WARNING, logstring);
	}
	ZabezpieczenieUjemnyHajs(playerid);
	return 1;
}

public ZabierzKaseDone(playerid, money)
{
	if(money < 0 || !Money_CanApplyDelta(playerid, -money))
		return Money_RejectUnsafeOperation(playerid, money, "ZabierzKaseDone");

	new logstring[256];
	format(logstring, sizeof(logstring), "%s zabrano %d$ [kasa: %d$][bank: %d$]", GetPlayerLogName(playerid), money, kaska[playerid], PlayerInfo[playerid][pAccount]);
	new oldmoney = kaska[playerid];
	kaska[playerid] -= money;
	GivePlayerMoney(playerid, -money);
	HUD_MoneyUpdate(playerid, oldmoney);

	if(money < 0)
	{
		Log(errorLog, ERROR, logstring);
	}
	else
	{
		Log(moneyLog, WARNING, logstring);
	}
	ZabezpieczenieUjemnyHajs(playerid);
	return 1;
}

public UstawKase(playerid, money)
{
	if(money < MRP_MIN_PLAYER_CASH || money > MRP_MAX_PLAYER_CASH)
		return Money_RejectUnsafeOperation(playerid, money, "UstawKase");

	new logstring[256];
	format(logstring, sizeof(logstring), "%s ustawiono %d$ [kasa: %d$][bank: %d$]", GetPlayerLogName(playerid), money, kaska[playerid], PlayerInfo[playerid][pAccount]);
	new oldmoney = kaska[playerid];
	kaska[playerid] = money;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, money);
	HUD_MoneyUpdate(playerid, oldmoney);

	Log(moneyLog, WARNING, logstring);
	return 1;
}

public ResetujKase(playerid)
{
	new oldmoney = kaska[playerid];
	kaska[playerid]=0;
	ResetPlayerMoney(playerid);
	HUD_MoneyUpdate(playerid, oldmoney);
	return 1;
}

ZabezpieczenieUjemnyHajs(playerid)
{
	if(kaska[playerid] < -10000000)
	{	
		if(AddPunishment(playerid, GetNick(playerid), -1, gettime(), PENALTY_BAN, 0, "zbyt duże długi", 0) == 1) {
			//MruMySQL_Banuj(playerid, "zbyt duże długi");
			Log(punishmentLog, WARNING, "%s został zbanowany za -10.000.000$ na koncie", GetPlayerLogName(playerid));
			KickEx(playerid);
		}
	}
	return 1;
}

//end
