#include <a_samp>
#include <a_mysql>
#include <streamer>
#include <sscanf2>
#include <YSI_Data/y_iterate>

forward Turf_OnPlayerEnterDynamicArea(playerid, areaid);
forward Turf_OnPlayerLeaveDynamicArea(playerid, areaid);
forward Turf_PlayerTurfCount(playerid);
forward Turf_TurfCountByGroup(groupid);

stock GetPlayerIllegalOrg(playerid)
{
	for (new i = 0; i < 5; i++)
	{
		new groupid = PlayerInfo[playerid][pGrupa][i];
		if (groupid > 0 && GroupInfo[groupid][g_UID] > 0)
		{
			if(GroupHavePerm(groupid, PERM_MAFIA) || GroupHavePerm(groupid, PERM_GANG) || GroupHavePerm(groupid, PERM_CRIMINAL))
			{
				return groupid;
			}
		}
	}
	return 0;
}

stock IsPlayerInGovOrg(playerid)
{
	for (new i = 0; i < 5; i++)
	{
		new groupid = PlayerInfo[playerid][pGrupa][i];
		if (groupid > 0 && GroupInfo[groupid][g_UID] > 0)
		{
			if(GroupHavePerm(groupid, PERM_POLICE) || GroupHavePerm(groupid, PERM_GOV) || GroupHavePerm(groupid, PERM_BOR))
			{
				return 1;
			}
		}
	}
	return 0;
}

stock Turf_Send(playerid, color, const text[])
{
	return SendClientMessage(playerid, color, text);
}

stock Turf_SendError(playerid, const msg[])
{
	return SendClientMessage(playerid, 0xAA3333FF, msg);
}

stock Turf_IsPlayerInGroup(playerid, groupid, requireduty = 0)
{
	if(groupid <= 0) return 0;
	for(new i=0;i<MAX_PLAYER_GROUPS;i++)
	{
		if(PlayerInfo[playerid][pGrupa][i] == groupid)
		{
			if(requireduty && OnDuty[playerid] != GetPlayerGroupSlot(playerid, groupid))
				return 0;
			return 1;
		}
	}
	return 0;
}

stock Turf_GroupSend(group, color, const message[], bool:onduty = false)
{
	foreach(new i : Player)
	{
		if(!IsPlayerConnected(i)) continue;
		if(Turf_IsPlayerInGroup(i, group)) SendClientMessage(i, color, message);
	}
	return 1;
}

#define MAX_GZONE 20

enum gZoneData {
	gZone_ID,
	gZone_Name[24],
	gZoneTaken,
	gZoneTakeable,
	gZoneGangSQLID,
	gZoneGangID,
	gZoneTime,
	gZoneCapturer,
	gZone_CaptureTime,
	Float:gZoneMaxX,
	Float:gZoneMinX,
	Float:gZoneMaxY,
	Float:gZoneMinY,
	gZoneColor[24],
	gZoneID,
	gZoneRectAngle,
	gZoneType
};

new gZoneInfo[MAX_GZONE][gZoneData];

stock GetNearestGZone(playerid)
{
	// Only consider players in world (interior 0 and virtual world 0)
	if(PlayerInfo[playerid][pInt] != 0 || PlayerInfo[playerid][pVW] != 0) return -1;
	for(new id = 0; id < MAX_GZONE; id++)
	{
		if(gZoneInfo[id][gZone_ID] <= 0) continue;
		if(gZoneInfo[id][gZoneRectAngle] == INVALID_STREAMER_ID) continue;
		if(IsPlayerInDynamicArea(playerid, gZoneInfo[id][gZoneRectAngle]))
		{
			return id;
		}
	}
	return -1;
}

stock IsCordsInOtherGZone(Float:x, Float:y, exclude_id = -1)
{
	for(new id = 0; id < MAX_GZONE; id++)
	{
		if(id == exclude_id) continue;
		if(gZoneInfo[id][gZone_ID] <= 0) continue;
		if(x <= gZoneInfo[id][gZoneMaxX] && x >= gZoneInfo[id][gZoneMinX] && y <= gZoneInfo[id][gZoneMaxY] && y >= gZoneInfo[id][gZoneMinY])
		{
			return id;
		}
	}
	return -1;
}

