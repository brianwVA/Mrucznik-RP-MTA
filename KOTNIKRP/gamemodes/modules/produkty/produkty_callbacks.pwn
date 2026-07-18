//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                  produkty                                                 //
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
// Data utworzenia: 31.05.2021
//Opis:
/*
	System produktów dla organizacji
*/

//

#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_hooks>

timer Product_ResetOfferData[30000](playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;
	new offer = GetPVarInt(playerid, "ProductPlayer-Offer");
	SetPVarInt(playerid, "ProductPlayer-Offer", INVALID_PLAYER_ID);
	SetPVarInt(playerid, "ProductID-Offer", -1);
	if(IsPlayerConnected(offer))
		SendClientMessage(offer, COLOR_NEWS, "* Twoja oferta została odrzucona!");
	SendClientMessage(playerid, -1, "* Czas na zaakceptowanie oferty minął.");
	return 1;
}

//-----------------<[ Callbacki: ]>-----------------

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case D_PRODUCTS_LIST:
		{
			if(!response) return 0;
			new pID = DynamicGui_GetValue(playerid, listitem);
			if(!Product[pID][p_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
			if(Product[pID][p_Price] < 0) return sendErrorMessage(playerid, "Cena produktu jest na minusie! Zgłoś to do lidera.");
			if(!CanGive(playerid, Product[pID][p_ItemType])) return sendErrorMessage(playerid, "Sprzedaż tego przedmiotu została zablokowana. Zgłoś to do lidera!");

			ShowPlayerDialogEx(playerid, D_PRODUCTS_QUANTITY, DIALOG_STYLE_INPUT, "Panel sprzedaży", "Ile przedmiotów tego typu chcesz sprzedać? (max: 100)", "Sprzedaj", "Zamknij");
			SetPVarInt(playerid, "selected-product", pID);
		}
		case D_PRODUCTS_QUANTITY:
		{
			if(!response) return 0;
			new quant = strval(inputtext), product = GetPVarInt(playerid, "selected-product");
			if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > 100) return ShowPlayerDialogEx(playerid, D_PRODUCTS_QUANTITY, DIALOG_STYLE_INPUT, "Panel sprzedaży", "Ile przedmiotów tego typu chcesz sprzedać? (max: 100)", "Sprzedaj", "Zamknij");
			if(Product[product][p_Quant] < quant)
			{
				sendErrorMessage(playerid, "Nie możesz sprzedać tylu produktów! (za mała ilość)");
				return ShowPlayerDialogEx(playerid, D_PRODUCTS_QUANTITY, DIALOG_STYLE_INPUT, "Panel sprzedaży", "Ile przedmiotów tego typu chcesz sprzedać? (max: 10)", "Sprzedaj", "Zamknij");
			}

			SetPVarInt(playerid, "selected-product-quant2", quant);
			new string[256];
			DynamicGui_Init(playerid);
			foreach(new i : Player)
			{
				if(GetPlayerState(i) == PLAYER_STATE_SPECTATING) continue;
				if(GetDistanceBetweenPlayers(playerid, i) < 5 && i != playerid)  {
					strcat(string, sprintf("\n(%d) %s", i, GetNick(i)));
					DynamicGui_AddRow(playerid, i);
				}
			}
			if(strlen(string) < 1) return sendTipMessage(playerid, "Brak graczy w pobliżu!");
			ShowPlayerDialogEx(playerid, D_PRODUCTS_PLAYERS, DIALOG_STYLE_LIST, "Panel sprzedaży", string, "Sprzedaj", "Zamknij");
		}
		case D_PRODUCTS_PLAYERS:
		{
			if(!response) return RunCommand(playerid, "/sprzedajprodukt", "");
			new giveplayerid = DynamicGui_GetValue(playerid, listitem), product = GetPVarInt(playerid, "selected-product"), quant = GetPVarInt(playerid, "selected-product-quant2");
			SetPVarInt(playerid, "ProductPlayer-OfferingTo", giveplayerid);
			if(kaska[giveplayerid] < Product[product][p_Price]*quant)
			{
				va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Tego gracza nie stać na zakup %s x%d za cenę $%d", Product[product][p_ProductName], quant, Product[product][p_Price]*quant);
				va_SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "* Nie stać Cię na przedmiot %s x%d za cenę $%d", Product[product][p_ProductName], quant, Product[product][p_Price]*quant);
				return 1;
			}
			if(!IsPlayerConnected(giveplayerid) || !gPlayerLogged[giveplayerid]) return sendErrorMessage(playerid, "Ten użytkownik się rozłączył!");
			if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Ten produkt przestał istnieć!");
			if(GetPVarInt(giveplayerid, "ProductPlayer-Offer") != INVALID_PLAYER_ID) return sendErrorMessage(playerid, "Ten gracz ma aktywną oferte!");
			SetPVarInt(playerid, "selected-product-quant", quant);
			va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Oferujesz przedmiot %s x%d graczowi %s [%d] za cenę $%d", Product[product][p_ProductName], quant, GetNick(giveplayerid), giveplayerid, Product[product][p_Price]*quant);
			va_SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "* Gracz %s [%d] oferuje Ci przedmiot %s x%d za cenę $%d.", GetNick(playerid), playerid, Product[product][p_ProductName], quant, Product[product][p_Price]*quant);
			Log(payLog, WARNING, "%s oferuje graczowi %s produkt %s x%d za $%d", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), Product[product][p_ProductName], quant, Product[product][p_Price]*quant);
			SetPVarInt(giveplayerid, "ProductPlayer-Offer", playerid);
			SetPVarInt(giveplayerid, "ProductID-Offer", product);
			ShowPlayerDialogEx(giveplayerid, D_PRODUCTS_OFFER, DIALOG_STYLE_MSGBOX, "Oferta sprzedaży produktu", sprintf("Gracz %s [%d] oferuje Ci przedmiot %s x%d za cenę $%d.", GetNick(playerid), playerid, Product[product][p_ProductName], quant, Product[product][p_Price]*quant), "Akceptuj", "Odrzuć");
			PlayerInfo[giveplayerid][pProductOfferTimer] = defer Product_ResetOfferData[30000](giveplayerid);
		}
		case D_PRODUCTS_OFFER:
		{
			if(!response)
			{
				new offer = GetPVarInt(playerid, "ProductPlayer-Offer");
				SetPVarInt(playerid, "ProductPlayer-Offer", INVALID_PLAYER_ID);
				SetPVarInt(playerid, "ProductID-Offer", -1);
				if(IsPlayerConnected(offer))
					SendClientMessage(offer, COLOR_NEWS, "* Twoja oferta została odrzucona!");
				SendClientMessage(playerid, -1, "* Odrzuciłeś oferte sprzedaży."); 
				return 0;
			}
			produkt_akceptuj(playerid);
			stop PlayerInfo[playerid][pProductOfferTimer];
		}
	}
	return 1;
}

//end