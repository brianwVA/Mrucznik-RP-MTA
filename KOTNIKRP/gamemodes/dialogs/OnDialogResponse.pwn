//OnDialogResponse.pwn


IsDialogProtected(dialogid)
{
    switch(dialogid)
    {
        case D_PANEL_KAR_NADAJ..D_PANEL_KAR_ZNAJDZ_INFO, D_PERM, D_CREATE_ORG_NAME, D_CREATE_ORG_UID, D_PANEL_CHECKPLAYER, D_EDIT_RANG_NAME, D_OPIS_UPDATE, D_VEHOPIS_UPDATE: return true;
    }
    return false; //dodac dialogi z mysql
}

CheckDialogId(playerid, dialogid)
{
    if(dialogid < 0) return 0;
	if(dialogid != iddialog[playerid])
    {
        if(dialogid > 10000 && dialogid < 10500) return 0;
        GUIExit[playerid] = 0;
        //SendClientMessage(playerid, COLOR_RED, "Błędne ID GUI.");
        Log(serverLog, WARNING, "Błędne ID dialogu dla [%d] aktualny [%d] przypisany %d", playerid, dialogid,iddialog[playerid]);
        return 0;
    }
	return 1;
}

//ID DIALOGÓW 9900+ BIZNESY.
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(!CheckDialogId(playerid, dialogid)) return 1;

    if(IsDialogProtected(dialogid) || true) //MySQL anti injection
    {
		for(new i; i<strlen(inputtext); i++)
		{
			if(inputtext[i] == '%')
			{
                SendClientMessage(playerid, COLOR_PANICRED, "Nie można posiadać \"%\" w haśle");
				KickEx(playerid);
				return 0;
            }
		}
    }
	if(antyHider[playerid] != 1)
	{
		if(gettime() > GetPVarInt(playerid, "lastDialogCzitMsg"))
		{
			SetPVarInt(playerid, "lastDialogCzitMsg", gettime() + 60);
			new string[128];
			format(string, sizeof(string), "AdmWarn: %s[%d] <- ten gnoj czituje dialogi sprawdzcie co robi (DialogID: [%d]) ", GetNick(playerid), playerid, dialogid);
			SendAdminMessage(COLOR_YELLOW, string);	
		}
		return 1;
	}

	antyHider[playerid] = 0;
	
	if(dialogid == 9200)
	{
		if(!response)
		{
			new cnt = GetPVarInt(playerid, "zabierz_count");
			for(new i=0; i<cnt; i++)
			{
				new key[32]; format(key, sizeof(key), "zabierz_item_%d", i);
				if(GetPVarInt(playerid, key) != 0) DeletePVar(playerid, key);
			}
			DeletePVar(playerid, "zabierz_count");
			DeletePVar(playerid, "zabierz_target");
			return 1;
		}
		new sel = (listitem < 0) ? 0 : listitem;
		new cnt = GetPVarInt(playerid, "zabierz_count");
		if(cnt <= 0) { sendErrorMessage(playerid, "Brak danych dialogu."); return 1; }
		if(sel < 0 || sel >= cnt) { sendErrorMessage(playerid, "Nieprawidłowy wybór."); return 1; }
		new key[32]; format(key, sizeof(key), "zabierz_item_%d", sel);
		new itemid = GetPVarInt(playerid, key);
		if(itemid <= 0) { sendErrorMessage(playerid, "Nieprawidłowy przedmiot."); return 1; }
		new target = GetPVarInt(playerid, "zabierz_target");
		if(!IsPlayerConnected(target)) { sendErrorMessage(playerid, "Gracz nie jest dostępny."); return 1; }

		if (Item[itemid][i_OwnerType] != ITEM_OWNER_TYPE_PLAYER || Item[itemid][i_Owner] != PlayerInfo[target][pUID])
		{
			sendErrorMessage(playerid, "Ten przedmiot nie należy do tego gracza. :(");
			return 1;
		}

		if(GroupPlayerDutyPerm(playerid, PERM_POLICE))
		{
			new name[64]; strmid(name, Item[itemid][i_Name], 0, sizeof(name), sizeof(name));
			new type = Item[itemid][i_ItemType];
			new v1 = Item[itemid][i_Value1];
			new v2 = Item[itemid][i_Value2];
			new quant = Item[itemid][i_Quantity];
			new secret = Item[itemid][i_ValueSecret];
			//if(type == ITEM_TYPE_WEAPON && secret == 2) secret = 0;
			new newid = Item_Add(name, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], type, v1, v2, true, playerid, quant, secret);
			if(newid == -1) { sendErrorMessage(playerid, "Nie udało się przenieść przedmiotu."); return 1; }
			Item_Delete(itemid, true, quant);
			new string[128];
			format(string, sizeof(string), "* Oficer %s zabrał przedmiot %s.", GetNick(playerid), name);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Oficer %s zabrał Ci przedmiot %s.", GetNick(playerid), name);
			SendClientMessage(target, COLOR_LIGHTBLUE, string);
			Log(serverLog, WARNING, "%s zabral przedmiot %s (%d) od %s", GetPlayerLogName(playerid), name, newid, GetPlayerLogName(target));
			SetPVarInt(playerid, "lic-timer", gettime() + 30);
		}
		else
		{
			new name[64]; strmid(name, Item[itemid][i_Name], 0, sizeof(name), sizeof(name));
			new type = Item[itemid][i_ItemType];
			new v1 = Item[itemid][i_Value1];
			new v2 = Item[itemid][i_Value2];
			new quant = Item[itemid][i_Quantity];
			new secret = Item[itemid][i_ValueSecret];
			if(type == ITEM_TYPE_WEAPON && secret == 2) secret = 0;
			new newid = Item_Add(name, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], type, v1, v2, true, playerid, quant, secret);
			if(newid == -1) { sendErrorMessage(playerid, "Nie udało się przenieść przedmiotu."); return 1; }
			Item_Delete(itemid, true, quant);
			new string[128];
			format(string, sizeof(string), "* %s zabrał %s.", GetNick(playerid), name);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			format(string, sizeof(string), "* %s zabrał Ci przedmiot %s.", GetNick(playerid), name);
			SendClientMessage(target, COLOR_LIGHTBLUE, string);
			Log(serverLog, WARNING, "%s (przestepca) zabral przedmiot %s (%d) od %s", GetPlayerLogName(playerid), name, newid, GetPlayerLogName(target));
			PoziomPoszukiwania[playerid] += 3;
			SetPlayerCriminal(playerid, INVALID_PLAYER_ID, "Kradzież przedmiotu");
			SetPVarInt(playerid, "lic-timer", gettime() + 30);
		}
		
		for(new i=0; i<cnt; i++)
		{
			new key2[32]; format(key2, sizeof(key2), "zabierz_item_%d", i);
			if(GetPVarInt(playerid, key2) != 0) DeletePVar(playerid, key2);
		}
		DeletePVar(playerid, "zabierz_count");
		DeletePVar(playerid, "zabierz_target");
		return 1;
	}

	//Dialog od tokenu admina
	if(dialogid == 7981)
	{
		new string[258];
		if(!response) return 1;
        if(strval(inputtext)!=Token[playerid])
        {
	    	Token[playerid]=random(99999999);
	    	format(string, sizeof(string), "By uniknąć nadmiernego spamu na /w administratorów masz obowiązek przepisania Tokena.\nZapobiega to wiadomościom typu 'witam', 'pomożesz?'. Zadaj pytanie - prosto z mostu.\n\n%d",Token[playerid]);
			ShowPlayerDialogEx(playerid,7981,DIALOG_STYLE_INPUT,"Token",string,"Wybierz","Anuluj");
			return 1;
		}
		if(strlen(WiadomoscToken[playerid])<78)
        {
            format(string, sizeof(string), "«« %s (%d%s): %s", GetNick(TokenID[playerid]), TokenID[playerid], (!IsPlayerPaused(TokenID[playerid])) ? (""): (", AFK"), WiadomoscToken[playerid]);
            SendClientMessage(playerid, COLOR_YELLOW, string);
            
            format(string, sizeof(string), "»» %s (%d): %s", GetNick(playerid), playerid, WiadomoscToken[playerid]);
            SendClientMessage(TokenID[playerid], COLOR_NEWS, string);
            if(GetPlayerAdminDutyStatus(TokenID[playerid]) == 1)
            {
                iloscInWiadomosci[TokenID[playerid]] = iloscInWiadomosci[TokenID[playerid]]+1;
            }
            if(GetPlayerAdminDutyStatus(playerid) == 1)
            {
                iloscOutWiadomosci[playerid] = iloscOutWiadomosci[playerid]+1;
            }
            if(PlayerInfo[playerid][pPodPW] == 1 || PlayerInfo[TokenID[playerid]][pPodPW] == 1)
            {
                format(string, sizeof(string), "%s(%d) /w -> %s(%d): %s", GetNick(playerid), playerid, GetNick(TokenID[playerid]), TokenID[playerid], WiadomoscToken[playerid]);
                ABroadCast(COLOR_LIGHTGREEN,string,1,1);
            }
        }
        else 
        {
            if(strlen(WiadomoscToken[playerid])>78)
            {
                new text2[64];
                strmid(text2, WiadomoscToken[playerid], 79, strlen(WiadomoscToken[playerid]));
                strdel(WiadomoscToken[playerid], 79, strlen(WiadomoscToken[playerid]));

                format(string, sizeof(string), "«« %s (%d%s): %s [.]", GetNick(TokenID[playerid]), TokenID[playerid], (!IsPlayerPaused(TokenID[playerid])) ? (""): (", AFK"), WiadomoscToken[playerid]);
                SendClientMessage(playerid, COLOR_YELLOW, string);
            
                format(string, sizeof(string), "[.] %s", text2);
                SendClientMessage(playerid, COLOR_YELLOW, string);

                if(PlayerInfo[playerid][pPodPW] == 1 || PlayerInfo[TokenID[playerid]][pPodPW] == 1)
                {
                    format(string, sizeof(string), "%s(%d) /w -> %s(%d): %s [.]", GetNick(playerid), playerid, GetNick(TokenID[playerid]), TokenID[playerid], WiadomoscToken[playerid]);
                    ABroadCast(COLOR_LIGHTGREEN,string,1,1);
                    format(string, sizeof(string), "[.] %s", text2);
                    ABroadCast(COLOR_LIGHTGREEN,string,1,1);
                }      
                
                format(string, sizeof(string), "«« %s (%d): %s [.]", GetNick(playerid), playerid, WiadomoscToken[playerid]);
                SendClientMessage(TokenID[playerid], COLOR_NEWS, string);
                
                format(string, sizeof(string), "[.] %s", text2);
                SendClientMessage(TokenID[playerid], COLOR_NEWS, string);
                if(GetPlayerAdminDutyStatus(playerid) == 1)
                {
                    iloscOutWiadomosci[playerid] = iloscOutWiadomosci[playerid]+1;
                }
                if(GetPlayerAdminDutyStatus(TokenID[playerid]) == 1)
                {
                    iloscInWiadomosci[TokenID[playerid]] = iloscInWiadomosci[TokenID[playerid]]+1;
                }
            }
        }
	    Log(chatLog, WARNING, "%s PW do %s: %s", GetPlayerLogName(playerid), GetPlayerLogName(TokenID[playerid]), WiadomoscToken[playerid]);
        SavePlayerSentMessage(playerid, sprintf("%s wysłał wiadomość do %s: %s", GetNick(playerid), GetNick(TokenID[playerid]), WiadomoscToken[playerid]), FROMME);
        SavePlayerSentMessage(TokenID[playerid], sprintf("%s otrzymał wiadomość od %s: %s", GetNick(TokenID[playerid]), GetNick(playerid), WiadomoscToken[playerid]), TOME);
        //dźwięki
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        PlayerPlaySound(TokenID[playerid], 1057, 0.0, 0.0, 0.0);
        //zapisywanie do /re
        if(TokenID[playerid] != playerid) lastMsg[TokenID[playerid]] = playerid;
        //AntySPAM!!!!!
        SetTimerEx("AntySpamTimer",3000,0,"d",playerid);
		AntySpam[playerid] = 1;
		return 1;
	}

	//2.6.19
	if(dialogid == DIALOG_EATING)
	{
		if(response)
		{
			zjedz_OnDialogResponse(playerid, listitem);
		}
		return 1;
	}

	if(dialogid == D_CHOOSE_KEEP_GROUP)
	{
		if(!response)
		{
			sendErrorMessage(playerid, "Nie możesz anulować wybrou grupy!");
			DeletePVar(playerid, "keep_grp_count");
			for(new k = 0; k < 12; k++)
			{
				new keyk[32]; format(keyk, sizeof(keyk), "keep_grp_%d", k);
				if(GetPVarInt(playerid, keyk) != 0) DeletePVar(playerid, keyk);
			}

			new conflicted[12];
			new ccount = 0;
			new criminal_count = 0;
			new state_count = 0;
			for(new i = 0; i < MAX_PLAYER_GROUPS_PREMIUM && ccount < 12; i++)
			{
				new pgrp = PlayerInfo[playerid][pGrupa][i];
				if(pgrp <= 0) continue;
				if(GroupHavePerm(pgrp, PERM_GANG) || GroupHavePerm(pgrp, PERM_CRIMINAL) || GroupHavePerm(pgrp, PERM_MAFIA))
				{
					conflicted[ccount++] = pgrp;
					criminal_count++;
				}
				else if(GroupHavePerm(pgrp, PERM_POLICE) || GroupHavePerm(pgrp, PERM_MEDIC))
				{
					conflicted[ccount++] = pgrp;
					state_count++;
				}
			}

			if((criminal_count > 0 && state_count > 0) || criminal_count > 1)
			{
				new options[1024];
				for(new j = 0; j < ccount; j++)
				{
					new name[64];
					strmid(name, MruMySQL_GetNameFromUID(GroupInfo[conflicted[j]][g_Leader]), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
					if(!strlen(name)) format(name, sizeof(name), "%s", GroupInfo[conflicted[j]][g_ShortName]);
					if(j == 0)
						format(options, sizeof(options), "%d. %s", j+1, GroupInfo[conflicted[j]][g_Name]);
					else
						format(options, sizeof(options), "%s\n%d. %s", options, j+1, GroupInfo[conflicted[j]][g_Name]);
					new key[32]; format(key, sizeof(key), "keep_grp_%d", j);
					SetPVarInt(playerid, key, conflicted[j]);
				}
				SetPVarInt(playerid, "keep_grp_count", ccount);
				ShowPlayerDialogEx(playerid, D_CHOOSE_KEEP_GROUP, DIALOG_STYLE_LIST, "Wybierz grupę, w której chcesz pozostać:", options, "Wybieram", "Anuluj");
				return 1;
			}
			return 1;
		}


		new cnt = GetPVarInt(playerid, "keep_grp_count");
		if(cnt <= 0) return 1;
		new sel = (listitem < 0) ? 0 : listitem;
		if(sel < 0) sel = 0; if(sel >= cnt) sel = cnt-1;
		new keySel[32]; format(keySel, sizeof(keySel), "keep_grp_%d", sel);
		new sel_gid = GetPVarInt(playerid, keySel);
		for(new m = 0; m < cnt; m++)
		{
			new keym[32]; format(keym, sizeof(keym), "keep_grp_%d", m);
			new gid = GetPVarInt(playerid, keym);
			if(gid <= 0)
			{
				DeletePVar(playerid, keym);
				continue;
			}
			if(m != sel)
			{
				if(GroupHavePerm(sel_gid, PERM_POLICE) || GroupHavePerm(sel_gid, PERM_MEDIC))
				{
					if(GroupHavePerm(gid, PERM_GANG) || GroupHavePerm(gid, PERM_CRIMINAL) || GroupHavePerm(gid, PERM_MAFIA))
					{
						GroupRemovePlayer(playerid, gid, 1, INVALID_PLAYER_ID);
					}
				}
				else if(GroupHavePerm(sel_gid, PERM_GANG) || GroupHavePerm(sel_gid, PERM_CRIMINAL) || GroupHavePerm(sel_gid, PERM_MAFIA))
				{
					if(GroupHavePerm(gid, PERM_POLICE) || GroupHavePerm(gid, PERM_MEDIC) || GroupHavePerm(gid, PERM_GANG) || GroupHavePerm(gid, PERM_CRIMINAL) || GroupHavePerm(gid, PERM_MAFIA))
					{
						GroupRemovePlayer(playerid, gid, 1, INVALID_PLAYER_ID);
					}
				}
				else
				{
					GroupRemovePlayer(playerid, gid, 1, INVALID_PLAYER_ID);
				}
			}
			DeletePVar(playerid, keym);
		}
		DeletePVar(playerid, "keep_grp_count");
		sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Wybrano grupę i usunięto pozostałe.");
		SetPlayerSpawnPos(playerid);
		return 1;
	}
	if(dialogid == DIALOG_COOKING)
	{
		if(response)
		{
			ugotuj_OnDialogResponse(playerid, listitem);
		}
		return 1;
	}
	

	//2.5.8
	premium_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	hq_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);


	//2.6.18
	ibiza_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	OnDialogResponseOnede(playerid, dialogid, response, listitem);
	OnDialogResponseNarko(playerid, dialogid, response, listitem);
	OnDialogResponseNarko2(playerid, dialogid, response, listitem, inputtext);
	Drwal_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	if(ulepszsadzonki_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;

	//2.6.19
	graffiti_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	if(biznesy_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(attachemnts_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(pojazdy_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;

	//2.7.11 - wciąż nie 3.0
	if(Motele_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(MRPAC_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(Tune_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(Tattoo_OnDialogResponse(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(OnDialogResponseKary(playerid, dialogid, response, listitem, inputtext)) return 1;
	if(OnDialogResponseBilb(playerid, dialogid, response, listitem, inputtext)) return 1;
	//2.7.5 - nadal nie 3.0

	if(OnDialogForex(playerid, dialogid, response, listitem, inputtext)) return 1;

	//Przeniesione z grupy_callbacks.pwn (bo w hook się nie wykonuje)
	if(dialogid == D_AGROUP_MANAGE_SKINS)
	{
		return grupy_dialog_deleteSkin(playerid, response, inputtext);
	}
	//

	if(dialogid == DIALOGID_UNIFORM_FRAKCJA)
	{
		if(response)
		{
			new groupid = GetPVarInt(playerid, "skin-group");
			if(!IsValidGroup(groupid)) return 1;
			//new skin = GroupInfo[groupid][g_Skin][listitem];
			new skin = strval(inputtext);
			if(skin < 1)
				return sendErrorMessage(playerid, "Ten skin jest nieprawidłowy, zgłoś to do swojego lidera!");
			new slot = GetPlayerGroupSlot(playerid, groupid);
			if(slot == 0) return 0;
			slot--;
			PlayerInfo[playerid][pGrupaSkin][slot] = skin;
			if(OnDuty[playerid] == slot+1)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
				{
					PlayerInfo[playerid][pUniform] = skin;
					SetPlayerSpawnSkin(playerid);
				}
				va_SendClientMessage(playerid, COLOR_GRAD2, "Pomyślnie wybrałeś nowy skin w grupie %s", GroupInfo[groupid][g_ShortName]);
				return 1;
			}
			va_SendClientMessage(playerid, COLOR_GRAD2, "Pomyślnie wybrałeś nowy skin w grupie %s, wejdź na służbę, aby go założyć!", GroupInfo[groupid][g_ShortName]);
		}
	}
	else if(dialogid==D_APTEKA)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
					SendClientMessage(playerid, CLR_RED,"Kupiłeś GRIPEX za "#PRICE_GRIPEX"$");
					ZabierzKaseDone(playerid, PRICE_GRIPEX);
					SetPlayerHealth(playerid,100); // XD
					SendClientMessage(playerid, CLR_RED,"Użyłeś GRIPEX, dodano tobie 45hp");
					return 1;
			}
			case 1:
			{
					SendClientMessage(playerid, CLR_RED,"Kupiłeś APAP za "#PRICE_APAP"$");
					ZabierzKaseDone(playerid,PRICE_APAP);
					SetPlayerHealth(playerid,100); // XD
					SetPlayerDrunkLevel(playerid,0);
					SendClientMessage(playerid, CLR_RED,"Użyłeś APAP, dodano tobie 50hp");
					return 1;
			}
		}
		return 1;
	}
	else if(dialogid == D_NEWRADIO)
	{
		if(!response) return 0;
		printf("%d %d %d %s %s %s", dialogid, listitem, playerid, inputtext, Radio[listitem][0], Radio[listitem][1]);
		PlayerFixRadio(playerid);
		new veh = GetPlayerVehicleID(playerid);
		if(strfind(inputtext, "Radio SAN 1") != -1)
		{
			if(RadioSANUno[0] != EOF)
			{
				if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
				{
					foreach(new i : Player)
					{
						if(IsPlayerInVehicle(i, veh))
						{
							PlayAudioStreamForPlayer(i, RadioSANUno);
							SetPVarInt(i, "sanlisten", 1);
						}
					}
				}
				else
					PlayAudioStreamForPlayer(playerid, RadioSANUno);
			}
		}
		else if(strfind(inputtext, "Radio SAN 2") != -1)
		{
			if(RadioSANDos[0] != EOF)
			{
				if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
				{
					foreach(new i : Player)
					{
						if(IsPlayerInVehicle(i, veh))
						{
							PlayAudioStreamForPlayer(i, RadioSANDos);
							SetPVarInt(i, "sanlisten", 2);
						}
					}
				}
				else
					PlayAudioStreamForPlayer(playerid, RadioSANDos);
			}
		}
		else
		{
			if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				foreach(new i : Player)
				{
					if(IsPlayerInVehicle(i, veh))
					{
						PlayAudioStreamForPlayer(i, Radio[listitem][1]);
					}
				}
			}
			else
				PlayAudioStreamForPlayer(playerid, Radio[listitem][1]);
		}
	}
	else if(dialogid == 503)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX,  " » Jak zacząć", "Witaj. Wygląda na to, że potrzebujesz informacji odnośnie rozgrywki na naszym serwerze! \n Po pierwsze udaj się po telefon komórkowy do sklepu 24/7.\n Nie masz pieniędzy? Nic straconego! Na mapie żółtymi kropkami oznaczone są prace dorywcze.\n", "Dalej", "Anuluj");
			}
			case 1:
			{
				new str22[512];
				format(str22, sizeof(str22), "%s Pamiętaj, że RolePlay polega na odgrywaniu realnego życia postaci, którą stworzyłeś(aś).\n1. Wyobraź sobie, że jesteś aktorem, który gra tę postać w serialu. Na tym polega RolePlay.\n", str22);
				format(str22, sizeof(str22), "%s 2. Aktor nie wie wszystkiego o postaci i jej wirtualnym świecie. Zna też innych aktorów (graczy), którzy grają inne postacie.\n", str22);
				format(str22, sizeof(str22), "%s 3. Postać NIE wie wszystkiego tego, co aktor, i nie zna wszystkich pozostałych postaci. Ona poprostu żyje w mieście.\n", str22);
				format(str22, sizeof(str22), "%s 4. Wy - gracze/aktorzy - i wszystko, co wiecie lub piszecie między sobą, to informacje OOC. Realny świat to jest OOC.\n", str22);
				format(str22, sizeof(str22), "%s 5. Gdy wypowiadasz się jako postać (do innej wirtualnej postaci), bądź wykonujesz nią jakąś czynność, robisz to IC.\n", str22);

				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, " » OOC i IC", str22, "Koniec", "Anuluj");
			}
			case 2:
			{
				SendClientMessage(playerid, KOLOR_SZARY, "*** CZATY *** /me (opis czynności), /do (opis otoczenia), /w (wiadomość), /re (odpowiedź) /k(rzycz), /s(zept)");
				SendClientMessage(playerid, KOLOR_SZARY, "*** CMD ***/stats, /p (przedmioty), /g (grupy), /v (pojazdy), /o (oferty), /drzwi /b, /w, /re(play), /raport, /t(elefon)");
				SendClientMessage(playerid, KOLOR_SZARY, "*** CMD ***/spawn, /drzwi, /plac, /tankuj, /przejazd, /u, /p, /bank, /brama, /v, /tog, /pokaz, /hotel, /o(ferty)");
				SendClientMessage(playerid, KOLOR_SZARY, "*** CMD ***/kup, /akceptujsmierc, /zwolnij, /a, /pomoc, /anim(acje) /zamknij, /opis, /wyrzuc, /craft, /sms, /zapukaj");
    			SendClientMessage(playerid, COLOR_GRAD1,"*** KASYNO *** /ruletka /kolo");
    			//SendClientMessage(playerid, COLOR_GRAD1,"*** NARKOTYKI *** /nsprawdz /nposadz /nuzyj /npodaj");
    			SendClientMessage(playerid, COLOR_GRAD1,"*** KONTO *** /stats /nextlevel /ulepszenia /personalizuj");
    			SendClientMessage(playerid, COLOR_GRAD2,"*** CMD *** /pierwszaosoba /plac /datek /czas /kup /wyrzucbronie /dajkluczyki /id /pij /muzyka /pokazlicencje /ubranie");
    			SendClientMessage(playerid, COLOR_GRAD2,"*** CMD *** /resetulepszen(100k) /lock /skill /licencje /lotto /zmienspawn /stopani /pobij /wyscigi");
    			SendClientMessage(playerid, COLOR_GRAD2,"*** CMD *** /report /anuluj /akceptuj /wywal /kontrakt /tankuj /kanister /oczysc /wezwij /rodziny");
    			SendClientMessage(playerid, COLOR_GRAD2,"*** CMD *** (/p)rzedmioty /naprawpojazd /wywalmaterialy /wywaldragi /ugotuj /screenshot /przywitaj /wskill"); 
    			SendClientMessage(playerid, COLOR_GRAD2, "*** PRZEDMIOTY *** /(p)rzedmioty /bagaznik");
    			SendClientMessage(playerid, COLOR_GRAD3,"*** CHAT *** (/w)iadomosc (/o)oc (/k)rzyk (/s)zept (/l)ocal (/b) (/og)loszenie /me (/n)ewbie /sprobuj /apteczka");
    			SendClientMessage(playerid, COLOR_GRAD3,"*** BLOKADY *** /togooc /togdepo /togfam /togw /togtel /toglicznik /tognewbie /togadmin");
    			SendClientMessage(playerid, COLOR_GRAD4,"*** BANK *** /stan /wyplac /bank /przelew /kb(kontobankowe)");
    			if(PlayerInfo[playerid][pJob] == 1) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /namierz /wanted /poddajsie /zlecenie (/m)egafon"); }
    			else if(PlayerInfo[playerid][pJob] == 2 || CheckPlayerPerm(playerid, PERM_LAWYER)) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** Prawnik *** /uwolnij /oczyscmdc /zbijwl /wanted /kuppozwolenie"); }
    			else if(PlayerInfo[playerid][pJob] == 3) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /sex"); }
    			else if(PlayerInfo[playerid][pJob] == 4) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /sprzedajdragi /get drugs /wezdragi"); }
    			else if(PlayerInfo[playerid][pJob] == 5) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /ukradnij"); }
    			else if(CheckPlayerPerm(playerid, PERM_NEWS)) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** SAN NEWS *** /wywiad /news [text] /reflektor /studia /glosnik /radiostacja");
    			SendClientMessage(playerid,COLOR_GRAD5,"*** SAN NEWS *** Płatny numer SMS - /sms [od 100 do 150]");
    			SendClientMessage(playerid,COLOR_GRAD5,"*** SAN NEWS *** /zamknijlinie /otworzlinie /linie"); }
    			else if(PlayerInfo[playerid][pJob] == 7 || HasPerm(playerid, PERM_MECHANIC)) {
    			SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /napraw /tankowanie /sluzba /sprawdzneon /sprzedajzestaw"); }// /nitro /hydraulika /maluj /felga /zderzak");
				//SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /kolory /malunki /felgi /sluzba"); }
				else if(PlayerInfo[playerid][pJob] == 8) {
				SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /ochrona"); }
				else if(PlayerInfo[playerid][pJob] == 9) {
				SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /materialy /sprzedajbron"); }
				else if(PlayerInfo[playerid][pJob] == 12) {
				SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /walka /boxstats /naucz"); }
				else if(CheckPlayerPerm(playerid, PERM_TAXI)) {
				SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /zlecenie - nowe zlecenia są od wyższego skilla!"); 
				SendClientMessage(playerid,COLOR_GRAD5,"*** WYSCIGI *** /stworzwyscig /wyscigi /wyscig /wyscig_start /wyscig_stop /cp /cp-usun /meta");}
				else if(CheckPlayerPerm(playerid, PERM_TAXI) || PlayerInfo[playerid][pJob] == 10) {
				SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /fare /businfo"); }
				else if(PlayerInfo[playerid][pJob] == 15) {
				SendClientMessage(playerid,COLOR_GRAD5,"*** PRACA *** /gazety /wezgazete /gazeta"); }
				if(CheckPlayerPerm(playerid, PERM_GOV)){
				SendClientMessage(playerid,COLOR_GRAD5,"*** DMV *** /startlekcja /stoplekcja /zaliczegz /dajlicencje /odmv /cdmv"); }
				if(CheckPlayerPerm(playerid, PERM_HITMAN)){
				SendClientMessage(playerid,COLOR_GRAD5,"*** Hitman Agency *** /laptop /zmienskin /reklama /namierz"); }
				if(CheckPlayerPerm(playerid, PERM_BOR)){
				SendClientMessage(playerid,COLOR_GRAD5,"*** GSA *** /wywalzdmv"); }
				if(CheckPlayerPerm(playerid, PERM_MECHANIC)){
				SendClientMessage(playerid,COLOR_GRAD5,"*** FDU *** /tuning /napraw /tankowanie /sluzba");
				SendClientMessage(playerid,COLOR_GRAD5,"*** WYSCIGI *** /stworzwyscig /wyscigi /wyscig /wyscig_start /wyscig_stop /cp /cp-usun /meta");         }
				if(IsAPrzestepca(playerid, 0)){
				SendClientMessage(playerid,COLOR_GRAD5,"*** Przestępcze *** /pobij /zwiaz /odwiaz /wepchnij /sprzedaja /maska /zabierzgps /graffiti /zrobnapad");
				SendClientMessage(playerid, COLOR_GRAD2, "*** Boombox *** /(boombox) off | /boombox on | /boombox url [URL] | /boombox znajdz");}
				if(CheckPlayerPerm(playerid, PERM_CLUB)) SendClientMessage(playerid,COLOR_GRAD5,"*** Klub *** /dajbilet");				
				if(CheckPlayerPerm(playerid, PERM_RESTAURANT))
				{
					SendClientMessage(playerid, COLOR_GRAD5, "*** Restauracja *** /sprzedajprodukt /menu");
				}
				if(CheckPlayerPerm(playerid, PERM_STRZELNICA))
				{
					SendClientMessage(playerid, COLOR_GRAD5, "*** Strzelnica *** /strzelnicawstep");
				}
				if(CheckPlayerPerm(playerid, PERM_CLUB)) SendClientMessage(playerid,COLOR_GRAD5,"*** Klub *** /dajbilet /ibiza /konsola  /sprzedajalkohol /wywalibiza /zabierzbilet /glosnik");
				if (IsAPolicja(playerid, 0))
				{
					SendClientMessage(playerid, COLOR_GRAD5, "*** Policja *** /przeszukaj /zabierz /mandat /wywaz /gps /fgps /odznaka /maska");
					SendClientMessage(playerid, COLOR_GRAD5, "*** Policja *** /barierka /kajdanki /rozkuj /mdc /aresztuj /poszukiwani");
					SendClientMessage(playerid, COLOR_GRAD5, "*** Policja *** (/r)adio (/d)epartment /ro(radiooc) /depo(departamentooc) (/m)egafon (/su)spect");
					SendClientMessage(playerid, COLOR_GRAD5, "*** Policja *** /togcrime /red /c /tablet /togro /fed /pozwolenie");
					SendClientMessage(playerid, COLOR_GRAD5, "*** Policja *** /mpd /mir /bagaznik przeszukaj /zniszcz /tazer");
				}
				if (IsPlayerInGroup(playerid, FRAC_FBI))
				{
					SendClientMessage(playerid, COLOR_GRAD5, "*** FBI *** /zmienskin /namierz /(fed)eralne /fgps /gps");
				}
				if (IsPlayerInGroup(playerid, 17) || PlayerInfo[playerid][pLider] == 17)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "*** Straż *** /straz /megafon /czysc");
				}
				if (IsAMedyk(playerid, 0))
				{
					SendClientMessage(playerid, COLOR_GRAD5, "*** Lekarz *** (/d)epartment /sluzba /sprzedajapteczke /togbw /togdepo /gps /fgps");
					SendClientMessage(playerid, COLOR_GRAD5, "*** Lekarz *** /ulecz /apteczka /zastrzyk /diagnoza /zmienplec /kuracja /maseczka");
				}
				if(CheckPlayerPerm(playerid, PERM_TATTOO))
					return SendClientMessage(playerid, COLOR_GRAD5, "*** Tatuażysta *** /tatuaz");
				if (PlayerInfo[playerid][pAdmin] >= 1)
				{
					SendClientMessage(playerid, COLOR_GRAD6, "*** ADMIN *** (/a)dmin (/ah)elp");
				}
				SendClientMessage(playerid, COLOR_GRAD6,"*** INNE *** /telefonpomoc /dompomoc /wynajempomoc /bizpomoc /rybypomoc /ircpomoc /anim");
				SendClientMessage(playerid, COLOR_GRAD6,"*** INNE *** Pomoc od supportu: {FFFFFF}/support");
				sendTipMessage(playerid, "TIP: Pamiętaj, że aby uzyskać dostęp do większości komend/uprawnień grupy musisz być na jej służbie!");
				return 1;
			}
			case 3:
			{
				new str22[512];
				format(str22, sizeof(str22), "%sNa naszym serwerze i jak na innych animacje są potrzebne do rozgrywki, więc dodaliśmy je w odświeżonym stylu.\n", str22);
				format(str22, sizeof(str22), "%sSą dwie drogi, by użyć animacji. Możesz wybrać ją z listy (/anim) lub wpisać w okno czatu wybraną metodę.\n*\t@animacja\n\n", str22);
				format(str22, sizeof(str22), "%sZatem wpisanie '@idz2' to to samo, co wybranie jej z listy. To od Ciebie zależy, który sposób wybierzesz.", str22);
				ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX,  " » Animacje", str22, "Koniec", "Anuluj");

			}
			case 4:
			{
				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX,  " » Pojazdy", "Na naszym serwerze możesz posiadać dowolną ilość pojazdów. Wpisz /v, aby zespawnować lub odspawnować dowolny z pojazdów.\n\n!!Użyj /v namierz, gdy nie widzisz swojego pojazdu. Pozwoli Ci to zlokalizować go, ustawiając\nczerwony marker na mapie.", "Dalej", "Anuluj");
			}
			case 5:
			{
				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX,  " » Przedmioty", "Przedmioty można zakupić od innych graczy, w ich firmach lub sklepach 24/7.\nAby wylistować posiadane przedmioty użyj komendy /p.\nZ jej pomocą możesz podnosić przedmioty znajdujące się na ziemi.", "Dalej", "Anuluj");
			}
			case 6:
			{
				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX,  " » Oferty", "Oferty umożliwiają mocno skryptowo interakcje z drugim graczem. [ BETA ]", "Koniec", "Anuluj");
			}
			case 8:
			{
				new str22[512];
				format(str22, sizeof(str22), "%sListy twoich statystyk jak i rzeczy do których należysz: /stats\n*\tWypowiedzi poprzedza się jednym znakiem (a nie komendą), tak jak w przypadku pisania na kanale OOC postaci.\n", str22);
				format(str22, sizeof(str22), "%s*\tKomenda /ro odpowiada za czat OOC, a komenda /r - za czat IC.\n\n", str22);

				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, " » Czaty grupowe", str22, "Koniec", "Anuluj");

			}
			case 9:
			{
				new str22[512];
				SendClientMessage(playerid, COLOR_YELLOW,"Discord: https://discord.gg/X7HuT7CwPB" );
				SendClientMessage(playerid, COLOR_GREEN,"Forum: M-RP" );


				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, " » Discord i forum", str22, "Koniec", "Anuluj");

			}
			case 10:
			{
				new str22[512];
				SendClientMessage(playerid, KOLOR_NIEBIESKI,"System Obiektow: /mc /md /msel /msave /mmat");
				return ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, " » System Obiektow", str22, "Koniec", "Anuluj");
			}

		}
		return 1;
	}
	else if(dialogid == D_JOB_CENTER_DIALOG)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0: ShowPlayerDialogEx(playerid, D_JOBTYPE_MECHANIK, DIALOG_STYLE_MSGBOX, "M-RP » Mechanik", "Naprawiaj, tankuj, tunninguj, odbieraj zlecenia z terenu\nTo przede wszytkim robi mechanik.\nZarobki nie są na początku oszałamiające, jakieś 3k-7k co godzinę\nJednak zdobywa się je dość łatwo i przyjemnie. Pracy dla mechaników nigdy nie brakuje.\nWyższy skill pozwala się poruszać specjalnymi pojazdami.\n Oraz umożliwia tunningowanie pojazdów, ktore jest bardziej dochodowe niż ich serwisowanie.\n\nKontrakt pracy trwa 5 godzin i przez ten czas nie możesz zmienić pracy!", "Dołącz", "Anuluj");
			case 1: ShowPlayerDialogEx(playerid, D_JOBTYPE_OCHRONIARZ, DIALOG_STYLE_MSGBOX, "M-RP » Ochroniarz", "Możesz ochraniać ludzi, jednak jest to tylko przykrywka dla sprzedawania pancerzy\nPraca jest dość monotonna gdyż praktycznie polega na wciskaniu wszytkim kamizelki kuloodpornej.\nPodobno niektórzy przy dużym szczęściu potrafia zarobić nawet 90k-130k. Jednak normą jest 10k a przy dużym pechu 2k.\n\nKontrakt pracy trwa 5 godzin i przez ten czas nie możesz zmienić pracy!", "Dołącz", "Anuluj");
			case 2: ShowPlayerDialogEx(playerid, D_JOBTYPE_PIZZABOY, DIALOG_STYLE_MSGBOX, "M-RP » Pizzaboy", "Praca polega na rozwożeniu pizzy do głodnych klientów.\nW tej pracy zarabiasz między innymi na napiwkach.\nNapiwki zależne są od tego jak szybko dostarczysz pizzę.\n\nKontrakt pracy trwa 5 godzin i przez ten czas nie możesz zmienić pracy!", "Dołącz", "Anuluj");
			case 3: ShowPlayerDialogEx(playerid, D_JOBTYPE_BOX, DIALOG_STYLE_MSGBOX, "M-RP » Trener boksu", "Jako bokser bierzesz udział w galach boksu, toczysz za pieniądze sparingi z innymi i uczysz nowych technik walki.\nJednak prawda jest taka, że gale są bardzo rzadko, za sparingi mało kto chce płacić i tak naprawdę pełnisz rolę nauczyciela.\nZarobki są bardzo zróżnicowane i zależą od skilla. Zazwyczaj jest to ok. 30k ale nie jest to zarobek regularny.\n\nKontrakt pracy trwa 5 godzin i przez ten czas nie możesz zmienić pracy!", "Dołącz", "Anuluj");
			case 4: sendTipMessage(playerid, "Ta praca jest wyłączona!");
			case 5: ShowPlayerDialogEx(playerid, D_JOBTYPE_TAXI, DIALOG_STYLE_MSGBOX, "M-RP » Taksówkarz", "Praca taksówkarza polega na przewożeniu pasażerów z jednego miejsca do drugiego za pomocą taksówki. Taksówkarz musi posiadać prawo jazdy!\nPodczas pracy taksówkarz korzysta z urządzenia taksometru, który określa cenę za przejazd na podstawie przebytej drogi i czasu podróży.\nTaksówkarz musi również znać topografię miasta oraz najlepsze trasy, aby dotrzeć do celu jak najszybciej i najbezpieczniej dla pasażera.", "Dołącz", "Anuluj");
		}   
	}
	else if(dialogid == D_JOBTYPE_TAXI){
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!");
		if(PlayerInfo[playerid][pCarLic] != 1) return sendTipMessage(playerid, "BŁĄD: Do tej pracy potrzebujesz prawa jazdy!");
		if(response)
		{
			new result = GroupAddPlayer(playerid, FRAC_KT, 3);
			if(result == -1)
				return sendErrorMessage(playerid, "BŁĄD: Jesteś już zatrudniony jako taksówkarz.");
			else if(result == -2)
				return sendErrorMessage(playerid, "BŁĄD: Nie możesz podjąć się tej pracy.");
			else if(result == -3)
				return sendErrorMessage(playerid, "BŁĄD: Nie posiadasz już żadnych wolnych slotów grupowych.");
			else if(!result)
				return sendErrorMessage(playerid, "Wystąpił nieznany błąd.");
			sendTipMessage(playerid, "Podpisałeś kontrakt w pracy taksówkarza! Pod /pomoc i /g znajdziesz potrzebne komendy");
		}
		else return 1;
	}

	else if (dialogid == D_JOBTYPE_LOWCA)
	{
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!"); 
		if(PlayerInfo[playerid][pGunLic] == 0) return sendTipMessage(playerid, "BŁAD: Do tej pracy potrzebujesz licencji na broń!");
		if(response) 
		{
			sendTipMessage(playerid, "Podpisałeś kontrakt na 5 godzin w pracy łowcy nagród! Pod /pomoc znajdziesz potrzebne komendy");
			PlayerInfo[playerid][pJob] = 1;
		}
		else return 1;
	}
	else if (dialogid == D_JOBTYPE_PRAWNIK)
	{
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!"); 
		if(response)
		{
			sendTipMessage(playerid, "Podpisałeś kontrakt na 5 godzin w pracy prawnika! Pod /pomoc znajdziesz potrzebne komendy");
			PlayerInfo[playerid][pJob] = 2;
		}
		else return 1;
	}
	else if (dialogid == D_JOBTYPE_MECHANIK)
	{
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!"); 
		if(response) 
		{
			sendTipMessage(playerid, "Podpisałeś kontrakt na 5 godzin w pracy mechanika! Pod /pomoc znajdziesz potrzebne komendy");
			PlayerInfo[playerid][pJob] = 7;
		}
		else return 1;
	}
	else if (dialogid == D_JOBTYPE_OCHRONIARZ)
	{
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!"); 
		if(response) 
		{
			sendTipMessage(playerid, "Podpisałeś kontrakt na 5 godzin w pracy ochroniarza! Pod /pomoc znajdziesz potrzebne komendy");
			PlayerInfo[playerid][pJob] = 8;
		}
		else return 1;
	}
	else if (dialogid == D_JOBTYPE_PIZZABOY)
	{
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!"); 
		if(response) 
		{
			sendTipMessage(playerid, "Podpisałeś kontrakt na 5 godzin w pracy pizzaboya! Pod /pomoc znajdziesz potrzebne komendy");
			PlayerInfo[playerid][pJob] = 11;
		}
		else return 1;
	}
	else if (dialogid == D_JOBTYPE_BOX)
	{
		if(PlayerInfo[playerid][pJob] > 0) return sendTipMessage(playerid, "BŁĄD: Wystąpił poważny błąd, zgłoś to do Administracji!"); 
		if(response) 
		{
			sendTipMessage(playerid, "Podpisałeś kontrakt na 5 godzin w pracy trenera boksu! Pod /pomoc znajdziesz potrzebne komendy");
			PlayerInfo[playerid][pJob] = 12;
		}
		else return 1;
	}
	if(dialogid == DIALOG_WALKSTYLE)
	{
		if(response)
		{
			if(listitem == 0)
			{
				SetPlayerWalkingStyle (playerid, WALK_NORMAL);
			    return 1;
			}
			if(listitem == 1)
			{
				SetPlayerWalkingStyle (playerid, WALK_PED);
			    return 1;
			}
			if(listitem == 2)
			{
			    SetPlayerWalkingStyle (playerid, WALK_GANGSTA);
			    return 1;
			}
			if(listitem == 3)
			{
				SetPlayerWalkingStyle (playerid, WALK_GANGSTA2);
			    return 1;
			}
			if(listitem == 4)
			{
			    SetPlayerWalkingStyle (playerid, WALK_OLD);
			    return 1;
			}
			if(listitem == 5)
			{
			    SetPlayerWalkingStyle (playerid, WALK_FAT_OLD);
			    return 1;
			}
			if(listitem == 6)
			{
			    SetPlayerWalkingStyle (playerid, WALK_FAT);
			    return 1;
			}
			if(listitem == 7)
			{
			    SetPlayerWalkingStyle (playerid, WALK_LADY);
			    return 1;
			}
			if(listitem == 8)
			{
			    SetPlayerWalkingStyle (playerid, WALK_LADY2);
			    return 1;
			}
			if(listitem == 9)
			{
			    SetPlayerWalkingStyle (playerid, WALK_WHORE);
			    return 1;
			}
			if(listitem == 10)
			{
			    SetPlayerWalkingStyle (playerid, WALK_WHORE2);
			    return 1;
			}
			if(listitem == 11)
			{
			    SetPlayerWalkingStyle (playerid, WALK_DRUNK);
			    return 1;
			}
			if(listitem == 12)
			{
			    SetPlayerWalkingStyle (playerid, WALK_BLIND);
			    return 1;
			}
			if(listitem == 13)
			{
			    SetPlayerWalkingStyle (playerid, WALK_DEFAULT);
			    return 1;
			}
		}
		return 1;
	}
	//2.5.2
	else if(dialogid == DIALOG_HA_ZMIENSKIN(0))
	{
		if(response)
		{
			if(!IsValidGroup(listitem+1)) return 1;
			if(!IloscSkinow(listitem+1))
			{
				sendErrorMessage(playerid, "Ta grupa nie ma skinów");
				ShowPlayerDialogEx(playerid, DIALOG_HA_ZMIENSKIN(0), DIALOG_STYLE_LIST, "Zmiana ubrania", DialogListaFrakcji(), "Start", "Anuluj");
				return 1;
			}
			ShowPlayerDialogEx(playerid, DIALOG_HA_ZMIENSKIN(listitem+1), DIALOG_STYLE_PREVMODEL, "Zmiana ubrania", DialogListaSkinow(listitem+1), "Start", "Anuluj");
		}
	}
	else if(dialogid >= DIALOG_HA_ZMIENSKIN(1) && dialogid <= DIALOG_HA_ZMIENSKIN(MAX_GROUPS))
	{
		if(response)
		{
			new string[64];
			//SetPlayerSkinEx(playerid, GroupInfo[dialogid-DIALOG_HA_ZMIENSKIN(0)][g_Skin][listitem]);
			SetPlayerSkinEx(playerid, strval(inputtext));
			format(string, sizeof(string), "* %s zdejmuje ubrania i zakłada nowe.", GetNick(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else
		{
			ShowPlayerDialogEx(playerid, DIALOG_HA_ZMIENSKIN(0), DIALOG_STYLE_LIST, "Zmiana ubrania", DialogListaFrakcji(), "Start", "Anuluj");
		}
	}
	else if(dialogid == 9520)
	{
	    new kasa = GetPVarInt(playerid, "Mats-kasa");
        new giveplayerid = GetPVarInt(playerid, "Mats-id");
        new moneys = GetPVarInt(playerid, "Mats-mats");
        new string[256];
		if(!response)
		{
		    SetPVarInt(playerid, "OKupMats", 0);
			SetPVarInt(giveplayerid, "OSprzedajMats", 0);
			SetPVarInt(playerid, "Mats-kasa", 0);
        	SetPVarInt(playerid, "Mats-id", 0);
        	SetPVarInt(playerid, "Mats-mats", 0);
        	sendErrorMessage(playerid, "Sprzedaż została anulowana!");
        	sendErrorMessage(giveplayerid, "Sprzedaż została anulowana!");
			return 1;
		}
		if(kaska[playerid] < kasa) return sendErrorMessage(playerid, "Nie masz tyle kasy!");
		if(CountMats(giveplayerid) < moneys) return sendErrorMessage(playerid, "Gracz nie ma tyle materiałów!");
		if(GetPVarInt(playerid, "OKupMats") == 0) return sendErrorMessage(playerid, "Coś poszło nie tak! (kupno)");
        //if(GetPVarInt(playerid, "OSprzedajMats") == 0) return sendErrorMessage(playerid, "Coś poszło nie tak! (sprzedaż)");
		if(GetPVarInt(giveplayerid, "OSprzedajMats") == 1)
		{
			format(string, sizeof(string), "   Dostałeś %d materiałów od gracza %s za %d $.", moneys, GetNick(giveplayerid), kasa);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "   Dałeś %d materiałów graczowi %s za %d $.", moneys, GetNick(playerid), kasa);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string),"%s dał %s torbę z materiałami.", GetNick(giveplayerid), GetNick(playerid));
			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			TakeMats(giveplayerid, moneys);
			Item_Add("Materiały", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_MATS, 0, 0, true, playerid, moneys, ITEM_NOT_COUNT);
			DajKaseDone(giveplayerid, kasa);
			ZabierzKaseDone(playerid, kasa);
			
			Log(payLog, WARNING, "%s kupił od %s materiały w ilości %d za %d$", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), moneys, kasa);
			SetPVarInt(playerid, "OKupMats", 0);
			SetPVarInt(giveplayerid, "OSprzedajMats", 0);
			SetPVarInt(playerid, "Mats-kasa", 0);
        	SetPVarInt(playerid, "Mats-id", 0);
        	SetPVarInt(playerid, "Mats-mats", 0);
			
		}
		else
		{
		    sendErrorMessage(playerid, "Coś poszło nie tak! (sprzedaż)");
		}
	}
	else if(dialogid == 9521) //kara warn
	{
		new giveplayerid = GetPVarInt(playerid, "PunishWarnPlayer");
		new string[256];
		if(!response) return sendTipMessage(playerid, sprintf("* Anulowano nadawanie kary warna dla %s.", GetNick(giveplayerid)));
		if(response && (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1 || IsAScripter(playerid)))
		{
			new reason[64];
			GetPVarString(playerid, "PunishWarnPlayer_Reason", reason, sizeof(reason));
			format(string, sizeof string, "{FFFFFF}Gracz: {B7EB34}%s\n{FFFFFF}Powód warna: {B7EB34}%s{FFFFFF}\n\nWybierz typ kary - WARN czy WARN + KICK", GetNick(giveplayerid), reason);		
			ShowPlayerDialogEx(playerid, 9523, DIALOG_STYLE_MSGBOX, "Nadawanie warna", string, "Warn", "Warn + Kick");
		}
		return 1;
	}
	else if(dialogid == 9522) //kara ban
	{
		new giveplayerid = GetPVarInt(playerid, "PunishBanPlayer");
		if(!response) return sendTipMessage(playerid, sprintf("* Anulowano nadawanie kary bana dla %s.", GetNick(giveplayerid)));
		if(response && (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pZG] >= 4 || IsAScripter(playerid)))
		{
			new reason[64], string[256];
			GetPVarString(playerid, "PunishBanPlayer_Reason", reason, sizeof(reason));
			if(AddPunishment(giveplayerid, GetNick(giveplayerid), playerid, gettime(), PENALTY_BAN, 0, reason, 0) == 1) {
				//GiveBanForPlayer(giveplayerid, playerid, reason);
				DeletePVar(playerid, "PunishBanPlayer");
				DeletePVar(playerid, "PunishBanPlayer_Reason");

				if(GetPlayerAdminDutyStatus(playerid) == 1)
				{
					iloscBan[playerid]++;
				}
				else if(GetPlayerAdminDutyStatus(playerid) == 0)
				{
					iloscPozaDuty[playerid]++; 
				}
				if(kary_TXD_Status == 1)
				{
					BanPlayerTXD(giveplayerid, reason); 
				}
				else if(kary_TXD_Status == 0)
				{
					format(string, sizeof(string), "AdmCmd: Admin zbanował %s, powód: %s", GetNick(giveplayerid), reason);
					SendPunishMessage(string, playerid); 
				}	
			}				
		}
		return 1;
	}
	else if(dialogid == 9523) //kara warn - typ warna
	{
		new giveplayerid = GetPVarInt(playerid, "PunishWarnPlayer");
		if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1 || IsAScripter(playerid))
		{
			new reason[64], string[256];
			GetPVarString(playerid, "PunishWarnPlayer_Reason", reason, sizeof(reason));
			
			//GiveWarnForPlayer(giveplayerid, playerid, reason, response);
			if(AddPunishment(giveplayerid, GetNick(giveplayerid), playerid, gettime(), PENALTY_WARN, 0, reason, response) == 1) {
			
			DeletePVar(playerid, "PunishWarnPlayer");
			DeletePVar(playerid, "PunishWarnPlayer_Reason");

			if(GetPlayerAdminDutyStatus(playerid) == 1)
			{
				if(PlayerInfo[giveplayerid][pWarns] >= 3)
				{
					iloscBan[playerid]++;
				}
				else
				{
					iloscWarn[playerid] = iloscWarn[playerid]+1;
				}
			}
			else
			{
				iloscPozaDuty[playerid]++; 
			}

			if(kary_TXD_Status == 1)
			{
				if(PlayerInfo[giveplayerid][pWarns] >= 3)
				{
					format(string, sizeof(string), "%s (3 warny)", reason);
					BanPlayerTXD(giveplayerid, string); 
				}
				else 
				{
					WarnPlayerTXD(giveplayerid, playerid, reason);
				}
			}
			else if(kary_TXD_Status == 0)
			{
				if(PlayerInfo[giveplayerid][pWarns] >= 3)
				{
					format(string, sizeof(string), "AdmCmd: %s został zbanowany przez admina %s, powód: %s (3 warny)", GetNickEx(giveplayerid), GetNickEx(playerid), reason); 
				}
				else
				{
					format(string, sizeof(string), "AdmCmd: %s został zwarnowany przez admina %s, powód: %s", GetNickEx(giveplayerid), GetNickEx(playerid), reason); 
				}
				SendPunishMessage(string, playerid); 
				}
			}
		}
		return 1;
	}
	else if(dialogid == 6999)//vinyl panel
	{
		if(!response) return 1;
		if(response)
		{
			switch(listitem)
			{
				case 0://Open/Close/nUstal cene Norm./nUstal cene VIP/nUstal cene napoi\nUstal nazwe napoi
				{
					if(vinylStatus == 0)
					{
						vinylStatus = 1; 
						sendTipMessage(playerid, "Otworzyłeś/aś vinyl Club!");
					}
					else if(vinylStatus == 1)
					{
						vinylStatus = 0; 
						sendTipMessage(playerid, "Zamknąłeś/aś vinyl Club!"); 
					}
				}
				case 1:
				{
					ShowPlayerDialogEx(playerid, 6998, DIALOG_STYLE_INPUT, "Laptop Lidera", "Wprowadź poniżej kwotę, która ktoś będzie musiał zapłacić za bilet Normalny", "Wybierz", "Odrzuć");
					SetPVarInt(playerid, "b-wybor", 1);
				}
				case 2:
				{
					ShowPlayerDialogEx(playerid, 6998, DIALOG_STYLE_INPUT, "Laptop Lidera", "Wprowadź poniżej kwotę, która ktoś będzie musiał zapłacić za bilet Normalny", "Wybierz", "Odrzuć");
					SetPVarInt(playerid, "b-wybor", 2);
				}
				case 3:
				{
					ShowPlayerDialogEx(playerid, 6998, DIALOG_STYLE_INPUT, "Laptop Lidera", "Wprowadź poniżej numer napoju,\ndla którego chcesz zmienić cenę", "Potwierdź", "Anuluj"); 
					SetPVarInt(playerid, "b-wybor", 3); 
				}
				case 4:
				{
					ShowPlayerDialogEx(playerid, 6998, DIALOG_STYLE_INPUT, "Laptop Lidera", "Wprowadź poniżej numer napoju,\ndla którego chcesz zmienić nazwę", "Potwierdź", "Anuluj"); 
					SetPVarInt(playerid, "b-wybor", 6); 
				}
			}
		}
	}
	else if(dialogid == 6998)//vinyl input
	{
		if(!response) return 1;
		if(response)
		{
			if(GetPVarInt(playerid, "b-wybor") == 7)
			{
				new drinkID = GetPVarInt(playerid, "b-wprowadzil"); 
				if(strlen(inputtext) <= 32)
				{
					if(drinkID == 1)
					{
						strdel(drinkName1, 0, 32); 
						strins(drinkName1, inputtext, 0);
					}
					else if(drinkID == 2)
					{
						strdel(drinkName2, 0, 32); 
						strins(drinkName2, inputtext, 0);
					}
					else if(drinkID == 3)
					{
						strdel(drinkName3, 0, 32); 
						strins(drinkName3, inputtext, 0);
					}
					else if(drinkID == 4)
					{
						strdel(drinkName4, 0, 32); 
						strins(drinkName4, inputtext, 0); 
					}
					sendTipMessage(playerid, "Pomyślnie zmieniono nazwę drinka!"); 
				}
				else
				{
					sendErrorMessage(playerid, "Nieprawidłowa długość nazwy napoju [MAX 33 znaki]");
				}
				return 1;
			}
			if(GetPVarInt(playerid, "b-wybor") == 6)
			{
				new drinkID = FunkcjaK(inputtext); 
				SetPVarInt(playerid, "b-wprowadzil", drinkID); 
				new string[124]; 
				if(drinkID > 4)
				{
					sendErrorMessage(playerid, "Nieprawidłowe ID drinka"); 
					return 1;
				}
				if(drinkID < 1)
				{
					sendErrorMessage(playerid, "Nieprawidłowe ID drinka"); 
					return 1;
				}
				if(drinkID == 1)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową nazwę dla napoju: %s, \nAktualna cena to: $%d", drinkName1, drinkCost1);
				}
				else if(drinkID == 2)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową nazwę dla napoju: %s, \nAktualna cena to: $%d", drinkName2, drinkCost2);
				}
				else if(drinkID == 3)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową nazwę dla napoju: %s, \nAktualna cena to: $%d", drinkName3, drinkCost3);
				}
				else if(drinkID == 4)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową nazwę dla napoju: %s, \nAktualna cena to: $%d", drinkName4, drinkCost4);
				}
				ShowPlayerDialogEx(playerid, DIALOG_STYLE_INPUT, 6998, "Panel lidera", string, "Akceptuj", "Odrzuć"); 
				SetPVarInt(playerid, "b-wybor", 7); 
				return 1;
			}
			if(GetPVarInt(playerid, "b-wybor") == 5)
			{
				new drinkID = GetPVarInt(playerid, "b-wprowadzil"); 
				new drinkCost = FunkcjaK(inputtext); 
				new string[124]; 
				if(drinkCost > 100000 || drinkCost <= 1)
				{
					sendErrorMessage(playerid, "Nieprawidłowa nowa cena drinka!"); 
					return 1;
				}
				if(drinkID == 1) 
				{
					drinkCost1 = drinkCost; 
					format(string, sizeof(string), "Zmieniłeś cenę napoju %s. Nowa cena to: %d", drinkName1, drinkCost1); 
					sendTipMessage(playerid, string); 
				}
				else if(drinkID == 2)
				{
					drinkCost2 = drinkCost; 
					format(string, sizeof(string), "Zmieniłeś cenę napoju %s. Nowa cena to: %d", drinkName2, drinkCost2); 
					sendTipMessage(playerid, string);
				}
				else if(drinkID == 3)
				{
					drinkCost3 = drinkCost; 
					format(string, sizeof(string), "Zmieniłeś cenę napoju %s. Nowa cena to: %d", drinkName3, drinkCost3); 
					sendTipMessage(playerid, string);
				}
				else if(drinkID == 4)
				{
					drinkCost4 = drinkCost; 
					format(string, sizeof(string), "Zmieniłeś cenę napoju %s. Nowa cena to: %d", drinkName4, drinkCost4); 
					sendTipMessage(playerid, string);
				}
				else
				{
					sendErrorMessage(playerid, "Wystąpił nieznany problem. Skontaktuj się z Komisją ds. Ulepszeń"); 
				}
				return 1;
			}
			if(GetPVarInt(playerid, "b-wybor") == 3)
			{
				new drinkID = FunkcjaK(inputtext);
				SetPVarInt(playerid, "b-wprowadzil", drinkID); 
				new string[124]; 
				if(drinkID == 1)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową cenę dla napoju: %s, \nAktualna cena to: $%d", drinkName1, drinkCost1); 
				}
				else if(drinkID == 2)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową cenę dla napoju: %s\nAktualna cena to: $%d", drinkName2, drinkCost2); 
				}
				else if(drinkID == 3)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową cenę dla napoju: %s\nAktualna cena to: $%d", drinkName3, drinkCost3); 
				}
				else if(drinkID == 4)
				{
					format(string, sizeof(string), "Wprowadź poniżej nową cenę dla napoju: %s\nAktualna cena to: $%d", drinkName4, drinkCost4); 
				}
				else
				{
					sendErrorMessage(playerid, "Nieprawidłowy numer napoju"); 
					return 1;
				}
				SetPVarInt(playerid, "b-wybor", 5);
				ShowPlayerDialogEx(playerid, 6998, DIALOG_STYLE_INPUT, "Laptop Lidera", string, "Dalej", "Odrzuć");
				return 1;
			}
			new cValue = FunkcjaK(inputtext);
			new string[124];
			if(cValue >= 10 && cValue <= 100)
			{
				if(GetPVarInt(playerid, "b-wybor") == 1)
				{
					cenaNorm = cValue; 
					format(string, sizeof(string), "Nowa cena biletu zwykłego to: %d$", cenaNorm);
					sendTipMessage(playerid, string); 
					return 1;
				}
				if(GetPVarInt(playerid, "b-wybor") == 2)
				{
					cenaVIP = cValue; 
					format(string, sizeof(string), "Nowa cena biletu VIP to: %d$", cenaVIP); 
					sendTipMessage(playerid, string); 
					return 1;
				}
			}
			else 
			{
				sendErrorMessage(playerid, "Koszt biletu od 10$ do 100$");
				return 1;
			}
		}
	}
	else if(dialogid == 6996)
	{
		if(!response)
		{
			sendTipMessage(playerid, "Wymiękasz? Abstynent!");
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					BuyDrinkOnClub(playerid, drinkName1, drinkCost1, 2000, 22);
				}
				case 1:
				{
					BuyDrinkOnClub(playerid, drinkName2, drinkCost2, 2500, 22);
				}
				case 2:
				{
					BuyDrinkOnClub(playerid, drinkName3, drinkCost3, 4000, 20);
				}
				case 3:
				{
					BuyDrinkOnClub(playerid, drinkName4, drinkCost4, 5000, 20);
				}
				
			}
		}
	}
	else if(dialogid == 6997)
	{
		if(!response)
		{
			kasjerkaWolna = 666; 
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(kaska[playerid] >= cenaNorm)
					{
						ZabierzKaseDone(playerid, cenaNorm); 
						SetPVarInt(playerid, "Vinyl-bilet", 1);//2 = VIP
						sendTipMessage(playerid, "Otrzymałeś bilet zwykły do vinyl clubu");
						Sejf_Add(FRAC_SN, cenaNorm);
						kasjerkaWolna = 666; 
					}
					else 
					{
						sendErrorMessage(playerid, "Brak wystarczającej kwoty!");
						kasjerkaWolna = 666; 
						return 1;
					}
				}
				case 1:
				{
					if(kaska[playerid] >= cenaVIP)
					{
						ZabierzKaseDone(playerid, cenaVIP); 
						SetPVarInt(playerid, "Vinyl-bilet", 2);//2 = VIP
						sendTipMessage(playerid, "Otrzymałeś bilet VIP do vinyl clubu");
						Sejf_Add(FRAC_SN, cenaVIP);
						kasjerkaWolna = 666; 
					}
					else 
					{
						sendErrorMessage(playerid, "Brak wystarczającej kwoty!");
						kasjerkaWolna = 666; 
						return 1;
					}
				}
			}
		}
	}
	else if(dialogid == DIALOGID_MUZYKA) 
	{
		switch(listitem)
		{
			case 0:
			{
			    if(!response) return 1;
				PlayerFixRadio(playerid);
				ShowNewRadio(playerid);
				return 1;
			}
			case 1:
			{
			    if(!response) return 1;
				ShowPlayerDialogEx(playerid, DIALOGID_MUZYKA_URL, DIALOG_STYLE_INPUT, "Własne MP3", "Wprowadz adres URL do radia/piosenki (może być z youtube)", "Start", "Anuluj");
				return 1;
			}
			case 2:
			{
			    if(!response) return 1;
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~r~MP3 Off", 5000, 5);
				PlayerFixRadio(playerid);
				StopAudioStreamForPlayer(playerid);
				SetPVarInt(playerid, "SluchaBasenu", 0);
				DeletePVar(playerid, "HaveAMp3Stream");
			}
		}
	}
	else if(dialogid == DIALOGID_MUZYKA_URL)
	{
		if(response)
		{
			//if(IsAValidURL(inputtext))
			//{
			StopAudioStreamForPlayer(playerid);
			PlayAudioStreamForPlayer(playerid, inputtext);
			SetPVarInt(playerid, "HaveAMp3Stream", 1);
			//}
			//else
			//{
			//	SendClientMessage(playerid, COLOR_GREY, "Zły adres URL");
			//	ShowPlayerDialogEx(playerid, DIALOGID_MUZYKA_URL, DIALOG_STYLE_INPUT, "Własne MP3", "Wprowadz adres URL do radia/piosenki.", "Start", "Anuluj");
			//}
		}
		return 1;
	}
	else if(dialogid == DIALOGID_PODSZYJ)
	{
		switch(listitem)
		{
			case 0:
			{
				ShowPlayerDialogEx(playerid, DIALOGID_PODSZYJ_ZMIENID(1), DIALOG_STYLE_PREVMODEL_LIST, "Podszywasz się pod FBI.", "165\nAgent FBI (Biały)\n166\nAgent FBI (Czarny)\n211\nAgentka FBI\n286\nAgent ICB\n295\nDyrektor FBI", "Podszyj", "Anuluj");
				return 1;
			}
			case 1:
			{
				ShowPlayerDialogEx(playerid, DIALOGID_PODSZYJ_ZMIENID(2), DIALOG_STYLE_PREVMODEL_LIST, "Podszywasz się pod Grove.", "105\nCzłonek Grove\n106\nCzłonek Grove\n107\nCzłonek Grove\n269\nCzłonek Grove\n270\nCzłonek Grove\n271\nCzłonek Grove", "Podszyj", "Anuluj");
				return 1;
			}
			case 2:
			{
				ShowPlayerDialogEx(playerid, DIALOGID_PODSZYJ_ZMIENID(3), DIALOG_STYLE_PREVMODEL_LIST, "Podszywasz się pod Ballas.", "102\nCzłonek Ballas\n103\nCzłonek Ballas\n104\nCzłonek Ballas", "Podszyj", "Anuluj");
				return 1;
			}
			case 3:
			{
				ShowPlayerDialogEx(playerid, DIALOGID_PODSZYJ_ZMIENID(4), DIALOG_STYLE_PREVMODEL_LIST, "Podszywasz się pod ICC.", "124\nCzłonek ICC\n125\nCzłonek ICC\n126\nCzłonek ICC\n111\nCzłonek ICC\n113\nBoss ICC", "Podszyj", "Anuluj");
				return 1;
			}
			case 4:
			{
				ShowPlayerDialogEx(playerid, DIALOGID_PODSZYJ_ZMIENID(5), DIALOG_STYLE_PREVMODEL_LIST, "Podszywasz się pod Yakuze.", "117\nCzłonek Yakuzy\n118\nCzłonek Yakuzy\n120\nBoss Yakuzy\n122\nCzłonek Yakuzy\n123\nBoss Yakuzy", "Podszyj", "Anuluj");
				return 1;
			}
			case 5:
			{
				ShowPlayerDialogEx(playerid, DIALOGID_PODSZYJ_ZMIENID(6), DIALOG_STYLE_PREVMODEL_LIST, "Podszywasz się pod Latin Kings.", "108\nCzłonek Latin Kings\n109\nCzłonek Latin Kings\n110\nBoss Latin Kings", "Podszyj", "Anuluj");
				return 1;
			}
		}
	}
	else if(dialogid == DIALOGID_PODSZYJ_ZMIENID(1))
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerColor(playerid, COLOR_FBI);//kolor
				SetPlayerSkinEx(playerid, 165);
				PlayerInfo[playerid][pTajniak] = 0;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod FBI.");
				return 1;
			}
			case 1:
			{
				SetPlayerColor(playerid, COLOR_FBI);//kolor
				SetPlayerSkinEx(playerid, 166);
				PlayerInfo[playerid][pTajniak] = 0;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod FBI.");
				return 1;
			}
			case 2:
			{
				SetPlayerColor(playerid, COLOR_FBI);//kolor
				SetPlayerSkinEx(playerid, 211);
				PlayerInfo[playerid][pTajniak] = 0;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod FBI.");
				return 1;
			}
			case 3:
			{
				SetPlayerColor(playerid, COLOR_FBI);//kolor
				SetPlayerSkinEx(playerid, 286);
				PlayerInfo[playerid][pTajniak] = 0;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod FBI.");
				return 1;
			}
			case 4:
			{
				SetPlayerColor(playerid, COLOR_FBI);//kolor
				SetPlayerSkinEx(playerid, 295);
				PlayerInfo[playerid][pTajniak] = 0;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod FBI.");
				return 1;
			}
		}
	}

	else if(dialogid == DIALOGID_PODSZYJ_ZMIENID(2))
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 105);
				PlayerInfo[playerid][pTajniak] = 1;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Grove.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 1:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 106);
				PlayerInfo[playerid][pTajniak] = 1;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Grove.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 2:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 107);
				PlayerInfo[playerid][pTajniak] = 1;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Grove.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 3:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 269);
				PlayerInfo[playerid][pTajniak] = 1;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Grove.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 4:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 270);
				PlayerInfo[playerid][pTajniak] = 1;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Grove.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 5:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 271);
				PlayerInfo[playerid][pTajniak] = 1;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Grove.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
		}
	}

	else if(dialogid == DIALOGID_PODSZYJ_ZMIENID(3))
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 102);
				PlayerInfo[playerid][pTajniak] = 2;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Ballas.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 1:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 103);
				PlayerInfo[playerid][pTajniak] = 2;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Ballas.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 2:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 104);
				PlayerInfo[playerid][pTajniak] = 2;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Ballas.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
		}
	}

	else if(dialogid == DIALOGID_PODSZYJ_ZMIENID(4))
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 124);
				PlayerInfo[playerid][pTajniak] = 3;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod ICC.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 1:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 125);
				PlayerInfo[playerid][pTajniak] = 3;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod ICC.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 2:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 126);
				PlayerInfo[playerid][pTajniak] = 3;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod ICC.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 3:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 111);
				PlayerInfo[playerid][pTajniak] = 3;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod ICC.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 4:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 113);
				PlayerInfo[playerid][pTajniak] = 3;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod ICC.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
		}
		return 1;
	}

	else if(dialogid == DIALOGID_PODSZYJ_ZMIENID(5))
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 117);
				PlayerInfo[playerid][pTajniak] = 4;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Yakuze.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 1:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 118);
				PlayerInfo[playerid][pTajniak] = 4;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Yakuze.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 2:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 120);
				PlayerInfo[playerid][pTajniak] = 4;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Yakuze.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 3:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 122);
				PlayerInfo[playerid][pTajniak] = 4;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Yakuze.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 4:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 123);
				PlayerInfo[playerid][pTajniak] = 4;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Yakuze.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
		}
		return 1;
	}

	else if(dialogid == DIALOGID_PODSZYJ_ZMIENID(6))
	{
		switch(listitem)
		{
			case 0:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 108);
				PlayerInfo[playerid][pTajniak] = 5;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Latin Kings.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 1:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 109);
				PlayerInfo[playerid][pTajniak] = 5;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Latin Kings.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
			case 2:
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);//kolor
				SetPlayerSkinEx(playerid, 110);
				PlayerInfo[playerid][pTajniak] = 5;
				PlayerInfo[playerid][pTeam] = 2;//team
				gTeam[playerid] = 2;//team
				SendClientMessage(playerid, COLOR_GRAD2, "Podszyłeś się pod Latin Kings.");
				SetPlayerArmour(playerid, 10);
				return 1;
			}
		}
		return 1;
	}
    else if(dialogid == D_VEHOPIS)
    {
        if(!response) return 1;
        new id;
        if(strcmp(inputtext, "» Ustaw opis", false, 12) == 0) id = 1;
        else if(strcmp(inputtext, "» Zmień opis", false, 12) == 0) id = 2;
        else if(strcmp(inputtext, "» Usuń", false, 6) == 0) id = 3;

        switch(id)
        {
            case 1:
            {
                new veh = GetPlayerVehicleID(playerid);
                if(strcmp(CarDesc[veh], "BRAK", true) == 0)
                {
                    RunCommand(playerid, "/vopis",  "");
                    SendClientMessage(playerid, COLOR_GRAD2, "Pojazd nie posiada opisu.");
                    return 1;
                }
                CarOpis_Usun(playerid, veh);

                new opis[128];
                format(opis, sizeof opis, "%s", CarDesc[veh]);
				ReColor(opis);
                CarOpis[veh] = CreateDynamic3DTextLabel(wordwrapEx(opis), COLOR_PURPLE, 0.0, 0.0, -0.2, 5.0, INVALID_PLAYER_ID, veh);
                format(CarOpisCaller[veh], MAX_PLAYER_NAME, "%s", GetNick(playerid));
                SendClientMessage(playerid, -1, "{99CC00}Ustawiłes własny opis pojazdu, by go usunąć wpisz {CC3333}/vopis usuń{CC3333}");
            }
            case 2:
            {
                ShowPlayerDialogEx(playerid, D_VEHOPIS_UPDATE, DIALOG_STYLE_INPUT, "Opis pojazdu", "Wprowadź niżej własny opis pojazdu.", "Ustaw", "Wróć");
            }
            case 3:
            {
                if(!CarOpis_Usun(playerid, GetPlayerVehicleID(playerid), true))
                {
                    SendClientMessage(playerid, -1, "Opis: Pojazd nie posiada opisu.");
                    RunCommand(playerid, "/vopis",  "");
                    return 1;
                }
                RunCommand(playerid, "/vopis",  "");
            }
        }
        return 1;
    }
    else if(dialogid == D_VEHOPIS_UPDATE)
    {
        if(!response) return RunCommand(playerid, "/vopis",  "");
        if(strlen(inputtext) < 4 || strlen(inputtext) > 120)
        {
            RunCommand(playerid, "/vopis",  "");
            SendClientMessage(playerid, COLOR_GRAD1, "Opis: Nieodpowiednia długość opisu.");
            return 1;
        }
		else
		{
			new givenString[128];
			format(givenString, sizeof(givenString), "%s", inputtext);
			if(strfind(givenString, "(FF0000)", true) != -1 || strfind(givenString, "(000000)", true) != -1)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Znaleziono niedozwolony kolor.");
				return 1;
			}
			//todo: kolorowe opisy tylko dla KP
			new checkBlocked = CheckBlockedChars(givenString);
			if(checkBlocked != -1) return SendClientMessage(playerid, COLOR_GRAD1, sprintf("Znaleziono niedozwolony znak: %s", givenString[checkBlocked]));
		}
        new veh = GetPlayerVehicleID(playerid);
        strdel(CarDesc[veh], 0, 128);
		strcat(CarDesc[veh], inputtext);
        MruMySQL_UpdateOpis(veh, CarData[VehicleUID[veh][vUID]][c_UID], 2);

		CarOpis_Usun(playerid, veh);
		new opis[128];
		format(opis, sizeof opis, "%s", CarDesc[veh]);
		ReColor(opis);
		CarOpis[veh] = CreateDynamic3DTextLabel(wordwrapEx(opis), COLOR_PURPLE, 0.0, 0.0, -0.2, 5.0, INVALID_PLAYER_ID, veh);
		format(CarOpisCaller[veh], MAX_PLAYER_NAME, "%s", GetNick(playerid));
		SendClientMessage(playerid, -1, "{99CC00}Ustawiłes własny opis pojazdu, by go usunąć wpisz {CC3333}/vopis usuń{CC3333}");
        return 1;
    }
    else if(dialogid == D_PERM)
    {
        if(!(Uprawnienia(playerid, ACCESS_EDITPERM) && IsPlayerAdmin(playerid))) return SendClientMessage(playerid, -1, "(PERM) - Nie posiadasz pełnych praw.");
        new param[8];
        GetPVarString(playerid, "perm-id", param, 8);
        new id = strval(param);
        new str[128];
        if(!response)
        {

            if(OLD_ACCESS[id] != ACCESS[id])
            {
                OLD_ACCESS[id] = ACCESS[id];
                format(str, 128, "(PERM) %s zapisał Twoje nowe uprawnienia", GetNickEx(playerid));
                SendClientMessage(id, 0x05CA8CFF, str);
                format(str, 128, "(PERM) Zapisales prawa %s", GetNick(id));
                SendClientMessage(playerid, 0x05CA8CFF, str);
                
				MruMySQL_ZapiszUprawnienia(id);
				Log(adminLog, WARNING, "Admin %s zmienił prawa %s na %b", GetPlayerLogName(playerid), GetPlayerLogName(id), ACCESS[id]);
            }
            return 1;
        }
        switch(listitem)
        {
            case 1: ACCESS[id] ^= ACCESS_PANEL;
            case 2: ACCESS[id] ^= ACCESS_KARY;
            case 3: ACCESS[id] ^= ACCESS_KARY_ZNAJDZ;
            case 4: ACCESS[id] ^= ACCESS_KARY_BAN;
            case 5: ACCESS[id] ^= ACCESS_KARY_UNBAN;
            case 6: ACCESS[id] ^= ACCESS_ZG;
            case 7: ACCESS[id] ^= ACCESS_GIVEHALF;
            case 8: ACCESS[id] ^= ACCESS_MAKELEADER;
            case 9: ACCESS[id] ^= ACCESS_MAKEFAMILY;
            case 10: ACCESS[id] ^= ACCESS_DELETEORG;
            case 11: ACCESS[id] ^= ACCESS_EDITCAR;
            case 12: ACCESS[id] ^= ACCESS_EDITRANG;
            case 13: ACCESS[id] ^= ACCESS_EDITPERM;
            case 14: ACCESS[id] ^= ACCESS_SKRYPTER;
			case 15: ACCESS[id] ^= ACCESS_MAPPER;
			case 16: ACCESS[id] ^= ACCESS_SETSKIN;
			case 17: ACCESS[id] ^= ACCESS_SETNAME;
			case 18: ACCESS[id] ^= ACCESS_TEMPNAME;
			case 19: ACCESS[id] ^= ACCESS_GAMEMASTER;
        }
        format(str, 128, "(PERM) %s edytował Twoje uprawnienia (/uprawnienia)", GetNickEx(playerid));
        SendClientMessage(id, 0x05CA8CFF, str);
        RunCommand(playerid, "/edytujupr",  param);
    }
    else if(dialogid == DIALOG_PATROL)
    {
        if(!response)
        {
            SetPVarInt(playerid, "patrol", 0);
            return 0;
        }
        if(listitem == 0)
        {
            new pat = GetPVarInt(playerid, "patrol-id");
            SetPVarInt(playerid, "patrol-parent", -1);
            PatrolInfo[pat][patroluje][0] = playerid;
            PatrolInfo[pat][patroluje][1] = INVALID_PLAYER_ID;
            PatrolInfo[pat][patstrefa] = 0;
            PatrolInfo[pat][patstan] = 1;
            PatrolInfo[pat][pataktywny] = 2;
            PatrolInfo[pat][pattyp] = 1; //PlayerInfo[playerid][pFrac] 1 PD 2 FBI 3 NG
            PatrolInfo[pat][pattime] = gettime();

            SendClientMessage(playerid, COLOR_BLUE, "Rozpoczynasz patrol samodzielny. Wybierz strefę do patrolowania.");
            Patrol_ShowMap(playerid);
            SetPVarInt(playerid, "patrol-map", 1);
            SelectTextDraw(playerid, 0xD2691E55);
        }
        else
        {
            ShowPlayerDialogEx(playerid, DIALOG_PATROL_PARTNER, DIALOG_STYLE_INPUT, "Konfiguracja patrolu » Partner", "Wprowadź nazwę gracza lub ID, z którym będziesz patrolować teren.", "Dodaj", "Anuluj");
        }
    }
    else if(dialogid == DIALOG_PATROL_NAME)
    {
        if(!response)
        {
            SetPVarInt(playerid, "patrol", 0);
            return 0;
        }
        if(isnull(inputtext) || strlen(inputtext) < 2) return 0;
        if(strfind(PatrolSq, inputtext, true) == -1)
        {
            strcat(PatrolSq, inputtext);
            format(PatrolInfo[GetPVarInt(playerid, "patrol-id")][patname], 16, "%s" ,inputtext);
            ShowPlayerDialogEx(playerid, DIALOG_PATROL, DIALOG_STYLE_LIST, "Konfiguracja patrolu » Typ", "Patrol samodzielny\nPatrol z partnerem", "Wybierz", "Anuluj");
        }
        else ShowPlayerDialogEx(playerid, DIALOG_PATROL_NAME, DIALOG_STYLE_INPUT, "Konfiguracja patrolu » Nazwa", "Ta nazwa jest zajęta.\r\nWprowadź nazwę patrolu (kryptonim)", "Dalej", "Anuluj");
    }
    else if(dialogid == DIALOG_PATROL_PARTNER)
    {
        new pat = GetPVarInt(playerid, "patrol-id");
        if(!response)
        {
            new pos = strfind(PatrolSq, PatrolInfo[pat][patname], true);
            strdel(PatrolSq, pos, pos + strlen(PatrolInfo[pat][patname]));
            strdel(PatrolInfo[pat][patname], 0, 16);

            SetPVarInt(playerid, "patrol", 0);
            return 0;
        }
        new id;
        sscanf(inputtext, "k<fix>", id);
        if(id == INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, DIALOG_PATROL_PARTNER, DIALOG_STYLE_INPUT, "Konfiguracja patrolu » Partner", "Nie znaleziono gracza...\r\nWprowadź nazwę gracza lub ID, z którym będziesz patrolować teren.", "Dodaj", "Anuluj");
        PatrolInfo[pat][patroluje][0] = playerid;
        PatrolInfo[pat][patroluje][1] = id;
        PatrolInfo[pat][patstrefa] = 0;
        PatrolInfo[pat][patstan] = 1;
        PatrolInfo[pat][pataktywny] = 2;
        PatrolInfo[pat][pattime] = gettime();
        new str[128], nick[MAX_PLAYER_NAME+1];
        GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
        format(str, 128, "PATROL »» %s chce patrolować z Tobą teren. Aby akceptować wpisz /patrol akceptuj", nick);
        SetPVarInt(playerid, "patrol-parent", id);
        SetPVarInt(id, "patrol-parent", playerid);
        SetPVarInt(id, "patrol-dec", 1);
        SetPVarInt(playerid, "patrol-id", pat);
        SetPVarInt(playerid, "patrol-time", PatrolInfo[pat][pattime]);
        SetPVarInt(id, "patrol-time", PatrolInfo[pat][pattime]);
        SendClientMessage(id, COLOR_BLUE, str);
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wysłano zapytanie do gracza o pomoc w patrolowaniu.");
    }
    //PANEL ADMINA
    else if(dialogid == D_PANEL_ADMINA)
    {
        if(!response) return 1;
        new upr = GetPVarInt(playerid, "panel-upr");
        if(listitem == 0)
        {
            if(!(upr & 0b10)) return 1;
            SetPVarInt(playerid, "panel-ok", 1);
            ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
        }
        else if(listitem == 1)
        {
            ShowPlayerDialogEx(playerid, D_PANEL_CHECKPLAYER, DIALOG_STYLE_INPUT, "K-RP » Sprawdzanie statystyk gracza", "Wprowadź nick_gracza lub UID konta:                    ", "Sprawdź", "Wyjdź");
        }
    }
    else if(dialogid == D_PANEL_CHECKPLAYER)
    {
        if(!response) return RunCommand(playerid, "/panel",  "");
        if(strlen(inputtext) < 1 || strlen(inputtext) > MAX_PLAYER_NAME)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc!");
            ShowPlayerDialogEx(playerid, D_PANEL_CHECKPLAYER, DIALOG_STYLE_INPUT, "K-RP » Sprawdzanie statystyk gracza", "Wprowadź nick_gracza lub UID konta:                    ", "Sprawdź", "Wyjdź");
            return 0;
        }
		MruMySQL_PobierzStatystyki(playerid, inputtext);

        return 0;
    }
    else if(dialogid == D_PANEL_KAR)
    {
        if(!response) return 1;
        if(GetPVarInt(playerid, "panel-ok") != 1) return 1;
        switch(listitem)
        {
            case 0: //nadaj kare
            {
                ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
            }
            case 1: //zdejmij kare
            {
                ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
            }
            case 2: //wyszukiwarka
            {
                ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Sprawdź dane po IP\nSprawdź dane po nicku", "Wybierz", "Wróć");
            }
        }
    }
    else if(dialogid == D_PANEL_KARY_POWOD)
    {
        if(strlen(inputtext) > 1 && strlen(inputtext) < 64)
        {
            SetPVarString(playerid, "panel-powod", inputtext);
            SetPVarInt(playerid, "panel-kary-continue", 1);

            switch(GetPVarInt(playerid, "panel-list"))
            {
                case 0:
                {
                    ShowPlayerDialogEx(playerid, D_PANEL_KAR_BLOCKNICK, DIALOG_STYLE_INPUT, "K-RP » Panel zarządzania karami", "Wprowadź poniżej nick gracza do zablokowania", "Blokuj", "Wróć");
                }
                case 1:
                {
                    ShowPlayerDialogEx(playerid, D_PANEL_KAR_BANNICK, DIALOG_STYLE_INPUT, "K-RP » Panel zarządzania karami", "Wprowadź poniżej nick gracza do zbanowania", "Banuj", "Wróć");
                }
				case 2:
				{
					ShowPlayerDialogEx(playerid, D_PANEL_KAR_UNBLOCKNICK, DIALOG_STYLE_INPUT, "K-RP » Panel zarządzania karami", "Wprowadź poniżej nick do odblokowania.", "Odblokuj", "Wróć");
				}
				case 3:
				{
					ShowPlayerDialogEx(playerid, D_PANEL_KAR_UNBANNICK, DIALOG_STYLE_INPUT, "K-RP » Panel zarządzania karami", "Wprowadź poniżej nick do obbanowania", "Odbanuj", "Wróć");
				}
            }
        }
        else return ShowPlayerDialogEx(playerid, D_PANEL_KARY_POWOD, DIALOG_STYLE_INPUT, "K-RP » Powód", "Proszę poniżej wpisać powód.", "Dalej", "");
    }
    else if(dialogid == D_PANEL_KAR_ZDEJMIJ)
    {
        if(!response) return RunCommand(playerid, "/panel",  "");
        if(!Uprawnienia(playerid, ACCESS_KARY_UNBAN))
        {
            SendClientMessage(playerid, COLOR_RED, "Uprawnienia: Nie posiadasz wystarczających uprawnień.");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
            return 1;
        }
        SetPVarInt(playerid, "panel-list", listitem+2);
        DeletePVar(playerid, "panel-kary-continue");
        DeletePVar(playerid, "panel-powod");
        if(GetPVarInt(playerid, "panel-kary-continue") == 0) return ShowPlayerDialogEx(playerid, D_PANEL_KARY_POWOD, DIALOG_STYLE_INPUT, "K-RP » Powód", "Proszę poniżej wpisać powód.", "Dalej", "");
    }
    else if(dialogid == D_PANEL_KAR_NADAJ)
    {
        if(!response) return RunCommand(playerid, "/panel",  "");
        if(!Uprawnienia(playerid, ACCESS_KARY_BAN))
        {
            SendClientMessage(playerid, COLOR_RED, "Uprawnienia: Nie posiadasz wystarczających uprawnień.");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
            return 1;
        }
        SetPVarInt(playerid, "panel-list", listitem);
        DeletePVar(playerid, "panel-kary-continue");
        DeletePVar(playerid, "panel-powod");
        if(GetPVarInt(playerid, "panel-kary-continue") == 0) return ShowPlayerDialogEx(playerid, D_PANEL_KARY_POWOD, DIALOG_STYLE_INPUT, "K-RP » Powód", "Proszę poniżej wpisać powód.", "Dalej", "");
    }
    else if(dialogid == D_PANEL_KAR_BLOCKNICK)
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
        if(strlen(inputtext) < 1 || strlen(inputtext) > MAX_PLAYER_NAME)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
            return 1;
        }
        new str[128], powod[128];
        GetPVarString(playerid, "panel-powod", powod, 128);
		
		if(isequal(powod, "Proszę poniżej wpisać powód.") || isequal(powod, "")) {
			SendClientMessage(playerid, COLOR_RED, "Błędny powód");
			ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
			return 1;
		}
		
		if(AddPunishment(-1, inputtext, playerid, gettime(), PENALTY_BLOCK, 0, powod, 0) == 1) {
			//MruMySQL_BanujOffline(inputtext, powod, playerid);

			format(str, 128, "ADM: %s - zablokowano nick: %s powód: %s", GetNickEx(playerid), inputtext, powod);
			SendClientMessage(playerid, COLOR_LIGHTRED, str);
			Log(punishmentLog, WARNING, "Admin %s zablokował offline %s, powód: %s", 
					GetPlayerLogName(playerid),
					inputtext,
					powod);

			SetPVarInt(playerid, "panel-kary-continue", 0);
		} else {
			SendClientMessage(playerid, COLOR_RED, "Wystąpił błąd");
			ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
			return 1;
		}
    }
    else if(dialogid == D_PANEL_KAR_BANNICK)
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
        if(strlen(inputtext) < 1 || strlen(inputtext) > MAX_PLAYER_NAME)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
            return 1;
        }
        new str[128], powod[128];
        GetPVarString(playerid, "panel-powod", powod, 128);
	
		if(isequal(powod, "Proszę poniżej wpisać powód.") || isequal(powod, "")) {
			SendClientMessage(playerid, COLOR_RED, "Błędny powód");
			ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
			return 1;
		}	
	
		if(AddPunishment(-1, inputtext, playerid, gettime(), PENALTY_BAN, 0, powod, 0) == 1) {
			//MruMySQL_BanujOffline(inputtext, powod, playerid);

			format(str, 128, "ADM: %s - zbanowano nick: %s powód: %s", GetNickEx(playerid), inputtext, powod);
			SendClientMessage(playerid, COLOR_LIGHTRED, str);
			Log(punishmentLog, WARNING, "Admin %s zbanował offline %s, powód: %s", 
					GetPlayerLogName(playerid),
					inputtext,
					powod);

			SetPVarInt(playerid, "panel-kary-continue", 0);
		} else {
			SendClientMessage(playerid, COLOR_RED, "Wystąpił błąd");
			ShowPlayerDialogEx(playerid, D_PANEL_KAR_NADAJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Block na nick\nBan na nick", "Wybierz", "Wróć");
			return 1;
		}
    }
    else if(dialogid == D_PANEL_KAR_UNBLOCKNICK)
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
        if(strlen(inputtext) < 1 || strlen(inputtext) > MAX_PLAYER_NAME)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
            return 1;
        }
        new str[128], powod[128];
        GetPVarString(playerid, "panel-powod", powod, 128);
		
		if(isequal(powod, "Proszę poniżej wpisać powód.") || isequal(powod, "")) {
			SendClientMessage(playerid, COLOR_RED, "Błędny powód");
			ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
			return 1;
		}
		
        if(AddPunishment(-1, inputtext, playerid, gettime(), PENALTY_UNBLOCK, 0, powod, 0) != 1)
        {
            SendClientMessage(playerid, COLOR_RED, "Nie można było wykonać zapytania do bazy!");
            return 1;
        }

        format(str, 128, "ADM: %s - odblokowano nick: %s, powod: %s", GetNickEx(playerid), inputtext, powod);
        SendClientMessage(playerid, COLOR_LIGHTRED, str);
        Log(punishmentLog, WARNING, "Admin %s odblokował %s, powod: %s", 
                GetPlayerLogName(playerid),
                inputtext, powod);
    }
    else if(dialogid == D_PANEL_KAR_UNBANNICK)
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
        if(strlen(inputtext) < 1 || strlen(inputtext) > MAX_PLAYER_NAME)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
            return 1;
        }
        new str[128], powod[128];
        GetPVarString(playerid, "panel-powod", powod, 128);
	
		if(isequal(powod, "Proszę poniżej wpisać powód.") || isequal(powod, "")) {
			SendClientMessage(playerid, COLOR_RED, "Błędny powód");
			ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZDEJMIJ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Odblokuj nick\nUnbanuj nick", "Wybierz", "Wróć");
			return 1;
		}
		
        if(AddPunishment(-1, inputtext, playerid, gettime(), PENALTY_UNBAN, 0, powod, 0) != 1)
        {
            SendClientMessage(playerid, COLOR_RED, "Nie można było wykonać zapytania do bazy!");
            return 1;
        }

        format(str, 128, "ADM: %s - odbanowano nick: %s, powod: %s", GetNickEx(playerid), inputtext, powod);
        SendClientMessage(playerid, COLOR_LIGHTRED, str);
        Log(punishmentLog, WARNING, "Admin %s odbanował %s, powod: %s", 
                GetPlayerLogName(playerid),
                inputtext, powod);
    }
    else if(dialogid == D_PANEL_KAR_ZNAJDZ)  //Sprawdź dane po IP | Sprawdź dane po nicku
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
        if(!Uprawnienia(playerid, ACCESS_KARY_ZNAJDZ))
        {
            SendClientMessage(playerid, COLOR_RED, "Uprawnienia: Nie posiadasz wystarczających uprawnień.");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
            return 1;
        }
        switch(listitem)
        {
            case 0: ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZIP, DIALOG_STYLE_INPUT, "K-RP » Panel zarządzania karami", "Wprowadź poniżej IP do sprawdzenia.", "Sprawdź", "Wróć");
            case 1: ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZNICK, DIALOG_STYLE_INPUT, "K-RP » Panel zarządzania karami", "Wprowadź poniżej NICK do sprawdzenia.", "Sprawdź", "Wróć");
        }
    }
    else if(dialogid == D_PANEL_KAR_ZNAJDZIP)
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
        if(strlen(inputtext) < 7 || strlen(inputtext) > 16)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc IP!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Sprawdź dane po IP\nSprawdź dane po nicku", "Wybierz", "Wróć");
            return 1;
        }
        new count, cpos=0;
        while((cpos = strfind(inputtext, ".", false, cpos)) != -1)
        {
            count++;
            cpos++;
        }
        if(count != 3)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawny adres IP (dots)!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Sprawdź dane po IP\nSprawdź dane po nicku", "Wybierz", "Wróć");
            return 1;
        }
        //OK
		MruMySQL_ZnajdzBanaPoIP(playerid, inputtext);
    }
    else if(dialogid == D_PANEL_KAR_ZNAJDZNICK)
    {
        if(!response) return ShowPlayerDialogEx(playerid, D_PANEL_KAR, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", TEXT_D_PANEL_KARY, "Wybierz", "Wyjdź");
        if(strlen(inputtext) < 1 || strlen(inputtext) > MAX_PLAYER_NAME)
        {
            SendClientMessage(playerid, COLOR_RED, "Niepoprawna długosc nazwy!");
            ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Sprawdź dane po IP\nSprawdź dane po nicku", "Wybierz", "Wróć");
            return 1;
        }
        //OK
        MruMySQL_ZnajdzBanaPoNicku(playerid, inputtext);
    }
    else if(dialogid == D_PANEL_KAR_ZNAJDZ_INFO)
    {
        ShowPlayerDialogEx(playerid, D_PANEL_KAR_ZNAJDZ, DIALOG_STYLE_LIST, "K-RP » Panel zarządzania karami", "Sprawdź dane po IP\nSprawdź dane po nicku", "Wybierz", "Wróć");
        return 1;
    }
    //KONIEC PANELU ADMINA

	else if(dialogid == 128)
	{
        if(CheckAlfaNumeric(inputtext))
        {
            SendClientMessage(playerid,COLOR_P@,"Twoje hasło posiadało nie-alfanumeryczne znak, podaj inne.");
            ShowPlayerDialogEx(playerid, D_REGISTER, DIALOG_STYLE_INPUT, "Rejestracja konta", "Witaj. Aby zacząć grę na serwerze musisz się zarejestrować.\nAby to zrobić wpisz w okienko poniżej hasło które chcesz używać w swoim koncie.\nZapamiętaj je gdyż będziesz musiał go używać za każdym razem kiedy wejdziesz na serwer", "Rejestruj", "Wyjdź");
            return 1;
        }
		SendClientMessage(playerid,COLOR_P@,"|_________________________Rada dnia: zmiana hasła_________________________|");
		SendClientMessage(playerid,COLOR_WHITE,"Zmieniłeś hasło to bardzo dobrze. Zwiększy to bezpieczeństwo twojego konta na serwerze.");
		SendClientMessage(playerid,COLOR_WHITE,"Jeżeli posiadasz konto na forum z identycznym hasłem, rownież możesz rozważyć jego zmianę.");
		SendClientMessage(playerid,COLOR_WHITE,"Teraz najważniejsza sprawa {FFA500}KONIECZNIE ZAPAMIĘTAJ NOWE HASŁO.");
		SendClientMessage(playerid,COLOR_WHITE,"Z naszych doświadczeń wynika, że dużo osób zapomina nowo nadane na swoją postać hasło.");
		SendClientMessage(playerid,COLOR_WHITE,"Uniknij tej sytuacji w W TEJ CHWILII {CD5C5C}zapisz nowe hasło na karteczce lub wykonaj screen komunikatu poniżej.");
		SendClientMessage(playerid,COLOR_WHITE,"Jeżeli zapomnisz nowe hasło do konta na jego odzyskanie będziesz czekał długie tygodnie!");
		SendClientMessage(playerid,COLOR_WHITE,"Możliwe, że już teraz zapomniałeś hasła. Ale nic nie szkodzi. Poniżej prezentujemy twoje nowe hasło ( < i > nie są jego częścią! )");
		SendClientMessage(playerid,COLOR_P@,"|________________________>>> Zapisz nowe hasło na kartce! <<<________________________|");
		new string[128];
		format(string, sizeof(string), "Twoje nowe hasło to: >>>>>> %s <<<<< -> zapisz je!", inputtext);

		if(strcmp(PlayerInfo[playerid][pKey],inputtext, true ) != 0)
		{
			SendClientMessage(playerid, COLOR_PANICRED, string);
			SendClientMessage(playerid, COLOR_PANICRED, string);
			SendClientMessage(playerid, COLOR_PANICRED, string);
			//PlayerInfo[playerid][pCzystka] = 555;
			OnPlayerRegister(playerid,inputtext);
		}
		else
		{
			ShowPlayerDialogEx(playerid, 128, DIALOG_STYLE_INPUT, "Konieczna zmiana hasla", "Uwaga! Konieczna jest zmiana hasła!\nHasło na tym koncie już wygasło. Koniecznie musisz je zmienić.\nAby to zrobić wpisz nowe hasło poniżej.\n{FF0000}HASŁO NIE MOżE BYĆ TAKIE SAMO JAK POPRZEDNIE", "Zmien", "");
			return 1;
		}
	}
	else if(dialogid == D_ELEVATOR_USSS)
	{
		if (response)
		{	
			switch(listitem)
			{
				case 0://Parking
				{
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerPos(playerid, 1538.7106,-1474.8816,9.5000);
					Wchodzenie(playerid);
				}
				case 1://Recepcja
				{
					SetPlayerVirtualWorld(playerid, 41);
					SetPlayerPos(playerid, 1529.8018,-1489.0046,16.5134);
					Wchodzenie(playerid);
				}
				case 2://Sala treningowa
				{
					SetPlayerVirtualWorld(playerid, 40);
					SetPlayerPos(playerid, 1549.7249,-1462.1644,3.3250);
					Wchodzenie(playerid);
				}
				case 3://Strefa Pracownika
				{
					SetPlayerVirtualWorld(playerid, 42);
					SetPlayerPos(playerid, 1526.7426,-1469.4413,23.0778);
					Wchodzenie(playerid);
				}
				case 4://Biura
				{
					SetPlayerVirtualWorld(playerid, 43);
					SetPlayerPos(playerid, 1541.2571,-1464.1281,21.8429);
					Wchodzenie(playerid);
				}
				case 5://Akademia
				{
					SetPlayerVirtualWorld(playerid, 44);
					SetPlayerPos(playerid, 1544.1202,-1466.9008,42.8386);
					Wchodzenie(playerid);
				}
				case 6://Dach
				{
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerPos(playerid, 1542.1123,-1467.8416,63.8593);
					Wchodzenie(playerid);
				}
			}
		}
	}
    else if(dialogid == D_ELEVATOR_LSMC)
    {
        if(response)
        {
            if(LSMCElevatorQueue) return SendClientMessage(playerid, -1, "Proszę poczekać... Winda jest w użyciu!");
			switch(listitem)
			{
			    case 0:
				{
				    ElevatorTravel(playerid,-2805.0967,2596.0566,-98.0829, 90,0.0);//pkostnica
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
				case 1:
				{
					if(LSMCWindap0 == 1 && !IsPlayerInGroup(playerid, 4))
					{
						SendClientMessage(playerid, -1, "Poziom zablokowany.");
						return 1;
					}
					ElevatorTravel(playerid,1144.4740, -1333.2556, 13.8348, 0,90.0);//parking
					PlayerInfo[playerid][pLocal] = PLOCAL_DEFAULT;
				}
				case 2:
				{
        			ElevatorTravel(playerid,1134.0449,-1320.7128,68.3750,90,270.0);//p1
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
				case 3:
				{
					if(LSMCWindap2 == 1 && !IsPlayerInGroup(playerid, 4))
					{
						SendClientMessage(playerid, -1, "Poziom zablokowany.");
						return 1;
					}
					ElevatorTravel(playerid,1183.3129,-1333.5684,88.1627,90,90.0);//p2
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
				case 4:
				{
					ElevatorTravel(playerid,1168.2112,-1340.6785,100.3780,90,90.0);//p3
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
				case 5:
				{
					ElevatorTravel(playerid,1158.6868,-1339.4423,120.2738,90,90.0);//p4
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
				case 6:
				{
					ElevatorTravel(playerid,1167.7832,-1332.2727,134.7856,90,90.0);//p5
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
    			case 7:
				{
					ElevatorTravel(playerid,1177.4791,-1320.7749,178.0699,90,90.0);//p6
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
				case 8:
            	{
					ElevatorTravel(playerid,1178.2081,-1330.6317,191.5315,90,90.0);//p7
					PlayerInfo[playerid][pLocal] = PLOCAL_FRAC_LSMC;
				}
                case 9:
				{
					if(LSMCWindap8 == 1 && !IsPlayerInGroup(playerid, 4))
					{
						SendClientMessage(playerid, -1, "Poziom zablokowany.");
						return 1;
					}
            		ElevatorTravel(playerid,1161.8228, -1337.0521, 31.6112,0,180.0);//dach
					PlayerInfo[playerid][pLocal] = PLOCAL_DEFAULT;
				}
			}
        }
	}
    else if(dialogid == DIALOG_KONSOLA_VINYL)
    {
        if(!response) return 1;
        if(strlen(inputtext) < 10) return 1;

        foreach(new i : Player)
        {
            if(IsPlayerInRangeOfPoint(i, VinylAudioPos[3],VinylAudioPos[0],VinylAudioPos[1],VinylAudioPos[2]) && (GetPlayerVirtualWorld(i) == 71 || GetPlayerVirtualWorld(i) == 72))
            {
                PlayAudioStreamForPlayer(i, inputtext,VinylAudioPos[0],VinylAudioPos[1],VinylAudioPos[2], VinylAudioPos[3], 1);
            }
        }
        format(VINYL_Stream, 128, "%s",inputtext);
    }
    else if(dialogid == SCENA_DIALOG_MAIN)
    {
        if(!response) return 1;
        switch(listitem)
        {
            case 0:
            {
                if(!ScenaCreated)
                {
                    new Float:x, Float:y, Float:z, Float:a;
                    GetPlayerPos(playerid, x, y, z);
                    GetPlayerFacingAngle(playerid, a);
                    x += 10.0 * floatsin(-a, degrees);
                    y += 10.0 * floatcos(-a, degrees);
                    Scena_CreateAt(x, y, z+0.2);
                    new str[64];
                    format(str, 64, "Scena stworzona przez %s", GetNick(playerid));
                    SendAdminMessage(COLOR_RED, str);
                    print(str);
                }
                else
                {
                    Scena_Destroy();
                    new str[64];
                    format(str, 64, "Scena zniszczona przez %s", GetNick(playerid));
                    SendAdminMessage(COLOR_RED, str);
                    print(str);
                }
            }
            case 1:
            {
                ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN, DIALOG_STYLE_LIST, "Zarządzanie ekranem", "Zmień napis główny\nUstaw efekt\nUstaw dodatkowy parametr", "Wybierz", "Wyjdz");
            }
            case 2:
            {
                ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEONY, DIALOG_STYLE_LIST, "Zarządzanie neonami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
            }
            case 3:
            {
                ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY, DIALOG_STYLE_LIST, "Zarządzanie dodatkami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
            }
            case 4: ShowPlayerDialogEx(playerid, SCENA_DIALOG_AUDIO, DIALOG_STYLE_INPUT, "Zarządzanie audio", "Wprowadź link", "Ustaw", "Wyjdz");
            case 5:
            {
                if(ScenaSmokeMachine)
                {
                    DestroyDynamicObject(ScenaSmokeObject[0]);
                    DestroyDynamicObject(ScenaSmokeObject[1]);
                    ScenaSmokeMachine=false;
                }
                else
                {
                    ScenaSmokeObject[0] = CreateDynamicObject(2780, ScenaPosition[0]+5.84926, ScenaPosition[1]+4.44155, ScenaPosition[2]+0.10611,   0.00000, 0.00000, -48.24001);
                    ScenaSmokeObject[1] = CreateDynamicObject(2780, ScenaPosition[0]+5.98447, ScenaPosition[1]-5.16050, ScenaPosition[2]+0.10611,   0.00000, 0.00000, -143.22002);
                    ScenaSmokeMachine=true;
                    Scena_Refresh();
                }
            }
        }
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_CREATE)
    {
        if(!response) return 1;

    }
    else if(dialogid == SCENA_DIALOG_EFEKTY)
    {
        if(!response) return 1;
        new str[1024] = "{000000}0\t{FFFFFF}Usuń\n{000000}18668\t{FFFFFF}Krew\n{000000}18670\t{FFFFFF}Błyski\n{000000}18675\t{FFFFFF}Dymek\n{000000}18678\t{FFFFFF}Eksplozja\n{000000}18683\t{FFFFFF}Eksplozja medium\n{000000}18685\t{FFFFFF}Eksplozja mała\n{000000}18692\t{FFFFFF}Ogień\n{000000}18702\t{FFFFFF}Niebieski płomień\n{000000}18708\t{FFFFFF}Bąbelki\n{000000}18718\t{FFFFFF}Iskry\n{000000}18728\t{FFFFFF}Raca\n{000000}18740\t{FFFFFF}Woda\n";
        strcat(str, "{000000}18680\t{FFFFFF}Dym + iskry\n{000000}18715\t{FFFFFF}Dym duży\n{000000}18693\t{FFFFFF}Ogień #2\n{000000}18744\t{FFFFFF}Splash big\n{000000}18747\t{FFFFFF}Wodna piana");
        switch(listitem)
        {
            case 0: ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY_TYP, DIALOG_STYLE_LIST, "Zarządzanie dodatkami", str, "Wybierz", "Wyjdz");
            case 1: ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY_COUNT, DIALOG_STYLE_INPUT, "Zarządzanie dodatkami", "Podaj ilość powtórzeń\t\tnp.\n-1 - dla nieskończonej pętli\n0 - dla wyłączenia\nn - liczba", "Wybierz", "Wyjdz");
            case 2: ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY_DELAY, DIALOG_STYLE_INPUT, "Zarządzanie dodatkami", "Podaj odstęp czasowy\t\tnp.\n0 - stały efekt\nn [ms] - czas", "Wybierz", "Wyjdz");
        }
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EFEKTY_TYP)
    {
        if(!response) return 1;
        if(strval(inputtext) == 0)
        {
            if(ScenaEffectData[SCEffectTimer] != 0)
            {
                KillTimer(ScenaEffectData[SCEffectTimer]);
                ScenaEffectData[SCEffectTimer] = 0;
            }
            ScenaEffectData[SCEffectDelay] = 0;
        }
        else ScenaEffectData[SCEffectModel] = strval(inputtext);
        ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY, DIALOG_STYLE_LIST, "Zarządzanie dodatkami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
        Scena_GenerateEffect();
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EFEKTY_COUNT)
    {
        if(!response) return 1;
        if(strval(inputtext) < -1 || strval(inputtext) > 0xFFFF) return 1;
        ScenaEffectData[SCEffectCount] = strval(inputtext);

        if(ScenaEffectData[SCEffectTimer] != 0)
        {
            KillTimer(ScenaEffectData[SCEffectTimer]);
            ScenaEffectData[SCEffectTimer] = 0;
        }

        if(ScenaEffectData[SCEffectCount] == -1)
        {
            if(ScenaEffectData[SCEffectDelay] != 0) ScenaEffectData[SCEffectTimer] = SetTimer("Scena_GenerateEffect", ScenaEffectData[SCEffectDelay], 1);
        }
        ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY, DIALOG_STYLE_LIST, "Zarządzanie dodatkami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
        Scena_GenerateEffect();
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EFEKTY_DELAY)
    {
        if(!response) return 1;
        if(strval(inputtext) < 250 || strval(inputtext) > 0xFFFF) return SendClientMessage(playerid, -1, "Od 250");
        ScenaEffectData[SCEffectDelay] = strval(inputtext);

        if(ScenaEffectData[SCEffectTimer] != 0)
        {
            KillTimer(ScenaEffectData[SCEffectTimer]);
            ScenaEffectData[SCEffectTimer] = 0;
        }
        if(ScenaEffectData[SCEffectCount] == -1)
        {
            if(ScenaEffectData[SCEffectDelay] != 0) ScenaEffectData[SCEffectTimer] = SetTimer("Scena_GenerateEffect", ScenaEffectData[SCEffectDelay], 1);
        }

        ShowPlayerDialogEx(playerid, SCENA_DIALOG_EFEKTY, DIALOG_STYLE_LIST, "Zarządzanie dodatkami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
        Scena_GenerateEffect();
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EKRAN)
    {
        if(!response) return 1;
        new str[512] = "{000000}0\t{FFFFFF}Usuń\n{000000}1\t{FFFFFF}Góra-dół";
        switch(listitem)
        {
            case 0: ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN_TYP, DIALOG_STYLE_INPUT, "Zarządzanie ekranem", "Wprowadź napis", "Wybierz", "Wyjdz");
            case 1: ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN_EFEKT, DIALOG_STYLE_LIST, "Zarządzanie ekranem", str, "Wybierz", "Wyjdz");
            case 2: ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN_EXTRA, DIALOG_STYLE_INPUT, "Zarządzanie ekranem", "Dla efektu Wirnik:\t\tPrędkość (całkowite wartości)", "Wybierz", "Wyjdz");
        }
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EKRAN_TYP)
    {
        if(!response) return 1;
        if(strlen(inputtext) > 32) return 1;
        format(ScenaScreenText, 32, "%s", inputtext);
        new size = 148-(floatround(floatsqroot(strlen(inputtext)*150))*2);
        if(size < 10) size = 10;
        SetDynamicObjectMaterialText(ScenaScreenObject, 0, inputtext, OBJECT_MATERIAL_SIZE_512x256, "Arial", size, 1, 0xFFFFFFFF, 0, 1);
        ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN, DIALOG_STYLE_LIST, "Zarządzanie ekranem", "Zmień napis główny\nUstaw efekt\nUstaw dodatkowy parametr", "Wybierz", "Wyjdz");
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EKRAN_EFEKT)
    {
        if(!response) return 1;
        if(strval(inputtext) == 0)
        {
            ScenaScreenEnable = false;
            new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(ScenaScreenObject, x, y, z);
            if(ScenaScreenMove == 0) MoveDynamicObject(ScenaScreenObject, x, y, ScenaPosition[2]+4.18430, ScenaScreenData, 0.0, 0.0, 100.0), ScenaScreenMove= 1;
            else if(ScenaScreenMove == 1) MoveDynamicObject(ScenaScreenObject, x, y, ScenaPosition[2]+4.18430, ScenaScreenData, 0.0, 0.0, 100.0), ScenaScreenMove=0;

            SetDynamicObjectMaterialText(ScenaScreenObject, 0, ScenaScreenText, OBJECT_MATERIAL_SIZE_512x256, "Arial", 72, 1, 0xFFFFFFFF, 0, 1);
        }
        else
        {
            ScenaScreenTyp = strval(inputtext);
            ScenaScreenEnable = true;
        }

        Scena_ScreenEffect();
        ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN, DIALOG_STYLE_LIST, "Zarządzanie ekranem", "Zmień napis główny\nUstaw efekt\nUstaw dodatkowy parametr", "Wybierz", "Wyjdz");
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_EKRAN_EXTRA)
    {
        if(!response) return 1;
        if(strval(inputtext) < 0 || strval(inputtext) > 100) return 1;
        ScenaScreenData = float(strval(inputtext));

        Scena_ScreenEffect();

        ShowPlayerDialogEx(playerid, SCENA_DIALOG_EKRAN, DIALOG_STYLE_LIST, "Zarządzanie ekranem", "Zmień napis główny\nUstaw efekt\nUstaw dodatkowy parametr", "Wybierz", "Wyjdz");
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_NEONY)
    {
        if(!response) return 1;
        new str[512] = "{000000}0\t{FFFFFF}Usuń\n{000000}1\t{FFFFFF}Slider\n{000000}2\t{FFFFFF}Zderzacz";
        switch(listitem)
        {
            case 0: ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEON_EFEKT, DIALOG_STYLE_LIST, "Zarządzanie neonami", str, "Wybierz", "Wyjdz");
            case 1: ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEON_COUNT, DIALOG_STYLE_INPUT, "Zarządzanie neonami", "Aktualnie brak", "Wybierz", "Wyjdz");
            case 2: ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEON_DELAY, DIALOG_STYLE_INPUT, "Zarządzanie neonami", "Dla efektu:\t\tPrędkość (całkowite wartości)", "Wybierz", "Wyjdz");
        }
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_NEON_EFEKT)
    {
        if(!response) return 1;
        ScenaNeonData[SCNeonTyp] = 0;
        Scena_NeonEffect();

        ScenaNeonData[SCNeonTyp] = strval(inputtext);
        if(ScenaNeonData[SCNeonTyp] != 0)
        {
            new str[256] = "{000000}18652\t\t{FFFFFF}Biały neon\n{000000}18647\t\t{FFFFFF}Czerwony neon\n{000000}18648\t\t{FFFFFF}Niebieski neon\n{000000}18649\t\t{FFFFFF}Zielony neon\n{000000}18650\t\t{FFFFFF}żółty neon\n{000000}18651\t\t{FFFFFF}Różowy neon <3 :*";
            ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEON_KOLORY, DIALOG_STYLE_LIST, "Zarządzanie neonami", str, "Wybierz", "Wyjdz");
        }
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_NEON_COUNT)
    {
        if(!response) return 1;
        if(strval(inputtext) < -1 || strval(inputtext) > 100) return 1;
        ScenaNeonData[SCNeonCount] = strval(inputtext);

        Scena_NeonEffect();

        ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEONY, DIALOG_STYLE_LIST, "Zarządzanie neonami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_NEON_DELAY)
    {
        if(!response) return 1;
        if(strval(inputtext) < 0 || strval(inputtext) > 200) return SendClientMessage(playerid, -1, "Do 200");
        ScenaNeonData[SCNeonDelay] = strval(inputtext);

        Scena_NeonEffect();

        ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEONY, DIALOG_STYLE_LIST, "Zarządzanie neonami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_NEON_KOLORY)
    {
        if(!response) return 1;
        ScenaNeonData[SCNeonModel] = strval(inputtext);
        ScenaNeonData[SCNeonSliderRefresh]=true;

        Scena_NeonEffect();

        ShowPlayerDialogEx(playerid, SCENA_DIALOG_NEONY, DIALOG_STYLE_LIST, "Zarządzanie neonami", "Ustaw efekt\nUstaw powtarzalność\nUstaw częstotliwość", "Wybierz", "Wyjdz");
        return 1;
    }
    else if(dialogid == SCENA_DIALOG_AUDIO)
    {
        if(!response) return 1;
        format(ScenaAudioStream, 128, "%s", inputtext);
        for(new i=0;i<MAX_PLAYERS;i++)
        {
            if(GetPVarInt(i, "scena-audio") == 1)
            {
                StopAudioStreamForPlayer(i);
                SetPVarInt(i, "scena-audio", 0);
            }
        }
        return 1;
    }
	else if(dialogid == SCENA_DIALOG_GETMONEY)
	{
		if(!response)
		{
			return 1;
		}
		if(kaska[playerid] >= PRICE_SCENA)
		{
			ZabierzKaseDone(playerid, PRICE_SCENA); 
			Sejf_Add(FRAC_SN, PRICE_SCENA); 
			new string[124]; 
			format(string, sizeof(string), "%s umieścił w sejfie $"#PRICE_SCENA" za scenę!"); 
			SendLeaderRadioMessage(FRAC_SN, COLOR_LIGHTGREEN, string); 
			SN_ACCESS[playerid] = 1; 
			sendTipMessageEx(playerid, COLOR_P@, "Umieściłeś opłatę za scenę w sejfie SN"); 
		}
		else
		{
			sendTipMessage(playerid, "Nie masz wystarczającej ilości gotówki! ($"#PRICE_SCENA")"); 
			return 1;
		}
	}
	else if(dialogid == 7421)
	{
	    if(response)
		{
		    new string[128];
		    new giveplayerid = dajeKontrakt[playerid];
		    new hajs = haHajs[playerid];
            if(!IsPlayerConnected(giveplayerid))
            {
                SendClientMessage(playerid, COLOR_PANICRED, "   Gracz na którego podpisywałeś zlecenie się wylogował!");
                return 1;
            }
			
			if(kaska[playerid] > 0 && kaska[playerid] >= hajs)
			{
				ZabierzKaseDone(playerid, hajs);
				PlayerInfo[giveplayerid][pHeadValue]+=hajs;
				format(string, sizeof(string), "%s podpisał kontrakt na %s, nagroda za wykonanie $%d.",GetNick(playerid), GetNick(giveplayerid), hajs);
				GroupSendMessage(8, COLOR_YELLOW, string);
				format(string, sizeof(string), "* Podpisałeś kontrakt na %s, za $%d.",GetNick(giveplayerid), hajs);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* %s wkłada kopertę z pieniędzmi do skrzynki, po czym zamyka ją.", GetNick(playerid));
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				dajeKontrakt[playerid] = 9999;
				haHajs[playerid] = 0;
				ClearAnimations(playerid);
		        return 1;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_PANICRED, "   Nie masz tylu pieniędzy!");
			    return 1;
			}
		}
		else
		{
		    SendClientMessage(playerid, COLOR_GREY, "Anulowałeś podpisywanie kontraktu.");
	        dajeKontrakt[playerid] = 9999;
	        haHajs[playerid] = 0;
	        return 1;
		}
	}
    else if(dialogid == D_PRZEBIERZ_FDU)
    {
        if(!response) return 1;
        new lSkin;
        switch(listitem)
        {
            case 0: lSkin = 40;
            case 1: lSkin = 50;
            case 2: lSkin = 93;
            case 3: lSkin = 86;
            case 4: lSkin = 115;
            case 5: lSkin = 122;
            case 6: lSkin = 270;
        }
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessage(playerid, 0xFF8D00FF, "Musisz być pieszo, żeby zmienić skin.");
        SetPlayerSkinEx(playerid, lSkin);
        SendClientMessage(playerid, 0xC0FF9CFF, "» Zmieniłeś swoje przebranie.");
    }
	else if(dialogid == 1213)
 	{
		if(response == 1)
 		{
  			switch(listitem)
    		{
	                case 0:
	                {
	                	ApplyAnimation(playerid,"PED","WALK_DRUNK",4.0, 1, 1, 1, 1, 0, 1);
					}
	                case 1:
	                {
	                	ApplyAnimation(playerid,"PED","WALK_civi",4.0, 1, 1, 1, 1, 1, 1);
					}
	                case 2:
	                {
	                	ApplyAnimation(playerid,"PED","WALK_fatold",4.0, 1, 1, 1, 1, 1, 1);
	             	}
	                case 3:
	                {
	                    ApplyAnimation(playerid,"PED","WALK_gang1",4.0, 1, 1, 1, 1, 1, 1);
	                }
	                case 4:
	                {
	                    ApplyAnimation(playerid,"PED","WALK_gang2",4.0, 1, 1, 1, 1, 1, 1);
	                }
					case 5:
					{
					    ApplyAnimation(playerid,"PED","WALK_old",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 6:
					{
                        ApplyAnimation(playerid,"PED","WALK_rocket",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 7:
					{
                        ApplyAnimation(playerid,"PED","WALK_player",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 8:
					{
                        ApplyAnimation(playerid,"PED","WOMAN_walkfatold",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 9:
					{
                        ApplyAnimation(playerid,"PED","WOMAN_walksexy",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 10:
					{
                        ApplyAnimation(playerid,"FAT","FatWalk",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 11:
					{
                        ApplyAnimation(playerid,"PED","WOMAN_Walkbusy",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 12:
					{
                        ApplyAnimation(playerid,"PED","WOMAN_walkshop",4.0, 1, 1, 1, 1, 1, 1);
					}
					case 13:
					{
                        ApplyAnimation(playerid,"MUSCULAR","MuscleWalk",4.0, 1, 1, 1, 1, 1, 1);
  				}
			}
		}
	}
	else if(dialogid == iddialog[playerid]) //TODO: WTF
	{
		if(dialogid == 1)
	    {
	        if(response)
	        {
	    		if(PlayerInfo[playerid][pPos_x] == 2246.6 || PlayerInfo[playerid][pPos_y] == -1161.9 || PlayerInfo[playerid][pPos_z] == 1029.7 || PlayerInfo[playerid][pPos_x] == 0 || PlayerInfo[playerid][pPos_y] == 0 || PlayerInfo[playerid][pVW] > 7000)
	      		{
	                //SendClientMessage(playerid, 0xFFFFFFFF, "Twoja pozycja została błędnie zapisana, dlatego zespawnujesz się na zwykłym spawnie.");
                }
				else
				{
					SendClientMessage(playerid, 0xFFFFFFFF, "Pozycja przywrócona");
					SetPVarInt(playerid, "spawn", 2);
					SetPlayerSpawnPos(playerid);
				}
			}
			else if(!response)
			{
				PlayerInfo[playerid][pLocal] = 255;
			}
			GUIExit[playerid] = 0;
			lowcap[playerid] = 0;
			return 1;
	    }
	    //OnDialogResposne OKNA DMV
		if(dialogid == 99)
		{
			if(response)
			{
				new string[256];
				new okienkoid = GetPVarInt(playerid, "okienko-edit");
				new mojeimie[MAX_PLAYER_NAME + 1];
				GetPlayerName(playerid, mojeimie, sizeof(mojeimie));
				
			    switch(listitem)
			    {
			        case 0:
			        {
						if(GroupPlayerDutyRank(playerid) == 0)
						{
							format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC}Dowody Osobiste\n Karty Wędkarskie\n Egzaminy Praktyczne", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
							UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
						}
						else if(GroupPlayerDutyRank(playerid) == 1)
						{
	
							format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC}Dowody Osobiste\n Karty Wędkarskie\n Egzaminy Praktyczne i Teoretyczne\n Pozwolenia na broń", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
							UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
						}
						else if(GroupPlayerDutyRank(playerid) == 2)
						{
							format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC}Dowody Osobiste\n Karty Wędkarskie\n Egzaminy Praktyczne i Teoretyczne\n Pozwolenia na broń\n Patenty żeglarskie", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
							UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
						}
						else if(GroupPlayerDutyRank(playerid) >= 3)
						{
							format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC}Uniwersalne", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
							UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);	
						}
			        }
			        case 1:
			        {
						format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC} Egzaminy Praktyczne\n{008080}Zapis i egzamin odbywa się\n u tej samej osoby", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
						UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
			        }
			        case 2:
			        {
						format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC} Egzaminy Teoretyczne\n{008080}Każde kolejne podejście\n wymaga zachowania 1h odstępu", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
						UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
			        }
			        case 3:
			        {
						format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC} Kurs na prawo jazdy\n{008080}Zapisy", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
						UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
			        }
			        case 4:
			        {
						format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {00FFCC} Rejestracja", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
			        	UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
			        }
			        case 5:
			        {
						format(string, sizeof(string), "Urząd Miasta Los Santos\n\n{0080FF}___Okienko %d___\n[%s: %d]\n{FF0000}[ID: %d]\n {FA9C1A} Zaraz Wracam", okienkoid+1,GroupPlayerDutyRank(playerid),mojeimie,playerid);
			        	UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
			        }
			        case 6:
			        {
						format(string, sizeof(string), "Urząd Miasta Los Santos\n{0080FF}Okienko %d \n {FF0000}Nieczynne", okienkoid+1);
						UpdateDynamic3DTextLabelText(okienko[okienkoid], 0xFFFFFFFF, string);
			        }
			    }
			}
		}
	    else if(dialogid == 112)
	    {
            if(!response) return 1;
            switch(listitem)
            {
                case 0:
                {
    	            SendClientMessage(playerid, COLOR_ALLDEPT, "Centrala: łącze z policją, prosze czekać...");
    				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Witam, prosze podać krótki opis przestępstwa.");
    				Mobile[playerid] = POLICE_NUMBER;
					Callin[playerid] = CALL_EMERGENCY;
                }
				case 1:
                {
    			    SendClientMessage(playerid, COLOR_ALLDEPT, "Centrala: łącze ze szpitalem, prosze czekać...");
    				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Szpital: Witam, prosze podać krótki opis zdarzenia.");
    				Mobile[playerid] = LSMC_NUMBER;
					Callin[playerid] = CALL_EMERGENCY;
                }
                case 2:
                {
                	SendClientMessage(playerid, COLOR_ALLDEPT, "Centrala: łącze ze strażą pożarną, prosze czekać...");
    				SendClientMessage(playerid, COLOR_DBLUE, "LSFD HQ: Witam, prosze podać krótki opis zdarzenia.");	
    				Mobile[playerid] = LSMC_NUMBER;
					Callin[playerid] = CALL_EMERGENCY;
                }
			}
	    }
		else if(dialogid== WINDA_SAN)
    	{
    	    if(response)
    	    {
    	        switch(listitem)
    	        {
    	            case 0://parking
    	            {
    	                SetPlayerVirtualWorld(playerid,0);
    	                SetPlayerPos(playerid,732.6443, -1343.4160, 13.5982);
    	                new Hour, Minute, Second;
    					gettime(Hour, Minute, Second);
    					SetPlayerTime(playerid,Hour,Minute);
						SetPLocal(playerid, PLOCAL_DEFAULT);
    	            }
    	            case 1://recepcja
    	            {
    	                SetPlayerVirtualWorld(playerid,20);
    				    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
    				    SetPlayerPos(playerid,666.5681, -1353.2101, 29.3031);
    				    new Hour, Minute, Second;
    					gettime(Hour, Minute, Second);
    					SetPlayerTime(playerid,Hour,Minute);
						SetPLocal(playerid, PLOCAL_ORG_SN);
    	            }
    	            case 2://studio Victim
    	            {
    	                SetPlayerVirtualWorld(playerid,21);
    				    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
    				    SetPlayerPos(playerid,661.8192, -1344.7736, 29.4743);
    				    SetPlayerTime(playerid,1,0);
						SetPLocal(playerid, PLOCAL_ORG_SN);
    	            }
    	            case 3://drukarnia & studio nagran
    	            {
    	                SetPlayerVirtualWorld(playerid,22);
    				    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
    				    SetPlayerPos(playerid,655.7669, -1376.8688, 28.6743);
    				    new Hour, Minute, Second;
    					gettime(Hour, Minute, Second);
    					SetPlayerTime(playerid,Hour,Minute);
						SetPLocal(playerid, PLOCAL_ORG_SN);
    	            }
    	            case 4://sale konferencyjne
    	            {
    	                SetPlayerVirtualWorld(playerid,23);
    				    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
    				    SetPlayerPos(playerid,737.4208, -1366.9336, 34.0796);
    				    new Hour, Minute, Second;
    					gettime(Hour, Minute, Second);
    					SetPlayerTime(playerid,Hour,Minute);
    	            }
    	            case 5:
    	            {
    	                SetPlayerVirtualWorld(playerid,24);
    				    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
    				    SetPlayerPos(playerid,663.6946, -1374.4166, 27.9148);
    				    new Hour, Minute, Second;
    					gettime(Hour, Minute, Second);
    					SetPlayerTime(playerid,Hour,Minute);
						SetPLocal(playerid, PLOCAL_ORG_SN);
    	            }
    	            case 6://dach
    	            {
    	                SetPlayerVirtualWorld(playerid,0);
    	                SetPlayerPos(playerid,721.5345, -1381.9717, 25.7202);
    	                new Hour, Minute, Second;
    					gettime(Hour, Minute, Second);
    					SetPlayerTime(playerid,Hour,Minute);
						SetPLocal(playerid, PLOCAL_DEFAULT);
    	            }
    	        }
    	    }
    	}
	    else if(dialogid == WINDA_LSPD)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
					case 0:
		            {
		            	if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
			                SetPlayerPos(playerid,1543.3915,-1643.2813,28.4881);
			                SetPlayerVirtualWorld(playerid,29);
			                SetPlayerInterior(playerid,0);
							Wchodzenie(playerid);
			                GameTextForPlayer(playerid, "~w~ [Poziom -2]~n~~r~Wiezienie", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
                        }
						else if(ApprovedLawyer[playerid] == 1)
						{
							SetPlayerPos(playerid,1556.7177,-1643.0455,28.4881);
			                SetPlayerVirtualWorld(playerid,29);
			                SetPlayerInterior(playerid,0);
							Wchodzenie(playerid);
			                GameTextForPlayer(playerid, "~w~ [Poziom -2]~n~~r~Wiezienie", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
		            case 1:
		            {
		            	if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
			                SetPlayerPos(playerid,1568.7660,-1691.4886,5.8906);
			                SetPlayerVirtualWorld(playerid,2);
			                SetPlayerInterior(playerid,0);
			                TogglePlayerControllable(playerid,0);
							Wchodzenie(playerid);
			                GameTextForPlayer(playerid, "~w~ [Poziom -1]~n~~b~Parking Dolny", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
                        }
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
		            case 2: {
		            	// parking gorny
		            	if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
			                SetPlayerPos(playerid,1571.29,-1635.58, 13.56); // pos gornego
			                SetPlayerVirtualWorld(playerid,0);
			                SetPlayerInterior(playerid,0);
			                TogglePlayerControllable(playerid,0);
							Wchodzenie(playerid);
			                GameTextForPlayer(playerid, "~w~ [Poziom 0]~n~~b~Parking Gorny", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
                        }
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
		            case 3:
		            {
		                SetPlayerPos(playerid,1585.8722,-1685.5045,62.2363);
		                SetPlayerVirtualWorld(playerid,25);
		                TogglePlayerControllable(playerid,0);
						SetPlayerInterior(playerid,0);
						Wchodzenie(playerid);
		                GameTextForPlayer(playerid, "~w~ [Poziom 1]~n~~b~Recepcja i glowny hol", 5000, 1);
						PlayerInfo[playerid][pInt] = 0;
		            }
		            case 4:
		            {
						if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
							SetPlayerPos(playerid,1585.8090,-1685.1177,65.8762);
							SetPlayerVirtualWorld(playerid,25);
							TogglePlayerControllable(playerid,0);
							SetPlayerInterior(playerid,0);
							Wchodzenie(playerid);
							GameTextForPlayer(playerid, "~w~ [Poziom 2]~n~~b~Biuro komendanta", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
		            case 5:
		            {
						if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
							SetPlayerPos(playerid,1551.5720,-1701.7196,28.4807);
							SetPlayerVirtualWorld(playerid,26);
							TogglePlayerControllable(playerid,0);
							SetPlayerInterior(playerid,0);
							Wchodzenie(playerid);
							GameTextForPlayer(playerid, "~w~ [Poziom 3]~n~~b~Biura", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
		            case 6:
		            {
						if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
							SetPlayerPos(playerid,1562.7128,-1639.0281,28.5040);
							SetPlayerVirtualWorld(playerid,27);
							TogglePlayerControllable(playerid,0);
							SetPlayerInterior(playerid,0);
							Wchodzenie(playerid);
							GameTextForPlayer(playerid, "~w~ [Poziom 4]~n~~b~Konferencyjne", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
					case 7:
		            {
						if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
           				{
							SetPlayerPos(playerid,1564.9027,-1665.8291,28.4815);
							SetPlayerVirtualWorld(playerid,28);
							TogglePlayerControllable(playerid,0);
							SetPlayerInterior(playerid,0);
							Wchodzenie(playerid);
							GameTextForPlayer(playerid, "~w~ [Poziom 4]~n~~b~Sale przesluchan", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
		            case 8:
		            {
						if(IsAPolicja(playerid, 0) || IsABOR(playerid, 0))
						{
							SetPlayerPos(playerid, 1564.92, -1665.82, 28.39);
							SetPlayerVirtualWorld(playerid,0);
							SetPlayerInterior(playerid,0);
							GameTextForPlayer(playerid, "~w~ [Poziom 7]~n~~b~Dach", 5000, 1);
							PlayerInfo[playerid][pInt] = 0;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla służb porządkowych.");
							return 1;
						}
		            }
				}
		    }
		}
   	 	else if(dialogid == 121)
	    {
	        if(response)
	        {
	            switch(listitem)
	            {
	                case 0:
	                {
                 		SetPlayerPos(playerid, 707.06085205078,-508.38107299805,27.871946334839);//salka konferencyjna
				        GameTextForPlayer(playerid, "~w~Witamy w salce konferencyjnej", 5000, 1);
				        SetPlayerVirtualWorld(playerid, 35);
				        TogglePlayerControllable(playerid, 0);
						Wchodzenie(playerid);
	                }
	                case 1:
	                {
	                    SetPlayerPos(playerid, 700.6748046875,-502.41955566406,23.515483856201);//biura
				        GameTextForPlayer(playerid, "~w~Projekt by Kacper Monari", 5000, 1);
				        SetPlayerVirtualWorld(playerid, 35);
				        TogglePlayerControllable(playerid, 0);
						Wchodzenie(playerid);
					}
	                case 2:
	                {
						sendTipMessageEx(playerid, 0x800040FF, "Wygląda na to, że piętro jest czymś przyblokowane"); 
	                }
	            }
	        }
	    }
	    if(dialogid == 122)
		{
			if(response == 1)
			{
			    switch(listitem)
			    {
			        case 0:
			        {
           				if(IsAUrzednik(playerid, 0) || IsABOR(playerid, 0))//zaplecze
           				{
					        SetPlayerPos(playerid,1285.5134, -1329.1538, 13.5492);
					        SetPlayerVirtualWorld(playerid,0);
					        SetPlayerInterior(playerid,0);
					        PlayerInfo[playerid][pLocal] = 255;
					        SendClientMessage(playerid, COLOR_LIGHTGREEN, " *DING* Poziom 0, Zaplecze");
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "Poziom zastrzeżony dla pracowników UM");
							return 1;
						}
			        }
			        case 1:
			        {
				        SetPlayerPos(playerid,1450.6615,-1819.2279,77.9613);//główna sala urzędu
				        SetPlayerVirtualWorld(playerid,50);
				        SetPlayerInterior(playerid,0);
	                    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
	                    SendClientMessage(playerid, COLOR_LIGHTGREEN, ">>>> Trwa jazda na Poziom 9 - Główna sala urzędu <<<<");
	                    SendClientMessage(playerid, COLOR_WHITE, "  --> Okienka dla interesantów");
	                    SendClientMessage(playerid, COLOR_WHITE, "  --> Wyjście na plac manewrowy");
	                    SendClientMessage(playerid, COLOR_WHITE, "  --> Toalety na każdym skrzydle");
                     	SendClientMessage(playerid, COLOR_WHITE, "  --> Biura & Sale konferencyjne & Senat & Burmistrz & Akademia");
                     	SendClientMessage(playerid, COLOR_WHITE, "  --> Biuro ochrony - biuro kamer");
                     	SendClientMessage(playerid, COLOR_LIGHTGREEN, ">>>> Proszę czekać, za chwilę otworzą się drzwi(10sek) <<<<");
                     	PlayerInfo[playerid][pLocal] = 108;
			        }
					case 2:
					{
						SetPlayerPos(playerid,1481.5200,-1821.0967,58.1563);
						SetPlayerVirtualWorld(playerid,51);
				        SetPlayerInterior(playerid,0);
	                    TogglePlayerControllable(playerid,0);
                        Wchodzenie(playerid);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, ">>>> Trwa jazda na Poziom 10 - Kancelaria Burmistrza <<<<");
						PlayerInfo[playerid][pLocal] = 108;
						GameTextForPlayer(playerid, "~r~by skTom&skLolsy", 5000, 1);	
					}
				}
			}
		}
		else if(dialogid == 19)
		{
			if(response)
			{
				switch(listitem)//Winda FBI","[Poziom -1]Parking podziemny \n[Poziom 0]Parking\n[Poziom 0.5]\n Areszt federalny\n[Poziom 1]Recepcja\n[Poziom 2] Szatnia\n[Poziom 3] Zbrojownia \n[Poziom 4]Biura federalne \n[Poziom 5] Dyrektorat\n[Poziom 6]CID/ERT\n[Poziom 7]Sale Treningowe \n [Poziom X] Dach","Jedz","Anuluj");
				{
					case 0://parking podziemny
					{
						if(levelLock[FRAC_FBI][0] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,2);
						SetPlayerPos(playerid,1093.0625,1530.8715,6.6905);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom -1, Parking podziemny FBI");
						PlayerInfo[playerid][pLocal] = 255;
						GameTextForPlayer(playerid, "~p~by Simeone ~r~Cat", 5000, 1);
					}
					case 1://parking
					{
						if(levelLock[FRAC_FBI][1] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,0);
						SetPlayerPos(playerid,596.5255, -1489.2544, 15.3587);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 0, Parking FBI");
						GameTextForPlayer(playerid, "~p~by UbunteQ", 5000, 1);
						PlayerInfo[playerid][pLocal] = 255;
					}
					case 2://areszt federalny
					{
						if(levelLock[FRAC_FBI][2] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid, 1);
						SetPlayerPos(playerid, 594.05334, -1476.27490, 81.82840+0.5);
						GameTextForPlayer(playerid, "~p~Areszt federalny", 5000, 1);
						PlayerInfo[playerid][pLocal] = 255;
					}
					case 3://recepcja
					{
						if(levelLock[FRAC_FBI][3] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,1);
						SetPlayerPos(playerid,586.83704, -1473.89270, 89.30576);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 1, Recepcja");
						GameTextForPlayer(playerid, "~p~by UbunteQ & Iwan", 5000, 1);
						PlayerInfo[playerid][pLocal] = 212;
						Wchodzenie(playerid);
					}
					case 4://szatnia
					{
						if(levelLock[FRAC_FBI][4] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,2);
						SetPlayerPos(playerid,592.65466, -1486.76575, 82.10487);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 2, Szatnia");
						PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
						GameTextForPlayer(playerid, "~p~by UbunteQ & Iwan", 5000, 1);
						PlayerInfo[playerid][pLocal] = 255;
						Wchodzenie(playerid);
					
					}
					case 5://Zbrojownia
					{
						if(levelLock[FRAC_FBI][5] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,3);
						SetPlayerPos(playerid,591.37579, -1482.26672, 80.43560);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 3 - Zbrojownia");
						PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
						GameTextForPlayer(playerid, "~p~by UbunteQ & Iwan", 5000, 1);
						PlayerInfo[playerid][pLocal] = 255;

					}
					case 6://Biura federalne
					{
						if(levelLock[FRAC_FBI][6] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,4);
						SetPlayerPos(playerid,596.21857, -1477.92395, 84.06664);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 4, Biura Federalne");
						PlayerInfo[playerid][pLocal] = 255;
						Wchodzenie(playerid);

					}
					case 7://Dyrektorat
					{
						if(levelLock[FRAC_FBI][7] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,5);
						SetPlayerPos(playerid,589.23029, -1479.66357, 91.74274);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 5, Dyrektorat");
						PlayerInfo[playerid][pLocal] = 212;
						Wchodzenie(playerid);
					}
					case 8://CID ERT
					{
						if(levelLock[FRAC_FBI][8] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,6);
						SetPlayerPos(playerid,585.70782, -1479.54211, 99.01273);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 6, CID/ERT");
						PlayerInfo[playerid][pLocal] = 212;
					}
					case 9://sale treningowe
					{
						if(levelLock[FRAC_FBI][9] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid, 7);
						SetPlayerPos(playerid, 590.42767, -1447.62939, 80.95732);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 7, Sale Treningowe");
					}
					case 10:
					{
						if(levelLock[FRAC_FBI][10] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid, 8);
						SetPlayerPos(playerid, 605.5609, -1462.2583, 88.1674);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Poziom 8, Sale przesłuchań");
					}
					case 11://dach
					{
						if(levelLock[FRAC_FBI][11] == 1 && !IsPlayerInGroup(playerid, FRAC_FBI))
						{
							sendTipMessageEx(playerid, COLOR_RED, "Ten poziom jest zablokowany!"); 
							return 1;
						}
						Wchodzenie(playerid);
						SetPlayerVirtualWorld(playerid,0);
						SetPlayerPos(playerid,613.4404,-1471.9745,73.8816);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, "Dach");
						PlayerInfo[playerid][pLocal] = 255;
					}
				}
			}
		}
		else if(dialogid == D_SHOP_CATEGORY)
		{
			if(!response) return 0;
			DynamicGui_Init(playerid);
			new products[248];
			products = "Produkt\tCena\n";
			for(new i = 0; i < sizeof shopProducts; i++)
			{
				if(shopProducts[i][_s_category] != listitem) continue;
				strcat(products, sprintf("\n%s\t$%d", shopProducts[i][_s_name], shopProducts[i][_s_price]));
				DynamicGui_AddRow(playerid, i);
			}
			if(strlen(products) < 17) return 0;
			ShowPlayerDialogEx(playerid, D_SHOP_AMOUNT, DIALOG_STYLE_TABLIST_HEADERS, "Sklep 24/7 - produkty", products, "Kup", "Zamknij");
		}
		else if(dialogid == D_SHOP_AMOUNT)
		{
			if(!response) return ShowPlayerDialogEx(playerid, D_SHOP_CATEGORY, DIALOG_STYLE_LIST, "Sklep 24/7", "Produkty spożywcze\nSprzęt\nInne", "Dalej", "Zamknij");
			new productid = DynamicGui_GetValue(playerid, listitem);
			new itemtype = shopProducts[productid][_s_type], price = shopProducts[productid][_s_price];
			if(itemtype > sizeof ItemTypes-1) return sendErrorMessage(playerid, "Coś poszło nie tak.");
			new value1, value2;
			if(itemtype != ITEM_TYPE_PHONE && itemtype != ITEM_TYPE_BAG) 
			{
				SetPVarInt(playerid, "Shop_Selected", productid);
				ShowPlayerDialogEx(playerid, D_SHOP, DIALOG_STYLE_INPUT, "Sklep 24/7", "Ile przedmiotów tego typu chcesz kupić? (Domyślnie: 1)", "Kup", "Zamknij");
			}
			else
			{	
				if(GetPhoneNumber(playerid) != 0 && itemtype == ITEM_TYPE_PHONE) return sendErrorMessage(playerid, "Nie możesz posiadać dwóch telefonów jednocześnie!");
				if(price > kaska[playerid])
					return sendErrorMessage(playerid, "Nie stać Cię na to!");
				if(itemtype == ITEM_TYPE_PHONE)
					value1 = 10000 + random(89999);

				ZabierzKaseDone(playerid, price);
				Item_Add(shopProducts[productid][_s_name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], itemtype, value1, value2, true, playerid);

				GameTextForPlayer(playerid, sprintf("~r~-$%d", price), 5000, 1);
				SendClientMessage(playerid, COLOR_GRAD4, sprintf("   Kupiłeś przedmiot %s. Został on dodany do ekwipunku (/p).", shopProducts[productid][_s_name]));
				if(IsItemConsumable(itemtype)) SendClientMessage(playerid, COLOR_NEWS, sprintf("Aby użyć przedmiotu wpisz /p %s", shopProducts[productid][_s_name]));
				RunCommand(playerid, "przedmioty", "");
			}
		}
		else if(dialogid == D_SHOP)
		{
			if(!response) return DeletePVar(playerid, "Shop_Selected");
			new productid = GetPVarInt(playerid, "Shop_Selected"), quantity = strval(inputtext);
			if(!strlen(inputtext) || !IsNumeric(inputtext) || quantity<1) quantity = 1;
			if(Item_Count(playerid)+quantity > GetPlayerItemLimit(playerid))
				return SendClientMessage(playerid, COLOR_PANICRED, "Tyle przedmiotów nie zmieści się w twoim ekwipunku!");
			
			new price = shopProducts[productid][_s_price], itemtype = shopProducts[productid][_s_type];
			if(price*quantity > kaska[playerid])
				return sendErrorMessage(playerid, "Nie stać Cię na to!");
			if(PlayerInfo[playerid][pTraderPerk] > 0)
			{
				new skill = (price*quantity) / 100;
				new pr = (skill)*PlayerInfo[playerid][pTraderPerk];
				new payout = (price*quantity) - pr;
				ZabierzKaseDone(playerid, payout);
				GameTextForPlayer(playerid, sprintf("~r~-$%d", payout), 5000, 1);
			}
			else
			{
				ZabierzKaseDone(playerid, price*quantity);
				GameTextForPlayer(playerid, sprintf("~r~-$%d", price*quantity), 5000, 1);
			}
			new exist = HasItemType(playerid, shopProducts[productid][_s_type]);
			if(exist == -1) //jezeli przedmiot o danym typie nie istnieje
				Item_Add(shopProducts[productid][_s_name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], itemtype, shopProducts[productid][_s_value1], shopProducts[productid][_s_value2], true, playerid, quantity); //wtedy stworz nowy przedmiot
			else if(!strcmp(Item[exist][i_Name], shopProducts[productid][_s_name], true)) //jezeli przedmiot o danym typie istnieje i ma ta sama nazwe
			{
				Item[exist][i_Quantity] += quantity; //wtedy dodaj ilosc do istniejacego przedmiotu
				SaveItem(exist);
			}
			else //jezeli przedmiot istnieje, ale nie ma tej samej nazwy co produkt
				Item_Add(shopProducts[productid][_s_name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], itemtype, shopProducts[productid][_s_value1], shopProducts[productid][_s_value2], true, playerid, quantity); //wtedy stworz nowy przedmiot
			SendClientMessage(playerid, COLOR_GRAD4, sprintf("   Kupiłeś przedmiot %s x%d. Został on dodany do ekwipunku (/p).", shopProducts[productid][_s_name], quantity));
			if(IsItemConsumable(itemtype)) SendClientMessage(playerid, COLOR_NEWS, sprintf("Aby użyć przedmiotu wpisz /p %s", shopProducts[productid][_s_name]));
			if(strlen(shopProducts[productid][_s_desc]) > 5)
				SendClientMessage(playerid, -1, shopProducts[productid][_s_desc]);
			DeletePVar(playerid, "Shop_Selected");
			RunCommand(playerid, "przedmioty", "");
		}
		
		else if(dialogid == D_CLOTH_CATEGORY)
		{
			if(!response) return 0;
			DynamicGui_Init(playerid);
			new products[4096];
			switch(listitem)
			{
				case 0: //ubrania
				{
					DynamicGui_SetDialogValue(playerid, 2137);
					if(PlayerInfo[playerid][pSex] == 1) // Męskie
					{
						for(new i = 0; i < sizeof PrzebierzM; i++) {
							strcat(products, sprintf("%d\t~g~$%d\n", PrzebierzM[i][0], PrzebierzM[i][1]));
							//DynamicGui_AddRow(playerid, Przebierz[i][0]);
						}
						ShowPlayerDialogEx(playerid, D_CLOTH, DIALOG_STYLE_PREVIEW_MODEL, "Skiny", products, "Kup", "Zamknij");
					} 
					else // Żeńskie
					{
						for(new i = 0; i < sizeof PrzebierzF; i++) {
							strcat(products, sprintf("%d\t~g~$%d\n", PrzebierzF[i][0], PrzebierzF[i][1]));
							//DynamicGui_AddRow(playerid, Przebierz[i][0]);
						}
						ShowPlayerDialogEx(playerid, D_CLOTH, DIALOG_STYLE_PREVIEW_MODEL, "Skiny", products, "Kup", "Zamknij");
					}
				}
				default:
				{
					for(new i = 0; i < sizeof clothProducts; i++)
					{
						if(clothProducts[i][_c_type] != listitem-1) continue;
						strcat(products, sprintf("%d\t~g~$%d\n", clothProducts[i][_c_model], clothProducts[i][_c_price]));
						DynamicGui_AddRow(playerid, i);
					}
					ShowPlayerDialogEx(playerid, D_CLOTH, DIALOG_STYLE_PREVIEW_MODEL, "Dodatki", products, "Kup", "Zamknij");
				}
			}
		}
		else if(dialogid == D_CLOTH)
		{
			if(!response) return ShowPlayerDialogEx(playerid, D_CLOTH_CATEGORY, DIALOG_STYLE_LIST, "Sklep z ubraniami", "Ubrania\nNakrycia głowy\nOkulary\nZegarki\nMaski", "Dalej", "Zamknij");
			new price, value2 = DynamicGui_GetDataInt(playerid, listitem), value1 = DynamicGui_GetValue(playerid, listitem);
			if(DynamicGui_GetDialogValue(playerid) == 2137) //skiny
			{
				if(PlayerInfo[playerid][pSex] == 1) {value1 = PrzebierzM[listitem][0]; price = PrzebierzM[listitem][1];}
				else {value1 = PrzebierzF[listitem][0]; price = PrzebierzF[listitem][1];}
				if(kaska[playerid] < price) return sendErrorMessage(playerid, "Nie stać Cię na to!");
				ZabierzKaseDone(playerid, price);
				Item_Add(sprintf("Ubranie %d", value1), ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_SKIN, value1, value2, true, playerid);

				GameTextForPlayer(playerid, sprintf("~r~-$%d", price), 5000, 1);
				SendClientMessage(playerid, COLOR_GRAD4, sprintf("   Kupiłeś przedmiot Ubranie %d. Został on dodany do ekwipunku (/p).", value1));
				SendClientMessage(playerid, COLOR_NEWS, sprintf("Aby użyć przedmiotu wpisz /p Ubranie %d", value1));
				RunCommand(playerid, "przedmioty", "");
				return 1;
			}
			if(kaska[playerid] < clothProducts[value1][_c_price])
				return sendErrorMessage(playerid, "Nie stać Cię na to!");
			//obiekty przyczepialne
			ZabierzKaseDone(playerid, clothProducts[value1][_c_price]);
			Item_Add(clothProducts[value1][_c_name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_ATTACH, clothProducts[value1][_c_model], clothProducts[value1][_c_bone], true, playerid);

			GameTextForPlayer(playerid, sprintf("~r~-$%d", clothProducts[value1][_c_price]), 5000, 1);
			SendClientMessage(playerid, COLOR_GRAD4, sprintf("   Kupiłeś przedmiot %s. Został on dodany do ekwipunku (/p).", clothProducts[value1][_c_name]));
			SendClientMessage(playerid, COLOR_NEWS, sprintf("Aby użyć przedmiotu wpisz /p %s", clothProducts[value1][_c_name]));
			RunCommand(playerid, "przedmioty", "");
		}
		else if(dialogid == 90)
		{
		    new string[256];
		    if(response)
			{
			    if(zdazylwpisac[playerid] == 1)
			    {
				    if(strcmp(kodbitwy, inputtext, true ) == 0 && strlen(inputtext) == 8)
				    {
				        new giveplayer[MAX_PLAYER_NAME + 1];
				        new sendername[MAX_PLAYER_NAME + 1];
				        GetPlayerName(bijep[playerid], giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						//
				    	podczasbicia[bijep[playerid]] = 1;
				    	podczasbicia[playerid] = 0;
				    	//
				    	new randbitwa = random(30);
						//kodbitwy[playa] = (PobijText[randbitwa]);
						strmid(kodbitwy, PobijText[randbitwa], 0, strlen(PobijText[randbitwa]), 256);
						format(string, sizeof(string), "Próbujesz pobić %s, za 10 sekund rostrzygnie się bitwa!", giveplayer);
		    			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		    			format(string, sizeof(string), "%s próbuje cię pobić! Wpisz ten kod aby się obronić:\n%s", sendername, kodbitwy);
						ShowPlayerDialogEx(bijep[playerid], 90, DIALOG_STYLE_INPUT, "BITWA!!", string, "Wybierz", "Wyjdź");
		       			//
				    	SendClientMessage(playerid, COLOR_WHITE, "CIOS ODBITY!");
				    	ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0);
				    	ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0);
				    	zdazylwpisac[playerid] = 1;
				    	zdazylwpisac[bijep[playerid]] = 1;
				    	new timerbicia = SetTimerEx("naczasbicie",9000,0,"d",bijep[playerid]);
						SetPVarInt(bijep[playerid], "timerBicia", timerbicia);
				    }
				    else
				    {
				        new giveplayer[MAX_PLAYER_NAME + 1];
				        new sendername[MAX_PLAYER_NAME + 1];
				        GetPlayerName(bijep[playerid], giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
				        format(string, sizeof(string), "* %s wyprowadził cios i pobił %s.", giveplayer, sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		    			format(string, sizeof(string), "%s znokautował cię bez większego problemu.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "Pobiłeś %s bez większego trudu.", sendername);
						SendClientMessage(bijep[playerid], COLOR_LIGHTBLUE, string);
						ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0); // Dieing of Crack
						PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);
						PlayerPlaySound(bijep[playerid], 1130, 0.0, 0.0, 0.0);
						TogglePlayerControllable(playerid, 0);
						TogglePlayerControllable(bijep[playerid], 1);
						PlayerCuffed[playerid] = 3;
						PlayerCuffedTime[playerid] = 45;
						pobity[playerid] = 1;
						PlayerInfo[playerid][pMuted] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odczekaj 45 sekund");
						SetTimerEx("pobito",45000,0,"d",bijep[playerid]);
						pobilem[bijep[playerid]] = 1;
						PlayerFixRadio(playerid);
						PlayerFixRadio(bijep[playerid]);
						SetPlayerHealth(playerid, 30.0);
						ClearAnimations(bijep[playerid]);
						ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
						ClearAnimations(playerid);
						ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
						//new
				        podczasbicia[playerid] = 0;
				        bijep[bijep[playerid]] = 0;
				        bijep[playerid] = 0;
						CreateNewCombatLog(playerid);
				    }
				}
				else
				{
				    new giveplayer[MAX_PLAYER_NAME + 1];
	       			new sendername[MAX_PLAYER_NAME + 1];
			        GetPlayerName(bijep[playerid], giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
			        format(string, sizeof(string), "* %s wyprowadził cios i pobił %s.", giveplayer, sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		   			format(string, sizeof(string), "%s znokautował cię bez większego problemu.", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "Pobiłeś %s bez większego trudu.", sendername);
					SendClientMessage(bijep[playerid], COLOR_LIGHTBLUE, string);
					ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0); // Dieing of Crack
					PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);
					PlayerPlaySound(bijep[playerid], 1130, 0.0, 0.0, 0.0);
					TogglePlayerControllable(playerid, 0);
					TogglePlayerControllable(bijep[playerid], 1);
					PlayerCuffed[playerid] = 3;
					PlayerCuffedTime[playerid] = 45;
					pobity[playerid] = 1;
					PlayerInfo[playerid][pMuted] = 1;
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odczekaj 45 sekund");
					SetTimerEx("pobito",45000,0,"d",bijep[playerid]);
					pobilem[bijep[playerid]] = 1;
					PlayerFixRadio(playerid);
					PlayerFixRadio(bijep[playerid]);
					SendClientMessage(playerid, COLOR_WHITE, "Wpisałeś tekst za wolno i przegrałeś!");
					SetPlayerHealth(playerid, 30.0);
					ClearAnimations(bijep[playerid]);
					ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
					ClearAnimations(playerid);
					ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
					//new
			        podczasbicia[playerid] = 0;
			        bijep[bijep[playerid]] = 0;
			        bijep[playerid] = 0;
					CreateNewCombatLog(playerid);
				}
			}
			if(!response)
			{
			    new giveplayer[MAX_PLAYER_NAME + 1];
	   			new sendername[MAX_PLAYER_NAME + 1];
		        GetPlayerName(bijep[playerid], giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
		        format(string, sizeof(string), "* %s wyprowadził cios i pobił %s.", giveplayer, sendername);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	   			format(string, sizeof(string), "%s znokautował cię bez większego problemu.", giveplayer);
	   			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "Pobiłeś %s bez większego trudu.", sendername);
				SendClientMessage(bijep[playerid], COLOR_LIGHTBLUE, string);
				ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0); // Dieing of Crack
				PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);
				PlayerPlaySound(bijep[playerid], 1130, 0.0, 0.0, 0.0);
				TogglePlayerControllable(playerid, 0);
				TogglePlayerControllable(bijep[playerid], 1);
				PlayerCuffed[playerid] = 3;
				PlayerCuffedTime[playerid] = 45;
				pobity[playerid] = 1;
				PlayerInfo[playerid][pMuted] = 1;
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odczekaj 45 sekund");
				SetTimerEx("pobito",45000,0,"d",bijep[playerid]);
				pobilem[bijep[playerid]] = 1;
				PlayerFixRadio(playerid);
				PlayerFixRadio(bijep[playerid]);
				SetPlayerHealth(playerid, 30.0);
				ClearAnimations(bijep[playerid]);
				ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
				ClearAnimations(playerid);
				ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
				//new
		        podczasbicia[playerid] = 0;
		        bijep[bijep[playerid]] = 0;
		        bijep[playerid] = 0;
				CreateNewCombatLog(playerid);
			}
		}
		if(dialogid == DIALOG_POKER_ZETONY)
		{
			if(!response)
			{
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				ShowPlayerDialogEx(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Anulowałeś zakup żetonów bez których nie możesz rozpocząć gry.", "Zamknij", "");
				new id_pokera = DaneGracza[playerid][gPoker];
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] == playerid)
					{
						ObiektInfo[id_pokera][objPoker][i] = -1;
						ObiektInfo[id_pokera][gAktualniGracze][i] = -1;
						DaneGracza[playerid][gPoker] = 0;
						DaneGracza[playerid][gPokerStanowisko] = -1;
						break;
					}
				}
				TogglePlayerControllable(playerid, 1);
				SetCameraBehindPlayer(playerid);
				WpisalKase[playerid] = 0;
				GraWPokera[playerid] = 0;
				return 0;
			}
			else
			{
				if(!IsNumeric(inputtext) || strlen(inputtext) == 0)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "Własnie dołączyłeś do gry w pokera, w poniższe pole wpisz kwotę jaka ma być przeznaczona na zakup żetonów.\n100$ to 1000$ w żetonach, maksymalna ilość 2000$.\nZnalezione Błędy: Wprowadź poprawną liczbę.", "Zatwierdz", "Zamknij");
					return 0;
				}
				new kasa_na_zetony = strval(inputtext);
				if(kasa_na_zetony < 100)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "Własnie dołączyłeś do gry w pokera, w poniższe pole wpisz kwotę jaka ma być przeznaczona na zakup żetonów.\n100$ to 1000$ w żetonach, maksymalna ilość 2000$.\nZnalezione Błędy: Zbyt mała kwota wpłaty.", "Zatwierdz", "Zamknij");
					return 0;
				}
				else if(kasa_na_zetony > 2000)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "Własnie dołączyłeś do gry w pokera, w poniższe pole wpisz kwotę jaka ma być przeznaczona na zakup żetonów.\n100$ to 1000$ w żetonach, maksymalna ilość 2000$.\nZnalezione Błędy: Zbyt duża kwota wpłaty.", "Zatwierdz", "Zamknij");
					return 0;
				}
				else if(kaska[playerid] < kasa_na_zetony)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "Własnie dołączyłeś do gry w pokera, w poniższe pole wpisz kwotę jaka ma być przeznaczona na zakup żetonów.\n100$ to 1000$ w żetonach, maksymalna ilość 2000$.\nZnalezione Błędy: Nie posiadasz tyle pieniędzy.", "Zatwierdz", "Zamknij");
					return 0;
				}
				else
				{
					GraWPokera[playerid] = 1;
					WpisalKase[playerid] = 0;
					new id_pokera = DaneGracza[playerid][gPoker];
					DaneGracza[playerid][gPokerZetony] = kasa_na_zetony*10;
					DajKase(playerid, -kasa_na_zetony);
					PrzeliczZetony(playerid, id_pokera, 0, 0);
					for(new i = 0; i < 6; i++)
					{
						Streamer_Update(ObiektInfo[id_pokera][objPoker][i]);
					}
					RozpocznijPokera(playerid, id_pokera);
				}
			}
		}
		if(dialogid == DIALOG_POKER_PRZEBIJ)
		{
			if(DaneGracza[playerid][gPoker] == 0 || GraWPokera[playerid] == 0)
			{
				return 0;
			}
			if(ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] != playerid)
			{
				SendClientMessage(playerid, -1, "Nie jest twoja kolej!");
				return 0;
			}
			if(!response)
			{
				if(WybralMozliwoscPoker[playerid] != 0)
				{
					SelectTextDraw(playerid, 0xFFFFFFFF);
				}
				return 0;
			}
			else
			{
				if(!IsNumeric(inputtext) || strlen(inputtext) == 0)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotę którą chcesz przebić zakład.\nZnalezione Błędy: Wprowadź poprawną liczbę.", "Zatwierdz", "Zamknij");
					return 0;
				}
				new kwota = strval(inputtext);
				if(kwota < 10)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotę którą chcesz przebić zakład.\nZnalezione Błędy: Zbyt mała kwota przebicia.", "Zatwierdz", "Zamknij");
					return 0;
				}
				else if(kwota > DaneGracza[playerid][gPokerZetony])
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotę którą chcesz przebić zakład.\nZnalezione Błędy: Kwota przebicia jest wieksza niz posiadane żetony..", "Zatwierdz", "Zamknij");
					return 0;
				}
				new roznica = ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13] - DaneGracza[playerid][gPokerPostawione];
				if(roznica > 0 && kwota < roznica)
				{
					ShowPlayerDialogEx(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotę którą chcesz przebić zakład.\nZnalezione Błędy: Kwota przebicia jest mniejsza niż zakład do wyrównania..", "Zatwierdz", "Zamknij");
					return 0;
				}
				else
				{
					WybralMozliwoscPoker[playerid] = 0;
					PlayerTextDrawHide(playerid,Poker2[playerid]);
					PlayerTextDrawHide(playerid,Poker3[playerid]);
					PlayerTextDrawHide(playerid,Poker4[playerid]);
					PlayerTextDrawHide(playerid,Poker5[playerid]);
					PlayerTextDrawHide(playerid,Poker6[playerid]);
					DaneGracza[playerid][gPokerPostawione] += kwota;
					if(DaneGracza[playerid][gPokerPostawione] > ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13])
					{
						ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13] = DaneGracza[playerid][gPokerPostawione];
					}
					DaneGracza[playerid][gPokerZetony] -= kwota;
					ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][1] += kwota;
					new ilosc_nie_all = SprawdzNieAllinow(DaneGracza[playerid][gPoker]);
					if(ilosc_nie_all < 2)
					{
						ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = playerid;
					}
					else
					{
						new poprzedni = SprawdzPoprzedniego(DaneGracza[playerid][gPokerStanowisko]);
						new poprzedni2 = DaneGracza[playerid][gPokerStanowisko];
						for(new i = 0; i < 6; i++)
						{
							if(ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1)
							{
								switch(poprzedni2)
								{
									case 0:{
										poprzedni2 = 2;
									}
									case 1:{
										poprzedni2 = 3;
									}
									case 2:{
										poprzedni2 = 5;
									}
									case 3:{
										poprzedni2 = 4;
									}
									case 4:{
										poprzedni2 = 0;
									}
									case 5:{
										poprzedni2 = 1;
									}
								}
								poprzedni = SprawdzPoprzedniego(poprzedni2);
							}
						}
						ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni];
					}
					new kasa[128];
					if(DaneGracza[playerid][gPokerZetony] == 0)
					{
						DaneGracza[playerid][gInformacjePoker][0] = 1;
						format(kasa, sizeof(kasa), "All-in ~r~($%d)", kwota);
					}
					else if(roznica > 0)
					{
						format(kasa, sizeof(kasa), "Przebija ~r~$%d", kwota);
					}
					else
					{
						format(kasa, sizeof(kasa), "Stawia ~r~$%d", kwota);
					}
					NadajTextTextdraw(playerid, DaneGracza[playerid][gPoker], kasa);
					for(new i = 0; i < 30; i++)
					{
						if(DaneGracza[playerid][gPokerObj][i] != 0)
						{
							DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
							DaneGracza[playerid][gPokerObj][i] = 0;
						}
					}
					for(new i = 0; i < 30; i++)
					{
						if(DaneGracza[playerid][gNumeryObiektowPostawionych][i] != 0)
						{
							DestroyDynamicObject(DaneGracza[playerid][gNumeryObiektowPostawionych][i]);
							DaneGracza[playerid][gNumeryObiektowPostawionych][i] = 0;
						}
					}
					PrzeliczZetony(playerid, DaneGracza[playerid][gPoker], 0, 0);
					PrzeliczZetony(playerid, DaneGracza[playerid][gPoker], DaneGracza[playerid][gPokerPostawione], 5);
				}
				OdswiezTexdrawyPoker(DaneGracza[playerid][gPoker], 0);
				new ilosc = SprawdzIloscGraczy(DaneGracza[playerid][gPoker]);
				if(ilosc >= 2)
				{
					SprawdzKolejGracza(playerid);
				}
				else
				{
					KoniecRundy(DaneGracza[playerid][gPoker]);
				}
			}
		}
		if(dialogid == DIALOG_POKER_OPUSC)
		{
			if(DaneGracza[playerid][gPoker] == 0 || GraWPokera[playerid] == 0)
			{
				return 0;
			}
			if(!response)
			{
				if(WpisalKase[playerid] == 0)
				{
					SelectTextDraw(playerid, 0xFFFFFFFF);
				}
				return 0;
			}
			else
			{
				WybralMozliwoscPoker[playerid] = 0;
				GraWPokera[playerid] = 0;
				WpisalKase[playerid] = 0;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				ShowPlayerDialogEx(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Własnie opuściłeś stolik, twoje żetony zostały zamienione na prawdziwe pieniądze.", "Zamknij", "");
				// Zwracamy tylko żetony które NIE są w puli (nie postawione)
				// Żetony postawione (gPokerPostawione) pozostają w puli
				if(DaneGracza[playerid][gPokerZetony] != -1 && DaneGracza[playerid][gPokerZetony] > 0)
				{
					// Sprawdź czy gracz ma postawione żetony w puli
					if(DaneGracza[playerid][gPokerPostawione] > 0)
					{
						// Jeśli gracz opuszcza w trakcie rundy, żetony postawione idą do puli
						new id_pokera = DaneGracza[playerid][gPoker];
						if(id_pokera > 0 && ObiektInfo[id_pokera][gRundaPoker] > 0)
						{
							// Runda trwa - żetony postawione zostają w puli
							ObiektInfo[id_pokera][gPokerInfo][1] += DaneGracza[playerid][gPokerPostawione];
						}
					}
					
					// Zwróć tylko niepostawione żetony
					new zetony_do_zwrotu = DaneGracza[playerid][gPokerZetony];
					new kasa = zetony_do_zwrotu / 10;
					if(kasa > 0)
					{
						DajKase(playerid, kasa);
					}
					DaneGracza[playerid][gPokerZetony] = -1;
				}
				new id_pokera = DaneGracza[playerid][gPoker];
				for(new i = 0; i < 30; i++)
				{
					if(DaneGracza[playerid][gPokerObj][i] != 0)
					{
						DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
						DaneGracza[playerid][gPokerObj][i] = 0;
						DaneGracza[playerid][gNumeryObiektowPostawionych][i] = 0;
					}
				}
				CancelSelectTextDraw(playerid);
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] != -1)
					{
						UsunBaryGracz(ObiektInfo[id_pokera][objPoker][i]);
					}
				}
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] == playerid)
					{
						ObiektInfo[id_pokera][objPoker][i] = -1;
						ObiektInfo[id_pokera][gAktualniGracze][i] = -1;
						break;
					}
				}
				new ilosc_oczekujacych_graczy = 0;
				if(DaneGracza[playerid][gRundaPokerCzas] != 0)
				{
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[id_pokera][objPoker][i] != -1 && DaneGracza[ObiektInfo[id_pokera][objPoker][i]][gRundaPokerCzas] != 0)
						{
							ilosc_oczekujacych_graczy++;
						}
					}
					DaneGracza[playerid][gRundaPokerCzas] = 0;
					if(ilosc_oczekujacych_graczy < 2)
					{
						for(new i = 0; i < 6; i++)
						{
							if(ObiektInfo[id_pokera][objPoker][i] != -1)
							{
								DaneGracza[ObiektInfo[id_pokera][objPoker][i]][gRundaPokerCzas] = 0;
								RozpocznijPokera(ObiektInfo[id_pokera][objPoker][i], DaneGracza[ObiektInfo[id_pokera][objPoker][i]][gPoker]);
							}
						}
					}
				}	
				OdswiezTexdrawyPoker(id_pokera, 0);
				
				if(ObiektInfo[id_pokera][gPokerInfo][14] == playerid)
				{
					new poprzedni = SprawdzPoprzedniego(DaneGracza[playerid][gPokerStanowisko]);
					new poprzedni2 = DaneGracza[playerid][gPokerStanowisko];
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[id_pokera][gAktualniGracze][poprzedni] == -1 || 
						   (ObiektInfo[id_pokera][gAktualniGracze][poprzedni] != -1 && 
						    DaneGracza[ObiektInfo[id_pokera][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1))
						{
							switch(poprzedni2)
							{
								case 0:{ poprzedni2 = 4; }
								case 1:{ poprzedni2 = 5; }
								case 2:{ poprzedni2 = 0; }
								case 3:{ poprzedni2 = 1; }
								case 4:{ poprzedni2 = 3; }
								case 5:{ poprzedni2 = 2; }
							}
							poprzedni = SprawdzPoprzedniego(poprzedni2);
						}
						else
						{
							break;
						}
					}
					ObiektInfo[id_pokera][gPokerInfo][14] = ObiektInfo[id_pokera][gAktualniGracze][poprzedni];
				}
				
				new ilosc = SprawdzIloscGraczy(id_pokera);
				if(ilosc >= 2)
				{
					new aktualny_gracz = ObiektInfo[id_pokera][gPokerInfo][14];
					if(aktualny_gracz != -1 && aktualny_gracz != playerid && IsPlayerConnected(aktualny_gracz))
					{
						SprawdzKolejGracza(aktualny_gracz);
					}
					else
					{
						for(new i = 0; i < 6; i++)
						{
							if(ObiektInfo[id_pokera][gAktualniGracze][i] != -1 && 
							   ObiektInfo[id_pokera][gAktualniGracze][i] != playerid)
							{
								SprawdzKolejGracza(ObiektInfo[id_pokera][gAktualniGracze][i]);
								break;
							}
						}
					}
				}
				else
				{
					KoniecRundy(id_pokera);
				}
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] == playerid)
					{
						ObiektInfo[id_pokera][objPoker][i] = -1;
						DaneGracza[playerid][gPoker] = 0;
						DaneGracza[playerid][gPokerStanowisko] = -1;
						DaneGracza[playerid][gPokerPostawione] = 0;
						DaneGracza[playerid][gPokerKarty][0] = 0;
						DaneGracza[playerid][gPokerKarty][1] = 0;
						DaneGracza[playerid][gInformacjePoker][0] = 0;
						DaneGracza[playerid][gInformacjePoker][1] = 0;
						DaneGracza[playerid][gInformacjePoker][2] = 0;
						DaneGracza[playerid][gInformacjePoker][3] = 0;
						DaneGracza[playerid][gInformacjePoker][4] = 0;
						DaneGracza[playerid][gInformacjePoker][5] = 0;
						DaneGracza[playerid][gInformacjePoker][6] = 0;
						break;
					}
				}
				PlayerTextDrawHide(playerid,KartyGracza[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza11[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza2[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza22[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza3[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza33[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza4[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza44[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza5[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza55[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza6[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza66[playerid]);
				PlayerTextDrawHide(playerid,Poker1[playerid]);
				PlayerTextDrawHide(playerid,Poker2[playerid]);
				PlayerTextDrawHide(playerid,Poker3[playerid]);
				PlayerTextDrawHide(playerid,Poker4[playerid]);
				PlayerTextDrawHide(playerid,Poker5[playerid]);
				PlayerTextDrawHide(playerid,Poker6[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza3[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza4[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza5[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza6[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza7[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza8[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza9[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza10[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza11[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza12[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza13[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza14[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty1[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty2[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty3[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty4[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty5[playerid]);
				TogglePlayerControllable(playerid, 1);
				SetCameraBehindPlayer(playerid);
				return 0;
			}
		}
		else if(dialogid == 97)
		{
		    new string[256];
		    new giveplayer[MAX_PLAYER_NAME + 1];
			new sendername[MAX_PLAYER_NAME + 1];
			GetPlayerName(Kajdanki_PDkuje[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new cops;
			//
		    if(response)
		    {
		        format(string, sizeof(string), "* %s nie stawia oporu i daje się skuć %s.", sendername, giveplayer);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		        format(string, sizeof(string), "Skułeś %s.", sendername);
				SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
	            TogglePlayerControllable(playerid, 0);
	            Kajdanki_JestemSkuty[playerid] = 2;
                SetTimerEx("Odmroz",10*60000,0,"d",playerid);
	            SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odkujesz sie za 10 minut");
				CreateNewCombatLog(playerid);
		    }
		    if(!response)
		    {
		        foreach(new i : Player)
				{
				    if(IsPlayerConnected(i))
				    {
				        if(IsAPolicja(i))
						{
						    if(GetDistanceBetweenPlayers(playerid,i) < 5)
	     					{
	     					    cops ++;
	     					}
						}
					}
				}
				if(cops >= 3 || TazerAktywny[playerid] == 1 && cops == 2)
				{
	                format(string, sizeof(string), "* %s wyrywa się i ucieka lecz policjanci powstrzymują go i skuwają go siłą.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			        format(string, sizeof(string), "Skułeś %s.", sendername);
					SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
		            TogglePlayerControllable(playerid, 0);
		            Kajdanki_JestemSkuty[playerid] = 2;
		            SetTimerEx("Odmroz",10*60000,0,"d",playerid);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odkujesz sie za 10 minut");
					
					CuffedAction(Kajdanki_PDkuje[playerid], playerid);
					TogglePlayerControllable(playerid, 1);
					CreateNewCombatLog(playerid);
				}
				else if(cops == 2 || TazerAktywny[playerid] == 1 && cops < 2)
				{
				    new rand = random(100);
				    if(rand <= 50)
				    {
				        format(string, sizeof(string), "* %s wyrywa się z całej siły i ucieka.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						Kajdanki_PDkuje[playerid] = 0;
						PoziomPoszukiwania[playerid] += 1;
						SetPlayerCriminal(playerid, 255, "Stawianie oporu podczas aresztowania");
				    }
				    else
				    {
				        format(string, sizeof(string), "* %s wyrywa się i ucieka lecz policjanci powstrzymują go i skuwają go siłą.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				        format(string, sizeof(string), "Skułeś %s.", sendername);
						SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
			            TogglePlayerControllable(playerid, 0);
			            Kajdanki_JestemSkuty[playerid] = 2;
			            SetTimerEx("Odmroz",10*60000,0,"d",playerid);
			            SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odkujesz sie za 10 minut");
					
						CuffedAction(Kajdanki_PDkuje[playerid], playerid);
						TogglePlayerControllable(playerid, 1);
						CreateNewCombatLog(playerid);
				    }
				}
				else
				{
				    format(string, sizeof(string), "* %s wyrywa się z całej siły i ucieka.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Kajdanki_PDkuje[playerid] = 0;
					PoziomPoszukiwania[playerid] += 1;
					SetPlayerCriminal(playerid, 255, "Stawianie oporu podczas aresztowania");
				}
		    }
		}
		else if(dialogid == 98)
		{
		    new string[256];
		    new giveplayer[MAX_PLAYER_NAME + 1];
			new sendername[MAX_PLAYER_NAME + 1];
			GetPlayerName(Kajdanki_PDkuje[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new cops;
			//
		    if(response)
		    {
		        format(string, sizeof(string), "* %s nie stawia oporu i daje się skuć %s.", sendername, giveplayer);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		        format(string, sizeof(string), "Skułeś %s.", sendername);
				SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
				
				CuffedAction(Kajdanki_PDkuje[playerid], playerid);
		    }
		    else
		    {
		        foreach(new i : Player)
				{
				    if(IsPlayerConnected(i))
				    {
				        if(IsAPolicja(i) || IsABOR(i))
						{
						    if(GetDistanceBetweenPlayers(playerid,i) < 5)
	     					{
	     					    cops ++;
	     					}
						}
					}
				}
				if(cops >= 3)
				{
	                format(string, sizeof(string), "* %s wyrywa się i ucieka lecz policjanci powstrzymują go i skuwają go siłą.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			        format(string, sizeof(string), "Skułeś %s.", sendername);
					SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
					
					CuffedAction(Kajdanki_PDkuje[playerid], playerid);
				}
				else if(cops == 2)
				{
				    new rand = random(100);
				    if(rand <= 50)
				    {
				        format(string, sizeof(string), "* %s wyrywa się z całej siły i ucieka.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						Kajdanki_PDkuje[playerid] = 0;
						PoziomPoszukiwania[playerid] += 1;
						SetPlayerCriminal(playerid, 255, "Stawianie oporu podczas aresztowania");
				    }
				    else
				    {
				        format(string, sizeof(string), "* %s wyrywa się i ucieka lecz policjanci powstrzymują go i skuwają go siłą.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				        format(string, sizeof(string), "Skułeś %s.", sendername);
						SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
						
						CuffedAction(Kajdanki_PDkuje[playerid], playerid);
				    }
				}
				else
				{
				    format(string, sizeof(string), "* %s wyrywa się z całej siły i ucieka.", sendername);
				    TogglePlayerControllable(playerid, 1);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Kajdanki_PDkuje[playerid] = 0;
					PoziomPoszukiwania[playerid] += 1;
					SetPlayerCriminal(playerid, 255, "Stawianie oporu podczas aresztowania");
				}
		    }
		}
		else if(dialogid == 7080)
		{
		    new string[256];
		    new giveplayer[MAX_PLAYER_NAME + 1];
			new sendername[MAX_PLAYER_NAME + 1];
			GetPlayerName(Kajdanki_PDkuje[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			//
		    if(response)
		    {
				//todo
		        format(string, sizeof(string), "* %s nie stawia oporu i daje się skuć łowcy %s.", sendername, giveplayer);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		        format(string, sizeof(string), "Skułeś %s. Masz 2 minuty, by dostarczyć go do celi!", sendername);
				SendClientMessage(Kajdanki_PDkuje[playerid], COLOR_LIGHTBLUE, string);
				Kajdanki_JestemSkuty[playerid] = 1;
	            TogglePlayerControllable(playerid, 0);
	            Kajdanki_Uzyte[Kajdanki_PDkuje[playerid]] = 1;
	            Kajdanki_SkutyGracz[Kajdanki_PDkuje[playerid]] = playerid;
				ClearAnimations(playerid);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
                SetPlayerAttachedObject(playerid, 5, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977,-81.700035, 0.891999, 1.000000, 1.168000);
		    	CreateNewCombatLog(playerid);
			}
		    if(!response)
		    {
				format(string, sizeof(string), "* %s wyrywa się i rzuca się na łowcę!", sendername);
				TogglePlayerControllable(playerid, 1);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				Kajdanki_PDkuje[playerid] = 0;
		    }
		}
		else if(dialogid == 160)
		{
		    if(response)
		    {
		        ShowPlayerDialogEx(playerid, 161, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się komisariat?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	         	taxitest[playerid] = 0;
			}
		}
	 	else if(dialogid == 161)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
					case 0:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 1:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 2:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 3:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 5:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 6:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 7:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 8:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 9:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 10:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 11:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 12:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				    case 13:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
					case 14:
				    {
				        ShowPlayerDialogEx(playerid, 162, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się studio SAN?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
				    }
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 162)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 1:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 4:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 12:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				        ShowPlayerDialogEx(playerid, 163, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Fabryka Broni?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 163)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 164, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Salon Samochodowy?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 164)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
	                case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 165, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Kościół?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 165)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 166, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznik Tower(biurowiec)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 166)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 167, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Mrucznikowy Gun Shop?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 167)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 168, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Agencja Ochrony (zkł bukmaherski)?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 168)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 169, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Szpital?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 169)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
				    case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 170, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Green Bar?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 170)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				    case 1:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
	                    taxitest[playerid] ++;
					}
					case 2:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 3:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 4:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 5:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 6:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 7:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 8:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 9:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 10:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 11:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 12:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 13:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
					case 14:
				    {
				    	ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_LIST, "W jakiej dzielnicy znajduje się Bank?", "Rodeo\nGanton\nGlen Park\nDowntown\nPershing Square\nEl Corona\nIdlewood\nPlaya Del Seville\nOcean Docks\nVinewood\nMarket\nJefferson\nLos Flores\nEast Beach\nEast Los Santos", "Wybierz", "Wyjdź");
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	 	else if(dialogid == 171)
	 	{
	 	    if(response)
	 	    {
	 	        switch(listitem)
				{
				    case 0:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 1:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 2:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 171, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
				    case 3:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 4:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 5:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 6:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 7:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 8:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 9:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 10:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 11:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 12:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 13:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
					case 14:
				    {
				        if(taxitest[playerid] >= 8)
				        {
							ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Gratulacje, udało ci się wyrobić licencje taksówkarską! Zostajesz taksówkarzem. ź’wietnie znasz miasto.", "OK", "Wyjdź");
		                    taxitest[playerid] = 0;
		                    PlayerInfo[playerid][pJob] = 14;
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Podpisałeś kontrakt z firmą taksówkarsą na 2,5h, idź po swoją taryfę! (Aby się zwolnić wpisz /quitjob)");
					    }
					    else
					    {
					        ShowPlayerDialogEx(playerid, 172, DIALOG_STYLE_MSGBOX, "Wyniki", "Nie znasz miasta tak dobrze aby zostać taksówkarzem. Pojeździj autobusami aby się z nim zapoznać.", "OK", "Wyjdź");
					    }
					}
				}
	 	    }
	 	    if(!response)
	 	    {
	 	        taxitest[playerid] = 0;
	 	    }
	 	}
	    else if(dialogid == 20)
	    {
	        if(response)
	        {
	            SendClientMessage(playerid, 0xFFFFFFFF, "Bronie przywrócone");
	            PrzywrocBron(playerid);
				SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 10);
				SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 10);
	        }
		}
	    else if(dialogid == 876)
	    {
			if(response)
			{
			    new string[64], sendername[MAX_PLAYER_NAME + 1];
            	GetPlayerName(playerid, sendername, sizeof(sendername));
			    switch(listitem)
			    {
			        case 0:
			        {
			            if(PlayerInfo[playerid][pGun0] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
						PlayerInfo[playerid][pGun0] = 0;
						PlayerInfo[playerid][pAmmo0] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój kastet został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
            			format(string, sizeof(string),"%s niszczy kastet i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            			
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 1:
			        {
			            if(PlayerInfo[playerid][pGun1] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun1] = 0;
						PlayerInfo[playerid][pAmmo1] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twoja broń biała została usnięta");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy broń białą i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 2:
			        {
			            if(PlayerInfo[playerid][pGun2] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun2] = 0;
						PlayerInfo[playerid][pAmmo2] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój pistolet został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy pistolet i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 3:
			        {
			            if(PlayerInfo[playerid][pGun3] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
	                    PlayerInfo[playerid][pGun3] = 0;
						PlayerInfo[playerid][pAmmo3] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twoja strzelba została usunięta");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy strzelbę i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 4:
			        {
			            if(PlayerInfo[playerid][pGun4] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
	                    PlayerInfo[playerid][pGun4] = 0;
						PlayerInfo[playerid][pAmmo4] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój pistolet maszynowy został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy pistolet maszynowy i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 5:
			        {
			            if(PlayerInfo[playerid][pGun5] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun5] = 0;
						PlayerInfo[playerid][pAmmo5] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój karabin maszynowy został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy karabin maszynowy i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 6:
			        {
			            if(PlayerInfo[playerid][pGun6] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun6] = 0;
						PlayerInfo[playerid][pAmmo6] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twoja snajperka została usunięta");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy snajperkę i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 7:
			        {
			            if(PlayerInfo[playerid][pGun7] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun7] = 0;
						PlayerInfo[playerid][pAmmo7] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój ogniomiotacz został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy ogniomiotacz i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 8:
			        {
			            if(PlayerInfo[playerid][pGun8] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun8] = 0;
						PlayerInfo[playerid][pAmmo8] = 0;
						PlayerInfo[playerid][pGun12] = 0;
						PlayerInfo[playerid][pAmmo12] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twoje C4 zostało usunięte");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy C4 i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 9:
			        {
			            if(PlayerInfo[playerid][pGun9] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun9] = 0;
						PlayerInfo[playerid][pAmmo9] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój sprej/aparat/gaśnica został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy spray/aparat/gaśnicę i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 10:
			        {
			            if(PlayerInfo[playerid][pGun10] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun10] = 0;
						PlayerInfo[playerid][pAmmo10] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twoje kwiaty/laska/dildo zostało usunięte");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy kwiaty/laskę/dildo i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 11:
			        {
			            if(PlayerInfo[playerid][pGun11] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun11] = 0;
						PlayerInfo[playerid][pAmmo11] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój spadochron został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy spadochron i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			        case 12:
			        {
			            if(PlayerInfo[playerid][pGun12] == 0) return sendErrorMessage(playerid, "Nie masz broni pod tym slotem!");
			            PlayerInfo[playerid][pGun12] = 0;
						PlayerInfo[playerid][pAmmo12] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Twój detonator został usunięty");
						ResetPlayerWeapons(playerid);
						SetTimerEx("UsuwanieBroniReset", 1000, 0, "d", playerid);
						
						format(string, sizeof(string),"%s niszczy detonator i rzuca na ziemię.", sendername);
            			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						ShowPlayerDialogEx(playerid, 876, DIALOG_STYLE_LIST, "Usuwanie broni", "Kastet\nBroń biała\nPistolet\nStrzelba\nPistolet maszynowy\nKarabin\nSnajperka\nOgniomiotacz\nC4\nAparat/Sprej\nKwiaty/Laska/Dildo\nSpadochron\nDetonator", "Usuń", "Wyjdź");
			        }
			    }
			}
	    }
		else if(dialogid == 81)
		{
		    if(response)
			{
		    	switch(listitem)
				{
	       			case 0:
			 		{
	        			if(kaska[playerid] > PRICE_DILDO_PURP)
						{
					        //GivePlayerWeapon(playerid, 10, 1);
					        //PlayerInfo[playerid][pGun10] = 10;
							//PlayerInfo[playerid][pAmmo10] = 1;
							Item_Add("Purpurowy Big Jim", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, 10, 1, true, playerid, 1, 1);
							ZabierzKaseDone(playerid, PRICE_DILDO_PURP);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kupiłeś wibrator 'Purpurowy Big Jim' za "#PRICE_DILDO_PURP"$");
						}
		    			else
					    {
	    					SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
					case 1:
					{
	        			if(kaska[playerid] > PRICE_DILDO_ANALNY)
	  	 				{
					       	//GivePlayerWeapon(playerid, 11, 1);
					        //PlayerInfo[playerid][pGun10] = 11;
							//PlayerInfo[playerid][pAmmo10] = 1;
							Item_Add("Analny Penetrator", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, 11, 1, true, playerid, 1, 1);
							ZabierzKaseDone(playerid, PRICE_DILDO_ANALNY);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kupiłeś wibrator 'Analny Penetrator' za "#PRICE_DILDO_ANALNY"$");
						}
		    			else
					    {
	        				SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
					case 2:
					{
	        			if(kaska[playerid] > PRICE_DILDO_BIALY)
						{
					        //GivePlayerWeapon(playerid, 12, 1);
					        //PlayerInfo[playerid][pGun10] = 12;
							//PlayerInfo[playerid][pAmmo10] = 1;
							Item_Add("Biały Intruz", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, 12, 1, true, playerid, 1, 1);
							ZabierzKaseDone(playerid, PRICE_DILDO_BIALY);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kupiłeś wibrator 'Biały Intruz' za "#PRICE_DILDO_BIALY"$");
						}
		    			else
					    {
	        				SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
					case 3:
					{
	        			if(kaska[playerid] > PRICE_DILDO_SREBRNY)
		  	 			{
					        //GivePlayerWeapon(playerid, 13, 1);
					        //PlayerInfo[playerid][pGun10] = 13;
							//PlayerInfo[playerid][pAmmo10] = 1;
							Item_Add("Srebrny Masturbator", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, 13, 1, true, playerid, 1, 1);
							ZabierzKaseDone(playerid, PRICE_DILDO_SREBRNY);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kupiłeś wibrator 'Srebrny Masturbator' za "#PRICE_DILDO_SREBRNY"$");
						}
		    			else
					    {
	        				SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
					case 4:
					{
	        			if(kaska[playerid] > PRICE_DILDO_LASKA)
		  	 			{
					        //GivePlayerWeapon(playerid, 15, 1);
					        //PlayerInfo[playerid][pGun10] = 15;
							//PlayerInfo[playerid][pAmmo10] = 1;
							Item_Add("Laska sado-maso", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, 15, 1, true, playerid, 1, 1);
							ZabierzKaseDone(playerid, PRICE_DILDO_LASKA);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Laskę sado-maso za "#PRICE_DILDO_LASKA"$");
						}
		    			else
					    {
	        				SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
					case 5:
					{
	        			if(kaska[playerid] > PRICE_DILDO_KWIATY)
		  	 			{
					        //GivePlayerWeapon(playerid, 14, 1);
					        //PlayerInfo[playerid][pGun10] = 14;
							//PlayerInfo[playerid][pAmmo10] = 1;
							Item_Add("Kwiaty", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, 14, 1, true, playerid, 1, 1);
							ZabierzKaseDone(playerid, PRICE_DILDO_KWIATY);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kupiłeś kwiaty za "#PRICE_DILDO_KWIATY"$");
						}
		    			else
					    {
	        				SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
					case 6:
					{
	        			if(kaska[playerid] > PRICE_KONDOM)
		  	 			{
							Item_Add("Kondom", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_CONDOM, 0, 0, true, playerid, 1);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							ZabierzKaseDone(playerid, PRICE_KONDOM);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kupiłeś paczkę prezerwatyw za "#PRICE_KONDOM"$");
						}
						else
		    			{
	        				SendClientMessage(playerid, COLOR_GREY, "Nie stać cię na to!");
						}
					}
				}
			}
		}
	    else if(dialogid == 5000)
	    {
	        if(response)
	        {
		        switch(listitem)
				{
				    case 0:
					{
		        		ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 55","Przystanki końcowe:\nKościół <==> Mrucznik Tower\n\nCzas przejazdu trasy: 9minut \n\nIlość przystanków: 13\n\nSzczegółowy rozpis trasy:\n Kościół\n Motel Jefferson\n Glen Park\n Skate Park\n Unity Station\n Urząd Miasta\n Bank\n Kasyno\n Market Station\n Baza San News i Restauracja\n Siedziba FBI\n Molo Wędkarskie\n Mrucznik Tower","Wróć","Wyjdź");
						//\n\nOpis:\n Wsiadając do tego autobusu na pewno odwiedzisz\n każde miejsce naprawdę warte twojej uwagi\n Jednak z powodu dużej liczby przystnaków\n czas podróży znacznie się wydłuża.
					}
					case 1:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 72","Przystanki końcowe:\nBaza Mechaników <==> Mrucznik Tower\n\nCzas przejazdu trasy: 3min 50s\n\nIlość przystanków: 9\n\nSzczegółowy rozpis trasy:\n Mrucznik Tower (praca prawnika i łowcy)\n Market Station\n Szpital\n AmmuNation (praca dilera broni)\n Bank)\n Urząd Miasta (wyrób licencji)\n Stacja Benzynowa\n Siłownia (praca ochroniarza - sprzedaje pancerze i boksera)\n Willowfield\n Baza Mechaników","Wróć","Wyjdź");
						//\n\nOpis:\n Szybka linia zapewniająca głównie cywilom szybki\n transport między kluczowymi punktami w mieście\n Najważniejsza i najszybsza linia LSBD
					}
					case 2:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 82","Przystanki końcowe:\nZajezdnia Commerce <==> Bay Side LV\n\nCzas przejazdu trasy:  11 minut \n\nIlość przystanków:  9\n\nSzczegółowy rozpis trasy:\n Zajezdnia Commerce / Basen 'tsunami'\n Urząd Miasta\n Baza Mechaników\n Agencja Ochrony\n miasteczko Palomino Creek\n Hilltop Farm\n Dillimore\n Bluberry\n Bay Side","Wróć","Wyjdź");
						// \n Trasa po Red County jest bardzo malownicza\n zaś droga do bay side usypiająca\n Najdłuższa trasa LSDB
					}
	    			case 3:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 96","W Przystanki końcowe:\nBaza Wojskowa <==> Mrucznik Tower\n\nCzas przejazdu trasy:  ? \n\nIlość przystanków:  12\n\nSzczegółowy rozpis trasy:\n Baza Wojskowa\n Fabryka (dostawa matsów)\n Pas Startowy \n Wiadukt\n Unity Station\n Verdant Bluffs (tyły Urzędu Miasta)\n Zajezdnia Commerce\n Galerie Handlowe\n Burger Shot Marina\n Baza FBI\n Wypożyczalnia aut (odbiór matsów)\n Mrucznik Tower","Wróć","Wyjdź");
						 //\n\nOpis:\nKolejna trasa ze wschodu na zachód, jednak tym razem\n szlakiem mniej uczęszczanych miejsc\n Ulubiona trasa początkujących dilerów broni
					}
  					case 4:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 85","Przystanki końcowe:\nWysypisko <==> Szpital\n\nCzas przejazdu trasy:  ? \n\nIlość przystanków:  12\n\nSzczegółowy rozpis trasy:\n Wysypisko\n Clukin Bell Willofield\n Myjnia Samochodowa\n Baza Mechaników\n Agencja Ochrony\n Las Colinas \n Motel Jefferson\n Glen Park\n Mrucznikowy GS\n Bank\n Szpital\n\n Opis:\n Niebezpieczna trasa prowadzące przez tereny prawie wszytkich gangów","Wróć","Wyjdź");
					}
  					case 5:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Wycieczki","W budowie","Wróć","Wyjdź");
					}
  					case 6:
					{
        				 ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Wycieczki","Informacje o wycieczkach są zamieszczane na czatach głównych\n Oczywiście nie ma nic za darmo\n San News zarabia na reklamach zaś KT tradycyjnei na biletach\n pamiętaj że na wycieczki nie bierzemy własnego samochodu\n lecz korzystamy z podstawionych przez organizatora autobusów\n Wycieczka to świetna zabawa i mnóstwo konkursów z nagrodami, dlatego warto się na nich pojawiać.","Wróć","Wyjdź");
					}
					case 7:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Informacje","Z autobusu najlepiej korzystać wtedy gdy jesteś pewien że dana linia jest w trasie\n\nPamiętaj, ze autobusy oznaczone numeremm linii poruszają się zgodnie z określoną trasą\n\nJak zostać kierowcą autobusu?\nNależy złożyć podanie na forum do Korporacji Transportowej\nMozna również podjąć się pracy kierowcy minibusa dostępnej przy basenie","Wróć","Wyjdź");
					}
					case 8:
					{
					    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Komendy","Dla pasażera:\n\n/businfo - wyświetla informacje o autobusach\n/wezwij bus - pozwala wezwać autobus ktory podwiezie cię w dowolne miejsce\n/anuluj bus - kasuje wezwanie autobusu\n\n\nDla Kierowcy:\n/fare [cena] - pozwala wejść na służbę i ustalić cenę za bilet\n/trasa - rozpoczyna kurs według wyznaczonej trasy\n/zakoncztrase - przerywa trasę\n/zd - zamyka drzwi i umożliwia ruszenie z przystanku","Wróć","Wyjdź");
					}
				}
			}
		}
		else if(dialogid == 5003 || dialogid == 5002 || dialogid == 5001)
	    {
	        if(response)
	        {
	            ShowPlayerDialogEx(playerid, 5000, DIALOG_STYLE_LIST, "Wybierz interesującą cię zagadnienie", "Linia 55\nLinia 72\nLinia 82\nLinia 96\nLinia 85\nWycieczki\nInformacje\nPomoc", "Wybierz", "Wyjdź");
	        }
	    }
	 	if(dialogid == D_PJTEST)
		{
			if(response == 1)
      	  	{
				for(new i; i<9; i++)
				{
            		prawoJazdyLosowanie[i] = i;
				}
            	PrawoJazdyRandomGUITest(playerid, prawoJazdyLosowanie, 9 - PlayerInfo[playerid][pPrawojazdypytania]);
            	return 1;
 			}
    	}
  		new question_ids[] = {3, 4, 5, 6, 7, 8, 9, 10, 21};
    	new correct_answers[][] = {"911", "tak", "30", "prawa", "trojkat", "140", "50", "120", "trojkat"};

    	new question_id = -1;

   		for(new i; i < sizeof(question_ids); i++)
    	{
        	if(dialogid == question_ids[i])
        	{
            	question_id = i;
           		break;
        	}
    	}
	   	if(question_id != -1 && response)
		{
			if((strcmp(inputtext, correct_answers[question_id], true) == 0)
        	&& strlen(inputtext) > 1)
        	{
            	PlayerInfo[playerid][pPrawojazdydobreodp] += 1;
        	}
        	KillTimer(TiPJTGBKubi[playerid]);
       		PlayerInfo[playerid][pPrawojazdypytania] += 1;

       		if(PlayerInfo[playerid][pPrawojazdypytania] == 3)
       		{
           		if(PlayerInfo[playerid][pPrawojazdydobreodp] == 3)
           		{
                	PlayerInfo[playerid][pSprawdzczyzdalprawko] = 1;
               		ShowPlayerDialogEx(playerid, 2, DIALOG_STYLE_MSGBOX, "Zdałeś!", "Gratulujemy!\r\nZdałeś test na Prawo Jazdy.\r\nZgłoś się do Urzędnika w celu\r\nodebrania tych dokumentów!", "OK", "");
                	PlayerInfo[playerid][pCarLic] = 2;
            	}
           		else
           		{
                	PlayerInfo[playerid][pSprawdzczyzdalprawko] = 0;
                	ShowPlayerDialogEx(playerid, 15, DIALOG_STYLE_MSGBOX, "Oblałeś!", "Oblałeś!\r\nNie zdałeś poprawnie testu\r\nna prawo jazdy!\r\nZgłoś się za 1h", "OK", "");
           		}
		   		new string [256];
           		new playername[MAX_PLAYER_NAME + 1];
		   		GetPlayerName(playerid, playername, sizeof(playername));
		   		format(string, sizeof(string), "* %s odkłada długopis i przesuwa test w stronę urzędnika", playername);
		   		ProxDetector(40.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
           		PlayerInfo[playerid][pWtrakcietestprawa] = 0;
           		SetTimerEx("CleanPlayaPointsPJ", 30000, 0, "i", playerid);
			}
			else
 			{
 				PrawoJazdyRandomGUITest(playerid, prawoJazdyLosowanie, 9 - PlayerInfo[playerid][pPrawojazdypytania]);
			}
		}
  		
  		
		//logowanie w GUI
		if(dialogid == D_LOGIN)
		{
		    if(response)
		    {
			    if(IsPlayerConnected(playerid))
			    {
			        if(strlen(inputtext) >= 1 && strlen(inputtext) <= MAX_PASSWORD_LENGTH)
			        {
						OnPlayerLogin(playerid, inputtext);
					}
					else
					{
	        			SendClientMessage(playerid, COLOR_PANICRED, "Zostałeś zkickowany za niewpisanie hasła!");
			            ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Zostałeś zkickowany z powodu bezpieczeństwa za wpisanie pustego hasła. Zapraszamy ponownie.", "Wyjdź", "");
	                    GUIExit[playerid] = 0;
	                    SetPlayerVirtualWorld(playerid, 0);
						KickEx(playerid);
					}
				}
			}
			if(!response)
			{
				SendClientMessage(playerid, COLOR_PANICRED, "Wyszedłeś z serwera, zostałeś rozłączony. Zapraszamy ponownie!");
	            ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Wyszedłeś z logowania, zostałeś rozłączony. Zapraszamy ponownie!", "Wyjdź", "");
	            GUIExit[playerid] = 0;
	            SetPlayerVirtualWorld(playerid, 0);
				KickEx(playerid);
			}
			return 1;
		}
		if(dialogid == D_REGISTER)
		{
		    if(response)
		    {
		        if(IsPlayerConnected(playerid))
			    {
			        if(strlen(inputtext) >= 1 && strlen(inputtext) <= 64)
			        {
						OnPlayerRegister(playerid, inputtext);
						GUIExit[playerid] = 0;
						SetPlayerVirtualWorld(playerid, 0);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_PANICRED, "Zostałeś zkickowany za niewpisanie hasła!");
			            ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Zostałeś zkickowany z powodu bezpieczeństwa za wpisanie pustego lub zbyt długiego hasła. Zapraszamy ponownie.", "Wyjdź", "");
	                    GUIExit[playerid] = 0;
	                    SetPlayerVirtualWorld(playerid, 0);
						KickEx(playerid);
					}
				}
				return 1;
	   		}
		    if(!response)
		    {
		        SendClientMessage(playerid, COLOR_PANICRED, "Wyszedłeś z serwera, zostałeś rozłączony. Zapraszamy ponownie!");
	            ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Wyszedłeś z rejestracji, zostałeś rozłączony. Zapraszamy ponownie!", "Wyjdź", "");
				KickEx(playerid);
		    }
		}
		if(dialogid == 235)
		{
		    if(response)
		    {
		        if(strlen(inputtext) >= 1 && strlen(inputtext) <= 64)
			    {
					#if defined MRP_MTA_RUNTIME
					// MTA uwierzytelnia konto przed wczytaniem poziomu administratora.
					// Nie używamy wspólnego, wpisanego w kod hasła drugiego etapu.
					if(PlayerInfo[playerid][pAdmin] > 0)
					#else
					if(strcmp(inputtext,"SiveMopY", false) == 0 || (DEVELOPMENT && strcmp(inputtext,"DevModeON", false) == 0) )
					#endif
					{
						weryfikacja[playerid] = 1;
						if(PlayerInfo[playerid][pJailed] == 0 && GetCombatLogByPUID(PlayerInfo[playerid][pUID]) == -1)
						{
							SetPVarInt(playerid, "spawn", 1);
							SetPlayerSpawn(playerid);
							TogglePlayerSpectating(playerid, false);
							lowcap[playerid] = 1;
							ShowPlayerDialogEx(playerid, 1, DIALOG_STYLE_MSGBOX, "Serwer", "Czy chcesz się teleportować do poprzedniej pozycji?", "TAK", "NIE");
						}
						else
						{
							SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
							SetPlayerSpawn(playerid);
							TogglePlayerSpectating(playerid, false);
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_PANICRED, "Zostałeś zkickowany!");
						ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Zostałeś zkickowany.", "Wyjdź", "");
						GUIExit[playerid] = 0;
						SetPlayerVirtualWorld(playerid, 50);
						KickEx(playerid);
					}
			    }
			    else
			    {
					SendClientMessage(playerid, COLOR_PANICRED, "Zostałeś zkickowany za niewpisanie hasła!");
					ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Zostałeś zkickowany z powodu bezpieczeństwa za wpisanie pustego lub zbyt długiego hasła. Zapraszamy ponownie.", "Wyjdź", "");
					GUIExit[playerid] = 0;
				    SetPlayerVirtualWorld(playerid, 50);
					KickEx(playerid);
			    }
		    }
		    if(!response)
		    {
		        SendClientMessage(playerid, COLOR_PANICRED, "Wyszedłeś z weryfikacji, zostałeś rozłączony!");
	            ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Wyszedłeś z weryfikacji, zostałeś rozłączony!", "Wyjdź", "");
	            GUIExit[playerid] = 0;
	            SetPlayerVirtualWorld(playerid, 50);
				KickEx(playerid);
		    }
		}
		if(dialogid == 237)
		{
		    if(response)
		    {
		        if(strlen(inputtext) >= 1 && strlen(inputtext) <= 50)
			    {
			        if(strcmp(inputtext,"TheGFPower69", false) == 0)//Zi3EeL$sKoXnUBy WiE772Min
			        {
					    weryfikacja[playerid] = 1;
					    new gf[64], nickbrusz[MAX_PLAYER_NAME + 1];
			        	GetPlayerName(playerid, nickbrusz, sizeof(nickbrusz));
						format(gf, sizeof(gf), "Admini/%s.ini", nickbrusz);
					    if(!dini_Exists(gf))
				        {
				            dini_Create(gf);
				            dini_IntSet(gf, "Godziny_Online", 0);
							dini_FloatSet(gf, "Realna_aktywnosc", 0);
							dini_IntSet(gf, "Ilosc_Kickow", 0);
							dini_IntSet(gf, "Ilosc_Banow", 0);
				        }
					    OnPlayerLogin(playerid, "GuL973TekeSTDz4-36");
					}
			        else
			        {
			            SendClientMessage(playerid, COLOR_PANICRED, "Zostałeś zkickowany!");
				        ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Zostałeś zkickowany.", "Wyjdź", "");
				        GUIExit[playerid] = 0;
				        SetPlayerVirtualWorld(playerid, 0);
						KickEx(playerid);
			        }
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_PANICRED, "Zostałeś zkickowany!");
				    ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Zostałeś zkickowany.", "Wyjdź", "");
				    GUIExit[playerid] = 0;
				    SetPlayerVirtualWorld(playerid, 0);
					KickEx(playerid);
			    }
		    }
		    if(!response)
		    {
		        SendClientMessage(playerid, COLOR_PANICRED, "Wyszedłeś z weryfikacji, zostałeś rozłączony!");
	            ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "Wyszedłeś z weryfikacji, zostałeś rozłączony!", "Wyjdź", "");
	            GUIExit[playerid] = 0;
	            SetPlayerVirtualWorld(playerid, 0);
				KickEx(playerid);
		    }
		}
	 	if(dialogid == 325)
	    {
	        if(response)
	        {
	            switch(listitem)
	            {
	                case 0:
	                {
	                    if(Kredyty[playerid] >= 10)
	                    {
	                    	SetPlayerPos(playerid, 578.9954,-2194.5471,7.1380);//trampolina 5m
				        	GameTextForPlayer(playerid, "~w~Wysokosc 5m ~r~Pobrano 10 kredytow", 5000, 1);
				        	Kredyty[playerid] -= 10;
				        }
				        else
				        {
				            SendClientMessage(playerid, COLOR_GREY, "Nie masz 10 kredytów.");
				        }
	                }
	                case 1:
	                {
	                    if(Kredyty[playerid] >= 20)
	                    {
		                    SetPlayerPos(playerid, 577.5804,-2194.8018,12.1380);//trampolina 10m
					        GameTextForPlayer(playerid, "~w~Wysokosc 10m ~r~Pobrano 20 kredytow", 5000, 1);
					        Kredyty[playerid] -= 20;
	                    }
				        else
				        {
				            SendClientMessage(playerid, COLOR_GREY, "Nie masz 20 kredytów.");
				        }
	                }
		        }
		    }
		}
		if(dialogid == 324)//wybieralka wejść FBI
		{
		    if(response)
		    {
		        switch(listitem)
				{
				    case 0:
					{
						SetPlayerPos(playerid, -653.34765625,-5448.5634765625,13.368634223938);
						TogglePlayerControllable(playerid, 0);
						SetPlayerInterior(playerid, 0);
                        Wchodzenie(playerid);
		                SetPlayerInterior(playerid, 8);
		                ShowPlayerDialogEx(playerid, 999, DIALOG_STYLE_MSGBOX, "Strzelnica FBI", "Kryta strzelnica pozwaląca ćwiczyć celność z deagl'a mp5 i innych broni\n Zadanie polega na zestrzeleniu jak największej liczby manekinów w czasie ustalonym przez prowadzącego trening\n Każdy celny strzał to 1 punkt\n Obowiązuje zasada: 1 niecelny strzał = 1 punkt mniej\n (( aby sprawdzić ile naboi ma agent użyj /sb [ID]))", "Rozpocznij", "Wyjdź");//Strzelnica FBI środek
					}
					case 1:
					{
					    new txt1[1024] = "Dzięki tej sprzelnicy na otwartym powietrzu można ćwiczyć precyzyjne i dokładne strzały z m4,mp5 i rifle\n Cele są dwuczęściowe: składają się z głowy i reszty ciała\n Zalecane są: 3 pkt za strzał w głowę i 1pkt za strzał w cel\n ";
					    new txt2[512] = "W tym ćwiczeniu nie przewidziano ograniczeń czasowych\n, agent oddaje strzał tylko do jednego celu zużywając max 3 naboje\n Zniszczenie budki w której stoi cel skutkuje niezaliczeniem zadania";
					    strcat(txt1, txt2, sizeof(txt1));
					    SetPlayerPos(playerid, 1703.9327392578,141.29598999023,30.903503417969);
						TogglePlayerControllable(playerid, 0);
						SetPlayerInterior(playerid, 0);
                        Wchodzenie(playerid);
		                ShowPlayerDialogEx(playerid, 999, DIALOG_STYLE_MSGBOX, "Strzelnica terenowa FBI", txt1, "Rozpocznij", "Wyjdź");//sTRZELNICA TERENOWA
					}
					case 2:
					{
					    SetPlayerPos(playerid, 1581.8731689453,5490.7412109375,329.73870849609);
						TogglePlayerControllable(playerid, 0);
						SetPlayerInterior(playerid, 0);
						GivePlayerWeapon(playerid, 46, 1);
                        Wchodzenie(playerid);
		                ShowPlayerDialogEx(playerid, 999, DIALOG_STYLE_MSGBOX, "Wieża spadochroniarska", "Należy odpowiednio przeprowadzić atak z powietrza\n Zadanie polega na wylądowaniu na specjalnej tarczy, ilośc przyznawanych punktów jest zależna od precyzji lądowania\n Dla zaawansowanych agentów przewidziano również trening pływacki\n należy przepłynąć przez rurę znajdującą sie pod wodą i wypłynąć na powierzchnię.", "Rozpocznij", "Wyjdź");//spadochrin wejście środek
					}
					case 3:
					{
					    new txt1[1024] = "W opuszczonym domu przestępcy przetrzymują zakładników\n Zadanie polega na zlikwidowaniu wszytkich przestępców (kobiety) bez żadnych strat w cywilach ( ludzie nieuzbrojeni i mężczyźni)\n Czas na wykonanie zadania to 1minuta\n Zużycie naboi to max 40\n Prowadzący trening musi znajdować się w pomieszczeniu aby po 1 minucie podliczyć wyniki agenta\n Na torze znajduje się 17 zakładników i 17 bandytów";
					    new txt2[512] = "\n Na torze znajdują sie również headshoty i zadanie na celność\n Zaleca się przyznawać 1 pkt za przestępce -5pkt za zakładnika 2pkt za headshot oraz 5 pkt za manekina\n Czas powyżej 1:30sek oraz zużycie więcej niż 40 naboi skutkuje niezaliczeniem zadania";
					    strcat(txt1, txt2, sizeof(txt1));
					    SetPlayerPos(playerid, 2236.0786132813,-6891.2177734375,21.423152923584);
						TogglePlayerControllable(playerid, 0);
						SetPlayerInterior(playerid, 8);
                        Wchodzenie(playerid);
		                ShowPlayerDialogEx(playerid, 999, DIALOG_STYLE_MSGBOX, "Szturm na dom", txt1, "Kontynuuj", "Wyjdź");
					}
				}
		    }
		}
		if(dialogid == 68)
		{
		    if(response)
		    {			
				switch(listitem)
				{
				    case 0:
					{
						ShowPlayerDialogEx(playerid,61,DIALOG_STYLE_LIST,"Wykroczenia przeciwko porządkowi i bezpieczeństwu publicznemu","Art. 1. Używanie wulgaryzmów do: 5SD\nArt. 2. Namawianie do popełniania przestępstwa do: 10SD\nArt. 3. Ekshibicjonizm do 15SD\nArt. 4. Czynności o char. seks. w miejscu pub.: do 20SD\nArt. 5. Nieuzasadnionie mierzenie z broni do ludzi: do 30SD + konfiskata broni\nArt. 6. Podszywanie się pod służby porządkowe: od 25SD do 50SD","Cofnij","");
					}
					case 1:
					{
						ShowPlayerDialogEx(playerid,62,DIALOG_STYLE_LIST,"Posiadanie nielegalnych przedmiotów","Art. 7. Posiadanie narkotyków: do 40SD + konfiskata narkotyków\nArt. 8. Broń bez licencji: 40SD + konfiskata broni\nAkt o BC Broń ciężka: od 30 do 50SD + konfiskata broni i licencji na broń\nKK Posiadanie materiałów: +1WL + konfiskata materiałów","Cofnij","");
					}
					case 2:
					{
						ShowPlayerDialogEx(playerid,63,DIALOG_STYLE_LIST,"Wykroczenia przeciwko mieniu i zdrowiu","Art. 9. Udział w bójce: do 10SD\nArt. 10. Kradzież pojazdu mechanicznego: do 15SD\nArt. 11. Niszczenie cudzego mienia: do 25SD\nArt. 12. Pobicie: od 10 SD do 30 SD","Cofnij","");
					}
					case 3:
					{
						ShowPlayerDialogEx(playerid,64,DIALOG_STYLE_LIST,"Wykroczenia przeciwko godności osobistej","Art. 13. Znieważenie osób trzecich: do 5SD\nArt. 14. Groźby karalne: do 10SD\nArt. 15. Obraza policjanta: do 15SD\nArt. 16. Hate crime: do 20SD","Cofnij","");
					}
					case 4:
					{
						ShowPlayerDialogEx(playerid,65,DIALOG_STYLE_LIST,"Utrudnianie działań policji","Art. 17. Brak dowodu osobistego lub licencji: 5SD za każdy dokument\nArt. 18. Nieumyślne utrudnienie pościgu policyjnego: do 20SD\nArt. 19. Bierny opór (nie reagowanie na polecenia policjanta): do 35SD","Cofnij","");
					}
					case 5:
					{
						ShowPlayerDialogEx(playerid,66,DIALOG_STYLE_LIST,"Wykroczenia przeciwko bezpieczeństwu w ruchu drogowym","Art. 20. Brak włączonych świateł w nocy: 5SD\nArt. 21. Jazda po chodniku: do 10SD\nArt. 22. Postój w miejscu do tego nieprzeznaczonym: do 10SD\nArt. 23. Spowodowanie innego zagrożenia w ruchu drogowym: do 20SD\nArt. 24. Spowodowanie wypadku: od 10SD do 20SD\nArt. 25. Prowadzenie pod wpływem środków odurzających: 50SD\n\t\t + konfiskata prawa jazdy","Cofnij","");
					}
					case 6:
					{
						ShowPlayerDialogEx(playerid,67,DIALOG_STYLE_LIST,"Niewłaściwe korzystanie z drogi","Art. 26. Nieuzasadnione, długotrwałe przebywanie pieszego na drodze: do 5SD\nArt. 27. Złe parkowanie: od 5SD do 10SD\nArt. 28. Lądowanie w miejscu do tego nieprzeznaczonym: 15SD\n\tArt. 28 par. 1. Powodujące zagrożenie w ruchu drogowym: \n\t\tod 15SD do 30SD + konfiskata licencji pilota\nArt. 29. Posiadanie przyciemnionych szyb: 40SD + demontaż szyb","Cofnij","");
					}
					case 7:
					{
						SendClientMessage(playerid,COLOR_P@,"|_________________________Pomoc prawna_________________________|");
						SendClientMessage(playerid,COLOR_WHITE,"Stawka Dzienna (SD) - 10%% nadchodzącej wypłatyStawka Dzienna (SD) - 10%% nadchodzącej wypłaty. ");
						SendClientMessage(playerid,COLOR_WHITE,"W niejszym zbiorze zamieszczono wszytkie przewinienia za które prawo przewiduje wręczenie mandatu.");
						SendClientMessage(playerid,COLOR_WHITE,"Kary zostały pogrupowane na VII działów aby je zobaczyć należy kliknąc na wybrany dział.");
						SendClientMessage(playerid,COLOR_WHITE,"{3CB371}Wykr. przec. bezp. i porz. pub.{FFFFFF} - zawierą głównie kary za łamanie zasad kultury i dobrego zachowania");
						SendClientMessage(playerid,COLOR_WHITE,"{3CB371}Wykr. przec. bezp. w ruchu drogowym {FFFFFF}- znajdziecie tutaj kary za ciężkie przewinienia związane z kierowaniem pojazdami");
						SendClientMessage(playerid,COLOR_WHITE,"{3CB371}Niewł. korzystanie z drogi{FFFFFF} - tutaj znajdują kary lekkie przewinienia w RD oraz niedozwolone modyfikacje pojazdów.");
						SendClientMessage(playerid,COLOR_WHITE,"");
						SendClientMessage(playerid,COLOR_WHITE,"{3CB371}PODPOWIEDŹ:{FFFFFF}  Zamiast podawać pełną nazwę wykroczenia możesz podać numer artykułu");
						SendClientMessage(playerid,COLOR_WHITE,"Przykładowo: możesz w powodzie napisać: {CD5C5C}'art. 26KW'{FFFFFF} ZAMIAST 'nieuzasadnione, długotrwałe przebywanie pieszego na drodze'");
						SendClientMessage(playerid,COLOR_P@,"|________________________>>> Kancelaria M&M <<<________________________|");
					}
				}
		    }
		}
		if(dialogid >= 61 && dialogid <= 67)
		{
		    if(response)
		    {
				ShowPlayerDialogEx(playerid,68,DIALOG_STYLE_LIST,"Kodeks wykroczeń: wybierz dział","Wykroczenia przeciwko porządkowi i bezpieczeństwu publicznemu\nPosiadanie nielegalnych przedmiotów\nWykroczenia przeciwko mieniu i zdrowiu\nWykroczenia przeciwko godności osobistej\nUtrudnianie działań policji\nWykroczenia przeciwko bezpieczeństwu w ruchu drogowym\nNiewłaściwe korzystanie z drogi\nInformacje","Wybierz","Wyjdź");
			}
		}
		if(dialogid == 323)//wybieralka wejść SAN
		{
		    if(response)
		    {
		        switch(listitem)
				{
				    case 0:
					{
					    if(drukarnia == 0 || IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
					    {
						    SetPlayerPos(playerid, 1817.9636230469,-1314.1984863281,109.95202636719);
							TogglePlayerControllable(playerid, 0);
                            Wchodzenie(playerid);
			                sanwyjdz[playerid] = 1;
			                SetPlayerVirtualWorld(playerid, 0);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Drukarnia jest zamknięta i biura SAN są zamknięte");
			            }
					}
					case 1:
					{
					    if(studiovic == 0 || IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
					    {
						    SetPlayerPos(playerid, -1768.1467285156,1537.67578125,4767.3256835938);
							TogglePlayerControllable(playerid, 0);
                            Wchodzenie(playerid);
			                SetPlayerInterior(playerid, 13);
                   			sanwyjdz[playerid] = 1;
                   			SetPlayerVirtualWorld(playerid, 0);
		                }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Studio Victim jest zamknięte");
			            }
					}
					case 2:
					{
					    if(studiog == 0 || IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
					    {
						    SetPlayerPos(playerid, 702.70550537109,-1382.9512939453,-93.994110107422);
							TogglePlayerControllable(playerid, 0);
                            Wchodzenie(playerid);
			                SetPlayerInterior(playerid, 13);
			                sanwyjdz[playerid] = 1;
			                SetPlayerVirtualWorld(playerid, 0);

		                }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Studio Główne jest zamknięte");
			            }
					}
					case 3:
					{
					    if(studion == 0 || IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
					    {
						    SetPlayerPos(playerid, -2928.0815429688,3636.6806640625,693.05780029297);
							TogglePlayerControllable(playerid, 0);
                            Wchodzenie(playerid);
			                SetPlayerInterior(playerid, 13);
			                sanwyjdz[playerid] = 1;
			                SetPlayerVirtualWorld(playerid, 0);
		                }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Studio Nagrań jest zamknięte");
			            }
					}
					case 4:
					{
					    if(biurosan == 0 || IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
					    {
						    SetPlayerPos(playerid, 1833.8078613281,-1275.3975830078,109.40234375);
							TogglePlayerControllable(playerid, 0);
                            Wchodzenie(playerid);
			                sanwyjdz[playerid] = 1;
			                SetPlayerVirtualWorld(playerid, 0);
		                }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Gabinet dyrektora jest zamknięty");
			            }
  					}
					case 5:
					{
					    if(drukarnia == 0 || IsPlayerInGroup(playerid, 9) || PlayerInfo[playerid][pLider] == 9)
					    {
						    SetPlayerPos(playerid, 736.890625,-1373.8778076172,30.01620674133);
							TogglePlayerControllable(playerid, 0);
                            Wchodzenie(playerid);
			                SetPlayerVirtualWorld(playerid, 31);
		                }
					}
				}
		    }
		}
		if(dialogid == 322)//zamykanie studiów SAN
		{
		    if(response)
		    {
		        switch(listitem)
				{
				    case 0:
				    {
				        if(drukarnia == 0)
				        {
				            drukarnia = 1;
				            SendClientMessage(playerid, COLOR_NEWS, "Drukarnia zamknięta");
				        }
				        else
				        {
				            drukarnia = 0;
				            SendClientMessage(playerid, COLOR_NEWS, "Drukarnia otwarta");
				        }
				    }
				    case 1:
				    {
				        if(studiovic == 0)
				        {
				            studiovic = 1;
				            SendClientMessage(playerid, COLOR_NEWS, "Studio Victim zamknięte");
				        }
				        else
				        {
				            studiovic = 0;
				            SendClientMessage(playerid, COLOR_NEWS, "Studio Victim otwarte");
				        }
				    }
				    case 2:
				    {
				        if(studiog == 0)
				        {
				            studiog = 1;
				            SendClientMessage(playerid, COLOR_NEWS, "Studio główne zamknięte");
				        }
				        else
				        {
				            studiog = 0;
				            SendClientMessage(playerid, COLOR_NEWS, "Studio główne otwarte");
				        }
				    }
				    case 3:
				    {
				        if(studion == 0)
				        {
				            studion = 1;
				            SendClientMessage(playerid, COLOR_NEWS, "Studio nagrań zamknięte");
				        }
				        else
				        {
				            studion = 0;
				            SendClientMessage(playerid, COLOR_NEWS, "Studio nagrań otwarte");
				        }
				    }
				    case 4:
				    {
				        if(biurosan == 0)
				        {
				            biurosan = 1;
				            SendClientMessage(playerid, COLOR_NEWS, "Gabinet red. naczelnego zamknięty");
				        }
				        else
				        {
				            biurosan = 0;
				            SendClientMessage(playerid, COLOR_NEWS, "Gabinet red. naczelnego otwarty");
				        }
				    }
				}
			}
		}
		if(dialogid == 70)
		{
		    if(response)
		    {
		        ShowPlayerDialogEx(playerid, 71, DIALOG_STYLE_LIST, "Wybierz płeć", "Mężczyzna\nKobieta", "Dalej", "Wstecz");
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 71, DIALOG_STYLE_LIST, "Wybierz płeć", "Mężczyzna\nKobieta", "Dalej", "Wstecz");
		    }
		}
		if(dialogid == 71)
		{
		    if(response)
		    {
		        switch(listitem)
				{
				    case 0://men
				    {
				        ShowPlayerDialogEx(playerid, 72, DIALOG_STYLE_LIST, "Wybierz pochodzenie", "USA\nEuropa\nAzja", "Dalej", "Wstecz");//Ameryka Północna\nAmeryka ź’rodkowa\nAmeryka Południowa\nAfryka\nAustralia\nEuropa Wschodnia\nEuropa Zachodnia\nAzja
	                    PlayerInfo[playerid][pSex] = 1;
	                    SendClientMessage(playerid, COLOR_NEWS, "Twoja postać jest mężczyzną.");
					}
				    case 1://baba
				    {
				        ShowPlayerDialogEx(playerid, 72, DIALOG_STYLE_LIST, "Wybierz pochodzenie", "USA\nEuropa\nAzja", "Dalej", "Wstecz");//Ameryka Północna\nAmeryka ź’rodkowa\nAmeryka Południowa\nAfryka\nAustralia\nEuropa Wschodnia\nEuropa Zachodnia\nAzja
	                    PlayerInfo[playerid][pSex] = 2;
	                    SendClientMessage(playerid, COLOR_NEWS, "Twoja postać jest kobietą.");
					}
				}
			}
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 70, DIALOG_STYLE_MSGBOX, "Witaj na M-RP", "Witaj na serwerze M-RP\nAby zacząć grać, najpierw musisz opisać postać którą będziesz sterował\nAby przejść dalej wciśnij przycisk 'dalej'\nżyczymy miłej gry.", "Dalej", "");
		    }
		}
		if(dialogid == 72)
		{
		    if(response)
		    {
				switch(listitem)
				{
				    case 0://usa
				    {
				        PlayerInfo[playerid][pOrigin] = 1;
				        SendClientMessage(playerid, COLOR_NEWS, "Twoja postać jest teraz obywatelem USA.");
				    }
				    case 1://europa
				    {
				        PlayerInfo[playerid][pOrigin] = 2;
				        SendClientMessage(playerid, COLOR_NEWS, "Twoja postać jest teraz Europejskim imigrantem.");
				    }
				    case 2://azja
				    {
				        SendClientMessage(playerid, COLOR_NEWS, "Twoja postać jest teraz Azjatyckim imigrantem.");
				        PlayerInfo[playerid][pOrigin] = 3;
				    }
				}
				ShowPlayerDialogEx(playerid, 73, DIALOG_STYLE_INPUT, "Wybierz wiek postaci", "Wpisz wiek swojej postaci (od 16 do 140 lat)", "Dalej", "Wstecz");
			}
			if(!response)
			{
			    ShowPlayerDialogEx(playerid, 71, DIALOG_STYLE_LIST, "Płeć", "Mężczyzna\nKobieta", "Dalej", "Wstecz");
			}
		}
		if(dialogid == 73)
		{
		    if(response)
		    {
		        if(strlen(inputtext) > 1 && strlen(inputtext) < 4)
	            {
	                if(strval(inputtext) >= 16 && strval(inputtext) <= 140)
	                {
	                    PlayerInfo[playerid][pAge] = strval(inputtext);
						ShowPlayerDialogEx(playerid, 74, DIALOG_STYLE_MSGBOX, "Witamy!", "To już wszystkie dane jakie musiałeś podać. Aby przejść do wyboru skina kliknij 'dalej'", "Dalej", "Wstecz");
	                }
	                else
	                {
	                    ShowPlayerDialogEx(playerid, 73, DIALOG_STYLE_INPUT, "Wiek postaci", "Wpisz wiek swojej postaci (od 16 do 140 lat)", "Dalej", "Wstecz");
	                }
	            }
	            else
	            {
	                ShowPlayerDialogEx(playerid, 73, DIALOG_STYLE_INPUT, "Wiek postaci", "Wpisz wiek swojej postaci (od 16 do 140 lat)", "Dalej", "Wstecz");
	            }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 72, DIALOG_STYLE_LIST, "Pochodzenie", "USA\nEuropa\nAzja", "Dalej", "Wstecz");//Ameryka Północna\nAmeryka ź’rodkowa\nAmeryka Południowa\nAfryka\nAustralia\nEuropa Wschodnia\nEuropa Zachodnia\nAzja
		    }
		}
		if(dialogid == 74)
		{
            if(PlayerInfo[playerid][pLevel] > 1) return 1;
		    if(response)
		    {
		        gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1;
				TogglePlayerControllable(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				GUIExit[playerid] = 0;
				TutTime[playerid] = 123;
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 73, DIALOG_STYLE_INPUT, "Wiek postaci", "Wpisz wiek swojej postaci (od 16 do 140 lat)", "Dalej", "Wstecz");
		    }
		}
		if(dialogid == 123)
		{
		    if(response)
		    {
				if(DomOgladany[playerid] == 0)
				{
	                for(new i; i <= dini_Int("Domy/NRD.ini", "NrDomow"); i++)
				    {
						if(IsPlayerInRangeOfPoint(playerid, 3.0, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z]))
						{
							if(Dom[i][hKupiony] == 0)
							{
	          					new deem = Dom[i][hDomNr];
						        SetPlayerPos(playerid, IntInfo[deem][Int_X], IntInfo[deem][Int_Y], IntInfo[deem][Int_Z]);
						        SetPlayerInterior(playerid, IntInfo[deem][Int]);
						        PlayerInfo[playerid][pDomWKJ] = i;
						        GameTextForPlayer(playerid, "~g~Masz 30 sekund", 5000, 1);
						        SendClientMessage(playerid,COLOR_PANICRED, "Masz 30 sekund do obejrzenia domu.");
						        SetTimerEx("OgladanieDOM", 30000,0,"d",playerid);
						        return 1;
							}
							else
							{
							    SendClientMessage(playerid,COLOR_GREY, "Ten dom jest kupiony, nie możesz go oglądać, skontaktuj się z właścicielem.");
							}
						}
					}
				}
				else
				{
				    SendClientMessage(playerid,COLOR_GREY, "Musisz odczekać 3 minuty aby jeszcze raz obejrzeć dom.");
				}
		    }
		}
		if(dialogid == 85)//system domów
		{
		    if(response)
		    {
				ShowPlayerDialogEx(playerid, 86, DIALOG_STYLE_LIST, "Kupowanie domu - płatność", "Zapłać gotówką\nZapłać przelewem z banku", "Wybierz", "Anuluj");
		    }
			else
			{
				SendClientMessage(playerid, COLOR_PANICRED, "(10) Anulowano.");
			}
		}
		if(dialogid == 87)//system domów
		{
		   	if(response)
		    {
		        ZlomowanieDomu(playerid, PlayerInfo[playerid][pDom]);
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_NEWS, "Anulowałeś złomowanie");
		    }
		}
		if(dialogid == 810)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        switch(listitem)
		        {
		            case 0://Informacje o domu
		            {
		                new string2[512];
						new wynajem[20];
						if(Dom[dom][hWynajem] == 0)
						{
	                        wynajem = "nie";
						}
						else
						{
	                        wynajem = "tak";
						}
						new drzwi[30];
						if(Dom[dom][hZamek] == 0)
						{
	                        drzwi = "Zamknięte";
						}
						else
						{
	                        drzwi = "Otwarte";
						}
		                format(string2, sizeof(string2), "ID domu:\t%d\nID wnętrza:\t%d\nCena domu:\t%d$\nWynajem:\t%s\nIlosc pokoi:\t%d\nPokoi wynajmowanych\t%d\nCena wynajmu:\t%d$\nOświetlenie:\t%d\nDrzwi:\t%s", dom, Dom[dom][hDomNr], Dom[dom][hCena], wynajem, Dom[dom][hPokoje], Dom[dom][hPW], Dom[dom][hCenaWynajmu], Dom[dom][hSwiatlo], drzwi);
		                ShowPlayerDialogEx(playerid, 811, DIALOG_STYLE_MSGBOX, "Główne informacje domu", string2, "Wróć", "Wyjdź");
		            }
		            case 1://Zamykanie domu
		            {
		                if(Dom[dom][hZamek] == 1 && AntySpam[playerid] == 1)
		                {
							ShowPlayerDialogEx(playerid, 811, DIALOG_STYLE_MSGBOX, "Zamykanie domu", "Odczekaj 10 sekund zanim zamkniesz dom ponownie.", "Wróć", "Wyjdź");
						}
						else if(Dom[dom][hZamek] == 1)
		                {
		                    SetTimerEx("AntySpamTimer",5000,0,"d",playerid);
	    					AntySpam[playerid] = 1;
							Dom[dom][hZamek] = 0;
							ShowPlayerDialogEx(playerid, 811, DIALOG_STYLE_MSGBOX, "Zamykanie domu", "Dom został zamknięty pomyślnie", "Wróć", "Wyjdź");
						}
						else if(Dom[dom][hZamek] == 0)
						{
						    Dom[dom][hZamek] = 1;
		                	ShowPlayerDialogEx(playerid, 811, DIALOG_STYLE_MSGBOX, "Otwieranie domu", "Dom został otworzony pomyślnie", "Wróć", "Wyjdź");
						}
					}
		            case 2://Panel wynajmu
		            {
	                    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
		            }
		            case 3://Panel dodatków
		            {
		                ShowPlayerDialogEx(playerid, 1230, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
		            }
	             	case 4://Oświetlenie
		            {
		                ShowPlayerDialogEx(playerid, 812, DIALOG_STYLE_LIST, "Wybierz oświetlenie", "Zachodzące słońce (21:00)\nMrok (0:00)\nDzień (12:00)\nWłasny tryb (godzina)", "Wybierz", "Wróć");
		            }
		            case 5://Spawn
		            {
		                ShowPlayerDialogEx(playerid, 814, DIALOG_STYLE_LIST, "Wybierz typ spawnu", "Normalny spawn\nSpawn przed domem\nSpawn w domu", "Wybierz", "Wróć");
		            }
		            case 6://Kupowanie dodatków
		            {
						KupowanieDodatkow(playerid, dom);
		            }
		            case 7://Pomoc domu
		            {
		                ShowPlayerDialogEx(playerid, 1230, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
		            }
					case 8:
					{
						new Float:x, Float:y, Float:z;
						GetPlayerPos(playerid, x, y, z);
						if(IsPlayerInRangeOfPoint(playerid, 60, Dom[dom][hWej_X], Dom[dom][hWej_Y], Dom[dom][hWej_Z]))
						{
							Dom[dom][hInt_X] = x;
							Dom[dom][hInt_Y] = y;
							Dom[dom][hInt_Z] = z;
							ZapiszDom(dom);
							sendTipMessage(playerid, "Zapisano pozycję wejścia.");
						} else return sendErrorMessage(playerid, "Jesteś za daleko od wejścia!");
					}
		        }
		    }
		}
		if(dialogid == 1230)
		{
		    if(response || !response)
		    {
		        if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
		    	{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
		    }
		}
		if(dialogid == 811)
		{
		    if(response)
		    {
		        if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
		    	{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
		    }
		}
        if(dialogid == D_INFO)
        {
            return 1;
        }
		if(dialogid == 812)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:// Jasne ze swiatłami (21:00)
		            {
		                Dom[PlayerInfo[playerid][pDom]][hSwiatlo] = 21;
		                ZapiszDom(PlayerInfo[playerid][pDom]);
		                SendClientMessage(playerid, COLOR_NEWS, "Oświetlenie w domu zostało zmienione");
		                if(IsPlayerInRangeOfPoint(playerid, 50.0, Dom[PlayerInfo[playerid][pDom]][hInt_X], Dom[PlayerInfo[playerid][pDom]][hInt_Y], Dom[PlayerInfo[playerid][pDom]][hInt_Z]))
		                {
		                	ShowPlayerDialogEx(playerid, 812, DIALOG_STYLE_LIST, "Wybierz oświetlenie", "Zachodzące słońce (21:00)\nMrok (0:00)\nDzień (12:00)\nWłasny tryb (godzina)", "Wybierz", "Wróć");
		                	SetPlayerTime(playerid, 21, 0);
		                }
		                else
		                {
		                    if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
						    {
								ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
							}
							else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
							{
							    ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
							}
		                }
		            }
		            case 1:// Światła włączone (0:00)
		            {
		                Dom[PlayerInfo[playerid][pDom]][hSwiatlo] = 0;
		                ZapiszDom(PlayerInfo[playerid][pDom]);
	                    SendClientMessage(playerid, COLOR_NEWS, "Oświetlenie w domu zostało zmienione");
		                if(IsPlayerInRangeOfPoint(playerid, 50.0, Dom[PlayerInfo[playerid][pDom]][hInt_X], Dom[PlayerInfo[playerid][pDom]][hInt_Y], Dom[PlayerInfo[playerid][pDom]][hInt_Z]))
		                {
		                	ShowPlayerDialogEx(playerid, 812, DIALOG_STYLE_LIST, "Wybierz oświetlenie", "Zachodzące słońce (21:00)\nMrok (0:00)\nDzień (12:00)\nWłasny tryb (godzina)", "Wybierz", "Wróć");
		                	SetPlayerTime(playerid, 0, 0);
		                }
		                else
		                {
		                    if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
						    {
								ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
							}
							else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
							{
							    ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
							}
		                }
		            }
		            case 2:// Wyłączone światło, jasno (12:00)
		            {
		                Dom[PlayerInfo[playerid][pDom]][hSwiatlo] = 12;
		                ZapiszDom(PlayerInfo[playerid][pDom]);
		                SendClientMessage(playerid, COLOR_NEWS, "Oświetlenie w domu zostało zmienione");
		                if(IsPlayerInRangeOfPoint(playerid, 50.0, Dom[PlayerInfo[playerid][pDom]][hInt_X], Dom[PlayerInfo[playerid][pDom]][hInt_Y], Dom[PlayerInfo[playerid][pDom]][hInt_Z]))
		                {
		                	ShowPlayerDialogEx(playerid, 812, DIALOG_STYLE_LIST, "Wybierz oświetlenie", "Zachodzące słońce (21:00)\nMrok (0:00)\nDzień (12:00)\nWłasny tryb (godzina)", "Wybierz", "Wróć");
		                	SetPlayerTime(playerid, 12, 0);
		                }
		                else
		                {
		                    if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
						    {
								ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
							}
							else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
							{
							    ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
							}
		                }
	             	}
		            case 3: // Własna godzina
		            {
						ShowPlayerDialogEx(playerid, 813, DIALOG_STYLE_INPUT, "Oświetlenie domu", "Wpisz na godzinę ma się zmieniać czas po wejsciu do domu.\nGodziny od 7-19 są jasne a od 20 do 6 ciemne ze światłami", "Wpisz", "Wróć");
		            }
		        }
		    }
		    if(!response)
		    {
		        if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
		    	{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
		    }
		}
		if(dialogid == 813)
		{
		    if(response)
		    {
		        new godz = strval(inputtext);
		        new string[256];
		        if(godz >= 0 && godz <= 24 || PlayerInfo[playerid][pAdmin] >= 100)
		        {
					format(string, sizeof(string), "Oświetlenie domu zmienione na %d godzinę", godz);
					SendClientMessage(playerid, COLOR_NEWS, string);
					Dom[PlayerInfo[playerid][pDom]][hSwiatlo] = godz;
		   			ZapiszDom(PlayerInfo[playerid][pDom]);
		      		if(IsPlayerInRangeOfPoint(playerid, 50.0, Dom[PlayerInfo[playerid][pDom]][hInt_X], Dom[PlayerInfo[playerid][pDom]][hInt_Y], Dom[PlayerInfo[playerid][pDom]][hInt_Z]))
		        	{
		        		ShowPlayerDialogEx(playerid, 813, DIALOG_STYLE_INPUT, "Oświetlenie domu", "Wpisz na godzinę ma się zmieniać czas po wejsciu do domu.\nGodziny od 7-19 są jasne a od 20 do 6 ciemne ze światłami", "Wpisz", "Wróć");
		         		SetPlayerTime(playerid, godz, 0);
		          	}
		           	else
		            {
		            	if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
				    	{
							ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
						{
		    				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
		           	}
				}
				else
				{
	   				ShowPlayerDialogEx(playerid, 813, DIALOG_STYLE_INPUT, "Oświetlenie domu", "Wpisz na godzinę ma się zmieniać czas po wejsciu do domu.\nGodziny od 7-19 są jasne a od 20 do 6 ciemne ze światłami", "Wpisz", "Wróć");
	     			SendClientMessage(playerid, COLOR_NEWS, "Godzina oświetlenia od 0 do 24");
	      		}
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 812, DIALOG_STYLE_LIST, "Wybierz oświetlenie", "Zachodzące słońce (21:00)\nMrok (0:00)\nDzień (12:00)\nWłasny tryb (godzina)", "Wybierz", "Wróć");
		    }
		}
		if(dialogid == 814)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:// Normalny spawn
		            {
		                PlayerInfo[playerid][pSpawn] = 0;
		                SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował na swoim normalnym spawnie");
		                if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
	 					{
							ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
						{
						    ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
		                //ShowPlayerDialogEx(playerid, 814, DIALOG_STYLE_LIST, "Wybierz typ spawnu", "Normalny spawn\nSpawn przed domem\nSpawn w domu", "Wybierz", "Wróć");
		            }
		            case 1:// Spawn przed domem
		            {
		                PlayerInfo[playerid][pSpawn] = 1;
		                SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował przed domem");
		                if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
		    			{
							ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
						{
		    				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
		                //ShowPlayerDialogEx(playerid, 814, DIALOG_STYLE_LIST, "Wybierz typ spawnu", "Normalny spawn\nSpawn przed domem\nSpawn w domu", "Wybierz", "Wróć");
		            }
		            case 2:// Spawn w domu
		            {
	                    PlayerInfo[playerid][pSpawn] = 2;
	                    SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował wewnątrz domu");
	                    if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
	 					{
							ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
						{
		    				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
						}
	                    //ShowPlayerDialogEx(playerid, 814, DIALOG_STYLE_LIST, "Wybierz typ spawnu", "Normalny spawn\nSpawn przed domem\nSpawn w domu", "Wybierz", "Wróć");
		            }
				}
			}
			if(!response)
			{
				if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
	   			{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
			}
		}
		if(dialogid == 815)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        new string[256];
		        switch(listitem)
		        {
		            case 0:// Informacje ogólne
		            {
	                    new wynajem[50];
						if(Dom[dom][hWynajem] == 0)
						{
	                        wynajem = "nie wynajmuj";
						}
						else if(Dom[dom][hWynajem] == 1)
						{
	                        wynajem = "dla wszystkich";
						}
						else if(Dom[dom][hWynajem] == 2)
						{
	                        wynajem = "dla wybranych osób";
						}
						else if(Dom[dom][hWynajem] == 3)
						{
						    if(Dom[dom][hWW] == 1)
						    {
	                        	wynajem = "z warunkiem (frakcja)";
	                        }
	                        else if(Dom[dom][hWW] == 2)
	                        {
	                            wynajem = "z warunkiem (rodzina)";
	                        }
	                        else if(Dom[dom][hWW] == 3)
	                        {
	                            wynajem = "z warunkiem (level)";
	                        }
	                        else if(Dom[dom][hWW] == 4)
	                        {
	                            wynajem = "z warunkiem (konto premium)";
	                        }
						}
		                format(string, sizeof(string), "Wynajem:\t%s\nCena wynajmu:\t%d$\nIlość pokoi:\t%d\nPokoje wynajmowane:\t%d\nPokoi do wynajęcia:\t%d", wynajem, Dom[dom][hCenaWynajmu], Dom[dom][hPokoje], Dom[dom][hPW], Dom[dom][hPDW]);
		                ShowPlayerDialogEx(playerid, 816, DIALOG_STYLE_MSGBOX, "Ogólne informacje o wynajmie", string, "Wróć", "Wyjdź");
		            }
		            case 1:// Zarządzaj lokatorami
		            {
		                format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		                ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		            }
		            case 2:// Tryb wynajmu
		            {
		                ShowPlayerDialogEx(playerid, 818, DIALOG_STYLE_LIST, "Tryb wynajmu", "Brak wynajmu\nDla wszystkich\nWybrane osoby\nDla frakcji/rodziny/KP", "Wybierz", "Wróć");
		            }
		            case 3:// Cena wynajmu
		            {
		                ShowPlayerDialogEx(playerid, 824, DIALOG_STYLE_INPUT, "Cena wynajmu", "Wpisz, za ile grcze mogą wynająć u ciebie dom.\n(Cena do ustalenia tylko w przypadku wynajmowania dla wszystkich i wynajmu z warunkiem)", "Wybierz", "Wróć");
		            }
		            case 4:// Wiadomość dla wynajmujących
		            {
		                ShowPlayerDialogEx(playerid, 825, DIALOG_STYLE_INPUT, "Wiadomość dla lokatorów", "Tu możesz ustalić co będzie się wyświetlać osobą które wynajmują twój dom.", "Wybierz", "Wróć");
		            }
		            case 5:// Uprawnienia lokatorów
		            {
		                new taknie_z[10];
		                new taknie_d[10];
		                if(Dom[dom][hUL_Z] == 1)
		                {
		                    taknie_z = "tak";
		                }
		                else
		                {
		                    taknie_z = "nie";
		                }
		                if(Dom[dom][hUL_D] == 1)
		                {
		                    taknie_d = "tak";
		                }
		                else
		                {
		                    taknie_d = "nie";
		                }
		                format(string, sizeof(string), "Zamykanie i otwieranie drzwi:\t %s\nKorzystanie z dodatków:\t %s", taknie_z, taknie_d);
	                    ShowPlayerDialogEx(playerid, 8800, DIALOG_STYLE_LIST, "Uprawnienia lokatorów", string, "Zmień", "Wróć");
		            }
		        }
		    }
		    if(!response)
			{
				if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
	   			{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
			}
		}
		if(dialogid == 816)
		{
		    if(response)
			{
	            if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
	   			{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
			}
		}
		if(dialogid == 817)
		{
		    if(response)
			{
			    new dom = PlayerInfo[playerid][pDom];
			    new string[256];
			    Dom[dom][hPW] --;
			    Dom[dom][hPDW] ++;
			    switch(listitem)
			    {
					case 0:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL1]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL1] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 1:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL2]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL2] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 2:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL3]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL3] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 3:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL4]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL4] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 4:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL5]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL5] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 5:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL6]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL6] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 6:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL7]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL7] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 7:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL8]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL8] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 8:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL9]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL9] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
					case 9:
					{
					    format(string, sizeof(string), "Gracz %d został wyeksmitowany", Dom[dom][hL10]);
					    SendClientMessage(playerid, 0xFFC0CB, string);
					    new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL10] = GeT;
					    format(string, sizeof(string), "Lokator 1:\t%s\nLokator 2:\t%s\nLokator 3:\t%s\nLokator 4:\t%s\nLokator 5:\t%s\nLokator 6:\t%s\nLokator 7:\t%s\nLokator 8:\t%s\nLokator 9:\t%s\nLokator 10:\t%s\n", Dom[dom][hL1], Dom[dom][hL2], Dom[dom][hL3], Dom[dom][hL4], Dom[dom][hL5], Dom[dom][hL6], Dom[dom][hL7], Dom[dom][hL8], Dom[dom][hL9], Dom[dom][hL10]);
		       			ShowPlayerDialogEx(playerid, 817, DIALOG_STYLE_LIST, "Zarządzanie lokatorami", string, "Eksmituj", "Wróć");
		       			ZapiszDom(dom);
					}
				}
			}
		    if(!response)
			{
	  			ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			}
		}
		if(dialogid == 818)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        switch(listitem)
		        {
		            case 0:// Brak wynajmu
		            {
		                new GeT[MAX_PLAYER_NAME + 1];
	           			format(GeT, sizeof(GeT), "Brak");
						Dom[dom][hL1] = GeT;
						Dom[dom][hL2] = GeT;
						Dom[dom][hL3] = GeT;
						Dom[dom][hL4] = GeT;
						Dom[dom][hL5] = GeT;
						Dom[dom][hL6] = GeT;
						Dom[dom][hL7] = GeT;
						Dom[dom][hL8] = GeT;
						Dom[dom][hL9] = GeT;
						Dom[dom][hL10] = GeT;
					    SendClientMessage(playerid, COLOR_P@, "Nie wynajmujesz domu. Wszyscy wynajmujący zostali wyeksmitowani.");
					    Dom[dom][hWynajem] = 0;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 818, DIALOG_STYLE_LIST, "Tryb wynajmu", "Brak wynajmu\nDla wszystkich\nWybrane osoby\nDla frakcji/rodziny/KP", "Wybierz", "Wróć");
		            }
		            case 1:// Wynajem dla każdego
		            {
	                    SendClientMessage(playerid, COLOR_P@, "Teraz każdy może wynająć twój dom po wpisaniu komendy /wynajmuj pod drzwiami.");
					    Dom[dom][hWynajem] = 1;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 818, DIALOG_STYLE_LIST, "Tryb wynajmu", "Brak wynajmu\nDla wszystkich\nWybrane osoby\nDla frakcji/rodziny/KP", "Wybierz", "Wróć");
		            }
		            case 2:// Lokatorów ustala właściciel
		            {
					    SendClientMessage(playerid, COLOR_P@, "Teraz ty ustalasz kto ma wynajmować pokój komendą /dajpokoj [id].");
					    Dom[dom][hWynajem] = 2;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 818, DIALOG_STYLE_LIST, "Tryb wynajmu", "Brak wynajmu\nDla wszystkich\nWybrane osoby\nDla frakcji/rodziny/KP", "Wybierz", "Wróć");
		            }
		            case 3:// Wynajem tylko jeżeli ktoś spełnia dany warunek
		            {
	                    ShowPlayerDialogEx(playerid, 819, DIALOG_STYLE_LIST, "Warunek wynajmu", "Odpowiednia frakcja\nOdpowiednia rodzina\nOdpowiedni level\nLevel Konta Premium", "Wybierz", "Wyjdź");
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 819)
		{

		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:// Warunek wynajmu: odpowiednia frakcja
		            {
		                ShowPlayerDialogEx(playerid, 820, DIALOG_STYLE_LIST, "Warunek wynajmu - frakcja", "Policja\nFBI\nWojsko\nSAM-ERS\nLa Cosa Nostra\nYakuza\nHitman Agency\nSA News\nTaxi Corporation\nUrzędnicy\nGrove Street\nPurpz\nLatin Kings", "Wybierz", "Wróć");
		            }
		            case 1:// Warunek wynajmu: odpowiednia rodzina
		            {
		                ShowPlayerDialogEx(playerid, 821, DIALOG_STYLE_LIST, "Warunek wynajmu - rodzina", "Rodzina 1\nRodzina 2\nRodzina 3\nRodzina 4\nRodzina 5\nRodzina 6\nRodzina 7\nRodzina 8\nRodzina 9\nRodzina 10\nRodzina 11\nRodzina 12\nRodzina 13\nRodzina 14\nRodzina 15\nRodzina 16\nRodzina 17\nRodzina 18\nRodzina 19\nRodzina 20\n", "Wybierz", "Wróć");
		            }
		            case 2:// Warunek wynajmu: odpowiednio wysoki level
		            {
		                ShowPlayerDialogEx(playerid, 822, DIALOG_STYLE_INPUT, "Warunek wynajmu - level", "Wpisz od jakiego levelu będzie można wynająć twój dom", "Wybierz", "Wróć");
		            }
		            case 3:// Warunek wynajmu: odpowiednio wysoki level konta premium
		            {
		                ShowPlayerDialogEx(playerid, 823, DIALOG_STYLE_INPUT, "Warunek wynajmu - KP", "Wpisz od jakiego levelu Konta Premium będzie można wynająć twój dom", "Wybierz", "Wróć");
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 818, DIALOG_STYLE_LIST, "Tryb wynajmu", "Brak wynajmu\nDla wszystkich\nWybrane osoby\nDla frakcji/rodziny/KP", "Wybierz", "Wróć");
		    }
		}
		if(dialogid == 820)//warunek - frakcja
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        switch(listitem)
		        {
			        case 0:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji LSPD będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 1;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 1:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji FBI będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 2;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 2:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji NG będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 3;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 3:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji SAM-ERS będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 4;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 4:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji LCN będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 5;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 5:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji YKZ będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 6;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 6:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji HA będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 8;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 7:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji SAN będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 9;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 8:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji Taxi będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 10;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 9:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji DMV będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 11;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 10:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji Grove będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 12;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 11:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji Purpz będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 13;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 12:
			        {
			            SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z frakcji Latin Kings będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 1;
			    		Dom[dom][hTWW] = 14;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
				}
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 819, DIALOG_STYLE_LIST, "Warunek wynajmu", "Odpowiednia frakcja\nOdpowiednia rodzina\nOdpowiedni level\nLevel Konta Premium", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 821)//warunek - rodzina
		{
		    if(response)
		    {

		        new dom = PlayerInfo[playerid][pDom];
		        switch(listitem)
		        {
		            case 0:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 1 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 0;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 1:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 2 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 1;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 2:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 3 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 2;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 3:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 4 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 3;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 4:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 5 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 4;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 5:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 6 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 5;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 6:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 7 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 6;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 7:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 8 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 7;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 8:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 9 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 8;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 9:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 10 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 9;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 10:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 11 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 10;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 11:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 12 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 11;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 12:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 13 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 12;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 13:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 14 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 13;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 14:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 15 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 14;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 15:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 16 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 15;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 16:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 17 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 16;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 17:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 18 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 17;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 18:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 19 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 18;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
			        case 19:
		            {
		            	SendClientMessage(playerid, COLOR_P@, "Teraz tylko ludzie z Rodziny 20 będą mogli wynajmować u ciebie dom.");
			    		Dom[dom][hWynajem] = 3;
			    		Dom[dom][hWW] = 2;
			    		Dom[dom][hTWW] = 19;
					    ZapiszDom(dom);
					    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
			        }
		        }
			}
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 819, DIALOG_STYLE_LIST, "Warunek wynajmu", "Odpowiednia frakcja\nOdpowiednia rodzina\nOdpowiedni level\nLevel Konta Premium", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 822)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
				if(strval(inputtext) >= 1 && strval(inputtext) <= 100)
				{
				    new string[256];
				    format(string, sizeof(string), "Teraz tylko ludzie z levelem większym lub równym %d będą mogli wynajmować u ciebie dom.", strval(inputtext));
				    SendClientMessage(playerid, COLOR_P@, string);
		    		Dom[dom][hWynajem] = 3;
		    		Dom[dom][hWW] = 3;
		    		Dom[dom][hTWW] = strval(inputtext);
				    ZapiszDom(dom);
				    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
				}
				else
				{
				    SendClientMessage(playerid, COLOR_P@, "Level od 1 do 100.");
				    ShowPlayerDialogEx(playerid, 822, DIALOG_STYLE_INPUT, "Warunek wynajmu - level", "Wpisz od jakiego levelu będzie można wynająć twój dom", "Wybierz", "Wróć");
				}
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 819, DIALOG_STYLE_LIST, "Warunek wynajmu", "Odpowiednia frakcja\nOdpowiednia rodzina\nOdpowiedni level\nLevel Konta Premium", "Wybierz", "Wyjdź");
		    }
		}
	    if(dialogid == 823)
		{
		    if(response)
		    {
		        new string[256];
		        new dom = PlayerInfo[playerid][pDom];
				if(strval(inputtext) == 1 || strval(inputtext) == 2 || strval(inputtext) == 3)
				{
				    format(string, sizeof(string), "Teraz tylko ludzie z Kontem Premium większym lub równym %d będą mogli wynajmować u ciebie dom.", strval(inputtext));
				    SendClientMessage(playerid, COLOR_P@, string);
		    		Dom[dom][hWynajem] = 3;
		    		Dom[dom][hWW] = 4;
		    		Dom[dom][hTWW] = strval(inputtext);
				    ZapiszDom(dom);
				    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
				}
				else
				{
				    SendClientMessage(playerid, COLOR_P@, "Level KP od 1 do 3.");
				    ShowPlayerDialogEx(playerid, 823, DIALOG_STYLE_INPUT, "Warunek wynajmu - KP", "Wpisz od jakiego levelu Konta Premium będzie można wynająć twój dom", "Wybierz", "Wróć");
				}
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 819, DIALOG_STYLE_LIST, "Warunek wynajmu", "Odpowiednia frakcja\nOdpowiednia rodzina\nOdpowiedni level\nLevel Konta Premium", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 824)
		{
		    new string[256];
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
				if(strval(inputtext) >= (2500*IntInfo[Dom[dom][hDomNr]][Kategoria]) && strval(inputtext) <= 1000000 && strval(inputtext) != 0)
				{
		    		Dom[dom][hCenaWynajmu] = strval(inputtext);
				    ZapiszDom(dom);
				    format(string, sizeof(string), "Cena wynajmu ustalona na %d$", strval(inputtext));
				    SendClientMessage(playerid, COLOR_P@, string);
				    ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
				}
				else
				{
				    format(string, sizeof(string), "Cena wynajmu od %d$ do 1000000$", (2500*IntInfo[Dom[dom][hDomNr]][Kategoria]));
				    SendClientMessage(playerid, COLOR_P@, string);
				    ShowPlayerDialogEx(playerid, 824, DIALOG_STYLE_INPUT, "Cena wynajmu", "Wpisz, za ile grcze mogą wynająć u ciebie dom.\n(Cena do ustalenia tylko w przypadku wynajmowania dla wszystkich i wynajmu z warunkiem)", "Wybierz", "Wróć");
				}
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 825)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        if(strlen(inputtext) >= 1 || strlen(inputtext) <= 128)
		        {
		            new message[128];
	                format(message, sizeof(message), "%s", inputtext);
	                mysql_escape_string(message, message);
		            Dom[dom][hKomunikatWynajmu] = message;
				    ZapiszDom(dom);
				    SendClientMessage(playerid, COLOR_P@, "Komunikat wynajmu to teraz:");
				    SendClientMessage(playerid, COLOR_WHITE, inputtext);
		            ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
		        }
		        else
		        {
		            SendClientMessage(playerid, COLOR_P@, "Wiadomość może zawierać od 1 do 1000 znaków.");
		            ShowPlayerDialogEx(playerid, 825, DIALOG_STYLE_LIST, "Wiadomość dla lokatorów", "Tu możesz ustalić co będzie się wyświetlać osobą które wynajmują twój dom.", "Wybierz", "Wróć");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 826)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        new string[512];
		        switch(listitem)
		        {
		            case 0://Sejf
					{
					    new k;
					    new m;
					    //new d;
					    if(Dom[dom][hSejf] < 10)
					    {
					        k = 100000*(Dom[dom][hSejf]+1);
					        m = 5000*(Dom[dom][hSejf]+1);
					        //d = 2*(Dom[dom][hSejf]+1);
					    	format(string, sizeof(string), "Sejf - pozwala przechowywać gotówkę, materiały i narkotyki\nKażdy następny poziom sejfu pozwala przechowywać o 100 000$, 10 000 materiałów i 10 dragów obu typów więcej\nKiedy sejf osiągnie 10 poziom każdy następny będzie miał możliwość przechowywania o 1 000 000$, 100 000 materiałów i 20 dragów więcej\n\nAby kupić ten sejf musisz posiadać %d$ i %d materiałów", k, m);
						}
						else
						{
						    k = 1000000*(Dom[dom][hSejf]+1);
					        m = 5000*(Dom[dom][hSejf]+1);
					        //d = 2*(Dom[dom][hSejf]+1);
							format(string, sizeof(string), "Sejf - pozwala przechowywać gotówkę, materiały i narkotyki.\nKażdy następny poziom sejfu pozwala przechowywać o 100 000$, 10 000 materiałów i 10 dragów obu typów więcej\nKiedy sejf osiągnie 10 poziom każdy następny będzie miał możliwość przechowywania o 1 000 000$, 100 000 materiałów i 20 dragów więcej\n\nAby kupić ten sejf musisz posiadać %d$ i %d materiałów", k, m);
						}
						ShowPlayerDialogEx(playerid, 827, DIALOG_STYLE_MSGBOX, "Kupowanie sejfu", string, "KUP!", "Cofnij");
					}
					case 1://Zbrojownia
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 2://Garaż
					{
                        ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest obecnie przebudowywana.\nPrzepraszamy za utrudnienia.", "Wróć", "Wróć");
					}
					case 3://Apteczka
					{
					    if(Dom[dom][hApteczka] == 0)
					    {
	       					format(string, sizeof(string), "Apteczka - pozwala leczyć się w domu (przywraca 100 procent HP).\n\nAby ją kupić potrzebujesz 100 000$, brak choroby i 100 HP");
	                        ShowPlayerDialogEx(playerid, 830, DIALOG_STYLE_MSGBOX, "Kupowanie Apteczki", string, "KUP!", "Cofnij");
						}
						else
						{
						    SendClientMessage(playerid, COLOR_P@, "Posiadasz zakupioną apteczkę!");
		        			KupowanieDodatkow(playerid, dom);
						}
					}
					case 4://Pancerz
					{	
						new kosztpancerza = 300000;
					    if(Dom[dom][hKami] < 1)
					    {
					        format(string, sizeof(string), "Pancerz - pozwala on założyć kamizelkę kuloodporną w domu.\nMaksymalna ilość ochrony to 50!\n\nAby go kupić potrzebujesz %d$", kosztpancerza);
	                        ShowPlayerDialogEx(playerid, 831, DIALOG_STYLE_MSGBOX, "Kupowanie Pancerza", string, "KUP!", "Cofnij");
						}
						else
						{
						    SendClientMessage(playerid, COLOR_P@, "Posiadasz już zakupiony pancerz");
		        			KupowanieDodatkow(playerid, dom);
						}
					}
					case 5://Lądowisko
					{
					    ShowPlayerDialogEx(playerid, 832, DIALOG_STYLE_MSGBOX, "Kupowanie lądowiska", "Lądowisko - pozwala parkować pojazd latający nie tylko na lotnisku ale także przy swoim domu.\nPrzy 1 poziomie lądowiska, który kosztuje 10 mln, pojazd latający możesz parkować 20 metrów od domu. Każdy następny poziom kosztuje 1 000 000$ i zwiększa tą wartość o kolejne 20 metrów.", "KUP!", "Cofnij");
					}
					case 6://Alarm
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 7://Zamek
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 8://Komputer
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 9://Sprzęt RTV
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 10://Zestaw hazardzisty
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 11://Szafa
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
					case 12://Tajemnicze dodatki
					{
					    ShowPlayerDialogEx(playerid, 1231, DIALOG_STYLE_MSGBOX, "Zablokowane", "Ta opcja jest na razie w fazie produkcji", "Wróć", "Wróć");
					}
		        }
		    }
		    if(!response)
		    {
		        if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 0)
		    	{
					ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nOtwórz\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pDom]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 810, DIALOG_STYLE_LIST, "Panel Domu", "Informacje o domu\nZamknij\nWynajem\nPanel dodatków\nOświetlenie\nSpawn\nKup dodatki\nPomoc", "Wybierz", "Anuluj");
				}
		    }
		}
		if(dialogid == 1231)
		{
		    KupowanieDodatkow(playerid, PlayerInfo[playerid][pDom]);
		}
		if(dialogid == 827)//kupowanie sejfu
		{
		    new dom = PlayerInfo[playerid][pDom];
		    if(response)
		    {
		        new str3[256];
		    	if(Dom[dom][hSejf] < 10)
			    {
			        if(CountMats(playerid) >= 5000*(Dom[dom][hSejf]+1))
			        {
				        if(kaska[playerid] != 0 && kaska[playerid] >= 100000*(Dom[dom][hSejf]+1))
				        {
							new dmdm = 100000*(Dom[dom][hSejf]+1);
							new matsmats = 5000*(Dom[dom][hSejf]+1);
							//new dragdrag = 2*(Dom[dom][hSejf]+1);
							//PlayerInfo[playerid][pMats] -= matsmats;
							TakeMats(playerid, matsmats);
							//PlayerInfo[playerid][pZiolo] -= dragdrag;
							//PlayerInfo[playerid][pDrugs] -= dragdrag;
							ZabierzKase(playerid, dmdm);
							format(str3, sizeof(str3), "Kupiłeś %d level Sejfu za %d$ oraz %d matsów. Aby go użyć wpisz /sejf.", Dom[dom][hSejf], dmdm, matsmats);
							SendClientMessage(playerid, COLOR_P@, str3);
							format(str3, sizeof(str3), "Pojemność sejfu: Kasa: %d$, Materiały: %d", dmdm, matsmats*2);
							SendClientMessage(playerid, COLOR_P@, str3);
							Dom[dom][hSejf] ++;
							KupowanieDodatkow(playerid, dom);
							Log(payLog, WARNING, "%s kupił do domu %s sejf poziomu %d za %d$", GetPlayerLogName(playerid), GetHouseLogName(dom), Dom[dom][hSejf], dmdm);
	       				}
	       				else
	       				{
				    		format(str3, sizeof(str3), "%d level sejfu kosztuje %d$, a ty tyle nie masz!", Dom[dom][hSejf]+1, 100000*(Dom[dom][hSejf]+1));
							SendClientMessage(playerid, COLOR_P@, str3);
							KupowanieDodatkow(playerid, dom);
	       				}
					}
					else
					{
		  				format(str3, sizeof(str3), "Aby kupić sejf o levelu %d musisz mieć %d materiałów", Dom[dom][hSejf]+1, 5000*(Dom[dom][hSejf]+1));
						SendClientMessage(playerid, COLOR_P@, str3);
						KupowanieDodatkow(playerid, dom);
					}
			    }
			    else
			   	{
	      			if(CountMats(playerid) >= (5000*(Dom[dom][hSejf]+1)) && PlayerInfo[playerid][pLevel] >= (Dom[dom][hSejf]+1))
			       	{
				        if(kaska[playerid] != 0 && kaska[playerid] >= 1000000*((Dom[dom][hSejf]-10)+1))
				        {
	            			new dmdm = 1000000*((Dom[dom][hSejf]-10)+1);
							new matsmats = 5000*(Dom[dom][hSejf]+1);
							//new dragdrag = 2*(Dom[dom][hSejf]+1);
							TakeMats(playerid, matsmats);
							//PlayerInfo[playerid][pZiolo] -= dragdrag;
							//PlayerInfo[playerid][pDrugs] -= dragdrag;
							ZabierzKase(playerid, dmdm);
							format(str3, sizeof(str3), "Kupiłeś %d level Sejfu za %d$ oraz %d matsów. Aby go użyć wpisz /sejf.", Dom[dom][hSejf], 1000000*(Dom[dom][hSejf]-10), 5000*Dom[dom][hSejf]);
							SendClientMessage(playerid, COLOR_P@, str3);
							format(str3, sizeof(str3), "Pojemność sejfu: Kasa: %d$, Materiały: %d", dmdm, 100000*((Dom[dom][hSejf]-10)+1));
							SendClientMessage(playerid, COLOR_P@, str3);
							Dom[dom][hSejf] ++;
							KupowanieDodatkow(playerid, dom);
							Log(payLog, WARNING, "%s kupił do domu %s sejf poziomu %d za %d$", GetPlayerLogName(playerid), GetHouseLogName(dom), Dom[dom][hSejf], dmdm);
				        }
				        else
				        {
						    format(str3, sizeof(str3), "%d level sejfu kosztuje %d$, a ty tyle nie masz!", Dom[dom][hSejf]+1, 1000000*((Dom[dom][hSejf]-10)+1));
							SendClientMessage(playerid, COLOR_P@, str3);
							KupowanieDodatkow(playerid, dom);
				        }
	    			}
					else
					{
			  			format(str3, sizeof(str3), "Aby kupić sejf o levelu %d musisz mieć %d materiałów oraz %d LEVEL", Dom[dom][hSejf]+1, 5000*(Dom[dom][hSejf]+1), 2*(Dom[dom][hSejf]+1), 2*(Dom[dom][hSejf]+1), (Dom[dom][hSejf]+1));
						SendClientMessage(playerid, COLOR_P@, str3);
						KupowanieDodatkow(playerid, dom);
					}
			    }
			}
		    if(!response)
		    {
	            KupowanieDodatkow(playerid, dom);
		    }
		}
		if(dialogid == 8281)//kupowanie zbrojowni
		{
		    new dom = PlayerInfo[playerid][pDom];
		    if(response)
		    {
	    		if(PlayerInfo[playerid][pGunLic] != 0)
	      		{
			        if(kaska[playerid] != 0 && kaska[playerid] >= 1000000)
			        {
			            Dom[dom][hZbrojownia] = 1;
			            ZabierzKase(playerid, 1000000);
			            SendClientMessage(playerid, COLOR_P@, "Gratulacje, kupiłeś zbrojownie za 1 000 000$, skonfiguruj teraz co chcesz w niej przechowywać! Aby jej użyć wpisz /zbrojownia we wnętrzu swojego domu");
						DialogZbrojowni(playerid);
						Log(payLog, WARNING, "%s kupił do domu %s zbrojownie za 1000000$", GetPlayerLogName(playerid), GetHouseLogName(dom));
			        }
			        else
					{
					    SendClientMessage(playerid, COLOR_P@, "Nie masz 1 000 000$!");
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_P@, "Aby kupić zbrojownie musisz mieć pozowlenie na broń!");
				}
		    }
		    if(!response)
		    {
	            KupowanieDodatkow(playerid, dom);
		    }
		}
		if(dialogid == 8282)//kupowanie ulepszeń zbrojowni
		{
		    new dom = PlayerInfo[playerid][pDom];
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://Kastet ( 0 )
		            {
		            	ShowPlayerDialogEx(playerid, 8220, DIALOG_STYLE_MSGBOX, "Przystosowanie - Kastet", "Ten dodatek pozwala przechowywać kastet w zbrojowni.\nCena przystosowania zbrojowni do przechowywania kastetu: 1 000$", "KUP!", "Cofnij");
		            }
		            case 1://Spadochron ( 11 )
		            {
		                ShowPlayerDialogEx(playerid, 8221, DIALOG_STYLE_MSGBOX, "Przystosowanie - Spadochron", "Ten dodatek pozwala przechowywać spadochron w zbrojowni.\nCena przystosowania zbrojowni do przechowywania spadochronu: 5 000$", "KUP!", "Cofnij");
		            }
		            case 2://Sprej gaśnica i aparat ( 9 )
		            {
		                ShowPlayerDialogEx(playerid, 8222, DIALOG_STYLE_MSGBOX, "Przystosowanie - Sprej gaśnica i aparat", "Ten dodatek pozwala przechowywać sprej gaśnicę i aparat w zbrojowni.\nCena przystosowania zbrojowni do przechowywania spreju gaśnicy i aparatu: 40 000$", "KUP!", "Cofnij");
		            }
		            case 3://Wibratory kwiaty i laska ( 10 )
		            {
		                ShowPlayerDialogEx(playerid, 8223, DIALOG_STYLE_MSGBOX, "Przystosowanie - Wibratory kwiaty i laska", "Ten dodatek pozwala przechowywać wibratory kwiaty i laskę w zbrojowni.\nCena przystosowania zbrojowni do przechowywania wibratorów kwiatów i laski: 50 000$", "KUP!", "Cofnij");
		            }
		            case 4://Broń biała ( 1 )
		            {
		                ShowPlayerDialogEx(playerid, 8224, DIALOG_STYLE_MSGBOX, "Przystosowanie - Broń biała", "Ten dodatek pozwala przechowywać broń białą w zbrojowni.\nCena przystosowania zbrojowni do przechowywania broni białej: 75 000$", "KUP!", "Cofnij");
		            }
		            case 5://Pistolety ( 2 )
		            {
		                ShowPlayerDialogEx(playerid, 8225, DIALOG_STYLE_MSGBOX, "Przystosowanie - Pistolety", "Ten dodatek pozwala przechowywać pistolety w zbrojowni.\nCena przystosowania zbrojowni do przechowywania pistoletów: 250 000$", "KUP!", "Cofnij");
		            }
		            case 6://Strzelby ( 3 )
		            {
		                ShowPlayerDialogEx(playerid, 8226, DIALOG_STYLE_MSGBOX, "Przystosowanie - Strzelby", "Ten dodatek pozwala przechowywać strzelby w zbrojowni.\nCena przystosowania zbrojowni do przechowywania strzelb: 450 000$", "KUP!", "Cofnij");
		            }
		            case 7://Pistolety maszynowe ( 4 )
		            {
		                ShowPlayerDialogEx(playerid, 8227, DIALOG_STYLE_MSGBOX, "Przystosowanie - Pistolety maszynowe", "Ten dodatek pozwala przechowywać pistolety maszynowe w zbrojowni.\nCena przystosowania zbrojowni do przechowywania pistoletów maszynowych: 550 000$", "KUP!", "Cofnij");
		            }
		            case 8://Karabiny szturmowe ( 5 )
		            {
		                ShowPlayerDialogEx(playerid, 8228, DIALOG_STYLE_MSGBOX, "Przystosowanie - Karabiny szturmowe", "Ten dodatek pozwala przechowywać Karabiny szturmowe w zbrojowni.\nCena przystosowania zbrojowni do przechowywania karabinów szturmowych: 850 000$", "KUP!", "Cofnij");
		            }
		            case 9://Snajperki ( 6 )
		            {
		                ShowPlayerDialogEx(playerid, 8229, DIALOG_STYLE_MSGBOX, "Przystosowanie - Snajperki", "Ten dodatek pozwala przechowywać snajperki w zbrojowni.\nCena przystosowania zbrojowni do przechowywania snajperek: 700 000$", "KUP!", "Cofnij");
		            }
		            case 10://Broń ciężka ( 7 )
		            {
		                ShowPlayerDialogEx(playerid, 8230, DIALOG_STYLE_MSGBOX, "Przystosowanie - Broń ciężka", "Ten dodatek pozwala przechowywać Broń ciężką w zbrojowni.\nCena przystosowania zbrojowni do przechowywania broni ciężkiej: 2 000 000$", "KUP!", "Cofnij");
		            }
		            case 11://ładunki wybuchowe ( 8 )
		            {
		                ShowPlayerDialogEx(playerid, 8231, DIALOG_STYLE_MSGBOX, "Przystosowanie - ładunki wybuchowe", "Ten dodatek pozwala przechowywać ładunki wybuchowe w zbrojowni.\nCena przystosowania zbrojowni do przechowywania ładunków wybuchowych: 4 000 000$", "KUP!", "Cofnij");
		            }
		        }
		    }
		    if(!response)
		    {
	            KupowanieDodatkow(playerid, dom);
		    }
		}
		if(dialogid == 830)//kupowanie apteczki
		{
		    new dom = PlayerInfo[playerid][pDom];
		    if(response)
		    {
	            new Float:HP;
				GetPlayerHealth(playerid, HP);
	   			if(HP >= 100 && IsPlayerHealthy(playerid))
			    {
	      			if(kaska[playerid] != 0 && kaska[playerid] >= 100000)
		        	{
				        ZabierzKase(playerid, 100000);
						Dom[dom][hApteczka] = 1;
						SendClientMessage(playerid, COLOR_P@, "Kupiłeś Apteczkę za 100 000$ Aby jej użyć wpisz /apteczka");
						KupowanieDodatkow(playerid, dom);
						Log(payLog, WARNING, "%s kupił do domu %s apteczkę poziomu %d za 100000$", GetPlayerLogName(playerid), GetHouseLogName(dom), Dom[dom][hApteczka]);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_P@, "Apteczka kosztuje 100 000$ a ty tyle nie masz!");
				       	KupowanieDodatkow(playerid, dom);
					}
			    }
			    else
			    {
					SendClientMessage(playerid, COLOR_P@, "Aby kupić apteczkę potrzebujesz: 100 000$ brak choroby i 100 HP");
			        KupowanieDodatkow(playerid, dom);
			    }
		    }
		    if(!response)
		    {
	            KupowanieDodatkow(playerid, dom);
		    }
		}
		if(dialogid == 831)//kupowanie pancerza
		{
		    new dom = PlayerInfo[playerid][pDom];
		    if(response)
		    {		
				new kasapancerz = 300000;
				new str3[256];
		 		if(kaska[playerid] != 0 && kaska[playerid] >= 300000)
		    	{
				    ZabierzKase(playerid, kasapancerz);
					Dom[dom][hKami] = 1;
				    format(str3, sizeof(str3), "Kupiłeś pancerz za %d$. Aby go użyć wpisz /pancerz", kasapancerz);
					SendClientMessage(playerid, COLOR_P@, str3);
					KupowanieDodatkow(playerid, dom);
					Log(payLog, WARNING, "%s kupił do domu %s pancerz", GetPlayerLogName(playerid), GetHouseLogName(dom));
				}
				else
				{
			    		
			    	format(str3, sizeof(str3), "Nie masz tyle pieniędzy! Potrzebujesz %d$", kasapancerz);
					SendClientMessage(playerid, COLOR_P@, str3);
					KupowanieDodatkow(playerid, dom);
				}
		    }
			if(!response)
			{
	        	KupowanieDodatkow(playerid, dom);
			}
		}
	    if(dialogid == 832)//kupowanie lądowiska
		{
		    new dom = PlayerInfo[playerid][pDom];
		    if(response)
		    {
                if(Dom[dom][hLadowisko] == 0)
                {
                	if(kaska[playerid] != 0 && kaska[playerid] >= 10000000)
                	{
                	    ZabierzKase(playerid, 10000000);
						Dom[dom][hLadowisko] = 20;
						SendClientMessage(playerid, COLOR_P@, "Kupiłeś Lądowisko za 10 000 000$. Możesz teraz parkować swój pojazd latający 20 metrów od domu");
						KupowanieDodatkow(playerid, dom);
						Log(payLog, WARNING, "%s kupił do domu %s lądowisko poziomu %d za 10000000$", GetPlayerLogName(playerid), GetHouseLogName(dom), Dom[dom][hLadowisko]);
                	}
                	else
                	{
                	    SendClientMessage(playerid, COLOR_P@, "Garaż kosztuje 10 000 000$ a ty tyle nie masz!");
			       		KupowanieDodatkow(playerid, dom);
                	}
                }
                else
                {
                    if(kaska[playerid] != 0 && kaska[playerid] >= 1000000)
                	{
                	    ZabierzKase(playerid, 1000000);
						Dom[dom][hLadowisko] += 20;
						SendClientMessage(playerid, COLOR_P@, "Kupiłeś ulepszenie lądowiska za 1 000 000$. Możesz teraz parkować swój pojazd latający o 20 metrów więcej niż poprzednio.");
						KupowanieDodatkow(playerid, dom);
						Log(payLog, WARNING, "%s kupił do domu %s lądowisko poziomu %d za 1000000$", GetPlayerLogName(playerid), GetHouseLogName(dom), Dom[dom][hLadowisko]);
                	}
                	else
                	{
                	    SendClientMessage(playerid, COLOR_P@, "Garaż kosztuje 1 000 000$ a ty tyle nie masz!");
			       		KupowanieDodatkow(playerid, dom);
                	}
                }
		    }
		    if(!response)
		    {
	            KupowanieDodatkow(playerid, dom);
		    }
		}
		if(dialogid == 8000)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://Zawartość sejfu
		            {
		                new zawartosc[256];
	                 	new dom = PlayerInfo[playerid][pDomWKJ];
		                format(zawartosc, sizeof(zawartosc), "Zawartość sejfu:\n\nGotówka:\t%d$\nMateriały:\t%d kg\nMarihuana:\t%d gram\nHeroina:\t%d gram", Dom[dom][hS_kasa], Dom[dom][hS_mats], Dom[dom][hS_ziolo], Dom[dom][hS_drugs]);
		            	ShowPlayerDialogEx(playerid, 8001, DIALOG_STYLE_MSGBOX, "Sejf - zawartość", zawartosc, "Cofnij", "Wyjdź");
		            }
		            case 1://Włóż do sejfu
		            {
	            		ShowPlayerDialogEx(playerid, 8002, DIALOG_STYLE_LIST, "Sejf - włóż", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
		            }
		            case 2://wyjmij z sejfu
		            {
		                ShowPlayerDialogEx(playerid, 8003, DIALOG_STYLE_LIST, "Sejf - wyjmij", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
		            }
		            case 3://kod do sejfu
		            {
		                if(PlayerInfo[playerid][pDom] == PlayerInfo[playerid][pDomWKJ])
		                {
		                	ShowPlayerDialogEx(playerid, 8004, DIALOG_STYLE_INPUT, "Sejf - ustalanie kodu", "Wpisz kod do sejfu w okienko poniżej", "OK", "Wróć");
						}
						else
						{
						    SendClientMessage(playerid, COLOR_P@, "Tylko dla właściciela");
						    ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
						}
					}
		        }
		    }
		}
		if(dialogid == 8001)
		{
		    if(response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8002)//wkładanie
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://kasa
		            {
		                ShowPlayerDialogEx(playerid, 8005, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość gotówki chcesz włożyć do sejfu", "Włóż", "Wróć");
		            }
		            case 1://matsy
		            {
		                ShowPlayerDialogEx(playerid, 8006, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość materiałów chcesz włożyć do sejfu", "Włóż", "Wróć");
		            }
		            case 2://marycha
		            {
		                ShowPlayerDialogEx(playerid, 8008, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość heroiny chcesz włożyć do sejfu", "Włóż", "Wróć");
		                //ShowPlayerDialogEx(playerid, 8007, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość marihuany chcesz włożyć do sejfu", "Włóż", "Wróć");
		            }
		            case 3://heroina
		            {
		                ShowPlayerDialogEx(playerid, 8008, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość heroiny chcesz włożyć do sejfu", "Włóż", "Wróć");
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8003)//wyjmowanie
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://kasa
		            {
		                ShowPlayerDialogEx(playerid, 8009, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość gotówki chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            }
		            case 1://matsy
		            {
		                ShowPlayerDialogEx(playerid, 8010, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość materiałów chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            }
		            case 2://marycha
		            {
		                ShowPlayerDialogEx(playerid, 8012, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość heroiny chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		                //ShowPlayerDialogEx(playerid, 8011, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość marihuany chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            }
		            case 3://heroina
		            {
		                ShowPlayerDialogEx(playerid, 8012, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość heroiny chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
					}
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8004)//kod do sejfu
		{
		    if(response)
		    {
		        if(strlen(inputtext) >= 4 && strlen(inputtext) <= 10)
		        {
	             	new kod[64];
	                new kodplik[20];
	                format(kodplik, sizeof(kodplik), "%s", inputtext);
	                mysql_escape_string(kodplik, kodplik);
					Dom[PlayerInfo[playerid][pDom]][hKodSejf] = kodplik;
					ZapiszDom(PlayerInfo[playerid][pDom]);
					format(kod, sizeof(kod), "Kod do sejfu to teraz: %s", inputtext);
					ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
					ZapiszDom(PlayerInfo[playerid][pDom]);
				}
		        else
		        {
		            SendClientMessage(playerid, COLOR_P@, "Kod do sejfu od 4 do 10 znaków");
		            ShowPlayerDialogEx(playerid, 8004, DIALOG_STYLE_INPUT, "Sejf - ustalanie kodu", "Kod twojego sejfu nie jest ustalony - musisz go ustalić.\nAby to zrobić wpisz nowy kod do okienka poniżej. (MIN 4 MAX 10 znaków)", "OK", "");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if (dialogid == D_ZBROJOWNIA)
		{
			if(GetPVarInt(playerid, "zbrojownia-cooldown") > gettime())
				return sendErrorMessage(playerid, "Broń możesz wyjmować co 30 sekund!");
			new weapon[MAX_PLAYERS],ammo[MAX_PLAYERS];
			if(!GroupPlayerDutyPerm(playerid, PERM_POLICE)) return sendErrorMessage(playerid, "Nie jesteś na służbie grupy, która ma uprawnienia do zbrojowni!");
			new frakcja = PlayerInfo[playerid][pGrupa][OnDuty[playerid]-1];
    		new warningzbrojownia[128];
			if(response)
			{
				SetPVarInt(playerid, "zbrojownia-cooldown", gettime()+30);
				switch(listitem)
		        {
					case 0: // PARALIZATOR
					{
						new price = 250;
						if(GroupInfo[frakcja][g_Mats] >= 400)
						{
							if(kaska[playerid] >= price)
							{
								ZabierzKaseDone(playerid, price);
								weapon[playerid] = 23;
								ammo[playerid] = 34;
								Item_Add("Paralizator", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
								GroupInfo[frakcja][g_Mats] -= 400;
								GroupSave(frakcja, true);
								format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął Paralizator (silenced 9mm) ze zbrojowni!", GetNickEx(playerid));
								SendDiscordLogMessage(frakcja, warningzbrojownia);
								RunCommand(playerid, "przedmioty", "");
							}
							else
							{
								SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
						}
					}
					case 1: // EAGLE
					{
						if(GroupInfo[frakcja][g_Mats] >= 500)
						{
							new price = 500;
							if(kaska[playerid] >= price)
							{
								ZabierzKaseDone(playerid, price);
								weapon[playerid] = 24;
								ammo[playerid] = 70;
								Item_Add("Eagle", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
								GroupInfo[frakcja][g_Mats] -= 500;
								GroupSave(frakcja, true);
								format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął Eagle ze zbrojowni!", GetNickEx(playerid));
								SendDiscordLogMessage(frakcja, warningzbrojownia);
								RunCommand(playerid, "przedmioty", "");
							}
							else
							{
								SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
						}
					}
		            case 2: //SHOTGUN
		            {
						if(GroupInfo[frakcja][g_Mats] >= 500)
						{
							new price = 500;
							if(kaska[playerid] >= price)
							{
								ZabierzKaseDone(playerid, price);
								weapon[playerid] = 25;
								ammo[playerid] = 40;
								Item_Add("Shotgun", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
								GroupInfo[frakcja][g_Mats] -= 500;
								GroupSave(frakcja, true);
								format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął Shotguna ze zbrojowni!", GetNickEx(playerid));
								SendDiscordLogMessage(frakcja, warningzbrojownia);
								RunCommand(playerid, "przedmioty", "");
							}
							else
							{
								SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
						}
					}
					case 3: //MP5
					{
						if(GroupInfo[frakcja][g_Mats] >= 750)
						{
							new price = 750;
							if(kaska[playerid] >= price)
							{
								ZabierzKaseDone(playerid, price);
								weapon[playerid] = 29;
								ammo[playerid] = 400;
								Item_Add("MP5", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
								GroupInfo[frakcja][g_Mats] -= 750;
								GroupSave(frakcja, true);
								format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął MP5 ze zbrojowni!", GetNickEx(playerid));
								SendDiscordLogMessage(frakcja, warningzbrojownia);
								RunCommand(playerid, "przedmioty", "");
							}
							else
							{
								SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
						}
					}
					case 4: //M4
					{
						if(PlayerInfo[playerid][pGrupaRank][OnDuty[playerid]-1] >= 2)
						{
							if(GroupInfo[frakcja][g_Mats] >= 1000)
							{
								new price = 1500;
								if(kaska[playerid] >= price)
								{
									ZabierzKaseDone(playerid, price);
									weapon[playerid] = 31;
									ammo[playerid] = 350;
									Item_Add("M4", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
									GroupInfo[frakcja][g_Mats] -= 1000;
									GroupSave(frakcja, true);
									format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął M4 ze zbrojowni!", GetNickEx(playerid));
									SendDiscordLogMessage(frakcja, warningzbrojownia);
									RunCommand(playerid, "przedmioty", "");
								}
								else
								{
									SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie posiadasz 2 rangi!");
						}
					}
					case 5: //RIFLE
					{
						if(PlayerInfo[playerid][pGrupaRank][OnDuty[playerid]-1] >= 2)
						{
							if(GroupInfo[frakcja][g_Mats] >= 1250)
							{
								new price = 1000;
								if(kaska[playerid] >= price)
								{
									ZabierzKaseDone(playerid, price);
									weapon[playerid] = 33;
									ammo[playerid] = 35;
									Item_Add("Rifle", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
									GroupInfo[frakcja][g_Mats] -= 1250;
									GroupSave(frakcja, true);
									format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął Rifle ze zbrojowni!", GetNickEx(playerid));
									SendDiscordLogMessage(frakcja, warningzbrojownia);
									RunCommand(playerid, "przedmioty", "");
								}
								else
								{
									SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie posiadasz 2 rangi!");
						}
					}
					case 6: //SPAS12
					{	
						if(PlayerInfo[playerid][pGrupaRank][OnDuty[playerid]-1] >= 3)
						{
							if(GroupInfo[frakcja][g_Mats] >= 1350)
							{
								new price = 1250;
								if(kaska[playerid] >= price)
								{
									ZabierzKaseDone(playerid, price);
									weapon[playerid] = 27;
									ammo[playerid] = 35;
									Item_Add("SPAS12", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
									GroupInfo[frakcja][g_Mats] -= 1350;
									GroupSave(frakcja, true);
									format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął Spasa ze zbrojowni!", GetNickEx(playerid));
									SendDiscordLogMessage(frakcja, warningzbrojownia);
									RunCommand(playerid, "przedmioty", "");
								}
								else
								{
									SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie posiadasz 3 rangi!");
						}
						return 1;
					}
					case 7: //SNIPER
					{
						if(PlayerInfo[playerid][pGrupaRank][OnDuty[playerid]-1] >= 3)
						{
							if(GroupInfo[frakcja][g_Mats] >= 1400)
							{
								new price = 1500;
								if(kaska[playerid] >= price)
								{
									ZabierzKaseDone(playerid, price);
									weapon[playerid] = 34;
									ammo[playerid] = 35;
									Item_Add("Sniper Rifle", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, playerid, 1, 2);
									GroupInfo[frakcja][g_Mats] -= 1400;
									GroupSave(frakcja, true);
									format(warningzbrojownia, sizeof(warningzbrojownia), "Gracz %s wziął Sniper Rifle ze zbrojowni!", GetNickEx(playerid));
									SendDiscordLogMessage(frakcja, warningzbrojownia);
									RunCommand(playerid, "przedmioty", "");
								}
								else
								{
									SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby kupić tę broń.");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nie ma tylu matsów na tą broń w sejfie.");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Nie posiadasz 3 rangi!");
						}
						return 1;
					}
		        }
			}
		}
		if(dialogid == 8005)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	                ShowPlayerDialogEx(playerid, 8005, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość gotówki chcesz włożyć do sejfu", "Włóż", "Wróć");
		            return 1;
				}
		        new dom = PlayerInfo[playerid][pDomWKJ];
		        new string[256];
		        new maxwloz;
		        if(Dom[dom][hSejf] <= 10)
		        {
		            maxwloz = 100000*Dom[dom][hSejf];
		        }
		        else
		        {
	                maxwloz = 1000000*(Dom[dom][hSejf]-10);
		        }
		        new wkladanie = (maxwloz-Dom[dom][hS_kasa]);
		        if(strval(inputtext) >= 1 && strval(inputtext) <= wkladanie)
		        {
		            if(strval(inputtext) <= kaska[playerid] )
		            {
						new before, after;
						before = Dom[dom][hS_kasa] ;
			            Dom[dom][hS_kasa] += strval(inputtext);
						after = Dom[dom][hS_kasa];
						dini_IntSet(string, "S_kasa", Dom[dom][hS_kasa]);
			            ZabierzKaseDone(playerid, strval(inputtext));
			            format(string, sizeof(string), "Włożyłeś do sejfu %d$, znajduje się w nim teraz: %d$.", strval(inputtext), Dom[dom][hS_kasa]);
			            SendClientMessage(playerid, COLOR_P@, string);
			            ShowPlayerDialogEx(playerid, 8002, DIALOG_STYLE_LIST, "Sejf - włóż", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
			            ZapiszDom(PlayerInfo[playerid][pDom]);
						Log(payLog, WARNING, "%s włożył do sejfu w domu %s kwotę %d$. W sejfie przed: %d$, po: %d$", GetPlayerLogName(playerid), GetHouseLogName(dom), strval(inputtext), before, after);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby włożyć tyle do sejfu");
		            	ShowPlayerDialogEx(playerid, 8005, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość gotówki chcesz włożyć do sejfu", "Włóż", "Wróć");
					}
				}
		        else
		        {
		            format(string, sizeof(string), "Pojemność sejfu to %d$. Nie możesz włożyć do niego %d$ gdyż jest już w nim %d$. Maksymalna stawka jaką możesz teraz do niego włożyć to %d$", maxwloz, strval(inputtext), Dom[dom][hS_kasa], wkladanie);
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8005, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość gotówki chcesz włożyć do sejfu", "Włóż", "Wróć");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8006)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	                ShowPlayerDialogEx(playerid, 8006, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość materiałów chcesz włożyć do sejfu", "Włóż", "Wróć");
		            return 1;
				}
		        new dom = PlayerInfo[playerid][pDomWKJ];
		        new string[256];
		        new maxwloz;
		        if(Dom[dom][hSejf] <= 10)
		        {
		            maxwloz = (5000*(Dom[dom][hSejf])*2);
				}
		        else
		        {
	                maxwloz = 100000*(Dom[dom][hSejf]-10);
		        }
		        new wkladanie = (maxwloz-Dom[dom][hS_mats]);
		        if(strval(inputtext) >= 1 && strval(inputtext) <= wkladanie)
		        {
		            if(strval(inputtext) <= CountMats(playerid))
		            {
			            Dom[dom][hS_mats] += strval(inputtext);
						dini_IntSet(string, "S_mats", Dom[dom][hS_mats]);
			            //PlayerInfo[playerid][pMats] -= strval(inputtext);
						TakeMats(playerid, strval(inputtext));
			            format(string, sizeof(string), "Włożyłeś do sejfu %d matsów, znajduje się w nim teraz: %d matsów.", strval(inputtext), Dom[dom][hS_mats]);
			            SendClientMessage(playerid, COLOR_P@, string);
			            ShowPlayerDialogEx(playerid, 8002, DIALOG_STYLE_LIST, "Sejf - włóż", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
			            ZapiszDom(PlayerInfo[playerid][pDom]);
						Log(payLog, WARNING, "%s włożył do sejfu w domu %s paczkę %d materiałów", GetPlayerLogName(playerid), GetHouseLogName(dom), strval(inputtext));
					}
					else
					{
					    SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby włożyć tyle do sejfu");
		            	ShowPlayerDialogEx(playerid, 8006, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość materiałów chcesz włożyć do sejfu", "Włóż", "Wróć");
					}
				}
		        else
		        {
		            format(string, sizeof(string), "Pojemność sejfu to %d matsów. Nie możesz włożyć do niego %d matsów gdyż jest już w nim %d matsów. Maksymalna ilość jaką możesz teraz do niego włożyć to %d matsów", maxwloz, strval(inputtext), Dom[dom][hS_mats], wkladanie);
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8006, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość materiałów chcesz włożyć do sejfu", "Włóż", "Wróć");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8008)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	                ShowPlayerDialogEx(playerid, 8008, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość heroiny chcesz włożyć do sejfu", "Włóż", "Wróć");
		            return 1;
				}
		        new dom = PlayerInfo[playerid][pDomWKJ];
		        new string[256];
		        new maxwloz;
		        if(Dom[dom][hSejf] <= 10)
		        {
		            maxwloz = (2*Dom[dom][hSejf])*5;
		        }
		        else
		        {
	                maxwloz = 2*(Dom[dom][hSejf]*10);
		        }
		        new wkladanie = (maxwloz-Dom[dom][hS_drugs]);
		        if(strval(inputtext) >= 1 && strval(inputtext) <= wkladanie)
		        {
		            if(strval(inputtext) <= PlayerInfo[playerid][pDrugs])
		            {
			            Dom[dom][hS_drugs] += strval(inputtext);
			            PlayerInfo[playerid][pDrugs] -= strval(inputtext);
			            format(string, sizeof(string), "Włożyłeś do sejfu %d dragów, znajduje się w nim teraz: %d dragów.", strval(inputtext), Dom[dom][hS_drugs]);
			            SendClientMessage(playerid, COLOR_P@, string);
			            ShowPlayerDialogEx(playerid, 8002, DIALOG_STYLE_LIST, "Sejf - włóż", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
			            ZapiszDom(PlayerInfo[playerid][pDom]);
						Log(payLog, WARNING, "%s włożył do sejfu w domu %s paczkę %d narkotyków ", GetPlayerLogName(playerid), GetHouseLogName(dom), strval(inputtext));
					}
					else
					{
					    SendClientMessage(playerid, COLOR_P@, "Nie stać cię aby włożyć tyle do sejfu");
		            	ShowPlayerDialogEx(playerid, 8008, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość heroiny chcesz włożyć do sejfu", "Włóż", "Wróć");
					}
				}
		        else
		        {
		            format(string, sizeof(string), "Pojemność sejfu to %d dragów. Nie możesz włożyć do niego %d dragów gdyż jest już w nim %d dragów. Maksymalna ilość jaką możesz teraz do niego włożyć to %d dragów", maxwloz, strval(inputtext), Dom[dom][hS_drugs], wkladanie);
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8008, DIALOG_STYLE_INPUT, "Sejf - wkładanie", "Wpisz jaką ilość heroiny chcesz włożyć do sejfu", "Włóż", "Wróć");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8009)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	                ShowPlayerDialogEx(playerid, 8009, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość gotówki chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            return 1;
				}
		        new dom = PlayerInfo[playerid][pDomWKJ];
		        new string[256];
		        if(strval(inputtext) >= 1 && strval(inputtext) <= Dom[dom][hS_kasa])
		        {
		            Dom[dom][hS_kasa] -= strval(inputtext);
					dini_IntSet(string, "S_kasa", Dom[dom][hS_kasa]);
		            DajKaseDone(playerid, strval(inputtext));
		            format(string, sizeof(string), "Wyjąłeś z sejfu %d$. Jest w nim teraz %d$.", strval(inputtext), Dom[dom][hS_kasa]);
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8003, DIALOG_STYLE_LIST, "Sejf - wyjmij", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
					Log(payLog, WARNING, "%s wyjął z sejfu w domu %s kwotę %d$", GetPlayerLogName(playerid), GetHouseLogName(dom), strval(inputtext));
		        }
		        else
		        {
		            format(string, sizeof(string), "Masz w sejfie %d$. Nie możesz wyjąć z niego %d$.", Dom[dom][hS_kasa], strval(inputtext));
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8009, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość gotówki chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            ZapiszDom(PlayerInfo[playerid][pDom]);
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8010)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	                ShowPlayerDialogEx(playerid, 8010, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość materiałów chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            return 1;
				}
		        new dom = PlayerInfo[playerid][pDomWKJ];
		        new string[256];
		        if(strval(inputtext) >= 1 && strval(inputtext) <= Dom[dom][hS_mats])
		        {
		            Dom[dom][hS_mats] -= strval(inputtext);
					dini_IntSet(string, "S_mats", Dom[dom][hS_mats]);
		            Item_Add("Materiały", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_MATS, 0, 0, true, playerid, strval(inputtext), ITEM_NOT_COUNT);
		            format(string, sizeof(string), "Wyjąłeś z sejfu %d materiałów. Jest w nim teraz %d materiałów.", strval(inputtext), Dom[dom][hS_mats]);
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8003, DIALOG_STYLE_LIST, "Sejf - wyjmij", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
		            ZapiszDom(PlayerInfo[playerid][pDom]);
					Log(payLog, WARNING, "%s wyjął z sejfu w domu %s paczkę %d materiałów", GetPlayerLogName(playerid), GetHouseLogName(dom), strval(inputtext));
		        }
		        else
		        {
		            format(string, sizeof(string), "Masz w sejfie %d materiałów. Nie możesz wyjąć z niego %d materiałów.", Dom[dom][hS_mats], strval(inputtext));
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8010, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość materiałów chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8012)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	                ShowPlayerDialogEx(playerid, 8012, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość heroiny chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		            return 1;
				}
		        new dom = PlayerInfo[playerid][pDomWKJ];
		        new string[256];
		        if(strval(inputtext) >= 1 && strval(inputtext) <= Dom[dom][hS_drugs])
		        {
		            Dom[dom][hS_drugs] -= strval(inputtext);
					dini_IntSet(string, "S_drugs", Dom[dom][hS_drugs]);
		            PlayerInfo[playerid][pDrugs] += strval(inputtext);
		            format(string, sizeof(string), "Wyjąłeś z sejfu %d dragów. Jest w nim teraz %d dragów.", strval(inputtext), Dom[dom][hS_drugs]);
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8003, DIALOG_STYLE_LIST, "Sejf - wyjmij", "Gotówkę\nMateriały\nMarihuane\nHeroine", "Wybierz", "Wróć");
		            ZapiszDom(PlayerInfo[playerid][pDom]);
					Log(payLog, WARNING, "%s wyjął z sejfu w domu %s paczkę %d narkotyków", GetPlayerLogName(playerid), GetHouseLogName(dom), strval(inputtext));
		        }
		        else
		        {
		            format(string, sizeof(string), "Masz w sejfie %d heroiny. Nie możesz wyjąć z niego %d heroiny.", Dom[dom][hS_drugs], strval(inputtext));
		            SendClientMessage(playerid, COLOR_P@, string);
		            ShowPlayerDialogEx(playerid, 8012, DIALOG_STYLE_INPUT, "Sejf - wyjmowanie", "Wpisz jaką ilość heroiny chcesz wyjąć z sejfu", "Wyjmij", "Wróć");
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu\nUstal kod sejfu", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8015)
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
	         		ShowPlayerDialogEx(playerid, 8015, DIALOG_STYLE_INPUT, "Sejf - wpisz kod", "Ten sejf jest zabezpieczony kodem. Aby się do niego dostać wpisz poprawny kod w okienko poniżej", "Zatwierdź", "Wyjdź");
					return 1;
				}
				
				if(GetPVarInt(playerid, "kodVw") != GetPlayerVirtualWorld(playerid)) return 1;
				new kod[20];
				format(kod, sizeof(kod), "%s", Dom[PlayerInfo[playerid][pDomWKJ]][hKodSejf]);
				if(strcmp(kod, inputtext, true ) == 0)
				{
	                SendClientMessage(playerid, COLOR_GREEN, "KOD POPRAWNY!");
	                ShowPlayerDialogEx(playerid, 8000, DIALOG_STYLE_LIST, "Sejf", "Zawartość sejfu\nWłóż do sejfu\nWyjmij z sejfu", "Wybierz", "Anuluj");
				}
				else
				{
				    SendClientMessage(playerid, COLOR_PANICRED, "ZŁY KOD!");
				    AntyWlamSejf[playerid] ++;
				    if(AntyWlamSejf[playerid] < 5)
				    {
				    	ShowPlayerDialogEx(playerid, 8015, DIALOG_STYLE_INPUT, "Sejf - wpisz kod", "Ten sejf jest zabezpieczony kodem. Aby się do niego dostać wpisz poprawny kod w okienko poniżej", "Zatwierdź", "Wyjdź");
					}
					else
					{
					    SetTimerEx("ZlyKodUn",300000,0,"d",playerid);
					    SendClientMessage(playerid, COLOR_PANICRED, "Zbyt dużo nieudanych prób, spróbuj jeszcze raz za 5 minut!");
					    return 1;
					}
				}
			}
		}
		if(dialogid == 8800)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        switch(listitem)
		        {
		            case 0:
		            {
		                if(Dom[dom][hUL_Z] == 1)
		                {
		                    SendClientMessage(playerid, COLOR_P@, "Teraz tylko ty będziesz mógł otwierać i zamykać dom");
		                    Dom[dom][hUL_Z] = 0;
		                }
		                else
		                {
		                    SendClientMessage(playerid, COLOR_P@, "Teraz wszyscy lokatorzy będą mogli otwierać i zamykać dom");
		                    Dom[dom][hUL_Z] = 1;
		                }
		                new string[256];
		                new taknie_z[10];
		                new taknie_d[10];
		                if(Dom[dom][hUL_Z] == 1)
		                {
		                    taknie_z = "tak";
		                }
		                else
		                {
		                    taknie_z = "nie";
		                }
		                if(Dom[dom][hUL_D] == 1)
		                {
		                    taknie_d = "tak";
		                }
		                else
		                {
		                    taknie_d = "nie";
		                }
		                format(string, sizeof(string), "Zamykanie i otwieranie drzwi:\t %s\nKorzystanie z dodatków:\t %s", taknie_z, taknie_d);
	                    ShowPlayerDialogEx(playerid, 8800, DIALOG_STYLE_LIST, "Uprawnienia lokatorów", string, "Zmień", "Wróć");
		            }
		            case 1:
		            {
		                if(Dom[dom][hUL_D] == 1)
		                {
		                    SendClientMessage(playerid, COLOR_P@, "Teraz tylko ty będziesz mógł korzystać z dodatków");
		                    Dom[dom][hUL_D] = 0;
		                }
		                else
		                {
		                    SendClientMessage(playerid, COLOR_P@, "Teraz wszyscy lokatorzy będą mogli korzystać z dodatków");
		                    Dom[dom][hUL_D] = 1;
		                }
		                new string[256];
		                new taknie_z[10];
		                new taknie_d[10];
		                if(Dom[dom][hUL_Z] == 1)
		                {
		                    taknie_z = "tak";
		                }
		                else
		                {
		                    taknie_z = "nie";
		                }
		                if(Dom[dom][hUL_D] == 1)
		                {
		                    taknie_d = "tak";
		                }
		                else
		                {
		                    taknie_d = "nie";
		                }
		                format(string, sizeof(string), "Zamykanie i otwieranie drzwi:\t %s\nKorzystanie z dodatków:\t %s", taknie_z, taknie_d);
	                    ShowPlayerDialogEx(playerid, 8800, DIALOG_STYLE_LIST, "Uprawnienia lokatorów", string, "Zmień", "Wróć");
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 815, DIALOG_STYLE_LIST, "Panel wynajmu", "Informacje ogólne\nZarządzaj lokatorami\nTryb wynajmu\nCena wynajmu\nInfomacja dla lokatorów\nUprawnienia lokatorów", "Wybierz", "Wyjdź");
		    }
		}
		if(dialogid == 8810)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pWynajem];
		        switch(listitem)
		        {
		            case 0://Informacje o domu
		            {
		                new string2[512];
						new wynajem[20];
						if(Dom[dom][hWynajem] == 0)
						{
	                        wynajem = "nie";
						}
						else
						{
	                        wynajem = "tak";
						}
						new drzwi[30];
						if(Dom[dom][hZamek] == 0)
						{
	                        drzwi = "Zamknięte";
						}
						else
						{
	                        drzwi = "Otwarte";
						}
		                format(string2, sizeof(string2), "ID domu:\t%d\nID wnętrza:\t%d\nCena domu:\t%d$\nWynajem:\t%s\nIlosc pokoi:\t%d\nPokoi wynajmowanych\t%d\nCena wynajmu:\t%d$\nOświetlenie:\t%d\nDrzwi:\t%s", dom, Dom[dom][hDomNr], Dom[dom][hCena], wynajem, Dom[dom][hPokoje], Dom[dom][hPW], Dom[dom][hCenaWynajmu], Dom[dom][hSwiatlo], drzwi);
		                ShowPlayerDialogEx(playerid, 8811, DIALOG_STYLE_MSGBOX, "Główne informacje domu", string2, "Wróć", "Wyjdź");
		            }
		            case 1://Zamknij/Otwórz
		            {
		                if(Dom[dom][hUL_Z] == 1)
		                {
			                if(Dom[dom][hZamek] == 1)
			                {
								Dom[dom][hZamek] = 0;
								ShowPlayerDialogEx(playerid, 8811, DIALOG_STYLE_MSGBOX, "Zamykanie domu", "Dom został zamknięty pomyślnie", "Wróć", "Wyjdź");
							}
							else if(Dom[dom][hZamek] == 0)
							{
							    Dom[dom][hZamek] = 1;
			                	ShowPlayerDialogEx(playerid, 8811, DIALOG_STYLE_MSGBOX, "Otwieranie domu", "Dom został otworzony pomyślnie", "Wróć", "Wyjdź");
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_P@, "Właścicel domu ustalił, że nie możesz zamykać ani otwierać domu.");
		                	if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 0)
					    	{
								ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
							}
							else if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 1)
							{
				   				ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
							}
						}
		            }
		            case 2://Spawn
		            {
		                ShowPlayerDialogEx(playerid, 8812, DIALOG_STYLE_LIST, "Wybierz typ spawnu", "Normalny spawn\nSpawn przed domem\nSpawn w domu", "Wybierz", "Wróć");
		            }
		            case 3://Pomoc
		            {
		                SendClientMessage(playerid, COLOR_P@, "Już wkrótce");
		                if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 0)
				    	{
							ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 1)
						{
			   				ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
		            }
		        }
		    }
		}
		if(dialogid == 8811)
		{
		    if(response)
		    {
		        if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 0)
		    	{
					ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
				}
				else if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 1)
				{
	   				ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
				}
		    }
		}
		if(dialogid == 8812)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:// Normalny spawn
		            {
		                PlayerInfo[playerid][pSpawn] = 0;
		                SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował na swoim normalnym spawnie");
		                if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 0)
				    	{
							ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 1)
						{
			   				ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
		            }
		            case 1:// Spawn przed domem
		            {
		                PlayerInfo[playerid][pSpawn] = 1;
		                SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował przed domem");
		                if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 0)
				    	{
							ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 1)
						{
			   				ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
					}
		            case 2:// Spawn w domu
		            {
	                    PlayerInfo[playerid][pSpawn] = 2;
	                    SendClientMessage(playerid, COLOR_NEWS, "Będziesz się teraz spawnował wewnątrz domu");
	                    if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 0)
				    	{
							ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
						else if(Dom[PlayerInfo[playerid][pWynajem]][hZamek] == 1)
						{
			   				ShowPlayerDialogEx(playerid, 8810, DIALOG_STYLE_LIST, "Panel Lokatora", "Informacje o domu\nZamknij\nSpawn\nPomoc", "Wybierz", "Anuluj");
						}
					}
				}
			}
		}
		if(dialogid >= 8220 && dialogid <= 8231)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        if(dialogid == 8220)
		        {
		            if(Dom[dom][hS_PG0] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 1000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania kastetu za 1 000$!");
							ZabierzKase(playerid, 1000);
							Dom[dom][hS_PG0] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania kastetu!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8221)
		        {
		            if(Dom[dom][hS_PG11] == 0)
		            {
	                    if(kaska[playerid] >= 1 && kaska[playerid] >= 5000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania spadochronu za 5 000$!");
							ZabierzKase(playerid, 5000);
							Dom[dom][hS_PG11] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania spadochronu!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8222)
		        {
		            if(Dom[dom][hS_PG9] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 50000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania sperju, gaśnicy i kamery za 50 000$!");
							ZabierzKase(playerid, 50000);
							Dom[dom][hS_PG9] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania sperju, gaśnicy i kamery!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8223)
		        {
		            if(Dom[dom][hS_PG10] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 60000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania wibratorów, laski i kwiatów za 60 000$!");
							ZabierzKase(playerid, 60000);
							Dom[dom][hS_PG10] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania wibratorów, laski i kwiatów!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8224)
		        {
		            if(Dom[dom][hS_PG1] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 75000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania broni białej za 75 000$!");
							ZabierzKase(playerid, 75000);
							Dom[dom][hS_PG1] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania broni białej!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8225)
		        {
		            if(Dom[dom][hS_PG2] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 250000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania pistoletów za 250 000$!");
							ZabierzKase(playerid, 250000);
							Dom[dom][hS_PG2] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania pistoletów!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8226)
		        {
		            if(Dom[dom][hS_PG3] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 450000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania strzelb za 450 000$!");
							ZabierzKase(playerid, 450000);
							Dom[dom][hS_PG3] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania strzelb!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8227)
		        {
		            if(Dom[dom][hS_PG4] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 550000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania pistoletów maszynowych za 550 000$!");
							ZabierzKase(playerid, 550000);
							Dom[dom][hS_PG4] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania pistoletów maszynowych!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8228)
		        {
		            if(Dom[dom][hS_PG5] == 0)
		            {
	                    if(kaska[playerid] >= 1 && kaska[playerid] >= 850000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania karabinów szturmowych za 850 000$!");
							ZabierzKase(playerid, 850000);
							Dom[dom][hS_PG5] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania karabinów szturmowych!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8229)
		        {
		            if(Dom[dom][hS_PG6] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 700000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania snajperek za 700 000$!");
							ZabierzKase(playerid, 700000);
							Dom[dom][hS_PG6] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania snajperek!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8230)
		        {
		            if(Dom[dom][hS_PG7] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 2000000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania broni cięzkiej za 2 000 000$!");
							ZabierzKase(playerid, 2000000);
							Dom[dom][hS_PG7] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania broni cięzkiej!");
		                DialogZbrojowni(playerid);
		            }
		        }
		        if(dialogid == 8231)
		        {
		            if(Dom[dom][hS_PG8] == 0)
		            {
		                if(kaska[playerid] >= 1 && kaska[playerid] >= 4000000)
		                {
			                SendClientMessage(playerid, COLOR_NEWS, "Gratulacje, przystosowałeś swoją zbrojownie do przechowywania ładunków wybuchowych za 4 000 000$!");
							ZabierzKase(playerid, 4000000);
							Dom[dom][hS_PG8] = 1;
							DialogZbrojowni(playerid);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Nie stać cię!");
		                	DialogZbrojowni(playerid);
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GRAD3, "Przystosowałeś już swoją zbrojownie do przechowywania ładunków wybuchowych!");
		                DialogZbrojowni(playerid);
		            }
		        }
		    }
		    if(!response)
		    {
		        DialogZbrojowni(playerid);
		    }
		}
		if(dialogid == 8240)//zbrojownia
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://Wyjmij broń
		            {
		                WyjmijBron(playerid);
		            }
		            case 1://Schowaj broń
		            {
		                SchowajBron(playerid);
		            }
		            case 2://Zawartość zbrojowni
		            {
		                ListaBroni(playerid);
		            }
		        }
		    }
		}
		if(dialogid == 8241)//wyjmowanie broni
		{
		    if(response)
		    {
		     	new BronieF[13][2];
				for(new i = 0; i < 13; i++) { GetPlayerWeaponData(playerid, i, BronieF[i][0], BronieF[i][1]); }
		        switch(listitem)
		        {
		            case 0:
		            {
		                new dom = PlayerInfo[playerid][pDom];
						if(BronieF[0][0] != 0)
						{
						    IDBroniZbrojownia[playerid] = 0;
						    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", "Posiadasz już broń typu kastet, czy chcesz ją zamienić na kastet ze zbrojowni?", "Zamień", "Wróć");
						}
						else
						{
							Dom[dom][hS_G0] = 0;
							PlayerInfo[playerid][pGun0] = Dom[dom][hS_G0];
							PlayerInfo[playerid][pAmmo0] = 1;
							GivePlayerWeapon(playerid, 1, 1);
						    SendClientMessage(playerid, COLOR_NEWS, "Wyjąłeś kastet ze zbrojowni.");
	                        WyjmijBron(playerid);
						}
		            }
		            case 1:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[1][0] != 0)
						{
						    IDBroniZbrojownia[playerid] = 1;
						    format(brondef, sizeof(brondef), "Posiadasz już broń białą (%s), chcesz ją zamienić na %s?", GunNames[BronieF[1][0]], GunNames[Dom[dom][hS_G1]]);
						    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
						}
						else
						{
							Dom[dom][hS_G1] = 0;
							Dom[dom][hS_A1] = 0;
							PlayerInfo[playerid][pGun1] = Dom[dom][hS_G1];
							PlayerInfo[playerid][pAmmo1] = 1;
							GivePlayerWeapon(playerid, Dom[dom][hS_G1], 1);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G1]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 2:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[2][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun2] == Dom[dom][hS_G2])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G2]], Dom[dom][hS_A2]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 2;
							    format(brondef, sizeof(brondef), "Posiadasz już pistolet (%s), chcesz go zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[2][0]], GunNames[Dom[dom][hS_G2]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G2] = 0;
							Dom[dom][hS_A2] = 0;
							PlayerInfo[playerid][pGun2] = Dom[dom][hS_G2];
							PlayerInfo[playerid][pAmmo2] = Dom[dom][hS_A2];
							GivePlayerWeapon(playerid, Dom[dom][hS_G2], Dom[dom][hS_A2]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G2]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 3:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[3][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun3] == Dom[dom][hS_G3])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G3]], Dom[dom][hS_A3]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 3;
							    format(brondef, sizeof(brondef), "Posiadasz już strzelbę (%s), chcesz go zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[3][0]], GunNames[Dom[dom][hS_G3]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G3] = 0;
							Dom[dom][hS_A3] = 0;
	                        PlayerInfo[playerid][pGun3] = Dom[dom][hS_G3];
							PlayerInfo[playerid][pAmmo3] = Dom[dom][hS_A3];
							GivePlayerWeapon(playerid, Dom[dom][hS_G3], Dom[dom][hS_A3]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G3]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 4:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[4][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun4] == Dom[dom][hS_G4])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G4]], Dom[dom][hS_A4]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 4;
							    format(brondef, sizeof(brondef), "Posiadasz już pistolet maszynowy (%s), chcesz go zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[4][0]], GunNames[Dom[dom][hS_G4]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G4] = 0;
							Dom[dom][hS_A4] = 0;
							PlayerInfo[playerid][pGun4] = Dom[dom][hS_G4];
							PlayerInfo[playerid][pAmmo4] = Dom[dom][hS_A4];
							GivePlayerWeapon(playerid, Dom[dom][hS_G4], Dom[dom][hS_A4]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G4]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 5:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[5][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun5] == Dom[dom][hS_G5])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G5]], Dom[dom][hS_A5]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 5;
							    format(brondef, sizeof(brondef), "Posiadasz już karabin szturmowy (%s), chcesz go zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[5][0]], GunNames[Dom[dom][hS_G5]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G5] = 0;
							Dom[dom][hS_A5] = 0;
							PlayerInfo[playerid][pGun5] = Dom[dom][hS_G5];
							PlayerInfo[playerid][pAmmo5] = Dom[dom][hS_A5];
							GivePlayerWeapon(playerid, Dom[dom][hS_G5], Dom[dom][hS_A5]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G5]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 6:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[6][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun6] == Dom[dom][hS_G6])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G6]], Dom[dom][hS_A6]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 6;
							    format(brondef, sizeof(brondef), "Posiadasz już snajperkę (%s), chcesz ją zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[6][0]], GunNames[Dom[dom][hS_G6]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G6] = 0;
							Dom[dom][hS_A6] = 0;
							PlayerInfo[playerid][pGun6] = Dom[dom][hS_G6];
							PlayerInfo[playerid][pAmmo6] = Dom[dom][hS_A6];
							GivePlayerWeapon(playerid, Dom[dom][hS_G6], Dom[dom][hS_A6]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G6]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 7:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[7][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun7] == Dom[dom][hS_G7])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G7]], Dom[dom][hS_A7]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 7;
							    format(brondef, sizeof(brondef), "Posiadasz już broń ciężką (%s), chcesz ją zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[7][0]], GunNames[Dom[dom][hS_G7]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G7] = 0;
							Dom[dom][hS_A7] = 0;
							PlayerInfo[playerid][pGun7] = Dom[dom][hS_G7];
							PlayerInfo[playerid][pAmmo7] = Dom[dom][hS_A7];
							GivePlayerWeapon(playerid, Dom[dom][hS_G7], Dom[dom][hS_A7]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G7]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 8:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[8][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun8] == Dom[dom][hS_G8])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G8]], Dom[dom][hS_A8]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 8;
							    format(brondef, sizeof(brondef), "Posiadasz już ładnuek wybuchowy (%s), chcesz go zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[8][0]], GunNames[Dom[dom][hS_G8]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G8] = 0;
							Dom[dom][hS_A8] = 0;
							PlayerInfo[playerid][pGun8] = Dom[dom][hS_G8];
							PlayerInfo[playerid][pAmmo8] = Dom[dom][hS_A8];
							GivePlayerWeapon(playerid, Dom[dom][hS_G8], Dom[dom][hS_A8]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G8]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 9:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[9][0] != 0)
						{
						    if(PlayerInfo[playerid][pGun9] == Dom[dom][hS_G9])
		                    {
	                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G9]], Dom[dom][hS_A9]);
		                		ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
		                    }
		                    else
		                    {
							    IDBroniZbrojownia[playerid] = 9;
							    format(brondef, sizeof(brondef), "Posiadasz już %s, chcesz go zamienić na %s?\n(W przypadku gdy broń jest taka sama, do obecnej broni będziesz mógł dodać amunicje)", GunNames[BronieF[9][0]], GunNames[Dom[dom][hS_G9]]);
							    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
							}
						}
						else
						{
							Dom[dom][hS_G9] = 0;
							Dom[dom][hS_A9] = 0;
							PlayerInfo[playerid][pGun9] = Dom[dom][hS_G9];
							PlayerInfo[playerid][pAmmo9] = Dom[dom][hS_A9];
							GivePlayerWeapon(playerid, Dom[dom][hS_G9], Dom[dom][hS_A9]);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G9]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 10:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[10][0] != 0)
						{
						    IDBroniZbrojownia[playerid] = 10;
						    format(brondef, sizeof(brondef), "Posiadasz już %s, chcesz go zamienić na %s?", GunNames[BronieF[10][0]], GunNames[Dom[dom][hS_G10]]);
						    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
						}
						else
						{
							Dom[dom][hS_G10] = 0;
							Dom[dom][hS_A10] = 0;
							PlayerInfo[playerid][pGun10] = Dom[dom][hS_G10];
							PlayerInfo[playerid][pAmmo10] = 1;
							GivePlayerWeapon(playerid, Dom[dom][hS_G10], 1);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G10]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		            case 11:
		            {
		                new brondef[256];
		                new dom = PlayerInfo[playerid][pDom];
		                if(BronieF[11][0] != 0)
						{
						    IDBroniZbrojownia[playerid] = 11;
						    format(brondef, sizeof(brondef), "Posiadasz już %s, chcesz go zamienić na %s?", GunNames[BronieF[11][0]], GunNames[Dom[dom][hS_G11]]);
						    ShowPlayerDialogEx(playerid, 8244, DIALOG_STYLE_MSGBOX, "Wyjmowanie broni", brondef, "Zamień", "Wróć");
						}
						else
						{
							Dom[dom][hS_G11] = 0;
							Dom[dom][hS_A11] = 0;
							PlayerInfo[playerid][pGun11] = Dom[dom][hS_G11];
							PlayerInfo[playerid][pAmmo11] = 1;
							GivePlayerWeapon(playerid, Dom[dom][hS_G11], 1);
							format(brondef, sizeof(brondef), "Wyjąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G11]]);
						    SendClientMessage(playerid, COLOR_NEWS, brondef);
	                        WyjmijBron(playerid);
						}
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8240, DIALOG_STYLE_LIST, "Zbrojownia", "Wyjmij broń\nSchowaj broń\nZawartość zbrojowni", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8242)//chowanie broni
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        new brondef[512];
		        switch(listitem)
		        {
		            case 0:
		            {
		                if(Dom[dom][hS_PG0] >= 1)
		                {
			                if(Dom[dom][hS_G0] == 1)
			                {
			                    IDBroniZbrojownia[playerid] = 0;
							    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[1], GunNames[1]);
							    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
			                }
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun0]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G0] = 1;
								PlayerInfo[playerid][pGun0] = 0;
								PlayerInfo[playerid][pAmmo0] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
				            }
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania kastetu.");
						    SchowajBron(playerid);
						}
		            }
		            case 1:
		            {
		                if(Dom[dom][hS_PG1] >= 1)
		                {
		                    if(Dom[dom][hS_G1] >= 1)
			                {
			                    IDBroniZbrojownia[playerid] = 1;
							    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G1]], GunNames[PlayerInfo[playerid][pGun1]]);
							    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
			                }
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun1]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G1] = PlayerInfo[playerid][pGun1];
				    			Dom[dom][hS_A1] = 1;
								PlayerInfo[playerid][pGun1] = 0;
								PlayerInfo[playerid][pAmmo1] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania broni białej.");
						    SchowajBron(playerid);
						}
		            }
		            case 2:
		            {
		                if(Dom[dom][hS_PG2] >= 1)
		                {
			                if(Dom[dom][hS_G2] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun2] == Dom[dom][hS_G2])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G2]], PlayerInfo[playerid][pGun2]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 2;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G2]], GunNames[PlayerInfo[playerid][pGun2]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun2]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G2] = PlayerInfo[playerid][pGun2];
				    			Dom[dom][hS_A2] = PlayerInfo[playerid][pAmmo2];
								PlayerInfo[playerid][pGun2] = 0;
								PlayerInfo[playerid][pAmmo2] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania pistoletów.");
						    SchowajBron(playerid);
						}
		            }
		            case 3:
		            {
		                if(Dom[dom][hS_PG3] >= 1)
		                {
			                if(Dom[dom][hS_G3] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun3] == Dom[dom][hS_G3])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G3]], PlayerInfo[playerid][pGun3]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 3;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G3]], GunNames[PlayerInfo[playerid][pGun3]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun3]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G3] = PlayerInfo[playerid][pGun3];
				    			Dom[dom][hS_A3] = PlayerInfo[playerid][pAmmo3];
								PlayerInfo[playerid][pGun3] = 0;
								PlayerInfo[playerid][pAmmo3] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
							  	SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania strzelb.");
						    SchowajBron(playerid);
						}
		            }
		            case 4:
		            {
		                if(Dom[dom][hS_PG4] >= 1)
		                {
			                if(Dom[dom][hS_G4] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun4] == Dom[dom][hS_G4])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G4]], PlayerInfo[playerid][pGun4]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 4;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G4]], GunNames[PlayerInfo[playerid][pGun4]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun4]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G4] = PlayerInfo[playerid][pGun4];
				    			Dom[dom][hS_A4] = PlayerInfo[playerid][pAmmo4];
								PlayerInfo[playerid][pGun4] = 0;
								PlayerInfo[playerid][pAmmo4] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania pistoletów maszynowych.");
						    SchowajBron(playerid);
						}
		            }
		            case 5:
		            {
		                if(Dom[dom][hS_PG5] >= 1)
		                {
			                if(Dom[dom][hS_G5] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun5] == Dom[dom][hS_G5])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G5]], PlayerInfo[playerid][pGun5]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 5;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G5]], GunNames[PlayerInfo[playerid][pGun5]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun5]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G5] = PlayerInfo[playerid][pGun5];
				    			Dom[dom][hS_A5] = PlayerInfo[playerid][pAmmo5];
								PlayerInfo[playerid][pGun5] = 0;
								PlayerInfo[playerid][pAmmo5] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania karabinów maszynowych.");
						    SchowajBron(playerid);
						}
		            }
		            case 6:
		            {
		                if(Dom[dom][hS_PG6] >= 1)
		                {
			                if(Dom[dom][hS_G6] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun6] == Dom[dom][hS_G6])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G6]], PlayerInfo[playerid][pGun6]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 6;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G6]], GunNames[PlayerInfo[playerid][pGun6]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun6]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G6] = PlayerInfo[playerid][pGun6];
				    			Dom[dom][hS_A6] = PlayerInfo[playerid][pAmmo6];
								PlayerInfo[playerid][pGun6] = 0;
								PlayerInfo[playerid][pAmmo6] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania snajperek.");
						    SchowajBron(playerid);
						}
		            }
		            case 7:
		            {
		                if(Dom[dom][hS_PG7] >= 1)
		                {
			                if(Dom[dom][hS_G7] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun7] == Dom[dom][hS_G7])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G7]], PlayerInfo[playerid][pGun7]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 7;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G7]], GunNames[PlayerInfo[playerid][pGun7]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun7]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G7] = PlayerInfo[playerid][pGun7];
				    			Dom[dom][hS_A7] = PlayerInfo[playerid][pAmmo7];
								PlayerInfo[playerid][pGun7] = 0;
								PlayerInfo[playerid][pAmmo7] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania broni ciężkiej.");
						    SchowajBron(playerid);
						}
		            }
		            case 8:
		            {
		                if(Dom[dom][hS_PG8] >= 1)
		                {
			                if(Dom[dom][hS_G8] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun8] == Dom[dom][hS_G8])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G8]], PlayerInfo[playerid][pGun8]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 8;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G8]], GunNames[PlayerInfo[playerid][pGun8]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun8]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G8] = PlayerInfo[playerid][pGun8];
				    			Dom[dom][hS_A8] = PlayerInfo[playerid][pAmmo8];
								PlayerInfo[playerid][pGun8] = 0;
								PlayerInfo[playerid][pAmmo8] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania ładunków wybuchowych.");
						    SchowajBron(playerid);
						}
		            }
		            case 9:
		            {
		                if(Dom[dom][hS_PG9] >= 1)
		                {
			                if(Dom[dom][hS_G9] >= 1)
			                {
			                    if(PlayerInfo[playerid][pGun9] == Dom[dom][hS_G9])
			                    {
		                            format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G9]], PlayerInfo[playerid][pGun9]);
			                		ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			                    }
			                    else
			                    {
				                    IDBroniZbrojownia[playerid] = 9;
								    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G9]], GunNames[PlayerInfo[playerid][pGun9]]);
								    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
								}
							}
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun9]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G9] = PlayerInfo[playerid][pGun9];
				    			Dom[dom][hS_A9] = PlayerInfo[playerid][pAmmo9];
								PlayerInfo[playerid][pGun9] = 0;
								PlayerInfo[playerid][pAmmo9] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania spreju/gaśnicy/aparatu.");
						    SchowajBron(playerid);
						}
		            }
		            case 10:
		            {
	                    if(Dom[dom][hS_PG10] >= 1)
		                {
			                if(Dom[dom][hS_G10] >= 1)
			                {
			                    IDBroniZbrojownia[playerid] = 10;
							    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G10]], GunNames[PlayerInfo[playerid][pGun10]]);
							    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
			                }
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun10]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G10] = PlayerInfo[playerid][pGun10];
				    			Dom[dom][hS_A10] = 1;
								PlayerInfo[playerid][pGun10] = 0;
								PlayerInfo[playerid][pAmmo10] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania kwiatów/lasek/wibratorów.");
						    SchowajBron(playerid);
						}
		            }
		            case 11:
		            {
		                if(Dom[dom][hS_PG11] >= 1)
		                {
			                if(Dom[dom][hS_G11] >= 1)
			                {
			                    IDBroniZbrojownia[playerid] = 11;
							    format(brondef, sizeof(brondef), "W zbrojowni jest już %s, chcesz zamienić zawartość na %s?", GunNames[Dom[dom][hS_G11]], GunNames[PlayerInfo[playerid][pGun11]]);
							    ShowPlayerDialogEx(playerid, 8246, DIALOG_STYLE_MSGBOX, "Chowanie broni", brondef, "Zamień", "Wróć");
			                }
			                else
			                {
				                format(brondef, sizeof(brondef), "Schowałeś %s do zbrojowni", GunNames[PlayerInfo[playerid][pGun11]]);
				    			SendClientMessage(playerid, COLOR_NEWS, brondef);
				    			Dom[dom][hS_G11] = PlayerInfo[playerid][pGun11];
				    			Dom[dom][hS_A11] = 1;
								PlayerInfo[playerid][pGun11] = 0;
								PlayerInfo[playerid][pAmmo11] = 0;
				                ResetPlayerWeapons(playerid);
				                PrzywrocBron(playerid);
				                SchowajBron(playerid);
				            }
			            }
						else
						{
						    SendClientMessage(playerid, COLOR_GRAD3, "Twoja zbrojownia nie jest przystosowana do przechowywania spadochronu.");
						    SchowajBron(playerid);
						}
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8240, DIALOG_STYLE_LIST, "Zbrojownia", "Wyjmij broń\nSchowaj broń\nZawartość zbrojowni", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8243)//lista/usuwanie broni
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        switch(listitem)
		        {
		            case 0:
		            {
		                new brondef[256];
		                Dom[dom][hS_G0] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G0]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 1:
		            {
		                new brondef[256];
		                Dom[dom][hS_G1] = 0;
		                Dom[dom][hS_A1] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G1]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 2:
		            {
		                new brondef[256];
		                Dom[dom][hS_G2] = 0;
		                Dom[dom][hS_A2] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G2]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 3:
		            {
		                new brondef[256];
		                Dom[dom][hS_G3] = 0;
		                Dom[dom][hS_A3] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G3]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 4:
		            {
		                new brondef[256];
		                Dom[dom][hS_G4] = 0;
		                Dom[dom][hS_A4] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G4]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 5:
		            {
		                new brondef[256];
		                Dom[dom][hS_G5] = 0;
		                Dom[dom][hS_A5] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G5]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 6:
		            {
		                new brondef[256];
		                Dom[dom][hS_G6] = 0;
		                Dom[dom][hS_A6] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G6]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 7:
		            {
		                new brondef[256];
		                Dom[dom][hS_G7] = 0;
		                Dom[dom][hS_A7] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G7]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 8:
		            {
		                new brondef[256];
		                Dom[dom][hS_G8] = 0;
		                Dom[dom][hS_A8] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G8]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 9:
		            {
		                new brondef[256];
		                Dom[dom][hS_G9] = 0;
		                Dom[dom][hS_A9] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G9]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 10:
		            {
		                new brondef[256];
		                Dom[dom][hS_G10] = 0;
		                Dom[dom][hS_A10] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G10]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		            case 11:
		            {
		                new brondef[256];
		                Dom[dom][hS_G11] = 0;
		                Dom[dom][hS_A11] = 0;
						format(brondef, sizeof(brondef), "Usunąłeś %s ze zbrojowni", GunNames[Dom[dom][hS_G11]]);
		    			SendClientMessage(playerid, COLOR_NEWS, brondef);
	        			ListaBroni(playerid);
		            }
		        }
		    }
		    if(!response)
		    {
		        ShowPlayerDialogEx(playerid, 8240, DIALOG_STYLE_LIST, "Zbrojownia", "Wyjmij broń\nSchowaj broń\nZawartość zbrojowni", "Wybierz", "Anuluj");
		    }
		}
		if(dialogid == 8244)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        if(IDBroniZbrojownia[playerid] == 0)
		        {
		            SendClientMessage(playerid, COLOR_NEWS, "Wymieniłeś kastet na kastet");
		            Dom[dom][hS_G0] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 1)
		        {
	       			new brondef[256];
	          		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun1]], GunNames[Dom[dom][hS_G1]]);
	            	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun1] = Dom[dom][hS_G1];
	                PlayerInfo[playerid][pAmmo1] = Dom[dom][hS_A1];
	                Dom[dom][hS_G1] = 0;
	                Dom[dom][hS_A1] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 2)
		        {
	 				new brondef[256];
	          		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun2]], GunNames[Dom[dom][hS_G2]]);
	            	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun2] = Dom[dom][hS_G2];
	                PlayerInfo[playerid][pAmmo2] = Dom[dom][hS_A2];
	                Dom[dom][hS_G2] = 0;
	                Dom[dom][hS_A2] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 3)
		        {
	      			new brondef[256];
		       		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun3]], GunNames[Dom[dom][hS_G3]]);
		        	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun3] = Dom[dom][hS_G3];
	    			PlayerInfo[playerid][pAmmo3] = Dom[dom][hS_A3];
	       			Dom[dom][hS_G3] = 0;
	          		Dom[dom][hS_A3] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 4)
		        {
	      			new brondef[256];
		       		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun4]], GunNames[Dom[dom][hS_G4]]);
		        	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun4] = Dom[dom][hS_G4];
	    			PlayerInfo[playerid][pAmmo4] = Dom[dom][hS_A4];
	       			Dom[dom][hS_G4] = 0;
	          		Dom[dom][hS_A4] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 5)
		        {
	      			new brondef[256];
	       			format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun5]], GunNames[Dom[dom][hS_G5]]);
	         		SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun5] = Dom[dom][hS_G5];
	    			PlayerInfo[playerid][pAmmo5] = Dom[dom][hS_A5];
	       			Dom[dom][hS_G5] = 0;
	          		Dom[dom][hS_A5] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 6)
		        {
	      			new brondef[256];
	     			format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun6]], GunNames[Dom[dom][hS_G6]]);
		           	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun6] = Dom[dom][hS_G6];
					PlayerInfo[playerid][pAmmo6] = Dom[dom][hS_A6];
	    			Dom[dom][hS_G6] = 0;
	   				Dom[dom][hS_A6] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 7)
		        {
	      			new brondef[256];
		       		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun7]], GunNames[Dom[dom][hS_G7]]);
		        	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun7] = Dom[dom][hS_G7];
				    PlayerInfo[playerid][pAmmo7] = Dom[dom][hS_A7];
				    Dom[dom][hS_G7] = 0;
				    Dom[dom][hS_A7] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 8)
		        {
		       		new brondef[256];
	       			format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun8]], GunNames[Dom[dom][hS_G8]]);
		           	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun8] = Dom[dom][hS_G8];
	    			PlayerInfo[playerid][pAmmo8] = Dom[dom][hS_A8];
	   				Dom[dom][hS_G8] = 0;
	       			Dom[dom][hS_A8] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 9)
		        {
	      			new brondef[256];
	       			format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun9]], GunNames[Dom[dom][hS_G9]]);
	         		SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun9] = Dom[dom][hS_G9];
	    			PlayerInfo[playerid][pAmmo9] = Dom[dom][hS_A9];
	       			Dom[dom][hS_G9] = 0;
	          		Dom[dom][hS_A9] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 10)
		        {
	       			new brondef[256];
	          		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun10]], GunNames[Dom[dom][hS_G10]]);
	            	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun10] = Dom[dom][hS_G10];
	                PlayerInfo[playerid][pAmmo10] = Dom[dom][hS_A10];
	                Dom[dom][hS_G10] = 0;
	                Dom[dom][hS_A10] = 0;
		        }
		        if(IDBroniZbrojownia[playerid] == 11)
		        {
	       			new brondef[256];
	          		format(brondef, sizeof(brondef), "Wymieniłeś %s na %s", GunNames[PlayerInfo[playerid][pGun11]], GunNames[Dom[dom][hS_G11]]);
	            	SendClientMessage(playerid, COLOR_NEWS, brondef);
					PlayerInfo[playerid][pGun11] = Dom[dom][hS_G11];
	                PlayerInfo[playerid][pAmmo11] = Dom[dom][hS_A11];
	                Dom[dom][hS_G11] = 0;
	                Dom[dom][hS_A11] = 0;
		        }
	            WyjmijBron(playerid);
	            ResetPlayerWeapons(playerid);
		        PrzywrocBron(playerid);
		    }
		    if(!response)
		    {
		        IDBroniZbrojownia[playerid] = 0;
		        WyjmijBron(playerid);
		    }
		}
		if(dialogid == 8245)
		{
		    if(response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        new brondef[256];
		        if(IDBroniZbrojownia[playerid] == 2)
		        {
		   			PlayerInfo[playerid][pAmmo2] += Dom[dom][hS_A2];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun2], Dom[dom][hS_A2]);
		      		Dom[dom][hS_G2] = 0;
					Dom[dom][hS_A2] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo2], GunNames[PlayerInfo[playerid][pGun2]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 3)
		        {
		   			PlayerInfo[playerid][pAmmo3] += Dom[dom][hS_A3];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun3], Dom[dom][hS_A3]);
		      		Dom[dom][hS_G3] = 0;
					Dom[dom][hS_A3] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo3], GunNames[PlayerInfo[playerid][pGun3]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 4)
		        {
		   			PlayerInfo[playerid][pAmmo4] += Dom[dom][hS_A4];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun4], Dom[dom][hS_A4]);
		      		Dom[dom][hS_G4] = 0;
					Dom[dom][hS_A4] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo4], GunNames[PlayerInfo[playerid][pGun4]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 5)
		        {
		   			PlayerInfo[playerid][pAmmo5] += Dom[dom][hS_A5];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun5], Dom[dom][hS_A5]);
		      		Dom[dom][hS_G5] = 0;
					Dom[dom][hS_A5] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo5], GunNames[PlayerInfo[playerid][pGun5]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 6)
		        {
		   			PlayerInfo[playerid][pAmmo6] += Dom[dom][hS_A6];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun6], Dom[dom][hS_A6]);
		      		Dom[dom][hS_G6] = 0;
					Dom[dom][hS_A6] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo6], GunNames[PlayerInfo[playerid][pGun6]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 7)
		        {
		   			PlayerInfo[playerid][pAmmo7] += Dom[dom][hS_A7];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun7], Dom[dom][hS_A7]);
		      		Dom[dom][hS_G7] = 0;
					Dom[dom][hS_A7] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo7], GunNames[PlayerInfo[playerid][pGun7]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 8)
		        {
		   			PlayerInfo[playerid][pAmmo8] += Dom[dom][hS_A8];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun8], Dom[dom][hS_A8]);
		      		Dom[dom][hS_G8] = 0;
					Dom[dom][hS_A8] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo8], GunNames[PlayerInfo[playerid][pGun8]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 9)
		        {
		   			PlayerInfo[playerid][pAmmo9] += Dom[dom][hS_A9];
		      		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun9], Dom[dom][hS_A9]);
		      		Dom[dom][hS_G9] = 0;
					Dom[dom][hS_A9] = 0;
		            format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo9], GunNames[PlayerInfo[playerid][pGun9]]);
		            SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				WyjmijBron(playerid);
			}
		    if(!response)
		    {
		        new dom = PlayerInfo[playerid][pDom];
		        if(strlen(inputtext) >= 1 && strlen(inputtext) <= 6 && strval(inputtext) >= 1 && strval(inputtext) <= 100000)
		        {
		            new brondef[512];
		            if(IDBroniZbrojownia[playerid] == 2)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A2])
			            {
			                Dom[dom][hS_A2] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo2] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun2], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo2], GunNames[PlayerInfo[playerid][pGun2]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G2]], Dom[dom][hS_A2]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 3)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A3])
			            {
			                Dom[dom][hS_A3] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo3] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun3], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo3], GunNames[PlayerInfo[playerid][pGun3]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G3]], Dom[dom][hS_A3]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 4)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A4])
			            {
			                Dom[dom][hS_A4] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo4] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun4], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo4], GunNames[PlayerInfo[playerid][pGun4]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G4]], Dom[dom][hS_A4]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 5)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A5])
			            {
			                Dom[dom][hS_A5] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo5] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun5], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo5], GunNames[PlayerInfo[playerid][pGun5]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G5]], Dom[dom][hS_A5]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 6)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A6])
			            {
			                Dom[dom][hS_A6] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo6] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun6], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo6], GunNames[PlayerInfo[playerid][pGun6]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G6]], Dom[dom][hS_A6]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 7)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A7])
			            {
			                Dom[dom][hS_A7] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo7] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun7], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo7], GunNames[PlayerInfo[playerid][pGun7]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G7]], Dom[dom][hS_A7]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 8)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A8])
			            {
			                Dom[dom][hS_A8] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo8] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun8], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo8], GunNames[PlayerInfo[playerid][pGun8]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G8]], Dom[dom][hS_A8]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 9)
			        {
			            if(strval(inputtext) < Dom[dom][hS_A9])
			            {
			                Dom[dom][hS_A9] -= strval(inputtext);
			                PlayerInfo[playerid][pAmmo9] += strval(inputtext);
			                GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun9], strval(inputtext));
			                format(brondef, sizeof(brondef), "Masz teraz %d naboi w swoim %s", PlayerInfo[playerid][pAmmo9], GunNames[PlayerInfo[playerid][pGun9]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz tyle naboi w zbrojowni lub próbujesz wziąść wszystkie. Aby wziąśc wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G9]], Dom[dom][hS_A9]);
			                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        WyjmijBron(playerid);
		        }
		        else
		        {
		            SendClientMessage(playerid, COLOR_NEWS, "Ilość naboi od 1 do 100 000");
		         	if(IDBroniZbrojownia[playerid] == 2)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G2]], Dom[dom][hS_A2]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
		            }
			        if(IDBroniZbrojownia[playerid] == 3)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G3]], Dom[dom][hS_A3]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
		        	}
			        if(IDBroniZbrojownia[playerid] == 4)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G4]], Dom[dom][hS_A4]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
			        }
			        if(IDBroniZbrojownia[playerid] == 5)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G5]], Dom[dom][hS_A5]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
			        }
			        if(IDBroniZbrojownia[playerid] == 6)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G6]], Dom[dom][hS_A6]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
			        }
			        if(IDBroniZbrojownia[playerid] == 7)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G7]], Dom[dom][hS_A7]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
			        }
			        if(IDBroniZbrojownia[playerid] == 8)
		        	{
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G8]], Dom[dom][hS_A8]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
		            	return 1;
			        }
			        if(IDBroniZbrojownia[playerid] == 9)
			        {
		                new info[512];
						format(info, sizeof(info), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz wyjąć całą broń z nabojami lub wyjąć określoną ilość naboi.\nJeżeli chcesz wyjąć naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G9]], Dom[dom][hS_A9]);
		                ShowPlayerDialogEx(playerid, 8245, DIALOG_STYLE_INPUT, "Wyjmowanie amunicji", info, "Wszystko", "Naboje");
						return 1;
					}
		        }
		    }
		}
		if(dialogid == 8246)
		{
		    if(response)
		    {
		        new brondef[256];
		        new dom = PlayerInfo[playerid][pDom];
		        if(IDBroniZbrojownia[playerid] == 0)
		        {
		            Dom[dom][hS_G0] = 1;
	          		PlayerInfo[playerid][pGun0] = 0;
	    			PlayerInfo[playerid][pAmmo0] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s", GunNames[1]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 1)
		        {
		            Dom[dom][hS_G1] = PlayerInfo[playerid][pGun1];
	          		Dom[dom][hS_A1] = 1;
	          		PlayerInfo[playerid][pGun1] = 0;
	    			PlayerInfo[playerid][pAmmo1] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s", GunNames[Dom[dom][hS_G1]]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
		        if(IDBroniZbrojownia[playerid] == 2)
		        {
		            Dom[dom][hS_G2] = PlayerInfo[playerid][pGun2];
	          		Dom[dom][hS_A2] = PlayerInfo[playerid][pAmmo2];
	          		PlayerInfo[playerid][pGun2] = 0;
	    			PlayerInfo[playerid][pAmmo2] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G2]], Dom[dom][hS_A2]);
				}
				if(IDBroniZbrojownia[playerid] == 3)
		        {
		            Dom[dom][hS_G3] = PlayerInfo[playerid][pGun3];
	          		Dom[dom][hS_A3] = PlayerInfo[playerid][pAmmo3];
	          		PlayerInfo[playerid][pGun3] = 0;
	    			PlayerInfo[playerid][pAmmo3] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G3]], Dom[dom][hS_A3]);
				}
				if(IDBroniZbrojownia[playerid] == 4)
		        {
		            Dom[dom][hS_G4] = PlayerInfo[playerid][pGun4];
	          		Dom[dom][hS_A4] = PlayerInfo[playerid][pAmmo4];
	          		PlayerInfo[playerid][pGun4] = 0;
	    			PlayerInfo[playerid][pAmmo4] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G4]], Dom[dom][hS_A4]);
				}
				if(IDBroniZbrojownia[playerid] == 5)
		        {
		            Dom[dom][hS_G5] = PlayerInfo[playerid][pGun5];
	          		Dom[dom][hS_A5] = PlayerInfo[playerid][pAmmo5];
	          		PlayerInfo[playerid][pGun5] = 0;
	    			PlayerInfo[playerid][pAmmo5] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G5]], Dom[dom][hS_A5]);
				}
				if(IDBroniZbrojownia[playerid] == 6)
		        {
		            Dom[dom][hS_G6] = PlayerInfo[playerid][pGun6];
	          		Dom[dom][hS_A6] = PlayerInfo[playerid][pAmmo6];
	          		PlayerInfo[playerid][pGun6] = 0;
	    			PlayerInfo[playerid][pAmmo6] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G6]], Dom[dom][hS_A6]);
				}
				if(IDBroniZbrojownia[playerid] == 7)
		        {
		            Dom[dom][hS_G7] = PlayerInfo[playerid][pGun7];
	          		Dom[dom][hS_A7] = PlayerInfo[playerid][pAmmo7];
	          		PlayerInfo[playerid][pGun7] = 0;
	    			PlayerInfo[playerid][pAmmo7] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G7]], Dom[dom][hS_A7]);
				}
				if(IDBroniZbrojownia[playerid] == 8)
		        {
		            Dom[dom][hS_G8] = PlayerInfo[playerid][pGun8];
	          		Dom[dom][hS_A8] = PlayerInfo[playerid][pAmmo8];
	          		PlayerInfo[playerid][pGun8] = 0;
	    			PlayerInfo[playerid][pAmmo8] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G8]], Dom[dom][hS_A8]);
				}
				if(IDBroniZbrojownia[playerid] == 9)
		        {
		            Dom[dom][hS_G9] = PlayerInfo[playerid][pGun9];
	          		Dom[dom][hS_A9] = PlayerInfo[playerid][pAmmo9];
	          		PlayerInfo[playerid][pGun9] = 0;
	    			PlayerInfo[playerid][pAmmo9] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G9]], Dom[dom][hS_A9]);
				}
				if(IDBroniZbrojownia[playerid] == 10)
		        {
		            Dom[dom][hS_G10] = PlayerInfo[playerid][pGun10];
	          		Dom[dom][hS_A10] = 1;
	          		PlayerInfo[playerid][pGun10] = 0;
	    			PlayerInfo[playerid][pAmmo10] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s", GunNames[Dom[dom][hS_G10]]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				if(IDBroniZbrojownia[playerid] == 11)
		        {
		            Dom[dom][hS_G11] = PlayerInfo[playerid][pGun11];
	          		Dom[dom][hS_A11] = 1;
	          		PlayerInfo[playerid][pGun11] = 0;
	    			PlayerInfo[playerid][pAmmo11] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s", GunNames[Dom[dom][hS_G11]]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
				}
				ResetPlayerWeapons(playerid);
				PrzywrocBron(playerid);
	            SchowajBron(playerid);
			}
			if(!response)
			{
			    SchowajBron(playerid);
			}
		}
		if(dialogid == 6968){
			new string[1024], string2[1024], dowod[64], prawko[64], lotka[64], lodka[64], wedka[64], bronie[64];
			if (response){

				new offset = (HUDShown[playerid] == 0) ? 2 : 0; //jak hud off to zwiekszyc trzeba index o 2, bo sie pierdolom potem

				if(listitem == 11) {
					if(PlayerInfo[playerid][pWarns] > 0) ShowPlayerWarns(playerid, PlayerInfo[playerid][pUID], 1);
				}
				if(listitem == 13 + offset){
				if(PlayerInfo[playerid][pDowod] == 1)
					strins(dowod, "{428a42}Posiadany", 0, sizeof(dowod));
				if(PlayerInfo[playerid][pDowod] == 0)
					strins(dowod, "{cc6666}Nie posiadany", 0, sizeof(dowod));
				if(PlayerInfo[playerid][pCarLic] == 1)
					strins(prawko, "{428a42}Posiadane", 0, sizeof(prawko));
				if(PlayerInfo[playerid][pCarLic] == 0)
					strins(prawko, "{cc6666}Nie posiadane", 0, sizeof(prawko));
				if(PlayerInfo[playerid][pFlyLic] == 1)
					strins(lotka, "{428a42}Posiadane", 0, sizeof(lotka));
				if(PlayerInfo[playerid][pFlyLic] == 0)
					strins(lotka, "{cc6666}Nie posiadane", 0, sizeof(lotka));
				if(PlayerInfo[playerid][pBoatLic] == 1)
					strins(lodka, "{428a42}Posiadane", 0, sizeof(lodka));
				if(PlayerInfo[playerid][pBoatLic] == 0)
					strins(lodka, "{cc6666}Nie posiadane", 0, sizeof(lodka));
				if(PlayerInfo[playerid][pFishLic] == 1)
					strins(wedka, "{428a42}Posiadane", 0, sizeof(wedka));
				if(PlayerInfo[playerid][pFishLic] == 0)
					strins(wedka, "{cc6666}Nie posiadane", 0, sizeof(wedka));
				if(PlayerInfo[playerid][pGunLic] == 1)
					strins(bronie, "{428a42}Posiadane", 0, sizeof(bronie));
				if(PlayerInfo[playerid][pGunLic] == 0)
					strins(bronie, "{cc6666}Nie posiadane", 0, sizeof(bronie));

				format(string, sizeof(string),
					"{d9d9d9}Dowód osobisty:\t%s\n{d9d9d9}Prawo jazdy:\t\t%s\n{d9d9d9}Licencja lotnicza:\t%s\n{d9d9d9}Licencja na łódki:\t%s\n{d9d9d9}Karta wędkarska:\t%s\n{d9d9d9}Licencja na broń:\t%s",
					dowod,
					prawko,
					lotka,
					lodka,
					wedka,
					bronie);
				ShowPlayerDialogEx(playerid, DIALOG_STATS_DOKUMENTY, DIALOG_STYLE_LIST, "Lista dokumentów", string, "Zamknij", "Zamknij");
				}

				if (listitem == 14 + offset)
				{
					DynamicGui_Init(playerid);
					for(new i = 0; i < MAX_PLAYER_TATTOO; i++)
					{
						if(!PlayerTattoo[playerid][i][t_UID]) continue;
						format(string2, sizeof(string2), "%s\nTatuaż %d", string2, i+1);
						DynamicGui_AddRow(playerid, i);
					}
					if(isnull(string2)) return sendErrorMessage(playerid, "Nie posiadasz żadnych tatuaży!");	
					ShowPlayerDialogEx(playerid, 5858, DIALOG_STYLE_LIST, "Lista tatuaży", string2, "Usuń", "Zamknij");
				}
				if (listitem == 15 + offset){
					format(string2, sizeof(string2),
						"{d9d9d9}Ślub:\t\t\t%s\n{d9d9d9}NrLotto:\t\t%d\n{d9d9d9}Punkty karne:\t\t%d\n{d9d9d9}Ilość złowionych ryb:\t%d\n{d9d9d9}Największa ryba:\t%d\n{d9d9d9}Przestępstwa:\t\t%d\n{d9d9d9}W pace:\t\t%d\n{d9d9d9}Zabójstwa:\t\t%d\n{d9d9d9}Śmierci:\t\t%d\n{d9d9d9}Poziom poszukiwania:\t%d\n{d9d9d9}Apteczki:\t\t%d\n{d9d9d9}Zestawy:\t\t%d\n{d9d9d9}Mrucznik Coins:\t%d",
						PlayerInfo[playerid][pMarriedTo],
						PlayerInfo[playerid][pLottoNr],
						PlayerInfo[playerid][pPK],
						PlayerInfo[playerid][pFishes],
						PlayerInfo[playerid][pBiggestFish],
						PlayerInfo[playerid][pCrimes],
						PlayerInfo[playerid][pArrested],
						PlayerInfo[playerid][pKills],
						PlayerInfo[playerid][pDeaths],
						PoziomPoszukiwania[playerid],
						PlayerInfo[playerid][pHealthPacks],
						PlayerInfo[playerid][pFixKit],
						PremiumInfo[playerid][pMC]
						);
					ShowPlayerDialogEx(playerid, DIALOG_STATS_STATYSTYKI, DIALOG_STYLE_LIST, "Statystyki postaci", string2, "Zamknij", "");
				}
				if (listitem == 16 + offset){
					PokazStatyDialogSkille(playerid);
				}
				if(listitem == 17 + offset)
				{
					PokazStatyDialogBronie(playerid);
				}
			}
			if(!response){
				//PokazStatyDialog(playerid);
			}
		}
		if(dialogid == 5858)
		{
			if(!response) return 1;
			new id = DynamicGui_GetValue(playerid, listitem);
			Tattoo_Delete(playerid, id);
		}
		if(dialogid == 5666){
			if(response){
				new string[256];
				new suppid = strval(inputtext);
				if(suppid > 0){
				suppInfo[playerid][suppIDForAdmin] = suppid;
				format(string, sizeof(string), "{FF0000}**ZGŁOSZENIE - SUPPORT**\n{37AC45}Zgłaszający: {d9d9d9}%s(%d)\n\n{37AC45}Powód: {d9d9d9}%s\n\nAby usunąć dane zgłoszenie, użyj komendy /supportusun [supid] [powod]", suppList[suppid][suppOwner], GetPlayerIDFromName(suppList[suppid][suppOwner]),suppList[ suppid ][ suppQuestion ]);
				ShowPlayerDialogEx(playerid, DIALOG_SUPPORT_SZCZEGOLY, DIALOG_STYLE_MSGBOX, "{d9d9d9}Informacje o zgłoszeniu", string, "Akceptuj", "Wyjdź");
				}
			}
			if(!response){

			}

		}
		if(dialogid == 5665){
			if(response){
				new string[256];
				new suppid = suppInfo[playerid][suppIDForAdmin];
				
				SetPVarInt(playerid, "validticket", 1);
				format(string, 64, "SUPPORT: %s oferuje Ci pomoc, skorzystaj z tego!", GetNick(playerid));
				SendClientMessage(GetPlayerIDFromName(suppList[suppid][suppOwner]), COLOR_YELLOW, string);
				format(string, 128, "SUPPORT: Pomagasz teraz %s.", GetNick(GetPlayerIDFromName(suppList[suppid][suppOwner])));
				SendClientMessage(playerid, COLOR_YELLOW, string);	

				//new Float:x, Float:y, Float:z;
				//GetPlayerPos(playerid, Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2]);
				//Unspec[playerid][sPint] = GetPlayerInterior(playerid);
				//Unspec[playerid][sPvw] = GetPlayerVirtualWorld(playerid);

				//GetPlayerPos(GetPlayerIDFromName(suppList[suppid][suppOwner]), x, y, z);
				//SetPlayerPos(playerid, x, y, z);
				//SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(GetPlayerIDFromName(suppList[suppid][suppOwner])));
				//SetPlayerInterior(playerid, GetPlayerInterior(GetPlayerIDFromName(suppList[suppid][suppOwner])));
				//Wchodzenie(playerid);
				//Wchodzenie(GetPlayerIDFromName(suppList[suppid][suppOwner]));
				SetPVarInt(GetPlayerIDFromName(suppList[suppid][suppOwner]), "active_ticket", 0);

				if(GetPVarInt(playerid, "dutyadmin") == 1)
				{
					iloscZapytaj[playerid] = iloscZapytaj[playerid]+1;
				}

				suppList[suppid][suppOwner] = 0;
				suppList[suppid][suppID] = -1;
				suppList[suppid][suppQuestion] = 0;
				suppList[suppid][suppSend] = false;
				suppid = 0;
			}
			if(!response){
				suppInfo[playerid][suppIDForAdmin] = 0;
			}
		}
		if(dialogid == 5668){
			if(response){
				new string[256];
				new repid = strval(inputtext);
				if(repid > 0){
				repInfo[playerid][repIDForAdmin] = repid;
				format(string, sizeof(string), "{FF0000}**ZGŁOSZENIE - REPORT**\n{37AC45}Zgłaszający: {d9d9d9}%s(%d)\n{37AC45}Zgłaszany: {d9d9d9}%s(%d)\n\n{37AC45}Powód: {d9d9d9}%s", repList[repid][repOwner], GetPlayerIDFromName(repList[repid][repOwner]), repList[repid][reported], GetPlayerIDFromName(repList[repid][reported]),repList[ repid ][ repQuestion ]);
				ShowPlayerDialogEx(playerid, DIALOG_REPORT_SZCZEGOLY, DIALOG_STYLE_MSGBOX, "{d9d9d9}Informacje o zgłoszeniu", string, "Akceptuj", "Wyjdź");
				}
			}
			if(!response){

			}
		}
		if(dialogid == 5667){
			if(response){
				new string[256];
				new reppid = repInfo[playerid][repIDForAdmin];
				format(string, sizeof(string), "Admin %s przyjął twoje zgłoszenie!", GetNick(playerid));
				SendClientMessage(GetPlayerIDFromName(repList[reppid][repOwner]), COLOR_NEWS, string);

				repList[reppid][repOwner] = 0;
				repList[reppid][reported] = 0;
				repList[reppid][repID] = -1;
				repList[reppid][repQuestion] = 0;
				repList[reppid][repSend] = false;
				reppid = 0;
			}
			if(!response){
				repInfo[playerid][repIDForAdmin] = 0;
			}
		}
		if(dialogid == 8247)
		{
			if(response)
			{
			    new dom = PlayerInfo[playerid][pDom];
			    new brondef[256];
			    if(IDBroniZbrojownia[playerid] == 2)
		        {
	          		Dom[dom][hS_A2] += PlayerInfo[playerid][pAmmo2];
	          		PlayerInfo[playerid][pGun2] = 0;
	    			PlayerInfo[playerid][pAmmo2] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G2]], Dom[dom][hS_A2]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 3)
		        {
	          		Dom[dom][hS_A3] += PlayerInfo[playerid][pAmmo3];
	          		PlayerInfo[playerid][pGun3] = 0;
	    			PlayerInfo[playerid][pAmmo3] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G3]], Dom[dom][hS_A3]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 4)
		        {
	          		Dom[dom][hS_A4] += PlayerInfo[playerid][pAmmo4];
	          		PlayerInfo[playerid][pGun4] = 0;
	    			PlayerInfo[playerid][pAmmo4] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G4]], Dom[dom][hS_A4]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 5)
		        {
	          		Dom[dom][hS_A5] += PlayerInfo[playerid][pAmmo5];
	          		PlayerInfo[playerid][pGun5] = 0;
	    			PlayerInfo[playerid][pAmmo5] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G5]], Dom[dom][hS_A5]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 6)
		        {
	          		Dom[dom][hS_A6] += PlayerInfo[playerid][pAmmo6];
	          		PlayerInfo[playerid][pGun6] = 0;
	    			PlayerInfo[playerid][pAmmo6] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G6]], Dom[dom][hS_A6]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 7)
		        {
	          		Dom[dom][hS_A7] += PlayerInfo[playerid][pAmmo7];
	          		PlayerInfo[playerid][pGun7] = 0;
	    			PlayerInfo[playerid][pAmmo7] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G7]], Dom[dom][hS_A7]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 8)
		        {
	          		Dom[dom][hS_A8] += PlayerInfo[playerid][pAmmo8];
	          		PlayerInfo[playerid][pGun8] = 0;
	    			PlayerInfo[playerid][pAmmo8] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G8]], Dom[dom][hS_A8]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        if(IDBroniZbrojownia[playerid] == 9)
		        {
	          		Dom[dom][hS_A9] += PlayerInfo[playerid][pAmmo9];
	          		PlayerInfo[playerid][pGun9] = 0;
	    			PlayerInfo[playerid][pAmmo9] = 0;
			       	format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %s z %d nabojami", GunNames[Dom[dom][hS_G9]], Dom[dom][hS_A9]);
					SendClientMessage(playerid, COLOR_NEWS, brondef);
		        }
		        ResetPlayerWeapons(playerid);
				PrzywrocBron(playerid);
	            SchowajBron(playerid);
			}
			if(!response)
			{
	            new dom = PlayerInfo[playerid][pDom];
		        if(strlen(inputtext) >= 1 && strlen(inputtext) <= 6 && strval(inputtext) >= 1 && strval(inputtext) <= 100000)
		        {
		            new brondef[512];
		            if(IDBroniZbrojownia[playerid] == 2)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo2])
			            {
			                PlayerInfo[playerid][pAmmo2] -= strval(inputtext);
			                Dom[dom][hS_A2] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A2], GunNames[Dom[dom][hS_G2]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G2]], PlayerInfo[playerid][pGun2]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 3)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo3])
			            {
			                PlayerInfo[playerid][pAmmo3] -= strval(inputtext);
			                Dom[dom][hS_A3] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A3], GunNames[Dom[dom][hS_G3]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G3]], PlayerInfo[playerid][pGun3]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 4)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo4])
			            {
			                PlayerInfo[playerid][pAmmo4] -= strval(inputtext);
			                Dom[dom][hS_A4] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A4], GunNames[Dom[dom][hS_G4]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G4]], PlayerInfo[playerid][pGun4]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 5)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo5])
			            {
			                PlayerInfo[playerid][pAmmo5] -= strval(inputtext);
			                Dom[dom][hS_A5] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A5], GunNames[Dom[dom][hS_G5]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G5]], PlayerInfo[playerid][pGun5]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 6)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo6])
			            {
			                PlayerInfo[playerid][pAmmo6] -= strval(inputtext);
			                Dom[dom][hS_A6] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A6], GunNames[Dom[dom][hS_G6]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G6]], PlayerInfo[playerid][pGun6]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 7)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo7])
			            {
			                PlayerInfo[playerid][pAmmo7] -= strval(inputtext);
			                Dom[dom][hS_A7] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A7], GunNames[Dom[dom][hS_G7]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G7]], PlayerInfo[playerid][pGun7]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 8)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo8])
			            {
			                PlayerInfo[playerid][pAmmo8] -= strval(inputtext);
			                Dom[dom][hS_A8] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A8], GunNames[Dom[dom][hS_G8]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G8]], PlayerInfo[playerid][pGun8]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        if(IDBroniZbrojownia[playerid] == 9)
			        {
	                    if(strval(inputtext) < PlayerInfo[playerid][pAmmo9])
			            {
			                PlayerInfo[playerid][pAmmo9] -= strval(inputtext);
			                Dom[dom][hS_A9] += strval(inputtext);
			                format(brondef, sizeof(brondef), "W zbrojowni znajduje się teraz %d naboi do %s", Dom[dom][hS_A9], GunNames[Dom[dom][hS_G9]]);
	            			SendClientMessage(playerid, COLOR_NEWS, brondef);
			            }
			            else
			            {
			                SendClientMessage(playerid, COLOR_NEWS, "Nie masz przy sobie tyle naboi lub próbujesz schować wszystkie. Aby schować wszystkie naboje kliknij 'Wszystko'");
							format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G9]], PlayerInfo[playerid][pGun9]);
	   						ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
			            	return 1;
			            }
			        }
			        ResetPlayerWeapons(playerid);
					PrzywrocBron(playerid);
		            SchowajBron(playerid);
				}
				else
				{
				    new brondef[512];
				    if(IDBroniZbrojownia[playerid] == 2)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G2]], PlayerInfo[playerid][pGun2]);
				    }
				    if(IDBroniZbrojownia[playerid] == 3)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G3]], PlayerInfo[playerid][pGun3]);
				    }
				    if(IDBroniZbrojownia[playerid] == 4)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G4]], PlayerInfo[playerid][pGun4]);
				    }
				    if(IDBroniZbrojownia[playerid] == 5)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G5]], PlayerInfo[playerid][pGun5]);
				    }
				    if(IDBroniZbrojownia[playerid] == 6)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G6]], PlayerInfo[playerid][pGun6]);
				    }
				    if(IDBroniZbrojownia[playerid] == 7)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G7]], PlayerInfo[playerid][pGun7]);
				    }
				    if(IDBroniZbrojownia[playerid] == 8)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G8]], PlayerInfo[playerid][pGun8]);
				    }
				    if(IDBroniZbrojownia[playerid] == 9)
				    {
				    	format(brondef, sizeof(brondef), "Masz tą samą broń przy sobie i w zbrojowni.\nMożesz schować całą broń z nabojami lub schować określoną ilość naboi.\nJeżeli chcesz schować tylko naboje, wpisz ilość poniżej i kliknij 'Naboje'\n\n\nBroń: %s\t\tAmunicja: %d", GunNames[Dom[dom][hS_G9]], PlayerInfo[playerid][pGun9]);
				    }
					ShowPlayerDialogEx(playerid, 8247, DIALOG_STYLE_INPUT, "Chowanie amunicji", brondef, "Wszystko", "Naboje");
				    SendClientMessage(playerid, COLOR_NEWS, "Ilość naboi od 1 do 100 000");
				}
			}
		}
        if(dialogid == 666)
		{
		    if(response)
		    {
		        new veh = GetPlayerVehicleID(playerid);
		        new dont_override = false;
		        new engine,lights,alarm,doors,bonnet,boot,objective;
		        GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);

		        new komunikat[256];

                if(strfind(inputtext, "Światła") != -1)
                {
                    if(lights == VEHICLE_PARAMS_ON)
					{
						SetVehicleParamsEx(veh,engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
					}
					else
					{
						SetVehicleParamsEx(veh,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
					}
                }
				else if(strfind(inputtext, "Szyba") != -1)
				{
					RunCommand(playerid, "/vszyba", "");
				}
                else if(strfind(inputtext, "Ręczny") != -1)
                {
                    RunCommand(playerid, "/reczny", "");
                }
                else if(strfind(inputtext, "Maska") != -1)
                {
                    if(bonnet == VEHICLE_PARAMS_ON)
					{
						SetVehicleParamsEx(veh,engine,lights,alarm,doors,VEHICLE_PARAMS_OFF,boot,objective);
					}
					else
					{
						SetVehicleParamsEx(veh,engine,lights,alarm,doors,VEHICLE_PARAMS_ON,boot,objective);
					}
                }
                else if(strfind(inputtext, "Bagażnik") != -1)
                {
                    if(boot == VEHICLE_PARAMS_ON)
			 		{
						SetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_OFF,objective);
					}
					else
					{
						SetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_ON,objective);
					}
                }
                else if(strfind(inputtext, "CB-Radio") != -1)
                {
                    if(!cbradijo[playerid])
                	{
                		cbradijo[playerid] = 1;
                		SendClientMessage(playerid, COLOR_WHITE, "   CB-radio wyłączone !");
                	}
                	else
                	{
                		cbradijo[playerid] = 0;
                		SendClientMessage(playerid,0xff00ff, "   CB-radio włączone !");
                	}
                }
                else if(strfind(inputtext, "Neony") != -1)
                {
                    new sendername[MAX_PLAYER_NAME + 1];
					GetPlayerName(playerid, sendername, sizeof(sendername));
				    if(VehicleUID[veh][vNeon])
					{
						DestroyDynamicObject(VehicleUID[veh][vNeonObject][0]);
			     		DestroyDynamicObject(VehicleUID[veh][vNeonObject][1]);
				        VehicleUID[veh][vNeon] = false;
				        format(komunikat, sizeof(komunikat), "* %s naciska przycisk i gasi neony.", sendername);
						ProxDetector(30.0, playerid, komunikat, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    }
				    else
				    {
						if(IsPlayerPremiumOld(playerid))
			            {
							VehicleUID[veh][vNeonObject][0] = CreateDynamicObject(CarData[VehicleUID[veh][vUID]][c_Neon], 0.0,0.0,0.0, 0, 0, 0);
                            AttachDynamicObjectToVehicle(VehicleUID[veh][vNeonObject][0], veh, -0.8, 0.0, -0.5, 0.0, 0.0, 0.0);
				       		VehicleUID[veh][vNeonObject][1] = CreateDynamicObject(CarData[VehicleUID[veh][vUID]][c_Neon], 0.0,0.0,0.0, 0, 0, 0);
                            AttachDynamicObjectToVehicle(VehicleUID[veh][vNeonObject][1], veh, 0.8, 0.0, -0.5, 0.0, 0.0, 0.0);
						}
						else
						{
							VehicleUID[veh][vNeonObject][0] = CreateDynamicObject(18652, 0.0,0.0,0.0, 0, 0, 0);
                            AttachDynamicObjectToVehicle(VehicleUID[veh][vNeonObject][0], veh, -0.8, 0.0, -0.5, 0.0, 0.0, 0.0);
				       		VehicleUID[veh][vNeonObject][1] = CreateDynamicObject(18652, 0.0,0.0,0.0, 0, 0, 0);
                            AttachDynamicObjectToVehicle(VehicleUID[veh][vNeonObject][1], veh, 0.8, 0.0, -0.5, 0.0, 0.0, 0.0);
						}
                        VehicleUID[veh][vNeon] = true;
                        format(komunikat, sizeof(komunikat), "* %s naciska przycisk i włącza neony.", sendername);
						ProxDetector(30.0, playerid, komunikat, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				    }
                }
				else if(strfind(inputtext, "Radio") != -1)
				{
					if(!response) return 1;
                    dont_override = true;
                    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
						ShowNewRadio(playerid);
                    }
				}
                else if(strfind(inputtext, "Wlasny Stream") != -1)
                {
                    if(!response) return 1;
                    dont_override = true;
                    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                    	ShowPlayerDialogEx(playerid, 670, DIALOG_STYLE_INPUT, "Własny stream", "Wklej poniżej link do streama", "Start", "Wróć");
                    }
                }
                else if(strfind(inputtext, "Wyłącz radio") != -1)
                {
                    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                    {
                        foreach(new i : Player)
                        {
                            if(IsPlayerInVehicle(i, veh))
                            {
                                StopAudioStreamForPlayer(i);
                                SetPVarInt(i, "sanlisten", 0);
                            }
                        }
                    }
                }
                if(!dont_override) ShowDeskaRozdzielcza(playerid);
		    }
		}
		else if(dialogid == 670) {
			if(response)
			{
				new veh = GetPlayerVehicleID(playerid);
				//if(IsAValidURL(inputtext))
				//{
				if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
					foreach(new i : Player) {
						if(IsPlayerInVehicle(i, veh)) {
							PlayAudioStreamForPlayer(i, inputtext);
						}
					}
					SetPVarString(playerid, "radioUrl", inputtext);
					SetPVarInt(playerid, "sanlisten", 3);
				}
				//}
			}
			return 1;
		}
        else if(dialogid == 667)
        {
            if(!response) return 1;
            SetPVarInt(playerid, "sanradio", listitem);
            ShowPlayerDialogEx(playerid, 669, DIALOG_STYLE_LIST, "Wybierz muzykę","Mrucznik Radio\nDisco polo\nDance100\nPrzeboje\nHip hop\nParty\nWłasna", "Wybierz", "Anuluj");

        }
        else if(dialogid == 669)
        {
            if(!response) return 1;
            if(GetPVarInt(playerid, "sanradio") == 0)
            {
                switch(listitem)
                {
                    case 0: format(RadioSANUno, sizeof(RadioSANUno), "http://4stream.pl:18434");
                    case 1: format(RadioSANUno, sizeof(RadioSANUno), "http://www.polskastacja.pl/play/aac_discopolo.pls");
                    case 2: format(RadioSANUno, sizeof(RadioSANUno), "http://www.polskastacja.pl/play/aac_dance100.pls");
                    case 3: format(RadioSANUno, sizeof(RadioSANUno), "http://www.polskastacja.pl/play/aac_mnt.pls");
                    case 4: format(RadioSANUno, sizeof(RadioSANUno), "http://www.polskastacja.pl/play/aac_hiphop.pls");
                    case 5: format(RadioSANUno, sizeof(RadioSANUno), "http://www.polskastacja.pl/play/aac_party.pls");
                    case 6: return ShowPlayerDialogEx(playerid, 668, DIALOG_STYLE_INPUT, "Podaj adres URL", "Proszę wprowadzić adres URL muzyki dla stacji SAN 01", "Wybierz", "Anuluj");
                }
                foreach(new i : Player)
                {
                    if(IsPlayerInAnyVehicle(i))
                    {
                        if(GetPVarInt(i, "sanlisten") == 1)
                        {
                            PlayAudioStreamForPlayer(i, RadioSANUno);
                        }
                    }
                }
            }
            else //sanradio == 1
            {
                switch(listitem)
                {
                    case 0: format(RadioSANDos, sizeof(RadioSANDos), "http://4stream.pl:18240");
                    case 1: format(RadioSANDos, sizeof(RadioSANDos), "http://www.polskastacja.pl/play/aac_discopolo.pls");
                    case 2: format(RadioSANDos, sizeof(RadioSANDos), "http://www.polskastacja.pl/play/aac_dance100.pls");
                    case 3: format(RadioSANDos, sizeof(RadioSANDos), "http://www.polskastacja.pl/play/aac_mnt.pls");
                    case 4: format(RadioSANDos, sizeof(RadioSANDos), "http://www.polskastacja.pl/play/aac_hiphop.pls");
                    case 5: format(RadioSANDos, sizeof(RadioSANDos), "http://www.polskastacja.pl/play/aac_party.pls");
                    case 6: return ShowPlayerDialogEx(playerid, 668, DIALOG_STYLE_INPUT, "Podaj adres URL", "Proszę wprowadzić adres URL muzyki dla stacji SAN 02", "Wybierz", "Anuluj");
                }
                foreach(new i : Player)
                {
                    if(IsPlayerInAnyVehicle(i))
                    {
                        if(GetPVarInt(i, "sanlisten") == 2)
                        {
                            PlayAudioStreamForPlayer(i, RadioSANDos);
                        }
                    }
                }
            }
            SendClientMessage(playerid, COLOR_GRAD2, " Zmieniłeś nadawaną stację.");
        }
        if(dialogid == 668)
        {
            if(!response) return 1;
            new radio = GetPVarInt(playerid, "sanradio");
            if(!radio)
            {
                format(RadioSANUno, 128, "%s", inputtext);
                foreach(new i : Player)
                {
                    if(IsPlayerInAnyVehicle(i))
                    {
                        if(GetPVarInt(i, "sanlisten") == 1)
                        {
                            PlayAudioStreamForPlayer(i, RadioSANUno);
                        }
                    }
                }

            }
            else
            {
                format(RadioSANDos, 128, "%s", inputtext);
                foreach(new i : Player)
                {
                    if(IsPlayerInAnyVehicle(i))
                    {
                        if(GetPVarInt(i, "sanlisten") == 2)
                        {
                            PlayAudioStreamForPlayer(i, RadioSANDos);
                        }
                    }
                }
            }
            SendClientMessage(playerid, COLOR_GRAD2, " Zmieniłeś nadawaną stację.");
        }
		if(dialogid == 765)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
                    case 0: format(SANrepertuar, sizeof(SANrepertuar), "http://s1.slotex.pl:7170");
                    case 1: format(SANrepertuar, sizeof(SANrepertuar), "http://4stream.pl:18240");
		            case 2: format(SANrepertuar, sizeof(SANrepertuar), "http://www.polskastacja.pl/play/aac_discopolo.pls");
                    case 3: format(SANrepertuar, sizeof(SANrepertuar), "http://www.polskastacja.pl/play/aac_dance100.pls");
                    case 4: format(SANrepertuar, sizeof(SANrepertuar), "http://www.polskastacja.pl/play/aac_mnt.pls");
                    case 5: format(SANrepertuar, sizeof(SANrepertuar), "http://www.polskastacja.pl/play/aac_hiphop.pls");
                    case 6: format(SANrepertuar, sizeof(SANrepertuar), "http://www.polskastacja.pl/play/aac_party.pls");
                    case 7: return ShowPlayerDialogEx(playerid, 767, DIALOG_STYLE_INPUT, "Podaj adres URL", "Proszę wprowadzić adres URL do wybranego utworu (może być z youtube)", "Wybierz", "Anuluj");
		        }
                ShowPlayerDialogEx(playerid, 766, DIALOG_STYLE_LIST, "Wybierz zasięg", "Bardzo mały zasięg\nMały zasięg\nź’redni zasięg\nDuży zasięg", "Wybierz", "Anuluj");
		    }
		}
        if(dialogid == 766)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0: SANzasieg = 10.0;
                    case 1: SANzasieg = 20.0;
                    case 2: SANzasieg = 35.0;
                    case 3: SANzasieg = 50.0;
				}
                new Float:x1,Float:y1,Float:z1, Float:a1, nick[MAX_PLAYER_NAME + 1], string[256];
				GetPlayerPos(playerid,x1,y1,z1);
				GetPlayerFacingAngle(playerid, a1);
				GetPlayerName(playerid, nick, sizeof(nick));
				SANradio = CreateDynamicObject(2232, x1, y1, z1-0.3, 0, 0, a1-180);
				SANx = x1;
				SANy = y1;
				SANz = z1;
                SAN3d = CreateDynamic3DTextLabel("Głośnik SAN", COLOR_NEWS, x1, y1, z1+0.5, 10.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
				format(string, sizeof(string), "* %s stawia głośnik na ziemi i włącza.", nick);
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SendClientMessage(playerid, COLOR_NEWS, "Ustawiłeś głośnik SAN. Aby go wyłączyć wpisz /glosnik");
                //
                foreach(new i : Player)
                {
                    if(IsPlayerConnected(i))
                    {
                        if(!GetPVarInt(i, "sanaudio") && !GetPVarInt(i, "HaveAMp3Stream"))
                        {
                            if(PlayerToPoint(SANzasieg, i, SANx, SANy, SANz))
                            {
								SetPVarInt(i, "sanaudio", 1);
                                PlayAudioStreamForPlayer(i, SANrepertuar, SANx, SANy, SANz, SANzasieg, 1);
                            }
                        }
                    }
                }
                //
			}
		}
		else if(dialogid == 767)
        {
            if(!response) return 1;
            format(SANrepertuar, 128, inputtext);
            ShowPlayerDialogEx(playerid, 766, DIALOG_STYLE_LIST, "Wybierz zasięg", "Bardzo mały zasięg\nMały zasięg\nź’redni zasięg\nDuży zasięg", "Wybierz", "Anuluj");
        }
		else if(dialogid == 768)
		{
			if(response)
		    {
		        switch(listitem)
		        {
                    case 0: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://s1.slotex.pl:7170");
                    case 1: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://4stream.pl:18240");
		            case 2: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://www.polskastacja.pl/play/aac_discopolo.pls");
                    case 3: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://www.polskastacja.pl/play/aac_dance100.pls");
                    case 4: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://www.polskastacja.pl/play/aac_mnt.pls");
                    case 5: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://www.polskastacja.pl/play/aac_hiphop.pls");
                    case 6: format(KLUBOWErepertuar, sizeof(KLUBOWErepertuar), "http://www.polskastacja.pl/play/aac_party.pls");
                    case 7: return ShowPlayerDialogEx(playerid, 770, DIALOG_STYLE_INPUT, "Podaj adres URL", "Proszę wprowadzić adres URL do wybranego utworu", "Wybierz", "Anuluj");
		        }
                ShowPlayerDialogEx(playerid, 769, DIALOG_STYLE_LIST, "Wybierz zasięg", "Bardzo mały zasięg\nMały zasięg\nź’redni zasięg\nDuży zasięg", "Wybierz", "Anuluj");
		    }
		}
		else if(dialogid == 770)
        {
            if(!response) return 1;
            format(KLUBOWErepertuar, 128, inputtext);
            ShowPlayerDialogEx(playerid, 769, DIALOG_STYLE_LIST, "Wybierz zasięg", "Bardzo mały zasięg\nMały zasięg\nź’redni zasięg\nDuży zasięg", "Wybierz", "Anuluj");
        }
		if(dialogid == 769)
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0: KLUBOWEzasieg = 10.0;
                    case 1: KLUBOWEzasieg = 20.0;
                    case 2: KLUBOWEzasieg = 35.0;
                    case 3: KLUBOWEzasieg = 50.0;
				}
                new Float:x1,Float:y1,Float:z1, Float:a1, nick[MAX_PLAYER_NAME + 1], string[256];
				GetPlayerPos(playerid,x1,y1,z1);
				GetPlayerFacingAngle(playerid, a1);
				GetPlayerName(playerid, nick, sizeof(nick));
				KLUBOWEradio = CreateDynamicObject(2232, x1, y1, z1-0.3, 0, 0, a1-180);
				KLUBOWEx = x1;
				KLUBOWEy = y1;
				KLUBOWEz = z1;
                KLUBOWE3d = CreateDynamic3DTextLabel("Głośnik Klubowy", COLOR_NEWS, x1, y1, z1+0.5, 10.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
				format(string, sizeof(string), "* %s stawia głośnik na ziemi i włącza.", nick);
				ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SendClientMessage(playerid, COLOR_NEWS, "Ustawiłeś głośnik klubowy. Aby go wyłączyć wpisz /glosnik");
                //
                foreach(new i : Player)
                {
                    if(IsPlayerConnected(i))
                    {
                        if(!GetPVarInt(i, "kluboweaudio") && !GetPVarInt(i, "HaveAMp3Stream"))
                        {
                            if(PlayerToPoint(KLUBOWEzasieg, i, KLUBOWEx, KLUBOWEy, KLUBOWEz))
                            {
                                PlayAudioStreamForPlayer(i, KLUBOWErepertuar, KLUBOWEx, KLUBOWEy, KLUBOWEz, KLUBOWEzasieg, 1);
                                SetPVarInt(i, "kluboweaudio", 1);
                            }
                        }
                    }
                }
                //
			}
		}
        else if(dialogid == 1401)
		{
			new string[256];
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://Biały
		            {
						format(string, sizeof(string), "Białe neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_WHITE, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18652;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 1://żółty
		            {
						format(string, sizeof(string), "żółte neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, 0xDAA520FF, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18650;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 2://Zielony
		            {
						format(string, sizeof(string), "Zielone neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18649;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 3://Niebieski
		            {

						format(string, sizeof(string), "Niebieskie neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18648;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 4://Czerwony
		            {

						format(string, sizeof(string), "Czerwone neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_RED, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18647;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);

		            }
		            case 5://Różowy
		            {
						format(string, sizeof(string), "Różowe neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_PURPLE, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18651;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		        }
		    }
			else
			{
				format(string, sizeof(string), "Białe neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				CarData[IloscAut[playerid]][c_Neon] = 18652;
				PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
			}
			Car_Save(IloscAut[playerid], CAR_SAVE_TUNE);
			return 1;
		}
		else if(dialogid == 1403)
		{
		    if(response)
		    {
				new string[128];
		        switch(listitem)
		        {
					
		            case 0:
		            {
						if(kaska[playerid] >= onePoolPrice)
						{
							format(string, sizeof(string), "Pani Janina mówi: Oto pakiet 100 kredytów za jedyne %d$.", onePoolPrice);
							SendClientMessage(playerid, COLOR_WHITE, string);
							Kredyty[playerid] += 100;
							ZabierzKaseDone(playerid, onePoolPrice);
							//Sejf_Add(43, onePoolPrice); tu komentuje bo nie ma id grupy, ewentualnie dodac po stworzeniu
							poolCashStats = poolCashStats+onePoolPrice;
							poolCreditStatus = poolCreditStatus+100;
						}
						else
						{
							sendErrorMessage(playerid, "Nie masz wystarczającej ilości gotówki!"); 
							return 1;
						}
		            }
		            case 1:
		            {
						if(kaska[playerid] >= twoPoolPrice)
						{
							format(string, sizeof(string), "Pani Janina mówi: Oto pakiet 200 kredytów za jedyne %d$.", twoPoolPrice);
							SendClientMessage(playerid, COLOR_WHITE, string);
							Kredyty[playerid] += 200;
							ZabierzKaseDone(playerid, twoPoolPrice); 
							//Sejf_Add(43, twoPoolPrice); tu komentuje bo nie ma id grupy, ewentualnie dodac po stworzeniu
							poolCreditStatus = poolCreditStatus+200;
							poolCashStats = poolCashStats+twoPoolPrice;
						}
						else
						{
							sendErrorMessage(playerid, "Nie masz wystarczającej ilości gotówki!"); 
							return 1;
						}
		            }
		            case 2://Zielony
		            {
						if(kaska[playerid] >= threePoolPrice)
						{
							format(string, sizeof(string), "Pani Janina mówi: Oto pakiet 500 kredytów za jedyne %d$.", threePoolPrice);
							SendClientMessage(playerid, COLOR_WHITE, string);
							Kredyty[playerid] += 500;
							ZabierzKaseDone(playerid, threePoolPrice);
							//Sejf_Add(43, threePoolPrice); tu komentuje bo nie ma id grupy, ewentualnie dodac po stworzeniu
							poolCreditStatus = poolCreditStatus+500;
							poolCashStats = poolCashStats+threePoolPrice;
						}
						else
						{
							sendErrorMessage(playerid, "Nie masz wystarczającej ilości gotówki!"); 
							return 1;
						}
		            }
		            case 3://Niebieski
		            {
						if(kaska[playerid] >= fourPoolPrice)
						{
							format(string, sizeof(string), "Pani Janina mówi: Oto pakiet 1000 kredytów za jedyne %d$.", fourPoolPrice);
							SendClientMessage(playerid, COLOR_WHITE, string);
							Kredyty[playerid] += 1000;
							ZabierzKaseDone(playerid, fourPoolPrice);
							//Sejf_Add(43, fourPoolPrice); tu komentuje bo nie ma id grupy, ewentualnie dodac po stworzeniu
							poolCreditStatus = poolCreditStatus+1000;
							poolCashStats = poolCashStats+fourPoolPrice;
						}
						else
						{
							sendErrorMessage(playerid, "Nie masz wystarczającej ilości gotówki!"); 
							return 1;
						}
		            }
		        }
				return 1;
		    }
		}
		else if(dialogid == 1093)//panel lidera basenu
		{
			if(response)
			{
				new string[128];
				switch(listitem)
				{
					case 0://Otwórz/zamknij basen
					{
						if(poolStatus == 0)
						{
							poolStatus = 1;
							sendTipMessage(playerid, "Otworzyłeś basen Tsunami");
							format(string, sizeof(string), "%s otworzył basen.", GetNick(playerid));
							GroupSendMessage(43, TEAM_BLUE_COLOR, string);
						}
						else
						{
							poolStatus = 0;
							sendTipMessage(playerid, "Zamknąłeś basen Tsunami");
							format(string, sizeof(string), "%s zamknął basen - Koniec pływania!", GetNick(playerid));
							//SendNewFamilyMessage(43, TEAM_BLUE_COLOR, string);
						
						}
					}
					case 1://Zmień cenę kredytu
					{
						ShowPlayerDialogEx(playerid, 1096, DIALOG_STYLE_LIST, "M-RP - Basen Tsunami", "1. Dziecięcy\n2. Podstawowy\n3.Zaawansowany\n4.Premium", "Akceptuj", "Wróć"); 
					}
					case 2://Ustal muzykę
					{
						sendTipMessage(playerid, "Już niedługo!"); 
					}
					case 3://Wyślij wiadomość
					{
						format(string, sizeof(string), "%s użył komunikatu basenu", GetNickEx(playerid));
						SendAdminMessage(COLOR_RED, string); //Wiadomość dla @
						SendClientMessageToAll(COLOR_WHITE, "|___________ Basen Tsunami ___________|");
						format(string, sizeof(string), "Plusk Plusk - Basen Tsunami otwarty! Zapraszamy do najlepszego obiektu rekreacyjnego w mieście!");
						SendClientMessageToAll(COLOR_BLUE, string);
					}
				}
				return 1;
			}
		}
		else if(dialogid == 1095)//pusty dialog basenu - statystyk
		{
			if(response)
			{
				sendTipMessage(playerid, "Nie za dobrze wyglądają te statystki! Popraw je!");
				return 1;
			}
		}
		else if(dialogid == 1096)
		{
			if(response)
			{
				new string[128];
				switch(listitem)
				{
					case 0:
					{
						format(string, sizeof(string), "{C0C0C0}Wpisz poniżej nową kwotę dla pakietu {00FFFF}dziecięcego\n{C0C0C0}Aktualna cena to: {37AC45}%d$", onePoolPrice);
						ShowPlayerDialogEx(playerid, 1097, DIALOG_STYLE_INPUT, "M-RP - Basen Tsunami", string, "Akceptuj", "Odrzuć"); 
						SetPVarInt(playerid, "wyborPoziomuKredytow", 1);
					}
					case 1:
					{	
						format(string, sizeof(string), "{C0C0C0}Wpisz poniżej nową kwotę dla pakietu {00FFFF}dziecięcego\n{C0C0C0}Aktualna cena to: {37AC45}%d$", twoPoolPrice);
						ShowPlayerDialogEx(playerid, 1097, DIALOG_STYLE_INPUT, "M-RP - Basen Tsunami", string, "Akceptuj", "Odrzuć"); 
						SetPVarInt(playerid, "wyborPoziomuKredytow", 2);
					}
					case 2:
					{
						format(string, sizeof(string), "{C0C0C0}Wpisz poniżej nową kwotę dla pakietu {00FFFF}dziecięcego\n{C0C0C0}Aktualna cena to: {37AC45}%d$", threePoolPrice);
						ShowPlayerDialogEx(playerid, 1097, DIALOG_STYLE_INPUT, "M-RP - Basen Tsunami", string, "Akceptuj", "Odrzuć"); 
						SetPVarInt(playerid, "wyborPoziomuKredytow", 3);
					}
					case 3:
					{
						
						format(string, sizeof(string), "{C0C0C0}Wpisz poniżej nową kwotę dla pakietu {00FFFF}dziecięcego\n{C0C0C0}Aktualna cena to: {37AC45}%d$", fourPoolPrice);
						ShowPlayerDialogEx(playerid, 1097, DIALOG_STYLE_INPUT, "M-RP - Basen Tsunami", string, "Akceptuj", "Odrzuć"); 
						SetPVarInt(playerid, "wyborPoziomuKredytow", 4);
					}
				}
				return 1;
			}
		}
		else if(dialogid == 1097)
		{
			if(response)
			{
				new pricePool = FunkcjaK(inputtext);
				if(GetPVarInt(playerid, "wyborPoziomuKredytow") == 1)
				{
					if(pricePool <= 300000)
					{
						if(pricePool > 1)
						{
							onePoolPrice = pricePool;
							sendTipMessage(playerid, "Ustaliłeś nową cenę!");
						}
						else
						{
							sendErrorMessage(playerid, "Cena musi być większa niż 1 dolar!"); 
							return 1;
						}
					}
					else
					{
						sendErrorMessage(playerid, "Przekroczyłeś maksymalną kwotę!"); 
					}
					return 1;
				
				}
				if(GetPVarInt(playerid, "wyborPoziomuKredytow") == 2)
				{
					if(pricePool <= 450000)
					{
						if(pricePool > 1)
						{
							twoPoolPrice = pricePool;
							sendTipMessage(playerid, "Ustaliłeś nową cenę!");
						}
						else
						{
							sendErrorMessage(playerid, "Kwota musi być większa niż 1 dolar!");
							return 1;
						}
					}
					else
					{
						sendErrorMessage(playerid, "Przekroczyłeś maksymalną kwotę!"); 
					}
					return 1;
				}
				if(GetPVarInt(playerid, "wyborPoziomuKredytow") == 3)
				{
					if(pricePool <= 600000)
					{
						if(pricePool > 1)
						{
							threePoolPrice = pricePool;
							sendTipMessage(playerid, "Ustaliłeś nową cenę!");
						}
						else
						{
							sendErrorMessage(playerid, "Kwota musi być większa niż 1 dolar!"); 
							return 1;
						}
					}
					else
					{
						sendErrorMessage(playerid, "Przekroczyłeś maksymalną kwotę!"); 
					}		
					return 1;
				}
				if(GetPVarInt(playerid, "wyborPoziomuKredytow") == 4)
				{
					if(pricePool <= 1000000)
					{
						if(pricePool > 1)
						{
							fourPoolPrice = pricePool;
							sendTipMessage(playerid, "Ustaliłeś nową cenę!");
						}
						else
						{
							sendErrorMessage(playerid, "Kwota musi być większa niż 1 dolar!"); 
							return 1;
						}
					}
					else
					{
						sendErrorMessage(playerid, "Przekroczyłes maksymalną kwotę!"); 
					}
					return 1;
				}
			}
		
		}
		else if(dialogid == 1402)//rupxnup
		{
            if(response || !response)
		    {
		        new string[256];
		        switch(listitem)
		        {
		            case 0://Biały
		            {
						format(string, sizeof(string), "Białe neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_WHITE, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18652;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 1://żółty
		            {
						format(string, sizeof(string), "żółte neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, 0xDAA520FF, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18650;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 2://Zielony
		            {
						format(string, sizeof(string), "Zielone neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18649;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 3://Niebieski
		            {

						format(string, sizeof(string), "Niebieskie neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18648;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 4://Czerwony
		            {

						format(string, sizeof(string), "Czerwone neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_RED, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18647;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		            case 5://Różowy
		            {
						format(string, sizeof(string), "Różowe neony zostały zamontowane w twoim %s. Aby je włączyć wpisz /dr", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
						SendClientMessage(playerid, COLOR_PURPLE, string);
                        CarData[IloscAut[playerid]][c_Neon] = 18651;
                        PlayerPlaySound(playerid, 1141, 0.0, 0.0, 0.0);
		            }
		        }
                Car_Save(IloscAut[playerid], CAR_SAVE_TUNE);
		    }
		}
		else if(dialogid == 1410)//Panel tras
		{
		    if(response)
		    {
				new string[256];
		        switch(listitem)
				{
				    case 0://Pokaż trasy
				    {
						ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Więcej", "Wyjdź");
				    }
				    case 1://Zorganizuj wyścig
				    {
						new ow = IsAWyscigOrganizowany();
						if(ow == -1)
						{
							if(Scigamy == 666)
							{
								ShowPlayerDialogEx(playerid, 1412, DIALOG_STYLE_LIST, "Organizowanie wyścigu. Dostępne trasy:", ListaWyscigow(), "Zorganizuj", "Wróć");
							}
							else
							{
								format(string, sizeof(string), "Obecnie wyścig %s jest zorganizowany. Poczekaj aż się skończy.", Wyscig[Scigamy][wNazwa]);
								SendClientMessage(playerid, COLOR_GREY, string);
							}
						}
						else
						{
							format(string, sizeof(string), "Gracz %s organizuje wyścig. Poczekaj aż skończy.", GetNick(ow));
							SendClientMessage(playerid, COLOR_GREY, string);
						}
				    }
				    case 2://Edytuj trasę
				    {
						new ow = IsAWyscigOrganizowany();
						if(ow == -1)
						{
							if(Scigamy == 666)
							{
								ShowPlayerDialogEx(playerid, 1413, DIALOG_STYLE_LIST, "Edytowanie. Dostępne trasy:", ListaWyscigow(), "Edytuj", "Wróć");
							}
							else
							{
								format(string, sizeof(string), "Obecnie wyścig %s jest zorganizowany. Poczekaj aż się skończy.", Wyscig[Scigamy][wNazwa]);
								SendClientMessage(playerid, COLOR_GREY, string);
							}
						}
						else
						{
							format(string, sizeof(string), "Gracz %s organizuje wyścig. Poczekaj aż skończy.", GetNick(ow));
							SendClientMessage(playerid, COLOR_GREY, string);
						}
				    }
				    case 3://Usuń trasę
				    {
						new ow = IsAWyscigOrganizowany();
						if(ow == -1)
						{
							if(Scigamy == 666)
							{
								ShowPlayerDialogEx(playerid, 1414, DIALOG_STYLE_LIST, "Usuwanie. Dostępne trasy:", ListaWyscigow(), "Usuń", "Wróć");
							}
							else
							{
								format(string, sizeof(string), "Obecnie wyścig %s jest zorganizowany. Poczekaj aż się skończy.", Wyscig[Scigamy][wNazwa]);
								SendClientMessage(playerid, COLOR_GREY, string);
							}
						}
						else
						{
							format(string, sizeof(string), "Gracz %s organizuje wyścig. Poczekaj aż skończy.", GetNick(ow));
							SendClientMessage(playerid, COLOR_GREY, string);
						}
				    }
				}
				return 1;
		    }
		}
		if(dialogid == 1411)//Pokaż trasy. Więcej informacji
		{
			if(response)
			{
			    if(Wyscig[listitem][wStworzony] == 1)
			    {
				    new komunikat[1024];
					new wklej[256];
					if(Wyscig[listitem][wTypCH] == 0)
					{
						strcat(wklej, "{7CFC00}Typ checkpointów:{FFFFFF} Normalne\n");
					}
					else
					{
	    				strcat(wklej, "{7CFC00}Typ checkpointów:{FFFFFF} Koła\n");
					}
					if(Wyscig[listitem][wRozmiarCH] == 10.0)
					{
						strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Ogromne\n");
					}
					else if(Wyscig[listitem][wRozmiarCH] == 7.5)
					{
						strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Duże\n");
					}
					else if(Wyscig[listitem][wRozmiarCH] == 5)
					{
	    				strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} ź’rednie\n");
					}
					else if(Wyscig[listitem][wRozmiarCH] == 2.5)
					{
						strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Małe\n");
					}
					else if(Wyscig[listitem][wRozmiarCH] == 1)
					{
	    				strcat(wklej, "{7CFC00}Rozmiar checkpointów:{FFFFFF} Mini\n");
					}
	   				format(komunikat, sizeof(komunikat), "{7CFC00}Nazwa:{FFFFFF} %s\n{7CFC00}Opis:{FFFFFF} %s\n{7CFC00}Nagroda:{FFFFFF} %d$\n%s\n{7CFC00}Ilość checkpointów:{FFFFFF} %d\n{7CFC00}Rekord toru:{FFFFFF} %s - %d:%d", Wyscig[listitem][wNazwa], Wyscig[listitem][wOpis], Wyscig[listitem][wNagroda], wklej, Wyscig[listitem][wCheckpointy]+1, Wyscig[listitem][wRekordNick], Wyscig[listitem][wRekordCzas]);
	    			ShowPlayerDialogEx(playerid, 1415, DIALOG_STYLE_MSGBOX, "{7CFC00}Informacje o wyścigu{FFFFFF}", komunikat, "Wróć", "");
	    		}
	    		else
	    		{
					SendClientMessage(playerid, COLOR_GREY, "Ta trasa nie została jeszcze stworzona!");
					ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Więcej", "Wyjdź");
	    		}
				return 1;
			}
			if(!response)
			{
				if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
 				{
 				    if(GroupPlayerDutyRank(playerid) >= 5)
 				    {
						ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
					}
					else
					{
					    ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig", "Wybierz", "Anuluj");
					}
 				}
				return 1;
			}
		}
		if(dialogid == 1412)//organizuj wyścig
		{
		    if(response)
		    {
		        if(Wyscig[listitem][wStworzony] == 1)
			    {
			        new naglowek[64];
					format(naglowek, sizeof(naglowek), "Organizacja wyścigu '%s'", Wyscig[listitem][wNazwa]);
		       		new komunikat[256];
		       		format(komunikat, sizeof(komunikat), "Aby zorganizować ten wyscig musisz ponieść koszty:\nNagroda dla wygranego: {FF0000}%d${B0C4DE}\nJeżeli chcesz kontynuować, wciśnij \"Dalej\"", Wyscig[listitem][wNagroda]);
			        ShowPlayerDialogEx(playerid, 1416, DIALOG_STYLE_MSGBOX, naglowek, komunikat, "Dalej", "Wróć");
			        tworzenietrasy[playerid] = listitem;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ta trasa nie została jeszcze stworzona!");
					ShowPlayerDialogEx(playerid, 1412, DIALOG_STYLE_LIST, "Organizowanie wyścigu. Dostępne trasy:", ListaWyscigow(), "Zorganizuj", "Wróć");
				}
				return 1;
		    }
		    if(!response)
		    {
		        if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
 				{
 				    if(GroupPlayerDutyRank(playerid)>= 5)
 				    {
						ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
					}
					else
					{
					    ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig", "Wybierz", "Anuluj");
					}
 				}
				return 1;
		    }
		}
		if(dialogid == 1413)//edytuj trase
		{
		    if(response)
		    {
		        if(Wyscig[listitem][wStworzony] == 1)
			    {
			        ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
			        tworzenietrasy[playerid] = listitem;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ta trasa nie została jeszcze stworzona!");
					ShowPlayerDialogEx(playerid, 1413, DIALOG_STYLE_LIST, "Edytowanie. Dostępne trasy:", ListaWyscigow(), "Edytuj", "Wróć");
				}
				return 1;
			}
			if(!response)
		    {
                if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
 				{
 				    if(GroupPlayerDutyRank(playerid) >= 5)
 				    {
						ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
					}
					else
					{
					    ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig", "Wybierz", "Anuluj");
					}
 				}
				return 1;
			}
		}
		if(dialogid == 1414)//usuń trase
		{
		    if(response)
		    {
		        if(Wyscig[listitem][wStworzony] == 1)
			    {
			        new naglowek[64];
					format(naglowek, sizeof(naglowek), "Usuwanie wyścigu '%s'", Wyscig[listitem][wNazwa]);
			        ShowPlayerDialogEx(playerid, 1417, DIALOG_STYLE_MSGBOX, naglowek, "{FF0000}UWAGA!{B0C4DE} Na pewno chcesz usunąć ten wyścig?\nZostanie on bezpowrotnie zlikwidowany!\nNa pewno chcesz kontynuować?", "Usuń", "Wróć");
			        tworzenietrasy[playerid] = listitem;
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Ta trasa nie została jeszcze stworzona!");
					ShowPlayerDialogEx(playerid, 1414, DIALOG_STYLE_LIST, "Usuwanie. Dostępne trasy:", ListaWyscigow(), "Usuń", "Wróć");
				}
				return 1;
		    }
		    if(!response)
		    {
		        if(IsANoA(playerid) || IsAKt(playerid) || HasPerm(playerid, PERM_RACING))
 				{
 				    if(GroupPlayerDutyRank(playerid) >= 5)
 				    {
						ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
					}
					else
					{
					    ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig", "Wybierz", "Anuluj");
					}
 				}
				return 1;
		    }
		}
		if(dialogid == 1415)//informacje o wyścigu
		{
		    if(response || !response)
		    {
				ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Więcej", "Wyjdź");
				return 1;
		    }
		}
		if(dialogid == 1416)//Akceptowanie organizowania
		{
		    if(response)
			{
				if(kaska[playerid] >= Wyscig[tworzenietrasy[playerid]][wNagroda] && Wyscig[tworzenietrasy[playerid]][wNagroda] > 0 && kaska[playerid] > 0)
				{
					new sendername[MAX_PLAYER_NAME + 1];
					new komunikat[128];
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(komunikat, sizeof(komunikat), "Komunikat frakcyjny: {FFFFFF}%s zorganizował wyścig %s", sendername, Wyscig[tworzenietrasy[playerid]][wNazwa]);
					GroupSendMessage(15, COLOR_YELLOW, komunikat);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wyścig zorganizowany! Udaj się na start i zaproś osoby do wyscigu komendą /wyscig [id].");
					SetPlayerRaceCheckpoint(playerid,1,wCheckpoint[tworzenietrasy[playerid]][0][0], wCheckpoint[tworzenietrasy[playerid]][0][1], wCheckpoint[tworzenietrasy[playerid]][0][2],wCheckpoint[tworzenietrasy[playerid]][1][0], wCheckpoint[tworzenietrasy[playerid]][1][1], wCheckpoint[tworzenietrasy[playerid]][1][2], 10);
					//Sejf_Add(FRAC_NOA, (Wyscig[tworzenietrasy[playerid]][wCheckpointy]+1)*2000);
					ZabierzKaseDone(playerid, Wyscig[tworzenietrasy[playerid]][wNagroda]);
					
					Log(payLog, WARNING, "%s zorganizował wyścig %s. Koszt organizacji: %d$, nagroda: %d$",
						GetPlayerLogName(playerid),
						Wyscig[tworzenietrasy[playerid]][wNazwa], 
						(Wyscig[tworzenietrasy[playerid]][wCheckpointy]+1)*2000, 
						Wyscig[tworzenietrasy[playerid]][wNagroda]);

					owyscig[playerid] = tworzenietrasy[playerid];
					//tworzenietrasy[playerid] = 666; - po co pytam sie zmieniac po wybraniu trasy zmienną jakoby TWORZYMY TRASE, PO CO?
					
				}
				else
				{
					SendClientMessage(playerid, COLOR_PANICRED, "Nie stać cię na zorganizowanie tego wyścigu!!");
					tworzenietrasy[playerid] = 666;
					ShowPlayerDialogEx(playerid, 1412, DIALOG_STYLE_LIST, "Organizowanie wyścigu. Dostępne trasy:", ListaWyscigow(), "Zorganizuj", "Wróć");
				}
			}
		    if(!response)
		    {
				tworzenietrasy[playerid] = 666;
				ShowPlayerDialogEx(playerid, 1412, DIALOG_STYLE_LIST, "Organizowanie wyścigu. Dostępne trasy:", ListaWyscigow(), "Zorganizuj", "Wróć");
		    }
			return 1;
		}
		if(dialogid == 1417)//usuń trase
		{
		    if(response)
			{
				Log(serverLog, WARNING, "%s zlikwidował trasę wyścigową %s[%d]", GetPlayerLogName(playerid), Wyscig[tworzenietrasy[playerid]][wNazwa], tworzenietrasy[playerid]);

			    Wyscig[tworzenietrasy[playerid]][wStworzony] = 0;
				strcat(Wyscig[tworzenietrasy[playerid]][wNazwa], "Wolne", 20);
				strcat(Wyscig[tworzenietrasy[playerid]][wOpis], "", 50);
				Wyscig[tworzenietrasy[playerid]][wCheckpointy] = 0;
				Wyscig[tworzenietrasy[playerid]][wNagroda] = 0;
				Wyscig[tworzenietrasy[playerid]][wTypCH] = 0;
				Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 0;
				for(new ii; ii<26; ii++)
				{
					wCheckpoint[tworzenietrasy[playerid]][ii][0] = 0;
			  		wCheckpoint[tworzenietrasy[playerid]][ii][1] = 0;
			    	wCheckpoint[tworzenietrasy[playerid]][ii][2] = 0;
			    }
				SendClientMessage(playerid, COLOR_RED, "Trasa pomyślnie zlikwidowana!");
				tworzenietrasy[playerid] = 666;
			    if(GroupPlayerDutyRank(playerid) >= 4)
 			    {
					ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
				}
				else
				{
				    ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig", "Wybierz", "Anuluj");
				}
				return 1;
			}
			if(!response)
			{
				tworzenietrasy[playerid] = 666;
				ShowPlayerDialogEx(playerid, 1414, DIALOG_STYLE_LIST, "Usuwanie. Dostępne trasy:", ListaWyscigow(), "Usuń", "Wróć");
				return 1;
			}
		}
		if(dialogid == 1430)//opcje edycji
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0://Nazwę
		            {
		                ShowPlayerDialogEx(playerid, 1431, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nazwa", "Wpisz nazwę wyścigu. Maksymalnie 20 znaków", "Edytuj", "Wróć");
		            }
		            case 1://Opis
		            {
		                ShowPlayerDialogEx(playerid, 1432, DIALOG_STYLE_INPUT, "Kreator wyścigów: Opis", "Wpisz opis trasy. Maksymalnie 50 znaków", "Edytuj", "Wróć");
		            }
		            case 2://Nagrode
		            {
		                ShowPlayerDialogEx(playerid, 1433, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nagroda", "Wpisz nagrodę jaką dostanie zwycięzca wyścigu.\nMinimalna stawka to 10 000$ a maksymalna to 10 000 000$", "Edytuj", "Wróć");
		            }
		        }
				return 1;
		    }
		    if(!response)
		    {
				tworzenietrasy[playerid] = 666;
				ShowPlayerDialogEx(playerid, 1413, DIALOG_STYLE_LIST, "Edytowanie. Dostępne trasy:", ListaWyscigow(), "Edytuj", "Wróć");
				return 1;
			}
		}
		if(dialogid == 1431)
		{
		    if(response)
		    {
				if(Scigamy == 666)
				{
					if(strlen(inputtext) > 1 && strlen(inputtext) <= 20)
					{
						format(Wyscig[tworzenietrasy[playerid]][wNazwa], 20, "%s", inputtext);
						new string[128];
						format(string, sizeof(string), "Nazwa wyścigu pomyślnie zmieniona na: {FFFFFF}%s", inputtext);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						ZapiszTrase(tworzenietrasy[playerid]);
						ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Nazwa nie może być pusta/zbyt dużo znaków!");
						ShowPlayerDialogEx(playerid, 1431, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nazwa", "Wpisz nazwę wyścigu. Maksymalnie 20 znaków", "Edytuj", "Wróć");
					}
				}
				else
				{
					ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
					SendClientMessage(playerid, COLOR_PANICRED, "Trwa wyścig, nie można edytować!");
				}
				return 1;
		    }
		    if(!response)
			{
			    ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
				return 1;
			}
		}
		if(dialogid == 1432)
		{
            if(response)
		    {
				if(Scigamy == 666)
				{
					if(strlen(inputtext) > 1 && strlen(inputtext) <= 50)
					{
						format(Wyscig[tworzenietrasy[playerid]][wOpis], 50, "%s", inputtext);
						new string[128];
						format(string, sizeof(string), "Opis wyścigu pomyślnie zmieniony na: {FFFFFF}%s", inputtext);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						ZapiszTrase(tworzenietrasy[playerid]);
						ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Nazwa nie może być pusta/zbyt dużo znaków!");
						ShowPlayerDialogEx(playerid, 1432, DIALOG_STYLE_INPUT, "Kreator wyścigów: Opis", "Wpisz opis trasy. Maksymalnie 50 znaków", "Edytuj", "Wróć");
					}
				}
				else
				{
					ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
					SendClientMessage(playerid, COLOR_PANICRED, "Trwa wyścig, nie można edytować!");
				}
				return 1;
    		}
		    if(!response)
			{
			    ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
				return 1;
			}
		}
		if(dialogid == 1433)
		{
		    if(response)
		    {
				if(Scigamy == 666)
				{
					if(strval(inputtext) >= 10000 && strval(inputtext) <= 100000000)
					{
						Wyscig[tworzenietrasy[playerid]][wNagroda] = strval(inputtext);
						new string[128];
						format(string, sizeof(string), "Nagroda wyścigu pomyślnie zmieniona na: {FFFFFF}%d$", strval(inputtext));
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						ZapiszTrase(tworzenietrasy[playerid]);
						ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
					}
					else
					{
						ShowPlayerDialogEx(playerid, 1433, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nagroda", "Wpisz nagrodę jaką dostanie zwycięzca wyścigu.\nMinimalna stawka to 10 000$ a maksymalna to 10 000 000$", "Edytuj", "Wróć");
					}
				}
				else
				{
					ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
					SendClientMessage(playerid, COLOR_PANICRED, "Trwa wyścig, nie można edytować!");
				}
				return 1;
		    }
		    if(!response)
			{
			    ShowPlayerDialogEx(playerid, 1430, DIALOG_STYLE_LIST, "Edycja trasy: Wybierz co chcesz edytować", "Nazwę\nOpis\nNagrodę", "Wybierz", "Anuluj");
				return 1;
			}
		}
		if(dialogid == 1420)//Tworzenie wyścigu. Wybieranie slotu
		{
			if(response)
			{
				if(Wyscig[listitem][wStworzony] == 0)
				{
				    tworzenietrasy[playerid] = listitem;
				    ShowPlayerDialogEx(playerid, 1421, DIALOG_STYLE_LIST, "Kreator wyścigów: Wybierz typ checkpointów", "Normalne\nKoła", "Wybierz", "Cofnij");
				}
				else
				{
                    new string[1024];
    				for(new i=0; i<sizeof(Wyscig); i++)
					{
					    if(Wyscig[i][wStworzony] == 1)
					    {
						    format(string, sizeof(string), "%s%s\n", string, Wyscig[i][wNazwa]);
						}
						else
						{
						    strcat(string, "Wolny\n");
						}
					}
     				ShowPlayerDialogEx(playerid, 1420, DIALOG_STYLE_LIST, "Kreator wyścigów: Wybierz slot", string, "Wybierz", "Anuluj");
     				SendClientMessage(playerid, COLOR_GREY, "Slot zajęty!");
				}
				return 1;
			}
			if(!response)
			{
				ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wyścigów: Wybierz opcję", "Pokaż trasy\nZorganizuj wyścig\nEdytuj trasę\nUsuń trasę", "Wybierz", "Anuluj");
				return 1;
			}
		}
		if(dialogid == 1421)//Tworzenie wyścigu. Wybieranie typu checkpointu
		{
			if(response)
			{
			    if(listitem == 1)
			    {
			    	Wyscig[tworzenietrasy[playerid]][wTypCH] = 3;
				}
				else
				{
				    Wyscig[tworzenietrasy[playerid]][wTypCH] = 0;
				}
			    ShowPlayerDialogEx(playerid, 1422, DIALOG_STYLE_LIST, "Kreator wyścigów: Wybierz rozmiar checkpointów", "Ogromne\nDuże\nź’rednie\nMałe\nMini", "Wybierz", "Wróć");
				return 1;
			}
			if(!response)
			{
			    tworzenietrasy[playerid] = 666;
			    new string[1024];
				for(new i=0; i<sizeof(Wyscig); i++)
				{
					if(Wyscig[i][wStworzony] == 1)
					{
						format(string, sizeof(string), "%s%s\n", string, Wyscig[i][wNazwa]);
					}
					else
					{
						strcat(string, "Wolny\n");
					}
				}
     			ShowPlayerDialogEx(playerid, 1420, DIALOG_STYLE_LIST, "Kreator wyścigów: Wybierz slot", string, "Wybierz", "Anuluj");
				return 1;
			}
		}
		if(dialogid == 1422)//Tworzenie wyścigu. Wybieranie wielkości checkpointu
		{
			if(response)
			{
			    switch(listitem)
				{
				    case 0://Ogromne
				    {
				        Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 10.0;//rupxnup
				    }
				    case 1://Duże
				    {
				        Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 7.5;
				    }
				    case 2://ź’rednie
				    {
				        Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 5.0;
				    }
				    case 3://Małe
				    {
				        Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 2.5;
				    }
				    case 4://Mini
				    {
				        Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 1.0;
				    }
				}
				ShowPlayerDialogEx(playerid, 1423, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nazwa", "Wpisz nazwę wyścigu. Maksymalnie 20 znaków", "Dalej", "");
				return 1;
   			}
			if(!response)
			{
			    Wyscig[tworzenietrasy[playerid]][wTypCH] = 0;
			    ShowPlayerDialogEx(playerid, 1421, DIALOG_STYLE_LIST, "Kreator wyścigów: Wybierz typ checkpointów", "Normalne\nKoła", "Wybierz", "Wróć");
			}
		}
		if(dialogid == 1423)//Tworzenie wyścigu. Wypisywanie nazwy
		{
		    if(strlen(inputtext) > 1 && strlen(inputtext) <= 20)
			{
			    format(Wyscig[tworzenietrasy[playerid]][wNazwa], 20, "%s", inputtext);
			    ShowPlayerDialogEx(playerid, 1424, DIALOG_STYLE_INPUT, "Kreator wyścigów: Opis", "Wpisz opis trasy. Maksymalnie 50 znaków", "Dalej", "");
			}
		    else
			{
			    SendClientMessage(playerid, COLOR_GREY, "Nazwa nie może być pusta/zbyt dużo znaków!");
			    ShowPlayerDialogEx(playerid, 1423, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nazwa", "Wpisz nazwę wyścigu. Maksymalnie 20 znaków", "Dalej", "");
			}
		}
		if(dialogid == 1424)//Tworzenie wyścigu. Wpisywanie opisu
		{
		    if(strlen(inputtext) > 1 && strlen(inputtext) <= 50)
			{
			    format(Wyscig[tworzenietrasy[playerid]][wOpis], 50, "%s", inputtext);
			    ShowPlayerDialogEx(playerid, 1425, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nagroda", "Wpisz nagrodę jaką dostanie zwycięzca wyścigu.\nMinimalna stawka to 10 000$ a maksymalna to 10 000 000$", "Dalej", "");
			}
		    else
			{
				SendClientMessage(playerid, COLOR_GREY, "Opis nie może być pusty/zbyt dużo znaków!");
			    ShowPlayerDialogEx(playerid, 1424, DIALOG_STYLE_INPUT, "Kreator wyścigów: Opis", "Wpisz opis trasy. Maksymalnie 50 znaków", "Dalej", "");
			}
		}
		if(dialogid == 1425)//Tworzenie wyścigu. Nagroda
		{
			if(strval(inputtext) >= 10000 && strval(inputtext) <= 10000000)
			{
			    Wyscig[tworzenietrasy[playerid]][wNagroda] = strval(inputtext);
			    ShowPlayerDialogEx(playerid, 1426, DIALOG_STYLE_MSGBOX, "Kreator wyścigów: Tworzenie trasy", "Podałeś już wszystkie wymagane informacje.\nMożesz przejść do tworzenia trasy lub anulować proces tworzenia.\nAby postawić czekpoint wpisz /checkpoint\nAby postawić mete i zakończyc tworzenie trasy, wpisz /meta\nAby przejść dalej, naciśnnij \"Dalej\"", "Dalej", "Usuń");
			}
			else
			{
			    ShowPlayerDialogEx(playerid, 1425, DIALOG_STYLE_INPUT, "Kreator wyścigów: Nagroda", "Wpisz nagrodę jaką dostanie zwycięzca wyścigu.\nMinimalna stawka to 10 000$ a maksymalna to 10 000 000$", "Dalej", "");
			}
		}
		if(dialogid == 1426)//Tworzenie wyścigu. Przejście do tworzenia trasy
		{
		    if(response)
		    {
		        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Aby stworzyć checkpoint wpisz /checkpoint. Aby usunąć ostatnio postawiony checkpoint wpisz /checkpoint-usun. Aby zakończyć tworzenie i postawić finisz, wpisz /meta");
		        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Maksymalna ilość checkpointów to 50.");
		    }
		    if(!response)
		    {
		        format(Wyscig[tworzenietrasy[playerid]][wOpis], 50, "");
		        format(Wyscig[tworzenietrasy[playerid]][wNazwa], 20, "");
		        Wyscig[tworzenietrasy[playerid]][wTypCH] = 0;
		        Wyscig[tworzenietrasy[playerid]][wRozmiarCH] = 0;
		        tworzenietrasy[playerid] = 666;
		    }
		}
		if(dialogid == 1427)//Tworzenie wyścigu. Koniec tworzenia trasy
		{
		    if(response)
		    {
		        //testowanie wyścigu
		    }
		}
	   	if(dialogid == 8155)//SYstem autobusów - tablice
	   	{
		   	if(response == 1)
		    {
			   	switch(listitem)
			   	{
				   	case 0:
				   	{
				   		if(PlayerInfo[playerid][pNatrasiejest] == 0)
						{
						    if( (PlayerInfo[playerid][pJob] == 10 && PlayerInfo[playerid][pCarSkill] >= 50) || IsPlayerInGroup(playerid, 10) ||PlayerInfo[playerid][pLider] == 10)
						    {
							    PlayerInfo[playerid][pLinia55]=1;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczoną trasę. Podążaj za sygnałem GPS.");
								SetPlayerCheckpoint(playerid, 2215.8428,-1436.8223,23.4033, 4); // Ustawiamy początkowy CP
								CP[playerid] = 551; //Przypisek CP do dalszych
								PlayerInfo[playerid][pNatrasiejest] = 1; //Kierowca jest w trasie
	   							Przystanek(playerid, COLOR_BLUE, "Linia nr. 55\n{808080}Dojazd do trasy.\nWszytkie przystanki NA żąDANIE (N/ż)");
	   							SetTimerEx("AntyBusCzit", 60000*6, 0, "d", playerid);
	   							BusCzit[playerid] = 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 2skill aby rozpocząć tą trasę");
							}
   						}
				    	else
						{
							SendClientMessage(playerid, COLOR_GREY, " Jesteś już w trasie !");
						}
				   	}
				   	case 1:
				   	{
				   		if(PlayerInfo[playerid][pNatrasiejest] == 0)
						{
							    PlayerInfo[playerid][pLinia72]= 1;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczoną trasę. Podążaj za sygnałem GPS.");
								SetPlayerCheckpoint(playerid, 2818.4243,-1576.9399,10.9287, 4);
								CP[playerid] = 721;
								PlayerInfo[playerid][pNatrasiejest] = 1;
					   			Przystanek(playerid, COLOR_NEWS, "Linia nr. 72 (dojazd)\n{808080}Kierunek: BAZA MECHANIKÓW (pętla) \nWszytkie przystanki NA żąDANIE (N/ż)");
					   			SetTimerEx("AntyBusCzit", 60000*5, 0, "d", playerid);
	   							BusCzit[playerid] = 1;
	   					}
				   		else
						{
							SendClientMessage(playerid, COLOR_GREY, " Jesteś już w trasie !");
						}
				   	}
				   	case 2:
					{
						if(PlayerInfo[playerid][pNatrasiejest] == 0)
						{
						 	if( (PlayerInfo[playerid][pJob] == 10 && PlayerInfo[playerid][pCarSkill] >= 200) || IsPlayerInGroup(playerid, 10) ||PlayerInfo[playerid][pLider] == 10)
						    {
							    PlayerInfo[playerid][pLinia96]= 1;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczoną trasę. Podążaj za sygnałem GPS");
								SetPlayerCheckpoint(playerid, 2687.6597,-2406.9775,13.6017, 4);
								CP[playerid] = 961;
								PlayerInfo[playerid][pNatrasiejest] = 1;
								Przystanek(playerid, COLOR_GREEN, "Linia nr. 96\n{808080}Dojazd do trasy.\nWszytkie przystanki NA żąDANIE (N/ż)");
								SetTimerEx("AntyBusCzit", 60000*6, 0, "d", playerid);
	   							BusCzit[playerid] = 1;
 							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 4skill aby rozpocząć tą trasę");
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Jesteś już w trasie !");
						}
					}
					case 3:
					{
						if(PlayerInfo[playerid][pNatrasiejest] == 0)
						{
							if( (PlayerInfo[playerid][pJob] == 10 && PlayerInfo[playerid][pCarSkill] >= 400) || IsPlayerInGroup(playerid, 10) ||PlayerInfo[playerid][pLider] == 10)
						    {
							    PlayerInfo[playerid][pLinia82]= 1;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczoną trasę. Podążaj za sygnałem GPS");
								SetPlayerCheckpoint(playerid, 1173.1520,-1825.2843,13.1789, 4);
								CP[playerid] = 821;
								PlayerInfo[playerid][pNatrasiejest] = 1;
								Przystanek(playerid,COLOR_YELLOW, "Linia nr. 82\n{808080}Dojazd do trasy.\nWszytkie przystanki NA żąDANIE (N/ż)");
								SetTimerEx("AntyBusCzit", 60000*8, 0, "d", playerid);
	   							BusCzit[playerid] = 1;
                            }
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 5skill aby rozpocząć tą trasę");
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Jesteś już w trasie !");
						}
					}
					case 4:
					{
						if(PlayerInfo[playerid][pNatrasiejest] == 0)
						{
							if( (PlayerInfo[playerid][pJob] == 10 && PlayerInfo[playerid][pCarSkill] >= 100) || IsPlayerInGroup(playerid, 10) ||PlayerInfo[playerid][pLider] == 10)
						    {
							    PlayerInfo[playerid][pLinia96]= 1;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczoną trasę. Podążaj za sygnałem GPS");
								SetPlayerCheckpoint(playerid, 2119.7363,-1896.8149,13.1345, 4);
								CP[playerid] = 501;
								PlayerInfo[playerid][pNatrasiejest] = 1;
								Przystanek(playerid, COLOR_GREEN, "Linia nr. 85\n{808080}Dojazd do trasy.\nWszytkie przystanki NA żąDANIE (N/ż)");
								SetTimerEx("AntyBusCzit", 60000*6, 0, "d", playerid);
	   							BusCzit[playerid] = 1;
 							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 3skill aby rozpocząć tą trasę");
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Jesteś już w trasie !");
						}
					}
					case 5:
					{
						if(PlayerInfo[playerid][pNatrasiejest] == 0)
						{
							if( (PlayerInfo[playerid][pJob] == 10 && PlayerInfo[playerid][pCarSkill] >= 400) || CheckPlayerPerm(playerid, PERM_TAXI) && GroupPlayerDutyRank(playerid) >= 4)
						    {
								Przystanek(playerid, COLOR_BLUE, "Wycieczka\nKoszt: 7500$\n Więcej informacji u kierowcy.");
 							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 5skill lub 4 rangi aby organizować wycieczki.");
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Jesteś już w trasie !");
						}
					}
					case 6:
					{
				    	if(PlayerInfo[playerid][pJob] == 10)
			    			{
           						SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
								CP[playerid]=1201;
								PlayerInfo[playerid][pLinia55] = 0;
								PlayerInfo[playerid][pLinia72] = 0;
								PlayerInfo[playerid][pLinia82] = 0;
								PlayerInfo[playerid][pLinia96] = 0;
								PlayerInfo[playerid][pNatrasiejest] = 0;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz zjazd do zajezdni, wskazuje ją sygnał GPS. ");
				       			Przystanek(playerid, COLOR_BLUE, "Linia ZAJ \n Kierunek: Zajezdnia Commerce\n {808080}Zatrzymuje się na przystankach");
				       			SendClientMessage(playerid, COLOR_ALLDEPT, " KT przypomina: {C0C0C0}Odstawiony do zajezdni autobus to szczęśliwy autobus :) ");
							}
							else if (IsPlayerInGroup(playerid, 10) ||PlayerInfo[playerid][pLider] == 10)
							{
								SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
								CP[playerid]=1200;
								PlayerInfo[playerid][pLinia55] = 0;
								PlayerInfo[playerid][pLinia72] = 0;
								PlayerInfo[playerid][pLinia82] = 0;
								PlayerInfo[playerid][pLinia96] = 0;
								PlayerInfo[playerid][pNatrasiejest] = 0;
								SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz zjazd do zajezdni, wskazuje ją sygnał GPS. ");
				       			Przystanek(playerid, COLOR_BLUE, "Linia ZAJ \n Kierunek: Zajezdnia Ocean Docks\n {808080}Zatrzymuje się na przystankach");
				       			SendClientMessage(playerid, COLOR_ALLDEPT, " LSBD przypomina: {C0C0C0}Odstawiony do zajezdni autobus to szczęśliwy autobus :) ");
							}
				   	}
				   	case 7:
				   	{
						SendClientMessage(playerid, COLOR_YELLOW, "|_____________Objaśnienia_____________|");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}50$/p {FFFFF0}- określa premię za każdy przystanek");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}5min{FFFFF0} - orientacyjny czas przejazdy całej trasy (dwa okrążenia)");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}13p{FFFFF0} - liczba przystanków na trasie");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}/businfo{FFFFF0} - wyświetla informacje o systemie autobusów (w budowie)");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}/zakoncztrase{FFFFF0} - przerywa wykonywaną trasę i zmienia tablicę na domyślną");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}/zd{FFFFF0} - zamyka drzwi w autobusie i umożliwa dalszą jazdę");
						SendClientMessage(playerid, COLOR_GREEN, "Wypłatę za przejechane przystanki otrzymuje się DOPIERO po przejechaniu całej trasy!");
						SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}Podpowiedź:{FFFFF0} najszybsze zarobki gwarantuje linia 72");
						SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD<<_____________|");
					}
			   	}
		   	}
	   	}
   }
   
	if(dialogid == 1888)
	{
	    if(response)
	    {
	        if(IsPlayerAdmin(playerid))
	        {
	            new gf[256];
				dini_IntSet("Admini/weryfikacje.ini", "ilosc", dini_Int("Admini/weryfikacje.ini", "ilosc")+1);
    			new i = dini_Int("Admini/weryfikacje.ini", "ilosc");
 		    	format(gf, sizeof(gf), "Nick_%d", i);
   				dini_Set("Admini/weryfikacje.ini", gf, inputtext);
	        	ShowPlayerDialogEx(playerid, 1889, DIALOG_STYLE_INPUT, "Tworzenie weryfikacji", "Wpisz weryfikacje", "Stwórz", "");
			}
	    }
	}
	if(dialogid == 1889)
	{
	    if(IsPlayerAdmin(playerid))
     	{
     	    new gf[256], gf2[MAX_PLAYER_NAME + 1];
     	    new i = dini_Int("Admini/weryfikacje.ini", "ilosc");
     	    format(gf, sizeof(gf), "Weryfikacja_%d", i);
     	    format(gf2, sizeof(gf2), "Nick_%d", i);
     	    dini_Set("Admini/weryfikacje.ini", gf, inputtext);
     	    format(gf, sizeof(gf), "Weryfikacja utworzona pomyślnie.\nNick: %s\nWeryfikacja: %s", dini_Get("Admini/weryfikacje.ini", gf2), dini_Get("Admini/weryfikacje.ini", gf));
            ShowPlayerDialogEx(playerid, 0, DIALOG_STYLE_INPUT, "Tworzenie weryfikacji", gf, "OK", "");
      	}
	}
	if(dialogid==DIALOG_IBIZA_MIKSER)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //stream
				{
					ShowPlayerDialogEx(playerid, DIALOG_IBIZA_STREAM, DIALOG_STYLE_LIST, "Wybór streama", "Własny link\nClub Party\nEnergy Sound", "Wybierz", "Wróć");
					return 1;
				}
				case 1: //telebim
				{
					ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TELEBIM, DIALOG_STYLE_LIST, "Telebim opcje", "Zmień tekst\nZmień kolor\nAnimacja\nCzcionka", "Wybierz", "Wróć");
					return 1;
				}
				case 2: //światła
				{
					if(IbizaSwiatla)
					{
						WylaczSwiatla();
						IbizaSwiatla = false;
					}
					else
					{
						WlaczSwiatla();
						IbizaSwiatla = true;
					}
				}
				case 3: //strobo
				{
					if(!IbizaStrobo)	 //włącz
					{

						IbizaStroboObiekty[0] = CreateDynamicObject(354,1930.5400000,-2494.5100000,21.3700000,0.0000000,0.0000000,-5.6400000,1, 0, -1);
						IbizaStroboObiekty[1] = CreateDynamicObject(354,1930.7100000,-2492.0900000,21.1800000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[2] = CreateDynamicObject(354,1930.7100000,-2489.4900000,21.0800000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[3] = CreateDynamicObject(354,1930.7400000,-2487.0700000,21.1700000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[4] = CreateDynamicObject(354,1930.6900000,-2484.4700000,21.3600000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[5] = CreateDynamicObject(354,1934.3000000,-2479.9000000,12.5800000,0.0000000,0.0000000,0.4200000,1, 0, -1);
						IbizaStroboObiekty[6] = CreateDynamicObject(354,1934.3800000,-2499.5800000,12.5500000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[7] = CreateDynamicObject(354,1955.7200000,-2479.9700000,12.5800000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[8] = CreateDynamicObject(354,1955.8100000,-2499.5500000,12.5700000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[9] = CreateDynamicObject(354,1937.4000000,-2467.5600000,21.9100000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[10] = CreateDynamicObject(354,1939.4400000,-2467.4400000,21.9200000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[11] = CreateDynamicObject(354,1941.4900000,-2467.5200000,21.9300000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[12] = CreateDynamicObject(354,1943.4600000,-2467.5500000,21.9200000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[13] = CreateDynamicObject(354,1945.7600000,-2467.7400000,21.9300000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[14] = CreateDynamicObject(354,1935.8700000,-2471.1600000,14.5100000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[15] = CreateDynamicObject(354,1947.6300000,-2471.0700000,14.4900000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[16] = CreateDynamicObject(354,1944.4300000,-2466.3200000,14.4800000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[17] = CreateDynamicObject(354,1939.5800000,-2466.3200000,14.4500000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[18] = CreateDynamicObject(354,1958.4000000,-2470.3600000,14.4600000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[19] = CreateDynamicObject(354,1957.4700000,-2477.8700000,22.1700000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[20] = CreateDynamicObject(354,1958.7100000,-2487.0000000,21.1700000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[21] = CreateDynamicObject(354,1958.6500000,-2488.7100000,21.0900000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[22] = CreateDynamicObject(354,1958.6800000,-2490.2000000,21.1300000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[23] = CreateDynamicObject(354,1958.3500000,-2497.4500000,21.9200000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[24] = CreateDynamicObject(354,1949.5700000,-2503.1500000,23.4000000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[25] = CreateDynamicObject(354,1944.7700000,-2503.3100000,23.3800000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[26] = CreateDynamicObject(354,1942.6700000,-2503.2700000,23.3400000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaStroboObiekty[27] = CreateDynamicObject(354,1937.2100000,-2503.2100000,23.3500000,0.0000000,0.0000000,0.0000000,1, 0, -1);
						IbizaOdswiezObiekty();
						IbizaStrobo = true;
					}
					else //off
					{
						for(new i=0; i<28; i++)
						{
							DestroyDynamicObject(IbizaStroboObiekty[i]);
						}
						IbizaStrobo = false;
					}
				}
				case 4: //dym
				{

					if(!IbizaDym)
					{
						IbizaDymObiekty[0] = CreateDynamicObject(2780,1932.4400000,-2502.9500000,23.7500000,0.0000000,0.0000000,139.2600000, 1, 0, -1, 600.0); //Object number 0
						IbizaDymObiekty[1] = CreateDynamicObject(2780,1958.9700000,-2503.2600000,17.1300000,0.0000000,0.0000000,-132.7800000, 1, 0, -1, 600.0); //Object number 1
						IbizaDymObiekty[2] = CreateDynamicObject(2780,1944.4800000,-2489.7100000,5.3100000,0.0000000,0.0000000,0.0000000, 1, 0, -1, 600.0); //Object number 2
						IbizaDymObiekty[3] = CreateDynamicObject(2780,1941.2600000,-2475.9900000,7.8100000,0.0000000,0.0000000,0.0000000, 1, 0, -1, 600.0); //Object number 3
						IbizaDymObiekty[4] = CreateDynamicObject(2780,1954.3000000,-2496.6800000,5.0900000,0.0000000,0.0000000,0.0000000, 1, 0, -1, 600.0); //Object number 4
						IbizaDymObiekty[5] = CreateDynamicObject(2780,1954.5900000,-2482.4500000,5.9500000,0.0000000,0.0000000,0.0000000, 1, 0, -1, 600.0); //Object number 5						IbizaDymObiekty[6] = CreateDynamicObject(2780,1937.0200000,-2481.9100000,5.6900000,0.0000000,0.0000000,0.0000000, 1, 0, -1, 600.0); //Object number 6
						IbizaDymObiekty[7] = CreateDynamicObject(2780,1937.4100000,-2497.8000000,5.6900000,0.0000000,0.0000000,0.0000000, 1, 0, -1, 600.0); //Object number 7
						IbizaDymObiekty[8] = CreateDynamicObject(2780,1928.8200000,-2472.6500000,20.3400000,0.0000000,0.0000000,132.5400000, 1, 0, -1, 600.0); //Object number 8
						IbizaDymObiekty[9] = CreateDynamicObject(2780,1950.6400000,-2468.2800000,20.7200000,0.0000000,0.0000000,-20.7000000, 1, 0, -1, 600.0); //Object number 9
						IbizaDym = true;
						IbizaOdswiezObiekty();
					}
					else //wyłącz
					{
						for(new i=0; i<10; i++)
						{
							DestroyDynamicObject(IbizaDymObiekty[i]);
						}
						IbizaDym=false;
					}
				}
				case 5: //rury
				{
					if(!IbizaRury) //wysuń
					{
						MoveDynamicObject(IbizaRuryObiekty[0], 1936.6000, -2482.1799, 13.8000, 2.0);
						MoveDynamicObject(IbizaRuryObiekty[1], 1953.6300, -2482.1299, 13.8000, 2.0);
						MoveDynamicObject(IbizaRuryObiekty[2], 1936.5900, -2497.4700, 13.8000, 2.0);
						MoveDynamicObject(IbizaRuryObiekty[3], 1953.6500, -2497.4600, 13.8000, 2.0);
						MoveDynamicObject(IbizaKafle[0], 1936.5900000,-2482.1700000,12.6000, 2.0);
						MoveDynamicObject(IbizaKafle[1],1953.6400000,-2482.1300000,12.6000, 2.0);
						MoveDynamicObject(IbizaKafle[2], 1953.6500000,-2497.4700000,12.6000, 2.0);
						MoveDynamicObject(IbizaKafle[3], 1936.6100000,-2497.4700000,12.6000, 2.0);
						IbizaRury = true;

					}
					else //schowaj
					{
						MoveDynamicObject(IbizaRuryObiekty[0], 1936.6000, -2482.1799, 11.0000, 2.0);
						MoveDynamicObject(IbizaRuryObiekty[1], 1953.6300, -2482.1299, 11.0000, 2.0);
						MoveDynamicObject(IbizaRuryObiekty[2], 1936.5900, -2497.4700, 11.0000, 2.0);
						MoveDynamicObject(IbizaRuryObiekty[3], 1953.6500, -2497.4600, 11.0000, 2.0);
						MoveDynamicObject(IbizaKafle[0], 1936.5900000,-2482.1700000,12.5084, 2.0);
						MoveDynamicObject(IbizaKafle[1],1953.6400000,-2482.1300000,12.5084, 2.0);
						MoveDynamicObject(IbizaKafle[2] ,1953.6500000,-2497.4700000,12.5084, 2.0);
						MoveDynamicObject(IbizaKafle[3], 1936.6100000,-2497.4700000,12.5084, 2.0);
						IbizaRury = false;
					}
				}
			}
			MikserDialog(playerid);
		}
		return 1;
	}

	if(dialogid==DIALOG_IBIZA_STREAM)
	{
		if(response)
		{
			if(listitem==0)
			{
				ShowPlayerDialogEx(playerid, DIALOG_IBIZA_STREAM_WLASNY, DIALOG_STYLE_INPUT, "Własny stream", "Wklej poniżej link do streama", "Wybierz", "Wróć");
				return 1;
			}
			else
			{
				IbizaStreamID = listitem;
				WlaczStream(listitem);
			}
		}
		return MikserDialog(playerid);
	}
	if(dialogid==DIALOG_IBIZA_STREAM_WLASNY)
	{
		if(response)
		{
			if(strlen(inputtext) > 128) return SendClientMessage(playerid, -1, "Podany link jest zbyt długi");
			format(IbizaStream[0], 128, "%s", inputtext);
			IbizaStreamID = 0;
			WlaczStream(0);
		}
		else
		{
			ShowPlayerDialogEx(playerid, DIALOG_IBIZA_STREAM, DIALOG_STYLE_LIST, "Wybór streama", "Własny link\nClub Party\nEnergy Sound", "Wybierz", "Wróć");

		}
		return MikserDialog(playerid);
	}

	if(dialogid==DIALOG_IBIZA_TELEBIM)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //tekst
				{
					ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TEKST, DIALOG_STYLE_INPUT, "Zmiana tekstu", "Wpisz poniżej takst jaki ma być\nwyświetlony na telebimie (MAX 18 znaków)", "Zmień", "Wróć");
				}
				case 1: //kolor
				{
					ShowPlayerDialogEx(playerid, DIALOG_IBIZA_KOLOR, DIALOG_STYLE_LIST, "Zmiana koloru", "Biały\nPomarańczowy\nNiebieski\nZielony\nżółty", "Zmień", "Wróć");

				}
				case 2: //animacja
				{
					ShowPlayerDialogEx(playerid, DIALOG_IBIZA_ANIM, DIALOG_STYLE_LIST, "Opcje animacji", "Włącz\nWyłącz", "Zmień", "Wróć");
				}
				case 3: //czcionka
				{
					ShowPlayerDialogEx(playerid, DIALOG_IBIZA_CZCIONKA, DIALOG_STYLE_LIST, "Wybór czcionki", "Arial\nVerdana\nCourier New\nComic Sans MS\nTahoma", "Zmień", "Wróć");
				}

			}

		}
		else MikserDialog(playerid);

		return 1;

	}
	if(dialogid==DIALOG_IBIZA_ANIM)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(Telebim[tRuchomy]) return SendClientMessage(playerid, -1, "Animacja jest już właczona!");
				if(Telebim[tWRuchu] ) return SendClientMessage(playerid, -1, "Poczekaj aż animacja skończy swój cykl!!!");
				new dl = strlen(Telebim[tTekst]);
				format(Telebim[tTekstAnim], sizeof Telebim[tTekstAnim], "");
				for(new i; i<38+(2*dl); i++)
				{
					format(Telebim[tTekstAnim], sizeof Telebim[tTekstAnim], "%s%s", Telebim[tTekstAnim], IBIZA_WYPELNIENIE);
				}
				format(Telebim[tTekstAnim], sizeof(Telebim[tTekstAnim]), "%s%s|", Telebim[tTekstAnim], Telebim[tTekst]);
				SetDynamicObjectMaterialText(Telebim[tID], 0 , Telebim[tTekstAnim],  Telebim[tSize], Telebim[tCzcionka], Telebim[tFSize], Telebim[tBold], Telebim[tCzcionkaKolor], Telebim[tBackg], Telebim[tAli]);
				Telebim[tRuchomy] = 1;
				Telebim[tWRuchu] = 1;
				SetTimerEx("TelebimAnim", Telebim[tSzybkosc], false, "d", strlen(Telebim[tTekstAnim]));
				SendClientMessage(playerid, -1, "Włączyłeś animacje");
			}
			else
			{
				if(!Telebim[tRuchomy]) return SendClientMessage(playerid, -1, "Animacje jest już wyłączona!");
				Telebim[tRuchomy] = 0;
				SendClientMessage(playerid, -1, "Wyłączyłeś animacje");
			}
			MikserDialog(playerid);
		}
		else
		{
			ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TELEBIM, DIALOG_STYLE_LIST, "Telebim opcje", "Zmień tekst\nZmień kolor\nAnimacja\nCzcionka", "Wybierz", "Wróć");
		}
		return 1;

	}
	if(dialogid==DIALOG_IBIZA_CZCIONKA)
	{
		if(response)
		{
			format(Telebim[tCzcionka], sizeof Telebim[tCzcionka], "%s", IbizaCzcionkiTelebim[listitem]);
			SetDynamicObjectMaterialText(Telebim[tID], 0 , Telebim[tTekst],  Telebim[tSize], Telebim[tCzcionka], Telebim[tFSize], Telebim[tBold], Telebim[tCzcionkaKolor], Telebim[tBackg], Telebim[tAli]);
			SendClientMessage(playerid, -1, "Zmieniłeś czcionkę");
			MikserDialog(playerid);
		}
		else
		{
			ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TELEBIM, DIALOG_STYLE_LIST, "Telebim opcje", "Zmień tekst\nZmień kolor\nAnimacja\nCzcionka", "Wybierz", "Wróć");
		}
		return 1;

	}
	if(dialogid==DIALOG_IBIZA_KOLOR)
	{
		if(response)
		{
			Telebim[tCzcionkaKolor] = IbizaKoloryTelebim[listitem];
			SetDynamicObjectMaterialText(Telebim[tID], 0 , Telebim[tTekst],  Telebim[tSize], Telebim[tCzcionka], Telebim[tFSize], Telebim[tBold], Telebim[tCzcionkaKolor], Telebim[tBackg], Telebim[tAli]);
			SendClientMessage(playerid, -1, "Zmieniłeś kolor napisu");
			MikserDialog(playerid);
		}
		else
		{
			ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TELEBIM, DIALOG_STYLE_LIST, "Telebim opcje", "Zmień tekst\nZmień kolor\nAnimacja\nCzcionka", "Wybierz", "Wróć");
		}
		return 1;
	}
	if(dialogid==DIALOG_IBIZA_TEKST)
	{
		if(response)
		{
			if( strlen(inputtext) > DLUGOSC_TELEBIMA-1 )
			{
				SendClientMessage(playerid, 0xFF0000FF, "Podany tekst jest za długi");
				ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TEKST, DIALOG_STYLE_INPUT, "Zmiana tekstu", "Wpisz poniżej takst jaki ma być\nwyświetlony na telebimie (MAX 18 znaków)", "Ustaw", "Anuluj");
			}
			else
			{
				if(Telebim[tRuchomy] || Telebim[tWRuchu] ) return SendClientMessage(playerid, -1, "Nie możesz zmienić tekstu podczas działania animacji, najpierw ją zatrzymaj!");
				format(Telebim[tTekst], sizeof Telebim[tTekst], "%s", inputtext);
				SetDynamicObjectMaterialText(Telebim[tID], 0 , Telebim[tTekst],  Telebim[tSize], Telebim[tCzcionka], Telebim[tFSize], Telebim[tBold], Telebim[tCzcionkaKolor], Telebim[tBackg], Telebim[tAli]);
				SendClientMessage(playerid, 0x00FF00FF, "Zmieniłeś napis na telebimie");
				MikserDialog(playerid);

			}
			return 1;
		}
		else
		{
			ShowPlayerDialogEx(playerid, DIALOG_IBIZA_TELEBIM, DIALOG_STYLE_LIST, "Telebim opcje", "Zmień tekst\nZmień kolor\nAnimacja\nCzcionka", "Wybierz", "Wróć");
			return 1;
		}
	}

	if(dialogid==DIALOG_IBIZA_BILET)
	{
		new string[128];
		new id = GetPVarInt(playerid, "IbizaBiletSell");
		if(response)
		{
			//if(PlayerInfo[playerid][pCash] < IbizaBilet) return SendClientMessage(playerid, -1, "Nie masz wystarczającej ilości pieniędzy");
			new hajs = kaska[playerid];
			if(hajs < IbizaBilet)
			{
				SendClientMessage(id, -1, "Ten gracz nie ma tyle kasy");
				return SendClientMessage(playerid, -1, "Nie masz wystarczającej ilości pieniędzy");
			}
			else
			{
				//PlayerInfo[playerid][pCash]-=IbizaBilet;
				ZabierzKaseDone(playerid, IbizaBilet); //HAJS coś takiego jak wyżej, nwm dokładnie jak macie
				Sejf_Add(FAMILY_IBIZA, IbizaBilet);
				SetPVarInt(playerid, "IbizaBilet", 1);
				format(string, sizeof string, "%s kupił‚ od Ciebie bilet", PlayerName(playerid));
				SendClientMessage(id, 0x0080D0FF, string);
				format(string, sizeof string, "Kupiłeś bilet do Ibiza Club za %d$", IbizaBilet);
				SendClientMessage(playerid, 0x00FF00FF, string);
			}
		}
		else
		{
			format(string, sizeof string, "Gracz %s nie zgodził‚ się na kupno biletu", PlayerName(playerid));
			SendClientMessage(id, 0xFF0030FF, string);

		}
		DeletePVar(playerid, "IbizaBiletSell");
		return 1;
	}
	if(dialogid==DIALOG_IBIZA_BAR)
	{
		new string[128];
		new id = GetPVarInt(playerid, "IbizaBar");
		if(response)
		{

			new hajs = kaska[playerid]; //HAJS zmienić na pobieranie ze struktury
			new drink = GetPVarInt(playerid, "IbizaDrink");
			if(hajs >=IbizaDrinkiCeny[drink]) //if(PlayerInfo[playerid][pCash] >= IbizaDrinkiCeny[drink] )
			{
				ZabierzKaseDone(playerid, IbizaDrinkiCeny[drink]); //HAJS zabranie pieniędzy ze struktury
				Sejf_Add(FAMILY_IBIZA, IbizaDrinkiCeny[drink]);
				SetPlayerSpecialAction(playerid, 22);
				//DO   **Marcepan_Marks kupuje w barze [nazwa drinka]**

			}
			else
			{
				SendClientMessage(playerid, -1, "Nie masz wystarczającej ilości pieniędzy");
				format(string, sizeof string, "Klient %s nie ma tyle pieniędzy", PlayerName(playerid));
				SendClientMessage(id, 0xB52E2BFF, string);
			}


		}
		else
		{
			format(string, sizeof string, "Gracz %s nie zgodził‚ się na kupno drinka", PlayerName(playerid));
			SendClientMessage(id, 0xB52E2BFF, string);
		}
		DeletePVar(playerid, "IbizaBar");
		DeletePVar(playerid, "IbizaDrink");
		return 1;
	}
	if(dialogid == D_ERS_SPRZEDAZ_APTECZKI)
	{
		new string[128];
		new id = GetPVarInt(playerid, "HealthPackOffer");
		if(response)
		{
			new hajs = kaska[playerid];
			if(hajs < (HEALTH_PACK_PRICE + HEALTH_PACK_AMOUNTDOCTOR))
			{
				SendClientMessage(id, -1, "Ten gracz nie ma tyle kasy");
				return SendClientMessage(playerid, -1, "Nie masz wystarczającej ilości pieniędzy");
			}
			else
			{
				format(string, sizeof string, "%s kupił od Ciebie apteczkę. Otrzymujesz %d$ prowizji.", PlayerName(playerid), HEALTH_PACK_AMOUNTDOCTOR);
				SendClientMessage(id, 0x0080D0FF, string);
				format(string, sizeof string, "Kupiłeś apteczkę od Lekarza za %d$", (HEALTH_PACK_PRICE + HEALTH_PACK_AMOUNTDOCTOR));
				SendClientMessage(playerid, 0x00FF00FF, string);
				//format(string, sizeof string, "[ERS] Lekarz %s sprzedał apteczkę! Na konto grupy wpływa %d$", PlayerName(id), HEALTH_PACK_PRICE);
        		//GroupSendMessage(4, COLOR_GREEN, string);
				ZabierzKase(playerid, (HEALTH_PACK_PRICE + HEALTH_PACK_AMOUNTDOCTOR));
				DajKaseDone(id, HEALTH_PACK_AMOUNTDOCTOR);
        		Sejf_Add(FRAC_ERS, HEALTH_PACK_PRICE);
				PlayerInfo[playerid][pHealthPacks]++;
				Item_Add("Apteczka", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_APTECZKA, 0, 0, true, playerid, 1);
			}
		}
		else
		{
			format(string, sizeof string, "Gracz %s nie zgodził się na kupno apteczki.", PlayerName(playerid));
			SendClientMessage(id, 0xFF0030FF, string);
		}
		DeletePVar(playerid, "HealthPackOffer");
		return 1;
	}

	if(dialogid == D_MECH_SPRZEDAZ_FIXKIT)
	{
		new id = GetPVarInt(playerid, "FixKitOffer");
		if(response)
		{
			if(kaska[playerid] < PRICE_ZESTAW_NAPR)
			{
				SendClientMessage(id, -1, "Ten gracz nie ma tyle kasy");
				return SendClientMessage(playerid, -1, "Nie masz wystarczającej ilości pieniędzy");
			}
			else
			{
				SendClientMessage(id, 0x0080D0FF, sprintf("%s kupił od Ciebie zestaw naprawczy. Otrzymujesz "#PRICE_ZESTAW_NAPR"$", GetNick(playerid)));
				SendClientMessage(playerid, 0x00FF00FF, sprintf("Kupiłeś zestaw od mechanika %s za "#PRICE_ZESTAW_NAPR"$", GetNick(id)));
				ZabierzKaseDone(playerid, PRICE_ZESTAW_NAPR);
				DajKaseDone(id, PRICE_ZESTAW_NAPR);
				PlayerInfo[playerid][pFixKit]++;
				PlayerInfo[id][pMechSkill]++;
                if(PlayerInfo[id][pMechSkill] == 50)
                { SendClientMessage(id, COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 2, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                else if(PlayerInfo[id][pMechSkill] == 100)
                { SendClientMessage(id, COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 3, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                else if(PlayerInfo[id][pMechSkill] == 200)
                { SendClientMessage(id, COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 4, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
                else if(PlayerInfo[id][pMechSkill] == 400)
                { SendClientMessage(id, COLOR_YELLOW, "* Twoje umiejętności Mechanika wynoszą 5, Możesz teraz tankować graczom więcej paliwa za jednym razem."); }
			}
		}
		else
		{
			SendClientMessage(id, 0xFF0030FF, sprintf("Gracz %s nie zgodził się na kupno zestawu.", GetNick(playerid)));
		}
		DeletePVar(playerid, "FixKitOffer");
		return 1;
	}

	if(dialogid == D_UZYCIE_APTECZKI)
	{
		new string[144];
		new id = GetPVarInt(playerid, "HealthPackOffer");
		if(response)
		{
			if(GetDistanceBetweenPlayers(playerid,id) > 5) return SendClientMessage(playerid, 0xFF0030FF, "Udzielający pomocy jest zbyt daleko");
			
			if(GroupPlayerDutyPerm(id, PERM_MEDIC))
			{
				SendClientMessage(playerid, COLOR_WHITE, "Zostałeś uzdrowiony przez Lekarza");
				format(string, sizeof(string),"* Lekarz %s wyciąga apteczkę, bandażuje rany oraz podaje leki %s.", GetNick(id), GetNick(playerid));
				ProxDetector(20.0, id, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				format(string, sizeof(string), "%s czuje się lepiej dzięki interwencji lekarza.", GetNick(playerid));
				ProxDetector(20.0, id, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				pobity[playerid] = 0;
				ZdejmijBW(playerid, 3500);
				SetPlayerHealth(playerid, 90.0);
			}
			else
			{
				if(PlayerInfo[id][pHealthPacks] < 1) return SendClientMessage(id, 0xFF0030FF, "Gracz nie posiada już apteczek by udzielić Ci pomocy.");
				if(PlayerInfo[playerid][pBW] > 0) return SendClientMessage(playerid, 0xFF0030FF, "Jesteś ciężko ranny, takie obrażenia może opatrzyć tylko lekarz! (/wezwij medyk)");
				format(string, sizeof(string),"* Udzielono pomocy medycznej %s i opatrzono rany.", GetNick(playerid));
				SendClientMessage(id, COLOR_WHITE, string);
				format(string, sizeof(string),"* %s wyciąga apteczkę, bandażuje obrażenia %s oraz podaje mu leki.", GetNick(id), GetNick(playerid));
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				PlayerInfo[id][pHealthPacks]--;
				TakeApteczka(id, 1);
				pobity[playerid] = 0;
				ZdejmijBW(playerid, 6000);
				SetPlayerHealth(playerid, HEALTH_PACK_HP);
			}
		}
		else
		{
			format(string, sizeof string, "Gracz %s nie zgodził się na udzielenie pomocy medycznej.", PlayerName(playerid));
			SendClientMessage(id, 0xFF0030FF, string);
		}
		DeletePVar(playerid, "HealthPackOffer");
		return 1;
	}
	if(dialogid == D_ANIMLIST)
	{
		if(!response)
		{
			return 1;
		}
		
		switch(listitem)
		{
		    case 0: MRP_DoAnimation(playerid,"@bar1");
		    case 1: MRP_DoAnimation(playerid,"@caluj1");
		    case 2: MRP_DoAnimation(playerid,"@car1");
		    case 3: MRP_DoAnimation(playerid,"@colt1");
		    case 4: MRP_DoAnimation(playerid,"@crack1");
		    case 5: MRP_DoAnimation(playerid,"@dance1");
			case 6: MRP_DoAnimation(playerid,"@diler1");
			case 7: MRP_DoAnimation(playerid,"@idz1");
			case 8: MRP_DoAnimation(playerid,"@klepnij1");
			case 9: MRP_DoAnimation(playerid,"@krzeslo1");

			case 10: MRP_DoAnimation(playerid,"@lez1");
			case 11: MRP_DoAnimation(playerid,"@lokiec1");
		    case 12: MRP_DoAnimation(playerid,"@lowrider1");
		    case 13: MRP_DoAnimation(playerid,"@nies1");
		    case 14: MRP_DoAnimation(playerid,"@papieros1");
		    case 15: MRP_DoAnimation(playerid,"@placz1");
			case 16: MRP_DoAnimation(playerid,"@ranny1");
			case 17: MRP_DoAnimation(playerid,"@rap1");
			case 18: MRP_DoAnimation(playerid,"@rozmowa1");
			case 19: MRP_DoAnimation(playerid,"@sex1");

			case 20: MRP_DoAnimation(playerid,"@sklep1");
   			case 21: MRP_DoAnimation(playerid,"@smierc1");
		    case 22: MRP_DoAnimation(playerid,"@spij1");
		    case 23: MRP_DoAnimation(playerid,"@spray1");
		    case 24: MRP_DoAnimation(playerid,"@stack1");
		    case 25: MRP_DoAnimation(playerid,"@strip1");
			case 26: MRP_DoAnimation(playerid,"@wygralem1");
			case 27: MRP_DoAnimation(playerid,"@yo1");
			case 28: MRP_DoAnimation(playerid,"@bomba"); //
			case 29: MRP_DoAnimation(playerid,"@box");

		    case 30: MRP_DoAnimation(playerid,"@celuj");
       		case 31: MRP_DoAnimation(playerid,"@celujkarabin");
		    case 32: MRP_DoAnimation(playerid,"@crack");
		    case 33: MRP_DoAnimation(playerid,"@czas");
		    case 34: MRP_DoAnimation(playerid,"@dodge");
		    case 35: MRP_DoAnimation(playerid,"@doping");
			case 36: MRP_DoAnimation(playerid,"@drap");
			case 37: MRP_DoAnimation(playerid,"@dzieki");
			case 38: MRP_DoAnimation(playerid,"@fuck");
			case 39: MRP_DoAnimation(playerid,"@greet");

		    case 40: MRP_DoAnimation(playerid,"@hitch");
		    case 41: MRP_DoAnimation(playerid,"@joint");
		    case 42: MRP_DoAnimation(playerid,"@karta");
		    case 43: MRP_DoAnimation(playerid,"@komputer");
		    case 44: MRP_DoAnimation(playerid,"@kozak");
		    case 45: MRP_DoAnimation(playerid,"@taichi");
			case 46: MRP_DoAnimation(playerid,"@machaj");
			case 47: MRP_DoAnimation(playerid,"@maska");
			case 48: MRP_DoAnimation(playerid,"@medyk");
			case 49: MRP_DoAnimation(playerid,"@napad");

		    case 50: MRP_DoAnimation(playerid,"@nie");
		    case 51: MRP_DoAnimation(playerid,"@odbierz");
		    case 52: MRP_DoAnimation(playerid,"@odloz");
		    case 53: MRP_DoAnimation(playerid,"@oh");
		    case 54: MRP_DoAnimation(playerid,"@opieraj");
		    case 55: MRP_DoAnimation(playerid,"@pa");
			case 56: MRP_DoAnimation(playerid,"@pij");
			case 57: MRP_DoAnimation(playerid,"@placz");
			case 58: MRP_DoAnimation(playerid,"@przeladuj");
			case 59: MRP_DoAnimation(playerid,"@ramiona");

			case 60: MRP_DoAnimation(playerid,"@rozciagaj");
			case 61: MRP_DoAnimation(playerid,"@rozlacz");
		    case 62: MRP_DoAnimation(playerid,"@siad");
		    case 63: MRP_DoAnimation(playerid,"@sikaj");
		    case 64: MRP_DoAnimation(playerid,"@smiech");
		    case 65: MRP_DoAnimation(playerid,"@stoj");
			case 66: MRP_DoAnimation(playerid,"@tak");
			case 67: MRP_DoAnimation(playerid,"@waledochodze");
			case 68: MRP_DoAnimation(playerid,"@walekonia");
			case 69: MRP_DoAnimation(playerid,"@wolaj");

			case 70: MRP_DoAnimation(playerid,"@wozszlug");
   			case 71: MRP_DoAnimation(playerid,"@wstan");
		    case 72: MRP_DoAnimation(playerid,"@wtf");
		    case 73: MRP_DoAnimation(playerid,"@wymiotuj");
		    case 74: MRP_DoAnimation(playerid,"@zarcie");
		    case 75: MRP_DoAnimation(playerid,"@zmeczony");
		}
		return 1;
	}
    if(dialogid == DIALOG_ELEVATOR_SAD)
    {
        if(response)
        {
			switch(listitem)
			{
			    case 0: // archiwum
				{
				 	if(SadWinda[0] == 1)
					{
						sendTipMessageEx(playerid, COLOR_RED, "Ten poziom został zablokowany przez pracowników sądu!"); 
						return 1;
					}
    	            SetPlayerVirtualWorld(playerid,10);
    				TogglePlayerControllable(playerid,0);
                    Wchodzenie(playerid);
    				SetPlayerPos(playerid,1311.5483,-1361.2096,62.8567);
    				SetInteriorTimeAndWeather(playerid); 
					GameTextForPlayer(playerid, "~w~By~n~~r~skLolsy & skTom", 5000, 1);
				}
				case 1: // hol 
    			{
					if(SadWinda[1] == 1)
					{
						sendTipMessageEx(playerid, COLOR_RED, "Ten poziom został zablokowany przez pracowników sądu!"); 
						return 1;
					}
    	            SetPlayerVirtualWorld(playerid,11);
    				TogglePlayerControllable(playerid,0);
                    Wchodzenie(playerid);
    				SetPlayerPos(playerid,1305.9991,-1326.1344,52.5659);
    				SetInteriorTimeAndWeather(playerid); 
					GameTextForPlayer(playerid, "~w~By~n~~r~skLolsy & skTom", 5000, 1);
				}
				case 2: //Sale Rozpraw
				{
				  	if(SadWinda[2] == 1)
					{
						sendTipMessageEx(playerid, COLOR_RED, "Ten poziom został zablokowany przez pracowników sądu!"); 
						return 1;
					}
    	            SetPlayerVirtualWorld(playerid,12);
    				TogglePlayerControllable(playerid,0);
                    Wchodzenie(playerid);
    				SetPlayerPos(playerid,1309.9982,-1364.2216,59.6271);
    				SetInteriorTimeAndWeather(playerid); 
					GameTextForPlayer(playerid, "~w~By~n~~r~skLolsy & skTom", 5000, 1);
				}
                case 3: //Biura
				{
					if(SadWinda[3] == 1)
					{
						sendTipMessageEx(playerid, COLOR_RED, "Ten poziom został zablokowany przez pracowników sądu!"); 
						return 1;
					}
    	            SetPlayerVirtualWorld(playerid,13);
    				TogglePlayerControllable(playerid,0);
                    Wchodzenie(playerid);
    				SetPlayerPos(playerid,1310.1989,-1328.8876,82.5859);
    				SetInteriorTimeAndWeather(playerid); 
					GameTextForPlayer(playerid, "~w~By~n~~r~skLolsy & skTom", 5000, 1);
				}
				case 4: //Socjal
				{
					if(SadWinda[4] == 1)
					{
						sendTipMessageEx(playerid, COLOR_RED, "Ten poziom został zablokowany przez pracowników sądu!"); 
						return 1;
					}
    	            SetPlayerVirtualWorld(playerid,14);
    				TogglePlayerControllable(playerid,0);
                    Wchodzenie(playerid);
    				SetPlayerPos(playerid,1310.2946,-1321.2517,74.6955);
    				SetInteriorTimeAndWeather(playerid); 
					GameTextForPlayer(playerid, "~w~By~n~~r~skLolsy & skTom", 5000, 1);
				
				}
				case 5: //Dach
				{
					if(SadWinda[5] == 1)
					{
						sendTipMessageEx(playerid, COLOR_RED, "Ten poziom został zablokowany przez pracowników sądu!"); 
						return 1;
					}
    	            SetPlayerVirtualWorld(playerid,0);
    	            SetPlayerPos(playerid,1310.3961,-1319.0530,35.6587);
    	            new Hour, Minute, Second;
    				gettime(Hour, Minute, Second);
    				SetPlayerTime(playerid,Hour,Minute);
					
				
				}
			}
		}
	}
    else if(dialogid == D_SERVERINFO)
    {
        if(response) return 1;
        TextDrawHideForPlayer(playerid, TXD_Info);
        return 1;
    }
    else if(dialogid == D_EDIT)
    {
        if(!response) return 1;
        new lStr[1024];
        switch(listitem)
        {
            case 1:
            {
                if(!Uprawnienia(playerid, ACCESS_EDITCAR)) return SendClientMessage(playerid, COLOR_RED, "Brak uprawnień");
                new Float:x, Float:y, Float:z;
                GetPlayerPos(playerid, x ,y ,z);
                for(new i=0;i<MAX_VEHICLES;i++)
                {
                    if(VehicleUID[i][vUID] == 0) continue;
                    if(GetVehicleDistanceFromPoint(i, x, y, z) < 15.0)
                    {
                        format(lStr, 1024, "%s%d » %s (%d)\n", lStr, CarData[VehicleUID[i][vUID]][c_UID], VehicleNames[GetVehicleModel(i)-400], i);
                    }
                }
                strcat(lStr, "Wprowadź UID pojazdu, który chcesz edytować:");
                ShowPlayerDialogEx(playerid, D_EDIT_CAR, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", lStr, "Dalej", "Wróć");
            }
        }
        return 1;
    }
    //EDYCJA POJAZDÓW
    else if(dialogid == D_EDIT_CAR)
    {
        if(!response) return RunCommand(playerid, "/edytuj",  "");
        new lStr[1024];
        if(strval(inputtext) == 0)
        {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x ,y ,z);
            for(new i=0;i<MAX_VEHICLES;i++)
            {
                if(VehicleUID[i][vUID] == 0) continue;
                if(GetVehicleDistanceFromPoint(i, x, y, z) < 15.0)
                {
                    format(lStr, 1024, "%s%d » %s (%d)\n", lStr, CarData[VehicleUID[i][vUID]][c_UID], VehicleNames[GetVehicleModel(i)-400], i);
                }
            }
            strcat(lStr, "Wprowadź UID pojazdu, który chcesz edytować:");
            ShowPlayerDialogEx(playerid, D_EDIT_CAR, DIALOG_STYLE_INPUT, "Edycja pojazdów", lStr, "Dalej", "Wróć");
            return 1;
        }
        new lID = Car_GetIDXFromUID(strval(inputtext));
        if(lID == -1)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "Pojazd nie był wczytany do systemu, inicjalizacja ...");
            lID = Car_LoadEx(strval(inputtext));
            if(lID == -1) return SendClientMessage(playerid, COLOR_GRAD2, "... brak pojazdu w bazie.");
        }

        SetPVarInt(playerid, "edit-car", lID);
        ShowCarEditDialog(playerid);
        return 1;
    }
    else if(dialogid == D_EDIT_CAR_MENU)
    {
        if(!response) return RunCommand(playerid, "/edytuj",  "");
        new car = GetPVarInt(playerid, "edit-car");
        if(CarData[car][c_UID] == 0) return 1;
        switch(listitem)
        {
            case 0:
            {
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_MODEL, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Wprowadź model pojazdu:", "Ustaw", "Wróć");
            }
            case 1:
            {
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_OWNER, DIALOG_STYLE_LIST, "{8FCB04}Edycja {FFFFFF}pojazdów", "Brak\nGrupa\nGracz\nPraca\nSpecjalny\nPubliczny", "Wybierz", "Wróć");
            }
            case 2:
            {
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_RANG, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Wprowadź rangę (dla grup) lub skill dla pracy:", "Ustaw", "Wróć");
            }
			case 3:
			{
				ShowPlayerDialogEx(playerid, 1089, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}opisu", "Wprowadź nowy opis dla pojazdu:", "Ustaw", "Wróć");
			}
            case 4:
            {
                CarData[car][c_HP] = CarData[car][c_MaxHP];
                if(CarData[car][c_ID] != 0)
                {
                    SetVehicleHealth(CarData[car][c_ID], CarData[car][c_MaxHP]);
                }
                Car_Save(car, CAR_SAVE_STATE);
            }
            case 5:
            {
				new VW = GetPlayerVirtualWorld(playerid);
                new veh = CarData[car][c_ID];
                new Float:X, Float:Y, Float:Z, Float:A;
                GetVehiclePos(veh, X, Y, Z);
                GetVehicleZAngle(veh, A);
                CarData[car][c_Pos][0] = X;
                CarData[car][c_Pos][1] = Y;
                CarData[car][c_Pos][2] = Z;
				CarData[car][c_VW] = VW; //Zapisywanie VirtualWorldu
                CarData[car][c_Rot] = A;
                Car_Save(CarData[car][c_ID], CAR_SAVE_STATE);
                Car_Unspawn(veh);
                Car_Spawn(car);
                new string[128];
				format(string, 128, "Zmieniono parking dla pojazdu %s [ID: %d] [UID: %d] [VW: %d]", VehicleNames[GetVehicleModel(veh)-400], veh, CarData[car][c_UID], CarData[car][c_VW]);
				SendClientMessage(playerid, 0xFFC0CB, string);
				Log(serverLog, WARNING, "Gracz %s zaparkował pojazd %s", GetPlayerLogName(playerid), GetVehicleLogName(veh));
            }
            case 6:
            {
                CarData[car][c_Keys] = 0;
                Car_Save(car, CAR_SAVE_OWNER);
            }
            case 7:
            {
                SetPVarInt(playerid, "car_edit_color", 1);
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_COLOR, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Podaj nowy kolor (od 0 do 255).", "Ustaw", "Wróć");
            }
            case 8:
            {
                SetPVarInt(playerid, "car_edit_color", 2);
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_COLOR, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Podaj nowy kolor (od 0 do 255).", "Ustaw", "Wróć");
            }
        }
        return 1;
    }
	else if(dialogid == D_HASLO_INFO)
	{
		if(!response) return KickEx(playerid); 
		if(response)
		{
			sendTipMessage(playerid, "Zmieniasz hasło:");
			ShowPlayerDialogEx(playerid, D_HASLO_ZMIEN, DIALOG_STYLE_INPUT, "M-RP", "Wprowadź poniżej nowe hasło, którego będziesz używał\ndo gry na naszym serwisie!", "Zatwierdź", "Odrzuć"); 
		}
		return 1;
	}
	else if(dialogid == D_HASLO_ZMIEN)
	{
		if(!response) return KickEx(playerid); 
		if(response)
		{
			if(strlen(inputtext) < 4)
			{
				sendErrorMessage(playerid, "Hasło musi posiadać +3 znaki!"); 
				return 1;
			}
			if(strfind(inputtext, "%") != -1)
			{
				sendErrorMessage(playerid, "Hasło nie może zawierać znaku procenta!");
				return 1;
			}
			sendErrorMessage(playerid, "Twoje hasło do konta w grze zostało zmienione!!!!");
			sendErrorMessage(playerid, "Jeśli nie jesteś pewien  nowego hasła - nie wychodź z serwera i zmień je za pomocą /zmienhaslo");
			sendErrorMessage(playerid, "Nowe hasło:");
			SendClientMessage(playerid, COLOR_PANICRED, inputtext);

			Log(serverLog, WARNING, "Gracz %s zmienił sobie hasło.", GetPlayerLogName(playerid));
			MruMySQL_ChangePassword(GetNick(playerid), inputtext);

			if(GetPVarInt(playerid, "ChangingPassword")) //password changing
			{
				if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0 || PlayerInfo[playerid][pZG] > 0 || IsAScripter(playerid))
				{
					ShowPlayerDialogEx(playerid, 235, DIALOG_STYLE_INPUT, "Weryfikacja", "Logujesz się jako członek administracji. Zostajesz poproszony o wpisanie w\nponiższe pole hasła weryfikacyjnego. Pamiętaj, aby nie podawać go nikomu!", "Weryfikuj", "Wyjdź");
				}

				if(PlayerInfo[playerid][pJailed] == 0 && GetCombatLogByPUID(PlayerInfo[playerid][pUID]) == -1)
				{ 
    				lowcap[playerid] = 1;
					SetPVarInt(playerid, "spawn", 1);
					SetPlayerSpawn(playerid);
					TogglePlayerSpectating(playerid, false);
					ShowPlayerDialogEx(playerid, 1, DIALOG_STYLE_MSGBOX, "Serwer", "Czy chcesz się teleportować do poprzedniej pozycji?", "TAK", "NIE");
				}
			}
		}
		return 1;
	}
	else if(dialogid == 1089)
	{
		if(!response) return ShowCarEditDialog(playerid);
		sendTipMessage(playerid, "Trwają prace!"); 
	
		return 1;
	}
    else if(dialogid == D_EDIT_CAR_MODEL)
    {
        if(!response) return ShowCarEditDialog(playerid);
        if(strval(inputtext) < 400 || strval(inputtext) > 611)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "Nieprawidłowy model pojazdu.");
            return ShowCarEditDialog(playerid);
        }
        new car = GetPVarInt(playerid, "edit-car");
        new Float:x, Float:y, Float:z, Float:a, bool:dotp=false;
        if(CarData[car][c_ID] != 0)
        {
            GetVehiclePos(CarData[car][c_ID], x, y, z);
            GetVehicleZAngle(CarData[car][c_ID], a);
            Car_Unspawn(CarData[car][c_ID], true);
            dotp=true;
        }
		new oldmodel = CarData[car][c_Model];
        CarData[car][c_Model] = strval(inputtext);
        Car_Save(car, CAR_SAVE_STATE);
        if(dotp)
        {
            Car_Spawn(car);
            SetVehiclePos(CarData[car][c_ID], x, y, z);
            SetVehicleZAngle(CarData[car][c_ID], a);
        }
		
		//logi
		Log(adminLog, WARNING, "Admin %s zmienił model pojazdu %d z %s[%d] na %s[%d]", \
			GetPlayerLogName(playerid), \
			CarData[car][c_UID], \
			VehicleNames[oldmodel-400], oldmodel, \
			VehicleNames[CarData[car][c_Model]-400], CarData[car][c_Model] \
		);
        return 1;
    }
    else if(dialogid == D_EDIT_CAR_RANG)
    {
        if(!response) return ShowCarEditDialog(playerid);
        if(strval(inputtext) < 0)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "Nieprawidłowa ranga.");
            return ShowCarEditDialog(playerid);
        }
        new car = GetPVarInt(playerid, "edit-car");

        CarData[car][c_Rang] = strval(inputtext);
        Car_Save(car, CAR_SAVE_OWNER);
        ShowCarEditDialog(playerid);
        return 1;
    }
    else if(dialogid == D_EDIT_CAR_OWNER)
    {
        if(!response) return ShowCarEditDialog(playerid);
        SetPVarInt(playerid, "edit_car_ownertype", listitem);
        new car = GetPVarInt(playerid, "edit-car");
        new string[1456];
        switch(listitem)
        {
            case 0:
            {
                new lSlot;
                if(CarData[car][c_OwnerType] == CAR_OWNER_PLAYER)
                {
                    new lUID = Car_GetOwner(car);
					if(lUID != 0)
					{
						foreach(new i : Player)
						{
							if(PlayerInfo[i][pUID] == lUID)
							{
								for(new j=0;j<MAX_CAR_SLOT;j++)
								{
									if(PlayerInfo[i][pCars][j] == car)
									{
										PlayerInfo[i][pCars][j] = 0;
										lSlot = j+1;
										break;
									}
								}

								format(string, sizeof(string), " Usunięto pojazd ze slotu %d graczowi %s.", lSlot, GetNick(i));
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								
                   				Log(adminLog, WARNING, "Admin %s usunął %s pojazd %s ze slotu %d", 
									GetPlayerLogName(playerid), 
									GetPlayerLogName(i),
									GetCarDataLogName(car),
									lSlot);
								break;
							}
						}
					}
                }
                CarData[car][c_OwnerType] = 0;
                Car_Save(car, CAR_SAVE_OWNER);
				
				Log(adminLog, WARNING, "Admin %s zmienił w %s typ pojazdu na 0", GetPlayerLogName(playerid), GetCarDataLogName(car));
            }
            case 1:
            {
                for(new i=0;i<MAX_GROUPS;i++)
                {
					if(!IsValidGroup(i)) continue;
                    //format(string, 1456, "%s%d\t%s\n", string, i, GroupInfo[i][g_Name]);
					va_SendClientMessage(playerid, COLOR_GREEN, "(%d) {%06x}%s", i, GroupInfo[i][g_Color] >>> 8, GroupInfo[i][g_Name]);
                }
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_OWNER_APPLY, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Podaj ID grupy:", "Ustaw", "Wróć");
                return 1;
            }
            case 2:
            {
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_OWNER_APPLY, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Podaj UID gracza:", "Ustaw", "Wróć");
                return 1;
            }
            case 3:
            {
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_OWNER_APPLY, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Podaj ID pracy:", "Ustaw", "Wróć");
                return 1;
            }
            case 4:
            {
                ShowPlayerDialogEx(playerid, D_EDIT_CAR_OWNER_APPLY, DIALOG_STYLE_INPUT, "{8FCB04}Edycja {FFFFFF}pojazdów", "Podaj typ pojazdu specjalnego:\n\n1. Wypożyczalnia\n2. GoKart\n3. żużel", "Ustaw", "Wróć");
                return 1;
            }
            case 5:
            {
                new lSlot;
                if(CarData[car][c_OwnerType] == CAR_OWNER_PLAYER)
                {
                    new lUID = Car_GetOwner(car);
					if(lUID != 0)
					{
						foreach(new i : Player)
						{
							if(PlayerInfo[i][pUID] == lUID)
							{
								for(new j=0;j<MAX_CAR_SLOT;j++)
								{
									if(PlayerInfo[i][pCars][j] == car)
									{
										PlayerInfo[i][pCars][j] = 0;
										lSlot = j+1;
										break;
									}
								}

								format(string, sizeof(string), " Usunięto pojazd ze slotu %d graczowi %s.", lSlot, GetNick(i));
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								Log(adminLog, WARNING, "Admin %s usunął %s pojazd %s ze slotu %d", 
									GetPlayerLogName(playerid), 
									GetPlayerLogName(i),
									GetCarDataLogName(car),
									lSlot);
								break;
							}
						}
					}
                }
                CarData[car][c_OwnerType] = 5;
                Car_Save(car, CAR_SAVE_OWNER);
				
				Log(adminLog, WARNING, "Admin %s zmienił w %s typ pojazdu na 5",  GetPlayerLogName(playerid), GetCarDataLogName(car));
            }
        }
        ShowCarEditDialog(playerid);
        return 1;
    }
    else if(dialogid == D_EDIT_CAR_OWNER_APPLY)
    {
        if(!response) return ShowCarEditDialog(playerid);
        new typ = GetPVarInt(playerid, "edit_car_ownertype");
        new car = GetPVarInt(playerid, "edit-car");
        if(strval(inputtext) < 0) return ShowCarEditDialog(playerid);

        new lSlot, string[128];
        if(CarData[car][c_OwnerType] == CAR_OWNER_PLAYER)
        {
            new lUID = Car_GetOwner(car);
			if(lUID != 0)
			{
				foreach(new i : Player)
				{
					if(PlayerInfo[i][pUID] == lUID)
					{
						for(new j=0;j<MAX_CAR_SLOT;j++)
						{
							if(PlayerInfo[i][pCars][j] == car)
							{
								PlayerInfo[i][pCars][j] = 0;
								lSlot = j+1;
								break;
							}
						}

						format(string, sizeof(string), " Usunięto pojazd ze slotu %d graczowi %s.", lSlot, GetNick(i));
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						Log(adminLog, WARNING, "Admin %s usunął %s pojazd %s ze slotu %d", 
									GetPlayerLogName(playerid), 
									GetPlayerLogName(i),
									GetCarDataLogName(car),
									lSlot);
						break;
					}
				}
			}
        }
		
        if(typ == CAR_OWNER_PLAYER)
        {
            foreach(new i : Player)
            {
                if(PlayerInfo[i][pUID] == strval(inputtext))
                {
                    Car_MakePlayerOwner(i, car);
                    break;
                }
            }
        }
		CarData[car][c_OwnerType] = typ;
		CarData[car][c_Owner] = strval(inputtext);
		
		Log(adminLog, WARNING, "Admin %s zmienił w %s typ pojazdu na %d", GetPlayerLogName(playerid), GetCarDataLogName(car), typ);
		Car_Save(car, CAR_SAVE_OWNER);
		
        ShowCarEditDialog(playerid);
        return 1;
    }
    else if(dialogid == D_EDIT_CAR_COLOR)
    {
        if(!response) return ShowCarEditDialog(playerid);
        if(strval(inputtext) < 0 || strval(inputtext) > 255)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "Nieprawidłowy kolor.");
            return ShowCarEditDialog(playerid);
        }
        new car = GetPVarInt(playerid, "edit-car");

        if(GetPVarInt(playerid, "car_edit_color") == 1)
		{
			MRP_ChangeVehicleColor(CarData[car][c_ID], strval(inputtext), CarData[car][c_Color][1]);
            ChangeVehicleColours(CarData[car][c_ID], strval(inputtext), CarData[car][c_Color][1]);
		}
        else
		{
			MRP_ChangeVehicleColor(CarData[car][c_ID], CarData[car][c_Color][0], strval(inputtext));
            ChangeVehicleColours(CarData[car][c_ID], CarData[car][c_Color][0], strval(inputtext));
		}

        ShowCarEditDialog(playerid);
        return 1;
    }
    //30.10
    else if(dialogid == D_TRANSPORT)
    {
        if(!response) return 1;
        new lStr[256];

        new skill, level = PlayerInfo[playerid][pTruckSkill];

        if(level <= 50) skill = 1;
        else if(level >= 51 && level <= 100) skill = 2;
        else if(level >= 101 && level <= 200) skill = 3;
        else if(level >= 201 && level <= 400) skill = 4;
        else if(level >= 401) skill = 5;

        switch(listitem)
        {
            case 0:
            {
                if(PlayerInfo[playerid][pTruckSkill] < 200) return SendClientMessage(playerid, COLOR_GRAD2, " Szybkie zlecenia dostępne od 4 poziomu umiejętności!");
                for(new i=0;i<sizeof(TransportJobData);i++)
                {
                    if(TransportJobData[i][eTJDStartX] != 0 && TransportJobData[i][eTJDEndX] != 0)
                    {
                        if(TransportJobData[i][eTJDMoney] >= 5000 && skill < 5) continue;
                        format(lStr, 256, "%s%d\t%s\n", lStr, i, TransportJobData[i][eTJDName]);
                    }
                }
                ShowPlayerDialogEx(playerid, D_TRANSPORT_LIST, DIALOG_STYLE_LIST, "Szybkie zlecenie", lStr, "Wybierz", "Wróć");
                return 0;
            }
            case 1:
            {
                if(!IsPlayerInRangeOfPoint(playerid, 10.0, TransportJobData[0][eTJDStartX], TransportJobData[0][eTJDStartY], TransportJobData[0][eTJDStartZ]))
                {
                    SetPlayerCheckpoint(playerid, TransportJobData[0][eTJDStartX], TransportJobData[0][eTJDStartY], TransportJobData[0][eTJDStartZ], 5.0);
                    SendClientMessage(playerid, COLOR_GRAD2, "Zlecenie możesz wybrać w swoim centrum pracy.");
                    return 0;
                }


                for(new i=0;i<sizeof(TransportJobData);i++)
                {
                    if(TransportJobData[i][eTJDStartX] == 0 && TransportJobData[i][eTJDEndX] != 0)
                    {
                        if(TransportJobData[i][eTJDMoney] >= 5000 && skill < 5) continue;
                        if(TransportJobData[i][eTJDMoney] >= 3500 && skill < 4) continue;
                        if(TransportJobData[i][eTJDMoney] >= 2500 && skill < 3) continue;
                        format(lStr, 256, "%s%d\t%s\n", lStr, i, TransportJobData[i][eTJDName]);
                    }
                }
                ShowPlayerDialogEx(playerid, D_TRANSPORT_LIST, DIALOG_STYLE_LIST, "Planowane zlecenie", lStr, "Wybierz", "Wróć");
            }
        }
    }
    else if(dialogid == D_TRANSPORT_LIST)
    {
        if(!response) return RunCommand(playerid, "/zlecenie",  "");
        new idx = strval(inputtext);
        SetPVarInt(playerid, "trans_idx", idx);
        new lStr[256];
        format(lStr, 256, "TOWAR PRZEWOŻONY:\t%s\nMAX. DOCHÓD:\t$%d\nILOŚĆ TOWARU:\t%d\nPOTRZEBNE MATERIAŁY: %d\n\nCzy chcesz przyjąć zlecenie?", TransportJobData[idx][eTJDName],TransportJobData[idx][eTJDMoney], TransportJobData[idx][eTJDMaxItems], TransportJobData[idx][eTJDMats]);

        ShowPlayerDialogEx(playerid, D_TRANSPORT_ACCEPT, DIALOG_STYLE_MSGBOX, "Akceptacja", lStr, "Gotowe!", "Anuluj");
    }
    else if(dialogid == D_TRANSPORT_ACCEPT)
    {
        if(!response) return RunCommand(playerid, "/zlecenie",  "");
        new idx = GetPVarInt(playerid, "trans_idx");
        new lStr[128];
        if(TransportJobData[idx][eTJDMats] > TJD_Materials)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "W magazynie na ma tylu materiałów. Wsiądź w wózek widłowy i doładuj magazyn!");
            return 0;
        }
        TJD_Materials -= TransportJobData[idx][eTJDMats];
        TJD_UpdateLabel();

        format(lStr, 128, "Przyjęto zlecenie. Twoim zadaniem jest transport %s. Udaj się do punktu.", TransportJobData[idx][eTJDName]);
        SendClientMessage(playerid, COLOR_YELLOW, lStr);

        SetPVarInt(playerid, "trans", ((idx)*2)+1);
		SetPVarInt(playerid, "trans-antytp", gettime()+60); //1 minuta
        if(TransportJobData[idx][eTJDStartX] != 0) SetPlayerCheckpoint(playerid, TransportJobData[idx][eTJDStartX], TransportJobData[idx][eTJDStartY], TransportJobData[idx][eTJDStartZ], 5.0);
        else
        {
            SetPlayerCheckpoint(playerid, TransportJobData[0][eTJDStartX], TransportJobData[0][eTJDStartY], TransportJobData[0][eTJDStartZ], 5.0);
        }
    }
    else if(dialogid == D_DODATKI_TYP)
    {
        if(!response) return 1;
        if(listitem == 2 && !MRP_IsInPolice(playerid)) return sendTipMessageEx(playerid, COLOR_GRAD2, "Nie jestes w policji!");
        if(listitem == 4 && !CheckPlayerPerm(playerid, PERM_GANG)) return sendTipMessageEx(playerid, COLOR_GRAD2, "Nie jestes w gangu!");
        CallRemoteFunction("SEC_Dodatki_Show", "dd", playerid, listitem);
        return 1;
    }
    else if(dialogid == D_WINDA_LSFD)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
				{
			 			SetPlayerPos(playerid, 1745.8119,-1129.8972,24.0781);
                        SetPlayerVirtualWorld(playerid, 0);
				}
                case 1:
				{
						SetPlayerPos(playerid, 1746.2399,-1128.2211,227.8059);
                        SetPlayerVirtualWorld(playerid, 22);
                        Wchodzenie(playerid);
				}
                case 2:
				{
						SetPlayerPos(playerid, 1745.8934,-1129.6250,47.2859);
                        SetPlayerVirtualWorld(playerid, 23);
                        Wchodzenie(playerid);
				}
                case 3:
				{
						SetPlayerPos(playerid, 1745.8119,-1129.8972,46.5700);
                        SetPlayerVirtualWorld(playerid, 0);
				}
            }
        }
        return 1;
    }
    else if(dialogid == D_SUPPORT_LIST)
    {
        SetPVarInt(playerid, "support_dialog", 0);
        if(!response)
            return 1;
        new id = strval(inputtext);
        if(!TICKET[id][suppValid]) return 1;
        new pid = TICKET[id][suppCaller];
        Support_ClearTicket(id);
		ShowPlayerDialogEx(playerid, -6969, DIALOG_STYLE_LIST, "fix","fix","","");

        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2]);
        Unspec[playerid][sPint] = GetPlayerInterior(playerid);
        Unspec[playerid][sPvw] = GetPlayerVirtualWorld(playerid);

        GetPlayerPos(pid, x, y, z);
        SetPlayerPos(playerid, x, y, z);
        SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(pid));
        SetPlayerInterior(playerid, GetPlayerInterior(pid));
        Wchodzenie(playerid);
        Wchodzenie(pid);
        SetPVarInt(playerid, "validticket", 1);
        new str[128];
        format(str, 64, "SUPPORT: %s oferuje Ci pomoc, skorzystaj z tego!", GetNick(playerid));
        SendClientMessage(pid, COLOR_YELLOW, str);
        format(str, 128, "SUPPORT: Pomagasz teraz %s. Aby wrócić do poprzedniej pozycji wpisz /ticketend", GetNick(pid));
        SendClientMessage(playerid, COLOR_YELLOW, str);
		if(GetPVarInt(playerid, "dutyadmin") == 1)
		{
			iloscZapytaj[playerid] = iloscZapytaj[playerid]+1;
		}

        return 1;
    }
//====================[KONTO BANKOWE]========================================
//By Simeone 25-12-2018
	//==================[GłÓWNE OKNO DIALOGOWE]=======================================
	else if(dialogid == 1067)
	{
		if(response)
        {
			//Zmienne użyte do działania dialogu
			new string[128];
			new giveplayer[MAX_PLAYER_NAME + 1];
			GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
		
            switch(listitem)
            {
				
				
				//działanie dialogu
                case 0://Stan konta
				{
					format(string, sizeof(string), "{C0C0C0}Witaj {800080}%s{C0C0C0},\nObecny stan konta: {80FF00}%d$", giveplayer, PlayerInfo[playerid][pAccount]);
					ShowPlayerDialogEx(playerid, 1080, DIALOG_STYLE_MSGBOX, "Stan Konta", string, "Okej", "");
				}
                case 1://Wpłać
				{
					format(string, sizeof(string), "Konto Bankowe >> %s", giveplayer);
					ShowPlayerDialogEx(playerid, 1068, DIALOG_STYLE_INPUT, string, "Wpisz poniżej kwotę, którą chcesz wpłacić", "Wykonaj", "Odrzuć");
				}
                case 2://Wypłać
				{
					
					format(string, sizeof(string), "Konto Bankowe >> %s", giveplayer);
					ShowPlayerDialogEx(playerid, 1071, DIALOG_STYLE_INPUT, string, "Wpisz poniżej kwotę, którą chcesz wypłacić", "Wykonaj", "Odrzuć");
				}
                case 3://Przelew do osoby
				{
					
					format(string, sizeof(string), "Konto Bankowe >> %s >> Przelew", giveplayer);
					ShowPlayerDialogEx(playerid, 1072, DIALOG_STYLE_INPUT, string, "Wpisz poniżej ID odbiorcy", "Wykonaj", "Odrzuć");
				}
				case 4: //Grupa
				{
					new groups[256];
					DynamicGui_Init(playerid);
					new allowedSlots = IsPlayerPremiumOld(playerid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
					for(new i = 0; i < allowedSlots; i++)
					{
						if(PlayerInfo[playerid][pGrupa][i] != 0)
						{
							new groupid = PlayerInfo[playerid][pGrupa][i];
							if(!IsValidGroup(groupid)) continue;
							if(!GroupIsVLeader(playerid, groupid)) continue;
							format(groups, sizeof(groups), "%s\n%s (%d)", groups, GroupInfo[groupid][g_Name], groupid);
							DynamicGui_AddRow(playerid, groupid);
						}
					}
					if(isnull(groups))
						return sendErrorMessage(playerid, "Nie jesteś liderem żadnej grupy!");
					format(string, sizeof(string), "Konto Bankowe >> %s >> Grupy", giveplayer);
					ShowPlayerDialogEx(playerid, 1070, DIALOG_STYLE_LIST, string, groups, "Wykonaj", "Odrzuć");
					
				}
            }
			return 1;
        }
	
	}

	//GRUPY
	else if(dialogid == 1070) //Grupy lista
	{
		if(!response) return RunCommand(playerid, "/kb", "");
		new groupid = DynamicGui_GetValue(playerid, listitem);
		if(!IsValidGroup(groupid)) return 0;
		if(!GroupIsVLeader(playerid, groupid)) return 0;

		new string[128];
		format(string, sizeof(string), ">> %s >> %s", GetNick(playerid), GroupInfo[groupid][g_Name]);
		ShowPlayerDialogEx(playerid, 1069, DIALOG_STYLE_LIST, string, "Stan Konta\nPrzelew do osoby\nPrzelew do grupy\nWpłać\nWpłać Mats\nWypłać\nWypłać Mats\n<< Twoje konto", "Wybierz", "Wyjdź");
		DynamicGui_SetDialogValue(playerid, groupid);
	}
	else if(dialogid == 1069)
	{
		if(response)
		{
			//Zmienne i funkcje
			new FracGracza = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(FracGracza)) return 1;
			new string[256];
			new StanSejfuFrac[128];//drugi string specjalnie do stanu konta frakcji
			new stan = GroupInfo[FracGracza][g_Money];//Stan sejfu frakcji
			new giveplayer[MAX_PLAYER_NAME + 1];//Gracz odbierający
			GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
			switch(listitem)
			{
				//Case'y i działanie kodu
				
				case 0://=======================>>Sprawdź stan konta grupy
				{	
					format(string, sizeof(string), "{C0C0C0}Witaj {800080}%s{C0C0C0},\nPomyślnie zalogowano na:{80FF00}%s\n{C0C0C0}Obecny stan konta: {80FF00}%d$\n{C0C0C0}Obecny stan matsów: {80FF00}%d", giveplayer, GroupInfo[FracGracza][g_Name],GroupInfo[FracGracza][g_Money],GroupInfo[FracGracza][g_Mats]);
					ShowPlayerDialogEx(playerid, 1080, DIALOG_STYLE_MSGBOX, "Stan Konta", string, "Okej", "");
				}
				case 1://=======================>>Przelew z konta grupy na konto gracza
				{
					
					format(string, sizeof(string), ">> %s", GroupInfo[FracGracza][g_Name]);
					ShowPlayerDialogEx(playerid, 1075, DIALOG_STYLE_INPUT, string, "Wpisz poniżej ID odbiorcy", "Wykonaj", "Odrzuć");
				}
				case 2://=======================>>Przelew z konta grupy na konto grupy 
				{
					if(GroupHavePerm(FracGracza, PERM_CRIMINAL))
					{
						sendTipMessage(playerid, "Organizacje przestępcze muszą znaleźć lepszy (cichszy) sposób na przelew"); 
						return 1;
					}
					format(string, sizeof(string), ">> %s", GroupInfo[FracGracza][g_Name]);
					ShowPlayerDialogEx(playerid, 1098, DIALOG_STYLE_LIST, string, "LSPD\nFBI\nLSFD\nLSMC\nDMV\nUSSS\nSN\nKT\nNOA", "Dalej", "Powrót"); 
				
				}
				case 3://=======================>>Wpłać na konto grupy
				{
					format(string, sizeof(string), "%s", GroupInfo[FracGracza][g_Name]); 
					ShowPlayerDialogEx(playerid, 1077, DIALOG_STYLE_INPUT, string, "Wpisz poniżej kwotę, jaką chcesz wpłacić", "Wykonaj", "Odrzuć"); 
				}
				case 4://wplata matsow
				{
					format(string, sizeof(string), "%s", GroupInfo[FracGracza][g_Name]); 
					ShowPlayerDialogEx(playerid, 1234, DIALOG_STYLE_INPUT, string, "Podaj ile chcesz wpłacić matsów", "Wykonaj", "Odrzuć"); 
				}
				case 5://=======================>>Wypłać z konta grupy
				{
					
					
					format(string, sizeof(string), "%s", GroupInfo[FracGracza][g_Name]);
					format(StanSejfuFrac, sizeof(StanSejfuFrac), "Stan konta: {80FF00}%d\n{C0C0C0}Wpisz poniżej kwotę jaką chcesz wypłacić", stan);
					ShowPlayerDialogEx(playerid, 1078, DIALOG_STYLE_INPUT, string, StanSejfuFrac, "Wykonaj", "Odrzuć"); 
				}
				case 6://WYPLAC MATS
				{
					format(string, sizeof(string), "%s", GroupInfo[FracGracza][g_Name]); 
					ShowPlayerDialogEx(playerid, 1337, DIALOG_STYLE_INPUT, string, sprintf("Podaj ile chcesz wypłacić matsów\nStan: %d", GroupInfo[FracGracza][g_Mats]), "Wykonaj", "Odrzuć"); 
				}
				case 7://=======================>>Powrót do głównego panelu
				{	
					
					format(string, sizeof(string), "Konto Bankowe >> %s", giveplayer);
					ShowPlayerDialogEx(playerid, 1067, DIALOG_STYLE_LIST, string, "Stan konta\n\nWpłać\nWypłać\n>> Grupa", "Wybierz", "Wyjdź");
				
				}
			
			
			}
			return 1;
		}
	}
	else if(dialogid == 1337) //wyplac matsy
	{
		if(!response)
		{
			sendErrorMessage(playerid, "Transakcja anulowana"); 
			return 1;
		}
		else
		{
			new frakcja = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 1;
			new matsy = strval(inputtext);
			new stan = GroupInfo[frakcja][g_Mats];
		    if(matsy >= 1)
			{
				if(stan >= matsy)
				{
					new string[128];
					Mats_Add(frakcja, -matsy);
					Item_Add("Materiały", ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], ITEM_TYPE_MATS, 0, 0, true, playerid, matsy, ITEM_NOT_COUNT);
					format(string, sizeof(string), "Lider %s wypłacił %d matsów z sejfu grupy %s", GetNick(playerid), matsy, GroupInfo[frakcja][g_Name]); 
					SendLeaderRadioMessage(frakcja, COLOR_LIGHTGREEN, string); 

					Log(payLog, WARNING, "%s wypłacił z konta grupy %d  %d matsów. Nowy stan matsów: %d$", 
					GetPlayerLogName(playerid),
					frakcja,
					matsy,
					GroupInfo[frakcja][g_Mats]);
				}
				else
				{
					sendErrorMessage(playerid, "Ta grupa nie ma tyle matsów");
					return 1;	
				}

			}
			else
			{
				sendErrorMessage(playerid, "Błędna ilość matsów");
				return 1;
			}
		}
	}
	//============[DIALOG - WYBIERZ DO KOGO przelać KASE]===================
	//LSPD\nFBI\nLSFD\nLSMC\nDMV\nUSSS\nSN\nKT\nNOA
	else if(dialogid == 1098)
	{
		if(response)
        {
			new string[128];
			switch(listitem)
			{
				case 0:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 1);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktóra masz zamiar przelać.\n\nWykonujesz przelew do grupy: LSPD");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do LSPD", string, "Wykonaj", "Odrzuć"); 
				}
				case 1:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 2);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: FBI");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do FBI", string, "Wykonaj", "Odrzuć"); 
				}
				case 2:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 17);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: LSFD");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do LSFD", string, "Wykonaj", "Odrzuć"); 
				}
				case 3:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 4);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: LSMC");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do LSMC", string, "Wykonaj", "Odrzuć"); 
				}
				case 4:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 11);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: DMV");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do DMV", string, "Wykonaj", "Odrzuć"); 
				}
				case 5:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 7);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: USSS");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do USSS", string, "Wykonaj", "Odrzuć"); 
				}
				case 6:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 9);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: SN");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do SN", string, "Wykonaj", "Odrzuć"); 
				}
				case 7:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 10);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: KT");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do KT", string, "Wykonaj", "Odrzuć"); 
				}
				case 8:
				{
					SetPVarInt(playerid, "PrzelewFrakcjaFrakcja", 15);
					format(string, sizeof(string), "Wpisz w poniższym polu kwotę,\nktórą masz zamiar przelać.\n\nWykonujesz przelew do grupy: NOA");
					ShowPlayerDialogEx(playerid, 1099, DIALOG_STYLE_INPUT, "Przelew do NOA", string, "Wykonaj", "Odrzuć"); 
				}
			
			}
			return 1;
		}
	}
	else if(dialogid == 1099)
	{
		if(response)
		{
			new string[128];
			new bigstring[256];
			new money = FunkcjaK(inputtext);
			new frakcja = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 1;
			new frac = GetPVarInt(playerid, "PrzelewFrakcjaFrakcja");
			if(money > 0)
			{
				if(frac == frakcja)
				{
					sendErrorMessage(playerid, "Nie możesz przelać gotówki do własnej grupy!"); 
					return 1;
				}
				if(GroupInfo[frakcja][g_Money] < money)
				{
					sendErrorMessage(playerid, "W sejfie twojej grupy nie ma aż takiej ilości gotówki!"); 
					return 1;
				}
				if(GroupInfo[frac][g_Money] >= 1_500_000_000)
				{
					format(string, sizeof(string), "Sejf %s wylewa się! Kwota 1,5kkk przekroczona", GroupInfo[frac][g_Money]);
					sendErrorMessage(playerid, string);
					return 1;
				}
				//KOMUNIKATY:
				format(string, sizeof(string), "Dokonałeś przelewu na konto grupy %s w wysokości %d", GroupInfo[frac][g_Money], money);
				sendTipMessage(playerid, string);
				
				
				format(bigstring, sizeof(bigstring), "%s dokonał przelewu na konto %s z konta %s w wysokości %d",
				GetNickEx(playerid),
				GroupInfo[frac][g_Name], 
				GroupInfo[frakcja][g_Name], money);
				SendLeaderRadioMessage(frakcja, COLOR_LIGHTGREEN, bigstring);
				
				format(bigstring, sizeof(bigstring), "Twoja grupa %s otrzymała przelew od lidera %s [%s] w wysokości %d", 
				GroupInfo[frac][g_Name],
				GroupInfo[frakcja][g_Name],
				GetNickEx(playerid), money);
				
				SendLeaderRadioMessage(frac, COLOR_RED, "===================================");
				SendLeaderRadioMessage(frac, COLOR_LIGHTGREEN, bigstring);
				SendLeaderRadioMessage(frac, COLOR_RED, "==================================="); 
				
				//LOG
				Log(payLog, WARNING, "%s przelał do sejfu grupy %s kwotę %d$. Nowy stan: %d$",
					GetPlayerLogName(playerid),
					GetGroupLogName(frakcja),
					money,
					GroupInfo[frakcja][g_Money]);
				
				//Powiadomienie dla adminów
				if(money >= 2_500_000)
				{
					SendAdminMessage(COLOR_GREEN, "============[ADM-LOG]===========");
					format(string, sizeof(string), "Przelewający: %s [%d]", GetNickEx(playerid), playerid);
					SendAdminMessage(COLOR_WHITE, string);
					format(string, sizeof(string), "Z konta: %s", GroupInfo[frakcja][g_Name]);
					SendAdminMessage(COLOR_WHITE, string);
					format(string, sizeof(string), "Na konto: %s", GroupInfo[frac][g_Name]);
					SendAdminMessage(COLOR_WHITE, string);
					format(string, sizeof(string), "Kwota: %d", money);
					SendAdminMessage(COLOR_WHITE, string);
					SendAdminMessage(COLOR_GREEN, "================================");
				}
				//czynności
				Sejf_Add(frac, money);
				Sejf_Add(frakcja, -money);
			}
			else
			{
				sendTipMessage(playerid, "Błędna kwota");
			}
		}
		else
		{
			sendTipMessage(playerid, "Odrzucono akcję przelewu"); 
			return 1;
		}
	
	}


	//grupy end

	//===============[WPŁATA NA SWOJE KONTO]=========================
	else if(dialogid == 1068)
	{
		if(response)
	    {
			if(gPlayerLogged[playerid] == 1)
			{
				new string[128];
				new money = strval(inputtext);
				money = FunkcjaK(inputtext);//--Funkcja wpłacania na k
				if (money > kaska[playerid] || money < 1)
				{
					sendTipMessage(playerid, "Nie masz tyle \\ Błędna kwota!");
					return 1;
				}
				if(PlayerInfo[playerid][pAccount] + money > 2_000_000_000)
				{
					sendTipMessage(playerid, "Konto bankowe przepełnione, możemy przechowywać nie więcej niż 2 miliardy!");
					return 1;
				}
				ZabierzKaseDone(playerid, money);
				new currentFunds = PlayerInfo[playerid][pAccount];
				SendClientMessage(playerid, COLOR_WHITE, "|___ {80FF00}STAN KONTA {FFFFFF}___|");
				format(string, sizeof(string), "  Poprzedni stan: {80FF00}$%d", currentFunds);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				SetPlayerBank(playerid, money + PlayerInfo[playerid][pAccount]);
				format(string, sizeof(string), "  Depozyt: {80FF00}$%d", money);
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
				format(string, sizeof(string), "  Nowy stan: {80FF00}$%d", PlayerInfo[playerid][pAccount]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				
				Log(payLog, WARNING, "%s wpłacił na swoje konto %d$. Nowy stan: %d$",
					GetPlayerLogName(playerid),
					money, 
					PlayerInfo[playerid][pAccount]);
			}	
			return 1;
		}
	}
	//============[DIALOG INFORMACYJNY (INFO) -> Zwrot Marcepana]============
	else if(dialogid == 1080)
	{
		if(response)
        {
            SendClientMessage(playerid, COLOR_WHITE, "Marcepan Marks mówi: Do zobaczenia!");
			return 1;
        }
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Marcepan Marks mówi: Do zobaczenia! Zapraszamy ponownie do Verte Bank");
			return 1;
		}
       
	
	}
	else if(dialogid == 1071)//wypłata z swojego konta
	{
		if(response)
	    {
			if(gPlayerLogged[playerid] == 1)
			{
				new string[128];
				new money = strval(inputtext);
				money = FunkcjaK(inputtext);//--Funkcja wpłacania na k
				
				if (money > PlayerInfo[playerid][pAccount] || money < 1)//Zabezpieczenie
				{
					sendTipMessage(playerid, "Nie masz tyle \\ Błędna kwota");
					return 1;
				}
				
				//Komunikaty:
				new currentFunds = PlayerInfo[playerid][pAccount];
				SendClientMessage(playerid, COLOR_WHITE, "|___ {80FF00}STAN KONTA {FFFFFF}___|");
				format(string, sizeof(string), "  Poprzedni stan: {80FF00}$%d", currentFunds);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				format(string, sizeof(string), "  Depozyt: {80FF00}$-%d", money);
				SendClientMessage(playerid, COLOR_GRAD4, string);
				//Czynności:
				DajKaseDone(playerid, money);
				SetPlayerBank(playerid, PlayerInfo[playerid][pAccount] - money);
				//Komunikaty:
				SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
				format(string, sizeof(string), "  Nowy stan: {80FF00}$%d", PlayerInfo[playerid][pAccount]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				
				Log(payLog, WARNING, "%s wypłacił ze swojego konta %d$. Nowu stan: %d$", 
					GetPlayerLogName(playerid), 
					money, 
					PlayerInfo[playerid][pAccount]);
			}	
			return 1;
		}
	
	}
	else if(dialogid == 9992)
	{
		if(!response)
		{
			sendTipMessage(playerid, "Wyłączono system actorów"); 
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					sendTipMessage(playerid, "Dostępne już wkrótce"); 
				}
				case 1:
				{
					sendTipMessage(playerid, "Dostępne już wkrótce");
				}
				case 2:
				{
					sendTipMessage(playerid, "Ta opcja zostanie dodana już niebawem!");
				}
				case 3:
				{
					sendTipMessage(playerid, "Ta opcja zostanie dodana już niebawem!");
				}
				case 4:
				{
					sendTipMessage(playerid, "Ta opcja zostanie dodana już niebawem!");
				}
			}
		}
	}
	else if(dialogid == DIALOG_EMPTY_SC)
	{
		if(!response)
		{
			return 1;
		}
		else
		{
			return 1;
		}
	}
	//============[PRZELEWY OD GRACZA DO GRACZA = ID ODBIORCY]===================================
	else if(dialogid == 1072)//Przelew
	{
		if(!response)
	    {
			sendErrorMessage(playerid, "Odrzucono akcje przelewu!");
		}
		else//Jeśli przejdzie dalej
		{
			new string[128];
			new giveplayerid = strval(inputtext);
			if(GetPlayerVirtualWorld(giveplayerid) == 1488)
			{
				sendErrorMessage(playerid, "Ten gracz jest w trakcie logowania!"); 
				return 1;
			}
			if (IsPlayerConnected(giveplayerid) && gPlayerLogged[giveplayerid])
			{
				if(giveplayerid != playerid)
				{
					SetPVarInt(playerid, PVAR_PRZELEW_ID, giveplayerid);
					format(string, sizeof(string), "Wpisz poniżej sumę, ktorą chcesz przelać do %s", GetNick(giveplayerid));
					ShowPlayerDialogEx(playerid, 1073, DIALOG_STYLE_INPUT, ">>Przelew >> 1  >> 2 ", string, "Wykonaj", "Odrzuć");
				}
				else
				{
					sendErrorMessage(playerid, "Nie możesz przelać gotówki samemu sobie!");
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie ma takiego gracza!"); 
				return 1;
			}
			return 1;
		}
	
	
	}
	//================[PRZELEWY DO GRACZA OD GRACZA = Czynności + Kwota przelewu]========================
	else if(dialogid == 1073)
	{
		if(!response)
	    {
			sendErrorMessage(playerid, "Odrzucono akcje przelewu!"); 
		}
		else//Jeśli kliknie "TAK"
		{
			new string[256];
			new sendername[MAX_PLAYER_NAME + 1];
			new giveplayer[MAX_PLAYER_NAME + 1];
			new giveplayerid = GetPVarInt(playerid, PVAR_PRZELEW_ID);
			new money = FunkcjaK(inputtext);//Zbugowany string 
			GetPlayerName(playerid, sendername, sizeof(sendername));
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			
			if(money >= 1 && money <= PlayerInfo[playerid][pAccount])//Zabezpieczenie 
			{
				if(PlayerInfo[giveplayerid][pAccount]+money > MAX_MONEY_IN_BANK)
				{
					sendErrorMessage(playerid, "Gracz do którego próbowałeś przelać gotówkę - ma zbyt dużo pieniędzy na koncie."); 
					return 1;
				}
				if(!IsPlayerConnected(giveplayerid))
				{
					sendErrorMessage(playerid, "Gracz, do którego próbowałeś przelać gotówkę wyszedł z serwera!"); 
					return 1;
				}
				//Czynności:
				SetPlayerBank(playerid, PlayerInfo[playerid][pAccount] - money);
				SetPlayerBank(giveplayerid, PlayerInfo[giveplayerid][pAccount] + money);
				
				//komunikaty:
				format(string, sizeof(string), "Otrzymałeś przelew w wysokości %d$ od %s . Pieniądze znajdują się na twoim koncie.", money, sendername);
				SendClientMessage(giveplayerid, COLOR_RED, string);
				
				format(string, sizeof(string), "Wysłałeś przelew dla %s w wysokości %d$. Pieniądze zostały pobrane z twojego konta bankowego", giveplayer, money);
				SendClientMessage(playerid, COLOR_RED, string); 
				
				Log(payLog, WARNING, "%s przelał %s kwotę %d$", 
					GetPlayerLogName(playerid),
					GetPlayerLogName(giveplayerid),
					money);
				
				if(money >= 5_000_000)//Wiadomosc dla adminow
				{
					format(string, sizeof(string), "Gracz %s wysłał przelew do %s w wysokości %d$", GetNick(playerid), GetNick(giveplayerid), money); 
					SendAdminMessage(COLOR_YELLOW, string);
					return 1;
				}
			}
			else//Jeśli próbuje oszukać (brak gotówki, błędnie wpisana kwota)
			{
				sendErrorMessage(playerid, "Błędna kwota || Nie masz takiej ilości gotówki na swoim koncie!"); 
				return 1;
			}
			return 1;
		}
		
	
	
	}
	else if(dialogid == 1075)//Pobieranie ID odbiorcy - przelew z konta grupy
	{
		if(!response)
	    {
			sendErrorMessage(playerid, "Nie uzupełniłeś ID odbiorcy!"); 
		}
		else
		{
			new string[128];
			new frakcja = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 0;
			new giveplayerid = strval(inputtext);
			if(IsPlayerConnected(giveplayerid) && gPlayerLogged[giveplayerid])
			{
				SetPVarInt(playerid, PVAR_PRZELEW_ID, giveplayerid);
				format(string, sizeof(string), "Odbiorca: %s\nWysyłający: %s\nWpisz poniżej kwotę, która ma zostać przelana na jego konto.", GetNick(giveplayerid), GroupInfo[frakcja][g_Name]); 
				ShowPlayerDialogEx(playerid, 1076, DIALOG_STYLE_INPUT, "Przelewy grupy >> ID >> Kwota", string, "Wykonaj", "Odrzuć"); 
				
			}
			else
			{
				sendErrorMessage(playerid, "Nie ma na serwerze takiego gracza!"); 
				return 1;
			}
			return 1;
		}
	}
	else if(dialogid == 1076)//Wpisywanie kwoty i całość funkcji - przelew z konta grupy na gracza
	{
		if(!response)
		{
		
			sendErrorMessage(playerid, "Odrzucono akcję przelewu"); 
			return 1;
		}
		else
		{
			new string[256];
			new sendername[MAX_PLAYER_NAME + 1];//Nadawca
			new giveplayer[MAX_PLAYER_NAME + 1];//Odbiorca
			new giveplayerid = GetPVarInt(playerid, PVAR_PRZELEW_ID);
			new money = FunkcjaK(inputtext);
			new frakcja = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 0;
			
			GetPlayerName(playerid, sendername, sizeof(sendername));
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			
			if(money <= 0 || money > GroupInfo[frakcja][g_Money])
			{
				sendErrorMessage(playerid, "Nieprawidłowa kwota przelewu!"); 
				return 1;
			}
			if(!IsPlayerConnected(giveplayerid))
			{
				sendErrorMessage(playerid, "Gracz, do którego próbowałeś przelać gotówkę wyszedł z serwera!"); 
				return 1;
			}
			if(PlayerInfo[giveplayerid][pAccount]+money > MAX_MONEY_IN_BANK)
			{
				sendErrorMessage(playerid, "Gracz do którego próbowałeś przelać gotówkę - ma zbyt dużo pieniędzy na koncie."); 
				return 1;
			}
			
			SetPlayerBank(giveplayerid, PlayerInfo[giveplayerid][pAccount] + money);
			Sejf_Add(frakcja, -money);
			
			format(string, sizeof(string), ">>>Otrzymałeś przelew w wysokości %d$, od lidera %s -> %s", money, GroupInfo[frakcja][g_Name], sendername); 
			SendClientMessage(giveplayerid, COLOR_RED, string);
			
			format(string, sizeof(string), ">>>Wysłałeś przelew w wysokości %d$, na konto %s, z konta %s", money, giveplayer, GroupInfo[frakcja][g_Name]); 
			SendClientMessage(playerid, COLOR_RED, string);
			
			format(string, sizeof(string), ">>>Lider %s[%d] wysłał %d$ z konta %s na %s[%d]", sendername, playerid, money, GroupInfo[frakcja][g_ShortName], giveplayer, giveplayerid);
			SendLeaderRadioMessage(frakcja, COLOR_LIGHTGREEN, string);
			
			Log(payLog, WARNING, "%s przelał z sejfu grupy %s na konto gracza %s kwotę %d$. Nowy stan: %d$",
				GetPlayerLogName(playerid),
				GetGroupLogName(frakcja),
				GetPlayerLogName(giveplayerid),
				money,
				GroupInfo[frakcja][g_Money]);
				
			if(money >= 2500000)//Warning dla adminów, gdy gracz przekroczy 2.5kk 
			{
				SendAdminMessage(COLOR_YELLOW, "|======[ADM-WARNING]======|"); 
				format(string, sizeof(string), "%s[%d] wykonał przelew %d$ na konto %s[%d]", sendername, playerid, money, giveplayer, giveplayerid); 
				SendAdminMessage(COLOR_WHITE, string); 
				format(string, sizeof(string), "Grupa gracza(z sejfu): %s", GroupInfo[frakcja][g_Name]);
				SendAdminMessage(COLOR_WHITE, string);
				SendAdminMessage(COLOR_YELLOW, "|=========================|");
			}
			return 1;
		}
	}
	//=================[WPŁATA NA KONTO GRUPY]=================
	else if(dialogid == 1077)
	{
		if(!response)
		{
		
			sendErrorMessage(playerid, "Odrzucono akcję wpłaty"); 
			return 1;
		}
		else
		{
			new money = FunkcjaK(inputtext);
			new frakcja = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 1;
			new sendername[MAX_PLAYER_NAME + 1];
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if(money >= 1)
			{
				if(money <= kaska[playerid])
				{
					new string[128];
					Sejf_Add(frakcja, money);
					ZabierzKaseDone(playerid, money); 
					format(string, sizeof(string), "Lider %s wpłacił %d$ na konto grupy %s", sendername, money, GroupInfo[frakcja][g_Name]); 
					SendLeaderRadioMessage(frakcja, COLOR_LIGHTGREEN, string); 
					
					Log(payLog, WARNING, "%s wpłacił na konto grupy %d kwotę %d$. Nowy stan: %d$", 
						GetPlayerLogName(playerid),
						frakcja,
						money,
						GroupInfo[frakcja][g_Money]);
				}
				else
				{
					sendErrorMessage(playerid, "Nie masz tyle!"); 
					return 1;
				}
			
			}
			else
			{
				sendErrorMessage(playerid, "Błędna kwota transakcji");
				return 1;
			}
		
			return 1;
		}
	
	
	}
	//wplata matsow
	else if(dialogid == 1234)
	{
		if(!response)
		{
			sendErrorMessage(playerid, "Transakcja anulowana"); 
			return 1;
		}
		else
		{
			new matsy = strval(inputtext);
			new frakcja = DynamicGui_GetDialogValue(playerid);
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 1;
		    if(matsy >= 1)
			{
				if(matsy <= CountMats(playerid))
				{
					new string[128];
					Mats_Add(frakcja, matsy);
					TakeMats(playerid, matsy);
					format(string, sizeof(string), "Lider %s wpłacił %d matsów do sejfu grupy %s", GetNick(playerid), matsy, GroupInfo[frakcja][g_Name]); 
					SendLeaderRadioMessage(frakcja, COLOR_LIGHTGREEN, string); 

					Log(payLog, WARNING, "%s wpłacił na konto grupy %d  %d matsów. Nowy stan matsów: %d$", 
					GetPlayerLogName(playerid),
					frakcja,
					matsy,
					GroupInfo[frakcja][g_Mats]);
				}
				else
				{
					sendErrorMessage(playerid, "Nie masz tyle matsów");
					return 1;	
				}

			}
			else
			{
				sendErrorMessage(playerid, "Błędna ilość matsów");
				return 1;
			}
		}
	}
	//=================[WYPŁATA Z KONTA ORGANIZACJI]=================
	else if(dialogid == 1078)
	{
		if(!response)
		{
			sendErrorMessage(playerid, "Odrzucono akcję wypłaty"); 
			return 1;
		}
		else
		{
			new money = FunkcjaK(inputtext);
			new frakcja = DynamicGui_GetDialogValue(playerid); 
			if(!IsValidGroup(frakcja) || !GroupIsVLeader(playerid, frakcja)) return 1;
			new sendername[MAX_PLAYER_NAME + 1];
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if(money >= 1)
			{
				if(money <= GroupInfo[frakcja][g_Money])
				{
					new string[128];
					Sejf_Add(frakcja, -money);
					DajKaseDone(playerid, money); 
					format(string, sizeof(string), "Lider %s wypłacił %d$ z konta grupy %s", sendername, money, GroupInfo[frakcja][g_Name]); 
					SendLeaderRadioMessage(frakcja, COLOR_LIGHTGREEN, string); 
					
					Log(payLog, WARNING, "%s wypłacił z konta grupy %d kwotę %d$. Nowy stan: %d$", 
						GetPlayerLogName(playerid),
						frakcja,
						money,
						GroupInfo[frakcja][g_Name]);
					
					if(money >= 2000000)
					{
						
						SendAdminMessage(COLOR_YELLOW, "|======[ADM-WARNING]======|");
						SendAdminMessage(COLOR_WHITE, string);
						SendAdminMessage(COLOR_YELLOW, "|=========================|");
						
					
					}
				}
				else
				{
					sendErrorMessage(playerid, "W sejfie twojej grupy nie ma takiej kwoty!"); 
					return 1;
				}
			
			}
			else
			{
				sendErrorMessage(playerid, "Błędna kwota transakcji!");
				return 1;
			}
		
			return 1;
		}
	
	
	}
//=================[KONIEC]========================
	else if(dialogid == 1090)//Dialog do kupna biletów KT --> Pociąg
	{
		if(!response)
        {
			new string[128];
            format(string, sizeof(string), "* %s jest strasznie rozstargniony i zdecydował odejść od maszyny bez biletu.", GetNick(playerid));//Ciekawostka - niezdecydowany
			ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			return 1;
        }
		else
		{
			if(IsAtTicketMachine(playerid))
			{
				new sendername[MAX_PLAYER_NAME + 1];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(kaska[playerid] >= CenaBiletuPociag)				        
				{
					ZabierzKaseDone(playerid, CenaBiletuPociag);
					Sejf_Add(FRAC_KT, TransportValue[playerid]);
					PlayerInfo[playerid][pBiletpociag] = 1;
					new string[128]; 
					format(string, sizeof(string), "Zakupiłeś bilet za %d$", CenaBiletuPociag); 
					sendTipMessage(playerid, string);
					format(string, sizeof(string), "%s[ID: %d] zakupił bilet za %d$", sendername, playerid, CenaBiletuPociag); 
					SendLeaderRadioMessage(FRAC_KT, COLOR_LIGHTGREEN, string);
						
					format(string, sizeof(string), "* %s zakupił bilet do pociągu za %d$, schował go do kieszeni.", GetNick(playerid), CenaBiletuPociag);
					ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
				}
				else
				{
					sendErrorMessage(playerid, "Nie masz wystarczającej ilości gotówki!"); 
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie jesteś przy maszynie do kupna biletów!"); 
				return 1;
			}
		}
	}
	else if(dialogid == 1091)
	{
		if(!response)
        {
			sendErrorMessage(playerid, "Aby zejść ze służby wpisz /adminduty"); 
			return 1;
        }
	
	}
	else if(dialogid == 1092)//Całuj - komenda - potwierdzenie
	{
		if(response)
		{
			if(ProxDetectorS(5.5, playerid, kissPlayerOffer[playerid]))
			{
				new string[128];
				format(string, sizeof(string),"* %s kocha %s więc całują się.", GetNick(playerid), GetNick(kissPlayerOffer[playerid]));
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				format(string, sizeof(string), "%s mówi: Kocham cię.", GetNick(kissPlayerOffer[playerid]));
				ProxDetector(20.0, playerid, string, COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
				format(string, sizeof(string), "%s mówi: Ja ciebie też.", GetNick(playerid));
				ProxDetector(20.0, playerid, string, COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
				ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 4.0, 0, 0, 0, 0, 0);
				ApplyAnimation(kissPlayerOffer[playerid], "KISSING", "Playa_Kiss_01", 4.0, 0, 0, 0, 0, 0);
				
				//zerowanie zmiennych:
				kissPlayerOffer[playerid] = 0;
			}
			else
			{
				sendTipMessage(playerid, "Miłość Ci uciekła!"); 
				return 1;
			}
		}
		if(!response)
		{
			
			new string[128];
			format(string, sizeof(string), "* %s spojrzał(a) na %s i stwierdził(a), że nie chce się całować!", GetNick(playerid), GetNick(kissPlayerOffer[playerid]));
			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		
			return 1;
		}
	
	}
    else if(dialogid == 7079)
	{
		if(response)
		{
		    if(HireCar[playerid] == 0)
			{
			    TogglePlayerControllable(playerid, 1);
				RemovePlayerFromVehicleEx(playerid);
				HireCar[playerid] = 0;
				return 0;
			}
    		new veh = HireCar[playerid];
    		if(veh == 0) return 1;
    		if(Car_GetOwner(veh) != RENT_CAR || Car_GetOwnerType(veh) != CAR_OWNER_SPECIAL)
			{
				sendTipMessageEx(playerid, COLOR_GRAD2, "Tego pojazdu nie można wypożyczyć.");
				TogglePlayerControllable(playerid, 1);
				RemovePlayerFromVehicleEx(playerid);
				HireCar[playerid] = 0;
				return 0;
			}
    		if(CarData[VehicleUID[veh][vUID]][c_Rang] != 0)
			{
			    sendTipMessageEx(playerid, COLOR_GRAD2, "Ten pojazd jest aktualnie wypożyczony przez inną osobę.");
			    TogglePlayerControllable(playerid, 1);
				RemovePlayerFromVehicleEx(playerid);
				HireCar[playerid] = 0;
				return 0;
			}
   			if(GetPVarInt(playerid, "rentTimer") != 0)
   			{
   				sendTipMessageEx(playerid, COLOR_GRAD2, "Aktualnie wypożyczasz pewien pojazd.");
   				TogglePlayerControllable(playerid, 1);
				RemovePlayerFromVehicleEx(playerid);
				HireCar[playerid] = 0;
				return 0;
			}
			if(PlayerInfo[playerid][pLevel] > 1)
			{
				if(kaska[playerid] < BIKE_COST)
   				{
   					sendErrorMessage(playerid, "Nie masz tyle kasy!");
					TogglePlayerControllable(playerid, 1);
					RemovePlayerFromVehicleEx(playerid);
					HireCar[playerid] = 0;
					return 0;
				}
			}
    		CarData[VehicleUID[veh][vUID]][c_Rang] = (playerid+1);

    		SetPVarInt(playerid, "rentTimer", SetTimerEx("UnhireRentCar", 15*60*1000, 0, "ii", playerid, veh));

    		TogglePlayerControllable(playerid, 1);
			if (PlayerInfo[playerid][pLevel] != 1) ZabierzKaseDone(playerid, BIKE_COST);
    		HireCar[playerid] = veh;
			sendTipMessage(playerid, "Wypożyczono pojazd!"); 
    		SetPVarInt(playerid, "rentCar", veh);
		}
		if(!response)
		{
			sendTipMessageEx(playerid, COLOR_GRAD2, "Odrzuciłeś propozycję wypożyczenia pojazdu.");
			TogglePlayerControllable(playerid, 1);
			RemovePlayerFromVehicleEx(playerid);
			HireCar[playerid] = 0;
		}
	}
	else if(dialogid == 1012)
	{
		if(!response)
		{
			sendTipMessage(playerid, "Wyłączyłeś dialog tras"); 
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					SetPlayerCheckpoint(playerid, 2005.9244,-1442.3917,13.5631, 3);
					sendTipMessage(playerid, "Trasa rozpoczyna się spod szpitala, udaj się tam!");
					sendTipMessage(playerid, "Aby anulować wpisz /stopbieg"); 
					SetPVarInt(playerid, "RozpoczalBieg", 1);
				}
				case 1:
				{
					SetPlayerCheckpoint(playerid, 806.4952,-1334.9512,13.5469, 3);
					sendTipMessage(playerid, "Trasa rozpoczyna się spod metra udaj się tam!");
					sendTipMessage(playerid, "Aby anulować wpisz /stopbieg"); 
					SetPVarInt(playerid, "RozpoczalBieg", 1);
				}
				case 3:
				{
					sendTipMessage(playerid, "Aktualnie trwają prace nad tą trasą!"); 
				}
				case 4:
				{
					sendTipMessage(playerid, "Aktualnie trwają prace nad tą trasą!"); 
				}
				case 5:
				{
					sendTipMessage(playerid, "Aktualnie trwają prace nad tą trasą!"); 
				}
			}
			return 1;
		}
	}
	else if(dialogid == 9666)//dialog tak/nie admina
	{
		if(response)
		{
			sendTipMessage(playerid, "Zagłosowałeś na TAK!"); 
			glosowanie_admina_tak++;
			SetPVarInt(playerid, "glosowal_w_ankiecie", 1);
			return 1;
		}
		if(!response)
		{
			sendTipMessage(playerid, "Zagłosowałeś na NIE!"); 
			glosowanie_admina_nie++;
			SetPVarInt(playerid, "glosowal_w_ankiecie", 1); 
			return 1;
		}
	}
	else if(dialogid == D_KONTAKTY_DZWON)
	{
		if(response)
		{
			new string[12];
			format(string, sizeof(string), "%d", Kontakty[playerid][PobierzIdKontaktuZDialogu(playerid, listitem)][eNumer]);
			RunCommand(playerid, "/dzwon",  string);
		}
	}
	else if(dialogid == D_KONTAKTY_SMS)
	{
		if(response)
		{
			SetPVarInt(playerid, "kontakty-dialog-slot", PobierzIdKontaktuZDialogu(playerid, listitem));
			ShowPlayerDialogEx(playerid, D_KONTAKTY_SMS_WIADOMOSC, DIALOG_STYLE_INPUT, "Kontakty - SMS", "Wprowadź wiadomość:", "Wyślj SMS", "Zamknij");
		}
	}
	else if(dialogid == D_KONTAKTY_SMS_WIADOMOSC)
	{
		if(response)
		{
			new string[256];
			format(string, sizeof(string), "%d %s", Kontakty[playerid][GetPVarInt(playerid, "kontakty-dialog-slot")][eNumer], inputtext);
			RunCommand(playerid, "/sms",  string);
		}
	}
	else if(dialogid == D_KONTAKTY_EDYTUJ)
	{
		if(response)
		{
			SetPVarInt(playerid, "kontakty-dialog-slot", PobierzIdKontaktuZDialogu(playerid, listitem));
			ShowPlayerDialogEx(playerid, D_KONTAKTY_EDYTUJ_NOWA_NAZWA, DIALOG_STYLE_INPUT, "Kontakty - edytuj", "Wprowadź nową nazwę kontaktu.\nMaksymalnie "#MAX_KONTAKT_NAME" znaki", "Zmień", "Anuluj");
		}
	}
	else if(dialogid == D_KONTAKTY_EDYTUJ_NOWA_NAZWA)
	{
		if(response)
		{
			EdytujKontakt(playerid, GetPVarInt(playerid, "kontakty-dialog-slot"), inputtext);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kontakt edytowany.");
		}
	}
	else if(dialogid == D_KONTAKTY_USUN)
	{
		if(response)
		{
			UsunKontakt(playerid, PobierzIdKontaktuZDialogu(playerid, listitem));
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kontakt usunięty.");
		}
	}
	else if(dialogid == D_KONTAKTY_LISTA)
	{
		if(response)
		{
			SendClientMessage(playerid, COLOR_WHITE, inputtext);
		}
	}
	else if(dialogid == D_PERSONALIZE)
	{
		if(!response)
		{
			sendTipMessage(playerid, "Wyszedłeś z personalizacji - ustawienia zapisane"); 
			return 1;
		}
		else if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ShowPersonalization(playerid, 1); 
				}
				case 1:
				{
					ShowPersonalization(playerid, 2); 
				}
				case 2:
				{
					if(PlayerInfo[playerid][pAdmin] == 0 && PlayerInfo[playerid][pNewAP] == 0)
					{
						sendTipMessage(playerid, "Nie jesteś administratorem"); 
						return 1;
					}
					ShowPersonalization(playerid, 3); 
				}
				case 3:
				{
					ShowPersonalization(playerid, 4); 
				}
			}
		}
	}
	else if(dialogid == D_PERS_VEH)
	{
		if(!response)
		{
			ShowPlayerDialogEx(playerid, D_PERSONALIZE, DIALOG_STYLE_LIST, "M-RP", "Pojazd\nChat\nAdmin\nInne", "Akceptuj", "Wyjdz");
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerPersonalization[playerid][PERS_LICZNIK] == 0)
					{
						PlayerPersonalization[playerid][PERS_LICZNIK] = 1; 
						ToggleSpeedo[playerid] = true;
						sendTipMessage(playerid, "Wyłączyłeś wyświetlanie licznika!"); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_LICZNIK] = 0;
						ToggleSpeedo[playerid] = false;
						sendTipMessage(playerid, "Włączyłeś wyświetlanie licznika w wozie!");
					}
				}
				case 1:
				{
					if(PlayerPersonalization[playerid][PERS_CB] == 0)
					{
						PlayerPersonalization[playerid][PERS_CB] = 1;
						sendTipMessage(playerid, "Wyłączyłeś CB-RADIO"); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_CB] = 0;
						sendTipMessage(playerid, "Włączyłeś CB-RADIO!"); 
					}
				}
			}
		}
	}
	else if(dialogid == NOWY_GRACZ)
	{
		if(response)
		{	
			new string[256];
			format(string, sizeof(string), "Na serwerze pojawił się nowy gracz, który potrzebuje pomocy w celu oprowadzenia po serwerze! Tepnij się do niego (Nick:%s, ID:%d)", GetNick(playerid), GetPlayerIDFromName(GetNick(playerid)));
			SendAdminMessage(COLOR_RED, string);
			SendZGWiadomosc(COLOR_RED, string);
		}
		if(!response)
		{
			sendTipMessage(playerid, "Życzymy miłej rozgrywki na serwerze! W razie wątpliwości użyj /zapytaj");
		}
		//Startowy pojazd
		BeginnerCarDialog(playerid);
	}
	else if(dialogid == NOWY_GRACZ_POJAZD)
	{
		if(!response) return BeginnerCarDialog(playerid);
		new modelid = strval(inputtext);
		
		if(modelid != 462 && modelid != 481 && modelid != 478)
			return sendErrorMessage(playerid, "Coś poszło nie tak.");
		
		new losuj = random(sizeof(LosowyParking));
		new carid = Car_Create(modelid, LosowyParking[losuj][0], LosowyParking[losuj][1], LosowyParking[losuj][2], LosowyParking[losuj][3], 228, 228);
		
		if(carid == -1)
		{
			SendClientMessage(playerid, COLOR_PANICRED, "Nie można stworzyć pojazdu! Rekord nie został dodany do bazy.");
			return 0;
		}
		
		Car_MakePlayerOwner(playerid, carid);
		Car_Unspawn(CarData[carid][c_ID]);
		
		va_SendClientMessage(playerid, COLOR_GRAD4, "»» Wybrałeś pojazd %s, znajduje się on na parkingu salonu aut.", VehicleNames[modelid-400]);
	}
	else if(dialogid == DIALOG_DMV)
	{
		if(!response)
		{
			ProxDetector(15.0, playerid, "Urzędnik mówi: Dziękujemy i zapraszamy ponownie!", COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
			return 1;
		}
		if(response)
		{
			new string[124];

			if(listitem < 0 || listitem > 9) return 1;

			if(kaska[playerid] < DmvLicenseCost[listitem])
			{
				sendErrorMessage(playerid, sprintf("Ta usługa kosztuje %d$, a Ty tyle nie masz!", DmvLicenseCost[listitem]));
				return 1;
			}

			switch(listitem)
			{
				case 0: //Dowód osobisty
				{
					PlayerInfo[playerid][pDowod] = 1;
					format(string, sizeof(string), "Urzędnik wprowadza dane %s do komputera, drukuje laminuje i podaje dowód osobisty", GetNick(playerid)); 
					ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Log(payLog, WARNING, "%s kupił dowód osobisty za %d$", GetPlayerLogName(playerid), DmvLicenseCost[listitem]);
				}
				case 1:
				{
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}
					if(PlayerInfo[playerid][pFishLic] == 1)
					{
						sendErrorMessage(playerid, "Masz już kartę wędkarską!"); 
						return 1;
					}

					PlayerInfo[playerid][pFishLic] = 1;
					format(string, sizeof(string), "Urzędnik wprowadza dane %s do komputera, drukuje laminuje i podaje kartę wędkarską", GetNick(playerid)); 
					ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Log(payLog, WARNING, "%s kupił kartę wędkarską za %d$", GetPlayerLogName(playerid), DmvLicenseCost[listitem]);
				}
				case 2:
				{
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}

					PlayerInfo[playerid][pGunLic] = 1;
					format(string, sizeof(string), "Urzędnik wprowadza dane %s do komputera, drukuje laminuje i podaje pozwolenie na broń", GetNick(playerid)); 
					ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Log(payLog, WARNING, "%s kupił pozwolenie na broń za %d$", GetPlayerLogName(playerid), DmvLicenseCost[listitem]);
				}
				case 3:
				{
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}
					
					PlayerInfo[playerid][pBoatLic] = 1;
					format(string, sizeof(string), "Urzędnik wprowadza dane %s do komputera, drukuje laminuje i podaje patent żeglarski", GetNick(playerid)); 
					ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Log(payLog, WARNING, "%s kupił patent żeglarski za %d$", GetPlayerLogName(playerid), DmvLicenseCost[listitem]);
				}
				case 4:
				{
					if(PlayerInfo[playerid][pCarLic] > 1000)
					{
						new lTime = PlayerInfo[playerid][pCarLic]-gettime();
						new hh, mm;
						hh = floatround(floatround(floatdiv(lTime, 3600), floatround_floor)%24,floatround_floor);
						mm = floatround(floatround(floatdiv(lTime, 60), floatround_floor)%60,floatround_floor);
						format(string, 128, "Zostało Ci odebrane prawo jazdy! Blokada mija za %d h i %d min", hh, mm);
						SendClientMessage(playerid, COLOR_GRAD2, string);
						return 1;
					}
					if(PlayerInfo[playerid][pCarLic] == 2)
					{
						sendErrorMessage(playerid, "Zaliczyłeś już egzamin teoretyczny!"); 
						return 1;
					}
					if(PlayerInfo[playerid][pCarLic] == 1)
					{
						sendErrorMessage(playerid, "Masz już prawo do jazdy!"); 
						return 1;
					}
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}

					PlayerInfo[playerid][pPrawojazdypytania] = 0;
					PlayerInfo[playerid][pPrawojazdydobreodp] = 0;
					PlayerInfo[playerid][pPrawojazdyzleodp] = 0;
					PlayerInfo[playerid][pMinalczasnazdpr] = 0;
					PlayerInfo[playerid][pWtrakcietestprawa] = 1;
					format(string, sizeof(string), "* Urzędnik wyciąga test oraz długopis i podaje %s", GetNick(playerid));
					ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					ShowPlayerDialogEx(playerid, D_PJTEST, DIALOG_STYLE_MSGBOX, "Prawo jazdy - Test", "{7FFF00}Witaj!\n{FFFFFF}Rozpoczynasz test na prawo jazdy.\nW teście {FF0000}NIE UżYWAJ{FFFFFF} polskich znaków!\n\nżyczymy powodzenia!", "Rozpocznij", "");
				}
				case 5:
				{
					if(PlayerInfo[playerid][pCarLic] != 2)
					{
						sendErrorMessage(playerid, "Najpierw podejdź do egzaminu teoretycznego!"); 
						return 1;
					}
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}

					sendTipMessage(playerid, "Egzaminy praktyczne zostaną dodane już wkrótce!"); 
					sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Gratulacje! Zdałeś egzamin praktyczny!"); 
					TakingLesson[playerid] = 0;
					PlayerInfo[playerid][pCarLic] = 3;
				}
				case 6:
				{
					if(PlayerInfo[playerid][pCarLic] < 3)
					{
						sendErrorMessage(playerid, "Najpierw podejdź do egzaminu teoretycznego/praktycznego!"); 
						return 1;
					}
					if(PlayerInfo[playerid][pCarLic] == 1)
					{
						sendErrorMessage(playerid, "Masz już prawo jazdy!"); 
						return 1;
					}
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}
					PlayerInfo[playerid][pCarLic] = 1;
					sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Odebrałeś prawo do jazdy."); 
					Log(payLog, WARNING, "%s kupił licencje na pojazdy za %d$", GetPlayerLogName(playerid), DmvLicenseCost[listitem]);
				}
				case 7:
				{
					if(PlayerInfo[playerid][pFlyLic] == 1)
					{
						sendErrorMessage(playerid, "Masz już licencje na latanie!"); 
						return 1;
					}
					if(PlayerInfo[playerid][pDowod] < 1)
					{
						sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
						return 1;
					}

					PlayerInfo[playerid][pFlyLic] = 1;
					sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Odebrałeś licencje na latanie!"); 
					Log(payLog, WARNING, "%s kupił licencje na latanie za %d$", GetPlayerLogName(playerid), DmvLicenseCost[listitem]);
				}
			}
			Sejf_Add(FRAC_GOV, DmvLicenseCost[listitem]);
			ZabierzKaseDone(playerid, DmvLicenseCost[listitem]);
		}
	}
	else if(dialogid == D_PERS_CHAT)
	{
		if(!response)
		{
			ShowPlayerDialogEx(playerid, D_PERSONALIZE, DIALOG_STYLE_LIST, "M-RP", "Pojazd\nChat\nAdmin\nInne", "Akceptuj", "Wyjdz");
			return 1;	
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerPersonalization[playerid][PERS_AD] == 0)
					{
						PlayerPersonalization[playerid][PERS_AD] = 1;
						sendTipMessage(playerid, "Wyłączyłeś wyświetlanie ogłoszeń graczy!"); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_AD] = 0;
						sendTipMessage(playerid, "Włączyłeś widoczność ogłoszeń graczy!"); 
					}
				}
				case 1:
				{
					if(PlayerPersonalization[playerid][PERS_NEWBIE] == 0)
					{
						PlayerPersonalization[playerid][PERS_NEWBIE] =1;
						sendTipMessage(playerid, "Wyłączyłeś chat newbie!"); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_NEWBIE] =0;
						sendTipMessage(playerid, "Włączyłeś chat newbie!"); 
					}
				}
				case 2:
				{
					if(PlayerPersonalization[playerid][PERS_FAMINFO] == 0)
					{
						PlayerPersonalization[playerid][PERS_FAMINFO] = 1;
						sendTipMessage(playerid, "Wyłączyłeś komunikaty od grup!"); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_FAMINFO] = 0;
						sendTipMessage(playerid, "Włączyłeś komunikaty od grup!"); 
					}
				}
				case 3:
				{
					if(PlayerPersonalization[playerid][PERS_TALKANIM] == 0)
					{
						PlayerPersonalization[playerid][PERS_TALKANIM] = 1;
						sendTipMessage(playerid, "Wyłączyłeś animacje mówienia!"); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_TALKANIM] = 0;
						sendTipMessage(playerid, "Włączyłeś animacje mówienia!"); 
					}
				}
				case 4:			
				{
					if(PlayerPersonalization[playerid][PERS_JOINLEAVE] == 0)
					{
						PlayerPersonalization[playerid][PERS_JOINLEAVE] = 1;
						sendTipMessage(playerid, "Wyłączyłeś komunikat o dołączeniu/wyjściu gracza z serwera."); 
					}
					else
					{
						PlayerPersonalization[playerid][PERS_JOINLEAVE] = 0;
						sendTipMessage(playerid, "Włączyłeś komunikat o dołączeniu/wyjściu gracza z serwera."); 
					}
				}
				case 5: // Typ ogłoszeń /og
				{
					PlayerPersonalization[playerid][PERS_OG_TYPE]++;
					if(PlayerPersonalization[playerid][PERS_OG_TYPE] > 2)
						PlayerPersonalization[playerid][PERS_OG_TYPE] = 0;
						
					if(PlayerPersonalization[playerid][PERS_OG_TYPE] == 0)
						sendTipMessage(playerid, "Ogłoszenia będą wyświetlane jako ~g~CHAT");
					else if(PlayerPersonalization[playerid][PERS_OG_TYPE] == 1)
						sendTipMessage(playerid, "Ogłoszenia będą wyświetlane jako ~g~TEXTDRAW");
					else
						sendTipMessage(playerid, "Ogłoszenia będą wyświetlane ~g~WSZĘDZIE");
					
					ShowPersonalization(playerid, 2); // Odśwież dialog
				}
				case 6: // Komunikaty /aresztuj
				{
					if(PlayerPersonalization[playerid][PERS_ARREST_MSG] == 0)
					{
						PlayerPersonalization[playerid][PERS_ARREST_MSG] = 1;
						sendTipMessage(playerid, "Wyłączyłeś komunikaty o aresztowaniach!");
					}
					else
					{
						PlayerPersonalization[playerid][PERS_ARREST_MSG] = 0;
						sendTipMessage(playerid, "Włączyłeś komunikaty o aresztowaniach!");
					}
				}
				case 7: // Komunikaty /news
				{
					if(PlayerPersonalization[playerid][PERS_NEWS_MSG] == 0)
					{
						PlayerPersonalization[playerid][PERS_NEWS_MSG] = 1;
						sendTipMessage(playerid, "Wyłączyłeś komunikaty SAN NEWS!");
					}
					else
					{
						PlayerPersonalization[playerid][PERS_NEWS_MSG] = 0;
						sendTipMessage(playerid, "Włączyłeś komunikaty SAN NEWS!");
					}
				}
			}
		}
	}
	else if(dialogid == D_PERS_ADMIN)
	{
		if(!response)
		{
			ShowPlayerDialogEx(playerid, D_PERSONALIZE, DIALOG_STYLE_LIST, "M-RP", "Pojazd\nChat\nAdmin\nInne", "Akceptuj", "Wyjdz");
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerPersonalization[playerid][PERS_REPORT] == 0)
					{
						PlayerPersonalization[playerid][PERS_REPORT] = 1;
						sendTipMessage(playerid, "Wyłączyłeś widoczność zgłoszeń graczy"); 
					}
					else if(PlayerPersonalization[playerid][PERS_REPORT] == 1)
					{
						PlayerPersonalization[playerid][PERS_REPORT] = 0;
						sendTipMessage(playerid, "Włączyłeś widoczność zgłoszeń graczy"); 
					}
				}
				case 1:
				{
					if(PlayerPersonalization[playerid][WARNDEATH] == 0)
					{
						PlayerPersonalization[playerid][WARNDEATH] = 1;
						sendTipMessage(playerid, "Wyłączyłeś podgląd widoczności śmierci graczy"); 
					}
					else if(PlayerPersonalization[playerid][WARNDEATH] == 1)
					{
						PlayerPersonalization[playerid][WARNDEATH] =0;
						sendTipMessage(playerid, "Włączyłeś podgląd widoczności śmierci graczy!"); 
					}
				}
			}
		}
	}
	else if(dialogid == D_PERS_INNE)
	{
		if(!response)
		{
			ShowPlayerDialogEx(playerid, D_PERSONALIZE, DIALOG_STYLE_LIST, "M-RP", "Pojazd\nChat\nAdmin\nInne", "Akceptuj", "Wyjdz");
			return 1;
		}
		if(response)
		{
			switch(listitem)
			{
				case 0://Konto Bankowe
				{
					if(PlayerPersonalization[playerid][PERS_KB] == 0)
					{
						PlayerPersonalization[playerid][PERS_KB]=1; 
						sendTipMessage(playerid, "Wyłączyłeś przelew za pomocą /kb"); 
					}
					else if(PlayerPersonalization[playerid][PERS_KB] == 1)
					{
						PlayerPersonalization[playerid][PERS_KB] =0; 
						sendTipMessage(playerid, "Włączyłeś przelew za pomocą /kb"); 
					}
				}
				case 1://NickNames
				{
					if(PlayerPersonalization[playerid][PERS_NICKNAMES] == 0)
					{
						PlayerPersonalization[playerid][PERS_NICKNAMES] =1; 
						sendTipMessage(playerid, "Wyłączyłeś wyświetlanie nicków nad głową!");
						SetPVarInt(playerid, "tognick", 1);
      					foreach(new i : Player)
						{
							ShowPlayerNameTagForPlayer(playerid, i, 0);
						}
					}
					else if(PlayerPersonalization[playerid][PERS_NICKNAMES] == 1)
					{
						PlayerPersonalization[playerid][PERS_NICKNAMES] = 0; 
						sendTipMessage(playerid, "Włączyłeś wyświetlanie nicków nad głową"); 
						SetPVarInt(playerid, "tognick", 1);
      					foreach(new i : Player)
						{
							ShowPlayerNameTagForPlayer(playerid, i, 1);
						}
					}
				
				}
				case 2:
				{
					if(togADMTXD[playerid] == 0)
					{
						togADMTXD[playerid] =1; 
						sendTipMessage(playerid, "Wyłączyłeś textdrawy kar");
						PlayerPersonalization[playerid][PERS_KARYTXD] =1;
					}
					else if(togADMTXD[playerid] == 1)
					{
						togADMTXD[playerid] =0; 
						sendTipMessage(playerid, "Włączyłeś textdrawy kar"); 
						PlayerPersonalization[playerid][PERS_KARYTXD]=0;
					}
				}
				case 3:
				{
					if(PlayerPersonalization[playerid][PERS_GUNSCROLL] == 0)
					{
						sendTipMessage(playerid, "Wyłączyłeś auto-gui po zmianie broni");
						PlayerPersonalization[playerid][PERS_GUNSCROLL] = 1;
					}
					else if(PlayerPersonalization[playerid][PERS_GUNSCROLL] == 1)
					{
						sendTipMessage(playerid, "Włączyłeś auto-gui po zmianie broni");
						PlayerPersonalization[playerid][PERS_GUNSCROLL] = 0;
					}
				}

			}
		}
	}
	else if(dialogid == D_VINYL)
	{
		if(response)
		{
			new txt_light[128], txt_neon[128], txt_sphere[128], txt_podest[128], txt_zaluzja[128];
			new txt_klub[256], txt_biuro[256], txt_dym[128], txt_eq[128], txt_txt[128];
			// KLUB
			if(lightsVinyl == false){
				format(txt_light, 128, "{FFFFFF}Oświetlenie: \t{FF0000}Wyłączone");
			}else{
				format(txt_light, 128, "{FFFFFF}Oświetlenie: \t{00FF00}Włączone");
			}
			if(neonVinyl == 0){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \tBrak");
			}
			if(neonVinyl == 1){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \tMieszane");
			}
			if(neonVinyl == 2){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \t{1E2BFE}Niebieski");
			}
			if(neonVinyl == 3){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \t{C71E09}Czerwony");
			}
			if(neonVinyl == 4){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \t{CD17F9}Fioletowy");
			}
			if(neonVinyl == 5){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \t{1CFF27}Zielony");
			}
			if(neonVinyl == 6){
				format(txt_neon, 128, "{FFFFFF}\nNeony: \t{F3FA30}żółty");
			}
			if(sphereVinyl == false){
				format(txt_sphere, 128, "{FFFFFF}\nKula: \t{FF0000}Wyłączone");
			}else{
				format(txt_sphere, 128, "{FFFFFF}\nKula: \t{00FF00}Włączone");
			}
			if(podestVinyl == false){
				format(txt_podest, 128, "{FFFFFF}\nPodest: \t{FF0000}Wyłączone");
			}else{
				format(txt_podest, 128, "{FFFFFF}\nPodest: \t{00FF00}Włączone");
			}
			if(dymVinyl == false){
				format(txt_dym, 128, "{FFFFFF}\nDym: \t{FF0000}Wyłączone");
			}else{
				format(txt_dym, 128, "{FFFFFF}\nDym: \t{00FF00}Włączone");
			}
			if(eqVinyl == false){
				format(txt_eq, 128, "{FFFFFF}\nEqualizator: \t{FF0000}Wyłączone");
			}else{
				format(txt_eq, 128, "{FFFFFF}\nEqualizator: \t{00FF00}Włączone");
			}
			if(textVinyl == false){
				format(txt_txt, 128, "{FFFFFF}\nTekst: \t{FF0000}Wyłączone");
			}else{
				format(txt_txt, 128, "{FFFFFF}\nTekst: \t{00FF00}Włączone");
			}
			format(txt_klub, 256, "%s %s %s %s %s %s %s", txt_light, txt_neon, txt_sphere, txt_podest, txt_dym, txt_eq, txt_txt);
			// BIURO
			if((moveZaluzja1 == false) && (moveZaluzja2 == false)){
				format(txt_zaluzja, 128, "{FFFFFF}żaluzje: \t{00FF00}Włączone");
			}else{
				format(txt_zaluzja, 128, "{FFFFFF}żaluzje: \t{FF0000}Wyłączone");
			}
			format(txt_biuro, 256, "%s \n{FFFFFF}Kamery: \tOglądaj", txt_zaluzja);
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialogEx(playerid, D_VINYL_K, DIALOG_STYLE_LIST, "{00FFFF}VinylClub{FFFFFF} | Klub", txt_klub, "Wybierz", "Anuluj");
				}
				case 1:
				{
					ShowPlayerDialogEx(playerid, D_VINYL_B, DIALOG_STYLE_LIST, "{00FFFF}VinylClub{FFFFFF} | Biuro", txt_biuro, "Wybierz", "Anuluj");
				}
				case 2:
				{
					ShowPlayerDialogEx(playerid, D_VINYL_J, DIALOG_STYLE_LIST, "{00FFFF}VinylClub{FFFFFF} | Jacuzzi", "Jacuzzi", "Wybierz", "Anuluj");
				}
			}
		}
	}
	else if(dialogid == D_VINYL_K)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{

					if(lightsVinyl == false)
					{
						led1 = CreateDynamicObject(18653, 822.621154, -1387.984619, -19.836418, 0.000000, -11.000000, 70.000000, 71, 0, -1, 300.00, 300.00); 
						led2 = CreateDynamicObject(18653, 811.361022, -1387.984619, -19.836418, 0.000000, -11.000000, 110.000000, 71, 0, -1, 300.00, 300.00); 
						led3 = CreateDynamicObject(18102, 820.466613, -1402.050292, -20.383949, 31.300003, 0.000000, 0.000000, 71, 0, -1, 300.00, 300.00); 
						sendTipMessageEx(playerid, COLOR_P@, "Pomyślnie wyłączono oświetlenie"); 
						lightsVinyl = true;
					}
					else
					{
						DestroyDynamicObject(led1);
						DestroyDynamicObject(led2);
						DestroyDynamicObject(led3);
						lightsVinyl = false;
						sendTipMessageEx(playerid, COLOR_P@, "Pomyślnie wyłączono oświetlenie!"); 
					}
				}
				case 1:
				{
					ShowPlayerDialogEx(playerid, D_VINYL_NEON, DIALOG_STYLE_LIST, "{00FFFF}VinylClub{FFFFFF} | Klub >> Neony", "Brak \nMieszane \n{1E2BFE}Niebieski \n{C71E09}Czerwony \n{CD17F9}Fioletowy \n{1CFF27}Zielony \n{F3FA30}żółty", "Wybierz", "Anuluj");
				}
				case 2:
				{
					if(sphereVinyl == false){
						kula = CreateDynamicObject(3054, 817.169311, -1394.821899, -9.629315, 0.000000, 0.000000, 0.000000, 71, 0, -1, 340.00, 340.00); 
						SetDynamicObjectMaterial(kula, 0, 19041, "matwatches", "watchtype10map", 0x00000000);
						SetDynamicObjectMaterial(kula, 1, 18901, "matclothes", "hatmap1", 0x00000000);
						MoveDynamicObject(kula, 817.169311, -1394.821899, -13.629315, 1);
						sphereTimer = SetTimer("SphereSpinFirst", 5000, false);
						
						
						sphereVinyl = true;
					}else{
						MoveDynamicObject(kula, 817.169311, -1394.821899, -9.629315, 1);
						KillTimer(sphereTimer);
						KillTimer(sphereTimer_second);
						
						sphereVinyl = false;
					}
				}
				case 3:
				{
					if(podestVinyl == false){
						MoveDynamicObject(podest1, 816.637390, -1403.019653, -24.998998, 1);
						MoveDynamicObject(podest2, 816.607849, -1402.989624, -22.408988, 1);
						podestVinyl = true;
						sendTipMessage(playerid, "Podest został wysunięy!");
					}else{
						MoveDynamicObject(podest1, 816.637390, -1403.019653, -26.998998, 1);
						MoveDynamicObject(podest2, 816.607849, -1402.989624, -24.408988, 1);
						podestVinyl = false;
						sendTipMessage(playerid, "Podest został schowany!"); 
					}
				}
				case 4:{
					if(dymVinyl == false){
						dym1 = CreateDynamicObject(18747, 817.424255, -1390.892700, -23.989006, 0.000000, 0.000000, 0.000000, 71, 0, -1, 300.00, 300.00); 
						dym2 = CreateDynamicObject(18747, 817.424255, -1394.652587, -23.989006, 0.000000, 0.000000, 0.000000, 71, 0, -1, 300.00, 300.00); 
						dym3 = CreateDynamicObject(18747, 817.424255, -1398.743164, -23.989006, 0.000000, 0.000000, 0.000000, 71, 0, -1, 300.00, 300.00); 

						dym4 = CreateDynamicObject(18728, 812.184020, -1386.922851, -22.539764, 22.800003, 0.000000, 0.000000, 71, 0, -1, 300.00, 300.00); 
						dym5 = CreateDynamicObject(18728, 821.514099, -1386.922851, -22.539764, 22.800003, 0.000000, 0.000000, 71, 0, -1, 300.00, 300.00); 
						dymVinyl = true;
						sendTipMessage(playerid, "Dym w sali vinyl Club został włączony!"); 
					}else{
						DestroyDynamicObject(dym1);
						DestroyDynamicObject(dym2);
						DestroyDynamicObject(dym3);
						DestroyDynamicObject(dym4);
						DestroyDynamicObject(dym5);
						dymVinyl = false;
						sendTipMessage(playerid, "Dym w sali Vinyl Club został wyłączony!"); 
					}
				}
				case 5:{
					if(eqVinyl == false){
						eq_1_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -23.328979, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_1_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -23.328979, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_1_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_1_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_2_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -22.818969, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_2_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -22.818969, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_2_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_2_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_3_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -22.298957, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_3_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -22.298957, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_3_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_3_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_4_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -21.728950, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_4_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -21.728950, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_4_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_4_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_5_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -21.158937, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_5_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -21.158937, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_5_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_5_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_6_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -20.598926, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_6_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -20.598926, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_6_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_6_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_7_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -20.028915, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_7_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -20.028915, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_7_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_7_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);

						eq_8_1 = CreateDynamicObject(19939, 809.013793, -1387.950805, -19.468902, 180.000000, 90.000000, 90.000000, 71, 0, -1, 300.00, 300.00); 
						eq_8_2 = CreateDynamicObject(19939, 824.865051, -1387.950805, -19.468902, -0.000007, 270.000000, -89.999984, 71, 0, -1, 300.00, 300.00); 
						SetDynamicObjectMaterial(eq_8_1, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						SetDynamicObjectMaterial(eq_8_2, 0, 10765, "airportgnd_sfse", "white", 0xFF202020);
						eqTimer_First = SetTimer("eqFirst", 2000, true);
						eqTimer_First = SetTimer("eqSecond", 1400, true);
						eqTimer_First = SetTimer("eqThird", 900, true);
						eqTimer_First = SetTimer("eqFourth", 400, true);
					
						eqVinyl = true;
					}else{
						DestroyEq();
						KillTimer(eqTimer_First);
						KillTimer(eqTimer_Second);
						KillTimer(eqTimer_Third);
						KillTimer(eqTimer_Fourth);
						eqVinyl = false;
					}
				}
				case 6:{
					ShowPlayerDialogEx(playerid, D_VINYL_TEKST, DIALOG_STYLE_INPUT, "PANEL: {00FFFF}VinylClub >> Tekst", "Wpisz tekst", "Wybierz", "Anuluj");
				}
			}
		}
	}
	else if(dialogid == D_VINYL_TEKST)
	{
		if(response)
		{
			if(textVinyl == false){
				text_Vinyl = CreateDynamicObject(7911, 817.176879, -1386.975463, -21.528980, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
				SetDynamicObjectMaterialText(text_Vinyl, 0, inputtext, 130, "Calibri", 20, 0, 0xFF00FFFF, 0x00000000, 1);
				textVinyl_Timer = SetTimer("textVinylT", 3000, true);
				textVinyl = true;
			}else{
				textVinyl = false;
				KillTimer(textVinyl_Timer);
				DestroyDynamicObject(text_Vinyl);
			}
		}
	}
	else if(dialogid == D_VINYL_NEON)
	{
		if(response){
			switch(listitem){
				case 0:{
					DestroyNeons();
					neonsVinyl = false;
					KillTimer(NeonsTimer);
				}
				case 1:{
					// MIESZANE
					if(neonsVinyl == false){
						DestroyNeons();
						neon1 = CreateDynamicObject(18647, 821.522766, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon2 = CreateDynamicObject(18647, 812.322387, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - blue
						neon3 = CreateDynamicObject(18648, 836.026428, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon4 = CreateDynamicObject(18648, 797.565612, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon5 = CreateDynamicObject(18648, 816.854736, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon6 = CreateDynamicObject(18648, 818.914855, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon7 = CreateDynamicObject(18648, 820.985351, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon8 = CreateDynamicObject(18648, 814.755065, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon9 = CreateDynamicObject(18648, 812.654663, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon10 = CreateDynamicObject(18648, 895.382629, -1416.163452, -20.143314, 0.000007, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon11 = CreateDynamicObject(18648, 899.163024, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon12 = CreateDynamicObject(18648, 895.652343, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						// - purple
						neon13 = CreateDynamicObject(18651, 821.579284, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon14 = CreateDynamicObject(18651, 831.959838, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon15 = CreateDynamicObject(18651, 811.879882, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon16 = CreateDynamicObject(18651, 803.919372, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - yellow
						neon17 = CreateDynamicObject(18650, 805.490844, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon18 = CreateDynamicObject(18650, 828.301147, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - green
						neon19 = CreateDynamicObject(18649, 835.885803, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon20 = CreateDynamicObject(18649, 835.885803, -1413.598632, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon21 = CreateDynamicObject(18649, 835.885803, -1407.657836, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon22 = CreateDynamicObject(18649, 798.036376, -1407.517700, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon23 = CreateDynamicObject(18649, 798.036376, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						
						NeonsTimer = SetTimer("MoveNeons", 3000, true);
						neonVinyl = 1;
						neonsVinyl = true;
					}else{
						DestroyNeons();
						neonsVinyl = false;
						neonVinyl = 0;
					}
				}
				case 2:{
					// MIESZANE
					if(neonsVinyl == false){
						DestroyNeons();
						neon1 = CreateDynamicObject(18648, 821.522766, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon2 = CreateDynamicObject(18648, 812.322387, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - blue
						neon3 = CreateDynamicObject(18648, 836.026428, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon4 = CreateDynamicObject(18648, 797.565612, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon5 = CreateDynamicObject(18648, 816.854736, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon6 = CreateDynamicObject(18648, 818.914855, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon7 = CreateDynamicObject(18648, 820.985351, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon8 = CreateDynamicObject(18648, 814.755065, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon9 = CreateDynamicObject(18648, 812.654663, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon10 = CreateDynamicObject(18648, 895.382629, -1416.163452, -20.143314, 0.000007, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon11 = CreateDynamicObject(18648, 899.163024, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon12 = CreateDynamicObject(18648, 895.652343, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						// - purple
						neon13 = CreateDynamicObject(18648, 821.579284, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon14 = CreateDynamicObject(18648, 831.959838, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon15 = CreateDynamicObject(18648, 811.879882, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon16 = CreateDynamicObject(18648, 803.919372, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - yellow
						neon17 = CreateDynamicObject(18648, 805.490844, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon18 = CreateDynamicObject(18648, 828.301147, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - green
						neon19 = CreateDynamicObject(18648, 835.885803, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon20 = CreateDynamicObject(18648, 835.885803, -1413.598632, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon21 = CreateDynamicObject(18648, 835.885803, -1407.657836, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon22 = CreateDynamicObject(18648, 798.036376, -1407.517700, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon23 = CreateDynamicObject(18648, 798.036376, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						
						NeonsTimer = SetTimer("MoveNeons", 3000, true);
						neonVinyl = 2;
						neonsVinyl = true;
					}else{
						DestroyNeons();
						neonsVinyl = false;
						neonVinyl = 0;
					}
				}
				case 3:{
					// MIESZANE
					if(neonsVinyl == false){
						DestroyNeons();
						neon1 = CreateDynamicObject(18647, 821.522766, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon2 = CreateDynamicObject(18647, 812.322387, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - blue
						neon3 = CreateDynamicObject(18647, 836.026428, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon4 = CreateDynamicObject(18647, 797.565612, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon5 = CreateDynamicObject(18647, 816.854736, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon6 = CreateDynamicObject(18647, 818.914855, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon7 = CreateDynamicObject(18647, 820.985351, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon8 = CreateDynamicObject(18647, 814.755065, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon9 = CreateDynamicObject(18647, 812.654663, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon10 = CreateDynamicObject(18647, 895.382629, -1416.163452, -20.143314, 0.000007, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon11 = CreateDynamicObject(18647, 899.163024, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon12 = CreateDynamicObject(18647, 895.652343, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						// - purple
						neon13 = CreateDynamicObject(18647, 821.579284, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon14 = CreateDynamicObject(18647, 831.959838, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon15 = CreateDynamicObject(18647, 811.879882, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon16 = CreateDynamicObject(18647, 803.919372, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - yellow
						neon17 = CreateDynamicObject(18647, 805.490844, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon18 = CreateDynamicObject(18647, 828.301147, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - green
						neon19 = CreateDynamicObject(18647, 835.885803, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon20 = CreateDynamicObject(18647, 835.885803, -1413.598632, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon21 = CreateDynamicObject(18647, 835.885803, -1407.657836, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon22 = CreateDynamicObject(18647, 798.036376, -1407.517700, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon23 = CreateDynamicObject(18647, 798.036376, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						
						NeonsTimer = SetTimer("MoveNeons", 3000, true);
						neonVinyl = 3;
						neonsVinyl = true;
					}else{
						DestroyNeons();
						neonsVinyl = false;
						neonVinyl = 0;
					}
				}
				case 4:{
					// MIESZANE
					if(neonsVinyl == false){
						DestroyNeons();
						neon1 = CreateDynamicObject(18651, 821.522766, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon2 = CreateDynamicObject(18651, 812.322387, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - blue
						neon3 = CreateDynamicObject(18651, 836.026428, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon4 = CreateDynamicObject(18651, 797.565612, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon5 = CreateDynamicObject(18651, 816.854736, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon6 = CreateDynamicObject(18651, 818.914855, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon7 = CreateDynamicObject(18651, 820.985351, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon8 = CreateDynamicObject(18651, 814.755065, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon9 = CreateDynamicObject(18651, 812.654663, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon10 = CreateDynamicObject(18651, 895.382629, -1416.163452, -20.143314, 0.000007, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon11 = CreateDynamicObject(18651, 899.163024, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon12 = CreateDynamicObject(18651, 895.652343, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						// - purple
						neon13 = CreateDynamicObject(18651, 821.579284, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon14 = CreateDynamicObject(18651, 831.959838, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon15 = CreateDynamicObject(18651, 811.879882, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon16 = CreateDynamicObject(18651, 803.919372, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - yellow
						neon17 = CreateDynamicObject(18651, 805.490844, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon18 = CreateDynamicObject(18651, 828.301147, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - green
						neon19 = CreateDynamicObject(18651, 835.885803, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon20 = CreateDynamicObject(18651, 835.885803, -1413.598632, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon21 = CreateDynamicObject(18651, 835.885803, -1407.657836, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon22 = CreateDynamicObject(18651, 798.036376, -1407.517700, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon23 = CreateDynamicObject(18651, 798.036376, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						
						NeonsTimer = SetTimer("MoveNeons", 3000, true);
						neonVinyl = 4;
						neonsVinyl = true;
					}else{
						DestroyNeons();
						neonsVinyl = false;
						neonVinyl = 0;
					}
				}
				case 5:{
					// MIESZANE
					if(neonsVinyl == false){
						DestroyNeons();
						neon1 = CreateDynamicObject(18649, 821.522766, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon2 = CreateDynamicObject(18649, 812.322387, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - blue
						neon3 = CreateDynamicObject(18649, 836.026428, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon4 = CreateDynamicObject(18649, 797.565612, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon5 = CreateDynamicObject(18649, 816.854736, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon6 = CreateDynamicObject(18649, 818.914855, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon7 = CreateDynamicObject(18649, 820.985351, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon8 = CreateDynamicObject(18649, 814.755065, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon9 = CreateDynamicObject(18649, 812.654663, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon10 = CreateDynamicObject(18649, 895.382629, -1416.163452, -20.143314, 0.000007, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon11 = CreateDynamicObject(18649, 899.163024, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon12 = CreateDynamicObject(18649, 895.652343, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						// - purple
						neon13 = CreateDynamicObject(18649, 821.579284, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon14 = CreateDynamicObject(18649, 831.959838, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon15 = CreateDynamicObject(18649, 811.879882, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon16 = CreateDynamicObject(18649, 803.919372, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - yellow
						neon17 = CreateDynamicObject(18649, 805.490844, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon18 = CreateDynamicObject(18649, 828.301147, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - green
						neon19 = CreateDynamicObject(18649, 835.885803, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon20 = CreateDynamicObject(18649, 835.885803, -1413.598632, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon21 = CreateDynamicObject(18649, 835.885803, -1407.657836, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon22 = CreateDynamicObject(18649, 798.036376, -1407.517700, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon23 = CreateDynamicObject(18649, 798.036376, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						
						NeonsTimer = SetTimer("MoveNeons", 3000, true);
						neonVinyl = 5;
						neonsVinyl = true;
					}else{
						DestroyNeons();
						neonsVinyl = false;
						neonVinyl = 0;
					}
				}
				case 6:{
					// MIESZANE
					if(neonsVinyl == false){
						DestroyNeons();
						neon1 = CreateDynamicObject(18650, 821.522766, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon2 = CreateDynamicObject(18650, 812.322387, -1400.391113, -19.608976, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - blue
						neon3 = CreateDynamicObject(18650, 836.026428, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon4 = CreateDynamicObject(18650, 797.565612, -1401.542114, -21.099332, 0.000000, 0.000000, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon5 = CreateDynamicObject(18650, 816.854736, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon6 = CreateDynamicObject(18650, 818.914855, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon7 = CreateDynamicObject(18650, 820.985351, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon8 = CreateDynamicObject(18650, 814.755065, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon9 = CreateDynamicObject(18650, 812.654663, -1387.407104, -17.199321, 0.000000, 0.000000, 270.000000, 71, 0, -1, 400.00, 400.00); 
						neon10 = CreateDynamicObject(18650, 895.382629, -1416.163452, -20.143314, 0.000007, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon11 = CreateDynamicObject(18650, 899.163024, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						neon12 = CreateDynamicObject(18650, 895.652343, -1413.132690, -15.103283, 0.000000, -0.000007, 180.000000, 71, 0, -1, 400.00, 400.00); 
						// - purple
						neon13 = CreateDynamicObject(18650, 821.579284, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon14 = CreateDynamicObject(18650, 831.959838, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon15 = CreateDynamicObject(18650, 811.879882, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon16 = CreateDynamicObject(18650, 803.919372, -1414.808471, -19.919300, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - yellow
						neon17 = CreateDynamicObject(18650, 805.490844, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						neon18 = CreateDynamicObject(18650, 828.301147, -1400.387573, -19.639308, 0.000000, 0.000000, 90.000000, 71, 0, -1, 400.00, 400.00); 
						// - green
						neon19 = CreateDynamicObject(18650, 835.885803, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon20 = CreateDynamicObject(18650, 835.885803, -1413.598632, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon21 = CreateDynamicObject(18650, 835.885803, -1407.657836, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon22 = CreateDynamicObject(18650, 798.036376, -1407.517700, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						neon23 = CreateDynamicObject(18650, 798.036376, -1391.377685, -19.889291, 0.000000, 0.000000, 0.000000, 71, 0, -1, 400.00, 400.00); 
						
						NeonsTimer = SetTimer("MoveNeons", 3000, true);
						neonVinyl = 6;
						neonsVinyl = true;
					}else{
						DestroyNeons();
						neonsVinyl = false;
						neonVinyl = 0;
					}
				}
			}
		}
	}
	else if(dialogid == D_VINYL_B)
	{
		if(response){
			switch(listitem){
				case 0:{
					if(IsPlayerInRangeOfPoint(playerid, 4, 678.121704, -1393.385620, -21.709302)){
						if((moveZaluzja1 == false) && (moveZaluzja2 == false)){
							MoveDynamicObject(zaluzja1, 678.121704, -1393.385620, -19.709302, 1);
							MoveDynamicObject(zaluzja2, 680.731506, -1393.385620, -19.709302, 1);
							moveZaluzja1 = true;
							moveZaluzja2 = true;
						}else{
							MoveDynamicObject(zaluzja1, 678.121704, -1393.385620, -21.709302, 1);
							MoveDynamicObject(zaluzja2, 680.731506, -1393.385620, -21.709302, 1);
							moveZaluzja1 = false;
							moveZaluzja2 = false;
						}
					}
				}
				case 1:{
					ShowPlayerDialogEx(playerid, D_VINYL_CAM, DIALOG_STYLE_LIST, "PANEL: {00FFFF}VinylClub >> Kamery", "Brak \nHol \nObok baru \nPrzy łazienkach \nParkiet", "Wybierz", "Anuluj");
				}
			}
			
		}
	}
	else if(dialogid == D_VINYL_CAM)
	{
		if(response){
			if(IsPlayerInRangeOfPoint(playerid, 4,  674.076904, -1390.442871, -22.679317)){
				switch(listitem){
					case 0:{
						SetCameraBehindPlayer(playerid);
					}
					case 1:{
						//HOL PRZEDSIONEK
						SetPlayerCameraPos(playerid, 675.147, -1399.068, -20.939);
						SetPlayerCameraLookAt(playerid, 688.3051,-1395.4424,-22.6093, 1);
					}
					case 2:{
						//PRZY WEJź’CIU VIPA
						SetPlayerCameraPos(playerid, 804.162, -1414.056, -20.379);
						SetPlayerCameraLookAt(playerid, 801.9684,-1389.1116,-22.6193, 1);
					}
					case 3:{
						//PRZY WC
						SetPlayerCameraPos(playerid, 829.635, -1388.634, -20.350);
						SetPlayerCameraLookAt(playerid, 832.2269,-1413.2073,-22.6093, 1);
					}
					case 4:{
						//PARKIET
						SetPlayerCameraPos(playerid, 830.185, -1389.178, -14.814);
						SetPlayerCameraLookAt(playerid, 812.8127,-1399.2845,-22.5390, 1);
					}
				}
			}else{
				SendClientMessage(playerid, -1, "Nie znajdujesz się przy monitoringu");
			}
		}
	}
	else if (dialogid == DIALOG_KUPSKIN)
	{
		if(response) 
		{
			if(listitem < 0 || listitem >= sizeof(ShopSkins) || ShopSkins[listitem][SKIN_TYPE] != SKIN_TYPE_DEFAULT) 
			{
				//should never happend
				return 1;
			}
			if(kaska[playerid] < ShopSkins[listitem][SKIN_PRICE])
			{
				sendErrorMessage(playerid, "Nie posiadasz wystarczającej ilości gotówki, na tego skina");
				DialogKupSkin(playerid);
				return 1;
			}
			SetPlayerSkin(playerid, ShopSkins[listitem][SKIN_ID]);
			ZabierzKaseDone(playerid, ShopSkins[listitem][SKIN_PRICE]);
			PlayerInfo[playerid][pSkin] = ShopSkins[listitem][SKIN_ID]; 
			
			sendTipMessage(playerid, sprintf("Kupiłeś skina za %d$", ShopSkins[listitem][SKIN_PRICE])); 
			Log(payLog, WARNING, "%s kupił skina %d za %d$", GetPlayerLogName(playerid), ShopSkins[listitem][SKIN_ID], ShopSkins[listitem][SKIN_PRICE]);
			return 1;
		}
	}
	//System restauracji [2.7.9]
	else if(dialogid == D_RESTAURANT_PANEL_OPTIONS)
	{
		if(!response) return 0;
		new string[456], count = 0;
		string = "Typ\tNazwa\tCena\tIlość";
		DynamicGui_Init(playerid);
		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(groupid < 0 || groupid > MAX_GROUPS) return 0;
		switch(listitem)
		{
			case 0: //zarządzaj produktami
			{
				foreach(new i : Products)
				{
					if(Product[i][p_OrgID] != GroupInfo[groupid][g_UID]) continue;
					if(Product[i][p_ItemType] > sizeof ItemTypes-1) continue;
					strcat(string, sprintf("\n%s\t%s\t{00FF00}${FFFFFF}%d\t%d", ItemTypes[ Product[i][p_ItemType] ], Product[i][p_ProductName], Product[i][p_Price], Product[i][p_Quant]));
					DynamicGui_AddRow(playerid, DG_PRODUCTS_MANAGE, i);
					count++;
				}
				if(count < MAX_ORG_PRODUCTS) {
					strcat(string, "\n{00FF00}Stwórz nowy produkt");
					DynamicGui_AddRow(playerid, DG_PRODUCTS_CREATE);
				}
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCTS_OPTIONS, DIALOG_STYLE_TABLIST_HEADERS, "Panel produktów", string, "Dalej", "Cofnij");
			}
		}
	}
	else if(dialogid == D_RESTAURANT_PRODUCTS_OPTIONS)
	{
		if(!response) ShowPlayerDialogEx(playerid, D_RESTAURANT_PANEL_OPTIONS, DIALOG_STYLE_LIST, "Panel restauracji", "Zarządzaj produktami", "Dalej", "Zamknij");
		new dg_value = DynamicGui_GetValue(playerid, listitem), dg_data = DynamicGui_GetDataInt(playerid, listitem);
		new product = dg_data;
		if(dg_value == DG_PRODUCTS_MANAGE)
		{
			new options[128];
			if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Coś poszło nie tak, produkt przestał istnieć.");
			DynamicGui_SetDialogValue(playerid, product);
			format(options, sizeof options, "{FFFFFF}Zmień nazwę\n{FFFFFF}Zmień cenę\n{00FF00}Usuń produkt\n");
			strcat(options, "{FFFFFF}Dokup zapasy\n");
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_MANAGE, DIALOG_STYLE_LIST, sprintf("Zarządzanie produktem [%d]", product), options, "Dalej", "Zamknij");
		}
		else if(dg_value == DG_PRODUCTS_CREATE)
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_NAME, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Podaj nazwę produktu (max 12 znaków)", "Dalej", "Zamknij");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_CREATE_NAME)
	{
		if(!response) return 0;

		new escaped[128];
		mysql_escape_string(inputtext, escaped);
		if(strlen(escaped) > 12) return sendErrorMessage(playerid, "Nazwa nie może zawierać więcej niż 12 znaków!");
		if(CheckVulgarityString(escaped))
			return sendErrorMessage(playerid, "Ta nazwa jest nieprawidłowa!");
		if(sprawdzReklame(escaped, playerid)) return 0;

		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(groupid < 0 || groupid > MAX_GROUPS) return 0;
		SetPVarString(playerid, "product-create-name", escaped);
		if(GroupHavePerm(groupid, PERM_RESTAURANT)) 
		{
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_TYPE, DIALOG_STYLE_LIST, "Tworzenie produktu - Typ", "1. Jedzenie\n2. Napój", "Dalej", "Zamknij");
			//ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_VALUE2, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile procentu najedzenia ma dodawać produkt? (max: 50)", "Dalej", "Cofnij");
		}
		else return SendClientMessage(playerid, -1, "Wkrótce!"); //do rozwinięcia dla innych organizacji w przyszłości
		
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_TYPE)
	{
		if(!response) return 0;
		switch(listitem)
		{
			case 0:
			{
				SetPVarInt(playerid, "product-type", ITEM_TYPE_FOOD);
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_VALUE2, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile procentu najedzenia ma dodawać produkt? (max: 50)", "Dalej", "Cofnij");
			}
			case 1:
			{
				SetPVarInt(playerid, "product-type", ITEM_TYPE_DRINK);
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_VALUE2, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile procentu napojenia ma dodawać produkt? (max: 50)", "Dalej", "Cofnij");
			}
		}
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_CREATE_VALUE2)
	{
		if(!response) return ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_NAME, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Podaj nazwę produktu (max 12 znaków)", "Dalej", "Zamknij");
		new nj = strval(inputtext);
		if(!IsNumeric(inputtext) || !strlen(inputtext) || nj < 1 || nj > 50) {
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_VALUE2, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile procentu najedzenia/napojenia ma dodawać produkt? (max: 50)", "Dalej", "Cofnij");
			return sendErrorMessage(playerid, "Nieprawidłowa liczba!");
		}
		SetPVarInt(playerid, "product-create-nj", nj);
		ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_PRICE, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Podaj cenę produktu (max: 25000$)", "Dalej", "Cofnij");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_CREATE_PRICE)
	{
		if(!response) return ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_VALUE2, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile procentu najedzenia/napojenia ma dodawać produkt? (max: 50)", "Dalej", "Cofnij");
		new price = strval(inputtext);
		if(!IsNumeric(inputtext) || !strlen(inputtext) || price < 1 || price > 25000) {
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_PRICE, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Podaj cenę produktu (max: 25000$)", "Dalej", "Cofnij");
			return sendErrorMessage(playerid, "Nieprawidłowa cena!");
		}
		SetPVarInt(playerid, "product-create-pay",  floatround( (price * 30) / 100 ) ); //pobiera 30% ceny
		SetPVarInt(playerid, "product-create-price", price);
		ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_QUANT, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile produktów tego typu chcesz dodać?", "Dalej", "Cofnij");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_CREATE_QUANT)
	{
		if(!response) return ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_VALUE2, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile procentu najedzenia ma dodawać produkt? (max: 50)", "Dalej", "Cofnij");
		new quant = strval(inputtext);
		if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1) {
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_QUANT, DIALOG_STYLE_INPUT, "Tworzenie produktu", "Ile produktów tego typu chcesz dodać?", "Dalej", "Cofnij");
			return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
		}
		new name[32];
		SetPVarInt(playerid, "product-create-pay", GetPVarInt(playerid, "product-create-pay")*quant);
		SetPVarInt(playerid, "product-create-quant", quant);
		GetPVarString(playerid, "product-create-name", name, sizeof name);
		ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_CREATE_FINAL, DIALOG_STYLE_MSGBOX, "Tworzenie produktu", sprintf("Zamówienie produktu wyniesie Cię $%d.\n\nInformacje:\nNazwa: %s\nCena: %d$\nTyp: %s\nIlość: %d", GetPVarInt(playerid, "product-create-pay"), 
		name, GetPVarInt(playerid, "product-create-price"), ItemTypes[GetPVarInt(playerid, "product-type")], quant), "Akceptuj", "Odrzuć");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_CREATE_FINAL)
	{
		if(!response)
		{
			DeletePVar(playerid, "product-create-name");
			DeletePVar(playerid, "product-create-quant");
			DeletePVar(playerid, "product-create-pay");
			DeletePVar(playerid, "product-create-price");
			DeletePVar(playerid, "product-create-nj");
			DeletePVar(playerid, "product-type");
			return SendClientMessage(playerid, COLOR_RED, "Przerwałeś tworzenie produktu!");
		}
		new pay = GetPVarInt(playerid, "product-create-pay"), name[32], groupid = GetPVarInt(playerid, "group-panel")-1;
		if(GroupInfo[groupid][g_Money] < pay) {
			DeletePVar(playerid, "product-create-name");
			DeletePVar(playerid, "product-create-quant");
			DeletePVar(playerid, "product-create-pay");
			DeletePVar(playerid, "product-create-price");
			DeletePVar(playerid, "product-create-nj");
			DeletePVar(playerid, "product-type");
			return sendErrorMessage(playerid, "W sejfie grupy nie ma wystarczająco kasy na ten produkt! Tworzenie zostało przerwane.");
		}
		if(!Restaurant_CanBuyProduct(playerid, groupid, pay))
			return sendErrorMessage(playerid, "Przekroczyłeś godzinny limit na kupowanie produktów ($"#D_RESTAURANT_HOUR_LIMIT").");

		GetPVarString(playerid, "product-create-name", name, sizeof name);
		if(groupid < 0 || groupid > MAX_GROUPS) return 0;
		new pID = product_Add(name, GroupInfo[groupid][g_UID], GetPVarInt(playerid, "product-create-price"), 0, GetPVarInt(playerid, "product-create-nj"), GetPVarInt(playerid, "product-type"), GetPVarInt(playerid, "product-create-quant"));
		if(pID == -1) return sendErrorMessage(playerid, "Coś poszło nie tak.");
		va_SendClientMessage(playerid, COLOR_RED, "Produkt o ID: %d został pomyślnie stworzony!", pID);
		GroupInfo[groupid][g_Money] -= pay;
		PlayerInfo[playerid][pGroupMoneySpent] += pay;
		PlayerInfo[playerid][pGroupMoneySpentTime] = gettime();
		GroupSave(groupid, true);
		va_SendClientMessage(playerid, COLOR_NEWS, "* Zapłaciłeś z sejfu grupy %d$ za stworzenie produktu.", pay);
		Log(sejfLog, WARNING, "%s tworzy produkt o UID: %d, Nazwa: %s, Cena: %d (opłata za stworzenie: %d$)", GetPlayerLogName(playerid), Product[pID][p_UID], Product[pID][p_ProductName], Product[pID][p_Price], pay);
		DeletePVar(playerid, "product-create-name");
		DeletePVar(playerid, "product-create-quant");
		DeletePVar(playerid, "product-create-pay");
		DeletePVar(playerid, "product-create-price");
		DeletePVar(playerid, "product-create-nj");
		DeletePVar(playerid, "product-type");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_MANAGE)
	{
		if(!response) {DynamicGui_SetDialogValue(playerid, 0); return 0;}
		new product = DynamicGui_GetDialogValue(playerid);
		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Produkt przestał istnieć!");
		switch(listitem)
		{
			case 0: //zmień nazwę
			{
				if(!GroupIsLeader(playerid, groupid) && !GroupIsVLeader(playerid, groupid)) 
					return sendErrorMessage(playerid, "Brak uprawnień, musisz być liderem tej grupy.");
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_SETNAME, DIALOG_STYLE_INPUT, "Panel produktu", sprintf("Jaką nazwe chcesz nadać produktowi?\nAktualna: {00FF00}%s", Product[product][p_ProductName]), "Zmień", "Zamknij");
			}
			case 1: //zmień cene
			{
				if(!GroupIsLeader(playerid, groupid) && !GroupIsVLeader(playerid, groupid)) 
					return sendErrorMessage(playerid, "Brak uprawnień, musisz być liderem tej grupy.");
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_SETPRICE, DIALOG_STYLE_INPUT, "Panel produktu", sprintf("Jaką cene chcesz nadać produktowi?\nAktualna: {00FF00}%d", Product[product][p_Price]), "Zmień", "Zamknij");
			}
			case 2:
			{
				if(!GroupIsLeader(playerid, groupid) && !GroupIsVLeader(playerid, groupid)) 
					return sendErrorMessage(playerid, "Brak uprawnień, musisz być liderem tej grupy.");
				product_Delete(product);
				va_SendClientMessage(playerid, COLOR_RED, "Produkt o ID: %d został usunięty!", product);
				DynamicGui_SetDialogValue(playerid, 0);
			}
			case 3: //dokup zapasy
			{
				ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_BUYQUANT, DIALOG_STYLE_INPUT, "Panel produktu", "Ile zapasów chcesz dokupić? (max: 300)", "Dalej", "Zamknij");
			}
		}
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_BUYQUANT)
	{
		if(!response) {DynamicGui_SetDialogValue(playerid, 0); return 0;}
		new product = DynamicGui_GetDialogValue(playerid);
		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Produkt przestał istnieć!");

		new quant = strval(inputtext);
		if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > 300)
		{
			ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_BUYQUANT, DIALOG_STYLE_INPUT, "Panel produktu", "Ile zapasów chcesz dokupić? (max: 300)", "Dalej", "Zamknij");
			return sendErrorMessage(playerid, "Nieprawidłowa ilość!");
		}
		new price = floatround( (Product[product][p_Price] * 30) / 100 )*quant;
		if(GroupInfo[groupid][g_Money] < price)
			return sendErrorMessage(playerid, sprintf("W sejfie grupy nie ma wystarczająco kasy! ($%d)", price));
		SetPVarInt(playerid, "zapasy-ilezaplaci", price);
		SetPVarInt(playerid, "zapasy-ilosc", quant);
		ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_BUYCONFIRM, DIALOG_STYLE_MSGBOX, "Panel produktu", sprintf("Na pewno chcesz dokupić %d zapasów dla produktu %s? (zapłacisz za to %d$!)", quant, Product[product][p_ProductName], price), "Zakup", "Anuluj");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_BUYCONFIRM)
	{
		if(!response) {DynamicGui_SetDialogValue(playerid, 0); return 0;}
		new product = DynamicGui_GetDialogValue(playerid);
		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Produkt przestał istnieć!");

		new quant = GetPVarInt(playerid, "zapasy-ilosc"), price = GetPVarInt(playerid, "zapasy-ilezaplaci");
		if(GroupInfo[groupid][g_Money] < price)
			return sendErrorMessage(playerid, sprintf("W sejfie grupy nie ma wystarczająco kasy! ($%d)", price));
		if(!Restaurant_CanBuyProduct(playerid, groupid, price))
			return sendErrorMessage(playerid, "Przekroczyłeś godzinny limit na kupowanie produktów ($"#D_RESTAURANT_HOUR_LIMIT").");
		DeletePVar(playerid, "zapasy-ilezaplaci");
		DeletePVar(playerid, "zapasy-ilosc");
		GroupInfo[groupid][g_Money] -= price;
		PlayerInfo[playerid][pGroupMoneySpent] += price;
		PlayerInfo[playerid][pGroupMoneySpentTime] = gettime();
		GroupSave(groupid, true);
		Product[product][p_Quant] += quant;
		va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zakupiłeś %d zapasów dla produktu %s [ID: %d]", quant, Product[product][p_ProductName], product);
		Log(sejfLog, WARNING, "%s dokupił zapasy dla produktu %s [UID: %d], ilość: %d, zapłacił za to: %d$", GetPlayerLogName(playerid),
		Product[product][p_ProductName],
		Product[product][p_UID],
		quant,
		price);
		product_Save(product);
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_SETNAME)
	{
		if(!response) {DynamicGui_SetDialogValue(playerid, 0); return 0;}
		new product = DynamicGui_GetDialogValue(playerid);
		if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Produkt przestał istnieć!");

		new escaped[128];
		mysql_escape_string(inputtext, escaped);
		if(strlen(escaped) > 12) return sendErrorMessage(playerid, "Nazwa nie może zawierać więcej niż 12 znaków!");
		if(kaska[playerid] < PRICE_RESTAURACJA_NAME) return sendErrorMessage(playerid, "Nie stać Cię na zmianę nazwy! ($"#PRICE_RESTAURACJA_NAME")");
		if(CheckVulgarityString(escaped))
			return sendErrorMessage(playerid, "Ta nazwa jest nieprawidłowa!");
		if(sprawdzReklame(escaped, playerid)) return 0;

		ZabierzKaseDone(playerid, PRICE_RESTAURACJA_NAME);
		format(Product[product][p_ProductName], 64, escaped);
		product_Save(product);
		va_SendClientMessage(playerid, COLOR_RED, "Nazwa produktu została ustawiona na: %s.", escaped);
		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(groupid < 0 || groupid > MAX_GROUPS) return 0;
		Log(sejfLog, WARNING, "%s [GROUP-ID: %d] ustawia nazwę swojego produktu %s na: %s.", GetPlayerLogName(playerid), GroupInfo[groupid][g_UID], Product[product][p_ProductName], inputtext);
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_SETPRICE)
	{
		if(!response) {DynamicGui_SetDialogValue(playerid, 0); return 0;}
		new product = DynamicGui_GetDialogValue(playerid);
		if(!Product[product][p_UID]) return sendErrorMessage(playerid, "Produkt przestał istnieć!");
		new price = strval(inputtext);
		if(!IsNumeric(inputtext) || !strlen(inputtext) || price < 1 || price > 25000) return sendErrorMessage(playerid, "Nieprawidłowa cena! (max: 25000$)");
		if(price > Product[product][p_Price] && kaska[playerid] < floatround( (price * 30) / 100 ) *Product[product][p_Quant])
			return va_SendClientMessage(playerid, COLOR_RED, "* Nie stać Cię na to! ($%d)", floatround( (price * 30) / 100 )*Product[product][p_Quant]);
		SetPVarInt(playerid, "p-change-price", price);
		if(price > Product[product][p_Price]) ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_SETPRICE_A, DIALOG_STYLE_MSGBOX, "Zmiana ceny produktu", sprintf("Jesteś pewien, że chcesz zmienić cenę na %d$? (ZA ZMIANE ZAPŁACISZ %d$!!!)", price, floatround( (price * 30) / 100 ) *Product[product][p_Quant]), "Zatwierdź", "Odrzuć");
		else ShowPlayerDialogEx(playerid, D_RESTAURANT_PRODUCT_SETPRICE_A, DIALOG_STYLE_MSGBOX, "Zmiana ceny produktu", sprintf("Jesteś pewien, że chcesz zmienić cenę na %d$? (za zmianę zapłacisz 0$)", price), "Zatwierdź", "Odrzuć");
	}
	else if(dialogid == D_RESTAURANT_PRODUCT_SETPRICE_A)
	{
		if(!response) {DynamicGui_SetDialogValue(playerid, 0); return 0;}
		new product = DynamicGui_GetDialogValue(playerid), price = GetPVarInt(playerid, "p-change-price");
		new groupid = GetPVarInt(playerid, "group-panel")-1;
		if(price > Product[product][p_Price])
		{
			if(GroupInfo[groupid][g_Money] < floatround( (price * 30) / 100 )*Product[product][p_Quant])
				return sendErrorMessage(playerid, sprintf("Nie posiadasz wystarczająco kasy w sejfie grupy ($%d)", floatround( (price * 30) / 100 )*Product[product][p_Quant]));
			if(!Restaurant_CanBuyProduct(playerid, groupid, floatround( (price * 30) / 100 )*Product[product][p_Quant]))
				return sendErrorMessage(playerid, "Przekroczyłeś godzinny limit na kupowanie produktów ($"#D_RESTAURANT_HOUR_LIMIT").");
			GroupInfo[groupid][g_Money] -= floatround( (price * 30) / 100 )*Product[product][p_Quant];
			PlayerInfo[playerid][pGroupMoneySpent] += floatround( (price * 30) / 100 )*Product[product][p_Quant];
			PlayerInfo[playerid][pGroupMoneySpentTime] = gettime();
			GroupSave(groupid, true);
			va_SendClientMessage(playerid, COLOR_NEWS, "* Zapłaciłeś z sejfu grupy za zmianę ceny %d$!", floatround( (price * 30) / 100 )*Product[product][p_Quant]);
		}
		Product[product][p_Price] = price;
		product_Save(product);
		va_SendClientMessage(playerid, COLOR_RED, "Cena produktu została ustawiona na: $%d.", price);
		if(groupid < 0 || groupid > MAX_GROUPS) return 0;
		Log(sejfLog, WARNING, "%s [GROUP-ID: %d] ustawia cenę swojego produktu %s na: $%d.", GetPlayerLogName(playerid), GroupInfo[groupid][g_UID], Product[product][p_ProductName], price);
		DeletePVar(playerid, "p-change-price");
	}
	else if(dialogid == D_RESTAURANT_BOT_LIST)
	{
		if(!response) return 0;
		new product = DynamicGui_GetValue(playerid, listitem);
		if(product == INVALID_ROW_VALUE) return 0;
		SetPVarInt(playerid, "product-id", product);
		ShowPlayerDialogEx(playerid, D_RESTAURANT_BOT_QUANT, DIALOG_STYLE_INPUT, "Restauracja", "Ile przedmiotów tego typu chcesz kupić? (max: 5)", "Dalej", "Zamknij");
		return 1;
	}
	else if(dialogid == D_RESTAURANT_BOT_QUANT)
	{
		if(!response) { DeletePVar(playerid, "product-id"); return 0; }
		new product = GetPVarInt(playerid, "product-id");
		new quant = strval(inputtext);
		if(!IsNumeric(inputtext) || !strlen(inputtext) || quant < 1 || quant > 5)
		{
			sendErrorMessage(playerid, "Nieprawidłowa ilość!");
			return ShowPlayerDialogEx(playerid, D_RESTAURANT_BOT_QUANT, DIALOG_STYLE_INPUT, "Restauracja", "Ile przedmiotów tego typu chcesz kupić? (max: 5)", "Dalej", "Zamknij");
		}

		new staffOnDuty = -1;
		foreach(new i : Player)
		{
			if(IsPlayerPaused(i)) continue;
			if(!OnDuty[i]) continue;
			if(!GroupPlayerDutyPerm(i, PERM_RESTAURANT)) continue;
			staffOnDuty = i;
			break;
		}

		if(staffOnDuty != -1)
		{
			va_SendClientMessage(playerid, COLOR_NEWS, "Uwaga: pracownik restauracji %s jest na służbie — cena została zwiększona x6.", GetNick(staffOnDuty));
		}

		new basePrice = botProducts[product][_b_Price];
		new pricePer = basePrice;
		if(staffOnDuty != -1) pricePer *= 6;
		new totalCost = pricePer * quant;
		if(kaska[playerid] < totalCost)
			return va_SendClientMessage(playerid, COLOR_RED, "* Nie stać Cię na to ($%d)!", totalCost);

		Item_Add(botProducts[product][_b_Name], ITEM_OWNER_TYPE_PLAYER, PlayerInfo[playerid][pUID], botProducts[product][_b_ItemType], 0, botProducts[product][_b_Value2], true, playerid, quant);
		ZabierzKaseDone(playerid, totalCost);
		GameTextForPlayer(playerid, sprintf("~r~-$%d", totalCost), 5000, 1);
		Sejf_Add(botProducts[product][_b_Org], totalCost/2);
		va_SendClientMessage(playerid, COLOR_NEWS, "* Kupiłeś przedmiot %s x%d za $%d, aby go użyć wpisz /p %s", botProducts[product][_b_Name], quant, totalCost, botProducts[product][_b_Name]);
		DeletePVar(playerid, "product-id");
		return 1;
	}
	
	else if(ac2_OnDialogResponse(playerid, dialogid, response, listitem, inputtext))
	{
		return 1;
	}
	return 0;
}
//ondialogresponse koniec
