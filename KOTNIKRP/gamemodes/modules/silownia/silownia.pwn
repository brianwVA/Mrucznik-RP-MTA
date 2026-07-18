#include <a_samp>
#include <streamer>
#include <YSI_Coding\y_hooks>
#include <YSI_Visual\y_commands>

forward postawLawke0k();
#define MODEL_BENCH (2629)

new bool:gPlayerGym[MAX_PLAYERS];
new gPlayerGymType[MAX_PLAYERS];
new gPlayerGymCount[MAX_PLAYERS];
new gPlayerStrength[MAX_PLAYERS];
new gLastGymUse[MAX_PLAYERS];

stock postawLawke0k()
{
    new obj = CreateDynamicObject(MODEL_BENCH, 1103.20, -1711.15, 13.55, 0.0, 0.0, 100.0, 0, 5);
    return obj;
}


stock GetClosestGymObject(playerid, modelid, Float:range)
{
    new Float:pX, Float:pY, Float:pZ;
    GetPlayerPos(playerid, pX, pY, pZ);

    new objects[128];
    new count = Streamer_GetNearbyItems(pX, pY, pZ, STREAMER_TYPE_OBJECT, objects, sizeof(objects), range);

    new closest = INVALID_OBJECT_ID;
    new Float:bestDist = 9999.0;

    for (new i = 0; i < count; i++)
    {
        new obj = objects[i];
        if (!IsValidDynamicObject(obj)) continue;

        new model = Streamer_GetIntData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_MODEL_ID);
        if (model != modelid) continue;

        new Float:ox, Float:oy, Float:oz;
        Streamer_GetFloatData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_X, ox);
        Streamer_GetFloatData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_Y, oy);
        Streamer_GetFloatData(STREAMER_TYPE_OBJECT, obj, E_STREAMER_Z, oz);

        new Float:d = GetPlayerDistanceFromPoint(playerid, ox, oy, oz);

        if (d < bestDist)
        {
            bestDist = d;
            closest = obj;
        }
    }

    return closest;
}

stock bool:IsInGantonGym(playerid)
{
    return GetPlayerInterior(playerid) == 5 && GetPlayerVirtualWorld(playerid) == 0;
}

stock StartGymAtObject(playerid, bench)
{
    if(bench == INVALID_OBJECT_ID) return 0;

    // Player must have a gym pass to train
    if(GetPVarInt(playerid, "gym_pass") == 0)
    {
        SendClientMessage(playerid, 0xFF0000FF, "Musisz mieć karnet na siłownię. Użyj /kupkarnet.");
        return 0;
    }

    new Float:ox, Float:oy, Float:oz;
    new Float:rx, Float:ry, Float:rz;

    GetDynamicObjectPos(bench, ox, oy, oz);
    GetDynamicObjectRot(bench, rx, ry, rz);

    new Float:offX = 0.0;
    new Float:offY = -1.25;
    new Float:offZ = 0.88;

    new Float:px = ox + (offX * floatcos(-rz, degrees)) - (offY * floatsin(-rz, degrees));
    new Float:py = oy + (offX * floatsin(-rz, degrees)) + (offY * floatcos(-rz, degrees));
    new Float:pz = oz + offZ;

    SetPlayerPos(playerid, px, py, pz);
    SetPlayerFacingAngle(playerid, rz);

    ApplyAnimation(playerid, "benchpress", "gym_bp_geton", 4.0, 0, 0, 0, 1, 0, 1);

    gPlayerGym[playerid] = true;
    gPlayerGymType[playerid] = 2;
    gPlayerGymCount[playerid] = 0;
    gLastGymUse[playerid] = 0;

    GameTextForPlayer(playerid, "~w~Nacisnij ~k~~PED_SPRINT~ aby cwiczyc na lawce", 4000, 5);
    return 1;
}

