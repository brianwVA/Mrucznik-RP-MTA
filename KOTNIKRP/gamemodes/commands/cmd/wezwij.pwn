//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wezwij ]------------------------------------------------//
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

YCMD:wezwij(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pJailed] == 0 && GetPlayerInterior(playerid) == 0)
        {
            if(AntySpam[playerid] != 0)
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Spróbuj za 30 sekund !");
                return 1;
            }
			new x_nr[16];
			if(sscanf(params, "s[16]", x_nr))
			{
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Service Names __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "UŻYJ: /wezwij [nazwa]");
		  		SendClientMessage(playerid, COLOR_GREY, "Dostępne nazwy: Restauracja, Taxi, Bus, Medyk, Mechanik, Heli, Prawnik");
				SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________|");
				return 1;
			}
			if(strcmp(x_nr, "Prawnik", true) == 0)
			{
				if(CheckAntySpamForPlayer(playerid, ASPAM_PRAWNIK))
				{
					sendErrorMessage(playerid, "Odczekaj 30 sekund przed wezwaniem kolejnego prawnika!"); 
					return 1;
				}
				SetAntySpamForPlayer(playerid, ASPAM_PRAWNIK);
				new bool:jestPrawnik=false; 
				format(string, sizeof(string), "%s [ID: %d] potrzebuje pomocy prawnika w więzieniu! Jedź tam i uwoolnij go za opłatą!", GetNick(playerid), playerid); 
				foreach(new checkPrawnik : Player)
				{
					if(PlayerInfo[checkPrawnik][pJob] == 2 || CheckPlayerPerm(checkPrawnik, PERM_LAWYER))
					{
						jestPrawnik=true; 
						sendTipMessageEx(checkPrawnik, COLOR_P@, string); 
					}
				}
				if(jestPrawnik)
				{
					sendTipMessage(playerid, "Wezwałeś prawnika, oczekuj na przyjazd!"); 
				}
				else
				{
					sendTipMessage(playerid, "Nie ma obecnie żadnych prawników w mieście! Odczekaj kilka minut"); 
				}
			}
			else if(strcmp(x_nr,"restauracja",true) == 0 || strcmp(x_nr,"restauracje",true) == 0 || strcmp(x_nr,"jedzenie",true) == 0)
			{
				new Restaurants = 0;
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "** %s potrzebuje obsługi restauracji. (wpisz /akceptuj restauracja aby zaakceptować zgłoszenie)", sendername);
				foreach(new i : Player)
				{
					if(!OnDuty[i]) continue;
					if(!GroupPlayerDutyPerm(i, PERM_RESTAURANT)) continue;
					SendClientMessage(i, TEAM_AZTECAS_COLOR, string);
					Restaurants++;
				}
				if(Restaurants < 1)
				{
					sendTipMessage(playerid, "Nie ma obecnie pracowników restauracji na służbie! Odczekaj kilka minut");
					return 1;
				}
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoniłeś po restaurację, czekaj na akceptację.");
				RestaurantCall = playerid;
				AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
				return 1;
			}
		    else if(strcmp(x_nr,"taxi",true) == 0)
			{
			    if(TaxiDrivers < 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma taksówkarzy, spróbuj później !");
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma wolnych taksówkarzy !");
		        }
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(PlayerInfo[playerid][pLevel] <= 3)
				{
					format(string, sizeof(string), "**[NEW_PLAYER] %s potrzebuje transportu. (wpisz /akceptuj taxi aby zaaceptować zgłoszenie)", sendername);
					GroupSendMessage(10, 0xE88A2DFF, string);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoniłeś po taksówkę, czekaj na akceptacje.");
					TaxiCall = playerid;
					AntySpam[playerid] = 1;
					SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
				}
				else
				{
					format(string, sizeof(string), "** %s potrzebuje transportu. (wpisz /akceptuj taxi aby zaaceptować zgłoszenie)", sendername);
					GroupSendMessage(10, 0xE88A2DFF, string);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoniłeś po taksówkę, czekaj na akceptacje.");
					TaxiCall = playerid;
					AntySpam[playerid] = 1;
					SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
				}
		    	return 1;
			}
			else if(strcmp(x_nr,"heli",true) == 0)
			{
			    if(HeliDrivers < 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma pilota, spróbuj później !");
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma wolnego pilota !");
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s potrzebuje transportu. (wpisz /akceptuj heli aby zaaceptować zgłoszenie)", sendername);
		    	GroupSendMessage(10, 0xE88A2DFF, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wezwałeś helikopter, czekaj na miejscu.");
		    	HeliCall = playerid;
		    	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else if(strcmp(x_nr,"bus",true) == 0)
			{
			    if(BusDrivers < 1)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma kierowców autobusu, spróbuj później !");
		            return 1;
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma wolnych autobusów !");
		            return 1;
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s potrzebuje autobusu. (wpisz /akceptuj bus aby zaakceptować zlecenie)", sendername);
		    	GroupSendMessage(10, 0xE88A2DFF, string);
		    	SendJobMessage(10, 0xE88A2DFF, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoniłeś po autobus, czekaj na akceptacje.");
		    	BusCall = playerid;
		    	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else if(strcmp(x_nr,"medyk",true) == 0)
			{
				new Medics = 0;
		        foreach(new i : Player)
				{	
					if(GroupPlayerDutyPerm(i, PERM_MEDIC))
				    {
				    	GetPlayerName(playerid, sendername, sizeof(sendername));
				    	format(string, sizeof(string), "** %s potrzebuje pomocy. (wpisz /akceptuj medyk aby zaakceptować zlecenie)", sendername);
				   		SendClientMessage(i, TEAM_AZTECAS_COLOR, string);
						Medics++;
				   	}

			   	}
				if(Medics < 1)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma lekarzy na służbie, spróbuj potem !");
		            return 1;
		        }
				PlayerRequestMedic[playerid] = 0;
			   	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoniłeś po lekarza, czekaj na akceptacje.");
			   	MedicCall = playerid;
			   	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else if(strcmp(x_nr,"mechanik",true) == 0)
			{
				new Mechanics = 0;
		        foreach(new i : Player)
				{
				    if(JobDuty[i] >= 1 && PlayerInfo[i][pJob] == 7)
				    {
						Mechanics++;
				    	GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "** %s potrzebuje mechanika. (wpisz /akceptuj mechanik aby zaakceptować zlecenie)", sendername);
					   	SendClientMessage(i, TEAM_AZTECAS_COLOR, string);
					}
				}
				if(Mechanics < 1)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie ma mechaników na służbie, spróbuj potem !");
		            return 1;
		        }
			   	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zadzwoniłeś po mechanika, czekaj na akceptacje.");
			   	MechanicCall = playerid;
			   	AntySpam[playerid] = 1;
				SetTimerEx("AntySpamTimer",30000,0,"d",playerid);
		    	return 1;
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Zła nazwa!");
			    return 1;
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz wzywać w AJ/interiorze !");
		}
	}
	return 1;
}
