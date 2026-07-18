//opmont.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: opmont.pwn ]------------------------------------------//
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
//BY- LUKESQL
//
//-----------------<[ Główne funkcje: ]>-------------------
opmont_Init()
{
	StworzObiekty();
	return 1;
}


opmont_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	lukesqly = CreateDynamicObject(19390, 1395.524047, 468.033081, 20.672418, 0.000000, 0.000000, 66.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1392.600585, 469.334655, 20.672418, 0.000000, 0.000000, 66.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1392.093505, 467.754150, 20.672418, 0.000000, 0.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1390.792480, 464.830841, 20.672418, 0.000000, 0.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1393.386474, 463.621948, 19.102396, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1394.692749, 466.554565, 19.102396, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1396.373168, 465.806182, 20.672418, 0.000000, 0.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1395.067016, 462.873535, 20.672418, 0.000000, 0.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1394.692626, 466.554656, 22.232416, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1393.386474, 463.621948, 22.232416, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1390.188964, 465.045562, 22.232416, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1391.494628, 467.978179, 22.232416, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1391.496093, 467.978057, 19.102396, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	lukesqly = CreateDynamicObject(19361, 1390.190307, 465.045379, 19.102396, 0.000000, 90.000000, 156.000000, 0, 0, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(lukesqly, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	lukesqly = CreateDynamicObject(1728, 1391.937255, 470.307128, 19.097816, 0.000000, 0.000000, 155.399993, 0, 0, -1, 350.00, 350.00);
	lukesqly = CreateDynamicObject(2315, 1391.182373, 472.662933, 19.100927, 0.000000, 0.000000, -25.800001, 0, 0, -1, 350.00, 350.00);
	lukesqly = CreateDynamicObject(3172, 1393.614013, 477.221771, 19.192462, 0.000000, 0.000000, 62.799987, 0, 0, -1, 350.00, 350.00);
	lukesqly = CreateDynamicObject(2674, 1389.501586, 471.834075, 19.115131, 0.000000, 0.000000, 0.000000, 0, 0, -1, 350.00, 350.00);
	lukesqly = CreateDynamicObject(19903, 1393.193725, 468.608795, 19.188333, 0.000000, 0.000000, 245.399993, 0, 0, -1, 350.00, 350.00);
	lukesqly = CreateDynamicObject(19872, 1393.909057, 464.608398, 17.432573, 0.000000, 0.000000, -23.400009, 0, 0, -1, 350.00, 350.00);
	lukesqly = CreateDynamicObject(1096, 1391.100585, 464.935363, 19.602268, 0.000000, -4.399998, -24.899990, 0, 0, -1, 350.00, 350.00);

	return 1;
}

static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 1450, 1394.040, 462.226, 19.757, 0.250);
	RemoveBuildingForPlayer(playerid, 1370, 1373.449, 469.968, 19.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1370, 1373.170, 471.101, 19.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1370, 1358.479, 483.656, 19.695, 0.250);

	return 1;
}





