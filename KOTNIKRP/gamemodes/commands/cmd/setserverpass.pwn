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

YCMD:setservpass(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		if (PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
		{
			new string[128], passServ[64]; 
			if( sscanf(params, "s[64]", passServ))
			{
				sendTipMessage(playerid, "Użyj /ssp [nowe haslo]");
				return 1;
			}
			if(strlen(passServ) < 4)
			{
				sendErrorMessage(playerid, "Zbyt krótkie hasło"); 
				return 1;
			}
			format(string, sizeof(string), "%s zarządził zamknięcie serwera! Hasło zostało włączone", GetNickEx(playerid));
			foreach(new i : Player)
			{
				sendErrorMessage(i, string);
				sendErrorMessage(i, "Wracamy za krótką chwilę!"); 
				if(!IsAScripter(i) && PlayerInfo[i][pAdmin] == 0)
				{
					Kick(i); 
				}
			}
			format(string, sizeof(string), "password %s", passServ);
			SendRconCommand(string);
		}
		else
		{
			sendErrorMessage(playerid, "BRAK UPRAWNIEŃ!");
			return 1;
		}
	}
	return 1;
}
