//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                 bilboard                                                 //
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
// Data utworzenia: 17.07.2022

//

#include <YSI_Coding\y_hooks>

hook OnGameModeExit()
{
    SaveBilboards();
}

hook OnPlayerEditDynamicObj(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if(PlayerInfo[playerid][pIsEditingBilboard] == true)
	{
		if(response == EDIT_RESPONSE_FINAL)
		{
			DestroyDynamicObject(PlayerInfo[playerid][pEditorBilboardObject]);
			PlayerInfo[playerid][pIsEditingBilboard] = false;
			CreateNewBilboard(x, y, z, rz);
            sendTipMessage(playerid, "Bilboard został pomyślnie stworzony!");
			Streamer_Update(playerid);
		}
		if(response == EDIT_RESPONSE_CANCEL)
		{
			DestroyDynamicObject(PlayerInfo[playerid][pEditorBilboardObject]);
			PlayerInfo[playerid][pIsEditingBilboard] = false;
			sendTipMessage(playerid, "Anulowano edytor bilboardu.");
		}
		return 1;
	}
    return 0;
}


stock OnDialogResponseBilb(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == D_BILBRENT1)
	{
		new bilbid = PlayerInfo[playerid][SelectedBilboard];
		if(!response) return 1;
		if(Bilboard[bilbid][btime] != -1) return sendErrorMessage(playerid, "Ten bilboard jest już wynajmowany!");
		if(strlen(inputtext) == 0) return sendErrorMessage(playerid, "Wiadomość jest pusta!");

		format(PlayerInfo[playerid][SelectedBilboardText], 128, inputtext);
		if(PlayerInfo[playerid][RentBilboardPreviewOID] == -1)
		{
			Streamer_ToggleItem(playerid, STREAMER_TYPE_OBJECT, Bilboard[bilbid][btextobjid], false);
			PlayerInfo[playerid][RentBilboardPreviewOID] = CreateDynamicObject(4732, Bilboard[bilbid][bposx], Bilboard[bilbid][bposy], Bilboard[bilbid][bposz] + 6, 0.0, 0.0, Bilboard[bilbid][brotz] + 55, -1, -1, playerid, 300, 300, -1, 1);
			SetDynamicObjectMaterialText(PlayerInfo[playerid][RentBilboardPreviewOID], 0, ConvertBilboardText(inputtext), OBJECT_MATERIAL_SIZE_512x128, "Frutiger Light Cn", 41, 0, 0xFFFF8200, 0xFF000000, 1);
		}
		else SetDynamicObjectMaterialText(PlayerInfo[playerid][RentBilboardPreviewOID], 0, ConvertBilboardText(inputtext), OBJECT_MATERIAL_SIZE_512x128, "Frutiger Light Cn", 41, 0, 0xFFFF8200, 0xFF000000, 1);
		
		new str[256];
		format(str, sizeof str, "{FFFFFF}Czy na pewno chcesz wynajac ten bilboard uzywajac tego tekstu?\nCena wynajmu na {F7C173}%d {FFFFFF}dni wynosi {F7C173}$%d($%d/dzien)\n{FF0000}Po zaakceptowaniu nie będzie można nic zmienić!", PlayerInfo[playerid][SelectedBilboardDays], PlayerInfo[playerid][SelectedBilboardDays] * Bilboard[bilbid][bcost], Bilboard[bilbid][bcost]);
		ShowPlayerDialogEx(playerid, D_BILBRENT2, DIALOG_STYLE_MSGBOX, "Wynajem bilbordu", str, "Tak", "Nie");
		Streamer_Update(playerid);
		if(PlayerInfo[playerid][RentBilboardTimer] != -1)
			KillTimer(PlayerInfo[playerid][RentBilboardTimer]);
		PlayerInfo[playerid][RentBilboardTimer] = SetTimerEx("DestroyRentBilboard", 30000, false, "ii", playerid, bilbid);
		return 1;
	}
	else if(dialogid == D_BILBRENT2)
	{
		if(!response) return ShowPlayerDialogEx(playerid, D_BILBRENT1, DIALOG_STYLE_INPUT, "Wynajem bilboardu", "{FFFFFF}Podaj tekst bilboardu który ma być użyty!\nUżyj {F7C173}/n {FFFFFF}aby przejść do nowej linijki.", "Potwierdź", "Wyjdź");
		
		new bilbid = PlayerInfo[playerid][SelectedBilboard];
		if(PlayerInfo[playerid][RentBilboardPreviewOID] != -1)
			DestroyDynamicObject(PlayerInfo[playerid][RentBilboardPreviewOID]),
			Streamer_ToggleItem(playerid, STREAMER_TYPE_OBJECT, Bilboard[bilbid][btextobjid], true),
			Streamer_Update(playerid),
			PlayerInfo[playerid][RentBilboardPreviewOID] = -1,
			KillTimer(PlayerInfo[playerid][RentBilboardTimer]),
			PlayerInfo[playerid][RentBilboardTimer] = -1;
		
		if(Bilboard[bilbid][btime] == -1)
		{
			if(RentBilboard(playerid) == 1)
				sendTipMessage(playerid, sprintf("Bilboard został pomyślnie wynajęty na {F7C173}%d {CBCCCE}dni.", PlayerInfo[playerid][SelectedBilboardDays]));
			else
				sendErrorMessage(playerid, "Nie masz tyle kasy!");
		}
		else
			return sendErrorMessage(playerid, "Ten bilboard jest już wynajmowany!");
		
		return 1;
	}
	else if(dialogid == D_BILBRENT3)
	{
		if(response)
			if(UnrentBilboard(playerid))
				sendTipMessage(playerid, "Wynajem bilboardu został pomyślnie zakończony!");
		return 1;
	}
	return 0;
}