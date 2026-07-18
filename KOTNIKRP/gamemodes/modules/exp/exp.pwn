#include <YSI_Coding\y_hooks>

forward EXPtoNextLevel(playerid);
forward TextDrawEXPOn(playerid,string[],time);
forward TextDrawEXPoff(playerid,string[]);
forward AliveTimer();

new EXPWyswietla[MAX_PLAYERS];

stock ReturnToLevel(playerid)
{
    new exp = PlayerInfo[playerid][pPlayerEXP];

    if(exp <= 50) return 1;
    if(exp <= 125) return 2;
    if(exp <= 250) return 3;
    if(exp <= 400) return 4;
    return 5;
}

stock AddEXP(playerid, ammount)
{
    new old = ReturnToLevel(playerid);
    PlayerInfo[playerid][pPlayerEXP] += ammount;
    if(PlayerInfo[playerid][pPlayerEXP] < 0) PlayerInfo[playerid][pPlayerEXP] = 0;

    new msg[128];
    if(ammount >= 0)
        format(msg, sizeof msg, "~g~+%d EXP", ammount);
    else
        format(msg, sizeof msg, "~r~%d EXP", ammount);

    if(old != ReturnToLevel(playerid))
        format(msg, sizeof msg, "%s~n~~y~Nowy poziom: %d", msg, ReturnToLevel(playerid));

    TextDrawEXPOn(playerid, msg, 5000);
    return 1;
}

stock EXPtoNextLevel(playerid)
{
    static buf[32];
    new exp = PlayerInfo[playerid][pPlayerEXP];

    switch(ReturnToLevel(playerid))
    {
        case 1: format(buf, sizeof buf, "%d/50", exp);
        case 2: format(buf, sizeof buf, "%d/125", exp);
        case 3: format(buf, sizeof buf, "%d/250", exp);
        case 4: format(buf, sizeof buf, "%d/400", exp);
        case 5: format(buf, sizeof buf, "MAX");
    }
    return buf;
}

public TextDrawEXPOn(playerid,string[],time)
{
    if(EXPWyswietla[playerid])
        TextDrawHideForPlayer(playerid, TextDrawEXP[playerid]);

    EXPWyswietla[playerid] = 1;

    TextDrawSetString(TextDrawEXP[playerid], string);
    TextDrawShowForPlayer(playerid, TextDrawEXP[playerid]);
    SetTimerEx("TextDrawEXPoff", time, false, "d", playerid);

    return 1;
}

public TextDrawEXPoff(playerid,string[])
{
    if(EXPWyswietla[playerid])
    {
        TextDrawHideForPlayer(playerid, TextDrawEXP[playerid]);
        EXPWyswietla[playerid] = 0;
    }
    return 1;
}

public AliveTimer()
{
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && IsPlayerSpawned(i))
        {
            PlayerInfo[i][pAliveTime]++;

            if(PlayerInfo[i][pAliveTime] >= 10)
            {
                AddEXP(i, 1);
                //if(ReturnToLevel(i) >= 3) LVLAddMats(i);
                PlayerInfo[i][pAliveTime] = 0;
            }
        }
    }
    return 1;
}

hook OnGameModeInit()
{
    SetTimerEx("AliveTimer", 60000, true);
    return 1;
}

hook OnPlayerLogin(playerid)
{
    PlayerLoginEX(playerid);
    return 1;
}

stock PlayerLoginEX(playerid)
{
    PlayerInfo[playerid][pLoginStreak]++;

    if(PlayerInfo[playerid][pLoginStreak] >= 3)
        AddEXP(playerid, 3);

    //if(PlayerInfo[playerid][pLoginStreak] >= 7)
        //LVLAddMats(playerid);

    return 1;
}

stock EXPPlayerDeath(playerid, killerid, reason)
{
    PlayerInfo[playerid][pAliveTime] = 0;

    if(killerid != INVALID_PLAYER_ID && killerid != playerid)
    {
        if(reason == 0) AddEXP(playerid, -1);
        else AddEXP(playerid, -2);

        PlayerInfo[playerid][pKillStreak] = 0;

        PlayerInfo[killerid][pKillStreak]++;

        new ks = PlayerInfo[killerid][pKillStreak];

        if(ks == 3) AddEXP(killerid, 3);
        //if(ks == 5) { AddEXP(killerid, 5); LVLAddMats(killerid); }
        if(ks == 10){ AddEXP(killerid, 10); LVLPayDay(killerid); }

        AddEXP(killerid, 1);

        if(PlayerInfo[killerid][pDailyQuestType] == 0)
        {
            PlayerInfo[killerid][pDailyQuestProgress]++;
            if(PlayerInfo[killerid][pDailyQuestProgress] >= 5)
            {
                AddEXP(killerid, 10);
                //LVLAddMats(killerid);
            }
        }
    }

    if(reason == 54)
        AddEXP(playerid, -1);

    return 1;
}

stock LVLAddMats(playerid)
{
    switch(ReturnToLevel(playerid))
    {
        case 2: Item_Add("Materiały",ITEM_OWNER_TYPE_PLAYER,PlayerInfo[playerid][pUID],ITEM_TYPE_MATS,0,0,true,playerid,5,ITEM_NOT_COUNT);
        case 3: Item_Add("Materiały",ITEM_OWNER_TYPE_PLAYER,PlayerInfo[playerid][pUID],ITEM_TYPE_MATS,0,0,true,playerid,10,ITEM_NOT_COUNT);
        case 4: Item_Add("Materiały",ITEM_OWNER_TYPE_PLAYER,PlayerInfo[playerid][pUID],ITEM_TYPE_MATS,0,0,true,playerid,15,ITEM_NOT_COUNT);
        case 5: Item_Add("Materiały",ITEM_OWNER_TYPE_PLAYER,PlayerInfo[playerid][pUID],ITEM_TYPE_MATS,0,0,true,playerid,20,ITEM_NOT_COUNT);
    }
    return 1;
}

