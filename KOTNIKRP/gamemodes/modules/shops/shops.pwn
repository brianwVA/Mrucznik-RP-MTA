
// Opis: System legalnych sklepow - punkty skupu craftowanych produktow dla cywili

#include <YSI_Coding\y_hooks>

//------------------<[ Funkcje: ]>-------------------

stock Shops_Add(const name[], type, Float:x, Float:y, Float:z, Float:angle, interior = 0, virtualworld = 0)
{
    if(gTotalLegalShops >= MAX_LEGAL_SHOPS) return -1;
    
    new id = gTotalLegalShops;
    
    gLegalShops[id][shop_id] = id;
    format(gLegalShops[id][shop_name], 48, name);
    gLegalShops[id][shop_type] = type;
    gLegalShops[id][shop_x] = x;
    gLegalShops[id][shop_y] = y;
    gLegalShops[id][shop_z] = z;
    gLegalShops[id][shop_angle] = angle;
    gLegalShops[id][shop_interior] = interior;
    gLegalShops[id][shop_virtualworld] = virtualworld;
    
    // Utworz pickup
    gLegalShops[id][shop_pickup] = CreateDynamicPickup(1274, 1, x, y, z, virtualworld, interior);
    
    // Utworz obszar
    gLegalShops[id][shop_area] = CreateDynamicCircle(x, y, 3.0);
    
    // Utworz label
    new szLabel[150];
    format(szLabel, sizeof(szLabel), "{00FF00}%s\n{FFFFFF}Sklep Legalny\n{AAAAAA}Uzyj: {FFFFFF}/sellshop", name);
    gLegalShops[id][shop_label] = CreateDynamic3DTextLabel(szLabel, 0xFFFFFFFF, x, y, z + 0.5, 10.0, 
        INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, virtualworld, interior, -1, 20.0);
    
    gTotalLegalShops++;
    return id;
}

stock Shops_GetNearest(playerid, Float:range = 3.0)
{
    for(new i = 0; i < gTotalLegalShops; i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, range, gLegalShops[i][shop_x], gLegalShops[i][shop_y], gLegalShops[i][shop_z]))
        {
            if(GetPlayerInterior(playerid) == gLegalShops[i][shop_interior] &&
               GetPlayerVirtualWorld(playerid) == gLegalShops[i][shop_virtualworld])
                return i;
        }
    }
    return -1;
}

stock Shops_GetProductTypeName(productType)
{
    new szName[24] = "Nieznany";
    switch(productType)
    {
        case SHOP_PRODUCT_TOOLS: szName = "Narzedzia";
        case SHOP_PRODUCT_CLOTHES: szName = "Ubrania";
        case SHOP_PRODUCT_FURNITURE: szName = "Meble";
        case SHOP_PRODUCT_ELECTRONICS: szName = "Elektronika";
    }
    return szName;
}

stock Shops_GetItemTypeFromProduct(productType)
{
    switch(productType)
    {
        case SHOP_PRODUCT_TOOLS: return ITEM_TYPE_TOOLS;
        case SHOP_PRODUCT_CLOTHES: return ITEM_TYPE_CLOTHES;
        case SHOP_PRODUCT_FURNITURE: return ITEM_TYPE_FURNITURE;
        case SHOP_PRODUCT_ELECTRONICS: return ITEM_TYPE_ELECTRONICS;
    }
    return -1;
}

stock Shops_GetProductTypeFromItem(itemType)
{
    switch(itemType)
    {
        case ITEM_TYPE_TOOLS: return SHOP_PRODUCT_TOOLS;
        case ITEM_TYPE_CLOTHES: return SHOP_PRODUCT_CLOTHES;
        case ITEM_TYPE_FURNITURE: return SHOP_PRODUCT_FURNITURE;
        case ITEM_TYPE_ELECTRONICS: return SHOP_PRODUCT_ELECTRONICS;
    }
    return -1;
}

stock Shops_GetBuyPrice(productType)
{
    if(productType < 0 || productType >= 4) return 0;
    return gShopBuyPrices[productType];
}

stock Shops_CanShopBuyType(shopid, productType)
{
    if(shopid < 0 || shopid >= gTotalLegalShops) return 0;
    
    // Sklep uniwersalny skupuje wszystko
    if(gLegalShops[shopid][shop_type] == SHOP_TYPE_UNIVERSAL) return 1;
    
    // Sprawdz czy sklep specjalizuje sie w tym typie produktu
    return (gLegalShops[shopid][shop_type] == productType);
}

