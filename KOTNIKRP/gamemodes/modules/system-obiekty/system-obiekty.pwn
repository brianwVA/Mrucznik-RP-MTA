//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Moduł: system-obiekty.pwn ]------------------------------------------//
//----------------------------------------[ Autor: renosk ]----------------------------------------//


new Iterator:DynamicObjects<max_objects>;

new forbidden[] ={955, 956, 1755, 1302, 1209, 1775, 1776, 1531, 1530, 1529, 1528, 1527, 1526, 1525, 1524, 1490, 11313, 18659, 18660, 18661, 18662, 18663, 18664, 18665, 18666, 18667};


UsunObiekt(objectid)
{
    new uid = ObjectInfo[objectid][o_UID], query[378], Cache:result;
    if(!uid) return 0;
    if(IsValidDynamicObject(ObjectInfo[objectid][o_Object])) 
        DestroyDynamicObject(ObjectInfo[objectid][o_Object]);
    format(query, sizeof query, "SELECT `objectid` FROM `mru_mmat` WHERE `objectid` = '%d'", uid);
    result = mysql_query(Database, query);
    if(cache_num_rows()) {
        format(query, sizeof query, "DELETE FROM `mru_mmat` WHERE `objectid` = '%d'", uid);
        mysql_query(Database, query);
    }
    cache_delete(result);
    format(query, sizeof query, "DELETE FROM `mru_obiekty` WHERE `UID` = '%d'", uid);
    if(mysql_query(Database, query)) return 1;
    return 0;
}

StworzObiekt(objectid, sampid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, vw, int, owner_type, owner_id, deletable = 1)
{
    if(owner_type == 2 && vw <= 7000) return 0;
    new query[728], model = Streamer_GetIntData(STREAMER_TYPE_OBJECT, sampid, E_STREAMER_MODEL_ID);
    ObjectInfo[objectid][o_Object] = sampid;
    ObjectInfo[objectid][o_Model] = model;
    ObjectInfo[objectid][o_X] = x;
    ObjectInfo[objectid][o_Y] = y;
    ObjectInfo[objectid][o_Z] = z;
    ObjectInfo[objectid][o_RX] = rx;
    ObjectInfo[objectid][o_RY] = ry;
    ObjectInfo[objectid][o_RZ] = rz;
    ObjectInfo[objectid][o_VW] = vw;
    ObjectInfo[objectid][o_INT] = int;
    ObjectInfo[objectid][o_ownertype] = owner_type;
    ObjectInfo[objectid][o_owner] = owner_id;
    ObjectInfo[objectid][o_deletable] = deletable;
    Streamer_SetIntData(STREAMER_TYPE_OBJECT, sampid, E_STREAMER_EXTRA_ID, objectid);
    Iter_Add(DynamicObjects, objectid);
    format(query, sizeof query, "INSERT INTO `mru_obiekty` (`model`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `vw`, `o_int`, `ownertype`, `owner`, `deletable`) VALUES ('%d', '%f', '%f', '%f', '%f','%f', '%f', '%d', '%d', '%d', '%d', '%d')",
        model,
        x,
        y,
        z,
        rx,
        ry,
        rz,
        vw,
        int,
        owner_type,
        owner_id,
        deletable);
    mysql_query(Database, query);
    ObjectInfo[objectid][o_UID] = cache_insert_id();
    return 1;
}

