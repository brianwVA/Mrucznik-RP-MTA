//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ sprawdzkase ]----------------------------------------------//
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

YCMD:sprawdzkase(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		if (IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805,-1090.59741211,-67.52223969))
		{
			new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "Użyj /sprawdzkase[playerid/CzęśćNicku]");
				return 1;
			}


			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(IsPlayerInRangeOfPoint(giveplayerid, 50.0, 1038.22924805,-1090.59741211,-67.52223969))
			        {
      					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						format(string, sizeof(string),"|__________________Wnętrze portfela %s:__________________|",giveplayer);
						SendClientMessage(playerid, COLOR_GREEN, string);
						format(string, sizeof(string), "Dolary amerykańskie:[$%d]", kaska[giveplayerid]);
						SendClientMessage(playerid, COLOR_GREY, string);
						SendClientMessage(playerid, COLOR_GREEN,  "|________Nie graj o więcej niż gracz ma w porfelu!________|");
					}
					else
					{
					    sendErrorMessage(playerid, "Ten gracz nie jest w kasynie");
					}
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie ma takiego gracza");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jesteś w kasynie !");
		}
	}
	return 1;
}
