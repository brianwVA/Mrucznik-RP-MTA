#include <YSI_Coding\y_hooks>

// Jak gracz nie ma armora to string TDEditor_TD[playerid][4] można na LD_SPAC:white zmienić i ustawić kolor na 0x121212FF + [12] ukryć

// [5] [6] [7] [8] to główne progressy na których trzeba ustawiać x text size żeby pokazać ile % jest
// armor 100% = 38.0
// życie 100% = 39.0
// jedzenie 100% = 40.0
// picie 100% = 46.0

// [17] jak gracz ma broń bez ammo to można dać na 0x121212FF

// WAŻNE IKONKI BRONI
// samp ma zjebane działanie ikonek broni więc najprościej wziąć se jakiegoś moda na ikonki broni co ma weaponicons.txd i go załadować jako model
// potem tylko zmapować tablicą id broni na sprite z pliku


new PlayerText:TDEditor_TD[MAX_PLAYERS][24];
new PlayerText:BankUpdate_Text[MAX_PLAYERS];
new PlayerText:CashUpdate_Text[MAX_PLAYERS];
new PlayerText:ZoneText[MAX_PLAYERS];
new Text:Login_Screen[2];
new PlayerText:PlayerWantedLevel[MAX_PLAYERS];
new LoginScreenTimer[MAX_PLAYERS];

HUD_GlobalTextdrawLoad()
{

	Login_Screen[0] = TextDrawCreate(-1.000, -1.000, "mdl-2074:LoginScreen");
	TextDrawTextSize(Login_Screen[0], 641.000, 449.000);
	TextDrawAlignment(Login_Screen[0], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Login_Screen[0], -1);
	TextDrawSetShadow(Login_Screen[0], 0);
	TextDrawSetOutline(Login_Screen[0], 0);
	TextDrawBackgroundColour(Login_Screen[0], 255);
	TextDrawFont(Login_Screen[0], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Login_Screen[0], true);

	Login_Screen[1] = TextDrawCreate(285.000, 299.000, "mdl-2074:Button");
	TextDrawTextSize(Login_Screen[1], 74.000, 90.000);
	TextDrawAlignment(Login_Screen[1], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Login_Screen[1], -1);
	TextDrawSetShadow(Login_Screen[1], 0);
	TextDrawSetOutline(Login_Screen[1], 0);
	TextDrawBackgroundColour(Login_Screen[1], 255);
	TextDrawFont(Login_Screen[1], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Login_Screen[1], true);
	TextDrawSetSelectable(Login_Screen[1], true);
}

HUD_GlobalTextdrawDestroy()
{
	for(new i = 0; i < 2; i++)
	{
		TextDrawDestroy(Login_Screen[i]);
	}
}


HUD_ShowLoginScreen(playerid)
{
	for(new i = 0; i < 2; i++)
	{
		TextDrawShowForPlayer(playerid, Login_Screen[i]);
	}
	SelectTextDraw(playerid, 0xE5413CFF);
}

HUD_HideLoginScreen(playerid)
{
	for(new i = 0; i < 2; i++)
	{
		TextDrawHideForPlayer(playerid, Login_Screen[i]);
	}
	CancelSelectTextDraw(playerid);
	if(IsValidTimer(LoginScreenTimer[playerid])) KillTimer(LoginScreenTimer[playerid]);
}

