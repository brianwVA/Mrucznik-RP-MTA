//opBeryl.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opBeryl.pwn ]--------------------------------------------//
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
opBeryl_Init()
{
	tmpobjid = CreateDynamicObject(1255, 2187.662597, 54.436813, 27.113756, 0.000000, 0.000000, 51.399974, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 5769, "sunrise09_lawn", "hollysign03_LAw", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 2186.311035, 55.516052, 27.113756, 0.000000, 0.000000, 51.399974, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 5769, "sunrise09_lawn", "hollysign03_LAw", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 2210.190917, 69.892837, 26.178699, 0.400000, 7.800000, -20.099996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 2209.434082, 67.793952, 26.252294, 0.400000, 7.800000, -20.099996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1727, 2186.182617, 59.727672, 26.843750, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18657, "lightbeams", "white-512x512", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19800, "lsacarpark1", "dt_officewall1", 0x00000000);
	tmpobjid = CreateDynamicObject(1727, 2186.182617, 60.897682, 26.843750, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18657, "lightbeams", "white-512x512", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19800, "lsacarpark1", "dt_officewall1", 0x00000000);
	tmpobjid = CreateDynamicObject(1727, 2188.464843, 58.997703, 26.843750, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18657, "lightbeams", "white-512x512", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19800, "lsacarpark1", "dt_officewall1", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 2209.265380, 68.875877, 27.394210, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1827, 2188.317382, 61.038757, 26.843750, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2196.437988, 57.499626, 26.451620, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2196.437988, 64.169555, 26.451620, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2194.596191, 59.569606, 26.451620, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 2196.323486, 58.717277, 27.723770, 0.000000, 0.000000, 137.399917, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 5769, "sunrise09_lawn", "hollysign03_LAw", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2207.678466, 63.271232, 26.316579, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2207.678466, 61.341232, 26.316579, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2212.458496, 63.271232, 25.506580, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2212.458496, 61.341236, 25.486579, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1670, 2188.407714, 60.497089, 27.293760, 0.000000, 0.000000, 31.900001, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1670, 2187.971923, 61.022048, 27.293760, 0.000000, 0.000000, -129.299987, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19831, 2194.192382, 54.772605, 26.843750, 0.000000, 0.000000, -124.199943, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19882, 2193.995605, 54.613819, 27.683769, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19882, 2194.265869, 54.963768, 27.683769, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19583, 2194.184082, 54.915157, 27.223756, 0.000000, 0.000000, 1.799998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18692, 2193.968750, 54.452400, 26.343738, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 2194.698974, 57.618221, 27.353761, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 2194.698974, 64.118095, 27.353761, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 2195.416259, 58.455467, 27.581645, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 2184.830566, 52.858226, 26.983753, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 2184.830566, 63.738155, 26.983753, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 2211.277343, 72.595344, 25.740047, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 61.230644, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2213.840576, 63.546279, 24.114343, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling1128", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 64.330619, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 65.930610, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 67.530487, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 69.130500, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 70.730400, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 72.330352, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 73.930381, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.831298, 75.530387, 24.874361, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.110595, 76.420463, 24.874361, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2211.363281, 76.420463, 24.946962, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2209.772216, 76.420463, 25.082822, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2208.173339, 76.420463, 25.219520, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2206.587402, 76.420463, 25.355339, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2204.996582, 76.420463, 25.491991, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2213.040527, 51.810462, 24.874361, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2211.363281, 51.820484, 24.946962, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2209.760009, 51.820484, 25.084470, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2208.172119, 51.820484, 25.220306, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2206.567138, 51.820484, 25.357828, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2204.969238, 51.820484, 25.494518, 4.899997, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2989, "imy_skylx", "skylightkb", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling1128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14668, "711c", "sec_camera1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14668, "711c", "sec_camera1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 14668, "711c", "gun_ceiling1128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 14668, "711c", "gun_ceiling1128", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2205.922851, 63.458065, 26.683248, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2205.922851, 61.038108, 26.683248, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(894, 2212.301757, 76.244819, 25.621732, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1280, 2197.121093, 59.226989, 27.823772, 0.000000, 0.000000, 0.299970, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2933, 2213.862792, 56.036727, 24.914360, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2989, "imy_skylx", "skylightkb", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling1128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14668, "711c", "sec_camera1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14668, "711c", "sec_camera1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 14668, "711c", "gun_ceiling1128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 14668, "711c", "gun_ceiling1128", 0x00000000);
	DodajBrame(tmpobjid,
		2213.862792, 56.036727, 23.134319, 0.000000, 0.000000, 90.000000,
		2213.862792, 56.036727, 24.914360, 0.000000, 0.000000, 90.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 833);
}

opBeryl_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1410, 2206.760, 76.531, 26.953, 0.250);
	RemoveBuildingForPlayer(playerid, 1410, 2211.479, 76.531, 26.468, 0.250);
	RemoveBuildingForPlayer(playerid, 1410, 2213.780, 74.195, 26.132, 0.250);
	RemoveBuildingForPlayer(playerid, 1410, 2213.780, 66.945, 26.132, 0.250);
	RemoveBuildingForPlayer(playerid, 1410, 2213.780, 62.148, 26.132, 0.250);
	RemoveBuildingForPlayer(playerid, 779, 2210.040, 68.507, 25.789, 0.250);
}
