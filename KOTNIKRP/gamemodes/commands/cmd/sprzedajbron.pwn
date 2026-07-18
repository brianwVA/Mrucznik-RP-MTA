//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ sprzedajbron ]---------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:sprzedajbron(playerid, params[], help)
{
    new string[128];
    new sendername[MAX_PLAYER_NAME];
    new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pJob] == 9)
        {
            new umiejetnosc;
            new skillz;
            new x_weapon[16],weapon[MAX_PLAYERS],ammo[MAX_PLAYERS],price[MAX_PLAYERS],quant=1;
            new giveplayerid;
            if( sscanf(params, "k<fix>s[16]d", giveplayerid, x_weapon))
            {
                SendClientMessage(playerid, COLOR_GRAD1, "U?yj: /sprzedajbron [ID gracza] [nazwa broni]");
                SendClientMessage(playerid, COLOR_GREY, "----[DILER BRONI - GANG]----");
                SendClientMessage(playerid, COLOR_GREY, "Bronie 1 Skill: pistolety(105)");
                SendClientMessage(playerid, COLOR_GREY, "Bronie 2 Skill: sdpistol(175) eagle(480)");
                SendClientMessage(playerid, COLOR_GREY, "----[DILER BRONI - MAFIA / SKLEP Z BRONI?]----");
                SendClientMessage(playerid, COLOR_GREY, "Bronie 1 Skill: pistolety(105) shotgun(275)");
                SendClientMessage(playerid, COLOR_GREY, "Bronie 2 Skill: sdpistol(175) eagle(480) mp5(615)");
                SendClientMessage(playerid, COLOR_GREY, "Bronie 3 Skill: ak47(2000) m4(2500) rifle(2100)");
                SendClientMessage(playerid, COLOR_GREY, "Bronie 4 Skill: spas12(2100) sniper(3100)");
                return 1;
            }

            if (zmatsowany[playerid] == 1)
            {
                SendClientMessage(playerid,COLOR_GREY,"   Poczekaj 10 sekund zanim sprzedasz temu graczowi nast?pn? bro? !");
                return 1;
            }
            if (IsPlayerConnected(giveplayerid))
            {
                if(PlayerInfo[giveplayerid][pConnectTime] >= 5)
                {
                    if(PlayerInfo[giveplayerid][pGunLic] == 1 || IsAPrzestepca(giveplayerid) || IsAPolicja(giveplayerid) || IsABOR(giveplayerid) || strcmp(x_weapon,"pistolety",true) == 0)
                    {
                        if(IsPlayerInAnyVehicle(giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Klient nie mo?e by? w poje?dzie!");
                        if(giveplayerid != INVALID_PLAYER_ID)
                        {
                            if(!strlen(x_weapon))
                            {
                                SendClientMessage(playerid, COLOR_GRAD1, "U?yj: /sprzedajbron [ID gracza] [nazwa broni]");
                                SendClientMessage(playerid, COLOR_GREY, "----[DILER BRONI - GANG]----");
                                SendClientMessage(playerid, COLOR_GREY, "Bronie 1 Skill: pistolety(105)");
                                SendClientMessage(playerid, COLOR_GREY, "Bronie 2 Skill: sdpistol(175) eagle(480)");
                                SendClientMessage(playerid, COLOR_GREY, "----[DILER BRONI - MAFIA / SKLEP Z BRONI?]----");
                                SendClientMessage(playerid, COLOR_GREY, "Bronie 1 Skill: pistolety(105) shotgun(275)");
                                SendClientMessage(playerid, COLOR_GREY, "Bronie 2 Skill: sdpistol(175) eagle(480) mp5(615)");
                                SendClientMessage(playerid, COLOR_GREY, "Bronie 3 Skill: ak47(2000) m4(2500) rifle(2100)");
                                SendClientMessage(playerid, COLOR_GREY, "Bronie 4 Skill: spas12(2100) sniper(3100)");
                                return 1;
                            }
                            if(quant > 50 || quant < 1)
                                return sendErrorMessage(playerid, "Maksymalnie mo?esz sprzeda? 50 sztuk!");
                        }
                        if(PlayerInfo[playerid][pGunSkill] < 50)
                        {
                            skillz = 1;
                        }
                        else if(PlayerInfo[playerid][pGunSkill] >= 50 && PlayerInfo[playerid][pGunSkill] <= 99)
                        {
                            skillz = 2;
                        }
                        else if(PlayerInfo[playerid][pGunSkill] >= 100 && PlayerInfo[playerid][pGunSkill] <= 199)
                        {
                            skillz = 3;
                        }
                        else if(PlayerInfo[playerid][pGunSkill] >= 200 && PlayerInfo[playerid][pGunSkill] <= 399)
                        {
                            skillz = 4;
                        }
                        else if(PlayerInfo[playerid][pGunSkill] >= 400)
                        {
                            skillz = 5;
                        }
                        new slot;
                        if(strcmp(x_weapon,"katana",true) == 0)//
                        {
                            if(CountMats(playerid) >= 140*quant && IsASklepZBronia(playerid))
                            {
                                weapon[playerid] = 8;
                                price[playerid] = 140;
                                ammo[playerid] = 1;
                                umiejetnosc = 1;
                                slot = 2;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Masz za ma?o materia?ów na t? bro? lub nie jeste? pracownikiem sklepu z broni?!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"sdpistol",true) == 0)//
                        {
                            if(CountMats(playerid) >= 175*quant)
                            {
                                weapon[playerid] = 23;
                                price[playerid] = 175;
                                ammo[playerid] = 114;
                                umiejetnosc = 2;
                                slot = 3;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro?!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"pila",true) == 0)//
                        {
                            if(GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 1400*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 9;
                                price[playerid] = 1400;
                                ammo[playerid] = 1;
                                umiejetnosc = 4;
                                slot = 2;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"pistolety",true) == 0)//
                        {
                            if(CountMats(playerid) > 105*quant)
                            {
                                weapon[playerid] = 22;
                                price[playerid] = 105;
                                ammo[playerid] = 200;
                                umiejetnosc = 1;
                                slot = 3;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro?!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"eagle",true) == 0)//
                        {
                            if(CountMats(playerid) >= 480*quant)
                            {
                                weapon[playerid] = 24;
                                price[playerid] = 480;
                                ammo[playerid] = 107;
                                umiejetnosc = 2;
                                slot = 3;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro?!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"mp5",true) == 0)//
                        {
                            if(CountMats(playerid) >= 615*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 29;
                                price[playerid] = 615;
                                ammo[playerid] = 700;
                                umiejetnosc = 2;
                                slot = 5;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        /*
                        else if(strcmp(x_weapon,"uzi",true) == 0)//
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 1225*quant && (IsAGang(playerid) || IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 28;
                                price[playerid] = 1225;
                                ammo[playerid] = 750;
                                umiejetnosc = 4;
                                slot = 5;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do gangu/mafii!");
                                return 1;
                            }
                        }
                        */
                        else if(strcmp(x_weapon,"shotgun",true) == 0)//
                        {
                            if(CountMats(playerid) >= 275*quant && (IsASklepZBronia(playerid) || IsAMafia(playerid)))
                            {
                                weapon[playerid] = 25;
                                price[playerid] = 275;
                                ammo[playerid] = 50;
                                umiejetnosc = 1;
                                slot = 4;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Masz za ma?o materia?ów na t? bro? lub nie nale?ysz do mafii/nie jeste? pracownikiem sklepu z broni?!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"spas12",true) == 0)//
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 2100*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 27;
                                price[playerid] = 2100;
                                ammo[playerid] = 49;
                                umiejetnosc = 4;
                                slot = 4;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"ak47",true) == 0)
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 2000*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 30;
                                price[playerid] = 2000;
                                ammo[playerid] = 350;
                                umiejetnosc = 3;
                                slot = 6;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"m4",true) == 0)
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 2500*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 31;
                                price[playerid] = 2500;
                                ammo[playerid] = 350;
                                umiejetnosc = 3;
                                slot = 6;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"rifle",true) == 0)
                        {
                            if(CountMats(playerid) >= 2100*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 33;
                                price[playerid] = 2100;
                                ammo[playerid] = 51;
                                umiejetnosc = 3;
                                slot = 7;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"sniper",true) == 0)
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 3100*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 34;
                                price[playerid] = 3100;
                                ammo[playerid] = 51;
                                umiejetnosc = 4;
                                slot = 7;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        /*
                        else if(strcmp(x_weapon,"c4",true) == 0)
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) >= 3500*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 39;
                                price[playerid] = 3500;
                                ammo[playerid] = 10;
                                umiejetnosc = 5;
                                slot = 9;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        else if(strcmp(x_weapon,"ogniomiotacz",true) == 0)
                        {
                            if(GroupPlayerDutyPerm(playerid, PERM_LEGALGUNDEALER) && GroupPlayerDutyRank(playerid) < 5)
                            {
                                SendClientMessage(playerid,COLOR_GREY,"    Bro? ci??k? mo?esz sprzedawa? od [5]!");
                                return 1;
                            }
                            if(CountMats(playerid) > 14000*quant && (IsAMafia(playerid) || IsASklepZBronia(playerid)))
                            {
                                weapon[playerid] = 37;
                                price[playerid] = 14000;
                                ammo[playerid] = 200;
                                umiejetnosc = 5;
                                slot = 8;
                            }
                            else
                            {
                                SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj?cej ilo?ci materia?ów na t? bro? lub nie nale?ysz do mafii!");
                                return 1;
                            }
                        }
                        */
                        else
                        {
                            SendClientMessage(playerid,COLOR_GREY,"   Z?a nazwa broni!");
                            return 1;
                        }
                        if (ProxDetectorS(5.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
                        {
                            if(PlayerInfo[giveplayerid][pConnectTime] < 5)
                            {
                                SendClientMessage(playerid, COLOR_GRAD1, "* Bro? mog? posiada? tylko gracze z przegranymi minimum 5. godzinami online !");
                                SendClientMessage(giveplayerid, COLOR_GRAD1, "* Bro? mog? posiada? tylko gracze z przegranymi minimum 5. godzinami online !");
                                return 1;
                            }
                            if(PlayerInfo[playerid][pMiserPerk] > 0)
                            {
                                new skill = 2 * PlayerInfo[playerid][pMiserPerk];
                                new mats = price[playerid] / 100;
                                price[playerid] -= (mats)*(skill);
                            }
                            if(umiejetnosc <= skillz)
                            {
                                if(umiejetnosc >= 2 && PlayerInfo[giveplayerid][pGunLic] == 0)
                                {
                                    SendClientMessage(playerid, COLOR_RED, "Ten gracz nie posiada licencji na bro?, mo?esz sprzeda? mu tylko bronie dla 1 skillu !");
                                    return 1;
                                }
                                if(Item_Count(giveplayerid)+quant > GetPlayerItemLimit(giveplayerid))
                                    return sendErrorMessage(playerid, "Nie mo?esz da? tyle sztuk tej broni! (gracz przekroczy? limit)");
                                GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
                                GetPlayerName(playerid, sendername, sizeof(sendername));
                                x_weapon[0] = toupper(x_weapon[0]);
                                format(string, sizeof(string), "   Da?e? %s, %s x%d z %d nabojami, z %d materia?ów.", giveplayer,x_weapon, quant, ammo[playerid], price[playerid]*quant);
                                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                                SendClientMessage(playerid, COLOR_GRAD1, string);
                                format(string, sizeof(string), "   Odebra?e? %s x%d z %d nabojami od %s. (/przedmioty)", x_weapon, quant, ammo[playerid], sendername);
                                SendClientMessage(giveplayerid, COLOR_GRAD1, string);
                                PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
                                format(string, sizeof(string), "* %s stworzy? bro? z materia?ów i da? j? %s.", sendername ,giveplayer);
                                ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                new id = Item_Add(x_weapon, ITEM_OWNER_TYPE_PLAYER, PlayerInfo[giveplayerid][pUID], ITEM_TYPE_WEAPON, weapon[playerid], ammo[playerid], true, giveplayerid, quant, 1);
								Log(payLog, WARNING, "Gracz %s sprzeda? graczowi %s bro? %s x%d", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), GetWeaponLogName(weapon[playerid], ammo[playerid]), quant);
                                TakeMats(playerid, price[playerid]*quant);
                                new weapons[13][2];
                                for (new i = 0; i <= 12; i++)
                                {
                                    GetPlayerWeaponData(giveplayerid, i, weapons[i][0], weapons[i][1]);
                                }
                                if(IsAMafia(playerid)) {
                                    switch(slot) {
                                        case 2: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 3: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 5: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 4: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 6: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 7: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 9: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                        case 8: {
                                                Item[id][i_ValueSecret] = 0;
                                                SaveItem(id);
                                        }
                                    }
                                }
                                if(playerid != giveplayerid)
                                {
                                    if(strcmp(x_weapon,"katana",true) == 0)
                                    {
                                        SetTimerEx("spamujebronia",10000,0,"d",playerid);
                                        zmatsowany[playerid] = 1;
                                    }
                                    else
                                    {
                                        SendClientMessage(playerid, COLOR_GRAD1, "Skill + 1 !");
                                        PlayerInfo[playerid][pGunSkill] ++;
                                        SetTimerEx("spamujebronia",10000,0,"d",playerid);
                                        zmatsowany[playerid] = 1;
                                    }
                                }
                            }
                            else
                            {
                                format(string, sizeof(string), "   Ta bro? potrzebuje %d skillu, ty masz tylko %d", umiejetnosc, skillz);
                                SendClientMessage(playerid, COLOR_GRAD1, string);
                            }
                        }
                        else
                        {
                            SendClientMessage(playerid, COLOR_GRAD1, "   Ten gracz jest za daleko !");
                            return 1;
                        }
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_GRAD1, "   Nie mo?esz sprzeda? broni graczowi który nie posiada na ni? licencji !");
                        return 1;
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GRAD1, "* Bro? mog? posiada? tylko gracze z przegranymi minimum 5. godzinami online !");
                    SendClientMessage(giveplayerid, COLOR_GRAD1, "* Bro? mog? posiada? tylko gracze z przegranymi minimum 5. godzinami online !");
                    return 1;
                }
            }
            else
            {
                format(string, sizeof(string), "   Gracz o ID %d nie istnieje.", giveplayerid);
                SendClientMessage(playerid, COLOR_GRAD1, string);
            }
        }
        else
        {
            SendClientMessage(playerid,COLOR_GREY,"   Nie jeste? dilerem broni !");
            return 1;
        }
    }
    return 1;
}