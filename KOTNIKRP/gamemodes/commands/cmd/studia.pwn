//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ studia ]------------------------------------------------//
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

YCMD:studia(playerid, params[], help)
{
	new string[128];

    if(gPlayerLogged[playerid] == 1)
    {
        if(CheckPlayerPerm(playerid, PERM_NEWS) && GroupPlayerDutyRank(playerid) >= 2)
        {
            new drukarniatxt[32];
			new studiovictxt[32];
			new studiogtxt[32];
			new studiontxt[32];
			new biurosantxt[32];
			if(drukarnia == 1)
			{
			    drukarniatxt = "Zamknięte";
			}
			else
			{
			    drukarniatxt = "Otwarte";
			}
			if(studiovic == 1)
			{
			    studiovictxt = "Zamknięte";
			}
			else
			{
			    studiovictxt = "Otwarte";
			}
			if(studiog == 1)
			{
			    studiogtxt = "Zamknięte";
			}
			else
			{
			    studiogtxt = "Otwarte";
			}
			if(studion == 1)
			{
			    studiontxt = "Zamknięte";
			}
			else
			{
			    studiontxt = "Otwarte";
			}
			if(biurosan == 1)
			{
			    biurosantxt = "Zamknięte";
			}
			else
			{
			    biurosantxt = "Otwarte";
			}
			if(GUIExit[playerid] == 0)
			{
				format(string, sizeof(string), "Drukarnia (%s)\nStudio Victim (%s)\nStudio główne (%s)\nStudio nagrań (%s)\nGabinet red. naczelnego (%s)", drukarniatxt, studiovictxt, studiogtxt, studiontxt, biurosantxt);
	            ShowPlayerDialogEx(playerid, 322, DIALOG_STYLE_LIST, "Zamykanie i otwieranie studiów", string, "Close/Open", "Wyjdź");
			}
		}
        else
        {
            sendTipMessageEx(playerid, COLOR_NEWS, "Nie jesteś z SAN/nie masz 2 rangi.");
        }
    }
	return 1;
}
