//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ i ]---------------------------------------------------//
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

YCMD:i(playerid, params[], help)
{
    new string[128];
    new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(PlayersChannel[playerid] == 999)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś na kanale IRC !");
            return 1;
        }
        if(PlayerInfo[playerid][pMuted] == 1)
        {
            sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie możesz mówić, jesteś uciszony");
            return 1;
        }
        GetPlayerName(playerid, sendername, sizeof(sendername));
        if(isnull(params))
        {
            sendTipMessage(playerid, "Użyj /i [irc chat]");
            return 1;
        }
        format(string, sizeof(string), "** IRC %s: %s. **", sendername, params);
        SendIRCMessage(PlayersChannel[playerid], COLOR_YELLOW2, string);
        if(PlayerInfo[playerid][pPodPW] == 1)
        {
            format(string, sizeof(string), "AdmCmd -> %s(%d) /irc(#%d) -> %s", sendername, playerid, PlayersChannel[playerid]+1, string);
            ABroadCast(KOLOR_ROZOWY,string,1,1);
         }
		Log(chatLog, WARNING, "%s irc %d: %s", GetPlayerLogName(playerid), PlayersChannel[playerid], params);
    }
    return 1;
}
