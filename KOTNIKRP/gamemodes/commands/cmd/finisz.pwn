//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ finisz ]------------------------------------------------//
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

YCMD:finisz(playerid, params[], help)
{
	new string[128];

	if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
	{
		if(GroupPlayerDutyRank(playerid) >= 5)
		{
		    if(tworzenietrasy[playerid] != 666)
		    {
		        new Float:gx, Float:gy, Float:gz,  Float:gf;
				GetPlayerPos(playerid, gx, gy, gz);
				GetPlayerFacingAngle(playerid, gf);
				//
				if(Wyscig[tworzenietrasy[playerid]][wCheckpointy] >= 3)
		        {
		            format(string, sizeof(string), "Postawiono metę. Wszystkich checkpointów: %d. Wyścig pomyślnie utworzony!", (Wyscig[tworzenietrasy[playerid]][wCheckpointy]+1));
		            SendClientMessage(playerid, COLOR_GREY, string);
		            wCheckpoint[tworzenietrasy[playerid]][Wyscig[tworzenietrasy[playerid]][wCheckpointy]][0] = gx;
		            wCheckpoint[tworzenietrasy[playerid]][Wyscig[tworzenietrasy[playerid]][wCheckpointy]][1] = gy;
		            wCheckpoint[tworzenietrasy[playerid]][Wyscig[tworzenietrasy[playerid]][wCheckpointy]][2] = gz;
		            DisablePlayerRaceCheckpoint(playerid);
		            Wyscig[tworzenietrasy[playerid]][wStworzony] = 1;
		            ZapiszTrase(tworzenietrasy[playerid]);
		            new komunikat[1024];
					new wklej[128];
					if(Wyscig[tworzenietrasy[playerid]][wTypCH] == 0)
					{
						strcat(wklej, "{7CFC00}Typ checkpointów:{FFFFFF} Normalne\n");
					}
					else
					{
					    strcat(wklej, "{7CFC00}Typ checkpointów:{FFFFFF} Koła\n");
					}
					if(Wyscig[tworzenietrasy[playerid]][wRozmiarCH] == 10.0)
					{
						strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Ogromne\n");
					}
					else if(Wyscig[tworzenietrasy[playerid]][wRozmiarCH] == 7.5)
					{
						strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Duże\n");
					}
					else if(Wyscig[tworzenietrasy[playerid]][wRozmiarCH] == 5)
					{
					    strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Średnie\n");
					}
					else if(Wyscig[tworzenietrasy[playerid]][wRozmiarCH] == 2.5)
					{
						strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Małe\n");
					}
					else if(Wyscig[tworzenietrasy[playerid]][wRozmiarCH] == 1)
					{
					    strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Mini\n");
					}
		           	format(komunikat, sizeof(komunikat), "{FF0000}Informacje o wyścigu:{FFFFFF}\n\n{7CFC00}Nazwa:{FFFFFF} %s\n{7CFC00}Opis:{FFFFFF} %s\n{7CFC00}Nagroda:{FFFFFF} %d$\n%s\n{7CFC00}Ilość checkpointów:{FFFFFF} %d", Wyscig[tworzenietrasy[playerid]][wNazwa], Wyscig[tworzenietrasy[playerid]][wOpis], Wyscig[tworzenietrasy[playerid]][wNagroda], wklej, Wyscig[tworzenietrasy[playerid]][wCheckpointy]+1);
		            ShowPlayerDialogEx(playerid, 1428, DIALOG_STYLE_MSGBOX, "Kreator wyścigów: Koniec tworzenia", komunikat, "Koniec", "");
		            tworzenietrasy[playerid] = 666;
		        }
		        else
		        {
		            sendErrorMessage(playerid, "Wyścig musi mieć co najmniej 4 checkpointy!");
		        }
		    }
		    else
 			{
 			    sendErrorMessage(playerid, "Nie jesteś w trakcie tworzenia wyścigu!");
 			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie posiadasz uprawnień (wymagana 4 ranga)");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jesteś z NoA lub Korporacji Transportowej!");
	}
	return 1;
}
