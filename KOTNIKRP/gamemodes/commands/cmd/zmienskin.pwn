//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zmienskin ]-----------------------------------------------//
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

YCMD:zmienskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if (IsAHA(playerid) || IsAPolicja(playerid) && (!IsPlayerInGroup(playerid, 3)))
        {
            if((GroupRank(playerid, FRAC_HA) >= 1 && IsAHA(playerid)) || (GroupPlayerDutyRank(playerid) >= 0 && GroupPlayerDutyPerm(playerid, PERM_POLICE)))
            {
                if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
                {
                    sendErrorMessage(playerid, "Jesteś podczas wsiadania - odczekaj chwile. Nie możesz znajdować się w pojeździe.");
                    return 1;
                }
                ShowPlayerDialogEx(playerid, DIALOG_HA_ZMIENSKIN(0), DIALOG_STYLE_LIST, "Zmiana ubrania", DialogListaFrakcji(), "Start", "Anuluj");
            } 
            else if(IsAHA(playerid))
            {
                sendTipMessage(playerid, "Dozwolone tylko dla rangi 1 lub większych");
            }
            else
            {
                sendTipMessage(playerid, "Dozwolone tylko dla rangi 2 lub większych");
            }
        } 
        else
        {
            sendTipMessage(playerid, "Tylko dla Hitman Agency i FBI/LSPD.");
        }
    }
    return 1;
}
