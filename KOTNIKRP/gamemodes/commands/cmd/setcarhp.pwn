//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ setcarhp ]-----------------------------------------------//
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
// Autor: werem
// Data utworzenia: 29.02.2020

// Opis:
/*

*/


// Notatki skryptera:
/*
	
*/
YCMD:setcarhp(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		new vehicleid, health;
		if( sscanf(params, "dd", vehicleid, health))
		{
			sendTipMessage(playerid, "Użyj /setcarhp [carid] [hp]");
			return 1;
		}
    
        if (PlayerInfo[playerid][pAdmin] >= 10 || IsAScripter(playerid))
        {
            if(GetVehicleModel(vehicleid))
            {
                new vuid = VehicleUID[vehicleid][vUID];
                SetVehicleHealth(vehicleid, health);
                CarData[vuid][c_HP] = (health > CarData[vuid][c_MaxHP] ? CarData[vuid][c_MaxHP] : health);
                Log(adminLog, WARNING, "Admin %s ustawił hp auta %s na %d", GetPlayerLogName(playerid), GetVehicleLogName(vehicleid), health);
                new string[128];
                format(string, sizeof(string), "Admin %s ustawił hp auta [vID: %d] na %d", GetNickEx(playerid), vehicleid, Float:health);
                SendMessageToAdmin(string, COLOR_P@);
            }
            else
            {
                sendTipMessage(playerid, "Niepoprawne ID pojazdu. (/dl)");
            }
        }
        else
        {
            noAccessMessage(playerid);
        }
    }
    return 1;
}