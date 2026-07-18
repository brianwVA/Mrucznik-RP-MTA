//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ starttrash ]------------------------------------------------//
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

YCMD:starttrash(playerid, params[], help)
{
	if(IsPlayerConnected((playerid))
	{
		if(PlayerInfo[playerid][pJob] == 17)
		{
			if(GetPlayerVehicleID(playerid) == 408)
			{
				if(GetPlayerVehicleSeat(playerid) == 0)
				{
					pTrashCollected[playerid] = 0; 
					LoadTrashTextDrawForPlayer(playerid); 
					sendTipMessage(playerid, "Rozpoczynasz pracę śmieciarza - poszukuj śmietników wystawionych przed dom!"); 
					sendTipMessage(playerid, "Udaj się do pierwszej strefy - oznaczonej czerwonym kolorem na mapie."); 
					StartTrashCollecting(playerid); 
					trasherStartCollecting[playerid] = 1;
					trasherZoneID[playerid] = 1;  
					//trasherJobTimer[playerid] = SetTimerEx("TrasherJob",3000,0,"d",playerid);
				}
				else
				{
					sendTipMessage(playerid, "Aby móc używać tej komendy musisz być kierowcą pojazdu TrashMaster!"); 
					return 1;
				}
			}
			else
			{
				sendTipMessage(playerid, "Aby móc używać tej komendy musisz być w pojeździe TrashMaster"); 
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jesteś śmieciarzem!"); 
			return 1;
		}
	}
	return 1;
}



