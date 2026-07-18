//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    kask                                                   //
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
// Autor: Mrucznik
// Data utworzenia: 11.06.2019


//

//------------------<[ Implementacja: ]>-------------------
command_kask_Impl(playerid)
{
    if( !(GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == 2 || GetPlayerState(playerid) == 3))
    {
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Tej komendy możesz użyć tylko będąc w pojeździe");
        return 1;
    }
    
    if(IsABike(GetPlayerVehicleID(playerid)))
    {
        new nick[MAX_PLAYER_NAME + 1];
        new string[256];
        GetPlayerName(playerid, nick, sizeof(nick));
        if(kask[playerid] == 1)
        {
            format(string, sizeof(string), "* %s ściąga kask z głowy.", nick);
            ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
            RemovePlayerAttachedObject(playerid, 3);
            kask[playerid] = 0;
        }
        else if(kask[playerid] != 1)
        {
            format(string, sizeof(string), "* %s zakłada kask na głowę.", nick);
            ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
            SetPlayerAttachedObject(playerid,3 , 18645, 2, 0.07, 0.017, 0, 88, 75, 0);
            kask[playerid] = 1;
        }
    }
    else
    {
        SendClientMessage(playerid, COLOR_LIGHTBLUE,"Nie możesz założyć kasku!");
    }
    return 1;
}


//end