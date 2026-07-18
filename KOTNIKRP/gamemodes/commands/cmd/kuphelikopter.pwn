//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ kuphelikopter ]---------------------------------------------//
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

YCMD:kuphelikopter(playerid, params[], help)
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, -1262.5095,40.3263,14.1392))//kupowanie heli
    {
		if(IsPlayerInAnyVehicle(playerid))
		{
			sendErrorMessage(playerid, "Aby tego użyć musisz wyjść z pojazdu"); 
			return 1;
		}
        if(PlayerInfo[playerid][pSamolot] == 0)
	    {
	        if(GUIExit[playerid] == 0)
	    	{
                ShowPlayerDialogEx(playerid, 420, DIALOG_STYLE_LIST, "Kupowanie Helikopteru", "Sparrow\t\t125 000$\nMaverick\t\t200 000$\nLeviathan\t\t265 000$\nRaindance\t\t325 000$", "Wybierz", "Wyjdź");
            }
	    }
	    else
	    {
	        sendErrorMessage(playerid, "Posiadasz już helikopter.");
	    }
    }
    else
    {
        sendErrorMessage(playerid, "Nie jesteś w salonie helikopterów/samolotów.");
    }
	return 1;
}
