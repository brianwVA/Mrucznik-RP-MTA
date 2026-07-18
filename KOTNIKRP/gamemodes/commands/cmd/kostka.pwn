//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ kostka ]------------------------------------------------//
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

#define CLR_GREEN 0xFF00FF00
#define CLR_BLACK 0xFF000000

#define Frist_Bet_Value 100
#define Second_Bet_Value 1000

new krecikolemwtf[MAX_PLAYERS];

new Float:cPos[37][2] ={
{220.000000, 144.000000},
{242.000000, 203.000000},
{242.000000, 174.000000},
{242.000000, 145.000000},
{267.000000, 203.000000},
{267.000000, 174.000000},
{267.000000, 145.000000},
{292.000000, 203.000000},
{292.000000, 174.000000},
{292.000000, 145.000000},
{317.000000, 203.000000},
{317.000000, 174.000000},
{317.000000, 145.000000},
{342.000000, 203.000000},
{342.000000, 174.000000},
{342.000000, 145.000000},
{367.000000, 203.000000},
{367.000000, 174.000000},
{367.000000, 145.000000},
{392.000000, 203.000000},
{392.000000, 174.000000},
{392.000000, 145.000000},
{417.000000, 203.000000},
{417.000000, 174.000000},
{417.000000, 145.000000},
{442.000000, 203.000000},
{442.000000, 174.000000},
{442.000000, 145.000000},
{467.000000, 203.000000},
{467.000000, 174.000000},
{467.000000, 145.000000},
{492.000000, 203.000000},
{492.000000, 174.000000},
{492.000000, 145.000000},
{517.000000, 203.000000},
{517.000000, 174.000000},
{517.000000, 145.000000}
};

enum pInfooo
{
	Number,
	Colour,
	EVOROOD,
	_1to18,
	_19to36,
	_1st12,
	_2nd12,
	_3rd12,
	_3to1,
	CType,
}
new PlayerInfoo[MAX_PLAYERS][pInfooo];

new Actived[MAX_PLAYERS], bool:testruletka[50], StartTimerRuletka[MAX_PLAYERS], StopTimerRuletka[MAX_PLAYERS], PlayerText:TDRuletka[MAX_PLAYERS][61], PlayerText:C_TDRuletka[MAX_PLAYERS][50], pBet[MAX_PLAYERS][60], LastNumber[MAX_PLAYERS], bool:C_Created[MAX_PLAYERS][60];
new iddruletka=-1;


