//opCzolgista.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opCzolgista.pwn ]--------------------------------------------//
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
opCzolgista_Init()
{
	tmpobjid = CreateDynamicObject(19362, 2333.817626, 192.265853, 24.848852, 0.000000, 0.000000, -0.099999, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2333.812011, 189.065841, 24.848852, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2333.807373, 185.875946, 24.848852, 0.000000, 0.000000, -0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2333.799804, 182.675765, 24.848852, 0.000000, 0.000000, -0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2333.793212, 179.505767, 24.848852, 0.000000, 0.000000, -0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2333.786376, 177.501419, 24.854366, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2332.250000, 176.762329, 24.888843, -0.699998, 0.000000, -90.500007, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2329.181152, 176.809188, 25.049669, -3.899996, 0.000000, -90.500007, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2326.265625, 176.814437, 25.640340, -21.500003, 0.000000, -90.500007, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2332.176513, 201.701477, 25.008310, -4.700000, 0.000000, -89.099967, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2328.987548, 201.651321, 25.270509, -4.700000, 0.000000, -89.099967, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2325.648925, 201.598388, 25.864694, -14.899990, 0.000000, -89.399963, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 2329.883300, 185.122879, 26.783157, 1.200001, -1.099998, 100.000030, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19125, 2327.467773, 193.440719, 26.477008, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 2330.996337, 180.609085, 25.558368, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2331.111328, 180.987213, 26.255134, 0.899999, 0.000000, 59.800003, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19125, 2326.187988, 193.440719, 26.627006, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19125, 2333.008056, 193.350708, 25.577013, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19125, 2331.787353, 193.350708, 25.767013, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2933, 2333.846435, 197.428421, 24.877325, 0.000000, 0.000000, 89.900032, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "scaff2flas", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	DodajBrame(tmpobjid,
		2333.846435, 197.428405, 20.137325, 0.000000, 0.000000, 89.900032,
		2333.846435, 197.428421, 24.877325, 0.000000, 0.000000, 89.900032,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1717);
}

opCzolgista_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1408, 2333.800, 190.671, 26.046, 0.250);
	RemoveBuildingForPlayer(playerid, 3408, 2333.860, 193.742, 25.445, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2331.000, 193.578, 26.507, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2333.800, 184.304, 26.046, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2333.800, 178.804, 26.046, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2331.000, 176.695, 26.296, 0.250);
}
