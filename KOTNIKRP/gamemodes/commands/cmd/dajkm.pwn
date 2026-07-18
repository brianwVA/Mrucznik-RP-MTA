//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dajkm ]-------------------------------------------------//
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

YCMD:dajkm(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
		new para1;
		if( sscanf(params, "k<fix>", para1))
		{
			sendTipMessage(playerid, "Użyj /dajkm [playerid/CzęśćNicku]");
			return 1;
		}

		GetPlayerName(playerid, sendername, sizeof(sendername));

		if (PlayerInfo[playerid][pAdmin] >= 5 || GroupPlayerDutyPerm(playerid, PERM_NEWS) && GroupPlayerDutyRank(playerid) >= 2 || strcmp(sendername,"Gonzalo_DiNorscio", false) == 0)
		{
		    if(IsPlayerConnected(para1))
		    {
		        if(para1 != INVALID_PLAYER_ID)
		        {
		            if(komentator[para1] != 1)
		            {
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						Log(adminLog, WARNING, "Admin %s dał %s komentatora żużlowego", GetPlayerLogName(playerid), GetPlayerLogName(para1));   
						SendClientMessage(para1, COLOR_LIGHTBLUE, "   Jesteś teraz komentatorem żużlowym, bierz mikrofon");
						format(string, sizeof(string), "   Gracz %s jest teraz komentator żużlowym.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						komentator[para1] = 1;
						format(string, sizeof(string), "Komentator: Witam! Tu %s ! Będę komentował ten wyścig.", giveplayer);
						ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
					}
					else
					{
					    GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						Log(adminLog, WARNING, "Admin %s zabrał %s komentatora żużlowego", GetPlayerLogName(playerid), GetPlayerLogName(para1));   
						SendClientMessage(para1, COLOR_LIGHTBLUE, "   Już nie jestes komentatorem żużlowym");
						format(string, sizeof(string), "   Zabrałeś graczowi %s komentatora żużlowego.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						komentator[para1] = 0;
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
