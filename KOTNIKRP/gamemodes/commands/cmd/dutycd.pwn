//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dutycd ]------------------------------------------------//
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

YCMD:dutycd(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME + 1];
	

    if(IsPlayerConnected(playerid))
    {
		if(IsAPolicja(playerid, 0) && PoziomPoszukiwania[playerid] > 0)
		{
			sendTipMessage(playerid, "Osoby poszukiwane przez policję nie mogą rozpocząć służby !");
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie możesz tego użyć  podczas @Duty! Zejdź ze służby używając /adminduty");
			return 1;
		}
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Aby wziąć służbe musisz być pieszo!");

        if(OnDuty[playerid]>0 && OnDutyCD[playerid] == 0) return sendTipMessage(playerid, "Użyj /duty !");

		if(gettime() - GetPVarInt(playerid, "lastDamage") < 60)
				return sendErrorMessage(playerid, "Nie możesz tego użyć podczas walki!");

		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(IsPlayerInGroup(playerid, 1))
		{
			new frac = FRAC_LSPD;
			if (PlayerToPoint(3, playerid,255.3,77.4,1003.6)
			|| PlayerToPoint(5, playerid, 266.7904,118.9303,1004.6172)
			|| PlayerToPoint(3, playerid, 1579.6711,-1635.4512,13.5609)
			|| PlayerToPoint(3, playerid, -2614.1667,2264.6279,8.2109)
			|| PlayerToPoint(3, playerid, 2425.6,117.69,26.5)//nowe domy
			|| PlayerToPoint(3, playerid, -1649.6832,885.4910,-45.4141)//nowe komi by dywan
			|| PlayerToPoint(3, playerid, -1645.3046,895.2336,-45.4141)
			|| PlayerToPoint(3, playerid, 2007.46, -2143.09, 13.54) // nowe komi LSCSD
            || PlayerToPoint(3, playerid, 1572.1919,-1631.5922,13.3991)//KILSON NOWY SPAWN
			|| PlayerToPoint(5, playerid, GroupInfo[frac][g_Spawn][0], GroupInfo[frac][g_Spawn][1], GroupInfo[frac][g_Spawn][2]))

			{
				if(OnDuty[playerid]<1 && OnDutyCD[playerid] == 0)
		        {
					if(GetFractionMembersNumber(frac, true) >= GroupInfo[frac][g_MaxDuty] && GroupInfo[frac][g_MaxDuty] > 0)
					{
						return va_SendClientMessage(playerid, COLOR_LIGHTRED, "> Nie możesz wejść na duty z powodu ustawionego limitu pracowników na: %d", GroupInfo[frac][g_MaxDuty]);
					}
			    	format(string, sizeof(string), "* Oficer %s bierze odznakę i broń ze swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					DajBronieFrakcyjne(playerid, frac);
					SetPlayerArmour(playerid, 100);
	    		    SetPlayerHealth(playerid, 100);
					OnDuty[playerid] = GetPlayerGroupSlot(playerid, frac);
					OnDutyCD[playerid] = 1;
				}
				else if(OnDuty[playerid]>0 && OnDutyCD[playerid] == 1)
				{
					format(string, sizeof(string), "* Oficer %s odkłada odznakę i broń do swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					SetPlayerArmour(playerid, 0.0);
	    		    SetPlayerHealth(playerid, 100);
					
                    OnDuty[playerid] = 0;
					OnDutyCD[playerid] = 0;
                    PrzywrocBron(playerid);
				}
			}
			else
			{
				sendTipMessage(playerid, "Nie jesteś w szatni !");
				return 1;
			}
		}
		else if(IsPlayerInGroup(playerid, 2))
		{
			new frac = FRAC_FBI;
			if (PlayerToPoint(5, playerid, GroupInfo[frac][g_Spawn][0], GroupInfo[frac][g_Spawn][1], GroupInfo[frac][g_Spawn][2]))
			{
				if(OnDuty[playerid]<1 && OnDutyCD[playerid] == 0)
		        {
					if(GetFractionMembersNumber(frac, true) >= GroupInfo[frac][g_MaxDuty] && GroupInfo[frac][g_MaxDuty] > 0)
					{
						return va_SendClientMessage(playerid, COLOR_LIGHTRED, "> Nie możesz wejść na duty z powodu ustawionego limitu pracowników na: %d", GroupInfo[frac][g_MaxDuty]);
					}
			    	format(string, sizeof(string), "* Oficer %s bierze odznakę i broń ze swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					DajBronieFrakcyjne(playerid, frac);
					SetPlayerArmour(playerid, 100);
	    		    SetPlayerHealth(playerid, 100);
					OnDuty[playerid] = GetPlayerGroupSlot(playerid, frac);
					OnDutyCD[playerid] = 1;
				}
				else if(OnDuty[playerid]>0 && OnDutyCD[playerid] == 1)
				{
					format(string, sizeof(string), "* Oficer %s odkłada odznakę i broń do swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					SetPlayerArmour(playerid, 0.0);
	    		    SetPlayerHealth(playerid, 100);
					
                    OnDuty[playerid] = 0;
					OnDutyCD[playerid] = 0;
                    PrzywrocBron(playerid);
				}
			}
			else
			{
				sendTipMessage(playerid, "Nie jesteś w szatni !");
				return 1;
			}
		}
		else if((IsPlayerInGroup(playerid, FRAC_BOR) && GroupRank(playerid, FRAC_BOR) >= 2))
		{
			new frac = FRAC_BOR;
			if(GetFractionMembersNumber(frac, true) >= GroupInfo[frac][g_MaxDuty] && GroupInfo[frac][g_MaxDuty] > 0)
			{
				return va_SendClientMessage(playerid, COLOR_LIGHTRED, "> Nie możesz wejść na duty z powodu ustawionego limitu pracowników na: %d", GroupInfo[frac][g_MaxDuty]);
			}
			if(IsPlayerInRangeOfPoint(playerid, 5.0, 1521.8843,-1479.6427,22.9377))
			{
				if(OnDuty[playerid] < 1 && OnDutyCD[playerid] == 0)
				{
					format(string, sizeof(string), "* Agent %s bierze identyfikator i broń ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    DajBronieFrakcyjne(playerid, FRAC_BOR);
                    SetPlayerArmour(playerid, 100);
                    SetPlayerHealth(playerid, 100);
                    OnDuty[playerid] = GetPlayerGroupSlot(playerid, FRAC_BOR);
					OnDutyCD[playerid] = 1;
				}
				else
				{
					format(string, sizeof(string), "* Agent %s odkłada identyfikator i broń do swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 0.0);
                    OnDuty[playerid] = 0;
					OnDutyCD[playerid] = 0;
                    PrzywrocBron(playerid);
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie jesteś w odpowiednim miejscu!"); 
				return 1;
			}
		}
		else
		{
		    noAccessMessage(playerid);
		}
	}
	return 1;
}
