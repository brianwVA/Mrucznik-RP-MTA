#if defined _mrp_mta_anticheat_included
	#endinput
#endif
#define _mrp_mta_anticheat_included

// Nex-AC 1.9.63 targets SA-MP 0.3.x and performs a large synchronous scan
// from OnPlayerUpdate.  On MTA the native anti-cheat owns those detections.
// Keep this tiny API shim so the legacy /ac administration panel can still
// compile and clearly report all Nex-AC checks as disabled.
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