stock Shops_RandomizePrices()
{
    // Ceny skupu = koszt materialow + 30-40% zysku
    // Narzedzia: 3 fabrics ($120-150) + 2 metals ($70-100) = koszt $500-650 -> skup $650-850 (+30% zysku)
    gShopBuyPrices[SHOP_PRODUCT_TOOLS] = SHOP_PRICE_TOOLS_MIN + random(SHOP_PRICE_TOOLS_MAX - SHOP_PRICE_TOOLS_MIN + 1);
    
    // Ubrania: 5 fabrics ($120-150) = koszt $600-750 -> skup $800-1000 (+33% zysku)
    gShopBuyPrices[SHOP_PRODUCT_CLOTHES] = SHOP_PRICE_CLOTHES_MIN + random(SHOP_PRICE_CLOTHES_MAX - SHOP_PRICE_CLOTHES_MIN + 1);
    
    // Meble: 3 mats ($30-50) + 2 metals ($70-100) = koszt $230-350 -> skup $300-450 (+30% zysku)
    gShopBuyPrices[SHOP_PRODUCT_FURNITURE] = SHOP_PRICE_FURNITURE_MIN + random(SHOP_PRICE_FURNITURE_MAX - SHOP_PRICE_FURNITURE_MIN + 1);
    
    // Elektronika: 2 metals ($70-100) + 1 chemicals ($400-600) = koszt $540-800 -> skup $700-1000 (+30% zysku)
    gShopBuyPrices[SHOP_PRODUCT_ELECTRONICS] = SHOP_PRICE_ELECTRONICS_MIN + random(SHOP_PRICE_ELECTRONICS_MAX - SHOP_PRICE_ELECTRONICS_MIN + 1);
    
    printf("[SHOPS] Wylosowano ceny: Narzedzia=$%d, Ubrania=$%d, Meble=$%d, Elektronika=$%d",
        gShopBuyPrices[SHOP_PRODUCT_TOOLS],
        gShopBuyPrices[SHOP_PRODUCT_CLOTHES],
        gShopBuyPrices[SHOP_PRODUCT_FURNITURE],
        gShopBuyPrices[SHOP_PRODUCT_ELECTRONICS]);
}

stock Shops_ShowSellMenu(playerid)
{
    new shopid = Shops_GetNearest(playerid);
    if(shopid == -1)
        return sendErrorMessage(playerid, "Nie jestes przy zadnym sklepie.");
    
    // Znajdz przedmioty gracza ktore mozna sprzedac
    new szDialog[600], count = 0;
    
    szDialog[0] = '\0'; // Wyzeruj string
    
    // Sprawdz kazdy typ produktu
    new productTypes[] = {SHOP_PRODUCT_TOOLS, SHOP_PRODUCT_CLOTHES, SHOP_PRODUCT_FURNITURE, SHOP_PRODUCT_ELECTRONICS};
    
    for(new i = 0; i < sizeof(productTypes); i++)
    {
        // Sprawdz czy sklep skupuje ten typ
        if(!Shops_CanShopBuyType(shopid, productTypes[i])) continue;
        
        new itemType = Shops_GetItemTypeFromProduct(productTypes[i]);
        new itemId = HasItemType(playerid, itemType);
        
        if(itemId != -1)
        {
            new amount = Item[itemId][i_Quantity];
            if(amount <= 0) amount = 1;
            
            new price = Shops_GetBuyPrice(productTypes[i]);
            if(price <= 0 || amount > 100000000 / price) continue;
            new totalPrice = price * amount;
            
            new szLine[100];
            format(szLine, sizeof(szLine), "%s (x%d) - {00FF00}$%d\n", 
                Shops_GetProductTypeName(productTypes[i]), amount, totalPrice);
            strcat(szDialog, szLine);
            count++;
        }
    }
    
    if(count == 0)
    {
        return sendErrorMessage(playerid, "Nie masz zadnych produktow do sprzedania.");
    }
    
    ShowPlayerDialog(playerid, DIALOG_SHOP_SELL_PRODUCT, DIALOG_STYLE_LIST, 
        "Sprzedaj Produkty", szDialog, "Sprzedaj", "Anuluj");
    
    return 1;
}

//------------------<[ Hooki: ]>-------------------

hook OnGameModeInit()
{
    // Randomize shop prices
    Shops_RandomizePrices();
    
    // Initialize shops
    for(new i = 0; i < MAX_LEGAL_SHOPS; i++)
    {
        gLegalShops[i][shop_pickup] = -1;
        gLegalShops[i][shop_area] = -1;
        gLegalShops[i][shop_label] = Text3D:-1;
    }
    
    // Load shops (with delay for database)
    SetTimerEx("Shops_Load", 3000, false, "");
    
    print("[SHOPS] System sklepow legalnych zaladowany.");
    return 1;
}

//------------------<[ Publiczne: ]>-------------------

forward Shops_Load();
public Shops_Load()
{
    // Los Santos - Strefa przemyslowa
    Shops_Add("LS Sklep Przemyslowy", SHOP_TYPE_UNIVERSAL, 2135.5, -1150.2, 24.0, 90.0, 0, 0);
    
    // San Fierro - Centrum handlowe
    Shops_Add("SF Centrum Handlowe", SHOP_TYPE_UNIVERSAL, -1980.4, 111.5, 27.7, 180.0, 0, 0);
    
    // Las Venturas - Strefa przemyslowa
    Shops_Add("LV Strefa Przemyslowa", SHOP_TYPE_UNIVERSAL, 2085.9, 2070.8, 10.8, 0.0, 0, 0);
    
    // Wyspecjalizowane sklepy
    Shops_Add("Narzedzia i Hardware", SHOP_TYPE_TOOLS, 2222.1, -1337.2, 23.9, 270.0, 0, 0);
    Shops_Add("Sklep z Ubraniami", SHOP_TYPE_CLOTHES, 2071.2, -1831.4, 13.5, 0.0, 0, 0);
    Shops_Add("Sklep z Meblami", SHOP_TYPE_FURNITURE, -2027.4, 156.5, 28.8, 180.0, 0, 0);
    Shops_Add("Sklep z Elektronika", SHOP_TYPE_ELECTRONICS, 2135.5, 2358.7, 10.8, 0.0, 0, 0);
    
    printf("[SHOPS] Zaladowano %d sklepow legalnych.", gTotalLegalShops);
    return 1;
}

