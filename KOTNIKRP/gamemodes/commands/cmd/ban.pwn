//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ ban ]--------------------------------------------------//
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

YCMD:ban(playerid, params[], help)
{
	new string[256];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid)) 
    {
    	new giveplayerid, result[64];
		if( sscanf(params, "k<fix>s[64]", giveplayerid, result))
		{
			sendTipMessage(playerid, "Użyj /ban [playerid/CzęśćNicku] [powód]");
			return 1;
		}
		
	    if(AntySpam[playerid] == 1)
	    {
	        sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 5 sekund");
	        return 1;
	    }
	    if(IsPlayerConnected(giveplayerid))
	    {
	        if(giveplayerid != INVALID_PLAYER_ID)
	        {
	            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
	            if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1 || IsAScripter(playerid))
	            {
					if(IsPlayerAdmin(giveplayerid) || Uprawnienia(giveplayerid, ACCESS_OWNER))
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zbanować Head Admina !");
						return 1;
					}
					if( (PlayerInfo[giveplayerid][pAdmin] >= 1 || PlayerInfo[giveplayerid][pNewAP] >= 1 || PlayerInfo[giveplayerid][pZG] >= 4) && PlayerInfo[playerid][pZG] >= 4)
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zbanować Admina, P@ i ZG!");
						return 1;
					}
					if(PlayerInfo[giveplayerid][pLevel] > 1 && PlayerInfo[playerid][pNewAP] >= 1 && !PlayerInfo[playerid][pAdmin])
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zbanować gracza z levelem wiekszym niz 1!");
						return 1;
					}
                    if(gPlayerLogged[giveplayerid] == 0)
                    {
                        sendTipMessageEx(playerid, COLOR_WHITE, " Gracz nie jest zalogowany, użyj kicka.");
						return 1;
                    }
					SetTimerEx("AntySpamTimer",5000,0,"d",playerid);
					AntySpam[playerid] = 1;
					SetPVarInt(playerid, "PunishBanPlayer", giveplayerid);
					SetPVarString(playerid, "PunishBanPlayer_Reason", result);
					format(string, sizeof string, "{FFFFFF}Czy podjąłeś dialog z graczem {B7EB34}%s{FFFFFF}?\nJeżeli to możliwe, możesz ukarać gracza lżejszą karą.", GetNick(giveplayerid));
					ShowPlayerDialogEx(playerid, 9522, DIALOG_STYLE_MSGBOX, "Nadawanie bana", string, "Ban :(", "Anuluj karę");
					return 1;
			  	}
				else
				{
				    if(PlayerInfo[playerid][pNewAP] >= 1 && PlayerInfo[playerid][pNewAP] <= 3)
				    {
                        if(IsPlayerAdmin(giveplayerid) || Uprawnienia(giveplayerid, ACCESS_OWNER))
    					{
    						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zbanować Head Admina !");
    						return 1;
    					}
						if(PlayerInfo[giveplayerid][pAdmin] >= 1)
						{
							sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zbanować Admina !");
							return 1;
						}
                        if(gPlayerLogged[giveplayerid] == 0)
                        {
                            sendTipMessageEx(playerid, COLOR_WHITE, " Gracz nie jest zalogowany, użyj kicka.");
							return 1;
                        }
						SetTimerEx("AntySpamTimer",5000,0,"d",playerid);
						AntySpam[playerid] = 1;
						
						if(AddPunishment(giveplayerid, GetNick(giveplayerid), playerid, gettime(), PENALTY_BAN, 0, result, 0) == 1) {
							if(GetPlayerAdminDutyStatus(playerid) == 1)
							{
								iloscBan[playerid]++;
							}
							else if(GetPlayerAdminDutyStatus(playerid) == 0)
							{
								iloscPozaDuty[playerid]++; 
							}
							format(string, sizeof(string), "AdmCmd: Administrator zbanował %s, powód: %s", giveplayer, (result));
							SendPunishMessage(string, giveplayerid);
							if(kary_TXD_Status == 1)
							{
								BanPlayerTXD(giveplayerid, result);
							}
							SendClientMessage(giveplayerid, COLOR_NEWS, "Jeśli uważasz ze ban jest niesłuszny wejdź na M-RP i złóż prosbę o UN-BAN");
							Log(punishmentLog, WARNING, "PółAdmin %s ukarał %s karą bana, powód: %s", 
								GetPlayerLogName(playerid),
								GetPlayerLogName(giveplayerid),
								result);
							//MruMySQL_Banuj(giveplayerid, result, playerid);
							KickEx(giveplayerid);
							return 1;
						}
					}
					else
					{
					    noAccessMessage(playerid);
					}
				}
			}//not connected
		}
		else
		{
			format(string, sizeof(string), "   Gracz o ID %d nie istnieje.", giveplayerid);
			sendErrorMessage(playerid, string);
		}
	}
	return 1;
}
