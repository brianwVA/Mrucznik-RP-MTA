//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  fracgps                                                  //
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
// Autor: renosk
// Data utworzenia: 28.06.2021


//

//------------------<[ Implementacja: ]>-------------------
command_fracgps_Impl(playerid)
{
    if(OnDuty[playerid] <= 0) return sendErrorMessage(playerid, "Nie jesteś na służbie grupy, która ma uprawnienia do gpsu frakcyjnego!");
    new frac = GetPlayerGroupUID(playerid, OnDuty[playerid]-1);
    if(CheckBW(playerid))
        return sendErrorMessage(playerid, "Nie możesz teraz użyć tej komendy!");
    if(TurnedGPS[playerid] == false)
    {
        //włącz gps
        if(GPSTurned[frac] == true)
            return sendErrorMessage(playerid, "GPS w tej frakcji jest już zajęty!");
        if(GetPVarInt(playerid, "gps-cooldown") > gettime())
            return sendTipMessage(playerid, "Odczekaj 30 sekund.");
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        SendRadioMessage(frac, GroupInfo[frac][g_Color], sprintf("%s uruchomił GPS grupy. Lokalizacja została oznaczona na mapie ikoną w kolorze grupy.", GetNick(playerid)));
        foreach(new i : Player)
        {
            if(IsPlayerInGroup(i, frac))
                GPSIcon[i] = CreateDynamicMapIcon(x, y, z, GPS_MAPICON, GroupInfo[frac][g_Color], -1, -1, i, -1.0, MAPICON_GLOBAL);
        }
        SetPVarInt(playerid, "gps-cooldown", gettime()+30);
        GPSTurned[frac] = true;
        TurnedGPS[playerid] = true;
    }
    else
    {
        //wyłącz gps
        if(GPSTurned[frac] == false)
            return sendErrorMessage(playerid, "GPS w tej frakcji nie jest włączony!");
        SendRadioMessage(frac, GroupInfo[frac][g_Color], sprintf("%s wyłączył GPS grupy.", GetNick(playerid)));
        foreach(new i : Player)
        {
            if(IsPlayerInGroup(i, frac))
                DestroyDynamicMapIcon(GPSIcon[i]);
        }
        GPSTurned[frac] = false;
        TurnedGPS[playerid] = false; 
    }
    return 1;
}

//end