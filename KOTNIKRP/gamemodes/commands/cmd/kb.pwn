//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ kb ]--------------------------------------------------//
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

YCMD:kb(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 1)
        {
			new giveplayer[MAX_PLAYER_NAME + 1];
			new string[128];
			if(PlayerInfo[playerid][pLevel] >= 1)
			{
				if(PlayerInfo[playerid][pLocal] == 103)
				{
					GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "Konto Bankowe >> %s", giveplayer);
					ShowPlayerDialogEx(playerid, 1067, DIALOG_STYLE_LIST, string, "Stan konta\n\nWpłać\nWypłać\nPrzelew\n>> Grupa", "Wybierz", "Wyjdź");
				}
				else
				{
					sendErrorMessage(playerid, "Nie jesteś w banku!");
				}
			}
			else
			{
				sendErrorMessage(playerid, "Aby móc zarządzać swoim kontem bankowym i dokonywać przelewów musisz osiągnąć 1 lvl");
			}
		}
	}
	return 1;
}
