//BramyTelehamy.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: BramyTelehamy.pwn ]--------------------------------------------//
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
BramyTelehamy_Init()
{
	tmpobjid = CreateDynamicObject(19455, -2803.458251, -311.717468, 7.427357, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2803.288085, -311.731994, 7.427357, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2804.278808, -321.302612, 7.427357, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2804.108886, -321.317169, 7.427356, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2805.830322, -338.299591, 7.427356, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2806.664062, -347.872283, 7.427356, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2805.670410, -338.311187, 7.427356, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2806.485351, -347.907562, 7.427356, 0.000000, 0.000000, -4.900003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2646.369140, -220.458663, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2636.734863, -220.458663, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 6056, "venice_law", "stonewalls2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2663.546386, -220.458663, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2673.158935, -220.458663, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2673.158935, -220.638565, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2663.539794, -220.638565, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2646.369140, -220.628616, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
	tmpobjid = CreateDynamicObject(19455, -2636.745361, -220.628616, 4.578300, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);

	gateob = CreateDynamicObject(2933, -2805.061279, -330.407714, 7.451757, 0.000000, 0.000000, -95.399925, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		-2805.795654, -338.061981, 7.451757, 0.000000, 0.000000, -95.399925,
		-2805.061279, -330.407714, 7.451757, 0.000000, 0.000000, -95.399925,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 761);
	gateob = CreateDynamicObject(2933, -2655.535400, -220.487182, 4.601026, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		-2663.192138, -220.487182, 4.601026, 0.000000, 0.000000, 180.000000,
		-2655.535400, -220.487182, 4.601026, 0.000000, 0.000000, 180.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 761);	
}

BramyTelehamy_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1231, -2661.550, -220.516, 6.062, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, -2648.629, -220.570, 6.062, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, -2804.520, -325.968, 8.921, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, -2805.409, -333.796, 8.921, 0.250);	
	
}
