//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 agraffiti                                                 //
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
// Autor: Sandał
// Data utworzenia: 13.02.2020


//

//------------------<[ Implementacja: ]>-------------------
command_agraffiti_Impl(playerid, opcja[36], id)
{
    if(strcmp(opcja,"sprawdz",true) == 0)
    {
        new string[128];
        if(PlayerInfo[playerid][pAdmin] < 1 && !IsAScripter(playerid))
        {
            sendTipMessage(playerid, "Komenda dostępna dla administracji.");
            return 1;
        }
        if(id == -1)
        {
            new i = graffiti_FindNearest(playerid);
            if(i!=INVALID_GRAFID)
            {

                format(string, sizeof(string), "[ID graffiti]:{FF0000}%d", i); 
                SendClientMessage(playerid, COLOR_WHITE, string);
                format(string, sizeof(string), "[Nazwa właściciela]:{FF0000}%s", GraffitiInfo[i][pOwner]);
                SendClientMessage(playerid, COLOR_WHITE, string);
            }
            else
            {
                sendTipMessage(playerid, "Nie znaleziono graffiti w pobliżu.");
            }
        }
        else
        {
            if(id < 0 || id > GRAFFITI_MAX)
            {
                sendTipMessage(playerid, "Niepoprawne ID. (0-%d)", GRAFFITI_MAX);
            }
            else
            {
                if(GraffitiInfo[id][grafXpos] == 0)
                {
                    sendTipMessage(playerid, "Graffiti nie jest stworzone.");
                }
                else
                {
                    strdel(GraffitiInfo[id][grafText], 70, 128);
			        strreplace(GraffitiInfo[id][grafText], "\n", "~n~", .ignorecase = true);
                    format(string, sizeof(string), "[Nazwa właściciela]:{FF0000}%s", GraffitiInfo[id][pOwner]);
                    SendClientMessage(playerid, COLOR_WHITE, string);
                    format(string, sizeof(string), "[Tekst]:{FF0000}%s[..]", GraffitiInfo[id][grafText]);
                    SendClientMessage(playerid, COLOR_WHITE, string);
                }
            }
        }
    }
    else if(strcmp(opcja,"reload", true) == 0)
    {
        if(IsAHeadAdmin(playerid) || IsAScripter(playerid))
        {
            for(new i; i < GRAFFITI_MAX; i++)
            {
                graffiti_ReloadForPlayers(i);
            }
            sendTipMessage(playerid, "DONE.");
            Log(adminLog, WARNING, "%s przeładował wszystkie Graffiti na serwerze.", GetPlayerLogName(playerid));
        }
        else
        {
            sendTipMessage(playerid, "Brak dostępu do komendy.");
        }
    }
    else if(strcmp(opcja, "goto", true) == 0)
    {
        if(PlayerInfo[playerid][pAdmin] >= GRAFFITI_ADMIN)
        {
            if(id == -1)
            {
                sendTipMessage(playerid, "Nie podałeś ID graffiti.");
            }
            else
            {
                if(id < 0 || id > GRAFFITI_MAX)
                {
                    sendTipMessage(playerid, "Niepoprawne ID. (0-%d)", GRAFFITI_MAX);
                }
                else
                {
                    if(GraffitiInfo[id][grafXpos] == 0)
                    {
                        sendTipMessage(playerid, "Graffiti nie jest stworzone.");
                    }
                    else
                    {
                        SetPlayerPos(playerid, GraffitiInfo[id][grafXpos], GraffitiInfo[id][grafYpos], GraffitiInfo[id][grafZpos]);
                        sendTipMessage(playerid, "Teleportowano!");
                    }
                }
            }
        }
    }
    else if(strcmp(opcja, "lista", true) == 0)
    {
        if(PlayerInfo[playerid][pAdmin] >= GRAFFITI_ADMIN)
        {
            if(IsPlayerConnected(id) && id != -1)
            {
                new string[128];
                new f;
                graffiti_CountGraffs(id);
                graffiti_GetGraffitiIDs(id);
                format(string, sizeof(string), "Graffiti gracza %s", GetNick(id));
                SendClientMessage(playerid, COLOR_P@, string);
                if(Graffiti_Amount[id] >= 1)
                {
                    for(new i; i < Graffiti_Amount[id]; i++)
                    {
                        f = Graffiti_PlayerList[id][i];
                        strdel(GraffitiInfo[f][grafText], 60, 128);
                        strreplace(GraffitiInfo[f][grafText], "\n", "~n~", .ignorecase = true);
                        format(string, sizeof(string), "[%d]:%s", f, GraffitiInfo[f][grafText]);
                        SendClientMessage(playerid, COLOR_WHITE, string);
                    }
                }
                else
                {
                    sendTipMessage(playerid, "Brak!");
                }
            }
            else if(id == -1)
            {
                sendTipMessage(playerid, "Nie podano ID gracza.");
            }
            else
            {
                sendTipMessage(playerid, "Gracz jest nieaktywny.");
            }
        }
    }
    return 1;
}

//end