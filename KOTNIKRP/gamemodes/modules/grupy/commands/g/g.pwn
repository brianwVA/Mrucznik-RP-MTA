//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                 agraffiti                                                 //
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
// Kod wygenerowany automatycznie narzędziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTANĄ NADPISANE PO WYWOŁANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================


//-------<[ include ]>-------

//-------<[ initialize ]>-------
command_g()
{
    new command = Command_GetID("g");

    //aliases
    Command_AddAlt(command, "groups");
    Command_AddAlt(command, "grupy");
    Command_AddAlt(command, "grupa");
}

//-------<[ command ]>-------
YCMD:g(playerid, params[])
{
    new opcja[16], grupa, parametry[256], leader;
    #pragma unused leader
    if(!sscanf(params, "is[16]S()[256]", grupa, opcja, parametry))
    {
        new allowedSlots = IsPlayerPremiumOld(playerid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
        if(grupa <= 0 || grupa > allowedSlots) return sendTipMessage(playerid, sprintf("Masz dostęp tylko do %d slotów grupowych.", allowedSlots));
        grupa--;
        if(strcmp(opcja, "online", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new string[2048];
            foreach(new i : Player)
            {
                if(IsPlayerInGroup(i, PlayerInfo[playerid][pGrupa][grupa]))
                {
                    new slot = 0;
                    for(new s = 0; s < 3; s++)
                        if(PlayerInfo[i][pGrupa][s] == PlayerInfo[playerid][pGrupa][grupa]) slot = s;
                    format(string, sizeof(string), "%s{%06x}%s{B4B5B7} [%d] %s ranga %s [%d]\n", string, (GetPlayerColor(i) >>> 8), GetNick(i), i, (GroupIsLeader(i, PlayerInfo[i][pGrupa][slot]) || GroupIsVLeader(i, PlayerInfo[i][pGrupa][slot])) ? ("[LIDER]") : (""), GroupRanks[PlayerInfo[i][pGrupa][slot]][PlayerInfo[i][pGrupaRank][slot]], PlayerInfo[i][pGrupaRank][slot]);
                }
            }
            return ShowPlayerDialogEx(playerid, DIALOG_EMPTY_SC, DIALOG_STYLE_LIST, sprintf(">> %s Online", GroupInfo[PlayerInfo[playerid][pGrupa][grupa]][g_ShortName]), string, "OK", "");
        }
        else if(strcmp(opcja, "ustawspawn") == 0 || strcmp(opcja, "spawn") == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(GroupInfo[grupaid][g_Spawn][0] == 0.0)
                return sendTipMessage(playerid, "Ta grupa nie ma jeszcze ustawionego spawnu.");
            PlayerInfo[playerid][pGrupaSpawn] = grupa;
            PlayerInfo[playerid][pSpawn] = 0;
            PlayerInfo[playerid][pSpawnHouseID] = -1;
            va_SendClientMessage(playerid, COLOR_GRAD3, "»» Od teraz będziesz się spawnować na spawnie grupy %s.", GroupInfo[grupaid][g_Name]);
            return 1;
        }
        else if(strcmp(opcja, "info", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            GroupShowInfo(playerid, PlayerInfo[playerid][pGrupa][grupa]);
            return 1;
        }
        else if(strcmp(opcja, "skin", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!IsPlayerInRangeOfPoint(playerid, 10, GroupInfo[grupaid][g_Spawn][0], GroupInfo[grupaid][g_Spawn][1], GroupInfo[grupaid][g_Spawn][2]) &&
            !IsNearGroupVehicle(playerid, PlayerInfo[playerid][pGrupa][grupa]))
            {
                return sendErrorMessage(playerid, "Aby zmienić skin musisz być na spawnie grupy.");
            }
            if(IloscSkinow(grupaid) < 1)
            {
                return SendClientMessage(playerid, COLOR_GRAD2, "Twoja grupa nie ma własnych skinów.");
            }
            ShowPlayerDialogEx(playerid, DIALOGID_UNIFORM_FRAKCJA, DIALOG_STYLE_PREVIEW_MODEL, "Zmien skin grupowy", DialogListaSkinow(grupaid), "Zmien skin", "Anuluj");
            SetPVarInt(playerid, "skin-group", grupaid);
            return 1;
        }
        else if(strcmp(opcja, "v", true) == 0 || strcmp(opcja, "pojazdy", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            new string[1024];
            string = "ID\tNazwa";
            for(new i = 0; i < MAX_VEHICLES; i++)
            {
                if(VehicleUID[i][vUID] == 0) continue;
                new lcarid = VehicleUID[i][vUID];
                if(CarData[lcarid][c_OwnerType] == CAR_OWNER_GROUP && CarData[lcarid][c_Owner] == grupaid)
                {
                    format(string, sizeof(string), "%s\n%d\t%s", string, i, VehicleNames[GetVehicleModel(i)-400]);
                }
            }
            if(strlen(string) < 11)
                return sendErrorMessage(playerid, "Twoja grupa nie ma żadnych pojazdów.");
            ShowPlayerDialogEx(playerid, D_GROUP_VEHICLE, DIALOG_STYLE_TABLIST_HEADERS, MruTitle("Pojazdy grupy"), string, "Namierz", "Zamknij");
            return 1;
        }
        else if(strcmp(opcja, "duty", true) == 0 || strcmp(opcja, "sluzba", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");

            if(GroupHavePerm(PlayerInfo[playerid][pGrupa][grupa], PERM_POLICE) && PoziomPoszukiwania[playerid] > 0)
                return sendTipMessage(playerid, "Osoby poszukiwane przez policję nie mogą rozpocząć służby !");

            if(GetPlayerAdminDutyStatus(playerid) == 1)
			    return sendErrorMessage(playerid, "Nie możesz tego użyć  podczas @Duty! Zejdź ze służby używając /adminduty");

            if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) 
                return sendTipMessage(playerid, "Aby wziąć służbe musisz być pieszo!");

            if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
                return sendErrorMessage(playerid, "Jesteś podczas wsiadania - odczekaj chwile. Nie możesz znajdować się w pojeździe.");

            if(gettime() - GetPVarInt(playerid, "lastDamage") < 60)
				return sendErrorMessage(playerid, "Nie możesz tego użyć podczas walki!");
            new groupid = PlayerInfo[playerid][pGrupa][grupa];
            OnDutyCD[playerid] = 0;
            if(OnDuty[playerid] == 0)
            {
                if(GetFractionMembersNumber(groupid, true) >= GroupInfo[groupid][g_MaxDuty] && GroupInfo[groupid][g_MaxDuty] > 0)
                {
                    return va_SendClientMessage(playerid, COLOR_LIGHTRED, "> Nie możesz wejść na duty z powodu ustawionego limitu pracowników na: %d", GroupInfo[groupid][g_MaxDuty]);
                }
                new string[128];
                format(string, sizeof(string), "~n~~n~~n~~n~~w~Wchodzisz na sluzbe~n~~b~%s",GroupInfo[PlayerInfo[playerid][pGrupa][grupa]][g_ShortName]);
                GameTextForPlayer(playerid, string, 4000, 3);
                new grupaid = PlayerInfo[playerid][pGrupa][grupa];
                if(IsPlayerInRangeOfPoint(playerid, 5, GroupInfo[grupaid][g_Spawn][0], GroupInfo[grupaid][g_Spawn][1], GroupInfo[grupaid][g_Spawn][2]) ||
                IsNearGroupVehicle(playerid, PlayerInfo[playerid][pGrupa][grupa]))
                {
                    DajBronieFrakcyjne(playerid, grupaid);
                    if(GroupHavePerm(PlayerInfo[playerid][pGrupa][grupa], PERM_POLICE))
                    {
                        SetPlayerArmour(playerid, 100);
                        SetPlayerHealth(playerid, 100);
                        format(string, sizeof(string), "* %s bierze odznakę i broń.", GetNickEx(playerid, true));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    }
                    if(PlayerInfo[playerid][pGrupaSkin][grupa] > 0)
                    {
                        new bool:skinexists = false;
                        for(new i = 0; i < 20; i++) //Sprawdzanie, czy skin jest przypisany do grupy
                        {
                            if(GroupInfo[grupaid][g_Skin][i] == PlayerInfo[playerid][pGrupaSkin][grupa]) 
                            {
                                skinexists = true;
                                break;
                            }
                        }
                        if(!skinexists)
                        {
                            RunCommand(playerid, "/g", sprintf("%d skin", grupa+1));
                        }
                        else
                            PlayerInfo[playerid][pUniform] = PlayerInfo[playerid][pGrupaSkin][grupa];
                    }
                }
                OnDuty[playerid] = grupa+1;
                SetPlayerToTeamColor(playerid);
                SetPlayerSpawnSkin(playerid);
                UpdatePlayer3DName(playerid);
                if(!IsAPrzestepca(playerid)) SetPlayerChatBubble(playerid, sprintf("[%s]", GroupInfo[grupaid][g_ShortName]), GroupInfo[grupaid][g_Color], 10.0, 9000);
                if(GroupHavePerm(PlayerInfo[playerid][pGrupa][grupa], PERM_NEWS)) SanDuty[playerid] = 1;
            }
            else if(OnDuty[playerid] == grupa+1)
            {
                new string[128];
                format(string, sizeof(string), "~n~~n~~n~~n~~w~Schodzisz ze sluzby~n~~b~%s",GroupInfo[PlayerInfo[playerid][pGrupa][grupa]][g_ShortName]);
                GameTextForPlayer(playerid, string, 4000, 3);
                new grupaid = PlayerInfo[playerid][pGrupa][grupa];
                if(IsPlayerInRangeOfPoint(playerid, 5, GroupInfo[grupaid][g_Spawn][0], GroupInfo[grupaid][g_Spawn][1], GroupInfo[grupaid][g_Spawn][2]) ||
                IsNearGroupVehicle(playerid, PlayerInfo[playerid][pGrupa][grupa]))
                {
                    if(GroupHavePerm(PlayerInfo[playerid][pGrupa][grupa], PERM_POLICE))
                    {
                        format(string, sizeof(string), "* %s odkłada odznakę i broń.", GetNickEx(playerid, true));
                        ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                        SetPlayerArmour(playerid, 0.0);
                    }
                }
                PrintDutyTime(playerid);
                PrzywrocBron(playerid);
                OnDuty[playerid] = 0;
                SetPlayerToTeamColor(playerid);
                UpdatePlayer3DName(playerid);
                PlayerInfo[playerid][pUniform] = 0;
                SetPlayerSpawnSkin(playerid);
                SetPlayerChatBubble(playerid, " ", -1, 10.0, 9000);
                if(GroupHavePerm(PlayerInfo[playerid][pGrupa][grupa], PERM_NEWS)) SanDuty[playerid] = 0;
            }
            else if(OnDuty[playerid] != grupa+1)
            {
                return sendErrorMessage(playerid, sprintf("Jesteś już na służbie innej grupy %s [%d]", GroupInfo[PlayerInfo[playerid][pGrupa][OnDuty[playerid]-1]][g_ShortName], OnDuty[playerid]));
            }
            return 1;
        }
        else if(strcmp(opcja, "opusc", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            if(OnDuty[playerid] == grupa+1)
                return sendErrorMessage(playerid, "Nie możesz być na służbie tej grupy.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(GroupIsLeader(playerid, grupaid))
                return sendErrorMessage(playerid, "Nie możesz opuścić tej grupy, jesteś jej głównym liderem - w celu zrezygnowania skontaktuj się z administracją.");
            ShowPlayerDialogEx(playerid, D_GROUP_LEAVE_CONFIRM, DIALOG_STYLE_MSGBOX, "Opuszczanie grupy", sprintf("Czy na pewno chcesz opuścić grupę %s?", GroupInfo[grupaid][g_Name]), "Tak", "Nie");
            DynamicGui_SetDialogValue(playerid, grupa);
            return 1;
        }
        else if(strcmp(opcja, "zapros", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
                return noAccessMessage(playerid);

            new targetid, rank;
            if(sscanf(parametry, "k<fix>d", targetid, rank))
                return sendTipMessage(playerid, sprintf("Użyj: /g %d zapros [id gracza] [ranga]", grupa+1, rank));
            if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest na serwerze!");
            if(IsPlayerInGroup(targetid, grupaid))
                return sendErrorMessage(playerid, "Gracz o podanym ID jest już w Twojej grupie!");
            if(rank < 0 || rank > 10)
                return sendErrorMessage(playerid, "Złe ID rangi.");
            if(!strcmp(GroupRanks[grupaid][rank], "-", true))
                return sendErrorMessage(playerid, "Ranga o podanym ID nie jest stworzona.");
            new slot = -1;
            allowedSlots = IsPlayerPremiumOld(targetid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
            for(new i = 0; i < allowedSlots; i++)
            {
                if(PlayerInfo[targetid][pGrupa][i] < 1)
                {
                    slot = i;
                    break;
                }

            }
            if(slot == -1)
                return sendErrorMessage(playerid, "Gracz o podanym ID przekroczył limit grup.");
            if(!GroupCanPlayerJoin(targetid, grupaid))
                return sendErrorMessage(playerid, "Gracz o tym ID nie może dołączyć do tej grupy.");
            SetPVarInt(targetid, "groupinvite-id", grupaid);
            SetPVarInt(targetid, "groupinvite-inviter", playerid);
            SetPVarInt(targetid, "groupinvite-rank", rank);
            ShowPlayerDialogEx(targetid, D_GROUP_INVITE, DIALOG_STYLE_MSGBOX, MruTitle("Zaproszenie do grupy"), sprintf("%s zaprasza Cię do dołączenia do grupy %s (ranga: %s)", GetNick(playerid), GroupInfo[grupaid][g_Name], GroupRanks[grupaid][rank]), "Akceptuj", "Odrzuć");
            va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wysłałeś zaproszenie do grupy %s graczowi %s", GroupInfo[grupaid][g_Name], GetNick(targetid));
            return 1;
        }
        else if(strcmp(opcja, "wypros", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
                return noAccessMessage(playerid);

            new targetid;
            if(sscanf(parametry, "k<fix>", targetid))
                return sendTipMessage(playerid, sprintf("Użyj: /g %d wypros [id gracza]", grupa+1));
            if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest na serwerze!");
            if(playerid == targetid)
                return sendErrorMessage(playerid, "Nie możesz wyrzucić siebie!");
            if(!IsPlayerInGroup(targetid, grupaid))
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest w Twojej grupie!");
            if(GroupIsLeader(targetid, grupaid))
                return sendErrorMessage(playerid, "Gracz o podanym ID jest liderem, nie możesz go wyrzucić.");
            if(GroupIsVLeader(targetid, grupaid))
                return sendErrorMessage(playerid, "Nie możesz wyrzucić v-leadera, zrób to poprzez /g [slot] panel.");
            new slot = -1;
            allowedSlots = IsPlayerPremiumOld(targetid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
            for(new i = 0; i < allowedSlots; i++)
            {
                if(PlayerInfo[targetid][pGrupa][i] == grupaid)
                {
                    slot = i;
                    break;
                }

            }
            if(slot == -1)
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest w Twojej grupie!");
            
            GroupRemovePlayer(targetid, grupaid, 1, playerid);
            return 1;
        }
        else if(strcmp(opcja, "ranga", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
                return noAccessMessage(playerid);

            new targetid, rank;
            if(sscanf(parametry, "k<fix>d", targetid, rank))
                return sendTipMessage(playerid, sprintf("Użyj: /g %d ranga [id gracza] [ranga]", grupa+1));
            if(rank < 0 || rank > 10)
                return sendErrorMessage(playerid, "Zły numer rangi!");
            if(!strcmp(GroupRanks[grupaid][rank], "-") || !strlen(GroupRanks[grupaid][rank]))
                return sendErrorMessage(playerid, "Ranga o danym numerze nie jest stworzona! Stwórz ją poprzez /g [slot] panel");
            if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest na serwerze!");
            if(!IsPlayerInGroup(targetid, grupaid))
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest w Twojej grupie!");
            new slot = -1;
            allowedSlots = IsPlayerPremiumOld(targetid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
            for(new i = 0; i < allowedSlots; i++)
            {
                if(PlayerInfo[targetid][pGrupa][i] == grupaid)
                {
                    slot = i;
                    break;
                }

            }
            if(slot == -1)
                return sendErrorMessage(playerid, "Gracz o podanym ID nie jest w Twojej grupie!");
            PlayerInfo[targetid][pGrupaRank][slot] = rank;
            va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "(Nadałeś %s rangę %s (%d))", GetNick(targetid), GroupRanks[grupaid][rank], rank);
            va_SendClientMessage(targetid, COLOR_LIGHTBLUE, "(Lider %s nadał Ci rangę %s (%d))", GetNick(playerid), GroupRanks[grupaid][rank], rank);
            Log(serverLog, WARNING, "%s nadał rangę %d dla %s grupa: %s", GetPlayerLogName(playerid), rank, GetPlayerLogName(targetid), GetGroupLogName(grupaid));
            return 1;
        }
        else if(strcmp(opcja, "ban", true) == 0)
		{
			if(PlayerInfo[playerid][pGrupa][grupa] == 0)
				return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
			new grupaid = PlayerInfo[playerid][pGrupa][grupa];
			if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
				return noAccessMessage(playerid);

			new targetid, reason[128];
			if(sscanf(parametry, "k<fix>S()[128]", targetid, reason))
				return sendTipMessage(playerid, sprintf("Użyj: /g %d ban [id gracza] [opcjonalnie: powód]", grupa+1));
			if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
				return sendErrorMessage(playerid, "Gracz o podanym ID nie jest na serwerze!");
			if(playerid == targetid)
				return sendErrorMessage(playerid, "Nie możesz zbanować siebie!");
			if(GroupIsLeader(targetid, grupaid))
				return sendErrorMessage(playerid, "Nie możesz zbanować głównego lidera!");
			if(GroupIsVLeader(targetid, grupaid) && !GroupIsLeader(playerid, grupaid))
				return sendErrorMessage(playerid, "Tylko główny lider może zbanować v-lidera!");
			
			new query[512];
			mysql_format(Database, query, sizeof(query), 
				"SELECT COUNT(*) FROM `mru_grupy_bany` WHERE `grupa_uid` = %d AND `gracz_uid` = %d", 
				GroupInfo[grupaid][g_UID], PlayerInfo[targetid][pUID]);
			new Cache:result = mysql_query(Database, query);
			new banned;
			cache_get_value_index_int(0, 0, banned);
			cache_delete(result);
			
			if(banned > 0)
				return sendErrorMessage(playerid, "Ten gracz jest już zbanowany w tej grupie!");
			
			if(IsPlayerInGroup(targetid, grupaid))
			{
				GroupRemovePlayer(targetid, grupaid, 1, playerid);
			}
			
			if(isnull(reason) || strlen(reason) < 1)
				format(reason, sizeof(reason), "Brak powodu");
			
			new reason_escaped[256];
			mysql_escape_string(reason, reason_escaped);
			mysql_format(Database, query, sizeof(query), 
				"INSERT INTO `mru_grupy_bany` (`grupa_uid`, `gracz_uid`, `banned_by`, `reason`) VALUES (%d, %d, %d, '%s')", 
				GroupInfo[grupaid][g_UID], PlayerInfo[targetid][pUID], PlayerInfo[playerid][pUID], reason_escaped);
			mysql_tquery(Database, query);
			
			va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "Zbanowałeś gracza %s w grupie %s", GetNick(targetid), GroupInfo[grupaid][g_Name]);
			if(!isnull(reason) && strlen(reason) > 1)
			{
				va_SendClientMessage(playerid, COLOR_GREY, "Powód: %s", reason);
				va_SendClientMessage(targetid, COLOR_LIGHTRED, "Zostałeś zbanowany w grupie %s przez %s", GroupInfo[grupaid][g_Name], GetNick(playerid));
				va_SendClientMessage(targetid, COLOR_GREY, "Powód: %s", reason);
			}
			else
			{
				va_SendClientMessage(targetid, COLOR_LIGHTRED, "Zostałeś zbanowany w grupie %s przez %s - nie możesz do niej dołączyć", GroupInfo[grupaid][g_Name], GetNick(playerid));
			}
			Log(serverLog, WARNING, "%s zbanował %s w grupie %s (powód: %s)", GetPlayerLogName(playerid), GetPlayerLogName(targetid), GetGroupLogName(grupaid), reason);
			return 1;
		}
		else if(strcmp(opcja, "unban", true) == 0)
		{
			if(PlayerInfo[playerid][pGrupa][grupa] == 0)
				return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
			new grupaid = PlayerInfo[playerid][pGrupa][grupa];
			if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
				return noAccessMessage(playerid);

			new targetid;
			if(sscanf(parametry, "k<fix>", targetid))
				return sendTipMessage(playerid, sprintf("Użyj: /g %d unban [id gracza]", grupa+1));
			if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
				return sendErrorMessage(playerid, "Gracz o podanym ID nie jest na serwerze!");
			
			new query[256];
			mysql_format(Database, query, sizeof(query), 
				"DELETE FROM `mru_grupy_bany` WHERE `grupa_uid` = %d AND `gracz_uid` = %d", 
				GroupInfo[grupaid][g_UID], PlayerInfo[targetid][pUID]);
			new Cache:result = mysql_query(Database, query);
			new affected = cache_affected_rows();
			cache_delete(result);
			
			if(affected > 0)
			{
				va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "Odbanowałeś gracza %s w grupie %s", GetNick(targetid), GroupInfo[grupaid][g_Name]);
				va_SendClientMessage(targetid, COLOR_LIGHTGREEN, "Zostałeś odbanowany w grupie %s przez %s - możesz teraz do niej dołączyć", GroupInfo[grupaid][g_Name], GetNick(playerid));
				Log(serverLog, WARNING, "%s odbanował %s w grupie %s", GetPlayerLogName(playerid), GetPlayerLogName(targetid), GetGroupLogName(grupaid));
				return 1;
			}
			else
			{
				return sendErrorMessage(playerid, "Ten gracz nie jest zbanowany w tej grupie!");
			}
		}
        else if(strcmp(opcja, "banlista", true) == 0 || strcmp(opcja, "banlist", true) == 0)
		{
			if(PlayerInfo[playerid][pGrupa][grupa] == 0)
				return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
			new grupaid = PlayerInfo[playerid][pGrupa][grupa];
			if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
				return noAccessMessage(playerid);
			
			new query[512];
			mysql_format(Database, query, sizeof(query), 
				"SELECT k.Nick, gb.ban_date, gb.reason, k2.Nick as banned_by_nick FROM mru_grupy_bany gb JOIN mru_konta k ON gb.gracz_uid = k.UID LEFT JOIN mru_konta k2 ON gb.banned_by = k2.UID WHERE gb.grupa_uid = %d ORDER BY gb.ban_date DESC LIMIT 50", 
				GroupInfo[grupaid][g_UID]);
			
			inline OnBanListLoaded()
			{
				new rows = cache_num_rows();
				if(rows == 0)
				{
					return sendTipMessage(playerid, "Lista banów jest pusta!");
				}
				
				new string[2048] = "Nick\tData\tPowód\tZbanował\n";
				for(new i = 0; i < rows; i++)
				{
					new nick[MAX_PLAYER_NAME + 1], bandate[32], reason[128], bannedby[MAX_PLAYER_NAME + 1];
					cache_get_value_name(i, "Nick", nick);
					cache_get_value_name(i, "ban_date", bandate);
					cache_get_value_name(i, "reason", reason);
					cache_get_value_name(i, "banned_by_nick", bannedby);
					
					new shortdate[20];
					strmid(shortdate, bandate, 0, 16, sizeof(shortdate));
					
					if(strlen(reason) > 25)
					{
						strmid(reason, reason, 0, 22);
						strcat(reason, "...");
					}
					
					format(string, sizeof(string), "%s%s\t%s\t%s\t%s\n", string, nick, shortdate, reason, bannedby);
				}
				ShowPlayerDialogEx(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, 
					sprintf("Lista zbanowanych w %s", GroupInfo[grupaid][g_ShortName]), string, "OK", "");
			}
			MySQL_TQueryInline(Database, using inline OnBanListLoaded, query);
			return 1;
		}
        else if(strcmp(opcja, "panel", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!GroupIsLeader(playerid, grupaid) && !GroupIsVLeader(playerid, grupaid))
            {
                if(GroupHavePerm(grupaid, PERM_RESTAURANT) && PlayerInfo[playerid][pGrupaRank][grupa] >= 5) //PANEL RESTAURACJI DLA RANGI >=5
                {
                    SetPVarInt(playerid, "group-panel", grupaid+1);
                    return ShowPlayerDialogEx(playerid, D_RESTAURANT_PANEL_OPTIONS, DIALOG_STYLE_LIST, "Panel restauracji", "Zarządzaj produktami", "Dalej", "Zamknij");
                }
                return noAccessMessage(playerid);
            }

            GroupShowLeaderPanel(playerid, grupaid, 1);
            return 1;
        }
        else if(strcmp(opcja, "komunikat", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!GroupHavePerm(grupaid, PERM_FINFO))
                return noAccessMessage(playerid);
            if(GroupRank(playerid, grupaid) < 4)
                return sendErrorMessage(playerid, "Komunikaty są dostępne od 4 rangi.");
            if(isnull(parametry))
                return sendTipMessage(playerid, sprintf("Użyj: /g %d komunikat [treść]", grupa+1));

            GroupSendAnnouncement(playerid, PlayerInfo[playerid][pGrupa][grupa], parametry);
            return 1;
        }
        else if(strcmp(opcja, "setspawn", true) == 0)
        {
            if(PlayerInfo[playerid][pGrupa][grupa] == 0)
                return sendTipMessage(playerid, "Pod tym slotem nie znajduje się żadna grupa.");
            new grupaid = PlayerInfo[playerid][pGrupa][grupa];
            if(!GroupIsLeader(playerid, grupaid))
                return noAccessMessage(playerid);
            if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
                return sendErrorMessage(playerid, "Musisz być pieszo.");
            
            new Float:x, Float:y, Float:z, Float:a, Float:vw, Float:int;
            GetPlayerPos(playerid, x, y, z);
            GetPlayerFacingAngle(playerid, a);
            vw = GetPlayerVirtualWorld(playerid);
            int = GetPlayerInterior(playerid);
            GroupInfo[grupaid][g_Spawn][0] = x;
            GroupInfo[grupaid][g_Spawn][1] = y;
            GroupInfo[grupaid][g_Spawn][2] = z;
            GroupInfo[grupaid][g_Spawn][3] = a;
            GroupInfo[grupaid][g_Int] = int;
            GroupInfo[grupaid][g_VW] = vw;

            GroupSave(grupaid, true);
            va_SendClientMessage(playerid, COLOR_LIGHTGREEN, "(Ustawiłeś nowy spawn grupy %s)", GroupInfo[grupaid][g_ShortName]);
            Log(serverLog, WARNING, "%s ustawił nowy spawn grupy %s", GetPlayerLogName(playerid), GetGroupLogName(grupaid));
            return 1;
        }
    }
    new nazwy[MAX_PLAYER_GROUPS_PREMIUM][32] = {"Wolny slot", ...};
    if(GetPVarInt(playerid, "cmdgmenu") == 0)
    {
        CreateGroupTextDraws(playerid);
        new allowedSlots = IsPlayerPremiumOld(playerid) ? MAX_PLAYER_GROUPS_PREMIUM : MAX_PLAYER_GROUPS;
        for(new i = 0; i<allowedSlots; i++)
        {
            if(PlayerInfo[playerid][pGrupa][i] != 0)
            {
                SetPVarInt(playerid, "cmdgmenu", 1);
                SelectTextDraw(playerid, 0xE5413CFF);
                format(nazwy[i], 32, "%s", GroupInfo[PlayerInfo[playerid][pGrupa][i]][g_ShortName]);
                PlayerTextDrawSetString(playerid, NazwaGrupy[playerid][i], nazwy[i]);
                PlayerTextDrawShow(playerid, NazwaGrupy[playerid][i]);
                PlayerTextDrawShow(playerid, InfoGrupy[playerid][i]);
                PlayerTextDrawShow(playerid, PojazdyGrupy[playerid][i]);
                PlayerTextDrawShow(playerid, OnlineGrupy[playerid][i]);
                PlayerTextDrawShow(playerid, DutyGrupy[playerid][i]);
                PlayerTextDrawShow(playerid, SystemGrup[playerid]);
            }
        }
        sendTipMessage(playerid, "Użyj: /g [slot] [info | online | zapros | wypros | ranga | ban | unban | banlista | online | v | skin  | ...");
        sendTipMessage(playerid, "... duty | opusc | panel | komunikat | spawn | setspawn");
    }
    else
    {
        HideGroupTextDraws(playerid);
    }
    return 1;
}