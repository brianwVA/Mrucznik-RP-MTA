#include <YSI_Coding\y_hooks>

new Text:Text_Global[8];
new Text:Login_Screen[2];
new PlayerText:Bank_Text[MAX_PLAYERS];
new PlayerText:BankUpdate_Text[MAX_PLAYERS];
new PlayerText:Cash_Text[MAX_PLAYERS];
new PlayerText:CashUpdate_Text[MAX_PLAYERS];
new PlayerText:Armor_Text[MAX_PLAYERS];
new PlayerText:Picie_Text[MAX_PLAYERS];
new PlayerText:Jedzenie_Text[MAX_PLAYERS];
new PlayerText:Health_Text[MAX_PLAYERS];
new PlayerText:PlayerWantedLevel[MAX_PLAYERS];
new LoginScreenTimer[MAX_PLAYERS];

HUD_GlobalTextdrawLoad()
{
	Text_Global[0] = TextDrawCreate(578.750, 51.500, "~n~");
	TextDrawLetterSize(Text_Global[0], 0.300, 2.697);
	TextDrawTextSize(Text_Global[0], 529.000, 65.500);
	TextDrawAlignment(Text_Global[0], TEXT_DRAW_ALIGN_CENTER);
	TextDrawColour(Text_Global[0], -1);
	TextDrawUseBox(Text_Global[0], true);
	TextDrawBoxColour(Text_Global[0], 255);
	TextDrawSetShadow(Text_Global[0], 1);
	TextDrawSetOutline(Text_Global[0], 1);
	TextDrawBackgroundColour(Text_Global[0], 150);
	TextDrawFont(Text_Global[0], TEXT_DRAW_FONT_1);
	TextDrawSetProportional(Text_Global[0], true);

	Text_Global[1] = TextDrawCreate(495.000, 77.000, "mdl-2072:HUD");
	TextDrawTextSize(Text_Global[1], 118.000, 112.000);
	TextDrawAlignment(Text_Global[1], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[1], -1);
	TextDrawSetShadow(Text_Global[1], 0);
	TextDrawSetOutline(Text_Global[1], 0);
	TextDrawBackgroundColour(Text_Global[1], 255);
	TextDrawFont(Text_Global[1], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[1], true);

	Text_Global[2] = TextDrawCreate(504.000, 107.000, "mdl-2072:Bank");
	TextDrawTextSize(Text_Global[2], 22.000, 22.000);
	TextDrawAlignment(Text_Global[2], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[2], -1);
	TextDrawSetShadow(Text_Global[2], 0);
	TextDrawSetOutline(Text_Global[2], 0);
	TextDrawBackgroundColour(Text_Global[2], 255);
	TextDrawFont(Text_Global[2], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[2], true);

	Text_Global[3] = TextDrawCreate(580.000, 107.000, "mdl-2072:Cash");
	TextDrawTextSize(Text_Global[3], 22.000, 22.000);
	TextDrawAlignment(Text_Global[3], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[3], -1);
	TextDrawSetShadow(Text_Global[3], 0);
	TextDrawSetOutline(Text_Global[3], 0);
	TextDrawBackgroundColour(Text_Global[3], 255);
	TextDrawFont(Text_Global[3], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[3], true);

	Text_Global[4] = TextDrawCreate(501.000, 76.000, "mdl-2072:Health");
	TextDrawTextSize(Text_Global[4], 29.000, 29.000);
	TextDrawAlignment(Text_Global[4], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[4], -1);
	TextDrawSetShadow(Text_Global[4], 0);
	TextDrawSetOutline(Text_Global[4], 0);
	TextDrawBackgroundColour(Text_Global[4], 255);
	TextDrawFont(Text_Global[4], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[4], true);

	Text_Global[5] = TextDrawCreate(577.000, 76.000, "mdl-2072:Armor");
	TextDrawTextSize(Text_Global[5], 29.000, 29.000);
	TextDrawAlignment(Text_Global[5], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[5], -1);
	TextDrawSetShadow(Text_Global[5], 0);
	TextDrawSetOutline(Text_Global[5], 0);
	TextDrawBackgroundColour(Text_Global[5], 255);
	TextDrawFont(Text_Global[5], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[5], true);

	Text_Global[6] = TextDrawCreate(555.000, 53.000, "HUD:radar_dateFood");
	TextDrawTextSize(Text_Global[6], 15.000, 15.000);
	TextDrawAlignment(Text_Global[6], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[6], -1);
	TextDrawSetShadow(Text_Global[6], 0);
	TextDrawSetOutline(Text_Global[6], 0);
	TextDrawBackgroundColour(Text_Global[6], 255);
	TextDrawFont(Text_Global[6], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[6], true);

	Text_Global[7] = TextDrawCreate(586.000, 53.000, "HUD:radar_dateDrink");
	TextDrawTextSize(Text_Global[7], 15.000, 15.000);
	TextDrawAlignment(Text_Global[7], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Text_Global[7], -1);
	TextDrawSetShadow(Text_Global[7], 0);
	TextDrawSetOutline(Text_Global[7], 0);
	TextDrawBackgroundColour(Text_Global[7], 255);
	TextDrawFont(Text_Global[7], TEXT_DRAW_FONT_SPRITE_DRAW);
	TextDrawSetProportional(Text_Global[7], true);

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
	for(new i = 0; i < 8; i++)
	{
		TextDrawDestroy(Text_Global[i]);
	}

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

HUD_Create(playerid) // + show
{
	Bank_Text[playerid] = CreatePlayerTextDraw(playerid, 591.000, 131.000, "$100.000.000");
	PlayerTextDrawLetterSize(playerid, Bank_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, Bank_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, Bank_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Bank_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, Bank_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, Bank_Text[playerid], 150);
	PlayerTextDrawFont(playerid, Bank_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, Bank_Text[playerid], true);

    BankUpdate_Text[playerid] = CreatePlayerTextDraw(playerid, 591.000, 146.000, "0");
	PlayerTextDrawLetterSize(playerid, BankUpdate_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, BankUpdate_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, BankUpdate_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, BankUpdate_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, BankUpdate_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, BankUpdate_Text[playerid], 150);
	PlayerTextDrawFont(playerid, BankUpdate_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, BankUpdate_Text[playerid], true);

	Cash_Text[playerid] = CreatePlayerTextDraw(playerid, 515.000, 131.000, "$100.000.000");
	PlayerTextDrawLetterSize(playerid, Cash_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, Cash_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, Cash_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Cash_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, Cash_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, Cash_Text[playerid], 150);
	PlayerTextDrawFont(playerid, Cash_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, Cash_Text[playerid], true);

    CashUpdate_Text[playerid] = CreatePlayerTextDraw(playerid, 515.000, 146.000, "0");
	PlayerTextDrawLetterSize(playerid, CashUpdate_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, CashUpdate_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, CashUpdate_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, CashUpdate_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, CashUpdate_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, CashUpdate_Text[playerid], 150);
	PlayerTextDrawFont(playerid, CashUpdate_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, CashUpdate_Text[playerid], true);

	Armor_Text[playerid] = CreatePlayerTextDraw(playerid, 591.000, 92.000, "100");
	PlayerTextDrawLetterSize(playerid, Armor_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, Armor_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, Armor_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Armor_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, Armor_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, Armor_Text[playerid], 150);
	PlayerTextDrawFont(playerid, Armor_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, Armor_Text[playerid], true);

	Picie_Text[playerid] = CreatePlayerTextDraw(playerid, 593.000, 63.000, "100");
	PlayerTextDrawLetterSize(playerid, Picie_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, Picie_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, Picie_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Picie_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, Picie_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, Picie_Text[playerid], 150);
	PlayerTextDrawFont(playerid, Picie_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, Picie_Text[playerid], true);

	Jedzenie_Text[playerid] = CreatePlayerTextDraw(playerid, 563.000, 63.000, "100");
	PlayerTextDrawLetterSize(playerid, Jedzenie_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, Jedzenie_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, Jedzenie_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Jedzenie_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, Jedzenie_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, Jedzenie_Text[playerid], 150);
	PlayerTextDrawFont(playerid, Jedzenie_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, Jedzenie_Text[playerid], true);

	Health_Text[playerid] = CreatePlayerTextDraw(playerid, 515.000, 92.000, "100");
	PlayerTextDrawLetterSize(playerid, Health_Text[playerid], 0.200, 1.000);
	PlayerTextDrawAlignment(playerid, Health_Text[playerid], TEXT_DRAW_ALIGN_CENTER);
	PlayerTextDrawColour(playerid, Health_Text[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Health_Text[playerid], 1);
	PlayerTextDrawSetOutline(playerid, Health_Text[playerid], 1);
	PlayerTextDrawBackgroundColour(playerid, Health_Text[playerid], 150);
	PlayerTextDrawFont(playerid, Health_Text[playerid], TEXT_DRAW_FONT_1);
	PlayerTextDrawSetProportional(playerid, Health_Text[playerid], true);

	PlayerWantedLevel[playerid] = CreatePlayerTextDraw(playerid, 8.500, 425.000, "mdl-2073:wl0");
	PlayerTextDrawTextSize(playerid, PlayerWantedLevel[playerid], 98.000, 10.000);
	PlayerTextDrawAlignment(playerid, PlayerWantedLevel[playerid], TEXT_DRAW_ALIGN_LEFT);
	PlayerTextDrawColour(playerid, PlayerWantedLevel[playerid], -1);
	PlayerTextDrawSetShadow(playerid, PlayerWantedLevel[playerid], 0);
	PlayerTextDrawSetOutline(playerid, PlayerWantedLevel[playerid], 0);
	PlayerTextDrawBackgroundColour(playerid, PlayerWantedLevel[playerid], 255);
	PlayerTextDrawFont(playerid, PlayerWantedLevel[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
	PlayerTextDrawSetProportional(playerid, PlayerWantedLevel[playerid], true);
}

HUD_Show(playerid)
{
	PlayerTextDrawShow(playerid, Bank_Text[playerid]);
	PlayerTextDrawShow(playerid, Cash_Text[playerid]);
	PlayerTextDrawShow(playerid, Armor_Text[playerid]);
	PlayerTextDrawShow(playerid, Picie_Text[playerid]);
	PlayerTextDrawShow(playerid, Jedzenie_Text[playerid]);
	PlayerTextDrawShow(playerid, Health_Text[playerid]);
	PlayerTextDrawShow(playerid, PlayerWantedLevel[playerid]);
	for(new i = 0; i < 8; i++)
	{
		TextDrawShowForPlayer(playerid, Text_Global[i]);
	}
    HUDShown[playerid] = 1;
}

HUD_Destroy(playerid)
{
	PlayerTextDrawDestroy(playerid, Bank_Text[playerid]);
	PlayerTextDrawDestroy(playerid, Cash_Text[playerid]);
    PlayerTextDrawDestroy(playerid, BankUpdate_Text[playerid]);
	PlayerTextDrawDestroy(playerid, CashUpdate_Text[playerid]);
	PlayerTextDrawDestroy(playerid, Armor_Text[playerid]);
	PlayerTextDrawDestroy(playerid, Picie_Text[playerid]);
	PlayerTextDrawDestroy(playerid, Jedzenie_Text[playerid]);
	PlayerTextDrawDestroy(playerid, Health_Text[playerid]);
	PlayerTextDrawDestroy(playerid, PlayerWantedLevel[playerid]);
	for(new i = 0; i < 8; i++)
	{
		TextDrawHideForPlayer(playerid, Text_Global[i]);
	}
    HUDShown[playerid] = 0;
}

HUD_Hide(playerid)
{
	PlayerTextDrawHide(playerid, Bank_Text[playerid]);
	PlayerTextDrawHide(playerid, Cash_Text[playerid]);
    PlayerTextDrawHide(playerid, BankUpdate_Text[playerid]);
	PlayerTextDrawHide(playerid, CashUpdate_Text[playerid]);
	PlayerTextDrawHide(playerid, Armor_Text[playerid]);
	PlayerTextDrawHide(playerid, Picie_Text[playerid]);
	PlayerTextDrawHide(playerid, Jedzenie_Text[playerid]);
	PlayerTextDrawHide(playerid, Health_Text[playerid]);
    PlayerTextDrawHide(playerid, PlayerWantedLevel[playerid]);
	for(new i = 0; i < 8; i++)
	{
		TextDrawHideForPlayer(playerid, Text_Global[i]);
	}
    HUDShown[playerid] = 0;
}


HUD_WantedLevelUpdate(playerid, level)
{
	PlayerTextDrawSetString(playerid, PlayerWantedLevel[playerid], sprintf("mdl-2073:wl%d", level));
    PlayerTextDrawShow(playerid, PlayerWantedLevel[playerid]);
}

HUD_MoneyUpdate(playerid, oldmoney)
{
    if(kaska[playerid] < 0)
		PlayerTextDrawColour(playerid, Cash_Text[playerid], 0xFF0000FF);
	else
		PlayerTextDrawColour(playerid, Cash_Text[playerid], -1);

    PlayerTextDrawSetString(playerid, Cash_Text[playerid], sprintf("$%s", FormatNumber(kaska[playerid])));
    PlayerTextDrawShow(playerid, Cash_Text[playerid]);

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
    if(PlayerInfo[playerid][pAccount] < 0)
		PlayerTextDrawColour(playerid, Bank_Text[playerid], 0xFF0000FF);
	else
		PlayerTextDrawColour(playerid, Bank_Text[playerid], -1);

    PlayerTextDrawSetString(playerid, Bank_Text[playerid], sprintf("$%s", FormatNumber(PlayerInfo[playerid][pAccount])));
    PlayerTextDrawShow(playerid, Bank_Text[playerid]);

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
    new Float:health, Float:armour;
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
    PlayerTextDrawSetString(playerid, Health_Text[playerid], sprintf("%d", floatround(health)));
    PlayerTextDrawSetString(playerid, Armor_Text[playerid], sprintf("%d", floatround(armour)));
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