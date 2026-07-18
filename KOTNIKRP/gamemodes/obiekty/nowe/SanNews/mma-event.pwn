//interiorSN.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//--------------------------------------[ Obiekty: interiorSN.pwn ]------------------------------------------//
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
//BY- SIMEONE & ROZALKA
//

//-----------------<[ Główne funkcje: ]>-------------------
mmaevent_Init()
{
	StworzObiekty();
	return 1;
}
//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//=======================================================
	//=================[KONFERENCYJNA]=======================
	//=======================================================
	//Autor: Dreptacz
	simeonel = CreateDynamicObject(18769, 428.060058, -1418.108520, 48.510459, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 9515, "bigboxtemp1", "board64_law", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19454, 422.643035, -1427.534667, 48.274520, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19454, 417.113769, -1419.638183, 48.274520, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19454, 429.509338, -1429.111206, 48.274520, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19454, 437.328826, -1422.598999, 48.124519, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19454, 438.395568, -1417.115112, 51.564544, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19454, 431.862335, -1413.557128, 50.824539, 0.000011, 0.000002, -84.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 423.243591, -1411.304809, 54.314483, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 433.242797, -1425.961791, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 425.708007, -1431.433227, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 420.143951, -1423.487182, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 414.792480, -1415.844238, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 425.701416, -1431.389160, 46.744506, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(18762, 420.172027, -1423.492309, 46.744506, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(18762, 414.826019, -1415.857299, 46.744506, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(18762, 420.143280, -1423.451171, 46.744506, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(18762, 433.175903, -1425.971679, 46.744506, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(18762, 433.257995, -1425.914672, 46.744506, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19454, 422.618469, -1427.551879, 51.744514, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10023, "bigwhitesfe", "sfe_arch8", 0x00000000);
	simeonel = CreateDynamicObject(19454, 417.142944, -1419.714721, 51.744514, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10023, "bigwhitesfe", "sfe_arch8", 0x00000000);
	simeonel = CreateDynamicObject(19454, 429.509338, -1429.111206, 51.774528, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 437.848999, -1423.271484, 51.774528, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19378, 427.508789, -1425.706054, 53.344474, -0.000000, -90.000000, -144.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3820, "boxhses_sfsx", "ws_mixedbrick", 0x00000000);
	simeonel = CreateDynamicObject(19378, 422.002746, -1417.842407, 53.344474, -0.000000, -90.000000, -144.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3820, "boxhses_sfsx", "ws_mixedbrick", 0x00000000);
	simeonel = CreateDynamicObject(19378, 430.588439, -1411.830932, 53.344474, -0.000000, -90.000000, -144.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3820, "boxhses_sfsx", "ws_mixedbrick", 0x00000000);
	simeonel = CreateDynamicObject(19378, 436.100372, -1419.702392, 53.344474, -0.000000, -90.000000, -144.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3820, "boxhses_sfsx", "ws_mixedbrick", 0x00000000);
	simeonel = CreateDynamicObject(19922, 435.217041, -1417.162841, 49.970443, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 1730, "cj_furniture", "CJ_WOOD5", 0x00000000);
	simeonel = CreateDynamicObject(19454, 431.862335, -1413.557128, 54.304580, 0.000011, 0.000002, -84.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 426.508422, -1414.397827, 50.824562, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 440.770965, -1420.690551, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 435.535400, -1419.203369, 48.124519, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(18762, 425.571624, -1415.145874, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 423.243591, -1411.304809, 50.824539, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 416.313842, -1414.711791, 50.824539, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 416.313842, -1414.711791, 54.324531, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 421.516357, -1411.069213, 54.284523, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 421.516357, -1411.069213, 50.794555, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 417.028503, -1414.278564, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(18762, 420.322692, -1411.972045, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 422.667663, -1427.517333, 54.224510, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19454, 417.453613, -1420.070922, 54.224510, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19378, 416.519897, -1410.012207, 53.344474, -0.000000, -90.000000, -144.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3820, "boxhses_sfsx", "ws_mixedbrick", 0x00000000);
	simeonel = CreateDynamicObject(18762, 422.353485, -1410.549926, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 426.508422, -1414.397827, 54.314567, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 436.968750, -1418.199829, 49.924514, 0.000004, 90.000000, -144.999938, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19922, 437.012115, -1419.726318, 49.970443, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 1730, "cj_furniture", "CJ_WOOD5", 0x00000000);
	simeonel = CreateDynamicObject(18762, 435.878295, -1413.702758, 51.464515, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19454, 436.655242, -1412.571044, 48.124519, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19367, 435.408477, -1418.825439, 49.014533, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(14877, 432.082672, -1413.951538, 47.924476, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19325, 435.285247, -1418.822875, 50.364501, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000000} Konferencja Prasowa", 140, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 437.400268, -1415.864746, 50.494537, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); // {FFFFFF} FAME MMA
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF} FAME MMA", 130, "Calibri", 70, 1, 0x00000000, 0x00000000, 2);
	simeonel = CreateDynamicObject(19454, 438.273803, -1424.001098, 49.924514, 0.000011, 90.000000, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	simeonel = CreateDynamicObject(19897, 435.045135, -1416.649902, 50.754501, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19897, 435.762054, -1417.673706, 50.754501, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19897, 436.605102, -1418.877929, 50.754501, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19897, 437.396636, -1420.008178, 50.754501, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	simeonel = CreateDynamicObject(19805, 430.279602, -1413.748413, 51.614524, 0.000002, -0.000011, 5.000030, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10857, "freeways3_sfse", "ws_freeway1", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 14668, "711c", "cj_white_wall2", 0x00000000);
	simeonel = CreateDynamicObject(19325, 430.243286, -1413.800170, 51.844512, -0.000011, -0.000002, 94.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000000} Fame MMA \n ______________ \n ", 140, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 430.272766, -1413.797485, 51.404525, -0.000011, -0.000002, 94.999954, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000000} Organizatorzy:\n Beyonce Bennet | Mat Drep \n San News \n San Andreas Network", 140, "Ariel", 15, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19172, 436.966430, -1423.767944, 51.830467, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 14489, "carlspics", "AH_picture2", 0x00000000);
	simeonel = CreateDynamicObject(19361, 418.781799, -1413.228881, 53.883552, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3603, "bevmans01_la", "cemebuild03_law", 0x00000000);
	simeonel = CreateDynamicObject(19361, 418.768066, -1413.227172, 50.774551, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 4600, "theatrelan2", "wolf1 copy", 0x00000000);
	simeonel = CreateDynamicObject(19325, 418.748840, -1413.373046, 52.634490, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000111} Wejście na hale", 140, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 439.130249, -1422.257690, 52.014518, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF} Marco Stevens vs Luis Ravens \n \n Kendrick Miles vs Jerry Mcfly \n \n Carl Fredson vs Tony Lovrenco \n \n ", 140, "Ariel", 15, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 439.146636, -1422.246337, 51.504531, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF} Shin Carter vs Shaggy Rockstone \n \n John Macintosh vs Dimitri Vladovic", 140, "Ariel", 15, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 434.886932, -1425.228881, 52.154525, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF} Ethan Morgan vs Jackob Smith \n \n Denis Walker vs Malvin Mays \n \n Lucas Calley vs Biagio Tieri", 140, "Ariel", 15, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 434.886932, -1425.228881, 51.524528, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}  Morashi vs Patterson \n \n Simon Cotta vs John Mrucznik", 140, "Ariel", 15, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19325, 438.313385, -1422.816772, 51.294540, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{ff0000} Walki Wieczoru", 130, "Calibri", 50, 1, 0x00000000, 0x00000000, 2);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	simeonel = CreateDynamicObject(2270, 424.753356, -1415.711669, 50.924537, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1455, 434.713409, -1416.572509, 50.819503, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 436.829376, -1415.805053, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 437.425933, -1416.657226, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 437.965148, -1417.427368, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 438.463897, -1418.139526, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19610, 435.119476, -1416.597045, 50.812126, 24.299999, -0.000004, -54.999973, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19610, 435.836456, -1417.620849, 50.812126, 24.299999, -0.000004, -54.999973, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19610, 436.679656, -1418.825073, 50.812126, 24.299999, -0.000004, -54.999973, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19610, 437.471313, -1419.955810, 50.812126, 24.299999, -0.000004, -54.999973, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2002, 426.957611, -1414.902832, 49.174522, -0.000004, -0.000011, 35.000022, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 430.706024, -1418.157226, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 431.251373, -1418.936157, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 431.807861, -1419.730957, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 432.863220, -1421.238159, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 433.442840, -1422.066040, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 433.999664, -1422.860961, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 432.254364, -1424.083129, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 431.709259, -1423.304687, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 431.118408, -1422.460693, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 430.039794, -1420.920410, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 429.454559, -1420.084594, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 428.886718, -1419.273681, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 427.324310, -1420.392333, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 427.892272, -1421.203125, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 428.483306, -1422.047363, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 429.555877, -1423.579101, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 430.152557, -1424.431274, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 430.697509, -1425.209716, 49.664527, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19787, 440.113433, -1420.675903, 51.980491, 2.900011, -0.000000, -74.099967, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(638, 427.228576, -1430.067016, 49.854522, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(638, 431.455780, -1427.107055, 49.854522, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(18755, 425.771179, -1411.555053, 51.074523, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(18756, 425.725280, -1411.501098, 51.054519, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(18757, 425.748565, -1411.509155, 51.054542, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2256, 429.635986, -1428.901367, 51.774520, 0.000004, 0.000011, -144.999938, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(638, 424.485076, -1429.253540, 49.854522, -0.000004, -0.000011, 35.000022, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(638, 421.892150, -1425.550537, 49.854522, -0.000004, -0.000011, 35.000022, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(638, 418.909576, -1421.290893, 49.854522, -0.000004, -0.000011, 35.000022, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(638, 416.557647, -1417.931762, 49.854522, -0.000004, -0.000011, 35.000022, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2745, 421.097564, -1422.854736, 50.334526, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(948, 421.520874, -1411.518432, 49.124519, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1209, 416.152709, -1415.343750, 49.124526, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2773, 420.987060, -1413.600463, 49.674545, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2773, 418.209259, -1415.545654, 49.674545, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 428.107543, -1414.430541, 49.664527, -0.000012, -0.000001, 98.499961, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1455, 435.476318, -1417.661987, 50.819503, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 429.077423, -1414.285522, 49.664527, -0.000012, -0.000001, 98.499961, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2310, 429.967742, -1414.152465, 49.664527, -0.000012, -0.000001, 98.499961, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1455, 436.359863, -1418.923828, 50.819503, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1455, 437.117218, -1420.005249, 50.819503, 0.000011, -0.000004, -51.299976, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1893, 420.361724, -1416.313964, 53.594551, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1893, 423.109283, -1420.237792, 53.594551, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1893, 425.713439, -1423.956909, 53.594551, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1893, 431.657196, -1424.092651, 53.594551, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2229, 435.738006, -1414.178710, 49.944519, 0.000011, -0.000004, -54.999977, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1893, 428.238525, -1419.210327, 53.594551, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1893, 428.053710, -1427.299194, 53.594551, -0.000004, -0.000011, 35.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 436.238525, -1414.961425, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 438.991760, -1418.893432, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(1721, 439.525024, -1419.655029, 50.004547, -0.000011, 0.000004, 125.000000, 1, 0, -1, 200.00, 200.00); 

	//=======================================================
	//====================[Oktagon]==========================
	//=======================================================
	//by Dreptacz
	simeonel = CreateDynamicObject(18769, 2780.086914, -1433.131713, 66.120452, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	simeonel = CreateDynamicObject(18769, 2760.107666, -1433.131713, 66.120452, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2769.329589, -1423.535644, 68.474571, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2778.939697, -1423.535644, 68.474571, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2782.072265, -1426.650024, 68.474571, 0.000000, 0.000000, 225.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2782.100097, -1438.752929, 68.474571, 0.000000, 0.000000, 315.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2778.917968, -1441.854125, 68.474571, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2769.308105, -1441.854125, 68.474571, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2759.688964, -1441.854125, 68.474571, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2754.918701, -1436.934814, 71.234542, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2759.701416, -1423.535644, 68.474571, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2754.918701, -1426.444946, 71.234542, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(3819, 2757.336425, -1427.091918, 67.644493, 0.000000, 0.000000, 540.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19790, 2757.174316, -1430.254394, 68.834518, 90.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2028, "cj_games", "CJ_speaker4", 0x00000000);
	simeonel = CreateDynamicObject(3819, 2757.336425, -1438.302612, 67.644493, 0.000000, 0.000000, 540.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19368, 2759.602783, -1432.709960, 68.374511, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 9507, "boxybld2_sfw", "bevdoor01_law", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2754.834472, -1437.143920, 68.559394, 180.000000, 135.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2754.834472, -1427.574707, 68.559394, 180.000000, 135.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16377, "des_byofficeint", "blak_1", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2762.699218, -1436.934814, 72.284545, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2762.699218, -1426.444824, 72.284545, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2770.119873, -1441.785034, 72.284545, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2769.789550, -1423.584838, 72.284545, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2769.709960, -1432.663330, 72.304550, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 7, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2779.329345, -1436.715332, 72.284553, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2779.329345, -1426.225219, 72.284553, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2761.248779, -1418.953369, 71.274551, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2770.858398, -1418.953369, 71.274551, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2780.487792, -1418.953369, 71.274551, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2780.557861, -1446.504028, 71.274551, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2770.917724, -1446.504028, 71.274551, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2761.767578, -1446.504028, 71.274551, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2759.688964, -1441.844116, 63.404567, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2769.297851, -1441.844116, 63.404567, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2778.887451, -1441.844116, 63.404567, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2778.887451, -1423.573852, 63.404567, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2769.498779, -1423.573852, 63.404567, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2759.899902, -1423.573852, 63.404567, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(14781, 2770.424072, -1433.094970, 67.774528, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 6, 18646, "matcolours", "blue", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 7, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2784.966796, -1432.673461, 67.514572, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2783.315185, -1432.673461, 67.514572, 180.000000, 180.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2780.227050, -1432.673461, 62.374576, 180.000000, 360.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2784.957763, -1427.482910, 62.374576, 180.000000, 360.000000, 450.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2784.957763, -1437.913330, 62.374576, 180.000000, 360.000000, 450.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19458, 2778.636230, -1432.552734, 67.544517, 360.000000, 270.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19458, 2778.626220, -1430.862304, 65.824501, 540.000000, 360.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19458, 2778.626220, -1434.242919, 65.824501, 540.000000, 360.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(3498, 2780.293457, -1437.738281, 67.630455, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(3498, 2780.293457, -1427.638183, 67.630455, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19128, 2783.283935, -1432.773071, 68.594490, 90.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000099} FAME \n  MMA", 140, "Segoe Keycaps", 75, 1, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(3498, 2783.264160, -1430.478149, 67.830444, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(3498, 2783.264160, -1434.638427, 67.830444, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 3899, "hospital2", "black", 0x00000000);
	simeonel = CreateDynamicObject(19157, 2770.947021, -1432.637939, 74.800437, 180.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19379, 2754.918701, -1432.624877, 72.274559, 180.000000, 90.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19158, 2786.756835, -1435.078247, 82.350502, 90.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(3819, 2770.905517, -1425.572265, 67.644493, 0.000000, 0.000000, 810.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(3819, 2770.905517, -1440.052734, 67.644493, 0.000000, 0.000000, 990.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19327, 2770.586914, -1432.671875, 67.614532, 270.000000, 90.500015, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000000}Fame \n  Mma", 140, "Engravers MT", 200, 0, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(19327, 2770.154296, -1431.747314, 67.614532, 270.000000, 90.500015, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{000000} N", 140, "Wingdings", 200, 0, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(19787, 2770.955078, -1430.429443, 71.761558, 13.600001, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(19787, 2770.955078, -1434.840698, 71.754508, 16.600000, 0.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2775.316650, -1429.641723, 67.284500, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2777.755859, -1429.641723, 67.284500, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2777.755859, -1435.641723, 67.284500, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2775.355957, -1435.641723, 67.284500, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2779.266113, -1436.612060, 67.284500, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2779.266113, -1428.692016, 67.284500, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(19327, 2759.696777, -1432.387329, 69.272087, 900.000000, 540.500000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF} Wyjście", 140, "Engravers MT", 100, 0, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(3498, 2778.933593, -1423.898315, 66.780448, 0.000000, 0.000000, 630.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(3498, 2778.933593, -1441.568481, 66.780448, 0.000000, 0.000000, 900.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "blue", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2765.726074, -1431.212402, 67.284500, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(2773, 2765.726074, -1434.042114, 67.284500, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 18646, "matcolours", "blue", 0x00000000);
	simeonel = CreateDynamicObject(997, 2772.205810, -1429.723388, 70.449607, 180.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	simeonel = CreateDynamicObject(997, 2771.855468, -1435.363403, 70.449607, 180.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	simeonel = CreateDynamicObject(997, 2774.605468, -1435.423461, 70.449607, 180.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	simeonel = CreateDynamicObject(997, 2774.736816, -1429.723388, 70.449607, 180.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	simeonel = CreateDynamicObject(932, 2761.358642, -1424.064208, 66.784515, 0.000000, 0.000000, 35.899997, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19058, "xmasboxes", "silk9-128x128", 0x00000000);
	simeonel = CreateDynamicObject(2763, 2767.161865, -1432.645507, 67.140495, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 18646, "matcolours", "blue", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 10765, "airportgnd_sfse", "white", 0x00000000);
	simeonel = CreateDynamicObject(2647, 2767.495361, -1432.637084, 67.664512, 270.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 0, 18646, "matcolours", "red", 0x00000000);
	simeonel = CreateDynamicObject(19893, 2766.920410, -1432.406982, 67.544532, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(simeonel, 1, 5771, "melrose11_lawn", "melrsign07_LA", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	simeonel = CreateDynamicObject(19157, 2770.947021, -1432.647949, 74.330444, 180.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(14414, 2779.219482, -1439.845214, 64.424491, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(14414, 2779.219482, -1425.484130, 64.424491, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(18761, 2766.131347, -1432.698730, 71.714523, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2783.000732, -1434.652465, 69.350456, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2783.000732, -1434.652465, 71.090446, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2783.000732, -1430.442626, 71.090446, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2783.000732, -1430.462402, 69.330474, 0.000000, 0.000000, 90.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2773.048583, -1434.866333, 71.810462, -14.699998, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2768.826660, -1434.866333, 71.810462, -14.699998, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2768.875244, -1430.456665, 71.743148, -8.699996, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2773.036376, -1430.456665, 71.743148, -8.699996, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(18652, 2771.075683, -1432.735717, 73.724609, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2232, 2782.958251, -1428.260620, 68.160453, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2232, 2782.958251, -1437.130981, 68.160453, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2766.148193, -1424.206420, 68.874496, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2766.148193, -1424.206420, 70.474517, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2766.148193, -1441.246826, 70.474517, 0.000000, 0.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(19156, 2766.148193, -1441.246826, 68.784507, 0.000000, 0.000000, 360.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2745, 2777.071777, -1424.206665, 67.934494, 0.000000, 0.000000, 0.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(2745, 2777.071777, -1441.348144, 67.934494, 0.000000, 0.000000, 180.000000, 2, 0, -1, 200.00, 200.00); 
	simeonel = CreateDynamicObject(11738, 2767.224609, -1432.879028, 67.594535, 0.000000, 0.000000, 270.000000, 2, 0, -1, 200.00, 200.00); 

	
	//=======================================================
	//====================[WEJŚCIA]==========================
	//=======================================================

	DodajWejscie(418.7097,-1429.8741,32.4448,423.5769,-1413.2997,50.1745, 0, 0, 1, 0, "Los Santos MMA", "[Wpisz /wyjdz]", 14, PLOCAL_ORG_SN);
	DodajWejscie(419.7147,-1414.4965,50.1745, 2760.32007, -1432.61963, 67.44292, 1, 0, 2, 0, "Oktagon", "[Wpisz /wyjdz]", 15, PLOCAL_ORG_SN); 
	return 1;
}
