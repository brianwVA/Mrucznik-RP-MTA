//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   unmark                                                  //
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
// Autor: mrucznik
// Data utworzenia: 12.05.2020


//

//------------------<[ Implementacja: ]>-------------------
command_unmark_Impl(playerid, giveplayerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        UnmarkPotentialCheater(giveplayerid);
        SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Usunąłeś gracza %s z listy potencjalnych cziterów", GetNickEx(giveplayerid)));
        Log(adminLog, WARNING, "Admin %s usunął gracza %s z listy potencjalnych cziterów.", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
    } 
    else noAccessMessage(playerid);
    return 1;
}

//end