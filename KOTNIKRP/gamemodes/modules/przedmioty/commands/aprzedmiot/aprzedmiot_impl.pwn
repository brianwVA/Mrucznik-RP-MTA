//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 aprzedmiot                                                //
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
// Data utworzenia: 12.06.2021


//

//------------------<[ Implementacja: ]>-------------------
command_aprzedmiot_Impl(playerid, opt1[64], opt2[64])
{
    switch(YHash(opt1))
    {
        case _H<load>:
        {
            if(PlayerInfo[playerid][pAdmin] < 2000 && !IsAScripter(playerid))
                return noAccessMessage(playerid);
            new uid, id;
            if(sscanf(opt2, "d", uid))
                return sendTipMessage(playerid, "Użyj: /aprzedmiot load [UID]");
            id = Memory_IsItemLoaded(uid);
            if(id != -1)
                return sendErrorMessage(playerid, sprintf("Ten przedmiot jest już załadowany, jego id to: %d", id));
            LoadItem(uid, playerid);
        }
        case _H<stworz>:
        {
            if(PlayerInfo[playerid][pAdmin] < 4000 && !IsAScripter(playerid) && !Uprawnienia(playerid, ACCESS_EDITCAR))
                return noAccessMessage(playerid);
            new name[32], type, value1, value2, owner, quant, secretValue, Cache:result;
            if(sscanf(opt2, "s[32]dddddd", name, type, value1, value2, owner, quant, secretValue)) {
                SendClientMessage(playerid, COLOR_GRAD4, "»» Użyj: /aprzedmiot stworz [nazwa (do 32 znaków)] [typ przedmiotu (/ap typy)] [value1] [value2] [UID gracza] [ilość] [secretValue]");
                SendClientMessage(playerid, COLOR_GRAD4, "»» UID gracza możesz pobrać poprzez komendę /check [id] (jeżeli jest online)");
                return 1;
            }
            strreplace(name, "_", " ");
            new giveplayerid = GetPlayerIDFromUID(owner); //pobierz ID gracza jeżeli jest online
            if(!MruMySQL_DoesAccountExistByUID(owner)) //sprawdza czy gracz o podanym UID istnieje
                return sendErrorMessage(playerid, "Użytkownik o podanym UID nie istnieje!");
            if(type < 0 || type > sizeof(ItemTypes)-1) //sprawdza czy dany typ przedmiotu jest prawidłowy
                return sendErrorMessage(playerid, "Zły typ przedmiotu! (/ap typy)");
            if(quant > 100 && type != ITEM_TYPE_MATS) //jeżeli ilość przekracza 100
                return sendErrorMessage(playerid, "Za duża ilość! (max: 100, gracz i tak więcej nie uniesie)");
            if(type == ITEM_TYPE_MATS) 
                secretValue = ITEM_NOT_COUNT;
            if(giveplayerid != INVALID_PLAYER_ID && IsPlayerConnected(giveplayerid) && secretValue != ITEM_NOT_COUNT) //jeżeli gracz nie pomieści tylu przedmiotów (tylko w przypadku gdy jest online)
            {
                if(Item_Count(giveplayerid)+quant > GetPlayerItemLimit(playerid))
                    return sendErrorMessage(playerid, sprintf("Ten gracz nie pomieści tylu przedmiotów! (%d/%d)", Item_Count(giveplayerid), GetPlayerItemLimit(giveplayerid)));
            }
            if(type == ITEM_TYPE_PHONE || type == ITEM_TYPE_MATS) //sprawdza czy dany gracz posiada już telefon lub matsy
            {
                result = mysql_query_format("SELECT `UID` FROM `mru_items` WHERE `owner_type` = '%d' AND `owner` = '%d' AND `item_type` = '%d'", ITEM_OWNER_TYPE_PLAYER, owner, type);
                new num = cache_num_rows();
                cache_delete(result);
                if(num > 0)
                    return sendErrorMessage(playerid, "Ten gracz posiada już telefon lub matsy!");
            }
            new id = Item_Add(name, ITEM_OWNER_TYPE_PLAYER, owner, type, value1, value2, true, giveplayerid, quant, secretValue);
            if(id == -1 || Item[id][i_UID] < 1) //jeżeli przedmiot nie mógł zostać stworzony z powodu błędu MySQL lub przekroczenia limitu przedmiotów (nigdy nie powinno się wydarzyć)
                return sendErrorMessage(playerid, "Przedmiot nie mógł zostać stworzony z powodu błędu MySQL lub braku wolnego slotu (tą okoliczność zgłoś do xSeLeCTx lub spróbuj ponownie)");
            va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Stworzyłeś przedmiot o ID: %d [UID: %d]", id, Item[id][i_UID]);
            if(IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
                va_SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "* Administrator %s dał Ci przedmiot %s x%d", GetNickEx(playerid), name, quant);
            Log(itemLog, WARNING, "%s tworzy nowy przedmiot %s dla gracza o UID %d", GetPlayerLogName(playerid), GetItemLogName(id), owner);
            ABroadCast(COLOR_LIGHTRED, sprintf("AdmCMD: %s stworzył nowy przedmiot o nazwie %s dla gracza o UID %d", GetNickEx(playerid), name, owner), 4000);
            
        }
        case _H<usun>:
        {
            if(PlayerInfo[playerid][pAdmin] < 1) return noAccessMessage(playerid);
            new itemid, quant;
            if(sscanf(opt2, "dd", itemid, quant))
                return sendTipMessage(playerid, "Użyj: /aprzedmiot usun [id] [ilość (0 = wszystko)]");
            if(!Iter_Contains(Items, itemid) || Item[itemid][i_UID] < 1)
                return sendErrorMessage(playerid, "Przedmiot o podanym ID nie istnieje!");
            if(Item[itemid][i_Quantity] < quant || quant <= 0)
                quant = Item[itemid][i_Quantity];
            Log(itemLog, WARNING, "%s usunął przedmiot %s x%d", GetPlayerLogName(playerid), GetItemLogName(itemid), quant);
            va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Usunąłeś przedmiot o ID: %d x%d", itemid, quant);
            Item_Delete(itemid, true, quant);
        }
        case _H<usun_uid>:
        {
            if(PlayerInfo[playerid][pAdmin] < 1) return noAccessMessage(playerid);
            new uid, quant;
            if(sscanf(opt2, "dd", uid, quant))
                return sendTipMessage(playerid, "Użyj: /aprzedmiot usun_uid [uid] [ilość (0 = wszystko)]");
            new current_quant = 0, Cache:result, query[128], bool:exist = false;
            format(query, sizeof(query), "SELECT `quantity` FROM `mru_items` WHERE `UID` = '%d'", uid);
            result = mysql_query(Database, query);
            if(cache_num_rows()) exist = true;
            cache_get_value_index_int(0, 0, current_quant);
            cache_delete(result);

            if(!exist)
                return sendErrorMessage(playerid, "Przedmiot o podanym UID nie istnieje w bazie danych.");
            if(current_quant < quant || quant <= 0)
                quant = current_quant;

            new itemid = Memory_IsItemLoaded(uid);
            if(itemid != -1)
            {
                Log(itemLog, WARNING, "%s usunął przedmiot %s x%d (przez uid)", GetPlayerLogName(playerid), GetItemLogName(itemid), quant);
                va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Usunąłeś przedmiot o ID: %d x%d", itemid, quant);
                Item_Delete(itemid, true, quant);
            }
            else
            {
                if(current_quant == quant || (current_quant - quant) <= 0) //Full delete
                {
                    format(query, sizeof(query), "DELETE FROM `mru_items` WHERE `UID` = '%d'", uid);
                    mysql_tquery(Database, query);
                }
                else //-quant
                {
                    format(query, sizeof(query), "UPDATE `mru_items` SET `quantity` = `quantity` - %d WHERE `UID` = '%d'", quant, uid);
                    mysql_tquery(Database, query);
                }
                Log(itemLog, WARNING, "%s usunął przedmiot o UID: %d x%d (przez uid)", GetPlayerLogName(playerid), uid, quant);
                va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Usunąłeś przedmiot o UID: %d x%d", uid, quant);
            }
        
        }
        case _H<typy>:
        {
            new string[1024];
            string = "Typ\tNazwa";
            for(new i = 0; i < sizeof(ItemTypes); i++)
                strcat(string, sprintf("\n%d\t%s", i, ItemTypes[i]));
            ShowPlayerDialogEx(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "Zarządzanie przedmiotami »» Typy", string, "OK", #);
        }
        case _H<clear3dtext>:
        {
            if(!PlayerInfo[playerid][pAdmin]) return noAccessMessage(playerid);
            foreach(new i : Items)
            {
                if(Item[i][i_OwnerType] == ITEM_OWNER_TYPE_DROPPED && Item[i][i_Dropped] && IsValidDynamic3DTextLabel(Item[i][i_3DText]))
                    DestroyDynamic3DTextLabel(Item[i][i_3DText]);
            }
            SendClientMessage(playerid, COLOR_PANICRED, "Wyczyściłeś wszystkie 3D texty odłożonych przedmiotów.");
            SendCommandLogMessage(sprintf("Admin %s wyczyścił 3D Texty odłożonych przedmiotów!", GetNickEx(playerid)));
        }
        default:
            sendTipMessage(playerid, "Nieprawidłowa opcja.");
    }
    return 1;
}

//end