//opLuizPuccinii.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opLuizPuccinii.pwn ]--------------------------------------------//
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
opLuizPuccinii_Init() 
{
	tmpobjid = CreateDynamicObject(19433, 1679.202392, -2098.590332, 12.276868, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1679.202392, -2100.181884, 12.276868, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1679.202392, -2101.783447, 12.276868, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1679.813354, -2102.986572, 12.276868, 0.000000, 0.000000, 54.300033, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1681.224243, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1682.824218, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(1491, 1683.612060, -2103.407714, 11.106842, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "gz_vicdoor1", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1685.915283, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1687.505859, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1689.107421, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1690.708984, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1692.310424, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1693.901977, -2103.435058, 12.276868, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1694.782836, -2102.724365, 12.276868, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 7509, "vgwestretail1", "hedge2_256", 0x00000000);
	gateob = CreateDynamicObject(19870, 1674.420043, -2096.419433, 13.956889, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		1670.016357, -2096.419433, 13.956889, 0.000000, 0.000000, 0.000000,
		1674.420043, -2096.419433, 13.956889, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 12);
	tmpobjid = CreateDynamicObject(2909, 1698.934936, -2103.001220, 12.546875, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); // zam
	SetDynamicObjectMaterial(tmpobjid, 0, 6060, "shops2_law", "newall8-1blue", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	DodajBrame(tmpobjid,
		1698.934936, -2103.001220, 12.546875, 0.000000, 0.000000, 90.000000,
		1698.934936, -2103.001220, 10.716861, 0.000000, 0.000000, 90.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 12);
}

opLuizPuccinii_Connect(playerid) 
{
	RemoveBuildingForPlayer(playerid, 1226, 1681.969, -2108.300, 16.390, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1682.140, -2102.350, 11.781, 0.250);
}
