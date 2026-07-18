//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ dajscene ]---------------------------------------------------//
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

YCMD:dajscene(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		new giveplayerid, value; 
		if(sscanf(params, "k<fix>d", giveplayerid, value))
		{
			sendTipMessage(playerid, "Użyj /dajscene [ID] [0 - Zabierz || 1 - daj ]");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(GroupIsVLeader(playerid, FRAC_SN))
			{
				SN_ACCESS[giveplayerid] = value;
				sendTipMessage(playerid, "Zmieniłeś wartość pozwolenia sceny"); 
				sendTipMessage(giveplayerid, "Została zmieniona Ci wartość pozwolenia zarządzania sceną"); 
			}
			else
			{
				sendErrorMessage(playerid, "Brak uprawnień do zarządzania przydziałem!"); 
			}
		}
	}
	return 1;
}



