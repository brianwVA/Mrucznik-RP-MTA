#include <a_samp>
#include <YSI_Coding\y_hooks>

#define DIALOG_DAMAGE_INFO 5732
#define MAX_DAMAGE_RECORDS 10

new Float:g_DamageHealth[MAX_PLAYERS][MAX_DAMAGE_RECORDS];
new Float:g_DamageArmour[MAX_PLAYERS][MAX_DAMAGE_RECORDS];
new g_DamageWeapon[MAX_PLAYERS][MAX_DAMAGE_RECORDS];
new g_DamageTime[MAX_PLAYERS][MAX_DAMAGE_RECORDS];
new g_DamageInflicter[MAX_PLAYERS][MAX_DAMAGE_RECORDS];
new g_DamageCount[MAX_PLAYERS];
new bool:g_CanCheckDamage[MAX_PLAYERS];

forward ShowPlayerDamageInfo(playerid);

stock AddDamageRecord(playerid, issuerid, Float:healthDmg, Float:armourDmg, weaponid)
{
    for(new i = MAX_DAMAGE_RECORDS - 1; i > 0; i--)
    {
        g_DamageHealth[playerid][i] = g_DamageHealth[playerid][i-1];
        g_DamageArmour[playerid][i] = g_DamageArmour[playerid][i-1];
        g_DamageWeapon[playerid][i] = g_DamageWeapon[playerid][i-1];
        g_DamageTime[playerid][i] = g_DamageTime[playerid][i-1];
        g_DamageInflicter[playerid][i] = g_DamageInflicter[playerid][i-1];
    }
    
    g_DamageHealth[playerid][0] = healthDmg;
    g_DamageArmour[playerid][0] = armourDmg;
    g_DamageWeapon[playerid][0] = weaponid;
    g_DamageTime[playerid][0] = gettime();
    g_DamageInflicter[playerid][0] = issuerid;
    
    if(g_DamageCount[playerid] < MAX_DAMAGE_RECORDS)
        g_DamageCount[playerid]++;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, WEAPON:weaponid, bodypart)
{
    new Float:currentHealth, Float:currentArmour;
    GetPlayerHealth(playerid, currentHealth);
    GetPlayerArmour(playerid, currentArmour);
    
    new Float:healthDamage, Float:armourDamage;
    if(currentArmour > 0.0)
    {
        if(amount > currentArmour)
        {
            armourDamage = currentArmour;
            healthDamage = amount - currentArmour;
        }
        else
        {
            armourDamage = amount;
            healthDamage = 0.0;
        }
    }
    else
    {
        armourDamage = 0.0;
        healthDamage = amount;
    }
    
    AddDamageRecord(playerid, issuerid, healthDamage, armourDamage, _:weaponid);
    
    g_CanCheckDamage[playerid] = true;
    
    return 1;
}

hook OnPlayerDeath(playerid, killerid, WEAPON:reason)
{
    new Float:currentHealth;
    GetPlayerHealth(playerid, currentHealth);
    AddDamageRecord(playerid, killerid, currentHealth, 0.0, _:reason);
    
    g_CanCheckDamage[playerid] = true;
    
    return 1;
}

hook OnPlayerConnect(playerid)
{
    g_CanCheckDamage[playerid] = false;
    g_DamageCount[playerid] = 0;
    
    for(new i = 0; i < MAX_DAMAGE_RECORDS; i++)
    {
        g_DamageHealth[playerid][i] = 0.0;
        g_DamageArmour[playerid][i] = 0.0;
        g_DamageWeapon[playerid][i] = 0;
        g_DamageTime[playerid][i] = 0;
        g_DamageInflicter[playerid][i] = INVALID_PLAYER_ID;
    }
    
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    for(new i = 0; i < MAX_DAMAGE_RECORDS; i++)
    {
        g_DamageHealth[playerid][i] = 0.0;
        g_DamageArmour[playerid][i] = 0.0;
        g_DamageWeapon[playerid][i] = 0;
        g_DamageTime[playerid][i] = 0;
        g_DamageInflicter[playerid][i] = INVALID_PLAYER_ID;
    }
    g_DamageCount[playerid] = 0;
    g_CanCheckDamage[playerid] = false;
    
    return 1;
}

