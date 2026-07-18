//exterior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: exterior.pwn ]------------------------------------------//
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

//-----------------<[ Główne funkcje: ]>-------------------
extsasd_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}

extsasd_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{

	sasdob = CreateDynamicObject(12941, 2383.637939, -97.666770, 26.676395, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4828, "airport3_las", "brwall_128", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 1, 10610, "fedmint_sfs", "ws_rollerdoor_blue", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 2, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 3, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 4, 6522, "cuntclub_law2", "marinawindow1_256", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 5, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 6, 16640, "a51", "concretemanky", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 7, 3241, "conhooses", "trail_door", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 9, 19517, "noncolored", "gen_white", 0x00000000);
	sasdob = CreateDynamicObject(8661, 2377.759033, -103.191482, 26.672969, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	sasdob = CreateDynamicObject(8661, 2377.721435, -85.731491, 26.673969, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	sasdob = CreateDynamicObject(8661, 2390.902343, -103.191482, 26.676967, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	sasdob = CreateDynamicObject(8661, 2390.873535, -85.731491, 26.675968, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 7555, "bballcpark1", "ws_carparknew2", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2357.874755, -98.714500, 24.924364, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2357.874755, -89.074516, 24.924364, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2369.080566, -87.924522, 25.834381, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2369.069091, -107.484512, 25.834381, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 5, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2357.874755, -108.344497, 24.924364, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2357.874755, -72.484565, 24.924364, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2362.618408, -113.084480, 24.924364, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2375.222167, -112.264503, 25.834381, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 5, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2372.286376, -113.084480, 24.924364, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2384.829345, -112.264503, 25.834381, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 5, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2394.280517, -112.264503, 25.834381, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 5, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2381.920166, -113.084480, 24.924364, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2353.048583, -77.433555, 25.750568, -10.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 9514, "711_sfw", "ws_carpark2", 0xFFFFFFFF);
	sasdob = CreateDynamicObject(19445, 2353.049560, -79.963615, 25.750568, -10.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 9514, "711_sfw", "ws_carpark2", 0xFFFFFFFF);
	sasdob = CreateDynamicObject(970, 2357.842529, -86.360343, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19464, 2367.870605, -97.473030, 35.643997, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "{000000}San Andreas", 140, "Ariel", 75, 1, 0x00000000, 0x00000000, 1);
	sasdob = CreateDynamicObject(970, 2357.842529, -90.480323, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2357.842529, -94.600265, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2357.842529, -98.740264, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2357.842529, -102.900245, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2357.842529, -107.000228, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2357.842529, -111.080207, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2359.904296, -113.120193, 27.152980, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(970, 2364.057128, -113.120193, 27.152980, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19464, 2367.859130, -97.553024, 34.594013, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "{000000}Sheriff Department", 140, "Ariel", 65, 1, 0x00000000, 0x00000000, 1);
	sasdob = CreateDynamicObject(970, 2366.078125, -113.118194, 27.152980, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2406.158935, -108.644470, 27.104366, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2396.608154, -108.644470, 27.104366, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.888183, -103.814544, 27.104366, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.871093, -94.224510, 27.104366, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.891357, -84.614425, 27.104366, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2353.346923, -81.634521, 24.115760, -10.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.881347, -80.605453, 27.102367, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2353.346923, -75.764533, 24.115760, -10.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(640, 2357.390625, -84.857543, 26.524393, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(640, 2357.401611, -90.237518, 26.524396, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(640, 2357.401611, -95.587516, 26.524396, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(640, 2357.401611, -106.317550, 26.524396, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(640, 2357.401611, -100.947540, 26.524396, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2357.874755, -79.444534, 24.924364, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(18762, 2357.478515, -80.736198, 25.714376, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(18762, 2357.467529, -85.696189, 25.714366, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(18980, 2357.474609, -100.672317, 25.713155, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(640, 2357.401611, -110.667556, 26.524396, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2406.158935, -108.644470, 28.904371, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(2420, 2369.031738, -100.432411, 26.673969, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 19595, "lsappartments1", "carpet4-256x256", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 1, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2399.050781, -108.644470, 28.904371, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(970, 2357.843505, -84.300354, 27.152980, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.888183, -103.814544, 29.264377, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.871093, -94.224510, 28.844366, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.891357, -84.614425, 29.144397, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2410.881347, -80.605453, 28.912393, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2392.676025, -109.807579, 35.082656, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19868, 2410.834716, -105.615547, 26.283960, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2392.756103, -106.307601, 35.082653, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2383.053955, -109.807579, 35.082656, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2383.141113, -106.307601, 35.082649, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2373.498291, -106.307601, 35.082649, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2373.472656, -109.807579, 35.082656, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2392.748535, -102.797607, 35.082641, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2383.121093, -102.797630, 35.082645, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(19445, 2373.481445, -102.797630, 35.082645, 0.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 10778, "airportcpark_sfse", "ws_carpark3", 0x00000000);
	sasdob = CreateDynamicObject(18755, 2376.395507, -88.952560, 37.112644, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 5, 1675, "wshxrefhse", "greygreensubuild_128", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 6, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 7, 10871, "blacksky_sfse", "ws_skywinsgreen", 0x00000000);
	SetDynamicObjectMaterial(sasdob, 9, 1448, "break_pallet", "slated", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.016113, -90.907356, 36.292659, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.746093, -90.177375, 36.292655, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2375.033203, -90.907356, 39.782596, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2376.624023, -90.907356, 39.782596, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2378.214599, -90.907356, 39.782596, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.833496, -90.907356, 36.292655, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.746093, -88.577369, 36.292655, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.746093, -87.027359, 36.292655, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.832031, -90.901855, 39.782596, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.102783, -90.187385, 36.292655, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.102783, -90.187385, 39.772651, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.102783, -88.587371, 36.292655, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.102783, -86.987380, 36.292655, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.833496, -86.267417, 36.292655, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2375.435058, -86.267417, 36.292655, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2377.034912, -86.267417, 36.292655, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2378.636474, -86.267417, 36.292655, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.026855, -86.247413, 36.292655, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.102783, -88.587463, 39.772651, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.102783, -86.987541, 39.772651, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.833496, -86.267555, 39.772651, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2375.435058, -86.267555, 39.772651, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2378.638183, -86.267555, 39.772651, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2377.036621, -86.267555, 39.772651, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.026855, -86.247413, 39.772663, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.738525, -86.977569, 39.772651, 0.000000, 0.000000, 360.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.021484, -90.901855, 39.782596, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.738525, -88.567527, 39.772651, 0.000000, 0.000000, 360.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.738525, -90.157524, 39.772651, 0.000000, 0.000000, 360.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.833496, -87.957534, 41.442619, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2375.425048, -87.957534, 41.442619, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2377.026123, -87.957534, 41.442619, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2379.017578, -87.957534, 41.442619, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2377.886474, -87.957534, 41.422622, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2373.833496, -89.177536, 41.432621, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2375.414550, -89.177536, 41.432621, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2377.004394, -89.177536, 41.432621, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2378.946289, -89.177536, 41.432621, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19427, 2377.886474, -89.217521, 41.402622, 0.000000, 90.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterial(sasdob, 0, 915, "airconext", "cj_plating3", 0x00000000);
	sasdob = CreateDynamicObject(19327, 2376.882812, -88.186859, 35.192649, 270.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "B", 50, "Webdings", 72, 1, 0xFFFF0000, 0x00000000, 0);
	sasdob = CreateDynamicObject(19327, 2376.412353, -89.656829, 35.192649, 270.000000, 90.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "''Aby miasto było\nbezpieczniejsze'' ~LSPD", 90, "Calibri", 32, 1, 0xFFFF0000, 0x00000000, 0);
	sasdob = CreateDynamicObject(19327, 2379.714843, -112.368782, 27.426277, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "Luis Cotta tu był", 90, "Ariel", 20, 1, 0xFFFF0000, 0x00000000, 1);
	sasdob = CreateDynamicObject(19327, 2379.714843, -112.368782, 27.206272, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "Stewart West tu sikał [*]", 90, "Ariel", 20, 1, 0xFFFF0000, 0x00000000, 1);
	sasdob = CreateDynamicObject(19327, 2379.714843, -112.368782, 26.936265, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "Kenyon Carrington tu srał [*]", 90, "Ariel", 20, 1, 0xFFFF0000, 0x00000000, 1);
	sasdob = CreateDynamicObject(19327, 2411.002685, -78.862030, 27.074380, -2.499998, 38.099990, 90.000000, 0, 0, -1, 450.00, 450.00); 
	SetDynamicObjectMaterialText(sasdob, 0, "JEBAĆ SASD!\nULANE KURWY!", 90, "Quartz MS", 32, 1, 0xFF001111, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	sasdob = CreateDynamicObject(19866, 2359.333251, -97.450904, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1211, 2352.228271, -75.131423, 25.844383, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(966, 2376.769775, -76.091903, 26.677967, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1223, 2368.328369, -93.952980, 25.373968, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(2245, 2368.562011, -99.344589, 26.913969, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(2245, 2368.562011, -96.084548, 26.913969, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3027, 2368.815185, -100.334335, 27.904409, 96.799964, 30.100006, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1665, 2368.889648, -100.432373, 27.913969, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(18673, 2368.879150, -100.386016, 26.293954, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1223, 2368.328369, -101.403007, 25.373968, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2361.871826, -93.542747, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2359.274658, -103.123939, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2361.959960, -98.989265, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2359.278564, -108.241371, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2361.988281, -104.073074, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2361.000488, -111.041465, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2362.085205, -109.372467, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2359.245605, -91.837989, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19866, 2361.708007, -88.047142, 25.932941, 0.000000, 0.000000, 147.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2410.834716, -78.475685, 26.283960, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2410.834716, -83.745651, 26.283960, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2410.834716, -89.005645, 26.283960, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2410.834716, -94.275627, 26.283960, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2410.834716, -99.905624, 26.283960, 0.000000, 0.000000, 270.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2408.073730, -108.595550, 26.283960, 0.000000, 0.000000, 540.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2402.805175, -108.595550, 26.283960, 0.000000, 0.000000, 540.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2397.525146, -108.595550, 26.283960, 0.000000, 0.000000, 540.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(19868, 2396.074462, -108.595550, 26.283960, 0.000000, 0.000000, 540.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(8673, 2364.298583, -75.670555, 28.033981, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(8673, 2384.698242, -75.670555, 28.033981, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(8673, 2401.421142, -75.670555, 28.033981, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3934, 2392.989013, -106.836959, 35.248580, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3934, 2382.816650, -106.836959, 35.248580, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3934, 2373.875244, -106.836959, 35.248580, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1688, 2396.362304, -86.176559, 36.142612, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1688, 2392.469482, -86.176559, 36.142612, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(1691, 2394.325683, -85.129829, 36.872611, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(18756, 2400.543212, -87.183769, 28.635950, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3877, 2368.851318, -112.499420, 36.732650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3877, 2398.515869, -112.499420, 36.732650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3877, 2398.515869, -82.929450, 36.732650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3877, 2368.879882, -82.929450, 36.732650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(18756, 2396.713134, -87.223770, 28.635950, 0.000000, 0.000000, 180.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(3504, 2399.368408, -107.580245, 27.976987, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 
	sasdob = CreateDynamicObject(11714, 2376.281982, -86.199295, 36.176883, 0.000000, 0.000000, 90.000000, 0, 0, -1, 450.00, 450.00); 


    return 1;
}

static StworzBramy()
{

	sasdob = CreateDynamicObject(968, 2376.758789, -75.897979, 27.477977, 0.000000, 90.000000, -93.1416, 0, -1, -1, 200.00, 200.00);
    DodajBrame(sasdob, 2376.758789, -75.897979, 27.477977, 0.000000, 90.000000, -93.1416, 2376.758789, -75.897979, 27.477977, 0.000000, 0.000000, -93.1416, 2, 3, BRAMA_UPR_TYPE_FRACTION, 1);//Brama na parking 
    
	new sasddu1 = CreateDynamicObject(1493, 2379.534667, -97.713157, 30.814994, 0.000000, 0.000000, 270.000000, 5, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(sasddu1, 0, -1, "none", "none", 0xFFFFFFFF);
	SetDynamicObjectMaterial(sasddu1, 1, 1649, "wglass", "carshowwin2", 0x00000000);

	new sasddu2 = CreateDynamicObject(1493, 2379.544677, -100.725143, 30.813995, 0.000000, 0.000000, 90.000000, 5, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(sasddu2, 0, -1, "none", "none", 0xFFFFFFFF);
	SetDynamicObjectMaterial(sasddu2, 1, 1649, "wglass", "carshowwin2", 0x00000000);
	DualGateAdd(sasddu1, 2379.534667, -97.713157, 30.814994, 0.000000, 0.000000, 270.000000, 2379.534667, -97.713157, 30.814994, 0.000000, 0.000000, 180.000000,
	sasddu2,  2379.544677, -100.725143, 30.813995, 0.000000, 0.000000, 90.000000,  2379.544677, -100.725143, 30.813995, 0.000000, 0.000000, -180.000000, 35, 4.0, BRAMA_UPR_TYPE_FRACTION, 1);

    return 1;
}
static UsunObiekty(playerid)
{
	
    RemoveBuildingForPlayer(playerid, 1446, 2366.060, -75.671, 28.250, 0.250);
	RemoveBuildingForPlayer(playerid, 1446, 2361.300, -75.671, 28.250, 0.250);
	RemoveBuildingForPlayer(playerid, 1446, 2370.840, -75.671, 28.250, 0.250);
	RemoveBuildingForPlayer(playerid, 1446, 2375.600, -75.671, 28.250, 0.250);
	RemoveBuildingForPlayer(playerid, 1446, 2356.520, -75.671, 28.250, 0.250);
    
	return 1;
}
