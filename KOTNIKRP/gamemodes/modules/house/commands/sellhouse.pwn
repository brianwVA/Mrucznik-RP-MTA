//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ selldom ]------------------------------------------------//
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

forward command_sellhouse();
public command_sellhouse()
{
    Command_AddAltNamed("sellhouse", "sprzedajdom");
}

YCMD:sellhouse(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	    if(gPlayerLogged[playerid] == 1)
	    {
            new houseid = House_PlayerGetID(playerid);
	        if(houseid != -1)
	        {
	            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID])
	        	{
                    sendErrorMessage(playerid, "Ten dom nie należy do Ciebie");
                    return 1;
	        	}
                new giveplayerid, money;
                if( sscanf(params, "k<fix>s[32]", giveplayerid, string))
                {
                    sendTipMessage(playerid, "Użyj /sprzedajdom [id/nick] [cena]");
                    return 1;
                }
                money = FunkcjaK(string);
                if(!IsPlayerConnected(giveplayerid) || giveplayerid == playerid)
                {
                    sendErrorMessage(playerid, "Nie ma takiego gracza");
                    return 1;
                }

                if(money < PRICE_SELLHOUSE_MIN)
                {
                    sendTipMessage(playerid, "Cena musi być powyżej "#PRICE_SELLHOUSE_MIN"$");
                    return 1;
                }
                if(money > PRICE_SELLHOUSE_MAX)
                {
                    sendTipMessage(playerid, "Cena musi być poniżej "#PRICE_SELLHOUSE_MAX"$");
                    return 1;
                }
                if(kaska[giveplayerid] >= money)
                {
                    if(IsPlayerInRangeOfPoint(giveplayerid, 10.0, House[houseid][h_enter_pos][0], House[houseid][h_enter_pos][1], House[houseid][h_enter_pos][2]))
                    {
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
                        format(string, sizeof(string), "Gracz %s proponuje ci sprzedaż swojego domu za %d$, aby go kupić wpisz /akceptuj dom.", sendername, money);
                        SendClientMessage(giveplayerid, COLOR_WHITE, "Aby zobaczyć informacje o proponowanym domu wpisz /dominfo przy domu.");
                        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "Zaoferowałeś graczowi %s sprzedaż swojego domu za %d$", giveplayer, money);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        DomOffer[giveplayerid] = playerid;
                        DomCena[giveplayerid] = money;
                        SetPVarInt(playerid, "DomOfferID", houseid);
                    }
                    else
                    {
                        sendTipMessage(playerid,"Gracz któremu chcesz sprzedać dom musi stać przy twoim domu.");
                    }
                }
                else
                {
                    sendTipMessage(playerid,"Tego gracza nie stać na kupno za tą cenę.");
                }
            }
	        else
	        {
	            sendTipMessage(playerid,"Nie znajdujesz się w pobliżu żadnego domu.");
	        }
	    }
	}
	return 1;
}
