//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ kurs ]-------------------------------------------------//
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

YCMD:kurs(playerid, params[], help)
{
	if(PlayerInfo[playerid][pJob] == 10 || IsPlayerInGroup(playerid, 10) || PlayerInfo[playerid][pLider] == 10)
	{
		if(GetPlayerState(playerid) == 2)
		{
			if(AntySpam[playerid] != 0)
			{
				sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 7 sekund !");
				return 1;
			}

			new vehicleid = GetPlayerVehicleID(playerid);
			new string[128], moneys, sendername[MAX_PLAYER_NAME + 1];

			//stare:
			if(TransportDuty[playerid] > 0)
			{
                Taxi_FareEnd(playerid);
				return 1;
			}
			if(IsATaxiCar(vehicleid))
			{
                if(OnDuty[playerid] == 0) return sendTipMessageEx(playerid, COLOR_GREY, "Nie jestes na służbie!");
				sscanf(params, "D(0)", moneys);
				if(IsATrain(vehicleid))
                {
					GetPlayerName(playerid,sendername,sizeof(sendername));
					format(string, sizeof(string), "Maszynista %s jest na służbie i kursuje po stanie San Andreas.", sendername);
					OOCNews(COLOR_YELLOW,string);
                }
                else if(IsAPlane(vehicleid))
                {
                    if(moneys < PRICE_FARE_PLANE_MIN || moneys > PRICE_FARE_PLANE_MAX) { sendTipMessageEx(playerid, COLOR_GREY, "Cena kursu od $"#PRICE_FARE_PLANE_MIN" do $"#PRICE_FARE_PLANE_MAX"!"); return 1; }
    				TaxiDrivers += 1; TransportDuty[playerid] = 1; TransportValue[playerid] = moneys;
    				GetPlayerName(playerid,sendername,sizeof(sendername));
    				format(string, sizeof(string), "Pilot %s jest na służbie wpisz /wezwij heli aby skorzystać z jego usług, koszt %d$", sendername, TransportValue[playerid]);
    				OOCNews(COLOR_YELLOW,string);
                }
                else
                {
					if(GetVehicleModel(vehicleid) == 418 || GetVehicleModel(vehicleid) == 525 || GetVehicleModel(vehicleid) == 402 || GetVehicleModel(vehicleid) == 541) return sendTipMessageEx(playerid,COLOR_GREY,"W tym pojeździe nie możesz wejść na służbę !");
    				if(moneys < PRICE_FARE_TAXI_MIN || moneys > PRICE_FARE_TAXI_MAX) { sendTipMessageEx(playerid, COLOR_GREY, "Cena kursu od $"#PRICE_FARE_TAXI_MIN" do $"#PRICE_FARE_TAXI_MAX" !"); return 1; }
    				TaxiDrivers += 1; TransportDuty[playerid] = 1; TransportValue[playerid] = moneys;
    				GetPlayerName(playerid,sendername,sizeof(sendername));
    				format(string, sizeof(string), "Taksówkarz %s jest na służbie wpisz /wezwij taxi aby skorzystać z jego usług, koszt %d$", sendername, TransportValue[playerid]);
    				OOCNews(COLOR_YELLOW,string);
                }
			}
			else if(IsATrain(vehicleid))//pociągi
			{
				format(string, sizeof(string), "Koleje Brown Streak rozpoczęły trasę po stanie San Andreas!");
				OOCNews(COLOR_YELLOW,string);
			}
			else
			{
				sendTipMessageEx(playerid,COLOR_GREY,"W tym pojeździe nie możesz wejść na służbę !");
				return 1;
			}
			AntySpam[playerid] = 1;
			SetTimerEx("AntySpamTimer",7000,0,"d",playerid);
		}
		else
		{
			sendTipMessageEx(playerid,COLOR_GREY,"Nie jesteś kierowcą !");
			return 1;
		}
	}
	else
	{
		sendErrorMessage(playerid,"Nie jesteś taksówkarzem / busiarzem !");
		return 1;
	}
	return 1;
}
