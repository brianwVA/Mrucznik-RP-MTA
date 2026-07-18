//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ przelew ]------------------------------------------------//
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

YCMD:przelew(playerid, params[], help)
{
	new string[128];
	
	if(IsPlayerConnected(playerid))
	{
		if(GetPLocal(playerid) != PLOCAL_INNE_BANK)
		{
			sendErrorMessage(playerid, "Nie znajdujesz się w banku lub nie posiadasz smartfona!"); 
			return 1;
		}
		if(PlayerInfo[playerid][pConnectTime] < 1) return sendTipMessage(playerid, "Zanim będziesz mógł płacić, musisz grać więcej niż 1 godzinę online!");
		if(PlayerPersonalization[playerid][PERS_KB] == 0)
		{
			format(string, sizeof(string), "Konto Bankowe >> %s >> Przelew", GetNick(playerid));
			ShowPlayerDialogEx(playerid, 1072, DIALOG_STYLE_INPUT, string, "Wpisz poniżej ID odbiorcy", "Wykonaj", "Odrzuć");
		}
		else
		{
			new giveplayerid, value;
			if( sscanf(params, "k<fix>d", giveplayerid, value))
			{
				sendTipMessage(playerid, "Użyj /przelew [ID_GRACZA] [KWOTA]");
				return 1;
			}
			if(IsPlayerConnected(giveplayerid))
			{
				if(GetPlayerVirtualWorld(giveplayerid) == 1488)
				{
					sendErrorMessage(playerid, "Ten gracz jest w trakcie logowania!"); 
					return 1;
				}
				if(giveplayerid != playerid)
				{
					if(PlayerInfo[playerid][pAccount] < value)
					{	
						sendErrorMessage(playerid, "Nie masz takiej kwoty na swoim koncie!"); 
						return 1;
					}
					if(value <= 0)
					{
						sendErrorMessage(playerid, "Nie możesz wykonywać przelewów na minus / zero.");
						return 1;
					}
					if(PlayerInfo[giveplayerid][pAccount]+value > MAX_MONEY_IN_BANK)
					{
						sendErrorMessage(playerid, "Gracz do którego próbowałeś przelać gotówkę - ma zbyt dużo pieniędzy na koncie."); 
						return 1;
					}
					//Czynności:
					SetPlayerBank(playerid, PlayerInfo[playerid][pAccount] - value);
					SetPlayerBank(giveplayerid, PlayerInfo[giveplayerid][pAccount] + value);
				
					//komunikaty:
					format(string, sizeof(string), "Otrzymałeś przelew w wysokości %d$ od %s . Pieniądze znajdują się na twoim koncie.", value, GetNick(playerid));
					SendClientMessage(giveplayerid, COLOR_RED, string);
				
					format(string, sizeof(string), "Wysłałeś przelew dla %s w wysokości %d$. Pieniądze zostały pobrane z twojego konta bankowego", GetNick(giveplayerid), value);
					SendClientMessage(playerid, COLOR_RED, string); 
				
					Log(payLog, WARNING, "%s przelał %s kwotę %d$", 
					GetPlayerLogName(playerid),
					GetPlayerLogName(giveplayerid),
					value);
				
					if(value >= 50000)//Wiadomosc dla adminow
					{
						format(string, sizeof(string), "Gracz %s wysłał przelew do %s w wysokości %d$", GetNick(playerid), GetNick(giveplayerid), value);
						SendAdminMessage(COLOR_YELLOW, string);
						return 1;
					}
				}
				else
				{
					sendErrorMessage(playerid, "Nie możesz przelać gotówki samemu sobie!");
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie ma na serwerze takiego gracza!"); 
				return 1;
			}
		}
	}
	return 1;
}
