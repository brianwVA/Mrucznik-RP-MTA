//enforcerint.pwn
//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Modu3: sanVanInterior.pwn ]--------------------------------------------//
//Autor: Deduir, Santiago
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

//-----------------<[ G3ówne funkcje: ]>-------------------
enforcer_Init() //t1 metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{


//1481.4247,-1617.6514,-4.2809 - kordy po /wejdzw
	pevori2 = CreateDynamicObject(19378, 1479.507446, -1617.766967, -5.366849, 180.000000, 90.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	pevori2 = CreateDynamicObject(18755, 1484.463134, -1617.688598, -3.390911, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 6, 14535, "ab_wooziec", "ab_woodborder", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 7, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 8, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 9, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 10, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 11, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 12, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 13, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 14, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 15, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	pevori2 = CreateDynamicObject(19451, 1477.674194, -1619.786987, -3.980911, 0.000000, 0.000000, 90.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 3193, "cxref_desert", "drvin_metal", 0x00000000);
	pevori2 = CreateDynamicObject(2737, 1475.035522, -1618.402709, -3.500912, 0.000052, 0.000000, 89.999839, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 3961, "lee_kitch", "metal5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 18646, "matcolours", "grey-80-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1482.480468, -1620.597167, -3.730907, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1482.480468, -1614.754638, -3.730907, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19378, 1479.507446, -1617.766967, -2.136847, 180.000000, 90.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	pevori2 = CreateDynamicObject(1508, 1482.407836, -1617.722900, -3.860912, 0.000000, 0.000000, 180.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 9514, "711_sfw", "sw_sheddoor2", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1483.201171, -1617.746093, -4.200905, 0.000000, 0.000000, 90.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	pevori2 = CreateDynamicObject(19451, 1477.674194, -1615.586914, -3.980911, 0.000000, 0.000000, 90.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 3193, "cxref_desert", "drvin_metal", 0x00000000);
	pevori2 = CreateDynamicObject(19451, 1474.855346, -1616.257202, -3.980911, 0.000000, 0.000000, 180.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 3193, "cxref_desert", "drvin_metal", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1479.241943, -1615.880371, -5.362412, 90.000000, 0.000000, 90.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 16640, "a51", "Metal3_128", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1479.241943, -1619.612548, -5.362412, 90.000000, 0.000000, 90.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 16640, "a51", "Metal3_128", 0x00000000);
	pevori2 = CreateDynamicObject(19327, 1479.316528, -1619.688354, -3.450908, 0.000000, 0.000000, 180.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 16640, "a51", "ws_metalpanel1", 0x00000000);
	pevori2 = CreateDynamicObject(19327, 1479.316528, -1615.685180, -3.450908, 0.000000, 0.000000, 360.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 16640, "a51", "ws_metalpanel1", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1475.420043, -1617.521484, -4.792409, 90.000000, 0.000000, 180.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	pevori2 = CreateDynamicObject(2737, 1475.035522, -1616.511840, -3.500912, 0.000052, 0.000000, 89.999839, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 18646, "matcolours", "grey-80-percent", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pevori2 = CreateDynamicObject(356, 1475.040649, -1619.308959, -3.554457, -4.199999, -88.199943, 89.399986, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(2042, 1475.492553, -1619.299316, -4.210913, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(2038, 1475.006347, -1618.888427, -4.220911, 0.000000, 0.000000, 90.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(2043, 1475.264892, -1618.368896, -4.190907, 0.000000, 0.000000, 34.099998, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(356, 1475.046020, -1618.868530, -3.568243, -4.199999, -88.199943, 89.399986, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(356, 1475.040649, -1618.427734, -3.572792, -4.200000, -88.199943, 89.399986, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(356, 1475.044311, -1618.006713, -3.566013, -4.200000, -88.199943, 89.399986, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(19142, 1476.281494, -1616.042358, -5.050914, 0.000000, 270.000000, -140.499984, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(19142, 1476.151367, -1619.389404, -5.050914, 0.000000, 270.000000, -32.500038, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(349, 1475.057983, -1617.419799, -3.599781, -5.899994, -81.999969, 88.699928, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(2359, 1475.416015, -1617.417114, -4.100907, 0.000000, 0.000000, 83.399986, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(19995, 1475.719848, -1618.332763, -4.280912, 0.000000, 90.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(349, 1475.066650, -1617.046630, -3.601748, -5.899994, -81.999969, 88.699928, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(349, 1475.074951, -1616.683349, -3.602333, -5.899994, -81.999969, 88.699928, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(349, 1475.082885, -1616.330078, -3.601532, -5.899994, -81.999969, 88.699928, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(364, 1475.497436, -1616.294067, -4.300909, 0.000000, 0.000000, -129.599990, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(349, 1475.091430, -1615.988037, -3.609198, -5.899994, -81.999969, 88.699928, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(2041, 1475.617431, -1615.944946, -4.100913, 0.000000, 0.000000, 92.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(19101, 1475.227294, -1616.126708, -4.220910, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);

	
	return 1;
}