stock IsCordsInGZone(id, Float:x, Float:y)
{
	if(id < 0 || id >= MAX_GZONE) return -1;
	if(x <= gZoneInfo[id][gZoneMaxX] && x >= gZoneInfo[id][gZoneMinX] && y <= gZoneInfo[id][gZoneMaxY] && y >= gZoneInfo[id][gZoneMinY])
	{
		return id;
	}
	return -1;
}

stock GZone_Reset(id)
{
	if(id < 0 || id >= MAX_GZONE) return 0;

	gZoneInfo[id][gZone_ID] = 0;
	gZoneInfo[id][gZone_Name][0] = EOS;
	gZoneInfo[id][gZoneTaken] = 0;
	gZoneInfo[id][gZoneTakeable] = 0;
	gZoneInfo[id][gZoneGangSQLID] = 0;
	gZoneInfo[id][gZoneGangID] = 0;
	gZoneInfo[id][gZoneTime] = 0;
	gZoneInfo[id][gZoneCapturer] = 0;
	gZoneInfo[id][gZone_CaptureTime] = -1;
	gZoneInfo[id][gZoneMaxX] = 0.0;
	gZoneInfo[id][gZoneMinX] = 0.0;
	gZoneInfo[id][gZoneMaxY] = 0.0;
	gZoneInfo[id][gZoneMinY] = 0.0;
	gZoneInfo[id][gZoneColor][0] = EOS;
	gZoneInfo[id][gZoneID] = -1;
	gZoneInfo[id][gZoneRectAngle] = INVALID_STREAMER_ID;
	gZoneInfo[id][gZoneType] = 0;
	return 1;
}

stock IsPlayerInTurf(playerid, zoneid)
{
	if(PlayerInfo[playerid][pInt] != 0 || PlayerInfo[playerid][pVW] != 0) return 0;
	return IsPlayerInDynamicArea( playerid, gZoneInfo[ zoneid ][ gZoneRectAngle ] );
}

YCMD:turfname(playerid, params[], help)
{
	if(PlayerInfo[playerid][pAdmin] < 1000) return Turf_SendError(playerid, "Nie masz uprawnień do użycia tej komendy.");
	new gZone__ID = GetNearestGZone(playerid);
	if(gZone__ID == -1) return Turf_SendError(playerid, "Nie znajdujesz się na strefie.");
	new tname[24];
	if(sscanf(params, "s[24]", tname)) return Turf_SendError(playerid, "Użycie: /turfname [nazwa]");
	if(strlen(tname) > 24) return Turf_SendError(playerid, "Nazwa strefy może mieć maks. 24 znaki.");
	new string[144];
	gZoneInfo[gZone__ID][gZone_Name] = tname;
	format(string, sizeof(string), "Zmieniono nazwę strefy ID %d na %s.", gZone__ID, gZoneInfo[gZone__ID][gZone_Name]);
	Turf_Send(playerid, -1, string);
	new query[128];
	mysql_format(Database, query, sizeof(query), "UPDATE `mru_gangzones` SET `name` = '%e' WHERE `id` = %d", tname, gZoneInfo[gZone__ID][gZone_ID]);
	mysql_tquery(Database, query);
	return 1;
}

YCMD:capturetime(playerid, params[], help)
{
	new gZone__ID = GetNearestGZone( playerid );
	if( gZone__ID == -1 ) return Turf_SendError( playerid, "Nie znajdujesz się na strefie." );
    
	if(gZoneInfo[ gZone__ID ][ gZone_CaptureTime ] <= 0)
	{
		return Turf_SendError(playerid, "Ta strefa nie jest obecnie przejmowana.");
	}
    
	new string[144];
	format(string, sizeof(string), "Strefa zostanie przejęta za %d sekund.", gZoneInfo[ gZone__ID ][ gZone_CaptureTime ]);
	Turf_Send(playerid, -1, string);
	return 1;
}

