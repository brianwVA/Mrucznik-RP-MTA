//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zabierz ]------------------------------------------------//
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

YCMD:zabierz(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME + 1];
	new sendername[MAX_PLAYER_NAME + 1];

	if(!IsPlayerConnected(playerid)) return 1;

	new isPolice = GroupPlayerDutyPerm(playerid, PERM_POLICE);
	new isCrim = IsAPrzestepca(playerid);
	if(!isPolice && !isCrim)
	{
		sendErrorMessage(playerid, "Nie masz dostępu do tej komendy !");
		return 1;
	}

	if(Kajdanki_JestemSkuty[playerid] || PlayerTied[playerid] || PlayerInfo[playerid][pBW] || PlayerInfo[playerid][pInjury])
	{
		sendTipMessage(playerid, "Jesteś zakuty, ranny lub pobity, nie możesz okradać w tym stanie.");
		return 1;
	}

	new x_nr[32];
	new giveplayerid;
	if(gettime() < GetPVarInt(playerid, "lic-timer")) return sendTipMessage(playerid, "Licencje oraz rzeczy możesz zabierać co 30 sekund!");
	if(sscanf(params, "s[32] d", x_nr, giveplayerid))
	{
		if(isPolice)
		{
			SendClientMessage(playerid, COLOR_WHITE, "|__________________ Zabieranie rzeczy __________________|");
			SendClientMessage(playerid, COLOR_WHITE, "UŻYJ: /zabierz [nazwa] [playerid/CzęśćNicku]");
			SendClientMessage(playerid, COLOR_GREY, "Dostępne nazwy: Przedmiot, Prawojazdy, LicencjaLot, LicencjaLodz, LicencjaBron, Bron, Narko, Mats");
			SendClientMessage(playerid, COLOR_WHITE, "|_______________________________________________________|");
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "|__________________ Zabieranie rzeczy __________________|");
			SendClientMessage(playerid, COLOR_WHITE, "UŻYJ: /zabierz [nazwa] [playerid/CzęśćNicku]");
			SendClientMessage(playerid, COLOR_GREY, "Dostępne nazwy: Przedmiot, Narko, Mats, Portfel, GPS");
			SendClientMessage(playerid, COLOR_WHITE, "|_______________________________________________________|");
		}
		return 1;
	}

	if(!IsPlayerConnected(giveplayerid)) { sendErrorMessage(playerid, "Nie ma takiego gracza !"); return 1; }
	if(!ProxDetectorS(8.0, playerid, giveplayerid)) { sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !"); return 1; }

	GetPlayerName(playerid, sendername, sizeof(sendername));
	GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));

	if(isPolice)
	{
		if(PlayerInfo[playerid][pGrupaRank][OnDuty[playerid]-1] < 1)
		{
			SendClientMessage(playerid, COLOR_GREY, "Potrzebujesz 1 rangi aby zabierać przedmioty!");
			return 1;
		}

		if(!Kajdanki_JestemSkuty[giveplayerid])
		{
			sendTipMessage(playerid, "Nie możesz zabierać przedmiotów od osoby, która nie jest zakuta w kajdanki.");
			return 1;
		}

		if(strcmp(x_nr,"prawojazdy",true) == 0)
		{
			format(string, sizeof(string), "* Zabrałeś %s prawo jazdy.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał Ci prawo jazdy.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			PlayerInfo[giveplayerid][pCarLic] = 0;
		}
		else if(strcmp(x_nr,"licencjalot",true) == 0)
		{
			format(string, sizeof(string), "* Zabrałeś %s Licencje na latanie.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał Ci licencję na latanie.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			PlayerInfo[giveplayerid][pFlyLic] = 0;
		}
		else if(strcmp(x_nr,"licencjabron",true) == 0)
		{
			format(string, sizeof(string), "* Zabrałeś %s Licencję na Broń.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał Ci licencję na broń.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			SetTimerEx("AntySB", 5000, 0, "d", giveplayerid);
			AntySpawnBroni[giveplayerid] = 5;
			PlayerInfo[giveplayerid][pGunLic] = 0;
		}
		else if(strcmp(x_nr,"licencjalodz",true) == 0)
		{
			format(string, sizeof(string), "* Zabrałeś %s Licencje na pływanie łodziami.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał Ci twoją licencję na pływanie łodziami.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			PlayerInfo[giveplayerid][pBoatLic] = 0;
		}
		else if(strcmp(x_nr,"bron",true) == 0)
		{
			format(string, sizeof(string), "* Zabrałeś %s Bronie.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał twoją broń.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			SetTimerEx("AntySB", 5000, 0, "d", giveplayerid);
			AntySpawnBroni[giveplayerid] = 5;
			ResetPlayerWeapons(giveplayerid);
			UsunBron(giveplayerid);
			foreach(new x : PlayerItems[giveplayerid])
			{
				new i = PlayerItem[giveplayerid][x][player_item_id];
				if(i == -1) continue;
				if(Item[i][i_ItemType] == ITEM_TYPE_WEAPON)
				{
					Item_Delete(i, true, Item[i][i_Quantity], false);
					Memory_ClearItemForPlayer(giveplayerid, x, false);
					Iter_Remove(Items, i);
				}
			}
		}
		else if(strcmp(x_nr,"narko",true) == 0)
		{
			new countnarko = CountNarko(giveplayerid);
			format(string, sizeof(string), "* Zabrałeś %s narkotyki.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał twoje narkotyki.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał %s narkotyki. %d.", sendername, giveplayer, countnarko);
			Log(serverLog, WARNING, "%s zabrał %s %d %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), countnarko, x_nr);
			TakeNarko(giveplayerid, countnarko, 1, true, true);
			SetPVarInt(playerid, "lic-timer", gettime() + 30);
			return 1;
		}
		else if(strcmp(x_nr,"mats",true) == 0)
		{
			new countmats = CountMats(giveplayerid);
			format(string, sizeof(string), "* Zabrałeś %s Materiały.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał twoje Materiały.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał %s matsy %d.", sendername, giveplayer, countmats);
			Log(serverLog, WARNING, "%s zabrał %s %d %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), countmats, x_nr);
			Mats_Add(PlayerInfo[playerid][pGrupa][OnDuty[playerid]-1], countmats);
			TakeMats(giveplayerid, countmats);
			SetPVarInt(playerid, "lic-timer", gettime() + 30);
			return 1;
		}
		else if(strcmp(x_nr,"przedmiot",true) == 0)
		{
			new items_list[4096];
			items_list[0] = '\0';
			new count = 0;
			foreach(new xi : PlayerItems[giveplayerid])
			{
				new itemid = PlayerItem[giveplayerid][xi][player_item_id];
				if(itemid == -1) continue;
				if(Item[itemid][i_ItemType] == ITEM_TYPE_PHONE && PlayerInfo[playerid][pAdmin] == 0) continue;
				new name[64]; strmid(name, Item[itemid][i_Name], 0, sizeof(name), sizeof(name));
				if(count == 0) format(items_list, sizeof(items_list), "%s", name);
				else format(items_list, sizeof(items_list), "%s\n%s", items_list, name);
				new key[32]; format(key, sizeof(key), "zabierz_item_%d", count);
				SetPVarInt(playerid, key, itemid);
				count++;
			}
			if(count == 0) { sendErrorMessage(playerid, "Nie ma nic do zabrania."); return 1; }
			SetPVarInt(playerid, "zabierz_count", count);
			SetPVarInt(playerid, "zabierz_target", giveplayerid);
			ShowPlayerDialogEx(playerid, 9200, DIALOG_STYLE_LIST, "Wybierz przedmiot", items_list, "Weź", "Anuluj");
			return 1;
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Zła nazwa");
			return 1;
		}

		Log(serverLog, WARNING, "%s zabrał %s %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), x_nr);
	}
	else if(isCrim)
	{
		if(!PlayerTied[giveplayerid])
		{
			sendTipMessage(playerid, "Gracz musi być związany.");
			return 1;
		}
		if(strcmp(x_nr,"narko",true) == 0)
		{
			new countnarko = CountNarko(giveplayerid);
			if(countnarko <= 0) { sendErrorMessage(playerid, "Gracz nie ma narkotyków."); return 1; }
			format(string, sizeof(string), "* Zabrałeś %s narkotyki.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* %s zabrał twoje narkotyki.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			Log(serverLog, WARNING, "%s (przestepca) zabral %s %d %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), countnarko, x_nr);
			PoziomPoszukiwania[playerid] += 3;
			SetPlayerCriminal(playerid, INVALID_PLAYER_ID, "Kradzież narkotyków");
			foreach(new xi : PlayerItems[giveplayerid])
			{
				new kid = PlayerItem[giveplayerid][xi][player_item_id];
				if(kid == -1) continue;
				if(Item[kid][i_ItemType] == ITEM_TYPE_KRZAK)
				{
					Item_Add("Krzak", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_KRZAK, 0, 0, true, playerid, 1, ITEM_NOT_COUNT);
				}
			}
			TakeNarko(giveplayerid, countnarko, 1, true, false);
			Item_Add("Marihuana", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_MARIHUANA, 0, 0, true, playerid, countnarko);
			SetPVarInt(playerid, "lic-timer", gettime() + 30);
			return 1;
		}
		else if(strcmp(x_nr,"mats",true) == 0)
		{
			new countmats = CountMats(giveplayerid);
			if(countmats <= 0) { sendErrorMessage(playerid, "Gracz nie ma materiałów."); return 1; }
			format(string, sizeof(string), "* Zabrałeś %s Materiały.", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* %s zabrał twoje Materiały.", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			Log(serverLog, WARNING, "%s (przestepca) zabral %s %d %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), countmats, x_nr);
			TakeMats(giveplayerid, countmats);
			Item_Add("Materiały", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_MATS, 0, 0, true, playerid, countmats, ITEM_NOT_COUNT);
			PoziomPoszukiwania[playerid] += 3;
			SetPlayerCriminal(playerid, INVALID_PLAYER_ID, "Kradzież materiałów");
			SetPVarInt(playerid, "lic-timer", gettime() + 30);
			return 1;
		}
		else if(strcmp(x_nr,"portfel",true) == 0)
		{
			if(giveplayerid == playerid) { sendErrorMessage(playerid, "Nie możesz okraść sam siebie!"); return 1; }
			if(PlayerTied[giveplayerid] > 0 || PlayerInfo[giveplayerid][pBW] > 0 || PlayerInfo[giveplayerid][pInjury] > 0)
			{
				if(PlayerTied[giveplayerid] != 1)
				{
					sendTipMessage(playerid, "Gracz musi być związany.");
					return 1;
				}
				if(ProxDetectorS(8.0, playerid, giveplayerid))
				{
					new pieniadze = 2000;
					if(okradziony[giveplayerid] == 0)
					{
						if(kaska[giveplayerid] >= 1)
						{
							if(PlayerInfo[giveplayerid][pConnectTime] >= 2)
							{
								if(kaska[giveplayerid] >= pieniadze)
								{
									SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("%s zabrał Ci portfel z $%d w środku", GetNick(playerid), pieniadze));
									SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Zabrałeś portfel %s, w środku jest $%d", GetNick(giveplayerid), pieniadze));
									format(string, sizeof(string), "* %s zabiera portfel %s razem z %d$", GetNick(playerid), GetNick(giveplayerid), pieniadze);
									ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
									Log(payLog, WARNING, "%s zabrał portfel %s razem z %d$", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), pieniadze);
									DajKaseDone(playerid, pieniadze);
									ZabierzKaseDone(giveplayerid, pieniadze);
									okradziony[giveplayerid] = 1;
									PoziomPoszukiwania[playerid] += 3;
									SetPlayerCriminal(playerid,INVALID_PLAYER_ID, "Kradzież portfela");
									SetPVarInt(playerid, "lic-timer", gettime() + 30);
									return 1;
								}
								pieniadze = kaska[giveplayerid] /2;
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("%s zabrał Ci portfel z $%d w środku", GetNick(playerid), pieniadze));
								SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Zabrałeś portfel %s, w środku jest $%d", GetNick(giveplayerid), pieniadze));
								format(string, sizeof(string), "* %s zabiera portfel %s razem z %d$", GetNick(playerid), GetNick(giveplayerid), pieniadze);
								ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								Log(payLog, WARNING, "%s zabrał portfel %s razem z %d$", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), pieniadze);
								DajKaseDone(playerid, pieniadze);
								ZabierzKaseDone(giveplayerid, pieniadze);
								okradziony[giveplayerid] = 1;
								PoziomPoszukiwania[playerid] += 3;
								SetPlayerCriminal(playerid,INVALID_PLAYER_ID, "Kradzież portfela");
								SetPVarInt(playerid, "lic-timer", gettime() + 30);
								return 1;
							}
							else
							{
								sendErrorMessage(playerid, "Ten gracz za mało gra !");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Ten gracz nie ma nic przy sobie !");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Ta osoba nie ma portfela, już jej ktoś zabrał !");
					}
				}
				else
				{
					sendErrorMessage(playerid, "Nie jesteś wystarczająco blisko gracza !");
					return 1;
				}
			}
			else
			{
				sendTipMessage(playerid, "Ta osoba nie jest związana lub nie ma BW/nie jest ranna!");
				return 1;
			}
		}
		else if(strcmp(x_nr,"gps",true) == 0)
		{
			if(GetDistanceBetweenPlayers(playerid, giveplayerid) < 4 && (PlayerInfo[giveplayerid][pBW] > 0 || PlayerInfo[giveplayerid][pInjury] > 0))
			{
				if(PDGPS == giveplayerid)
				{
					PDGPS = -1;
					new pZone[MAX_ZONE_NAME];
					GetPlayer2DZone(giveplayerid, pZone, MAX_ZONE_NAME);
					format(string, sizeof(string), "* %s zabiera nadajnik GPS %s, następnie go niszczy.", GetNick(playerid), GetNick(giveplayerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					format(string, sizeof(string), "* Zabrałeś %s nadajnik GPS. Nadawanie lokalizacji zostało przerwane.", GetNick(giveplayerid));
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "=: Sygnał z nadajnika GPS %s został przerwany. Ostatnia lokalizacja: %s :=", GetNick(giveplayerid), pZone);
					SendTeamMessage(0, COLOR_YELLOW2, string, PERM_POLICE);
					SetPVarInt(playerid, "lic-timer", gettime() + 30);
					return ShowPlayerInfoDialog(giveplayerid, "M-RP", "Zabrano Ci nadajnik GPS.");
				}
				else
				{
					format(string, sizeof(string), "* Gracz nie ma włączonego nadajnika GPS.");
					SendClientMessage(playerid, COLOR_GREY, string);
				}
			}
			else
			{
				return ShowPlayerInfoDialog(playerid, "M-RP", "Gracz musi być nieprzytomny lub jesteś za daleko.");
			}
		}
		else if(strcmp(x_nr,"przedmiot",true) == 0)
		{
			new items_list[4096];
			items_list[0] = '\0';
			new count = 0;
			foreach(new xi : PlayerItems[giveplayerid])
			{
				new itemid = PlayerItem[giveplayerid][xi][player_item_id];
				if(itemid == -1) continue;
				new name[64]; strmid(name, Item[itemid][i_Name], 0, sizeof(name), sizeof(name));
				if(count == 0) format(items_list, sizeof(items_list), "%s", name);
				else format(items_list, sizeof(items_list), "%s\n%s", items_list, name);
				new key[32]; format(key, sizeof(key), "zabierz_item_%d", count);
				SetPVarInt(playerid, key, itemid);
				count++;
			}
			if(count == 0) { sendErrorMessage(playerid, "Nie ma nic do zabrania."); return 1; }
			SetPVarInt(playerid, "zabierz_count", count);
			SetPVarInt(playerid, "zabierz_target", giveplayerid);
			ShowPlayerDialogEx(playerid, 9200, DIALOG_STYLE_LIST, "Wybierz przedmiot", items_list, "Weź", "Anuluj");
			return 1;
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Zła nazwa");
			return 1;
		}

	}

	SetPVarInt(playerid, "lic-timer", gettime() + 30);
	return 1;
}
