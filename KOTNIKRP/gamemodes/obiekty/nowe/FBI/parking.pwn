//parking.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: parking.pwn ]------------------------------------------//
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
new extfbi;

//-----------------<[ Główne funkcje: ]>-------------------

FBI__parking_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}
FBIPARKING_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//Stat
static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 1260, 591.726, -1508.930, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 616.765, -1495.770, 14.320, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 616.765, -1492.030, 14.320, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 616.765, -1488.479, 14.320, 0.250);
	RemoveBuildingForPlayer(playerid, 6372, 599.093, -1435.400, 19.882, 0.250);
	RemoveBuildingForPlayer(playerid, 6520, 599.109, -1458.760, 45.062, 0.250);
	RemoveBuildingForPlayer(playerid, 1529, 583.460, -1502.109, 16.000, 0.250);
	RemoveBuildingForPlayer(playerid, 1260, 591.726, -1508.930, 25.304, 0.250);
	RemoveBuildingForPlayer(playerid, 1529, 583.460, -1502.109, 16.000, 0.250);
	return 1;
}
//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//_____________________________PARKING PODZIEMNY_________________________________________________________
	
	CreateDynamicObject(10010, 1093.52026, 1530.51001, 5.30800,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1063.22949, 1562.96179, 7.13630,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1063.22949, 1562.96179, 10.44610,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1063.22949, 1562.96179, 13.71320,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1058.76672, 1562.97400, 7.19630,   0.00000, 0.00000, 0.00000,2 );
	CreateDynamicObject(2957, 1058.76672, 1562.97400, 10.44610,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1058.76672, 1562.97400, 13.71320,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1054.30615, 1562.97693, 7.19630,   0.00000, 0.00000, 0.00000,2 );
	CreateDynamicObject(2957, 1054.30615, 1562.97693, 10.44610,   0.00000, 0.00000, 0.00000, 2);
	CreateDynamicObject(2957, 1054.30615, 1562.99695, 12.27370,   0.00000, 0.00000, 0.00000,2 );
	