YCMD:turfy(playerid, params[], help)
{
	new dialog_content[2048];
	new line[128];
	new count = 0;
    
	strcat(dialog_content, "Nazwa strefy\t\tWłaściciel\n");
    
	for(new i = 0; i < MAX_GZONE; i++)
	{
		if(gZoneInfo[i][gZone_ID] <= 0) continue;
        
		new owner_name[64];
		if(gZoneInfo[i][gZoneGangID] > 0 && gZoneInfo[i][gZoneGangID] < MAX_GROUPS && GroupInfo[gZoneInfo[i][gZoneGangID]][g_UID] > 0)
			format(owner_name, sizeof(owner_name), "%s", GroupInfo[gZoneInfo[i][gZoneGangID]][g_Name]);
		else
			format(owner_name, sizeof(owner_name), "Brak właściciela");

		new status[32];
		if(gZoneInfo[i][gZone_CaptureTime] > 0)
		{
			format(status, sizeof(status), "{FF0000}(Przejmowana)");
		}
		else if(!gZoneInfo[i][gZoneTakeable])
		{
			format(status, sizeof(status), "{808080}(Nieprzejmowalna)");
		}
		else
		{
			format(status, sizeof(status), "");
		}
        
		format(line, sizeof(line), "%s %s\t\t%s\n", gZoneInfo[i][gZone_Name], status, owner_name);
		strcat(dialog_content, line);
		count++;
	}
    
	if(count == 0)
	{
		return Turf_SendError(playerid, "Brak załadowanych stref.");
	}
    
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "System Turfs", dialog_content, "Zamknij", "");
	return 1;
}

YCMD:capturers(playerid, params[], help)
{
	new gZone__ID = GetNearestGZone(playerid);
	if(gZone__ID == -1) return Turf_SendError(playerid, "Nie znajdujesz się na strefie.");
	if(gZoneInfo[gZone__ID][gZone_CaptureTime] <= 0) return Turf_SendError(playerid, "Ta strefa nie jest przejmowana.");
	new capturer = gZoneInfo[gZone__ID][gZoneCapturer];
	new capturers_list[1024];
	capturers_list[0] = EOS;

	foreach(new i : Player)
	{
		if(IsPlayerInDynamicArea(i, gZoneInfo[gZone__ID][gZoneRectAngle]) && PlayerInfo[i][pBW] == 0 && PlayerInfo[i][pInt] == 0 && PlayerInfo[i][pVW] == 0)
		{
			if(gZoneInfo[gZone__ID][gZone_CaptureTime] > 0)
			{
				new player_group = GetPlayerIllegalOrg(i);
				if(player_group > 0 && player_group == capturer)
					format(capturers_list, sizeof(capturers_list), "%s\n%s (%d)", capturers_list, GetNickEx(i), GroupPlayerDutyRank(i));
			}
		}
	}
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, "Przejmujący", capturers_list, "Zamknij", "");
	return 1;
}

