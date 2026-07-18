//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ mdc ]--------------------------------------------------//
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

YCMD:mdc(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];

    if(IsPlayerConnected(playerid))
    {
        if(!IsAPolicja(playerid))
        {
            sendErrorMessage(playerid, "Nie jesteś policjantem!");
            return 1;
        }
		new tmpcar = GetPlayerVehicleID(playerid);
		new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "Użyj /mdc [playerid/CzęśćNicku]");
			return 1;
		}

		if(IsACopCar(tmpcar)||PlayerToPoint(5.0, playerid, 253.9280,69.6094,1003.6406)||PlayerToPoint(20.0, playerid, 246.3568,120.3933,1003.2682)|| PlayerToPoint(30.0, playerid, 1207.2086,-1672.6479,-53.0375) || PlayerToPoint(50.0, playerid, -1676.4485,890.3879,-48.9141) || PlayerToPoint(50.0, playerid, 620.24847, -1469.73865, 90.04340))//210 int 10 =LSPD, 212=FBI
		{
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if(AntySpam[playerid] == 1)
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 10 sekund");
						return 1;
					}
					new nick[32];
					if(GetPVarString(giveplayerid, "maska_nick", nick, 24)) return sendTipMessage(playerid, "Nie można namierzyć osoby zamaskowanej.");

			        new pZone[MAX_ZONE_NAME];
			        new pojazd = GetPlayerVehicleID(giveplayerid);
			        GetPlayer2DZone(giveplayerid, pZone, MAX_ZONE_NAME);
			        GetPlayerName(giveplayerid, sendername, sizeof(sendername));
					SendClientMessage(playerid, TEAM_BLUE_COLOR,"______-=KOMPUTER POLICYJNY=-_______");
					format(string, sizeof(string), "Imie : %s", sendername);
					SendClientMessage(playerid, COLOR_GRAD1,string);
					format(string, sizeof(string), "Przestepstwo : %s", PlayerCrime[giveplayerid][pAccusedof]);
					SendClientMessage(playerid, COLOR_GRAD2,string);
					format(string, sizeof(string), "Zgłoszone przez : %s", PlayerCrime[giveplayerid][pVictim]);
					SendClientMessage(playerid, COLOR_GRAD3,string);
					format(string, sizeof(string), "Ostatnio widziany w miejscu: %s", pZone);
					SendClientMessage(playerid, COLOR_GRAD4,string);
					if(pojazd >= 1)
					{
						format(string, sizeof(string), "Ostatni środek transportu: %s", VehicleNames[GetVehicleModel(pojazd)-400]);
						SendClientMessage(playerid, COLOR_GRAD4,string);
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD4,"Ostatni środek transportu: nie zgłoszono");
					}
					format(string, sizeof(string), "Poziom Poszukiwania : %d", PoziomPoszukiwania[giveplayerid]);
					SendClientMessage(playerid, COLOR_GRAD4,string);
					if(PoziomPoszukiwania[giveplayerid] < 6 && PoziomPoszukiwania[giveplayerid] > 0)
					{
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Tą sprawę prowadzi: LSPD");
					}
					else if(PoziomPoszukiwania[giveplayerid] >= 6 && PoziomPoszukiwania[giveplayerid] < 10)
					{
					    SendClientMessage(playerid, COLOR_LFBI, "Tą sprawę prowadzi: FBI");
					}
					else if(PoziomPoszukiwania[giveplayerid] >= 10)
					{
						SendClientMessage(playerid, COLOR_RED, "Tą sprawę prowadzą: Wszystkie jednostki");
					}
					else
					{
  					}
    				PlayCrimeReportForPlayer(playerid,giveplayerid,16);
					SendClientMessage(playerid, TEAM_BLUE_COLOR,"_______________________________________");
					SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
					AntySpam[playerid] = 1;
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza !");
			    return 1;
			}
		}
		else
		{
		    sendTipMessage(playerid, "   Nie jesteś w komisariacie ani w radiowozie.");
			return 1;
		}
	}
	return 1;
}
