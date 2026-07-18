//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ aresztuj ]-----------------------------------------------//
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

YCMD:aresztuj(playerid, params[], help)
{
	new string[135];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
   	{
   	    if(GroupPlayerDutyPerm(playerid, PERM_POLICE))
   	    {
   	        if(PlayerToPoint(10.0, playerid, 222.6395,114.3951,999.0156) //old komi
			|| IsPlayerInRangeOfPoint(playerid, 10.0, 268.3546, 83.0229, 1001.0391)//dillimore
			|| PlayerToPoint(10.0, playerid, -2614.1667,2264.6279,8.2109 ) //bayside
			|| PlayerToPoint(5, playerid, 1560.0333,-1638.6797,28.4881)//nowe komi 1
			|| PlayerToPoint(50, playerid, 599.6600, -1490.9373, 82.4881) // fbi areszt
			|| PlayerToPoint(5, playerid, 1559.8517,-1646.9373,28.4881)//nowe komi 2
			|| PlayerToPoint(10, playerid, 1992.3909,-2129.6147,30.5631))//nowe komi koło lotniska
			{

		   	    new playa;
				if( sscanf(params, "k<fix>", playa))
				{
					sendTipMessage(playerid, "Użyj /aresztuj [playerid/CzęśćNicku]");
					return 1;
				}


				if(IsPlayerConnected(playa))
				{
				    if(playa != INVALID_PLAYER_ID)
				    {
				        if(ProxDetectorS(10.0, playerid, playa))
						{
						    if(playerid != playa)
						    {
								if(PoziomPoszukiwania[playa] == 0)
								{
									sendTipMessageEx(playerid, COLOR_GRAD3, "Ten gracz nie ma WL.");
									return 1;
								}
						        new price = PoziomPoszukiwania[playa]*MULT_POLICE_ARREST;
						        new price2 = PoziomPoszukiwania[playa]*MULT_POLICE_ARRESTED;
						        new bail = PoziomPoszukiwania[playa]*MULT_POLICE_BAIL;
						        new jt = PoziomPoszukiwania[playa] * 60;
								ZabierzKaseDone(playa, price2);
	                            GetPlayerName(playa, giveplayer, sizeof(giveplayer));
	                            GetPlayerName(playerid, sendername, sizeof(sendername));
                                new depo2 = floatround(float(price) * 0.7, floatround_round);
                                new depo3 = floatround(float(price) * 0.6, floatround_round);
                                PoziomPoszukiwania[playa] = 0;
								SetPlayerWantedLevelEx(playa, 0);
								if(IsAFBI(playerid)){
									DajKaseDone(playerid, depo3);
									format(string, sizeof(string), "Uwięziłeś %s, nagroda za przestępcę: %d$. Otrzymujesz $%d", giveplayer, price, depo3+100);
									Sejf_Add(PlayerInfo[playerid][pGrupa][OnDuty[playerid]-1], depo2);
								}
								else{
									DajKaseDone(playerid, depo3);
									format(string, sizeof(string), "Uwięziłeś %s, nagroda za przestępcę: %d$. Otrzymujesz $%d", giveplayer, price, depo3);
									Sejf_Add(PlayerInfo[playerid][pGrupa][OnDuty[playerid]-1], depo2);
								}
                                // format(string, sizeof(string), "* Uwięziłeś %s w Więzieniu, nagroda za przestępcę: %d", giveplayer, price);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								PlayerInfo[playa][pJailed] = 1;
								PlayerInfo[playa][pJailTime] = jt;
								format(string, sizeof(string), "* Jesteś w więzieniu na %d Sekund i otrzymałeś grzywnę w wysokości $%d, kaucja to: %d$.", PlayerInfo[playa][pJailTime], price2,bail);
								SendClientMessage(playa, COLOR_LIGHTBLUE, string);
                                poscig[playa] = 0;
								WantLawyer[playa] = 1;
								PlayerInfo[playa][pArrested] += 1;
								/*kajdanki*/
								Kajdanki_JestemSkuty[playa] = 0;//Kajdany
                                Kajdanki_Uzyte[playa] = 0;
                                Kajdanki_PDkuje[playerid] = 0;
                                Kajdanki_Uzyte[playerid] = 0;
								ClearAnimations(playa);
								SetPlayerSpecialAction(playa,SPECIAL_ACTION_NONE);
								RemovePlayerAttachedObject(playa, 0);
								Kajdanki_PDkuje[playa] = 0;
								Wchodzenie(playa);
								SetPlayerVirtualWorld(playa, 29);
								if(IsAFBI(playerid)){
									new losuj= random(sizeof(Cela));
									SetPlayerPos(playa, CelaFBI[losuj][0], CelaFBI[losuj][1], CelaFBI[losuj][2]);
								}else{
									new losuj= random(sizeof(Cela));
									SetPlayerPos(playa, Cela[losuj][0], Cela[losuj][1], Cela[losuj][2]);
								}
								TogglePlayerControllable(playa, 0);
                                Wchodzenie(playa);
								JailPrice[playa] = bail;
                                SetPVarInt(playa, "kaucja-dlaKogo", PlayerInfo[playerid][pMember]);
								UsunBron(playa);//usun bron
								ClearAnimations(playa);
								SetPlayerSpawnWeapon(playa);
								if(IsPlayerInGroup(playerid, 3))
								{
									format(string, sizeof(string), "<< Agent FBI %s aresztował podejrzanego %s >>", sendername, giveplayer);
									foreach(new i : Player)
									{
										if(IsPlayerConnected(i) && PlayerPersonalization[i][PERS_ARREST_MSG] == 0)
											SendClientMessage(i, COLOR_LIGHTRED, string);
									}
								}
								if(IsPlayerInGroup(playerid, 1))
								{
									format(string, sizeof(string), "<< Policjant %s aresztował podejrzanego %s >>", sendername, giveplayer);
									foreach(new i : Player)
									{
										if(IsPlayerConnected(i) && PlayerPersonalization[i][PERS_ARREST_MSG] == 0)
											SendClientMessage(i, COLOR_LIGHTRED, string);
									}
								}
							}
							else
							{
								sendTipMessageEx(playerid, COLOR_GRAD3, "Nie możesz wsadzić samego siebie do celi.");
							}
						}
						else
						{
							sendTipMessageEx(playerid, COLOR_GRAD3, "Gracz jest za daleko.");
						}
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GRAD3, "Nie ma takiego gracza.");
					}
				}
				else
				{
					sendErrorMessage(playerid, "Nie ma takiego gracza.");
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Musisz być przy celach aby kogoś zaaresztować!");
			    return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jesteś z Policji.");
		}
	}
	return 1;
}
