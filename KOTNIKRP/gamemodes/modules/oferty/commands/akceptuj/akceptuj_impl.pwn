//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  akceptuj                                                 //
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
// Data utworzenia: 07.02.2020


//
//TODO: przerobić całkowicie
//------------------<[ Implementacja: ]>-------------------
command_akceptuj_Impl(playerid, x_job[32])
{
    new string[256];
    new giveplayer[MAX_PLAYER_NAME + 1];
    new sendername[MAX_PLAYER_NAME + 1];
    if(strcmp(x_job, "biznes", false) == 0)
    {
        Business_AkceptujBiznes(playerid);
    }
    else if(strcmp(x_job, "mandat", true) == 0)
    {
        new policjant = GetPVarInt(playerid, "IdPolicjanta");
        if(GetPVarInt(playerid, "HaveMandat") == 0) return SendClientMessage(playerid, COLOR_GREY, "   Nikt nie dał ci mandatu !");
        if(IsPlayerConnected(policjant))
        {
            if(IsAPolicja(policjant))
            {
                new amount = GetPVarInt(playerid, "KwotaMandatu");
                if(kaska[playerid] < amount) return sendErrorMessage(playerid, "Nie stać Cie na zaplacenie mandatu");
                ZabierzKaseDone(playerid, amount);
			    DajKaseDone(policjant, amount);
                new str[128];
                format(str, sizeof(str), "Akceptowałeś mandat od %s o kwocie $%i!", GetNickEx(policjant), amount);
                SendClientMessage(playerid, COLOR_BLUE, str);
                format(str, sizeof(str), "%s akceptował mandat o kwocie $%i!", GetNickEx(playerid), amount);
                SendClientMessage(policjant, COLOR_BLUE, str);
				Log(payLog, WARNING, "%s zapłacił mandat %d$ wystawiony przez %s", GetPlayerLogName(playerid), amount, GetPlayerLogName(policjant));
            } else sendTipMessage(playerid, "Twój mandat wygasł!");
        } else sendTipMessage(playerid, "Twój mandat wygasł!");

        SetPVarInt(playerid, "IdPolicjanta", 0);
        SetPVarInt(playerid, "KwotaMandatu", 0);
        SetPVarInt(playerid, "HaveMandat", 0);
        return 1;
    }
    else if(strcmp(x_job,"wizytowka",true) == 0 || strcmp(x_job,"wizytowke",true) == 0 || strcmp(x_job,"wizytówka",true) == 0 || strcmp(x_job,"wizytówkę",true) == 0 || strcmp(x_job,"wizytówke",true) == 0)
    {
        new dawacz = GetPVarInt(playerid, "wizytowka");
        new nazwa[32];
        if(dawacz == -1)
        {
            sendErrorMessage(playerid, "Nikt nie oferował Ci wizytówki.");
            return 1;
        }
        
        if(!IsPlayerConnected(dawacz))
        {
            sendErrorMessage(playerid, "Gracz, który oferował Ci wizytówkę wyszedł.");
            return 1;
        }
        
        if(!CzyMaWolnySlotNaKontakt(playerid))
        {
            sendErrorMessage(playerid, "Osiągnąłeś maksymalną liczbę kontaktów.");
            return 1;
        }
		
        if(CzyKontaktIstnieje(playerid, GetPhoneNumber(dawacz)))
        {
            sendErrorMessage(playerid, "Ten numer już istnieje w Twoich kontaktach.");
            return 1;
        }
        
        if(!ProxDetectorS(10.0, playerid, dawacz))
        {
            sendErrorMessage(playerid, "Jesteś za daleko od gracza, który oferował Ci wizytówkę.");
            return 1;
        }
        
        format(string, sizeof(string), "* Akceptowałeś wizytówkę od %s, dodano nowy kontakt.", GetNick(dawacz));
        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
        format(string, sizeof(string), "* %s przyjął Twoją wizytówkę.", GetNick(playerid));
        
        format(string, sizeof(string), "* %s wręcza z uśmiechem wizytówkę %s, który chowa ją do kieszeni.", GetNick(dawacz), GetNick(playerid));
        ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        
        GetPVarString(playerid, "wizytowka-nazwa", nazwa, sizeof(nazwa));
        format(string, sizeof(string), "dodaj %d %s", GetPhoneNumber(dawacz), nazwa);
        SetPVarInt(playerid, "wizytowka", -1);
        RunCommand(playerid, "/kontakty",  string);
    }
    if(strcmp(x_job,"pojazd",true) == 0 || strcmp(x_job,"auto",true) == 0)
    {
        if(GraczDajacy[playerid] < 999)
        {
            if(IsPlayerConnected(GraczDajacy[playerid]))
            {
                if(kaska[playerid] > CenaDawanegoAuta[playerid] && CenaDawanegoAuta[playerid] > 0 && kaska[playerid] >= 1)
                {
                    new vehicle = GetPlayerVehicleID(GraczDajacy[playerid]);
                    if(vehicle == CarData[IDAuta[playerid]][c_ID])
                    {
                        if(CarData[IDAuta[playerid]][c_Owner] != PlayerInfo[GraczDajacy[playerid]][pUID])
                        {
                            GraczDajacy[playerid] = 0;
                            CenaDawanegoAuta[playerid] = 0;
                            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci sprzedaży !");
                            return 1;
                        }
                        GetPlayerName(playerid, sendername, sizeof(sendername));

                        if(CountPlayerCars(playerid) >= PlayerInfo[playerid][pCarSlots])
                        {
                            SendClientMessage(GraczDajacy[playerid], COLOR_GREY, " Gracz nie posiada wolnego slota.");
                            GraczDajacy[playerid] = 0;
                            CenaDawanegoAuta[playerid] = 0;
                            SendClientMessage(playerid, COLOR_GREY, " Nie posiadasz wolnego slota.");
                            return 1;
                        }
            
                        foreach(new i : Player)
                        {
                           if(PlayerInfo[i][pKluczeAuta] == IDAuta[playerid])
                            {
                                PlayerInfo[i][pKluczeAuta] = 0;
                            }
                        }
                        Car_MakePlayerOwner(playerid, IDAuta[playerid]);
                        Car_RemovePlayerOwner(GraczDajacy[playerid], IDAuta[playerid]);

                        new cena = CenaDawanegoAuta[playerid];
                        GetPlayerName(GraczDajacy[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(string, sizeof(string), "* Akceptowałeś sprzedaż %s od %s za %d. Wpisz /autopomoc aby zobaczyć nowe komendy!", VehicleNames[GetVehicleModel(vehicle)-400], giveplayer, cena);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "* %s akceptował sprzedaż twojego %s, zarabiasz %d.", sendername, VehicleNames[GetVehicleModel(vehicle)-400], cena);
                        SendClientMessage(GraczDajacy[playerid], COLOR_LIGHTBLUE, string);
                        Log(payLog, WARNING, "%s kupił od %s auto %s za %d$", GetPlayerLogName(playerid), GetPlayerLogName(GraczDajacy[playerid]), GetVehicleLogName(vehicle), cena);
                        
                        ZabierzKaseDone(playerid, cena);
                        DajKaseDone(GraczDajacy[playerid], cena);
                        RemovePlayerFromVehicleEx(GraczDajacy[playerid]);
                        GraczDajacy[playerid] = 999;
                        CenaDawanegoAuta[playerid] = 0;
                        return 1;
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zaoferował ci auta!");
                        return 1;
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Nie stać cię!");
                    return 1;
                }
            }
            return 1;
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci sprzedaży!");
            return 1;
        }
    }
    if(strcmp(x_job,"wymiana",true) == 0)
    {
        if(GraczWymieniajacy[playerid] < 999)
        {
            if(IsPlayerConnected(GraczWymieniajacy[playerid]))
            {
                if(kaska[playerid] > CenaWymienianegoAuta[playerid] && CenaWymienianegoAuta[playerid] > 0 && kaska[playerid] >= 1)
                {
                    if(GetPlayerVehicleID(GraczWymieniajacy[playerid]) == CarData[IDAuta[playerid]][c_ID])
                    {
                        if(CarData[IDAuta[playerid]][c_Owner] != PlayerInfo[GraczWymieniajacy[playerid]][pUID])
                        {
                            GraczWymieniajacy[playerid] = 0;
                            CenaWymienianegoAuta[playerid] = 0;
                            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci wymiany !");
                            return 1;
                        }
                        GetPlayerName(playerid, sendername, sizeof(sendername));

                        
                        if(!ProxDetectorS(10.0, playerid, GraczWymieniajacy[playerid])) return SendClientMessage(playerid, 0xFFC0CB, "Ten gracz jest za daleko !");
                        if(!IsPlayerInAnyVehicle(playerid))
                        {
                            SendClientMessage(playerid, COLOR_GREY, " Musisz być w pojeździe.");
                            return 1;
                        }
                        if(IDWymienianegoAuta[playerid] == 0)
                        {
                            SendClientMessage(playerid, COLOR_GREY, " Wyszedłeś z auta wymienianego.");
                            GraczWymieniajacy[playerid] = 999;
                            CenaWymienianegoAuta[playerid] = 0;
                            return 1;
                        }
                        
                        Car_RemovePlayerOwner(GraczWymieniajacy[playerid], IDAuta[playerid]);
                        Car_RemovePlayerOwner(playerid, VehicleUID[GetPlayerVehicleID(playerid)][vUID]);
                        
                        Car_MakePlayerOwner(playerid, IDAuta[playerid]);
                        Car_MakePlayerOwner(GraczWymieniajacy[playerid], VehicleUID[GetPlayerVehicleID(playerid)][vUID]);

                        GetPlayerName(GraczWymieniajacy[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(string, sizeof(string), "* Akceptowałeś wymianę %s od %s za %d. Wpisz /autopomoc aby zobaczyć nowe komendy!", VehicleNames[GetVehicleModel(GetPlayerVehicleID(GraczWymieniajacy[playerid]))-400], giveplayer, CenaWymienianegoAuta[playerid]);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "* %s akceptował wymianę twojego %s, zarabiasz %d.", sendername, VehicleNames[GetVehicleModel(GetPlayerVehicleID(GraczWymieniajacy[playerid]))-400], CenaWymienianegoAuta[playerid]);
                        SendClientMessage(GraczWymieniajacy[playerid], COLOR_LIGHTBLUE, string);

                        Log(payLog, WARNING, "%s auto %s wymiana aut z %s auto %s z dopłatą %d$", \
                            GetPlayerLogName(playerid), GetVehicleLogName(GetPlayerVehicleID(playerid)), \
                            GetPlayerLogName(GraczWymieniajacy[playerid]), GetVehicleLogName(GetPlayerVehicleID(GraczWymieniajacy[playerid])), \
                            CenaWymienianegoAuta[playerid]
                        );
                        ZabierzKaseDone(playerid, CenaWymienianegoAuta[playerid]);
                        DajKaseDone(GraczWymieniajacy[playerid], CenaWymienianegoAuta[playerid]);
                        RemovePlayerFromVehicleEx(GraczWymieniajacy[playerid]);
                        RemovePlayerFromVehicleEx(playerid);
                        GraczWymieniajacy[playerid] = 999;
                        CenaWymienianegoAuta[playerid] = 0;
                        return 1;
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zaoferował ci wymiany !");
                        return 1;
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Nie stać cię na wymianę !");
                    return 1;
                }
            }
            return 1;
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci wymiany !");
            return 1;
        }
    }
    else if(strcmp(x_job,"rozwod",true) == 0)
    {
        if(DivorceOffer[playerid] < 999)
        {
            if(IsPlayerConnected(DivorceOffer[playerid]))
            {
                if(ProxDetectorS(10.0, playerid, DivorceOffer[playerid]))
                {
                    GetPlayerName(DivorceOffer[playerid], giveplayer, sizeof(giveplayer));
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    format(string, sizeof(string), "* Akceptowałeś wniosek %s do rozwodu.", giveplayer);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                    format(string, sizeof(string), "* %s akceptował twój wniosek o rozwód.", sendername);
                    SendClientMessage(DivorceOffer[playerid], COLOR_LIGHTBLUE, string);
                    ClearMarriage(playerid);
                    ClearMarriage(DivorceOffer[playerid]);
                    PlayerInfo[playerid][pPbiskey] = 255;
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Gracz który wysłał ci papiery rozwodowe nie jest blisko ciebie !");
                    return 1;
                }
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie wysłał ci papierów rozwodowych !");
            return 1;
        }
    }
    else if(strcmp(x_job,"swiadek",true) == 0)
    {
        if(MarryWitnessOffer[playerid] < 999)
        {
            if(IsPlayerConnected(MarryWitnessOffer[playerid]))
            {
                if(ProxDetectorS(10.0, playerid, MarryWitnessOffer[playerid]))
                {
                    GetPlayerName(MarryWitnessOffer[playerid], giveplayer, sizeof(giveplayer));
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    format(string, sizeof(string), "* Akceptowałeś prośbę %s aby być świadkiem.", giveplayer);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                    format(string, sizeof(string), "* %s zaakceptował twoją prośbę aby był świadkiem.", sendername);
                    SendClientMessage(MarryWitnessOffer[playerid], COLOR_LIGHTBLUE, string);
                    MarryWitness[MarryWitnessOffer[playerid]] = playerid;
                    MarryWitnessOffer[playerid] = 999;
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Gracz który prosi cię o bycie świadkiem jest za daleko !");
                    return 1;
                }
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie poprosił cię o bycie świadkiem !");
            return 1;
        }
    }
    else if(strcmp(x_job,"slub",true) == 0)
    {
        if(ProposeOffer[playerid] < 999)
        {
            if(!PlayerToPoint(10.0, playerid, 1964.2332,-369.1353,1093.7289) && !PlayerToPoint(10.0, playerid, -2482.6416,2406.8088,17.1094) && !PlayerToPoint(10.0, playerid, 2256.8000488281,-43.900001525879,26.5))
            {
                SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś w kosciele LS / Bay Side / Palomino Creek!");
                return 1;
            }
            if(IsPlayerConnected(ProposeOffer[playerid]))
            {
                if(ProxDetectorS(10.0, playerid, ProposeOffer[playerid]))
                {
                    if(MarryWitness[ProposeOffer[playerid]] == 999)
                    {
                        SendClientMessage(playerid, COLOR_GREY, "   Do ślubu potrzebny jest świadek !");
                        return 1;
                    }
                    if(IsPlayerConnected(MarryWitness[ProposeOffer[playerid]]))
                    {
                        if(ProxDetectorS(12.0, ProposeOffer[playerid], MarryWitness[ProposeOffer[playerid]]))
                        {
                            GetPlayerName(ProposeOffer[playerid], giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            format(string, sizeof(string), "* Akceptowałeś ślub z %s.", giveplayer);
                            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                            format(string, sizeof(string), "* %s Akceptowała ślub z tobą.", sendername);
                            SendClientMessage(ProposeOffer[playerid], COLOR_LIGHTBLUE, string);
                            format(string, sizeof(string), "Ksiądz: %s czy chcesz aby %s został twoim mężem? (wpisz 'tak', cokolwiek innego anuluje ślub)", sendername, giveplayer);
                            SendClientMessage(playerid, COLOR_WHITE, string);
                            MarriageCeremoney[playerid] = 1;
                            ProposedTo[ProposeOffer[playerid]] = playerid;
                            GotProposedBy[playerid] = ProposeOffer[playerid];
                            MarryWitness[ProposeOffer[playerid]] = 999;
                            ProposeOffer[playerid] = 999;
                            return 1;
                        }
                        else
                        {
                            SendClientMessage(playerid, COLOR_GREY, "   Świadek jest za daleko !");
                            return 1;
                        }
                    }
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Gracz z którym bierzesz ślub jest za daleko !");
                    return 1;
                }
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie chce się z tobą ożenić !");
            return 1;
        }
    }
    else if(strcmp(x_job,"ticket",true) == 0 || strcmp(x_job,"mandat",true) == 0)
    {
        if(TicketOffer[playerid] < 999)
        {
            if(IsPlayerConnected(TicketOffer[playerid]))
            {
                if (ProxDetectorS(5.0, playerid, TicketOffer[playerid]))
                {
                    if(TicketMoney[playerid] < kaska[playerid] && TicketMoney[playerid] > 0)
                    {
                        GetPlayerName(TicketOffer[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        new karne = GetPVarInt(playerid, "mandat_punkty");
                        format(string, sizeof(string), "* Zapłaciłeś mandat w wysokości $%d Policjantowi %s.", TicketMoney[playerid], giveplayer);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        if(karne>0) {
                            format(string, sizeof(string), "* Dostałeś też %d PK", karne);
                            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                            PlayerInfo[playerid][pPK] += karne;
                            if(PlayerInfo[playerid][pPK] > 24) 
                            {
                                format(string, sizeof(string), "* Przekroczyłeś limit 24 PK. Tracisz prawo jazdy");
                                SendClientMessage(playerid, COLOR_RED, string);
                                //86400 - jeden dzien
                                PlayerInfo[playerid][pPK] = 0;
                                PlayerInfo[playerid][pCarLic] = 0;
                                format(string, sizeof(string), "* %s stracił prawo jazdy z powodu przekroczenia limitu 24 PK", sendername);
                                SendClientMessage(TicketOffer[playerid], COLOR_RED, string);
                            }
                        }

                        //format(string, sizeof(string), "* %s zapłacił mandat $%d. Otrzymujesz połowę tej kwoty.", sendername, TicketMoney[playerid]);
                        SetPVarInt(playerid, "mandat_punkty", 0);
                        ZabierzKaseDone(playerid, TicketMoney[playerid]);
                        new depo2 = floatround(((TicketMoney[playerid]/100) * 80), floatround_round); //sejf
                        new depo3 = floatround(((TicketMoney[playerid]/100) * 20), floatround_round); //pd
                        format(string, sizeof(string), "* %s zapłacił mandat $%d. Otrzymujesz $%d", sendername, TicketMoney[playerid], depo3);
                        SendClientMessage(TicketOffer[playerid], COLOR_LIGHTBLUE, string);
                        DajKaseDone(TicketOffer[playerid], depo3);
                        Sejf_Add(1, depo2);
                        TicketOffer[playerid] = 999;
                        TicketMoney[playerid] = 0;
                        return 1;
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Nie stać cię!");
                        return 1;
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Policjant nie jest przy tobie !");
                    return 1;
                }
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie dał ci mandatu !");
            return 1;
        }
    }
    else if(strcmp(x_job,"boxing",true) == 0 || strcmp(x_job,"box",true) == 0 || strcmp(x_job,"boks",true) == 0)
    {
        if(BoxOffer[playerid] < 999)
        {
            if(IsPlayerConnected(BoxOffer[playerid]))
            {
                new points;
                new mypoints;
                GetPlayerName(BoxOffer[playerid], giveplayer, sizeof(giveplayer));
                GetPlayerName(playerid, sendername, sizeof(sendername));
                new level = PlayerInfo[BoxOffer[playerid]][pBoxSkill];
                if(level >= 0 && level <= 50) { points = 40; }
                else if(level >= 51 && level <= 100) { points = 50; }
                else if(level >= 101 && level <= 200) { points = 60; }
                else if(level >= 201 && level <= 400) { points = 70; }
                else if(level >= 401) { points = 80; }
                if(PlayerInfo[playerid][pJob] == 12)
                {
                    new clevel = PlayerInfo[playerid][pBoxSkill];
                    if(clevel >= 0 && clevel <= 50) { mypoints = 40; }
                    else if(clevel >= 51 && clevel <= 100) { mypoints = 50; }
                    else if(clevel >= 101 && clevel <= 200) { mypoints = 60; }
                    else if(clevel >= 201 && clevel <= 400) { mypoints = 70; }
                    else if(clevel >= 401) { mypoints = 80; }
                }
                else
                {
                    mypoints = 30;
                }
                format(string, sizeof(string), "* Akceptowałeś walkę bokserską z %s, zaczynasz z %d Punktami Życia.",giveplayer,mypoints);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                format(string, sizeof(string), "* %s akceptował walkę bokserską z tobą, zaczynasz z %d Punktami Życia.",sendername,points);
                SendClientMessage(BoxOffer[playerid], COLOR_LIGHTBLUE, string);
                SetPlayerHealth(playerid, mypoints);
                SetPlayerHealth(BoxOffer[playerid], points);
                SetPlayerInterior(playerid, 5); SetPlayerInterior(BoxOffer[playerid], 5);
                SetPlayerPos(playerid, 762.9852,2.4439,1001.5942); SetPlayerFacingAngle(playerid, 131.8632);
                SetPlayerPos(BoxOffer[playerid], 758.7064,-1.8038,1001.5942); SetPlayerFacingAngle(BoxOffer[playerid], 313.1165);
                TogglePlayerControllable(playerid, 0); TogglePlayerControllable(BoxOffer[playerid], 0);
                GameTextForPlayer(playerid, "~r~Czekaj", 3000, 1); GameTextForPlayer(BoxOffer[playerid], "~r~Czekaj", 3000, 1);
                new name[MAX_PLAYER_NAME + 1];
                new dstring[MAX_PLAYER_NAME + 1];
                new wstring[MAX_PLAYER_NAME + 1];
                GetPlayerName(playerid, name, sizeof(name));
                format(dstring, sizeof(dstring), "%s", name);
                strmid(wstring, dstring, 0, strlen(dstring), 255);
                if(strcmp(Titel[TitelName] ,wstring, true ) == 0 )
                {
                    format(string, sizeof(string), "Boks News: Mistrz Bokserski %s walczy z %s, za 60 sekund (w Siłowni Grove Street).",  sendername, giveplayer);
                    OOCOff(COLOR_WHITE,string);
                    TBoxer = playerid;
                    BoxDelay = 60;
                }
                GetPlayerName(BoxOffer[playerid], name, sizeof(name));
                format(dstring, sizeof(dstring), "%s", name);
                strmid(wstring, dstring, 0, strlen(dstring), 255);
                if(strcmp(Titel[TitelName] ,wstring, true ) == 0 )
                {
                    format(string, sizeof(string), "Boks News: Mistrz Bokserski %s walczy z %s, za 60 sekund (w Siłowni Grove Street).",  giveplayer, sendername);
                    OOCOff(COLOR_WHITE,string);
                    TBoxer = BoxOffer[playerid];
                    BoxDelay = 60;
                }
                BoxWaitTime[playerid] = 1; BoxWaitTime[BoxOffer[playerid]] = 1;
                if(BoxDelay < 1) { BoxDelay = 20; }
                InRing = 1;
                Boxer1 = BoxOffer[playerid];
                Boxer2 = playerid;
                PlayerBoxing[playerid] = 1;
                PlayerBoxing[BoxOffer[playerid]] = 1;
                BoxOffer[playerid] = 999;
                return 1;
            }
            return 1;
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferuje ci walki bokserskiej !");
            return 1;
        }
    }
    else if(strcmp(x_job,"taxi",true) == 0)
    {
        if(TransportDuty[playerid] != 1)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś taksówkrzem !");
            return 1;
        }
        if(TaxiCallTime[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Masz już zlecenie !");
            return 1;
        }
        if(PlayerOnMission[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Jesteś na misji, nie możesz używać tej komendy !");
            return 1;
        }
        if(TaxiCall < 999)
        {
            if(IsPlayerConnected(TaxiCall))
            {
                GetPlayerName(playerid, sendername, sizeof(sendername));
                GetPlayerName(TaxiCall, giveplayer, sizeof(giveplayer));
                format(string, sizeof(string), "* Akceptowałeś zlecenie od %s, jedź do czerwonego markera.",giveplayer);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                format(string, sizeof(string), "* Taksówkarz %s akceptował twoje zlecenie, czekaj na niego i nie ruszaj się z miejsca.",sendername);
                SendClientMessage(TaxiCall, COLOR_LIGHTBLUE, string);
                GameTextForPlayer(playerid, "~w~Jedz do~n~~r~czerwonego punktu", 5000, 1);
                TaxiCallTime[playerid] = 1;
                TaxiAccepted[playerid] = TaxiCall;
                TaxiCall = 999;
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zamawiał taksówki !");
            return 1;
        }
    }
    else if(strcmp(x_job, "restauracja", true) == 0)
    {
        if(!GroupPlayerDutyPerm(playerid, PERM_RESTAURANT) || !OnDuty[playerid])
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś pracownikiem restauracji na służbie !");
            return 1;
        }
        if(RestaurantCallTime[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Masz już zlecenie !");
            return 1;
        }
        if(PlayerOnMission[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Jesteś na misji, nie możesz używać tej komendy !");
            return 1;
        }
        if(RestaurantCall < 999)
        {
            if(IsPlayerConnected(RestaurantCall))
            {
                GetPlayerName(playerid, sendername, sizeof(sendername));
                GetPlayerName(RestaurantCall, giveplayer, sizeof(giveplayer));
                format(string, sizeof(string), "* Akceptowałeś zlecenie od %s, idź do niego i zrealizuj zamówienie.", giveplayer);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                format(string, sizeof(string), "* Pracownik restauracji %s akceptował twoje zgłoszenie, oczekuj na niego.", sendername);
                SendClientMessage(RestaurantCall, COLOR_LIGHTBLUE, string);
                new Float:X, Float:Y, Float:Z;
                GetPlayerPos(RestaurantCall, X, Y, Z);
                SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                GameTextForPlayer(playerid, "~w~Idź do~n~~r~czerwonego punktu", 5000, 1);
                RestaurantCallTime[playerid] = 1;
                RestaurantAccepted[playerid] = RestaurantCall;
                RestaurantCall = 999;
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zamawiał restauracji !");
            return 1;
        }
    }
    else if(strcmp(x_job,"heli",true) == 0)
    {
        if(TransportDuty[playerid] != 1)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś pilotem !");
            return 1;
        }
        new newcar = GetPlayerVehicleID(playerid);
        if(!IsAPlane(newcar))
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie pilotujesz helikoptera !");
            return 1;
        }
        if(TaxiCallTime[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Masz już zlecenie !");
            return 1;
        }
        if(PlayerOnMission[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Jesteś na misji, nie możesz używać tej komendy !");
            return 1;
        }
        if(HeliCall < 999)
        {
            if(IsPlayerConnected(HeliCall))
            {
                GetPlayerName(playerid, sendername, sizeof(sendername));
                GetPlayerName(HeliCall, giveplayer, sizeof(giveplayer));
                format(string, sizeof(string), "* Akceptowałeś zlecenie od %s, leć do czerwonego markera.",giveplayer);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                format(string, sizeof(string), "* Pilot %s akceptował twoje zlecenie, czekaj na niego i nie ruszaj się z miejsca.",sendername);
                SendClientMessage(HeliCall, COLOR_LIGHTBLUE, string);
                GameTextForPlayer(playerid, "~w~Lec do~n~~r~czerwonego punktu", 5000, 1);
                new Float:X, Float:Y, Float:Z;
                GetPlayerPos(HeliCall, X, Y, Z);
                SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                TaxiCallTime[playerid] = 1;
                TaxiAccepted[playerid] = HeliCall;
                HeliCall = 999;
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zamawiał helikoptera !");
            return 1;
        }
    }
    else if(strcmp(x_job,"bus",true) == 0)
    {
        if(TransportDuty[playerid] != 2)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś kierowcą autobusu na służbie !");
            return 1;
        }
        if(BusCallTime[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Masz już zlecenie !");
            return 1;
        }
        if(PlayerOnMission[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Jesteś na misji, nie możesz używać tej komendy !");
            return 1;
        }
        if(PlayerInfo[playerid][pJob] == 10 && PlayerInfo[playerid][pCarSkill] < 400)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Potrzebujesz 5 skilla kierowcy autobusu aby móc odbierać wezwania !");
            return 1;
        }
        if(BusCall < 999)
        {
            if(IsPlayerConnected(BusCall))
            {
                GetPlayerName(playerid, sendername, sizeof(sendername));
                GetPlayerName(BusCall, giveplayer, sizeof(giveplayer));
                format(string, sizeof(string), "* Akceptowałeś zlecenie od %s, jedź do czerwonego markera.",giveplayer);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                format(string, sizeof(string), "* Kierowca Autobusu %s akceptował twoje wezwanie, czekaj na niego i nie ruszaj się z miejsca.",sendername);
                SendClientMessage(BusCall, COLOR_LIGHTBLUE, string);
                new Float:X,Float:Y,Float:Z;
                GetPlayerPos(BusCall, X, Y, Z);
                SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                GameTextForPlayer(playerid, "~w~Jedz do~n~~r~czerwonego punktu", 5000, 1);
                BusCallTime[playerid] = 1;
                BusAccepted[playerid] = BusCall;
                BusCall = 999;
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie dzwonił po autobus !");
            return 1;
        }
    }
    else if(strcmp(x_job,"medic",true) == 0 || strcmp(x_job,"medyk",true) == 0)
    {
        if(IsPlayerInGroup(playerid, 4) || PlayerInfo[playerid][pLider] == 4)
        {
            if(MedicCallTime[playerid] > 0)
            {
                SendClientMessage(playerid, COLOR_GREY, "   Masz już zlecenie !");
                return 1;
            }
            if(PlayerOnMission[playerid] > 0)
            {
                SendClientMessage(playerid, COLOR_GREY, "   Jesteś na misji, nie możesz używać tej koemndy !");
                return 1;
            }
            if(MedicCall < 999)
            {
                if(IsPlayerConnected(MedicCall))
                {
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    GetPlayerName(MedicCall, giveplayer, sizeof(giveplayer));
                    format(string, sizeof(string), "* Akceptowałeś zlecenie od %s, masz 30 sekund na dojechanie tam.",giveplayer);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Po 30 sekundach marker zniknie.");
                    format(string, sizeof(string), "* Medyk %s akceptował twoje zlecenie, NIE RUSZAJ SIĘ z miejsca.",sendername);
                    SendClientMessage(MedicCall, COLOR_LIGHTBLUE, string);
                    new Float:X,Float:Y,Float:Z;
                    GetPlayerPos(MedicCall, X, Y, Z);
                    SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                    GameTextForPlayer(playerid, "~w~Medyku~n~~r~Jedz do celu", 5000, 1);
                    MedicCallTime[playerid] = 1;
                    MedicCall = 999;
                    return 1;
                }
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "   Nikt nie potrzebuje medyka !");
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś lekarzem !");
            return 1;
        }
    }
    else if(strcmp(x_job,"mechanic",true) == 0 || strcmp(x_job,"mechanik",true) == 0)
    {
        if(PlayerInfo[playerid][pJob] == 7 || IsAMechazordWarsztatowy(playerid))
        {
            
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie jesteś mechanikiem !");
            return 1;
        }
        if(MechanicCallTime[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Masz już zlecenie !");
            return 1;
        }
        if(PlayerOnMission[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "   Jesteś na misji, nie możesz używać tej komendy !");
            return 1;
        }
        if(MechanicCall < 999)
        {
            if(IsPlayerConnected(MechanicCall))
            {
                GetPlayerName(playerid, sendername, sizeof(sendername));
                GetPlayerName(MechanicCall, giveplayer, sizeof(giveplayer));
                format(string, sizeof(string), "* Akceptowałeś zlecenie od %s, masz 60 sekund aby tam dojechać.",giveplayer);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Po 60 sekundach marker zniknie.");
                format(string, sizeof(string), "* Mechanik %s akceptował twoje zlecenie, czekaj i nie ruszaj się z miejsca.",sendername);
                SendClientMessage(MechanicCall, COLOR_LIGHTBLUE, string);
                new Float:X,Float:Y,Float:Z;
                GetPlayerPos(MechanicCall, X, Y, Z);
                SetPlayerCheckpoint(playerid, X, Y, Z, 5);
                GameTextForPlayer(playerid, "~w~Jedz do~n~~r~czerownego markera", 5000, 1);
                MechanicCallTime[playerid] = 1;
                MechanicCall = 999;
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zadzwonił po mechanika !");
            return 1;
        }
    }
    else if(strcmp(x_job,"job",true) == 0 || strcmp(x_job,"praca",true) == 0)//prace dorywcze
    {
        if(GettingJob[playerid] > 0)
        {
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Podpisałeś umowe na 2,5 godziny, zaczynasz nową pracę.");
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Gratulujemy nowej pracy, wpisz /pomoc aby zobaczyć nowe komendy.");
            PlayerInfo[playerid][pJob] = GettingJob[playerid];
            Log(serverLog, WARNING, "Gracz %s dołączył do pracy %d.", GetPlayerLogName(playerid), PlayerInfo[playerid][pJob]);
            GettingJob[playerid] = 0;
            return 1;
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   W tym miejscu nie można wziąć pracy!");
            return 1;
        }
    }
    else if(strcmp(x_job,"refill",true) == 0 || strcmp(x_job,"tankowanie",true) == 0)
    {
        if(RefillOffer[playerid] < 999)
        {
            if(IsPlayerConnected(RefillOffer[playerid]) && IsPlayerInAnyVehicle(playerid))
            {
                if(kaska[playerid] > RefillPrice[playerid] && RefillPrice[playerid] > 0)
                {
                    GetPlayerName(RefillOffer[playerid], giveplayer, sizeof(giveplayer));
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    new fuel;
                    new vehicleid = GetPlayerVehicleID(playerid);
                    if(RefillOffer[playerid] != playerid)
                    {
                        PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
                        PlayerPlaySound(RefillOffer[playerid], 1085, 0.0, 0.0, 0.0);
                        PlayerInfo[RefillOffer[playerid]][pMechSkill] ++;
                        SendClientMessage(RefillOffer[playerid], COLOR_GREY, "Skill +1");
                        if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 50)
                        { SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 2, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                        else if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 100)
                        { SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 3, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                        else if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 200)
                        { SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 4, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                        else if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 400)
                        { SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 5, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                    }
                    new level = PlayerInfo[RefillOffer[playerid]][pMechSkill];
                    if(level >= 0 && level <= 50)
                    { fuel = 15; }
                    else if(level >= 51 && level <= 100)
                    { fuel = 40; }
                    else if(level >= 101 && level <= 200)
                    { fuel = 60; }
                    else if(level >= 201 && level <= 400)
                    { fuel = 80; }
                    else if(level >= 401)
                    { fuel = 100; }
                    format(string, sizeof(string), "* Twój pojazd został dotankowany o %d% przez mechanika %s, koszt $%d.",fuel,giveplayer,RefillPrice[playerid]);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                    format(string, sizeof(string), "* Zatankowałeś pojazd %s o %d% paliwa, doliczono ci $%d do wypłaty.",sendername,fuel,RefillPrice[playerid]);
                    SendClientMessage(RefillOffer[playerid], COLOR_LIGHTBLUE, string);
                    format(string, sizeof(string),"* Mechanik %s wyciąga kanister i dotankowuje auto %s.",giveplayer,VehicleNames[GetVehicleModel(vehicleid)-400]);
                    ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    format(string, sizeof(string), "* Bak napełniony o %d jednostek paliwa (( %s ))", fuel, giveplayer);
                    ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    ZabierzKaseDone(playerid, RefillPrice[playerid]);
                    DajKaseDone(RefillOffer[playerid], RefillPrice[playerid]);
                    if(Gas[vehicleid] < 110)
                    {
                        Gas[vehicleid] += fuel;
                    }
                    RefillOffer[playerid] = 999;
                    RefillPrice[playerid] = 0;
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Nie możesz akceptować tankowania !");
                    return 1;
                }
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci tankowania !");
            return 1;
        }
    }
    else if(strcmp(x_job,"live",true) == 0 || strcmp(x_job,"wywiad",true) == 0)
    {
        if(LiveOffer[playerid] < 999)
        {
            if(IsPlayerConnected(LiveOffer[playerid]))
            {
                if (ProxDetectorS(5.0, playerid, LiveOffer[playerid]) || (Mobile[playerid] == LiveOffer[playerid] && Callin[playerid] == CALL_PLAYER))
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wywiad rozpoczęty, wszystko co teraz powiesz będzie na antenie.");
                    SendClientMessage(LiveOffer[playerid], COLOR_LIGHTBLUE, "* Rozpocząłeś wywiad. Aby go zakończyć ponownie wpisz /wywiad.");
                    TalkingLive[playerid] = LiveOffer[playerid];
                    TalkingLive[LiveOffer[playerid]] = playerid;
                    LiveOffer[playerid] = 999;
                    
                    if(Mobile[playerid] == LiveOffer[playerid] && Callin[playerid] == CALL_PLAYER)
                    {
                        Callin[Mobile[playerid]] = CALL_LIVE;
                        Callin[playerid] = CALL_LIVE;
                    }
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "   Jesteś za daleko od reportera !");
                    return 1;
                }
            }
            return 1;
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zaoferował ci wywiadu !");
            return 1;
        }
    }
    else if(strcmp(x_job, "uwolnienie", true) == 0 || strcmp(x_job, "wolnosc", true) == 0)
    {
        new money = OfferPrice[playerid];
        //SetPVarInt(playerid, "idPrawnika", playerid);
        if(kaska[playerid] >= money)
        {
            if(OfferPlayer[playerid] == -1)
            {
                sendErrorMessage(playerid, "Nikt nie oferował Ci uwolnienia z więzienia!"); 
                return 1;
            }
            format(string, sizeof(string), "* Uwolniłeś %s z więzienia za kwotę %d$", GetNick(playerid), money);
            SendClientMessage(OfferPlayer[playerid], COLOR_LIGHTBLUE, string);
            
            format(string, sizeof(string), "* Zostałeś uwolniony przez prawnika %s za kwotę %d$", GetNick(OfferPlayer[playerid]), money);
            SendClientMessage(playerid , COLOR_LIGHTBLUE, string);
            
            //Czynności
            PlayerInfo[playerid][pJailTime] = 1;
            ZabierzKaseDone(playerid, money);
            DajKaseDone(OfferPlayer[playerid], money);
            
            //skill
            PlayerInfo[OfferPlayer[playerid]][pLawSkill] +=2;
            SendClientMessage(OfferPlayer[playerid], COLOR_GRAD2, "Skill +2");
            if(PlayerInfo[OfferPlayer[playerid]][pLawSkill] == 50)
            { SendClientMessage(OfferPlayer[playerid], COLOR_YELLOW, "* Twoje umiejętności prawnika wynoszą teraz 2, Możesz taniej zbijać WL."); }
            else if(PlayerInfo[OfferPlayer[playerid]][pLawSkill] == 100)
            { SendClientMessage(OfferPlayer[playerid], COLOR_YELLOW, "* Twoje umiejętności prawnika wynoszą teraz 3, Możesz taniej zbijać WL."); }
            else if(PlayerInfo[OfferPlayer[playerid]][pLawSkill] == 200)
            { SendClientMessage(OfferPlayer[playerid], COLOR_YELLOW, "* Twoje umiejętności prawnika wynoszą teraz 4, Możesz taniej zbijać WL."); }
            else if(PlayerInfo[OfferPlayer[playerid]][pLawSkill] == 400)
            { SendClientMessage(OfferPlayer[playerid], COLOR_YELLOW, "* Twoje umiejętności prawnika wynoszą teraz 5, Możesz taniej zbijać WL."); }
            
            //zerowanie zmiennych 2
            ApprovedLawyer[OfferPlayer[playerid]] = 0;
            WantLawyer[playerid] = 0;
            CallLawyer[playerid] = 0;
            JailPrice[playerid] = 0;
            OfferPrice[playerid] = 0;
            LawyerOffer[playerid] = 0;
            OfferPlayer[playerid] = -1;
        }
        else
        {
            sendErrorMessage(playerid, "Nie masz takiej kwoty!"); 
            return 1;
        }
        
    }
    else if(strcmp(x_job,"bodyguard",true) == 0 || strcmp(x_job,"ochrona",true) == 0)
    {
        if(GuardOffer[playerid] < 999)
        {
            if(kaska[playerid] > GuardPrice[playerid] && GuardPrice[playerid] > 0)
            {
                if(IsPlayerConnected(GuardOffer[playerid]))
                {
                    new giveplayerid;
                    giveplayerid = GuardOffer[playerid];
                    GetPlayerName(GuardOffer[playerid], giveplayer, sizeof(giveplayer));
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    format(string, sizeof(string), "* Akceptowałeś ochronę, zapłaciłeś $%d ochroniarzowi %s.",GuardPrice[playerid],giveplayer);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                    format(string, sizeof(string), "* %s akceptował twoją oferte ochrony, $%d zostanie doliczone do twojej wypłaty.",sendername,GuardPrice[playerid]);
                    SendClientMessage(GuardOffer[playerid], COLOR_LIGHTBLUE, string);
                    //PlayerInfo[GuardOffer[playerid]][pPayCheck] += GuardPrice[playerid];
                    DajKaseDone(giveplayerid, GuardPrice[playerid]);
                    ZabierzKaseDone(playerid, GuardPrice[playerid]);
                    SetPlayerArmour(playerid, 100);
                    sendTipMessage(playerid, "Dostałeś kamizelkę kuloodporną od ochroniarza.");
                    Log(payLog, WARNING, "%s kupił kamizelkę od %s za $%d", GetPlayerLogName(playerid), GetPlayerLogName(GuardOffer[playerid]), GuardPrice[playerid]);
                    SendMessageToAdmin(sprintf("%s kupił kamizelkę od %s za $%d", GetNickEx(playerid), GetNickEx(GuardOffer[playerid]), GuardPrice[playerid]), COLOR_RED);
                    GuardOffer[playerid] = 999;
                    GuardPrice[playerid] = 0;
                    return 1;
                }
                return 1;
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "   Nie możesz zaakceptować ochrony !");
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zaoferował ci ochrony !");
            return 1;
        }
    }
    else if(strcmp(x_job,"drugs",true) == 0 || strcmp(x_job,"dragi",true) == 0)
    {
        if(DrugOffer[playerid] < 999)
        {
            if(kaska[playerid] > DrugPrice[playerid] && DrugPrice[playerid] > 0)
            {
                if(PlayerInfo[playerid][pDrugs] < 7)
                {
                    if(IsPlayerConnected(DrugOffer[playerid]))
                    {
                        GetPlayerName(DrugOffer[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(string, sizeof(string), "* Kupiłeś %d gram za $%d od Dilera Dragów %s. Aby je wziąć wpisz /wezdragi.",DrugGram[playerid],DrugPrice[playerid],giveplayer);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "* %s kupił od ciebie %d gram, $%d zostanie dodane do twojej wypłaty.",sendername,DrugGram[playerid],DrugPrice[playerid]);
                        SetPVarInt(DrugOffer[playerid], "wydragowany", 60);
                        SendClientMessage(DrugOffer[playerid], COLOR_LIGHTBLUE, string);
                        //
                        format(string, sizeof(string), "%s kupił dragi za $%d od %s", sendername, DrugPrice[playerid], giveplayer);
                        ABroadCast(COLOR_YELLOW,string,1);
                        Log(payLog, WARNING, "%s kupił od %s paczkę %d narkotyków za %d$", GetPlayerLogName(playerid), GetPlayerLogName(DrugOffer[playerid]), DrugGram[playerid], DrugPrice[playerid]);
                        //
                        PlayerInfo[DrugOffer[playerid]][pPayCheck] += DrugPrice[playerid];
                        PlayerInfo[DrugOffer[playerid]][pDrugsSkill] ++;
                        ZabierzKaseDone(playerid, DrugPrice[playerid]);
                        PlayerInfo[playerid][pDrugs] += DrugGram[playerid];
                        PlayerInfo[DrugOffer[playerid]][pDrugs] -= DrugGram[playerid];
                        if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 50)
                        { SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności dilera dragów wynoszą teraz 2, możesz kupowac więcej dragów w melinie."); }
                        else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 100)
                        { SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności dilera dragów wynoszą teraz 3, możesz kupowac więcej dragów w melinie."); }
                        else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 200)
                        { SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności dilera dragów wynoszą teraz 4, możesz kupowac więcej dragów w melinie."); }
                        else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 400)
                        { SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności dilera dragów wynoszą teraz 5, możesz kupowac więcej dragów w melinie."); }
                        DrugOffer[playerid] = 999;
                        DrugPrice[playerid] = 0;
                        DrugGram[playerid] = 0;
                        return 1;
                    }
                    return 1;
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Masz już za dużo narkotyków, użyj ich najpierw !");
                    return 1;
                }
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz zakupić narkotyków !");
                return 1;
            }
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nikt nie oferował ci sprzedaży narkotyków !");
            return 1;
        }
    }
    else if(strcmp(x_job,"sex",true) == 0)
    {
        if(SexOffer[playerid] < 999)
        {
            if(kaska[playerid] > SexPrice[playerid] && SexPrice[playerid] > 0)
            {
                if (IsPlayerConnected(SexOffer[playerid]))
                {
                    new Car = GetPlayerVehicleID(playerid);
                    if(IsPlayerInAnyVehicle(playerid) && IsPlayerInVehicle(SexOffer[playerid], Car))
                    {
                        GetPlayerName(SexOffer[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(string, sizeof(string), "* Uprawiasz ostry sex z dziwką %s, za $%d.", giveplayer, SexPrice[playerid]);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        SetPVarInt(SexOffer[playerid], "wysekszony", 120);
                        format(string, sizeof(string), "* %s uprawia z tobą sex. $%d zostanie dodane do twojej wypłaty.", sendername, SexPrice[playerid]);
                        SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, string);
                        PlayerInfo[SexOffer[playerid]][pPayCheck] += SexPrice[playerid];
                        PlayerInfo[SexOffer[playerid]][pSexSkill] ++;
                        //
                        Log(payLog, WARNING, "%s uprawiał sex z %s za $%d", GetPlayerLogName(playerid), GetPlayerLogName(SexOffer[playerid]), SexPrice[playerid]);
                        //
                        ZabierzKaseDone(playerid, SexPrice[playerid]);
                        if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 50)
                        { SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności prostytutki wynoszą teraz 2, Możesz oferować teraz lepszy sex (więcej życia) i trudniej sie zarazić."); }
                        else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 100)
                        { SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności prostytutki wynoszą teraz 3, Możesz oferować teraz lepszy sex (więcej życia) i trudniej sie zarazić."); }
                        else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 200)
                        { SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności prostytutki wynoszą teraz 4, Możesz oferować teraz lepszy sex (więcej życia) i trudniej sie zarazić."); }
                        else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 400)
                        { SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności prostytutki wynoszą teraz 5, Możesz oferować teraz lepszy sex (więcej życia) i trudniej sie zarazić."); }
                        
                        if(HasItemType(playerid, ITEM_TYPE_CONDOM) == -1)
                        {
                            new Float:health, Float:Ahealth, Float:hp;
                            new level = PlayerInfo[SexOffer[playerid]][pSexSkill];
                            if(level >= 0 && level <= 50) hp = 20;
                            else if(level >= 51 && level <= 100) hp = 40;
                            else if(level >= 101 && level <= 200) hp = 60;
                            else if(level >= 201 && level <= 400) hp = 80;
                            else if(level >= 401)
                            {
                                hp = 100;
                                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Twoje umiejętności prostytutki są tak wysokie że dajesz wysokie HP i nie dajesz chorób.");
                                SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* Umiejętność dziwki są tak wysokie że dostajesz duże HP i zero chorób.");
                                return 1;
                            }
                            GetPlayerHealth(playerid, health);
                            GetPlayerArmour(playerid, Ahealth);
                            new actualhp = floatround(health, floatround_tozero);
                            new actualap = floatround(Ahealth, floatround_tozero);
                            if((actualhp + hp) < 100) 
                            {
                                SetPlayerHealth(playerid, actualhp + hp); 
                            }
                            else
                            {
                                SetPlayerArmour(playerid, actualap + hp);  
                            }
                            SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("* Dodano ci %d HP/Pancerza z powodu sexu.", hp));
                            if(random(20) == 1)//5% szans na zarażenie
                            {
                                InfectOrDecreaseImmunity(playerid, HIV);
                            }

                            //TODO: przenoszenie chorób drogą płciową
                        }
                        else
                        {
                            new condom = HasItemType(playerid, ITEM_TYPE_CONDOM);
                            SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* Ten gracz używa kondom.");
                            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Użyłeś kondom.");
                            Item_Delete(condom);
                        }
                        SexOffer[playerid] = 999;
                        return 1;
                    }
                    else
                    {
                        sendTipMessageEx(playerid, COLOR_GREY, "Ty i dziwka nie jesteście w samochodzie !");
                        return 1;
                    }
                }//Connected or not
                return 1;
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Nie stać cię !");
                return 1;
            }
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nikt nie oferował ci sexu !");
            return 1;
        }
    }
    else if(strcmp(x_job,"naprawe",true) == 0 || strcmp(x_job,"naprawa",true) == 0)
    {
        if(RepairOffer[playerid] < 999)
        {
            if(kaska[playerid] > RepairPrice[playerid] && RepairPrice[playerid] > 0)
            {
                if(IsPlayerInAnyVehicle(playerid))
                {
                    if(IsPlayerConnected(RepairOffer[playerid]))
                    {
                        if(ProxDetectorS(10.5, playerid, RepairOffer[playerid]))
                        {
                            GetPlayerName(RepairOffer[playerid], giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            RepairCar[playerid] = GetPlayerVehicleID(playerid);
                            RepairVehicle(RepairCar[playerid]);
                            SetVehicleHealth(RepairCar[playerid], CarData[VehicleUID[RepairCar[playerid]][vUID]][c_MaxHP]);
                        
                            CarData[VehicleUID[RepairCar[playerid]][vUID]][c_Tires] = 0;
                            CarData[VehicleUID[RepairCar[playerid]][vUID]][c_HP] = CarData[VehicleUID[RepairCar[playerid]][vUID]][c_MaxHP];

                            PlayerPlaySound(RepairCar[playerid], 1140, 0.0, 0.0, 0.0);
                            PlayerPlaySound(playerid, 1140, 0.0, 0.0, 0.0);
                            format(string, sizeof(string), "* Twój samochód został naprawiony za $%d przez mechanika %s.",RepairPrice[playerid],giveplayer);
                            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                            format(string, sizeof(string), "* Naprawiłeś pojazd %s, $%d zostanie dodane do twojej wypłaty.",sendername,RepairPrice[playerid]);
                            SendClientMessage(RepairOffer[playerid], COLOR_LIGHTBLUE, string);
                            format(string, sizeof(string),"* Mechanik %s wyciąga narzędzia oraz naprawia %s.",giveplayer,VehicleNames[GetVehicleModel(RepairCar[playerid])-400]);
                            ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            format(string, sizeof(string), "* Silnik pojazdu znów działa jak należy (( %s ))", giveplayer);
                            ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            PlayerInfo[RepairOffer[playerid]][pMechSkill] ++;
                            if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 50)
                            { SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 2, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                            else if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 100)
                            { SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 3, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                            else if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 200)
                            { SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 4, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                            else if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 400)
                            { SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 5, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                            ZabierzKaseDone(playerid, RepairPrice[playerid]);
                            DajKaseDone(RepairOffer[playerid], RepairPrice[playerid]);
                            Log(payLog, WARNING, "%s naprawił pojazd %s graczowi %s", GetPlayerLogName(RepairOffer[playerid]), GetVehicleLogName(RepairCar[playerid]), GetPlayerLogName(playerid));
                            RepairOffer[playerid] = 999;
                            RepairPrice[playerid] = 0;
                        }
                        else
                        {
                            sendErrorMessage(playerid, "Mechanik musi być obok Ciebie!");
                            return 1;
                        }
                        return 1;
                    }
                    return 1;
                }
                return 1;
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "   Nie stać cię na naprawe !");
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci naprawy !");
            return 1;
        }
    }
    else if(strcmp(x_job,"wynajem",true) == 0 || strcmp(x_job,"wynajmij",true) == 0)
    {
        if(WynajemOffer[playerid] < 999)
        {
            new dom = PlayerInfo[WynajemOffer[playerid]][pDom];
            if(kaska[playerid] > Dom[dom][hCenaWynajmu] && Dom[dom][hCenaWynajmu] > 0)
            {
                GetPlayerName(WynajemOffer[playerid], giveplayer, sizeof(giveplayer));
                sendername = GetNickEx(playerid);
                if(Dom[dom][hPW] == 0)
                {
                    Dom[dom][hL1] = sendername;
                }
                else if(Dom[dom][hPW] == 1)
                {
                    Dom[dom][hL2] = sendername;
                }
                else if(Dom[dom][hPW] == 2)
                {
                    Dom[dom][hL3] = sendername;
                }
                else if(Dom[dom][hPW] == 3)
                {
                    Dom[dom][hL4] = sendername;
                }
                else if(Dom[dom][hPW] == 4)
                {
                    Dom[dom][hL5] = sendername;
                }
                else if(Dom[dom][hPW] == 5)
                {
                    Dom[dom][hL6] = sendername;
                }
                else if(Dom[dom][hPW] == 6)
                {
                    Dom[dom][hL7] = sendername;
                }
                else if(Dom[dom][hPW] == 7)
                {
                    Dom[dom][hL8] = sendername;
                }
                else if(Dom[dom][hPW] == 8)
                {
                    Dom[dom][hL9] = sendername;
                }
                else if(Dom[dom][hPW] == 9)
                {
                    Dom[dom][hL10] = sendername;
                }
                Dom[dom][hPDW] --;
                Dom[dom][hPW] ++;
                PlayerInfo[playerid][pWynajem] = dom;
                format(string, sizeof(string), "Wynająłeś pokój w tym domu. Aby uzyskać więcej opcji i możliwości wpisz /dom");
                SendClientMessage(playerid, COLOR_NEWS, string);
                format(string, sizeof(string), "%s wynajął pokój w twoim domu!", sendername);
                SendClientMessage(WynajemOffer[playerid], COLOR_NEWS, string);
                WynajemOffer[playerid] = 999;
                return 1;
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "   Nie stać cię na wynajem tego pokoju !");
                WynajemOffer[playerid] = 999;
                return 1;
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował ci wynajmu !");
            return 1;
        }
    }
    else if(strcmp(x_job,"dom",true) == 0 || strcmp(x_job,"house",true) == 0)
    {
        if(DomOffer[playerid] < 999)
        {
            if(!IsPlayerConnected(DomOffer[playerid])) return 1;
            new houseid = GetPVarInt(DomOffer[playerid], "DomOfferID");
            #if defined MRP_LEGACY_HOUSES
            if(houseid <= 0 || houseid >= MAX_DOM || Dom[houseid][hID] != houseid) return 1;
            #else
            if(!Iter_Contains(House_iterator, houseid)) return 1;
            #endif
            if(kaska[playerid] > DomCena[playerid] && DomCena[playerid] > 0)
            {
                if (ProxDetectorS(10.0, playerid, DomOffer[playerid]))
                {
                    #if defined MRP_LEGACY_HOUSES
                    if(PlayerInfo[DomOffer[playerid]][pDom] == houseid && Dom[houseid][hUID_W] == PlayerInfo[DomOffer[playerid]][pUID])
                    #else
                    if(House[houseid][h_Owner] == PlayerInfo[DomOffer[playerid]][pUID])
                    #endif
                    {
                        GetPlayerName(DomOffer[playerid], giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        format(string, sizeof(string), "Sprzedałeś dom graczowi %s za %d$.", sendername, DomCena[playerid]);
                        SendClientMessage(DomOffer[playerid], COLOR_NEWS, string);
                        format(string, sizeof(string), "Kupiłeś dom od %s za %d$. Aby uzyskać więcej opcji i możliwości wpisz /dom", giveplayer, DomCena[playerid]);
                        SendClientMessage(playerid, COLOR_NEWS, string);
                        #if defined MRP_LEGACY_HOUSES
                        format(Dom[houseid][hWlasciciel], MAX_PLAYER_NAME + 1, "%s", GetNickEx(playerid));
                        Dom[houseid][hUID_W] = PlayerInfo[playerid][pUID];
                        PlayerInfo[playerid][pDom] = houseid;
                        PlayerInfo[DomOffer[playerid]][pDom] = 0;
                        #else
                        House[houseid][h_Owner] = PlayerInfo[playerid][pUID];
                        #endif
                        ZabierzKaseDone(playerid, DomCena[playerid]);
                        DajKaseDone(DomOffer[playerid], DomCena[playerid]);
                        #if defined MRP_LEGACY_HOUSES
                        ZapiszDom(houseid);
                        #else
                        House_Save(houseid);
                        #endif
                        Log(payLog, WARNING, "%s kupił od %s dom %s za %d$. ", \
                            GetPlayerLogName(playerid), \
                            GetPlayerLogName(DomOffer[playerid]), \
                            GetHouseLogName(houseid), \
                            DomCena[playerid] \
                        );
                    }
                    else
                    {
                        format(string, sizeof(string), "Napotkano błąd. Dom został kupiony przez kogoś innego.");
                        SendClientMessage(playerid, COLOR_NEWS, string);
                    }
                    DeletePVar(DomOffer[playerid], "DomOfferID");
                    DomCena[playerid] = 0;
                    DomOffer[playerid] = 999;
                    return 1;
                }
                else
                {
                    DomOffer[playerid] = 0;
                    SendClientMessage(playerid, COLOR_GREY, "   Jesteś za daleko !");
                    return 1;
                }
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "   Nie stać cię na kupno tego domu !");
                return 1;
            }
        }
    }
    else if(strcmp(x_job,"kuracje",true) == 0 || strcmp(x_job,"kuracja",true) == 0)
    {
        kuracja_akceptuj(playerid);
    }
    else if(strcmp(x_job,"maseczke",true) == 0 || strcmp(x_job,"maseczka",true) == 0)
    {
        maseczka_akceptuj(playerid);
    }
    else if(strcmp(x_job,"neony",true) == 0 || strcmp(x_job,"neon",true) == 0)
    {
        sprzedajneon_akceptuj(playerid);
    }
    else if(strcmp(x_job,"zaproszenie", true) == 0 || strcmp(x_job,"zapro", true) == 0)
    {
        if(GetPVarInt(playerid, "MotelPendingInviteToRoom") != 0)
        {
            new fromID = GetPVarInt(playerid, "MotelPendingInviteFrom");
            new toRoom = GetPVarInt(playerid, "MotelPendingInviteToRoom");
            new fromName[32];
            new str[128];
            GetPVarString(playerid, "MotelPendingInviteFromName", fromName, sizeof(fromName));

            new nick[32], nick2[32];
			format(nick, sizeof(nick), "%s", GetNick(playerid));
			strreplace(nick, "_", " ");
			format(nick2, sizeof(nick2), "%s", fromName);
			strreplace(nick2, "_", " ");

            SetPVarInt(playerid, "MotelPendingInviteFrom", 0);
            SetPVarInt(playerid, "MotelPendingInviteToRoom", 0);
            SetPVarString(playerid, "MotelPendingInviteFromName", " ");

            if(MotelRooms[toRoom][mtrAccessCount] >= MOTEL_MAX_ACCESS) return sendErrorMessage(playerid, "Akceptacja zaproszenia nie powiodła się, ponieważ pokój jest już pełny!");
            if(strcmp(fromName, GetNick(fromID), true) != 0) return sendErrorMessage(playerid, "Akceptacja zaproszenia nie powiodła się, ponieważ gracz wyszedł z gry!");

            Motel_AddUIDToAccess(toRoom, PlayerInfo[playerid][pUID], GetNick(playerid));
            format(str, sizeof(str), "Zaakceptowałeś zaproszenie %s i masz teraz dostęp do pokoju.",  nick2);
            sendTipMessage(playerid, str);
            format(str, sizeof(str), "%s zaakceptował twoje zaproszenie i ma teraz dostęp do pokoju.", nick);
            sendTipMessage(fromID, str);
        } else return SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował Ci zaproszenia do pokoju !");
    }
    else if(strcmp(x_job,"zastrzyk",true) == 0)
    {
        if(GetPVarInt(playerid, "ZastrzykHave") == 1)
        {
            new giveplayerid;
            giveplayerid = GetPVarInt(playerid, "ZastrzykID");
            if(kaska[playerid] >= 1)
            {
                if(!IsPlayerConnected(giveplayerid))
                {
                    SetPVarInt(playerid, "ZastrzykID", INVALID_PLAYER_ID);
                    SetPVarInt(playerid, "ZastrzykHave", 0);
                    sendErrorMessage(playerid, "Gracz który oferował Ci zastrzyk wyszedł z gry!");
                    return 1;
                }
                if ( !(IsAMedyk(giveplayerid)))
                {
                    SetPVarInt(playerid, "ZastrzykID", INVALID_PLAYER_ID);
                    SetPVarInt(playerid, "ZastrzykHave", 0);
                    sendErrorMessage(playerid, "Gracz który oferował Ci zastrzyk wyszedł z gry!");
                    return 1;
                }
                if(!IsPlayerNear(playerid, giveplayerid))
                {
                    sendErrorMessage(playerid, sprintf("Jesteś zbyt daleko od gracza %s", GetNick(giveplayerid)));
                    return 1;
                }
                ProxDetector(20.0, playerid, sprintf("* Lekarz %s wyciąga strzykawkę i wstrzykuje leki %s.", GetNick(giveplayerid), GetNick(playerid)), 
                COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE
                );
                if(IsPlayerHealthy(playerid)) 
                {
                    SendClientMessage(playerid, COLOR_WHITE, "Lekarz dał ci zastrzyk i pooprawił Twoją odporność.");
                    ProxDetector(20.0, playerid, sprintf("* %s czuje się lepiej oraz jego organizm stał się bardziej odporny na choroby.", GetNick(playerid)), 
                        COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE
                    );
                }
                else
                {
                    SendClientMessage(playerid, COLOR_WHITE, "Lekarz dał ci zastrzyk i załagodził objawy choroby.");
                    ProxDetector(20.0, playerid, sprintf("* %s czuje się lepiej oraz jego organizm lepiej radzi sobie z objawami choroby.", GetNick(playerid)), 
                        COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE
                    );
                }
                SetPlayerImmunity(playerid, MAX_PLAYER_IMMUNITY);
                SetPlayerHealth(playerid, 100);
                TogglePlayerControllable(playerid, 1);
                SendClientMessage(playerid, COLOR_GREY, "Koszt zastrzyku: "INCOLOR_RED"-1$");
                ZabierzKaseDone(playerid, 1);
                DajKaseDone(giveplayerid, 1);
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "Nie stać Cię na zastrzyk. ($1)");
            }
            SetPVarInt(playerid, "ZastrzykID", INVALID_PLAYER_ID);
            SetPVarInt(playerid, "ZastrzykHave", 0);
        } else return SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował Ci zastrzyku !");
    }
    else if(strcmp(x_job, "tuning", true) == 0)
    {
        if(GetPVarInt(playerid, "Tune_PendingInvite") != 0)
        {
            if(GetPVarInt(playerid, "Tune_PendingInvite") == 1)
                return AcceptTuneOffer(GetPVarInt(playerid, "Tune_mechanik"), playerid);
            else if(GetPVarInt(playerid, "Tune_PendingInvite") == 2)
                return FinishTune(GetPVarInt(playerid, "Tune_mechanik"));
            else
                return sendErrorMessage(playerid, "Wystąpił krytyczny błąd!");
        } else return SendClientMessage(playerid, COLOR_GREY, "   Nikt nie oferował Ci tuningu !");
    }
    else if(strcmp(x_job, "smierc", true) == 0)
    {
        if (PlayerInfo[playerid][pInjury] != 0 || PlayerInfo[playerid][pCanAcceptDeath] == 0) 
        {
            return sendErrorMessage(playerid, "Nie jesteś ranny albo nie mozesz tego jeszcze uzyc!");
        }
        PlayerInfo[playerid][pCanAcceptDeath] = 0;
        ZdejmijBW(playerid);
        // Rozkuwanie
        if (PlayerCuffed[playerid] == 1)
        {
            TogglePlayerControllable(playerid, 1);
            PlayerCuffed[playerid] = 0;
            Kajdanki_JestemSkuty[playerid] = 0;
            Kajdanki_SkutyGracz[playerid] = 0;
            Kajdanki_Uzyte[playerid] = 0;
            Kajdanki_PDkuje[playerid] = 0;
            PlayerInfo[playerid][pMuted] = 0;
            ClearAnimations(playerid);
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            RemovePlayerAttachedObject(playerid, 5);
        }

        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);

        new amount = kaska[playerid];
        if (amount > 0)
        {
            new Float:xd, Float:yd, Float:zd;
            GetPlayerPos(playerid, xd, yd, zd);

            // znajdź wolny slot na pieniądze
            new idx = -1;
            for (new i = 0; i < MAX_DROPPED_MONEY; i++)
            {
                if (!IsMoneyPickupValid[i])
                {
                    idx = i;
                    break;
                }
            }

            if (idx == -1)
                return sendTipMessage(playerid, "Nie można utworzyć więcej pieniędzy na ziemi!");

            // utwórz pickup
            new pickup = CreateDynamicPickup(MONEY_MODEL_ID, 23, xd, yd, zd, -1);
            MoneyObject[idx] = pickup;
            MoneyAmount[idx] = amount;
            IsMoneyPickupValid[idx] = 1;

            DajKaseDone(playerid, -amount);

            new labelText[64];
            format(labelText, sizeof(labelText), "~g~$%d", amount);
            MoneyLabel[idx] = CreateDynamic3DTextLabel(labelText, COLOR_YELLOW, xd, yd, zd + 0.5, 10.0);

            sendTipMessage(playerid, "Upuściłeś wszystkie swoje pieniądze!");
        }


        SetPlayerSpawn(playerid);
        // Zabierz itemy, bronie, poziom poszukiwania
        RemovePlayerWeaponsTemporarity(playerid);
        UsunBron(playerid);
        PlayerInfo[playerid][pWL] = 0;
        PoziomPoszukiwania[playerid] = 0;
        SetPlayerWantedLevelEx(playerid, 0);
        sendTipMessage(playerid, "Twoje bronie oraz poziom poszukiwania zostały usunięte!");
        PlayerInfo[playerid][pWeaponBlock] = gettime() + 300; // 5 minut
        SendClientMessage(playerid, COLOR_LIGHTRED, "> Została Ci nadana blokada broni na okres 5 minut.");
    }
    else if(strcmp(x_job, "tatuaz", true) == 0) //System tatuaży 4.1
    {
        new offer = GetPVarInt(playerid, "Tattoo-Offer"), price = GetPVarInt(playerid, "Tattoo-Price");
        if(offer == INVALID_PLAYER_ID || !IsPlayerConnected(offer)) return sendErrorMessage(playerid, "Nie masz aktywnej oferty!");
        if(!GetPVarInt(playerid, "Tattoo-Active")) return sendErrorMessage(playerid, "Nie masz aktywnej oferty!");
        if(price < 50 || price > 400) return sendErrorMessage(playerid, "Cena jest nieprawidłowa!");
        if(kaska[playerid] < price) return sendErrorMessage(playerid, "Nie masz tylu pieniędzy przy sobie!");
        if(!GroupPlayerDutyPerm(offer, PERM_TATTOO)) return sendErrorMessage(playerid, "Gracz składający ofertę zszedł z duty!");
        if(!IsPlayerNear(playerid, offer)) return sendErrorMessage(playerid, "Nie znajdujesz się w pobliżu gracza, który składał Ci ofertę!");

        new strring[sizeof Tattoo_Models * 68];
        for(new i = 0; i < sizeof(Tattoo_Models); i++)
        {
            format(strring, sizeof(strring), "%s\n%d\t%s", strring, Tattoo_Models[i][dModel], Tattoo_Models[i][d_Name]);
        }
        ShowPlayerDialogEx(playerid, D_TATTOO, DIALOG_STYLE_PREVIEW_MODEL, "Lista tatuazy", strring, "Wybierz", "Zamknij");
        va_SendClientMessage(offer, COLOR_LIGHTBLUE, "* Gracz %s akceptował twoją ofertę, poczekaj aż wybierze wzór.", GetNick(playerid));
        SetPVarInt(playerid, "Tattoo-Active", 0);
    }
    return 1;
}

//end
