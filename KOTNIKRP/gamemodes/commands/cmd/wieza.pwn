//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wieza ]-------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:wieza(playerid, params[], help)
{
    new data[32], sub[128];
    if(isnull(params))
    {
        sendTipMessageEx(playerid, COLOR_WHITE, "Użyj /wieza [nazwa]");
		sendTipMessageEx(playerid, COLOR_WHITE, "Dostepne nazwy: radio (wieża LS 120.0 MHz) , kontakt [tekst]");
		if(CheckPlayerPerm(playerid, PERM_TAXI))
	    {
	    	sendTipMessageEx(playerid, COLOR_WHITE, "Kontroler lotów: blokuj [ID] | odblokuj [ID] | radio (nasłuch wieży, zmiena f) | kontakt [tekst] | samolot [wybiera samolot do kontaktu]");
            sendTipMessageEx(playerid, COLOR_WHITE, "Kontroler lotów: stan-lotnisko [Wyswietla samoloty na płycie lotniska] | stan-powietrze [Wyswietla samoloty w powietrzu w obszarze 200km]");
            sendTipMessageEx(playerid, COLOR_WHITE, "Kontroler lotów: sprawdź [samolot ID]");
        }
		return 1;
    }
    sscanf(params, "s[32] S(-1)[128]", data, sub);
    new string[128];
	if(strcmp(data,"radio",true) == 0)
	{
        new veh = GetPlayerVehicleID(playerid);
        if(IsAPlane(veh))
        {
            //1633.9585,-2293.7197,94.2242
            new Float:channel = floatstr(sub);
            if(!(100.0 < channel < 300.0)) return sendTipMessageEx(playerid, COLOR_GRAD2, "Częstotliwosć od 100.0 MHz do 300.0 MHz");
            if(RADIO_CHANNEL[playerid] == channel) return 1;
            RADIO_CHANNEL[playerid] = channel;
            format(string, sizeof(string), "* %s ustawia radio na %.1f MHz", GetNick(playerid), channel);
            ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            if(channel == TOWER_CHANNEL) sendTipMessageEx(playerid, COLOR_WHITE, "Uzyskano połączenie z wieżą, by wysłać zapytanie użyj /wieża [tekst]");
        }
        else if(CheckPlayerPerm(playerid, PERM_TAXI) && IsPlayerInRangeOfPoint(playerid, 10.0, 1627.2760,-2295.9417,79.2242))
        { //wieża

            new Float:channel = floatstr(sub);
            if(!(100.0 < channel < 300.0)) return sendTipMessageEx(playerid, COLOR_GRAD2, "Częstotliwosć od 100.0 MHz do 300.0 MHz");
            format(string, sizeof(string), "* %s ustawia nasłuch wieży na %.1f MHz", GetNick(playerid), channel);
            ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            TOWER_CHANNEL = channel;
        }
    }
    else if(strcmp(data,"kontakt",true) == 0)
	{
        new veh = GetPlayerVehicleID(playerid);
        if(IsAPlane(veh))
        {
            if(RADIO_CHANNEL[playerid] == 0.0) return 1;
            if(RADIO_CHANNEL[playerid] == TOWER_CHANNEL)
            {
                if(TOWER_Blocked[playerid])
                {
                    ProxDetector(10.0, playerid, "* słychać głośny brzęk radia *", COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                }
                else
                {
                    format(string, 128, "Samolot %d-%s: %s", playerid, VehicleNames[GetVehicleModel(veh)-400], sub);
                    SendClientMessage(playerid, 0x3ABD91FF, string);
                    foreach(new i : Player)
                    {
                        if(IsPlayerInRangeOfPoint(i, 10.0, 1627.2760,-2295.9417,79.2242))
                        {
                            SendClientMessage(i, 0x3ABD91FF, string);
                        }
                    }
                }
            }
        }
        else if(CheckPlayerPerm(playerid, PERM_TAXI) && IsPlayerInRangeOfPoint(playerid, 10.0, 1627.2760,-2295.9417,79.2242))
        { //wieża
            if(!IsPlayerConnected(TOWER_CONTACT)) return sendTipMessageEx(playerid, COLOR_GRAD1, "Brak takiego gracza");
            if(!IsAPlane(GetPlayerVehicleID(TOWER_CONTACT))) return sendTipMessageEx(playerid, COLOR_GRAD1, "Utracono połączenie.");
            if(TOWER_Blocked[TOWER_CONTACT]) return sendTipMessageEx(playerid, COLOR_GRAD1, "Połączenie jest zablokowane.");
            format(string, 128, "Wieża LS Air: %s",sub);
            ProxDetector(10.0, playerid, string, 0x3ABD91FF,0x3ABD91FF,0x3ABD91FF,0x3ABD91FF,0x3ABD91FF);
            SendClientMessage(TOWER_CONTACT, 0x3ABD91FF, string);
        }
    }
    if(CheckPlayerPerm(playerid, PERM_TAXI))
    {
        if(strcmp(data,"blokuj",true) == 0)
        {
            new id = strval(sub);
            if(id < 0 ) return 1;
            if(!IsPlayerConnected(id)) return sendTipMessageEx(playerid, COLOR_GRAD1, "Brak takiego gracza");
            if(TOWER_Blocked[id]) return sendTipMessageEx(playerid, COLOR_GRAD1, "Już zablokowany!");
            if(!IsAPlane(GetPlayerVehicleID(id))) return sendTipMessageEx(playerid, COLOR_GRAD1, "Zakłucenia syngału.");
            TOWER_Blocked[id] = true;
            sendTipMessageEx(playerid, 0x3ABD91FF, "Zablokowano.");
            sendTipMessageEx(id, 0x3ABD91FF, "Wieża zakończyła połączenie.");
        }
        else if(strcmp(data,"odblokuj",true) == 0)
        {
            new id = strval(sub);
            if(id < 0 ) return 1;
            if(!IsPlayerConnected(id)) return sendTipMessageEx(playerid, COLOR_GRAD1, "Brak takiego gracza");
            if(!TOWER_Blocked[id]) return sendTipMessageEx(playerid, COLOR_GRAD1, "Już odblokowany!");
            if(!IsAPlane(GetPlayerVehicleID(id))) return sendTipMessageEx(playerid, COLOR_GRAD1, "Zakłucenia syngału.");
            TOWER_Blocked[id] = false;
            sendTipMessageEx(playerid, 0x3ABD91FF, "Odblokowano.");
        }
        else if(strcmp(data,"samolot",true) == 0)
        {
            new id = strval(sub);
            if(id < 0 ) return 1;
            if(!IsPlayerConnected(id)) return sendTipMessageEx(playerid, COLOR_GRAD1, "Brak takiego gracza");
            if(!IsAPlane(GetPlayerVehicleID(id))) return sendTipMessageEx(playerid, COLOR_GRAD1, "Zakłucenia syngału.");
            TOWER_CONTACT = id;
            format(string, sizeof(string), "* %s ustanawia połączenie z samolotem [%d-%s]", GetNick(playerid), id, VehicleNames[GetVehicleModel(GetPlayerVehicleID(id))-400]);
            ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        }
        else if(strcmp(data,"sprawdź",true) == 0 || strcmp(data,"sprawdz",true) == 0)
        {
            new id = strval(sub);
            if(id < 0 ) return 1;
            if(!IsAPlane(id)) return sendTipMessageEx(playerid, COLOR_GRAD1, "Brak takiego samolotu");
            new pid=-1;
            foreach(new i : Player)
            {
                if(GetPlayerVehicleID(i) == id && GetPlayerVehicleSeat(i) == 0)
                {
                    pid=i;
                    break;
                }
            }
            if(pid != -1)
            {
                new Float:x, Float:y, Float:z, Float:a;
                GetVehiclePos(id, x, y, z);
                GetVehicleZAngle(id, a);
                format(string, sizeof(string), "* Wynik dla samolotu [%d-%s] to [%d-%s] alt [%.0f] heading [%.0f]*", id, VehicleNames[GetVehicleModel(id)-400], pid,VehicleNames[GetVehicleModel(id)-400], z, a);
                ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            }
            else sendTipMessageEx(playerid, COLOR_GRAD1, "Samolot jest pusty.");
        }
        else if(strcmp(data,"stan-lotnisko",true) == 0)
        {
            new Float:x, Float:y, Float:z, ile;
            for(new i=0;i<MAX_VEHICLES;i++)
            {
                if(!IsAPlane(i)) continue;
                GetVehiclePos(i, x, y, z);
                if(VectorSize(x-1671.0825,y+2538.0308,z-13.5469) < 400.0)
                {
                    if(11.0 < z < 16.0) //ground only
                    {
                        ile++;
                        format(string, 128, "GROUND >> ID %d %s", i, VehicleNames[GetVehicleModel(i)-400]);
                        SendClientMessage(playerid, COLOR_WHITE, string);
                    }
                }
            }
            format(string, 128, "GROUND >> Łącznie %d samolotów.", ile);
            SendClientMessage(playerid, COLOR_WHITE, string);
        }
        else if(strcmp(data,"stan-powietrze",true) == 0)
        {
            new Float:x, Float:y, Float:z, ile, Float:dist;
            for(new i=0;i<MAX_VEHICLES;i++)
            {
                if(!IsAPlane(i)) continue;
                GetVehiclePos(i, x, y, z);
                if((dist = VectorSize(x-1671.0825,y+2538.0308,z-13.5469)) < 2000.0)
                {
                    if(z > 20.0) //above ground
                    {
                        ile++;
                        format(string, 128, "AIR >> ID %d %s dystans %.1f", i, VehicleNames[GetVehicleModel(i)-400], dist);
                        SendClientMessage(playerid, COLOR_WHITE, string);
                    }
                }
            }
            format(string, 128, "AIR >> Łącznie %d samolotów.", ile);
            SendClientMessage(playerid, COLOR_WHITE, string);
        }
    }
    return 1;
}
