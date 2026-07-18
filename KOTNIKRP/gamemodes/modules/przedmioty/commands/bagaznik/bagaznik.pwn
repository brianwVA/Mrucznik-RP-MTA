//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                 bagaznik                                                //
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


//-------<[ include ]>-------

//-------<[ initialize ]>-------

//-------<[ command ]>-------

YCMD:bagaznik(playerid, params[], help)
{
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
        return sendErrorMessage(playerid, "Musisz być pieszo.");
    new vehicleid = GetClosestCar(playerid);
    if(vehicleid == -1)
        return sendErrorMessage(playerid, "Nie znajdujesz się przy żadnym pojeździe!");
    if(!Car_IsValid(vehicleid) || !IsCarOwner(playerid, vehicleid) && strcmp(params, "przeszukaj", true))
        return sendErrorMessage(playerid, "Ten pojazd nie należy do Ciebie.");
    if(!IsPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_TRUNK, 1.0))
    {
        new Float:x, Float:y, Float:z;
        GetPosNearVehiclePart(vehicleid, VEH_PART_TRUNK, x, y, z);
        SetPlayerCheckpoint(playerid, x, y, z, 1.5);
        return sendErrorMessage(playerid, "Nie znajdujesz się przy bagażniku! (został on oznaczony na mapie)");
    }
    new vehicleUID = CarData[VehicleUID[vehicleid][vUID]][c_UID];
    if(vehicleUID == 0)
        return sendErrorMessage(playerid, "Ten pojazd nie istnieje.");
    if(isnull(params)) //show dialog
    {
        sendTipMessage(playerid, "Użyj: /bagaznik [wyciągnij | schowaj | przeszukaj]");

        new string[1024], itemCount = 0;
        DynamicGui_Init(playerid);
        foreach(new i : Items)
        {
            if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_VEHICLE || Item[i][i_Owner] != vehicleUID) continue;
            if(itemCount > MAX_VEHICLE_ITEMS) break;
            format(string, sizeof(string), "%s\n%s (x%d)", string, Item[i][i_Name], Item[i][i_Quantity]);
            DynamicGui_AddRow(playerid, i);
            itemCount++;
        }
        if(itemCount < MAX_VEHICLE_ITEMS) {
            strcat(string, "\n»» Schowaj przedmiot");
            DynamicGui_AddRow(playerid, -1);
        }
        SetPVarInt(playerid, "bagaznik-id", vehicleid);
        ShowPlayerDialogEx(playerid, D_ITEM_VEHICLE_ITEMS, DIALOG_STYLE_LIST, MruTitle("Bagażnik"), string, "Wyciągnij", "Zamknij");

        //Efekty wizualne
        SetTrunkState(playerid, vehicleid, 1);
        return 1;
    }
    
    //Wyciągnij, Schowaj, Przeszukaj
    if(!strcmp(params, "wyciagnij", true) || !strcmp(params, "wyciągnij", true))
    {
        new string[1024], itemCount = 0;
        DynamicGui_Init(playerid);
        foreach(new i : Items)
        {
            if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_VEHICLE || Item[i][i_Owner] != vehicleUID) continue;
            if(itemCount > MAX_VEHICLE_ITEMS) break;
            format(string, sizeof(string), "%s\n%s (x%d)", string, Item[i][i_Name], Item[i][i_Quantity]);
            DynamicGui_AddRow(playerid, i);
            itemCount++;
        }
        if(itemCount < 1)
            return sendErrorMessage(playerid, "W tym bagażniku nie ma żadnych przedmiotów!");
        SetPVarInt(playerid, "bagaznik-id", vehicleid);
        ShowPlayerDialogEx(playerid, D_ITEM_VEHICLE_ITEMS, DIALOG_STYLE_LIST, MruTitle("Bagażnik"), string, "Wyciągnij", "Zamknij");
        SetTrunkState(playerid, vehicleid, 1);
        return 1;
    }
    else if(!strcmp(params, "schowaj", true))
    {
        if(BagaznikCount(vehicleUID) >= MAX_VEHICLE_ITEMS)
            return sendErrorMessage(playerid, "W tym bagażniku nie zmieści się więcej przedmiotów.");
        SetPVarInt(playerid, "bagaznik-id", vehicleid);
        new string[1024];
        DynamicGui_Init(playerid);
        foreach(new x : PlayerItems[playerid])
        {
            new i = PlayerItem[playerid][x][player_item_id];
            if(i == -1) continue;
            if(!Item[i][i_UID] || Item[i][i_Owner] != PlayerInfo[playerid][pUID]) continue;
            if(!CanGive(playerid, Item[i][i_ItemType], i)) continue;
            format(string, sizeof(string), "%s\n(%d) %s (x%d)", string, i, Item[i][i_Name], Item[i][i_Quantity]);
            DynamicGui_AddRow(playerid, i);
        }
        if(isnull(string))
            return sendTipMessage(playerid, "Nie posiadasz żadnych przedmiotów!");
        ShowPlayerDialogEx(playerid, D_TRUNK_ITEMS, DIALOG_STYLE_LIST, MruTitle("Schowaj przedmiot"), string, "Schowaj", "Zamknij");
        SetTrunkState(playerid, vehicleid, 1);
        return 1;
    }
    else if(!strcmp(params, "przeszukaj", true))
    {
        if(!IsAPolicja(playerid))
            return sendTipMessage(playerid, "Nie jesteś na służbie grupy z takimi uprawnieniami!");
        new string[1024];
        foreach(new i : Items)
        {
            if(!Item[i][i_UID]) continue;
            if(Item[i][i_OwnerType] != ITEM_OWNER_TYPE_VEHICLE || Item[i][i_Owner] != vehicleUID) continue;

            format(string, sizeof(string), "%s\n(%d) %s", string, i, Item[i][i_Name]);
        }
        if(isnull(string))
            return sendErrorMessage(playerid, "W tym pojeździe nie ma żadnych przedmiotów!");
        ShowPlayerDialogEx(playerid, 0, DIALOG_STYLE_LIST, MruTitle("Bagażnik - Przedmioty"), string, "OK", #);
        RunCommand(playerid, "ja", "przeszukuje bagażnik");
        return 1;
    }
    return 1;
}