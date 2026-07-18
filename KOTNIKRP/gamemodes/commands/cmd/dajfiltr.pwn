//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dajfiltr ]-----------------------------------------------//
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

YCMD:dajfiltr(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
	    if(IsPlayerAdmin(playerid))
		{
		    new ip[16];
			if( sscanf(params, "s[16]s[21]", ip, sendername))
			{
				sendTipMessage(playerid, "Użyj /dajfiltr [ip] [NICK_GRACZA]");
				return 1;
			}
			//gfpower
			new numer = dini_Int("Filtry.ini", "Liczba");
			format(string, sizeof(string), "IP_%d", numer+1);
			dini_Set("Filtry.ini", string, ip);
			format(string, sizeof(string), "Nick_%d", numer+1);
			dini_Set("Filtry.ini", string, sendername);
			dini_IntSet("Filtry.ini", "Liczba", numer+1);
			format(string, sizeof(string), "Filtr na IP %s dla konta %s został dodany pomyślnie", ip, sendername);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 1;
		}
	}
	return 1;
}
