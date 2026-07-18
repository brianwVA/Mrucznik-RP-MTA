//exterior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Obiekty: exterior.pwn ]-------------------------------------------//
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
//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
/*
    Exported on "2021-07-03 12:13:58" by "Mat_Drep"
	Created by "Mat_Drep"
*/

stock sasc2021exterior_Init()
{
    StworzObiekty();
    return 1;
}

static StworzObiekty()
{
    tmpobjid = CreateDynamicObjectEx(3881, 2697.842529, -1704.544433, 12.395876, 0.000000, 0.000000, 491.500091, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 4, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3881, 2692.543212, -1709.208007, 12.395876, 0.000000, 0.000000, 131.500091, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 4, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 2780.142333, -1815.878417, 22.580335, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} San Andreas", 130, "Ariel", 70, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObjectEx(19450, 2779.489257, -1816.229492, 22.160726, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19450, 2784.797607, -1812.126953, 22.160726, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 2784.175537, -1812.760864, 22.550323, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Song Contest", 130, "Ariel", 70, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObjectEx(8649, 2858.531982, -1837.733642, 10.894131, 0.000000, 0.000000, 147.100006, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 2782.110107, -1814.356567, 21.370330, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "{ff1a8c} 2021", 130, "Ariel", 70, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObjectEx(19325, 387.414703, -2053.301025, 11.827382, 0.000000, 0.000000, 0.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(902, 387.771209, -2053.262207, 12.615949, 90.000000, 0.099999, 270.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 387.394683, -2053.301025, 11.107375, 0.000000, 0.000000, 0.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Los Santos - gospodarz \n San Andreas Song Contest \n 2021", 140, "Calibri", 45, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObjectEx(19325, 2234.581787, -1735.015869, 20.030313, 0.000000, 0.000000, -0.499998, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 2234.551757, -1735.015502, 21.180315, 0.000000, 0.000000, -0.499998, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Los Santos - gospodarz \n San Andreas Song Contest \n 2021! Witamy!", 140, "Calibri", 50, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObjectEx(902, 2234.795654, -1734.914184, 19.233348, 90.000000, 0.000000, 270.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 2235.122314, -1735.021362, 20.030313, 0.000000, 0.000000, 179.500000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19325, 2235.132324, -1735.020141, 21.060329, 0.000000, 0.000000, 179.500000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Los Santos - gospodarz \n San Andreas Song Contest \n 2021! Witamy!", 140, "Engravers MT", 40, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObjectEx(902, 2234.915771, -1734.914184, 19.233348, 90.000000, 0.000000, 450.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2814.729492, -1843.495483, 13.983676, 0.000000, 0.000000, 90.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2813.818603, -1855.227539, 13.983676, 0.000000, 0.000000, 270.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 1908.204223, -1748.184936, 16.441545, 0.000000, 0.000000, 90.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 1972.022216, -1756.605957, 16.441545, 0.000000, 0.000000, 270.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2031.539794, -1748.145141, 16.381544, 0.000000, 0.000000, 450.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2143.701416, -1748.145141, 16.381544, 0.000000, 0.000000, 450.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2225.172607, -1737.291992, 16.381544, 0.000000, 0.000000, 630.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2270.774169, -1737.291992, 16.381544, 0.000000, 0.000000, 630.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2333.744384, -1737.291992, 16.381544, 0.000000, 0.000000, 630.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2396.687255, -1737.291992, 16.381544, 0.000000, 0.000000, 630.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(3853, 2473.577880, -1737.291992, 16.381544, 0.000000, 0.000000, 630.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19336, 2794.874023, -1783.082519, 72.693618, 0.000000, 0.000000, 0.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 3, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19450, 2781.555664, -1814.634399, 25.060714, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(19450, 2782.843505, -1813.638916, 25.060714, 0.000000, 0.000000, 127.699951, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
    tmpobjid = CreateDynamicObjectEx(902, 2782.128906, -1814.349243, 25.038394, 90.000000, -57.400032, 90.000000, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObjectEx(997, 2785.725341, -1830.726806, 8.888187, 0.000000, 0.000000, 41.200023, 300.00, 300.00); 
    tmpobjid = CreateDynamicObjectEx(997, 2794.388671, -1822.625366, 8.888187, 0.000000, 0.000000, 41.200023, 300.00, 300.00); 
    tmpobjid = CreateDynamicObjectEx(997, 2791.279296, -1825.347290, 8.888187, 0.000000, 0.000000, 41.200023, 300.00, 300.00); 
    tmpobjid = CreateDynamicObjectEx(997, 2788.827392, -1827.495605, 8.888187, 0.000000, 0.000000, 41.200023, 300.00, 300.00); 
    return 1;
}

