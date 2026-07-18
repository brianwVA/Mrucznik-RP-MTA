//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ losowypozar ]----------------------------------------------//
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

YCMD:losowypozar(playerid, params[], help)
{
	if (PlayerInfo[playerid][pAdmin] >= 15 || PlayerInfo[playerid][pAdmin] == 7 || IsAScripter(playerid) || GroupIsVLeader(playerid, FRAC_ERS))
	{
		if(PozarCooldown > gettime() && !PlayerInfo[playerid][pAdmin])
			return va_SendClientMessage(playerid, COLOR_GRAD4, "Odczekaj %d minut.", floatround( (PozarCooldown-gettime()) / 60 % 60));
	    DeleteAllFire();
	    AktywujPozar();
	    sendTipMessage(playerid, "Aktywowałeś losowy pożar dla LSRC!");
	    if(PlayerInfo[playerid][pAdmin] >= 15 || PlayerInfo[playerid][pAdmin] == 7 || IsAScripter(playerid))
			sendTipMessage(playerid, "Aby usunąć pożar wpisz /usunpozar !");
		if(IsAMedyk(playerid, 0))
			PozarCooldown = gettime()+1800;
	    
	    new string[128];
        format(string, 128, "CMD_Info: /losowypozar użyte przez %s [%d]", GetNick(playerid), playerid);
        SendCommandLogMessage(string);
		Log(adminLog, WARNING, "Gracz %s użył /losowypozar", GetPlayerLogName(playerid));
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