HUD_Create(playerid)
{

    BankUpdate_Text[playerid] = CreatePlayerTextDraw(playerid, 591.000, 106.000, "0");
	PlayerTextDrawLetterSize(playerid, BankUpdate_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, BankUpdate_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, BankUpdate_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, BankUpdate_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, BankUpdate_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, BankUpdate_Text[playerid], 150);
	PlayerTextDrawFont(playerid, BankUpdate_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, BankUpdate_Text[playerid], true);

    CashUpdate_Text[playerid] = CreatePlayerTextDraw(playerid, 515.000, 106.000, "0");
	PlayerTextDrawLetterSize(playerid, CashUpdate_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, CashUpdate_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, CashUpdate_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, CashUpdate_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, CashUpdate_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, CashUpdate_Text[playerid], 150);
	PlayerTextDrawFont(playerid, CashUpdate_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, CashUpdate_Text[playerid], true);


	TDEditor_TD[playerid][0] = CreatePlayerTextDraw(playerid, 548.350769, 24.116680, "mdl-2075:gradient-armor"); // tło progress armor
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][0], 39.000000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][0], 0x888888FF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][0], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][1] = CreatePlayerTextDraw(playerid, 548.350769, 31.605541, "mdl-2075:gradient-health"); // tło progress hp
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][1], 39.000000, 6.550005);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][1], 0x888888FF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][1], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][2] = CreatePlayerTextDraw(playerid, 548.350769, 39.416530, "mdl-2075:gradient-food"); // tło progress jedzenie
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][2], 40.000000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][2], 0x888888FF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][2], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][3] = CreatePlayerTextDraw(playerid, 548.350769, 46.916416, "mdl-2075:gradient-drink"); // tło progress picie
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][3], 46.000000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][3], 0x888888FF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][3], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][4] = CreatePlayerTextDraw(playerid, 548.350769, 24.116680, "mdl-2075:gradient-armor"); // główny box armor
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][4], 19.500000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][4], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][4], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][5] = CreatePlayerTextDraw(playerid, 548.350769, 31.816642, "mdl-2075:gradient-health"); // główny box hp
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][5], 19.000000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][5], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][5], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][6] = CreatePlayerTextDraw(playerid, 548.350769, 39.416530, "mdl-2075:gradient-food"); // główny box jedzenie
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][6], 20.000000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][6], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][6], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][7] = CreatePlayerTextDraw(playerid, 548.350769, 46.916416, "mdl-2075:gradient-drink"); // główny box picie
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][7], 23.000000, 6.190011);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][7], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][7], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][8] = CreatePlayerTextDraw(playerid, 585.625305, 8.688855, "mdl-2075:gray-circle"); // border/tło preview model skina
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][8], 44.299934, 51.629974);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][8], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][8], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][9] = CreatePlayerTextDraw(playerid, 588.424316, 11.955533, "mdl-2075:gradient-circle"); // gradientowe tło preview model skina
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][9], 39.000000, 46.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][9], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][9], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][10] = CreatePlayerTextDraw(playerid, 573.625183, 16.705570, ""); // preview model skin
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][10], 67.000000, 76.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][10], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][10], 0x00000000);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][10], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, TDEditor_TD[playerid][10], 5);
	PlayerTextDrawSetPreviewRot(playerid, TDEditor_TD[playerid][10], -15.000000, 0.000000, -30.000000, 1.000000);

	TDEditor_TD[playerid][11] = CreatePlayerTextDraw(playerid, 549.862609, 32.988887, "mdl-2075:icons"); // ikonki zycie jedzenie picie
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][11], 4.000000, 19.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][11], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][11], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][12] = CreatePlayerTextDraw(playerid, 550.262512, 25.188875, "mdl-2075:armor-icon"); // ikonka armor osobna
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][12], 3.250000, 4.099980);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][12], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][12], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][13] = CreatePlayerTextDraw(playerid, 555.087707, 24.783348, "50"); // string ile armora
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][13], 0.100000, 0.500000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][13], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][13], -1);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][13], 0x00000000);

	TDEditor_TD[playerid][14] = CreatePlayerTextDraw(playerid, 555.087707, 32.183238, "50"); // string ile hp
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][14], 0.100000, 0.500000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][14], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][14], -1);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][14], 0x00000000);

	TDEditor_TD[playerid][15] = CreatePlayerTextDraw(playerid, 555.087707, 39.733123, "50"); // string ile jedzenia
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][15], 0.100000, 0.500000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][15], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][15], -1);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][15], 0x00000000);

	TDEditor_TD[playerid][16] = CreatePlayerTextDraw(playerid, 555.087707, 47.283008, "50"); // string ile picia
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][16], 0.100000, 0.500000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][16], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][16], -1);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][16], 0x00000000);

	TDEditor_TD[playerid][17] = CreatePlayerTextDraw(playerid, 497.350341, 63.944396, "LD_SPAC:white"); // sprite zakrywający ammo
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][17], 47.000000, 12.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][17], 0x121212BE);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][17], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][18] = CreatePlayerTextDraw(playerid, 495.339141, 21.310947, "mdl-2075:overlay"); // główny box duzy
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][18], 129.000000, 79.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][18], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][18], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][19] = CreatePlayerTextDraw(playerid, 504.339263, 21.910949, "mdl-2076:fist"); // sprite broni
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][19], 32.000000, 41.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][19], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][19], TEXT_DRAW_FONT_SPRITE_DRAW);

	TDEditor_TD[playerid][20] = CreatePlayerTextDraw(playerid, 618.437500, 57.588882, "John_Anakinovsky ~y~(0)"); // nick
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][20], 0.170624, 0.829999);
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][20], 295.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_TD[playerid][20], TEXT_DRAW_ALIGN_RIGHT);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][20], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][20], -1);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][20], 0x00000000);

	TDEditor_TD[playerid][21] = CreatePlayerTextDraw(playerid, 618.637451, 77.088691, "~g~~h~$~w~~h~00000000");
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][21], 0.200000, 1.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][21], 295.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_TD[playerid][21], TEXT_DRAW_ALIGN_RIGHT);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][21], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][21], 2);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][21], 0x00000000);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][21], TEXT_DRAW_FONT_3);
	PlayerTextDrawSetProportional(playerid, TDEditor_TD[playerid][21], false);

	TDEditor_TD[playerid][22] = CreatePlayerTextDraw(playerid, 618.637451, 86.588546, "~y~$~w~~h~00000000");
	PlayerTextDrawLetterSize(playerid, TDEditor_TD[playerid][22], 0.200000, 1.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][22], 295.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_TD[playerid][22], TEXT_DRAW_ALIGN_RIGHT);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][22], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][22], 2);
	PlayerTextDrawBackgroundColour(playerid, TDEditor_TD[playerid][22], 0x00000000);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][22], TEXT_DRAW_FONT_3);
	PlayerTextDrawSetProportional(playerid, TDEditor_TD[playerid][22], false);

	TDEditor_TD[playerid][23] = CreatePlayerTextDraw(playerid, 498.599914, 76.055549, "mdl-2075:logo");
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][23], 51.000000, 23.000000);
	PlayerTextDrawColour(playerid, TDEditor_TD[playerid][23], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid, TDEditor_TD[playerid][23], TEXT_DRAW_FONT_SPRITE_DRAW);

	ZoneText[playerid] = CreatePlayerTextDraw(playerid, 618.637451, 68.000000, "Strefa: ~y~pomaranczowa");
	PlayerTextDrawLetterSize(playerid, ZoneText[playerid], 0.160000, 0.800000);
	PlayerTextDrawAlignment(playerid, ZoneText[playerid], TEXT_DRAW_ALIGN_RIGHT);
	PlayerTextDrawColour(playerid, ZoneText[playerid], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, ZoneText[playerid], 1);
	PlayerTextDrawSetOutline(playerid, ZoneText[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, ZoneText[playerid], 0x00000000);
	PlayerTextDrawFont(playerid, ZoneText[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, ZoneText[playerid], true);


	PlayerWantedLevel[playerid] = CreatePlayerTextDraw(playerid, 8.500, 425.000, "mdl-2073:wl0");
	PlayerTextDrawTextSize(playerid, PlayerWantedLevel[playerid], 98.000, 10.000);
	PlayerTextDrawAlignment(playerid, PlayerWantedLevel[playerid], TEXT_DRAW_ALIGN_LEFT);
	PlayerTextDrawColour(playerid, PlayerWantedLevel[playerid], -1);
	PlayerTextDrawSetShadow(playerid, PlayerWantedLevel[playerid], 0);
	PlayerTextDrawSetOutline(playerid, PlayerWantedLevel[playerid], 0);
	PlayerTextDrawBackgroundColour(playerid, PlayerWantedLevel[playerid], 255);
	PlayerTextDrawFont(playerid, PlayerWantedLevel[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
	PlayerTextDrawSetProportional(playerid, PlayerWantedLevel[playerid], true);

	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][20], sprintf("%s ~y~(%d)", GetNickEx(playerid), playerid));
	PlayerTextDrawSetPreviewModel(playerid, TDEditor_TD[playerid][10], PlayerInfo[playerid][pSkin]);
}

HUD_UpdateZone(playerid, const zoneName[])
{
    new str[64];
    format(str, sizeof str, "Strefa: %s", zoneName);
    PlayerTextDrawSetString(playerid, ZoneText[playerid], str);
}

HUD_Show(playerid)
{
	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][20], sprintf("%s ~y~(%d)", GetNickEx(playerid), playerid));
	PlayerTextDrawSetPreviewModel(playerid, TDEditor_TD[playerid][10], PlayerInfo[playerid][pSkin]);
	for(new i = 0; i < 24; i++)
	{
		PlayerTextDrawShow(playerid, TDEditor_TD[playerid][i]);
	}
	PlayerTextDrawShow(playerid, ZoneText[playerid]);
    HUDShown[playerid] = 1;
	HUD_UpdateAll(playerid);
}

