//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kajdanki ]-----------------------------------------------//
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

YCMD:kajdanki(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(GroupPlayerDutyPerm(playerid, PERM_POLICE) || GroupPlayerDutyPerm(playerid, PERM_BOR))
        {
            new giveplayerid;
            if(sscanf(params, "k<fix>", giveplayerid))
            {
                sendTipMessage(playerid, "Użyj /kajdanki [ID_GRACZA]");
                return 1;
            }

            if(!IsPlayerConnected(giveplayerid))
            {
                sendTipMessage(playerid, "Nie ma takiego gracza");
                return 1;
            }

            if(Kajdanki_Uzyte[playerid] != 1)
            {
                if(IsAPolicja(playerid))
                {
                    if(OnDuty[playerid] == 0)
                    {
                        sendErrorMessage(playerid, "Nie jesteś na służbie!");
                        return 1;
                    }
                }

                if(Spectate[giveplayerid] != INVALID_PLAYER_ID)
                {
                    sendTipMessage(playerid, "Jesteś zbyt daleko od gracza");
                    return 1;
                }
                if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
                {
                    sendTipMessage(playerid, "Nie możesz skuć administratora!");
                    return 1;
                }
                if(GetDistanceBetweenPlayers(playerid,giveplayerid) < 5)
                {
                    if(GetPlayerState(playerid) == 1 && (GetPlayerState(giveplayerid) == 1 || (PlayerInfo[giveplayerid][pInjury] > 0 || PlayerInfo[giveplayerid][pBW] > 0)))
                    {
                        if(Kajdanki_JestemSkuty[giveplayerid] == 0)
                        {
                            if(AntySpam[playerid] == 1)
                            {
                                sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 10 sekund");
                                return 1;
                            }
                            if(IsAPolicja(giveplayerid))
                            {
                                return 1;
                            }
                            CreateNewCombatLog(playerid);
                            new string[128];
                            if(PlayerInfo[giveplayerid][pBW] >= 1 || PlayerInfo[giveplayerid][pInjury] >= 1)
                            {
                                //Wiadomości
                                format(string, sizeof(string), "* %s docisnął do ziemi nieprzytomnego %s i skuł go.", GetNick(playerid), GetNick(giveplayerid));
                                ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                format(string, sizeof(string), "Dzięki szybkiej interwencji udało Ci się skuć %s.", GetNick(giveplayerid));
                                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                sendTipMessageEx(giveplayerid, COLOR_BLUE, "Jesteś nieprzytomny - policjant skuł cię bez większego wysiłku.");
                                SetPVarInt(giveplayerid, "bw-veh", 0);
                                format(PlayerInfo[giveplayerid][pDeathAnimLib], 32, "%s", "SWEET");
	                            format(PlayerInfo[giveplayerid][pDeathAnimName], 32, "%s", "Sweet_injuredloop");
                                //czynności
                                CuffedAction(playerid, giveplayerid);
                                //ZdejmijBW(giveplayerid, 2000);
                                TogglePlayerControllable(giveplayerid, 1);
                            }
                            else if(GetPlayerSpecialAction(giveplayerid) == SPECIAL_ACTION_DUCK || TazerAktywny[giveplayerid] == 1)
                            {
                                //Wiadomości
                                format(string, sizeof(string), "* %s dociska do ziemi %s, a następnie zakuwa go w kajdanki.", GetNick(playerid), GetNick(giveplayerid));
                                ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                format(string, sizeof(string), "Skułeś %s.", GetNick(giveplayerid));
                                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                sendTipMessageEx(giveplayerid, COLOR_BLUE, "Leżałeś na ziemi - policjant skuł cię bez większego wysiłku.");

                                //czynności
                                CuffedAction(playerid, giveplayerid);
                                TogglePlayerControllable(giveplayerid, 1);
                            }
                            else
                            {
                                format(string, sizeof(string), "* %s wyciąga kajdanki i próbuje je założyć %s.", GetNick(playerid),GetNick(giveplayerid));
                                ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                ShowPlayerDialogEx(giveplayerid, 98, DIALOG_STYLE_MSGBOX, "Aresztowanie", "Policjant chce założyć ci kajdanki, jeśli osacza cię nieduża liczba policjantów możesz spróbować się wyrwać\nJednak pamiętaj jeśli się wyrwiesz i jesteś uzbrojony policjant ma prawo cię zabić. \nMożesz także dobrowolnie poddać się policjantom.", "Poddaj się", "Wyrwij się");
                                Kajdanki_PDkuje[giveplayerid] = playerid;
                                //Kajdanki_Uzyte[giveplayerid] = 1;
                                SetTimerEx("UzyteKajdany",30000,0,"d",giveplayerid);
                            }
                            SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
					        AntySpam[playerid] = 1;
                        }
                        else
                        {
                            //new str[32];
                            //valstr(str, giveplayerid);
                            //RunCommand(playerid, "/rozkuj",  str);
                            sendTipMessage(playerid, "Ten gracz jest już skuty. Użyj /rozkuj");
                        }
                    } else
                    {
                        sendErrorMessage(playerid, "Żaden z was nie może być w wozie!");
                    }
                } else
                {
                    sendTipMessage(playerid, "Jesteś zbyt daleko od gracza");
                }
            } 
            else
            {
                new str[32];
                valstr(str, giveplayerid);
                RunCommand(playerid, "/rozkuj",  str);
            }
        } else
        {
            sendTipMessage(playerid, "Nie jesteś na duty grupy z takimi uprawnieniami!");
        }
    }
    return 1;
}
