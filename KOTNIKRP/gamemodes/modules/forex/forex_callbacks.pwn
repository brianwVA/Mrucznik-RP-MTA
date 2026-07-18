
#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerConnect(playerid)
{
	ForexPlayer[playerid][fType] = 0;
    ForexPlayer[playerid][fCourse] = 0;
    ForexPlayer[playerid][fAmount] = 0;
    ForexPlayer[playerid][fBuyid] = 0;
    return 1;
}