HUD_Destroy(playerid)
{
	for(new i = 0; i < 24; i++)
	{
		PlayerTextDrawDestroy(playerid, TDEditor_TD[playerid][i]);
	}
    PlayerTextDrawDestroy(playerid, BankUpdate_Text[playerid]);
	PlayerTextDrawDestroy(playerid, CashUpdate_Text[playerid]);
	PlayerTextDrawDestroy(playerid, PlayerWantedLevel[playerid]);
	PlayerTextDrawDestroy(playerid, ZoneText[playerid]);
    HUDShown[playerid] = 0;
}

HUD_Hide(playerid)
{
	for(new i = 0; i < 24; i++)
	{
		PlayerTextDrawHide(playerid, TDEditor_TD[playerid][i]);
	}
    PlayerTextDrawHide(playerid, BankUpdate_Text[playerid]);
	PlayerTextDrawHide(playerid, CashUpdate_Text[playerid]);
	PlayerTextDrawHide(playerid, PlayerWantedLevel[playerid]);
	PlayerTextDrawHide(playerid, ZoneText[playerid]);
    HUDShown[playerid] = 0;
}


HUD_WantedLevelUpdate(playerid, level)
{
	if(HUDShown[playerid] == 0) return;
	PlayerTextDrawSetString(playerid, PlayerWantedLevel[playerid], sprintf("mdl-2073:wl%d", level));
    PlayerTextDrawShow(playerid, PlayerWantedLevel[playerid]);
}

