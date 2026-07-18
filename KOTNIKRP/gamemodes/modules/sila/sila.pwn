//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    sila                                                   //
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
// Autor: Simeone
// Data utworzenia: 04.05.2019
//Opis:
/*
	System siły to rewolucja na serwerzMrucznikik Role_Play. Dzięki sile możemy realnie przełożyć akcje na postać.
	Przykładowo: Gracz X (200V) i policjant Y (25V) - policjant próbuje aresztować gracza, gracz wyrywa się bez większego problemu.
	RE: Ta sama sytuacja, z tym, że policjant ma już 1/2 wartości siły gracza - wtedy gracz ma zaledwie 25% na ucieczkę, które maleje z każdym policjantem obok.
	Wnioski? Dzięki temu systemowi, gracze będą mieli realne szanse uciec z aresztowania i /przetrwać/, a dla PD będzie wyzwaniem złapać 140 kilowego sku*wysyna.

	Przykład drugi: Gracz X (350V) chce pobić gracza Y (50V) - dochodzi do pobicia bez większego oporu. Jednak, jeśli gracz Y ma o drobinę większą wartość (niż 1/7 gracza X), 
	wtedy system odpala możliwość /szansy/ i oblicza procentowo udział. 

	Siłę możemy zdobyć poprzez 4 możliwe sposoby (możliwe, że w przyszłości zwiększy się ich liczba):
	>Admin może ją nadać komendą /setstrong
	>Biegając (skryptem do biegu)
	>Ćwicząc na siłowni
	>Pływając na basenie Tsunami

	Dodatkowo zażywanie narkotyków daje boosta (2x siły) na okres 5 minut. Jednak, jeśli będziemy tego nadużywać, skrypt odbierze nam -15V siły :D 
*/

//

//-----------------<[ Callbacki: ]>-------------------
//-----------------<[ Funkcje: ]>-------------------
AddStrong(playerid, wartosc)
{
	if(PlayerInfo[playerid][pStrong]+wartosc <= MAX_STRONG_VALUE)
	{
		PlayerInfo[playerid][pStrong] = PlayerInfo[playerid][pStrong]+wartosc; 
		new tekststring[128];
		format(tekststring, sizeof(tekststring), "Sila +%d", wartosc);
		MSGBOX_Show(playerid, tekststring, MSGBOX_ICON_TYPE_EXPLODE, 3);
	}
	else
	{
		sendTipMessage(playerid, "Error: Nie udało się zabrać wartości Siły - przekroczy 5k");
	}

	return 1;
}

TakeStrong(playerid, wartosc)
{
	if(PlayerInfo[playerid][pStrong] >= wartosc)
	{
		PlayerInfo[playerid][pStrong] = PlayerInfo[playerid][pStrong]-wartosc; 
		new tekststring[128];
		format(tekststring, sizeof(tekststring), "Sila -%d", wartosc);
		MSGBOX_Show(playerid, tekststring, MSGBOX_ICON_TYPE_EXPLODE, 3);
	}
	else
	{
		sendTipMessage(playerid, "Error: Nie udało się zabrać wartości Siły");
	}

	return 1;
}

SetStrong(playerid, wartosc)
{
	if(wartosc <= MAX_STRONG_VALUE)
	{
		PlayerInfo[playerid][pStrong] = wartosc;
	}
	return 1;
}

EndRunPlayer(playerid, wartosc)
{

	DisablePlayerCheckpoint(playerid);

	sendTipMessage(playerid, "Gratulacje! Ukończyłeś cały bieg.");
	
	SetPVarInt(playerid, "ZaliczylBaze", 0);
	SetPVarInt(playerid, "WybralBieg", 0);
	SetPVarInt(playerid, "RozpoczalBieg", 0);
	PlayerRunStat[playerid]++;
	new string[128];
	format(string, sizeof(string), "To twój %d bieg dziś", PlayerRunStat[playerid]);
	sendTipMessage(playerid, string);
	AddStrong(playerid, wartosc);
	OszukujewBiegu[playerid] = 0;
	
	return 1;
}

GetPlayerStrong(playerid)
{
	new strongVal = PlayerInfo[playerid][pStrong];
	return strongVal; 
}

CreateNewRunCheckPoint(playerid, Float:x, Float:y, Float:z, Float:range, text[], strongValue, bool:strongadd=false, bool:sendTip=true)
{
	DisablePlayerCheckpoint(playerid);

	if(strlen(text) >= 2)
	{
		if(sendTip == true)
		{
			sendTipMessage(playerid, text);
		}
	}
	SetPlayerCheckpoint(playerid, x,y,z, range);
	bazaCheck[playerid] = SetTimerEx("BazaCheckPoint",5000,0,"d",playerid);
	bazaOszust[playerid] = SetTimerEx("BazaCheckOszust", 5000, 0, "d", playerid);
	OszukujewBiegu[playerid] = 1;
	if(strongadd == true)
	{
		AddStrong(playerid, strongValue);
	}

	return 1;
}

//-----------------<[ Timery: ]>-------------------
forward BazaCheckOszust(playerid);
public BazaCheckOszust(playerid)
{
	new timeSec[MAX_PLAYERS];
	timeSec[playerid]++;
	if(timeSec[playerid] == 2)
	{
		OszukujewBiegu[playerid] = 0;
		KillTimer(bazaOszust[playerid] );
	}
	return 1;
}

forward BazaCheckPoint(playerid);
public BazaCheckPoint(playerid)
{
	if(GetPVarInt(playerid, "ZaliczylBaze") == 0)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 1);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 1)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 2);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 2)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 3);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 3)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 4);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 4)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 5);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 5)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 6);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 6)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 7);
	}
	KillTimer(bazaCheck[playerid]);

	return 1;
}

forward EfektNarkotyku(playerid);
public EfektNarkotyku(playerid)
{
	new FirstValue = GetPVarInt(playerid, "FirstValueStrong");
	efektNarkotykuMinuta[playerid]++; 
	if(efektNarkotykuMinuta[playerid] == TIME_OF_DRUG_ACTIVITY)
	{
		SetStrong(playerid, FirstValue);
		sendTipMessage(playerid, "Wartość twojej siły wróciła do normy"); 
		KillTimer(TimerEfektNarkotyku[playerid]);
	}

	return 1;
}


//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end