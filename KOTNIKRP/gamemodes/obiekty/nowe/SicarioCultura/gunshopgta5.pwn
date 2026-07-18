//gunshopgta5.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: gunshopgta5.pwn ]--------------------------------------------//
//Autor: 
/*
	
*/
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

//

gunshopgta5_Init()
{
    StworzObiekty();
    StworzBudynki();
    return 1;
}

static StworzBudynki()
{
    DodajWejscie(1271.90, -812.85, 83.52, 337.95, -60.42, 1002.49, 300, 0, 0, 0, "ZAKAZ", "Wyjście");
    return 1;
}

static StworzObiekty()
{
    tmpobjid = CreateDynamicObject(19377, 347.904205, -59.424678, 1001.406188, 360.000000, 90.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling02_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19377, 338.274688, -59.414649, 1001.406188, 360.000000, 90.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling02_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 347.913177, -64.063873, 1003.182250, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 338.283203, -64.063873, 1003.182250, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 352.553070, -61.263862, 1003.182250, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 341.263122, -56.443859, 1003.182250, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19456, 350.893005, -56.443859, 1003.182250, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 337.263366, -66.653823, 1003.182250, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 340.343322, -51.653865, 1003.182250, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 337.611175, -55.645980, 1003.172119, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 336.081176, -63.405891, 1003.172119, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 336.081176, -57.165912, 1003.172119, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(1496, 337.265136, -61.860889, 1001.492126, 0.000000, 0.000000, 450.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19655, "mattubes", "reddirt1", 0x00000000); 
    tmpobjid = CreateDynamicObject(1496, 337.245239, -58.860916, 1001.492126, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19655, "mattubes", "reddirt1", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 337.611175, -64.925910, 1003.172119, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19444, 337.209899, -60.355304, 1003.302124, 90.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14600, "paperchase_bits2", "ab_medbag", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 335.731079, -61.925945, 1003.172119, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 335.731079, -58.785972, 1003.172119, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 335.721191, -60.395969, 1004.071960, 540.000000, 90.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19368, 337.250854, -60.395969, 1005.601928, 630.000000, 90.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(19456, 337.263366, -54.043842, 1003.182250, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "luxorceiling01_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(2475, 343.751617, -56.581493, 1001.442016, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2475, 342.261535, -56.581493, 1001.442016, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2475, 340.771575, -56.581493, 1001.442016, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2475, 339.281677, -56.581493, 1001.442016, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2448, 341.659393, -58.257606, 1000.951843, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2446, 344.064941, -58.233612, 1001.482116, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2448, 339.259552, -58.257606, 1000.951843, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(373, 343.223724, -56.729049, 1003.426940, -28.200012, -54.300064, -91.700096); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000); 
    tmpobjid = CreateDynamicObject(373, 342.453125, -56.729492, 1003.429199, -28.200012, -54.300064, -91.700096); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanacamo", 0x00000000); 
    tmpobjid = CreateDynamicObject(1651, 337.304016, -60.292301, 1003.633178, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19477, 337.358489, -60.323066, 1004.462585, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterialText_Kolejnosc(tmpobjid, "THANKS FOR VISITING", 0, 90, "Calibri", 30, 0, 0xFFFFFFFF, 0x00000000, 1); 
    tmpobjid = CreateDynamicObject(373, 342.071350, -56.728603, 1002.716735, -28.200012, -54.300064, -91.700096); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18868, "mobilephone4", "mobilephone4-3", 0x00000000); 
    tmpobjid = CreateDynamicObject(373, 342.626403, -56.709770, 1002.713684, -28.200012, -54.300064, -91.700096); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19107, "armyhelmets", "armyhelmet3", 0x00000000); 
    tmpobjid = CreateDynamicObject(2509, 339.783020, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 341.093078, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 342.403015, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 343.712921, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2448, 350.319061, -58.067657, 1000.951843, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2448, 350.319061, -60.457626, 1000.951843, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2448, 349.389160, -62.807613, 1000.951843, 0.000000, 0.000000, 540.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2446, 350.074920, -62.603561, 1001.482116, 0.000000, 0.000000, 360.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_metalpanel1", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2448, 347.226623, -62.838081, 1000.951843, 0.000000, 0.000000, 630.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(18035, 344.896118, -62.181842, 1004.400939, -0.100000, 0.000000, 90.099990); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2612, 337.332489, -59.289791, 1003.432373, 0.199999, 3.999999, 92.299972); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19962, "samproadsigns", "materialtext1", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19962, "samproadsigns", "materialtext1", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 19962, "samproadsigns", "materialtext1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2509, 348.152770, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 349.462677, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 350.772644, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 352.462768, -62.015998, 1002.952575, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 352.082702, -63.986022, 1002.952575, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 352.462768, -63.326011, 1002.952575, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 352.462768, -60.706005, 1002.952575, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 352.462768, -59.396015, 1002.952575, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2509, 352.462768, -58.086048, 1002.952575, 0.000000, 0.000000, 270.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 345.870452, -56.418346, 1001.551879, 900.000000, 90.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 348.090393, -56.418346, 1001.551879, 900.000000, 90.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 350.300354, -56.418346, 1001.551879, 900.000000, 90.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 352.230316, -56.418346, 1001.551879, 900.000000, 90.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 352.570465, -57.618358, 1001.551879, 900.000000, 90.000000, 1710.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19377, 347.904205, -59.744667, 1004.858642, 360.000000, 90.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 352.570465, -59.818389, 1001.551879, 900.000000, 90.000000, 1710.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 352.570465, -61.968421, 1001.551879, 900.000000, 90.000000, 1710.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19377, 338.284423, -58.874698, 1004.858642, 360.000000, 90.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 352.570465, -63.268436, 1001.551879, 900.000000, 90.000000, 1710.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 351.340637, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 349.160644, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 347.090759, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 344.840820, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 342.730865, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 340.520935, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 338.330963, -64.078422, 1001.551879, 900.000000, 90.000000, 1980.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 337.790954, -64.408409, 1001.551879, 900.000000, 90.000000, 2070.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 336.620941, -63.428382, 1001.551879, 900.000000, 90.000000, 2340.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(11711, 337.315734, -60.354557, 1004.152893, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 337.420806, -62.948364, 1001.551879, 900.000000, 90.000000, 2430.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 337.230773, -57.758373, 1001.551879, 900.000000, 90.000000, 2610.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 336.610778, -57.358367, 1001.551879, 900.000000, 90.000000, 2700.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 337.590728, -56.188400, 1001.551879, 900.000000, 90.000000, 2970.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 338.160736, -56.618396, 1001.551879, 900.000000, 90.000000, 3060.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2448, 347.226623, -64.398071, 1000.951843, 0.000000, 0.000000, 630.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 3, 16640, "a51", "ws_metalpanel1", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 343.842926, -63.934078, 1003.392761, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 3095, "a51jdrx", "sam_camo", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 342.832885, -63.934078, 1003.392761, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19063, "xmasorbs", "foil4-128x128", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 341.842895, -63.934078, 1003.392761, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19962, "samproadsigns", "streetsign", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 340.912933, -63.934078, 1003.392761, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19574, "sampfruits", "apple2", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 339.932952, -63.934078, 1003.392761, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampblack", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 339.932952, -63.934078, 1002.432312, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 18901, "matclothes", "hatmap3", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 2, 18901, "matclothes", "hattiger", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 340.913024, -63.934078, 1002.432312, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 1319, "ws_roadside_dyn1", "ws_roadpost", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 341.833038, -63.934078, 1002.432312, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19107, "armyhelmets", "armyhelmet3", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 342.853027, -63.934078, 1002.432312, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6283, "pierb_law2", "brownstar_law", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 18901, "matclothes", "bandanacamo", 0x00000000); 
    tmpobjid = CreateDynamicObject(2704, 343.863006, -63.934078, 1002.432312, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19107, "armyhelmets", "armyhelmet2", 0x00000000); 
    tmpobjid = CreateDynamicObject(19814, 344.709503, -63.974876, 1001.712219, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19814, 344.989501, -56.534893, 1001.712219, 0.000000, 0.000000, 360.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19814, 337.939666, -56.534893, 1001.712219, 0.000000, 0.000000, 360.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19921, 349.055938, -62.404983, 1001.792358, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19921, 342.985839, -58.645027, 1001.802368, 0.000000, 0.000000, 360.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(371, 341.201538, -56.802375, 1002.462036, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1", 0x00000000); 
    tmpobjid = CreateDynamicObject(371, 340.591461, -56.802375, 1002.462036, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(tmpobjid, 0, 19418, "police_things", "handcuffs01", 0x00000000); 
    tmpobjid = CreateDynamicObject(371, 339.971466, -56.802375, 1002.462036, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(tmpobjid, 0, 19160, "newhardhats", "hardhat2map", 0x00000000); 
    tmpobjid = CreateDynamicObject(371, 339.331451, -56.802375, 1002.462036, 0.000000, 0.000000, 0.000000);
    SetDynamicObjectMaterial(tmpobjid, 0, 19107, "armyhelmets", "armyhelmet2", 0x00000000); 
    tmpobjid = CreateDynamicObject(11714, 348.182983, -56.538646, 1002.722351, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(19590, 350.240936, -58.950351, 1002.272094, 360.000000, 90.000000, 6.400014); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 347.670471, -56.418346, 1004.022155, 900.000000, 90.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 348.660552, -56.418346, 1004.022155, 900.000000, 90.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 346.630554, -56.438335, 1002.971801, 1260.000000, 180.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 346.630554, -56.438335, 1000.751647, 1260.000000, 180.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 349.750518, -56.438335, 1000.751647, 1260.000000, 180.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(1897, 349.750518, -56.438335, 1002.962158, 1260.000000, 180.000000, 1440.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8396, "sphinx01", "sphinxbody01_128", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2645, 337.347839, -58.085063, 1003.221984, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14737, "whorewallstuff", "AH_dirtypix2", 0x00000000); 
    tmpobjid = CreateDynamicObject(2766, 345.750671, -56.534420, 1003.162536, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8057, "vgsswarehse02", "vgsScautionsign01", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 8057, "vgsswarehse02", "vgsScautionsign01", 0x00000000); 
    tmpobjid = CreateDynamicObject(1886, 337.701324, -57.784606, 1004.918151, 20.000000, 0.000000, 30.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2700, 352.203155, -58.600101, 1004.302246, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19894, "laptopsamp1", "laptopscreen3", 0x00000000); 
    tmpobjid = CreateDynamicObject(2615, 337.426239, -62.559204, 1002.731872, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2612, 345.542297, -63.929779, 1003.092041, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    tmpobjid = CreateDynamicObject(2387, 342.180084, -61.298286, 1001.492126, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 4, 1675, "wshxrefhse", "greygreensubuild_128", 0x00000000); 
    SetDynamicObjectMaterial(tmpobjid, 5, 1675, "wshxrefhse", "greygreensubuild_128", 0x00000000); 
    tmpobjid = CreateDynamicObject(2387, 340.940032, -61.298286, 1001.492126, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF); 
    SetDynamicObjectMaterial(tmpobjid, 4, 1675, "wshxrefhse", "greygreensubuild_128", 0x00000000); 
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    tmpobjid = CreateDynamicObject(2369, 344.319519, -58.141445, 1002.542846, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(373, 343.937316, -56.745429, 1003.425415, -28.200012, -54.300064, -91.700096); 
    tmpobjid = CreateDynamicObject(1209, 338.343261, -63.701175, 1001.462097, 0.000000, 0.000000, 180.000000); 
    tmpobjid = CreateDynamicObject(2047, 351.022277, -56.547885, 1002.602172, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2048, 351.063323, -56.553577, 1004.032226, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2369, 350.439605, -62.921440, 1002.512817, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(2488, 341.900665, -58.420139, 1002.061889, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(356, 352.365417, -61.931816, 1003.442993, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(357, 352.384887, -60.587585, 1003.432617, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(358, 352.399841, -59.265964, 1003.412658, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(353, 352.404693, -63.102588, 1003.412719, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(355, 352.391052, -61.857395, 1002.691894, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(349, 352.356353, -60.527309, 1002.722167, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(351, 352.390197, -58.940174, 1002.572326, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(352, 352.389465, -63.258316, 1002.782348, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(334, 350.122589, -57.866436, 1002.262084, 270.000000, 90.000000, -8.200004); 
    tmpobjid = CreateDynamicObject(334, 350.168914, -58.176212, 1002.262084, 270.000000, 90.000000, -8.200004); 
    tmpobjid = CreateDynamicObject(334, 350.155883, -58.477424, 1002.262084, 270.000000, 90.000000, -8.200004); 
    tmpobjid = CreateDynamicObject(336, 347.975280, -63.984436, 1002.843444, -4.999999, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19631, 348.326995, -63.931060, 1003.082153, 270.000000, 270.000000, 540.000000); 
    tmpobjid = CreateDynamicObject(19914, 348.640441, -63.974338, 1002.742370, 0.000000, 270.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19994, 345.940948, -57.067260, 1001.452148, 0.000000, 0.000000, -2.699999); 
    tmpobjid = CreateDynamicObject(3052, 346.325317, -63.660003, 1001.612243, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(359, 351.480163, -64.014823, 1003.472595, 0.000000, 0.000000, 0.000000);
    tmpobjid = CreateDynamicObject(360, 351.543945, -63.969329, 1002.642089, 0.000000, 0.000000, 0.000000);
    tmpobjid = CreateDynamicObject(346, 350.180847, -62.051555, 1002.210510, 89.800125, 0.000000, 1.100000); 
    tmpobjid = CreateDynamicObject(362, 349.153564, -63.669940, 1003.544311, -95.200012, 30.499998, 0.000000); 
    tmpobjid = CreateDynamicObject(347, 350.032043, -61.743160, 1002.211730, 90.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(348, 350.037139, -61.456993, 1002.222717, 90.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(372, 350.042327, -61.103973, 1002.232727, 90.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(11745, 340.666595, -56.765213, 1003.092468, 0.000000, 0.000000, -88.800018); 
    tmpobjid = CreateDynamicObject(352, 350.139495, -60.504253, 1002.242370, 90.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(11745, 339.736755, -56.784702, 1003.092468, 0.000000, 0.000000, -88.800018); 
    tmpobjid = CreateDynamicObject(350, 352.412628, -57.922393, 1003.349426, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(339, 350.192016, -58.512886, 1001.941833, 90.000000, 0.000000, 540.000000); 
    tmpobjid = CreateDynamicObject(335, 349.920318, -59.375797, 1002.202575, 90.000000, 0.000000, 360.000000); 
    tmpobjid = CreateDynamicObject(1672, 349.455230, -62.635669, 1002.302368, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2058, 339.996582, -58.366439, 1002.552612, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(365, 349.143646, -62.709014, 1002.362731, 0.000000, 0.000000, 0.000000);
    tmpobjid = CreateDynamicObject(2059, 346.997436, -63.095306, 1002.542480, 0.000000, 0.000000, 77.999977); 
    tmpobjid = CreateDynamicObject(363, 349.048095, -62.835281, 1002.297485, -94.999977, 0.000000, -176.300048); 
    tmpobjid = CreateDynamicObject(342, 348.488250, -62.812339, 1002.276977, 1.699998, -15.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2057, 339.981536, -56.747463, 1003.793579, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2690, 352.330871, -56.659122, 1001.828063, 0.999998, -5.000000, -83.399986); 
    tmpobjid = CreateDynamicObject(2060, 337.570190, -58.030151, 1001.502136, 0.000000, 0.000000, -93.099975); 
    tmpobjid = CreateDynamicObject(2060, 337.570190, -58.030151, 1001.682128, 0.000000, 0.000000, -93.099975); 
    tmpobjid = CreateDynamicObject(2060, 337.570190, -58.030151, 1001.892333, 0.000000, 0.000000, -93.099975); 
    tmpobjid = CreateDynamicObject(2060, 337.570190, -58.030151, 1002.122558, 0.000000, 0.000000, -93.099975); 
    tmpobjid = CreateDynamicObject(1654, 348.072448, -62.707225, 1002.332519, 270.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(331, 348.215393, -63.944526, 1003.752624, 0.000000, 0.000000, 0.000000);
    tmpobjid = CreateDynamicObject(343, 347.647705, -62.812812, 1002.292907, 0.000000, 0.000000, 0.000000);
    tmpobjid = CreateDynamicObject(344, 347.731170, -63.960430, 1003.212890, 0.000000, 0.000000, 0.000000);
    tmpobjid = CreateDynamicObject(18637, 352.395782, -57.980331, 1002.772155, 90.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(18641, 339.253540, -58.390937, 1002.252563, 270.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(18641, 339.463531, -58.390937, 1002.252563, 270.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19421, 343.205108, -58.340049, 1002.212646, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19422, 342.911865, -58.358352, 1002.222839, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19423, 342.581787, -58.338356, 1002.222778, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19424, 342.251831, -58.338356, 1002.222534, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19515, 343.362823, -56.732059, 1002.512084, 0.000000, 270.000000, 180.000000); 
    tmpobjid = CreateDynamicObject(18075, 351.833740, -58.165645, 1004.832153, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(18075, 341.393798, -58.165645, 1004.832153, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2051, 337.344970, -61.162445, 1003.232543, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(2055, 337.378936, -62.571006, 1003.632873, 0.000000, 0.000000, 90.000000);
    return 1;
}