//FIX OD skPembleton
	extfbi = CreateDynamicObject(1260, 591.726989, -1508.930053, 25.304700, 0.000000, 0.000000, -179.827163, 0, 0, -1, 170.00, 170.00); 
	SetDynamicObjectMaterial(extfbi, 6, 1714, "cj_office", "CJ_DESK", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1489.993652, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1519.007446, 16.087205, 0.000000, -0.000002, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1499.624023, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1503.844238, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1513.473510, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1523.113037, 12.587204, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1523.113037, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1494.214843, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1484.604370, 16.087205, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1504.913085, 15.362123, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1513.743896, 15.362123, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1489.993652, 12.587196, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1519.007446, 12.587196, 0.000000, -0.000005, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1499.624023, 12.587196, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 610.325927, -1489.993652, 16.087205, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 610.325927, -1519.007446, 16.087205, 0.000000, -0.000005, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 610.325927, -1499.624023, 16.087205, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 610.325927, -1489.993652, 12.587196, 0.000000, -0.000015, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 610.325927, -1519.007446, 12.587196, 0.000000, -0.000007, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 610.325927, -1499.624023, 12.587196, 0.000000, -0.000015, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1523.933593, 16.632133, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1488.472534, 15.362123, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1488.212036, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1502.922607, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1492.972656, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1497.962402, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1515.741821, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1520.661621, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1525.661254, 18.252126, 0.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(19457, 585.286437, -1499.112915, 16.087205, 0.000000, -0.000010, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 588.426391, -1503.833251, 17.777240, 0.000000, 89.999992, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 588.426391, -1513.454345, 17.777240, 0.000000, 89.999992, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 584.945678, -1503.833251, 17.777240, 0.000000, 89.999992, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 605.427368, -1523.818359, 13.937228, 0.000000, -0.000002, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 585.286437, -1518.192504, 16.087205, 0.000000, -0.000010, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1523.113037, 19.487192, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1494.214843, 19.487192, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 585.286437, -1499.112915, 19.487192, -0.000002, -0.000010, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 585.286437, -1518.192504, 19.487192, -0.000002, -0.000010, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1489.993652, 20.347198, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1509.257202, 20.347198, 0.000000, -0.000005, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1499.624023, 20.347198, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(19457, 611.116394, -1518.866821, 20.347198, 0.000000, -0.000005, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(18762, 590.693542, -1523.964599, 16.602128, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(18762, 590.693542, -1488.552368, 16.832149, 0.000000, -0.000005, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1513.493041, 12.587204, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1503.874145, 12.587204, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 595.817199, -1523.813354, 13.937172, 0.000000, -0.000010, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 605.397338, -1523.818359, 17.407253, 0.000000, -0.000002, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 584.945678, -1513.454345, 17.777240, 0.000000, 89.999992, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(19457, 595.817199, -1523.813354, 17.407175, 0.000000, -0.000010, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	extfbi = CreateDynamicObject(18762, 589.713317, -1523.964599, 16.602128, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1503.844238, 19.497262, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(18762, 610.713989, -1523.933593, 11.702134, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(19457, 590.096984, -1513.473510, 19.497262, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	extfbi = CreateDynamicObject(18762, 589.713439, -1488.552368, 16.832149, 0.000000, -0.000005, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3116, "kei_wnchx", "trilby04", 0x00000000);
	extfbi = CreateDynamicObject(19365, 612.758544, -1520.347045, 12.337524, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 615.718444, -1520.325927, 12.337528, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 615.696594, -1517.063598, 12.297527, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19438, 611.137145, -1499.932250, 15.836967, 90.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19438, 611.137145, -1496.432983, 15.836967, 90.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 612.486206, -1517.085815, 12.297527, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1500.703857, 15.028628, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19365, 612.465393, -1514.075317, 12.247526, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 615.665954, -1514.052734, 12.267526, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1498.714233, 15.028628, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1496.723388, 15.028628, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1494.752807, 15.028628, 0.000000, -0.000007, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19438, 611.137145, -1495.532592, 15.836967, 90.000000, 90.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1500.703857, 16.638637, 0.000000, -0.000012, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1498.714233, 16.638637, 0.000000, -0.000002, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1496.723388, 16.638637, 0.000000, -0.000002, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19940, 611.026306, -1494.752807, 16.638637, 0.000000, -0.000010, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19365, 615.741333, -1523.547485, 12.367527, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 612.530639, -1523.571166, 12.367527, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19939, 611.026855, -1501.687988, 15.537682, 90.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19365, 615.599426, -1504.542724, 12.167525, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 612.719543, -1504.562377, 12.167525, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19939, 611.026855, -1501.687988, 16.147695, 90.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19939, 611.026855, -1493.766235, 15.537682, 90.000000, -135.000000, 135.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19939, 611.026855, -1493.766235, 16.147695, 90.000000, -135.000000, 135.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 3899, "hospital2", "black", 0x00000000);
	extfbi = CreateDynamicObject(19365, 612.699584, -1501.469360, 12.167525, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(19365, 615.549743, -1501.450561, 12.167525, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(3111, 611.228576, -1500.364257, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}FEDE", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(19365, 615.529724, -1498.519409, 12.167523, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(3111, 611.228576, -1499.713623, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}RAL", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(19365, 612.350341, -1498.540039, 12.167523, 0.000000, 0.000000, -89.600006, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	extfbi = CreateDynamicObject(3111, 611.228576, -1498.833251, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}BURE", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1498.232666, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}AU", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1497.572021, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}OF", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1496.861816, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}INVE", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1496.201171, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}STIG", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1495.530517, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}ATIO", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1495.090087, 16.060413, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}N", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1498.511108, 15.460408, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}LOS", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	extfbi = CreateDynamicObject(3111, 611.228576, -1497.430053, 15.460408, 90.000000, 99.735610, -9.735610, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterialText(extfbi, 0, "{000000}SANTOS", 130, "Ariel", 120, 0, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	extfbi = CreateDynamicObject(18756, 594.739257, -1486.807495, 16.069437, -0.000002, 0.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	extfbi = CreateDynamicObject(18756, 594.799316, -1490.618408, 16.069437, 0.000002, -0.000000, -90.000000, 0, 0, -1, 500.00, 500.00);
	extfbi = CreateDynamicObject(6520, 599.109008, -1458.760009, 45.062500, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	extfbi = CreateDynamicObject(9093, 590.198852, -1509.275756, 15.716917, 0.000000, 0.000000, 180.000000, 0, 0, -1, 500.00, 500.00); 

	
	//STARE OBIEKTY FBI - DACH, KAMERY i WEJSCIE
	CreateDynamicObject(3928, 599.38855, -1444.34998, 79.15625,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3928, 599.33240, -1458.95142, 79.15625,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3928, 599.43225, -1472.92139, 79.15625,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1280, 609.12402, -1469.00293, 13.95129,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1280, 609.21777, -1475.00293, 13.95129,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1280, 609.54590, -1450.16895, 13.64654,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1280, 609.56055, -1442.75684, 13.55266,   0.00000, 0.00000, 180.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 608.72424, -1482.41248, 79.22467,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 608.73743, -1481.79297, 79.22467,   0.00000, 0.00000, 180.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 608.72821, -1434.63782, 79.22467,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 608.77112, -1435.29138, 79.22467,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 589.47949, -1434.49597, 79.22467,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 589.45361, -1482.41638, 79.22467,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 589.52051, -1435.08423, 79.22467,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3526, 589.48956, -1481.71167, 79.22467,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 599.51215, -1434.37207, 79.66994,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 608.89301, -1458.86084, 79.66994,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 589.30133, -1459.23840, 79.66994,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 599.70605, -1482.54102, 79.66994,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1536, 606.27063, -1460.03833, 13.34678,   0.00000, 0.00000, 90.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1536, 606.24860, -1457.03687, 13.34224,   0.00000, 0.00000, 270.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(10079, 613.51270, -1472.94824, 75.14333,   0.00000, 0.00000, 179.99451, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1555, 612.71497, -1471.76636, 72.90190,   97.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(8614, 613.56427, -1477.35999, 75.19573,   0.00000, 0.00000, 89.20001, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11544, 604.25714, -1480.16248, 78.15900,   0.00000, 0.00000, 89.80002, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 614.86731, -1428.49951, 73.39528,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 583.35065, -1428.49731, 73.39528,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 583.36975, -1488.59387, 73.39528,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3666, 614.83728, -1488.59106, 73.39528,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(2921, 609.68689, -1469.35876, 78.33493,   0.00000, 0.00000, 176.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(2921, 583.51471, -1428.35938, 19.47126,   0.00000, 0.00000, 258.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(2921, 577.95135, -1419.76563, 22.36699,   0.00000, 0.00000, 130.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(2921, 583.29694, -1488.54919, 22.71841,   0.00000, 0.00000, 320.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(14819, 195.98688, 167.18262, 1003.17334,   0.00000, 0.00000, 270.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(14819, 195.67262, 167.18327, 1003.17334,   0.00000, 0.00000, 90.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(2922, 195.82811, 169.70433, 1003.60626,   0.00000, 0.00000, 268.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(14782, 230.79552, 180.43782, 1003.04730,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(14782, 230.82603, 183.43758, 1003.04730,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(14782, 227.81172, 184.28217, 1003.04730,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3811, 606.50867, -1454.72253, 13.79672,   0.00000, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(3811, 606.69678, -1462.36816, 13.82512,   0.00000, 353.66327, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(10250, 586.52313, -1471.58557, 104.86637,   0.00000, 0.00000, 271.54077, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(7092, 614.24225, -1442.63538, 23.98008,   0.00000, 0.00000, 180.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 616.46558, -1462.15601, 9.99043,   181.71216, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 616.42139, -1459.94116, 9.99043,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 616.40802, -1457.73596, 9.99043,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 616.38275, -1455.39990, 9.99043,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 613.09979, -1480.03503, 9.99043,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 611.21698, -1481.34387, 9.99043,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 613.36768, -1436.75659, 9.64963,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(11435, 611.66382, -1435.26563, 9.62123,   181.70837, 0.00000, 0.00000, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1257, 618.76007, -1469.46204, 14.81989,   0.00000, 0.00000, 180.01050, 0, 0, -1, 300.00, 300.00);
	CreateDynamicObject(1257, 645.63605, -1454.91394, 14.81989,   0.00000, 0.00000, 1.33447, 0, 0, -1, 300.00, 300.00);

	
	return 1;
}
static StworzBramy()
{
	extfbi = CreateDynamicObject(980, 610.891235, -1508.384643, 15.930227, 0.000000, 0.000000, 270.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(extfbi, 0, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	SetDynamicObjectMaterial(extfbi, 1, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	SetDynamicObjectMaterial(extfbi, 3, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	SetDynamicObjectMaterial(extfbi, 5, 1613, "alleyprop", "stuffdirtcol", 0x00000000);
	DodajBrame(extfbi, 610.891235, -1508.384643, 15.930227, 0.000000, 0.000000, 270.000000, 610.891235, -1499.592529, 15.930227, 0.000000, 0.000000, 270.000000, 5, 15, BRAMA_UPR_TYPE_FRACTION, 2);
	return 1; 
}

