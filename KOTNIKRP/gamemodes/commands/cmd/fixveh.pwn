//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ fixveh ]------------------------------------------------//
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

YCMD:fixveh(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid) || PlayerInfo[playerid][pNewAP] >= 1)
		{
			if(!CanUseAdminCommand(playerid)) return sendErrorMessage(playerid, "Musisz być na admin-duty.");
			if(IsPlayerInAnyVehicle(playerid))
			{
				
				new vehicleid = GetPlayerVehicleID(playerid);
				new vuid = VehicleUID[vehicleid][vUID];
				RepairVehicle(GetPlayerVehicleID(playerid));
				SetVehicleHealth(GetPlayerVehicleID(playerid), CarData[vuid][c_MaxHP]);
				CarData[vuid][c_HP] = CarData[vuid][c_MaxHP];
	
				new string[128];
				format(string, sizeof(string), "AdmCmd: %s naprawił auto %s (%d)[%d (%d)].", GetNickEx(playerid), VehicleNames[GetVehicleModel(vehicleid)-400], vehicleid, vuid, CarData[vuid][c_UID]);
				SendMessageToAdmin(string, COLOR_RED);
				Log(adminLog, WARNING, "Admin %s użył /fixveh dla pojazdzu %s", GetPlayerLogName(playerid), GetVehicleLogName(vehicleid));
				if(GetPlayerAdminDutyStatus(playerid) == 1)
				{
					iloscInne[playerid] = iloscInne[playerid]+1;
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