D_IsPlayerInHouse(playerid, admin = 1)
{
    //if(PlayerInfo[playerid][pDom] <= 0 && GetPVarInt(playerid, "EditingHouse") == 0) return 0;
    new dom = PlayerInfo[playerid][pDomWKJ];
    new dom2 = GetPVarInt(playerid, "EditingHouse");
    if(dom == -1 && dom2 == -1) return 0;
    #if defined MRP_LEGACY_HOUSES
    if((dom >= 0 && dom < MAX_DOM && Dom[dom][hUID_W] == PlayerInfo[playerid][pUID] && Dom[dom][hVW] == GetPlayerVirtualWorld(playerid) && Dom[dom][hInterior] == GetPlayerInterior(playerid))
    || (dom2 >= 0 && dom2 < MAX_DOM && GetPVarInt(playerid, "EditingHouse") == dom2 && PlayerInfo[playerid][pDomWKJ] == dom2 && Dom[dom2][hVW] == GetPlayerVirtualWorld(playerid) && Dom[dom2][hInterior] == GetPlayerInterior(playerid)))
    #else
    if((House[dom][h_Owner] == PlayerInfo[playerid][pUID] && House[dom][h_exit_vw] == GetPlayerVirtualWorld(playerid) && House[dom][h_exit_int] == GetPlayerInterior(playerid))
    || GetPVarInt(playerid, "EditingHouse") == dom2 && PlayerInfo[playerid][pDomWKJ] == dom2 && House[dom2][h_exit_vw] == GetPlayerVirtualWorld(playerid) && House[dom2][h_exit_int] == GetPlayerInterior(playerid))
    #endif
        return 1;
    if(PlayerInfo[playerid][pAdmin] >= 5000)
        return 1;
    return 0;
}

Object_SetMMAT(oid, obj, index, model, const txdname[], const texturename[], materialcolor)
{
    SetDynamicObjectMaterial(obj, index, model, txdname, texturename, materialcolor);

    new query[256];
    format(query, sizeof query, "SELECT `objectid` FROM `mru_mmat` WHERE `objectid` = '%d'", ObjectInfo[oid][o_UID]);
    
    new Cache:result = mysql_query(Database, query);
    new rows = cache_num_rows();
    cache_delete(result);

    if(rows)
    {
        format(query, sizeof query, 
            "UPDATE `mru_mmat` SET \
            `materialindex` = '%d', \
            `modelid` = '%d', \
            `txdname` = '%s', \
            `texturename` = '%s', \
            `materialcolor` = '%d' \
            WHERE `objectid` = '%d'",
            index, model, txdname, texturename, materialcolor, ObjectInfo[oid][o_UID]);
    }
    else
    {
        format(query, sizeof query, 
            "INSERT INTO `mru_mmat` (`objectid`, `materialindex`, `modelid`, `txdname`, `texturename`, `materialcolor`) \
            VALUES ('%d', '%d', '%d', '%s', '%s', '%d')",
            ObjectInfo[oid][o_UID], index, model, txdname, texturename, materialcolor);
    }

    mysql_tquery(Database, query);
    return 1;
}


//-----------------<[ Komendy: ]>-------------------

YCMD:mmat(playerid, params[], help)
{
    new index, model, txdname[32], texturename[32], materialcolor;
    if(sscanf(params, "dds[32]s[32]D(0)", index, model, txdname, texturename, materialcolor))
        return sendTipMessage(playerid, "Użyj: /mmat [index] [model] [txd name] [texture name] [material color = 0]");
    if(IsValidDynamicObject(GetPVarInt(playerid, "DynamicObjects-selected")))
    {
        new obj = GetPVarInt(playerid, "DynamicObjects-selected");
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID);
        if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
        SetPVarInt(playerid, "DynamicObjects-selected", 0);
        CancelEdit(playerid);
        if(ObjectInfo[oid][o_ownertype] == 1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return sendTipMessage(playerid, "Obiekt nie należy do Ciebie.");
        Object_SetMMAT(oid, obj, index, model, txdname, texturename, materialcolor);
    }
    else sendTipMessage(playerid, "Nie zaznaczyłeś obiektu.");
    return 1;
}

