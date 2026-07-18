//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ pjtest ]------------------------------------------------//
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

YCMD:pjtest(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

	if(IsAUrzednik(playerid) && PlayerInfo[playerid][pLocal] == 108 && GroupPlayerDutyRank(playerid) >= 1)
	{
		new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "Użyj /pjtest [ID/Nick]");
			return 1;
		}
		if(giveplayerid == playerid)
		{
			sendErrorMessage(playerid, "Nie możesz rozpocząć testu z samym sobą !");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
    		if(PlayerInfo[giveplayerid][pWtrakcietestprawa] == 0)
    		{
				if (ProxDetectorS(10.0, playerid, giveplayerid))
				{
                    if(PlayerInfo[giveplayerid][pCarLic] > 1000)
                    {
                        new lTime = PlayerInfo[giveplayerid][pCarLic]-gettime();
                        new hh, mm;
                        hh = floatround(floatround(floatdiv(lTime, 3600), floatround_floor)%24,floatround_floor);
                        mm = floatround(floatround(floatdiv(lTime, 60), floatround_floor)%60,floatround_floor);
                        format(string, 128, "Ten gracz ma odebrane prawo jazdy. Blokada mija za %dh %dmin.", hh, mm);
                        SendClientMessage(playerid, COLOR_GRAD2, string);
                        return 1;
                    }
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					PlayerInfo[giveplayerid][pPrawojazdypytania] = 0;
					PlayerInfo[giveplayerid][pPrawojazdydobreodp] = 0;
					PlayerInfo[giveplayerid][pPrawojazdyzleodp] = 0;
					PlayerInfo[giveplayerid][pMinalczasnazdpr] = 0;
					PlayerInfo[giveplayerid][pWtrakcietestprawa] = 1;
					format(string, sizeof(string), "* Rozpocząłeś test z %s.", giveplayer);
					SendClientMessage(playerid, COLOR_GRAD2, string);
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* %s wyciąga test oraz długopis i podaje %s", sendername, giveplayer);
					ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					ShowPlayerDialogEx(giveplayerid, D_PJTEST, DIALOG_STYLE_MSGBOX, "Prawo jazdy - Test", "{7FFF00}Witaj!\n{FFFFFF}Rozpoczynasz test na prawo jazdy.\nW teście {FF0000}NIE UŻYWAJ{FFFFFF} polskich znaków!\n\nŻyczymy powodzenia!", "Rozpocznij", "");
					return 1;
				}
				else {sendErrorMessage(playerid, "Gracz jest za daleko !"); return 1;}
    		}
    		else {sendErrorMessage(playerid, "Ten gracz jest w trakcie testu !"); return 1;}
		}
	    else {sendErrorMessage(playerid, "Nie ma takiego gracza !"); return 1;}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jesteś Urzędnikiem z rangą 1+ / nie jesteś w DMV !");
		return 1;
	}
}
