//rekompensata

YCMD:rekompensata(playerid, params[])
{
    sendErrorMessage(playerid, "Rekompensata na tą chwilę jest wyłączona.");
    /*if(GetPVarInt(playerid, "got-compensation"))
    {
        return sendErrorMessage(playerid, "Nie możesz odebrać rekompensaty.");
    }
    DajKase(playerid, 2000);
    if(IsPlayerPremiumOld(playerid))
        DajKP(playerid, PremiumInfo[playerid][pExpires]+259200);
    else
        DajKP(playerid, gettime()+259200);
    PlayerInfo[playerid][pThirst] = 0.0;
    PlayerInfo[playerid][pHunger] = 0.0;
    SendClientMessage(playerid, COLOR_YELLOW, "Otrzymujesz 2000$ oraz Konto Premium na 3 dni w ramach rekompensaty.");
    SetPVarInt(playerid, "got-compensation", 1);
    new query[248];
    format(query, sizeof(query), "UPDATE `mru_konta` SET `Compensation` = '1' WHERE `Nick` = '%s'", GetNickEx(playerid));
    mysql_query(Database, query);
    ABroadCast(COLOR_LIGHTRED, sprintf("%s odebrał rekompensatę", GetNickEx(playerid)), 3000);*/
    return 1;
}