//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ vopispomoc ]----------------------------------------------//
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

YCMD:vopispomoc(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		SendClientMessage(playerid, COLOR_P@,"|___________ Jak używać komendy {CC0033}/vopis{99CC00}___________|");
		SendClientMessage(playerid, COLOR_WHITE,"----> 1. Zamieszczaj tylko to czego 'nie widać'");
		SendClientMessage(playerid, COLOR_WHITE,"         Przykład 1: {99CC00}Przyciemniane szyby, kartka na przodzie z napisem: Sprzedam");
		SendClientMessage(playerid, COLOR_WHITE,"----> 2. NIE zamieszczaj reklam");
		SendClientMessage(playerid, COLOR_WHITE,"Opis jest czatem globalnym IC. Jeżeli będziesz go używał źle możesz otrzymać blokadę tej komendy.");
		SendClientMessage(playerid, COLOR_P@,"{99CC00}|___________ >>> Więcej pomocy M-RP <<< ___________|");
	}
	return 1;
}
