//julia_dom5.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: julia_dom5.pwn ]--------------------------------------------//
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
julia_dom5_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

julia_dom5_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19353, 2108.033203, -1330.197509, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2103.172363, -1322.329711, 26.659069, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2106.384521, -1322.327514, 26.663127, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2100.024169, -1322.327514, 26.663127, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2108.033203, -1323.829589, 26.659069, 0.000000, 0.000000, 180.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2098.514160, -1323.839599, 26.659069, 0.000000, 0.000000, 180.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2098.522949, -1327.028198, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2098.572998, -1331.838134, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-80-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2108.025146, -1327.028198, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2100.171875, -1331.819335, 26.659069, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-70-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2103.362548, -1331.817871, 26.663127, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-70-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2103.106445, -1326.947509, 24.876678, 0.000000, 90.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16322, "a51_stores", "des_ghotwood1", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2103.106445, -1326.947509, 28.306684, 0.000000, 90.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19853, "mihouse1", "greenwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2103.435058, -1322.157592, 26.663127, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2100.433349, -1331.998291, 26.663127, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2098.332275, -1324.168701, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2108.204101, -1324.168701, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1535, 2099.202392, -1322.415527, 24.962614, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2103.002929, -1330.287841, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-70-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2107.208251, -1328.680664, 26.672620, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2104.658691, -1328.670654, 26.672620, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2101.697265, -1327.765502, 26.672620, 0.000000, 0.000000, -123.899978, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2098.813232, -1326.897216, 26.663127, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officewall3", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2105.843505, -1330.287841, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2106.428222, -1328.762084, 24.902614, 0.000000, 0.000000, 0.199985, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF666666);
	SetDynamicObjectMaterial(tmpobjid, 1, 1426, "break_scaffold", "cheerybox03", 0xFF666666);
	tmpobjid = CreateDynamicObject(1492, 2103.876220, -1328.721069, 24.902614, 0.000000, 0.000000, 0.599986, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF666666);
	SetDynamicObjectMaterial(tmpobjid, 1, 1426, "break_scaffold", "cheerybox03", 0xFF666666);
	tmpobjid = CreateDynamicObject(1492, 2102.319824, -1328.268798, 24.932615, 0.000000, 0.000000, 145.100067, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF666666);
	SetDynamicObjectMaterial(tmpobjid, 1, 1426, "break_scaffold", "cheerybox03", 0xFF666666);
	tmpobjid = CreateDynamicObject(19353, 2107.482666, -1330.467773, 24.913101, 0.000000, 90.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15058, "svvgmid", "AH_walltile4", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2104.590820, -1330.407714, 24.893102, 0.000000, 90.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15058, "svvgmid", "AH_walltile4", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2103.143066, -1330.287841, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2104.724121, -1331.717895, 26.663127, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2107.934814, -1331.717895, 26.663127, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2104.658691, -1328.830810, 26.672620, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2107.208251, -1328.870849, 26.672620, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9220, "sfn_apart02sfn", "concreteslab", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2107.792968, -1330.357666, 28.293100, 0.000000, 90.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14780, "lring_gmint3", "nuringtest2", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2104.590820, -1330.337646, 28.293111, 0.000000, 90.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14780, "lring_gmint3", "nuringtest2", 0x00000000);
	tmpobjid = CreateDynamicObject(2256, 2098.687011, -1330.488525, 27.182636, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7094, "vgnretail5", "vegasclub02_128", 0x00000000);
	tmpobjid = CreateDynamicObject(2299, 2102.232177, -1330.940917, 24.962614, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "multi086", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2101.632812, -1327.878906, 26.652620, 0.000000, 0.000000, -123.899978, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-80-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2098.813232, -1326.987304, 26.663127, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-80-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2098.583007, -1328.647216, 26.663127, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-80-percent", 0x00000000);
	tmpobjid = CreateDynamicObject(2025, 2099.267578, -1327.575683, 24.962614, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF666633);
	tmpobjid = CreateDynamicObject(2526, 2104.062500, -1331.166137, 24.999038, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dts_elevator_ceiling", 0x00000000);
	tmpobjid = CreateDynamicObject(949, 2105.882324, -1328.267700, 25.602619, 0.000000, 0.000000, -149.199966, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14385, "trailerkb", "tr_wall3", 0x00000000);
	tmpobjid = CreateDynamicObject(2162, 2098.783935, -1326.169677, 24.912614, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14533, "pleas_dome", "timber_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(1713, 2101.332031, -1324.485107, 24.962614, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2103.483398, -1325.397460, 24.883129, 0.000000, 90.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14758, "sfmansion1", "AH_flroortile6", 0xFF333333);
	tmpobjid = CreateDynamicObject(2130, 2105.490722, -1323.012939, 24.999038, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	tmpobjid = CreateDynamicObject(2128, 2104.491943, -1322.959228, 24.962614, 0.000000, 0.000000, 360.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	tmpobjid = CreateDynamicObject(2294, 2107.467773, -1323.001464, 24.982616, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	tmpobjid = CreateDynamicObject(2256, 2107.917480, -1326.371093, 26.899038, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 8421, "pirateland", "tislndskullrock_256", 0x00000000);
	tmpobjid = CreateDynamicObject(1432, 2105.794433, -1325.656982, 24.999038, 0.000000, 0.000000, 540.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18056, "mp_diner1", "mp_cj_sheetmetal", 0x00000000);
	tmpobjid = CreateDynamicObject(1731, 2098.970458, -1322.575195, 26.759035, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "gun_ceiling3", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9259, "presidio01_sfn", "yelloconc_LA", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2105.774902, -1326.180664, 25.609041, 0.000000, 0.000000, 6.300002, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9818, "ship_brijsfw", "ship_greenscreen1", 0x00000000);
	tmpobjid = CreateDynamicObject(2055, 2101.604736, -1322.439941, 27.009040, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Jensen Company", 50, "Calibri", 20, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19353, 2106.572998, -1331.817871, 26.663127, 0.000000, 0.000000, 450.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2823, 2105.482910, -1322.938476, 26.079038, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2811, 2102.379882, -1331.180297, 24.962614, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2525, 2106.465087, -1331.007202, 24.979040, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2524, 2105.266357, -1329.396362, 24.979040, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2524, 2107.476562, -1330.496459, 24.979040, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2270, 2105.913574, -1328.080322, 26.562625, 0.000000, 0.000000, 180.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19787, 2098.572509, -1325.844848, 27.052623, 0.000000, 0.000000, 90.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2707, 2104.495117, -1329.908935, 28.199056, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2707, 2104.495117, -1330.589111, 28.199056, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2707, 2106.976318, -1330.589111, 28.199056, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2707, 2106.976318, -1330.108642, 28.199056, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2101.157470, -1329.588256, 28.222616, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2069, 2098.905761, -1329.261718, 24.999038, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19273, 2100.956787, -1322.379760, 26.712633, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2105.731201, -1325.514526, 25.699043, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2105.871337, -1325.514526, 25.699043, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 2105.791259, -1325.674682, 25.699043, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1664, 2106.002197, -1325.576171, 25.782611, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1670, 2105.614013, -1325.550537, 25.652624, 0.000000, 0.000000, 79.900024, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19806, 2103.712402, -1325.246826, 28.079055, 0.000000, 0.000000, 0.000000, 195, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19786, 2102.970947, -1330.498046, 27.123836, 0.000000, 0.000000, 270.000000, 195, 0, -1, 300.00, 300.00); 

	tmpobjid = CreateDynamicObject(3557, 2100.899902, -1324.989990, 26.937500, 0.000000, 0.000000, -0.000034, 0, 0, -1, 300.00, 300.00);
	return 1;
}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);

	RemoveBuildingForPlayer(playerid, 3557, 2100.899, -1324.989, 26.937, 0.250);
	RemoveBuildingForPlayer(playerid, 3560, 2100.899, -1324.989, 26.937, 0.250);
	return 1;
}

