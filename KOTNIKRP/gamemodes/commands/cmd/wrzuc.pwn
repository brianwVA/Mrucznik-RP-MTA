//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wrzuc ]-------------------------------------------------//
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

YCMD:wrzuc(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];
    if(CheckPlayerPerm(playerid, PERM_CRIMINAL))
    {
    	new person, seat4;
    	if( sscanf(params, "k<fix>d", person, seat4))
    	return sendTipMessage(playerid, "Użyj /wepchnij [ID Gracza] [miejsce 2-4]");

		if(!IsPlayerConnected(person))
		{
			sendErrorMessage(playerid, "Nie ma takiego gracza.");
			return 1;
		}

		if(Kajdanki_JestemSkuty[person] != 0)
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz tego zrobić na skutym graczu !");
			return 1;
		}

    	if (GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
    	return sendTipMessage(playerid, "Musisz być w pojeździe.");

    	if (IsPlayerInAnyVehicle(person))
    	return sendTipMessage(playerid, "Gracz nie może znajdować się w pojeździe.");

		new veh = GetPlayerVehicleID(playerid);
		if(veh == INVALID_VEHICLE_ID) return sendErrorMessage(playerid, "Coś poszło nie tak z pojazdem.");
		new maxseat = GetVehicleMaxPassengers(GetVehicleModel(veh));
		if(maxseat == 0xF) return sendErrorMessage(playerid, "Nieprawidłowe miejsce w pojeździe.");
		if(seat4 < 2 || seat4 > maxseat) return sendTipMessage(playerid, "Podaj prawidłowe miejsce w pojeździe.");

		for(new p = 0; p < MAX_PLAYERS; p++)
		{
			if(!IsPlayerConnected(p)) continue;
			if(GetPlayerVehicleID(p) == veh && GetPlayerVehicleSeat(p) == seat4)
			{
				return sendTipMessage(playerid, "To miejsce jest już zajęte.");
			}
		}

    	if(pobity[person] >= 1 || PlayerInfo[person][pBW] > 0 || PlayerInfo[person][pInjury] > 0)
        {
    		if (GetDistanceBetweenPlayers(playerid,person) > 5) return sendErrorMessage(playerid, "Gracz nie jest w pobliżu.");
			ZdejmijBW(person);
            TogglePlayerControllable(person, 1);
    		new Float:pos[6];
    		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    		GetPlayerPos(playerid, pos[3], pos[4], pos[5]);
    		if (floatcmp(floatabs(floatsub(pos[0], pos[3])), 10.0) != -1 &&
    		floatcmp(floatabs(floatsub(pos[1], pos[4])), 10.0) != -1 &&
    		floatcmp(floatabs(floatsub(pos[2], pos[5])), 10.0) != -1) return false;
            PutPlayerInVehicleEx(person, GetPlayerVehicleID(playerid), seat4);
    		TogglePlayerControllable(person, 0);
    		PlayerCuffed[person] = 2;
    		PlayerCuffedTime[person] = 180;
    		GameTextForPlayer(person, "~r~Wrzucony do wozu", 2500, 3);
    		pobity[person] = 0;
    		GetPlayerName(person, giveplayer, sizeof(giveplayer));
    		GetPlayerName(playerid, sendername, sizeof(sendername));
    		format(string, sizeof(string), "* Zostałeś wrzucony do pojazdu przez %s.", sendername);
    		SendClientMessage(person, COLOR_LIGHTBLUE, string);
    		format(string, sizeof(string), "* Wrzuciłeś do pojazdu %s.", giveplayer);
    		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    		format(string, sizeof(string), "* %s wrzucił do pojazdu i unieruchomił %s.", sendername ,giveplayer);
    		ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            sendTipMessage(playerid, "Po trzech minutach osoba zostanie rozwiązana!");
            sendTipMessage(person, "Po trzech minutach zostaniesz rozwiązany!");
			SetPlayerChatBubble(person, " ", 0xFF0000FF, 70.0, 1000);
			CreateNewCombatLog(person);
    		return 1;
    	}
    	else
    	{
    	    sendTipMessage(playerid, "Gracz nie jest pobity!");
    	}
    } else {
        sendErrorMessage(playerid, "Nie możesz tego zrobić!");
        return 1;
    }
    return 1;
}
