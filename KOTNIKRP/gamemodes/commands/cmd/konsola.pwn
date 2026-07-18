//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ konsola ]------------------------------------------------//
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

YCMD:konsola(playerid, params[], help)
{
    if(IsPlayerInGroup(playerid, 19, 1) || IsPlayerInGroup(playerid, 18, 1))
    {
        if(GroupPlayerDutyRank(playerid) < 4) return sendErrorMessage(playerid, "Tylko dla stopni od 4 wzwyż!");
        if(!IsPlayerInRangeOfPoint(playerid, 5.0, 816.3592,-1384.7954,-20.1095) || !IsPlayerInRangeOfPoint(playerid, 2.5, 433.1950, -1845.3390, -64.2206)) {
            sendErrorMessage(playerid, "Musisz być przy konsoli DJ'a, aby z niej skorzystać!");
            return 1;
        }
        ShowPlayerDialogEx(playerid, DIALOG_KONSOLA_VINYL, DIALOG_STYLE_INPUT, "Konsola DJ'a", "Tutaj możesz zmienić muzykę grającą w klubie.\nWprowadź poniżej adres URL.", "Ustaw", "Wyjdź");
    } else
    {
        sendErrorMessage(playerid, "Nie jesteś DJ'em!");
        return 1;
    }
    return 1;
}
