//julia_dom3.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: julia_dom3.pwn ]--------------------------------------------//
//Autor: Julia
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
julia_dom3_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

julia_dom3_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19426, 2126.877929, -1319.532104, 27.306493, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2124.482910, -1319.531738, 27.308446, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2129.164062, -1319.533081, 27.308446, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2128.993896, -1319.473022, 30.768465, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2123.710693, -1319.493041, 30.748464, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2126.016601, -1319.493286, 30.779069, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2131.338623, -1319.492065, 30.756513, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2131.308593, -1319.532104, 27.306499, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2122.967285, -1329.731811, 27.305280, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2122.964599, -1324.420532, 27.299999, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2122.978027, -1331.779663, 27.306493, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2124.663085, -1332.643066, 27.298446, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2127.745605, -1332.640991, 27.295272, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2127.854003, -1333.403564, 30.748451, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2124.683105, -1333.403564, 30.748451, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2122.287841, -1333.404785, 30.746513, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2122.272460, -1331.873657, 30.748451, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2122.267822, -1329.495727, 30.746513, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2122.272460, -1327.102661, 30.748451, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2122.272460, -1321.131713, 30.748451, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2132.063720, -1321.131713, 30.748451, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2132.063720, -1324.322387, 27.308441, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2132.063720, -1331.892822, 30.748451, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2130.795898, -1333.401733, 30.745277, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.055908, -1328.771606, 30.745277, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.055908, -1326.920776, 30.745277, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2122.267333, -1323.930419, 30.745277, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2132.063720, -1321.131713, 27.308448, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.055908, -1327.521362, 27.305280, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19399, 2132.063720, -1330.681640, 27.298444, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2130.795898, -1332.640991, 27.295272, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2132.066894, -1332.802124, 27.296499, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.055908, -1324.270751, 30.745283, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2127.144042, -1324.245361, 25.545118, 0.000000, 90.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2127.185058, -1330.821777, 25.549978, 0.000000, 90.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10023, "bigwhitesfe", "archgrnd3_SFE", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2125.253906, -1324.665771, 29.155155, 0.000000, 90.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "gun_ceiling1128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2127.175292, -1331.602172, 29.159996, 0.000000, 90.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "gun_ceiling1128", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2127.175292, -1331.602172, 29.169994, 0.000000, 90.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2125.212890, -1324.605712, 29.175155, 0.000000, 90.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 2127.174804, -1324.785888, 32.395149, 0.000000, 90.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concretemanky", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2127.175292, -1331.602172, 32.399986, 0.000000, 90.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concretemanky", 0x00000000);
	tmpobjid = CreateDynamicObject(3399, 2131.198242, -1323.793334, 27.019086, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2129.983642, -1325.841796, 27.319999, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2128.839599, -1329.354858, 27.302560, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2131.228515, -1329.342895, 27.296503, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2127.327880, -1330.964355, 27.299058, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2124.473144, -1319.515869, 27.301069, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19445, 2129.983642, -1324.250610, 30.820016, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2128.305908, -1326.007568, 30.951101, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2125.913818, -1326.005981, 30.951107, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2123.965087, -1326.008789, 30.951101, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19383, 2126.864990, -1331.718383, 30.951101, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2126.864746, -1329.326293, 30.951107, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2125.166503, -1328.613281, 30.979074, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19426, 2122.818359, -1328.615478, 30.856515, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2125.906982, -1324.332519, 30.979074, 0.000000, 0.000000, 360.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2125.906982, -1321.161254, 30.979074, 0.000000, 0.000000, 360.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2129.264648, -1319.515869, 27.301069, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2129.264648, -1319.455810, 30.621067, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2123.703613, -1319.455810, 30.731071, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2124.504394, -1333.475830, 30.731071, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2128.014404, -1333.475830, 30.731071, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2124.854492, -1332.657226, 27.201070, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.064453, -1331.436523, 30.781084, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.074462, -1331.046142, 27.841075, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.074462, -1324.506347, 27.841075, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "walp72S", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.204589, -1321.004638, 27.841075, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2132.104492, -1321.004638, 29.931083, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2122.260986, -1321.004638, 29.931083, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2122.260986, -1327.314575, 29.931083, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19353, 2122.260986, -1331.285034, 29.931083, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2128.534667, -1322.345458, 30.041097, 0.000000, 0.000000, 173.800170, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14415, "carter_block_2", "ws_doormat", 0x00000000);
	tmpobjid = CreateDynamicObject(2267, 2129.797607, -1323.473022, 31.481092, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 3440, "airportpillar", "carfx1", 0x00000000);
	tmpobjid = CreateDynamicObject(1794, 2123.935302, -1332.515502, 29.255931, 0.000000, 0.000000, 360.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 4552, "ammu_lan2", "sunsetammu1", 0x00000000);
	tmpobjid = CreateDynamicObject(2087, 2124.871826, -1333.106201, 29.258508, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14786, "ab_sfgymbeams", "knot_wood128", 0x00000000);
	tmpobjid = CreateDynamicObject(1796, 2122.347900, -1320.112792, 29.231090, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 4833, "airprtrunway_las", "bobo_2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14535, "ab_wooziec", "ab_wallpaper01", 0x00000000);
	tmpobjid = CreateDynamicObject(2167, 2125.745117, -1322.539184, 29.261093, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14653, "ab_trukstpb", "met_supp", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4835, "airoads_las", "concretenewb256", 0x00000000);
	tmpobjid = CreateDynamicObject(2167, 2125.745117, -1323.439208, 29.261093, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14653, "ab_trukstpb", "met_supp", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4835, "airoads_las", "concretenewb256", 0x00000000);
	tmpobjid = CreateDynamicObject(2171, 2122.817871, -1323.253540, 29.261093, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14653, "ab_trukstpb", "met_supp", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14653, "ab_trukstpb", "met_supp", 0x00000000);
	tmpobjid = CreateDynamicObject(1713, 2126.513183, -1329.498901, 25.631055, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(1713, 2125.923583, -1332.069458, 25.631055, 0.000000, 0.000000, 540.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(1713, 2123.641601, -1330.919189, 25.631055, 0.000000, 0.000000, 450.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(2130, 2123.547363, -1320.279663, 25.631055, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2129, 2123.545898, -1320.314086, 25.641056, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2129, 2123.545898, -1322.244873, 25.641056, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2294, 2123.524414, -1321.268066, 25.631055, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2128, 2123.504882, -1323.251464, 25.631055, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2032, 2128.301757, -1323.988525, 25.631055, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1810, 2127.590087, -1322.983520, 25.631055, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1810, 2128.390625, -1322.973388, 25.631055, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1810, 2126.739013, -1323.753784, 25.631055, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1810, 2127.109375, -1324.934082, 25.631055, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1810, 2127.859375, -1324.914184, 25.631055, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1810, 2129.340820, -1324.254272, 25.631055, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2100, 2128.133544, -1319.755615, 25.631055, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(19172, 2129.878662, -1324.153686, 27.871053, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14803, "bdupsnew", "Bdup2_mask", 0x00000000);
	tmpobjid = CreateDynamicObject(2526, 2131.491699, -1332.056640, 25.635915, 0.000000, 0.000000, 540.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(2143, 2130.896728, -1329.877441, 25.635915, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 3, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(3963, 2126.965576, -1329.737060, 31.375934, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14392, "dr_gsstudio", "golddisc_128", 0x00000000);
	tmpobjid = CreateDynamicObject(19825, 2126.101562, -1333.266723, 31.651216, 0.000000, 360.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1654, "dynamite", "clock64", 0x00000000);
	tmpobjid = CreateDynamicObject(2558, 2131.586425, -1330.158691, 26.805917, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(2311, 2126.000732, -1327.083984, 25.631055, 0.000000, 0.000000, 180.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateDynamicObject(1786, 2125.229492, -1326.740234, 26.141056, 0.000000, 0.000000, 360.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14653, "ab_trukstpb", "met_supp", 0x00000000);
	tmpobjid = CreateDynamicObject(2055, 2126.565673, -1319.634765, 28.291055, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} Jensen Company", 40, "Calibri", 20, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(1502, 2123.195312, -1325.984619, 29.221092, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1502, 2127.525878, -1326.053588, 29.191091, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1502, 2128.036376, -1329.304443, 25.631082, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1502, 2126.935302, -1332.505126, 29.221092, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2166, 2128.547607, -1322.218139, 29.261093, 0.000000, 0.000000, 450.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1671, 2128.459960, -1321.377075, 29.711093, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1671, 2128.580078, -1323.627075, 29.711093, 0.000000, 0.000000, -173.899978, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1671, 2127.652343, -1323.629394, 29.711093, 0.000000, 0.000000, 170.499984, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14455, 2126.346435, -1320.901123, 30.771097, 0.000000, 0.000000, 270.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1235, 2126.366210, -1319.909057, 29.791103, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2241, 2122.893554, -1329.531616, 29.931217, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2815, 2123.924316, -1332.538574, 29.251207, 0.000000, 0.000000, 22.399999, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2811, 2122.960937, -1320.196289, 29.261093, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1671, 2123.799316, -1322.619628, 29.711093, 0.000000, 0.000000, -83.899978, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2894, 2122.896728, -1322.723876, 30.081108, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2024, 2125.551269, -1330.556640, 25.631055, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1557, 2127.352294, -1319.557128, 25.631055, 0.000000, 0.000000, -180.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2253, 2125.065917, -1330.244995, 26.451053, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2852, 2127.494140, -1324.036499, 26.431051, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(949, 2123.696044, -1324.414428, 26.261064, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(949, 2123.696044, -1325.314331, 26.261064, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2518, 2131.045898, -1330.463256, 25.915920, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2525, 2127.934082, -1331.332519, 25.635915, 0.000000, 0.000000, 90.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(321, 2123.930908, -1333.060424, 30.444826, 122.999961, -82.000022, 900.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2123.798095, -1331.642700, 32.231216, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2123.798095, -1322.971801, 32.231216, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2127.918457, -1321.962524, 32.231216, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2127.918457, -1328.432983, 32.231216, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2125.867675, -1322.522460, 29.041221, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2125.867675, -1326.733032, 29.041221, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2026, 2129.739013, -1331.194213, 29.041221, 0.000000, 0.000000, 0.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18084, 2131.131103, -1330.879516, 27.045925, 0.000000, 0.000000, 450.000000, 189, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2870, 2124.388916, -1327.097778, 26.161066, 0.000000, 0.000000, 450.000000, 189, 0, -1, 300.00, 300.00); 

	tmpobjid = CreateDynamicObject(3580, 2126.780029, -1325.729980, 28.921899, 0.000000, 0.000000, -0.000034, 0, 0, -1, 300.00, 300.00);
	return 1;
}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);

	RemoveBuildingForPlayer(playerid, 3580, 2126.780, -1325.729, 28.921, 0.250);
	RemoveBuildingForPlayer(playerid, 3772, 2126.780, -1325.729, 28.921, 0.250);
	return 1;
}

