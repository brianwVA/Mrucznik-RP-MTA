//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                 przedmioty                                                //
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
// Autor: renosk
// Data utworzenia: 06.05.2021
//Opis:
/*
	System przedmiotów
*/

//

#if !defined MRP_LEGACY_HOUSES
#include "house/house.hwn"
#endif
#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------

hook OnPlayerConnect(playerid)
{
	for(new i = 0; i < MAX_ITEM_LIMIT_GENERAL_PREMIUM; i++)
	{
		PlayerItem[playerid][i][player_item_id] = -1;
	}
	Iter_Clear(PlayerItems[playerid]);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(Iter_Count(PlayerItems[playerid]) > 0 && gPlayerLogged[playerid])
	{
		foreach(new x : PlayerItems[playerid])
		{
			new itemid = PlayerItem[playerid][x][player_item_id];
			if(itemid == -1) continue;
			SaveItem(itemid);
		}
	}
	foreach(new i : PlayerItems[playerid])
	{
		Memory_ClearItemForPlayer(playerid, i, true);
	}
	return 1;
}

hook OnGameModeInit()
{ 
	Iter_Init(PlayerItems);
	return 1;
}

hook OnGameModeExit()
{
	SaveItems();
	return 1;
}

hook OnPlayerDeath(playerid, reason)
{
	return 1;
}

hook OnPlayerSpawn(playerid)
{
	return 1;
}

