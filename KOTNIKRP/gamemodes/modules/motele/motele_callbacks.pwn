//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                   motele                                                  //
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
// Autor: xSeLeCTx
// Data utworzenia: 14.05.2021
//Opis:
/*
	System moteli
*/

//

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
Motele_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_MOTEL)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0: // Wynajmij
			{
				new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu
				if(motelID != -1)
				{
					if(Motels[motelID][motRooms] != -1) // Sprawdza czy pokój ma nielimitowane pokoje
					{
						if(Motels[motelID][motOccupied] >= Motels[motelID][motRooms]) // Czy motel jest przepełniony
						{
							return Motel_ShowError(playerid, motelID, "Ten motel nie ma już wolnych pokoi."); // Wyświetla błąd
						}
					}
					if(PlayerInfo[playerid][pDom] != 0) return Motel_ShowError(playerid, motelID, "Nie możesz wynająć pokoju, gdy posiadasz własny dom."); // Wyświetla błąd
					if(PlayerInfo[playerid][pWynajem] != 0) return Motel_ShowError(playerid, motelID, "Nie możesz wynająć pokoju, gdy posiadasz wynajmujesz dom."); // Wyświetla błąd
					if(PlayerInfo[playerid][pMotRoom] != 0) return Motel_ShowError(playerid, motelID, "Nie możesz wynająć pokoju, gdy wynajmujesz już inny pokój."); // Wyświetla błąd
					
					new string[256];
					format(string, sizeof(string), "{FFFFFF}Wynajem pokoju w tym motelu kosztuje {11d625}$%d{FFFFFF} za dobę.\nOpłata jest pobierana raz dziennie o 8:00.\n{FF0000}Pierwsza opłata pobierana jest natychmiast.\n{FFFFFF}Czy chcesz kontynuować?",Motels[motelID][motPrice]);
					ShowPlayerDialogEx(playerid, DIALOG_MOTEL_RENT, DIALOG_STYLE_MSGBOX, sprintf("{e8c205} %s {ffffff}» Wynajem",Motels[motelID][motName]), string, "Tak", "Nie");
				}
				return 1;
			}
			case 1: // Wejdź do kogoś
			{
				new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu
				if(motelID != -1)
				{
					ShowPlayerDialogEx(playerid, DIALOG_MOTEL_ENTER_SELECT, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Wyszukaj pokój",Motels[motelID][motName]), "» Po imieniu i nazwisku / ID\n» Po numerze pokoju", "Wybierz", "Anuluj");
				}
				return 1;
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_ENTER_SELECT)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return command_motel_Impl(playerid, "null");

		if(AntySpam[playerid] == 1) {
			return Motel_ShowError(playerid, motelID, "Odczekaj 15 sekund."); // Wyświetla błąd
		}
		SetTimerEx("AntySpamTimer",15000,0,"d",playerid);
        AntySpam[playerid] = 1;
		switch(listitem)
		{
			case 0: // Pod ID/Nicku
			{
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_ENTER_ID, DIALOG_STYLE_INPUT, sprintf("{e8c205} %s {ffffff}» Wejdź",Motels[motelID][motName]), "Wpisz poniżej imię i nazwisko lub ID gracza, do którego chcesz się dostać.", "Wejdź", "Anuluj");
			}
			case 1: // Po numerze pokoju
			{
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_ENTER_NUMBER, DIALOG_STYLE_INPUT, sprintf("{e8c205} %s {ffffff}» Wejdź",Motels[motelID][motName]), "Wpisz poniżej numer pokoju, do którego chcesz się dostać.", "Wejdź", "Anuluj");
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_ENTER_ID)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return command_motel_Impl(playerid, "null"); // Wraca do startowego panelu

		new pid = ReturnUser(inputtext);
		if(pid != INVALID_PLAYER_ID)
		{
			new roomID = Motel_FindRoomIDFromPlayerID(pid); // Szuka pokoju po ID gracza
			if(roomID == -1) return Motel_ShowError(playerid, motelID, "Ten gracz nie posiada pokoju w tym motelu."); // Wyświetla błąd
			if(Motels[motelID][motUID] != MotelRooms[roomID][mtrMotUID]) return Motel_ShowError(playerid, motelID, "Ten gracz nie posiada pokoju w tym motelu."); // Wyświetla błąd
		
			Motel_Room_Wejdz(playerid, roomID); // Próbuje wejść do pokoju
		} else return Motel_ShowError(playerid, motelID, "Nie ma takiego gracza."); // Wyświetla błąd
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_ENTER_NUMBER)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return command_motel_Impl(playerid, "null"); // Wraca do startowego panelu

		if(strval(inputtext) == 0) return Motel_ShowError(playerid, motelID, "W tym motelu nie ma takiego pokoju."); // Wyświetla błąd
		if(!Motel_CheckIfRoomExists(Motels[motelID][motUID], strval(inputtext))) return Motel_ShowError(playerid, motelID, "W tym motelu nie ma takiego pokoju."); // Wyświetla błąd

		Motel_Room_Wejdz(playerid, Motel_GetRoomIDFromRoomNumber(Motels[motelID][motUID], strval(inputtext))); // Próbuje wejść do pokoju
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_RENT)
	{
		if(!response) return command_motel_Impl(playerid, "null");
		new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu lub w pokoju
		if(motelID != -1)
		{
			if(kaska[playerid] < Motels[motelID][motPrice]) return Motel_ShowError(playerid, motelID, "Nie stać cię na pokój w tym motelu."); // Wyświetla błąd
			new room;
			new generated = false;
			new antiInfiniteLoop = 0;
			while(!generated) // Generator losowego numeru pokoju
			{
				if(antiInfiniteLoop <= 20) // W przypadku gdy system nie będzie mógł wygenerować numeru pokoju wyświetli się błąd
				{
					room = random(9998)+1;
					antiInfiniteLoop++;
					if(!Motel_CheckIfRoomExists(Motels[motelID][motUID], room)) generated = true; // Jeżeli pokój nie istnieje to wychodzi z pętli
				} else return Motel_ShowError(playerid, motelID, "Wystąpił błąd! (Nie można wygenerować numeru pokoju)"); // Wyświetla błąd
			}
			Motel_Rent(playerid, Motels[motelID][motUID], room, Motel_GetRandomInterior()); // Wywołuje właściwą funkcję wynajmu pokoju
			return 1;
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_2)
	{
		if(!response) return 1;
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu lub w pokoju
		if(motelID == -1) return 1;
		switch(listitem)
		{
			case 0: // Wejdź
			{
				if(GetPlayerVirtualWorld(playerid) < MOTEL_VW) { // Gracz jest w motelu
					return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_WHERE, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Wejdź", Motels[motelID][motName]), "» Wejdź do siebie\n» Wejdź do kogoś", "Wybierz", "Anuluj");
				} else { // Gracz jest w pokoju
					return Motel_Room_Wyjdz(playerid, PlayerInfo[playerid][pMotRoom]);
				}
			}
			case 1: // Zarządzaj
			{
				if(Motels[motelID][motUID] == MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrMotUID]) {
					new string[128];
					format(string, sizeof(string), "» Drzwi %s\n» Zarządzaj dostępem", (MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrDoors] == 0 ? "{ff0000}(zamknięte){FFFFFF}" : "{11d625}(otwarte){FFFFFF}"));
					return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_MANAGE, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Zarządaj",Motels[motelID][motName]), string, "Wybierz", "Anuluj");
				} else {
					return Motel_ShowError(playerid, motelID, "Nie masz pokoju w tym motelu!");
				}
			}
			case 2: // Ustaw spawn
			{
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_SPAWN, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Ustaw spawn",Motels[motelID][motName]), "» Normalny spawn\n» Spawn przed motelem\n» Spawn w pokoju", "Wybierz", "Anuluj");
			}
			case 3: // Zrezygnuj z wynajmu
			{
				if(Motels[motelID][motUID] == MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrMotUID]) {
					new string[256];
					format(string, sizeof(string), "{FFFFFF}Przy rezygnacji z wynajmu pobierana jest kwota dobowa w wysokości {11d625}$%d {FFFFFF}.\nCzy na pewno chcesz zrezygnować?", Motels[motelID][motPrice]);
					return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_UNRENT, DIALOG_STYLE_MSGBOX, sprintf("{e8c205} %s {ffffff}» Zrezygnuj", Motels[motelID][motName]), string, "Zrezygnuj", "Anuluj");
				} else {
					return Motel_ShowError(playerid, motelID, "Nie masz pokoju w tym motelu!");
				}
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_SPAWN)
	{
		if(!response) return command_motel_Impl(playerid, "null");
		PlayerInfo[playerid][pSpawn] = listitem;
		switch(listitem)
		{
			case 0: SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował na swoim normalnym spawnie");
			case 1: SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował przed motelem");
			case 2: SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował wewnątrz pokoju");
		}
		command_motel_Impl(playerid, "null");
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_WHERE)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return command_motel_Impl(playerid, "null");
		switch(listitem)
		{
			case 0: // Wejdź do siebie
			{
				if(Motels[motelID][motUID] == MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrMotUID]) {
					return Motel_Room_Wejdz(playerid, PlayerInfo[playerid][pMotRoom]);
				} else {
					return Motel_ShowError(playerid, motelID, "Nie masz pokoju w tym motelu!");
				}
			}
			case 1: // Wejdź do kogoś
			{
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_ENTER_SELECT, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Wyszukaj pokój",Motels[motelID][motName]), "» Po imieniu i nazwisku / ID\n» Po numerze pokoju", "Wybierz", "Anuluj");
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_UNRENT)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return command_motel_Impl(playerid, "null");
		Motel_Unrent(playerid);
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_MANAGE)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return command_motel_Impl(playerid, "null");
		switch(listitem)
		{
			case 0: // Drzwi
			{
				MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrDoors] = !MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrDoors]; // Otwiera/zamyka drzwi
				return Motele_OnDialogResponse(playerid, DIALOG_MOTEL_2, true, 1, ""); // Wraca do dialogu zarządzania pokojem
			}
			case 1: // Panel dostępu
			{
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_MANAGE_SELECT, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Zarządzaj", Motels[motelID][motName]), "» Zaproś\n» Lista dostępu", "Wybierz", "Anuluj");
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_MANAGE_SELECT)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return Motele_OnDialogResponse(playerid, DIALOG_MOTEL_2, true, 1, ""); // Wraca do dialogu zarządzania pokojem

		switch(listitem)
		{
			case 0: // Zaproś
			{
				if(MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrAccessCount] >= MOTEL_MAX_ACCESS) return Motel_ShowError(playerid, motelID, "Nie możesz zaprosić już więcej osób."); // Wyświetla błąd
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_MANAGE_INVITE, DIALOG_STYLE_INPUT, sprintf("{e8c205} %s {ffffff}» Zaproś", Motels[motelID][motName]), "{FFFFFF}Wpisz poniżej imię i nazwisko lub ID gracza.\nZaproszenie oznacza przyznanie permamentnego dostępu do pokoju.\nMożesz później zabrać dostęp w panelu zarządzania pokojem.", "Zaproś", "Anuluj");
			}
			case 1: // Lista dostępu
			{
				new roomID = PlayerInfo[playerid][pMotRoom];
				if(MotelRooms[roomID][mtrAccessCount] <= 0) return Motel_ShowError(playerid, motelID, "Nikt nie posiada dostępu do twojego pokoju."); // Wyświetla błąd
				new string[256];
				for(new i = 0; i < MOTEL_MAX_ACCESS; i++) {
					new nick[32];
					format(nick, sizeof(nick), "%s", MotelRoomsAccess[roomID][i][mtraNick]);
					strreplace(nick, "_", " ");
					strins(string, sprintf("%s\n", nick), strlen(string));
				}
				return ShowPlayerDialogEx(playerid, DIALOG_MOTEL_MANAGE_LIST, DIALOG_STYLE_LIST, sprintf("{e8c205} %s {ffffff}» Lista dostępu", Motels[motelID][motName]), string, "Wybierz", "Anuluj");
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_MANAGE_LIST)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return Motele_OnDialogResponse(playerid, DIALOG_MOTEL_MANAGE, true, 1, ""); // Wraca do dialogu zarządzania listą

		new roomID = PlayerInfo[playerid][pMotRoom];
		SetPVarInt(playerid, "MotelManageListID", listitem);
		new string[128];
		new nick[32];
		format(nick, sizeof(nick), "%s", MotelRoomsAccess[roomID][listitem][mtraNick]);
		strreplace(nick, "_", " ");
		format(string, sizeof(string), "Czy na pewno chcesz odebrać dostęp do pokoju %s?", nick);
		ShowPlayerDialogEx(playerid, DIALOG_MOTEL_MANAGE_REMOVE, DIALOG_STYLE_MSGBOX, sprintf("{e8c205} %s {ffffff}» Odbierz dostęp", Motels[motelID][motName]), string, "Tak", "Nie");
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_MANAGE_REMOVE)
	{
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return Motele_OnDialogResponse(playerid, DIALOG_MOTEL_MANAGE_SELECT, true, 1, ""); // Wraca do dialogu zarządzania listą

		new roomID = PlayerInfo[playerid][pMotRoom];
		Motel_RemoveUIDFromAccess(PlayerInfo[playerid][pMotRoom], MotelRoomsAccess[roomID][GetPVarInt(playerid, "MotelManageListID")][mtraUID]);
		Motele_OnDialogResponse(playerid, DIALOG_MOTEL_MANAGE_SELECT, true, 1, ""); // Wraca do dialogu zarządzania listą
		return 1;
	}
	else if(dialogid == DIALOG_MOTEL_MANAGE_INVITE)
	{
		new pid = ReturnUser(inputtext);
		new motelID = Motel_GetCurrent(playerid, false, false, true, true); // Sprawdza czy gracz jest w motelu
		if(motelID == -1) return 1;
		if(!response) return Motele_OnDialogResponse(playerid, DIALOG_MOTEL_2, true, 1, ""); // Wraca do dialogu zarządzania pokojem

		if(pid != INVALID_PLAYER_ID)
		{
			if(pid == playerid) return Motel_ShowError(playerid, motelID, "Nie możesz zaprosić samego siebie."); // Wyświetla błąd
			new string[256];
			SetPVarInt(pid, "MotelPendingInviteFrom", playerid);
			SetPVarInt(pid, "MotelPendingInviteToRoom", PlayerInfo[playerid][pMotRoom]);
			SetPVarString(pid, "MotelPendingInviteFromName", GetNick(playerid));

			new nick[32], nick2[32];
			format(nick, sizeof(nick), "%s", GetNick(playerid));
			strreplace(nick, "_", " ");
			format(nick2, sizeof(nick2), "%s", GetNick(pid));
			strreplace(nick2, "_", " ");

			format(string, sizeof(string), "{e8c205}| -------------- [ {FFFFFF}Zaproszenie od %s{e8c205} ] -------------- |", nick);
			SendClientMessage(pid, -1, string);
			format(string, sizeof(string), "Dostałeś zaproszenie do pokoju w motelu od %s. Wpisz {bfbfbf}/akceptuj zaproszenie{FFFFFF} by zaakceptować.", nick);
			SendClientMessage(pid, -1, string);

			format(string, sizeof(string), "{e8c205}| -------------- [ {FFFFFF}%s{e8c205} ] -------------- |", Motels[motelID][motName]);
			SendClientMessage(playerid, -1, string);
			format(string, sizeof(string), "Wysłałeś zaproszenie do %s, może on je teraz zaakceptować by uzyskać dostęp do twojego pokoju.", nick2);
			SendClientMessage(playerid, -1, string);

			Motele_OnDialogResponse(playerid, DIALOG_MOTEL_2, true, 1, ""); // Wraca do dialogu zarządzania pokojem

		} else return Motel_ShowError(playerid, motelID, "Nie ma takiego gracza."); // Wyświetla błąd
		return 1;
	}
	else if(dialogid == DIALOG_AMOTEL)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0: // Stwórz
			{
				sendTipMessage(playerid, "Użyj /amotel stworz"); // :)
			}
			case 1: // Teleport
			{
				ShowPlayerDialogEx(playerid, DIALOG_AMOTEL_TELEPORT, DIALOG_STYLE_INPUT, "{e8c205}Kreator moteli {FFFFFF}» Teleport", "Wpisz poniżej UID motelu do, którego chcesz się przeteleportować.", "Wybierz", "Anuluj");
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_AMOTEL_TELEPORT)
	{
		if(!response) return command_amotel_Impl(playerid, "", "");
		new motelID = Motel_GetMotelIDFromUID(strval(inputtext));
		if(motelID == -1 || motelID == 0)
		{
			sendErrorMessage(playerid, "Motel o podanym UID nie istnieje!");
			Motele_OnDialogResponse(playerid, DIALOG_AMOTEL, true, 1, " ");
		}
		else
		{
			SetPlayerPos(playerid, Motels[motelID][motPosX], Motels[motelID][motPosY], Motels[motelID][motPosZ]);
			SetPlayerInterior(playerid, Motels[motelID][motInt]);
			SetPlayerVirtualWorld(playerid, Motels[motelID][motVW]);
			sendTipMessage(playerid, "Zostałeś teleportowany!");
		}
		return 1;
	}
	else if(dialogid == DIALOG_AMOTEL_EDIT)
	{
		if(!response) return 1;
		new motelID = Motel_GetCurrent(playerid, true, true, true);
		if(motelID == -1) return 1;
		SetPVarInt(playerid, "AMotelEdit", listitem+1);
		new string[128];
		switch(listitem)
		{
			case 0: // Edycja nazwy
			{
				format(string, sizeof(string), "{e8c205}%s [UID: %d] {FFFFFF}» Edycja nazwy", Motels[motelID][motName], Motels[motelID][motUID]);
				ShowPlayerDialogEx(playerid, DIALOG_AMOTEL_CHANGE, DIALOG_STYLE_INPUT, string, "Wpisz poniżej nową nazwę motelu.", "OK", "Anuluj");
			}
			case 1: // Edycja ceny
			{
				format(string, sizeof(string), "{e8c205}%s [UID: %d] {FFFFFF}» Edycja ceny", Motels[motelID][motName], Motels[motelID][motUID]);
				ShowPlayerDialogEx(playerid, DIALOG_AMOTEL_CHANGE, DIALOG_STYLE_INPUT, string, "Wpisz poniżej nową cenę za dobę", "OK", "Anuluj");
			}
			case 2: // Edycja ilości pokoi
			{
				format(string, sizeof(string), "{e8c205}%s [UID: %d] {FFFFFF}» Ilość pokoi", Motels[motelID][motName], Motels[motelID][motUID]);
				ShowPlayerDialogEx(playerid, DIALOG_AMOTEL_CHANGE, DIALOG_STYLE_INPUT, string, "Wpisz poniżej nową ilość pokoi.", "OK", "Anuluj");
			}
			case 3: // Zmiana interioru
			{
				sendTipMessage(playerid, "Użyj /amotel interior"); // :)
			}
			case 4: // Usuwanie
			{
				format(string, sizeof(string), "{e8c205}%s [UID: %d] {FFFFFF}» Usuwanie", Motels[motelID][motName], Motels[motelID][motUID]);
				ShowPlayerDialogEx(playerid, DIALOG_AMOTEL_CHANGE, DIALOG_STYLE_MSGBOX, string, "Czy na pewno chcesz usunąć motel?\n{FF0000}Czynność jest NIEODWRACALNA.\nWszyscy gracze, którzy wynajmują w tym motelu pokój zostaną EKSMITOWANI.", "OK", "Anuluj");
			}
		}
		return 1;
	}
	else if(dialogid == DIALOG_AMOTEL_CHANGE)
	{
		if(!response) return command_amotel_Impl(playerid, "", "");
		new motelID = Motel_GetCurrent(playerid, true, true, true);
		if(motelID == -1) return 1;
		new MotelEdit = GetPVarInt(playerid, "AMotelEdit");
		switch(MotelEdit)
		{
			case 1: // Edycja nazwy
			{
				format(Motels[motelID][motName], 64, "%s", inputtext);
			}
			case 2: // Edycja ceny
			{
				Motels[motelID][motPrice] = strval(inputtext);
			}
			case 3: // Edycja ilości pokoi
			{
				Motels[motelID][motRooms] = strval(inputtext);
			}
			case 4: // Zmiana interioru
			{
				return 1; // ???
			}
			case 5: // Usuwanie
			{
				Motel_Destroy(playerid, motelID);
			}
		}
		if(MotelEdit != 5) MruMySQL_SaveMotel(motelID);
		command_amotel_Impl(playerid, "", "");
		return 1;
	}
	return 0;
}

