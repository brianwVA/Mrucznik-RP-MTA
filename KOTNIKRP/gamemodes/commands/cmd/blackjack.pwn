//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ blackjack ]-----------------------------------------------//
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

YCMD:blackjack(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, 1032.69775391,-1092.17980957,-67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1032.90014648,-1088.91455078,-67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1023.03601074,-1092.15148926,-67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1022.98620605,-1088.74023438,-67.58734131))
        {
            new oczko = true_random(13)+2;
            GetPlayerName(playerid, sendername, sizeof(sendername));
            if(oczko >= 2 && oczko <= 10)
            {
			    Log(payLog, WARNING, "%s wyciągnął kartę: %d", GetPlayerLogName(playerid), oczko);
                format(string, sizeof(string), "* %s wyciąga kartę i jest to: %d", sendername, oczko);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 11)
            {
			    Log(payLog, WARNING, "%s wyciągnął kartę: J", GetPlayerLogName(playerid));
                format(string, sizeof(string), "* %s wyciąga kartę i jest to: J (walet)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 12)
            {
			    Log(payLog, WARNING, "%s wyciągnął kartę: Q", GetPlayerLogName(playerid));
                format(string, sizeof(string), "* %s wyciąga kartę i jest to: Q (dama)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 13)
            {
			    Log(payLog, WARNING, "%s wyciągnął kartę: K", GetPlayerLogName(playerid));
                format(string, sizeof(string), "* %s wyciąga kartę i jest to: K (król)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 14 || oczko == 15)
            {
			    Log(payLog, WARNING, "%s wyciągnął kartę: A", GetPlayerLogName(playerid));
                format(string, sizeof(string), "* %s wyciąga kartę i jest to: A (as)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            ZabierzKaseDone(playerid, PRICE_KASYNO_KARTY);
			sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera opłatę za użycie talii kart ("#PRICE_KASYNO_KARTY"$)");
        }
        else
        {
            sendErrorMessage(playerid, "Nie jesteś przy stole do black jacka!");
        }
    }
	return 1;
}
