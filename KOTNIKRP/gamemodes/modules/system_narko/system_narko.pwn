//-----------------------------------------------<< Source >>------------------------------------------------//
//                                              System Narko                                                 //
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
// Autor: Dawidoskyy
// Data utworzenia: 18.12.2021
//Opis:
/*
	System Narko
*/

//

#include <YSI_Coding\y_hooks>

// ========[ENUMY + NEWY]========

#define MAX_PLANTACJA_PLAYER 5
#define MAX_PLANTACJA 150

enum ePlantacja {
    p_Owner,
    Float:p_Pos[3],
    Object:p_Object,
    Text3D:p_Label,
    bool:p_CanGather
};
new Plantacja[MAX_PLANTACJA][ePlantacja];

new Iterator:I_Plantacja<MAX_PLANTACJA>;

enum nInfo
{
	pZuzyl, // Ilość jaką zużył/spalił gracz narkotyków.
	pPodWplywem, // Gdy jesteśmy pod wpływem narkotyku. || 1 - TAK, 0 - NIE.
	pTimerKill
};

new nPlayer[MAX_PLAYERS][nInfo];
new ndstring[128];
new Float:lastRadioDrugs;


//-----------------<[ Funkcje: ]>-------------------

// ========[DEFINICJE - KOLORY]========
new hpRegenDelay = 5; // liczba sekund przed następnym zregenerowaniem punktów HP
//new Float:hpRegenRate = 5.0; // liczba punktów HP zregenerowanych na sekundę
#define C_SZARY	"{C0C0C0}"
#define C_BIALY	"{FFFFFF}"
#define C_CZERWONY	"{FF0000}"
#define C_NIEBIESKI	"{4169E1}"
#define C_ZIELONY	"{ADFF2F}"
#define DO "{9797FF}"
#define ME "{FFB76F}"
#define KOLOR_JA 0xB871FFFF
#define KOLOR_DO 0x9797FFFF

// ========[DEFINICJE - DIALOGI]========
#define DIALOG_NMENU	8356
#define DIALOG_NKUP	8355
#define DIALOG_NKUP2 8355
#define DIALOG_NSPRZEDAJ	8354
#define DIALOG_NZASADZ	8353
#define DIALOG_NUZYL	8352
#define DIALOG_NSPRZEDAJBOTOWI	8351

// ========[PUBLICKI]========

hook OnGameModeInit()
{ 
	for(new i = 0; i < MAX_PLANTACJA; i++)
		Plantacja[i][p_Label] = CreateDynamic3DTextLabel(" ", 0xC0C0C0FF, 0.0, 0.0, 0.0, 10.0);
	return 1;
}

stock OnPlayerSpawnNarko(playerid)
{
	SetPlayerDrunkLevel(playerid, 0); // Brak "latającej kamery".
	return 1;
}
 
stock OnPlayerDeathNarko(playerid)
{
	nPlayer[playerid][pPodWplywem] = 0; // Ustawiamy, że może użyć narkotyk po śmierci.
	SetPlayerWeather(playerid, 1); // Domyślna pogoda.
	SetPlayerDrunkLevel(playerid, 0); // Brak "latającej kamery".
	return 1;
}

