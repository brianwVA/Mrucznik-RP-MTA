//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ odznaka ]------------------------------------------------//
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

YCMD:odznaka(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		new giveplayerid, slot;
		if(sscanf(params, "k<fix>d", giveplayerid, slot))
		{
			sendTipMessage(playerid, "Użyj /odznaka [id gracza] [slot]");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
				new allowedSlots = IsPlayerPremiumOld(playerid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
				if(slot < 1 || slot > allowedSlots) return sendErrorMessage(playerid, sprintf("Slot od 1 do %d", MAX_PLAYER_GROUPS));
				if(PlayerInfo[playerid][pGrupa][slot-1] == 0) return sendErrorMessage(playerid, "Nie jesteś w żadnej grupie na tym slocie!");
				if (ProxDetectorS(5.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
				{
					new string[64], sendername[MAX_PLAYER_NAME + 1], giveplayer[MAX_PLAYER_NAME + 1];
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new grupaUID = GetPlayerGroupUID(playerid, slot-1);
					if(GroupHavePerm(grupaUID, PERM_POLICE))
					{
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("|______________ Odznaka %s _____________|", GroupInfo[grupaUID][g_ShortName]));
						format(string, sizeof(string), "Numer odznaki: %d%d%d%d", grupaUID, PlayerInfo[playerid][pSex], GetPhoneNumber(playerid), PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imię i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", GroupRanks[grupaUID][PlayerInfo[playerid][pGrupaRank][slot-1]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] != slot)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Możliwość interwencji: Nie");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Możliwość interwencji: Tak");
						}
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("|_____ %s _____|", GroupInfo[grupaUID][g_Name]));
					}
					else if(GroupHavePerm(grupaUID, PERM_LEGALGUNDEALER))
					{
						SendClientMessage(giveplayerid, COLOR_GREEN, "|______________ Dokumenty GS ______________|");
						format(string, sizeof(string), "Numer seryjny: %d%d%d", PlayerInfo[playerid][pSex], GetPhoneNumber(playerid), PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imię i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Stopień: [%d]", PlayerInfo[playerid][pGrupaRank][slot-1]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						SendClientMessage(giveplayerid,COLOR_WHITE,"* Upoważnia do posiadania materiałów i sprzedaży broni");
						SendClientMessage(giveplayerid,COLOR_RED,"* Nie upoważnia do posiadania broni ciężkiej");
						SendClientMessage(giveplayerid, COLOR_GREEN, "|_________________ Gunshop ________________|");
					}
					else if(GroupHavePerm(grupaUID, PERM_MEDIC) || GroupHavePerm(grupaUID, PERM_FIREDEPT))
					{
						SendClientMessage(giveplayerid, COLOR_ALLDEPT, sprintf("|______________ Identyfikator %s ______________|", GroupInfo[grupaUID][g_ShortName]));
						format(string, sizeof(string), "Numer identyfikatora: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], GroupPlayerDutyRank(playerid), GetPhoneNumber(playerid), PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imię i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", GroupRanks[grupaUID][PlayerInfo[playerid][pGrupaRank][slot-1]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						SendClientMessage(giveplayerid,COLOR_GRAD2,"Identyfikator uprawnia do uczestniczenia w akcjach");
						SendClientMessage(giveplayerid,COLOR_GRAD2,"służb. porz. oraz dowództwo w zakresie ochrony zdrowia");
						SendClientMessage(giveplayerid, COLOR_ALLDEPT, sprintf("|____ %s ____|", GroupInfo[grupaUID][g_Name]));
					}
					else if (grupaUID == FAMILY_SAD)
					{
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|______________ Legitymacja SCoSA _____________|");
						format(string, sizeof(string), "Imię i nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", GroupRanks[grupaUID][PlayerInfo[playerid][pGrupaRank][slot-1]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(PlayerInfo[playerid][pGrupaRank][slot-1] > 3)
						{
							SendClientMessage(giveplayerid,COLOR_GREEN,"TA OSOBA POSIADA IMMUNITET!");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_RED,"TA OSOBA NIE POSIADA IMMUNITETU!");
						}
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|______________ Legitymacja SCoSA _____________|");
					}
					else if (GroupHavePerm(grupaUID, PERM_GOV))
					{
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|___________ Legitymacja Urzędu Miasta __________|");
						format(string, sizeof(string), "Imię i nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Stopień: %s", GroupRanks[grupaUID][PlayerInfo[playerid][pGrupaRank][slot-1]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(PlayerInfo[playerid][pGrupaRank][slot-1] > 7)
						{
							SendClientMessage(giveplayerid,COLOR_GREEN,"TA OSOBA POSIADA IMMUNITET!");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_RED,"TA OSOBA NIE POSIADA IMMUNITETU!");
						}
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|_____________ Podpis: Burmistrz & Posiadacz __________|");
					}
					else
					{
						return sendErrorMessage(playerid, "Ta grupa nie posiada odznaki!");
					}
					//
					format(string, sizeof(string), "* %s pokazuje dokumenty %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				else
				{
					sendErrorMessage(playerid, "Gracz nie jest przed tobą !");
					return 1;
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Gracz jest OFFLINE!");
			return 1;
		}
	}
	return 1;
}