YCMD:pomocnik(playerid, params[], help)
{
    new giveplayerid;
    if(sscanf(params, "k<fix>", giveplayerid))
    {
        sendTipMessage(playerid, "Użyj: /pomocnik [playerid/CzęśćNicku]");
        return sendTipMessage(playerid, "Pozwala innemu graczowi na edycję obiektów w Twoim domu.");
    }
    if(giveplayerid == INVALID_PLAYER_ID) return sendTipMessage(playerid, "Ten gracz nie istnieje!");
    if(PlayerInfo[playerid][pDomWKJ] == -1) 
        return sendTipMessage(playerid, "Nie jesteś w żadnym domu.");
    #if defined MRP_LEGACY_HOUSES
    if(Dom[PlayerInfo[playerid][pDomWKJ]][hUID_W] != PlayerInfo[playerid][pUID])
    #else
    if(House[PlayerInfo[playerid][pDomWKJ]][h_Owner] != PlayerInfo[playerid][pUID])
    #endif
        return sendTipMessage(playerid, "Ten dom nie należy do Ciebie.");
    SetPVarInt(giveplayerid, "EditingHouse", PlayerInfo[playerid][pDomWKJ]);
    sendTipMessage(playerid, sprintf("Uprawniłeś %s do edycji Twojego domu", GetNick(giveplayerid)));
    sendTipMessage(giveplayerid, sprintf("%s uprawnił Cię do edycji swojego domu", GetNick(playerid)));
    return 1;
}

YCMD:mc(playerid, params[], help)
{
    new model, ownertyp;
    new Float:Pos[3], obj;
    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    if(sscanf(params, "dD(2)", model, ownertyp)) return sendTipMessage(playerid, "Użyj: /mc [model] [właściciel (1 - admin 2 - dom)]");
    if(model > 371 && model < 615)
        return sendTipMessage(playerid, "Nie możesz utworzyć obiektu o tym ID.");
    for(new i = 0; i < 26; i++)
		if(model == forbidden[i])
			return sendTipMessage(playerid, "Nie możesz utworzyć obiektu o tym ID.");
    if(ownertyp<1||ownertyp>2) return sendTipMessage(playerid, "Nieprawidłowy typ właściciela.");
    if(ownertyp == 1 && !Uprawnienia(playerid, ACCESS_MAPPER)) return noAccessMessage(playerid);
    if(ownertyp==2 && !D_IsPlayerInHouse(playerid))
        return sendTipMessage(playerid, "Nie jesteś w domu/dom nie należy do Ciebie.");
    switch(ownertyp)
    {
        case 1:
        {
            obj = CreateDynamicObject(model, Pos[0], Pos[1], Pos[2]+0.3, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
            SetPVarInt(playerid, "creating-object", 1);
            SetPVarInt(playerid, "creating-object-ownertype", 1);
            SetPVarInt(playerid, "creating-object-owner", PlayerInfo[playerid][pUID]);
            SetPVarInt(playerid, "creating-object-id", obj);
            EditDynamicObject(playerid, obj);
        }
        case 2:
        {
            obj = CreateDynamicObject(model, Pos[0], Pos[1], Pos[2]+0.3, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
            SetPVarInt(playerid, "creating-object", 1);
            SetPVarInt(playerid, "creating-object-ownertype", 2);
            SetPVarInt(playerid, "creating-object-owner", PlayerInfo[playerid][pDomWKJ]);
            SetPVarInt(playerid, "creating-object-id", obj);
            EditDynamicObject(playerid, obj);
        }
    }
    return 1;
}

YCMD:rx(playerid, params[], help)
{
    new Float:rx;
    if(sscanf(params, "f", rx))
        return sendTipMessage(playerid, "Użyj: /rx [pozycja rx]");
    if(IsValidDynamicObject(GetPVarInt(playerid, "DynamicObjects-selected")))
    {
        new obj = GetPVarInt(playerid, "DynamicObjects-selected");
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID);
        if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
        if(ObjectInfo[oid][o_Model] != Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID))
            return sendErrorMessage(playerid, "Ten obiekt nie istnieje w bazie danych!");
        if(ObjectInfo[oid][o_ownertype] == 1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return sendTipMessage(playerid, "Obiekt nie należy do Ciebie.");
        if(!ObjectInfo[oid][o_deletable]) return sendErrorMessage(playerid, "Pozycji tego obiektu nie można edytować");
        new Float:grx, Float:ry, Float:rz;
        GetDynamicObjectRot(obj, grx, ry, rz);
        SetDynamicObjectRot(obj, rx, ry, rz);
        ObjectInfo[oid][o_RX] = rx;
        CancelEdit(playerid);
        SetPVarInt(playerid, "DynamicObjects-selected", 0);
        new query[328];
        format(query, sizeof query, "UPDATE `mru_obiekty` SET `rx`='%f' WHERE `UID` = '%d'", rx, ObjectInfo[oid][o_UID]);
        mysql_query(Database, query);
        sendTipMessage(playerid, "Pozycja zaaktualizowana.");
    }
    else sendTipMessage(playerid, "Nie zaznaczyłeś obiektu.");
    return 1;
}

YCMD:ry(playerid, params[], help)
{
    new Float:ry;
    if(sscanf(params, "f", ry))
        return sendTipMessage(playerid, "Użyj: /ry [pozycja ry]");
    if(IsValidDynamicObject(GetPVarInt(playerid, "DynamicObjects-selected")))
    {
        new obj = GetPVarInt(playerid, "DynamicObjects-selected");
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID);
        if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
        if(ObjectInfo[oid][o_Model] != Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID))
            return sendErrorMessage(playerid, "Ten obiekt nie istnieje w bazie danych!");
        if(ObjectInfo[oid][o_ownertype] == 1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return sendTipMessage(playerid, "Obiekt nie należy do Ciebie.");
        if(!ObjectInfo[oid][o_deletable]) return sendErrorMessage(playerid, "Pozycji tego obiektu nie można edytować");
        new Float:rx, Float:gry, Float:rz;
        GetDynamicObjectRot(obj, rx, gry, rz);
        SetDynamicObjectRot(obj, rx, ry, rz);
        ObjectInfo[oid][o_RY] = ry;
        CancelEdit(playerid);
        SetPVarInt(playerid, "DynamicObjects-selected", 0);
        new query[328];
        format(query, sizeof query, "UPDATE `mru_obiekty` SET `ry`='%f' WHERE `UID` = '%d'", ry, ObjectInfo[oid][o_UID]);
        mysql_query(Database, query);
        sendTipMessage(playerid, "Pozycja zaaktualizowana.");
    }
    else sendTipMessage(playerid, "Nie zaznaczyłeś obiektu.");
    return 1;
}

