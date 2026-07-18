//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  pizzaman                                                 //
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
// Autor: AnakinEU
// Data utworzenia: 01.11.2021
//Opis:
/*
	Szmugler
*/

//

//-----------------<[ Funkcje: ]>-------------------
public Czasokradania(playerid)
{
	
	TogglePlayerControllable(playerid, 1);
	ClearAnimations(playerid);
	if(IsPlayerInAnyVehicle(playerid)) 
	{
		OkradanieTira[playerid] = 0;
		return SendClientMessage(playerid, COLOR_BIALY, "[Szmugler] Zgubiles paczke poniewaz byl w pojezdzie, spróbuj ponownie!");
	}
	Kradnie[playerid] = 1;
	ACSzmugler[playerid] = gettime() + 5;
	SendClientMessage(playerid, COLOR_BIALY, "Chris_Harris mowi: Pss, ziomek! Z zawartoscia udaj sie do Las Colinas do opuszczonego domu, ziomek odkupi od ciebie wszystko.");
	return 1;
}

YCMD:sprzedajlombard(playerid, params[])
{
    new idZegarek = HasItemType(playerid, ITEM_TYPE_ZEGAREK);
    new idLancuszek = HasItemType(playerid, ITEM_TYPE_LANCUSZEK);
    new ilosc = strval(params);

    if (!IsPlayerInRangeOfPoint(playerid, 10, 204.41, -157.83, 1000.52))
    {
        SendClientMessage(playerid, COLOR_BIALY, "[Lombard] Nie jestes w miejscu, w ktorym mozna sprzedac rzeczy z lombardu.");
        return 1;
    }

    if (idZegarek == -1 && idLancuszek == -1)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Nie masz zadnego zegarka ani lancuszka!");
        return 1;
    }

    if (ilosc <= 0)
    {
        return sendTipMessage(playerid, "Uzyj: /sprzedajlombard [ilosc]");
    }

    new amountOfturfs = Turf_PlayerTurfCount(playerid);
    if (idZegarek != -1 && Item[idZegarek][i_UID] && Item[idZegarek][i_Owner] == PlayerInfo[playerid][pUID] && Item[idZegarek][i_OwnerType] == ITEM_OWNER_TYPE_PLAYER && Item[idZegarek][i_Quantity] >= ilosc)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Troy_Henny mowi: No dobra, trzymaj tam jakies grosze za zegarek.");
        new finalPrice = 60 * ilosc;
        if(IsPlayerPremiumOld(playerid)) { finalPrice += floatround(finalPrice * 0.1); }
        new h, m, s; gettime(h, m, s);
        if(h >= 18) { finalPrice += floatround(finalPrice * 0.15); }
	    finalPrice += floatround(finalPrice * 0.1 * amountOfturfs);
        DajKase(playerid, finalPrice);
        Item_Delete(idZegarek, true, ilosc);
        return 1;
    }
    
    if (idLancuszek != -1 && Item[idLancuszek][i_UID] &&  Item[idLancuszek][i_Owner] == PlayerInfo[playerid][pUID] && Item[idLancuszek][i_OwnerType] == ITEM_OWNER_TYPE_PLAYER && Item[idLancuszek][i_Quantity] >= ilosc)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Troy_Henny mowi: No dobra, trzymaj tam jakies grosze za lancuszek.");
        new finalPrice = 80 * ilosc;
        if(IsPlayerPremiumOld(playerid)) { finalPrice += floatround(finalPrice * 0.1); }
        new h, m, s; gettime(h, m, s);
        if(h >= 18) { finalPrice += floatround(finalPrice * 0.15); }
	    finalPrice += floatround(finalPrice * 0.1 * amountOfturfs);
        DajKase(playerid, finalPrice);
        Item_Delete(idLancuszek, true, ilosc);
        return 1;
    }

    SendClientMessage(playerid, COLOR_BIALY, "Nie masz wystarczajacej ilosci zegarkow ani lancuszkow!");
    return 1;
}


YCMD:wymienbron(playerid, params[])
{
    new idKAWALEKM4 = HasItemType(playerid, ITEM_TYPE_KAWALEKM4);
    new idKAWALEKAK = HasItemType(playerid, ITEM_TYPE_KAWALEKAK);
    new idKAWALEKSNIPE = HasItemType(playerid, ITEM_TYPE_KAWALEKSNIPE);

    if (!IsPlayerInRangeOfPoint(playerid, 3, 2485.19, -1769.87, 13.54))
    {
        SendClientMessage(playerid, COLOR_BIALY, "[BRON] Nie jestes w miejscu, w ktorym mozna wymieniac bronie.");
        return 1;
    }

    if (idKAWALEKM4 == -1 && idKAWALEKAK == -1 && idKAWALEKSNIPE == -1)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Nie masz zadnego kawalku broni!");
        return 1;
    }

    new totalM4 = PlayerItemTotal(playerid, ITEM_TYPE_KAWALEKM4);
    if (totalM4 >= 15)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Hector_Moreno mowi: No dobra, trzymaj m4 za te kawalki.");

        Item_Add("M4", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
            ITEM_TYPE_WEAPON, WEAPON_M4, 350, true, playerid, 1, 0);

        RemovePlayerItemQuantity(playerid, ITEM_TYPE_KAWALEKM4, 15);
        return 1;
    }

    new totalAK = PlayerItemTotal(playerid, ITEM_TYPE_KAWALEKAK);
    if (totalAK >= 10)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Hector_Moreno mowi: No dobra, trzymaj ak47 za te kawalki.");

        Item_Add("AK47", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
            ITEM_TYPE_WEAPON, WEAPON_AK47, 350, true, playerid, 1, 0);

        RemovePlayerItemQuantity(playerid, ITEM_TYPE_KAWALEKAK, 10);
        return 1;
    }

    new totalSnipe = PlayerItemTotal(playerid, ITEM_TYPE_KAWALEKSNIPE);
    if (totalSnipe >= 20)
    {
        SendClientMessage(playerid, COLOR_BIALY, "Hector_Moreno mowi: No dobra, trzymaj snajperke za te kawalki.");

        Item_Add("Sniper", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
            ITEM_TYPE_WEAPON, WEAPON_SNIPER, 40, true, playerid, 1, 0);

        RemovePlayerItemQuantity(playerid, ITEM_TYPE_KAWALEKSNIPE, 20);
        return 1;
    }

    SendClientMessage(playerid, COLOR_BIALY, "Nie masz wystarczajacej ilosci kawalkow broni!");
    return 1;
}

stock PlayerItemTotal(playerid, itemtype)
{
    new total = 0;
    foreach(new x : PlayerItems[playerid])
    {
        new i = PlayerItem[playerid][x][player_item_id];
        if(i == -1) continue;
        if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER || Item[i][i_Owner] != PlayerInfo[playerid][pUID]) continue;
        if(Item[i][i_ItemType] == itemtype) total += Item[i][i_Quantity];
    }
    return total;
}

stock RemovePlayerItemQuantity(playerid, itemtype, amount)
{
    while(amount > 0)
    {
        new id = HasItemType(playerid, itemtype);
        if(id == -1) return 0;
        new q = Item[id][i_Quantity];
        if(q > amount)
        {
            Item_Delete(id, true, amount);
            return 1;
        }
        else
        {
            Item_Delete(id, true, q);
            amount -= q;
        }
    }
    return 1;
}