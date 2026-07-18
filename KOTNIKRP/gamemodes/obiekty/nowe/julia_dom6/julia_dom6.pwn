//julia_dom6.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: julia_dom6.pwn ]--------------------------------------------//
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
julia_dom6_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();
	return 1;
}

julia_dom6_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19353, 2091.592529, -1277.356933, 26.860813, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2090.006103, -1278.075683, 26.856414, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2088.309326, -1278.435058, 26.859678, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2085.108886, -1278.435058, 26.859678, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2085.189941, -1269.375976, 26.860813, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2091.680664, -1269.396362, 26.859678, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "yellograd32", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2083.589111, -1270.546142, 26.860813, 0.000000, 0.000000, 360.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2083.589355, -1273.746704, 26.859678, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2083.579345, -1276.916625, 26.859678, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2093.113037, -1275.776367, 26.860813, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2093.103027, -1272.665893, 26.860813, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "yellograd32", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2093.096679, -1270.265625, 26.856414, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "yellograd32", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2088.400878, -1269.375976, 26.860813, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2088.461669, -1273.628906, 25.059007, 0.000000, 90.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15046, "svcunthoose", "AH_carpet5kb", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2088.461669, -1273.628906, 28.298982, 0.000000, 90.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2091.437744, -1274.279174, 26.834953, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2090.162353, -1272.665893, 26.860813, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "oranggrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2090.166259, -1270.265625, 26.856414, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "oranggrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2086.877441, -1271.068359, 26.864952, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2088.452392, -1272.466552, 26.860813, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(1499, 2090.666503, -1274.227294, 25.074945, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17072, "truckedepotlawn", "GB_truckdepot08", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4821, "union_las", "lasunion995", 0x00000000);
	tmpobjid = CreateDynamicObject(1499, 2086.904785, -1271.837890, 25.104946, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17072, "truckedepotlawn", "GB_truckdepot08", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4821, "union_las", "lasunion995", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2091.717285, -1273.406738, 25.106420, 0.000000, 90.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2091.717285, -1270.185668, 25.106420, 0.000000, 90.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2088.462158, -1270.736206, 25.100801, 0.000000, 90.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6873, "vgnshambild1", "fitzwallvgn1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2088.402099, -1270.656127, 28.240825, 0.000000, 90.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon_poles01", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2091.553466, -1268.965454, 28.240825, 0.000000, 90.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon_poles01", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2091.553466, -1272.456787, 28.240825, 0.000000, 90.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon_poles01", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2088.002197, -1278.596923, 26.860813, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2084.892822, -1278.596923, 26.860813, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2090.016357, -1270.265625, 26.856414, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2091.543457, -1269.226806, 26.860813, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2083.414794, -1273.897827, 26.860813, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2083.404785, -1277.107910, 26.860813, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2091.717285, -1271.796630, 25.106420, 0.000000, 90.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2090.022216, -1272.665893, 26.860813, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2089.916748, -1273.456176, 26.856414, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2086.977539, -1271.058715, 26.864952, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_tiles", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2091.437744, -1274.119018, 26.834953, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "oranggrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2088.452392, -1272.576660, 26.860813, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(1497, 2090.295654, -1277.315307, 25.144945, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 4860, "railway_las", "lasunion5", 0x00000000);
	tmpobjid = CreateDynamicObject(1802, 2091.141113, -1272.986083, 25.144945, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19278, "skydiveplatforms", "hazardtile15-3", 0x00000000);
	tmpobjid = CreateDynamicObject(2167, 2092.543212, -1274.001708, 25.192358, 0.000000, 0.000000, 540.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2083.954833, -1271.576171, 26.856414, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2304, 2089.326904, -1273.144287, 25.144945, 0.000000, 0.000000, 360.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2129, 2088.334228, -1273.161743, 25.144945, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2294, 2087.344482, -1273.133178, 25.144945, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(2128, 2089.354248, -1274.146240, 25.144945, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2089.926757, -1273.866455, 26.856414, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	tmpobjid = CreateDynamicObject(2518, 2087.806640, -1273.354736, 25.394950, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(2251, 2089.171142, -1273.375732, 27.014957, 0.000000, 0.000000, -24.699998, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(2078, 2092.729003, -1275.401367, 25.144945, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(2855, 2092.613037, -1276.107666, 26.224952, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 4, 19620, "lightbar1", "lightbar1", 0x00000000);
	tmpobjid = CreateDynamicObject(2054, 2092.516845, -1276.647216, 26.654943, 0.000000, 0.000000, -94.699981, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "sw_sheddoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1786, 2083.844726, -1276.866088, 25.654956, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14737, "whorewallstuff", "AH_paintbond", 0x00000000);
	tmpobjid = CreateDynamicObject(1768, 2087.424316, -1275.965576, 25.144945, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19801, "balaclava1", "balaclava1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2227, 2087.016601, -1272.508911, 25.144945, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2087.141113, -1275.616577, 25.100801, 0.000000, 90.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19424, "headphones", "headphones02", 0x00000000);
	tmpobjid = CreateDynamicObject(19167, 2086.187255, -1277.120971, 25.646738, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19167, 2085.766845, -1277.120971, 25.646738, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19167, 2085.766845, -1276.670898, 25.646738, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19167, 2086.187255, -1276.670898, 25.646738, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(2010, 2089.504638, -1277.872558, 25.186737, 0.000000, 0.000000, 28.800003, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "flatdoor01_law", 0x00000000);
	tmpobjid = CreateDynamicObject(2526, 2088.788818, -1269.897338, 25.186737, 0.000000, 0.000000, 540.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "gun_ceiling3", 0x00000000);
	tmpobjid = CreateDynamicObject(2143, 2089.368896, -1272.168090, 25.186737, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "scratchedmetal", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14668, "711c", "gun_ceiling3", 0x00000000);
	tmpobjid = CreateDynamicObject(2267, 2089.124267, -1272.337402, 27.006740, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(2267, 2089.124267, -1272.337402, 27.006740, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(2267, 2089.124267, -1272.337402, 27.006740, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2093.072998, -1276.717285, 26.060802, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18036, "range_main", "gun_galss1", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Jensen Company", 100, "Calibri", 20, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1742, 2090.141357, -1273.534790, 25.192358, 0.000000, 0.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14556, 2084.689453, -1270.629760, 26.664957, 0.000000, 0.000000, 270.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2392, 2084.346435, -1270.766113, 26.104942, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2372, 2084.550781, -1271.058959, 26.354959, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2846, 2083.741455, -1270.970336, 25.274948, 0.000000, 0.000000, -7.099998, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2372, 2084.550781, -1271.058959, 25.454959, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2394, 2084.360839, -1270.405639, 26.994968, 0.000000, 0.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2845, 2083.816162, -1270.605102, 25.284948, 0.000000, 0.000000, -14.399998, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1664, 2083.862060, -1270.053100, 25.444952, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1668, 2083.881347, -1269.863159, 25.464952, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1669, 2084.061035, -1269.939331, 25.494945, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1544, 2083.975097, -1270.048217, 25.254947, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1551, 2083.838867, -1269.682983, 25.444952, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2855, 2084.032226, -1271.159423, 25.284948, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2870, 2092.591308, -1275.707397, 26.634946, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2710, 2092.642089, -1275.156494, 25.914941, 0.000000, 0.000000, -67.199996, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19008, 2092.679443, -1276.566284, 26.264942, 0.000000, 0.000000, -176.199951, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2313, 2084.245849, -1277.397338, 25.144945, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2126, 2086.486572, -1277.368164, 25.144945, 0.000000, 0.000000, 90.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 2084.050048, -1277.763183, 25.144945, 0.000000, 0.000000, 810.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 2083.781250, -1274.963378, 25.144945, 0.000000, 0.000000, 450.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2194, 2085.931152, -1276.895385, 25.902534, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2817, 2091.258544, -1273.154418, 25.192358, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2518, 2089.224121, -1271.775024, 25.436735, 0.000000, 0.000000, 180.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2525, 2089.541015, -1270.124145, 25.186737, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2835, 2088.141113, -1271.533081, 25.186737, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2241, 2087.878173, -1271.927856, 25.676750, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2750, 2089.613769, -1272.053710, 26.306732, 86.999992, 630.000000, -16.400011, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2751, 2089.716064, -1272.241821, 26.286748, 0.000000, 0.000000, 157.200057, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2752, 2087.162353, -1269.572631, 25.746746, 0.000000, 0.000000, 73.299987, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2069, 2084.254394, -1272.232788, 25.186737, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2069, 2090.276123, -1274.663696, 25.186737, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1575, 2084.391601, -1269.890380, 25.244945, 0.000000, 0.000000, 42.800003, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2073, 2087.379150, -1275.558471, 28.252538, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1565, 2088.391113, -1271.011718, 28.046743, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2091.701660, -1273.024658, 28.092369, 0.000000, 0.000000, 0.000000, 1936, 0, -1, 300.00, 300.00); 

	//sa object
	tmpobjid = CreateDynamicObject(3558, 2090.540039, -1274.949951, 27.445299, 0.000000, 0.000000, -179.999984, 0, 0, -1, 300.00, 300.00);
	return 1;
}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);

	RemoveBuildingForPlayer(playerid, 3558, 2090.540, -1274.949, 27.445, 0.250);
	RemoveBuildingForPlayer(playerid, 3559, 2090.540, -1274.949, 27.445, 0.250);
	return 1;
}