YCMD:rz(playerid, params[], help)
{
    new Float:rz;
    if(sscanf(params, "f", rz))
        return sendTipMessage(playerid, "Użyj: /rz [pozycja rz]");
    if(IsValidDynamicObject(GetPVarInt(playerid, "DynamicObjects-selected")))
    {
        new obj = GetPVarInt(playerid, "DynamicObjects-selected");
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID);
        if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
        if(ObjectInfo[oid][o_Model] != Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID))
            return sendErrorMessage(playerid, "Ten obiekt nie istnieje w bazie danych!");
        if(ObjectInfo[oid][o_ownertype] == 1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return sendTipMessage(playerid, "Obiekt nie należy do Ciebie.");
        if(!ObjectInfo[oid][o_deletable]) return sendErrorMessage(playerid, "Pozycji tego obiektu nie można edytować");
        new Float:rx, Float:ry, Float:grz;
        GetDynamicObjectRot(obj, rx, ry, grz);
        SetDynamicObjectRot(obj, rx, ry, rz);
        ObjectInfo[oid][o_RZ] = rz;
        CancelEdit(playerid);
        SetPVarInt(playerid, "DynamicObjects-selected", 0);
        new query[328];
        format(query, sizeof query, "UPDATE `mru_obiekty` SET `rz`='%f' WHERE `UID` = '%d'", rz, ObjectInfo[oid][o_UID]);
        mysql_query(Database, query);
        sendTipMessage(playerid, "Pozycja zaaktualizowana.");
    }
    else sendTipMessage(playerid, "Nie zaznaczyłeś obiektu.");
    return 1;
}

