//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ przedmioty ]-----------------------------------------------//
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

#include <YSI_Coding\y_timers>

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:przedmioty(playerid, params[], help)
{
    if(!gPlayerLogged[playerid]) return 0;
	if(Kajdanki_JestemSkuty[playerid] == 1)
		return sendErrorMessage(playerid, "Nie możesz użyć tej komendy będąc skutym!");
	if(PlayerInfo[playerid][pJailed] != 0)
		return sendErrorMessage(playerid, "Nie możesz użyć tej komendy będąc w więzieniu!"); 
	if(PlayerInfo[playerid][pBW] > 0 || PlayerInfo[playerid][pInjury] > 0)
		return sendErrorMessage(playerid, "Nie możesz użyć tej komendy podczas BW!");
    if(!isnull(params)) 
	{
		if(!strcmp(params, "podnies", true) || !strcmp(params, "podnieś", true) || !strcmp(params, "szukaj", true))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Musisz być pieszo.");
            ProxDetector(10.0, playerid, sprintf("* %s rozgląda się za przedmiotami", GetNick(playerid)), COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			ApplyAnimation(playerid, "PED", "XPRESSscratch", 4.1, 0, 0, 0, 0, 3000, 1);
			defer ListNearItems(playerid);
			return 1;
		}
		new itemid = FindItemByName(playerid, params);
		if(itemid != -1)
			return Item_Use(playerid, itemid);
	}
    if(Iter_Count(PlayerItems[playerid]) < 1) return sendTipMessage(playerid, "Nie posiadasz żadnych przedmiotów.");
	DynamicGui_Init(playerid);
	new items[2048], count = 0, oinfo[248];
	new added[MAX_ITEMS];
	items = "#\tNazwa\tInfo";
	foreach(new x : PlayerItems[playerid]) 
	{
		new itemid = PlayerItem[playerid][x][player_item_id];
		if(itemid == -1) continue;
		if(itemid < 0) continue;
		if(added[itemid]) continue;
		added[itemid] = 1;
		if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID]) continue;

		format(oinfo, sizeof oinfo, "");
		switch(Item[itemid][i_ItemType]) //opisy przedmiotów
		{
			case ITEM_TYPE_WEAPON:
			{
				if(Item[itemid][i_ValueSecret] == 1)
					format(oinfo, sizeof oinfo, " (legalne)");
				else if(Item[itemid][i_ValueSecret] == 0)
					format(oinfo, sizeof oinfo, " (nielegalne)");
				else if(Item[itemid][i_ValueSecret] == 2)
					format(oinfo, sizeof oinfo, " (służbowe)");			
			}
		}
		strcat(items, sprintf("\n%d\t{%s}%s%s x%d\t{000000}(%d, %d)", itemid, (Item[itemid][i_Used]) ? ("f5c242") : ("196e75"), Item[itemid][i_Name], oinfo, Item[itemid][i_Quantity], Item[itemid][i_Value1], Item[itemid][i_Value2]));
		if(Item[itemid][i_ValueSecret] == ITEM_NOT_COUNT)
			count += 1;
		else 
			count += Item[itemid][i_Quantity];
		DynamicGui_AddRow(playerid, itemid);
	}
	ShowPlayerDialogEx(playerid, D_ITEMS, DIALOG_STYLE_TABLIST_HEADERS, sprintf("Przedmioty (%d/%d)", count, (IsPlayerPremiumOld(playerid)) ? (MAX_ITEM_LIMIT_PREMIUM) : (MAX_ITEM_LIMIT)), items, "Dalej", "Zamknij");
    return 1;
}