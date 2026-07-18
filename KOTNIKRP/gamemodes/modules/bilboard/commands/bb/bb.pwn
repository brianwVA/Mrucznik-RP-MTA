YCMD:bb(playerid, params[])
{
    new option[32], values[64];
    if(sscanf(params, "s[32]S()[64]", option, values))
    {
        if(PlayerInfo[playerid][pAdmin] >= 1000)
            return sendTipMessage(playerid, "Użyj: /bb [rent/unrent/price/create/destroy]");
        else
            return sendTipMessage(playerid, "Użyj: /bb [rent/unrent]");
    }
    if(strcmp(option, "rent", true) == 0)
    {
        new bilbid, days;
        if(PlayerInfo[playerid][pLevel] < 2) return sendTipMessage(playerid, "Bilboard możesz wynajmować od 2 poziomu!");
        if(sscanf(values, "dd", bilbid, days)) return sendTipMessage(playerid, "Użyj: /bb rent [id bilboardu] [ilość dni (2-7)]");
        if(bilbid < 0 || bilbid > MAX_BILBOARDS) return sendErrorMessage(playerid, "Ten bilboard nie istnieje!");
        if(Bilboard[bilbid][bcreated] == false && Bilboard[bilbid][bloaded] == false) return sendErrorMessage(playerid, "Ten bilboard nie istnieje!");
        if(Bilboard[bilbid][btime] != -1) return sendErrorMessage(playerid, "Ten bilboard jest już wynajmowany!");
        if(days < 2 || days > 7) return sendErrorMessage(playerid, "Bilboard możesz wynająć od 2 do 7 dni!");
        if(!IsPlayerInRangeOfPoint(playerid, 50.0, Bilboard[bilbid][bposx], Bilboard[bilbid][bposy], Bilboard[bilbid][bposz])) return sendErrorMessage(playerid, "Nie jesteś w pobliżu tego bilboardu!");
        
        PlayerInfo[playerid][SelectedBilboardDays] = days;
        PlayerInfo[playerid][SelectedBilboard] = bilbid;

        ShowPlayerDialogEx(playerid, D_BILBRENT1, DIALOG_STYLE_INPUT, "Wynajem bilboardu", "{FFFFFF}Podaj tekst bilboardu który ma być użyty!\nUżyj {F7C173}/n {FFFFFF}aby przejść do nowej linijki.", "Potwierdź", "Wyjdź");

        return 1;
    }
    else if(strcmp(option, "unrent", true) == 0)
    {
        new bilbid;
        if(sscanf(values, "i", bilbid)) return sendTipMessage(playerid, "Użyj: /bb unrent [id bilboardu]");
        if(bilbid < 0 || bilbid > MAX_BILBOARDS) return sendErrorMessage(playerid, "Ten bilboard nie istnieje!");
        if(Bilboard[bilbid][bcreated] == false && Bilboard[bilbid][bloaded] == false) return sendErrorMessage(playerid, "Ten bilboard nie istnieje!");
        if(Bilboard[bilbid][btime] == -1) return sendErrorMessage(playerid, "Ten bilboard jest do wynajęcia!");
        if(!IsPlayerInRangeOfPoint(playerid, 50.0, Bilboard[bilbid][bposx], Bilboard[bilbid][bposy], Bilboard[bilbid][bposz])) return sendErrorMessage(playerid, "Nie jesteś w pobliżu tego bilboardu!");

        if(PlayerInfo[playerid][pAdmin] == 0)
            if(Bilboard[bilbid][bruid] != PlayerInfo[playerid][pUID])
                return sendErrorMessage(playerid, "Ten bilboard nie został wynajęty przez Ciebie!");

        PlayerInfo[playerid][SelectedBilboard] = bilbid;
        ShowPlayerDialogEx(playerid, D_BILBRENT3, DIALOG_STYLE_MSGBOX, "Koniec wynajmu", "{FFFFFF}Czy na pewno chcesz zakończyć wynajem tego bilboardu?", "Tak", "Nie");
        return 1;
    }
    if(PlayerInfo[playerid][pAdmin] < 1000) return sendTipMessage(playerid, "Użyj: /bb [rent/unrent]");
    else
    {
        if(strcmp(option, "create", true) == 0)
        {
            if(PlayerInfo[playerid][pIsEditingBilboard] == false)
            {
                new Float:x, Float:y, Float:z, Float:a;
                GetPlayerPos(playerid, x, y, z);
                GetPlayerFacingAngle(playerid, a);
                GetXYInFrontOfPlayer(playerid, x, y, 2.0);
                PlayerInfo[playerid][pIsEditingBilboard] = true;
                PlayerInfo[playerid][pEditorBilboardObject] = CreateDynamicObject(1260, x, y, z + 10, 0, 0, a + 90, -1, -1, -1, 1000, 1000, -1, 1);
                EditDynamicObject(playerid, PlayerInfo[playerid][pEditorBilboardObject]);
                sendTipMessage(playerid, "Ustaw teraz bilboard na pozycji i nacisnij przycisk ZAPISZ(Dyskietka)...");
                sendTipMessage(playerid, "Przycisk {FF0000}SPACJA {FFFFFF}pozwala na poruszanie kamery.");
                sendTipMessage(playerid, "Przycisk {FF0000}ESC {FFFFFF}anuluje tworzenie bilboarda.");
            }
            else sendErrorMessage(playerid, "Aktualnie tworzysz bilboard.");
            return 1;
        }
        else if(strcmp(option, "price", true) == 0)
        {
            new bilbid, newcost;
            if(sscanf(values, "dd", bilbid, newcost))
                return sendTipMessage(playerid, "Użyj: /bb price [id bilboardu] [cena]");

            if(bilbid < 0 || bilbid > MAX_BILBOARDS) return sendErrorMessage(playerid, "ID bilboardu nie może być mniejsze niż 0.");
            if(Bilboard[bilbid][bcreated] == false && Bilboard[bilbid][bloaded] == false) return sendErrorMessage(playerid, "Ten bilboard nie istnieje!");
            if(!IsPlayerInRangeOfPoint(playerid, 50.0, Bilboard[bilbid][bposx], Bilboard[bilbid][bposy], Bilboard[bilbid][bposz])) return sendErrorMessage(playerid, "Nie jesteś w pobliżu tego bilboardu!");
            
            Bilboard[bilbid][bcost] = newcost;
            mysql_query_format("UPDATE mru_bilboard SET cost = '%i' WHERE uid = '%i'", Bilboard[bilbid][bcost], Bilboard[bilbid][buid]); 
            SendClientMessage(playerid, -1, "Cena bilbordu ID %i zostala zmieniona na $%i za dzien.", bilbid, Bilboard[bilbid][bcost]);
            if(Bilboard[bilbid][btime] == -1)
                UpdateBilboard(bilbid);

            return 1;
        }
    }

    return 1;
}