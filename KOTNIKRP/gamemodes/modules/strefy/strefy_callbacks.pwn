#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    for(new i = 0; i < sizeof(sAreas); i++)
    {
        sAreas[i][sA_gangzone] = GangZoneCreate(sAreas[i][sA_minx], sAreas[i][sA_miny], sAreas[i][sA_maxx], sAreas[i][sA_maxy]);
        sAreas[i][sA_area] = CreateDynamicRectangle(sAreas[i][sA_minx], sAreas[i][sA_miny], sAreas[i][sA_maxx], sAreas[i][sA_maxy]);
        Streamer_SetIntData(STREAMER_TYPE_AREA, sAreas[i][sA_area], E_STREAMER_EXTRA_ID, i+3030);
    }
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    for(new i = 0; i < sizeof(sAreas); i++)
    {
        GangZoneShowForPlayer(playerid, sAreas[i][sA_gangzone], sAreas[i][sA_color]);
    }
    return 1;
}

hook OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    new id = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
    if(id >= 3030)
    {
        id -= 3030;
        if(id < 0 || id > sizeof(sAreas)-1) return 0;
        if(sAreas[id][sA_area] != areaid) return 0;
        PlayerEnterArea(playerid, id);
    }
    return 1;
}

hook OnPlayerLeaveDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    Turf_OnPlayerLeaveDynamicArea(playerid, areaid);
    new id = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
    if(id >= 3030)
    {
        id -= 3030;
        if(id < 0 || id > sizeof(sAreas)-1) return 0;
        if(sAreas[id][sA_area] != areaid) return 0;
        PlayerInfo[playerid][pCurrentArea] = AREA_ORANGE;
    }
    return 1;
}