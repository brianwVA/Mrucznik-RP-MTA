//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ poddajsie2 ]----------------------------------------------//
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


YCMD:poddajsie2(playerid, params[], help)
{
	/*
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pJob] == 1)
		{
			if(Kajdanki_Uzyte[playerid] != 1)
			{
				new giveplayerid;
				if(sscanf(params, "k<fix>", giveplayerid))
				{
					sendTipMessage(playerid, "Użyj /poddajsie [id gracza]");
					return 1;
				}
				if(IsPlayerConnected(giveplayerid))
				{
					if(giveplayerid != INVALID_PLAYER_ID)
					{
						if(GetDistanceBetweenPlayers(playerid,giveplayerid) < 5)
						{
							if(GetPlayerState(playerid) == 1 && GetPlayerState(giveplayerid) == 1)
							{
								if(Kajdanki_JestemSkuty[giveplayerid] == 0)
								{
									if(Kajdanki_Uzyte[giveplayerid] == 0)
									{
										if(GUIExit[playerid] == 0 && GUIExit[giveplayerid] == 0)
										{
											new string[128], sendername[MAX_PLAYER_NAME + 1], giveplayer[MAX_PLAYER_NAME + 1];
											if(lowcaz[playerid] == giveplayerid)
											{
												sendErrorMessage(playerid, "Nie masz zlecenia na tego gracza! Nie możesz go skuć!");
												return 1;
											}
											if(PoziomPoszukiwania[giveplayerid] == 0)
											{
												sendTipMessage(playerid,"Ten gracz nie ma WL! Nie możesz wykonać na niego zlecenia!");
												return 1;
											}
											GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
											GetPlayerName(playerid, sendername, sizeof(sendername));
											format(string, sizeof(string), "*Łowca nagród %s wyciąga kajdanki i próbuje je założyć %s.", sendername ,giveplayer);
											ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
											ShowPlayerDialogEx(giveplayerid, 7080, DIALOG_STYLE_MSGBOX, "Pddaj się!", "Poddaj się!\nŁowca nagród złożył propozycję poddania się!\nMożesz ją przyjąć i trafić do więzienia na krótszy czas\nlub spróbować pokonać łowcę w walce!", "Poddaj się", "Wyrwij się");
											Kajdanki_PDkuje[giveplayerid] = playerid;
											Kajdanki_Uzyte[giveplayerid] = 1;
											//SetTimerEx("UzyteKajdany",30000,0,"dd",giveplayerid,playerid);
											SetTimerEx("UzyteKajdany",30000,0,"d",giveplayerid);
											poddaje[giveplayerid] = 1;
											lowcap[giveplayerid] = playerid;
										}
									}
									else
									{
										sendErrorMessage(playerid, "Odczekaj 30 sekund zanim znowu założysz kajdanki temu graczowi!");
									}
								}
								else
								{
									sendErrorMessage(playerid, "Ten gracz ma już założone kajdanki!");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nikt z was nie może być się w wozie!");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Jesteś za daleko od gracza !");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie ma takiego gracza !");
					}
				}
			}
			else
			{
				sendErrorMessage(playerid, "Używasz kajdanek!");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jesteś łowcą nagród!");
		}
	}*/
	return 1;
}

