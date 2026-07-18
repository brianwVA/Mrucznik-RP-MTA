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

YCMD:selldom(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	    if(gPlayerLogged[playerid] == 1)
	    {
	        if(PlayerInfo[playerid][pDom] != 0)
	        {
	            new dom = PlayerInfo[playerid][pDom];
	            if(Dom[dom][hBlokada] == 1)
	        	{
                    sendErrorMessage(playerid, "Ten dom ma blokadę sprzedawania");
                    return 1;
	        	}
	            if(IsPlayerInRangeOfPoint(playerid, 10.0, Dom[dom][hWej_X], Dom[dom][hWej_Y], Dom[dom][hWej_Z]))
	            {
	                new giveplayerid, money;
					if( sscanf(params, "k<fix>s[32]", giveplayerid, string))
					{
						sendTipMessage(playerid, "Użyj /sprzedajdom [id/nick] [cena]");
						return 1;
					}
					money = FunkcjaK(string);
					if(!IsPlayerConnected(giveplayerid))
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
					if(PlayerInfo[giveplayerid][pDom] == 0)
					{
					    if(PlayerInfo[giveplayerid][pWynajem] == 0)
					    {
					        if(kaska[giveplayerid] >= money)
					        {
					            if(IsPlayerInRangeOfPoint(giveplayerid, 10.0, Dom[PlayerInfo[playerid][pDom]][hWej_X], Dom[PlayerInfo[playerid][pDom]][hWej_Y], Dom[PlayerInfo[playerid][pDom]][hWej_Z]))
	            				{
	            				    if(PlayerInfo[giveplayerid][pLevel] < 3)
	            				    {
	            				        SendClientMessage(playerid, COLOR_GRAD2, "Gracz któremu sprzedajesz dom musi mieć co najmniej 3 lvl!");
					    				return 1;
	            				    }
						            GetPlayerName(playerid, sendername, sizeof(sendername));
						            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
									format(string, sizeof(string), "Gracz %s proponuje ci sprzedaż swojego domu za %d$, aby go kupić wpisz /akceptuj dom.", sendername, money);
									SendClientMessage(giveplayerid, COLOR_WHITE, "Aby zobaczyć informacje o proponowanym domu wpisz /dominfo przy domu.");
									SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "Zaoferowałeś graczowi %s sprzedaż swojego domu za %d$", giveplayer, money);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									DomOffer[giveplayerid] = playerid;
									DomCena[giveplayerid] = money;
									SetPVarInt(playerid, "DomOfferID", PlayerInfo[playerid][pDom]);
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
					        sendTipMessage(playerid,"Ten gracz wynajmuje dom. Aby dać mu swój dom poproś go aby wpisał /unrent.");
					    }
					}
					else
					{
					    sendTipMessage(playerid,"Ten gracz posiada własny dom. Nie możesz mu sprzedać domu.");
					}
	            }
	            else
	            {
	                sendTipMessage(playerid,"Musisz stać przy swoim domu.");
	            }
	        }
	        else
	        {
	            sendTipMessage(playerid,"Nie posiadasz domu.");
	        }
	    }
	}
	return 1;
}
