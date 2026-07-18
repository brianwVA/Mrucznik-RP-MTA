//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                   grupy                                                   //
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
// Data utworzenia: 11.12.2021
//Opis:
/*
	System grup
*/

//

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerConnect(playerid)
{
	
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid, "cmdgmenu") == 1) DestroyGroupTextDraws(playerid);
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case D_GROUPLEADERPANEL:
		{
			if(!response) return SetPVarInt(playerid, "group-panel", 0);
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			if(listitem == 0) //Rangi
			{
				GroupShowLeaderPanel(playerid, groupid, 2);
			}
			else if(listitem == 1) //Pojazdy
			{
				GroupShowLeaderPanel(playerid, groupid, 4);
			}
			else if(listitem == 2) //Pracownicy
			{
				GroupShowLeaderPanel(playerid, groupid, 3);
			}
			else if(listitem == 3) //Liderzy
			{
				GroupShowLeaderPanel(playerid, groupid, 5);
			}
			else if(listitem == 4) //Kolor grupy
			{
				if(!GroupIsLeader(playerid, groupid))
				{
					sendErrorMessage(playerid, "Brak uprawnień, musisz być głównym liderem!");
					return GroupShowLeaderPanel(playerid, groupid, 1);
				}
				ShowPlayerDialogEx(playerid, D_GROUP_SET_COLOR, DIALOG_STYLE_INPUT, MruTitle("Zmiana koloru grupy"), sprintf("Wprowadź poniżej nowy kolor grupy w formacie RRGGBB\nAktualny: %06x", GroupInfo[groupid][g_Color] >>> 8), "Zmień", "Anuluj");
			}
			else if(listitem == 5) //Nazwa grupy
			{
				if(!GroupIsLeader(playerid, groupid))
				{
					sendErrorMessage(playerid, "Brak uprawnień, musisz być głównym liderem!");
					return GroupShowLeaderPanel(playerid, groupid, 1);
				}
				ShowPlayerDialogEx(playerid, D_GROUP_SET_NAME, DIALOG_STYLE_INPUT, MruTitle("Zmiana nazwy grupy"), sprintf("Wpisz poniżej nową nazwę grupy\nAktualna: {BA782D}%s", GroupInfo[groupid][g_Name]), "Zmień", "Anuluj");
			}
			else if(listitem == 6) //ShortName
			{
				if(!GroupIsLeader(playerid, groupid))
				{
					sendErrorMessage(playerid, "Brak uprawnień, musisz być głównym liderem!");
					return GroupShowLeaderPanel(playerid, groupid, 1);
				}
				ShowPlayerDialogEx(playerid, D_GROUP_SET_SNAME, DIALOG_STYLE_INPUT, MruTitle("Zmiana skrótu grupy"), sprintf("Wpisz poniżej nowy skrót grupy\nAktualny: {BA782D}%s", GroupInfo[groupid][g_ShortName]), "Zmień", "Anuluj");
			}
			else if(listitem == 7) //Flagi
			{
				new string[1024];
				for(new i = 0; i < sizeof(gUprawnieniaInfo); i++)
				{
					if(!GroupHavePerm(groupid, i+1)) continue;
					format(string, sizeof(string), "%s\n{00FF00}%s", string, gUprawnieniaInfo[i]);
				}
				if(!strlen(inputtext))
					return sendErrorMessage(playerid, "Ta grupa nie posiada żadnych uprawnień!");
				ShowPlayerDialogEx(playerid, 0, DIALOG_STYLE_LIST, MruTitle("Uprawnienia grupy"), string, "OK", #);
			}
			else if(listitem == 8 && GroupHavePerm(groupid, PERM_RESTAURANT)) //Restauracja
			{
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PANEL_OPTIONS, DIALOG_STYLE_LIST, "Panel restauracji", "Zarządzaj produktami", "Dalej", "Zamknij");
			}
			else //Show info about group
			{
				GroupShowInfo(playerid, groupid);
			}
		}
		//-- Panel --
		//-- Zarządzanie danymi grupy
		case D_GROUP_SET_NAME:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			if(CheckVulgarityString(inputtext) || strfind(inputtext, "%", true) != -1)
			{
				sendErrorMessage(playerid, "Nazwa grupy nie może być wulgarna!");
				ShowPlayerDialogEx(playerid, D_GROUP_SET_NAME, DIALOG_STYLE_INPUT, MruTitle("Zmiana nazwy grupy"), sprintf("Wpisz poniżej nową nazwę grupy\nAktualna: {BA782D}%s", GroupInfo[groupid][g_Name]), "Zmień", "Anuluj");
				return 1;
			}
			if(!strlen(inputtext) || strlen(inputtext) < 4 || strlen(inputtext) > 48)
			{
				sendErrorMessage(playerid, "Nazwa grupy musi mieć conajmniej 4 znaki (nie więcej niż 48).");
				ShowPlayerDialogEx(playerid, D_GROUP_SET_NAME, DIALOG_STYLE_INPUT, MruTitle("Zmiana nazwy grupy"), sprintf("Wpisz poniżej nową nazwę grupy\nAktualna: {BA782D}%s", GroupInfo[groupid][g_Name]), "Zmień", "Anuluj");
				return 1;
			}
			new escaped[128];
			mysql_escape_string(inputtext, escaped);
			escaped[0] = toupper(escaped[0]);
			format(GroupInfo[groupid][g_Name], 64, escaped);
			GroupSave(groupid, true);
			va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "(Zmieniłeś nazwę grupy na: %s)", escaped);
			Log(serverLog, WARNING, "%s zmienił nazwę grupy %s", GetPlayerLogName(playerid), GetGroupLogName(groupid));
		}
		case D_GROUP_SET_SNAME:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			if(CheckVulgarityString(inputtext) || strfind(inputtext, "%", true) != -1)
			{
				sendErrorMessage(playerid, "Skrót grupy nie może być wulgarny!");
				ShowPlayerDialogEx(playerid, D_GROUP_SET_SNAME, DIALOG_STYLE_INPUT, MruTitle("Zmiana skrótu grupy"), sprintf("Wpisz poniżej nowy skrót grupy\nAktualny: {BA782D}%s", GroupInfo[groupid][g_ShortName]), "Zmień", "Anuluj");
				return 1;
			}
			if(!strlen(inputtext) || strlen(inputtext) < 2 || strlen(inputtext) > 16)
			{
				sendErrorMessage(playerid, "Skrót grupy musi mieć conajmniej 2 znaki (nie więcej niż 16).");
				ShowPlayerDialogEx(playerid, D_GROUP_SET_SNAME, DIALOG_STYLE_INPUT, MruTitle("Zmiana skrótu grupy"), sprintf("Wpisz poniżej nowy skrót grupy\nAktualny: {BA782D}%s", GroupInfo[groupid][g_ShortName]), "Zmień", "Anuluj");
				return 1;
			}
			new escaped[128];
			mysql_escape_string(inputtext, escaped);
			for(new i = 0; i < strlen(escaped); i++)
				escaped[i] = toupper(escaped[i]);
			format(GroupInfo[groupid][g_ShortName], 32, escaped);
			GroupSave(groupid, true);
			va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "(Zmieniłeś skrót grupy na: %s)", escaped);
			Log(serverLog, WARNING, "%s zmienił skrót grupy %s", GetPlayerLogName(playerid), GetGroupLogName(groupid));
		}
		case D_GROUP_SET_COLOR:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			if(strlen(inputtext) != 6 || strfind(inputtext, "%", true) != -1 || strfind(inputtext, "|", true) != -1)
			{
				sendErrorMessage(playerid, "HEX musi mieć 6 znaków.");
				ShowPlayerDialogEx(playerid, D_GROUP_SET_COLOR, DIALOG_STYLE_INPUT, MruTitle("Zmiana koloru grupy"), sprintf("Wprowadź poniżej nowy kolor grupy w formacie RRGGBB\nAktualny: %06x", GroupInfo[groupid][g_Color] >>> 8), "Zmień", "Anuluj");
				return 1;
			}
			new color = ConvertHexToRGBA(inputtext);
			if(color == 0)
			{
				sendErrorMessage(playerid, "Wykryto nieprawidłowe znaki w twoim kolorze.");
				ShowPlayerDialogEx(playerid, D_GROUP_SET_COLOR, DIALOG_STYLE_INPUT, MruTitle("Zmiana koloru grupy"), sprintf("Wprowadź poniżej nowy kolor grupy w formacie RRGGBB\nAktualny: %06x", GroupInfo[groupid][g_Color] >>> 8), "Zmień", "Anuluj");
				return 1;
			}
			GroupInfo[groupid][g_Color] = color;
			GroupSave(groupid, true);
			va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "(Zmieniłeś kolor grupy na: {%06x}%s)", RGBAtoRGB(color), GroupInfo[groupid][g_Name]);
			Log(serverLog, WARNING, "%s zmienił kolor grupy %s na %s", GetPlayerLogName(playerid), GetGroupLogName(groupid), inputtext);
		}

		//--Zarządzanie pojazdami

		case D_GROUPLEADERVEHICLE:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new vehicleid = strval(inputtext);
			if(VehicleUID[vehicleid][vUID] == 0 || !IsValidVehicle(vehicleid)) return sendErrorMessage(playerid, "Coś poszło nie tak.");
			DynamicGui_SetDialogValue(playerid, vehicleid);
			ShowPlayerDialogEx(playerid, D_GROUP_MANAGE_VEHICLE, DIALOG_STYLE_LIST, MruTitle("Zarządzanie pojazdem"), "»» Respawnuj\n»» Ustaw rangę", "Zmień", "Zamknij");
		}
		case D_GROUP_MANAGE_VEHICLE:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 4);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new vehicleid = DynamicGui_GetDialogValue(playerid);
			if(VehicleUID[vehicleid][vUID] == 0 || !IsValidVehicle(vehicleid)) return sendErrorMessage(playerid, "Coś poszło nie tak.");
			
			if(listitem == 0) //Respawn
			{
				RespawnVehicleEx(vehicleid);
				va_SendClientMessage(playerid, COLOR_GREEN, "»» Pomyślnie zrespawnowałeś pojazd o ID: %d", vehicleid);
			}
			else if(listitem == 1) //Ranga
			{
				new uid = VehicleUID[vehicleid][vUID];
				ShowPlayerDialogEx(playerid, D_GROUP_MANAGE_V_RANK, DIALOG_STYLE_INPUT, MruTitle("Zarządzanie pojazdem"), sprintf("{FFFFFF}Podaj poniżej rangę, od której będzie można używać pojazdu.\nAktualna: %s [%d]", GroupRanks[groupid][CarData[uid][c_Rang]], CarData[uid][c_Rang]), "Zmień", "Zamknij");
			}
		}
		case D_GROUP_MANAGE_V_RANK:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 4);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new vehicleid = DynamicGui_GetDialogValue(playerid);
			new uid = VehicleUID[vehicleid][vUID];
			if(uid == 0 || !IsValidVehicle(vehicleid)) return sendErrorMessage(playerid, "Coś poszło nie tak.");

			new rank = strval(inputtext);
			if(rank < 0 || rank > 10 || !strlen(inputtext))
			{
				sendErrorMessage(playerid, "Złe ID rangi!");
				ShowPlayerDialogEx(playerid, D_GROUP_MANAGE_V_RANK, DIALOG_STYLE_INPUT, MruTitle("Zarządzanie pojazdem"), sprintf("{FFFFFF}Podaj poniżej rangę, od której będzie można używać pojazdu.\nAktualna: %s [%d]", GroupRanks[groupid][CarData[uid][c_Rang]], CarData[uid][c_Rang]), "Zmień", "Zamknij");
				return 1;
			}
			if(!strcmp(GroupRanks[groupid][rank], "-"))
			{
				sendErrorMessage(playerid, "Ranga o podanym ID nie jest stworzona!");
				ShowPlayerDialogEx(playerid, D_GROUP_MANAGE_V_RANK, DIALOG_STYLE_INPUT, MruTitle("Zarządzanie pojazdem"), sprintf("{FFFFFF}Podaj poniżej rangę, od której będzie można używać pojazdu.\nAktualna: %s [%d]", GroupRanks[groupid][CarData[uid][c_Rang]], CarData[uid][c_Rang]), "Zmień", "Zamknij");
				return 1;
			}

			CarData[uid][c_Rang] = rank;
			va_SendClientMessage(playerid, COLOR_GREEN, "»» Zmieniłeś wymaganą rangę pojazdu o ID %d na: [%d]", vehicleid, rank);
			Car_Save(uid, CAR_SAVE_OWNER);
		}

		//

		//--Zarządzanie liderami
		case D_GROUP_MANAGE_LEADERS:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response)
			{ 
				if(GroupIsVLeader(playerid, groupid))
					GroupShowLeaderPanel(playerid, groupid, 1);
				return 1;
			}
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new leader = DynamicGui_GetValue(playerid, listitem);
			if(leader < 1) return 1;
			if(leader == 798978) //Add
			{
				if(!GroupIsLeader(playerid, groupid) && !Uprawnienia(playerid, ACCESS_MAKEFAMILY)) return 1;
				ShowPlayerDialogEx(playerid, D_GROUP_ADD_LEADER, DIALOG_STYLE_INPUT, MruTitle("Dodawanie lidera"), "Wpisz poniżej nick użytkownika lub jego UID, aby dodać lidera.", "Dodaj", "Zamknij");
				return 1;
			}
			ShowPlayerDialogEx(playerid, D_GROUP_MANAGE_LEADER, DIALOG_STYLE_LIST, "Zarządzanie liderem", "{FF0000}Usuń lidera\n{00FF00}Daj głównego lidera (UWAGA: ta opcja zabierze Ci wszelkie uprawnienia)", "Dalej", "Zamknij");
			DynamicGui_SetDialogValue(playerid, leader);
		}
		case D_GROUP_ADD_LEADER:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;
			if(!strlen(inputtext)) {
				sendErrorMessage(playerid, "To pole nie może być puste.");
				ShowPlayerDialogEx(playerid, D_GROUP_ADD_LEADER, DIALOG_STYLE_INPUT, MruTitle("Dodawanie lidera"), "Wpisz poniżej nick użytkownika lub jego UID, aby dodać lidera.", "Dodaj", "Zamknij");
				return 1;
			}

			if(IsNumeric(inputtext)) //UID
			{
				new UID = strval(inputtext);
				if(UID < 1) {
					sendErrorMessage(playerid, "UID nie może wynosić 0.");
					ShowPlayerDialogEx(playerid, D_GROUP_ADD_LEADER, DIALOG_STYLE_INPUT, MruTitle("Dodawanie lidera"), "Wpisz poniżej nick użytkownika lub jego UID, aby dodać lidera.", "Dodaj", "Zamknij");
					return 1;
				}
				if(!MruMySQL_DoesAccountExistByUID(UID))
				{
					ShowPlayerDialogEx(playerid, D_GROUP_ADD_LEADER, DIALOG_STYLE_INPUT, MruTitle("Dodawanie lidera"), "Wpisz poniżej nick użytkownika lub jego UID, aby dodać lidera.", "Dodaj", "Zamknij");
					return sendErrorMessage(playerid, "Użytkownik o podanym UID nie istnieje!");
				}
				if(!GroupAddVLeader(groupid, UID, playerid))
					return sendErrorMessage(playerid, "Ten użytkownik jest już liderem Twojej grupy!");
				va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "(Mianowałeś użytkownika o UID: %d na v-lidera w grupie %s)", UID, GroupInfo[groupid][g_Name]);
				Log(serverLog, WARNING, "%s mianował v-lidera o UID %d w grupie %s", GetPlayerLogName(playerid), UID, GetGroupLogName(groupid));
			}
			else //Nazwa
			{
				if(strfind(inputtext, "%", true) != -1) {
					sendErrorMessage(playerid, "Nick nie może zawierać procentu w nazwie.");
					ShowPlayerDialogEx(playerid, D_GROUP_ADD_LEADER, DIALOG_STYLE_INPUT, MruTitle("Dodawanie lidera"), "Wpisz poniżej nick użytkownika lub jego UID, aby dodać lidera.", "Dodaj", "Zamknij");
					return 1;
				}
				new UID = MruMySQL_GetAccInt("UID", inputtext);
				if(!MruMySQL_DoesAccountExist(inputtext) || UID < 1)
				{
					ShowPlayerDialogEx(playerid, D_GROUP_ADD_LEADER, DIALOG_STYLE_INPUT, MruTitle("Dodawanie lidera"), "Wpisz poniżej nick użytkownika lub jego UID, aby dodać lidera.", "Dodaj", "Zamknij");
					return sendErrorMessage(playerid, "Użytkownik o podanej nazwie nie istnieje!");
				}
				if(!GroupAddVLeader(groupid, UID, playerid))
					return sendErrorMessage(playerid, "Ten użytkownik jest już liderem Twojej grupy!");
				va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "(Mianowałeś użytkownika %s na v-lidera w grupie %s)", inputtext, GroupInfo[groupid][g_Name]);
				Log(serverLog, WARNING, "%s mianował v-lidera o UID %d w grupie %s", GetPlayerLogName(playerid), UID, GetGroupLogName(groupid));
			}

		}
		case D_GROUP_MANAGE_LEADER:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new leader = DynamicGui_GetDialogValue(playerid);
			if(leader < 1) return 1;

			if(listitem == 0) //Delete Leader
			{
				GroupRemoveVLeader(groupid, leader);
				new nick[26];
				strmid(nick, MruMySQL_GetNameFromUID(leader), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
				va_SendClientMessage(playerid, COLOR_LIGHTRED, "(Zabrałeś V-Lidera graczowi %s w grupie %s)", nick, GroupInfo[groupid][g_Name]);
				new targetid = ReturnUser(nick);
				if(targetid != INVALID_PLAYER_ID && IsPlayerConnected(targetid))
				{
					return va_SendClientMessage(targetid, COLOR_LIGHTRED, "(Lider %s zabrał Ci V-Lidera w grupie %s)", GetNick(playerid), GroupInfo[groupid][g_Name]);
				}
			}
			else if(listitem == 1) //Give GLD
			{
				if(PlayerInfo[playerid][pUID] == leader) return sendErrorMessage(playerid, "Nie możesz dać sobie głównego lidera.");
				GroupInfo[groupid][g_Leader] = leader;
				GroupSave(groupid, true);
				new nick[26];
				strmid(nick, MruMySQL_GetNameFromUID(leader), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
				va_SendClientMessage(playerid, COLOR_LIGHTRED, "(Dałeś głównego lidera graczowi %s w grupie %s)", nick, GroupInfo[groupid][g_Name]);
				sendErrorMessage(playerid, "Twoje uprawnienia lidera zostały zabrane, od teraz jesteś zwykłym pracownikiem.");
				new targetid = ReturnUser(nick);
				if(targetid != INVALID_PLAYER_ID && IsPlayerConnected(targetid))
				{
					return va_SendClientMessage(targetid, COLOR_LIGHTRED, "(Lider %s dał Ci głównego lidera w grupie %s)", GetNick(playerid), GroupInfo[groupid][g_Name]);
				}
			}
		} 

		//--Zarządzanie rangami
		case D_GROUPLEADERRANKS:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response)
			{ 
				if(GroupIsVLeader(playerid, groupid))
					GroupShowLeaderPanel(playerid, groupid, 1);
				return 1;
			}
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new rank = strval(inputtext);
			if(rank < 0 || rank > MAX_RANG-1) return 1;

			ShowPlayerDialogEx(playerid, D_GROUPLEADEREDITRANK, DIALOG_STYLE_INPUT, sprintf("Panel grupy %s - Ranga", GroupInfo[groupid][g_ShortName]), sprintf("{FFFFFF}Wpisz poniżej nową nazwę rangi {A18C42}[%d]{FFFFFF}.\nPoprzednia nazwa: {A18C42}%s", rank, GroupRanks[groupid][rank]), "Ustaw", "Cofnij");
			SetPVarInt(playerid, "group-editingrank", rank);
		}
		case D_GROUPLEADEREDITRANK:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 2);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new rank = GetPVarInt(playerid, "group-editingrank");
			if(rank < 0 || rank > MAX_RANG-1) return 1;

			if(strlen(inputtext) >= MAX_RANG_LEN)
			{
				sendErrorMessage(playerid, "Nazwa rangi nie może mieć więcej znaków niż 25!");
				GroupShowLeaderPanel(playerid, groupid, 2);
				return 1;
			}
			if(CheckVulgarityString(inputtext) || strfind(inputtext, "%", true) != -1)
			{
				sendErrorMessage(playerid, "Nazwa rangi nie może być wulgarna!");
				GroupShowLeaderPanel(playerid, groupid, 2);
				return 1;
			}
			new escaped[128];
			mysql_escape_string(inputtext, escaped);
			format(GroupRanks[groupid][rank], MAX_RANG_LEN, escaped);
			GroupSave(groupid);
			GroupShowLeaderPanel(playerid, groupid, 2);
		}

		//--Zarządzanie pracownikami
		case D_GROUPLEADEREMPLOYEES:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 1);
			if(groupid < 0 || groupid > MAX_GROUPS) return 1;
			if(!GroupInfo[groupid][g_UID]) return 1;

			new target = DynamicGui_GetValue(playerid, listitem), slot = DynamicGui_GetDataInt(playerid, listitem);
			new page = DynamicGui_GetDialogValue(playerid);
			if(target == -2000) //Poprzednia strona
			{
				return GroupShowLeaderPanel(playerid, groupid, 3, false, page-1);
			}
			if(target == -3000) //Następna strona
			{
				return GroupShowLeaderPanel(playerid, groupid, 3, false, page+1);
			}
			if(target < 1 || slot < 0) return 1;

			new nick[26];
			strmid(nick, MruMySQL_GetNameFromUID(target), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
			if(ReturnUser(nick) != INVALID_PLAYER_ID)
			{
				sendErrorMessage(playerid, "Ten pracownik jest online, użyj /g [slot] [wypros/zapros/ranga]");
				return GroupShowLeaderPanel(playerid, groupid, 3);
			}
			if(GroupInfo[groupid][g_Leader] == target)
			{
				sendErrorMessage(playerid, "Akcja zabroniona.");
				return GroupShowLeaderPanel(playerid, groupid, 3);
			}
			ShowPlayerDialogEx(playerid, D_GROUP_EMPLOYEE_MANAGE, DIALOG_STYLE_LIST, sprintf("Zarządzanie pracownikiem %s", nick), "»» Zmień rangę\n»» Wyproś z grupy", "Dalej", "Cofnij");
			SetPVarString(playerid, "group-employeenick", nick);
			SetPVarInt(playerid, "group-employeeslot", slot);
		}
		case D_GROUP_EMPLOYEE_MANAGE:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 3);
			new target[26], slot = GetPVarInt(playerid, "group-employeeslot");
			GetPVarString(playerid, "group-employeenick", target);
			if(!IsValidGroup(groupid)) return 1;
			if(!strlen(target) || slot < 0) return 1;

			if(listitem == 0) //Ranga
			{
				if(ReturnUser(target) != INVALID_PLAYER_ID)
				{
					sendErrorMessage(playerid, "Ten pracownik jest online, użyj /g [slot] ranga");
					return GroupShowLeaderPanel(playerid, groupid, 3);
				}
				ShowPlayerDialogEx(playerid, D_EMPLOYEE_MANAGE_RANK, DIALOG_STYLE_INPUT, sprintf("Zarządzanie pracownikiem %s", target), "Wpisz poniżej ID rangi (0-10)", "Dalej", "Cofnij");
			}
			else if(listitem == 1) //Kick
			{
				if(ReturnUser(target) != INVALID_PLAYER_ID)
				{
					sendErrorMessage(playerid, "Ten pracownik jest online, użyj /g [slot] wypros");
					return GroupShowLeaderPanel(playerid, groupid, 3);
				}
				MruMySQL_SetAccInt(sprintf("Grupa%d", slot+1), target, 0);
				MruMySQL_SetAccInt(sprintf("Grupa%dRank", slot+1), target, 0);
				MruMySQL_SetAccInt(sprintf("Grupa%dSkin", slot+1), target, 0);
				va_SendClientMessage(playerid, COLOR_LIGHTRED, "(Wyrzuciłeś %s ze swojej grupy [%s])", target, GroupInfo[groupid][g_Name]);
				Log(serverLog, WARNING, "%s wyprosił %s z grupy %s", GetPlayerLogName(playerid), target, GetGroupLogName(groupid));
			}
		}
		case D_EMPLOYEE_MANAGE_RANK:
		{
			new groupid = GetPVarInt(playerid, "group-panel")-1;
			if(!response) return GroupShowLeaderPanel(playerid, groupid, 3);
			new target[26], slot = GetPVarInt(playerid, "group-employeeslot");
			GetPVarString(playerid, "group-employeenick", target);
			if(!IsValidGroup(groupid)) return 1;
			if(!strlen(target) || slot < 0) return 1;

			new rankid = strval(inputtext);
			if(!strlen(inputtext) || rankid < 0 || rankid > 10)
			{
				sendErrorMessage(playerid, "ID rangi od 0 do 10!");
				return ShowPlayerDialogEx(playerid, D_EMPLOYEE_MANAGE_RANK, DIALOG_STYLE_INPUT, sprintf("Zarządzanie pracownikiem %s", target), "Wpisz poniżej ID rangi (0-10)", "Dalej", "Cofnij");
			}
			if(!strcmp(GroupRanks[groupid][rankid], "-") || !strlen(GroupRanks[groupid][rankid]))
			{
				sendErrorMessage(playerid, "Ranga o podanym ID nie jest stworzona w Twojej grupie!");
				return ShowPlayerDialogEx(playerid, D_EMPLOYEE_MANAGE_RANK, DIALOG_STYLE_INPUT, sprintf("Zarządzanie pracownikiem %s", target), "Wpisz poniżej ID rangi (0-10)", "Dalej", "Cofnij");
			}
			MruMySQL_SetAccInt(sprintf("Grupa%dRank", slot+1), target, rankid);
			va_SendClientMessage(playerid, COLOR_LIGHTRED, "(Zmieniłeś rangę %s na: %s [%d] w grupie %s)", target, GroupRanks[groupid][rankid], rankid, GroupInfo[groupid][g_Name]);
			Log(serverLog, WARNING, "%s zmienił rangę %s na %d w grupie %s", GetPlayerLogName(playerid), target, rankid, GetGroupLogName(groupid));
		}
		//--panel koniec --

		case D_GROUP_LEAVE_CONFIRM:
		{
			if(!response) return 1;
			new slot = DynamicGui_GetDialogValue(playerid);
			if(slot < 0) return 1;
			new groupid = PlayerInfo[playerid][pGrupa][slot];
			if(!IsValidGroup(groupid)) return 1;
			if(OnDuty[playerid] == slot+1) return 1;

			GroupRemovePlayer(playerid, groupid, 0);
		}
		case D_GROUP_INVITE:
		{
			new rank = GetPVarInt(playerid, "groupinvite-rank"), inviter = GetPVarInt(playerid, "groupinvite-inviter"), groupid = GetPVarInt(playerid, "groupinvite-id");
			if(!response)
			{
				if(IsPlayerConnected(inviter))
					va_SendClientMessage(inviter, COLOR_LIGHTRED, "%s odrzucił twoje zaproszenie do grupy.", GetNick(playerid));
				DeletePVar(playerid, "groupinvite-inviter");
				DeletePVar(playerid, "groupinvite-id");
				DeletePVar(playerid, "groupinvite-rank");
				return 1;
			}
			if(!IsValidGroup(groupid))
				return sendErrorMessage(playerid, "Zaproszenie wygasło.");
			if(!GroupAddPlayer(playerid, groupid, rank, inviter))
                return sendErrorMessage(playerid, "Nie możesz zostać przyjęty do tej grupy.");
			else
			{
				DeletePVar(playerid, "groupinvite-inviter");
				DeletePVar(playerid, "groupinvite-id");
				DeletePVar(playerid, "groupinvite-rank");
				return 1;
			}
		}
		case D_GROUP_VEHICLE:
		{
			if(!response) return 1;
			new vehicleid = strval(inputtext);
			if(VehicleUID[vehicleid][vUID] == 0 || !IsValidVehicle(vehicleid)) return sendErrorMessage(playerid, "Coś poszło nie tak.");

			new Float:x, Float:y, Float:z;
			GetVehiclePos(vehicleid, x, y, z);
			SetPlayerCheckpoint(playerid, x, y, z, 6);
			SetTimerEx("SzukanieAuta",30000,0,"d",playerid);
			SendClientMessage(playerid, 0xFFC0CB, "Lokalizacja pojazdu została oznaczona na mapie.");
		}
		//--

		//------Panel admina-------//
		case D_GROUP_ADMIN_PERM:
		{
			new groupid = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(groupid)) return 1;
			if(!response)
			{
				GroupSave(groupid);
				va_SendClientMessage(playerid, COLOR_LIGHTRED, "* Zapisałeś uprawnienia grupy %s", GroupInfo[groupid][g_Name]);
				return 1;
			}
			new perm = listitem+1;
			GroupSetPerm(groupid, perm, !GroupHavePerm(groupid, perm));
			Admin_PermPanel(playerid, groupid);
		}
	}
	return 1;
}

