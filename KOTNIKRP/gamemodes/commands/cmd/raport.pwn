//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ raport ]------------------------------------------------//
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

YCMD:raport(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 1)
        {
            if(GetPVarInt(playerid, "wyreportowany") > 1)
            {
                sendTipMessageFormat(playerid, "Odczekaj %d sekund", GetPVarInt(playerid, "wyreportowany"));
                return 1;
            }
	        GetPlayerName(playerid, sendername, sizeof(sendername));
			if(isnull(params))
			{
                SendClientMessage(playerid, 0x008000AA,"** Komenda {ADFF2F}/report{FFFFFF} służy tylko i wyłącznie do zgłaszania spraw dla Administracji... **");
                SendClientMessage(playerid, 0x008000AA,"** ...korzystamy z niego wtedy gdy dany gracz łamie regulamin serwera (LKiZ) **");
                SendClientMessage(playerid, 0x008000AA,"** Forma poprawnego zgłoszenia: {ADFF2F}/report 0 DM LUB /report 0 Cheater{FFFFFF} **");
				return 1;
			}
            SetPVarInt(playerid, "wyreportowany", 15);
            if(strfind(params, "@here", true) != -1 || strfind(params, "@everyone", true) != -1 || strfind(params, "<@", true) != -1) {
                SendClientMessage(playerid, COLOR_LIGHTRED, "Twój report nie został wysłany do administracji!");
                SendClientMessage(playerid, COLOR_GRAD2, "Zawiera on niedozwolone znaki z symbolem @");
                SendClientMessage(playerid, COLOR_GRAD2, "Popraw swój raport i napisz go ponownie za 15 sekund.");
                return 1;
            }
            SendClientMessage(playerid, 0x008000AA, "Twój report został wysłany do administracji, oczekuj na reakcję zanim napiszesz kolejny!");//By: Dawid
            SendClientMessage(playerid, COLOR_GRAD2, "Jeżeli Administracja nie reaguje na Twój report, oznacza to, że...");//By: Dawid
            SendClientMessage(playerid, COLOR_GRAD2, "...jest on źle sformułowany i Administracja nie rozpatrzy tego zgłoszenia.");//By: Dawid
			//AntySpam[playerid] = 1;
			//SetTimerEx("AntySpamTimer",15000,0,"d",playerid);
            format(string, sizeof(string), "» Report od %s [%d]: {FFFFFF}%s", sendername, playerid, params);
			SendMessageToAdminEx(string, COLOR_YELLOW, 1);
			format(string, sizeof(string), "? Report od %s [%d]: %s", sendername, playerid, params);
			SendDiscordMessage(DISCORD_REPORT, string);
            
		}
    }
    return 1;
}
