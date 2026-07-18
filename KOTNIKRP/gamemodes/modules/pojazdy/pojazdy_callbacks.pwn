//---------------------------------------------<< Callbacks >>-----------------------------------------------//
//                                                  pojazdy                                                  //
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
// Autor: Mrucznik
// Data utworzenia: 04.05.2019
//Opis:
/*
	System pojazdów.
*/

//
#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if(playertextid == Salon_Button[playerid][0])
	{
		DestroySalonDialog(playerid);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wybierz kolor wybranego wozu");
		ShowPlayerDialogEx(playerid, 31, DIALOG_STYLE_LIST, "Wybierz Kolor 1", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
	}
	else if(playertextid == Salon_Button[playerid][1])
	{
		DestroySalonDialog(playerid);
		ShowPlayerCarDialog(playerid, GetPVarInt(playerid, "SalonCurrentType"));
		pojazdid[playerid] = 0;
		CenaPojazdu[playerid] = 0;
	}
	return 1;
}

pojazdy_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 443)
	{
		if(response)
		{
			new lUID = PlayerInfo[playerid][pKluczeAuta];
			if(lUID == 0) return 1;

			new idx = Car_GetIDXFromUID(lUID);
			if(idx == -1) return 1;
			if(CarData[idx][c_Keys] != PlayerInfo[playerid][pUID])
			{
				SendClientMessage(playerid, COLOR_NEWS, "Kluczyki od tego pojazdu zostały zabrane przez właściciela.");
				PlayerInfo[playerid][pKluczeAuta] = 0;
				return 1;
			}
			switch(listitem)
			{
				case 0://spawnuj kluczyki - tu jest bug?
				{
					if(CarData[idx][c_ID] != 0 && GetVehicleModel(CarData[idx][c_ID]) != 0)
					{
						SendClientMessage(playerid, 0xFFC0CB, "Pojazd do którego masz kluczyki jest już zespawnowany");
						return 1;
					}
					Car_Spawn(idx);
					Log(serverLog, WARNING, "Gracz %s zespawnował pojazd %s", GetPlayerLogName(playerid), GetCarDataLogName(idx));
					SendClientMessage(playerid, 0xFFC0CB, "Twój pojazd został zrespawnowany");
					
				}
				case 1://Znajdź
				{
					new Float:autox, Float:autoy, Float:autoz;
					new pojazdszukany = CarData[idx][c_ID];
					if(pojazdszukany == 0) return 1;
					GetVehiclePos(pojazdszukany, autox, autoy, autoz);
					SetPlayerCheckpoint(playerid, autox, autoy, autoz, 6);
					SetTimerEx("SzukanieAuta",30000,0,"d",playerid);
					SendClientMessage(playerid, 0xFFC0CB, "Jedź do czerwonego markera");

				}
				case 2://Pokaż parking
				{
					SetPlayerCheckpoint(playerid, CarData[idx][c_Pos][0],CarData[idx][c_Pos][1],CarData[idx][c_Pos][2], 6);
					SetTimerEx("SzukanieAuta",30000,0,"d",playerid);
					SendClientMessage(playerid, 0xFFC0CB, "Jedź do czerwonego markera");

				}
			}
		}
	}
	else if(dialogid == D_AUTO_RESPAWN)//Potwierdzenie Respawnuj
	{
		if(response)
		{
			if(kaska[playerid] >= PRICE_CAR_RESPAWN)
			{
				new vehicleid;

				if((vehicleid = CarData[IloscAut[playerid]][c_ID]) != 0)
				{
					Car_Unspawn(vehicleid);
					Car_Spawn(IloscAut[playerid]);
					Log(serverLog, WARNING, "Gracz %s zrespawnował pojazd %s", GetPlayerLogName(playerid), GetCarDataLogName(IloscAut[playerid]));

					ZabierzKaseDone(playerid, PRICE_CAR_RESPAWN);
					SendClientMessage(playerid, 0xFFC0CB, "Pojazd został zrespawnowany. Koszt: {FF0000}"#PRICE_CAR_RESPAWN"$");
				}
				else
				{
					SendClientMessage(playerid, 0xFFC0CB, "Ten pojazd nie jest zespawnowany");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xFFC0CB, "Nie stać cię!");
				ShowCarsForPlayer(playerid, playerid);
			}
		}
		if(!response)
		{
			ShowCarsForPlayer(playerid, playerid);
		}
	}
	else if(dialogid == D_AUTO_UNSPAWN)//Potwierdzenie Unspawnuj
	{
		if(response)
		{
			if(kaska[playerid] >= PRICE_CAR_RESPAWN)
			{
				new vehicleid;

				if((vehicleid = CarData[IloscAut[playerid]][c_ID]) != 0)
				{
					Car_Unspawn(vehicleid);
					Log(serverLog, WARNING, "Gracz %s unspawnował pojazd %s", GetPlayerLogName(playerid), GetCarDataLogName(IloscAut[playerid]));

					ZabierzKaseDone(playerid, PRICE_CAR_RESPAWN);
					SendClientMessage(playerid, 0xFFC0CB, "Pojazd został unspawnowany. Koszt: {FF0000}"#PRICE_CAR_RESPAWN"$");
				}
				else
				{
					SendClientMessage(playerid, 0xFFC0CB, "Ten pojazd nie jest zespawnowany");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xFFC0CB, "Nie stać cię!");
				ShowCarsForPlayer(playerid, playerid);
			}
		}
		if(!response)
		{
			ShowCarsForPlayer(playerid, playerid);
		}
	}
	else if(dialogid == D_AUTO)
	{
		if(!response) return 1;
		new lUID = strval(inputtext);
		
		if(lUID < 0)
		{
			ShowCarsForPlayer(playerid, playerid);
			SendClientMessage(playerid, COLOR_RED, "× Ten pojazd jest zablokowany, skontaktuj się z administratorem.");
			return 1;
		}

		new i = lUID;
		if(CarData[i][c_Owner] != PlayerInfo[playerid][pUID])
		{
			for(new j = 0; j<10; j++)
			{
				if(PlayerInfo[playerid][pCars][j] == lUID)
				{
					PlayerInfo[playerid][pCars][j] = 0;
				}
			}
			ShowCarsForPlayer(playerid, playerid);
			SendClientMessage(playerid, COLOR_RED, "× Ten pojazd jest zbugowany i nie należy do Ciebie, skontaktuj się z administratorem.");
			Log(errorLog, WARNING, "%s został odebrany pojazd UID: %d z powodu błędu z duplikatem aut (niepoprawny właściciel)",
				GetPlayerLogName(playerid), 
				lUID
			);
			return 1;
		}

		new string[2048];
		format(string, sizeof(string), "{FFFFFF}Spawnuj\nRespawnuj\nUnspawnuj\nZnajdź\nPokaż parking\nZłomuj\nUsuwanie tuningu\nPrzypisz do grupy\n{E2BA1B}Tablica rejestracyjna (KP){FFFFFF}");
		ShowPlayerDialogEx(playerid, D_AUTO_ACTION, DIALOG_STYLE_LIST, "Panel pojazdu", string, "Wybierz", "Wyjdź");
		IloscAut[playerid] = lUID;
		return 1;
	}
	if(dialogid == D_AUTO_ACTION)
	{
		if(!response)
		{
			DestroySalonDialog(playerid);
			ShowCarsForPlayer(playerid, playerid);
			return 1;
		}
		new lUID = IloscAut[playerid];
		switch(listitem)
		{
			case 0:
			{
				if(CarData[lUID][c_ID] == 0)
				{
					Car_Spawn(lUID);
					Log(serverLog, WARNING, "Gracz %s zrespawnował pojazd %s", GetPlayerLogName(playerid), GetCarDataLogName(lUID));
					SendClientMessage(playerid, COLOR_WHITE, "Twój pojazd został {2DE9B1}zespawnowany{FFFFFF}!");
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "Twój pojazd jest już {2DE9B1}zespawnowany{FFFFFF}, stoi tam gdzie go zostawiłeś!");
				}
			}
			case 1:
			{
				ShowPlayerDialogEx(playerid, D_AUTO_RESPAWN, DIALOG_STYLE_MSGBOX, "Respawnuj wóz", "Czy na pewno chcesz zrespawnować ć ten wóż?\nKoszt respawnu wozu to {FF0000}"#PRICE_CAR_RESPAWN"${FFFAFA}!!!", "Respawnuj", "Anuluj");
			}
			case 2: 
			{
				ShowPlayerDialogEx(playerid, D_AUTO_UNSPAWN, DIALOG_STYLE_MSGBOX, "Unspawnuj wóz", "Czy na pewno chcesz unspawnować ten wóż?\nKoszt unspawnowania wozu to {FF0000}"#PRICE_CAR_RESPAWN"${FFFAFA}!!!", "Unspawnuj", "Anuluj");
			}
			case 3://Znajdź
			{
				if(CarData[lUID][c_ID] == 0) return SendClientMessage(playerid, 0xFFC0CB, "Auto nie jest zespawnowane.");
				new Float:autox, Float:autoy, Float:autoz;
				new pojazdszukany = CarData[lUID][c_ID];
				GetVehiclePos(pojazdszukany, autox, autoy, autoz);
				SetPlayerCheckpoint(playerid, autox, autoy, autoz, 6);
				SetTimerEx("SzukanieAuta",30000,0,"d",playerid);
				SendClientMessage(playerid, 0xFFC0CB, "Lokalizacja pojazdu została oznaczona na mapie.");
			}
			case 4://Pokaż parking
			{
				SetPlayerCheckpoint(playerid, CarData[lUID][c_Pos][0],CarData[lUID][c_Pos][1],CarData[lUID][c_Pos][2], 6);
				SetTimerEx("SzukanieAuta",30000,0,"d",playerid);
				SendClientMessage(playerid, 0xFFC0CB, "Lokalizacja pojazdu została oznaczona na mapie.");
			}
			case 5://Złomuj
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(CarData[lUID][c_ID] == 0) return SendClientMessage(playerid, 0xFFC0CB, "Auto nie jest zespawnowane!");
					if(CarData[lUID][c_ID] != GetPlayerVehicleID(playerid)) return SendClientMessage(playerid, 0xFFC0CB, "Nie siedzisz w aucie, ktore chcesz zezlomowac!");
					ShowPlayerDialogEx(playerid, D_AUTO_DESTROY, DIALOG_STYLE_MSGBOX, "Złomowanie wozu", "Czy na pewno chcesz zezłomować ten wóz? Zarobisz na tym tylko 200$!", "ZŁOMUJ", "WYJDŹ");
				}
			}
			case 6://Usuń tuning
			{
				new string[2048];
				format(string, sizeof(string), "Usuń tuning - NITRO\nUsuń tuning - HYDRAULIKA\nUsuń tuning - FELGI\nUsuń tuning - MALUNEK\nUsuń tuning - SPOJLER\nUsuń tuning - ZDERZAKI");
				ShowPlayerDialogEx(playerid, D_AUTO_ACTION_TUNING, DIALOG_STYLE_LIST, "Panel pojazdu", string, "Wybierz", "Wyjdź");
			}
			case 7://Przypisz do grupy
			{
				new groups[1024];
				DynamicGui_Init(playerid);
				for(new i = 0; i < MAX_PLAYER_GROUPS_PREMIUM; i++)
				{
					if(PlayerInfo[playerid][pGrupa][i] != 0)
					{
						new groupid = PlayerInfo[playerid][pGrupa][i];
						if(!IsValidGroup(groupid)) continue;
						format(groups, sizeof(groups), "%s\n%s (%d)", groups, GroupInfo[groupid][g_Name], groupid);
						DynamicGui_AddRow(playerid, groupid);
					}
				}
				if(isnull(groups))
				{
					SendClientMessage(playerid, COLOR_RED, "Nie należysz do żadnej grupy.");
				}
				else
				{
					ShowPlayerDialogEx(playerid, 5002, DIALOG_STYLE_LIST, "Wybierz grupę", groups, "Wybierz", "Anuluj");
				}
			}
			case 8://rejestracja (NumberPlate)
			{
				if(!IsPlayerPremiumOld(playerid)) return sendTipMessage(playerid, "Nie posiadasz konta premium! Wpisz /kp.");
				ShowPlayerDialogEx(playerid, D_AUTO_REJESTRACJA, DIALOG_STYLE_INPUT, "Rejestracja", "Wprowadź nowy numer/tekst na swojej tablicy rejestracyjnej\n(do 9 znaków):", "Ustaw", "Wróć");
			}
		}
		return 1;
	}
	if(dialogid == D_AUTO_ACTION_TUNING)
	{
		if(!response)
		{
			new string[2048];
			format(string, sizeof(string), "{FFFFFF}Spawnuj\nRespawnuj\nUnspawnuj\nZnajdź\nPokaż parking\nZłomuj\nUsuwanie tuningu\nPrzypisz do grupy\n{E2BA1B}Tablica rejestracyjna (KP){FFFFFF}");
			ShowPlayerDialogEx(playerid, D_AUTO_ACTION, DIALOG_STYLE_LIST, "Panel pojazdu", string, "Wybierz", "Wyjdź");
			return 1;
		}
		new lUID = IloscAut[playerid];
		switch(listitem)
		{
			case 0://Usuń tuning
			{
				CarData[lUID][c_Nitro] = 0;
				SendClientMessage(playerid, 0xFFC0CB, "Tuning (NITRO) zostanie usunięty przy najbliższym respawnie.");
			}
			case 1://Usuń tuning
			{
				CarData[lUID][c_bHydraulika] = false;
				SendClientMessage(playerid, 0xFFC0CB, "Tuning (HYDRAULIKA) zostanie usunięty przy najbliższym respawnie.");
			}
			case 2://Usuń tuning
			{
				CarData[lUID][c_Felgi] = 0;
				SendClientMessage(playerid, 0xFFC0CB, "Tuning (FELGI) zostanie usunięty przy najbliższym respawnie.");
			}
			case 3://Usuń tuning
			{
				CarData[lUID][c_Malunek] = 3;
				SendClientMessage(playerid, 0xFFC0CB, "Tuning (MALUNEK) zostanie usunięty przy najbliższym respawnie.");
			}
			case 4://Usuń tuning
			{
				CarData[lUID][c_Spoiler] = 0;
				SendClientMessage(playerid, 0xFFC0CB, "Tuning (SPOJLER) zostanie usunięty przy najbliższym respawnie.");
			}
			case 5://Usuń tuning
			{
				CarData[lUID][c_Bumper][0] = 0;
				CarData[lUID][c_Bumper][1] = 0;
				SendClientMessage(playerid, 0xFFC0CB, "Tuning (ZDERZAKI) zostanie usunięty przy najbliższym respawnie.");
			}
		}
		return 1;
	}
	else if(dialogid == D_AUTO_REJESTRACJA)
	{
		new lUID = IloscAut[playerid];
		if(!response) return RunCommand(playerid, "/car",  "");
		if(strlen(inputtext) < 1 || strlen(inputtext) > 9)
		{
			RunCommand(playerid, "/car",  "");
			SendClientMessage(playerid, COLOR_GRAD1, "Nieodpowiednia ilość znaków.");
			return 1;
		}
		else for (new i = 0, len = strlen(inputtext); i != len; i ++) {
			if ((inputtext[i] >= 'A' && inputtext[i] <= 'Z') || (inputtext[i] >= 'a' && inputtext[i] <= 'z') || (inputtext[i] >= '0' && inputtext[i] <= '9') || (inputtext[i] == ' '))
				continue;
			else return SendClientMessage(playerid, COLOR_GRAD1, "Użyłeś nieodpowiednich znaków rejestracji (tylko litery i cyfry).");
		}
		new registerText[32];
		format(registerText, sizeof(registerText), "%s", inputtext);
		CarData[lUID][c_Rejestracja] = registerText;
		SendClientMessage(playerid, 0xFFC0CB, "Tablica zostanie zmieniona po respawnie.");
		return 1;
	}
	else if(dialogid == 440)
	{
		if(response)
		{
			return ShowPlayerCarDialog(playerid, listitem+1);
		}
	}
	else if(dialogid == 450)
	{
		if(response)
		{
			new id = GetCarSalonSlotFromModel(strval(inputtext));
			if(id == -1) return sendErrorMessage(playerid, "Wystąpił błąd! Brak wybranego pojazdu w bazie. Zgłoś to administracji!"); // should never happen
			CreateSalonDialog(playerid, id);
			pojazdid[playerid] = SalonAut[id][sModel];
			CenaPojazdu[playerid] = Salon_ConvertStringToInt(SalonAut[id][sCena]);
		}
		else
		{
			DestroySalonDialog(playerid);
			ShowPlayerDialogEx(playerid, 440, DIALOG_STYLE_LIST, "Wybierz kategorię kupowanego pojazdu", "Samochody sportowe\nSamochody osobowe\nSamochody luksusowe\nSamochody terenowe\nPick-up`y\nKabriolety\nLowridery\nNa każdą kieszeń\nMotory\nInne pojazdy", "Wybierz", "Wyjdź");
		}
	}
	else if(dialogid == 4001)
	{
		if(response)
		{
			DestroySalonDialog(playerid);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wybierz kolor wybranego wozu");
			ShowPlayerDialogEx(playerid, 31, DIALOG_STYLE_LIST, "Wybierz Kolor 1", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
		}
		if(!response)
		{
			DestroySalonDialog(playerid);
			ShowPlayerCarDialog(playerid, GetPVarInt(playerid, "SalonCurrentType"));
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
		}
	}
	else if(dialogid == 31)
	{
		if(response)
		{
			DestroySalonDialog(playerid);
			switch(listitem)
			{
				case 0:
				{
					KolorPierwszy[playerid] = 0;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 1:
				{
					KolorPierwszy[playerid] = 1;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 2:
				{
					KolorPierwszy[playerid] = 2;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 3:
				{
					KolorPierwszy[playerid] = 3;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 4:
				{
					KolorPierwszy[playerid] = 4;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 5:
				{
					KolorPierwszy[playerid] = 126;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 6:
				{
					KolorPierwszy[playerid] = 6;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 7:
				{
					KolorPierwszy[playerid] = 7;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 8:
				{
					KolorPierwszy[playerid] = 8;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 9:
				{
					KolorPierwszy[playerid] = 42;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 10:
				{
					KolorPierwszy[playerid] = 16;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 11:
				{
					KolorPierwszy[playerid] = 20;
					ShowPlayerDialogEx(playerid, 32, DIALOG_STYLE_LIST, "Wybierz Kolor 2", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)", "Wybierz", "Wyjdź");
				}
				case 12:
				{
					ShowPlayerDialogEx(playerid, 35, DIALOG_STYLE_INPUT, "Wybierz Kolor 1", "Wpisz numer koloru (od 0 do 126)", "Wybierz", "Wyjdź");
				}
			}
		}
		if(!response)
		{
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
		}
	}
	else if(dialogid == 32)
	{
		DestroySalonDialog(playerid);
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 0, CenaPojazdu[playerid]);
				}
				case 1:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 1, CenaPojazdu[playerid]);
				}
				case 2:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 2, CenaPojazdu[playerid]);
				}
				case 3:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 3, CenaPojazdu[playerid]);
				}
				case 4:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 4, CenaPojazdu[playerid]);
				}
				case 5:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 126, CenaPojazdu[playerid]);
				}
				case 6:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 6, CenaPojazdu[playerid]);
				}
				case 7:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 7, CenaPojazdu[playerid]);
				}
				case 8:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 8, CenaPojazdu[playerid]);
				}
				case 9:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 42, CenaPojazdu[playerid]);
				}
				case 10:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 16, CenaPojazdu[playerid]);
				}
				case 11:
				{
					KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], 20, CenaPojazdu[playerid]);
				}
				case 12:
				{
					ShowPlayerDialogEx(playerid, 36, DIALOG_STYLE_INPUT, "Wybierz Kolor 2", "Wpisz numer koloru (od 0 do 126)", "Wybierz", "Wyjdź");
				}
			}
		}
		if(!response)
		{
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
			KolorPierwszy[playerid] = 0;
		}
	}
	else if(dialogid == 36)
	{
		if(response)
		{
			if(strval(inputtext) > 0 &&  strval(inputtext) < 255)
			{
				KupowaniePojazdu(playerid, pojazdid[playerid], KolorPierwszy[playerid], strval(inputtext), CenaPojazdu[playerid]);
			}
			else
			{
				ShowPlayerDialogEx(playerid, 36, DIALOG_STYLE_INPUT, "Wybierz Kolor 2", "Wpisz numer koloru (od 0 do 255)", "Wybierz", "Wyjdź");
			}
		}
		if(!response)
		{
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
			KolorPierwszy[playerid] = 0;
		}
	}
	else if(dialogid == D_AUTO_DESTROY)
	{
		if(response)
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(!IsCarOwner(playerid, GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_GRAD2, "Ten pojazd nie należy do Ciebie.");

				new vehicleid = GetPlayerVehicleID(playerid);
				new giveplayer[MAX_PLAYER_NAME + 1];
				GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
				Log(payLog, WARNING, "%s zezłomował auto %s i dostał 200$", GetPlayerLogName(playerid), GetVehicleLogName(vehicleid));
				RemovePlayerFromVehicleEx(playerid);
				ClearAnimations(playerid);
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);

				for(new i=0;i<MAX_CAR_SLOT;i++)
				{
					if(PlayerInfo[playerid][pCars][i] == VehicleUID[vehicleid][vUID])
						PlayerInfo[playerid][pCars][i] = 0;
				}
				Car_Destroy(VehicleUID[vehicleid][vUID]);

				DajKase(playerid, 200);
				SendClientMessage(playerid, COLOR_YELLOW, "Auto zezłomowane, dostajesz 200$");
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Wsiądź do pojazdu");
			}
		}
	}
	//System łodzi
	else if(dialogid == 400)//System łodzi - panel
	{
		if(response)
		{
			switch(listitem)
			{
				case 0://Ponton
				{
					ShowPlayerDialogEx(playerid, 402, DIALOG_STYLE_MSGBOX, "Kupowanie Pontonu", "Ponton\n\nCena: 95000$\nPrędkość Maksymalna: 120km/h\nWielkosc: Mały\nOpis: Mały, zwrotny oraz szybki ponton. Idealny do emocjonalnego pływania po morzu. Jego cena jest przyjazna dla początkujących żeglarzy. W 2 kolorach.", "Kup!", "Wróć");
					pojazdid[playerid] = 473;
					CenaPojazdu[playerid] = 95000;
				}
				case 1://Kuter
				{
					ShowPlayerDialogEx(playerid, 401, DIALOG_STYLE_MSGBOX, "Kupowanie Kutra", "Kuter\n\nCena: 100000$\nPrędkość Maksymalna: 70km/h\nWielkosc: Spory\nOpis: Jest to wolna oraz mało zwrotna łódź. Idealnie nadaje się do łowienia ryb. Pokład częściowo zadaszony, reszta otwarta. Dostępny w 1 kolorze.", "Kup!", "Wróć");
					pojazdid[playerid] = 453;
					CenaPojazdu[playerid] = 100000;
				}
				case 2://Coastguard
				{
					ShowPlayerDialogEx(playerid, 403, DIALOG_STYLE_MSGBOX, "Kupowanie Coastguarda", "Coastguard\n\nCena: 130.000$\nPrędkość Maksymalna: 160km/h\nWielkosc: Średni\nOpis: Dosyć szybkki oraz zwrotny statek. Nie jest zadaszony, pokład jest podłużny. Używany przez ratowników. Malowany na 2 kolory.", "Kup!", "Wróć");
					pojazdid[playerid] = 472;
					CenaPojazdu[playerid] = 130000;
				}
				case 3://Launch
				{
					ShowPlayerDialogEx(playerid, 404, DIALOG_STYLE_MSGBOX, "Kupowanie Launcha", "Launch\n\nCena: 160.000$\nPrędkość Maksymalna: 150km/h\nWielkosc: Średni\nOpis: Łódź bojowa, używana przez wojsko, ma podłużny kadłub. Dostępna jest wersja cywilna z atrapą karabinu. Nie jest zbyt zwrotna i szybka, ale ma walory bojowe. Zadaszona przednia część. Malowana w 1 kolorze.", "Kup!", "Wróć");
					pojazdid[playerid] = 595;
					CenaPojazdu[playerid] = 160000;
				}
				case 4://Speeder
				{
					ShowPlayerDialogEx(playerid, 405, DIALOG_STYLE_MSGBOX, "Kupowanie Speedera", "Speeder\n\nCena: 175.000$\nPrędkość Maksymalna: 220km/h\nWielkosc: Średni\nOpis: Typowa motorówka: smukła, duże przyspieszenie i prędkość. Jej zwrotność nie jest zachwycająca ale powinna zadowolić większość użytkowników. Malowana w 1 kolorze.", "Kup!", "Wróć");
					pojazdid[playerid] = 452;
					CenaPojazdu[playerid] = 175000;
				}
				case 5://Jetmax
				{
					ShowPlayerDialogEx(playerid, 407, DIALOG_STYLE_MSGBOX, "Kupowanie Jetmaxa", "Jetmax\n\nCena: 200.000$\nPrędkość Maksymalna: 220km/h\nWielkosc: Spory\nOpis: Motorówka wyścigowa, stworzona do dużych prędkości. Jej cecha charakterystyczna to ogromny silnik wystający z tyłu łodzi. Malowana w 2 kolorach.", "Kup!", "Wróć");
					pojazdid[playerid] = 493;
					CenaPojazdu[playerid] = 200000;
				}
				case 6://Tropic
				{
					ShowPlayerDialogEx(playerid, 406, DIALOG_STYLE_MSGBOX, "Kupowanie Tropica", "Speeder\n\nCena: 250.000$\nPrędkość Maksymalna: 160km/h\nWielkosc: Duży\nOpis: Luksusowy jacht wycieczkowy. Posiada dwa piętra, miejsce mieszkalne i dach. Nie jest zwrotny ale szybki. Idealny dla bogaczy.", "Kup!", "Wróć");
					pojazdid[playerid] = 454;
					CenaPojazdu[playerid] = 250000;
				}
				case 7://Squallo
				{
					ShowPlayerDialogEx(playerid, 408, DIALOG_STYLE_MSGBOX, "Kupowanie Squallo", "Squallo\n\nCena: 275000$\nPrędkość Maksymalna: 260km/h\nWielkosc: Spory\nOpis: Motorówka luksusowo wyścigowa. Jej prędkość jest nieprzyzwoicie duża a wygląd i luksus sprawią że będzie się czuł jak prawdziwy bogacz. Malowana w 2 kolorach.", "Kup!", "Wróć");
					pojazdid[playerid] = 446;
					CenaPojazdu[playerid] = 275000;
				}
				case 8://Jacht
				{
					ShowPlayerDialogEx(playerid, 409, DIALOG_STYLE_MSGBOX, "Kupowanie Jachtu", "Jacht\n\nCena: 300000$\nPrędkość Maksymalna: 80km/h\nWielkosc: Wielki\nOpis: Jacht to statek dla ludzi którzy wyprawiają się w międzykontynentalną przeprawę oraz pragną luksusu. Można w nim spać i normalnie gdyż posiada spore wnętrze. Malowany w 2 kolorach.\n((UWAGA! Pojazd posiada wnętrze do którego można wchodzić komendą /wejdzw))", "Kup!", "Wróć");
					pojazdid[playerid] = 484;
					CenaPojazdu[playerid] = 300000;
				}
			}
		}
		if(!response)
		{
			return 1;
		}
	}
	else if(dialogid == 410)//System samolotów - panel
	{
		if(response)
		{
			switch(listitem)
			{
				case 0://Dodo
				{
					ShowPlayerDialogEx(playerid, 411, DIALOG_STYLE_MSGBOX, "Kupowanie Dodo", "Dodo\n\nCena: 300.000$\nPrędkość lotu poziomego: 150km/h\nWielkosc: Mały\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 593;
					CenaPojazdu[playerid] = 300000;
				}
				case 1://Cropduster
				{
					ShowPlayerDialogEx(playerid, 412, DIALOG_STYLE_MSGBOX, "Kupowanie Cropdustera", "Cropduster\n\nCena: 350.000$\nPrędkość lotu poziomego: 140km/h\nWielkosc: Średni\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 512;
					CenaPojazdu[playerid] = 350000;
				}
				case 2://Beagle
				{
					ShowPlayerDialogEx(playerid, 413, DIALOG_STYLE_MSGBOX, "Kupowanie Beagle", "Beagle\n\nCena: 500.000$\nPrędkość lotu poziomego: 160km/h\nWielkosc: Spory\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 511;
					CenaPojazdu[playerid] = 500000;
				}
				case 3://Stuntplane
				{
					ShowPlayerDialogEx(playerid, 414, DIALOG_STYLE_MSGBOX, "Kupowanie Stuntplane", "Stuntplane\n\nCena: 585.000$\nPrędkość lotu poziomego: 190km/h\nWielkosc: Mały\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 513;
					CenaPojazdu[playerid] = 585000;
				}
				case 4://Nevada
				{
					ShowPlayerDialogEx(playerid, 415, DIALOG_STYLE_MSGBOX, "Kupowanie Nevady", "Nevada\n\nCena: 680.000$\nPrędkość lotu poziomego: 205km/h\nWielkosc: Duży\nOpis: ((UWAGA! Pojazd posiada wnętrze do którego można wchodzić komendą /wejdzw))", "Kup!", "Wróć");
					pojazdid[playerid] = 553;
					CenaPojazdu[playerid] = 680000;
				}
				case 5://Shamal
				{
					ShowPlayerDialogEx(playerid, 416, DIALOG_STYLE_MSGBOX, "Kupowanie Shamala", "Shamal\n\nCena: 1.000.000$\nPrędkość lotu poziomego: 300km/h\nWielkosc: Duży\nOpis: Odrzutowiec ((UWAGA! Pojazd posiada wnętrze do którego można wchodzić komendą /wejdzw))", "Kup!", "Wróć");
					pojazdid[playerid] = 519;
					CenaPojazdu[playerid] = 1000000;
				}
			}
		}
		if(!response)
		{
			return 1;
		}
	}
	else if(dialogid == 420)//System helikopterów - panel
	{
		if(response)
		{
			switch(listitem)
			{
				case 0://Sparrow
				{
					ShowPlayerDialogEx(playerid, 421, DIALOG_STYLE_MSGBOX, "Kupowanie Sparrowa", "Sparrow\n\nCena: 325.000$\nŚrednia prędkość lotu: 160km/h\nWielkosc: Mały\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 469;
					CenaPojazdu[playerid] = 325000;
				}
				case 1://Maverick
				{
					ShowPlayerDialogEx(playerid, 422, DIALOG_STYLE_MSGBOX, "Kupowanie Mavericka", "Maverick\n\nCena: 600.000$\nŚrednia prędkość lotu: 180km/h\nWielkosc: Średni\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 487;
					CenaPojazdu[playerid] = 600000;
				}
				case 2://Leviathan
				{
					ShowPlayerDialogEx(playerid, 423, DIALOG_STYLE_MSGBOX, "Kupowanie Leviathana", "Leviathan\n\nCena: 265.000$\nŚrednia prędkość lotu: 130km/h\nWielkosc: Duży\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 417;
					CenaPojazdu[playerid] = 265000;
				}
				case 3://Raindance
				{
					ShowPlayerDialogEx(playerid, 424, DIALOG_STYLE_MSGBOX, "Kupowanie Raindance", "Raindance\n\nCena: 325.000$\nŚrednia prędkość lotu: 100km/h\nWielkosc: Spory\nOpis:", "Kup!", "Wróć");
					pojazdid[playerid] = 563;
					CenaPojazdu[playerid] = 325000;
				}
			}
		}
		if(!response)
		{
			return 1;
		}
	}
	else if(dialogid >= 401 && dialogid <= 409)
	{
		if(response)
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wybierz kolor wybranej łodzi");
			ShowPlayerDialogEx(playerid, 31, DIALOG_STYLE_LIST, "Wybierz Kolor 1", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)\nInny", "Wybierz", "Wyjdź");
		}
		if(!response)
		{
			ShowPlayerDialogEx(playerid, 400, DIALOG_STYLE_LIST, "Kupowanie łodzi", "Ponton\t\t95 000$\nKuter\t\t100 000$\nCoastguard\t130 000$\nLaunch\t\t160 000$\nSpeeder\t175 000$\nJetmax\t\t200 000$\nTropic\t\t250 000$\nSquallo\t\t275 000$\nJacht\t\t300 000$", "Wybierz", "Wyjdź");
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
		}
	}
	else if(dialogid >= 411 && dialogid <= 417)
	{
		if(response)
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wybierz kolor wybranego samolotu");
			ShowPlayerDialogEx(playerid, 31, DIALOG_STYLE_LIST, "Wybierz Kolor 1", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)\nInny", "Wybierz", "Wyjdź");
		}
		if(!response)
		{
			ShowPlayerDialogEx(playerid, 410, DIALOG_STYLE_LIST, "Kupowanie samolotu", "Dodo\t\t\t300 000$\nCropduster\t350 000$\nBeagle\t\t500 000$\nStuntplane\t585 000$\nNevada\t\t680 000$\nShamal\t\t1 000 000$", "Wybierz", "Wyjdź");
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
		}
	}
	else if(dialogid >= 421 && dialogid <= 424)
	{
		if(response)
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wybierz kolor wybranego helikopteru");
			ShowPlayerDialogEx(playerid, 31, DIALOG_STYLE_LIST, "Wybierz Kolor 1", "Czarny\nBialy\nJasno-niebieski\nCzerwony\nZielony\nRóżowy\nŻółty\nNiebieski\nSzary\nJasno-czerwony\nJasno-zielony\nFioletowy\nInny (Numer)\nInny", "Wybierz", "Wyjdź");
		}
		if(!response)
		{
			ShowPlayerDialogEx(playerid, 420, DIALOG_STYLE_LIST, "Kupowanie Helikopteru", "Sparrow\t\t125 000$\nMaverick\t\t200 000$\nLeviathan\t\t265 000$\nRaindance\t\t325 000$", "Wybierz", "Wyjdź");
			pojazdid[playerid] = 0;
			CenaPojazdu[playerid] = 0;
		}
	}
	else if(dialogid == 5002)
	{
		if(!response)
		{
			SendClientMessage(playerid, COLOR_RED, "Anulowano przypisanie do grupy.");
			return 1;
		}
		new groupid = DynamicGui_GetValue(playerid, listitem);
		if(!IsValidGroup(groupid)) return sendErrorMessage(playerid, "Wybrana grupa jest nieprawidłowa.");
		new lUID = IloscAut[playerid];
		if(lUID <= 0) return SendClientMessage(playerid, COLOR_RED, "Nie wybrano pojazdu.");

		if(CarData[lUID][c_OwnerType] == CAR_OWNER_PLAYER)
		{
			new prevpuid = CarData[lUID][c_Owner];
			foreach(new p : Player)
			{
				if(PlayerInfo[p][pUID] == prevpuid)
				{
					for(new j=0;j<MAX_CAR_SLOT;j++)
					{
						if(PlayerInfo[p][pCars][j] == lUID) PlayerInfo[p][pCars][j] = 0;
					}
					break;
				}
			}
		}
		CarData[lUID][c_OwnerType] = CAR_OWNER_GROUP;
		CarData[lUID][c_Owner] = groupid;
		Car_Save(lUID, CAR_SAVE_OWNER);
		SendClientMessage(playerid, COLOR_WHITE, "Pojazd został przypisany do wybranej grupy.");
		Log(serverLog, WARNING, "Gracz %s przypisał pojazd %s do grupy %d", GetPlayerLogName(playerid), GetCarDataLogName(lUID), groupid);
		return 1;
	}
	return 0;
}

//end