stock grupy_dialog_deleteSkin(playerid, response, inputtext[])
{
	if(!response) return 1;
	new groupid = DynamicGui_GetDialogValue(playerid), skinid = strval(inputtext);
	if(!IsValidGroup(groupid)) return 1;
	if(skinid < 1) return 1;

	new slot = -1;
	for(new i = 0; i < 20; i++)
	{
		if(GroupInfo[groupid][g_Skin][i] == skinid) {
			slot = i;
			break;
		}
	}
	if(slot == -1) return sendErrorMessage(playerid, "W tej grupie nie ma takiego skina!");
	GroupInfo[groupid][g_Skin][slot] = 0;
	GroupSave(groupid);
	for(new i = 0; i < 3; i++)
	{
		foreach(new j : Player)
		{
			new groupslot = GetPlayerGroupSlot(j, groupid);
			if(groupslot > 0)
			{
				if(PlayerInfo[j][pGrupaSkin][groupslot-1] == skinid)
					PlayerInfo[j][pGrupaSkin][groupslot-1] = 0;
			}

		}
		mysql_tquery_format("UPDATE `mru_konta` SET `Grupa%dSkin` = '0' WHERE `Grupa%dSkin` = '%d' AND `Grupa%d` = '%d'", i+1, i+1, skinid, i+1, groupid);
	}
	return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
		if(GetPVarInt(playerid, "cmdgmenu") == 1)
		{
			DestroyGroupTextDraws(playerid);
			new allowedSlots = IsPlayerPremiumOld(playerid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
			for(new i = 0; i<allowedSlots; i++)
			{
				SetPVarInt(playerid, "cmdgmenu", 0);
				PlayerTextDrawHide(playerid, NazwaGrupy[playerid][i]);
				PlayerTextDrawHide(playerid, InfoGrupy[playerid][i]);
				PlayerTextDrawHide(playerid, PojazdyGrupy[playerid][i]);
				PlayerTextDrawHide(playerid, OnlineGrupy[playerid][i]);
				PlayerTextDrawHide(playerid, DutyGrupy[playerid][i]);
				PlayerTextDrawHide(playerid, SystemGrup[playerid]);
				CancelSelectTextDraw(playerid);
			}
		}
	}
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if(!GetPVarInt(playerid, "cmdgmenu")) return 1;
	new allowedSlots = IsPlayerPremiumOld(playerid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
	for(new i=0;i<allowedSlots;i++) 
	{
		if(playertextid == DutyGrupy[playerid][i]) //Duty
		{
			RunCommand(playerid, "/g", sprintf("%d duty", i+1));
			HideGroupTextDraws(playerid);
			return 1;
		}
		if(playertextid == OnlineGrupy[playerid][i]) //Online
		{
			RunCommand(playerid, "/g", sprintf("%d online", i+1));
			HideGroupTextDraws(playerid);
			return 1;
		}
		if(playertextid == InfoGrupy[playerid][i]) //Informacje
		{
			RunCommand(playerid, "/g", sprintf("%d info", i+1));
			HideGroupTextDraws(playerid);
			return 1;
		}
		if(playertextid == PojazdyGrupy[playerid][i]) //Pojazdy
		{
			RunCommand(playerid, "/g", sprintf("%d v", i+1));
			HideGroupTextDraws(playerid);
			return 1;
		}
	}
	return 1;
}
//end