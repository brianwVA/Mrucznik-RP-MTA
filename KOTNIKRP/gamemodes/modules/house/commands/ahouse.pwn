forward command_ahouse();
public command_ahouse()
{
    Command_AddAltNamed("ahouse", "adom");
}

YCMD:ahouse(playerid, params[])
{
    if(!PlayerInfo[playerid][pAdmin] && !Uprawnienia(playerid, ACCESS_SKRYPTER)) return noAccessMessage(playerid);
    new opt1[16], opt2[128];
    if(sscanf(params, "s[16]S()[128]", opt1, opt2)) return sendTipMessage(playerid, "Użyj: /ahouse [stworz | lista | tp | usun | wlasciciel | getid]");
    //TODO: setinttype, setinterior, setprice
    switch(YHash(opt1))
    {
        case _H<stworz>:
        {
            if(!Uprawnienia(playerid, ACCESS_SKRYPTER)) return noAccessMessage(playerid);

            new price, interior_type;
            if(sscanf(opt2, "dd", price, interior_type)) return sendTipMessage(playerid, "Użyj: /ahouse stworz [cena] [typ wnętrza 1=mały,2=średni,3=duży]");
            if(price < 0 || price > 10000000) return sendErrorMessage(playerid, "Niepoprawna cena (0-10000000)");
            if(interior_type < 1 || interior_type > 3) return sendErrorMessage(playerid, "Typ wnętrza musi mieć wartość 1-3");
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            new id = House_Create(x, y, z, GetPlayerVirtualWorld(playerid), 0, 0, 0, 0, price, interior_type);
            if(id == -1) return sendErrorMessage(playerid, "Wystąpił problem z bazą danych przy tworzeniu domu. (UID<1)");
            if(id == -2) return sendErrorMessage(playerid, "Przekroczono limit domów dostępnych na serwerze ("#MAX_HOUSE")");
            if(id == -3) return sendErrorMessage(playerid, "Znajdujesz się zbyt blisko innego domu.");
            sendTipMessage(playerid, sprintf("Stworzono dom o ID: %d", id));
        }
        case _H<lista>:
        {
            SendClientMessage(playerid, COLOR_GREEN, "|_____    Lista domów  _____|");
            foreach(new i : House_iterator)
            {
                if(!House[i][h_ID]) continue;
                new nick[26];
                strmid(nick, MruMySQL_GetNameFromUID(House[i][h_Owner]), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
                va_SendClientMessage(playerid, COLOR_GREEN, "(%d) {3094cf}Dom, Właściciel: %s, Cena: $%d", i, (strlen(nick)) ? (nick) : ("na sprzedaż"), House[i][h_Price]);
            }
            SendClientMessage(playerid, COLOR_GREEN, "|_____  Koniec  _____|");
            return 1;
        }
        case _H<wlasciciel>, _H<setowner>:
        {
            if(PlayerInfo[playerid][pAdmin] < 5000) return noAccessMessage(playerid);
            new id, newowner;
            if(sscanf(opt2, "dd", id, newowner)) return sendTipMessage(playerid, "Użyj: /ahouse wlasciciel [id domu] [UID gracza]");
            if(newowner < 0) return sendErrorMessage(playerid, "Niepoprawne UID. 0 usuwa właściciela");
            if(!Iter_Contains(House_iterator, id)) return sendErrorMessage(playerid, "Dom o podanym ID nie istnieje.");

            new nick[26];
            strmid(nick, MruMySQL_GetNameFromUID(newowner), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
            if(!strlen(nick) && newowner != 0) return sendErrorMessage(playerid, "Gracz o podanym UID nie istnieje.");

            House[id][h_Owner] = newowner;
            House_UpdateLabel(id);
            _MruGracz(playerid, sprintf("Zmieniłeś właściciela domu o ID %d na: %s", id, nick));
            Log(adminLog, INFO, "%s gave house %s to player UID %d", GetPlayerLogName(playerid), GetHouseLogName(id), newowner);
            House_UpdatePickup(id);
            House_Save(id);
        }
        case _H<tp>:
        {
            new id = strval(opt2);
            if(isnull(opt2)) return sendTipMessage(playerid, "Użyj: /ahouse tp [ID domu]");
            if(id < 0 || id >= MAX_HOUSE || !Iter_Contains(House_iterator, id)) return sendErrorMessage(playerid, "Dom o podanym ID nie istnieje.");
            SetPlayerPos(playerid, House[id][h_enter_pos][0], House[id][h_enter_pos][1], House[id][h_enter_pos][2]);
            SetPlayerVirtualWorld(playerid, House[id][h_enter_vw]);
            sendTipMessage(playerid, sprintf("Przeteleportowano do domu o ID: %d", id));
        }
        case _H<usun>:
        {
            if(!Uprawnienia(playerid, ACCESS_SKRYPTER)) return noAccessMessage(playerid);
            new id = strval(opt2);
            if(isnull(opt2)) return sendTipMessage(playerid, "Użyj: /ahouse usun [ID domu]");
            if(id < 0 || id >= MAX_HOUSE || !Iter_Contains(House_iterator, id)) return sendErrorMessage(playerid, "Dom o podanym ID nie istnieje.");
            House_Delete(id);
            sendTipMessage(playerid, sprintf("Usunięto dom o ID: %d", id));
        }
        case _H<getid>:
        {
            new id = strval(opt2);
            if(isnull(opt2)) return sendTipMessage(playerid, "Użyj: /ahouse getid [UID domu]");
            foreach(new i : House_iterator)
            {
                if(House[i][h_ID] == id)
                {
                    return sendTipMessage(playerid, sprintf("ID domu o UID %d to: %d", id, i));
                }
            }
            return sendErrorMessage(playerid, "Nie znaleziono domu o podanym UID.");
        }
    }
    return 1;
}