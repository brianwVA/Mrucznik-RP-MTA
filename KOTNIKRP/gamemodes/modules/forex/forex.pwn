CMD:forex(playerid, params[])
{
    if(PlayerInfo[playerid][pBW] > 0 || PlayerInfo[playerid][pInjury] > 0) return 1;

    DialogForexShow(playerid, 1);
    return 1;
}


stock DialogForexShow(playerid, type)
{
    if(type == 1)
    {
        new 
            dialog[2048],
            db_uid, db_amount, db_type, Float:db_course, db_owner
        ;

        dialog = "#\tSprzedawane\tKurs\tDostępna Ilość\n";
        format(dialog,sizeof(dialog),"%s \t-\t{ACA5A6}Wystaw ofertę (zaawansowane)...\t\n", 	dialog);
        
        DynamicGui_Init(playerid);
        DynamicGui_AddRow(playerid, 0);

        new Cache:result;
        result = mysql_query(Database, "SELECT * FROM `forex` WHERE type = 0 ORDER BY course DESC");
        if(cache_num_rows())
        {
            for(new index = 0; index < cache_num_rows(); index++)
            {
                cache_get_value_int(index, "id", db_uid);
                cache_get_value_int(index, "amount", db_amount);
                cache_get_value_int(index, "type", db_type);
                cache_get_value_float(index, "course", db_course);
                cache_get_value_int(index, "owner", db_owner);

                //continue if invalid db_owner
                if(GetPlayerIDFromUID(db_owner) == INVALID_PLAYER_ID) continue;

                format(dialog,sizeof(dialog),"%s%d\t{b8c6ff}MC\t{FFFFFF}1MC = $%f%s\t%dMC\n", 	dialog, db_uid, db_course, (PlayerInfo[playerid][pUID] == db_owner ? (" {F05D43}(usuń swoją ofertę){ffffff}") : ("")), db_amount);
                DynamicGui_AddRow(playerid, db_uid);
            }
        }
        cache_delete(result);
        DynamicGui_AddRow(playerid, 99999);
        format(dialog,sizeof(dialog),"%s---\t---\t{F05D43}(Im bliżej separatora --, tym lepsza oferta)\t{FFFFFF}---\n", 	dialog);


        new Cache:result2;
        result2 = mysql_query(Database, "SELECT * FROM `forex` WHERE type = 1 ORDER BY course ASC");
        if(cache_num_rows())
        {
            for(new index = 0; index < cache_num_rows(); index++)
            {
                cache_get_value_int(index, "id", db_uid);
                cache_get_value_int(index, "amount", db_amount);
                cache_get_value_int(index, "type", db_type);
                cache_get_value_float(index, "course", db_course);
                cache_get_value_int(index, "owner", db_owner);

                if(GetPlayerIDFromUID(db_owner) == INVALID_PLAYER_ID) continue;

                format(dialog,sizeof(dialog),"%s%d\t{33AA33}USD\t{FFFFFF}$1 = %fMC%s\t$%d\n", 	dialog, db_uid, db_course, (PlayerInfo[playerid][pUID] == db_owner ? (" {F05D43}(usuń swoją ofertę){ffffff}") : ("")), db_amount);
                DynamicGui_AddRow(playerid, db_uid);
            }
        }
        cache_delete(result2);
        ShowPlayerDialogEx( playerid, DIALOG_FOREX, DIALOG_STYLE_TABLIST_HEADERS, sprintf("Forex. Konto: {b8c6ff}%d MC{FFFFFF}, {33AA33}%d USD", PremiumInfo[playerid][pMC], kaska[playerid]), dialog, "Kup...", "Anuluj" );
        return 1;
    }
    else if(type == 2) // Wystawa na giełdzie
    {
        if(ForexPlayer[playerid][fType] < 0 || ForexPlayer[playerid][fType] > 1)
            ForexPlayer[playerid][fType] = 0;
        
        new String[248];
        format(String, sizeof(String), "\
                                        Sprzedawana waluta:\t%s\n\
                                        Sprzedawana ilość:\t%d\n\
                                        Kurs sprzedaży 1MC/$1:\t%f\n\
                                        ---\n\
                                        {b8c6ff}Wystaw na giełdę.", (ForexPlayer[playerid][fType] == 0) ? ("{b8c6ff}MC") : ("{33AA33}USD"), ForexPlayer[playerid][fAmount], ForexPlayer[playerid][fCourse]);
        return ShowPlayerDialogEx(playerid, DIALOG_FOREX_WYSTAWA, DIALOG_STYLE_LIST, sprintf("Forex. Konto: {b8c6ff}%d MC{FFFFFF}, {33AA33}%d USD", PremiumInfo[playerid][pMC], kaska[playerid]), String, "Wybierz", "Anuluj");
    }
    else if(type == 3) // Kupno na giełdzie
    {
        new uid = ForexPlayer[playerid][fBuyid], forex_delete = 0;
        new 
            String[248],
            db_type, db_amount, Float:db_course, db_owner
        ;

        new Cache:result;
        result = mysql_query(Database, sprintf("SELECT * FROM `forex` WHERE id = %d", uid));
        if(cache_num_rows())
        {
            for(new index = 0; index < cache_num_rows(); index++)
            {
                cache_get_value_int(index, "amount", db_amount);
                cache_get_value_int(index, "type", db_type);
                cache_get_value_float(index, "course", db_course);
                cache_get_value_int(index, "owner", db_owner);

                if(db_owner == PlayerInfo[playerid][pUID])
                    forex_delete = 1;

                if(db_type == 0) {
                    format(String, sizeof(String), "\
                                        {FFFFFF}Wpisz ile {b8c6ff}MC{FFFFFF} chcesz kupić.\n\
                                        Aktualna ilość wynosi: {A52A2A}%d\n\
                                        {FFFFFF}Ustawiony kurs: {b8c6ff}1MC = $%f", db_amount, db_course);
                } else {
                    format(String, sizeof(String), "\
                                        {FFFFFF}Wpisz ile {33AA33}USD{FFFFFF} chcesz kupić.\n\
                                        Aktualna ilość wynosi: {A52A2A}%d\n\
                                        {FFFFFF}Ustawiony kurs: {b8c6ff}$1 = %fMC", db_amount, db_course);
                }
            }
        }
        cache_delete(result);

        if(forex_delete == 1) {
            if(db_type == 0) 
                DajMC(playerid, db_amount);
            else 
                DajKaseDone(playerid, db_amount);
            new query[256];
            format(query, sizeof(query), "DELETE FROM `forex` WHERE `id` = '%d'", uid);
            mysql_query(Database, query);
            return GameTextForPlayer(playerid, "~y~Twoja oferta zostala wycofana z rynku forex." , 4000, 4); 
        } else {
            return ShowPlayerDialogEx(playerid, DIALOG_FOREX_BUY, DIALOG_STYLE_INPUT, sprintf("Forex. Przegląd oferty: %d", uid), String, "Kup", "Anuluj");
        }

    }
    return 1;
}


