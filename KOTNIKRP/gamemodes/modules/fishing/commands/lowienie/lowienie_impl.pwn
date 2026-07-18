//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  lowienie                                                 //
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
// Data utworzenia: 03.03.2020


//

//------------------<[ Implementacja: ]>-------------------
command_lowienie_Impl(playerid)
{
    new string[128];
    if(PlayerInfo[playerid][pFishes] >= 5)
    {
        sendTipMessageEx(playerid, COLOR_GREY, sprintf("Odczekaj ~%d minut zanim znów zaczniesz łowić!", (20 - FishCount[playerid])));
        return 1;
    }
    if(Fishes[playerid][pWeight1] > 0 && Fishes[playerid][pWeight2] > 0 && Fishes[playerid][pWeight3] > 0 && Fishes[playerid][pWeight4] > 0 && Fishes[playerid][pWeight5] > 0)
    {
        sendTipMessageEx(playerid, COLOR_GREY, "Masz już 5 ryb, usmaż je / sprzedaj / wywal !");
        return 1;
    }
    new Veh = GetPlayerVehicleID(playerid);
    new bool:nearBoat = 0;
    if(Veh && IsABoat(Veh))
    {
        nearBoat = 1;
    }
    else
    {
        new newcar=0, Float:dis=4.75, Float:x, Float:y, Float:z, Float:currdist;
        for(new i=0;i<MAX_VEHICLES;i++)
        {
            if(VehicleUID[i][vUID] == 0) continue;
            if(!IsABoat(i)) continue;
            if(GetPlayerInterior(playerid) != GetVehicleInterior(i)) continue;
            if(GetPlayerVirtualWorld(playerid) != GetVehicleVirtualWorld(i)) continue;
            GetVehiclePos(i, x, y, z);
            if((currdist = GetPlayerDistanceFromPoint(playerid, x, y, z)) < dis)
            {
                dis = currdist;
                newcar = i;
            }
        }
        if(newcar != 0 && dis <= 15.0)
        {
            nearBoat = 1;
        }
    }

    if(IsAtFishPlace(playerid) || nearBoat)
    {
        if(Veh && !IsABoat(Veh)) return sendTipMessageEx(playerid, COLOR_GREY, "Wysiądź z pojazdu. Łowić można tylko pieszo lub na kutrze rybackim !");
        new Caught;
        new rand;
        new fstring[MAX_PLAYER_NAME + 1];
        new Level = PlayerInfo[playerid][pFishSkill];
        new Float:health;
        if(Level >= 0 && Level <= 50) { Caught = random(901)-550; } // 350
        else if(Level >= 51 && Level <= 100) { Caught = random(891)-490; } // 400
        else if(Level >= 101 && Level <= 200) { Caught = random(891)-410; } // 480
        else if(Level >= 201 && Level <= 400) { Caught = random(921)-340; } // 580
        else if(Level >= 401) { Caught = random(1001)-250; } // 750
        rand = random(sizeof(FishNames));

        SetTimerEx("Lowienie", 30000 ,0,"d",playerid);
        FishGood[playerid] = 1;
        
        if(Caught <= 0)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Żyłka pękła !");
            return 1;
        }
        else if(rand == 0)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Złowiłeś Kiełbasę więc ją zjadasz !");
            GetPlayerHealth(playerid, health);
            SetPlayerHealth(playerid, health + 1.0);
            return 1;
        }
        else if(rand == 4)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Złowiłeś stare gacie więc je zakładasz !");
            return 1;
        }
        else if(rand == 7)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Złowiłeś muł więc go wyrzucasz !");
            return 1;
        }
        else if(rand == 10)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Złowiłeś Stare Kalosze więc je zakładasz !");
            return 1;
        }
        else if(rand == 13)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Złowiłeś smalec więc go zjadasz !");
            GetPlayerHealth(playerid, health);
            SetPlayerHealth(playerid, health + 1.0);
            return 1;
        }
        else if(rand == 20)
        {
            new mrand = random(PRICE_RYBA_SAKWA);
            format(string, sizeof(string), "* Złapałeś sakiewkę pieniędzy, w środku znalazłeś $%d.", mrand);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            DajKaseDone(playerid, mrand);
            return 1;
        }
        if(Caught > 0 && nearBoat)
        {
            Caught = (Caught * 130) / 100; // +30%
        }

        if(Fishes[playerid][pWeight1] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(Fishes[playerid][pFish1], fstring, 0, strlen(fstring));
            Fishes[playerid][pWeight1] = Caught;
            format(string, sizeof(string), "* Złapałeś %s, ważącą %d g.", Fishes[playerid][pFish1], Caught);
            if (Caught >= 100)
            {
                FirstBigFish(playerid);
            }
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            Fishes[playerid][pLastWeight] = Caught;
            Fishes[playerid][pLastFish] = 1;
            Fishes[playerid][pFid1] = rand;
            Fishes[playerid][pFishID] = rand;
            mysql_tquery_format("UPDATE `mru_ryby` SET `Fish1` = '%s', `Weight1` = '%d', `Fid1` = '%d' WHERE `Player` = '%d'", fstring, Caught, rand, PlayerInfo[playerid][pUID]);
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Twój stary rekord wynosił %d g, został on pobity i twój rekord wynosi teraz: %d g.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(Fishes[playerid][pWeight2] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(Fishes[playerid][pFish2], fstring, 0, strlen(fstring));
            Fishes[playerid][pWeight2] = Caught;
            format(string, sizeof(string), "* Złapałeś %s, ważącą %d g.", Fishes[playerid][pFish2], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            Fishes[playerid][pLastWeight] = Caught;
            Fishes[playerid][pLastFish] = 2;
            Fishes[playerid][pFid2] = rand;
            Fishes[playerid][pFishID] = rand;
            mysql_tquery_format("UPDATE `mru_ryby` SET `Fish2` = '%s', `Weight2` = '%d', `Fid2` = '%d' WHERE `Player` = '%d'", fstring, Caught, rand, PlayerInfo[playerid][pUID]);
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Twój stary rekord wynosił %d g, został on pobity i twój rekord wynosi teraz: %d g.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(Fishes[playerid][pWeight3] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(Fishes[playerid][pFish3], fstring, 0, strlen(fstring));
            Fishes[playerid][pWeight3] = Caught;
            format(string, sizeof(string), "* Złapałeś %s, ważącą %d g.", Fishes[playerid][pFish3], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            Fishes[playerid][pLastWeight] = Caught;
            Fishes[playerid][pLastFish] = 3;
            Fishes[playerid][pFid3] = rand;
            Fishes[playerid][pFishID] = rand;
            mysql_tquery_format("UPDATE `mru_ryby` SET `Fish3` = '%s', `Weight3` = '%d', `Fid3` = '%d' WHERE `Player` = '%d'", fstring, Caught, rand, PlayerInfo[playerid][pUID]);
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Twój stary rekord wynosił %d g, został on pobity i twój rekord wynosi teraz: %d g.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(Fishes[playerid][pWeight4] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(Fishes[playerid][pFish4], fstring, 0, strlen(fstring));
            Fishes[playerid][pWeight4] = Caught;
            format(string, sizeof(string), "* Złapałeś %s, ważącą %d g.", Fishes[playerid][pFish4], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            Fishes[playerid][pLastWeight] = Caught;
            Fishes[playerid][pLastFish] = 4;
            Fishes[playerid][pFid4] = rand;
            Fishes[playerid][pFishID] = rand;
            mysql_tquery_format("UPDATE `mru_ryby` SET `Fish4` = '%s', `Weight4` = '%d', `Fid4` = '%d' WHERE `Player` = '%d'", fstring, Caught, rand, PlayerInfo[playerid][pUID]);
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Twój stary rekord wynosił %d g, został on pobity i twój rekord wynosi teraz: %d g.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(Fishes[playerid][pWeight5] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(Fishes[playerid][pFish5], fstring, 0, strlen(fstring));
            Fishes[playerid][pWeight5] = Caught;
            format(string, sizeof(string), "* Złapałeś %s, ważącą %d g.", Fishes[playerid][pFish5], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            Fishes[playerid][pLastWeight] = Caught;
            Fishes[playerid][pLastFish] = 5;
            Fishes[playerid][pFid5] = rand;
            Fishes[playerid][pFishID] = rand;
            mysql_tquery_format("UPDATE `mru_ryby` SET `Fish5` = '%s', `Weight5` = '%d', `Fid5` = '%d' WHERE `Player` = '%d'", fstring, Caught, rand, PlayerInfo[playerid][pUID]);
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Twój stary rekord wynosił %d g, został on pobity i twój rekord wynosi teraz: %d g.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie masz już miejsca na nowe ryby !");
            return 1;
        }
        if(PlayerInfo[playerid][pFishSkill] == 50)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiejętności rybaka wynoszą teraz 2, możesz łowić większe ryby."); }
        else if(PlayerInfo[playerid][pFishSkill] == 100)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiejętności rybaka wynoszą teraz 3, możesz łowić większe ryby."); }
        else if(PlayerInfo[playerid][pFishSkill] == 200)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiejętności rybaka wynoszą teraz 4, możesz łowić większe ryby."); }
        else if(PlayerInfo[playerid][pFishSkill] == 400)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiejętności rybaka wynoszą teraz 5, możesz łowić większe ryby."); }
    }
    else
    {
        sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś w miejscu gdzie można łowić (Molo bez koła) lub na kutrze rybackim !");
        return 1;
    }
    return 1;
}

//end