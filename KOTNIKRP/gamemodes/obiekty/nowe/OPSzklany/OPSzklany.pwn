//OPSzklany.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: OPSzklany.pwn ]--------------------------------------------//
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
OPSzklany_Init()
{
	tmpobjid = CreateDynamicObject(19362, 957.873046, -692.204040, 120.553123, 0.000000, -0.499998, -58.600009, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 955.158508, -693.860656, 120.553123, 0.000000, -0.499998, -58.600009, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 952.444335, -695.517395, 120.553123, 0.000000, -0.499998, -58.600009, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 949.713012, -697.184692, 120.553123, 0.000000, -0.499998, -58.600009, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 948.885803, -699.422973, 120.539001, -0.200000, -0.599999, -161.000076, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(1723, 957.218566, -695.831176, 121.210937, 0.000000, 0.000000, -62.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1723, 953.916015, -696.423339, 121.210937, 0.000000, 0.000000, 28.999996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2115, 955.765075, -697.437255, 121.180931, 0.000000, 0.000000, -61.999992, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1724, 957.505493, -699.697875, 121.190948, 0.000000, 0.000000, -152.500045, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1670, 955.977050, -697.890136, 122.000923, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 955.650268, -697.217407, 121.970939, 0.000000, 0.000000, -152.600051, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 18901, "matclothes", "helmet", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 957.019348, -694.544738, 121.010932, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 960.059631, -699.244750, 121.010932, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 949.339416, -698.424804, 121.010932, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 952.027954, -697.651062, 121.180931, 0.000000, 0.000000, 61.999996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 4830, "airport2", "sanairtex1", 0x00000000);
	tmpobjid = CreateDynamicObject(2829, 956.430053, -698.400817, 121.990936, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 9514, "711_sfw", "brick", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 9514, "711_sfw", "brick", 0x00000000);
	tmpobjid = CreateDynamicObject(1339, 949.627197, -703.817932, 121.850929, 0.000000, 0.000000, -60.500003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	tmpobjid = CreateDynamicObject(3407, 948.087890, -708.077636, 121.200927, 0.000000, 0.000000, -106.900024, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(949, 946.476684, -709.091308, 121.860946, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(949, 945.806518, -707.941284, 121.860946, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 946.174743, -708.469970, 121.060935, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19815, 947.001770, -716.537231, 122.770957, 0.000000, 0.000000, -61.599979, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1073, 944.119323, -719.004455, 122.610946, 0.000000, 0.000000, 26.999990, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19828, 942.825805, -716.676757, 122.570930, 0.000000, 0.000000, 120.200057, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 944.782043, -717.843566, 123.920913, 0.000000, 0.000000, 26.799997, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 959.162536, -701.317565, 121.240951, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	gateob = CreateDynamicObject(19862, 944.771179, -715.333068, 123.511009, 0.000000, 0.000000, 28.699989, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		945.966918, -717.517272, 123.511009, 90.000000, 360.000000, 28.699989,
		944.771179, -715.333068, 123.511009, 0.000000, 0.000000, 28.699989,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1661);
}

OPSzklany_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1408, 950.703, -696.671, 121.773, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 955.445, -693.632, 121.789, 0.250);
	RemoveBuildingForPlayer(playerid, 1409, 948.007, -698.789, 121.319, 0.250);
	RemoveBuildingForPlayer(playerid, 1409, 948.492, -699.742, 121.296, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 949.414, -700.609, 121.796, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 956.742, -696.742, 121.203, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 965.390, -713.390, 121.203, 0.250);
}