YCMD:capture(playerid, params[], help)
{
	if(CheckPlayerPerm(playerid, PERM_POLICE) || CheckPlayerPerm(playerid, PERM_HITMAN))
		return Turf_SendError(playerid, "Służby i Hitman nie mogą przejmować stref.");

	new orgid = GetPlayerIllegalOrg(playerid);
	if(orgid == 0) return Turf_SendError(playerid, "Nie należysz do organizacji przestępczej.");
	new group_slot = GetPlayerGroupSlot(playerid, orgid);
	if(group_slot <= 0 || group_slot > MAX_PLAYER_GROUPS) return Turf_SendError(playerid, "Błąd: nieprawidłowy slot grupy.");
	if(PlayerInfo[playerid][pGrupaRank][group_slot-1] < 2) return Turf_SendError(playerid, "Wymagana ranga 2+ w grupie.");
	if(IsPlayerInAnyVehicle(playerid)) return Turf_SendError(playerid, "Musisz być pieszo.");

	new gZone__ID = GetNearestGZone(playerid);
	if(gZone__ID == -1) return Turf_SendError(playerid, "Nie znajdujesz się na strefie.");
	if(gZoneInfo[gZone__ID][gZone_ID] <= 0) return Turf_SendError(playerid, "Ta strefa nie jest załadowana.");
	if(!gZoneInfo[gZone__ID][gZoneTakeable]) return Turf_SendError(playerid, "Tej strefy nie można przejąć.");
	if(gZoneInfo[gZone__ID][gZone_CaptureTime] > 0) return Turf_SendError(playerid, "Ta strefa jest już przejmowana.");
	if(orgid == gZoneInfo[gZone__ID][gZoneGangID]) return Turf_SendError(playerid, "Nie możesz przejmować własnej strefy.");
	if(gZoneInfo[gZone__ID][gZoneTime] > gettime()) return Turf_SendError(playerid, "Aby zaatakować te strefe oczekaj kilka godzin.");

	new shour, smin;
	gettime(shour, smin);
	if(shour < 19 || shour >= 24)
		return Turf_SendError(playerid, "Przejmowania stref są dozwolone tylko w godzinach 19-23.");
	
	new Orga = 0, Protiv = 0;
	new defender_group = gZoneInfo[gZone__ID][gZoneGangID];

	foreach(new i : Player)
	{
		new player_org = GetPlayerIllegalOrg(i);
		if(player_org == 0) continue;

		if(defender_group > 0 && player_org == defender_group) Protiv++;

		if(player_org == orgid && IsPlayerInDynamicArea(i, gZoneInfo[gZone__ID][gZoneRectAngle]) && PlayerInfo[i][pBW] == 0 && PlayerInfo[i][pInt] == 0 && PlayerInfo[i][pVW] == 0)
		{
			Orga++;
		}
	}

	if(Orga < 3) return Turf_SendError(playerid, "Wymagane min. 3 osoby z organizacji na strefie.");

	for(new j = 0; j < MAX_GZONE; j++)
	{
		if (j == gZone__ID) continue;
		if (gZoneInfo[j][gZone_ID] <= 0) continue;
		if (!(gZoneInfo[gZone__ID][gZoneMaxX] < gZoneInfo[j][gZoneMinX] || gZoneInfo[gZone__ID][gZoneMinX] > gZoneInfo[j][gZoneMaxX] || gZoneInfo[gZone__ID][gZoneMaxY] < gZoneInfo[j][gZoneMinY] || gZoneInfo[gZone__ID][gZoneMinY] > gZoneInfo[j][gZoneMaxY]))
		{
			if (gZoneInfo[j][gZone_CaptureTime] > 0)
			{
				return Turf_SendError(playerid, "W innym obszarze w tym miejscu trwa przejmowanie strefy.");
			}
			if (gZoneInfo[j][gZoneCapturer] == orgid)
			{
				return Turf_SendError(playerid, "Twoja grupa już przejmuje strefę w tym obszarze.");
			}
		}
	}


	if(gZoneInfo[gZone__ID][gZoneGangID] > 0)
	{
		if(Protiv < 2)
		{
			return Turf_SendError(playerid, "Przejmowanie tej strefy wymaga min. 2 gracza online z grupy broniącej.");
		}
		new msg[144];
		if(orgid > 0 && orgid < MAX_GROUPS && GroupInfo[orgid][g_UID] > 0)
			format(msg, sizeof(msg), "[Turf] Twoja strefa %s jest pod atakiem przez %s. (ilosc atakujacych: %d)", gZoneInfo[gZone__ID][gZone_Name], GroupInfo[orgid][g_Name], Orga);
		else
			format(msg, sizeof(msg), "[Turf] Twoja strefa %s jest pod atakiem. (ilosc atakujacych: %d)", gZoneInfo[gZone__ID][gZone_Name], Orga);
		Turf_GroupSend(gZoneInfo[gZone__ID][gZoneGangID], 0x95b4a2FF, msg);
	}

	if (gZoneInfo[gZone__ID][gZoneID] != -1)
	{
		new color = ((0xFFFFFFFF & 0xFFFFFF00) | 0x66);
		GangZoneFlashForAll(gZoneInfo[gZone__ID][gZoneID], color);
	}

	gZoneInfo[gZone__ID][gZoneTime] = gettime() + 720;
	gZoneInfo[gZone__ID][gZoneCapturer] = orgid;
	new capture_time = 300;
	if(Protiv >= Orga * 2) capture_time += 120; // Więcej obrońców = dłużej
	if(Orga >= 6) capture_time -= 60; // Więcej atakujących = szybciej

	gZoneInfo[gZone__ID][gZone_CaptureTime] = capture_time;

	{
		new expiry = gZoneInfo[gZone__ID][gZoneTime];
		new query_time[128];
		mysql_format(Database, query_time, sizeof(query_time), "UPDATE `mru_gangzones` SET `time` = %d WHERE `id` = %d", expiry, gZoneInfo[gZone__ID][gZone_ID]);
		mysql_tquery(Database, query_time);
	}

	new tstring[128];
	format(tstring, sizeof(tstring), "[Turf] Twoja grupa rozpoczęła przejmowanie %s.", gZoneInfo[gZone__ID][gZone_Name]);
	Turf_GroupSend(orgid, 0x95b4a2FF, tstring);

	return 1;
}

