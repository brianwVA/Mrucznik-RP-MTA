//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zawodnik ]-----------------------------------------------//
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

YCMD:zawodnik(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		new para1;
		if( sscanf(params, "k<fix>", para1))
		{
			sendTipMessage(playerid, "Użyj /zawodnik [playerid/CzęśćNicku]");
			return 1;
		}

		GetPlayerName(playerid, sendername, sizeof(sendername));

		if (PlayerInfo[playerid][pAdmin] >= 5 || CheckPlayerPerm(playerid, PERM_TAXI) && GroupPlayerDutyRank(playerid) >= 2)
		{
		    if(IsPlayerConnected(para1))
		    {
		        if(para1 != INVALID_PLAYER_ID)
		        {
		            if(zawodnik[para1] != 1)
		            {
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						Log(adminLog, WARNING, "Admin %s dał %s zawodnika żużlowego", GetPlayerLogName(playerid), GetPlayerLogName(para1));
						SendClientMessage(para1, COLOR_LIGHTBLUE, "   Jesteś teraz zawodnikiem żużlowym, bierz swój motor");
						format(string, sizeof(string), "   Gracz %s jest teraz zawodnikiem żużlowym.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						zawodnik[para1] = 1;
						format(string, sizeof(string), "Mamy nowego zawodnika żużlowego - %s !!.", giveplayer);
						ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
					}
					else
					{
					    GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						Log(adminLog, WARNING, "Admin %s zabrał %s zawodnika żużlowego", GetPlayerLogName(playerid), GetPlayerLogName(para1));
						SendClientMessage(para1, COLOR_LIGHTBLUE, "   Już nie jestes zawodnikiem żużlowym, idź na trybuny");
						format(string, sizeof(string), "   Zabrałeś graczowi %s zawodnika żużlowego.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						zawodnik[para1] = 0;
						format(string, sizeof(string), "Zawodnik żużlowy %s odpadł podczas wyścigu.", giveplayer);
						ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
					}
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
