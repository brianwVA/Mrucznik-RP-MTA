//  podniesbw.pwn
#include <YSI_Coding\y_hooks>
timer HealPlayer[60000](playerid, healer)
{
    if(!GetPVarInt(healer, "healingprocess")) return 0;
    DeletePVar(healer, "healingprocess");
    if(!IsPlayerConnected(playerid) || !IsPlayerConnected(healer)) return 0;
    if(!IsPlayerNear(playerid, healer)) return sendErrorMessage(healer, "Oddaliłeś się od gracza, którego leczyłeś - proces przerwany.");
    if(!CheckBW(playerid)) return sendErrorMessage(healer, "Ten gracz nie ma BW.");
    if(CheckBW(healer)) return sendErrorMessage(healer, "Masz BW, nie możesz uleczyć innego gracza.");

    ZdejmijBW(playerid);
    sendTipMessage(healer, "Uleczyłeś gracza.");
    sendTipMessage(playerid, "Zostałeś uleczony.");
    TextDrawInfooff(healer, "");
    return 1;
}

YCMD:podniesbw(playerid, params[])
{
    if(CheckBW(playerid)) return sendErrorMessage(playerid, "Nie możesz mieć aktywnego BW!");
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendErrorMessage(playerid, "Musisz być pieszo.");
    new targetid = GetClosestPlayer(playerid);
    if(!IsPlayerConnected(targetid) || targetid == INVALID_PLAYER_ID || GetPlayerState(targetid) == PLAYER_STATE_SPECTATING) return sendErrorMessage(playerid, "W pobliżu nie ma żadnego gracza!");
    if(!CheckBW(targetid)) return sendErrorMessage(playerid, "Gracz w pobliżu którego się znajdujesz nie ma BW!");
    if(GetPVarInt(playerid, "podniesbw-cd") > gettime()) return sendErrorMessage(playerid, "Tej komendy możesz użyć co 5 minut.");
    if(!IsPlayerNear(playerid, targetid)) return sendErrorMessage(playerid, "Error.");
    if(GetPVarInt(playerid, "healingprocess") >= 1000) return sendErrorMessage(playerid, "Leczysz już kogoś.");

    SetPVarInt(playerid, "healingprocess", targetid+1000);
    SetPVarInt(playerid, "podniesbw-cd", gettime()+300);
    sendTipMessage(playerid, "Rozpocząłeś proces podnoszenia z BW trwający 60 sekund.");
    va_SendClientMessage(targetid, COLOR_GRAD3, "Gracz %s zaczął podnosić Cię z BW (odczekaj 60 sekund)", GetNick(playerid));
    TextDrawInfoOn(playerid, "poczekaj 60 sekund~n~aby przerwac nacisnij ~g~N", 60000);
    defer HealPlayer(targetid, playerid);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_NO)
    {
        if(GetPVarInt(playerid, "healingprocess") >= 1000)
        {
            sendErrorMessage(GetPVarInt(playerid, "healingprocess")-1000, "Gracz podnoszący Cię z BW anulował proces.");
            DeletePVar(playerid, "healingprocess");
            TextDrawInfooff(playerid, "");
            return sendTipMessage(playerid, "Proces leczenia przerwany.");
        }
    }
    return 1;
}

hook OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
    if(GetPVarInt(playerid, "healingprocess") >= 1000 && IsPlayerConnected(issuerid))
    {
        DeletePVar(playerid, "healingprocess");
        TextDrawInfooff(playerid, "");
        return sendTipMessage(playerid, "Proces leczenia przerwany.");
    }
    return 1;
}