//------------------<[ Dialogi: ]>-------------------

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_SHOP_SELL_PRODUCT)
    {
        if(!response) return 1;
        
        new shopid = Shops_GetNearest(playerid);
        if(shopid == -1)
            return sendErrorMessage(playerid, "Oddaliles sie od sklepu.");
        
        // Znajdz produkt na podstawie listitem
        new productTypes[] = {SHOP_PRODUCT_TOOLS, SHOP_PRODUCT_CLOTHES, SHOP_PRODUCT_FURNITURE, SHOP_PRODUCT_ELECTRONICS};
        new selectedType = -1;
        new currentIndex = 0;
        
        for(new i = 0; i < sizeof(productTypes); i++)
        {
            if(!Shops_CanShopBuyType(shopid, productTypes[i])) continue;
            
            new itemType = Shops_GetItemTypeFromProduct(productTypes[i]);
            new itemId = HasItemType(playerid, itemType);
            
            if(itemId != -1)
            {
                if(currentIndex == listitem)
                {
                    selectedType = productTypes[i];
                    break;
                }
                currentIndex++;
            }
        }
        
        if(selectedType == -1)
            return sendErrorMessage(playerid, "Nie znaleziono produktu.");
        
        new itemType = Shops_GetItemTypeFromProduct(selectedType);
        new itemId = HasItemType(playerid, itemType);
        
        if(itemId == -1)
            return sendErrorMessage(playerid, "Nie masz juz tego produktu.");
        
        new amount = Item[itemId][i_Quantity];
        if(amount <= 0) amount = 1;
        
        new price = Shops_GetBuyPrice(selectedType);
        if(price <= 0 || amount <= 0 || amount > 100000000 / price)
            return sendErrorMessage(playerid, "Ilosc lub wartosc produktu jest nieprawidlowa.");
        new totalPrice = price * amount;
        
        // Usun przedmiot i daj pieniadze
        Item_Delete(itemId, true, amount);
        DajKaseDone(playerid, totalPrice);
        
        va_SendClientMessage(playerid, COLOR_GREEN, "* Sprzedales %s (x%d) za $%d.", 
            Shops_GetProductTypeName(selectedType), amount, totalPrice);
        
        // Log transakcji
        Log(payLog, WARNING, "%s sprzedal w sklepie legalnym: %s (x%d) za $%d. Sklep: %s [ID:%d]",
            GetPlayerLogName(playerid),
            Shops_GetProductTypeName(selectedType),
            amount,
            totalPrice,
            gLegalShops[shopid][shop_name],
            shopid);
        
        Log(itemLog, WARNING, "%s sprzedal przedmiot w sklepie: %s (x%d), Item UID: %d",
            GetPlayerLogName(playerid),
            Shops_GetProductTypeName(selectedType),
            amount,
            Item[itemId][i_UID]);
        
        new szAction[128];
        format(szAction, sizeof(szAction), "* %s sprzedaje produkty w sklepie.", GetNick(playerid));
        ProxDetector(20.0, playerid, szAction, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        
        return 1;
    }
    return 1;
}

//------------------<[ Komendy: ]>-------------------

YCMD:sellshop(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /sellshop - sprzedaj craftowane produkty w legalnym sklepie");
    
    return Shops_ShowSellMenu(playerid);
}

YCMD:shops(playerid, params[], help)
{
    if(help) return SendClientMessage(playerid, COLOR_GREY, "Uzycie: /shops - lista sklepow i cen skupu");
    
    SendClientMessage(playerid, COLOR_GREEN, "=== SKLEPY LEGALNE - CENY SKUPU ===");
    va_SendClientMessage(playerid, COLOR_WHITE, "Narzedzia: $%d | Ubrania: $%d", 
        gShopBuyPrices[SHOP_PRODUCT_TOOLS],
        gShopBuyPrices[SHOP_PRODUCT_CLOTHES]);
    va_SendClientMessage(playerid, COLOR_WHITE, "Meble: $%d | Elektronika: $%d", 
        gShopBuyPrices[SHOP_PRODUCT_FURNITURE],
        gShopBuyPrices[SHOP_PRODUCT_ELECTRONICS]);
    SendClientMessage(playerid, COLOR_GREY, "Craftuj produkty w swojej skrytce aby je tutaj sprzedac.");
    
    return 1;
}

//end
