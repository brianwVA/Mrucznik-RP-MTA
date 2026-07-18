//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ teczka ]------------------------------------------------//
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

YCMD:teczka(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 1)
        {
			new giveplayerid, moneys;
			if( sscanf(params, "k<fix>s[32]", giveplayerid, string))
			{
				sendTipMessage(playerid, "Użyj /teczka [playerid/CzęśćNicku] [ilość]");
				return 1;
			}
			moneys = FunkcjaK(string);

			if(PlayerInfo[playerid][pConnectTime] < 2)
			{
				sendTipMessage(playerid, "Zanim będziesz mógł płacić, musisz grać więcej niż 2 godzinę online!");
			    return 1;
			}

			if(moneys < 1 || moneys > 10001)
			{
			    sendTipMessage(playerid, "Kwota musi wynosić mniej niż 10000$ .");
			    return 1;
			}
			if(AntySpam[playerid] == 1)
			{
			    sendTipMessage(playerid, "Odczekaj 15 sekund lub skorzystaj z przelewu");
				return 1;
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID && playerid != giveplayerid)
			    {
			        if(PlayerInfo[giveplayerid][pLocal] == 106)
					{
						sendErrorMessage(playerid, "Komenda nie działa w tym miejscuu");
						return 1;
					}
					if (ProxDetectorS(5.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
					{
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new playermoney = kaska[playerid];
						if (moneys > 0 && playermoney >= moneys)
						{
							ZabierzKaseDone(playerid, moneys);
							DajKaseDone(giveplayerid, moneys);
							format(string, sizeof(string), "   Dałeś %s(gracz: %d), $%d.", giveplayer,giveplayerid, moneys);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_GRAD1, string);
							format(string, sizeof(string), "   Otrzymałeś $%d od %s(gracz: %d).", moneys, sendername, playerid);
							SendClientMessage(giveplayerid, COLOR_GRAD1, string);
							if(moneys >= 1000)
							{
								format(string, sizeof(string), "%s otrzymał $%d od %s", giveplayer, moneys, sendername);
								ABroadCast(COLOR_YELLOW,string,1);
							}
							Log(payLog, WARNING, "%s dał %s kwotę %d$", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), moneys);
							PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "* %s wyciąga teczkę i podaje %s.", sendername ,giveplayer);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							AntySpam[playerid] = 1;
							SetTimerEx("AntySpamTimer",15000,0,"d",playerid);
						}
						else
						{
							sendErrorMessage(playerid, "Nieprawidłowa ilość pieniędzy.");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Jesteś za daleko od gracza.");
					}
				}//invalid id
			}
			else
			{
				format(string, sizeof(string), "%d nie jest na serwerze.", giveplayerid);
				sendErrorMessage(playerid, string);
			}
		}
	}
	return 1;
}
