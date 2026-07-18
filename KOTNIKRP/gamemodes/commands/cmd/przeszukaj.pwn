//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ przeszukaj ]----------------------------------------------//
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

YCMD:przeszukaj(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "Użyj /przeszukaj [playerid/CzęśćNicku]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
			    if (ProxDetectorS(8.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
				{
				    if(!IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(giveplayerid))
				    {
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz przeszukać samego siebie!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    new text1[60], text2[60], text3[60], text4[60], text5[60];
					    if(PlayerInfo[giveplayerid][pDrugs] > 0) { format(text1, sizeof(text1), "| Narkotyki (%d gram)", PlayerInfo[giveplayerid][pDrugs]); } else { text1 = "| Pusta kieszeń"; }
					    if(PlayerInfo[giveplayerid][pMats] > 0) { format(text2, sizeof(text2), "| Materiały (%d części)", CountMats(giveplayerid)); } else { text2 = "| Pusta kieszeń"; }
					    if(PlayerHasFishes(giveplayerid)) { text3 = "| Ryby"; } else { text3 = "| Pusta kieszeń"; }
					    if(HasItemType(giveplayerid, ITEM_TYPE_PHONEBOOK) != -1) { text4 = "| Książka tel"; } else { text4 = "| Pusta kieszeń"; }
					    if(HasItemType(giveplayerid, ITEM_TYPE_MP3) != -1) { text5 = "| MP3"; } else { text5 = "| Pusta kieszeń"; }
					    format(string, sizeof(string), "|__________ Wynik przeszukania %s __________|", giveplayer);
				        SendClientMessage(playerid, COLOR_WHITE, string);
				        format(string, sizeof(string), "%s.", text1);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text2);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text3);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text4);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text5);
						SendClientMessage(playerid, COLOR_GREY, string);
						PrintPlayerItems(giveplayerid, playerid);
						format(string, sizeof(string), "* %s przeszukał %s w poszukiwaniu nielegalnych rzeczy.", sendername ,giveplayer);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz być w pojeździe !");
				    	return 1;
					}
				}
				else
				{
				    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
				    return 1;
				}
			}
		}
        else
        {
            sendErrorMessage(playerid, "Nie ma takiego gracza !");
            return 1;
        }
	}
    return 1;
}
