//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dol ]------------------------------------------------//
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
	M-RPindex.php?/topic/55-propozycja-dodanie-losowanej-funkcji-narracyjnej/
    
*/


// Notatki skryptera:
/*
	/dol znajduje w szafie | top | t-shirt | bezrękawnik
*/

YCMD:dol(playerid, params[], help)
{
	if(isnull(params)) 
    {
        sendTipMessage(playerid, "Użyj /dol [akcja | wybór | wybór | ...]");
        sendTipMessage(playerid, "Przykład: /dol znajduje w szafie | top | t-shirt | bezrękawnik");
        return 1;
    }

    if(GetPVarInt(playerid, "dutyadmin") == 1)
	{
		sendErrorMessage(playerid, "Nie możesz użyć tego podczas @Duty! Zejdź ze służby używając /adminduty");
		return 1;
	}

    new akcje[20][32], count;
    count = strexplode(akcje, params, "|");
    if(count < 3) return sendTipMessage(playerid, "Podaj przynajmniej 2 wybory do wylosowania.");

    new string[256], r;

    r = random(count-1)+1;
    strtrim(akcje[0]);
    strtrim(akcje[r]);
    akcje[0][0] = toupper(akcje[0][0]);

    format(string, sizeof(string), "* %s %s (( %s ))", akcje[0], akcje[r], GetNick(playerid));
    ProxDetector(10.0, playerid, string, COLOR_DO,COLOR_DO,COLOR_DO,COLOR_DO,COLOR_DO);
    return 1;
}