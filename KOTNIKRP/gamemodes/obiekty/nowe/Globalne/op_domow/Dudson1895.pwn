//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: Dudson1895.pwn ]------------------------------------------//
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

//-----------------<[ Główne funkcje: ]>-------------------
dom1895_Init()
{
    //siatka
    tmpobjid = CreateDynamicObject(10444, 1340.956054, -649.144714, 107.794860, 0.000000, 0.000000, -71.299903, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1326.436035, -661.136352, 108.183334, 0.000000, 0.000000, -110.900047, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1324.208984, -654.628295, 108.183334, 0.000000, 0.000000, -111.100044, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1334.750732, -664.745178, 108.183334, 0.000000, 0.000000, 158.800292, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1344.459716, -661.491943, 108.163337, 0.000000, 0.000000, 158.600280, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1302.539306, -627.884948, 107.968040, 2.699995, -8.400006, -19.900039, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1290.316528, -626.946716, 106.143585, 5.699996, -4.300004, -70.399925, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1282.399414, -621.588806, 105.200813, 5.699996, 1.899994, -78.699798, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(4100, 1311.097900, -632.366394, 108.953384, 0.000000, 0.000000, -111.100044, 0, 0, -1, 300.00, 300.00);
    //reszta
    tmpobjid = CreateDynamicObject(617, 1328.252319, -667.450988, 107.514785, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(617, 1287.299194, -625.956909, 105.347351, 0.000000, 0.000000, 15.899987, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(824, 1283.539794, -625.579284, 105.745285, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(658, 1308.519042, -625.550598, 107.917541, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1491, 1313.166137, -638.566650, 107.664886, 0.000000, 0.000000, -70.700042, 0, 0, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 2989, "imy_skylx", "skylightkb", 0x00000000);
    //nowe obiekty
    tmpobjid = CreateDynamicObject(1255, 1337.878906, -659.284973, 108.314880, 0.000000, 0.000000, 108.399993, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
    tmpobjid = CreateDynamicObject(1255, 1336.360351, -659.790039, 108.314880, 0.000000, 0.000000, 110.199966, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
    tmpobjid = CreateDynamicObject(1255, 1334.868164, -660.339172, 108.314880, 0.000000, 0.000000, 110.199966, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
    tmpobjid = CreateDynamicObject(642, 1334.658813, -661.218261, 109.502700, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF00FFFF);
    tmpobjid = CreateDynamicObject(642, 1339.002197, -660.090942, 109.502700, 0.000000, 0.000000, -32.699977, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF00FFFF);
    tmpobjid = CreateDynamicObject(2115, 1331.157714, -663.313964, 108.134895, 0.000000, 0.000000, 108.899993, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19831, 1329.207885, -665.375122, 108.134895, 0.000000, 0.000000, 160.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(2310, 1332.072631, -661.968444, 108.614913, 0.000000, 0.000000, 18.499994, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(2310, 1332.355102, -662.812500, 108.614913, 0.000000, 0.000000, 18.499994, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(2310, 1329.531616, -662.820800, 108.614913, 0.000000, 0.000000, -161.100006, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(2310, 1329.849853, -663.747924, 108.614913, 0.000000, 0.000000, -161.100006, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(19819, 1331.035522, -662.048767, 109.024917, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
    tmpobjid = CreateDynamicObject(19819, 1330.494995, -662.289001, 109.024917, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19081, "laserpointer3", "laserbeam-3-64x64", 0x00000000);
    tmpobjid = CreateDynamicObject(19819, 1331.005493, -663.638977, 109.024917, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19082, "laserpointer4", "laserbeam-4-64x64", 0x00000000);
    tmpobjid = CreateDynamicObject(19819, 1331.395751, -663.508972, 109.024917, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19083, "laserpointer5", "laserbeam-5-64x64", 0x00000000);
    tmpobjid = CreateDynamicObject(2964, 1345.532836, -658.335998, 108.134895, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "greendirt1", 0x00000000);
    tmpobjid = CreateDynamicObject(1642, 1332.893554, -646.575988, 108.134895, 0.000000, 0.000000, 40.499996, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "greendirt1", 0x00000000);
    tmpobjid = CreateDynamicObject(1642, 1334.997314, -645.811279, 108.134895, 0.000000, 0.000000, -31.400001, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "purpledirt1", 0x00000000);
    tmpobjid = CreateDynamicObject(642, 1333.748779, -645.828308, 109.502700, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0xFF00FFFF);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(869, 1321.407836, -652.288879, 107.314132, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(869, 1323.431640, -658.216857, 107.395645, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(869, 1324.934814, -662.774719, 107.376976, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(869, 1326.610473, -667.439453, 107.420143, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(19121, 1326.707763, -664.959777, 107.264907, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(19121, 1324.877807, -661.269714, 107.034912, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(19121, 1323.297607, -656.349609, 106.954933, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(19121, 1320.917968, -649.269592, 107.104927, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
    tmpobjid = CreateDynamicObject(2800, 1331.000244, -662.890319, 108.744911, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19573, 1328.881469, -664.849426, 108.139999, 7.600015, 0.000000, -6.000030, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(18688, 1329.124755, -665.523986, 107.694877, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(338, 1345.046630, -658.775268, 109.116035, -1.699999, 89.500038, 4.800023, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2965, 1345.201416, -658.301147, 109.054901, 0.000000, 0.000000, 179.300033, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2995, 1345.292724, -658.303283, 109.064888, 0.000000, 0.000000, -88.799911, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3105, 1345.235595, -658.261230, 109.044853, 0.000000, 0.000000, -2.199966, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2998, 1345.230834, -658.330993, 109.044868, 0.000000, 0.000000, -92.400093, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3001, 1345.166503, -658.226623, 109.054901, 0.000000, 0.000000, -87.500007, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3106, 1345.168701, -658.293334, 109.064895, -143.199920, -125.800071, -130.500045, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1509, 1333.643554, -647.192199, 108.333190, 0.000000, 0.000000, -59.200000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1509, 1334.777099, -646.516296, 108.333190, 0.000000, 0.000000, 105.599998, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(869, 1320.713134, -649.535400, 107.776435, 2.400000, -5.700001, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(869, 1324.185424, -660.593261, 107.320953, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(869, 1322.125122, -655.418518, 107.426193, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(869, 1325.793945, -665.372253, 107.455627, 13.299999, -17.199995, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3002, 1345.176879, -658.368652, 109.034866, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3104, 1345.104614, -658.185363, 109.054954, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2996, 1345.093383, -658.254211, 109.074867, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3101, 1345.096435, -658.335144, 109.064895, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3000, 1345.107666, -658.415100, 109.044868, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2997, 1345.047485, -658.150756, 109.044944, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3100, 1345.037109, -658.226318, 109.054901, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2999, 1345.047973, -658.305664, 109.044891, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3102, 1345.040527, -658.377014, 109.044868, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3103, 1345.040527, -658.447082, 109.054893, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1329.600708, -649.237792, 108.076957, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1339.462280, -645.838134, 108.076957, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1336.760864, -653.220458, 108.076957, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3934, 1354.455078, -631.296203, 112.109519, 0.000000, 0.000000, -70.799957, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1352.177490, -636.360656, 111.996803, 0.000000, 0.000000, 20.100006, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1349.265625, -628.396484, 111.996803, 0.000000, 0.000000, 20.100006, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1356.432128, -625.774963, 111.996803, 0.000000, 0.000000, 20.100006, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1359.411132, -633.917175, 111.996803, 0.000000, 0.000000, 20.100006, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19882, 1329.406982, -665.493896, 108.957901, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19882, 1329.036865, -665.343750, 108.957901, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(338, 1344.977416, -657.967834, 109.121932, -1.699999, 89.500038, 4.800023, 0, 0, -1, 300.00, 300.00); 
    gateob = CreateDynamicObject(969, 1279.404052, -618.894104, 101.998519, 0.000000, 0.299997, 40.800045, 0, 0, -1, 300.00, 300.00);
    DodajBrame(gateob,
        1279.404052, -618.894104, 101.998519, 0.000000, 0.299997, 40.800045,
        1279.392456, -618.905700, 98.808517, 0.000000, 0.299997, 40.800045,
        2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1895);
}

dom1895_OnPlayerConnect(playerid)
{
    RemoveBuildingForPlayer(playerid, 617, 1328.119, -668.296, 106.398, 0.250);
    RemoveBuildingForPlayer(playerid, 1691, 1354.209, -661.265, 113.405, 0.250);
    RemoveBuildingForPlayer(playerid, 1691, 1350.170, -650.554, 113.405, 0.250);
    RemoveBuildingForPlayer(playerid, 1688, 1348.050, -644.296, 113.991, 0.250);
    RemoveBuildingForPlayer(playerid, 1690, 1339.109, -637.109, 113.664, 0.250);
    RemoveBuildingForPlayer(playerid, 1687, 1327.560, -641.867, 113.813, 0.250);
    RemoveBuildingForPlayer(playerid, 1687, 1324.699, -642.945, 113.813, 0.250);
    RemoveBuildingForPlayer(playerid, 659, 1314.699, -624.054, 107.148, 0.250);
}