HUD_MoneyUpdate(playerid, oldmoney)
{
	if(HUDShown[playerid] == 0) return;
	if(kaska[playerid] < 0)
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][21], sprintf("~g~~h~$~rw~~h~%s", FormatNumber(kaska[playerid])));
	else
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][21], sprintf("~g~~h~$~w~~h~%s", FormatNumber(kaska[playerid])));

    PlayerTextDrawShow(playerid, TDEditor_TD[playerid][21]);

    if(kaska[playerid] != oldmoney)
    {
        if(kaska[playerid]-oldmoney < 0)
            PlayerTextDrawColour(playerid, CashUpdate_Text[playerid], 0xFF0000FF);
        else
            PlayerTextDrawColour(playerid, CashUpdate_Text[playerid], 0x00FF00FF);

        PlayerTextDrawSetString(playerid, CashUpdate_Text[playerid], sprintf("%s $%s", (kaska[playerid]-oldmoney > 0 ? "+" : "-"), FormatNumber(abs(kaska[playerid]-oldmoney))));
        PlayerTextDrawShow(playerid, CashUpdate_Text[playerid]);
        SetTimerEx("HUD_HideCashUpdate", 5000, false, "d", playerid);
    }
}

HUD_BankUpdate(playerid, oldmoney)
{
	if(HUDShown[playerid] == 0) return;
    if(PlayerInfo[playerid][pAccount] < 0)
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][22], sprintf("~y~$~r~~h~%s", FormatNumber(PlayerInfo[playerid][pAccount])));
	else
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][22], sprintf("~y~$~w~~h~%s", FormatNumber(PlayerInfo[playerid][pAccount])));

    PlayerTextDrawShow(playerid, TDEditor_TD[playerid][22]);

    if(PlayerInfo[playerid][pAccount] != oldmoney)
    {
        if(PlayerInfo[playerid][pAccount] -oldmoney < 0)
            PlayerTextDrawColour(playerid, BankUpdate_Text[playerid], 0xFF0000FF);
        else
            PlayerTextDrawColour(playerid, BankUpdate_Text[playerid], 0x00FF00FF);

        PlayerTextDrawSetString(playerid, BankUpdate_Text[playerid], sprintf("%s $%s", (PlayerInfo[playerid][pAccount]-oldmoney > 0 ? "+" : "-"), FormatNumber(abs(PlayerInfo[playerid][pAccount]-oldmoney))));
        PlayerTextDrawShow(playerid, BankUpdate_Text[playerid]);
        SetTimerEx("HUD_HideBankUpdate", 5000, false, "d", playerid);
    }
}