YCMD:silownia(playerid, params[], help)
{
    if(gPlayerGym[playerid])
    {
        ClearAnimations(playerid);
        gPlayerGym[playerid] = false;
        gPlayerGymType[playerid] = 0;
        gPlayerGymCount[playerid] = 0;
        SendClientMessage(playerid, -1, "Zakończyłeś trening.");
        return 1;
    }

    new bench = GetClosestGymObject(playerid, MODEL_BENCH, 3.0);
    if(bench != INVALID_OBJECT_ID)
    {
        return StartGymAtObject(playerid, bench);
    }

    SendClientMessage(playerid, -1, "Nie znaleziono ławki w pobliżu!");
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(GetPVarInt(playerid, "gym_pass") == 0) return 1;
    if(!IsInGantonGym(playerid)) return 1;

    if(newkeys & KEY_YES && !(oldkeys & KEY_YES)) // Y pressed
    {
        if(gPlayerGym[playerid])
        {
            ClearAnimations(playerid);
            gPlayerGym[playerid] = false;
            gPlayerGymType[playerid] = 0;
            gPlayerGymCount[playerid] = 0;
            SendClientMessage(playerid, -1, "Zakończyłeś trening.");
            SetPVarInt(playerid, "gym_pass", 0);
            return 1;
        }

        new bench = GetClosestGymObject(playerid, MODEL_BENCH, 3.0);
        if(bench != INVALID_OBJECT_ID)
        {
            return StartGymAtObject(playerid, bench);
        }
        else
        {
            SendClientMessage(playerid, -1, "Nie znaleziono ławki w pobliżu!");
        }
    }
    return 1;
}

YCMD:kupkarnet(playerid, params[], help)
{
    new price = 1000;
    if(GetPlayerMoney(playerid) < price)
    {
        SendClientMessage(playerid, 0xFF0000FF, "Nie masz wystarczająco pieniędzy na karnet.");
        return 1;
    }
    GivePlayerMoney(playerid, -price);
    SetPVarInt(playerid, "gym_pass", 1);
    SendClientMessage(playerid, 0x00FF00FF, "Kupiłeś karnet na siłownię (walki i trening siły).\nUżyj klawisza Y przy sprzęcie, aby ćwiczyć.");
    return 1;
}

hook OnPlayerUpdate(playerid)
{
    if(!gPlayerGym[playerid]) return 1;

    new Keys, ud, lr;
    GetPlayerKeys(playerid, Keys, ud, lr);

    if(Keys & KEY_SPRINT)
    {
        new czas = gettime() - gLastGymUse[playerid];
        if(czas < 5)
        {
            new need = 5 - czas;
            new msg[64];
            format(msg, sizeof(msg), "Musisz odczekac %d sekund!", need);
            GameTextForPlayer(playerid, msg, 1000, 4);
            return 1;
        }

        gLastGymUse[playerid] = gettime();

        if(gPlayerGymType[playerid] == 2)
        {
            switch(random(2))
            {
                case 0: ApplyAnimation(playerid, "benchpress", "gym_bp_up_A", 2.3, 0, 0, 0, 1, 0, 1);
                case 1: ApplyAnimation(playerid, "benchpress", "gym_bp_up_B", 2.3, 0, 0, 0, 1, 0, 1);
            }
        }

        gPlayerGymCount[playerid]++;


        if(gPlayerGymCount[playerid] % 5 == 0)
        {
            gPlayerStrength[playerid]++;

            new msg2[64];
            format(msg2, sizeof(msg2), "Twoja siła wzrosła! Aktualna siła: %d", gPlayerStrength[playerid]);
            SendClientMessage(playerid, 0x00FF00FF, msg2);

            ClearAnimations(playerid);
            gPlayerGym[playerid] = false;
            gPlayerGymType[playerid] = 0;

            SendClientMessage(playerid, 0xFFFFFF00, "Trening zakonczony!");
            return 1;
        }
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
    gPlayerGym[playerid] = false;
    gPlayerGymType[playerid] = 0;
    gPlayerGymCount[playerid] = 0;
    gPlayerStrength[playerid] = 0;
    gLastGymUse[playerid] = 0;
    return 1;
}