stock LVLPayDay(playerid)
{
    switch(ReturnToLevel(playerid))
    {
        case 2: DajMC(playerid, 1);
        case 3: DajMC(playerid, 2);
        case 4: DajMC(playerid, 3);
        case 5: DajMC(playerid, 4);
    }

    PlayerInfo[playerid][pDailyQuestType] = random(4);
    PlayerInfo[playerid][pDailyQuestProgress] = 0;
    return 1;
}

stock EXPPlayerBuyHouse(playerid)
{
    AddEXP(playerid, 10);

    if(PlayerInfo[playerid][pDailyQuestType] == 1)
    {
        PlayerInfo[playerid][pDailyQuestProgress] = 1;
        //LVLAddMats(playerid);
    }
    return 1;
}

stock EXPPlayerBuyCar(playerid, amount)
{
    if(amount >= 1000000) AddEXP(playerid, 7);
    else AddEXP(playerid, 4);

    if(PlayerInfo[playerid][pDailyQuestType] == 2)
    {
        PlayerInfo[playerid][pDailyQuestProgress] = 1;
        AddEXP(playerid, 7);
    }
    return 1;
}

stock EXPPlayerJail(playerid, time)
{
    if(time >= 20) AddEXP(playerid, -5);
    else AddEXP(playerid, -2);

    if(PlayerInfo[playerid][pDailyQuestType] == 3)
    {
        PlayerInfo[playerid][pDailyQuestProgress]++;
        if(PlayerInfo[playerid][pDailyQuestProgress] >= 1)
            AddEXP(playerid, 5);
    }
    return 1;
}

stock LVLPlayerSpawn(playerid)
{
    if(ReturnToLevel(playerid) == 4)
        SetPlayerArmour(playerid, 25);

    if(ReturnToLevel(playerid) == 5)
        SetPlayerArmour(playerid, 50);

    return 1;
}

YCMD:exp(playerid, params[])
{
    new msg[128];
    format(msg, sizeof msg, "Posiadasz %d EXP | Level %d | Do następnego: %s",
        PlayerInfo[playerid][pPlayerEXP],
        ReturnToLevel(playerid),
        EXPtoNextLevel(playerid));

    SendClientMessage(playerid, -1, msg);
    return 1;
}

YCMD:dodajexp(playerid, params[])
{
    if(IsPlayerAdmin(playerid) || Uprawnienia(playerid, ACCESS_OWNER) || IsAScripter(playerid))
    {
        new pid, amount;
        if(sscanf(params,"dd",pid,amount))
            return SendClientMessage(playerid,-1,"Użycie: /dodajexp [id] [ilość]");

        AddEXP(pid, amount);
    }
    return 1;
}

YCMD:sprawdzexp(playerid, params[])
{
    if(IsPlayerAdmin(playerid) || Uprawnienia(playerid, ACCESS_OWNER) || IsAScripter(playerid))
    {
        new pid;
        if(sscanf(params,"d",pid))
            return SendClientMessage(playerid,-1,"Użycie: /sprawdzexp [id]");

        if(!IsPlayerConnected(pid))
            return SendClientMessage(playerid,-1,"Nie ma takiego gracza!");

        new name[24], buf[160];
        GetPlayerName(pid, name, sizeof name);

        format(buf, sizeof buf,
            "Gracz %s[%d] ma %d EXP | Level %d | Do następnego: %s",
            name, pid,
            PlayerInfo[pid][pPlayerEXP],
            ReturnToLevel(pid),
            EXPtoNextLevel(pid));

        SendClientMessage(playerid, -1, buf);
    }
    return 1;
}

YCMD:killstreak(playerid, params[])
{
    new msg[64];
    format(msg, sizeof msg, "Twój killstreak: %d", PlayerInfo[playerid][pKillStreak]);
    SendClientMessage(playerid, -1, msg);
    return 1;
}

YCMD:misja(playerid, params[])
{
    new t = PlayerInfo[playerid][pDailyQuestType];
    new p = PlayerInfo[playerid][pDailyQuestProgress];
    new msg[128];

    switch(t)
    {
        case 0: format(msg,sizeof msg,"Misja: Zabij 5 graczy (%d/5)",p);
        case 1: format(msg,sizeof msg,"Misja: Kup dom (1/1)");
        case 2: format(msg,sizeof msg,"Misja: Kup auto (1/1)");
        case 3: format(msg,sizeof msg,"Misja: Odsiedź 1 minutę w jailu (%d/1)",p);
    }

    SendClientMessage(playerid,-1,msg);
    return 1;
}

YCMD:mojastatystyka(playerid, params[])
{
    new msg[128];
    format(msg, sizeof msg,
        "Killstreak: %d | Czas bez śmierci: %d min |",
        PlayerInfo[playerid][pKillStreak],
        PlayerInfo[playerid][pAliveTime],
        PlayerInfo[playerid][pLoginStreak]);

    SendClientMessage(playerid, -1, msg);
    return 1;
}
