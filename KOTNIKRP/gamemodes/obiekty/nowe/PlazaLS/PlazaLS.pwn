//PlazaLS.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: PlazaLS.pwn ]--------------------------------------------//
//Autor: Miko
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
PlazaLS_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}
//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(642, 505.640197, -1858.380126, 4.188203, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighterhull1", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 519.990356, -1870.190551, 4.138202, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2b", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 531.040283, -1860.320190, 4.728207, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17562, "coast_apts", "ws_garagedoor2_yello", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 540.960632, -1880.880126, 4.058197, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 510.200653, -1883.510620, 3.578197, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarb_wall_128", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 509.050842, -1883.547607, 2.480771, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon02", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 511.310729, -1883.547607, 2.480771, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon02", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 519.040710, -1870.396972, 3.100770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon01", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 521.071777, -1870.396972, 3.100770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon01", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 529.782287, -1860.456176, 3.620770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 532.133117, -1860.456176, 3.620770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 539.903625, -1881.055053, 3.020770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19107, "armyhelmets", "armyhelmet7", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 542.063842, -1881.055053, 3.020770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19107, "armyhelmets", "armyhelmet7", 0x00000000);
	tmpobjid = CreateDynamicObject(1640, 521.199829, -1896.473022, 0.888739, 9.099998, 1.900000, -33.599994, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15048, "labigsave", "ah_carp1", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 506.810485, -1858.597045, 3.130770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14707, "labig3int2", "WH_walls", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 504.600616, -1858.597045, 3.130770, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14707, "labig3int2", "WH_walls", 0x00000000);
	tmpobjid = CreateDynamicObject(1640, 519.405212, -1896.151855, 0.839776, 9.099998, -1.400000, -9.899991, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15048, "labigsave", "ah_carpet2kb", 0x00000000);
	tmpobjid = CreateDynamicObject(1640, 509.522949, -1894.397460, 0.864452, 1.700000, -5.199997, 80.100006, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14703, "vghsb3int2", "HS2_3Wall1", 0x00000000);
	tmpobjid = CreateDynamicObject(1640, 490.805664, -1893.011474, 0.897615, 5.499999, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon02", 0x00000000);
	tmpobjid = CreateDynamicObject(1640, 488.187316, -1894.022338, 0.749007, 3.500003, -4.199998, 40.100002, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon01", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1486, 508.832672, -1894.824829, 0.950097, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 520.300170, -1870.835937, 2.934076, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 519.839721, -1870.835937, 2.924076, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 505.337402, -1859.038940, 2.913835, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 505.997467, -1859.038940, 2.923835, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2768, 519.631774, -1897.045898, 0.766891, 6.099997, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1544, 490.042266, -1892.730834, 0.880476, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1544, 487.262054, -1894.210449, 0.700477, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	return 1;
}


