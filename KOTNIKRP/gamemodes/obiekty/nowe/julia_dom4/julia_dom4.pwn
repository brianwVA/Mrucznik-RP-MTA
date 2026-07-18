//julia_dom4.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: julia_dom4.pwn ]--------------------------------------------//
//Autor: Julia
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

//-----------------<[ Main functions: ]>-------------------
julia_dom4_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

julia_dom4_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19353, 2133.164306, -1279.633178, 26.551132, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2129.980468, -1279.629272, 26.550622, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2126.770263, -1279.629272, 26.550622, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2125.074462, -1278.113891, 26.551132, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2125.080078, -1271.708496, 26.550622, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2125.074462, -1274.903442, 26.551132, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2126.765869, -1270.121948, 26.551132, 0.000000, 0.000000, 270.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2129.980468, -1270.129272, 26.550622, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2133.142822, -1270.129272, 26.550622, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2134.842285, -1274.861694, 26.542367, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2130.035156, -1274.869506, 24.767580, 0.000000, 90.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18882, "hugebowls", "woodpanel1", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2132.622314, -1278.971191, 26.553533, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2132.631591, -1276.572753, 26.553533, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2133.983154, -1275.060546, 26.553533, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2131.590576, -1275.061889, 26.553533, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2126.779541, -1275.061889, 26.553533, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2128.951171, -1276.572753, 26.553533, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2128.943603, -1278.971191, 26.553533, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2129.182617, -1275.060546, 26.553533, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2128.725097, -1273.413574, 26.551132, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2128.723388, -1271.020263, 26.553533, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-30-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(2526, 2134.365966, -1279.085205, 24.853517, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2525, 2133.220703, -1275.594360, 24.853517, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2130.035156, -1274.869506, 28.197591, 0.000000, 90.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(2100, 2129.642822, -1274.615600, 24.853517, 0.000000, 0.000000, 139.799957, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 5, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2131.786865, -1272.543212, 24.781120, 0.000000, 90.000000, 450.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19160, "newhardhats", "hardhat2map", 0x00000000);
	tmpobjid = CreateDynamicObject(19174, 2128.804931, -1271.865966, 26.947057, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14737, "whorewallstuff", "ah_painting2", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2133.982177, -1271.974975, 25.337068, 0.000000, 0.000000, 168.199981, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 19894, "laptopsamp1", "laptopscreen3", 0x00000000);
	tmpobjid = CreateDynamicObject(1794, 2128.671630, -1272.007446, 24.853517, 0.000000, 0.000000, 450.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 19344, "egg_texts", "easter_egg05", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2127.422851, -1272.518554, 24.773525, 0.000000, 90.000000, -84.500015, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18632, "fishingrod", "handle2", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2129.993164, -1279.783203, 26.551132, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2126.782470, -1279.783203, 26.551132, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2130.282958, -1269.972045, 26.551132, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2133.493164, -1269.972045, 26.551132, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2124.910644, -1271.781494, 26.551132, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19174, 2128.804931, -1270.744995, 26.317052, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14737, "whorewallstuff", "ah_painting2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Missoni", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2136, 2125.671630, -1278.037475, 24.853517, 0.000000, 0.000000, 450.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(2135, 2125.667236, -1279.027343, 24.853517, 0.000000, 0.000000, 450.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(2140, 2125.677490, -1276.028198, 24.853517, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(2110, 2128.298583, -1278.962768, 24.853517, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	tmpobjid = CreateDynamicObject(948, 2128.398925, -1275.535644, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 3, 19655, "mattubes", "reddirt1", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2127.272705, -1278.835571, 25.493522, 0.000000, 0.000000, -180.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2127.272705, -1278.075195, 25.493522, 0.000000, 0.000000, 177.399993, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2077, 2129.368896, -1278.170410, 26.253515, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "beachwall_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2127.302001, -1278.971191, 24.773517, 0.000000, 90.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "tiles7-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2127.291992, -1277.361206, 24.773517, 0.000000, 90.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "tiles7-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2127.291992, -1275.760620, 24.773517, 0.000000, 90.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "tiles7-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2123.791748, -1275.760620, 24.773517, 0.000000, 90.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19597, "lsbeachside", "tiles7-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2133.353759, -1276.870727, 24.773517, 0.000000, 90.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2134.925292, -1276.870727, 24.773517, 0.000000, 90.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2134.822265, -1270.330444, 26.542367, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15048, "labigsave", "ah_wallstyle1", 0x00000000);
	tmpobjid = CreateDynamicObject(2267, 2132.500732, -1278.242675, 26.903522, 0.000000, 0.000000, 270.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14737, "whorewallstuff", "ah_painting1", 0x00000000);
	tmpobjid = CreateDynamicObject(2055, 2129.925048, -1275.180541, 27.093513, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Jensen Company", 50, "Calibri", 20, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1504, 2130.968017, -1279.567626, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2524, 2134.262695, -1276.522705, 24.853517, 0.000000, 0.000000, 270.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1208, 2134.627685, -1275.505859, 24.853517, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19786, 2133.525878, -1275.095092, 26.803527, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1768, 2132.361816, -1270.705932, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11724, 2129.106201, -1271.926757, 25.403503, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19632, 2129.083007, -1271.937500, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2313, 2134.248535, -1274.570312, 24.853517, 0.000000, 0.000000, 180.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1814, 2132.975830, -1272.638671, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2614, 2129.087890, -1278.327148, 27.233539, 0.000000, 0.000000, 450.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1742, 2129.520996, -1275.043579, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2817, 2133.981689, -1277.794433, 24.853517, 0.000000, 0.000000, 67.600006, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2241, 2131.382568, -1270.700561, 25.387052, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19008, 2129.001220, -1272.371215, 25.977060, 0.000000, 0.000000, 22.100000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2601, 2133.390380, -1272.050537, 25.457071, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2601, 2133.250244, -1272.150634, 25.457071, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1741, 2130.502929, -1278.932250, 24.853517, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(330, 2129.272949, -1278.819213, 26.093511, 0.000000, 90.000000, -141.499954, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19787, 2128.695312, -1271.396362, 26.648807, 0.000000, 0.000000, 270.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1743, 2127.149658, -1273.455200, 24.853517, 0.000000, 0.000000, 270.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2811, 2125.612304, -1273.281005, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1502, 2125.984619, -1275.133666, 24.853517, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1502, 2132.611572, -1277.314086, 24.853517, 0.000000, 0.000000, 90.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2275, 2128.083740, -1275.656372, 26.713520, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2858, 2128.364013, -1278.604614, 25.663515, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1517, 2128.430175, -1277.892456, 25.853527, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19806, 2132.253173, -1271.975952, 27.727069, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1734, 2133.781005, -1277.969970, 28.113529, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2073, 2126.859375, -1277.165893, 27.783523, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2126.932373, -1272.803710, 28.103525, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1564, 2130.862304, -1277.676269, 28.073514, 0.000000, 0.000000, 0.000000, 191, 0, -1, 300.00, 300.00); 

	tmpobjid = CreateDynamicObject(3557, 2132.250000, -1276.949951, 26.875000, 0.000000, 0.000000, -179.999984, 0, 0, -1, 300.00, 300.00);
	return 1;
}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);

	RemoveBuildingForPlayer(playerid, 3557, 2132.250, -1276.949, 26.875, 0.250);
	RemoveBuildingForPlayer(playerid, 3560, 2132.250, -1276.949, 26.875, 0.250);
	return 1;
}