HUD_HealthArmorUpdate(playerid)
{
	if(HUDShown[playerid] == 0) return;
    new Float:health, Float:armour;
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
	/*if(armour <= 0)
	{
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][4], "LD_SPAC:white");
		PlayerTextDrawColor(playerid, TDEditor_TD[playerid][4], 0x121212FF);
		PlayerTextDrawHide(playerid, TDEditor_TD[playerid][12]);
	}
	else
	{
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][4], "mdl-2075:gradient-armor");
		PlayerTextDrawColor(playerid, TDEditor_TD[playerid][4], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, TDEditor_TD[playerid][12]);
	}*/

	if(armour < 0) armour = 0;
	if(armour > 100) armour = 100;
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][4], (armour / 100.0) * (38), 6.190011);
	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][13], sprintf("%d", floatround(armour)));
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][13]);
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][4]);

	if(health <= 0) health = 0;
	if(health > 100) health = 100;
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][5], (health / 100.0) * (39), 6.190011);
	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][14], sprintf("%d", floatround(health)));
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][14]);
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][5]);
	

}

HUD_UpdateWeapon(playerid, weaponid)
{
	if(HUDShown[playerid] == 0) return;
	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][19], sprintf("mdl-2076:%s", GetWeaponIcon(weaponid)));
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][19]);
	if(GetPlayerAmmo(playerid) <= 1)
	{
		PlayerTextDrawColour(playerid, TDEditor_TD[playerid][17], 0x121212FF);
		PlayerTextDrawShow(playerid, TDEditor_TD[playerid][17]);
	}
	else
	{
		PlayerTextDrawColour(playerid, TDEditor_TD[playerid][17], 0x121212BE);
		PlayerTextDrawShow(playerid, TDEditor_TD[playerid][17]);
	}
}

HUD_UpdateAll(playerid)
{
	if(gPlayerLogged[playerid] == 0) return;
	if(HUDShown[playerid] == 0) return;
	HUD_HealthArmorUpdate(playerid);
	HUD_BankUpdate(playerid, PlayerInfo[playerid][pAccount]);
	HUD_MoneyUpdate(playerid, kaska[playerid]);
	HUD_WantedLevelUpdate(playerid, PoziomPoszukiwania[playerid]);
}

