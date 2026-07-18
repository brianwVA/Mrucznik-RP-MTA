#include "nowe\Chronicles\Chronicles.pwn"
#include <YSI_Coding\y_hooks>
hook OnGameModeInit()
{
	print("Ładuje obiekty...");
	//Chronicles_OnGameModeInit();
	print("Obiekty załadowane");
}

hook OnPlayerConnect(playerid)
{
	//Chronicles_OnPlayerConnect(playerid);
}