YCMD:kostka(playerid, params[], help)
{
    if(!IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805,-1090.59741211,-67.52223969)) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Tylko w kasynie!");
    if(strcmp(params, "akceptuj", true) == 0 || strcmp(params, "a", true) == 0)
    {
        if(GetPVarInt(playerid, "kostka-wait") == 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nikt nie oferował Ci gry!");
        if(GetPVarInt(playerid, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Obecnie rozgrywasz już grę!");
        new id = GetPVarInt(playerid, "kostka-wait")-1;
        if(GetPVarInt(id, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz obecnie rozgrywa grę.");
        if(GetPVarInt(id, "kostka-last") != playerid) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Rozgrywka nieaktualna.");
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        if(!IsPlayerInRangeOfPoint(id, 10.0, x, y, z))  return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz nie stoi obok Ciebie.");
        new czas = GetPVarInt(id, "kostka-czas");
        if(czas != GetPVarInt(playerid, "kostka-czas")) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Rozgrywka nieaktualna.");
        if(kaska[id] < GetPVarInt(id, "kostka-cash") || kaska[playerid] < GetPVarInt(id, "kostka-cash")) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Jednego z graczy nie stać na tę grę.");

        SetPVarInt(playerid, "kostka-cash", GetPVarInt(id, "kostka-cash"));
        SetPVarInt(playerid, "kostka-throw", GetPVarInt(id, "kostka-throw"));

        SetPVarInt(playerid, "kostka", 1);
        SetPVarInt(id, "kostka", 1);
        new str[128], nick[MAX_PLAYER_NAME + 1];
        GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
        format(str, 128, "%s zaakceptował grę, rzuca on pierwszy.", nick);
        sendTipMessageEx(id, COLOR_GREEN, str);
        sendTipMessageEx(playerid, COLOR_GREEN, "Zaakceptowałeś grę, rzucasz pierwszy.");

        SetPVarInt(playerid, "kostka-player", id);
        SetPVarInt(id, "kostka-player", playerid);

        SetPVarInt(playerid, "kostka-rzut", 1);
        SetPVarInt(id, "kostka-rzut", 0);

        ZabierzKaseDone(playerid, GetPVarInt(id, "kostka-cash"));
        ZabierzKaseDone(id, GetPVarInt(id, "kostka-cash"));
        Log(casinoLog, WARNING, "%s zaakceptował ofertę kostki od %s", GetPlayerLogName(playerid), GetPlayerLogName(id));
    }
    else if(strcmp(params, "odrzuć", true) == 0 || strcmp(params, "odrzuc", true) == 0 || strcmp(params, "o", true) == 0)
    {
        if(GetPVarInt(playerid, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Obecnie rozgrywasz już grę!");
        if(GetPVarInt(playerid, "kostka-wait") == 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nikt nie oferował Ci gry!");
        new id = GetPVarInt(playerid, "kostka-wait")-1;

        SetPVarInt(playerid, "kostka-wait", 0);

        new str[64], nick[MAX_PLAYER_NAME + 1];
        GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
        format(str, 64, "%s odrzucił Twoje zaproszenie.", nick);
        sendTipMessageEx(id, COLOR_RED, str);
        sendTipMessageEx(playerid, COLOR_RED, "Odrzuciłeś zaproszenie do gry.");
        Log(casinoLog, WARNING, "%s odrzucił ofertę kostki od %s", GetPlayerLogName(playerid), GetPlayerLogName(id));
    }
    else if(GetPVarInt(playerid, "kostka") == 1)
    {
        if(GetPVarInt(playerid, "kostka-rzut") == 1)
        {
            if(GetPVarInt(playerid, "kostka-throw") == 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Brak rzutów.");
            new rzuty = GetPVarInt(playerid, "kostka-throw"), str[64], nick[MAX_PLAYER_NAME +1];
            GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
            rzuty--;

            new ile;
            ile = 1+true_random(6);

            format(str, 64, "* %s wyrzuca %d oczek.", nick, ile);
            ProxDetector(12.0, playerid, str, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            Log(casinoLog, WARNING, "%s wyrzuca %d oczek.", GetPlayerLogName(playerid), ile);

            SetPVarInt(playerid, "kostka-throw", rzuty);
            SetPVarInt(playerid, "kostka-suma", ile + GetPVarInt(playerid, "kostka-suma"));
            new id = GetPVarInt(playerid, "kostka-player");

            if(rzuty == 0)
            {
                if(GetPVarInt(playerid, "kostka-suma") > GetPVarInt(id, "kostka-suma"))
                {
                    if(GetPVarInt(id, "kostka-throw") == 0)
                    {
                        new kasa = GetPVarInt(playerid, "kostka-cash");

                        format(str, 64, "Gratulacje! Wygrałeś %d$!", 2*kasa);
                        sendTipMessageEx(playerid, COLOR_GREEN, str);
                        format(str, 64, "Porażka! Przegrałeś %d$!", kasa);
                        sendTipMessageEx(id, COLOR_RED, str);
                        format(str, 64, "* %s wygrywa!", nick);
                        ProxDetector(12.0, playerid, str, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                        Log(casinoLog, WARNING, "%s wygrywa %d$.", GetPlayerLogName(playerid), 2*kasa);
                        Kostka_Wygrana(playerid, id, (2*kasa));

                        SetPVarInt(playerid, "kostka",0);
                        SetPVarInt(playerid, "kostka-throw", 0);
                        SetPVarInt(playerid, "kostka-suma", 0);
                        SetPVarInt(playerid, "kostka-cash", 0);
                        SetPVarInt(playerid, "kostka-first", 0);
                        SetPVarInt(playerid, "kostka-rzut", 0);
                        SetPVarInt(playerid, "kostka-wait", 0);
                        SetPVarInt(playerid, "kostka-player", 0);

                        SetPVarInt(id, "kostka",0);
                        SetPVarInt(id, "kostka-throw", 0);
                        SetPVarInt(id, "kostka-suma", 0);
                        SetPVarInt(id, "kostka-cash", 0);
                        SetPVarInt(id, "kostka-first", 0);
                        SetPVarInt(id, "kostka-rzut", 0);
                        SetPVarInt(id, "kostka-wait", 0);
                        SetPVarInt(id, "kostka-player", 0);
                    }

                }
                else if(GetPVarInt(playerid, "kostka-suma") == GetPVarInt(id, "kostka-suma"))
                {
                    if(GetPVarInt(id, "kostka-throw") == 0)
                    {
                        SetPVarInt(playerid, "kostka-throw", 1);
                        SetPVarInt(id, "kostka-throw", 1);

                        sendTipMessageEx(playerid, COLOR_RED, "REMIS! Masz dodatkowy rzut.");
                        sendTipMessageEx(id, COLOR_RED, "REMIS! Masz dodatkowy rzut.");
                        Log(casinoLog, WARNING, "%s ma dodatkowy rzut!", GetPlayerLogName(playerid));
                    }
                }
                else
                {
                    if(GetPVarInt(id, "kostka-throw") == 0)
                    {
                        new kasa = GetPVarInt(id, "kostka-cash");

                        GetPlayerName(id, nick, MAX_PLAYER_NAME);
                        format(str, 64, "Gratulacje! Wygrałeś %d$!", 2*kasa);
                        sendTipMessageEx(id, COLOR_GREEN, str);
                        format(str, 64, "Porażka! Przegrałeś %d$!", kasa);
                        sendTipMessageEx(playerid, COLOR_RED, str);
                        format(str, 64, "* %s wygrywa!", nick);
                        ProxDetector(12.0, id, str, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                        Log(casinoLog, WARNING, "%s wygrywa %d$.", GetPlayerLogName(id), 2*kasa);
                        Kostka_Wygrana(id, playerid, (2*kasa));

                        SetPVarInt(playerid, "kostka",0);
                        SetPVarInt(playerid, "kostka-throw", 0);
                        SetPVarInt(playerid, "kostka-suma", 0);
                        SetPVarInt(playerid, "kostka-cash", 0);
                        SetPVarInt(playerid, "kostka-first", 0);
                        SetPVarInt(playerid, "kostka-rzut", 0);
                        SetPVarInt(playerid, "kostka-wait", 0);
                        SetPVarInt(playerid, "kostka-player", 0);

                        SetPVarInt(id, "kostka",0);
                        SetPVarInt(id, "kostka-throw", 0);
                        SetPVarInt(id, "kostka-suma", 0);
                        SetPVarInt(id, "kostka-cash", 0);
                        SetPVarInt(id, "kostka-first", 0);
                        SetPVarInt(id, "kostka-rzut", 0);
                        SetPVarInt(id, "kostka-wait", 0);
                        SetPVarInt(id, "kostka-player", 0);
                    }
                }
            }
            SetPVarInt(playerid, "kostka-rzut", 0);
            SetPVarInt(id, "kostka-rzut", 1);
        }
        else sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "To nie jest Twoja kolej na rzut.");
    }
    else
    {
        new id, kasa, throw, Float:x, Float:y, Float:z;
        if(sscanf(params, "k<fix>dd", id, kasa, throw)) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Aby rozpocząć grę w kosci użyj: /kostka [Nick/ID] [Stawka] [Ilośc rzutów]");
        if(!IsPlayerConnected(id) || id == playerid) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nie ma takiego gracza.");
        if(kasa < PRICE_KOSTKA_MIN || kasa > PRICE_KOSTKA_MAX) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Stawka nie mniejsza niż "#PRICE_KOSTKA_MIN"$ i nie większa niż "#PRICE_KOSTKA_MAX"$");
        if(throw < 2 || throw > 10) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Minimalna ilość rzutów to 2 a maksymalna to 10.");
        if(GetPVarInt(id, "kostka-wait") > 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz otrzymał już ofertę.");
        if(GetPVarInt(id, "kostka") == 1 || GetPVarInt(playerid, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz obecnie rozgrywa grę.");
        GetPlayerPos(playerid, x, y, z);
        if(!IsPlayerInRangeOfPoint(id, 10.0, x, y, z))  return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz nie stoi obok Ciebie.");
        if(kaska[id] < kasa || kaska[playerid] < kasa) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Za duża stawka na Was, ktos nie ma tyle.");

        SetPVarInt(id, "kostka-wait", playerid+1);

        SetPVarInt(playerid, "kostka-cash", kasa);
        SetPVarInt(playerid, "kostka-throw", throw);

        SetPVarInt(playerid, "kostka-last", id);

        SetPVarInt(playerid, "kostka-czas", gettime());
        SetPVarInt(id, "kostka-czas", gettime());

        new str[128], nick[MAX_PLAYER_NAME + 1];
        GetPlayerName(id, nick, MAX_PLAYER_NAME);
        format(str, 128, "Wysłano zaproszenie do gry graczowi %s.", nick);
        sendTipMessageEx(playerid, COLOR_GREEN, str);
        GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
        format(str, 128, "Gracz %s chce zagrać z Tobą w kości na %d rzutów o %d $.", nick, throw, kasa);
        Log(casinoLog, WARNING, "%s oferuje kostkę graczowi %s.", GetPlayerLogName(playerid), GetPlayerLogName(id));
        sendTipMessageEx(id, COLOR_GREEN, str);
        sendTipMessageEx(id, COLOR_PAPAYAWHIP, "Aby zaakceptować użyj /kostka akceptuj, aby odrzucić użyj /kostka odrzuć");
    }
    return 1;
}

YCMD:zakreckolem(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid,4,1016.8065,-1104.2010,-67.5729))
    {
        if(krecikolemwtf[playerid] == 1) return GameTextForPlayer(playerid, "Zakreciles juz kolem!", 3000, 3);
        if(kaska[playerid] <= PRICE_KASYNO_KF) return GameTextForPlayer(playerid, "Nie masz tyle pieniedzy ("#PRICE_KASYNO_KF"$)!", 3000, 3);
        {
            SetTimerEx("kolofortuny", 5000, false, "i", playerid);
            TextDrawInfoOn(playerid,"Trwa ~y~losowanie!",5000);
            ZabierzKaseDone(playerid, PRICE_KASYNO_KF);
            TogglePlayerControllable(playerid, 0);
            krecikolemwtf[playerid] = true;
        }
    }
    return 1;
}

YCMD:ruletka(playerid, params[])
{
    new stringruleta[258];
    if(!IsPlayerInRangeOfPoint(playerid,4,1036.8600,-1090.8431,-67.5729)) return sendTipMessage(playerid, "Nie znaleziono 3to1u do ruletki");
    if(Actived[playerid] == 0)
    {
        HiddeTd(playerid);
        LoadTDRuletka(playerid);
        ShowTd(playerid);
        SelectTextDraw(playerid, 0x9999BBBB);
        TogglePlayerControllable(playerid, 0);
        Actived[playerid] = 1;
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
        TextDrawSetString(TextDrawInfo[playerid], stringruleta);
        TextDrawShowForPlayer(playerid, TextDrawInfo[playerid]);
    }
    else
    {
        TogglePlayerControllable(playerid, 1);
        CancelSelectTextDraw(playerid);
        Actived[playerid] = 0;
        TextDrawHideForPlayer(playerid, TextDrawInfo[playerid]);
        RestartVaribles(playerid);
        KillTimer(StartTimerRuletka[playerid]);
        KillTimer(StopTimerRuletka[playerid]);
        HiddeTd(playerid);
    }
    return 1;
}

forward kolofortuny(playerid);
public kolofortuny(playerid)
{
    new kolo = true_random(61), wygrana, string[256];
    if(kolo >= 1 && kolo <= 30)//1
    {
        wygrana = 1;
        Log(payLog, WARNING, "%s zakręcił kołem fortuny i wypadło: 1$", GetPlayerLogName(playerid));
        format(string, sizeof(string), "* %s zakręcił kołem fortuny które zatrzymało się na: 1$", GetNick(playerid));
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    else if(kolo > 30 && kolo <= 45)//2
    {
        wygrana = 2;
        Log(payLog, WARNING, "%s zakręcił kołem fortuny i wypadło: 2$", GetPlayerLogName(playerid));
        format(string, sizeof(string), "* %s zakręcił kołem fortuny które zatrzymało się na: 2$", GetNick(playerid));
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    else if(kolo > 45 && kolo <= 53)//5
    {
        wygrana = 5;
        Log(payLog, WARNING, "%s zakręcił kołem fortuny i wypadło: 5$", GetPlayerLogName(playerid));
        format(string, sizeof(string), "* %s zakręcił kołem fortuny które zatrzymało się na: 5$", GetNick(playerid));
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    else if(kolo > 53 && kolo <= 57)//10
    {
        wygrana = 10;
        Log(payLog, WARNING, "%s zakręcił kołem fortuny i wypadło: 10$", GetPlayerLogName(playerid));
        format(string, sizeof(string), "* %s zakręcił kołem fortuny które zatrzymało się na: 10$", GetNick(playerid));
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    else if(kolo == 58 || kolo == 59)//20
    {
        wygrana = 20;
        Log(payLog, WARNING, "%s zakręcił kołem fortuny i wypadło: 20$", GetPlayerLogName(playerid));
        format(string, sizeof(string), "* %s zakręcił kołem fortuny które zatrzymało się na: 20$", GetNick(playerid));
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    else if(kolo == 60 || kolo == 61)//*
    {
        wygrana = 40;
        Log(payLog, WARNING, "%s zakręcił kołem fortuny i wypadło: 40$", GetPlayerLogName(playerid));
        format(string, sizeof(string), "* %s zakręcił kołem fortuny które zatrzymało się na gwieździe fortuny (40$)", GetNick(playerid));
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    
    new StringWygrana[258];
    DajKaseDone(playerid, wygrana);
    TogglePlayerControllable(playerid, 1);
    krecikolemwtf[playerid] = false;
    format(StringWygrana, sizeof(StringWygrana), "~g~Wylosowano ~w~%d~g~$", wygrana);
    TextDrawInfoOn(playerid,StringWygrana,5000);

    return 1;
}

////////////////////////////////////////////////////////
/////                                              /////
/////                KOD OD RULETKI                /////
/////                                              /////
////////////////////////////////////////////////////////

stock OnPlayerConnectRuleta(playerid)
{
    RestartVaribles(playerid);
    LoadTDRuletka(playerid);
    HiddeTd(playerid);
    Actived[playerid] = 0;
    TextDrawHideForPlayer(playerid, TextDrawInfo[playerid]);
    krecikolemwtf[playerid] = false;
	return 1;
}

stock OnPlayerDisconnectRuletka(playerid)
{
    RestartVaribles(playerid);
	KillTimer(StartTimerRuletka[playerid]);
	KillTimer(StopTimerRuletka[playerid]);
    HiddeTd(playerid);
    Actived[playerid] = 0;
    TextDrawHideForPlayer(playerid, TextDrawInfo[playerid]);
    return 1;
}

stock PlayerClickPlayerTextDrawRuleta(playerid, PlayerText:playertextid)
{
    new str[128], stringruleta[258];
	for(new i;i<37;i++)
	{
		if(playertextid == TDRuletka[playerid][i])
		{
	        PlayerInfoo[playerid][Number] = i;
	        if(PlayerInfoo[playerid][CType] == 0)
			{
				if(kaska[playerid] < Frist_Bet_Value)
					return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
				pBet[playerid][i] += Frist_Bet_Value;
                DajKase(playerid,-Frist_Bet_Value);
			}

			if(PlayerInfoo[playerid][CType] == 1)
			{
				if(kaska[playerid] < Second_Bet_Value)
					return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
				pBet[playerid][i] += Second_Bet_Value;
                DajKase(playerid,-Second_Bet_Value);
			}
			format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na numer %d : $%d",i,pBet[playerid][i]);
			SendClientMessage(playerid,-1,str);
            format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		    TextDrawSetString(TextDrawInfo[playerid], stringruleta);
	        if(C_Created[playerid][i] == false)
	        {
	        	CreateChip(playerid,(cPos[i][0]-10.0),cPos[i][1]);
	        	C_Created[playerid][i] = true;
	        }
		}
	}
	if(playertextid == TDRuletka[playerid][37])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][40] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][40] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_3to1] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na numer : $%d",pBet[playerid][40]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][40] == false)
		{
 			C_Created[playerid][40] = true;
 			CreateChip(playerid,555.000000, 203.000000);
		}
	}
	if(playertextid == TDRuletka[playerid][38])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][41] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][41] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_3to1] = 2;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 3to1 : $%d",pBet[playerid][41]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][41] == false)
 		{
 			C_Created[playerid][41] = true;
 			CreateChip(playerid,555.000000, 174.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][39])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][42] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][42] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_3to1] = 3;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 3to1: $%d",pBet[playerid][42]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][42] == false)
 		{
 			C_Created[playerid][42] = true;
 			CreateChip(playerid,555.000000, 145.000000);
		}
	}
	if(playertextid == TDRuletka[playerid][40])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][43] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][43] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_1st12] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 1st12: $%d",pBet[playerid][43]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][43] == false)
 		{
 			C_Created[playerid][43] = true;
 			CreateChip(playerid,279.000000, 229.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][41])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][44] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][44] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_2nd12] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 2st12: $%d",pBet[playerid][44]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][44] == false)
 		{
 			C_Created[playerid][44] = true;
 			CreateChip(playerid,379.000000, 229.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][42])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][45] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][45] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_3rd12] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 3st12: $%d",pBet[playerid][45]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][45] == false)
 		{
 			C_Created[playerid][45] = true;
 			CreateChip(playerid,479.000000, 229.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][43])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][46] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][46] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_1to18] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 1to18: $%d",pBet[playerid][46]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][46] == false)
 		{
 			C_Created[playerid][46] = true;
 			CreateChip(playerid,254.000000, 255.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][44])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][47] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][47] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][EVOROOD] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na EVEN: $%d",pBet[playerid][47]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][47] == false)
 		{
 			C_Created[playerid][47] = true;
 			CreateChip(playerid,304.000000, 255.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][45])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][48] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][48] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][Colour] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na Colour RED: $%d",pBet[playerid][48]);
		SendClientMessage(playerid,-1,str);
		//DajKase(playerid,-pBet[playerid][48]);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][48] == false)
 		{
 			C_Created[playerid][48] = true;
 			CreateChip(playerid,355.000000, 255.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][46])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][49] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][49] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][Colour] = 2;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na Colour BLACK: $%d",pBet[playerid][49]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][49] == false)
 		{
 			C_Created[playerid][49] = true;
 			CreateChip(playerid,404.000000, 255.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][47])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][50] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][50] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][EVOROOD] = 2;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na ODD : $%d",pBet[playerid][50]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
        if(C_Created[playerid][50] == false)
        {
 			C_Created[playerid][50] = true;
 			CreateChip(playerid,453.000000, 255.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][48])
	{
	    if(PlayerInfoo[playerid][CType] == 0)
		{
			if(kaska[playerid] < Frist_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][51] += Frist_Bet_Value;
            DajKase(playerid,-Frist_Bet_Value);
		}
		if(PlayerInfoo[playerid][CType] == 1)
		{
			if(kaska[playerid] < Second_Bet_Value)
				return SendClientMessage(playerid,-1,"{6EF83C}INFO: {FFFFFF}Nie masz tyle pieniedzy!");
			pBet[playerid][51] += Second_Bet_Value;
            DajKase(playerid,-Second_Bet_Value);
		}
 		PlayerInfoo[playerid][_19to36] = 1;
		format(str,sizeof(str),"{6EF83C}INFO: {FFFFFF}Postawiles na 19to36 : $%d",pBet[playerid][51]);
		SendClientMessage(playerid,-1,str);
        format(stringruleta, sizeof(stringruleta), "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$", kaska[playerid]);
		TextDrawSetString(TextDrawInfo[playerid], stringruleta);
 		if(C_Created[playerid][51] == false)
 		{
 			C_Created[playerid][51] = true;
 			CreateChip(playerid,502.000000, 255.000000);
 		}
	}
	if(playertextid == TDRuletka[playerid][51])
	{
 		for(new i=54;i<61;i++)
		{
	    	PlayerTextDrawShow(playerid,TDRuletka[playerid][i]);
 		}
 		CancelSelectTextDraw(playerid);
        SetPVarInt(playerid, "RuletaSpin", 1);
 		StartTimerRuletka[playerid] = SetTimerEx("StartRulet",200,0,"i",playerid);
 		StopTimerRuletka[playerid]  = SetTimerEx("StopRulet",5000,0,"i",playerid);
	}
	if(playertextid == TDRuletka[playerid][50])
	{
 		PlayerInfoo[playerid][CType] = 0;
	}
	if(playertextid == TDRuletka[playerid][52])
	{
 		PlayerInfoo[playerid][CType] = 1;
	}
    return 1;
}