public Turf_OnPlayerEnterDynamicArea(playerid, areaid)
{
	// Ignore players not in world (interior or virtual world != 0)
	if(PlayerInfo[playerid][pInt] != 0 || PlayerInfo[playerid][pVW] != 0) return 0;
	for(new i=0; i != MAX_GZONE; i++)
	{
		new orgid = GetPlayerIllegalOrg(playerid);
		if(!IsValidDynamicArea(areaid)) return 0;
		if(areaid == gZoneInfo[i][gZoneRectAngle])
		{
			new owner_name[64];
			if(gZoneInfo[i][gZoneGangID] > 0)
				format(owner_name, sizeof(owner_name), "%s", GroupInfo[gZoneInfo[i][gZoneGangID]][g_Name]);
			else
				format(owner_name, sizeof(owner_name), "Brak właściciela");
			new enter_msg[128];
			format(enter_msg, sizeof(enter_msg), "[Turf] Wszedłeś na strefę: %s (Właściciel: %s).", gZoneInfo[i][gZone_Name], owner_name);
			Turf_Send(playerid, 0x95b4a2FF, enter_msg);
			if(orgid != 0)
			{
				if(gZoneInfo[i][gZone_CaptureTime] > 0)
				{
					new capturer = gZoneInfo[i][gZoneCapturer];
					if(capturer > 0)
					{
						new string[128];
						format(string, sizeof(string), "[Turf] %s dołączył do przejmowania.", GetNickEx(playerid));
						Turf_GroupSend(capturer, 0x95b4a2FF, string);
					}
				}
			}
			break;
		}
	}
	return 1;
}