hook OnGameModeExit()
{
	MruMySQL_SaveMotels();
	MruMySQL_SaveMotelRooms();
}

hook OnPlayerSpawn(playerid)
{
	if(gPlayerLogged[playerid])
	{
		if(PlayerInfo[playerid][pMotEvict] != 0)
		{
			Motel_Unrent(playerid, PlayerInfo[playerid][pMotEvict], 1);
			PlayerInfo[playerid][pMotEvict] = 0;
			PlayerInfo[playerid][pMotRoom] = 0;
		}

		if(PlayerInfo[playerid][pMotRoom] > 0 && MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrOwnerUID] == PlayerInfo[playerid][pUID])
		{
			if(MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrPayOffline] > 0)
			{
				new string[128];
				format(string, sizeof(string), "{e8c205}| -------------- [ {FFFFFF}%s{e8c205} ] -------------- |", Motels[Motel_GetMotelIDFromUID(MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrMotUID])][motName]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof(string), "Z twojego konta zostało pobrane łącznie {11d625}$%d{FFFFFF} gdy byłeś offline.", MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrPayOffline]);
				SendClientMessage(playerid, -1, string);

				MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrPayOffline] = 0;
			}
			new Year, Month, Day;
			getdate(Year, Month, Day);
			format(MotelRooms[PlayerInfo[playerid][pMotRoom]][mtrLastOnline], 32, "%d.%d.%d", Year, Month, Day);
			MruMySQL_SaveMotelRoom(PlayerInfo[playerid][pMotRoom]);

		}
		else PlayerInfo[playerid][pMotRoom] = 0;
	}
}
//end