//exterior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------[ Obiekty: exterior_temporary.pwn ]--------------------------------------//
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
//By Dreptacz
//

//-----------------<[ Główne funkcje: ]>-------------------
WhiteHouseExt_Init()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(18761, 1274.923095, -2020.158447, 62.728187, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3979, "civic01_lan", "nt_bonav1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19063, "xmasorbs", "orbcap", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 19063, "xmasorbs", "orbcap", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 19063, "xmasorbs", "orbcap", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 1266.447387, -2015.592895, 58.402683, 0.000000, 0.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1258.017578, -2014.815185, 58.405384, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1258.562988, -2016.102050, 58.405384, 0.000000, 0.000000, 45.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.879516, -2016.647338, 58.405384, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1261.214477, -2016.095092, 58.405384, 0.000000, 0.000000, 315.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1258.562744, -2013.513671, 58.405384, 0.000000, 0.000000, 135.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.864257, -2012.973266, 58.405384, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1261.167236, -2013.521850, 58.405384, 0.000000, 0.000000, 405.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.843017, -2014.808593, 60.065380, 360.000000, 90.000000, 405.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.843017, -2014.838623, 60.065380, 360.000000, 90.000000, 450.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.821777, -2014.817382, 60.065380, 360.000000, 90.000000, 495.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.899658, -2014.895263, 60.065380, 360.000000, 90.000000, 495.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.843017, -2014.808593, 60.065380, 360.000000, 90.000000, 450.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1259.843017, -2014.808593, 60.065380, 360.000000, 90.000000, 540.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 1266.447387, -2015.592895, 58.402683, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 1266.447387, -2014.032958, 58.402683, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1263.172607, -2014.808593, 60.065380, 360.000000, 90.000000, 540.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1266.572387, -2014.808593, 60.065380, 360.000000, 90.000000, 540.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 1266.447387, -2025.092163, 58.402683, 0.000000, 0.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 1271.198120, -2029.812011, 58.402683, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19458, 1271.198120, -2010.871704, 58.402683, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1271.686523, -2015.713378, 60.082637, 180.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1271.686523, -2025.013793, 60.082637, 180.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19074, 1277.343261, -2020.327758, 56.998577, 90.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18049, "ammu_twofloor", "gun_bacboard", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 8482, "csrspalace02", "casinolightsyel_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1274.896606, -2020.003540, 62.192646, 270.000000, 90.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3452, "bballvgnint", "bballconcrete1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(3578, 1275.042602, -2024.267211, 59.642913, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 8482, "csrspalace02", "casinolightsyel_128", 0x00000000);
	tmpobjid = CreateDynamicObject(3578, 1275.042602, -2016.317016, 59.642913, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 8482, "csrspalace02", "casinolightsyel_128", 0x00000000);
	tmpobjid = CreateDynamicObject(3438, 1275.094238, -2020.060424, 64.354660, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "orbcap", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3452, "bballvgnint", "bballconcrete1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(3437, 1275.229858, -2015.159667, 61.132457, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "orbcap", 0x00000000);
	tmpobjid = CreateDynamicObject(3437, 1275.229858, -2025.128662, 61.132457, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "orbcap", 0x00000000);
	tmpobjid = CreateDynamicObject(14407, 1264.502563, -2027.895263, 56.964542, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red-4", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18646, "matcolours", "red-4", 0x00000000);
	tmpobjid = CreateDynamicObject(2189, 1274.822143, -2013.057495, 64.005355, 0.000000, 90.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(2189, 1274.822143, -2027.368041, 64.005355, 0.000000, 90.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19074, 1256.850219, -2020.208374, 56.294326, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1809, "cj_hi_fi", "CJ_speaker_6", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1269.372070, -2029.971069, 57.788906, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1269.852050, -2029.971069, 57.788906, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1271.312011, -2010.660888, 57.718906, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1247.132446, -2030.060913, 58.754329, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1247.132446, -2010.370361, 58.754329, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1274.792236, -2022.581298, 62.474311, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1274.792236, -2017.650756, 62.474311, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1276.264892, -2020.148803, 66.994316, 180.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19356, 1265.984375, -2025.861450, 58.404323, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1247.116577, -2025.013793, 58.442634, 270.000000, 90.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1247.116577, -2015.633544, 58.442634, 270.000000, 90.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1252.092651, -2010.670410, 57.408912, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19443, 1261.753540, -2014.792114, 58.425373, 0.000000, 0.000000, 360.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1259.839843, -2027.720947, 58.708164, 180.000000, 90.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red-4", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1256.779785, -2034.190429, 58.708156, 180.000000, 90.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red-4", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1255.079711, -2034.200439, 57.018154, 360.000000, 540.000000, 540.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1258.459594, -2034.190429, 57.018154, 360.000000, 540.000000, 540.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19446, 1256.789672, -2038.930664, 53.948135, 450.000000, 540.000000, 630.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1252.552368, -2029.971069, 54.918910, 180.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1263.492675, -2029.971069, 57.408912, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1249.752441, -2029.971069, 54.918910, 180.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1261.692504, -2010.670410, 57.408912, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(998, 1268.058471, -2030.054931, 59.741703, 90.000000, -0.899999, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1247.122680, -2014.910522, 63.084327, 90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1247.122680, -2025.570434, 63.084327, 90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1247.132446, -2020.961669, 58.754329, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(3498, 1247.132446, -2019.470947, 58.754329, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(998, 1256.476928, -2010.921020, 59.661735, 90.000000, -0.899999, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(998, 1266.726196, -2011.081665, 59.671722, 90.000000, -0.899999, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(995, 1249.399414, -2029.942749, 59.780715, 90.000000, -135.400070, 135.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10412, "hotel1", "gold128", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1247.116577, -2015.633544, 62.642616, 270.000000, 90.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1247.116577, -2025.003295, 62.642616, 270.000000, 90.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1269.537353, -2010.963623, 60.302619, 270.000000, 90.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(19375, 1269.537353, -2029.813842, 60.302619, 270.000000, 90.000000, 180.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(998, 1266.638916, -2016.641235, 62.381713, 270.000000, 359.100006, 270.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(1253, 1247.216918, -2025.634399, 60.974327, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "silk9-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(1253, 1247.216918, -2014.904663, 60.974327, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "silk9-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(994, 1259.751586, -2012.919067, 62.399547, 166.699996, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(994, 1259.791625, -2016.038330, 62.155273, -165.700027, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(994, 1258.532104, -2017.605346, 62.885768, 161.300018, 0.000000, 102.100006, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	tmpobjid = CreateDynamicObject(19609, 1271.796630, -2026.890869, 60.161552, 0.000000, 0.000000, -110.899993, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 1, 19063, "xmasorbs", "orbcap", 0x00000000);
	tmpobjid = CreateDynamicObject(19715, 1273.221313, -2020.173461, 59.035709, 180.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "orbcap", 0x00000000);
	tmpobjid = CreateDynamicObject(18766, 1280.292114, -2020.830932, 58.148914, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14392, "dr_gsstudio", "woodcabinet01_128", 0x00000000);
	tmpobjid = CreateDynamicObject(3935, 1247.787719, -2020.242553, 59.944332, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil5-128x128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19058, "xmasboxes", "silk9-128x128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19058, "xmasboxes", "silk9-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19325, 1277.259765, -2030.329833, 64.924308, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{000000} Partnerzy Medialni: \n \n {ff0000} Telewizja \n San Andreas Network", 130, "Calibri", 40, 1, 0x00000000, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19325, 1277.300048, -2030.329833, 62.244304, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{ff6600} Radio \n San News", 130, "Calibri", 40, 1, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(2232, 1274.929809, -2012.937011, 61.012493, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2232, 1274.929809, -2027.157348, 61.012493, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1250.283813, -2033.577148, 58.843578, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1250.283813, -2006.677490, 58.973571, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1261.014038, -2006.677490, 58.843582, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1261.014038, -2033.597045, 58.533596, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1243.804687, -2026.396972, 58.953601, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1243.904174, -2013.597290, 58.953601, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(737, 1243.834106, -2019.957763, 58.953601, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1258.230590, -2037.725585, 59.304103, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1258.230590, -2035.235839, 59.304103, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1258.230590, -2032.696166, 59.304103, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1255.220214, -2037.725585, 59.304103, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1255.220214, -2035.245605, 59.304103, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1255.220214, -2032.655517, 59.304103, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1250.406494, -2013.761230, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1250.406494, -2018.331054, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1250.406494, -2023.040771, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1250.406494, -2027.850708, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1253.856445, -2013.761230, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1253.856445, -2018.311523, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1257.596435, -2024.442260, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1253.856445, -2023.011962, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1253.856445, -2027.802368, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1261.286254, -2024.442260, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1261.286254, -2020.492431, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1723, 1257.615356, -2020.492431, 58.784332, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(998, 1264.235229, -2039.925170, 59.141693, 90.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(998, 1258.259887, -2045.782958, 59.531715, 90.000000, -0.899999, 180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(995, 1262.907470, -2041.976684, 59.270713, 90.000000, -136.900085, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(998, 1247.175048, -2039.925170, 59.531700, 90.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(995, 1247.387695, -2041.494262, 59.530712, 90.000000, -115.200088, 45.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2017.649169, 67.038566, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2022.589477, 67.038566, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2022.589477, 65.188560, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2017.629272, 65.188560, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2017.629272, 63.338565, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2022.619873, 63.338565, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.835571, -2012.638916, 67.498573, -12.699998, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.835571, -2027.679321, 67.498573, -12.699998, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19611, 1271.096679, -2020.043457, 60.410709, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19610, 1271.062622, -2020.046386, 62.043228, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2020.029418, 67.038566, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2024.839111, 67.038566, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.424804, -2015.479370, 67.038566, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(992, 1281.598022, -2030.011108, 59.398429, 0.000000, 0.000000, 180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.852661, -2017.449218, 69.378326, -12.699998, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.852661, -2022.729980, 69.378326, -12.699998, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.799560, -2020.139892, 70.114646, -12.699998, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.600097, -2017.649169, 60.901939, 32.600002, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.600097, -2022.588745, 60.901939, 32.600002, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2773, 1263.344726, -2026.701904, 59.304103, 0.000000, 0.000000, -40.299999, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.798583, -2015.119018, 64.104606, 21.700004, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19156, 1274.798583, -2025.208740, 64.104606, 21.700004, 0.000000, 90.000000, 300.00, 300.00);
	return 1;
}
