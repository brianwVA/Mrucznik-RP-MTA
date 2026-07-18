//opTreylo.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opTreylo.pwn ]--------------------------------------------//
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
opTreylo_Init() 
{
	tmpobjid = CreateDynamicObject(3408, 2213.188476, -86.033294, 25.403875, 0.000000, 0.000000, 84.700157, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(1408, 2211.042968, -83.938987, 26.289571, 0.000000, 4.599948, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(1408, 2205.612060, -83.938987, 26.676252, 0.000000, 3.399949, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(1408, 2200.178710, -83.958984, 26.890523, 0.000000, 1.199949, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(1408, 2213.855712, -97.830841, 26.014060, 0.000000, -0.000049, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(1408, 2213.855712, -92.380935, 26.014060, 0.000000, -0.000049, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateDynamicObject(2909, 2213.837646, -79.767883, 25.407075, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); // br zamkni?ta
	SetDynamicObjectMaterial(tmpobjid, 0, 19004, "roundbuilding1", "capitolwin1_lawn2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18835, "mickytextures", "whiteforletters", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 18835, "mickytextures", "whiteforletters", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 18835, "mickytextures", "whiteforletters", 0x00000000);
	DodajBrame(tmpobjid,
		2213.837646, -79.767883, 25.407075, 0.000000, 0.000000, 0.000000,
		2213.837646, -79.767883, 23.407030, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1787);
}

opTreylo_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 781, 2211.689, -84.648, 25.578, 0.250);
	RemoveBuildingForPlayer(playerid, 3408, 2213.770, -83.960, 25.484, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2211.199, -83.343, 26.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2205.659, -83.343, 26.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2200.030, -83.343, 26.718, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2213.739, -92.710, 26.054, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2213.739, -98.117, 26.054, 0.250);
}
