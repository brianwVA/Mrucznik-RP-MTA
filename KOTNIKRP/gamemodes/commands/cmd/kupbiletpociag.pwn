//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ kupbiletpociag ]--------------------------------------------//
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

YCMD:kupbiletpociag(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		if(IsAtTicketMachine(playerid))
		{
			if(PlayerInfo[playerid][pBiletpociag] == 1)
			{
				//zmienne:
				new string[128];
				//Komunikaty:
				sendErrorMessage(playerid, "Posiadasz już bilet do pociągu!");
				format(string, sizeof(string), "* %s mruczy (jak Mrucznik) na bilet, który już posiada.", GetNick(playerid));//ciekawostka - mrucznik
				ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
				return 1;
			}
			else if(PlayerInfo[playerid][pBiletpociag] == 0)
			{
				//zmienne
				new string[256];
				new giveplayer[MAX_PLAYER_NAME + 1];
				GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
				//czynności:
				format(string, sizeof(string), "{FFFF00}Korporacja Transportowa\n{FFFFFF}Cena: {00FF00}%d$\n{FFFFFF}Imię_Nazwisko: {00FF00}%s\n{FFFFFF}Ulga: {00FF00}0$", CenaBiletuPociag, giveplayer);//Skrypt na zniżki i ulgi w trakcie pisania, celowo ie ma tutaj wartości
				ShowPlayerDialogEx(playerid, 1090, DIALOG_STYLE_MSGBOX, "Maszyna do biletów", string, "Zakup", "Odejdź");
				//komunikaty:
				format(string, sizeof(string), "* %s wstukuje w maszynę UID dowodu osobistego, wybiera trasę i ulgę.", GetNick(playerid));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jesteś przy maszynie do kupna biletów!"); 
			return 1;
		}
	}
	return 1;
}
