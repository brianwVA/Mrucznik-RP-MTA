//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ restart ]------------------------------------------------//
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

YCMD:restart(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		if (PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
		{
			new string[128];
			new playerNick[MAX_PLAYER_NAME + 1];
			GetPlayerName(playerid, playerNick, sizeof(playerNick));
			format(string, sizeof(string), "%s zarządził restart serwera! Trwa próba ponownego połączenia", playerNick);
			for(new j = 1; j!=MAX_COMBATLOGS; j++)
			{
				if(CombatLogs[j][CombatPUID] <= 0) continue;
				if(CombatLogs[j][CombatTimer] <= 0) continue;
				DestroyCombatData(j);
			}
			foreach(new i : Player)
			{
				TogglePlayerControllable(i, 0);
				MruMySQL_SaveAccount(i);
				sendErrorMessage(i, string);
			}
			SendRconCommand("gmx");
		}
		else
		{
			sendErrorMessage(playerid, "BRAK UPRAWNIEŃ!");
			return 1;
		}
	}
	return 1;
}
