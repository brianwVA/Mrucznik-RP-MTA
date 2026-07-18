//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kontakty ]-----------------------------------------------//
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

YCMD:kontakty(playerid, params[], help)
{
	if(GetPhoneNumber(playerid) == 0)
	{
		sendErrorMessage(playerid, "Nie masz telefonu, nie możesz wpisać tam swoich kontaktów.");
		return 1;
	}

	new opcja[32];
	if(sscanf(params, "s[32] ", opcja))
	{
		sendTipMessage(playerid, "Użyj /kontakty [dzwoń/sms/dodaj/edytuj/usuń/lista]");
		return 1;
	}
	
	if(strcmp(opcja, "dodaj", true) == 0)
	{
		if(!CzyMaWolnySlotNaKontakt(playerid))
		{
			sendErrorMessage(playerid, "Osiągnąłeś maksymalną liczbę kontaktów.");
			return 1;
		}
	
		new nazwa[MAX_KONTAKT_NAME_1], numer;
		if(sscanf(params, "s[32]ds["#MAX_KONTAKT_NAME_1"]", opcja, numer, nazwa))
		{
			sendTipMessage(playerid, "Użyj /kontakty dodaj [numer] [nazwa - max 32znaki]");
			return 1;
		}
		
		
		if(strlen(nazwa) > MAX_KONTAKT_NAME)
		{
			sendErrorMessage(playerid, "Nazwa kontaktu może mieć maksymalnie "#MAX_KONTAKT_NAME" znaki!");
			return 1;
		}
		
		DodajKontakt(playerid, nazwa, numer);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kontakt dodany.");
	}
	else
	{
		if(!CzyGraczMaKontakty(playerid))
		{
			sendErrorMessage(playerid, "Nie posiadasz jeszcze żadnego kontaktu, wpisz /kontakty dodaj aby dodać kontakt.");
			return 1;
		}
	
		if(strcmp(opcja, "dzwon", true) == 0 || strcmp(opcja, "dzwoń", true) == 0)
		{
			ShowPlayerDialogEx(playerid, D_KONTAKTY_DZWON, DIALOG_STYLE_LIST, "Kontakty - dzwoń", ListaKontaktowGracza(playerid), "Dzwoń", "Zamknij");
		}
		else if(strcmp(opcja, "sms", true) == 0)
		{
			ShowPlayerDialogEx(playerid, D_KONTAKTY_SMS, DIALOG_STYLE_LIST, "Kontakty - SMS", ListaKontaktowGracza(playerid), "Wyślj SMS", "Zamknij");
		}
		else if(strcmp(opcja, "edytuj", true) == 0)
		{
			ShowPlayerDialogEx(playerid, D_KONTAKTY_EDYTUJ, DIALOG_STYLE_LIST, "Kontakty - edytuj", ListaKontaktowGracza(playerid), "Edytuj", "Zamknij");
		}
		else if(strcmp(opcja, "usun", true) == 0 || strcmp(opcja, "usuń", true) == 0)
		{
			ShowPlayerDialogEx(playerid, D_KONTAKTY_USUN, DIALOG_STYLE_LIST, "Kontakty - usuń", ListaKontaktowGracza(playerid), "Usuń", "Zamknij");
		}
		else if(strcmp(opcja, "lista", true) == 0)
		{
			ShowPlayerDialogEx(playerid, D_KONTAKTY_LISTA, DIALOG_STYLE_LIST, "Kontakty - lista", ListaKontaktowGracza(playerid), "Wyświetl", "Wyjdź");
		}
	}
	return 1;
}
