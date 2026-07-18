//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zbrojownia ]-----------------------------------------------//
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
// Autor: MorasznikPedofil
// Data utworzenia: 29.06.2021

// Opis:
/*
*/


// Notatki skryptera:
/*
	
*/

YCMD:zbrojownia(playerid, params[], help)
{
    new porzadkowy[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, porzadkowy, sizeof(porzadkowy));
    if(IsPlayerConnected(playerid))
    {
        if(!GroupPlayerDutyPerm(playerid, PERM_POLICE))
        {
            return sendErrorMessage(playerid, "Nie jesteś na służbie grupy, która ma uprawnienia do zbrojowni!");
        }
        new frakcja = GetPlayerGroupUID(playerid, OnDuty[playerid]-1);
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Aby się uzbroić musisz być pieszo!");
        if ( IsPlayerInRangeOfPoint(playerid, 10.0, GroupInfo[frakcja][g_Spawn][0], GroupInfo[frakcja][g_Spawn][1], GroupInfo[frakcja][g_Spawn][2]))
        {
            if(GroupInfo[frakcja][g_Mats] >= 75)
            {
                new string[512];
                strcat(string, "Broń\tMateriały\tCena\nParalizator\t400\t250$\nDesert Eagle\t500\t500$\nShotgun\t500\t500$\nMP5\t750\t750$");
                if(GroupPlayerDutyRank(playerid) >= 2) strcat(string, "\nM4\t1000\t1500$\nRifle\t1250\t1000$");
                if(GroupPlayerDutyRank(playerid) >= 3) strcat(string, "\nSPAS-12\t1350\t1250$\nSniper Rifle\t1400\t1500$");
                ShowPlayerDialogEx(playerid, D_ZBROJOWNIA, DIALOG_STYLE_TABLIST_HEADERS, sprintf("Lista broni (%d mats)", GroupInfo[frakcja][g_Mats]), string, "Kup", "Zamknij");
            }
            else
            {
                sendErrorMessage(playerid, "Brak matsów w sejfie grupy!");
            }
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś na spawnie");
        }
	}
	return 1;
}