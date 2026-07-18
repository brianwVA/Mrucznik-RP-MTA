//opDarkiRichman.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opDarkiRichman.pwn ]--------------------------------------------//
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
opDarkiRichman_Init()
{
	tmpobjid = CreateDynamicObject(2991, 206.740539, -1221.271728, 77.476173, 0.000000, 0.000000, -52.799972, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3080, "adjumpx", "planks64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3080, "adjumpx", "planks64", 0x00000000);
	tmpobjid = CreateDynamicObject(2991, 209.146835, -1224.442504, 77.476173, 0.000000, 0.000000, -52.799972, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3080, "adjumpx", "planks64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3080, "adjumpx", "planks64", 0x00000000);
	tmpobjid = CreateDynamicObject(2991, 208.333557, -1220.062500, 77.476173, 0.000000, 0.000000, -52.799972, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3080, "adjumpx", "planks64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3080, "adjumpx", "planks64", 0x00000000);
	tmpobjid = CreateDynamicObject(2991, 210.751998, -1223.248901, 77.476173, 0.000000, 0.000000, -52.799972, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3080, "adjumpx", "planks64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3080, "adjumpx", "planks64", 0x00000000);
	tmpobjid = CreateDynamicObject(18880, 205.138916, -1220.238647, 81.774261, 0.000000, -179.600067, 38.100021, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(18880, 207.736206, -1218.267089, 81.941528, 0.000000, -179.600067, 38.100021, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(18880, 209.758712, -1226.260864, 81.684829, 0.000000, -179.600067, 38.100021, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(18880, 212.368362, -1224.240234, 81.741767, 0.000000, -179.600067, 38.100021, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 208.800582, -1222.260986, 81.621711, 0.599999, -90.800025, 37.400001, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19439, 211.065124, -1225.277221, 78.547149, -90.199981, 2.099998, -50.200008, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19439, 206.417510, -1219.263793, 78.546150, -90.199981, 2.099998, -50.200008, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19439, 208.815429, -1219.541992, 78.536064, -90.199981, 2.099998, -140.800033, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19439, 211.336822, -1222.875976, 78.521453, -90.199981, 2.099998, -140.800033, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19932, 210.156143, -1221.158081, 78.176208, 0.000000, 0.000000, -142.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 207.183441, -1223.237182, 77.677352, 0.000000, -0.399998, -52.899986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(1815, 208.653137, -1224.607543, 78.097953, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 205.852722, -1231.619140, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 209.504089, -1224.101440, 78.586219, 0.000000, 0.000000, 88.199996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 19162, "newpolicehats", "policehatmap2", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 205.919570, -1230.339355, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 206.055068, -1229.076904, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 210.421264, -1222.475097, 77.995018, -0.000000, -0.000001, -54.499885, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 207.598831, -1219.574829, 78.086242, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 206.092102, -1227.652099, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 205.447433, -1234.095092, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 205.698181, -1232.869018, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 211.474868, -1223.658203, 77.996475, 0.000000, 0.199996, -107.699951, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 206.040740, -1226.408813, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 210.967086, -1223.240600, 77.995018, -0.000000, -0.000001, -54.499885, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19933, 206.131576, -1225.149414, 76.935012, 0.000000, 0.000000, -148.799987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 211.319168, -1224.347290, 77.995018, 0.000001, -0.000000, -142.899902, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(2291, 210.570724, -1224.900390, 77.995018, 0.000001, -0.000000, -142.899902, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 189.893890, -1238.442871, 77.585006, 0.000000, 0.000000, 68.800003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 188.581542, -1236.904296, 77.585006, 0.000000, 0.000000, 68.800003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 187.297561, -1235.236816, 77.585006, 0.000000, 0.000000, 68.800003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 186.219482, -1233.370361, 77.585006, 0.000000, 0.000000, 68.800003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 188.984237, -1238.262329, 78.735000, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 186.374252, -1234.961791, 78.735000, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 203.641586, -1219.304443, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(11734, 208.773391, -1220.641601, 78.106231, 0.000000, 0.000000, -48.900009, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 203.641586, -1213.874511, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2060, 211.123031, -1224.055786, 78.595031, 0.000000, 0.000000, 82.199951, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14787, "ab_sfgymbits02", "ab_rollmat02", 0xFF003366);
	SetDynamicObjectMaterial(tmpobjid, 1, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 8, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 9, 14787, "ab_sfgymbits02", "ab_rollmat02", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 215.951614, -1219.304443, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 218.241638, -1226.424194, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 204.791564, -1233.155883, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 206.311584, -1233.155883, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 204.791564, -1229.566284, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 206.911560, -1229.566284, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 204.791564, -1225.645874, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 206.971603, -1225.645874, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 192.719055, -1239.472412, 76.857246, 0.000000, -0.399998, 125.400039, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 191.833847, -1238.260131, 76.867683, 0.000000, -0.399998, 125.400039, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 193.774291, -1238.679077, 76.027488, 0.000000, -0.399998, 125.400039, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1472, 192.911239, -1237.464965, 76.037902, 0.000000, -0.399998, 125.400039, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 175.741607, -1233.155883, 77.167678, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 175.741607, -1249.285888, 76.557693, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 192.461639, -1249.285888, 77.117706, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(869, 208.149291, -1226.109008, 77.745010, 0.000000, 0.000000, -71.400024, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF0033FF);
	tmpobjid = CreateDynamicObject(869, 204.961395, -1222.171630, 77.745010, 0.000000, 0.000000, -55.599990, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF0033FF);
	tmpobjid = CreateDynamicObject(2221, 208.977661, -1224.121215, 78.666275, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18688, 207.575897, -1220.119262, 77.546234, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19820, 209.888000, -1221.102294, 79.346244, 0.000000, 0.000000, -27.999988, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19820, 210.089248, -1221.106933, 79.346244, 0.000000, 0.000000, -27.999988, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1666, 209.978851, -1221.340332, 79.436218, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1666, 210.068847, -1221.370239, 79.436218, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1665, 210.306137, -1221.318237, 79.366210, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18648, 209.694564, -1226.342285, 81.634246, 0.000000, 0.000000, 37.700000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18648, 208.477630, -1224.768188, 81.634246, 0.000000, 0.000000, 37.700000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18648, 207.254577, -1223.185791, 81.634246, 0.000000, 0.000000, 37.700000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18648, 206.043823, -1221.619628, 81.634246, 0.000000, 0.000000, 37.700000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18648, 205.040954, -1220.322265, 81.634246, 0.000000, 0.000000, 37.700000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1598, 193.984207, -1231.485961, 77.178314, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(823, 204.328842, -1212.539428, 77.865005, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(823, 205.128829, -1215.863525, 77.865005, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8991, 209.673004, -1218.896850, 77.977394, 0.000000, 0.000000, -54.300003, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8991, 210.936569, -1217.656127, 77.977394, 0.000000, 0.000000, -54.300003, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8991, 212.357696, -1216.634887, 77.977394, 0.000000, 0.000000, -54.300003, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(823, 215.531494, -1217.639282, 77.865005, 0.000000, 0.000000, -101.600013, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(823, 217.293304, -1222.931884, 77.865005, 0.000000, 0.000000, -101.600013, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(16061, 189.558883, -1250.560791, 76.524993, 0.000000, 0.000000, 32.499996, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 220.581100, -1248.993774, 77.276649, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 217.901077, -1250.963745, 77.276649, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
}
