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
//By Sergio
//

//-----------------<[ Gwne funkcje: ]>-------------------
WhiteHouseExt_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}

WhiteHouseExt_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{

	pevori2 = CreateDynamicObject(18762, 1104.149291, -1993.654174, 67.397735, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1107.150146, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1107.815185, -1993.666503, 69.180610, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1111.510620, -1993.654174, 67.397735, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1108.511474, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1114.513061, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1115.178100, -1993.666503, 69.180610, -0.000001, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1115.874389, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1118.871582, -1993.654174, 67.397735, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1121.870605, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1122.535644, -1993.666503, 69.180610, -0.000004, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1123.231933, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1126.229125, -1993.654174, 67.397735, 0.000000, -0.000001, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1129.235839, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1129.900878, -1993.666503, 69.180610, -0.000007, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1130.597167, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1133.594360, -1993.654174, 67.397735, 0.000000, -0.000004, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1136.597656, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1137.262695, -1993.666503, 69.180610, -0.000009, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1137.958984, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1140.956176, -1993.654174, 67.397735, 0.000000, -0.000007, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1143.959960, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1144.625000, -1993.666503, 69.180610, -0.000017, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1145.321289, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1148.318481, -1993.654174, 67.397735, 0.000000, -0.000014, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1151.312377, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1151.977416, -1993.666503, 69.180610, -0.000024, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1152.673706, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1155.670898, -1993.654174, 67.397735, 0.000000, -0.000022, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1158.666381, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1159.331420, -1993.666503, 69.180610, -0.000035, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1160.027709, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1163.024902, -1993.654174, 67.397735, 0.000000, -0.000031, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1166.019653, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1166.684692, -1993.666503, 69.180610, -0.000041, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1167.380981, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1170.378173, -1993.654174, 67.397735, 0.000000, -0.000039, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1173.372314, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1174.037353, -1993.666503, 69.180610, -0.000049, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1174.733642, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1177.730834, -1993.654174, 67.397735, 0.000000, -0.000047, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1180.725341, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1181.390380, -1993.666503, 69.180610, -0.000057, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1182.086669, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1185.083862, -1993.654174, 67.397735, 0.000000, -0.000055, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1188.079101, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1188.744140, -1993.666503, 69.180610, -0.000065, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1189.440429, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1192.437622, -1993.654174, 67.397735, 0.000000, -0.000061, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1195.431030, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1196.096069, -1993.666503, 69.180610, -0.000070, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1196.792358, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1199.789550, -1993.654174, 67.397735, 0.000000, -0.000067, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1202.784179, -1993.654174, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1203.449218, -1993.666503, 69.180610, -0.000075, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1204.145507, -1993.651123, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.142700, -1993.654174, 67.397735, 0.000000, -0.000072, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143188, -1996.652832, 68.007812, 0.000031, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.130859, -1997.317993, 69.180610, -0.000077, -0.000031, 0.000012, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.146362, -1998.014282, 68.010810, 0.000031, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.133911, -1998.916992, 69.180610, -0.000076, -0.000030, 0.000012, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2002.512817, 68.867721, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2007.904174, 68.867721, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2033.135253, 70.067718, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2040.875854, 70.067718, 0.000030, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2066.115478, 68.867721, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2071.478759, 68.867721, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2001.812866, 68.167724, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2008.604125, 68.167724, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2065.415527, 68.167724, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2072.178710, 68.167724, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149291, -2080.336669, 67.397735, 0.000000, -0.000001, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1107.150146, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1107.815185, -2080.348876, 69.180610, -0.000001, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1111.510620, -2080.336669, 67.397735, 0.000000, -0.000001, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1108.511474, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1114.513061, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1115.178100, -2080.348876, 69.180610, -0.000004, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1115.874389, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1118.871582, -2080.336669, 67.397735, 0.000000, -0.000001, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1121.870605, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1122.535644, -2080.348876, 69.180610, -0.000007, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1123.231933, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1126.229125, -2080.336669, 67.397735, 0.000000, -0.000004, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1128.638305, -2080.333740, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1136.133911, -2080.336914, 68.867721, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2077.339111, 68.007812, -0.000022, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1131.040405, -2080.336914, 68.867721, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.153076, -2076.674072, 69.180610, -0.000079, 0.000022, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1139.808227, -2080.345947, 69.183609, -0.000012, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1138.722778, -2080.330566, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1140.956176, -2080.336669, 67.397735, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1143.959960, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1144.625000, -2080.348876, 69.180610, -0.000019, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1145.321289, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1148.318481, -2080.336669, 67.397735, 0.000000, -0.000017, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1151.312377, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1151.977416, -2080.348876, 69.180610, -0.000027, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1152.673706, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1155.670898, -2080.336669, 67.397735, 0.000000, -0.000024, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1158.666381, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1159.331420, -2080.348876, 69.180610, -0.000037, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1160.027709, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1163.024902, -2080.336669, 67.397735, 0.000000, -0.000035, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1166.019653, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1166.684692, -2080.348876, 69.180610, -0.000045, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1167.380981, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1170.378173, -2080.336669, 67.397735, 0.000000, -0.000041, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1173.372314, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1174.037353, -2080.348876, 69.180610, -0.000051, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1174.733642, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1177.730834, -2080.336669, 67.397735, 0.000000, -0.000049, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1180.725341, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1181.390380, -2080.348876, 69.180610, -0.000059, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1182.086669, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1185.083862, -2080.336669, 67.397735, 0.000000, -0.000057, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1188.079101, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1188.744140, -2080.348876, 69.180610, -0.000067, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1189.440429, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1192.437622, -2080.336669, 67.397735, 0.000000, -0.000065, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1195.431030, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1196.096069, -2080.348876, 69.180610, -0.000072, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1196.792358, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1199.789550, -2080.336669, 67.397735, 0.000000, -0.000070, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1202.784179, -2080.336669, 68.007812, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1203.449218, -2080.348876, 69.180610, -0.000076, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1204.145507, -2080.333496, 68.010810, 0.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.142700, -2080.336669, 67.397735, 0.000000, -0.000075, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1127.334594, -2080.345947, 69.183609, -0.000012, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.137695, -2075.977783, 68.010810, -0.000022, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140747, -2075.164062, 68.013809, -0.000022, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2062.416748, 68.007812, -0.000035, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.153076, -2061.751708, 69.180610, -0.000079, 0.000035, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.137695, -2061.055419, 68.010810, -0.000035, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2058.058349, 67.397735, -0.000035, -0.000076, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2055.062255, 68.007812, -0.000051, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.153076, -2054.397216, 69.180610, -0.000079, 0.000051, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.137695, -2053.700927, 68.010810, -0.000051, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2050.703857, 67.397735, -0.000051, -0.000076, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2047.708984, 68.007812, -0.000055, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.153076, -2047.043945, 69.180610, -0.000079, 0.000055, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.137695, -2046.347656, 68.010810, -0.000055, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.140869, -2043.350585, 67.397735, -0.000055, -0.000076, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143188, -2011.608032, 68.007812, 0.000037, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.130859, -2012.273193, 69.180610, -0.000077, -0.000037, 0.000012, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.146362, -2012.969482, 68.010810, 0.000037, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2015.966552, 67.397735, 0.000037, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143188, -2018.969970, 68.007812, 0.000039, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.130859, -2019.635131, 69.180610, -0.000077, -0.000039, 0.000012, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.146362, -2020.331420, 68.010810, 0.000039, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2023.328491, 67.397735, 0.000039, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143188, -2026.330200, 68.007812, 0.000045, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.130859, -2026.995361, 69.180610, -0.000077, -0.000045, 0.000012, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.146362, -2027.691650, 68.010810, 0.000045, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2030.688720, 67.397735, 0.000045, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(4824, 1224.430053, -2037.010009, 62.929698, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2041.875854, 69.067718, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2032.135253, 69.067718, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2031.135253, 68.067718, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.143432, -2042.875854, 68.067718, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.146484, -2040.752685, 70.070716, 0.000030, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.149414, -1998.832031, 68.013809, 0.000030, 90.000000, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1207.156127, -2075.079589, 69.180610, -0.000078, 0.000022, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.152221, -2075.930175, 68.010810, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.154418, -2076.655273, 69.180610, -0.000000, 0.000000, 180.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149169, -2077.341552, 68.007812, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149291, -2072.951904, 67.397735, 0.000000, -0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.152221, -2069.958251, 68.010810, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.154418, -2069.272949, 69.180610, -0.000000, 0.000000, 180.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149291, -2065.568115, 67.397735, 0.000000, -0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149169, -2068.563476, 68.007812, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149169, -2062.582031, 68.007812, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.154418, -2061.890625, 69.180610, -0.000000, 0.000000, 180.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149291, -2058.176269, 67.397735, 0.000000, -0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.152221, -2061.160644, 68.010810, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149291, -2049.958740, 67.397735, 0.000000, -0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.149169, -2055.189453, 68.007812, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.152221, -2052.326904, 68.010810, 0.000000, 90.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.154418, -2055.268798, 69.180610, -0.000000, 0.000000, 180.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.154418, -2053.667236, 69.180610, -0.000000, 0.000000, 180.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(19982, 1104.151245, -2057.673339, 67.177658, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1101.939331, -2049.734863, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1098.448364, -2049.734863, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1098.448364, -2049.564697, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1101.939453, -2049.564697, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1207.146484, -2033.262329, 70.070716, 0.000031, -0.000075, -89.999992, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154418, -2024.348144, 67.397735, 0.000000, -0.000007, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.151489, -1998.050292, 68.010810, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.149291, -1997.325195, 69.180610, -0.000000, 0.000004, 0.000017, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154541, -1996.638916, 68.007812, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154418, -2001.028564, 67.397735, 0.000000, -0.000007, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.151489, -2004.022216, 68.010810, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.149291, -2004.707519, 69.180610, -0.000000, 0.000004, 0.000017, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154418, -2008.412353, 67.397735, 0.000000, -0.000007, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154541, -2005.416992, 68.007812, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154541, -2011.398437, 68.007812, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.149291, -2012.089843, 69.180610, -0.000000, 0.000004, 0.000017, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154418, -2015.804199, 67.397735, 0.000000, -0.000007, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.151489, -2012.819824, 68.010810, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.154541, -2018.791015, 68.007812, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18762, 1104.151489, -2021.653564, 68.010810, -0.000004, 90.000000, -89.999969, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.149291, -2019.041992, 69.180610, -0.000000, 0.000004, 0.000017, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(983, 1104.149291, -2020.643554, 69.180610, -0.000000, 0.000004, 0.000017, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 4, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 5, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	pevori2 = CreateDynamicObject(19982, 1104.152465, -2016.307128, 67.177658, 0.000000, -0.000004, -179.999984, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1101.900512, -2024.573852, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1098.399047, -2024.573852, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1098.399047, -2024.754028, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(19431, 1101.900268, -2024.754028, 68.177841, 90.000000, 90.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 5986, "chateau_lawn", "chatwall01_law", 0x00000000);
	pevori2 = CreateDynamicObject(18765, 1116.398803, -2052.031494, 71.019744, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1111.568115, -2047.238037, 73.919708, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1111.568115, -2056.840332, 73.919708, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1121.188598, -2056.840332, 73.919708, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1121.188598, -2047.258666, 73.919708, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(18765, 1116.398803, -2021.909057, 71.019744, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1111.568115, -2017.115600, 73.919708, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1111.568115, -2026.717895, 73.919708, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1121.188598, -2026.717895, 73.919708, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	pevori2 = CreateDynamicObject(3666, 1121.188598, -2017.136230, 73.919708, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 
	SetDynamicObjectMaterial(pevori2, 0, 3980, "cityhall_lan", "LAcityhwal1", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pevori2 = CreateDynamicObject(3934, 1116.475708, -2051.887207, 73.509750, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.153198, -2049.957031, 67.557838, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.153198, -2058.175048, 67.557838, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.153198, -2065.560058, 67.557838, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.153198, -2072.946777, 67.557838, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.153198, -2080.333984, 67.557838, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1111.515502, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1118.870239, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1126.233154, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1140.951538, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1148.314086, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1155.678955, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1163.040039, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1170.360961, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1177.741943, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1185.072509, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1192.433593, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1199.776367, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1207.147705, -2080.333984, 67.557838, 0.000000, 0.000000, 90.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1207.147705, -2058.066894, 67.557838, 0.000000, 0.000000, 360.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1207.147705, -2050.694824, 67.557838, 0.000000, 0.000000, 360.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1207.147705, -2023.314086, 67.557838, 0.000000, 0.000000, 360.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1207.147705, -2015.962158, 67.557838, 0.000000, 0.000000, 360.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1207.147705, -1993.660522, 67.557838, 0.000000, 0.000000, 360.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1199.803833, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1192.437866, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1185.085449, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1177.753173, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1170.381225, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1163.027343, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1155.672119, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1148.318725, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1140.956787, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1133.593505, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1126.239868, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1118.876953, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1111.513061, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.146240, -1993.660522, 67.557838, 0.000000, 0.000000, 450.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.146240, -2001.021240, 67.557838, 0.000000, 0.000000, 540.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.146240, -2008.403686, 67.557838, 0.000000, 0.000000, 540.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.146240, -2015.797119, 67.557838, 0.000000, 0.000000, 540.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1232, 1104.146240, -2024.340820, 67.557838, 0.000000, 0.000000, 540.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1213.670532, -2040.662109, 68.497833, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1213.670532, -2033.368652, 68.497833, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1210.928222, -2033.368652, 68.497833, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1210.938354, -2040.662109, 68.497833, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1218.330688, -2040.662109, 66.797859, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1218.330688, -2033.405395, 66.797859, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1221.181030, -2033.405395, 64.727821, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1221.181030, -2040.607666, 64.727821, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1226.912963, -2040.607666, 64.727821, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1226.912963, -2033.424316, 64.727821, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1231.544555, -2033.424316, 62.597942, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1231.544555, -2040.625976, 62.597942, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1238.145874, -2040.625976, 60.537998, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(1215, 1238.145874, -2033.405029, 60.537998, 0.000000, 0.000000, 0.000000, -1, -1, -1, 900.00, 900.00); 
	pevori2 = CreateDynamicObject(3934, 1116.475708, -2021.764770, 73.509750, 0.000000, -0.000009, 0.000000, -1, -1, -1, 900.00, 900.00); 

	
	
	//By simeone i santiago - podmiana tekstur
	/*
	pevori2 = CreateDynamicObject(4851, 1182.010009, -1987.630004, 39.992198+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 12869, "ce_ground04", "carpark_128", 0x00000000);
	pevori2 = CreateDynamicObject(4812, 1023.400024, -2166.100097, 23.101600+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 1, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	pevori2 = CreateDynamicObject(4823, 1338.329956, -1976.660034, 36.609401, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 5, 10756, "airportroads_sfse", "sf_road5", 0x00000000);
	pevori2 = CreateDynamicObject(4852, 1401.459960, -1994.589965, 35.437500+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 2, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 6, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 7, 12869, "ce_ground04", "carpark_128", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 9, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	pevori2 = CreateDynamicObject(4811, 1069.670043, -2270.899902, 23.101600+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 1, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	pevori2 = CreateDynamicObject(4845, 1222.829956, -2291.229980, 7.070310+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 2, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	pevori2 = CreateDynamicObject(4810, 1095.060058, -2214.219970, 41.726600+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 5, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 6, 12869, "ce_ground04", "carpark_128", 0x00000000);
	pevori2 = CreateDynamicObject(4876, 1582.300048, -2002.229980, 26.609399+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	pevori2 = CreateDynamicObject(4878, 1530.829956, -1969.130004, 26.390600+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 3, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	pevori2 = CreateDynamicObject(4888, 1236.199951, -1876.160034, 21.453100+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 11, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	pevori2 = CreateDynamicObject(4813, 1042.270019, -2029.800048, 23.101600+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 1, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	pevori2 = CreateDynamicObject(4875, 1270.689941, -2196.790039, 42.562500+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	SetDynamicObjectMaterial(pevori2, 5, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 6, 12869, "ce_ground04", "carpark_128", 0x00000000);
	pevori2 = CreateDynamicObject(4872, 1610.930053, -2010.630004, 23.132799+0.0035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 400.00, 400.00); 
	*/
	return 1;
}


static UsunObiekty(playerid)
{ 

	RemoveBuildingForPlayer(playerid, 951, 1103.880, -2011.969, 68.695, 0.250);
	RemoveBuildingForPlayer(playerid, 618, 1102.910, -1990.670, 61.062, 0.250);
	RemoveBuildingForPlayer(playerid, 691, 1208.650, -2000.069, 67.390, 0.250);
	RemoveBuildingForPlayer(playerid, 951, 1175.069, -1993.949, 68.718, 0.250);
	RemoveBuildingForPlayer(playerid, 618, 1165.130, -1994.119, 66.804, 0.250);
	RemoveBuildingForPlayer(playerid, 762, 1157.380, -1989.459, 67.734, 0.250);
	RemoveBuildingForPlayer(playerid, 661, 1148.699, -1992.979, 67.148, 0.250);
	RemoveBuildingForPlayer(playerid, 951, 1209.630, -2008.550, 68.648, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1127.239, -2080.780, 66.375, 0.250);
	RemoveBuildingForPlayer(playerid, 691, 1144.079, -2076.379, 68.101, 0.250);
	RemoveBuildingForPlayer(playerid, 691, 1175.609, -2079.469, 67.796, 0.250);
	RemoveBuildingForPlayer(playerid, 762, 1189.770, -2078.370, 70.742, 0.250);
	RemoveBuildingForPlayer(playerid, 691, 1207.609, -2079.080, 66.781, 0.250);
	RemoveBuildingForPlayer(playerid, 691, 1097.040, -2079.449, 61.546, 0.250);
	RemoveBuildingForPlayer(playerid, 951, 1104.160, -2060.770, 68.648, 0.250);
	RemoveBuildingForPlayer(playerid, 951, 1209.910, -2065.580, 68.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1530, 1118.910, -2008.239, 75.023, 0.250);
	RemoveBuildingForPlayer(playerid, 4824, 1224.430, -2037.010, 62.929, 0.250);
	RemoveBuildingForPlayer(playerid, 4920, 1224.430, -2037.010, 62.929, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1204.4922, -2039.8047, 68.3750, 0.25);
	return 1;
}

static StworzBramy()
{
	pevori2 = CreateDynamicObject(3036, 1207.249511, -2007.609619, 68.130615, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); // prawe, zamkniete
	SetDynamicObjectMaterial(pevori2, 0, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	DodajBrame(pevori2, 1207.249511, -2007.609619, 68.130615, 0.000000, 0.000000, 90.000000, 1207.249511, -2007.609619, 66.140579, 0.000000, 0.000000, 90.000000, 5, 11.5, BRAMA_UPR_TYPE_FRACTION, 7);
	
	pevori2 = CreateDynamicObject(3036, 1207.249511, -2071.194824, 68.130615, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); // lewe, zamkniete
	SetDynamicObjectMaterial(pevori2, 0, 5449, "chicanotr1_lae", "eb_firesc1_LAe2", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 6351, "rodeo02_law2", "dirtwall128", 0x00000000);
	DodajBrame(pevori2, 1207.249511, -2071.194824, 68.130615, 0.000000, 0.000000, 90.000000, 1207.249511, -2071.194824, 66.100601, 0.000000, 0.000000, 90.000000, 5, 11.5, BRAMA_UPR_TYPE_FRACTION, 7);
	
	pevori2 = CreateDynamicObject(19795, 1207.029663, -2040.254150, 69.717826, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); // srodek, zamkniete lewe skrzydlo
	SetDynamicObjectMaterial(pevori2, 0, 14789, "ab_sfgymmain", "gymwinodow3", 0x00000000);	
	new pevori23 = CreateDynamicObject(19795, 1207.029663, -2033.753662, 69.717826, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); // srodek, zamkniete  prawe skrzydlo
	SetDynamicObjectMaterial(pevori23, 0, 14789, "ab_sfgymmain", "gymwinodow3", 0x00000000);
	DualGateAdd(pevori2,
    1207.029663,
    -2040.254150,
    69.717826, 
    0.000000, 
    0.000000, 
    180.000000, 
    1207.029663, 
    -2040.254150, 
    69.717826, 
    0.000000, 
    0.000000, 
    260.000000, 
    pevori23, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    0.000000, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    -80.000000, 
    5, 
    11.5, 
    BRAMA_UPR_TYPE_FRACTION, 
    3,
	0);
	DualGateAdd(pevori2,
    1207.029663,
    -2040.254150,
    69.717826, 
    0.000000, 
    0.000000, 
    180.000000, 
    1207.029663, 
    -2040.254150, 
    69.717826, 
    0.000000, 
    0.000000, 
    260.000000, 
    pevori23, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    0.000000, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    -80.000000, 
    5, 
    11.5, 
    BRAMA_UPR_TYPE_FRACTION, 
    11,
	0);
	DualGateAdd(pevori2,
    1207.029663,
    -2040.254150,
    69.717826, 
    0.000000, 
    0.000000, 
    180.000000, 
    1207.029663, 
    -2040.254150, 
    69.717826, 
    0.000000, 
    0.000000, 
    260.000000, 
    pevori23, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    0.000000, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    -80.000000, 
    5, 
    11.5, 
    BRAMA_UPR_TYPE_FRACTION, 
    3,
	0); 
	DualGateAdd(pevori2,
    1207.029663,
    -2040.254150,
    69.717826, 
    0.000000, 
    0.000000, 
    180.000000, 
    1207.029663, 
    -2040.254150, 
    69.717826, 
    0.000000, 
    0.000000, 
    260.000000, 
    pevori23, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    0.000000, 
    1207.029663, 
    -2033.753662, 
    69.717826, 
    0.000000, 
    0.000000, 
    -80.000000, 
    5, 
    11.5, 
    BRAMA_UPR_TYPE_FRACTION, 
    11,
	0); 
	return 1;
}
