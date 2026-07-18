//opDaniel.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opDaniel.pwn ]--------------------------------------------//
//Autor: JustMiko
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
opDaniel_Init()
{
	tmpobjid = CreateDynamicObject(987, 1269.479614, -1170.143188, 21.682018, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(5820, 1291.972290, -1172.165161, 27.004810, 0.000000, 0.000000, -2.299999, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8615, 1298.729003, -1172.764892, 33.272521, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8615, 1306.086181, -1172.764892, 37.922264, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3934, 1309.402221, -1165.116943, 40.069129, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1313.215698, -1161.094604, 39.765476, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1305.772338, -1161.094604, 39.765476, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1305.772338, -1169.356201, 39.765476, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1313.173217, -1169.356201, 39.765476, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1310.012573, -1173.470581, 34.660137, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1310.012573, -1173.470581, 25.650074, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1308.571166, -1173.470581, 34.660137, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1308.571166, -1173.470581, 25.640064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1302.705810, -1173.470581, 30.020053, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1302.705810, -1173.470581, 20.989940, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1301.284423, -1173.470581, 30.020053, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1301.284423, -1173.470581, 21.010046, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1295.861206, -1173.470581, 25.390130, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3498, 1293.817626, -1173.470581, 25.390130, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	//nowe obiekty altanka
	tmpobjid = CreateDynamicObject(19447, 1291.962158, -1171.444946, 40.985378, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1282.333129, -1171.444946, 40.985378, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1277.610839, -1166.664428, 40.985378, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 1277.617309, -1160.348876, 40.985416, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1293.808105, -1160.122070, 39.945438, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1294.758911, -1160.122070, 39.945438, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1282.530029, -1158.729858, 40.985378, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1292.838500, -1160.122070, 39.945438, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1292.161254, -1158.729858, 40.985378, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1296.933105, -1163.410400, 40.985378, 0.000000, 0.000000, 360.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1295.709594, -1160.122070, 39.945438, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 1296.461547, -1169.762451, 40.705390, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1296.261596, -1159.614013, 39.955432, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 1296.011108, -1169.762451, 40.315402, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 1298.954345, -1169.782470, 40.705352, 0.000000, -0.100000, 450.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1296.261596, -1160.554931, 39.955432, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 1299.514892, -1169.782470, 40.355411, 0.000000, -0.100000, 450.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1296.261596, -1161.505859, 39.955432, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(625, 1287.646240, -1161.428344, 40.925743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1296.261596, -1162.456420, 39.955432, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1296.261596, -1163.397338, 39.955432, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 1291.887573, -1160.122070, 39.945438, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2030, 1294.238647, -1162.154541, 40.455730, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(2293, 1294.198608, -1164.219604, 40.055427, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19267, "mapmarkers", "red-2", 0x00000000);
	tmpobjid = CreateDynamicObject(19819, 1294.122070, -1162.533935, 40.935417, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19819, 1294.572387, -1161.573486, 40.935436, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19081, "laserpointer3", "laserbeam-3-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19819, 1294.122070, -1161.583129, 40.935417, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19082, "laserpointer4", "laserbeam-4-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19819, 1294.871948, -1162.533935, 40.935417, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19083, "laserpointer5", "laserbeam-5-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19819, 1294.752319, -1161.944091, 40.935417, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18643, "laserpointer1", "laserbeam64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 1288.538208, -1160.262695, 40.075748, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampred", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18996, "mattextures", "sampred", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19608, 1281.994750, -1166.181762, 40.055427, 0.000000, 0.000000, 90.800003, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19609, 1283.091796, -1163.735351, 40.095428, 0.000000, 0.000000, 90.400009, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 1283.597656, -1162.030273, 40.075439, 0.000000, 0.000000, 89.200012, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 1283.682373, -1169.622070, 40.075439, 0.000000, 0.000000, 91.600006, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19128, 1288.298339, -1168.270751, 40.005435, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19317, 1281.430786, -1170.039184, 40.716094, -31.900001, -11.700000, 131.800094, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19611, 1283.742431, -1166.646606, 40.095424, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19610, 1283.683837, -1166.653686, 41.722305, 0.000000, 0.000000, 93.900009, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19128, 1288.298339, -1164.289184, 40.005435, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1298.146240, -1171.529052, 41.719528, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1296.992431, -1168.746093, 41.011867, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1296.992431, -1170.827392, 41.011867, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1298.393798, -1170.827392, 41.011867, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1298.393798, -1168.767089, 41.011867, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(627, 1296.081909, -1165.703002, 41.825416, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19820, 1294.295043, -1162.013061, 40.875431, 0.000000, 0.000000, 142.799987, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1670, 1293.781372, -1161.914794, 40.870765, 0.000000, 0.000000, 85.799972, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19821, 1294.455078, -1162.192993, 40.845417, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 1295.465209, -1167.997436, 40.075439, 0.000000, 0.000000, -133.999954, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 1290.864013, -1160.189941, 40.075439, 0.000000, 0.000000, 45.100021, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19882, 1288.280517, -1160.286254, 40.895401, 0.000000, 0.000000, 9.900000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19882, 1288.684570, -1160.277099, 40.895401, 0.000000, 0.000000, 9.900000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19583, 1288.617919, -1160.364746, 40.455455, 0.000000, 0.000000, -140.199966, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18692, 1288.583496, -1160.855590, 39.775459, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	gateob = CreateDynamicObject(19912, 1328.211059, -1159.436035, 23.128131, 0.000000, 0.000000, 1.000000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		1328.211059, -1159.436035, 19.808055, 0.000000, 0.000000, 1.000000,
		1328.211059, -1159.436035, 23.128131, 0.000000, 0.000000, 1.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 450);
}
opDaniel_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 717, 1322.270, -1155.910, 23.000, 0.250);
}