public Turf_OnPlayerLeaveDynamicArea(playerid, areaid)
{
	// Ignore players not in world (interior or virtual world != 0)
	if(PlayerInfo[playerid][pInt] != 0 || PlayerInfo[playerid][pVW] != 0) return 0;
	for(new i=0; i != MAX_GZONE; i++)
	{
		if(areaid == gZoneInfo[i][gZoneRectAngle])
		{
			new orgid = GetPlayerIllegalOrg(playerid);
			new leave_msg[128];
			format(leave_msg, sizeof(leave_msg), "[Turf] Opuściłeś strefę: %s.", gZoneInfo[i][gZone_Name]);
			Turf_Send(playerid, 0x95b4a2FF, leave_msg);
			if(orgid != 0)
			{
				if(gZoneInfo[i][gZone_CaptureTime] > 0)
				{
					new capturer = gZoneInfo[i][gZoneCapturer];
					if(capturer > 0)
					{
						new string[128];
						format(string, sizeof(string), "[Turf] %s przestał pomagać w przejmowaniu.", GetNickEx(playerid));
						Turf_GroupSend(capturer, 0x95b4a2FF, string);
					}
				}
			}
			break;
		}
	}
	return 1;
}
task TurfTimer[1000]()
{
	for(new i=0; i != MAX_GZONE; i++)
	{
		if (gZoneInfo[i][gZoneGangID] > 0 && gZoneInfo[i][gZoneID] != -1 && gZoneInfo[i][gZone_CaptureTime] == -1)
		{
			new groupid = gZoneInfo[i][gZoneGangID];
			new flashColor = ((GroupInfo[groupid][g_Color] & 0xFFFFFF00) | 0x66);
			GangZoneShowForAll(gZoneInfo[i][gZoneID], flashColor);
		}
		if(gZoneInfo[i][gZone_CaptureTime] > 0)
		{
			new szTurf[128];
			format(szTurf, sizeof(szTurf), "~r~%d ~w~sekund", gZoneInfo[i][gZone_CaptureTime]);
			foreach(new x : Player)
			{
				if(IsPlayerInDynamicArea(x, gZoneInfo[i][gZoneRectAngle]) && PlayerInfo[x][pBW] == 0 && PlayerInfo[x][pInt] == 0 && PlayerInfo[x][pVW] == 0)
				{
					GameTextForPlayer(x, szTurf, 1000, 1);
				}
			}

			new capturer_group = gZoneInfo[i][gZoneCapturer];
			new capturer_present = 0;
			foreach(new p : Player)
			{
				if(!IsPlayerConnected(p)) continue;
				if(PlayerInfo[p][pBW] != 0) continue;
				if(PlayerInfo[p][pInt] != 0 || PlayerInfo[p][pVW] != 0) continue;
				if(!IsPlayerInDynamicArea(p, gZoneInfo[i][gZoneRectAngle])) continue;
				if(capturer_group > 0 && Turf_IsPlayerInGroup(p, capturer_group))
				{
					capturer_present++;
				}
			}

			if(capturer_present == 0)
			{
				new reason_msg[192];
				format(reason_msg, sizeof(reason_msg), "[Turf] Przejmowanie %s zostało przerwane z powodu braku uczestników. Cooldown: 1 godz.", gZoneInfo[i][gZone_Name]);
				if(capturer_group > 0) Turf_GroupSend(capturer_group, 0x95b4a2FF, reason_msg);
				if(gZoneInfo[i][gZoneGangID] > 0) Turf_GroupSend(gZoneInfo[i][gZoneGangID], 0x95b4a2FF, reason_msg);

				GangZoneStopFlashForAll(gZoneInfo[i][gZoneID]);
				gZoneInfo[i][gZone_CaptureTime] = -1;
				gZoneInfo[i][gZoneCapturer] = 0;
				gZoneInfo[i][gZoneTime] = gettime() + 3600;
				{
					new expiry = gZoneInfo[i][gZoneTime];
					new query_time[128];
					mysql_format(Database, query_time, sizeof(query_time), "UPDATE `mru_gangzones` SET `time` = %d WHERE `id` = %d", expiry, gZoneInfo[i][gZone_ID]);
					mysql_tquery(Database, query_time);
				}
				continue;
			}


			gZoneInfo[i][gZone_CaptureTime]--;
		}
		else if(gZoneInfo[i][gZone_CaptureTime] == 0)
		{
			// YSI uruchamia taski zanim długi OnGameModeInit Kotnika dojdzie do
			// LoadTurfSystem(). Wtedy wyzerowana pamięć wyglądała jak zakończone
			// przejęcie i co restart dopisywała 1000$ grupie 0 za każdą strefę.
			// Wypłata jest dozwolona wyłącznie dla załadowanej strefy i poprawnej
			// grupy, która naprawdę rozpoczęła przejmowanie.
			new capturer = gZoneInfo[i][gZoneCapturer];
			if(gZoneInfo[i][gZone_ID] <= 0 || capturer <= 0 || capturer >= MAX_GROUPS || GroupInfo[capturer][g_UID] <= 0)
			{
				gZoneInfo[i][gZone_CaptureTime] = -1;
				gZoneInfo[i][gZoneCapturer] = 0;
				continue;
			}
			new szTurf[128];
			GangZoneStopFlashForAll(gZoneInfo[i][gZoneID]);
			GangZoneHideForAll(gZoneInfo[i][gZoneID]);
			gZoneInfo[i][gZone_CaptureTime] = -1;

			if(gZoneInfo[i][gZoneGangID] != 0)
			{
				format(szTurf, sizeof(szTurf), "[Turf] Grupa %s przejęła %s.", GroupInfo[gZoneInfo[i][gZoneCapturer]][g_Name], gZoneInfo[i][gZone_Name]);
				Turf_GroupSend(gZoneInfo[i][gZoneGangID], 0x95b4a2FF, szTurf);

				format(szTurf, sizeof(szTurf), "[Turf] Twoja grupa przejęła strefę należącą do %s i otrzymała 1000$ do sejfu.", GroupInfo[gZoneInfo[i][gZoneGangID]][g_Name]);
				Turf_GroupSend(gZoneInfo[i][gZoneCapturer], 0x95b4a2FF, szTurf);
			}
			else if(gZoneInfo[i][gZoneGangID] == 0)
			{
				format(szTurf, sizeof(szTurf), "[Turf] Twoja grupa przejęła wolną strefę i otrzymała 1000$ do sejfu.");
				Turf_GroupSend(gZoneInfo[i][gZoneCapturer], 0x95b4a2FF, szTurf);
			}

			Sejf_Add(gZoneInfo[i][gZoneCapturer], 1000);
			GroupSave(gZoneInfo[i][gZoneCapturer], true);
			Log(payLog, WARNING, "Grupa %d (%s) przejęła strefę %d (%s) i otrzymała 1000$ do sejfu",
			gZoneInfo[i][gZoneCapturer],
			GroupInfo[gZoneInfo[i][gZoneCapturer]][g_Name],
			i,
			gZoneInfo[i][gZone_Name]
		);

			gZoneInfo[i][gZoneGangID] = gZoneInfo[i][gZoneCapturer];
			gZoneInfo[i][gZoneGangSQLID] = GroupInfo[gZoneInfo[i][gZoneGangID]][g_UID];
			gZoneInfo[i][gZoneTaken] = 1;
			gZoneInfo[i][gZoneCapturer] = 0;
			new groupid = gZoneInfo[i][gZoneGangID];
			new flashColor = ((GroupInfo[groupid][g_Color] & 0xFFFFFF00) | 0x66);
			GangZoneShowForAll(gZoneInfo[i][gZoneID], flashColor);

			gZoneInfo[i][gZoneTime] = gettime() + 3600 * 12;
			new query[128];
			new expiry = gZoneInfo[i][gZoneTime];
			mysql_format(Database, query, sizeof(query), 
				"UPDATE `mru_gangzones` SET `owner_uid` = %d, `time` = %d WHERE `id` = %d",
				GroupInfo[gZoneInfo[i][gZoneGangID]][g_UID],
				expiry,
				gZoneInfo[i][gZone_ID]
			);
			mysql_tquery(Database, query);
		}
	}
	return 1;
}
stock LoadTurfSystem()
{
	for(new i = 0; i < MAX_GZONE; i++)
	{
		GZone_Reset(i);
		gZoneInfo[i][gZone_ID] = 0;
		gZoneInfo[i][gZoneID] = -1;
		gZoneInfo[i][gZoneRectAngle] = INVALID_STREAMER_ID;
		gZoneInfo[i][gZoneCapturer] = 0;
		gZoneInfo[i][gZone_CaptureTime] = -1;
	}
    
	mysql_tquery(Database, "SELECT * FROM mru_gangzones ORDER BY id ASC", "OnTurfDataLoaded", "");
	print("[Turf System] Zainicjalizowano system turf.");
	return 1;
}

