//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ sprzedajalkohol ]--------------------------------------------//
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

YCMD:sprzedajalkohol(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(IsAPrzestepca(playerid) || PlayerInfo[playerid][pAdmin] >= 1000 || CheckPlayerPerm(playerid, PERM_CLUB))
        {
			
     		new x_nr[16];
			new giveplayerid;
			if( sscanf(params, "s[16] u", x_nr, giveplayerid))
			{
				sendTipMessage(playerid, "UŻYJ: /sprzedaja [nazwa] [playerid]");
				sendTipMessage(playerid, "Dostępne nazwy: Piwo, Wino, Cygaro");
				return 1;
			}
			if(IsPlayerConnected(giveplayerid) || giveplayerid != INVALID_PLAYER_ID)
			{
				if(GetDistanceBetweenPlayers(playerid,giveplayerid) < 5 && Spectate[giveplayerid] == INVALID_PLAYER_ID)
				{
					if(Item_Count(giveplayerid)+5 >= GetPlayerItemLimit(giveplayerid))
						return sendErrorMessage(playerid, "Ten gracz ma za dużo przedmiotów!");
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					if(strcmp(x_nr,"piwo",true) == 0)
					{
						if(kaska[playerid] < PRICE_PIWO)
							return sendErrorMessage(playerid, "Nie stać Cię na to!");
						format(string, sizeof(string), "* Sprzedałeś Piwo graczowi: %s, koszt sprzedaży: "#PRICE_PIWO"$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzedał tobie Piwo 'Mroczny Gul'.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						Item_Add("Piwo Mroczny Gul", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[giveplayerid][pUID], ITEM_TYPE_ALCOHOL, 0, 0, true, giveplayerid, 1);
						ZabierzKaseDone(playerid, PRICE_PIWO);
						return 1;
					}
					else if(strcmp(x_nr,"wino",true) == 0)
					{
						if(kaska[playerid] < PRICE_WINO)
							return sendErrorMessage(playerid, "Nie stać Cię na to!");
						format(string, sizeof(string), "* Sprzedałeś Wino graczowi: %s, koszt sprzedaży: "#PRICE_WINO"$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzedał tobie Wino 'Komandos'.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						Item_Add("Wino Komandos", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[giveplayerid][pUID], ITEM_TYPE_ALCOHOL, 0, 0, true, giveplayerid, 1);
						ZabierzKaseDone(playerid, PRICE_WINO);
						return 1;
					}
					else if(strcmp(x_nr,"cygaro",true) == 0)
					{
						if(kaska[playerid] < PRICE_CYGARO)
							return sendErrorMessage(playerid, "Nie stać Cię na to!");
						format(string, sizeof(string), "* Sprzedałeś Paczkę Cygar graczowi: %s, koszt sprzedaży: "#PRICE_CYGARO"$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzedał tobie paczkę 5 cygar kolumbijskich.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						Item_Add("Cygaro", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[giveplayerid][pUID], ITEM_TYPE_CIGARETTE, 0, 0, true, giveplayerid, 5);
						ZabierzKaseDone(playerid, PRICE_CYGARO);
						return 1;
					}
				}
				else
				{
					format(string, sizeof(string), "Jesteś zbyt daleko od gracza %s.",giveplayer);
					sendErrorMessage(playerid, string);
				}
			}
			else
			{
				sendErrorMessage(playerid, "Gracz jest nieaktywny!");
				return 1;
			}
        }
        else
        {
            sendErrorMessage(playerid, "Nie masz czego sprzedać / nie jesteś z Mafii !");
            return 1;
        }
    }
    return 1;
}
