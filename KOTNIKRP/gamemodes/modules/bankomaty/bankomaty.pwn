#include <a_samp>
#include <YSI_Visual\y_commands>
#include <streamer>
#include <progress2>
#include <YSI_Coding\y_hooks>

#define BANKOMAT_OBJECT_ID 19324
#define MINIGAME_TRIES 20
#define MINIGAME_TIMEOUT 30000
#define BANKOMAT_EXPLOSION_TIME 30000
#define ROBBERY_COOLDOWN (10 * 60 * 1000) // 10 minut

new PlayerText:MinigameTextDraw[MAX_PLAYERS];
new MinigameTimer[MAX_PLAYERS];
new MinigameHits[MAX_PLAYERS];
new MinigameActive[MAX_PLAYERS];
new Float:BankomatPos[MAX_PLAYERS][3];
new PlayerText:MinigameButton[MAX_PLAYERS];
new MinigameStartTime[MAX_PLAYERS];
new bool:GlobalRobberyActive = false;
new GlobalRobberyPlayer = INVALID_PLAYER_ID;
new LastRobberyTime = 0;
new MinigameButtonID[MAX_PLAYERS];
new clickedButtonID[MAX_PLAYERS];

stock ResetRobberyState(playerid)
{
    MinigameActive[playerid] = 0;

    if (MinigameTimer[playerid] > 0)
    {
        KillTimer(MinigameTimer[playerid]);
        MinigameTimer[playerid] = -1;
    }

    PlayerTextDrawDestroy(playerid, MinigameTextDraw[playerid]);
    PlayerTextDrawDestroy(playerid, MinigameButton[playerid]);

    TogglePlayerControllable(playerid, 1);
    CancelSelectTextDraw(playerid);

    GlobalRobberyActive = false;
    GlobalRobberyPlayer = INVALID_PLAYER_ID;
    return 1;
}

YCMD:rabuj(playerid, params[], help)
{
    if (help)
    {
        SendClientMessage(playerid, -1, "Użyj: /rabuj, aby okraść bankomat.");
        return 1;
    }

    if (GetPlayerVirtualWorld(playerid) != 0)
    {
        SendClientMessage(playerid, -1, "Musisz być w świecie 0!");
        return 1;
    }

    if (GlobalRobberyActive)
    {
        SendClientMessage(playerid, -1, "Ktoś już rabuje bankomat!");
        return 1;
    }

    new currentTime = GetTickCount();
    if (LastRobberyTime != 0 && currentTime - LastRobberyTime < ROBBERY_COOLDOWN)
    {
        new remaining = (ROBBERY_COOLDOWN - (currentTime - LastRobberyTime)) / 60000;
        new m[64];
        format(m, sizeof(m), "Musisz poczekać jeszcze %d minut!", remaining);
        SendClientMessage(playerid, -1, m);
        return 1;
    }

    new bankomat = GetClosestBankomat(playerid);
    if (bankomat == INVALID_OBJECT_ID)
    {
        SendClientMessage(playerid, -1, "Nie jesteś przy bankomacie!");
        return 1;
    }

    TogglePlayerControllable(playerid, 0);

    GetDynamicObjectPos(bankomat, BankomatPos[playerid][0], BankomatPos[playerid][1], BankomatPos[playerid][2]);

    GlobalRobberyActive = true;
    GlobalRobberyPlayer = playerid;
    LastRobberyTime = currentTime;

    PlayerPlaySound(playerid, 4203, 0.0, 0.0, 0.0);

    StartMinigame(playerid);
    return 1;
}

stock GetClosestBankomat(playerid)
{
    new Float:p[3];
    GetPlayerPos(playerid, p[0], p[1], p[2]);

    new closest = INVALID_OBJECT_ID;
    new Float:distMin = 9999.0;

    new objects[MAX_OBJECTS];
    new count = Streamer_GetNearbyItems(p[0], p[1], p[2], STREAMER_TYPE_OBJECT, objects, MAX_OBJECTS, 3.0);

    for (new i = 0; i < count; i++)
    {
        new obj = objects[i];
        if (!IsValidDynamicObject(obj)) continue;

        new model = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID);
        if (model != BANKOMAT_OBJECT_ID) continue;

        new Float:o[3];
        Streamer_GetFloatData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_X, o[0]);
        Streamer_GetFloatData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_Y, o[1]);
        Streamer_GetFloatData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_Z, o[2]);

        new Float:d = GetPlayerDistanceFromPoint(playerid, o[0], o[1], o[2]);
        if (d < distMin)
        {
            distMin = d;
            closest = obj;
        }
    }
    return closest;
}

