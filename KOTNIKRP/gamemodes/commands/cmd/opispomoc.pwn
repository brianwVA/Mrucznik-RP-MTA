//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ opispomoc ]-----------------------------------------------//
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

YCMD:opispomoc(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		SendClientMessage(playerid, COLOR_P@,"|___________ Jak używać komendy {CC0033}/opis{99CC00}___________|");
		SendClientMessage(playerid, COLOR_WHITE,"----> 1. Zamieszczaj tylko to czego 'nie widać'");
		SendClientMessage(playerid, COLOR_WHITE,"         Przykład 1: {99CC00}Nosi za pasem klucz francuski.");
		SendClientMessage(playerid, COLOR_WHITE,"----> 2. NIE zamieszczaj reklam ani informacji o zawodzie czy skillu");
		SendClientMessage(playerid, COLOR_WHITE,"Opis jest czatem globalnym IC. Jeżeli będziesz go używał źle możesz otrzymać blokadę tej komendy.");
		SendClientMessage(playerid, COLOR_P@,"{99CC00}|___________ >>> Więcej pomocy M-RP <<< ___________|");
	}
	return 1;
}
