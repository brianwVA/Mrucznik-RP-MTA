//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 kupbiznes                                                 //
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
// Autor: Simeone
// Data utworzenia: 19.08.2019


//

//------------------<[ Implementacja: ]>-------------------
command_kupbiznes_Impl(playerid)
{
    if(PlayerInfo[playerid][pLevel] < 2)
	{
		sendTipMessage(playerid, "Możesz zakupić własny biznes dopiero od poziomu 2");
		return 1;
	}
	if(GetPlayerBusiness(playerid) != INVALID_BIZ_ID)
	{
		sendTipMessage(playerid, "Jesteś właścicielem bądź członkiem biznesu! Nie możesz kupić następnego.");
		sendTipMessage(playerid, "Jeżeli jesteś właścicielem wpisz: /zlomujbiznes");
		sendTipMessage(playerid, "Jeżeli jesteś członkiem wpisz: /quitbiznes"); 
		return 1; 
	}
	new businessID = GetNearestBusiness(playerid); 
	if(businessID == INVALID_BIZ_ID)
	{
		sendErrorMessage(playerid, "Nie jesteś obok biznesu!");
		return 1;
	}
	if(businessID == -1)
	{
		sendErrorMessage(playerid, "Błędne ID biznesu"); 
		return 1;
	}
	if(Business[businessID][b_ownerUID] != 0)
	{
		sendErrorMessage(playerid, "Ten biznes należy już do kogoś!"); 
		return 1;
	}
	if(Business[businessID][b_cost] <= 0)
	{
		sendErrorMessage(playerid, "Ten biznes można zakupić tylko w trakcie licytacji."); 
		return 1;
	}
	if(kaska[playerid] < Business[businessID][b_cost])
	{
		sendErrorMessage(playerid, "Nie stać Cię!"); 
		return 1;
	}
	PlayerInfo[playerid][pBusinessOwner] = businessID; 
	Business[businessID][b_ownerUID] = PlayerInfo[playerid][pUID]; 
	Business[businessID][b_Name_Owner] = GetNick(playerid); 
	new string[124]; 
	sendTipMessageEx(playerid, COLOR_GREEN, "===[Zakupiłeś swój własny biznes]===");
	format(string, sizeof(string), "Nazwa biznesu: %s", Business[businessID][b_Name]);  
	sendTipMessage(playerid, string);

	Log(payLog, WARNING, "%s kupił biznes %s za %d$",
		GetPlayerLogName(playerid),
		GetBusinessLogName(businessID),
		Business[businessID][b_cost]
	);
	ZabierzKaseDone(playerid, Business[businessID][b_cost]); 
	ResetBizOffer(playerid);
    return 1;
}

//end