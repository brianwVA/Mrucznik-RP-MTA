#include "./strefy/strefy.def"
#include "./strefy/strefy.hwn"
#include "./strefy/strefy_callbacks.pwn"

stock PlayerEnterArea(playerid, id)
{
    PlayerInfo[playerid][pCurrentArea] = sAreas[id][sA_ID];

    if(!gPlayerLogged[playerid]) return 0;
    switch(sAreas[id][sA_ID])
    {
        case AREA_GREEN:
        {
            if(!GetPVarInt(playerid, "green-area-notify"))
            {
                SendClientMessage(playerid, COLOR_GREEN, "Jestes w zielonej strefie biznesowej! Pamietaj w tej strefie stawiamy na normalne odgrywanie zasad Role Play!");
                SetPVarInt(playerid, "green-area-notify", 1);
            }
    
        }
    }
    HUD_UpdateZone(playerid, Area_GetName(id));
    return 1;
}

stock Area_GetName(id, bool:color=true)
{
    new string[32];
    switch(sAreas[id][sA_ID])
    {
        case AREA_GREEN:    format(string, sizeof(string), "%szielona", (color) ? "~g~" : "");
        default:            format(string, sizeof(string), "%spomaranczowa", (color) ? "~y~" : "");

    }
    return string;
}
