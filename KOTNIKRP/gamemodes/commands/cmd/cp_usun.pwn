//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ cp_usun ]------------------------------------------------//
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

YCMD:cp_usun(playerid, params[], help)
{
	new string[128];

	if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
	{
		if(GroupPlayerDutyRank(playerid) >= 5)
		{
		    if(tworzenietrasy[playerid] != 666)
		    {
		        if(Wyscig[tworzenietrasy[playerid]][wCheckpointy] != 0)
		        {
		            format(string, sizeof(string), "Usunięto checkpoint numer %d.", Wyscig[tworzenietrasy[playerid]][wCheckpointy]);
					SendClientMessage(playerid, COLOR_GREY, string);
		            wCheckpoint[tworzenietrasy[playerid]][Wyscig[tworzenietrasy[playerid]][wCheckpointy]][0] = 0;
		            wCheckpoint[tworzenietrasy[playerid]][Wyscig[tworzenietrasy[playerid]][wCheckpointy]][1] = 0;
		            wCheckpoint[tworzenietrasy[playerid]][Wyscig[tworzenietrasy[playerid]][wCheckpointy]][2] = 0;
		            Wyscig[tworzenietrasy[playerid]][wCheckpointy] --;
					if(Wyscig[tworzenietrasy[playerid]][wCheckpointy] > 0)
						SetPlayerRaceCheckpoint(playerid,Wyscig[tworzenietrasy[playerid]][wTypCH],wCheckpoint[tworzenietrasy[playerid]][(Wyscig[tworzenietrasy[playerid]][wCheckpointy]-1)][0], wCheckpoint[tworzenietrasy[playerid]][(Wyscig[tworzenietrasy[playerid]][wCheckpointy]-1)][1], wCheckpoint[tworzenietrasy[playerid]][(Wyscig[tworzenietrasy[playerid]][wCheckpointy]-1)][2],0.0,0.0,0.0, Wyscig[tworzenietrasy[playerid]][wRozmiarCH]);
					return 1;
		        }
		        else
		        {
		            sendErrorMessage(playerid, "Nie postawiłeś jeszcze ani jednego checkpointu!");
		        }
		    }
		    else
 			{
 			    sendErrorMessage(playerid, "Nie jesteś w trakcie tworzenia wyścigu!");
 			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie posiadasz uprawnień (wymagana 5 ranga)");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jesteś z NoA lub Korporacji Transportowej!");
	}
	return 1;
}
