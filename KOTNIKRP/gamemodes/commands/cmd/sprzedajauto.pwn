//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ sprzedajauto ]---------------------------------------------//
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

YCMD:sprzedajauto(playerid, params[], help)
{
	new string[256];
	new sendername[MAX_PLAYER_NAME + 1];
	new giveplayer[MAX_PLAYER_NAME + 1];

	if(IsPlayerInAnyVehicle(playerid))
    {
   		new playa, cena;
		if( sscanf(params, "k<fix>s[32]", playa, string))
		{
			sendTipMessage(playerid, "Użyj /dajauto [Nick/ID] [cena]");
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie możesz tego użyć  podczas @Duty! Zejdź ze służby używając /adminduty");
			return 1;
		}
        if(GetPVarInt(playa, "CanDoIt") == 1) return sendErrorMessage(playerid, "Ten gracz otrzymał już ofertę kupna pojazdu! Zaczekaj 15 sekund");
        if(!IsPlayerConnected(playa)) return sendErrorMessage(playerid, "Brak takiego gracza.");
		cena = FunkcjaK(string);
		//
        new lVeh = GetPlayerVehicleID(playerid);
		if(!IsCarOwner(playerid, lVeh)) return sendTipMessage(playerid, "Nie jesteś właścicielem tego pojazdu.");
		if(PlayerInfo[playa][pLevel] == 1) return sendTipMessage(playerid, "Nie możesz sprzedać temu graczowi pojazdu ponieważ ma 1lvl");
		if(PlayerInfo[playerid][pLevel] == 1) return sendTipMessage(playerid, "Nie możesz sprzedawać pojazdu bo masz 1 lvl");
		if(GetPVarInt(playerid, "CanDoIt") == 1) return sendErrorMessage(playerid, "Oferowałeś już komuś zakup auta, odczekaj 15 s");
        new vehid = VehicleUID[lVeh][vUID];
 		if(GetDistanceBetweenPlayers(playerid,playa) > 5) return sendErrorMessage(playerid, "Ten gracz jest za daleko!");
		if(!(cena >= PRICE_SELLCAR_MIN && cena <= PRICE_SELLCAR_MAX)) return sendTipMessage(playerid, "Cena od "#PRICE_SELLCAR_MIN" do "#PRICE_SELLCAR_MAX"$ !");

        if(lVeh <= CAR_End) return sendErrorMessage(playerid, "Tego pojazdu nie można sprzedać");

	    if(kaska[playa] == 0) return sendErrorMessage(playerid, "Błąd");

		if(playa == INVALID_PLAYER_ID || playerid == playa) return 1;
		
	    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));

        //SetPVarInt(playa, "offer-car", gettime() + 30);
		odczekajTimer[playa] = SetTimerEx("odczekaj15sec", 15000, false, "i", playa);
		SetPVarInt(playa, "CanDoIt", 1);
		SetPVarInt(playa, "WhatToDo", 1);
		SetPVarInt(playerid, "WhatToDo", 2);
		SetPVarInt(playerid, "CanDoIt", 1);
		odczekajTimer[playerid] = SetTimerEx("odczekaj15sec", 15000, false, "i", playerid);
	    format(string, sizeof(string), "%s oferuje ci sprzedaż %s za %d$. Jeśli chcesz kupić to auto wpisz /akceptuj pojazd aby kupić.", sendername, VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400], cena);
        SendClientMessage(playa, 0xFFC0CB, string);

        if(!IsPlayerPremiumOld(playa))
        {
            if(CarData[vehid][c_Neon] != 18652 && CarData[vehid][c_Neon] != 0)
            {
                SendClientMessage(playa, 0xFF0000FF, "UWAGA!: Ten samochód ma kolorowe neony dostępne tylko dla kont premium. Gdy zakupisz to auto neony automatycznie zmienią kolor na {FFFFFF}biały!");
            }
        }
        format(string, sizeof(string), "Oferujesz %s kupno twojego %s za %d$", giveplayer, VehicleNames[GetVehicleModel(lVeh)-400], cena);
        SendClientMessage(playerid, 0xFFC0CB, string);
        GraczDajacy[playa] = playerid;
		CenaDawanegoAuta[playa] = cena;
		IDAuta[playa] = vehid;
	}
 	else
 	{
		sendTipMessage(playerid, "Nie jesteś w pojeździe");
    }
	return 1;
}
