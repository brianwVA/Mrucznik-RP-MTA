YCMD:zbijwl(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pJob] == 2 || CheckPlayerPerm(playerid, PERM_LAWYER))
	 	{
	 	    new playa;
			if( sscanf(params, "k<fix>", playa))
			{
				sendTipMessage(playerid, "Użyj /zbijwl [Nick/ID]");
				SendClientMessage(playerid, COLOR_GRAD3, "INFORMACJA: Komenda słuzy do zbicia WL graczowi do 0");
				SendClientMessage(playerid, COLOR_RED, "WAŻNE: Koszt ponoszony podczas zbijania WL to [WL gracza * "#MULT_LAWYER_WL"] - [skill * 10]");
				return 1;
			}


			if(IsPlayerConnected(playa))
		    {
   				if(playa != INVALID_PLAYER_ID)
			    {
				    if(GetDistanceBetweenPlayers(playerid,playa) < 10)
					{
					    if(PoziomPoszukiwania[playa] >= 1)
					    {
						    new koszt = PoziomPoszukiwania[playa] * MULT_LAWYER_WL;
						    new skill;
						    if(kaska[playerid] > koszt)
	   						{
	   						    if(playa != playerid)
								{
								    if(!PolicjantWStrefie(30.0, playa))
								    {
			   						    if(PlayerInfo[playerid][pLawSkill] <= 50)
			   						    {
			   						        skill = 0;
			   						        if(PoziomPoszukiwania[playa] > 3)
			   						        {
			   						            sendTipMessage(playerid, "Przestępstwa powyżej 3 WL mogą zbijać bardziej doświadczeni prawnicy (2 skill)", COLOR_LIGHTBLUE);
			   						            return 1;
			   						        }
			   						    }
			   						    else if(PlayerInfo[playerid][pLawSkill] >= 51 && PlayerInfo[playerid][pLawSkill] <= 99)
			   						    {
			   						        skill = 20;
			   						        if(PoziomPoszukiwania[playa] > 5)
			   						        {
			   						            sendTipMessage(playerid, "Przestępstwa federalne (powyżej 6 WL) mogą zbijać bardziej doświadczeni prawnicy (3 skill)", COLOR_LIGHTBLUE);
			   						            return 1;
			   						        }
			   						    }
			   						    else if(PlayerInfo[playerid][pLawSkill] >= 100 && PlayerInfo[playerid][pLawSkill] <= 199)
			   						    {
			   						        skill = 20;
			   						        if(PoziomPoszukiwania[playa] > 7)
			   						        {
			   						            sendTipMessage(playerid, "Poważne przestępstwa federalne (powyżej 8 WL) mogą zbijać bardziej doświadczeni prawnicy (4 skill)", COLOR_LIGHTBLUE);
			   						            return 1;
			   						        }
			   						    }
			   						    else if(PlayerInfo[playerid][pLawSkill] >= 200 && PlayerInfo[playerid][pLawSkill] <= 399)
			   						    {
			   						        skill = 40;
			   						    }
			   						    else if(PlayerInfo[playerid][pLawSkill] >= 400 && PlayerInfo[playerid][pLawSkill] <= 999)
			   						    {
			   						        skill = 50;
			   						    }
			   						    else if(PlayerInfo[playerid][pLawSkill] >= 1000)
			   						    {
			   						        skill = 60;
			   						    }
			   						    PoziomPoszukiwania[playa] = 0;
										SetPlayerWantedLevelEx(playa, 0);
			   						    GetPlayerName(playerid, sendername, sizeof(sendername));
					        			GetPlayerName(playa, giveplayer, sizeof(giveplayer));
					        			new kosztskill = koszt-skill;
					        			format(string, sizeof(string), "* Zbiłeś WL gracza %s do 0, koszt łapówek dla PD: %d$",giveplayer, kosztskill);
									    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								        format(string, sizeof(string), "* Prawnik %s zniwelował twój Poziom Poszukiwania do 0", sendername);
								        SendClientMessage(playa, COLOR_LIGHTBLUE, string);
								        format(string, sizeof(string),"* %s wykonuje parę telefonów i obniża WL %s.", sendername, giveplayer);
										ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
										ZabierzKase(playerid, kosztskill);
										format(string, sizeof(string), "~r~-$%d", kosztskill);
										GameTextForPlayer(playerid, string, 5000, 1);
										format(string, sizeof(string), "~g~WL = 0");
										GameTextForPlayer(playa, string, 5000, 1);
										PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
										PlayerInfo[playerid][pLawSkill] ++;
										SendClientMessage(playerid, COLOR_GRAD2, "Skill +1");
										PlayerPlaySound(playa, 1150, 0.0, 0.0, 0.0);
									}
									else
									{
									    sendErrorMessage(playerid, "Jesteś zbyt blisko policjanta aby zbić komuś WL!");
									}
								}
								else
								{
								    sendErrorMessage(playerid, "Nie możesz zbić WL samemu sobie");
								}
							}
							else
							{
								format(string, sizeof(string), "Nie stać cię na to, potrzebujesz %d !", koszt);
						        sendErrorMessage(playerid, string);
						    }
						}
						else
						{
						    sendErrorMessage(playerid, "Ten gracz ma 0 poziom poszuiwania");
						}
					}
					else
					{
					    sendErrorMessage(playerid, "Gracz jest za daleko");
					}
				}
				else
				{
				    sendErrorMessage(playerid, "Nie ma takiego gracza");
				}
			}
	 	}
	 	else
	 	{
	 		sendErrorMessage(playerid, "Nie jesteś prawnikiem");
		}
	}
	return 1;
}