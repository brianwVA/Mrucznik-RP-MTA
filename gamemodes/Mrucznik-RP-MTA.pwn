// MTA-specific compilation entry point.
//
// MTA implements GameText natively.  The fixes.inc SA:MP emulation creates
// global textdraws through INVALID_PLAYER_ID during OnGameModeInit, which is
// not a valid call in mta-amx and crashes the Linux server at startup.
#define FIX_GameText 0

// Native supplied by the MTA compatibility layer.  It replaces the SA-MP
// workaround which sent 100 empty chat messages whenever a player connected.
#define MRP_MTA_RUNTIME
native MRP_ClearChatBox(playerid);

#include "Mrucznik-RP.pwn"
