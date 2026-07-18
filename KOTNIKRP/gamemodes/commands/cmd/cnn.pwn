//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ cnn ]--------------------------------------------------//
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

YCMD:cnn(playerid, params[], help)
{
	if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
	{
		if(isnull(params))
		{
			sendTipMessage(playerid, "Użyj /cnn [cnn formattextu ~n~=Nowalinia ~r~=Czerwony ~g~=Zielony ~b~=Niebieski ~w~=Biały ~y~=Żółty]");
			return 1;
		}
		new string[128];
		//
		format(string, sizeof(string), "~b~%s: ~w~%s",GetNickEx(playerid),params);
        if(!issafefortextdraw(string)) return sendErrorMessage(playerid, "Niekompletny tekst (tyldy etc)");
		foreach(new i : Player)
		{
			if(IsPlayerConnected(i))
			{
				GameTextForPlayer(i, string, 5000, 6);
			}
		}
        Log(adminLog, WARNING, "Admin %s użył /cnn o treści: %s", GetPlayerLogName(playerid), params);
		return 1;
	}
	else
	{
		noAccessMessage(playerid);
		return 1;
	}
}
