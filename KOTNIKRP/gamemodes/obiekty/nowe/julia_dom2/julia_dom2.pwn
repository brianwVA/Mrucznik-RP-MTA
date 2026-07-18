//julia_dom2.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: julia_dom2.pwn ]--------------------------------------------//
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
julia_dom2_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

julia_dom2_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19383, 2150.230468, -1284.622436, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2147.018554, -1284.629028, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2153.391357, -1284.629028, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2154.669921, -1279.899902, 24.876474, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2145.489501, -1279.899902, 24.876474, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2145.489501, -1279.899902, 24.876474, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10041, "archybuild10", "bank_sfe5", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2149.809570, -1275.101928, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2146.607910, -1275.106933, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2153.000976, -1275.099121, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2149.540771, -1279.826171, 23.065471, 0.000000, 90.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3819, "baseball_sfsx", "telepole128", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2149.540771, -1279.826171, 26.525497, 0.000000, 90.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "ab_panelWall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2153.020751, -1284.808105, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2147.390136, -1284.808105, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2148.690673, -1276.627441, 24.876474, 0.000000, 0.000000, 180.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2148.690429, -1279.011596, 24.876474, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2147.168701, -1279.732666, 24.876474, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2150.339843, -1279.732666, 24.876474, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2153.541259, -1279.727050, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4828, "airport3_las", "gnhotelwall02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2153.020751, -1274.917968, 24.876474, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2150.339843, -1279.732666, 24.876474, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10041, "archybuild10", "bank_sfe5", 0x00000000);
	tmpobjid = CreateDynamicObject(19997, 2151.671142, -1282.792114, 23.151409, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateDynamicObject(1739, 2151.655029, -1281.527832, 23.941410, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2151.686767, -1282.342163, 23.981409, 0.000000, 0.000000, 180.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 18063, "ab_sfammuitems02", "gun_xtra1", 0x00000000);
	tmpobjid = CreateDynamicObject(2298, 2150.616699, -1276.059570, 23.151409, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 3, 16322, "a51_stores", "dish_roundbit_a", 0x00000000);
	tmpobjid = CreateDynamicObject(2230, 2151.138671, -1275.172729, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2230, 2152.379882, -1275.172729, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 14652, "ab_trukstpa", "CJ_WOOD1(EDGE)", 0x00000000);
	tmpobjid = CreateDynamicObject(2055, 2151.446289, -1284.517578, 25.141414, 0.000000, 0.000000, 180.000000, 1188, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Jensen Company", 40, "Calibri", 20, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1502, 2151.128173, -1279.727172, 23.111412, 0.000000, 0.000000, 180.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1502, 2146.427246, -1279.767211, 23.111412, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1506, 2149.044433, -1275.111450, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2136, 2154.084716, -1283.015869, 23.151409, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1742, 2148.584716, -1279.690185, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(0, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 0.00, 0.00); 
	tmpobjid = CreateDynamicObject(2135, 2154.088378, -1282.036010, 23.151409, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2140, 2154.074218, -1281.041015, 23.151409, 0.000000, 0.000000, 630.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1235, 2154.114257, -1280.192382, 23.661417, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1739, 2151.655029, -1284.057739, 23.941410, 0.000000, 0.000000, -90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1703, 2146.092529, -1282.977905, 23.151409, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1703, 2148.905273, -1284.028930, 23.151409, 0.000000, 0.000000, 180.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1827, 2147.825439, -1282.335571, 23.141405, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2800, 2147.721435, -1282.446899, 23.391403, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2264, 2146.071533, -1283.318237, 25.401422, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2262, 2146.059570, -1282.358886, 25.041429, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 2146.078125, -1281.351318, 24.451414, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2010, 2146.054443, -1283.859741, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19942, 2151.338867, -1282.499511, 24.011421, 270.000000, 90.000000, -111.499954, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 2154.556152, -1277.403564, 25.281412, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19422, 2154.280029, -1276.064575, 23.694425, 0.000000, 0.000000, -65.400001, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2894, 2154.287353, -1278.808471, 23.701421, 0.000000, 0.000000, -93.399986, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2225, 2151.582763, -1275.166015, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1743, 2150.269287, -1277.424438, 23.151409, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(646, 2149.507324, -1278.605346, 24.521438, 0.000000, 0.000000, -43.999980, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19787, 2148.704101, -1276.916503, 25.444440, 0.000000, 0.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2525, 2148.093261, -1278.174560, 23.151409, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2526, 2145.998046, -1277.090576, 23.151409, 0.000000, 0.000000, 270.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2132, 2146.692382, -1275.608032, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1846, 2147.178955, -1276.186889, 25.021438, 0.000000, 90.000000, 90.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1208, 2146.697509, -1275.609985, 23.221410, 0.000000, 0.000000, 180.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2750, 2147.143066, -1275.613769, 24.237089, 86.199996, 35.200004, 176.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2749, 2146.375732, -1275.415893, 24.191431, 0.000000, 0.000000, -163.800003, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2752, 2146.493408, -1275.344116, 24.201408, 0.000000, 0.000000, 44.400005, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2751, 2146.547851, -1275.592407, 24.261425, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2251, 2145.850097, -1276.032958, 24.011426, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1506, 2149.454833, -1284.642700, 23.151409, 0.000000, 0.000000, 0.000000, 1188, 0, -1, 300.00, 300.00); 

	tmpobjid = CreateDynamicObject(3555, 2150.040039, -1281.130004, 25.593799, 0.000000, 0.000000, -179.999984, 0, 0, -1, 300.00, 300.00);
	return 1;
}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);

	RemoveBuildingForPlayer(playerid, 3555, 2150.040, -1281.130, 25.593, 0.250);
	RemoveBuildingForPlayer(playerid, 3563, 2150.040, -1281.130, 25.593, 0.250);
	return 1;
}

