//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ pobij ]-------------------------------------------------//
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

/*
YCMD:pobij(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(IsAMedyk(playerid))
    	{
    	    sendErrorMessage(playerid, "Nie możesz uzywać tej komendy");
			return 1;
		}
        // w kasynie
        if(IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805,-1090.59741211,-67.52223969)) return SendClientMessage(playerid, COLOR_GRAD2, "Komenda nie działa w kasynie!");
        if(pobilem[playerid] >= 1)
		{
			sendTipMessage(playerid, "Jesteś już zmęczony po ostatniej walce, odpocznij chwilę zanim zaczniesz znowu.", COLOR_GRAD1);
  			pobilem[playerid] = 2;
  			return 1;
		}
		
		new playa;
		if( sscanf(params, "k<fix>", playa))
		{
			sendTipMessage(playerid, "Użyj /pobij [id/nick]");
			return 1;
		}

		if(IsPlayerConnected(playa))
		{
			if(playa != INVALID_PLAYER_ID && playa != playerid)
			{
	    		if(GetDistanceBetweenPlayers(playerid,playa) < 5 && Spectate[playa] == INVALID_PLAYER_ID)
 				{
 				    if(GetPlayerState(playerid) == 1)
 				    {
 				        if(GetPlayerState(playa) == 1)
 				    	{
							if(GetPlayerAdminDutyStatus(playerid) == 1)
							{
								sendErrorMessage(playerid, "Nie możesz pobić nikogo będąc na @Duty!"); 
								return 1;
							}
							if(GetPlayerAdminDutyStatus(playa) == 1)
							{
								sendErrorMessage(playerid, "Nie możesz pobić administratora!"); 
								return 1;
							}
 				    	    if(podczasbicia[playa] == 0)
 				    	    {
 				    	        if(GUIExit[playerid] == 0 && GUIExit[playa] == 0)
    							{
    							    if(PlayerInfo[playerid][pLevel] < 3)
    							    {
    							        sendTipMessage(playerid, "Musisz mieć 3 lvl aby używać tej komendy!");
					       			    return 1;
    							    }
	     				    	    if(pobity[playa] == 1 || pobity[playerid] == 1 ||
									 Kajdanki_JestemSkuty[playa] >= 1 || Kajdanki_JestemSkuty[playerid] >= 1 ||
									 PlayerCuffed[playa] == 1|| PlayerCuffed[playerid] == 1 || 
									 PlayerInfo[playa][pBW] != 0 || PlayerInfo[playerid][pBW] != 0 ||
									 PlayerInfo[playa][pInjury] != 0 || PlayerInfo[playerid][pInjury] != 0)
					       			{
					        			sendTipMessage(playerid, "Nie możesz pobić rannego lub pobitego gracza / jesteś ranny lub pobity, nie możesz bić innych.");
						       			return 1;
					       			}
					       			if(GetPlayerWeapon(playa) >= 22)
					       			{
					       			    sendTipMessage(playerid, "Nie możesz pobić gracza z bronią!");
					       			    return 1;
					       			}
					       			// {
					       			new rand = random(15);
			            			GetPlayerName(playa, giveplayer, sizeof(giveplayer));
									GetPlayerName(playerid, sendername, sizeof(sendername));
			                        // }
			                        format(string, sizeof(string), "* %s próbuje uderzyć %s.", sendername, giveplayer);
									ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
									PoziomPoszukiwania[playerid] += 1;
									SetPlayerCriminal(playerid,INVALID_PLAYER_ID, "Pobicie człowieka");
									if(rand >= 1)
									{
										new randbitwa = random(30);
										//kodbitwy[playa] = (PobijText[randbitwa]);
										strmid(kodbitwy, PobijText[randbitwa], 0, strlen(PobijText[randbitwa]));
										format(string, sizeof(string), "Próbujesz pobić %s, za 15 sekund rostrzygnie się bitwa!", giveplayer);
	                                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
										format(string, sizeof(string), "%s próbuje cię pobić! Wpisz ten kod aby się obronić:\n%s", sendername, kodbitwy);
										ShowPlayerDialogEx(playa, 90, DIALOG_STYLE_INPUT, "BITWA!!", string, "Wybierz", "Wyjdź");
										PlayerPlaySound(playerid, 1097, 0.0, 0.0, 0.0);
										PlayerPlaySound(playa, 1097, 0.0, 0.0, 0.0);
										TogglePlayerControllable(playerid, 0);
										TogglePlayerControllable(playa, 0);
										ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0);
			    						ApplyAnimation(playa, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0);
			    						ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0);
			    						ApplyAnimation(playa, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0);
										bijep[playa] = playerid;
										bijep[playerid] = playa;
										podczasbicia[playa] = 1;
										pobilem[playerid] = 2;
										zdazylwpisac[playerid] = 1;
										zdazylwpisac[playa] = 1;
										new timerbicia = SetTimerEx("naczasbicie",15000,0,"dd",playa, playerid);
										SetPVarInt(playa, "timerBicia", timerbicia);
									}
									else
									{
										format(string, sizeof(string), "* %s zablokował cios i kontratakował bijąc %s.", giveplayer, sendername);
										ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			                            format(string, sizeof(string), "%s okazał się silniejszym przeciwnikiem i wygrał walkę.", giveplayer);
										SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
										format(string, sizeof(string), "%s chciał cię pobić, lecz obroniłeś się i wygrałeś walkę.", sendername);
										SendClientMessage(playa, COLOR_LIGHTBLUE, string);
										ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0); // Dieing of Crack
										PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);
										PlayerPlaySound(playa, 1130, 0.0, 0.0, 0.0);
										TogglePlayerControllable(playerid, 0);
										PlayerCuffed[playerid] = 2;
										PlayerCuffedTime[playerid] = 45;
										pobity[playerid] = 1;
										SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odczekaj 45 sekund");
										SetTimerEx("pobito",000,0,"d",playerid);
										pobilem[playerid] = 1;
									}
								}
							}
							else
							{
							    sendErrorMessage(playerid, "Już ktoś toczy walke z tym graczem !");
							}
						}
						else
						{
						    sendErrorMessage(playerid, "Nie możesz pobić gracza gdy on jest w pojeździe !");
						}
					}
					else
					{
					    sendErrorMessage(playerid, "Nie możesz pobić gracza gdy jesteś w pojeździe !");
					}
 				}
				else
				{
					sendErrorMessage(playerid, "Ten gracz jest za daleko!");
					return 1;
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Ten gracz jest za daleko !");
			return 1;
		}
	} 
	return 1;
}
