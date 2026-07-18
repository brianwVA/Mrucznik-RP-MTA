#if defined _mrp_mta_anticheat_included
	#endinput
#endif
#define _mrp_mta_anticheat_included

// Nex-AC sprawdza pakiety i zachowania charakterystyczne dla SA-MP.
// W wariancie MTA ochronę zapewnia natywny anti-cheat MTA.
stock EnableAntiCheat(code, enable)
{
	#pragma unused code
	#pragma unused enable
	return 1;
}

stock IsAntiCheatEnabled(code)
{
	#pragma unused code
	return 0;
}

stock EnableAntiCheatForPlayer(playerid, code, enable)
{
	#pragma unused playerid
	#pragma unused code
	#pragma unused enable
	return 1;
}

stock IsAntiCheatEnabledForPlayer(playerid, code)
{
	#pragma unused playerid
	#pragma unused code
	return 0;
}
