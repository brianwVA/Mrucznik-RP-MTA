//julia_dom1.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: julia_dom1.pwn ]--------------------------------------------//
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
julia_dom1_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

julia_dom1_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19383, 2148.555175, -1320.501953, 26.447917, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2152.169677, -1320.501953, 26.447917, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2145.317871, -1320.501953, 26.447917, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2150.221923, -1320.501953, 26.447917, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2147.069824, -1320.501953, 26.447917, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2143.776611, -1325.219482, 26.455623, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2149.163818, -1330.061889, 26.447917, 0.000000, 0.000000, -90.000053, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2147.000244, -1330.049682, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2145.309326, -1330.047119, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2152.142089, -1330.058837, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2153.669433, -1325.269287, 26.445623, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2148.785400, -1325.218261, 24.612417, 0.000000, 90.200019, 0.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14786, "ab_sfgymbeams", "knot_wood128", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2148.796142, -1325.218261, 28.232412, 0.000000, 90.200019, 0.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2149.315917, -1330.091674, 25.666496, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3820, "boxhses_sfsx", "ws_wood_doors1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2145.738525, -1320.339721, 26.000000, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2151.971679, -1320.339721, 26.000000, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2147.784423, -1323.512329, 26.447917, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2147.790527, -1321.209472, 26.447917, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2146.260009, -1326.605346, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2147.780517, -1326.115600, 26.444133, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2145.469238, -1326.615478, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2147.784423, -1328.462280, 26.447917, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "studwalltop_law", 0x00000000);
	tmpobjid = CreateDynamicObject(1502, 2147.806884, -1324.300415, 24.696424, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2143.015380, -1328.277221, 24.634128, 0.000000, 90.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2146.058349, -1328.277221, 24.664129, 0.000000, 90.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2142.857421, -1330.037719, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "ah_utilbor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2146.058593, -1330.027465, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "ah_utilbor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2146.058593, -1326.746582, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "ah_utilbor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2142.857421, -1326.746582, 26.444133, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "ah_utilbor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2147.754150, -1328.432250, 26.447917, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "ah_utilbor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2143.796142, -1328.406738, 26.444133, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "ah_utilbor1", 0x00000000);
	tmpobjid = CreateDynamicObject(2315, 2150.814697, -1329.473876, 24.695163, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 8391, "ballys01", "CJ_blackplastic", 0x00000000);
	tmpobjid = CreateDynamicObject(19328, 2147.900390, -1326.197753, 26.750635, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14805, "bdupsfurn", "Bdup_Crack", 0x00000000);
	tmpobjid = CreateDynamicObject(1794, 2144.238281, -1324.936767, 24.709182, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 8391, "ballys01", "ballydoor01_128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 3881, "apsecurity_sfxrf", "CJ_WOOD1", 0x00000000);
	tmpobjid = CreateDynamicObject(2297, 2143.986572, -1326.046386, 24.709194, 0.000000, 0.000000, 44.499965, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14489, "carlspics", "AH_picture3", 0x00000000);
	tmpobjid = CreateDynamicObject(19431, 2145.843261, -1323.146240, 24.655717, 0.000000, 90.000000, 115.800018, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0x00000000);
	tmpobjid = CreateDynamicObject(2166, 2146.192871, -1321.139160, 24.741655, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 3881, "apsecurity_sfxrf", "CJ_WOOD1", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2146.203613, -1321.166992, 25.521652, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 2772, "airp_prop", "CJ_AIRP_S_1", 0x00000000);
	tmpobjid = CreateDynamicObject(2256, 2143.909667, -1322.764404, 26.761663, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_wuziMirror", 0x00000000);
	tmpobjid = CreateDynamicObject(2842, 2145.795166, -1328.943969, 24.750066, 0.000000, 0.000000, 28.100006, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4230, "billbrd01_lan", "eris_2", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2148.575195, -1320.490600, 25.666496, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3820, "boxhses_sfsx", "ws_wood_doors1", 0x00000000);
	tmpobjid = CreateDynamicObject(2163, 2143.855712, -1323.152832, 24.741655, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "CJ_WOOD1", 0x00000000);
	tmpobjid = CreateDynamicObject(2055, 2147.933105, -1322.025390, 26.654987, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Jensen Company", 50, "Calibri", 20, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1502, 2147.839111, -1329.241333, 24.696424, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1670, 2147.163085, -1321.785888, 25.551660, 0.000000, 0.000000, -56.199996, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1723, 2150.426513, -1327.035400, 24.734474, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2141, 2150.333740, -1321.127563, 24.690891, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2341, 2153.071533, -1321.104125, 24.687864, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2132, 2151.315185, -1321.140747, 24.718996, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2133, 2153.075439, -1322.074951, 24.691616, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2134, 2153.070312, -1323.079711, 24.690765, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2149, 2151.296630, -1320.926635, 25.898027, 0.000000, 0.000000, 12.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2153.252441, -1322.883789, 25.823034, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2153.412597, -1322.733764, 25.823034, 0.000000, 0.000000, -14.099999, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2153.346679, -1322.995727, 25.823034, 0.000000, 0.000000, -14.099999, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2153.259033, -1322.726318, 25.823034, 0.000000, 0.000000, 81.499992, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2867, 2153.146972, -1321.294677, 25.729614, 0.000000, 0.000000, 50.200008, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1825, 2150.990478, -1324.074096, 24.694931, 0.000000, 0.000000, -24.000003, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19897, 2150.690673, -1324.014648, 25.579515, 0.000000, 0.000000, 56.300025, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19820, 2150.646728, -1323.782836, 25.529602, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1666, 2150.531982, -1324.151367, 25.648279, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1666, 2151.202636, -1324.151367, 25.648279, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1667, 2150.834228, -1323.623168, 25.658407, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1719, 2152.255371, -1329.534179, 25.209211, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19920, 2151.413085, -1329.518310, 25.211187, 0.000000, 0.000000, 160.399978, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(644, 2153.114746, -1329.292358, 25.012611, 0.000000, 0.000000, -20.900011, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2811, 2144.417236, -1321.222778, 24.741655, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 2146.231201, -1322.322143, 24.741655, 0.000000, 0.000000, -178.299972, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19786, 2151.542968, -1329.964721, 26.540370, 0.000000, 0.000000, 180.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19825, 2147.673583, -1321.638671, 26.921663, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2154, 2144.231689, -1329.222412, 24.750066, 0.000000, 0.000000, 90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2525, 2147.124267, -1327.269653, 24.750066, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2517, 2144.416259, -1328.275512, 24.750066, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1208, 2144.418701, -1328.687500, 24.760068, 0.000000, 0.000000, -90.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2251, 2147.215576, -1329.624267, 25.600078, 0.000000, 0.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1231, 2150.055419, -1325.130859, 30.322198, 0.000000, 180.000000, 0.000000, 190, 0, -1, 300.00, 300.00); 

	tmpobjid = CreateDynamicObject(3555, 2148.709960, -1324.000000, 27.140600, 0.000000, 0.000000, 0.000018, 0, 0, -1, 300.00, 300.00);
	return 1;
}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);
	RemoveBuildingForPlayer(playerid, 3555, 2148.709, -1324.000, 27.140, 0.250);
	RemoveBuildingForPlayer(playerid, 3563, 2148.709, -1324.000, 27.140, 0.250);
	return 1;
}