stock OnDialogForex(playerid, dialogid, response, listitem, const inputtext[])
{
    if(dialogid == DIALOG_FOREX)
    {
        if(!response) return 1;
        if(listitem == 0) // Wystawa na giełde
        {
            return DialogForexShow(playerid, 2);
        }

        new offer = strval(inputtext);  
        if(offer == 0) return DialogForexShow(playerid, 1);

        ForexPlayer[playerid][fBuyid] = offer;
        DialogForexShow(playerid, 3);
        return 1;
    } 
    else if(dialogid == DIALOG_FOREX_WYSTAWA)
    {
        if(!response) return 1;
        switch(listitem)
        {
            case 0:
            {
                if(ForexPlayer[playerid][fType] == 1)
                    ForexPlayer[playerid][fType] = 0;
                else
                    ForexPlayer[playerid][fType] = 1;
                return DialogForexShow(playerid, 2);
            }
            case 1:
            {
                return ShowPlayerDialogEx(playerid, DIALOG_FOREX_WYSTAWA_1, DIALOG_STYLE_INPUT, sprintf("Forex. Konto: {b8c6ff}%d MC{FFFFFF}, {33AA33}%d USD", PremiumInfo[playerid][pMC], kaska[playerid]), "Wprowadż ilość MC/USD która chcesz wystawić na Forex","OK","Anuluj");
            }
            case 2:
            {
                return ShowPlayerDialogEx(playerid, DIALOG_FOREX_WYSTAWA_2, DIALOG_STYLE_INPUT, sprintf("Forex. Konto: {b8c6ff}%d MC{FFFFFF}, {33AA33}%d USD", PremiumInfo[playerid][pMC], kaska[playerid]), "Wprowadż kurs za który chcesz sprzedać MC/USD np. 4.5","OK","Anuluj");
            }
            case 4:
            {
                new type = ForexPlayer[playerid][fType];
                new amount = ForexPlayer[playerid][fAmount];
                new Float:course = ForexPlayer[playerid][fCourse];
                if(type == 0 && PremiumInfo[playerid][pMC] < amount) return GameTextForPlayer(playerid, "~w~Nie posiadasz tyle MC." , 4000, 4);
                if(type == 1 && kaska[playerid] < amount) return GameTextForPlayer(playerid, "~w~Nie posiadasz tyle USD." , 4000, 4);
                if(amount <= 0.0 || amount > 9999) return GameTextForPlayer(playerid, "~w~Bledna sprzedawana ilosc." , 4000, 4);
                if(course <= 0.0 || course > 9999) return GameTextForPlayer(playerid, "~w~Bledny kurs sprzedazy." , 4000, 4);

                if(type == 0)
                    ZabierzMC(playerid, amount);
                else
                    ZabierzKaseDone(playerid, amount);
                
                new query[256];
                format(query, sizeof(query), "INSERT INTO `forex` (`amount`, `type`, `course`, `owner`) VALUES ('%d', '%d', '%f', '%d');", amount, type, course, PlayerInfo[playerid][pUID]);
                mysql_query(Database, query);
                DialogForexShow(playerid, 1);
                //RefreshEuroTD(playerid);
                Log(moneyLog, WARNING, "[forex] %s stworzyl nowa oferte dla %d %s (course: %f)", GetPlayerLogName(playerid),  amount, (type == 0 ? ("MC") : ("USD")), course);
                
                return GameTextForPlayer(playerid, "~y~Wystawiono oferte na Forex." , 4000, 4); 
            }
        }
    }
    else if(dialogid == DIALOG_FOREX_WYSTAWA_1)
    {
        if(!response) return 1;
        if(floatstr(inputtext) <= 0.0 || strval(inputtext) > 9999) return DialogForexShow(playerid, 2);
        ForexPlayer[playerid][fAmount] = strval(inputtext);
        return DialogForexShow(playerid, 2);
    } 
    else if(dialogid == DIALOG_FOREX_WYSTAWA_2)
    {
        if(!response) return 1;
        if(strval(inputtext) <= -1 || strval(inputtext) > 9999) return DialogForexShow(playerid, 2);
        ForexPlayer[playerid][fCourse] = floatstr(inputtext);
        return DialogForexShow(playerid, 2);
    }
    else if(dialogid == DIALOG_FOREX_BUY)
    {
        if(!response) return 1;
        if(strval(inputtext) <= 0) return DialogForexShow(playerid, 1);
        new buy_amount = strval(inputtext);
        new uid = ForexPlayer[playerid][fBuyid];
        new 
            String[248],
            db_type, db_amount, Float:db_course
        ;

        new Cache:result;
        result = mysql_query(Database, sprintf("SELECT * FROM `forex` WHERE id = %d", uid));
        if(cache_num_rows())
        {
            for(new index = 0; index < cache_num_rows(); index++)
            {
                cache_get_value_int(index, "amount", db_amount);
                cache_get_value_int(index, "type", db_type);
                cache_get_value_float(index, "course", db_course);
            }
        }
        cache_delete(result);
        if(strval(inputtext) > db_amount) return DialogForexShow(playerid, 1);

        new calcprice = floatround((buy_amount * db_course), floatround_ceil);

        ForexPlayer[playerid][fType] = buy_amount;
        ForexPlayer[playerid][fAmount] = calcprice;

        format(String, sizeof(String), "\
                                        {FFFFFF}Czy jesteś pewny zakupu %d %s{FFFFFF}\n\
                                        Za cenę: {A52A2A}%s%d%s{FFFFFF}?", buy_amount, (db_type == 0) ? ("{b8c6ff}MC") : ("{33AA33}USD"), (db_type == 0) ? ("$") : (""), calcprice, (db_type == 0) ? ("") : ("€"));
        return ShowPlayerDialogEx( playerid, DIALOG_FOREX_BUY_CONFIRM, DIALOG_STYLE_MSGBOX, sprintf("Forex. Przegląd oferty: %d", uid), String, "Akceptuje", "Anuluj" );
    } 
    else if(dialogid == DIALOG_FOREX_BUY_CONFIRM)
    {
        if(!response) return 1;
        new uid = ForexPlayer[playerid][fBuyid];
        new price = ForexPlayer[playerid][fAmount];
        new amount = ForexPlayer[playerid][fType];
        new Cache:result;
        result = mysql_query(Database, sprintf("SELECT * FROM `forex` WHERE id = %d", uid));
        new type = -1;
        new maxamount = -1;
        new owner = -1;
        if(cache_num_rows())
        {
            for(new index = 0; index < cache_num_rows(); index++)
            {
                cache_get_value_int(index, "amount", maxamount);
                cache_get_value_int(index, "type", type);
                cache_get_value_int(index, "owner", owner);
            }
        }
        cache_delete(result);
        new player = GetPlayerIDFromUID(owner);
        if(player == INVALID_PLAYER_ID) return GameTextForPlayer(playerid, "~w~Ta oferta nie jest juz aktualna." , 4000, 4); 
        if(amount > maxamount) return GameTextForPlayer(playerid, "~w~Ta oferta nie jest juz aktualna." , 4000, 4); 

        if(type == 0)
        {
            if(kaska[playerid] < price) return GameTextForPlayer(playerid, "~w~Nie masz tyle pieniedzy przy sobie." , 4000, 4); 
            
            ZabierzKaseDone(playerid, price);
            DajMC(playerid, amount);

            DajKaseDone(player, price);
            GameTextForPlayer(player, "~y~Ktos zakupil twoja oferte na Forex +USD." , 4000, 4); 

            GameTextForPlayer(playerid, "~y~Zakup zostal dokonany +MC." , 4000, 4);
            Log(moneyLog, WARNING, "[forex] %s kupil %d MC od %s za %d USD", GetPlayerLogName(playerid),  amount, GetPlayerLogName(player), price); 
        }
        if(type == 1)
        {
            if(PremiumInfo[playerid][pMC] < price) return GameTextForPlayer(playerid, "~w~Nie masz tyle MC." , 4000, 4); 
            
            ZabierzMC(playerid, price);
            DajKaseDone(playerid, amount);

            DajMC(player, price);
            GameTextForPlayer(player, "~y~Ktos zakupil twoja oferte na Forex +MC." , 4000, 4); 

            GameTextForPlayer(playerid, "~y~Zakup zostal dokonany +USD." , 4000, 4); 
            Log(moneyLog, WARNING, "[forex] %s kupil %d USD od %s za %d MC", GetPlayerLogName(playerid),  amount, GetPlayerLogName(player), price); 
        }

        if(maxamount == amount) {
            mysql_tquery_format("DELETE FROM `forex` WHERE `id` = '%d'", uid);
        } else {
            mysql_tquery_format("UPDATE `forex` SET `amount` = amount - '%d' WHERE `id` = '%d'", amount, uid);
        }
    }
    return 0;
}