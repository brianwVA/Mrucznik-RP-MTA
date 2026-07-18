//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ sprobuj ]------------------------------------------------//
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

YCMD:sprobuj(playerid, params[], help)
{
	if(isnull(params)) return sendTipMessage(playerid, "Użyj /sprobuj [Akcja] np. trafić do kosza");
	if(GetPlayerAdminDutyStatus(playerid) == 1)
	{
		sendErrorMessage(playerid, "Nie możesz użyć tej komendy podczas służby administratora!"); 
		return 1;
	}
    new string[256];
	//switch(random(4)+1) 
	new rand = random(2);
    switch(rand)
	{
		case 0: format(string, 256, "*** %s spróbował %s i udało mu się ***",GetNick(playerid), params);
		case 1: format(string, 256, "*** %s spróbował %s i nie udało mu się ***",GetNick(playerid), params);
	}
    ProxDetector(30.0, playerid, string, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO);
	Log(chatLog, WARNING, "%s spróbuj: %s", GetPlayerLogName(playerid), params);
	return 1;
}
