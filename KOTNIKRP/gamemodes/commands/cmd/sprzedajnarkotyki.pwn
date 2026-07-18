//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------[ sprzedajnarkotyki ]-------------------------------------------//
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

YCMD:sprzedajnarkotyki(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	    if(PlayerInfo[playerid][pJob] != 4)
	    {
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś Dilerem Dragów!");
			return 1;
	    }
		new playa, needed, money;
		if( sscanf(params, "k<fix>dd", playa, needed, money))
		{
			sendTipMessage(playerid, "Użyj /sprzedajdragi [playerid/CzęśćNicku] [ilość] [cena]");
			return 1;
		}
        if(GetPVarInt(playerid, "wydragowany") > 0) return sendErrorMessage(playerid, "Dragi możesz sprzedawać raz na minutę!");
		if(needed < 1 || needed > 99) { SendClientMessage(playerid, COLOR_GREY, "   Ilość gram od 1 do 60!"); return 1; }
		if(money < 1 || money > 9999) { SendClientMessage(playerid, COLOR_GREY, "   Cena od 1 do 9999!"); return 1; }
		if(needed > PlayerInfo[playerid][pDrugs]) { SendClientMessage(playerid, COLOR_GREY, "   Nie masz aż tylu narkotyków przy sobie !"); return 1; }
		if(IsPlayerConnected(playa))
		{
		    if(playa != INVALID_PLAYER_ID)
		    {
				if (ProxDetectorS(8.0, playerid, playa))
				{
				    if(playa == playerid)
				    {
				        sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz sprzedać dragów samemu sobie!");
				        return 1;
				    }
				    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
				    format(string, sizeof(string), "* Oferujesz %s sprzedaż %d gram za $%d .", giveplayer, needed, money);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "* Diler Dragów %s oferuje sprzedaż %d gram narkotyków za $%d, (wpisz /akceptuj dragi) aby kupić.", sendername, needed, money);
					SendClientMessage(playa, COLOR_LIGHTBLUE, string);
					DrugOffer[playa] = playerid;
					DrugPrice[playa] = money;
					DrugGram[playa] = needed;
				}
				else
				{
				    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
				}
			}
		}
		else
		{
		    sendErrorMessage(playerid, "   Nie ma takiego gracza.");
		}
	}
	return 1;
}
