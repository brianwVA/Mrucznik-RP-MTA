//sicariocultura.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: sicariocultura.pwn ]--------------------------------------------//
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

SicarioCultura_Init()
{
    StworzObiekty();
    return 1;
}

static StworzObiekty()
{
    tmpobjid = CreateDynamicObject(14534, 2353.555175, 1315.673339, -73.598892, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 2, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 15048, "labigsave", "AH_carpet4kb", 0x00000000);
    tmpobjid = CreateDynamicObject(2205, 2357.254394, 1313.669433, -73.041793, 0.000000, 0.000000, 360.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2204, 2358.937255, 1311.211181, -73.027069, 0.000000, 0.000000, 540.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2315, 2351.523681, 1319.040161, -73.025276, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2606, 2355.223144, 1312.884765, -70.848739, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 10, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    tmpobjid = CreateDynamicObject(19474, 2357.848388, 1319.649658, -72.455146, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 2, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2120, 2355.777587, 1319.652954, -72.405647, 0.000000, 0.000000, 180.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2120, 2359.999267, 1319.652954, -72.375740, 0.000000, 0.000000, 360.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2120, 2358.438964, 1318.192138, -72.385711, 0.000000, 0.000000, 630.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2120, 2357.228271, 1318.182006, -72.395500, 0.000000, 0.000000, 630.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2120, 2358.438964, 1321.132934, -72.375823, 0.000000, 0.000000, 810.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2120, 2357.228271, 1321.142944, -72.385620, 0.000000, 0.000000, 810.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2195, 2354.432373, 1315.895141, -72.385147, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2241, 2349.661132, 1318.101440, -72.525169, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2195, 2360.373291, 1321.496337, -72.385147, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(1823, 2349.100585, 1318.100097, -73.031463, 0.000000, 0.000000, 90.000000); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2241, 2346.659667, 1312.471801, -72.525169, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2241, 2354.402099, 1314.112304, -75.145141, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    tmpobjid = CreateDynamicObject(2241, 2354.402099, 1309.832031, -75.145141, 0.000000, 0.000000, 0.000000); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14806, "bdupshifi", "Bdup2_wood", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(19172, 2360.771728, 1313.402709, -70.830337, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(1726, 2349.958740, 1318.779418, -73.008125, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(1714, 2358.013183, 1312.148925, -73.037849, 0.000000, 0.000000, 225.000000); 
    tmpobjid = CreateDynamicObject(1727, 2356.319335, 1314.512695, -73.057991, 0.000000, 0.000000, 810.000000); 
    tmpobjid = CreateDynamicObject(1727, 2353.006835, 1319.712768, -73.027969, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(1727, 2353.007812, 1320.893188, -73.027976, 0.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(1727, 2359.540527, 1315.523437, -73.078025, 0.000000, 0.000000, 990.000000); 
    tmpobjid = CreateDynamicObject(1827, 2357.917968, 1315.030639, -73.094566, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(1829, 2360.097412, 1311.970825, -72.544532, 0.000000, 0.000000, 180.000000); 
    tmpobjid = CreateDynamicObject(19893, 2357.954833, 1313.465209, -72.123435, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2267, 2349.392333, 1319.779907, -70.701248, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(1550, 2356.172851, 1311.370483, -72.662490, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19173, 2357.878662, 1321.761108, -70.595664, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2059, 2357.862060, 1315.230102, -72.640007, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2059, 2351.399658, 1320.011596, -72.519989, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(19173, 2354.770751, 1312.094360, -73.760169, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(19787, 2351.539062, 1321.900878, -71.027511, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(2967, 2358.614257, 1313.515380, -72.111450, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(1726, 2348.487304, 1321.471923, -73.018226, 360.000000, 0.000000, 270.000000); 
    tmpobjid = CreateDynamicObject(1670, 2351.523437, 1319.115600, -72.509414, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(1670, 2357.053955, 1313.705566, -72.069442, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(2853, 2348.574218, 1318.649902, -72.535530, 0.000000, 0.000000, 90.000000); 
    tmpobjid = CreateDynamicObject(1557, 2346.996337, 1314.494873, -78.221755, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(19468, 2360.338623, 1318.438964, -71.190299, 0.000000, 0.000000, 0.000000); 
    tmpobjid = CreateDynamicObject(356, 2347.595458, 1309.646240, -75.480010, -4.299996, 0.099999, 2.900000); 
    tmpobjid = CreateDynamicObject(356, 2358.957275, 1319.848144, -71.885635, -99.699974, -38.200050, 109.100082); 
    tmpobjid = CreateDynamicObject(19468, 2351.728271, 1320.768554, -72.440315, 0.000000, 0.000000, 0.000000); 
    return 1;
}