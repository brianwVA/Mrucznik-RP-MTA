//interior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: interior.pwn ]------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     ________      ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------

//
//-----------------<[ Główne funkcje: ]>-------------------
StudioIdle_Init()
{
	StworzObiekty();
	return 1;
}

//Stat
static StworzObiekty()
{

	pevori2 = CreateDynamicObject(19464, 1967.235717, -1778.871704, 1.962792, 360.000000, 90.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6869, "vegastemp1", "casinowall1_128", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1972.327270, -1778.871704, 1.962792, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6869, "vegastemp1", "casinowall1_128", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1972.327270, -1772.949951, 1.962792, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6869, "vegastemp1", "casinowall1_128", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1967.234985, -1772.939941, 1.962792, 360.000000, 90.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6869, "vegastemp1", "casinowall1_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.815673, -1781.729736, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1972.326171, -1767.009033, 1.962792, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 9583, "bigshap_sfw", "cof_tile1", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1966.476440, -1776.929443, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.815673, -1765.717407, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.815673, -1768.918090, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1966.476318, -1764.027099, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.686767, -1764.027099, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1972.867553, -1764.027099, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1974.547485, -1765.717041, 3.797790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1974.547485, -1768.916870, 3.797790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.905761, -1772.107666, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.815673, -1775.317993, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.815673, -1778.518920, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1967.223632, -1767.009033, 1.962792, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 9583, "bigshap_sfw", "cof_tile1", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1966.496337, -1781.739746, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1972.867553, -1770.047973, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1972.867553, -1770.228149, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1972.907592, -1770.418212, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.706909, -1781.739746, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1972.917724, -1781.739746, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.695312, -1770.047973, 3.797790, -0.000001, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.695312, -1770.228149, 3.797790, -0.000001, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.695312, -1770.408203, 3.797790, -0.000001, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1974.546142, -1781.721923, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1974.546142, -1778.521972, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1974.546142, -1772.110473, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1974.546142, -1775.321289, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1972.337280, -1778.871704, 5.412796, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19396, 1966.500122, -1770.033203, 3.817790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 18049, "ammu_twofloor", "gun_ceiling2", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1967.236816, -1778.871704, 5.412796, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1967.236816, -1772.941650, 5.412796, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19396, 1966.500122, -1770.403564, 3.817790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1972.328002, -1772.941650, 5.412796, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19396, 1966.500122, -1770.203369, 3.817790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 18049, "ammu_twofloor", "gun_ceiling2", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1972.328002, -1767.030517, 5.412796, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1967.228149, -1767.030517, 5.412796, 360.000000, 90.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(1492, 1965.712402, -1770.263305, 2.087791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1964.905761, -1775.317626, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19396, 1968.011596, -1778.624389, 3.817790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19396, 1967.831420, -1778.624389, 3.817790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1968.015991, -1781.819824, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1967.835815, -1781.819824, 3.797790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1966.135986, -1777.330444, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14745, "rystuff", "mp_apt1_bathwall", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.737548, -1765.176513, 1.437790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(19396, 1969.741699, -1768.362182, 3.817790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 18049, "ammu_twofloor", "gun_ceiling2", 0x00000000);
	pevori2 = CreateDynamicObject(1492, 1968.000366, -1779.407592, 2.087791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	pevori2 = CreateDynamicObject(19368, 1969.737548, -1765.176513, 6.537790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(1806, 1967.461303, -1766.562866, 2.097791, 0.000000, 0.000000, 37.100013, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 18901, "matclothes", "bandanaleaf", 0x00000000);
	pevori2 = CreateDynamicObject(2700, 1968.556274, -1764.400512, 4.027789, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6864, "vgnvrock", "vrocksign1_256", 0x00000000);
	pevori2 = CreateDynamicObject(1806, 1965.721923, -1766.599609, 2.097791, 0.000000, 0.000000, -68.199989, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 18901, "matclothes", "bandanaleaf", 0x00000000);
	pevori2 = CreateDynamicObject(1492, 1969.742919, -1769.143066, 2.087791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0x00000000);
	pevori2 = CreateDynamicObject(2608, 1965.110229, -1768.610717, 4.287790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	pevori2 = CreateDynamicObject(11711, 1969.679199, -1768.381469, 4.867794, -0.000001, -0.000004, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 9525, "boigas_sfw", "GEwhite1_64", 0x00000000);
	pevori2 = CreateDynamicObject(11711, 1969.659179, -1768.411499, 4.797792, -0.000001, -0.000004, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 9525, "boigas_sfw", "GEwhite1_64", 0x00000000);
	SetDynamicObjectMaterialText(pevori2, 0, "{ff0000}ON AIR", 30, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	pevori2 = CreateDynamicObject(19368, 1966.135986, -1777.790893, 3.797790, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	pevori2 = CreateDynamicObject(2741, 1966.354980, -1781.566772, 3.507791, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5780, "melrose03_lawn", "hollyshop02_LAwn", 0x00000000);
	pevori2 = CreateDynamicObject(19464, 1967.235717, -1778.871704, 1.962792, 360.000000, 90.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6869, "vegastemp1", "casinowall1_128", 0x00000000);
	pevori2 = CreateDynamicObject(2319, 1965.493530, -1774.348632, 2.087791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pevori2, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pevori2 = CreateDynamicObject(14819, 1973.589599, -1781.555908, 3.247790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2514, 1967.417358, -1781.126953, 2.087791, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19325, 1969.744262, -1763.615966, 3.057790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1703, 1970.737182, -1781.019531, 2.087791, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19611, 1970.780395, -1765.558837, 2.087791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2259, 1973.975830, -1772.810424, 3.767791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19610, 1970.771606, -1765.558837, 3.732286, 6.499991, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2263, 1973.962768, -1774.973754, 4.447793, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2265, 1973.963256, -1774.453247, 3.367789, 0.000000, 0.000000, -90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2262, 1973.971801, -1776.453857, 3.707791, 0.000000, 0.000000, -90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2261, 1973.953247, -1778.195312, 4.387792, 0.000000, 0.000000, -90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2260, 1973.975585, -1778.573852, 2.937791, 0.000000, 0.000000, -90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19317, 1974.280517, -1765.052856, 2.832093, -11.999997, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19609, 1972.709594, -1768.251708, 2.087791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2255, 1973.974731, -1780.380371, 3.637790, 0.000000, 0.000000, -90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2350, 1974.130859, -1768.226074, 2.397790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(18659, 1965.013305, -1775.714965, 3.377790, -3.999999, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1703, 1970.607543, -1771.021362, 2.087791, 0.000000, -0.000001, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2266, 1972.738159, -1771.000610, 4.207794, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2267, 1971.382690, -1770.549072, 3.627789, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2268, 1973.191528, -1771.008056, 3.237791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2269, 1970.087646, -1770.999389, 4.197791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2894, 1971.295410, -1764.599487, 2.087791, 0.000000, 0.000000, 42.699989, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19617, 1966.884643, -1764.098632, 4.587790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1703, 1973.697631, -1771.881958, 2.087791, 0.000001, 0.000000, -90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1827, 1971.609497, -1772.792358, 2.087791, 0.000000, -0.000001, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2226, 1965.537719, -1773.561401, 2.567790, -0.000000, 0.000000, 87.399978, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2811, 1973.638793, -1771.033813, 2.087791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2811, 1973.949096, -1781.245361, 2.087791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2811, 1971.528686, -1781.245361, 2.087791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2811, 1965.497314, -1776.455932, 2.087791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(14391, 1966.282348, -1764.535644, 2.989065, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2811, 1965.497314, -1771.006103, 2.087791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(11737, 1972.814208, -1781.156494, 2.087791, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19835, 1972.160644, -1773.065307, 2.607790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19835, 1971.800292, -1772.165283, 2.607790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2270, 1969.727783, -1771.010742, 2.767791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2271, 1968.588867, -1771.000732, 3.667789, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2518, 1966.081665, -1781.140747, 2.087791, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19873, 1966.968139, -1781.553344, 2.127791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2104, 1969.161987, -1770.023925, 2.087790, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1808, 1974.256225, -1775.186035, 2.087791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19918, 1969.364868, -1769.748535, 3.437791, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1703, 1965.416870, -1769.640014, 2.087791, 0.000000, 0.000000, 450.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1958, 1968.636352, -1769.691650, 2.087790, 0.000000, 0.000000, 66.399993, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19827, 1967.747924, -1779.656127, 3.487791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19827, 1971.778808, -1781.654907, 3.487791, 0.000000, 0.000000, 540.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19827, 1969.657958, -1767.464599, 3.457789, 0.000000, 0.000000, 630.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1665, 1967.976196, -1764.574218, 3.207791, 0.000000, 0.000000, -60.600002, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19827, 1967.608276, -1769.946533, 3.457789, 0.000000, 0.000000, 1260.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19808, 1965.120971, -1768.316406, 3.737790, 0.000000, 0.000000, 96.399955, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19612, 1974.211181, -1765.865356, 2.087791, 0.000000, 0.000000, 270.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1840, 1968.095214, -1769.732543, 2.097791, 0.000000, 0.000000, -65.599960, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(19810, 1966.516723, -1770.499633, 4.827793, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(11711, 1972.874511, -1781.616577, 4.867794, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1962, 1964.947387, -1766.634521, 4.487793, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1961, 1964.925048, -1765.654907, 4.487793, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(1960, 1964.926147, -1764.702392, 4.497793, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2742, 1965.769042, -1778.080932, 3.337790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(18665, 1965.011840, -1773.691040, 4.257792, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(18662, 1965.012939, -1771.502319, 3.577790, 4.099998, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2718, 1965.004272, -1780.733032, 4.837791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(14684, 1965.295654, -1783.400634, 4.137788, 0.000000, 0.000000, 540.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(18075, 1970.883422, -1776.869750, 5.307791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(14684, 1965.295654, -1783.400634, 4.137788, 0.000000, 0.000000, 540.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(14684, 1965.295654, -1783.400634, 4.137788, 0.000000, 0.000000, 540.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2647, 1972.310058, -1772.677368, 2.657790, 0.000000, 0.000000, 0.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2827, 1971.642333, -1772.759033, 2.527791, 0.000000, 0.000000, 67.799995, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2254, 1969.794189, -1781.636474, 4.227791, 0.000000, 0.000000, 180.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(2706, 1964.993774, -1766.534790, 3.317791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	pevori2 = CreateDynamicObject(18075, 1967.313110, -1764.497680, 5.307791, 0.000000, 0.000000, 90.000000, 1, -1, -1, 300.00, 300.00); 
	
	DodajWejscie(2002.4003,-1782.7997,13.5537, 1973.0504,-1780.6917,3.0878, 0, 0, 1, 0, "Studio Nagran", "Wyjscie");

	return 1;
}