forward OnTurfDataLoaded();
public OnTurfDataLoaded()
{
	new rows = cache_num_rows();
	if(rows == 0)
	{
		print("[Turf System] Brak stref w bazie danych.");
		return 1;
	}
    
	new loaded = 0;
	for(new i = 0; i < rows && i < MAX_GZONE; i++)
	{
		cache_get_value_name_int(i, "id", gZoneInfo[i][gZone_ID]);
		cache_get_value_name(i, "name", gZoneInfo[i][gZone_Name], 24);
		cache_get_value_name_int(i, "takeable", gZoneInfo[i][gZoneTakeable]);
		cache_get_value_name_int(i, "owner_uid", gZoneInfo[i][gZoneGangSQLID]);
		cache_get_value_name_float(i, "minx", gZoneInfo[i][gZoneMinX]);
		cache_get_value_name_float(i, "miny", gZoneInfo[i][gZoneMinY]);
		cache_get_value_name_float(i, "maxx", gZoneInfo[i][gZoneMaxX]);
		cache_get_value_name_float(i, "maxy", gZoneInfo[i][gZoneMaxY]);
        
		gZoneInfo[i][gZoneGangID] = 0;
		if(gZoneInfo[i][gZoneGangSQLID] > 0)
		{
			for(new g = 1; g < MAX_ORG; g++)
			{
				if(GroupInfo[g][g_UID] == gZoneInfo[i][gZoneGangSQLID])
				{
					gZoneInfo[i][gZoneGangID] = g;
					gZoneInfo[i][gZoneTaken] = 1;
					break;
				}
			}
		}
        
		gZoneInfo[i][gZoneID] = GangZoneCreate(
			gZoneInfo[i][gZoneMinX],
			gZoneInfo[i][gZoneMinY],
			gZoneInfo[i][gZoneMaxX],
			gZoneInfo[i][gZoneMaxY]
		);

		new groupid = gZoneInfo[i][gZoneGangID];

		if(gZoneInfo[i][gZoneGangID] > 0) {
			new flashColor = ((GroupInfo[groupid][g_Color] & 0xFFFFFF00) | 0x66);
			GangZoneShowForAll(gZoneInfo[i][gZoneID], flashColor);
		}
		else {
			GangZoneShowForAll(gZoneInfo[i][gZoneID], ((0xFFFFFFFF & 0xFFFFFF00) | 0x66));
		}
        
		gZoneInfo[i][gZoneRectAngle] = CreateDynamicRectangle(
			gZoneInfo[i][gZoneMinX],
			gZoneInfo[i][gZoneMinY],
			gZoneInfo[i][gZoneMaxX],
			gZoneInfo[i][gZoneMaxY]
		);
        
		new db_time = 0;
		cache_get_value_name_int(i, "time", db_time);
		if (db_time > 0)
		{
			gZoneInfo[i][gZoneTime] = db_time;
		}
		else
		{
			gZoneInfo[i][gZoneTime] = 0;
		}
		gZoneInfo[i][gZone_CaptureTime] = -1;
		loaded++;
	}
    
	printf("[Turf System] Załadowano %d/%d stref.", loaded, rows);
	return 1;
}

stock Turf_TurfCountByGroup(groupid)
{
	if (groupid <= 0) return 0;
	new count = 0;
	for (new i = 0; i < MAX_GZONE; i++)
	{
		if (gZoneInfo[i][gZoneGangID] == groupid) count++;
	}
	return count;
}

stock Turf_PlayerTurfCount(playerid)
{
	new groupid = GetPlayerIllegalOrg(playerid);
	if (groupid == 0) return 0;
	return Turf_TurfCountByGroup(groupid);
}
