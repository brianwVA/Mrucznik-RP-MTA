#define DIALOG_ULEPSZ_SADZ 9450
forward ulepszsadzonki_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);

YCMD:ulepszsadzonki(playerid, params[], help)
{
    new string[128];
    if(!IsPlayerConnected(playerid)) return 1;

    new base = 30000; 
    new level = PlayerInfo[playerid][pMaxSadzonkiBoost];
    new cost = base;
    for(new i = 0; i < level; i++)
    {
        cost = (cost * 125 + 50) / 100;
    }

    SetPVarInt(playerid, "ulepszsadzonki_cost", cost);

    format(string, sizeof(string), "Ulepszyć limit plantacji o 1 za %d$? (Aktualny limit: %d)", cost, MAX_PLANTACJA_PLAYER + level);
    ShowPlayerDialogEx(playerid, DIALOG_ULEPSZ_SADZ, DIALOG_STYLE_MSGBOX, "Ulepszenie plantacji", string, "TAK", "NIE");
    return 1;
}

public ulepszsadzonki_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid != DIALOG_ULEPSZ_SADZ) return 0;

    new string[128];

    if(!response)
    {
        sendTipMessage(playerid, "Anulowano ulepszenie plantacji.");
        DeletePVar(playerid, "ulepszsadzonki_cost");
        return 1;
    }

    new cost = GetPVarInt(playerid, "ulepszsadzonki_cost");
    DeletePVar(playerid, "ulepszsadzonki_cost");

    new playerCash = kaska[playerid];
    if(playerCash < cost)
    {
        format(string, sizeof(string), "Nie masz wystarczająco pieniędzy. Koszt ulepszenia: %d$", cost);
        sendTipMessage(playerid, string);
        return 1;
    }

    ZabierzKase(playerid, cost);
    PlayerInfo[playerid][pMaxSadzonkiBoost] += 1;

    format(string, sizeof(string), "Pomyślnie ulepszono maksymalną ilość sadzonek o 1! (Aktualny limit: %d). Zapłacono: %d$", MAX_PLANTACJA_PLAYER + PlayerInfo[playerid][pMaxSadzonkiBoost], cost);
    sendTipMessage(playerid, string);
    Log(payLog, WARNING, "%s kupił wyższy poziom sadzonek %d, koszt: %d", PlayerInfo[playerid][pMaxSadzonkiBoost], cost);
    return 1;
}