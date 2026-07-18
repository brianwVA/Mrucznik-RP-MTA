//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ wiadomosc ]-----------------------------------------------//
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
new TokenID[MAX_PLAYERS],Token[MAX_PLAYERS],WiadomoscToken[MAX_PLAYERS][128];

YCMD:wiadomosc(playerid, params[], help)
{
    if(gPlayerLogged[playerid] == 0)//Sprawdza czy gracz jest połączony 
    {
        return 1;
    }
    new giveplayerid, text[128]; 
    if(sscanf(params, "k<fix>s[128]", giveplayerid, text))
    {
        sendTipMessage(playerid, "Użyj /(w)iadomosc [playerid/CzęścNicku] [tekst]"); 
        return 1;
    }
    if(IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
    {
        if(TutTime[playerid] > 0 && TutTime[playerid] <= 125)
        {
            sendErrorMessage(playerid, "Nie możesz wysyłać wiadomości podczas TUT!"); 
            return 1;
        }
        if(gPlayerLogged[giveplayerid] == 0)
        {
            sendErrorMessage(playerid, "Gracz aktualnie loguje się do gry! Odczekaj chwilę"); 
            return 1;
        }
        if(gPlayerLogged[playerid] == 0)
        {
            sendErrorMessage(playerid, "Jesteś w trakcie logowania!");
            return 1;
        }
        if(HidePM[giveplayerid] > 0 || HidePM[playerid] > 0)
        {
            sendTipMessage(playerid, "Ktoś z was ma zablokowane wiadomości!"); 
            return 1;
        }
        if(AntySpam[playerid] == 1 && PlayerInfo[playerid][pConnectTime] <= 3)
        {
            sendErrorMessage(playerid, "Odczekaj 3 sekundy zanim wyślesz kolejną wiadomość!"); 
            return 1;
        }
        if(PlayerInfo[playerid][pInjury] > 0 && !PlayerInfo[playerid][pAdmin] && !PlayerInfo[playerid][pNewAP] && !PlayerInfo[playerid][pZG] && !IsAScripter(playerid))
        {
            if(GetDistanceBetweenPlayers(playerid, giveplayerid) > 50.0)
            {
                if(!PlayerInfo[giveplayerid][pAdmin] && !PlayerInfo[giveplayerid][pNewAP] && !PlayerInfo[giveplayerid][pZG] && !IsAScripter(giveplayerid)) 
                {
                    return sendErrorMessage(playerid, "Gdy jesteś ranny możesz wysyłać wiadomości jedynie na małą odległość.");
                }
            }
        }
        if(Kajdanki_JestemSkuty[playerid] == 1  && !PlayerInfo[playerid][pAdmin] && !PlayerInfo[playerid][pNewAP] && !PlayerInfo[playerid][pZG] && !IsAScripter(playerid))
        {
            if(GetDistanceBetweenPlayers(playerid, giveplayerid) > 50.0)
            {
                if(!PlayerInfo[giveplayerid][pAdmin] && !PlayerInfo[giveplayerid][pNewAP] && !PlayerInfo[giveplayerid][pZG] && !IsAScripter(giveplayerid)) 
                {
                    return sendErrorMessage(playerid, "Gdy jesteś skuty możesz wysyłać wiadomości jedynie na małą odległość.");
                }
            }
        }
        
        //Dodatkowe zabezpieczenia
        new string[256]; 
        if(giveplayerid == playerid)//Jeszcze easter egg na poczatek
        {
            format(string, sizeof(string), "* %s mruczy (jak Mrucznik) coś pod nosem.", GetNick(playerid));
            ProxDetector(5.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE); 
            return 1;
        }
        if (AntyReklama(text) != 0)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "NIE CHCEMY REKLAM!");
            if(strlen(params) < 78)
            {   
                format(string, sizeof(string), "AdmWarning: [%d] %s REKLAMA: %s.", playerid, GetNick(playerid), text);
                SendMessageToAdmin(string, COLOR_LIGHTRED);
            }
            else
            {
                new pos = strfind(params, " ", true, strlen(params) / 2);
                if(pos != -1)
                {
                    new text2[64];
                    strmid(text2, text, pos, strlen(text));
                    strdel(text, pos, strlen(text));
                    format(string, sizeof(string), "AdmWarning: [%d] %s REKLAMA: %s [.]", playerid, GetNick(playerid), text);
                    SendMessageToAdmin(string, COLOR_LIGHTRED);
                    format(string, sizeof(string), "[.] %s", text2);
                    SendMessageToAdmin(string, COLOR_LIGHTRED); 
                }
            }
			Log(warningLog, WARNING, "%s reklamuje na PW do %s: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), text);
            return 1;
        }
        if (AntyCzitText(text))
        {
            if(strlen(params) < 90)
            {   
                format(string, sizeof(string), "AdmWarning: [%d] %s mówi coś o cheat'ach do [%s]: %s", playerid, GetNick(playerid), GetNick(giveplayerid), text);
                SendMessageToAdmin(string, COLOR_LIGHTRED); 
            }
            else
            {
                new pos = strfind(params, " ", true, strlen(params) / 2);
                if(pos != -1)
                {
                    new text2[80];
                    strmid(text2, text, pos, strlen(text));
                    strdel(text, pos, strlen(text));
                    format(string, sizeof(string), "AdmWarning: [%d] %s mówi coś o cheat'ach do [%s]: %s [.]", playerid, GetNick(playerid), GetNick(giveplayerid), text);
                    SendMessageToAdmin(string, COLOR_LIGHTRED); 
                    format(string, sizeof(string), "[.] %s", text2);
                    SendMessageToAdmin(string, COLOR_LIGHTRED); 
                }
            }
            Log(warningLog, WARNING, "%s mówi coś o czitach na PW do %s: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), text);
        }
        //======================================[WYKONANIE - WYSŁANIE WIADOMOŚCI]==================
        if(GetPlayerAdminDutyStatus(giveplayerid) == 1 && PlayerInfo[playerid][pAdmin] == 0)
		{
			strmid(WiadomoscToken[playerid],text, 0, 128, 128);
			Token[playerid]=random(99999999);
			TokenID[playerid]=giveplayerid;
			format(string, sizeof(string), "Pisząc wiadomość do Administracji bądź GameMastera masz obowiązek przepisania Tokena.\nTwój token to: %d",Token[playerid]);
			ShowPlayerDialogEx(playerid,7981,DIALOG_STYLE_INPUT,"Wiadomość do administracji - token",string,"Wybierz","Anuluj");
			return 1;
		}
        if(strlen(params) < 78)
        {
            format(string, sizeof(string), "«« %s (%d%s): %s", GetNick(giveplayerid), giveplayerid, (!IsPlayerPaused(giveplayerid)) ? (""): (", AFK"), text);
            SendClientMessage(playerid, COLOR_YELLOW, string);
            
            format(string, sizeof(string), "»» %s (%d): %s", GetNick(playerid), playerid, text);
            SendClientMessage(giveplayerid, COLOR_NEWS, string);
            if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
            {
                iloscInWiadomosci[giveplayerid] = iloscInWiadomosci[giveplayerid]+1;
            }
            if(GetPlayerAdminDutyStatus(playerid) == 1)
            {
                iloscOutWiadomosci[playerid] = iloscOutWiadomosci[playerid]+1;
            }
            if(PlayerInfo[playerid][pPodPW] == 1 || PlayerInfo[giveplayerid][pPodPW] == 1)
            {
                format(string, sizeof(string), "%s(%d) /w -> %s(%d): %s", GetNick(playerid), playerid, GetNick(giveplayerid), giveplayerid, text);
                ABroadCast(COLOR_LIGHTGREEN,string,1,1);
            }
        }
        else 
        {
            new pos = strfind(params, " ", true, strlen(params) / 2);
            if(pos != -1)
            {
                new text2[64];
                strmid(text2, text, pos, strlen(text));
                strdel(text, pos, strlen(text));

                format(string, sizeof(string), "«« %s (%d%s): %s [.]", GetNick(giveplayerid), giveplayerid, (!IsPlayerPaused(giveplayerid)) ? (""): (", AFK"), text);
                SendClientMessage(playerid, COLOR_YELLOW, string);
            
                format(string, sizeof(string), "[.] %s", text2);
                SendClientMessage(playerid, COLOR_YELLOW, string);

                if(PlayerInfo[playerid][pPodPW] == 1 || PlayerInfo[giveplayerid][pPodPW] == 1)
                {
                    format(string, sizeof(string), "%s(%d) /w -> %s(%d): %s [.]", GetNick(playerid), playerid, GetNick(giveplayerid), giveplayerid, text);
                    ABroadCast(COLOR_LIGHTGREEN,string,1,1);
                    format(string, sizeof(string), "[.] %s", text2);
                    ABroadCast(COLOR_LIGHTGREEN,string,1,1);
                }      
                
                format(string, sizeof(string), "«« %s (%d): %s [.]", GetNick(playerid), playerid, text);
                SendClientMessage(giveplayerid, COLOR_NEWS, string);
                
                format(string, sizeof(string), "[.] %s", text2);
                SendClientMessage(giveplayerid, COLOR_NEWS, string);
                if(GetPlayerAdminDutyStatus(playerid) == 1)
                {
                    iloscOutWiadomosci[playerid] = iloscOutWiadomosci[playerid]+1;
                }
                if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
                {
                    iloscInWiadomosci[giveplayerid] = iloscInWiadomosci[giveplayerid]+1;
                }
            }
        }
	    Log(chatLog, WARNING, "%s PW do %s: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), text);
        SavePlayerSentMessage(playerid, sprintf("%s wysłał wiadomość do %s: %s", GetNick(playerid), GetNick(giveplayerid), text), FROMME);
        SavePlayerSentMessage(giveplayerid, sprintf("%s otrzymał wiadomość od %s: %s", GetNick(giveplayerid), GetNick(playerid), text), TOME);
        //dźwięki
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        PlayerPlaySound(giveplayerid, 1057, 0.0, 0.0, 0.0);
        //zapisywanie do /re
        if(giveplayerid != playerid) lastMsg[giveplayerid] = playerid;
        //AntySPAM!!!!!
        SetTimerEx("AntySpamTimer",3000,0,"d",playerid);
		AntySpam[playerid] = 1;
    }
    else 
    {
        sendTipMessage(playerid, "Nie ma takiego gracza na serwerze!"); 
    }
    return 1;
}