stock OnDialogResponseNarko(playerid, dialogid, response, listitem)
{
	if(dialogid == DIALOG_NKUP) // Użyty w CMD:nkup
	{
		if(response == 1) // Jeżeli wciśnie KUP.
		{
			//new tekst[500];
			switch(listitem)
			{
				case 0: // Jeżeli chcę kupić KRZAK
				{
					if (PlayerInfo[playerid][pConnectTime] < 5)
					{
						format(ndstring, sizeof(ndstring), ""C_SZARY"Musisz przegrać serwerze minimum "C_ZIELONY"5"C_SZARY" godzin, aby kupić sadzonkę.");
						ShowPlayerDialogEx(playerid, DIALOG_NKUP, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Coś poszło nie tak!:", ndstring, "Okej", "");
						return 0;
					}
					for(new _i = 0; _i < MAX_PLAYER_GROUPS_PREMIUM; _i++)
					{
						new pgrp = PlayerInfo[playerid][pGrupa][_i];
						if(pgrp > 0 && GroupHavePerm(pgrp, PERM_POLICE))
						{
							sendErrorMessage(playerid, "Nie możesz kupić sadzonki będąc w grupie porządkowej.");
							return -1;
						}
					}
					if(kaska[playerid] < PRICE_NARKO_KRZAK)
					{
						format(ndstring, sizeof(ndstring), ""C_SZARY"Nie posiadasz przy sobie "C_ZIELONY"$"#PRICE_NARKO_KRZAK""C_SZARY"..");
						ShowPlayerDialogEx(playerid, DIALOG_NKUP, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Coś poszło nie tak!:", ndstring, "Okej", "");
						return 0;
					}
					GameTextForPlayer(playerid,"~g~Kupiono ~p~krzak.", 10000, 1);
					DajKaseDone(playerid, -PRICE_NARKO_KRZAK); 
					Item_Add("Krzak", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_KRZAK, 0, 0, true, playerid, 1, ITEM_NOT_COUNT);
					format(ndstring, sizeof(ndstring), ""C_ZIELONY"Pomyślnie"C_SZARY" zakupiłeś rośline.");
					ShowPlayerDialogEx(playerid, DIALOG_NKUP, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Udało się!:", ndstring, "Okej", "");
				}
			}
		}
		return 1;
	}
	return 0;
}
stock OnDialogResponseNarko2(playerid, dialogid, response, listitem, inputtext[])
{
    #pragma unused listitem
    if(dialogid == DIALOG_NSPRZEDAJBOTOWI)
    {
        new ilosc, stringnarko[258];
        if(!response) return 1;

        if(sscanf(inputtext, "d", ilosc))
            return ShowPlayerDialogEx(playerid, DIALOG_NSPRZEDAJBOTOWI, DIALOG_STYLE_INPUT, ""C_NIEBIESKI"Sprzedawanie narkotyków:", "Wpisz ile narkotyków chcesz sprzedać", "Dalej", "");

        new id = HasItemType(playerid, ITEM_TYPE_MARIHUANA);
        if(id == -1) return GameTextForPlayer(playerid, "Nie masz tyle marihuany!", 5000, 3);
        if(Item[id][i_Quantity] < ilosc) return GameTextForPlayer(playerid, "Nie masz tyle marihuany!", 5000, 3);
        if(ilosc <= 0) return GameTextForPlayer(playerid, "Niepoprawna ilość!", 3000, 3);
        if(ilosc < 6) return GameTextForPlayer(playerid, "Minimalna wartosc to 6 gramow!", 3000, 3);
        new amountOfturfs = Turf_PlayerTurfCount(playerid);
        // 15% szans na zabranie
        if(random(100) < 15-amountOfturfs)
        {
            Item_Delete(id, true, ilosc);

            SendClientMessage(playerid, COLOR_LIGHTRED, "Steve_Burton mówi: Myślałeś, że to kupię? Frajerze... To dla mnie!");
            GameTextForPlayer(playerid, "~r~BOT ZABRAL NARKOTYKI!", 4000, 3);

			if (gettime() - lastRadioDrugs >= 10.0)
			{
				if (random(100) < 50)
				{
					SendRadioMessage(FRAC_LSPD, COLOR_LIGHTRED, "HQ: Zgłoszenie dziwnego zachowania na El Corona!", 0, 1);
					lastRadioDrugs = gettime();
				}
			}

            return 1;
        }

        Item_Delete(id, true, ilosc);

        format(stringnarko, sizeof(stringnarko), "Sprzedales %d marihuany za %d$", ilosc, PRICE_NARKO_DRUG * ilosc);

        SendClientMessage(playerid, COLOR_BIALY, "Steve_Burton mówi: Następnym razem nie zawracaj mi gitary taką gównianą ilością. **splunął klientowi na buty**");

		if (gettime() - lastRadioDrugs >= 10.0)
		{
			if (random(100) < 50)
			{
				SendRadioMessage(FRAC_LSPD, COLOR_LIGHTRED, "HQ: Podejrzana osoba moim zdaniem handluje narkotykami na El Corona!!", 0, 1);
				lastRadioDrugs = gettime();
			}
		}
		new siano = PRICE_NARKO_DRUG * ilosc;
		if(IsPlayerPremiumOld(playerid))
			siano += floatround(siano * 0.1);
	    siano += floatround(siano * 0.1 * amountOfturfs);
        GameTextForPlayer(playerid, stringnarko, 5000, 3);
        DajKaseDone(playerid, PRICE_NARKO_DRUG * ilosc);
        return 1;
    }
    return 0;
}
// ========[KOMENDY - GRACZA]========
stock OnPlayerKeyStateChangeNarko(playerid, newkeys)
{
	if(newkeys==KEY_YES)
	{
		new tekst[500];
		if(DoInRange(5.0, playerid, 2309.1284,-2130.5847,13.5735)) // Odległość od miejsca kupna.
		{
			if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) // Jeżeli nie jesteśmy "na nogach" tylko np. w aucie to wywali info.
			{
				format(tekst, sizeof(tekst), ""C_SZARY"Aby otworzyć menu kupna nie możesz siedzieć w aucie.");
				ShowPlayerDialogEx(playerid, DIALOG_NKUP, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Coś jest nie tak!:", tekst, "Okej", "");			
				return 0;
			}
			ShowPlayerDialogEx(playerid, DIALOG_NKUP, DIALOG_STYLE_TABLIST_HEADERS, ""C_BIALY"Może coś Cię zainteresuje?", "{d9d9d9}ID\tNazwa\tKoszt\n1\tSadzonka do plantacji\t"C_ZIELONY"$"#PRICE_NARKO_KRZAK"", "{d9d9d9}KUP", "{d9d9d9}Anuluj");
		}
	}
	return 1;
}
stock OnPlayerKeyStateChangeNarko2(playerid, newkeys)
{
	if(newkeys==KEY_YES)
	{
		new tekst[500];
		if(DoInRange(5.0, playerid, 1892.84, -2107.69, 13.58)) // Odległość od miejsca kupna.
		{
			if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) // Jeżeli nie jesteśmy "na nogach" tylko np. w aucie to wywali info.
			{
				format(tekst, sizeof(tekst), ""C_SZARY"Aby otworzyć menu kupna nie możesz siedzieć w aucie.");
				ShowPlayerDialogEx(playerid, DIALOG_NSPRZEDAJBOTOWI, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Coś jest nie tak!:", tekst, "Okej", "");			
				return 0;
			}
			return ShowPlayerDialogEx(playerid, DIALOG_NSPRZEDAJBOTOWI, DIALOG_STYLE_INPUT, ""C_NIEBIESKI"Sprzedawanie narkotyku:", "Wpisz ile narkotyków chcesz sprzedać", "Dalej", "");
		}
	}
	return 1;
}

YCMD:nzbierz(playerid, params[])
{
    new tekst[300];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendErrorMessage(playerid, "Aby zebrać plantację musisz być pieszo.");
	new id = GetClosestPlant(playerid);
	if(id == -1 || !Iter_Contains(I_Plantacja, id))
		return sendErrorMessage(playerid, "Nie znajdujesz się w pobliżu żadnej plantacji!");
	/*if(Plantacja[id][p_Owner] != PlayerInfo[playerid][pUID] && Plantacja[id][p_Owner] > 0)
		return sendErrorMessage(playerid, "Ta plantacja nie została zasadzona przez Ciebie.");*/
	if(Plantacja[id][p_CanGather] == false)
		return sendErrorMessage(playerid, "Nie możesz zebrać jeszcze rośliny!");
	else
	{
		ApplyAnimation(playerid, "BOMBER","BOM_Plant_In",4.0,0,0,0,0,0);
		Item_Add("Marihuana", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_MARIHUANA, 0, 0, true, playerid, 6);
		UsunPlantacje(id);

		format(tekst, sizeof(tekst), ""C_SZARY"Plantacja została pomyślnie przez Ciebie zebrana!\nOtrzymałeś: ("C_ZIELONY"6"C_SZARY") gram narkotyków.");
        return ShowPlayerDialogEx(playerid, DIALOG_NZASADZ, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Plantacja zebrana!:", tekst, "Okej", "");
	}
}
forward healthRegen(playerid);

public healthRegen(playerid)
{
	new Float:health;
	GetPlayerHealth(playerid, health);
    new Float:newHealth = health + 15.0;

    if(newHealth > 100.0)
    {
        newHealth = 100.0;
    }
    SetPlayerHealth(playerid, newHealth);
	if (nPlayer[playerid][pTimerKill] <4)
		SetTimerEx("healthRegen", hpRegenDelay * 1000, false, "i", playerid); // ustawia timer do regeneracji HP

	nPlayer[playerid][pTimerKill] += 1;
    return 1;
}

// ========[STOCKI I FORWARDY, INNE]========

stock DoInRange(Float: radi, playerid, Float:x, Float:y, Float:z)//sprawdza odleglosc od miejsca
{
	if(IsPlayerInRangeOfPoint(playerid, radi, x, y, z)) return 1;
	return 0;
}

stock nNick(playerid)
{
    new PlayerNick[MAX_PLAYER_NAME + 1], string[256];
    GetPlayerName(playerid,PlayerNick,sizeof(PlayerNick));
    format(string,sizeof(string),nSRC,PlayerNick);
    return string;
}

stock GetPlayerNNick(playerid)//zwraca nick
{
	new nick[MAX_PLAYER_NAME + 1];
	GetPlayerName(playerid, nick, sizeof(nick));
	return nick;
}
forward zwyklyStan(playerid);
public zwyklyStan(playerid)
{
	new tekst[300];
	nPlayer[playerid][pPodWplywem] = 0; // Ustawia, że gracz już może zużyć następny narkotyk.
    SetPlayerWeather(playerid, 1);
    SetPlayerDrunkLevel(playerid, 0);
	format(tekst, sizeof(tekst), ""C_SZARY"Stan Twojej postaci po spożyciu nieznanej substancji wrócił do normy.\n");
	ShowPlayerDialogEx(playerid, DIALOG_NUZYL, DIALOG_STYLE_MSGBOX,""C_NIEBIESKI"Wracasz do normy!:", tekst, "Okej", "");
	return 1;
}

forward ZbierzUP3DText(plantacja_id);
public ZbierzUP3DText(plantacja_id)
{
	if(!Iter_Contains(I_Plantacja, plantacja_id)) return 0;
	new nick[24], output[256];
	strmid(nick, MruMySQL_GetNameFromUID(Plantacja[plantacja_id][p_Owner]), 0, MAX_PLAYER_NAME);
	format(output, sizeof(output), ""C_ZIELONY"Plantacja rośliny\n"C_SZARY"Roślina jest już gotowa do zbioru!\nAby zebrać roślinę wpisz: /nzbierz.\nStworzona przez: %s\nID: %d", (isnull(nick)) ? ("Brak właściciela") : (nick), plantacja_id);
	UpdateDynamic3DTextLabelText(Plantacja[plantacja_id][p_Label], 0xC0C0C0FF,output);
	Plantacja[plantacja_id][p_CanGather] = true;
	return 1;
}

stock UsunPlantacje(id)
{
	if(!Iter_Contains(I_Plantacja, id)) return 0;
	DestroyDynamicObject(Plantacja[id][p_Object]);
    //DestroyDynamic3DTextLabel(Plantacja[id][p_Label]);
	UpdateDynamic3DTextLabelText(Plantacja[id][p_Label], 0xC0C0C0FF, " ");
	Plantacja[id][p_Owner] = 0;
	Plantacja[id][p_Pos][0] = 0.0; 
	Plantacja[id][p_Pos][1] = 0.0; 
	Plantacja[id][p_Pos][2] = 0.0; 
	Plantacja[id][p_CanGather] = false;
	Iter_Remove(I_Plantacja, id);
	return 1;
}

stock GetClosestPlant(playerid, Float:dist = 3.0)
{
	foreach(new i : I_Plantacja)
	{
		if(IsPlayerInRangeOfPoint(playerid, dist, Plantacja[i][p_Pos][0], Plantacja[i][p_Pos][1], Plantacja[i][p_Pos][2]))
			return i;
	}
	return -1;
}

YCMD:usunplantacje(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1) return noAccessMessage(playerid);
	if(isnull(params))
		return sendTipMessage(playerid, "Użyj: /usunplantacje [ID]");
	new plantacja_id = strval(params);
	if(!Iter_Contains(I_Plantacja, plantacja_id))
		return sendErrorMessage(playerid, "Plantacja o podanym ID nie istnieje!");
	UsunPlantacje(plantacja_id);
	va_SendClientMessage(playerid, COLOR_GREEN, "* Usunąłeś plantację o ID: %d", plantacja_id);
	return 1;
}

YCMD:gotoplantacja(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1) return noAccessMessage(playerid);
	if(isnull(params))
		return sendTipMessage(playerid, "Użyj: /gotoplantacja [ID]");
	new plantacja_id = strval(params);
	if(!Iter_Contains(I_Plantacja, plantacja_id))
		return sendErrorMessage(playerid, "Plantacja o podanym ID nie istnieje!");
	SetPlayerPos(playerid, Plantacja[plantacja_id][p_Pos][0], Plantacja[plantacja_id][p_Pos][1], Plantacja[plantacja_id][p_Pos][2]);
	SendClientMessage(playerid, COLOR_GRAD2, " Zostałeś teleportowany!");
	return 1;
}