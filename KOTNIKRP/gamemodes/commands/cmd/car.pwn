//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ car ]--------------------------------------------------//
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

YCMD:car(playerid, params[], help)
{
    return MRP_ShowCarsOrReload(playerid);
    if(IsPlayerConnected(playerid))
    {
        if(CountPlayerCars(playerid) > 0)
        {
  		    ShowCarsForPlayer(playerid, playerid);
		}
		else
		{
		    SendClientMessage(playerid, COLOR_GRAD2, "Nie posiadasz własnego pojazdu");
		}
	}
	return 1;
}

// Jawna nazwa znana z SA-MP. Dynamiczny alias YSI nie jest niezawodny
// przy wywolaniu przez warstwe zgodnosci MTA.
YCMD:auto(playerid, params[], help)
{
    return MRP_ShowCarsOrReload(playerid);
    if(IsPlayerConnected(playerid))
    {
        if(CountPlayerCars(playerid) > 0)
        {
            ShowCarsForPlayer(playerid, playerid);
		}
		else
		{
		    SendClientMessage(playerid, COLOR_GRAD2, "Nie posiadasz wlasnego pojazdu");
		}
	}
	return 1;
}

stock MRP_ShowCarsOrReload(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(CountPlayerCars(playerid) > 0)
	{
		ShowCarsForPlayer(playerid, playerid);
		return 1;
	}
	if(gPlayerLogged[playerid])
	{
		Car_LoadForPlayer(playerid);
		SetTimerEx("MRP_ShowCarsAfterLoad", 1000, false, "i", playerid);
		SendClientMessage(playerid, COLOR_GRAD2, "Wczytuje twoje pojazdy, sprobuj jeszcze raz za chwile.");
		return 1;
	}
	SendClientMessage(playerid, COLOR_GRAD2, "Nie posiadasz wlasnego pojazdu");
	return 1;
}

forward MRP_ShowCarsAfterLoad(playerid);
public MRP_ShowCarsAfterLoad(playerid)
{
	if(!IsPlayerConnected(playerid) || !gPlayerLogged[playerid]) return 0;
	if(CountPlayerCars(playerid) > 0)
	{
		ShowCarsForPlayer(playerid, playerid);
	}
	return 1;
}
