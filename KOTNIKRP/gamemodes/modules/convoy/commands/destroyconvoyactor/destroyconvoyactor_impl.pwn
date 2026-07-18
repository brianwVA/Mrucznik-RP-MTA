//-----------------------------------------------<< Source >>------------------------------------------------//
//                                             destroyconvoyactor                                            //
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
// Data utworzenia: 31.10.2019


//

//------------------<[ Implementacja: ]>-------------------
command_destroyconvoyactor_Impl(playerid, actor)
{
    if(PlayerInfo[playerid][pAdmin] < 1) 
    {
        noAccessMessage(playerid);
        return 1;
    }

    new actorid;
    if(actor == -1)
    {
        actorid = GetNearestConvoyActor(playerid, 5.0);
    }
    else
    {
        actorid = actor;
    }

    if(actorid == -1)
    {
        sendErrorMessage(playerid, "Brak konwojowego aktora w pobliżu.");
        return 1;
    }

    new error = DestroyConvoyActor(actorid);
    if(error == -1) {
        sendErrorMessage(playerid, "Nie udało się usunąć aktora");
        return 1;
    }
    SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Pomyślnie zniszczyłeś aktora o ID %d.", actorid));
    return 1;
}

//end