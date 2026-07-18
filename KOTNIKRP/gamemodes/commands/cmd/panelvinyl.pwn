//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ panelvinyl ]----------------------------------------------//
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
	Skrypt pozwalający zarządzać vinyl-clubem
*/


// Notatki skryptera:
/*
	
*/

YCMD:panelvinyl(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
        if(IsPlayerInGroup(playerid, 19, 1) && GroupPlayerDutyRank(playerid) >= 4) // Pod ibize
        {
            sendTipMessage(playerid, "Witamy w panelu zarządzania Vinyl-Club");
            ShowPlayerDialogEx(playerid, 6999, DIALOG_STYLE_TABLIST, "Laptop Lidera", "Open/Close\nUstal cene Norm.\nUstal cene VIP\nUstal cene napoi\nUstal nazwe napoi", "Wybierz", "Odrzuć");
        }
        else
        {
            sendErrorMessage(playerid, "Nie jesteś z Ibizy, nie możesz zarządzać vinylem!");
        }
    }
	return 1;
}