forward CheckPlayerRuletka(playerid, number);
public CheckPlayerRuletka(playerid, number)
{
    new str[128], stringruleta[258];

    // ----- PROSTY NUMER (0..36) -----
    // sprawdzaj faktyczną stawkę na wylosowany numer
    if(pBet[playerid][number] > 0)
    {
        // jeśli chcesz "ruletkowe" wypłaty:
        // 35:1 zysku albo 36x zwrotu (w zależności jak liczysz)
        // Ty odejmujesz stawkę przy obstawianiu, więc sensowne jest 36x (zwrot razem ze stawką).
        new win = 36 * pBet[playerid][number];
        DajKase(playerid, win);
        format(str, sizeof(str), "WYGRALES $%d", win);
        SendClientMessage(playerid, -1, str);
    }

    // ----- 3to1 (kolumny) -----
    switch(number)
    {
        case 3,6,9,12,15,18,21,24,27,30,33,36:
        {
            if(PlayerInfoo[playerid][_3to1] == 3 && pBet[playerid][42] > 0)
            {
                new win = 3 * pBet[playerid][42];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 2,5,8,11,14,17,20,23,26,29,32,35:
        {
            if(PlayerInfoo[playerid][_3to1] == 2 && pBet[playerid][41] > 0)
            {
                new win = 3 * pBet[playerid][41];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 1,4,7,10,13,16,19,22,25,28,31,34:
        {
            if(PlayerInfoo[playerid][_3to1] == 1 && pBet[playerid][40] > 0)
            {
                new win = 3 * pBet[playerid][40];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
    }

    // ----- 1st/2nd/3rd 12 -----
    switch(number)
    {
        case 1..12:
        {
            if(PlayerInfoo[playerid][_1st12] == 1 && pBet[playerid][43] > 0)
            {
                new win = 3 * pBet[playerid][43];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 13..24:
        {
            if(PlayerInfoo[playerid][_2nd12] == 1 && pBet[playerid][44] > 0)
            {
                new win = 3 * pBet[playerid][44];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 25..36:
        {
            if(PlayerInfoo[playerid][_3rd12] == 1 && pBet[playerid][45] > 0)
            {
                new win = 3 * pBet[playerid][45];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
    }

    // ----- 1to18 / 19to36 -----
    switch(number)
    {
        case 1..18:
        {
            if(PlayerInfoo[playerid][_1to18] == 1 && pBet[playerid][46] > 0)
            {
                new win = 2 * pBet[playerid][46];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 19..36:
        {
            // TU BYŁ BŁĄD: miałeś pBet[47], a obstawiasz 19to36 w pBet[51]
            if(PlayerInfoo[playerid][_19to36] == 1 && pBet[playerid][51] > 0)
            {
                new win = 2 * pBet[playerid][51];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
    }

    // ----- RED / BLACK -----
    switch(number)
    {
        case 1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36:
        {
            if(PlayerInfoo[playerid][Colour] == 1 && pBet[playerid][48] > 0)
            {
                new win = 2 * pBet[playerid][48];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35:
        {
            if(PlayerInfoo[playerid][Colour] == 2 && pBet[playerid][49] > 0)
            {
                new win = 2 * pBet[playerid][49];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
    }

    // ----- EVEN / ODD -----
    switch(number)
    {
        case 2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36:
        {
            // TU BYŁ BŁĄD: EVEN obstawiasz w pBet[47], a wypłacałeś z [50]
            if(PlayerInfoo[playerid][EVOROOD] == 1 && pBet[playerid][47] > 0)
            {
                new win = 2 * pBet[playerid][47];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
        case 1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35:
        {
            // TU BYŁ BŁĄD: ODD obstawiasz w pBet[50], a wypłacałeś z [51]
            if(PlayerInfoo[playerid][EVOROOD] == 2 && pBet[playerid][50] > 0)
            {
                new win = 2 * pBet[playerid][50];
                DajKase(playerid, win);
                format(str, sizeof(str), "WYGRALES $%d", win);
                GameTextForPlayer(playerid, str, 5000, 4);
                SendClientMessage(playerid, -1, str);
            }
        }
    }

    // odśwież saldo
    format(stringruleta, sizeof(stringruleta),
        "stan twojego ~y~konta~n~~w~wynosi ~y~%d~g~$",
        kaska[playerid]
    );
    TextDrawSetString(TextDrawInfo[playerid], stringruleta);

    // wyczyść stawki
    for(new i = 0; i < 60; i++) pBet[playerid][i] = 0;

    return 1;
}


forward StartRulet(playerid);
public StartRulet(playerid)
{
    if(GetPVarInt(playerid, "RuletaSpin") == 1)
    {
        new rand;
        new string[16];

        rand = RandomEx(0, 36);
        format(string, sizeof(string), "%d", rand);
        PlayerTextDrawSetString(playerid, TDRuletka[playerid][56], string);

        // ustaw kolor tła wyniku
        if(rand == 0)
        {
            PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][56], CLR_GREEN);
        }
        else if(rand == 1 || rand == 3 || rand == 5 || rand == 7 || rand == 9 || rand == 12 || rand == 14 || rand == 16 || rand == 18 ||
                rand == 19 || rand == 21 || rand == 23 || rand == 25 || rand == 27 || rand == 30 || rand == 32 || rand == 34 || rand == 36)
        {
            PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][56], CLR_RED);
        }
        else
        {
            PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][56], CLR_BLACK);
        }

        // odśwież pokazanie (czasem pomaga na klientach)
        PlayerTextDrawShow(playerid, TDRuletka[playerid][56]);

        LastNumber[playerid] = rand;
        StartTimerRuletka[playerid] = SetTimerEx("StartRulet", 200, 0, "i", playerid);
    }
    return 1;
}

forward StopRulet(playerid);
public StopRulet(playerid)
{
    SetPVarInt(playerid, "RuletaSpin", 0);

    new string[16];
    format(string, sizeof(string), "%d", LastNumber[playerid]);
    PlayerTextDrawSetString(playerid, TDRuletka[playerid][56], string);

    // finalny kolor
    if(LastNumber[playerid] == 0)
        PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][56], CLR_GREEN);
    else if(LastNumber[playerid] == 1 || LastNumber[playerid] == 3 || LastNumber[playerid] == 5 || LastNumber[playerid] == 7 || LastNumber[playerid] == 9 ||
            LastNumber[playerid] == 12 || LastNumber[playerid] == 14 || LastNumber[playerid] == 16 || LastNumber[playerid] == 18 || LastNumber[playerid] == 19 ||
            LastNumber[playerid] == 21 || LastNumber[playerid] == 23 || LastNumber[playerid] == 25 || LastNumber[playerid] == 27 || LastNumber[playerid] == 30 ||
            LastNumber[playerid] == 32 || LastNumber[playerid] == 34 || LastNumber[playerid] == 36)
        PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][56], CLR_RED);
    else
        PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][56], CLR_BLACK);

    PlayerTextDrawShow(playerid, TDRuletka[playerid][56]);

    CheckPlayerRuletka(playerid, LastNumber[playerid]);

    KillTimer(StartTimerRuletka[playerid]);
    KillTimer(StopTimerRuletka[playerid]);
    return 1;
}

// Pokazuje wszystkie TD ruletki (0..60)
stock ShowTd(playerid)
{
    for(new i = 0; i < 61; i++)
    {
        if(TDRuletka[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
        {
            PlayerTextDrawShow(playerid, TDRuletka[playerid][i]);
        }
    }
    SetPVarInt(playerid, "RuletkaShowed", 1);
    return 1;
}

// Chowa i niszczy wszystkie TD ruletki, ale tylko jeśli były pokazane
stock HiddeTd(playerid)
{
    if(GetPVarInt(playerid, "RuletkaShowed") != 1) return 1;

    for(new i = 0; i < 61; i++)
    {
        if(TDRuletka[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
        {
            PlayerTextDrawHide(playerid, TDRuletka[playerid][i]);
            PlayerTextDrawDestroy(playerid, TDRuletka[playerid][i]);
            TDRuletka[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
        }
    }

    // Usuwanie chipów
    for(new i = 0; i < 50; i++)
    {
        if(testruletka[i] == true)
        {
            if(C_TDRuletka[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
            {
                PlayerTextDrawDestroy(playerid, C_TDRuletka[playerid][i]);
                C_TDRuletka[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
            }
            testruletka[i] = false;
        }
    }

    iddruletka = -1;
    SetPVarInt(playerid, "RuletkaShowed", 0);
    return 1;
}


stock CreateChip(playerid,Float:X,Float:Y)
{
 	iddruletka++;
	C_TDRuletka[playerid][iddruletka] = CreatePlayerTextDraw(playerid, X, Y, "-");
	PlayerTextDrawAlignment(playerid,C_TDRuletka[playerid][iddruletka], 2);
	PlayerTextDrawBackgroundColour(playerid,C_TDRuletka[playerid][iddruletka], 0x00000000);
	PlayerTextDrawFont(playerid,C_TDRuletka[playerid][iddruletka], 5);
	PlayerTextDrawLetterSize(playerid,C_TDRuletka[playerid][iddruletka], 0.400000, 1.899999);
	PlayerTextDrawColour(playerid,C_TDRuletka[playerid][iddruletka], -1);
	PlayerTextDrawSetOutline(playerid,C_TDRuletka[playerid][iddruletka], 1);
	PlayerTextDrawSetProportional(playerid,C_TDRuletka[playerid][iddruletka], 1);
	PlayerTextDrawUseBox(playerid,C_TDRuletka[playerid][iddruletka], 1);
	PlayerTextDrawBoxColour(playerid,C_TDRuletka[playerid][iddruletka], 0);
	PlayerTextDrawTextSize(playerid,C_TDRuletka[playerid][iddruletka], 20.000000, 21.000000);
	if(PlayerInfoo[playerid][CType] == 0)
	{
		PlayerTextDrawSetPreviewModel(playerid, C_TDRuletka[playerid][iddruletka], 1859);
	}
	if(PlayerInfoo[playerid][CType] == 1)
	{
		PlayerTextDrawSetPreviewModel(playerid, C_TDRuletka[playerid][iddruletka], 1860);
	}
	PlayerTextDrawSetPreviewRot(playerid, C_TDRuletka[playerid][iddruletka], 90.000000, 180.000000, 90.000000, 1.000000);
	PlayerTextDrawSetSelectable(playerid,C_TDRuletka[playerid][iddruletka], 0);
	PlayerTextDrawShow(playerid,C_TDRuletka[playerid][iddruletka]);
	testruletka[iddruletka] = true;
}

stock RestartVaribles(playerid)
{
	PlayerInfoo[playerid][Number]  = -1;
	PlayerInfoo[playerid][_3to1]   = 0;
	PlayerInfoo[playerid][_1st12]  = 0;
	PlayerInfoo[playerid][_2nd12]  = 0;
	PlayerInfoo[playerid][_3rd12]  = 0;
	PlayerInfoo[playerid][_1to18]  = 0;
	PlayerInfoo[playerid][_19to36] = 0;
	PlayerInfoo[playerid][Colour]   = 0;
	PlayerInfoo[playerid][EVOROOD] = 0;
	for(new i;i<60;i++)
	{
		C_Created[playerid][i] = false;
		pBet[playerid][i]   = 0;
	}
}

stock LoadTDRuletka(playerid)
{
    TDRuletka[playerid][51] = CreatePlayerTextDraw(playerid, 555.0, 255.0, "START");
    PlayerTextDrawAlignment(playerid, TDRuletka[playerid][51], 2);
    PlayerTextDrawBackgroundColour(playerid, TDRuletka[playerid][51], 255);
    PlayerTextDrawFont(playerid, TDRuletka[playerid][51], 2);
    PlayerTextDrawLetterSize(playerid, TDRuletka[playerid][51], 0.300000, 1.800000);
    PlayerTextDrawColour(playerid, TDRuletka[playerid][51], 0xFFFFFFFF);
    PlayerTextDrawSetOutline(playerid, TDRuletka[playerid][51], 1);
    PlayerTextDrawSetProportional(playerid, TDRuletka[playerid][51], 1);

    PlayerTextDrawUseBox(playerid, TDRuletka[playerid][51], 1);
    PlayerTextDrawBoxColour(playerid, TDRuletka[playerid][51], 0xFF00FF00); // zielone tło z alphą

    // Ustaw jako prawy-dolny róg boxa/klikalnego obszaru (X2 > 555, Y2 > 255)
    PlayerTextDrawTextSize(playerid, TDRuletka[playerid][51], 600.0, 275.0);

    PlayerTextDrawSetSelectable(playerid, TDRuletka[playerid][51], 1);

    TDRuletka[playerid][56] = CreatePlayerTextDraw(playerid,141.000000, 183.000000, "36");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][56], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][56], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][56], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][56], 0.840000, 5.900000);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][56], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][56], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][56], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][56], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][56], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][56], 0.000000, 55.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][56], 0);
    TDRuletka[playerid][49] = CreatePlayerTextDraw(playerid,585.000000, 141.000000, "~n~");
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][49], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][49], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][49], 0.500000, 15.100000);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][49], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][49], 0);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][49], 1);
    PlayerTextDrawSetShadow(playerid,TDRuletka[playerid][49], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][49], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][49], 100);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][49], 207.000000, 2.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][49], 0);

    TDRuletka[playerid][0] = CreatePlayerTextDraw(playerid,220.000000, 144.000000, "~n~0~n~~n~");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][0], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][0], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][0], 0.400000, 2.799999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][0], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][0], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][0], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][0], 16711935);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][0], 10.000000, 10.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][0], 1);

    TDRuletka[playerid][1] = CreatePlayerTextDraw(playerid,242.000000, 203.000000, "1");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][1], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][1], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][1], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][1], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][1], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][1], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][1], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][1], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][1], 1);

    TDRuletka[playerid][2] = CreatePlayerTextDraw(playerid,242.000000, 174.000000, "2");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][2], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][2], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][2], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][2], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][2], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][2], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][2], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][2], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][2], 1);

    TDRuletka[playerid][3] = CreatePlayerTextDraw(playerid,242.000000, 145.000000, "3");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][3], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][3], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][3], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][3], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][3], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][3], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][3], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][3], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][3], 1);

    TDRuletka[playerid][4] = CreatePlayerTextDraw(playerid,267.000000, 203.000000, "4");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][4], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][4], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][4], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][4], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][4], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][4], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][4], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][4], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][4], 1);

    TDRuletka[playerid][5] = CreatePlayerTextDraw(playerid,267.000000, 174.000000, "5");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][5], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][5], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][5], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][5], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][5], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][5], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][5], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][5], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][5], 1);

    TDRuletka[playerid][6] = CreatePlayerTextDraw(playerid,267.000000, 145.000000, "6");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][6], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][6], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][6], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][6], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][6], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][6], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][6], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][6], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][6], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][6], 1);

    TDRuletka[playerid][7] = CreatePlayerTextDraw(playerid,292.000000, 203.000000, "7");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][7], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][7], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][7], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][7], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][7], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][7], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][7], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][7], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][7], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][7], 1);

    TDRuletka[playerid][8] = CreatePlayerTextDraw(playerid,292.000000, 174.000000, "8");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][8], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][8], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][8], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][8], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][8], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][8], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][8], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][8], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][8], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][8], 1);

    TDRuletka[playerid][9] = CreatePlayerTextDraw(playerid,292.000000, 145.000000, "9");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][9], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][9], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][9], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][9], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][9], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][9], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][9], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][9], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][9], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][9], 1);

    TDRuletka[playerid][10] = CreatePlayerTextDraw(playerid,317.000000, 203.000000, "10");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][10], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][10], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][10], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][10], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][10], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][10], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][10], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][10], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][10], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][10], 1);

    TDRuletka[playerid][11] = CreatePlayerTextDraw(playerid,317.000000, 174.000000, "11");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][11], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][11], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][11], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][11], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][11], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][11], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][11], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][11], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][11], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][11], 1);

    TDRuletka[playerid][12] = CreatePlayerTextDraw(playerid,317.000000, 145.000000, "12");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][12], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][12], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][12], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][12], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][12], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][12], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][12], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][12], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][12], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][12], 1);

    TDRuletka[playerid][13] = CreatePlayerTextDraw(playerid,342.000000, 203.000000, "13");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][13], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][13], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][13], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][13], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][13], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][13], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][13], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][13], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][13], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][13], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][13], 1);

    TDRuletka[playerid][14] = CreatePlayerTextDraw(playerid,342.000000, 174.000000, "14");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][14], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][14], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][14], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][14], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][14], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][14], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][14], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][14], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][14], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][14], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][14], 1);

    TDRuletka[playerid][15] = CreatePlayerTextDraw(playerid,342.000000, 145.000000, "15");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][15], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][15], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][15], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][15], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][15], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][15], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][15], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][15], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][15], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][15], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][15], 1);

    TDRuletka[playerid][16] = CreatePlayerTextDraw(playerid,367.000000, 203.000000, "16");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][16], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][16], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][16], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][16], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][16], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][16], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][16], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][16], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][16], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][16], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][16], 1);

    TDRuletka[playerid][17] = CreatePlayerTextDraw(playerid,367.000000, 174.000000, "17");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][17], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][17], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][17], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][17], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][17], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][17], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][17], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][17], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][17], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][17], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][17], 1);

    TDRuletka[playerid][18] = CreatePlayerTextDraw(playerid,367.000000, 145.000000, "18");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][18], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][18], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][18], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][18], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][18], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][18], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][18], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][18], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][18], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][18], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][18], 1);

    TDRuletka[playerid][19] = CreatePlayerTextDraw(playerid,392.000000, 203.000000, "19");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][19], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][19], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][19], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][19], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][19], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][19], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][19], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][19], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][19], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][19], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][19], 1);

    TDRuletka[playerid][20] = CreatePlayerTextDraw(playerid,392.000000, 174.000000, "20");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][20], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][20], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][20], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][20], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][20], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][20], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][20], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][20], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][20], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][20], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][20], 1);

    TDRuletka[playerid][21] = CreatePlayerTextDraw(playerid,392.000000, 145.000000, "21");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][21], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][21], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][21], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][21], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][21], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][21], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][21], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][21], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][21], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][21], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][21], 1);

    TDRuletka[playerid][22] = CreatePlayerTextDraw(playerid,417.000000, 203.000000, "22");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][22], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][22], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][22], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][22], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][22], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][22], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][22], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][22], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][22], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][22], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][22], 1);

    TDRuletka[playerid][23] = CreatePlayerTextDraw(playerid,417.000000, 174.000000, "23");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][23], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][23], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][23], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][23], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][23], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][23], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][23], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][23], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][23], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][23], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][23], 1);

    TDRuletka[playerid][24] = CreatePlayerTextDraw(playerid,417.000000, 145.000000, "24");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][24], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][24], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][24], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][24], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][24], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][24], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][24], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][24], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][24], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][24], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][24], 1);

    TDRuletka[playerid][25] = CreatePlayerTextDraw(playerid,442.000000, 203.000000, "25");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][25], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][25], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][25], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][25], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][25], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][25], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][25], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][25], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][25], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][25], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][25], 1);

    TDRuletka[playerid][26] = CreatePlayerTextDraw(playerid,442.000000, 174.000000, "26");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][26], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][26], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][26], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][26], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][26], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][26], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][26], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][26], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][26], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][26], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][26], 1);

    TDRuletka[playerid][27] = CreatePlayerTextDraw(playerid,442.000000, 145.000000, "27");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][27], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][27], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][27], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][27], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][27], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][27], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][27], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][27], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][27], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][27], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][27], 1);

    TDRuletka[playerid][28] = CreatePlayerTextDraw(playerid,467.000000, 203.000000, "28");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][28], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][28], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][28], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][28], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][28], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][28], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][28], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][28], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][28], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][28], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][28], 1);

    TDRuletka[playerid][29] = CreatePlayerTextDraw(playerid,467.000000, 174.000000, "29");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][29], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][29], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][29], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][29], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][29], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][29], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][29], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][29], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][29], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][29], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][29], 1);

    TDRuletka[playerid][30] = CreatePlayerTextDraw(playerid,467.000000, 145.000000, "30");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][30], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][30], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][30], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][30], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][30], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][30], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][30], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][30], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][30], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][30], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][30], 1);

    TDRuletka[playerid][31] = CreatePlayerTextDraw(playerid,492.000000, 203.000000, "31");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][31], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][31], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][31], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][31], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][31], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][31], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][31], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][31], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][31], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][31], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][31], 1);

    TDRuletka[playerid][32] = CreatePlayerTextDraw(playerid,492.000000, 174.000000, "32");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][32], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][32], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][32], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][32], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][32], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][32], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][32], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][32], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][32], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][32], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][32], 1);

    TDRuletka[playerid][33] = CreatePlayerTextDraw(playerid,492.000000, 145.000000, "33");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][33], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][33], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][33], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][33], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][33], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][33], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][33], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][33], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][33], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][33], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][33], 1);

    TDRuletka[playerid][34] = CreatePlayerTextDraw(playerid,517.000000, 203.000000, "34");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][34], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][34], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][34], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][34], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][34], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][34], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][34], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][34], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][34], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][34], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][34], 1);

    TDRuletka[playerid][35] = CreatePlayerTextDraw(playerid,517.000000, 174.000000, "35");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][35], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][35], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][35], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][35], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][35], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][35], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][35], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][35], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][35], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][35], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][35], 1);

    TDRuletka[playerid][36] = CreatePlayerTextDraw(playerid,517.000000, 145.000000, "36");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][36], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][36], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][36], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][36], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][36], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][36], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][36], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][36], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][36], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][36], 10.000000, 17.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][36], 1);

    TDRuletka[playerid][37] = CreatePlayerTextDraw(playerid,555.000000, 203.000000, "3 to 1");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][37], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][37], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][37], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][37], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][37], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][37], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][37], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][37], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][37], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][37], 10.000000, 43.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][37], 1);

    TDRuletka[playerid][38] = CreatePlayerTextDraw(playerid,555.000000, 174.000000, "3 to 1");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][38], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][38], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][38], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][38], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][38], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][38], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][38], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][38], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][38], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][38], 10.000000, 43.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][38], 1);

    TDRuletka[playerid][39] = CreatePlayerTextDraw(playerid,555.000000, 145.000000, "3 to 1");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][39], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][39], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][39], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][39], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][39], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][39], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][39], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][39], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][39], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][39], 10.000000, 43.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][39], 1);

    TDRuletka[playerid][40] = CreatePlayerTextDraw(playerid,279.000000, 229.000000, "1st 12");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][40], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][40], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][40], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][40], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][40], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][40], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][40], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][40], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][40], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][40], 10.000000, 91.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][40], 1);

    TDRuletka[playerid][41] = CreatePlayerTextDraw(playerid,379.000000, 229.000000, "2nd 12");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][41], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][41], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][41], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][41], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][41], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][41], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][41], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][41], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][41], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][41], 10.000000, 91.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][41], 1);

    TDRuletka[playerid][42] = CreatePlayerTextDraw(playerid,479.000000, 229.000000, "3rd 12");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][42], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][42], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][42], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][42], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][42], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][42], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][42], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][42], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][42], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][42], 10.000000, 91.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][42], 1);

    TDRuletka[playerid][43] = CreatePlayerTextDraw(playerid,254.000000, 255.000000, "1to18");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][43], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][43], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][43], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][43], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][43], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][43], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][43], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][43], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][43], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][43], 10.000000, 42.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][43], 1);

    TDRuletka[playerid][44] = CreatePlayerTextDraw(playerid,304.000000, 255.000000, "EVEN");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][44], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][44], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][44], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][44], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][44], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][44], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][44], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][44], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][44], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][44], 10.000000, 41.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][44], 1);

    TDRuletka[playerid][45] = CreatePlayerTextDraw(playerid,355.000000, 255.000000, "RED");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][45], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][45], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][45], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][45], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][45], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][45], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][45], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][45], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][45], -16776961);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][45], 10.000000, 42.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][45], 1);

    TDRuletka[playerid][46] = CreatePlayerTextDraw(playerid,404.000000, 255.000000, "BLACK");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][46], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][46], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][46], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][46], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][46], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][46], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][46], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][46], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][46], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][46], 10.000000, 41.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][46], 1);

    TDRuletka[playerid][47] = CreatePlayerTextDraw(playerid,453.000000, 255.000000, "ODD");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][47], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][47], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][47], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][47], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][47], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][47], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][47], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][47], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][47], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][47], 10.000000, 38.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][47], 1);

    TDRuletka[playerid][48] = CreatePlayerTextDraw(playerid,502.000000, 255.000000, "19to36");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][48], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][48], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][48], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][48], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][48], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][48], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][48], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][48], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][48], 255);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][48], 10.000000, 46.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][48], 1);

    TDRuletka[playerid][50] = CreatePlayerTextDraw(playerid,558.000000, 227.000000, "-");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][50], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][50], 0x00000000);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][50], 5);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][50], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][50], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][50], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][50], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][50], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][50], 0);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][50], 20.000000, 21.000000);
    PlayerTextDrawSetPreviewModel(playerid, TDRuletka[playerid][50], 1859);
    PlayerTextDrawSetPreviewRot(playerid, TDRuletka[playerid][50], 90.000000, 180.000000, 90.000000, 1.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][50], 1);


    TDRuletka[playerid][52] = CreatePlayerTextDraw(playerid,532.000000, 227.000000, "-");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][52], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][52], 0x00000000);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][52], 5);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][52], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][52], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][52], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][52], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][52], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][52], 0);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][52], 20.000000, 21.000000);
    PlayerTextDrawSetPreviewModel(playerid, TDRuletka[playerid][52], 1860);
    PlayerTextDrawSetPreviewRot(playerid, TDRuletka[playerid][52], 90.000000, 180.000000, 90.000000, 1.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][52], 1);

    TDRuletka[playerid][53] = CreatePlayerTextDraw(playerid,210.000000, 142.000000, "-");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][53], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][53], 0x00000000);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][53], 5);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][53], 0.400000, 1.899999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][53], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][53], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][53], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][53], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][53], 0);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][53], 20.000000, 21.000000);
    PlayerTextDrawSetPreviewModel(playerid, TDRuletka[playerid][53], 1860);
    PlayerTextDrawSetPreviewRot(playerid, TDRuletka[playerid][53], 90.000000, 180.000000, 90.000000, 1.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][53], 1);

    TDRuletka[playerid][54] = CreatePlayerTextDraw(playerid,140.000000, 141.000000, "~n~");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][54], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][54], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][54], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][54], 0.500000, 15.100000);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][54], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][54], 0);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][54], 1);
    PlayerTextDrawSetShadow(playerid,TDRuletka[playerid][54], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][54], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][54], 100);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][54], 337.000000, -121.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][54], 0);

    TDRuletka[playerid][55] = CreatePlayerTextDraw(playerid,141.000000, 240.000000, "_");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][55], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][55], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][55], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][55], 0.400000, -0.199999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][55], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][55], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][55], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][55], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][55], -1);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][55], 0.000000, 58.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][55], 0);

    TDRuletka[playerid][57] = CreatePlayerTextDraw(playerid,141.000000, 181.000000, "_");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][57], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][57], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][57], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][57], 0.400000, -0.199999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][57], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][57], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][57], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][57], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][57], -1);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][57], 0.000000, 58.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][57], 0);

    TDRuletka[playerid][58] = CreatePlayerTextDraw(playerid,141.000000, 181.000000, "_");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][58], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][58], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][58], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][58], 0.400000, -0.199999);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][58], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][58], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][58], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][58], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][58], -1);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][58], 0.000000, 58.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][58], 0);

    TDRuletka[playerid][59] = CreatePlayerTextDraw(playerid,111.000000, 183.000000, "_");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][59], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][59], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][59], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][59], 0.400000, 6.000000);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][59], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][59], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][59], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][59], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][59], -1);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][59], 0.000000, -2.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][59], 0);

    TDRuletka[playerid][60] = CreatePlayerTextDraw(playerid,171.000000, 183.000000, "_");
    PlayerTextDrawAlignment(playerid,TDRuletka[playerid][60], 2);
    PlayerTextDrawBackgroundColour(playerid,TDRuletka[playerid][60], 255);
    PlayerTextDrawFont(playerid,TDRuletka[playerid][60], 1);
    PlayerTextDrawLetterSize(playerid,TDRuletka[playerid][60], 0.400000, 6.000000);
    PlayerTextDrawColour(playerid,TDRuletka[playerid][60], -1);
    PlayerTextDrawSetOutline(playerid,TDRuletka[playerid][60], 1);
    PlayerTextDrawSetProportional(playerid,TDRuletka[playerid][60], 1);
    PlayerTextDrawUseBox(playerid,TDRuletka[playerid][60], 1);
    PlayerTextDrawBoxColour(playerid,TDRuletka[playerid][60], -1);
    PlayerTextDrawTextSize(playerid,TDRuletka[playerid][60], 0.000000, -2.000000);
    PlayerTextDrawSetSelectable(playerid,TDRuletka[playerid][60], 0);
}

ptask RuletkaReSelect[500](playerid)
{
    if(Actived[playerid] == 1 && GetPVarInt(playerid, "RuletkaShowed") == 1 && GetPVarInt(playerid, "RuletaSpin") == 0)
    {
        SelectTextDraw(playerid, 0x9999BBBB);
    }
    return 1;
}
