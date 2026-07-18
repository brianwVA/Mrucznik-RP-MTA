
YCMD:qs(playerid, params[], help)
{
    new slot = GetCombatLogByPUID(PlayerInfo[playerid][pUID]);
    if(slot == -1) {
        sendTipMessage(playerid, "Nie posiadasz aktywnego combatloga. Wyrzucam z serwera!");
        KickEx(playerid);
        return 1;
    }

    new minutes = CombatLogs[slot][CombatTimer];
    new msg[128];
    format(msg, sizeof(msg), "{A52A2A}Posiadasz combatloga jeszcze: %d minut.", minutes);
    SendClientMessage(playerid, COLOR_LIGHTRED, msg);
	return 1;
}