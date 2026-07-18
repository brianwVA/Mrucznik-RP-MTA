//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ podatek ]------------------------------------------------//
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

YCMD:podatek(playerid, params[], help)
{
	new string[64];

    if(IsPlayerConnected(playerid))
    {
        if(!GroupIsLeader(playerid, 11))
        {
			SendClientMessage(playerid, COLOR_GREY, "Nie jesteś burmistrzem!");
			return 1;
        }
        new moneys;
        if( sscanf(params, "d", moneys))
		{
			sendTipMessage(playerid, "Użyj /podatek [ilość]");
			return 1;
		}

		if(moneys < 1 || moneys > 5000) { SendClientMessage(playerid, COLOR_GREY, "   Kwota podatku od 1 do 5000 !"); return 1; }
		TaxValue = moneys;
		SaveStuff();
		format(string, sizeof(string), "* Podatek to teraz $%d na gracza.", TaxValue);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    }
    return 1;
}
