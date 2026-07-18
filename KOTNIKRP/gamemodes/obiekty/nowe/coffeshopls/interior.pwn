//interior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: interior.pwn ]------------------------------------------//
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

//Autor: Charlie112

//-----------------<[ Główne funkcje: ]>-------------------
coffeeshop_Init()
{
	
	StworzObiekty();
	return 1;
}

coffeshop_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}
//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2018-11-12 22:40:43" by "Charlie_Halliwell"
		Created by "Charlie_Halliwell"
		Spawn Position: 1414.074218, -1635.150512, 13.569149
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	charlie112 = CreateDynamicObject(19383, 1418.738403, -1639.848022, 14.300000, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1418.838500, -1643.047607, 14.296865, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF0099FF);
	charlie112 = CreateDynamicObject(19445, 1418.838500, -1633.427368, 14.296865, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF0099FF);
	charlie112 = CreateDynamicObject(19445, 1413.948364, -1644.657104, 14.296873, 0.000000, 0.000037, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF0099FF);
	charlie112 = CreateDynamicObject(5738, 1399.175415, -1635.086791, -2.033123, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 2591, "ab_partition1", "ab_fabricCheck2", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1413.998291, -1628.687255, 14.296865, 0.000000, 0.000037, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1411.228393, -1632.916625, 14.296865, 0.000000, 0.000037, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1418.738403, -1643.047607, 11.166843, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1418.738403, -1633.427368, 11.166843, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1413.948364, -1644.557006, 11.166851, 0.000014, 0.000037, 89.999954, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1418.738403, -1643.047607, 17.366857, 0.000000, 0.000059, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1418.738403, -1633.427368, 17.366857, 0.000000, 0.000059, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1413.948364, -1644.557006, 17.366865, 0.000022, 0.000037, 89.999931, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1417.008056, -1630.067260, 16.026868, 0.000000, 90.000061, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1417.008056, -1639.687744, 16.026868, 0.000000, 90.000061, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1415.336914, -1630.067260, 17.706893, 0.000004, 360.000061, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1415.336914, -1639.687744, 17.706893, 0.000004, 360.000061, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1413.585815, -1630.067260, 16.836887, 0.000000, 450.000061, -0.000004, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1413.585815, -1639.687744, 16.836887, 0.000000, 450.000061, -0.000004, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1412.075073, -1630.067260, 17.706893, 0.000004, 360.000061, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1412.075073, -1639.687744, 17.706893, 0.000004, 360.000061, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1410.407104, -1630.067260, 16.026868, 0.000000, 90.000083, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1410.407104, -1639.687744, 16.026868, 0.000000, 90.000083, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1413.998291, -1628.687255, 17.786880, 0.000000, 0.000037, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(2747, 1417.359497, -1631.011840, 12.939152, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 18065, "ab_sfammumain", "shelf_glas", 0xFF33FF00);
	charlie112 = CreateDynamicObject(1507, 1418.750976, -1640.588134, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, -1, "none", "none", 0xFF00CC33);
	charlie112 = CreateDynamicObject(2747, 1417.359497, -1635.842651, 12.939152, 0.000000, 0.000068, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 18065, "ab_sfammumain", "shelf_glas", 0xFF33FF00);
	charlie112 = CreateDynamicObject(2747, 1416.470703, -1643.147216, 12.939153, 0.000007, 0.000022, 89.999946, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 18065, "ab_sfammumain", "shelf_glas", 0xFF33FF00);
	charlie112 = CreateDynamicObject(2747, 1411.669067, -1643.147216, 12.939153, 0.000014, 0.000022, 89.999923, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 18065, "ab_sfammumain", "shelf_glas", 0xFF33FF00);
	charlie112 = CreateDynamicObject(11435, 1416.004272, -1633.389160, 10.619119, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3063, "col_wall1x", "ab_wood1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 2, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1417.413085, -1633.387329, 11.829147, 0.000022, 0.000000, 89.999931, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "ws_runwaytarmac", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1417.834838, -1633.389160, 10.619119, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14415, "carter_block_2", "cd_wall1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1416.004272, -1638.361328, 10.619119, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3063, "col_wall1x", "ab_wood1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 2, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1417.413085, -1638.359497, 11.829147, 0.000068, 0.000000, 89.999794, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "ws_runwaytarmac", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1417.834838, -1638.361328, 10.619119, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14415, "carter_block_2", "cd_wall1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1416.004272, -1641.340942, 10.619119, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3063, "col_wall1x", "ab_wood1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 2, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1417.413085, -1641.339111, 11.829147, 0.000037, 0.000000, 89.999885, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "ws_runwaytarmac", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1417.834838, -1641.340942, 10.619119, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14415, "carter_block_2", "cd_wall1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1414.076049, -1644.539794, 10.619119, 0.000037, 180.000000, 89.999855, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3063, "col_wall1x", "ab_wood1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 2, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1414.074218, -1643.130981, 11.829147, 0.000045, -0.000014, 179.999740, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "ws_runwaytarmac", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1414.076049, -1642.709228, 10.619119, 0.000037, 180.000000, 89.999855, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14415, "carter_block_2", "cd_wall1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1409.350585, -1643.173095, 14.289155, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(2441, 1413.250244, -1632.879760, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(2441, 1413.250244, -1633.869750, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(2442, 1413.251708, -1631.883789, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(2441, 1413.250244, -1634.849731, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(2441, 1413.250244, -1635.840209, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1409.350585, -1639.962890, 14.289155, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(2442, 1412.801757, -1637.253784, 12.569149, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(2441, 1411.799682, -1637.259521, 12.569149, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 3, 19962, "samproadsigns", "greenbackgroundsign", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1411.297119, -1635.063964, 14.239157, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3820, "boxhses_sfsx", "ws_blocks_grey_1", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1411.297119, -1632.653686, 14.239156, 0.000000, 0.000075, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3820, "boxhses_sfsx", "ws_blocks_grey_1", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1410.813232, -1631.738403, 11.939120, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3063, "col_wall1x", "ab_wood1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 2, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	charlie112 = CreateDynamicObject(11435, 1410.813232, -1636.669189, 11.939120, 0.000000, 180.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3063, "col_wall1x", "ab_wood1", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 1, 3853, "gay_xref", "ws_gayflag2", 0x00000000);
	SetDynamicObjectMaterial(charlie112, 2, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	charlie112 = CreateDynamicObject(19327, 1409.446166, -1643.489624, 14.894599, 0.000007, 0.000000, 89.999977, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(charlie112, 0, "{FFFFFF}Charlie", 140, "Ariel", 100, 1, 0x00000000, 0x00000000, 1);
	charlie112 = CreateDynamicObject(7921, 1417.391235, -1631.158447, 11.549152, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3967, "cj_airprt", "CJ_BLACK_RUB2", 0x00000000);
	charlie112 = CreateDynamicObject(7921, 1417.391235, -1635.878906, 11.549152, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3967, "cj_airprt", "CJ_BLACK_RUB2", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1409.806152, -1638.281250, 14.289155, 0.000000, 0.000000, -67.099990, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1415.479614, -1644.365966, 17.848657, 31.600009, 180.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1411.909423, -1644.365966, 17.848491, 31.600009, 540.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1415.479614, -1628.863647, 17.848657, 31.600023, 180.000000, 89.999954, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1411.914672, -1628.863647, 17.839975, 31.599987, 540.000000, -89.999954, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1415.479614, -1639.995483, 17.848657, 31.600015, 180.000000, 89.999977, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1411.909423, -1639.995483, 17.848491, 31.599998, 540.000000, -89.999977, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1415.479614, -1635.515502, 17.848657, 31.600023, 180.000000, 89.999954, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1411.909423, -1635.515502, 17.848491, 31.599987, 540.000000, -89.999954, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	charlie112 = CreateDynamicObject(19383, 1406.199462, -1639.103027, 14.289155, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1408.600219, -1639.103027, 14.289155, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1407.777587, -1634.236816, 14.296865, 0.000000, 0.000037, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "sea_wall_temp", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1402.946166, -1634.236816, 14.296865, 0.000000, 0.000037, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "sea_wall_temp", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1403.616088, -1630.305908, 14.296865, 0.000000, 0.000037, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "sea_wall_temp", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1404.506713, -1640.785522, 14.296858, 0.000000, 0.000037, 270.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(7921, 1416.501098, -1643.189941, 11.549152, 0.000000, 270.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3967, "cj_airprt", "CJ_BLACK_RUB2", 0x00000000);
	charlie112 = CreateDynamicObject(7921, 1411.701293, -1643.189941, 11.549152, 0.000000, 270.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 3967, "cj_airprt", "CJ_BLACK_RUB2", 0x00000000);
	charlie112 = CreateDynamicObject(19426, 1403.789794, -1639.103027, 14.289155, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "sea_wall_temp", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1404.527221, -1634.236816, 11.796859, 0.000000, 0.000037, 180.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "ws_runwaytarmac", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1402.836181, -1634.236816, 13.476878, 0.000000, 90.000038, 540.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 17075, "cuntwlandwest", "mountainskree_stones256", 0x00000000);
	charlie112 = CreateDynamicObject(19379, 1403.124511, -1634.194091, 12.489153, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	charlie112 = CreateDynamicObject(19379, 1403.124511, -1634.364257, 16.089168, 0.000000, 270.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 10765, "airportgnd_sfse", "ws_whiteplaster_top", 0x00000000);
	charlie112 = CreateDynamicObject(19353, 1405.349121, -1640.793457, 14.289155, 0.000000, 0.000000, 540.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(19445, 1404.558105, -1640.785522, 15.576862, 0.000000, 90.000038, 630.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 0, 19517, "noncolored", "gen_white", 0x00000000);
	charlie112 = CreateDynamicObject(1499, 1409.387207, -1640.704711, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(charlie112, 1, 10101, "2notherbuildsfe", "flatdoor01_law", 0x00000000);
	charlie112 = CreateDynamicObject(19327, 1409.446166, -1642.489379, 14.344601, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(charlie112, 0, "{FFFFFF}Halliwell", 140, "Ariel", 100, 1, 0x00000000, 0x00000000, 1);
	charlie112 = CreateDynamicObject(19327, 1409.446166, -1643.099975, 14.634602, 0.000007, 0.000000, 89.999977, 1, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(charlie112, 0, "{FFFFFF}H", 140, "Webdings", 160, 1, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	charlie112 = CreateDynamicObject(957, 1415.905029, -1629.612670, 15.919154, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1416.365722, -1629.361694, 12.569149, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1418.376464, -1632.641967, 12.569149, 0.000000, -0.000014, 179.999908, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1416.365722, -1634.192504, 12.569149, 0.000000, 0.000068, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1418.376464, -1637.472778, 12.569149, 0.000000, -0.000068, 179.999588, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1414.820556, -1644.140991, 12.569149, 0.000007, 0.000022, 89.999946, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1418.100830, -1642.130249, 12.569149, -0.000007, -0.000022, -90.000053, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1410.018920, -1644.140991, 12.569149, 0.000014, 0.000022, 89.999923, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1726, 1413.299194, -1642.130249, 12.569149, -0.000014, -0.000022, -90.000030, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19466, 1417.378051, -1633.374633, 14.149151, 90.000000, 360.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19466, 1417.378051, -1638.346801, 14.149151, 89.999992, 540.000000, -89.999961, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19466, 1417.378051, -1641.326416, 14.149151, 89.999992, 540.000000, -89.999984, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19466, 1414.061523, -1643.166015, 14.149151, 89.999992, 604.471191, -64.471199, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2247, 1418.230957, -1640.789062, 13.679151, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2248, 1418.298095, -1638.844116, 13.049154, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2249, 1418.183105, -1638.824218, 13.879160, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2248, 1418.298095, -1640.863891, 13.049154, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1629.612670, 15.919154, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1631.133056, 15.919154, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1631.133056, 15.919154, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1632.663208, 15.919154, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1632.663208, 15.919154, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1634.294433, 15.919154, 0.000000, 0.000022, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1634.294433, 15.919154, 0.000000, 0.000022, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1635.814819, 15.919154, 0.000000, 0.000029, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1635.814819, 15.919154, 0.000000, 0.000029, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1637.344970, 15.919154, 0.000000, 0.000037, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1637.344970, 15.919154, 0.000000, 0.000037, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1409.824462, -1642.276977, 15.919154, 0.000000, 0.000060, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.574707, -1642.276977, 15.919154, 0.000000, 0.000060, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1642.276977, 15.919154, 0.000000, 0.000045, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1642.276977, 15.919154, 0.000000, 0.000045, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1415.905029, -1643.807128, 15.919154, 0.000000, 0.000052, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1417.655273, -1643.807128, 15.919154, 0.000000, 0.000052, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1409.824462, -1643.807128, 15.919154, 0.000000, 0.000068, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.574707, -1643.807128, 15.919154, 0.000000, 0.000068, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(11737, 1417.668334, -1639.846679, 12.569149, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2726, 1417.357666, -1631.015502, 13.699155, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2726, 1417.357666, -1635.846313, 13.699155, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2726, 1416.517456, -1643.127197, 13.699155, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2726, 1411.647338, -1643.127197, 13.699155, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2350, 1414.647338, -1636.522216, 12.919150, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2350, 1414.647338, -1635.402099, 12.919150, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2350, 1414.647338, -1634.062377, 12.919150, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2350, 1414.647338, -1632.942260, 12.919150, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1541, 1412.852905, -1632.805419, 13.774720, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(11743, 1412.102783, -1637.229980, 13.599151, 0.000000, 0.000000, 180.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1514, 1413.268798, -1636.020507, 13.749156, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2443, 1411.902465, -1629.389404, 12.569149, 0.000000, 0.000000, 54.099987, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1744, 1411.239257, -1634.851562, 13.994716, 0.000051, 0.000000, 89.999839, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19445, 1416.067993, -1633.407226, 10.836860, 0.000000, 0.000059, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19445, 1413.948364, -1641.866821, 10.826869, 0.000000, 0.000037, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19786, 1414.186035, -1628.672241, 14.759153, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1544, 1411.550170, -1635.153198, 14.314716, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1544, 1411.640258, -1634.613159, 14.314716, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1544, 1411.550170, -1633.793090, 14.314716, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1543, 1411.570068, -1634.204345, 14.304718, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1543, 1411.570068, -1634.934692, 14.304718, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1543, 1411.570068, -1633.634277, 14.304718, 0.000000, 0.000051, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1509, 1411.529541, -1634.021484, 14.514721, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1520, 1411.513061, -1634.443603, 14.364727, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1664, 1411.593994, -1634.773803, 14.494722, 0.000000, 0.000068, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(2616, 1410.579223, -1638.102783, 14.169154, 0.000000, 0.000000, 23.099998, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.764892, -1629.612670, 15.919154, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.764892, -1631.133056, 15.919154, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.764892, -1632.663208, 15.919154, 0.000000, 0.000022, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.764892, -1634.294433, 15.919154, 0.000000, 0.000029, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(957, 1411.764892, -1635.814819, 15.919154, 0.000000, 0.000037, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1541, 1412.852905, -1634.545532, 13.774720, 0.000000, 0.000000, 450.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(11728, 1409.378906, -1641.197631, 14.029150, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1548, 1413.243530, -1633.601806, 13.619153, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1510, 1413.280883, -1631.534301, 13.629152, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19473, 1403.707397, -1631.191528, 13.329154, 0.000000, 0.000007, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19473, 1403.707397, -1632.501342, 13.329154, -0.000006, 0.000003, -52.199966, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19473, 1403.707397, -1633.841308, 13.329154, 0.000004, 0.000003, 51.199974, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19473, 1403.707397, -1635.322265, 13.329154, 0.000000, 0.000014, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19473, 1403.707397, -1636.632080, 13.329154, -0.000012, 0.000009, -52.199954, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19473, 1403.707397, -1637.972045, 13.329154, 0.000011, 0.000009, 51.199974, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19325, 1404.593994, -1635.706542, 12.359144, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(19325, 1404.593994, -1629.065795, 12.359144, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(945, 1404.066284, -1637.249267, 22.865104, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(945, 1404.066284, -1634.677856, 22.865104, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(945, 1404.066284, -1632.008056, 22.865104, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(936, 1407.111816, -1632.583740, 13.015093, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 
	charlie112 = CreateDynamicObject(1431, 1407.285644, -1636.372680, 13.085094, 0.000000, 0.000000, 270.000000, 1, 0, -1, 300.00, 300.00); 

	
	charlie112 = CreateDynamicObject(4006, 1394.359985, -1620.660034, 32.148399, 0.000000, 0.000000, 0.000000, 0, 0, -1, 180.00, 180.00); 

	return 1;
}

static UsunObiekty(playerid)
{

	RemoveBuildingForPlayer(playerid, 4006, 1394.359, -1620.660, 32.148, 0.250);
	RemoveBuildingForPlayer(playerid, 4055, 1394.359, -1620.660, 32.148, 0.250);

	return 1;
}
