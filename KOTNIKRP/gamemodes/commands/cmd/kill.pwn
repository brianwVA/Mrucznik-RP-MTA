//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ kill ]-------------------------------------------------//
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

YCMD:kill(playerid, params[], help)
{
	new giveplayer[MAX_PLAYER_NAME + 1];
	

    if(IsPlayerConnected(playerid))
    {
		new playa;
		if( sscanf(params, "k<fix>", playa))
		{
			sendTipMessage(playerid, "Użyj /kill [ID/Imie_Nazwisko]");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			if(!CanUseAdminCommand(playerid)) return sendErrorMessage(playerid, "Musisz być na admin-duty.");
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {		
					SetPVarInt(playerid, "skip_bw", 1);
					GetPlayerName(playa, giveplayer, sizeof(giveplayer));
					SetPlayerHealth(playa, 0);
					Log(adminLog, WARNING, "Admin %s zabił %s komendą /kill", GetPlayerLogName(playerid), GetPlayerLogName(playa));

					_MruAdmin(playerid, sprintf("Zabiłeś gracza %s [%d] za pomocą komendy", GetNick(playa), playa));
					if(playerid != playa) _MruAdmin(playa, sprintf("Zostałeś zabity przez admina %s [%d]", GetNick(playerid), playerid));

					SendCommandLogMessage(sprintf("Admin %s [%d] dał /kill graczowi %s [%d]", GetNickEx(playerid), playerid, GetNick(playa), playa));
					
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
