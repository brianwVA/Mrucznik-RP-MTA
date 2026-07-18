//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: banklsext.pwn ]-----------------------------------------//
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
//BY- Seven
//-----------------<[ ZMIENNE ]>---------------------------
//są w pliku ./skrypt/obiekty_zmienne
//-----------------<[ Wyw Funkcje ]>---------------------------
banklsext_Init()
{
	StworzObiekty();
	
	return 1;
}
//-----------------<[ Funkcje ]>---------------------------

//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2018-10-05 19:16:28" by "Luis_Cotta"
		Created by "Seven"
		Spawn Position: -/-
		Script by: Simeone
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
  
static StworzObiekty()
{

	
	banklsext = CreateDynamicObject(19445, 1436.822509, -1021.703369, 24.078126, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 16639, "a51_labs", "studiowall4_law", 0x00000000);
	banklsext = CreateDynamicObject(19445, 1446.434692, -1021.703369, 24.078126, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 16639, "a51_labs", "studiowall4_law", 0x00000000);
	banklsext = CreateDynamicObject(19445, 1451.164916, -1016.963806, 24.078126, 0.000000, 0.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 16639, "a51_labs", "studiowall4_law", 0x00000000);
	banklsext = CreateDynamicObject(19445, 1477.601318, -1021.703369, 24.078126, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 16639, "a51_labs", "studiowall4_law", 0x00000000);
	banklsext = CreateDynamicObject(19445, 1472.869873, -1016.963989, 24.078126, 0.000000, 0.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 16639, "a51_labs", "studiowall4_law", 0x00000000);
	banklsext = CreateDynamicObject(19445, 1487.231567, -1021.703369, 24.078126, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 16639, "a51_labs", "studiowall4_law", 0x00000000);
	banklsext = CreateDynamicObject(19377, 1435.403076, -1016.813720, 25.733770, 0.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	banklsext = CreateDynamicObject(19377, 1445.886962, -1016.813720, 25.733770, 0.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	banklsext = CreateDynamicObject(19377, 1478.131225, -1016.813720, 25.733770, 0.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	banklsext = CreateDynamicObject(19377, 1488.609252, -1016.813720, 25.733770, 0.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1492.231201, -1019.285278, 25.683746, 0.000000, 90.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1492.232177, -1016.773559, 25.684745, 0.000000, 90.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1489.552124, -1013.782592, 25.684745, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1484.591796, -1013.782592, 25.684745, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1474.939453, -1013.782592, 25.684745, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1479.921997, -1013.782592, 25.683746, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1489.552124, -1021.283142, 25.684745, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1484.591796, -1021.283691, 25.684745, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1479.921997, -1021.284057, 25.684745, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1475.289794, -1021.282958, 25.683746, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1473.289550, -1019.283081, 25.684745, 0.000000, 90.000000, 270.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1473.290527, -1015.782043, 25.685745, 0.000000, 90.000000, 270.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1489.357543, -1021.244262, 26.719722, 0.000000, 0.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1484.657226, -1021.244262, 26.719722, 0.000000, 0.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1479.985961, -1021.244262, 26.719722, 0.000000, 0.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1475.364624, -1021.244262, 26.719722, 0.000000, 0.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 2, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	banklsext = CreateDynamicObject(970, 1473.304443, -1020.254089, 25.209711, 0.000000, 90.000000, 270.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1472.674072, -1016.763610, 26.899724, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 2, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1450.741088, -1019.285278, 25.685745, -0.000002, 90.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1450.741088, -1016.773559, 25.684745, -0.000002, 90.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1448.561523, -1013.782592, 25.684745, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1443.571166, -1013.782592, 25.684745, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1433.598510, -1013.782592, 25.684745, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1438.581054, -1013.782592, 25.683746, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1448.061035, -1021.283142, 25.684745, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1443.100708, -1021.283691, 25.684745, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1438.430908, -1021.284057, 25.684745, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1433.798706, -1021.282958, 25.683746, 0.000000, 90.000000, -179.999984, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1431.798461, -1019.283081, 25.684745, 0.000002, 90.000000, -90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1431.799438, -1015.782043, 25.685745, 0.000002, 90.000000, -90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1448.736816, -1021.244262, 26.719722, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1444.036499, -1021.244262, 26.719722, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1439.365234, -1021.244262, 26.719722, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1434.743896, -1021.244262, 26.719722, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 2, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	banklsext = CreateDynamicObject(970, 1450.773071, -1020.254089, 25.209711, 0.000000, 90.000000, 270.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1451.214233, -1016.763610, 26.899724, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 2, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	banklsext = CreateDynamicObject(970, 1470.649169, -1022.794433, 23.339719, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1457.737182, -1021.663879, 23.489723, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1462.107666, -1022.794433, 23.339719, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1466.387207, -1021.663879, 23.489723, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1469.500366, -1020.042114, 33.893711, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(970, 1453.417602, -1022.724670, 23.339719, 0.000000, -0.000002, 0.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(banklsext, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1464.500366, -1020.042114, 33.893672, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1459.519653, -1020.042114, 33.893699, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1454.519042, -1020.042114, 33.903850, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1454.519042, -1020.042114, 31.193773, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1459.498535, -1020.042114, 31.193773, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(19362, 1459.085693, -1020.421691, 32.486240, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(banklsext, 0, "{FFFFFF}Verte", 50, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	banklsext = CreateDynamicObject(18762, 1464.488769, -1020.042114, 31.193773, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(18762, 1469.498535, -1020.042114, 31.193773, 0.000000, 90.000000, 180.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(banklsext, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	banklsext = CreateDynamicObject(19362, 1461.567382, -1020.421691, 32.486293, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(banklsext, 0, "{FFFFFF}Bank", 50, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	banklsext = CreateDynamicObject(19362, 1464.267089, -1020.361633, 32.506248, 0.000000, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(banklsext, 0, "{FFFFFF}  LS", 50, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	banklsext = CreateDynamicObject(19839, 1475.936401, -1020.021179, 25.799707, 0.000000, 0.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(822, 1446.871704, -1017.872924, 25.819707, -0.000002, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(822, 1435.449218, -1017.601501, 26.479719, -0.000002, -0.000001, 57.999984, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(821, 1441.337890, -1017.296020, 25.674741, 0.000000, -0.000002, -17.399995, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(822, 1487.993530, -1017.872924, 25.819707, -0.000005, 0.000000, 90.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(822, 1476.571044, -1017.601501, 26.479719, -0.000004, -0.000002, 57.999984, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(821, 1482.459716, -1017.296020, 25.674741, 0.000001, -0.000004, -17.399995, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(19445, 1329.109130, -1384.947875, 8.676517, 90.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(19445, 1321.328125, -1384.947875, 8.636506, 90.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(19445, 1298.906494, -1384.947875, 8.536503, 90.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(19445, 1291.046264, -1384.947875, 8.536503, 90.000000, 90.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 
	banklsext = CreateDynamicObject(19978, 1474.035278, -1021.772033, 22.656250, 0.000000, 0.000000, 0.000000, 0, 0, -1, 380.00, 380.00); 

 
 
	return 1;
}

