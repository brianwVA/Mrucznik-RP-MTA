//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ dajstartowypojazd ]---------------------------------------------//
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

YCMD:dajstartowypojazd(playerid, params[], help)
{
    if(PlayerInfo[playerid][pAdmin] < 3000)
        return noAccessMessage(playerid);
    if(isnull(params))
        return sendTipMessage(playerid, "Użyj: /dajstartowypojazd [ID gracza]");
    new targetid = strval(params);
    if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
        return sendErrorMessage(playerid, "Gracz o podanym ID nie istnieje.");
    if(!BeginnerCarDialog(targetid))
        return sendErrorMessage(playerid, "Ten gracz nie może otrzymać startowego pojazdu.");
    va_SendClientMessage(playerid, COLOR_LIGHTGREEN, "Dałeś %s dialog startowego pojazdu", GetNick(targetid));
    va_SendClientMessage(targetid, COLOR_LIGHTGREEN, "%s dał Ci możliwość wyboru startowego pojazdu", GetNick(playerid));
    return 1;
}