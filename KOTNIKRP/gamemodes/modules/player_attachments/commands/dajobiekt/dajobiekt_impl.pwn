//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 dajobiekt                                                 //
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
// Data utworzenia: 21.08.2019


//

//------------------<[ Implementacja: ]>-------------------
command_dajobiekt_Impl(playerid, giveplayerid, bone, model, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, Float:sx, Float:sy, Float:sz, materialcolor1, materialcolor2)
{
    if(PlayerInfo[playerid][pAdmin] < 1000)
    {
        sendErrorMessage(playerid, "Nie jesteś uprawniony!");
        return 1;
    }

    if(GetFreeAttachedObjectSlot(giveplayerid) == INVALID_ATTACHED_OBJECT_INDEX)
    {
        sendErrorMessage(playerid, "Ten gracz ma za dużo przyczepionych obiektów!");
        return 1;
    }

    new index = AttachPlayerItem(giveplayerid, model, bone, x,y,z ,rx,ry,rz, sx,sy,sz, materialcolor1, materialcolor2);
    EditAttachedObject(giveplayerid, index);
    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("Otrzymałeś przyczepialny obiekt od admina %s", GetNickEx(playerid)));

    Log(adminLog, WARNING, "%s dał %s przyczepialny obiekt %d",
        GetPlayerLogName(playerid),
        GetPlayerLogName(giveplayerid),
        model
    );
    return 1;
}

//end