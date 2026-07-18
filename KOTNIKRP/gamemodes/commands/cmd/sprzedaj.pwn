//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ podloz ]------------------------------------------------//
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
Komenda od podnoszenia paczki magazynier	
*/


// Notatki skryptera:
/*
	
*/


YCMD:sprzedaj(playerid, params[])
{
	if(!IsPlayerConnected(playerid))
		return 1;

	if(Kradnie[playerid] == 0)
		return SendClientMessage(playerid, COLOR_BIALY,"[Szmugler] Nie masz paczki, nie mozesz niczego sprzedac.");

	if(!IsAPrzestepca(playerid, 0))
		return SendClientMessage(playerid, COLOR_BIALY, "[Szmugler] Musisz być z organizacji przestępczej");

	if(!IsPlayerInRangeOfPoint(playerid, 5, 2329.02, -1000.98, 60.02))
	{
		SendClientMessage(playerid,COLOR_BIALY,"[Szmugler] Nie jestes u Ralpha Collinsa albo on Ciebie nie widzi.");
		return 1;
	}

	if(ACSzmugler[playerid] > 0 && (gettime() - ACSzmugler[playerid]) < 5)
	{
		new string[128];
		format(string, sizeof(string), "AdmWarn: %s[%d] <- Cheater, Teleportation during smuggler work %ds",
			GetNick(playerid), playerid, 5 - (gettime() - ACSzmugler[playerid]));
		SendAdminMessage(COLOR_YELLOW, string);	
		printf("[teleport][cheats] Cheater, Teleportation during smuggler work %ds",
			5 - (gettime() - ACSzmugler[playerid]));
		ShowPlayerDialogEx(playerid, 10101, DIALOG_STYLE_MSGBOX, "Cheater",
			"Cheater, Teleportacja przy szmuglerze", "OK", "");
		KickEx(playerid);
		return 1;
	}

	ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.1,0,1,1,0,1000,1);

	Kradnie[playerid] = 0;
	OkradanieTira[playerid] = 0;
	ACSzmugler[playerid] = 0;

	new finalPrice = PRICE_SZMUGLER;
	if(IsPlayerPremiumOld(playerid)) 
	{
		finalPrice += floatround(finalPrice * 0.1);
	}
	new amountOfturfs = Turf_PlayerTurfCount(playerid);
	new h, m, s;
	gettime(h, m, s);
	if(h >= 18) { finalPrice += floatround(finalPrice * 0.15); }
	finalPrice += floatround(finalPrice * 0.1 * amountOfturfs);
	DajKaseDone(playerid, finalPrice);


	SendClientMessage(playerid, COLOR_BIALY,
		"Ralph_Collins mówi: Yo' Dzięki ziomek za takie rzeczy! Trzymaj, to dla Ciebie.");
	SendClientMessage(playerid, COLOR_GREEN,
		"Dostałeś od Ralpha_Collinsa do ręki %d$", finalPrice);

	Item_Add("Zegarek", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
		ITEM_TYPE_ZEGAREK, 0, 0, true, playerid, 1);

	Item_Add("Lancuszek", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
		ITEM_TYPE_LANCUSZEK, 0, 0, true, playerid, 2);

	Item_Add("Materiały", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
		ITEM_TYPE_MATS, 0, 0, true, playerid, 200 + (amountOfturfs * 100), ITEM_NOT_COUNT);

	new rand = random(100) + 1;

	if(rand <= 15)
	{
		Item_Add("Kawalek SNIPE", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
			ITEM_TYPE_KAWALEKSNIPE, 0, 0, true, playerid, 1, ITEM_NOT_COUNT);
	}
	else if(rand <= 35)
	{
		Item_Add("Kawalek M4", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
			ITEM_TYPE_KAWALEKM4, 0, 0, true, playerid, 1, ITEM_NOT_COUNT);
	}
	else if(rand <= 65)
	{
		Item_Add("Kawalek AK", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID],
			ITEM_TYPE_KAWALEKAK, 0, 0, true, playerid, 1, ITEM_NOT_COUNT);
	}

	if(IsPlayerAttachedObjectSlotUsed(playerid, 0))
	{
		RemovePlayerAttachedObject(playerid, 0);
	}

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return 1;
}