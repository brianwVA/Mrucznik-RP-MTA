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
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

//AUTOR: Charllie112

//-----------------<[ Główne funkcje: ]>-------------------
chinskiejedzenie_Init()
{
	StworzObiekty();
	return 1;
}

chinskiejedzenie_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{

	charlie112 = CreateDynamicObject(19383, 1043.721679, -1269.459594, 14.272706, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3531, "triadprops_lvs", "chinese1", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1043.721679, -1266.249511, 11.782707, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "walpaper_dragn", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1043.721679, -1263.049560, 11.782707, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "walpaper_dragn", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1043.721679, -1263.049560, 17.322702, 0.000000, 0.000022, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "walpaper_dragn", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1043.721679, -1266.259521, 17.322702, 0.000000, 0.000022, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "walpaper_dragn", 0x00000000);
	charlie112 = CreateDynamicObject(19379, 1038.550903, -1266.263549, 12.443817, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1043.825439, -1263.049804, 15.116321, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1038.990722, -1261.418823, 14.272706, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "walpaper_dragn", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1038.990722, -1271.169433, 14.272706, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3531, "triadprops_lvs", "chinese1", 0x00000000);
	charlie112 = CreateDynamicObject(19379, 1038.550903, -1266.263549, 16.043827, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14650, "ab_trukstpc", "sa_wood08_128", 0x00000000);
	charlie112 = CreateDynamicObject(19325, 1043.716918, -1264.531738, 14.229761, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14415, "carter_block_2", "mp_carter_cage", 0x00000000);
	charlie112 = CreateDynamicObject(2027, 1042.755981, -1262.707641, 13.079755, -0.000082, 0.000000, -89.999748, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 4, 14385, "trailerkb", "tr_kit_1a", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 5, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	charlie112 = CreateDynamicObject(2027, 1042.755981, -1265.647949, 13.079755, -0.000082, 0.000000, -89.999748, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 4, 14385, "trailerkb", "tr_kit_1a", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 5, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	charlie112 = CreateDynamicObject(2027, 1039.505859, -1262.707641, 13.079755, -0.000082, 0.000000, -89.999748, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 4, 14385, "trailerkb", "tr_kit_1a", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 5, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	charlie112 = CreateDynamicObject(2027, 1038.905761, -1270.249633, 13.079755, 0.000000, -0.000082, 179.999496, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 4, 14385, "trailerkb", "tr_kit_1a", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 5, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	charlie112 = CreateDynamicObject(2027, 1036.135986, -1270.249633, 13.079755, 0.000000, -0.000082, 179.999496, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 4, 14385, "trailerkb", "tr_kit_1a", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 5, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1034.690795, -1272.639770, 14.272706, 0.000000, 0.000000, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3531, "triadprops_lvs", "chinese1", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1031.560791, -1266.209350, 14.272706, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3531, "triadprops_lvs", "chinese1", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1033.171142, -1267.729492, 14.272706, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3531, "triadprops_lvs", "chinese1", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1034.842895, -1261.074096, 14.272706, 0.000000, 0.000000, 137.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "walpaper_dragn", 0x00000000);
	charlie112 = CreateDynamicObject(19379, 1028.050170, -1266.263549, 12.443817, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	charlie112 = CreateDynamicObject(19379, 1028.059326, -1266.263549, 16.043827, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14650, "ab_trukstpc", "sa_wood08_128", 0x00000000);
	charlie112 = CreateDynamicObject(2027, 1036.025634, -1262.357299, 13.079755, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 4, 14385, "trailerkb", "tr_kit_1a", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 5, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1023.450073, -1265.110961, 14.272706, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(2259, 1041.320312, -1262.002929, 14.129766, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14571, "chinese_furn", "ab_tv_tricas1", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1032.065185, -1264.847656, 11.829752, 0.000000, 180.000000, 157.900009, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1034.788696, -1261.901000, 11.879754, 0.000000, 180.000000, 109.600021, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(1523, 1031.628540, -1266.959594, 12.509754, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14385, "trailerkb", "tr_kit_2ba", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1031.560058, -1259.919189, 14.272706, 0.000000, 0.000000, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14709, "lamidint2", "mp_apt1_bathfloor1", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1026.639892, -1261.430175, 14.272706, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14709, "lamidint2", "mp_apt1_bathfloor1", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1025.040527, -1266.240600, 14.272706, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1028.950927, -1270.659790, 14.272706, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1029.851074, -1264.769165, 14.272706, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "pagodaroof4", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1029.851074, -1267.809570, 14.272706, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1023.459899, -1264.760620, 14.272706, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14709, "lamidint2", "mp_apt1_bathfloor1", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1026.410400, -1259.890747, 14.272706, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14709, "lamidint2", "mp_apt1_bathfloor1", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1026.099731, -1263.091552, 12.452692, 0.000082, 90.000000, 89.999748, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14674, "civic02cj", "hotelarch1_LAn", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1028.430297, -1266.289428, 14.272706, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "pagodaroof4", 0x00000000);
	charlie112 = CreateDynamicObject(1523, 1030.597900, -1264.750000, 12.389752, 0.000000, 0.000000, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14385, "trailerkb", "tr_kit_2ba", 0x00000000);
	charlie112 = CreateDynamicObject(1523, 1030.597900, -1267.781005, 12.369750, 0.000000, 0.000000, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14385, "trailerkb", "tr_kit_2ba", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1030.659667, -1269.499389, 14.272706, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1039.936767, -1265.589721, 12.459752, -0.000039, 90.000083, -28.499965, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 1731, "cj_lighting", "CJ_PLANT_POT", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1026.680541, -1266.289428, 13.432705, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(2729, 1025.162597, -1269.126708, 14.449766, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14737, "whorewallstuff", "AH_paintbond", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1029.851074, -1264.759155, 14.272706, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14709, "lamidint2", "mp_apt1_bathfloor1", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1030.204345, -1264.781127, 10.359736, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1028.484252, -1264.781127, 10.359736, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1030.204345, -1267.804077, 10.349736, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1028.484252, -1267.804077, 10.349736, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1028.330200, -1266.289428, 14.272706, 0.000000, 0.000000, 360.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14443, "ganghoos", "mp_burn_carpet", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1029.851074, -1267.779541, 14.272706, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14569, "traidman", "pagodaroof4", 0x00000000);
	charlie112 = CreateDynamicObject(19420, 1029.861572, -1267.797729, 14.929759, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19420, 1029.861572, -1264.777832, 14.929759, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1032.146362, -1267.892822, 11.829752, 0.000000, 180.000000, 157.900009, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19327, 1028.522949, -1266.741088, 14.999757, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(charlie112, 0, "{FFFFFF}Charlie", 140, "Ariel", 80, 1, 0x00000000, 0x00000000, 1);
	charlie112 = CreateDynamicObject(19327, 1028.522949, -1265.761108, 14.649758, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(charlie112, 0, "{FFFFFF}Halliwell", 140, "Ariel", 80, 1, 0x00000000, 0x00000000, 1);
	charlie112 = CreateDynamicObject(19327, 1028.522949, -1266.361694, 14.829759, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(charlie112, 0, "{FFFFFF}H", 140, "Webdings", 100, 1, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	charlie112 = CreateDynamicObject(2755, 1042.104248, -1268.016357, 14.219767, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2075, 1041.711181, -1263.357543, 15.649765, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(11737, 1043.100219, -1269.430908, 12.529754, 0.000082, 0.000000, 89.999748, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2755, 1037.522460, -1266.143188, 14.219767, -0.000066, 0.000050, -51.899990, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2799, 1038.036254, -1265.878784, 13.029759, 0.000075, 0.000034, 65.999992, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(3920, 1037.120239, -1271.186279, 14.959760, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2248, 1043.021728, -1267.500122, 13.019758, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2243, 1037.603881, -1261.841674, 12.759757, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2640, 1034.007568, -1267.358886, 13.309754, 0.000000, -0.000104, 179.999359, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2640, 1032.977783, -1267.358886, 13.309754, 0.000000, -0.000104, 179.999359, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2261, 1039.750000, -1262.002929, 14.229762, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2260, 1038.379760, -1262.002929, 14.649764, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1744, 1032.536254, -1263.436401, 14.509759, 0.000000, 0.000000, 407.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2075, 1041.711181, -1266.297607, 15.649765, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2075, 1041.711181, -1269.457763, 15.649765, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2075, 1037.470703, -1269.457763, 15.649765, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2075, 1037.241210, -1263.357543, 15.649765, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2248, 1038.611816, -1267.500122, 13.019758, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1807, 1040.425537, -1270.361938, 13.069757, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2671, 1035.722534, -1266.723510, 12.539757, -0.000062, 0.000055, -48.699974, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2673, 1040.328125, -1265.169555, 12.629755, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2247, 1037.546752, -1261.770141, 13.079764, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2251, 1043.009643, -1267.589721, 13.499752, 0.000078, 0.000025, 71.299995, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2858, 1042.613525, -1265.618286, 13.299761, -0.000051, 0.000065, -38.999988, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2839, 1042.610473, -1262.745727, 13.299761, -0.000076, 0.000030, -67.999961, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2858, 1039.447387, -1262.693359, 13.299761, -0.000082, -0.000001, -91.399734, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2103, 1033.126831, -1263.262084, 14.809759, 0.000000, 0.000000, 47.699974, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1670, 1036.025024, -1262.352661, 13.329762, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19091, 1039.556396, -1268.064453, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19090, 1040.106689, -1266.244018, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19092, 1038.616333, -1264.593505, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19092, 1037.086425, -1267.303955, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19091, 1041.646728, -1264.563842, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19090, 1034.916015, -1266.244018, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19091, 1035.286254, -1263.834472, 15.879763, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1789, 1042.744628, -1270.619262, 13.069757, 0.000028, 0.000078, 19.600000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1778, 1043.396484, -1268.085327, 12.529753, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(11713, 1034.813476, -1268.593750, 14.439763, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2726, 1038.876831, -1270.227539, 13.639754, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2726, 1036.127319, -1270.227539, 13.639754, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2961, 1041.333984, -1271.069213, 14.199766, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(11710, 1043.660644, -1269.321899, 15.439758, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19591, 1034.801269, -1269.991821, 14.479764, 0.000000, -44.199993, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19591, 1034.801269, -1269.723510, 14.483514, 0.000000, -44.199993, 270.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2131, 1030.942016, -1263.026489, 12.529753, -0.000082, 0.000000, -89.999748, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2132, 1028.977905, -1262.072998, 12.529753, 0.000000, 0.000113, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2133, 1027.974365, -1262.068115, 12.529753, 0.000000, 0.000113, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2341, 1026.998046, -1264.334716, 12.529753, 0.000000, -0.000082, 179.999496, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2141, 1025.443603, -1262.532348, 12.809758, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2170, 1026.973999, -1262.908935, 12.489752, 0.000082, 0.000000, 89.999748, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2341, 1030.958129, -1262.064453, 12.529753, 0.000000, 0.000113, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2341, 1026.998046, -1262.064453, 12.529753, 0.000082, 0.000000, 89.999748, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2822, 1026.980102, -1261.988403, 13.549757, -0.000059, 0.000058, -45.599990, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2848, 1029.037109, -1262.014160, 13.579752, 0.000000, 0.000113, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2820, 1030.765258, -1261.990478, 13.589759, 0.000000, 0.000113, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2170, 1026.973999, -1263.559204, 12.489752, 0.000082, 0.000000, 89.999748, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2133, 1028.004394, -1264.328247, 12.529753, 0.000000, -0.000082, 179.999496, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2149, 1026.937744, -1264.262329, 13.719751, 0.000075, -0.000037, 116.499763, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2690, 1028.677490, -1264.578125, 12.888631, 0.000000, 0.000082, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1738, 1028.650390, -1265.716430, 13.139760, 0.000105, 0.000000, 89.999679, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1216, 1028.787719, -1266.850830, 13.149757, 0.000105, 0.000000, 89.999679, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2822, 1042.794677, -1270.568969, 13.439755, -0.000077, 0.000029, -69.699996, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19810, 1029.810180, -1264.854492, 15.259757, 0.000000, 0.000000, 180.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2741, 1029.415527, -1270.570068, 13.929758, 0.000000, -0.000014, 179.999908, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2742, 1030.489990, -1269.623901, 14.039764, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2515, 1029.449951, -1270.313598, 13.579768, 0.000000, -0.000014, 179.999908, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2742, 1030.489990, -1268.803710, 14.039764, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2741, 1028.304809, -1270.570068, 13.929758, 0.000000, -0.000022, 179.999862, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2515, 1028.339233, -1270.313598, 13.579768, 0.000000, -0.000022, 179.999862, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2741, 1027.164916, -1270.570068, 13.929758, 0.000000, -0.000029, 179.999816, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2515, 1027.199340, -1270.313598, 13.579768, 0.000000, -0.000029, 179.999816, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(945, 1029.093139, -1262.959594, 22.688648, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2877, 1025.123535, -1267.628662, 13.789755, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2528, 1027.499389, -1265.742065, 12.809758, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2528, 1025.869506, -1265.742065, 12.809758, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2877, 1026.763916, -1267.628662, 13.789755, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2844, 1026.159179, -1269.591796, 12.529753, 0.000000, -0.000082, 179.999496, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2075, 1027.799926, -1269.067626, 15.649765, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1522, 1043.785034, -1270.204223, 12.529753, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 

	charlie112 = CreateDynamicObject(5785, 1037.050048, -1286.150024, 16.312500, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00); 
	charlie112 = CreateDynamicObject(5729, 1034.810058, -1285.569946, 16.414100, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00); 

	return 1;
}

static UsunObiekty(playerid)
{

	RemoveBuildingForPlayer(playerid, 5729, 1034.810, -1285.569, 16.414, 0.250);
	RemoveBuildingForPlayer(playerid, 5946, 1034.810, -1285.569, 16.414, 0.250);
	RemoveBuildingForPlayer(playerid, 5785, 1037.050, -1286.150, 16.312, 0.250);
	return 1;
}
 