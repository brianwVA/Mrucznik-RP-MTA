//opWilliam.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opWilliam.pwn ]--------------------------------------------//
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
opWilliam_Init()
{
	tmpobjid = CreateDynamicObject(19433, 2430.504150, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2428.902587, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2436.849853, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2438.451416, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2440.052978, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2441.654541, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 2443.256103, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19433, 2444.857666, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2446.459228, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2448.060791, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2449.660888, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2451.260986, -18.218622, 24.714357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2453.575927, -18.224649, 23.954339, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19870, 2431.261962, -18.220659, 24.704357, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0xFFC88C51);
	DodajBrame(tmpobjid,
		2431.261962, -18.220659, 23.144321, 0.000000, 0.000000, 0.000000,
		2431.261962, -18.220659, 24.704357, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 860);
}

opWilliam_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1468, 2443.790, -18.234, 26.718, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2449.090, -18.234, 26.718, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2427.850, -18.148, 27.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2422.540, -18.148, 27.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2417.229, -18.148, 27.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2411.929, -18.148, 27.703, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2406.629, -18.148, 27.703, 0.250);
	RemoveBuildingForPlayer(playerid, 3407, 2439.189, -18.210, 25.445, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2443.790, -18.234, 26.718, 0.250);
	RemoveBuildingForPlayer(playerid, 1468, 2449.090, -18.234, 26.718, 0.250);
	RemoveBuildingForPlayer(playerid, 766, 2434.979, 3.507, 24.992, 0.250);
}
