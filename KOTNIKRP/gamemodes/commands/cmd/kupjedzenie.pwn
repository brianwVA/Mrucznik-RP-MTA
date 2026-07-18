//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ adajrange ]-----------------------------------------------//
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

YCMD:kupjedzenie(playerid, params[], help)
{
    new org = -1;
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 2114.50, -1805.80, 13.61) && GetPlayerVirtualWorld(playerid) == 5) //pizzeria idlewood
        org = 28;
    else if(IsPlayerInRangeOfPoint(playerid, 5.0, 369.67, -6.65, 1001.85) && GetPlayerInterior(playerid) == 9) //cluckinbell
        org = 53;
    else if(IsPlayerInRangeOfPoint(playerid, 5.0, 392.8683,-1896.6530,7.9687) && GetPlayerVirtualWorld(playerid) == 18) //Cowboy Bar
        org = 57;
    else if(IsPlayerInRangeOfPoint(playerid, 5.0, 875.38, -1343.13, 13.50) && GetPlayerVirtualWorld(playerid) == 1) //Mexican Food
        org = 57;
    else
        return sendErrorMessage(playerid, "Nie znajdujesz się w restauracji!");
    new staffOnDuty = -1;
    foreach(new i : Player)
    {
        if(IsPlayerPaused(i)) continue;
        if(org == -1 || !OnDuty[i]) continue;
        //if(GetPlayerGroupUID(i, OnDuty[i]-1) != org) continue;
        if(!GroupPlayerDutyPerm(i, PERM_RESTAURANT)) continue;
        staffOnDuty = i;
        break;
    }
    new string[456];
    string = "Typ\tNazwa\tCena\tNajedzenie";
    DynamicGui_Init(playerid);
    for(new i = 0; i < sizeof botProducts; i++)
    {
        if(botProducts[i][_b_Org] != org) continue;
        new displayPrice = botProducts[i][_b_Price];
        if(staffOnDuty != -1) displayPrice *= 6;
        strcat(string, sprintf("\n%s\t%s\t$%d\t%d%%", ItemTypes[botProducts[i][_b_ItemType]], botProducts[i][_b_Name], displayPrice, botProducts[i][_b_Value2]));
        DynamicGui_AddRow(playerid, i);
    }
    if(staffOnDuty != -1)
    {
        va_SendClientMessage(playerid, COLOR_NEWS, "Uwaga: pracownik restauracji %s jest na służbie — ceny zostały zwiększone x6.", GetNick(staffOnDuty));
    }
    ShowPlayerDialogEx(playerid, D_RESTAURANT_BOT_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Restauracja", string, "Kup", "Zamknij");
    return 1;
}