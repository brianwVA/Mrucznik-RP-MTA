#include <YSI_Coding\y_hooks>

new Text3D:StatusRP[MAX_PLAYERS];
new bool:HasRPStatus[MAX_PLAYERS];

hook OnPlayerDisconnect(playerid, reason)
{
    if (StatusRP[playerid] != Text3D:INVALID_3DTEXT_ID)
    {
        DestroyDynamic3DTextLabel(StatusRP[playerid]);
    }
    return 1;
}

YCMD:status(playerid, params[])
{
    if(strcmp(params, "rp", true) == 0)
    {
        if (!HasRPStatus[playerid])
        {
            HasRPStatus[playerid] = true;
            StatusRP[playerid] = CreateDynamic3DTextLabel("RP", 0x00FF00AA, 0.0, 0.0, 0.5, 15, playerid, INVALID_VEHICLE_ID, 1);
            SetPVarInt(playerid, "IsRPPlayer", 1);
        }
        else
        {
            HasRPStatus[playerid] = false;
            if (StatusRP[playerid] != Text3D:INVALID_3DTEXT_ID)
            {
                DestroyDynamic3DTextLabel(StatusRP[playerid]);
            }
            SetPVarInt(playerid, "IsRPPlayer", 0);
        }
        UpdatePlayer3DName(playerid);
    }
    else
    {
        sendTipMessage(playerid, "Użyj: /status [rp]");
    }
    return 1;
}
