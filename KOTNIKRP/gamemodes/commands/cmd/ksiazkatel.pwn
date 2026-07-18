//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ ksiazkatel ]----------------------------------------------//
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

YCMD:ksiazkatel(playerid, params[], help)
{
	new string[64];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		if (HasItemType(playerid, ITEM_TYPE_PHONEBOOK) != -1)
		{
			new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "Użyj /numer [playerid/CzęśćNicku]");
				return 1;
			}


			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					GetPlayerName(giveplayerid, sendername, sizeof(sendername));
					format(string, 64, "Nick: %s, Numer: %d",sendername,GetPhoneNumber(giveplayerid));
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie ma takiego gracza !");
			}
		}
		else
		{
			sendTipMessage(playerid, "Nie posiadasz Książki Telefonicznej !");
		}
	}
	return 1;
}
