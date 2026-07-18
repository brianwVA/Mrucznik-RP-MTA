//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                setwskill                                                //
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Kod wygenerowany automatycznie narzędziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTANĄ NADPISANE PO WYWOŁANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================

//-------<[ command ]>-------
YCMD:setwskill(playerid, params[], help)
{
    if (help)
    {
        return 1;
    }
    
    if(PlayerInfo[playerid][pAdmin] < 3000 && !IsAScripter(playerid))
        return noAccessMessage(playerid);
    new targetid, skillid, skillvalue;
    if(sscanf(params, "k<fix>dd", targetid, skillid, skillvalue))
        return sendTipMessage(playerid, "Użyj: /setwskill [id gracza] [id skilla] [wartość]", COLOR_GRAD3);
    if(!IsPlayerConnected(targetid) || IsPlayerNPC(targetid))
        return sendTipMessage(playerid, "Gracz o podanym ID nie jest połączony z serwerem.", COLOR_GRAD3);
    if(skillid < 0 || skillid > 5)
        return sendTipMessage(playerid, "ID skilla od 0 do 5!", COLOR_GRAD3);
    if(skillvalue < 0 || skillvalue > 40)
        return sendTipMessage(playerid, "Wartość od 0 do 40!", COLOR_GRAD3);

    PlayerInfo[targetid][pWeaponSkill][skillid] = skillvalue;

    new string[258];
    new string2[258];
    new adminName[24];
    new targetName[24];
    GetPlayerName(playerid, adminName, sizeof adminName);
    GetPlayerName(targetid, targetName, sizeof targetName);
    format(string, sizeof(string), "Twój skill broni ID %d został ustawiony na %d przez administratora %s", skillid, skillvalue, adminName);
    sendTipMessage(targetid, string);
    format(string2, sizeof(string2), "Ustawiłes skill broni gracza %s (ID %d) na %d", targetName, targetid, skillvalue);
    sendTipMessage(playerid, string2);
    return 1;
}