//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ sex ]--------------------------------------------------//
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

YCMD:sex(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
   	{
        if(PlayerInfo[playerid][pJob] == 3)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
				sendTipMessageEx(playerid, COLOR_GREY, "Możesz oferować sex tylko w pojeździe !");
				return 1;
		    }
		    new Car = GetPlayerVehicleID(playerid);
			new giveplayerid, money;
			if( sscanf(params, "k<fix>d", giveplayerid, money))
			{
				sendTipMessage(playerid, "Użyj /sex [playerid/CzęśćNicku] [cena]");
				return 1;
			}
            if(GetPVarInt(playerid, "wysekszony") > 0) return sendErrorMessage(playerid, "Stosunek możesz uprawiać raz na dwie minuty!");
			if(money < PRICE_SEX_MIN || money > PRICE_SEX_MAX) { sendTipMessageEx(playerid, COLOR_GREY, "Cena od "#PRICE_SEX_MIN"$ do "#PRICE_SEX_MAX"$!"); return 1; }
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz oferować sexu temu graczowi!"); return 1; }
					    if(IsPlayerInAnyVehicle(playerid) && IsPlayerInVehicle(giveplayerid, Car))
					    {
						    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* Oferujesz %s uprawianie sexu z tobą za $%d.", giveplayer, money);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Prostytutka %s oferuje uprawianie sexu z nią za $%d (wpisz /akceptuj sex) aby się zgodzić.", sendername, money);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				            SexOffer[giveplayerid] = playerid;
				            SexPrice[giveplayerid] = money;
			            }
			            else
			            {
			                sendTipMessageEx(playerid, COLOR_GREY, "Musicie być w pojeździe aby to zrobić !");
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
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś prostytutką !");
		}
	}//not connected
	return 1;
}
