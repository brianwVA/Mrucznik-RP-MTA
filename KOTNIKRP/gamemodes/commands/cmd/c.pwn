//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ c ]---------------------------------------------------//
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

YCMD:c(playerid, params[], help)
{
    new var[64];
    if(sscanf(params, "s[64]", var)) return sendTipMessage(playerid, "Użj /c [KOD RADIOWY]");
    new str[144];
    if(GetPVarInt(playerid, "patrol") == 1)
    {
        new pat = GetPVarInt(playerid, "patrol-id");

        /*
            1 - ok
            2 - wsparcie
            3 - pościg
            4 - ranny // komentarz dotyczy tylko patstan (blipy na /patrol mapa) a nie kodów radiowych
        */
        if(strcmp(var, "red", true) == 0)
        {
            PatrolInfo[pat][patstan] = 2;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{FF0000} Potrzebne natychmiastowe wsparcie - {FFFFFF}CODE RED", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "1") == 0)
        {
            PatrolInfo[pat][patstan] = 3;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Pościg za podejrzanym - {FFFFFF}CODE 1", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "2") == 0)
        {
            PatrolInfo[pat][patstan] = 3;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Odbieram zgłoszenie z niskim priorytetem - {FFFFFF}CODE 2", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "3") == 0)
        {
            PatrolInfo[pat][patstan] = 3;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Odbieram zgłoszenie z wysokim priorytetem (sygnały i światła) - {FFFFFF}CODE 3", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "4") == 0)
        {
            PatrolInfo[pat][patstan] = 1;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Odwołuję dodatkowe wsparcie - {FFFFFF}CODE 4", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "5") == 0)
        {
            PatrolInfo[pat][patstan] = 1;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Wolna jednostka w terenie - {FFFFFF}CODE 5", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "6") == 0)
        {
            PatrolInfo[pat][patstan] = 3;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Interwencja poza pojazdem - {FFFFFF}CODE 6", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
        else if(strcmp(var, "7") == 0)
        {
            PatrolInfo[pat][patstan] = 1;
            format(str, sizeof(str), "{FFFFFF}»»{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} Zakończenie działań przy zdarzeniu - {FFFFFF}CODE 7", PatrolInfo[pat][patname]);
            SendTeamMessage(1, COLOR_ALLDEPT, str);
        }
    }
    return 1;
}
