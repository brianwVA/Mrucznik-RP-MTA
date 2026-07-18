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
Modele3D_Init()
{
	StworzObiekty();
	return 1;
}

Modele3D_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//Stat
static StworzObiekty()
{

	//------------------- LOMBARD IDLEWOOD -------------------//
	CreateDynamicObject(-2300, 2156.441650, -1742.305908, 12.559928, -0.002982, 0.000000, 89.999954, -1, -1, -1, 300.00, 300.00);
	CreateDynamicObject(-2301, 2152.340332, -1742.344848, 13.331604, 0.000014, 0.000000, 89.899887, -1, -1, -1, 300.00, 300.00);
	CreateDynamicObject(-2302, 2127.197753, -1735.916015, 11.982686, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	CreateDynamicObject(-2303, 2152.351074, -1742.364501, 13.332050, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	CreateDynamicObject(16779, 2150.626464, -1739.260253, 15.738624, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	CreateDynamicObject(2676, 2113.771972, -1725.424804, 12.874749, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	CreateDynamicObject(2673, 2120.429687, -1727.795532, 12.852746, 0.000000, 0.000000, -31.300003, -1, -1, -1, 300.00, 300.00);
	
	//------------------- GILLMORE PARK -------------------//
	CreateDynamicObject(-2017, 2115.00732421, -1921.47241210, 15.38652038, 0.00000000, 0.00000000, 0.00000000);
	
	//------------------- BOISKO GANTON -------------------//
	CreateDynamicObject(-2034, 2387.80469, -1695.64844, 13.74219,   0.00000, 0.00000, 0.00000);
	
	//------------------- EL CORONA PARK -------------------//
	CreateDynamicObject(-2027, 1734.39844, -2019.70313, 14.34375,   0.00000, 0.00000, 0.00000);


	// ULICA MARKET

	tmpobjid = CreateObject(5795, 985.726989, -1324.800048, 12.453100, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 2, 3967, "cj_airprt", "bigbrick", 0x00000000);
	tmpobjid = CreateObject(5796, 859.890991, -1323.790039, 12.375000, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterial(tmpobjid, 3, 3967, "cj_airprt", "bigbrick", 0x00000000);
	tmpobjid = CreateObject(19791, 797.449340, -1332.416259, 2.414731, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19791, 797.449340, -1322.435302, 2.414731, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19791, 797.449340, -1315.148559, 2.414731, 0.029998, 0.019998, 0.010998, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19447, 797.470336, -1332.578979, 10.691490, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 3576, "sjmla_las", "lasdockbar", 0x00000000);
	tmpobjid = CreateObject(19447, 797.470336, -1323.008300, 10.691490, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 3576, "sjmla_las", "lasdockbar", 0x00000000);
	tmpobjid = CreateObject(19447, 797.470336, -1314.977661, 10.691490, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 3576, "sjmla_las", "lasdockbar", 0x00000000);

	tmpobjid = CreateObject(5798, 797.351989, -1357.640014, 12.546895, 0.000000, 0.000000, 0.000000, 300.00); 
	tmpobjid = CreateObject(5798, 797.351989, -1357.640014, 12.546895, 0.000000, 0.000000, 0.000000, 300.00); 
	tmpobjid = CreateObject(19425, 800.083557, -1310.236450, 12.396693, 0.000000, 0.000000, 0.000000, 300.00); 
	tmpobjid = CreateObject(19425, 794.853637, -1310.236450, 12.396693, 0.000000, 0.000000, 0.000000, 300.00); 
	tmpobjid = CreateObject(19425, 794.853637, -1337.385498, 12.396693, 0.000000, 0.000000, 0.000000, 300.00); 
	tmpobjid = CreateObject(19425, 799.983398, -1337.385498, 12.396693, 0.000000, 0.000000, 0.000000, 300.00); 
	// FIX IDLE
	CreateObject(18753, 1929.063720, -1679.793090, 11.625403, 0.000000, 0.000000, 0.000000, 300.00); 
	// PIZZERIA
	tmpobjid = CreateObject(18753, 2132.130371, -1769.543701, 11.840077, 0.000000, 0.000000, 0.000000, 300.00); 
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2104.739013, -1762.308837, 10.840923, 0.019999, 0.049999, 89.870071, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2098.788818, -1766.937988, 10.830923, 0.000000, 0.000000, 164.900207, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2128.461425, -1762.390502, 10.840923, 0.000000, 0.000000, 89.800079, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2105.729980, -1762.311645, 10.840923, 0.000000, 0.000000, 89.800079, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2096.293212, -1776.185668, 10.830923, 0.000000, 0.000000, 164.900207, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2093.785888, -1785.485351, 10.830923, 0.000000, 0.000000, 164.900207, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2093.529785, -1786.430419, 10.830923, 0.109999, 0.079999, 165.120239, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2091.577636, -1807.004028, 10.830923, 0.000000, 0.000000, -179.999481, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19650, 2116.537109, -1774.945678, 12.096402, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2091.577636, -1827.114013, 10.830923, 0.000000, 0.000000, -179.999481, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19650, 2091.611572, -1774.945678, 12.096402, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2102.684814, -1764.158691, 12.298835, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2102.664794, -1767.650268, 12.298835, 0.000000, 90.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2113.580078, -1763.984375, 12.199848, 0.000000, 94.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 2118.821777, -1763.984375, 12.199848, 0.000000, 94.019996, 270.010009, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(9339, 2122.694824, -1832.016601, 11.850693, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9339, 2104.715576, -1832.006591, 11.850692, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(17070, 2109.529052, -1776.529418, 12.346507, 0.000000, 0.000000, 1.999994, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8407, 2109.528564, -1763.385864, 13.678394, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1327, 2096.333007, -1779.845214, 13.062314, -0.399996, -88.600021, 7.099997, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(935, 2096.660644, -1776.484008, 12.926192, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(935, 2097.601562, -1776.489257, 12.696252, 88.699943, 15.300001, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8650, 2108.649658, -1787.872436, 13.420277, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8650, 2113.784667, -1787.872436, 13.420382, 0.049999, 0.069999, 89.979980, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19447, 2102.774658, -1769.397949, 10.786400, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19447, 2107.508544, -1764.527221, 10.786400, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(824, 2103.419433, -1765.494750, 12.384773, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 

	DodajWejscie(-2661.04, 1416.76, 922.19, 1504.16, -1122.53, 135.82, 3, 3, 0, 0, "Dach", "Wejście"); //jizy club
	return 1;
}

static UsunObiekty(playerid)
{
	//------------------- LOMBARD IDLEWOOD -------------------//
	RemoveBuildingForPlayer(playerid, 5410, 2140.520, -1735.140, 15.890, 0.250);
	RemoveBuildingForPlayer(playerid, 5551, 2140.520, -1735.140, 15.890, 0.250);
	
	//------------------- GILLMORE PARK -------------------//
	RemoveBuildingForPlayer(playerid, 5208, 2115.0000, -1921.5234, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 5182, 2115.0000, -1921.5234, 15.3906, 0.25);
	
	//------------------- BOISKO GANTON -------------------//	
	RemoveBuildingForPlayer(playerid, 17614, 2387.8047, -1695.6484, 13.7422, 0.25);
	
	//------------------- EL CORONA PARK -------------------//
	RemoveBuildingForPlayer(playerid, 4965, 1734.3984, -2019.7031, 14.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 4873, 1734.3984, -2019.7031, 14.3438, 0.25);


	// ULICA MARKET
	RemoveBuildingForPlayer(playerid, 5795, 985.726, -1324.800, 12.453, 0.250);
	RemoveBuildingForPlayer(playerid, 5921, 985.726, -1324.800, 12.453, 0.250);
	RemoveBuildingForPlayer(playerid, 5796, 859.890, -1323.790, 12.375, 0.250);
	RemoveBuildingForPlayer(playerid, 5922, 859.890, -1323.790, 12.375, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 907.976, -1319.550, 15.585, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 927.945, -1327.880, 15.585, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 918.007, -1337.780, 15.539, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 951.445, -1327.949, 15.492, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 1043.109, -1319.640, 15.617, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 1053.020, -1309.780, 15.617, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 1063.069, -1336.689, 15.632, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 942.921, -1309.800, 15.632, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 807.976, -1319.660, 15.546, 0.250);
	RemoveBuildingForPlayer(playerid, 5798, 797.351, -1357.640, 12.546, 0.250);
	RemoveBuildingForPlayer(playerid, 5924, 797.351, -1357.640, 12.546, 0.250);

	// PIZZERIA
	RemoveBuildingForPlayer(playerid, 5418, 2112.939, -1797.089, 19.335, 0.250);
	RemoveBuildingForPlayer(playerid, 5530, 2112.939, -1797.089, 19.335, 0.250);
	RemoveBuildingForPlayer(playerid, 1522, 2105.919, -1807.250, 12.515, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2104.020, -1812.420, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2101.989, -1814.709, 12.570, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2103.409, -1817.300, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2102.129, -1819.949, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2102.600, -1822.079, 13.117, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.850, -1813.910, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.860, -1819.359, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2103.959, -1800.560, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2101.629, -1798.170, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2103.689, -1795.910, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2102.659, -1791.329, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2102.060, -1793.140, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.850, -1793.979, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.860, -1799.420, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2114.719, -1785.180, 16.398, 0.250);
	
	return 1;
}
