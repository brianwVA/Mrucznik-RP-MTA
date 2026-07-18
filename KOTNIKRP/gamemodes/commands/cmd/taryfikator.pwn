//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ taryfikator ]----------------------------------------------//
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

YCMD:taryfikator(playerid, params[], help)
{
    ShowPlayerDialogEx(playerid,68,DIALOG_STYLE_LIST,"Kodeks wykroczeń: wybierz dział","Wykroczenia przeciwko porządkowi i bezpieczeństwu publicznemu\nPosiadanie nielegalnych przedmiotów\nWykroczenia przeciwko mieniu i zdrowiu\nWykroczenia przeciwko godności osobistej\nUtrudnianie działań policji\nWykroczenia przeciwko bezpieczeństwu w ruchu drogowym\nNiewłaściwe korzystanie z drogi\nInformacje","Wybierz","Wyjdź");
	return 1;
}
