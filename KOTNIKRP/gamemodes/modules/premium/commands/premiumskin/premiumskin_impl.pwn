//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                premiumskin                                                //
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
command_premiumskin_Impl(playerid, skin)
{
	if(!PlayerHasSkin(playerid, skin))
		return sendErrorMessage(playerid, "Nie masz tego skina.");

	if((OnDuty[playerid] > 0) || SanDuty[playerid] == 1)
	{
		return sendErrorMessage(playerid, "Będąc na służbie nie możesz aktywować unikatowego skina.");
	}

	if(IsPlayerInAnyVehicle(playerid))
	{
		return sendErrorMessage(playerid, "Nie możesz przebrać się będąc w pojeździe.");
	}
	
	PlayerInfo[playerid][pSkin] = skin;

	SetPlayerSkinEx(playerid, skin);

	_MruAdmin(playerid, sprintf("Aktywowałeś swój unikatowy skin [ID: %d]", skin));
	return 1;
}


//end