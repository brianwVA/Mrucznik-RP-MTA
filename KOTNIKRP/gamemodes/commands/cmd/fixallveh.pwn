//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ fixallveh ]-----------------------------------------------//
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

YCMD:fixallveh(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] < 1000)
        {
            noAccessMessage(playerid);
            return 1;
        }
        foreach(new i : Player)
        {
            if(IsPlayerInAnyVehicle(i))
            {
                new carID = GetPlayerVehicleID(i); 
                RepairVehicle(carID);
                SetVehicleHealth(carID, CarData[VehicleUID[carID][vUID]][c_MaxHP]);
                CarData[VehicleUID[carID][vUID]][c_HP] = CarData[VehicleUID[carID][vUID]][c_MaxHP];
            }
        }
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			iloscInne[playerid] = iloscInne[playerid]+1;
		}
        new string[128];
        format(string, sizeof(string), "Admin %s naprawił wszystkim graczom pojazdy", GetNickEx(playerid));
        SendClientMessageToAll(COLOR_LIGHTBLUE, string);
		Log(adminLog, WARNING, "Admin %s użył /fixallveh", GetPlayerLogName(playerid));
    }
    return 1;
}