GetWeaponIcon(weaponid)
{
	new string[32];
	switch (weaponid)
	{
		case 0: { format(string, sizeof(string), "fist");} // pięść
		case 1: { format(string, sizeof(string), "BRASSKNUCKLEicon");}
		case 2: { format(string, sizeof(string), "golfclubicon");}
		case 3: { format(string, sizeof(string), "nitestickicon");}
		case 4: { format(string, sizeof(string), "knifecuricon");}
		case 5: { format(string, sizeof(string), "baticon");}
		case 6: { format(string, sizeof(string), "shovelicon");}
		case 7: { format(string, sizeof(string), "poolcueicon");}
		case 8: { format(string, sizeof(string), "katanaicon");}
		case 9: { format(string, sizeof(string), "chainsawicon");}
		case 10: { format(string, sizeof(string), "gun_dildo1icon");} // dildo
		case 11: { format(string, sizeof(string), "gun_dildo2icon");} // dildo
		case 12: { format(string, sizeof(string), "gun_vibe1icon");} // wibrator
		case 13: { format(string, sizeof(string), "gun_vibe2icon");} // wibrator
		case 14: { format(string, sizeof(string), "floweraicon");} // kwiatek
		case 15: { format(string, sizeof(string), "gun_caneicon");} // laska
		case 16: { format(string, sizeof(string), "grenadeicon");}
		case 17: { format(string, sizeof(string), "TearGasicon");}
		case 18: { format(string, sizeof(string), "molotovicon");}
		case 22: { format(string, sizeof(string), "colt45icon");}
		case 23: { format(string, sizeof(string), "silencedicon");}
		case 24: { format(string, sizeof(string), "desert_eagleicon");}
		case 25: { format(string, sizeof(string), "chromegunicon");}
		case 26: { format(string, sizeof(string), "sawnofficon");}
		case 27: { format(string, sizeof(string), "shotgspaicon");}
		case 28: { format(string, sizeof(string), "micro_uziicon");}
		case 29: { format(string, sizeof(string), "mp5lngicon");}
		case 30: { format(string, sizeof(string), "ak47icon");}
		case 31: { format(string, sizeof(string), "M4icon");}
		case 32: { format(string, sizeof(string), "tec9icon");}
		case 33: { format(string, sizeof(string), "cuntgunicon");}
		case 34: { format(string, sizeof(string), "SNIPERicon");}
		case 35: { format(string, sizeof(string), "rocketlaicon");}
		case 36: { format(string, sizeof(string), "heatseekicon");}
		case 37: { format(string, sizeof(string), "flameicon");}
		case 38: { format(string, sizeof(string), "minigunicon");}
		case 39: { format(string, sizeof(string), "satchelicon");}
		case 40: { format(string, sizeof(string), "bombicon");}
		case 41: { format(string, sizeof(string), "SPRAYCANicon");}
		case 42: { format(string, sizeof(string), "fire_exicon");}
		case 43: { format(string, sizeof(string), "Cameraicon");}
		case 44: { format(string, sizeof(string), "nvgooglesicon");}
		case 45: { format(string, sizeof(string), "irgooglesicon");}
		case 46: { format(string, sizeof(string), "gun_paraIcon");}
		default: { format(string, sizeof(string), "fist");}
	}
	return string;
	}

forward HUD_HideCashUpdate(playerid);
public HUD_HideCashUpdate(playerid)
{
    PlayerTextDrawHide(playerid, CashUpdate_Text[playerid]);
}

forward HUD_HideBankUpdate(playerid);
public HUD_HideBankUpdate(playerid)
{
    PlayerTextDrawHide(playerid, BankUpdate_Text[playerid]);
}


hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Login_Screen[1] && gPlayerLogged[playerid] == 0)
	{
		if(IsValidTimer(LoginScreenTimer[playerid])) KillTimer(LoginScreenTimer[playerid]);
		SetTimerEx("OPCLogin", 100, 0, "ii", playerid, 1);
	}
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(IsValidTimer(LoginScreenTimer[playerid])) KillTimer(LoginScreenTimer[playerid]);
	return 1;
}

forward FixSelectTextDraw(playerid);
public FixSelectTextDraw(playerid) {
	SelectTextDraw(playerid, 0xE5413CFF);
	return 1;
}