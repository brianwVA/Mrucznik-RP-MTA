//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ tankveh ]------------------------------------------------//
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

YCMD:tankveh(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "»» Nie jesteś w pojeździe!");
        if(IsPlayerInAnyVehicle(playerid)) {
            new string[128];
            if (PlayerInfo[playerid][pAdmin] >= 5 || IsAScripter(playerid))
            {
                if(!CanUseAdminCommand(playerid)) return sendErrorMessage(playerid, "Musisz być na admin-duty.");
				new vehicleid = GetPlayerVehicleID(playerid);
				new vuid = VehicleUID[vehicleid][vUID];
                Gas[vehicleid] = 100;
                format(string, sizeof(string), " »» Pojazd o ID (%d) został dotankowany", vehicleid);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string); 
				
				format(string, sizeof(string), "AdmCmD: %s zatankował auto %s (%d)[%d].", GetNickEx(playerid), VehicleNames[GetVehicleModel(vehicleid)-400], vehicleid, vuid);
				//SendPunishMessage(string, playerid);
                SendMessageToAdmin(string, COLOR_RED); 
				Log(adminLog, WARNING, "Admin %s zatankował auto %s", GetPlayerLogName(playerid), GetVehicleLogName(vehicleid));
				if(GetPlayerAdminDutyStatus(playerid) == 1)
				{
					iloscInne[playerid] = iloscInne[playerid]+1;
				}
            }
            else
            {
                noAccessMessage(playerid);
            }
        }
    }
    return 1;
}
