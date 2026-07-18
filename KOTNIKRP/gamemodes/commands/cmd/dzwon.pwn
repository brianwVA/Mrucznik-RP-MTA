//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dzwon ]-------------------------------------------------//
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

YCMD:dzwon(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
    if(!IsPlayerConnected(playerid))
	{
		return 1;
	}
	
	if(gPlayerLogged[playerid] == 0)
	{
		return 1;
	}
	
	if(GetPhoneNumber(playerid) == 0)
	{
		sendErrorMessage(playerid, "Nie posiadasz telefonu !");
		return 1;
	}
	if(Kajdanki_JestemSkuty[playerid])
	{
		sendErrorMessage(playerid, "Nie możesz używać telefonu podczas bycia skutym!");
		return 1;
	}
	if(PlayerInfo[playerid][pJailed] != 0)
	{
		sendErrorMessage(playerid, "Nie posiadasz telefonu w więzieniu!"); 
		return 1;
	}
	new numerTelefonuOdbiorcy;
	if( sscanf(params, "d", numerTelefonuOdbiorcy))
	{
		sendTipMessage(playerid, "Użyj /dzwon [numer telefonu]");
		return 1;
	}
	
	if(numerTelefonuOdbiorcy == GetPhoneNumber(playerid))
	{
		sendErrorMessage(playerid, "Nie możesz zadzwonić sam do siebie.");
		return 1;
	}
	
	if(numerTelefonuOdbiorcy < 1)
	{
		sendErrorMessage(playerid, "Niepoprawny numer telefonu.");
		return 1;
	}
	
	if(Mobile[playerid] != INVALID_PLAYER_ID)
	{
		sendErrorMessage(playerid, "Dzwonisz już do kogoś.");
		return 1;
	}

	if(GetPhoneOnline(playerid) == 0)
	{
		sendTipMessage(playerid, "Twój telefon jest wyłączony! Włącz go za pomocą /p Telefon");
		return 1;
	}

	if(GetPlayerAdminDutyStatus(playerid) == 1)
	{
		sendErrorMessage(playerid, "Nie możesz używać telefonu podczas służby administratora!"); 
		return 1;
	}
	
	new reciverid;
	if(numerTelefonuOdbiorcy != 911)
	{
		reciverid = FindPlayerByNumber(numerTelefonuOdbiorcy);
		if(reciverid == INVALID_PLAYER_ID)
		{
			sendErrorMessage(playerid, "Gracz o takim numerze jest offline.");
			return 1;
		}

		if(GetPlayerAdminDutyStatus(reciverid) == 1)
		{
			sendErrorMessage(playerid, "Osoba do której próbujesz zadzwonić jest nieosiągalna!"); 
			return 1;
		}
		
		if(GetPhoneOnline(reciverid) == 0)
		{
			sendErrorMessage(playerid, "Gracz ma wyłączony telefon.");
			return 1;
		}
		
		if(Mobile[reciverid] != INVALID_PLAYER_ID)
		{
			sendErrorMessage(playerid, "Gracz już z kimś rozmawia.");
			return 1;
		}
	}
	
	//all ok, lecim
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "* %s wyjmuje telefon, wybiera numer i wykonuje połączenie.", sendername);
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	
	SendClientMessage(playerid, COLOR_WHITE, "Trwa łączenie, proszę czekać...");
	SendClientMessage(playerid, COLOR_WHITE, "WSKAZÓWKA: Użyj chatu IC aby rozmawiać przez telefon i /z aby sie rozłączyć.");
	PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);
	if(PlayerInfo[playerid][pInjury] == 0 && PlayerInfo[playerid][pBW] == 0) SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);

	if(numerTelefonuOdbiorcy == 911)
	{
		if(GUIExit[playerid] == 0)
		{
			//ShowPlayerDialogEx(playerid, 112, DIALOG_STYLE_LIST, "Numer alarmowy", "Policja\nStraż Pożarna\nMedyk\nSheriff", "Wybierz", "Rozłącz się");
			ShowPlayerDialogEx(playerid, 112, DIALOG_STYLE_LIST, "Numer alarmowy", "Policja\nSzpital\nStraż Pożarna", "Wybierz", "Rozłącz się");
		}
		else
		{
			sendErrorMessage(playerid, "Masz już otwarte inne okienko GUI, zamknij je i spróbuj jeszcze raz.");
		}
		return 1;
	}
	else
	{
		StartACall(playerid, reciverid);
	}
	return 1;
}