YCMD:damages(playerid, params[], help)
{
    if(!g_CanCheckDamage[playerid])
    {
        SendClientMessage(playerid, 0xFF6666FF, "Możesz sprawdzić obrażenia tylko po śmierci!");
        return 1;
    }
    
    ShowPlayerDamageInfo(playerid);
    
    g_CanCheckDamage[playerid] = false;
    
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_DAMAGE_INFO)
    {  
        for(new i = 0; i < MAX_DAMAGE_RECORDS; i++)
        {
            g_DamageHealth[playerid][i] = 0.0;
            g_DamageArmour[playerid][i] = 0.0;
            g_DamageWeapon[playerid][i] = 0;
            g_DamageTime[playerid][i] = 0;
            g_DamageInflicter[playerid][i] = INVALID_PLAYER_ID;
        }
        g_DamageCount[playerid] = 0;
        
        return 1;
    }
    return 0;
}

public ShowPlayerDamageInfo(playerid)
{
    if(g_DamageCount[playerid] == 0)
    {
        ShowPlayerDialog(playerid, DIALOG_DAMAGE_INFO, DIALOG_STYLE_MSGBOX, 
            "{FF4444}Historia obrażeń", "{FFFFFF}Brak informacji o obrażeniach.", "OK", "");
        return 0;
    }
    
    new dialogText[2048];
    format(dialogText, sizeof(dialogText), 
        "Napastnik\tBroń\tObrażenia\tKiedy\n");
    
    for(new i = 0; i < g_DamageCount[playerid]; i++)
    {
        new weaponName[32];
        GetWeaponName(g_DamageWeapon[playerid][i], weaponName, sizeof(weaponName));
        if(strlen(weaponName) == 0) format(weaponName, sizeof(weaponName), "Nieznana");
        
        new inflicterName[MAX_PLAYER_NAME + 1];
        new inflicterColor[16] = "{FFFF00}";
        
        if(g_DamageInflicter[playerid][i] == INVALID_PLAYER_ID)
        {
            format(inflicterName, sizeof(inflicterName), "Środowisko");
            format(inflicterColor, sizeof(inflicterColor), "{FF8800}");
        }
        else if(IsPlayerConnected(g_DamageInflicter[playerid][i]))
        {
            GetPlayerName(g_DamageInflicter[playerid][i], inflicterName, sizeof(inflicterName));
        }
        else
        {
            format(inflicterName, sizeof(inflicterName), "ID:%d", g_DamageInflicter[playerid][i]);
            format(inflicterColor, sizeof(inflicterColor), "{CCCCCC}");
        }
        
        new Float:totalDamage = g_DamageHealth[playerid][i] + g_DamageArmour[playerid][i];
        
        new timeDiff = gettime() - g_DamageTime[playerid][i];
        new minutes = timeDiff / 60;
        new seconds = timeDiff % 60;
        
        new timeStr[32], timeColor[16];
        if(minutes > 0)
        {
            format(timeStr, sizeof(timeStr), "%dm %ds", minutes, seconds);
            format(timeColor, sizeof(timeColor), "{AAAAFF}");
        }
        else
        {
            format(timeStr, sizeof(timeStr), "%ds", seconds);
            format(timeColor, sizeof(timeColor), "{FFAAAA}");
        }
        
        new damageColor[16];
        if(totalDamage >= 50.0)
            format(damageColor, sizeof(damageColor), "{FF3333}");
        else if(totalDamage >= 25.0)
            format(damageColor, sizeof(damageColor), "{FFAA33}");
        else
            format(damageColor, sizeof(damageColor), "{66FF66}");
        
        new line[256];
        format(line, sizeof(line), "%s%s\t{CCCCFF}%s\t%s%.1f\t%s%s\n", 
            inflicterColor, inflicterName, 
            weaponName, 
            damageColor, totalDamage, 
            timeColor, timeStr);
        strcat(dialogText, line);
    }
    
    ShowPlayerDialogEx(playerid, DIALOG_DAMAGE_INFO, DIALOG_STYLE_TABLIST_HEADERS, 
        "{FF4444}Historia twoich obrażeń {FF4444}", dialogText, "OK", "");
        
    return 1;
}