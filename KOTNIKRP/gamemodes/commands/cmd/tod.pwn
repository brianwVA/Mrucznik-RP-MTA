//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ tod ]--------------------------------------------------//
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

YCMD:tod(playerid, params[], help)
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
		new hour;
		if( sscanf(params, "d", hour))
		{
			sendTipMessage(playerid, "Użyj /tod [czas] (0-23)");
			return 1;
		}


		if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
		{
            SetWorldTime(hour);
            ServerTime = hour;
			
			format(string, sizeof(string), "Czas zmieniony na %d Godzine.", hour);
			BroadCast(COLOR_GRAD1, string);

            format(string, sizeof(string), "CMD_Info: /tod użyte przez %s [%d]", GetNickEx(playerid), playerid);
            SendCommandLogMessage(string);
        	Log(adminLog, WARNING, "Admin %s użył /tod z wartością %d", GetPlayerLogName(playerid), hour);
			if(GetPlayerAdminDutyStatus(playerid) == 1)
			{
				iloscInne[playerid] = iloscInne[playerid]+1;
			}
			foreach(new i : Player)//Jeżeli gracze są w intkach 
			{
				if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0)
				{
					SetInteriorTimeAndWeather(i);
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
