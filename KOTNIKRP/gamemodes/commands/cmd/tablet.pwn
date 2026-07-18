//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ tablet ]------------------------------------------------//
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

YCMD:tablet(playerid, params[], help)
{
	new string[512];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(!IsAPolicja(playerid))
        {
            sendErrorMessage(playerid, "Nie jesteś policjantem!");
            return 1;
        }
		new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "Użyj /tablet [id gracza/część nicku]");
			return 1;
		}
		if(GroupPlayerDutyPerm(playerid, PERM_POLICE))
		{
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
			        format(string, sizeof(string), "Imię i nazwisko:\t%s\nWiek:\t%d\n{00ABFF}Przestępstwo:\t{FF0000}%s\n{00ABFF}Zgłoszone przez:\t{FF0000}%s\n{FF3535}Poziom poszukiwania:\t{FF3535}%d", giveplayer, PlayerInfo[giveplayerid][pAge], PlayerCrime[giveplayerid][pAccusedof], PlayerCrime[giveplayerid][pVictim], PoziomPoszukiwania[giveplayerid]);
	                ShowPlayerDialogEx(playerid, 9111, DIALOG_STYLE_TABLIST, "TABLET POLICYJNY", string, "Zamknij", "");
	                format(string, sizeof(string), "* %s wyciąga z kieszeni tablet, po czym wpisuje dane.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza !");
			    return 1;
			}
		}
		else
		{
		    sendTipMessage(playerid, "Nie jesteś na służbie.");
			return 1;
		}
	}
	return 1;
}
