//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ trasy ]-------------------------------------------------//
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

YCMD:trasy(playerid, params[], help)
{
	if(GUIExit[playerid] == 0)
	{
		if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
		{
			if(GroupPlayerDutyRank(playerid) >= 5)
			{
				ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
			}
			else if(GroupPlayerDutyRank(playerid) >= 3)
			{
				ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig", "Wybierz", "Anuluj");
			}
			else
			{
				ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Więcej", "Wyjdź");
			}
			return 1;
		}
		else
		{
			ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Więcej", "Wyjdź");
		}
	}
	return 1;
}
