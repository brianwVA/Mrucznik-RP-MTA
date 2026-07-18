//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------[ sprzedajprodukt ]-------------------------------------------//
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

YCMD:sprzedajprodukt(playerid, params[], help)
{
    new string[456];
    string = "Produkt\tCena\tIlość";
    if(GroupPlayerDutyPerm(playerid, PERM_RESTAURANT))
    {
        DynamicGui_Init(playerid);
        foreach(new i : Products)
        {
            if(Product[i][p_OrgID] != GetPlayerGroupUID(playerid, OnDuty[playerid]-1)) continue;
            strcat(string, sprintf("\n%s\t{00FF00}${FFFFFF}%d\t%d", Product[i][p_ProductName], Product[i][p_Price], Product[i][p_Quant]));
            DynamicGui_AddRow(playerid, i);
        }
        if(strlen(string) < 22) return sendErrorMessage(playerid, "Ta grupa nie posiada żadnych produktów.");
        ShowPlayerDialogEx(playerid, D_PRODUCTS_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Panel sprzedaży", string, "Sprzedaj", "Zamknij");
    }
    else return sendTipMessage(playerid, "Nie jesteś na służbie grupy, która ma dostęp do tej komendy.");
    return 1;
}