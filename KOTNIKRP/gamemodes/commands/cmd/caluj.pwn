//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ caluj ]-------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:caluj(playerid, params[], help)
{
	new string[128];
    if(IsPlayerConnected(playerid))
    {
		new playa;
		if( sscanf(params, "k<fix>", playa))
		{
			sendTipMessage(playerid, "Użyj /caluj [ID gracza]");
			return 1;
		}
		if(PlayerInfo[playerid][pInjury])
		{
			sendErrorMessage(playerid, "Nie możesz całość się w trakcie obecnego statusu (ranny)!"); 
			return 1;
		}
		if(playa == playerid)
		{
			sendErrorMessage(playerid, "Nie możesz pocałować samego siebie!"); 
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playa) == 1)
		{
			sendErrorMessage(playerid, "Nie możesz całować administratora!"); 
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie możesz całować się będąc na służbie @"); 
			return 1;
		}
		if(dialAccess[playerid] == 1)
		{
			sendErrorMessage(playerid, "Musisz odczekać 15 sekund przed ponownym pocałunkiem!"); 
			return 1;
		}
		if (ProxDetectorS(5.0, playerid, playa) && Spectate[playa] == INVALID_PLAYER_ID)
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
					dialAccess[playa] = 0; 
					format(string, sizeof(string), "%s chce się z tobą pocałować - jeśli go kochasz kliknij ''Całuj''!", GetNick(playerid));
  					ShowPlayerDialogEx(playa, 1092, DIALOG_STYLE_MSGBOX, "M-RP - pocałunek", string, "Całuj", "Odrzuć", false);
					ShowPlayerInfoDialog(playerid, "M-RP", "Zaoferowałeś pocałunek - oczekuj na reakcje!", true);
					format(string, sizeof(string), "Zaoferowałeś pocałunek %s - oczekuj na reakcje!", GetNick(playa));
					sendTipMessage(playerid, string);
					kissPlayerOffer[playa] = playerid;
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Jesteś za daleko !");
		}
	}
	return 1;
}
