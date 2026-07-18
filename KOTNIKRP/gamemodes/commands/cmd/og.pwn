//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ og ]--------------------------------------------------//
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

YCMD:og(playerid, params[], help)
{
    new string[256], admstring[256];
    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nie jesteś zalogowany!");
		else if(PlayerInfo[playerid][pConnectTime] == 0 && PlayerInfo[playerid][pLevel] == 1) return sendErrorMessage(playerid, "Aby pisać ogłoszenia musisz przegrać 1h na serwerze!");
		else if(GetPlayerAdminDutyStatus(playerid) == 1) return sendErrorMessage(playerid, "Nie możesz pisać ogłoszeń podczas służby administratora!");
		else if(PlayerInfo[playerid][pJailed] != 0) return sendErrorMessage(playerid, "Nie posiadasz telefonu w więzieniu!");
        else if(GetPhoneNumber(playerid) == 0) return SendClientMessage(playerid, COLOR_GREY, "Nie masz telefonu. Kup go w 24/7 !");
        else if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, "UŻYJ: (/og)loszenie [tekst ogłoszenia]");
		else if(sprawdzReklame(params, playerid) == 1) return 1;
		else if(sprawdzWulgaryzmy(params, playerid) == 1) return 1;
		else if(strlen(params) > 50) return sendErrorMessage(playerid, "Limit znaków to 50;");
		else if(PlayerInfo[playerid][pBP] >= 1)
		{
			format(string, sizeof(string), "Nie możesz napisać na tym czacie, gdyż masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			return SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
		}
		else if(GetPhoneOnline(playerid) == 0)
		{
			sendTipMessage(playerid, "Twój telefon jest wyłączony! Włącz go za pomocą /p Telefon");
			return 1;
		}
		else if ((!adds) && (!IsPlayerPremiumOld(playerid)) && PlayerInfo[playerid][pAdmin] < 10)
		{
			format(string, sizeof(string), "Spróbuj później, %d sekund między ogłoszeniami !",  (addtimer/1000));
			return SendClientMessage(playerid, COLOR_GRAD2, string);
		}
		else
		{
			new Float:paramlen = float(strlen(params));
			new payout = floatround(paramlen * MULT_OGLOSZENIE, floatround_ceil);
			if(kaska[playerid] < payout)
			{
				format(string, sizeof(string), "* Użyłeś %d znaków i masz zapłacić $%d, nie posiadasz aż tyle.", strlen(params), payout);
				return SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			}
			ZabierzKaseDone(playerid, payout);
			format(string, sizeof(string), "%s, Kontakt: %d", params, GetPhoneNumber(playerid));
			format(admstring, sizeof(admstring), "%s, Kontakt: %d [%s]", params, GetPhoneNumber(playerid), GetNick(playerid));
			
			new bool:anyoneNeedsTextdraw = false;
			foreach(new i : Player)
			{
				if(IsPlayerConnected(i) && !gNews[i] && PlayerPersonalization[i][PERS_AD] == 0)
				{
					if(PlayerPersonalization[i][PERS_OG_TYPE] == 1 || PlayerPersonalization[i][PERS_OG_TYPE] == 2)
					{
						anyoneNeedsTextdraw = true;
						break;
					}
				}
			}

			if(anyoneNeedsTextdraw)
			{
				TextDrawSetString(AdvertTXD, FormatAdvertString(string));
			}
			
			foreach(new i : Player)
			{
				if(IsPlayerConnected(i))
				{
					if(!gNews[i] && PlayerPersonalization[i][PERS_AD] == 0) // Jeśli nie zablokował ogłoszeń
					{
						new msgToSend[256];
						if(GetPlayerAdminDutyStatus(i) == 1)
							format(msgToSend, sizeof(msgToSend), "%s", admstring);
						else
							format(msgToSend, sizeof(msgToSend), "%s", string);
							
						if(PlayerPersonalization[i][PERS_OG_TYPE] == 0) // Tylko chat
						{
							SendClientMessage(i, TEAM_GROVE_COLOR, msgToSend);
							TextDrawHideForPlayer(i, AdvertTXD);
						}
						else if(PlayerPersonalization[i][PERS_OG_TYPE] == 1) // Tylko textdraw
						{
							TextDrawShowForPlayer(i, AdvertTXD);
						}
						else if(PlayerPersonalization[i][PERS_OG_TYPE] == 2) // Oba
						{
							SendClientMessage(i, TEAM_GROVE_COLOR, msgToSend);
							TextDrawShowForPlayer(i, AdvertTXD);
						}
					}
					else
					{
						TextDrawHideForPlayer(i, AdvertTXD);
					}
				}
			}
			Log(chatLog, WARNING, "%s ogłoszenie: %s", GetPlayerLogName(playerid), params);
			format(string, sizeof(string), "~r~Zaplaciles $%d~n~~w~Za: %d Znakow", payout, strlen(params));
			GameTextForPlayer(playerid, string, 5000, 5);
			if (PlayerInfo[playerid][pAdmin] < 1 && (!IsPlayerPremiumOld(playerid)))
			{
				SetTimer("AddsOn", addtimer, 0);adds = 0;
			}
		}   
    }
    return 1;
}
