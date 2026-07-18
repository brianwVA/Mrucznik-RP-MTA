//opJeffMatson.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opJeffMatson.pwn ]--------------------------------------------//
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
opJeffMatson_Init() 
{
	tmpobjid = CreateDynamicObject(1408, 2268.333740, 151.780075, 26.030950, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(1408, 2262.893554, 151.780075, 26.030950, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2247.527832, 151.748535, 24.744358, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2257.887207, 151.748535, 24.744358, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5458, "macpark1tr_lae", "grasslong256", 0x00000000);
	tmpobjid = CreateDynamicObject(1492, 2258.680419, 151.729888, 24.014341, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2933, 2252.715087, 151.724090, 24.784374, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); // br zam
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	DodajBrame(tmpobjid,
		2252.715087, 151.724090, 24.784374, 0.000000, 0.000000, 0.000000,
		2252.715087, 151.724090, 23.334354, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1662);
}

opJeffMatson_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1408, 2256.629, 154.382, 26.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2256.629, 159.867, 26.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2261.350, 159.897, 26.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2261.350, 154.414, 26.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2264.110, 151.835, 26.039, 0.250);
	RemoveBuildingForPlayer(playerid, 779, 2264.560, 157.781, 25.726, 0.250);
}