YCMD:mcopy(playerid, params[], help)
{
    if(IsValidDynamicObject(GetPVarInt(playerid, "DynamicObjects-selected")))
    {
        new obj = GetPVarInt(playerid, "DynamicObjects-selected");
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID);
        new new_id = Iter_Free(DynamicObjects);
        if(new_id == -1)
            return sendErrorMessage(playerid, "Brak wolnego miejsca na obiekt!");
        if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
        if(ObjectInfo[oid][o_Model] != Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID))
            return sendErrorMessage(playerid, "Ten obiekt nie istnieje w bazie danych!");
        if(ObjectInfo[oid][o_ownertype] == 1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return sendTipMessage(playerid, "Obiekt nie należy do Ciebie.");
        new Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz;
        GetDynamicObjectPos(obj, x, y, z);
        GetDynamicObjectRot(obj, rx, ry, rz);
        new new_obj = CreateDynamicObject(ObjectInfo[oid][o_Model], x, y, z, rx, ry, rz, ObjectInfo[oid][o_VW], ObjectInfo[oid][o_INT]);
        if(!StworzObiekt(new_id, new_obj, x, y, z, rx, ry, rz, ObjectInfo[oid][o_VW], ObjectInfo[oid][o_INT], ObjectInfo[oid][o_ownertype], ObjectInfo[oid][o_owner]))
            return sendTipMessage(playerid, "Nie stworzyłem obiektu! Błąd! (max_objects)");
        EditDynamicObject(playerid, new_obj);
        SetPVarInt(playerid, "DynamicObjects-selected", new_obj);
        sendTipMessage(playerid, "Pomyślnie skopiowano obiekt.");
    }
    else sendTipMessage(playerid, "Nie zaznaczyłeś obiektu.");
    return 1;
}

YCMD:mdel(playerid, params[], help)
{
    if(IsValidDynamicObject(GetPVarInt(playerid, "DynamicObjects-selected")))
    {
        new obj = GetPVarInt(playerid, "DynamicObjects-selected");
        new oid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_EXTRA_ID);
        if(!ObjectInfo[oid][o_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak.");
        if(ObjectInfo[oid][o_Model] != Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID))
            return sendErrorMessage(playerid, "Ten obiekt nie istnieje w bazie danych!");
        if(ObjectInfo[oid][o_ownertype] == 1 && !Uprawnienia(playerid, ACCESS_MAPPER))
            return noAccessMessage(playerid);
        else if(ObjectInfo[oid][o_ownertype] == 2 && !D_IsPlayerInHouse(playerid))
            return sendTipMessage(playerid, "Obiekt nie należy do Ciebie.");
        SetPVarInt(playerid, "DynamicObjects-selected", 0);
        CancelEdit(playerid);
        if(!ObjectInfo[oid][o_deletable]) return sendErrorMessage(playerid, "Tego obiektu nie można usunąć");
        if(!UsunObiekt(oid))
            return sendTipMessage(playerid, "Nie można było znaleźć UID obiektu");
        if(ObjectInfo[oid][o_ownertype]==1)
            SendCommandLogMessage(sprintf("CMD_Info: /mdel użyte przez %s [%d]", GetNick(playerid), playerid));
        DestroyDynamicObject(obj);
        ObjectInfo[oid][o_UID] = -1;
        ObjectInfo[oid][o_Model] = 0;
        Iter_Remove(DynamicObjects, oid);
    }
    else sendTipMessage(playerid, "Nie zaznaczyłeś obiektu.");
    return 1;
}

