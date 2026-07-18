//house_callbacks.pwn

#include "house/house.hwn"
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    
}

hook OnPlayerConnect(playerid)
{
    PlayerInfo[playerid][pDomWKJ] = -1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case D_PLAYER_HOUSE_LIST:
        {
            if(!response) return 0;
            new houseid = DynamicGui_GetValue(playerid, listitem);
            if(houseid == -1 || !Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");

            House_ManageDialog(playerid, houseid);
        }
        case D_PLAYER_HOUSE_MANAGE:
        {
            if(!response) return DeletePVar(playerid, "p-house-manage");
            new houseid = GetPVarInt(playerid, "p-house-manage");
            if(!Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");

            switch(listitem)
            {
                case 0: //house info
                {
                    return 0;
                }
                case 1: //lock
                {
                    House_Lock(playerid, houseid);
                    return 0;
                }
                case 2: //rent
                {
                    sendErrorMessage(playerid, "Tymczasowo niedostepne.");
                    return 0;
                }
                case 3: //interior
                {
                    House_SetInteriorDialog(playerid, houseid);
                    return 0;
                }
                case 4: //setspawn
                {
                    House_SetSpawnConfirmDialog(playerid, houseid);
                    return 0;
                }
                case 5: //boosts
                {
                    House_SetBoostsDialog(playerid, houseid);
                    return 0;
                }
                case 6: //scrap house
                {
                    House_ScrapHouseConfirmDialog(playerid, houseid);
                    return 0;
                }
            }
        }
        case D_PLAYER_HOUSE_CHANGE_INTERIOR:
        {
            if(!response) return RunCommand(playerid, "/house", "");
            new houseid = GetPVarInt(playerid, "p-house-manage");
            if(!Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");

            new interior_id = DynamicGui_GetValue(playerid, listitem), price_to_pay = 0;
            if(interior_id < 0 || interior_id >= sizeof(HOUSE_INTERIORS)) return 0;
            price_to_pay = (House[houseid][h_exit_pos][0] == 0.0) ? 0 : HOUSE_INTERIORS[interior_id][__h_price];
            if(kaska[playerid] < price_to_pay) return sendErrorMessage(playerid, "Nie masz tyle pieniędzy aby kupić ten interior");
            
            
            House_SetInterior(houseid, interior_id);
            _MruGracz(playerid, sprintf("Kupiłeś interior %s dla domu %s za %d$", HOUSE_INTERIORS[interior_id][__h_name], House[houseid][h_Name], price_to_pay));
            if(price_to_pay > 0) ZabierzKase(playerid, price_to_pay);
            Log(houseLog, INFO, "%s bought interior %s for house %s (-%d$)", GetPlayerLogName(playerid), HOUSE_INTERIORS[interior_id][__h_name], GetHouseLogName(houseid), price_to_pay);
        }
        case D_PLAYER_HOUSE_SETSPAWN_CONFIRM:
        {
            if(!response) return RunCommand(playerid, "/house", "");
            new houseid = GetPVarInt(playerid, "p-house-manage");
            if(!Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");

            _MruGracz(playerid, sprintf("Od teraz bedziesz sie spawnowal w domu %s", House[houseid][h_Name]));
            PlayerInfo[playerid][pGrupaSpawn] = 0;
            PlayerInfo[playerid][pSpawn] = 0;
            PlayerInfo[playerid][pSpawnHouseID] = houseid;
        }
        case D_PLAYER_HOUSE_SCRAPHOUSE_CONFIRM:
        {
            if(!response) return RunCommand(playerid, "/house", "");
            new houseid = GetPVarInt(playerid, "p-house-manage");
            if(!Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");
            new price = House[houseid][h_Price];
            new refund = (price * 75) / 100;

            DajKase(playerid, refund);
            House[houseid][h_Owner] = 0;
            House_Save(houseid);
            _MruGracz(playerid, sprintf("Złomowałeś dom %s", House[houseid][h_Name]));
            Log(houseLog, INFO, "%s zezlomowal dom %s i dostal %s", GetPlayerLogName(playerid), GetHouseLogName(houseid), refund);
        }
        case D_PLAYER_HOUSE_BOOSTS:
        {
            if(!response) return RunCommand(playerid, "/house", "");
            new houseid = GetPVarInt(playerid, "p-house-manage");
            if(!Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");

            if(listitem == 0)
            {
                new level = House[houseid][h_sejf_level];
                if(level >= 5) return sendTipMessage(playerid, "Sejf jest już na maksymalnym poziomie.");
                new nextlevel = level + 1;
                new price = House_GetSafeUpgradePrice(nextlevel);
                new newcap = 5000 * (100 + 25 * (nextlevel - 1)) / 100;
                new string[256];
                format(string, sizeof(string), "Czy chcesz ulepszyć sejf z poziomu %d do %d? Cena: $%d. Nowa pojemność: %d przedmiotów.", level, nextlevel, price, newcap);
                ShowPlayerDialogEx(playerid, D_PLAYER_HOUSE_BOOST_CONFIRM, DIALOG_STYLE_MSGBOX, "Ulepszenie sejfu", string, "Ulepsz", "Anuluj");
                SetPVarInt(playerid, "p-house-boost-price", price);
            }
            return 0;
        }
        case D_PLAYER_HOUSE_BOOST_CONFIRM:
        {
            if(!response) return RunCommand(playerid, "/house", "");
            new houseid = GetPVarInt(playerid, "p-house-manage");
            if(!Iter_Contains(House_iterator, houseid)) return 0;
            if(House[houseid][h_Owner] != PlayerInfo[playerid][pUID]) return sendErrorMessage(playerid, "Ten dom nie należy do Ciebie.");

            new price = GetPVarInt(playerid, "p-house-boost-price");
            if(price <= 0) price = House_GetSafeUpgradePrice(House[houseid][h_sejf_level]+1);
            if(kaska[playerid] < price) return sendErrorMessage(playerid, "Nie masz wystarczająco pieniędzy aby ulepszyć sejf.");
            ZabierzKase(playerid, price);
            new level = House[houseid][h_sejf_level] + 1;
            if(level > 5) level = 5;
            House[houseid][h_sejf_level] = level;
            House_Save(houseid);
            sendTipMessage(playerid, sprintf("Sejf ulepszony do poziomu %d. Pojemność: %d przedmiotów.", level, House_GetSafeCapacity(houseid)));
            _MruGracz(playerid, sprintf("Ulepszono sejf w domu %s na poziom %d", House[houseid][h_Name], level));
            Log(houseLog, INFO, "%s upgraded safe in house %s to level %d (-%d$)", GetPlayerLogName(playerid), GetHouseLogName(houseid), level, price);
            return 0;
        }
    }
    return 0;
}