stock StartMinigame(playerid)
{
    MinigameHits[playerid] = 0;
    MinigameActive[playerid] = 1;
    MinigameStartTime[playerid] = GetTickCount();
    MinigameButtonID[playerid] = 0;
    clickedButtonID[playerid] = -1;

    MinigameTextDraw[playerid] = CreatePlayerTextDraw(playerid, 320.0, 150.0, "Klikaj w X!");
    PlayerTextDrawFont(playerid, MinigameTextDraw[playerid], 2);
    PlayerTextDrawLetterSize(playerid, MinigameTextDraw[playerid], 0.5, 2.0);
    PlayerTextDrawAlignment(playerid, MinigameTextDraw[playerid], 2);
    PlayerTextDrawColour(playerid, MinigameTextDraw[playerid], -16776961);
    PlayerTextDrawSetOutline(playerid, MinigameTextDraw[playerid], 1);
    PlayerTextDrawSetShadow(playerid, MinigameTextDraw[playerid], 2);
    PlayerTextDrawShow(playerid, MinigameTextDraw[playerid]);

    MinigameButton[playerid] = CreatePlayerTextDraw(playerid, 320.0, 240.0, "X");
    PlayerTextDrawFont(playerid, MinigameButton[playerid], 3);
    PlayerTextDrawLetterSize(playerid, MinigameButton[playerid], 1.0, 3.0);
    PlayerTextDrawTextSize(playerid, MinigameButton[playerid], 360.0, 280.0);
    PlayerTextDrawAlignment(playerid, MinigameButton[playerid], 2);
    PlayerTextDrawColour(playerid, MinigameButton[playerid], -1);
    PlayerTextDrawSetOutline(playerid, MinigameButton[playerid], 2);
    PlayerTextDrawSetShadow(playerid, MinigameButton[playerid], 2);
    PlayerTextDrawSetSelectable(playerid, MinigameButton[playerid], 1);
    PlayerTextDrawShow(playerid, MinigameButton[playerid]);

    SelectTextDraw(playerid, 0xFFFFFFFF);
    MinigameTimer[playerid] = SetTimerEx("OnMinigameUpdate", 1000, true, "i", playerid);
    return 1;
}

forward OnMinigameUpdate(playerid);
forward DestroyBankomatEffect(objectid);
public OnMinigameUpdate(playerid)
{
    if (!MinigameActive[playerid])
    {
        ResetRobberyState(playerid);
        return 0;
    }

    new elapsed = GetTickCount() - MinigameStartTime[playerid];

    if (elapsed >= BANKOMAT_EXPLOSION_TIME)
    {
        if (MinigameTimer[playerid] > 0)
        {
            KillTimer(MinigameTimer[playerid]);
            MinigameTimer[playerid] = -1;
        }

        PlayerTextDrawDestroy(playerid, MinigameTextDraw[playerid]);
        PlayerTextDrawDestroy(playerid, MinigameButton[playerid]);

        if (MinigameHits[playerid] <= MINIGAME_TRIES)
        {
            SendClientMessage(playerid, -1, "Nie trafiłeś 20 razy - napad anulowany!");
        }

        ResetRobberyState(playerid);
        return 1;
    }

    new Float:x2 = float(random(520)) + 60.0;
    new Float:y2 = float(random(360)) + 40.0;
    PlayerTextDrawSetPos(playerid, MinigameButton[playerid], x2, y2);
    PlayerTextDrawShow(playerid, MinigameButton[playerid]);

    MinigameButtonID[playerid]++;
    return 1;
}

stock ProcessMinigameClick(playerid, PlayerText:playertextid)
{
    if (playerid != GlobalRobberyPlayer) return 0;

    if (MinigameActive[playerid] && playertextid == MinigameButton[playerid])
    {
        if (clickedButtonID[playerid] != MinigameButtonID[playerid])
        {
            MinigameHits[playerid]++;
            clickedButtonID[playerid] = MinigameButtonID[playerid];
            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);

            if (MinigameHits[playerid] >= MINIGAME_TRIES)
            {
                new smoke = CreateDynamicObject(18723, BankomatPos[playerid][0], BankomatPos[playerid][1], BankomatPos[playerid][2] + 0.25, 0.0, 0.0, 0.0, -1, -1, -1, 150.0);
                if (smoke != INVALID_OBJECT_ID) SetTimerEx("DestroyBankomatEffect", 30000, false, "i", smoke);

                new fire = CreateDynamicObject(18690, BankomatPos[playerid][0], BankomatPos[playerid][1], BankomatPos[playerid][2] + 0.25, 0.0, 0.0, 0.0, -1, -1, -1, 150.0);
                if (fire != INVALID_OBJECT_ID) SetTimerEx("DestroyBankomatEffect", 30000, false, "i", fire);


                new mp = MAX_PLAYERS;
                for (new pi = 0; pi < mp; pi++)
                {
                    if (!IsPlayerConnected(pi)) continue;
                    if (IsPlayerInRangeOfPoint(pi, 300.0, BankomatPos[playerid][0], BankomatPos[playerid][1], BankomatPos[playerid][2]))
                    {
                        PlayerPlaySound(pi, 1159, BankomatPos[playerid][0], BankomatPos[playerid][1], BankomatPos[playerid][2]);
                    }
                }

                new kasa = random(201) + 500;
                DajKaseDone(playerid, kasa);
                new pZone[MAX_ZONE_NAME];
			    GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);
                new msg[128];
                format(msg, sizeof(msg), "HQ: WYBUCH BANKOMATU SLYSZANY W OKOLICY %s!", pZone);
                SendRadioMessage(FRAC_LSPD, COLOR_LIGHTRED, msg, 0, 1);
                SendRadioMessage(FRAC_FBI, COLOR_LIGHTRED, msg, 0, 1);
                SendClientMessage(playerid, -1, "Bankomat został wysadzony!");
                ResetRobberyState(playerid);
            }
        }
        else
        {
            SendClientMessage(playerid, -1, "Nie możesz kliknąć tego samego X ponownie!");
        }
    }
    return 1;
}

public DestroyBankomatEffect(objectid)
{
    if(objectid != 0) DestroyDynamicObject(objectid);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (playerid == GlobalRobberyPlayer) ResetRobberyState(playerid);
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    if (playerid == GlobalRobberyPlayer) ResetRobberyState(playerid);
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    if (playerid == GlobalRobberyPlayer) ResetRobberyState(playerid);
    return 1;
}
