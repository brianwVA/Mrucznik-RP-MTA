//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   addmc                                                   //
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
// Data utworzenia: 02.07.2019


//

//------------------<[ Implementacja: ]>-------------------
command_addmc_Impl(playerid, giveplayerid, value)
{
	if(!IsAKox(playerid) && !IsAMCGiver(playerid)) 
	{
		return noAccessMessage(playerid);
	}

	if(value <= 0 || value > 1000000)
		return sendErrorMessage(playerid, "Dodawana wartosc MC musi miescic sie w zakresie 1-1000000.");

	if(PremiumInfo[giveplayerid][pMC] > 2000000000 - value)
		return sendErrorMessage(playerid, "Ta operacja przekroczylaby bezpieczny limit salda MC.");

	new previousValue = PremiumInfo[giveplayerid][pMC];

	if(IsAMCGiver(playerid)) 
	{
		new mc = GetAvaibleMC();
		if(value > mc) 
		{
			sendErrorMessage(playerid, sprintf("W budżecie MC jest dostępne tylko %dMC", mc));
			return 1;
		}

		TakeMCFromBudget(value);
	}

	DajMC(giveplayerid, value);

	Log(premiumLog, WARNING, "Admin %s dodał %s %dMC, poprzedni stan: %dMC", 
		GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), value, previousValue
	);
	_MruAdmin(playerid, sprintf("Dodałeś %d MC graczowi %s [ID: %d]", value, GetNickEx(giveplayerid), giveplayerid));
	if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dostałeś %d dodatkowych MC od Admina %s [ID: %d]", value, GetNickEx(playerid), playerid));
	return 1;
}
//end