hook OnPlayerEditAttachedObj(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(!PlayerInfo[playerid][pAttached][index]) return 0;
	new Float:x, Float:y, Float:z, Cache:result;
	GetPlayerPos(playerid, x, y, z);
	if(!CheckEditionBoundaries(playerid, fOffsetX, fOffsetY, fOffsetZ, fScaleX, fScaleY, fScaleZ)){
		EditAttachedObject(playerid, index);
		return -2;
	}
	if(response)
	{
		result = mysql_query_format("SELECT `UID` FROM `mru_attached` WHERE `UID` = '%d'", PlayerInfo[playerid][pAttached][index]);
		if(cache_num_rows())
		{
			mysql_tquery_format("UPDATE `mru_attached` SET `UID` = '%d', `x` = '%f', `y` = '%f', `z` = '%f', `rx` = '%f', `ry` = '%f', `rz` = '%f', `sx` = '%f', `sy` = '%f', `sz` = '%f' WHERE `UID` = '%d'", PlayerInfo[playerid][pAttached][index],
			fOffsetX,
			fOffsetY,
			fOffsetZ,
			fRotX,
			fRotY,
			fRotZ,
			fScaleX,
			fScaleY,
			fScaleZ,
			PlayerInfo[playerid][pAttached][index]);
		}
		else
		{
			mysql_tquery_format("INSERT INTO `mru_attached` SET `UID` = '%d', `x` = '%f', `y` = '%f', `z` = '%f', `rx` = '%f', `ry` = '%f', `rz` = '%f', `sx` = '%f', `sy` = '%f', `sz` = '%f'", PlayerInfo[playerid][pAttached][index],
			fOffsetX,
			fOffsetY,
			fOffsetZ,
			fRotX,
			fRotY,
			fRotZ,
			fScaleX,
			fScaleY,
			fScaleZ);
		}
		cache_delete(result);
		SetPVarInt(playerid, "Editing-AttachedObject", 0);
		SetPlayerAttachedObject(playerid, index, modelid, boneid, 
				fOffsetX, fOffsetY, fOffsetZ, 
				fRotX, fRotY, fRotZ, 
				fScaleX, fScaleY, fScaleZ
		);
		return sendTipMessage(playerid, "Pozycja została zapisana.");
	}
	else
		SetPlayerAttachedObject(playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new selected = GetPVarInt(playerid, "Selected-Item");
	switch(dialogid)
	{
		case D_BAG_PUT_ITEM_QUANT:
		{
			new itemid = GetPVarInt(playerid, "item-bags:itemid"), bagid = GetPVarInt(playerid, "item-bags:bagid");
			if(!response) return ItemBags_PutItemDialog(playerid, bagid);
			if(!Iter_Contains(Items, itemid) || !Iter_Contains(Items, bagid)) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotów.");

			if(Item[itemid][i_ItemType] == ITEM_TYPE_WEAPON) return sendTipMessage(playerid, "Nie możesz schować broni do plecaka.");

			ItemBags_PutItemInBag(playerid, itemid, bagid, strval(inputtext));
			RunCommand(playerid, "me", "wkłada coś do plecaka");
		}
		case D_BAG_PUT_ITEM:
		{
			new itemid = DynamicGui_GetValue(playerid, listitem), bagid = DynamicGui_GetDialogValue(playerid);
			if(!response) return ItemBags_ShowBag(playerid, bagid);
			if(!Iter_Contains(Items, itemid) || !Iter_Contains(Items, bagid)) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotów.");

			if(Item[itemid][i_ItemType] == ITEM_TYPE_WEAPON) return sendTipMessage(playerid, "Nie możesz schować broni do plecaka.");

			if(Item[itemid][i_Quantity] > 1) //quant
			{
				ShowPlayerDialogEx(playerid, D_BAG_PUT_ITEM_QUANT, DIALOG_STYLE_INPUT, Item[bagid][i_Name], sprintf("Podaj, ile przedmiotów tego typu chcesz wyciągnąć z plecaka.\nAktualnie w plecaku znajduje się {FFFFFF}%s x%d", Item[itemid][i_Name], Item[itemid][i_Quantity]), "Weź", "Wróć");
				SetPVarInt(playerid, "item-bags:itemid", itemid);
				SetPVarInt(playerid, "item-bags:bagid", bagid);
				return 1;
			}
			ItemBags_PutItemInBag(playerid, itemid, bagid);
			RunCommand(playerid, "me", "wkłada coś do plecaka");
		}
		case D_BAG_GET_ITEM_QUANT:
		{
			new itemid = GetPVarInt(playerid, "item-bags:itemid"), bagid = GetPVarInt(playerid, "item-bags:bagid");
			if(!response) return ItemBags_ShowBag(playerid, bagid);
			if(!Iter_Contains(Items, itemid) || !Iter_Contains(Items, bagid)) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			if(Item[itemid][i_Owner] != Item[bagid][i_UID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_BAG) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotów.");

			ItemBags_GetItemFromBag(playerid, itemid, bagid, strval(inputtext));
			RunCommand(playerid, "me", "wyjmuje coś z plecaka");
		}
		case D_BAG_ITEMS:
		{
			if(!response) return 1;
			new itemid = DynamicGui_GetValue(playerid, listitem), bagid = DynamicGui_GetDialogValue(playerid);
			if(itemid == -1234) //schowaj przemdiot
			{
				ItemBags_PutItemDialog(playerid, bagid);
				return 1;
			}
			if(!Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem uid przedmiotów.");
			if(Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_BAG || Item[itemid][i_Owner] != Item[bagid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotów.");
			
			if(Item[itemid][i_Quantity] > 1) //quant
			{
				ShowPlayerDialogEx(playerid, D_BAG_GET_ITEM_QUANT, DIALOG_STYLE_INPUT, Item[bagid][i_Name], sprintf("Podaj, ile przedmiotów tego typu chcesz wyciągnąć z plecaka.\nAktualnie w plecaku znajduje się {FFFFFF}%s x%d", Item[itemid][i_Name], Item[itemid][i_Quantity]), "Weź", "Wróć");
				SetPVarInt(playerid, "item-bags:itemid", itemid);
				SetPVarInt(playerid, "item-bags:bagid", bagid);
				return 1;
			}
			ItemBags_GetItemFromBag(playerid, itemid, bagid);
			RunCommand(playerid, "me", "wyjmuje coś z plecaka");
		}
		case D_ITEMS:
		{
			if(!response) return 1;
			//new itemid = PlayerItem[playerid][Iter_Index(PlayerItems[playerid], listitem)][player_item_id];
			new itemid = DynamicGui_GetValue(playerid, listitem);

			if(!Item[itemid][i_UID] || Item[itemid][i_Owner] != PlayerInfo[playerid][pUID]) return sendTipMessage(playerid, "Coś poszło nie tak.");
			SetPVarInt(playerid, "Selected-Item", itemid);
			ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[itemid][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij");
		}
		case D_ITEM_OPTIONS:
		{
			if(!response) { RunCommand(playerid, "przedmioty", ""); return SetPVarInt(playerid, "Selected-Item", -1); }
			selected = GetPVarInt(playerid, "Selected-Item");
			if(!Item[selected][i_UID]) return sendTipMessage(playerid, "Coś poszło nie tak.");
			switch(listitem)
			{
				case 0: //użyj
					Item_Use(playerid, selected);
				case 1: //wyrzuć
					Item_Drop(playerid, selected);
				case 2: //zniszcz
				{
					if(Item[selected][i_Quantity] <= 1)
						Item_Destroy(playerid, selected, 1);
					else
						ShowPlayerDialogEx(playerid, D_ITEM_DESTROY_QUANTITY, DIALOG_STYLE_INPUT, "Przedmioty - Wyrzucanie przedmiotów", sprintf("Ile przedmiotów tego typu chcesz zniszczyć? (max: %d)", Item[selected][i_Quantity]), "Zniszcz", "Cofnij");
				}
				case 3: //daj
				{
					if(Item[selected][i_Quantity] > 1) return ShowPlayerDialogEx(playerid, D_ITEM_GIVE_QUANT, DIALOG_STYLE_INPUT, "Oferowanie przedmiotu - ilość", sprintf("Ile przedmiotów tego typu chcesz zaoferować? (max: %d)", Item[selected][i_Quantity]), "Dalej", "Zamknij");
					else
					{
						DynamicGui_Init(playerid);
						new string[728];
						foreach(new i : Player) 
						{
							if(GetPlayerState(i) == PLAYER_STATE_SPECTATING) continue;
							if(GetDistanceBetweenPlayers(playerid, i) < 5 && i != playerid)  {
								strcat(string, sprintf("\n(%d) %s", i, GetNick(i)));
								DynamicGui_AddRow(playerid, 1, i);
							}
						}
						if(strlen(string) < 1) return sendTipMessage(playerid, "Brak graczy w pobliżu.");
						ShowPlayerDialogEx(playerid, D_ITEM_GIVE, DIALOG_STYLE_LIST, sprintf("Oferowanie przedmiotu %s (%d)", Item[selected][i_Name], selected), string, "Daj", "Wyjdź");
					}
				}
				case 4: //info
				{
					new str[300];
					format(str, sizeof str, "\
					{ffffff}Typ: {00ff00}%s \
					\n{ffffff}Nazwa: {00ff00}%s \
					\n{ffffff}UID: {00ff00}%d \
					\n{ffffff}Server-ID: {00ff00}%d \
					\n{ffffff}Value1: {00ff00}%d \
					\n{ffffff}Value2: {00ff00}%d \
					\n{ffffff}Ilość: {00ff00}%d \
					\n{ffffff}Jest w bazie danych: %s",
					ItemTypes[Item[selected][i_ItemType]],
					Item[selected][i_Name],
					Item[selected][i_UID],
					selected,
					Item[selected][i_Value1],
					Item[selected][i_Value2],
					Item[selected][i_Quantity],
					(Item[selected][i_UID] >= 555511) ? ("{ff0000}Nie") : ("{00ff00}Tak"));
					ShowPlayerInfoDialog(playerid, "Informacja", str);
				}
			}
		}
		case D_ITEM_GIVE_QUANT:
		{
			if(!response) return ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[selected][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij");
			new quant = strval(inputtext);
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > Item[selected][i_Quantity]) {
				ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[selected][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij");\
				return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			}
			SetPVarInt(playerid, "g_quantity", quant);
			DynamicGui_Init(playerid);
			new string[728];
			foreach(new i : Player) 
			{
				if(GetPlayerState(i) == PLAYER_STATE_SPECTATING) continue;
				if(GetDistanceBetweenPlayers(playerid, i) < 5 && i != playerid)  {
					strcat(string, sprintf("\n(%d) %s", i, GetNick(i)));
					DynamicGui_AddRow(playerid, 1, i);
				}
			}
			if(strlen(string) < 1) return sendTipMessage(playerid, "Brak graczy w pobliżu.");
			ShowPlayerDialogEx(playerid, D_ITEM_GIVE, DIALOG_STYLE_LIST, sprintf("Oferowanie przedmiotu %s x%d (%d)", Item[selected][i_Name], quant, selected), string, "Daj", "Wyjdź");
		}
		case D_ITEM_DESTROY_QUANTITY:
		{
			if(!response) return ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[selected][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij");
			new quantity = strval(inputtext);
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quantity < 1 || quantity > Item[selected][i_Quantity]) {ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[selected][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij"); return sendErrorMessage(playerid, "Nieprawidłowa ilość!");}

			if(quantity > 4) {SetPVarInt(playerid, "d_quantity", quantity); return ShowPlayerDialogEx(playerid, D_ITEM_DESTROY_QUANTITY_2, DIALOG_STYLE_MSGBOX, "Przedmiot - Wyrzucanie przedmiotu", sprintf("Czy na pewno chcesz wyrzucić %dx %s? Ta akcja jest nieodwracalna!", quantity, Item[selected][i_Name]), "Akceptuj", "Odrzuć");}
			DeletePVar(playerid, "d_quantity");
			Item_Destroy(playerid, selected, 1, quantity);
		}
		case D_ITEM_DESTROY_QUANTITY_2:
		{
			if(!response) return ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[selected][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij");
			new quantity = GetPVarInt(playerid, "d_quantity");
			if(quantity < 1 || quantity > Item[selected][i_Quantity]) {sendTipMessage(playerid, "Coś poszło nie tak."); return ShowPlayerDialogEx(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, sprintf("Przedmiot %s", Item[selected][i_Name]), "1.	Użyj\n2.	Wyrzuć\n3.	Zniszcz\n4.	Daj\n5.	Informacje o przedmiocie", "Akcja", "Zamknij");}

			DeletePVar(playerid, "d_quantity");
			Item_Destroy(playerid, selected, 1, quantity);
		}
		case D_ITEM_GIVE:
		{
			if(!response) return 1;
			new giveplayerid = DynamicGui_GetDataInt(playerid, listitem), quant = GetPVarInt(playerid, "g_quantity");
			if(!IsPlayerConnected(giveplayerid)) return sendTipMessage(playerid, "Gracz nie istnieje.");
			if(!Item[selected][i_UID]) return sendTipMessage(playerid, "Przedmiot nie istnieje.");
			if(!CanGive(playerid, Item[selected][i_ItemType], selected)) return sendTipMessage(playerid, "Nie możesz dać tego przedmiotu.");
			if(IsPlayerConnected(GetPVarInt(giveplayerid, "Offer-ID"))) return sendTipMessage(playerid, "Ten gracz ma już aktywną ofertę.");
			if(quant <= 0) quant = 1;
			
			Item_Offer(selected, playerid, giveplayerid, quant);
		}
		case D_ITEM_OFFER:
		{
			new itemid = GetPVarInt(playerid, "Offer-ItemID"), p = GetPVarInt(playerid, "Offer-ID"), q = GetPVarInt(playerid, "Offer-Quant");
			if(!response) {
				SendClientMessage(p, COLOR_PANICRED, "Oferta została odrzucona.");
				SetPVarInt(playerid, "Offer-ID", INVALID_PLAYER_ID);
				SetPVarInt(playerid, "Offer-ItemID", -1);
				SetPVarInt(playerid, "Offer-Quant", 0);
				SetPVarInt(p, "Offering-ItemID", -1);
				return 1;
			}
			new realquant = q;
			if(Item[itemid][i_ValueSecret] == ITEM_NOT_COUNT)
				realquant = 1;
			if(!Item[itemid][i_UID] || GetPVarInt(playerid, "Offer-ID") == INVALID_PLAYER_ID || !IsPlayerConnected(p) || Item_Count(playerid)+realquant >= GetPlayerItemLimit(playerid) || q < 1) {SetPVarInt(p, "Offering-ItemID", -1); return Item_FailOffer(playerid);}
			if(Item[itemid][i_Owner] != PlayerInfo[GetPVarInt(playerid, "Offer-ID")][pUID] || !Item[itemid][i_UID] || q > Item[itemid][i_Quantity]) {SetPVarInt(p, "Offering-ItemID", -1); return Item_FailOffer(playerid);}

			SendClientMessage(p, COLOR_LIGHTGREEN, "Oferta została zaakceptowana.");
			SendClientMessage(playerid, COLOR_NEWS, "Przedmiot został dodany do twojego ekwipunku.");
			if(IsItemConsumable(Item[itemid][i_ItemType])) SendClientMessage(playerid, COLOR_NEWS, sprintf("Aby go użyć wpisz /p %s", Item[itemid][i_Name]));
			SetPVarInt(playerid, "Offer-ID", INVALID_PLAYER_ID);
			SetPVarInt(playerid, "Offer-ItemID", -1);
			SetPVarInt(playerid, "Offering-ItemID", -1);

			if(Item[itemid][i_Quantity] == q)
			{
				Log(itemLog, WARNING, "%s dostaje przedmiot %s od %s", GetPlayerLogName(playerid), GetItemLogName(itemid), GetPlayerLogName(p));
				
				if(Item[itemid][i_ItemType] != ITEM_TYPE_BAG)
				{
					new has = HasItemType(playerid, Item[itemid][i_ItemType]);
					if(has != -1)
					{
						if(!strcmp(Item[has][i_Name], Item[itemid][i_Name], true) && Item[has][i_Value1] == Item[itemid][i_Value1] && Item[has][i_Value2] == Item[itemid][i_Value2] && Item[has][i_ValueSecret] == Item[itemid][i_ValueSecret])
						{
							Item[has][i_Quantity] += Item[itemid][i_Quantity];
							Item_Delete(itemid, true, Item[itemid][i_Quantity]);
							return 1;
						}
					}
				}
				new newid = Iter_Free(PlayerItems[playerid]);
				if(newid == -1) return 0;
				Memory_ClearItemForPlayer(p, Memory_GetPlayerItemSlot(p, itemid), false);
				Iter_Add(PlayerItems[playerid], newid);
				PlayerItem[playerid][newid][player_item_id] = itemid;
				Item[itemid][i_Owner] = PlayerInfo[playerid][pUID];
				Item[itemid][i_Used] = 0;
				if(Item[itemid][i_ItemType] == ITEM_TYPE_ATTACH && Item[itemid][i_Used] && IsPlayerAttachedObjectSlotUsed(playerid, Item[itemid][i_tmpValue]))
					RemovePlayerAttachedObject(p, Item[itemid][i_tmpValue]);
				else if(Item[itemid][i_ItemType] == ITEM_TYPE_SKIN && Item[itemid][i_Used]) 
					SetPlayerSkin(p, PlayerInfo[p][pSkin]);
				SaveItem(itemid);
			}
			else
			{
				new id = Item_Add(Item[itemid][i_Name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], Item[itemid][i_ItemType], Item[itemid][i_Value1], Item[itemid][i_Value2], true, playerid, q, Item[itemid][i_ValueSecret]);
				Log(itemLog, WARNING, "%s dostaje przedmiot %s (x%d) od %s", GetPlayerLogName(playerid), GetItemLogName(id), q, GetPlayerLogName(p));
				Item[itemid][i_Quantity] -= q;
				if(Item[itemid][i_Quantity] <= 0) Item_Delete(itemid);
			}

		}
		case D_ITEM_PICKUP:
		{
			if(!response) return 1;
			new itemid = DynamicGui_GetDataInt(playerid, listitem);
			if(!Item[itemid][i_UID]) return sendTipMessage(playerid, "Przedmiot nie istnieje.");
			if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Musisz być pieszo.");
			if(Item[itemid][i_Quantity] > 1)
			{
				SetPVarInt(playerid, "d_pickup", itemid);
				ShowPlayerDialogEx(playerid, D_ITEM_PICKUP_QUANTITY, DIALOG_STYLE_INPUT, "Przedmioty - Podnoszenie przedmiotów", sprintf("Ile przedmiotów tego typu chcesz podnieść? (max: %d)", Item[itemid][i_Quantity]), "Podnieś", "Zamknij");
			}
			else Item_Pickup(playerid, itemid, 65535);
		}
		case D_ITEM_PICKUP_QUANTITY:
		{
			if(!response) return 1;
			new quantity = strval(inputtext), itemid = GetPVarInt(playerid, "d_pickup");
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quantity<1) return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			if(quantity > Item[itemid][i_Quantity]) return sendErrorMessage(playerid, sprintf("Za duża ilość! (max: %d)", Item[itemid][i_Quantity]));
			if(!Item[itemid][i_UID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_DROPPED || Item[itemid][i_Quantity] < 1) return sendErrorMessage(playerid, "Ten przedmiot został już przez kogoś podniesiony!"); //zabezpieczenie przed kopiowaniem przedmiotow
			Item_Pickup(playerid, itemid, quantity);
		}

		//telefon

		case D_TRANSFER_NUMBER:
		{
			if(!response) return PhoneError(playerid, false);
			new itemid = DynamicGui_GetDialogValue(playerid);
			if(!Item[itemid][i_UID]) return PhoneError(playerid, false, "Coś poszło nie tak.");
			
		}

		case D_PHONE_PANEL:
		{
			if(!response) return PhoneError(playerid, false);
			new itemid = DynamicGui_GetDialogValue(playerid);
			if(!Item[itemid][i_UID]) return PhoneError(playerid, false, "Coś poszło nie tak.");
			if(listitem==0||listitem==1||listitem==2) if(!Item[itemid][i_Used]) return PhoneError(playerid, true, "Najpierw musisz włączyć telefon!");

			switch(listitem)
			{
				case 0:
					return ShowPlayerDialogEx(playerid, D_PHONE_CALL, DIALOG_STYLE_INPUT, "Telefon - Zadzwoń", "Podaj numer na który chcesz zadzwonić.", "Dzwoń", "Zamknij");
				case 1:
					return ShowPlayerDialogEx(playerid, D_SMS_NUMBER, DIALOG_STYLE_INPUT, "Telefon - Wyślij SMS", "Podaj numer na który chcesz wysłać SMS.", "Dalej", "Wyjdź");
				case 2:
					return PhoneError(playerid, true, "Użyj: /przelew_telefon");
					//return ShowPlayerDialogEx(playerid, D_TRANSFER_NUMBER, DIALOG_STYLE_INPUT, "Telefon - Przelew na telefon", "Podaj numer na który chcesz wysłać przelew.", "Dalej", "Wyjdź");
				case 3:
				{
					Item[itemid][i_Used] = !Item[itemid][i_Used];
					MSGBOX_Show(playerid, sprintf("Telefon %s", ( Item[itemid][i_Used]) ? ("~g~Wlaczony") : ("~r~Wylaczony") ), MSGBOX_ICON_TYPE_OK);
					PhoneError(playerid, false);
				}
			}
		}
		case D_PHONE_CALL:
		{
			if(!response) return PhoneError(playerid, false);
			new itemid = DynamicGui_GetDialogValue(playerid);
			if(!Item[itemid][i_UID]) return PhoneError(playerid, false, "Coś poszło nie tak.");
			if(!IsNumeric(inputtext)) return PhoneError(playerid, true, "Nieprawidłowy numer telefonu.");
			if(Item[itemid][i_Value1] < 1) return PhoneError(playerid, false, "Twój numer telefonu jest niepoprawny.");

			new number = strval(inputtext);

			PhoneCall(Item[itemid][i_Value1], number, playerid);
		}
		case D_SMS_NUMBER:
		{
			if(Mobile[playerid] != INVALID_PLAYER_ID || GetPVarInt(playerid, "budka-Mobile") != 999)
				return PhoneError(playerid, false, "Dzwonisz już do kogoś...");
			new itemid = DynamicGui_GetDialogValue(playerid);
			if(!response) return PhoneError(playerid);
			if(!Item[itemid][i_UID]) return PhoneError(playerid, false, "Coś poszło nie tak.");
			if(!IsNumeric(inputtext)) return PhoneError(playerid, true, "Nieprawidłowy numer telefonu.");
			if(Item[itemid][i_Value1] < 1) return PhoneError(playerid, false, "Twój numer telefonu jest niepoprawny.");

			new number = strval(inputtext), p;
			if(number < 1) return PhoneError(playerid, true, "Nieprawidłowy numer telefonu.");
			
			SetPVarInt(playerid, "SMS-Number", number);
			if(IsSystemNumber(number)) return ShowPlayerDialogEx(playerid, D_SMS_SEND, DIALOG_STYLE_INPUT, "Telefon - Wyślij SMS", "Podaj treść wiadomości.", "Wyślij", "Zamknij");
			
			p = GetPlayerIDByPhone(number);
			if(p == playerid)
				return PhoneError(playerid, true, "Nie możesz wysłać wiadomości samemu sobie!");
			Mobile[playerid] = p;

			ShowPlayerDialogEx(playerid, D_SMS_SEND, DIALOG_STYLE_INPUT, "Telefon - Wyślij SMS", "Podaj treść wiadomości.", "Wyślij", "Zamknij");
		}
		case D_SMS_SEND:
		{
			new itemid = DynamicGui_GetDialogValue(playerid), number = GetPVarInt(playerid, "SMS-Number");
			if(!response) {Mobile[playerid] = INVALID_PLAYER_ID; return PhonePanel(playerid, itemid);}
			if(!Item[itemid][i_UID]) {Mobile[playerid] = INVALID_PLAYER_ID; return PhoneError(playerid, false, "Coś poszło nie tak.");}
			if(Item[itemid][i_Value1] < 1) {Mobile[playerid] = INVALID_PLAYER_ID; return PhoneError(playerid, false, "Twój numer telefonu jest niepoprawny.");}
			if(number < 1) {Mobile[playerid] = INVALID_PLAYER_ID; PhonePanel(playerid, itemid); return PhoneError(playerid, false, "Nieprawidłowy numer telefonu.");}
			if(!IsPlayerConnected(Mobile[playerid]) || !gPlayerLogged[Mobile[playerid]]) {Mobile[playerid] = INVALID_PLAYER_ID; return PhoneError(playerid, false, "*** Wiadomość nie mogła zostać wysłana. ***");}
			
			PhoneSms(playerid, Mobile[playerid], Item[itemid][i_Value1], number, inputtext);
		}

		//bagazniki

		case D_ITEM_VEHICLE_ITEMS:
		{
			new vehicleid = GetPVarInt(playerid, "bagaznik-id");
			if(!IsValidVehicle(vehicleid) || GetClosestCar(playerid) != vehicleid) return 1;
			if(!response)
			{
				DeletePVar(playerid, "bagaznik-id");
				SetTrunkState(playerid, vehicleid, 0);
				return 1;
			}
			
			new dg_value = DynamicGui_GetValue(playerid, listitem);
			if(dg_value == -1) //Schowaj
			{
				new string[1024];
				DynamicGui_Init(playerid);
				foreach(new x : PlayerItems[playerid])
				{
					new i = PlayerItem[playerid][x][player_item_id];
					if(i == -1) continue;
					if(!Item[i][i_UID] || Item[i][i_Owner] != PlayerInfo[playerid][pUID]) continue;
					if(!CanGive(playerid, Item[i][i_ItemType], i)) continue;
					format(string, sizeof(string), "%s\n(%d) %s (x%d)", string, i, Item[i][i_Name], Item[i][i_Quantity]);
					DynamicGui_AddRow(playerid, i);
				}
				if(isnull(string)) {
					SetTrunkState(playerid, vehicleid, 0);
					return sendTipMessage(playerid, "Nie posiadasz żadnych przedmiotów!");
				}
				ShowPlayerDialogEx(playerid, D_TRUNK_ITEMS, DIALOG_STYLE_LIST, MruTitle("Schowaj przedmiot"), string, "Schowaj", "Zamknij");
				return 1;
			}
			//Wyciąganie przedmiotów
			if(!Iter_Contains(Items, dg_value) || dg_value < 0) 
				return sendErrorMessage(playerid, "Ten przedmiot nie istnieje.");
			if(!IsValidVehicle(vehicleid) || GetClosestCar(playerid) != vehicleid)
				return 1;

			new vehicleUID = CarData[VehicleUID[vehicleid][vUID]][c_UID];
			if(vehicleUID == 0)
				return sendErrorMessage(playerid, "Ten pojazd nie istnieje.");

			if(Item[dg_value][i_OwnerType] != ITEM_OWNER_TYPE_VEHICLE || Item[dg_value][i_Owner] != vehicleUID)
				return sendErrorMessage(playerid, "Coś poszło nie tak.");

			if(Item[dg_value][i_Quantity] > 1 && Item[dg_value][i_ValueSecret] != ITEM_NOT_COUNT)
			{
				ShowPlayerDialogEx(playerid, D_TRUNK_GET_ITEM_QUANT, DIALOG_STYLE_INPUT, "Bagażnik - Wyciąganie", 
					sprintf("Podaj, ile przedmiotów tego typu chcesz wyciągnąć z bagażnika.\nAktualnie w bagażniku znajduje się {FFFFFF}%s x%d", Item[dg_value][i_Name], Item[dg_value][i_Quantity]), 
					"Wyciągnij", "Wróć");
				SetPVarInt(playerid, "trunk-get:itemid", dg_value);
				SetPVarInt(playerid, "trunk-get:vehicleid", vehicleid);
				return 1;
			}

			new item_quantity = (Item[dg_value][i_ValueSecret] == ITEM_NOT_COUNT) ? 1 : Item[dg_value][i_Quantity];
			if(Item[dg_value][i_ItemType] != ITEM_TYPE_MATS && (Item_Count(playerid) + item_quantity) > GetPlayerItemLimit(playerid))
			{
				SetTrunkState(playerid, vehicleid, 0, false);
				DeletePVar(playerid, "bagaznik-id");
				return sendErrorMessage(playerid, sprintf("Nie pomieścisz tylu przedmiotów w swoim ekwipunku. (%d/%d)", Item_Count(playerid) + item_quantity, GetPlayerItemLimit(playerid)));
			}
			Item_SetOwner(dg_value, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID]);
			SetTrunkState(playerid, vehicleid, 0, false);
			DeletePVar(playerid, "bagaznik-id");
			RunCommand(playerid, "ja", sprintf("wyciąga przedmiot %s z bagażnika", Item[dg_value][i_Name]));
		}	
		case D_TRUNK_ITEMS:
		{
			if(!response)
			{
				new vehicleid = GetPVarInt(playerid, "bagaznik-id");
				DeletePVar(playerid, "bagaznik-id");
				SetTrunkState(playerid, vehicleid, 0, false);
				return 1;
			}
			new itemid = DynamicGui_GetValue(playerid, listitem), vehicleid = GetPVarInt(playerid, "bagaznik-id");
			if(!IsValidVehicle(vehicleid) || GetClosestCar(playerid) != vehicleid) return 1;
			if(!Item[itemid][i_UID]) return 1;
			if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER)
				return sendErrorMessage(playerid, "Ten przedmiot nie należy do Ciebie!");
			new vehicleUID = CarData[VehicleUID[vehicleid][vUID]][c_UID];
			if(vehicleUID == 0)
				return sendErrorMessage(playerid, "Ten pojazd nie istnieje.");

			if(BagaznikCount(vehicleUID) >= MAX_VEHICLE_ITEMS)
			{
				SetTrunkState(playerid, vehicleid, 0, false);
				DeletePVar(playerid, "bagaznik-id");
				return sendErrorMessage(playerid, sprintf("W tym bagazniku nie zmiesci sie wiecej przedmiotow. (%d/%d)", BagaznikCount(vehicleUID), MAX_VEHICLE_ITEMS));
			}

			if(Item[itemid][i_Quantity] > 1)
			{
				ShowPlayerDialogEx(playerid, D_TRUNK_PUT_ITEM_QUANT, DIALOG_STYLE_INPUT, "Bagaznik - Schowaj", 
					sprintf("Podaj, ile przedmiotów tego typu chcesz schować do bagażnika.\nAktualnie posiadasz {FFFFFF}%s x%d", Item[itemid][i_Name], Item[itemid][i_Quantity]), 
					"Schowaj", "Wróć");
				SetPVarInt(playerid, "trunk-put:itemid", itemid);
				SetPVarInt(playerid, "trunk-put:vehicleid", vehicleid);
				return 1;
			}	

			Item_SetOwner(itemid, ITEM_OWNER_TYPE_VEHICLE, vehicleUID);
			SetTrunkState(playerid, vehicleid, 0, false);
			RunCommand(playerid, "ja", sprintf("chowa przedmiot %s do bagażnika", Item[itemid][i_Name]));
			DeletePVar(playerid, "bagaznik-id");
		}
		case D_TRUNK_GET_ITEM_QUANT:
		{
			new itemid = GetPVarInt(playerid, "trunk-get:itemid"), vehicleid = GetPVarInt(playerid, "trunk-get:vehicleid");
			if(!response)
			{
				DeletePVar(playerid, "bagaznik-id");
				SetTrunkState(playerid, vehicleid, 0, false);
				return 1;
			}
			if(!IsValidVehicle(vehicleid) || GetClosestCar(playerid) != vehicleid) return 1;
			if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			
			new vehicleUID = CarData[VehicleUID[vehicleid][vUID]][c_UID];
			if(vehicleUID == 0) return sendErrorMessage(playerid, "Ten pojazd nie istnieje.");
			if(Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_VEHICLE || Item[itemid][i_Owner] != vehicleUID) 
				return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotu.");
			
			new quant = strval(inputtext);
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > Item[itemid][i_Quantity])
			{
				RunCommand(playerid, "bagaznik", "");
				return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			}
			
			if(Item[itemid][i_ItemType] != ITEM_TYPE_MATS && (Item_Count(playerid) + quant) > GetPlayerItemLimit(playerid))
			{
				SetTrunkState(playerid, vehicleid, 0, false);
				DeletePVar(playerid, "bagaznik-id");
				return sendErrorMessage(playerid, sprintf("Nie pomieścisz tylu przedmiotów w swoim ekwipunku. (%d/%d)", Item_Count(playerid) + quant, GetPlayerItemLimit(playerid)));
			}
			
			if(quant == Item[itemid][i_Quantity])
			{
				Item_SetOwner(itemid, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID]);
			}
			else
			{
				new newid = Item_Add(Item[itemid][i_Name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], Item[itemid][i_ItemType], 
					Item[itemid][i_Value1], Item[itemid][i_Value2], true, playerid, quant, Item[itemid][i_ValueSecret]);
				Item[itemid][i_Quantity] -= quant;
				SaveItem(itemid);
				Log(itemLog, INFO, "%s wyciąga przedmiot %s (x%d) z bagażnika i tworzy nowy przedmiot %s", GetPlayerLogName(playerid), GetItemLogName(itemid), quant, GetItemLogName(newid));
			}
			
			SetTrunkState(playerid, vehicleid, 0, false);
			DeletePVar(playerid, "bagaznik-id");
			RunCommand(playerid, "ja", sprintf("wyciąga przedmiot %s (x%d) z bagażnika", Item[itemid][i_Name], quant));
		}
		
		case D_TRUNK_PUT_ITEM_QUANT:
		{
			new itemid = GetPVarInt(playerid, "trunk-put:itemid"), vehicleid = GetPVarInt(playerid, "trunk-put:vehicleid");
			if(!response)
			{
				DeletePVar(playerid, "bagaznik-id");
				SetTrunkState(playerid, vehicleid, 0, false);
				return 1;
			}
			if(!IsValidVehicle(vehicleid) || GetClosestCar(playerid) != vehicleid) return 1;
			if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER) 
				return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotu.");
			
			new vehicleUID = CarData[VehicleUID[vehicleid][vUID]][c_UID];
			if(vehicleUID == 0) return sendErrorMessage(playerid, "Ten pojazd nie istnieje.");
			
			new quant = strval(inputtext);
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > Item[itemid][i_Quantity])
			{
				RunCommand(playerid, "bagaznik", "");
				return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			}
			
			if(BagaznikCount(vehicleUID) >= MAX_VEHICLE_ITEMS)
			{
				SetTrunkState(playerid, vehicleid, 0, false);
				DeletePVar(playerid, "bagaznik-id");
				return sendErrorMessage(playerid, sprintf("W tym bagażniku nie zmieści się więcej przedmiotów. (%d/%d)", BagaznikCount(vehicleUID), MAX_VEHICLE_ITEMS));
			}
			
			if(quant == Item[itemid][i_Quantity])
			{
				Item_SetOwner(itemid, ITEM_OWNER_TYPE_VEHICLE, vehicleUID);
			}
			else
			{
				new newid = Item_Add(Item[itemid][i_Name], ITEM_OWNER_TYPE_VEHICLE, vehicleUID, Item[itemid][i_ItemType], 
					Item[itemid][i_Value1], Item[itemid][i_Value2], true, INVALID_PLAYER_ID, quant, Item[itemid][i_ValueSecret]);
				Item[itemid][i_Quantity] -= quant;
				SaveItem(itemid);
				Log(itemLog, INFO, "%s chowa przedmiot %s (x%d) do bagażnika i tworzy nowy przedmiot %s", GetPlayerLogName(playerid), GetItemLogName(itemid), quant, GetItemLogName(newid));
			}
			
			SetTrunkState(playerid, vehicleid, 0, false);
			DeletePVar(playerid, "bagaznik-id");
			RunCommand(playerid, "ja", sprintf("chowa przedmiot %s (x%d) do bagażnika", Item[itemid][i_Name], quant));
		}

		#if !defined MRP_LEGACY_HOUSES
		case D_HOUSE_SAFE_ITEMS:
		{
			if(!response) return 1;
			new dg_value = DynamicGui_GetValue(playerid, listitem);
			new houseid = GetPVarInt(playerid, "sejf-id");
			if(!Iter_Contains(House_iterator, houseid)) return 1;
			new houseUID = House[houseid][h_ID];
			if(houseUID == 0) return sendErrorMessage(playerid, "Ten dom nie istnieje.");

			if(dg_value == -1)
			{
				DynamicGui_Init(playerid);
				new string[2048];
				new added = 0;
				foreach(new x : PlayerItems[playerid])
				{
					new i = PlayerItem[playerid][x][player_item_id];
					if(i == -1) continue;
					if(!Item[i][i_UID] || Item[i][i_Owner] != PlayerInfo[playerid][pUID]) continue;
					//if(!CanGive(playerid, Item[i][i_ItemType], i)) continue;
					format(string, sizeof(string), "%s\n(%d) %s (x%d)", string, i, Item[i][i_Name], Item[i][i_Quantity]);
					DynamicGui_AddRow(playerid, i);
					added++;
				}
				if(!added) { DeletePVar(playerid, "sejf-id"); return sendTipMessage(playerid, "Nie posiadasz żadnych przedmiotów!"); }
				SetPVarInt(playerid, "sejf-put", 1);
				ShowPlayerDialogEx(playerid, D_HOUSE_SAFE_ITEMS, DIALOG_STYLE_LIST, "Sejf - Schowaj przedmiot", string, "Schowaj", "Zamknij");
				return 1;
			}

			if(GetPVarInt(playerid, "sejf-put") == 1)
			{
				if(!response) return 1;
				DeletePVar(playerid, "sejf-put");
				new itemid = dg_value;
				if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
				if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotu.");

				if(Item[itemid][i_Quantity] > 1)
				{
					ShowPlayerDialogEx(playerid, D_HOUSE_SAFE_PUT_ITEM_QUANT, DIALOG_STYLE_INPUT, "Sejf - Schowaj", 
						sprintf("Podaj, ile przedmiotów tego typu chcesz schować do sejfu.\nAktualnie posiadasz {FFFFFF}%s x%d", Item[itemid][i_Name], Item[itemid][i_Quantity]), 
						"Schowaj", "Wróć");
					SetPVarInt(playerid, "house-put:itemid", itemid);
					SetPVarInt(playerid, "house-put:houseid", houseid);
					return 1;
				}

				if(House_GetSafeCapacity(houseid) <= 0) return sendErrorMessage(playerid, "Ten dom nie posiada sejfu.");
				if(House_SafeCount(houseUID) >= House_GetSafeCapacity(houseid)) return sendErrorMessage(playerid, sprintf("W tym sejfie nie zmieści się więcej przedmiotów. (%d/%d)", House_SafeCount(houseUID), House_GetSafeCapacity(houseid)));

				Item_SetOwner(itemid, ITEM_OWNER_TYPE_HOUSE, houseUID);
				RunCommand(playerid, "ja", sprintf("chowa przedmiot %s do sejfu", Item[itemid][i_Name]));
				DeletePVar(playerid, "sejf-id");
				return 1;
			}

			new itemid = dg_value;
			if(!Item[itemid][i_UID]) return 1;
			if(Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_HOUSE || Item[itemid][i_Owner] != houseUID)
				return sendErrorMessage(playerid, "Coś poszło nie tak.");

			if(Item[itemid][i_Quantity] > 1)
			{
				ShowPlayerDialogEx(playerid, D_HOUSE_SAFE_GET_ITEM_QUANT, DIALOG_STYLE_INPUT, "Sejf - Wyciąganie", 
					sprintf("Podaj, ile przedmiotów tego typu chcesz wyciągnąć z sejfu.\nAktualnie w sejfie znajduje się {FFFFFF}%s x%d", Item[itemid][i_Name], Item[itemid][i_Quantity]), 
					"Wyciągnij", "Wróć");
				SetPVarInt(playerid, "house-get:itemid", itemid);
				SetPVarInt(playerid, "house-get:houseid", houseid);
				return 1;
			}

			new item_quantity = (Item[itemid][i_ValueSecret] == ITEM_NOT_COUNT) ? 1 : Item[itemid][i_Quantity];
			if(Item[itemid][i_ItemType] != ITEM_TYPE_MATS && (Item_Count(playerid) + item_quantity) > GetPlayerItemLimit(playerid))
			{
				return sendErrorMessage(playerid, sprintf("Nie pomieścisz tylu przedmiotów w swoim ekwipunku. (%d/%d)", Item_Count(playerid) + item_quantity, GetPlayerItemLimit(playerid)));
			}
			Item_SetOwner(itemid, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID]);
			RunCommand(playerid, "ja", sprintf("wyciąga przedmiot %s z sejfu", Item[itemid][i_Name]));
			DeletePVar(playerid, "sejf-id");
			return 1;
		}

		case D_HOUSE_SAFE_GET_ITEM_QUANT:
		{
			new itemid = GetPVarInt(playerid, "house-get:itemid"), houseid = GetPVarInt(playerid, "house-get:houseid");
			if(!response)
			{
				DeletePVar(playerid, "house-get:itemid");
				DeletePVar(playerid, "house-get:houseid");
				DeletePVar(playerid, "sejf-id");
				return 1;
			}
			if(!Iter_Contains(House_iterator, houseid)) return 1;
			new houseUID = House[houseid][h_ID];
			if(houseUID == 0) return sendErrorMessage(playerid, "Ten dom nie istnieje.");
			if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			if(Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_HOUSE || Item[itemid][i_Owner] != houseUID) 
				return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotu.");

			new quant = strval(inputtext);
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > Item[itemid][i_Quantity])
			{
				RunCommand(playerid, "sejf", "");
				return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			}

			if(Item[itemid][i_ItemType] != ITEM_TYPE_MATS && (Item_Count(playerid) + quant) > GetPlayerItemLimit(playerid))
			{
				return sendErrorMessage(playerid, sprintf("Nie pomieścisz tylu przedmiotów w swoim ekwipunku. (%d/%d)", Item_Count(playerid) + quant, GetPlayerItemLimit(playerid)));
			}

			if(quant == Item[itemid][i_Quantity])
			{
				Item_SetOwner(itemid, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID]);
			}
			else
			{
				new newid = Item_Add(Item[itemid][i_Name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], Item[itemid][i_ItemType], 
					Item[itemid][i_Value1], Item[itemid][i_Value2], true, playerid, quant, Item[itemid][i_ValueSecret]);
				Item[itemid][i_Quantity] -= quant;
				SaveItem(itemid);
				Log(itemLog, INFO, "%s wyciąga przedmiot %s (x%d) z sejfu i tworzy nowy przedmiot %s", GetPlayerLogName(playerid), GetItemLogName(itemid), quant, GetItemLogName(newid));
			}
			RunCommand(playerid, "ja", sprintf("wyciąga przedmiot %s (x%d) z sejfu", Item[itemid][i_Name], quant));
			DeletePVar(playerid, "sejf-id");
			return 1;
		}

		case D_HOUSE_SAFE_PUT_ITEM_QUANT:
		{
			new itemid = GetPVarInt(playerid, "house-put:itemid"), houseid = GetPVarInt(playerid, "house-put:houseid");
			if(!response)
			{
				DeletePVar(playerid, "house-put:itemid");
				DeletePVar(playerid, "house-put:houseid");
				DeletePVar(playerid, "sejf-id");
				return 1;
			}
			if(!Iter_Contains(House_iterator, houseid)) return 1;
			new houseUID = House[houseid][h_ID];
			if(houseUID == 0) return sendErrorMessage(playerid, "Ten dom nie istnieje.");
			if(!Iter_Contains(Items, itemid) || !Item[itemid][i_UID]) return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem id przedmiotów.");
			if(Item[itemid][i_Owner] != PlayerInfo[playerid][pUID] || Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER) 
				return sendErrorMessage(playerid, "Wystąpił błąd z przypisaniem właściciela przedmiotu.");

			new quant = strval(inputtext);
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > Item[itemid][i_Quantity])
			{
				RunCommand(playerid, "sejf", "");
				return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			}

			new capacity = House_GetSafeCapacity(houseid);
			if(capacity <= 0) return sendErrorMessage(playerid, "Ten dom nie posiada sejfu.");
			if(House_SafeCount(houseUID) >= capacity)
			{
				return sendErrorMessage(playerid, sprintf("W tym sejfie nie zmieści się więcej przedmiotów. (%d/%d)", House_SafeCount(houseUID), capacity));
			}

			if(quant == Item[itemid][i_Quantity])
			{
				Item_SetOwner(itemid, ITEM_OWNER_TYPE_HOUSE, houseUID);
			}
			else
			{
				new newid = Item_Add(Item[itemid][i_Name], ITEM_OWNER_TYPE_HOUSE, houseUID, Item[itemid][i_ItemType], 
					Item[itemid][i_Value1], Item[itemid][i_Value2], true, INVALID_PLAYER_ID, quant, Item[itemid][i_ValueSecret]);
				Item[itemid][i_Quantity] -= quant;
				SaveItem(itemid);
				Log(itemLog, INFO, "%s chowa przedmiot %s (x%d) do sejfu i tworzy nowy przedmiot %s", GetPlayerLogName(playerid), GetItemLogName(itemid), quant, GetItemLogName(newid));
			}
			RunCommand(playerid, "ja", sprintf("chowa przedmiot %s (x%d) do sejfu", Item[itemid][i_Name], quant));
			DeletePVar(playerid, "sejf-id");
			return 1;
		}
		#endif
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(GetPVarInt(playerid, "UsingEKiep") == 1 && GetPVarInt(playerid, "PuszczaChmure") == 0 && (newkeys == KEY_HANDBRAKE || oldkeys == KEY_HANDBRAKE))
	{
		PreloadAnimLib(playerid, "GANGS");
		ApplyAnimation(playerid, "GANGS", "smkcig_prtl", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "PuszczaChmure", 1);
		SetTimerEx("PlayerEkiepChmura", 2000, false, "ddd", playerid, 1, 0);
	}
}
//end
