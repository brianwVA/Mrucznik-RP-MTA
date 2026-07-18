//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zapytaj ]------------------------------------------------//
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

YCMD:zapytaj(playerid, params[], help)
{
    if(GetPVarInt(playerid, "active_ticket") != 0) return sendTipMessageEx(playerid, COLOR_GRAD2, "Twoje wczesniejsze zgłoszenie nadal jest aktywne. Poczekaj na odpowiedź!");
    new desc[64];
    if(sscanf(params, "s[64]", desc))
    {
        SendClientMessage(playerid, COLOR_YELLOW, "Potrzebujesz pomocy na temat gry IC? Użyj zapytania do supportu!");
        SendClientMessage(playerid, COLOR_GRAD2, "Wpisz ogólny temat w nawiasach kwadratowych [TEMAT] oraz dalszą tresc.");
        SendClientMessage(playerid, COLOR_GRAD2, "Przykład użycia: {FFFFFF}/zapytaj [Pojazd] Gdzie kupię swój pierwszy pojazd?");
        return 1;
    }
    new pos = strfind(desc, "["), pos2 = strfind(desc, "]");
    if(pos == -1 || pos2 == -1 || pos2 < pos)
    {
        SendClientMessage(playerid, COLOR_GRAD2, "Wpisz ogólny temat w nawiasach kwadratowych [TEMAT] oraz dalszą tresc.");
        SendClientMessage(playerid, COLOR_GRAD2, "Przykład użycia: {FFFFFF}/zapytaj [Pojazd] Gdzie kupię swój pierwszy pojazd?");
        return 1;
    }
    new sub[16], str[32];
    strmid(sub, desc, pos+1, pos2);
    while(desc[pos2+1] == ' ')
    {
        strdel(desc, pos2, pos2+1);
    }
    strmid(str, desc, pos2+1, strlen(desc), 32);
    if(strlen(sub) < 2 || strlen(desc) < 10)
    {
        sendTipMessageEx(playerid, COLOR_GRAD2, "Podałes za krótki opis lub temat.");
        return 1;
    }
    new id;
    if((id = Support_Add(playerid, sub, str)) != -1)
    {
        sendTipMessageEx(playerid, COLOR_YELLOW, "Wysłano zapytanie do pomocy. Proszę czekać cierpliwie na odpowiedź :)");
        SetPVarInt(playerid, "active_ticket", id+1);

        foreach(new i : Player)
            if(GetPVarInt(i, "support_duty") == 1)
                SendClientMessage(i, COLOR_GREEN, "SUPPORT: {FFFFFF}Nowe zgłoszenie o pomoc (/supports).");
    }
    else
        sendTipMessageEx(playerid, COLOR_RED, "Nie można dodać zapytania, lista jest pełna.");
    return 1;
}
