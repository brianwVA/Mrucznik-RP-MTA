//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ setname ]------------------------------------------------//
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

YCMD:setname(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];

	new newname[MAX_PLAYER_NAME + 1];
	if (PlayerInfo[playerid][pAdmin] >= 5000 || Uprawnienia(playerid, ACCESS_SETNAME) || IsAScripter(playerid))//(Uprawnienia(playerid, ACCESS_OWNER))
	{
		new giveplayerid;
		if( sscanf(params, "k<fix>s[25]", giveplayerid, newname))
		{
			sendTipMessage(playerid, "Użyj /setname [playerid] [nowynick]");
			return 1;
		}
		if(strlen(newname) >= MAX_PLAYER_NAME)
		{
			format(string, sizeof(string), "Nowy nick nie może być dłuższy jak %d znaków", MAX_PLAYER_NAME); 
			sendErrorMessage(playerid, string); 
			return 1;
		}
		new nick[24];
		if(GetPVarString(giveplayerid, "maska_nick", nick, 24))
		{
			SendClientMessage(playerid, COLOR_GREY, " Gracz musi ściągnąć maskę z twarzy! (/maska).");
			return 1;
		}

		if(giveplayerid != INVALID_PLAYER_ID)
		{
		    if(PlayerInfo[giveplayerid][pDom] == 0)
		    {
		        if(PlayerInfo[giveplayerid][pBusinessOwner] == INVALID_BIZ_ID)
		        {
                    GetPlayerName(giveplayerid, giveplayer, MAX_PLAYER_NAME);
					new sender_log_name[50];
					new giveplayer_log_name[50];
					format(sender_log_name, sizeof(sender_log_name), "%s", GetPlayerLogName(playerid));
					format(giveplayer_log_name, sizeof(giveplayer_log_name), "%s", GetPlayerLogName(giveplayerid));
                    if(ChangePlayerName(giveplayerid, newname))
                    {
    					format(string, sizeof(string), "Administrator %s zmienił nick %s[%d] - Nowy nick: %s", GetNickEx(playerid),giveplayer,PlayerInfo[giveplayerid][pUID],newname);
    					SendClientMessageToAll(COLOR_LIGHTRED, string);
						Log(adminLog, WARNING, "Admin %s zmienił %s nick na %s", sender_log_name, giveplayer_log_name, newname);
						Log(nickLog, WARNING, "Admin %s zmienił %s nick na %s", sender_log_name, giveplayer_log_name, newname);

                        ShowPlayerDialogEx(giveplayerid, 70, DIALOG_STYLE_MSGBOX, "Zmiana nicku", "Właśnie zmieniłeś nick. Następujące elementy zostały wyzerowane:\n\nPraca\nWanted Level\nSkin\nZaufany Gracz\n\n\nPamiętaj, że każda zmiana nicku jest na wagę złota więc nie trwoń ich pochopnie!\nJeżeli doszło do błędnej zmiany zgłoś ten fakt prędko na forum w panelu strat!\nPamiętaj: nowa postać = nowe życie.", "Dalej", "");

    					SetPlayerName(giveplayerid, newname);
                    }
				}
				else
				{
				    sendErrorMessage(playerid, "Ten gracz ma biznes, nie możesz zmienić mu nicku");
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Ten gracz ma dom, nie możesz zmienić mu nicku");
			}
		}
		else if(giveplayerid == INVALID_PLAYER_ID)
		{
			format(string, sizeof(string), "%d nie jest aktywnym graczem.", giveplayerid);
			sendErrorMessage(playerid, string);
		}
	}
	return 1;
}
