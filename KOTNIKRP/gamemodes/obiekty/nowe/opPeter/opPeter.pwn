//opPeter.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opPeter.pwn ]--------------------------------------------//
//Autor: Lilka
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
opPeter_Init()
{
	tmpobjid = CreateDynamicObject(19362, 2213.852783, -27.708311, 24.744358, 0.000000, 0.000000, 1.500000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2213.936767, -30.907209, 24.744358, 0.000000, 0.000000, 1.500000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2214.000000, -34.116302, 24.744358, 0.000000, 0.000000, 0.600000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2213.993896, -37.324043, 24.754360, 0.000000, 0.000000, -0.499998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2213.966308, -41.993907, 24.774360, 0.000000, 0.000000, -0.499998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 2200.242187, -40.657733, 27.822349, 0.000000, 0.000000, 89.899978, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2762, 2179.628173, -32.317951, 26.868757, 0.000000, 0.000000, 90.999893, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1720, 2180.975341, -31.665580, 26.468751, 0.000000, 0.000000, -89.500038, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1720, 2178.220214, -32.959312, 26.468751, 0.000000, 0.000000, 90.699943, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1720, 2180.982910, -32.935508, 26.468751, 0.000000, 0.000000, -89.500038, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1720, 2178.208740, -31.749355, 26.468751, 0.000000, 0.000000, 90.699943, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2253, 2179.507568, -32.317062, 27.576587, 0.000000, 0.000000, -34.799976, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 4, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(869, 2178.924316, -39.108036, 26.918760, 0.000000, 0.000000, 62.199981, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF0000FF);
	tmpobjid = CreateDynamicObject(19831, 2178.708984, -27.846731, 26.456560, 0.000000, 0.000000, 37.500003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2213.994384, -40.441318, 24.014345, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2207.002685, -36.343372, 25.878433, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 2211.166503, -36.375022, 25.487661, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 2207.002685, -42.443367, 25.888433, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 2211.166503, -42.485008, 25.487661, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2814, 2179.508544, -31.653963, 27.308746, 0.000000, 0.000000, 23.700000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2179.838867, -33.122894, 27.418756, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2179.718750, -32.962898, 27.418756, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2179.588623, -33.092906, 27.418756, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2177.804931, -38.387638, 26.846565, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2177.744873, -28.157630, 26.846565, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2182.225341, -27.327629, 26.846565, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19573, 2178.657470, -28.442127, 26.459821, -7.400000, 0.000000, 26.399999, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18688, 2178.616943, -28.099496, 25.998741, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2909, 2213.956787, -46.320671, 25.174367, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); // Brama zamkni?ta
	SetDynamicObjectMaterial(tmpobjid, 0, 6060, "shops2_law", "newall8-1blue", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 10765, "airportgnd_sfse", "black64", 0x00000000);
	DodajBrame(tmpobjid,
		2213.956787, -46.320671, 25.174367, 0.000000, 0.000000, 0.000000,
		2213.956787, -46.320671, 21.944362, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 811);
}

opPeter_Connect(playerid) 
{
	RemoveBuildingForPlayer(playerid, 780, 2210.050, -33.554, 25.640, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2213.739, -34.421, 26.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2213.739, -29.015, 26.039, 0.250);
	RemoveBuildingForPlayer(playerid, 3407, 2213.439, -50.164, 25.476, 0.250);
}
