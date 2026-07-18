//opWojtus.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opWojtus.pwn ]--------------------------------------------//
//Autor: LilkaMiko
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
opWojtus_Init()
{
	tmpobjid = CreateDynamicObject(2115, 2462.393554, 144.391845, 25.907165, 0.000000, 0.000000, -31.299997, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2887, "a51_spotlight", "stormdrain5_nt", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2449.010253, 143.959747, 26.729951, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2449.010253, 139.309570, 26.729951, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2473.560791, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2449.010253, 134.659439, 26.729951, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2449.010253, 130.059295, 26.729951, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2449.010253, 125.419395, 26.729951, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2461.614746, 143.043518, 26.400659, 0.000000, 0.000000, -120.399986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2474.056640, 139.283523, 26.702947, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2474.056640, 143.943618, 26.702947, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2474.046630, 134.623458, 26.702947, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2474.046630, 129.973510, 26.702947, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(1446, 2474.046630, 125.323493, 26.702947, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2471.959228, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2465.716308, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2464.114746, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2461.032226, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2461.822753, 121.758399, 23.992319, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 16093, "a51_ext", "des_backdoor1", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2462.420654, 142.559219, 26.400659, 0.000000, 0.000000, -120.399986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2464.125976, 145.234695, 26.540660, 0.000000, 0.000000, 59.999996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2459.430664, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2463.296386, 145.678726, 26.540660, 0.000000, 0.000000, 59.999996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "flatdoor01_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2457.829101, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2456.227783, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2454.646240, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2453.044677, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2451.443115, 121.762748, 24.714357, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2450.872558, 121.760818, 23.954782, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 16093, "a51_ext", "des_backdoor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2462.580322, 144.667114, 26.703804, 0.000000, 0.000000, 148.200012, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 18835, "mickytextures", "smileyface2", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2459.951416, 143.899932, 25.829460, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2459.951416, 142.149917, 25.829460, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2459.951416, 140.209930, 25.829460, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2459.971923, 139.029983, 25.829460, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2461.721679, 139.029983, 25.669460, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2464.122314, 139.029983, 25.519454, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(11734, 2458.340576, 125.820701, 26.705650, 0.000000, 0.000000, -123.500000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(3407, 2449.141357, 121.973419, 25.684442, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2989, "imy_skylx", "skylightkb", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 2463.066162, 140.169937, 25.709611, 0.000000, 0.000000, -179.599960, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14535, "ab_wooziec", "ab_butfly_sword", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10765, "airportgnd_sfse", "ap_metal1", 0x00000000);
	tmpobjid = CreateDynamicObject(1670, 2462.754394, 144.202957, 26.717699, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2463.310791, 143.800689, 26.857891, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2463.310791, 143.690689, 26.857891, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2463.420898, 143.800689, 26.857891, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19572, 2460.116455, 141.108383, 25.907766, 0.000000, 0.000000, -10.899998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19572, 2460.188476, 141.481506, 25.907766, 0.000000, 0.000000, -10.899998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 2467.866455, 143.849853, 25.766620, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2474.129638, 121.839866, 26.366582, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 2467.795410, 143.687500, 26.069963, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2450.892822, 122.539848, 25.566564, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2450.892822, 124.700035, 25.856571, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18692, 2463.017578, 139.899459, 25.335237, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2804, 2463.012207, 140.235290, 26.596576, 0.000000, 0.000000, -79.100006, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2769, 2463.225341, 144.116622, 26.743816, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19870, 2466.441650, 121.764541, 24.713857, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2989, "imy_skylx", "skylightkb", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	DodajBrame(tmpobjid,
		2466.441650, 121.764541, 23.213823, 0.000000, 0.000000, 0.000000,
		2466.441650, 121.764541, 24.713857, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1630);
}

opWojtus_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1408, 2474.129, 124.694, 27.015, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2474.129, 131.233, 27.015, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2474.129, 137.171, 27.015, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2474.129, 142.679, 27.015, 0.250);
}
