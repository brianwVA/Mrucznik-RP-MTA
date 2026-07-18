//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                 system-obiekty                                                 //
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
// Data utworzenia: 02.04.2021
//Opis:
/*
	System obiekty
*/

//

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------

hook OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, "EditingHouse", -1);
}

hook OnPlayerSelectDynObj(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
    if(GetPVarInt(playerid, "DynamicObjects-select"))
    {
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID);
        if(!ObjectInfo[oid][o_UID]) {
            SetPVarInt(playerid, "DynamicObjects-select", 0);
            return 0;
        }
        if(ObjectInfo[oid][o_ownertype]==1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return noAccessMessage(playerid);
        SetPVarInt(playerid, "DynamicObjects-selected", objectid);
        _MruGracz(playerid, sprintf("OBJ-ID: %d", ObjectInfo[oid][o_UID]));
        EditDynamicObject(playerid, objectid);
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if(IsValidDynamicObject(GetPVarInt(playerid, "creating-object-id")) && GetPVarInt(playerid, "creating-object-id") > 0)
        DestroyDynamicObject(GetPVarInt(playerid, "creating-object-id"));
    return 1;
}

hook OnPlayerEditDynamicObj(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if(GetPVarInt(playerid, "creating-object"))
    {
        switch(response)
        {
            case EDIT_RESPONSE_UPDATE:
            {
                if(GetPVarInt(playerid, "creating-object-ownertype") == 2)
                {
                    if(GetPlayerVirtualWorld(playerid) == 0)
                    {
                        DestroyDynamicObject(objectid);
                        return 0;
                    }
                    new dom = GetPVarInt(playerid, "creating-object-owner");
                    #if defined MRP_LEGACY_HOUSES
                    if(GetDistanceBetweenPoints(x, y, z, Dom[dom][hInt_X], Dom[dom][hInt_Y], Dom[dom][hInt_Z]) >= 60)
                    #else
                    if(GetDistanceBetweenPoints(x, y, z, House[dom][h_exit_pos][0], House[dom][h_exit_pos][1], House[dom][h_exit_pos][2]) >= 60)
                    #endif
                    {
                        new Float:X, Float:Y, Float:Z, Float:rox, Float:roy, Float:roz;
                        GetDynamicObjectRot(objectid, rox, roy, roz);
                        GetDynamicObjectPos(objectid, X, Y, Z);
                        SendClientMessage(playerid, -1, "Obiekt jest za daleko od wejścia!");
                        SetDynamicObjectPos(objectid, X, Y, Z);
                        SetDynamicObjectRot(objectid, rox, roy, roz);
                    }
                }
            }
            case EDIT_RESPONSE_CANCEL:
            {
                sendTipMessage(playerid, "Przerwałeś tworzenie obiektu.");
                SetPVarInt(playerid, "creating-object", 0);
                SetPVarInt(playerid, "creating-object-ownertype", 0);
                SetPVarInt(playerid, "creating-object-owner", 0);
                SetPVarInt(playerid, "creating-object-id", 0);
                DestroyDynamicObject(objectid);
            }
            case EDIT_RESPONSE_FINAL:
            {
                if(GetPVarInt(playerid, "creating-object-ownertype") == 2)
                {
                    new dom = GetPVarInt(playerid, "creating-object-owner");
                    #if defined MRP_LEGACY_HOUSES
                    if(GetDistanceBetweenPoints(x, y, z, Dom[dom][hInt_X], Dom[dom][hInt_Y], Dom[dom][hInt_Z]) >= 60)
                    #else
                    if(GetDistanceBetweenPoints(x, y, z, House[dom][h_exit_pos][0], House[dom][h_exit_pos][1], House[dom][h_exit_pos][2]) >= 60)
                    #endif
                    {
                        SetPVarInt(playerid, "creating-object", 0);
                        SetPVarInt(playerid, "creating-object-ownertype", 0);
                        SetPVarInt(playerid, "creating-object-owner", 0);
                        SetPVarInt(playerid, "creating-object-id", 0);
                        DestroyDynamicObject(objectid);
                        return sendErrorMessage(playerid, "Byłeś za daleko od wejścia!");
                    }
                }
                new oid = Iter_Free(DynamicObjects), otype = GetPVarInt(playerid, "creating-object-ownertype"), owner = GetPVarInt(playerid, "creating-object-owner");
                if(oid == -1) return sendErrorMessage(playerid, "Brak wolnego miejsca na obiekt!");
                if(StworzObiekt(oid, objectid, x, y, z, rx, ry, rz, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), otype, owner))
                {
                    sendTipMessage(playerid, "Obiekt stworzony pomyślnie.");
                    if(otype == 1) SendCommandLogMessage(sprintf("CMD_Info: /mc użyte przez %s [%d]", GetNick(playerid), playerid));
                    SetPVarInt(playerid, "creating-object", 0);
                    SetPVarInt(playerid, "creating-object-ownertype", 0);
                    SetPVarInt(playerid, "creating-object-owner", 0);
                    SetPVarInt(playerid, "creating-object-id", 0);
                    SetDynamicObjectPos(objectid, x, y, z);
                    SetDynamicObjectRot(objectid, rx, ry, rz);
                } else {
					sendTipMessage(playerid, "Nie stworzyłem obiektu! Błąd! (max_objects)");
				}
            }
        }
    }
    else if(GetPVarInt(playerid, "DynamicObjects-select"))
    {
        switch(response)
        {
            case EDIT_RESPONSE_CANCEL:
            {
                new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID);
                if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
                SetDynamicObjectPos(objectid, ObjectInfo[oid][o_X], ObjectInfo[oid][o_Y], ObjectInfo[oid][o_Z]);
                SetDynamicObjectRot(objectid, ObjectInfo[oid][o_RX], ObjectInfo[oid][o_RY], ObjectInfo[oid][o_RZ]);
                SetPVarInt(playerid, "DynamicObjects-selected", 0);
                SetPVarInt(playerid, "DynamicObjects-select", 0);
            }
            case EDIT_RESPONSE_FINAL:
            {
                new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID);
                if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
                if(ObjectInfo[oid][o_ownertype]==1 && !Uprawnienia(playerid, ACCESS_MAPPER))
                    return noAccessMessage(playerid);
                else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
                    return noAccessMessage(playerid);
                if(!ObjectInfo[oid][o_deletable]) 
                {
                    SetDynamicObjectPos(objectid, ObjectInfo[oid][o_X], ObjectInfo[oid][o_Y], ObjectInfo[oid][o_Z]);
                    SetDynamicObjectRot(objectid, ObjectInfo[oid][o_RX], ObjectInfo[oid][o_RY], ObjectInfo[oid][o_RZ]);
                    return sendErrorMessage(playerid, "Pozycji tego obiektu nie można edytować");
                }
                SetDynamicObjectPos(objectid, x, y, z);
                SetDynamicObjectRot(objectid, rx, ry, rz);
                ObjectInfo[oid][o_X] = x;
                ObjectInfo[oid][o_Y] = y;
                ObjectInfo[oid][o_Z] = z;
                ObjectInfo[oid][o_RX] = rx;
                ObjectInfo[oid][o_RY] = ry;
                ObjectInfo[oid][o_RZ] = rz;
                new query[328];
                format(query, sizeof query, "UPDATE `mru_obiekty` SET `x`='%f', `y`='%f', `z`='%f', `rx`='%f', `ry`='%f', `rz`='%f' WHERE `UID` = '%d'", x, y, z, rx, ry, rz, ObjectInfo[oid][o_UID]);
                mysql_query(Database, query);
                SetPVarInt(playerid, "DynamicObjects-selected", 0);
                SetPVarInt(playerid, "DynamicObjects-select", 0);
                sendTipMessage(playerid, "Pozycja zaaktualizowana.");
            }
        }
    }
    return 1;
}
//end