YCMD:msel(playerid, params[], help)
{
    if(!Uprawnienia(playerid, ACCESS_MAPPER) && !D_IsPlayerInHouse(playerid))
        return sendTipMessage(playerid, "Nie możesz użyć tej komendy w tym miejscu.");
    SelectObject(playerid);
    SetPVarInt(playerid, "DynamicObjects-select", 1);
    return 1;
}

//-----------------<[ MySQL: ]>-------------------

LoadMMat()
{
    new ilosctekstur, objectid, index, model, txdname[32], texturename[32], materialcolor, Cache:result; 
    result = mysql_query(Database, "SELECT * FROM `mru_mmat`");

    for(new i = 0; i < cache_num_rows(); i++)
    {
        cache_get_value_index_int(i, 0,         objectid);
        cache_get_value_index_int(i, 1,         index);
        cache_get_value_index_int(i, 2,         model);
        cache_get_value_index(i, 3,         txdname);
        cache_get_value_index(i, 4,         texturename);
        cache_get_value_index_int(i, 5,         materialcolor);

        foreach(new x : DynamicObjects)
        {
            if(ObjectInfo[x][o_UID] == objectid) {
                SetDynamicObjectMaterial(ObjectInfo[x][o_Object], index, model, txdname, texturename, materialcolor);
                break;
            }
        }
        ilosctekstur++;
    }
    cache_delete(result);
    printf("[LOAD] Załadowano tekstur: %d", ilosctekstur);
    return 1;
}

LoadObjects()
{
    new iloscobiektow, model, Float:Pos[6], int, vw, otype, oowner, object, uid1, Cache:result;
    result = mysql_query(Database, "SELECT * FROM `mru_obiekty`");

    for(new i = 0; i < cache_num_rows(); i++)
    {
        object = Iter_Free(DynamicObjects);
        if(object == -1) return 0;
        cache_get_value_index_int(i, 0,         uid1);
        cache_get_value_index_int(i, 1,         model);
        cache_get_value_index_float(i, 2,         Pos[0]);
        cache_get_value_index_float(i, 3,         Pos[1]);
        cache_get_value_index_float(i, 4,         Pos[2]);
        cache_get_value_index_float(i, 5,         Pos[3]);
        cache_get_value_index_float(i, 6,         Pos[4]);
        cache_get_value_index_float(i, 7,         Pos[5]);
        cache_get_value_index_int(i, 8,         vw);
        cache_get_value_index_int(i, 9,         int);
        cache_get_value_index_int(i, 10,         otype);
        cache_get_value_index_int(i, 11,         oowner);
        cache_get_value_index_int(i, 12,         ObjectInfo[object][o_deletable]);
        new lol = CreateDynamicObject(model, Pos[0],Pos[1],Pos[2],Pos[3],Pos[4],Pos[5],vw,int);
        ObjectInfo[object][o_Object] = lol;
        ObjectInfo[object][o_UID] = uid1;
        ObjectInfo[object][o_Model] = model;
        ObjectInfo[object][o_X] = Pos[0];
        ObjectInfo[object][o_Y] = Pos[1];
        ObjectInfo[object][o_Z] = Pos[2];
        ObjectInfo[object][o_RX] = Pos[3];
        ObjectInfo[object][o_RY] = Pos[4];
        ObjectInfo[object][o_RZ] = Pos[5];
        ObjectInfo[object][o_VW] = vw;
        ObjectInfo[object][o_INT] = int;
        ObjectInfo[object][o_ownertype] = otype;
        ObjectInfo[object][o_owner] = oowner;
        Streamer_SetIntData(STREAMER_TYPE_OBJECT, lol, E_STREAMER_EXTRA_ID, object);
        Iter_Add(DynamicObjects, object);
        iloscobiektow++;
    }
    cache_delete(result);
    printf("[LOAD] Załadowano obiektów: %d", iloscobiektow);
    return 1;
}
