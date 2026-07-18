//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ wizytowka ]-----------------------------------------------//
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

YCMD:wizytowka(playerid, params[], help)
{
	if(GetPhoneNumber(playerid) == 0)
	{
		sendErrorMessage(playerid, "Nie masz telefonu, nie możesz dawać graczom wizytówek.");
		return 1;
	}

	new giveplayerid, nazwa[MAX_KONTAKT_NAME_1], string[128];
	format(string, sizeof(string), "k<fix>S(%s)["#MAX_KONTAKT_NAME_1"]", GetNick(playerid));
	if(sscanf(params, string, giveplayerid, nazwa))
	{
		sendTipMessage(playerid, "Użyj /wizytowka [ID/Nick Gracza] (nazwa - domyślnie nick)");
		return 1;
	}
	
	if(!IsPlayerConnected(giveplayerid))
	{
		sendErrorMessage(playerid, "Nie ma takiego gracza.");
		return 1;
	}
	
	if(!ProxDetectorS(10.0, playerid, giveplayerid))
	{
		sendErrorMessage(playerid, "Jesteś za daleko od tego gracza.");
		return 1;
	}
	
	if(GetPhoneNumber(giveplayerid) == 0)
	{
		sendErrorMessage(playerid, "Ten gracz nie ma telefonu, nie możesz dać mu wizytówki.");
		return 1;
	}
	
	if(giveplayerid == playerid) 
	{
		sendErrorMessage(playerid, "Nie możesz dać wizytówki samemu sobie!"); 
		return 1;
	}
	
	if(GetPVarInt(giveplayerid, "wizytowka") == playerid)
	{
		sendErrorMessage(playerid, "Już oferujesz temu graczowi swoją wizytówkę."); 
		return 1;
	}
	
	if(strlen(nazwa) > MAX_KONTAKT_NAME)
	{
		sendErrorMessage(playerid, "Nazwa kontaktu może mieć maksymalnie "#MAX_KONTAKT_NAME" znaki!");
		return 1;
	}
	
	format(string, sizeof(string), "* Oferujesz %s wizytówkę.", GetNick(giveplayerid));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s proponuje wizytówkę o treści: %s, (wpisz /akceptuj wizytowka) aby akceptować.", GetNick(playerid), nazwa);
	SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
	SetPVarString(giveplayerid, "wizytowka-nazwa", nazwa);
	SetPVarInt(giveplayerid, "wizytowka", playerid);
	return 1;
}
