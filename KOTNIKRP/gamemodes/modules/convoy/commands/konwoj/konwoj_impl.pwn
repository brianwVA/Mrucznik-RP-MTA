//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   konwoj                                                  //
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
// Data utworzenia: 20.10.2019


//

//------------------<[ Implementacja: ]>-------------------
command_konwoj_Impl(playerid)
{
    new hour, minute, second;
    gettime(hour, minute, second);

    if(!IsPlayerInSecuriCar(playerid))
    {
        sendErrorMessage(playerid, "Musisz być w pojeździe konwojowym (securicar) aby rozpocząć konwój.");
        return 1;
    }

    if(PlayerInfo[playerid][pAdmin] < 1) 
    {
        if(!IsAConvoyTeamLeader(playerid))
        {
            sendErrorMessage(playerid, "Nie masz wystarczających uprawnień aby zorganizować konwój.");
            return 1;
        }

        if(hour < 15 || hour > 22)
        {
            sendErrorMessage(playerid, "Konwój można wystartować tylko od godziny 15:00 do 23:00.");
            return 1;
        }

        if(convoyDelayed)
        {
            sendErrorMessage(playerid, "Następny konwój można wystartować dopiero po 3 godzinach od ukończenia ostatniego.");
            return 1;
        }

        if(kaska[playerid] < CONVOY_PRICE)
        {
            sendErrorMessage(playerid, "Zorganizowanie konwoju kosztuje "#CONVOY_PRICE"$ a Ty tyle nie masz.");
            return 1;
        }
    }

    if(ConvoyStarted)
    {
        SendClientMessage(playerid, COLOR_WHITE, "Konwój stop");
        StopConvoy(CONVOY_STOP_ADMIN);
        return 1;
    }

    StartConvoy(playerid, GetPlayerVehicleID(playerid));
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wystartowałeś konwój. Po dojechaniu do celu otrzymasz nagrodę.");
    ZabierzKaseDone(playerid, CONVOY_PRICE);

    Log(adminLog, WARNING, "Admin %s wystartował konwój", 
        GetPlayerLogName(playerid)
    );
    return 1;
}

//end