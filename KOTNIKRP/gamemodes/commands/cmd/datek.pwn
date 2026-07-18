//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ datek ]-------------------------------------------------//
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

YCMD:datek(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		new moneys;
		if( sscanf(params, "s[16]", string))
		{
			sendTipMessage(playerid, "Użyj /charity [kwota]");
			return 1;
		}
		moneys = FunkcjaK(string);

		if(PlayerInfo[playerid][pLocal] == 106)
		{
			sendErrorMessage(playerid, "Komenda nie działa w tym miejscu");
			return 1;
		}
		if(moneys < 1)
		{
			sendTipMessage(playerid, "Datek 0$ nie jest datkiem.");
			return 1;
		}
		if(kaska[playerid] < moneys)
		{
		    sendTipMessage(playerid, "Nie masz aż tyle pieniędzy.");
			return 1;
		}
		if(moneys < 100)
		{
		    sendTipMessage(playerid, "Żartujesz sobie? Nie chcemy takich groszy!");
			return 1;
		}
		ZabierzKaseDone(playerid, moneys);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s bardzo dziękujemy za przekazaną sumę $%d.",sendername, moneys);
		SendAdminMessage(COLOR_YELLOW, string);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		Log(payLog, WARNING, "%s wpłacił datek %d$", GetPlayerLogName(playerid), moneys);
	}
	return 1;
}
