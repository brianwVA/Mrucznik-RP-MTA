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
//BY: SIMEONE, DEDUIR, SANTIAGO, FARAON

//-----------------<[ Gwne funkcje: ]>-------------------
KomisariatLS_parking_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}

KomisariatLS_parking_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//____Parking na odh.________________
	
	CreateDynamicObject(967, 1624.5001200, -1861.5090300, 12.5414000, 0.0000000, 0.0000000, -90.0000000, 0, 0, -1, 150); // 0
	CreateDynamicObject(966, 1623.4715600, -1862.0246600, 12.5432300, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 1
	CreateDynamicObject(3850, 1626.9054000, -1862.2377900, 13.0666400, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 2
	CreateDynamicObject(19450, 1622.0585900, -1783.9150400, 14.7439100, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 3
	CreateDynamicObject(19450, 1622.0585900, -1783.9150400, 11.2599000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 4
	CreateDynamicObject(19450, 1617.3241000, -1788.6530800, 14.7439000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 5
	CreateDynamicObject(19450, 1612.5896000, -1783.9222400, 14.7439000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 6
	CreateDynamicObject(19450, 1617.3244600, -1779.1787100, 14.7439000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 7
	CreateDynamicObject(19450, 1617.3244600, -1779.1787100, 11.2542000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 8
	CreateDynamicObject(19450, 1612.5896000, -1783.9222400, 11.2715000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 9
	CreateDynamicObject(19450, 1617.2984600, -1788.6411100, 11.2579200, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 10
	CreateDynamicObject(19376, 1617.3166500, -1784.3466800, 16.4160000, 0.0000000, 90.0000000, 90.0000000, 0, 0, -1, 150); // 11
	CreateDynamicObject(1536, 1616.0686000, -1788.7159400, 12.4624000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 12
	CreateDynamicObject(1536, 1619.0710400, -1788.6850600, 12.4624000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 13
	CreateDynamicObject(2197, 1621.7282700, -1787.9379900, 14.6537900, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 14
	CreateDynamicObject(2197, 1621.7282700, -1787.9379900, 12.9962000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 15
	CreateDynamicObject(2197, 1621.7282700, -1787.9379900, 11.3307000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 16
	CreateDynamicObject(2197, 1613.2496300, -1788.0078100, 14.6780000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 17
	CreateDynamicObject(2197, 1613.2496300, -1788.0078100, 13.0101000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 18
	CreateDynamicObject(2197, 1613.2496300, -1788.0078100, 11.3422000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 150); // 19
	CreateDynamicObject(2058, 1619.8284900, -1789.8369100, 12.5032000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 20
	CreateDynamicObject(2058, 1612.4746100, -1789.9030800, 12.5032000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 21
	CreateDynamicObject(2058, 1600.0128200, -1788.0411400, 12.5032000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 22
	CreateDynamicObject(19403, 1660.7110600, -1792.8845200, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 23
	CreateDynamicObject(19403, 1660.7058100, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 24
	CreateDynamicObject(19403, 1657.3468000, -1792.8806200, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 25
	CreateDynamicObject(19403, 1657.3429000, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 26
	CreateDynamicObject(19403, 1657.3408200, -1791.9437300, 10.8066000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 27
	CreateDynamicObject(19403, 1654.0134300, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 28
	CreateDynamicObject(19403, 1654.0157500, -1792.8808600, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 29
	CreateDynamicObject(19403, 1654.0070800, -1791.0778800, 10.8066000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 30
	CreateDynamicObject(19403, 1650.7032500, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 31
	CreateDynamicObject(19403, 1650.6978800, -1792.8891600, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 32
	CreateDynamicObject(19403, 1650.7021500, -1790.1588100, 10.8264000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 33
	CreateDynamicObject(19403, 1647.1821300, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 34
	CreateDynamicObject(19403, 1647.1822500, -1792.8698700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 35
	CreateDynamicObject(19403, 1647.1799300, -1789.6639400, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 36
	CreateDynamicObject(19403, 1647.1767600, -1789.2550000, 10.8256000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 37
	CreateDynamicObject(19403, 1643.6772500, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 38
	CreateDynamicObject(19403, 1643.6815200, -1792.8719500, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 39
	CreateDynamicObject(19403, 1643.6894500, -1789.6765100, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 40
	CreateDynamicObject(19403, 1643.6940900, -1788.2486600, 10.8236000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 41
	CreateDynamicObject(19403, 1640.0505400, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 42
	CreateDynamicObject(19403, 1640.0498000, -1792.8797600, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 43
	CreateDynamicObject(19403, 1640.0489500, -1789.6695600, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 44
	CreateDynamicObject(19403, 1640.0489500, -1787.2888200, 10.8236000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 45
	CreateDynamicObject(19403, 1636.6234100, -1796.0816700, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 46
	CreateDynamicObject(19403, 1636.6283000, -1792.8713400, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 47
	CreateDynamicObject(19403, 1636.6257300, -1789.6600300, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 48
	CreateDynamicObject(19403, 1636.6215800, -1786.4576400, 10.8266000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 49
	CreateDynamicObject(19403, 1643.1033900, -1847.8035900, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 50
	CreateDynamicObject(19403, 1643.1090100, -1844.6088900, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 51
	CreateDynamicObject(19403, 1638.9085700, -1844.6088900, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 52
	CreateDynamicObject(19403, 1638.9012500, -1847.8039600, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 53
	CreateDynamicObject(19403, 1634.5301500, -1844.6088900, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 54
	CreateDynamicObject(19403, 1634.5227100, -1847.8171400, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 55
	CreateDynamicObject(19403, 1630.5072000, -1844.6088900, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 56
	CreateDynamicObject(19403, 1630.5028100, -1847.7876000, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 57
	CreateDynamicObject(19403, 1626.4779100, -1847.8244600, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 58
	CreateDynamicObject(19403, 1626.4835200, -1844.6088900, 10.8319000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 59
	CreateDynamicObject(3850, 1679.24866, -1791.12122, 12.78720,   0.00000, 0.00000, 0.00000, 0, 0, -1, 269);
	CreateDynamicObject(19403, 1593.3515600, -1775.2650100, 10.7951000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 61
	CreateDynamicObject(19403, 1596.5507800, -1775.2558600, 10.7951000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 62
	CreateDynamicObject(19403, 1596.5507800, -1779.2531700, 10.7951000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 63
	CreateDynamicObject(19403, 1593.3527800, -1779.2561000, 10.7951000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 64
	CreateDynamicObject(19403, 1596.5507800, -1783.0822800, 10.7951000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 65
	CreateDynamicObject(19403, 1593.3383800, -1783.0799600, 10.7951000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 66


	ciec =	CreateDynamicObject(19450, 1622.0585900, -1783.9150400, 14.7439100, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 3
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	
	ciec =	CreateDynamicObject(19450, 1622.0585900, -1783.9150400, 11.2599000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 4
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	
	ciec =	CreateDynamicObject(19450, 1617.3241000, -1788.6530800, 14.7439000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 5
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	ciec =	CreateDynamicObject(19450, 1612.5896000, -1783.9222400, 14.7439000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 6
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	ciec =	CreateDynamicObject(19450, 1617.3244600, -1779.1787100, 14.7439000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 7
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	ciec =	CreateDynamicObject(19450, 1617.3244600, -1779.1787100, 11.2542000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 8
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	ciec =	CreateDynamicObject(19450, 1612.5896000, -1783.9222400, 11.2715000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 150); // 9
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	ciec =	CreateDynamicObject(19450, 1617.2984600, -1788.6411100, 11.2579200, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 150); // 10
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	ciec =	CreateDynamicObject(19376, 1617.3166500, -1784.3466800, 16.4160000, 0.0000000, 90.0000000, 90.0000000, 0, 0, -1, 150); // 11
	SetDynamicObjectMaterial(ciec, 0, 3925, "weemap", "Bow_stained_wall", 0xFFFFFFFF);
	
	//___________________________________Parking LSPD____________________________________________________________
	
	
	pevori2 = CreateDynamicObject(19361, 1544.681884, -1622.651367, 14.124566, 0.000000, 0.000060, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.681884, -1619.441284, 14.124566, 0.000000, 0.000060, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.932128, -1619.441284, 14.124566, 0.000000, -0.000060, 179.999633, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1623.284057, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1582.119506, -1634.880371, 14.122814, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1660.063232, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1582.130615, -1633.553588, 14.112813, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1582.130615, -1637.283691, 14.112813, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1621.283081, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1619.283203, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1582.019409, -1634.880371, 14.122814, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1582.010498, -1633.553588, 14.112814, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1582.010498, -1637.275756, 14.112814, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1580.617309, -1632.830078, 14.122814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1578.776489, -1632.826171, 14.122814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.932128, -1622.652221, 14.124566, 0.000000, -0.000060, 179.999633, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1543.071777, -1631.352416, 14.124566, 0.000000, 0.000022, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1624.274780, 14.886883, 89.999992, 270.000000, -89.999961, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1624.274780, 12.886885, 89.999992, 270.000000, -89.999961, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1580.617309, -1632.970214, 14.122814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1578.776489, -1632.966308, 14.122814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.681884, -1637.692993, 14.124566, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19390, 1544.681884, -1634.482910, 14.124566, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19390, 1544.932128, -1634.482910, 14.124566, 0.000000, -0.000022, 179.999862, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1636.664062, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1634.663085, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1632.663208, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.932128, -1637.693847, 14.124566, 0.000000, -0.000022, 179.999862, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1576.371459, -1632.825683, 14.112841, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1574.770629, -1632.825683, 14.112841, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19417, 1572.376586, -1632.826171, 14.122814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.932128, -1631.273071, 14.124566, 0.000000, -0.000022, 179.999862, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1618.832763, 15.876889, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1635.224487, 13.866877, 89.999992, 270.000000, -89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1635.224487, 11.876877, 89.999992, 270.000000, -89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1633.734985, 11.876877, 89.999992, 270.000000, -89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1633.734985, 13.866879, 89.999992, 270.000000, -89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 18065, "ab_sfammumain", "mp_gun_wall", 0x00000000);
	pevori2 = CreateDynamicObject(19939, 1544.808471, -1634.240478, 14.854453, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19939, 1544.808471, -1634.740966, 14.854453, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1543.782226, -1632.762817, 14.124566, 0.000000, 0.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1569.990722, -1632.825683, 14.112841, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1568.390502, -1632.825683, 14.112841, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19397, 1567.671508, -1635.900634, 14.115791, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1543.061645, -1632.043090, 14.124566, 0.000000, 0.000022, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1543.792480, -1630.632446, 14.124566, 0.000000, 0.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1567.669799, -1633.536376, 14.112841, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1630.663208, 15.866888, 0.000000, 0.000014, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.681884, -1631.273071, 14.124566, 0.000000, -0.000022, 179.999862, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1567.669799, -1638.298583, 14.112841, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19361, 1544.673095, -1620.620971, 13.314572, 0.000000, 0.000029, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1653.858398, 11.886859, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1543.969970, -1632.233520, 15.876888, 0.000007, 0.000014, 89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1543.969970, -1631.793212, 15.876888, 0.000007, 0.000014, 89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1543.969970, -1632.673950, 15.876888, 0.000007, 0.000014, 89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1629.674926, 14.886883, 89.999992, 270.000091, -89.999961, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1629.674926, 12.886885, 89.999992, 270.000091, -89.999961, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1577.218139, -1635.239013, 16.372810, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(792, 1577.240356, -1620.291259, 12.612798, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(18766, 1577.218139, -1635.239013, 16.372810, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1577.379882, -1633.843505, 14.112813, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1577.399902, -1634.214721, 14.112813, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19397, 1577.371826, -1636.601196, 14.285792, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19397, 1577.251708, -1636.601196, 14.285792, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1577.259765, -1633.843505, 14.108815, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(792, 1572.460205, -1620.291259, 12.622798, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(792, 1567.980102, -1620.291259, 12.612798, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(19435, 1577.249755, -1634.214721, 14.112813, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(792, 1563.539672, -1620.291259, 12.612798, 0.000000, 0.000007, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(792, 1558.759521, -1620.291259, 12.622798, 0.000000, 0.000007, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(792, 1554.279418, -1620.291259, 12.622798, 0.000000, 0.000007, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(19435, 1577.969970, -1637.344604, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1579.570556, -1637.344604, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1581.161621, -1637.344604, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1663.543334, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1576.361083, -1637.344604, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1546.235961, -1700.673217, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1583.490600, -1638.142333, 15.056876, 0.000000, 0.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1583.490600, -1638.042236, 15.056876, 0.000000, 0.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1574.780639, -1637.344604, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1584.091186, -1638.042236, 14.046875, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1573.180053, -1637.344604, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1568.520019, -1637.154418, 14.112814, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1573.460327, -1637.874877, 14.112814, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1594.208129, -1632.877075, 11.930853, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1592.554443, -1636.063354, 11.920853, 90.000000, 0.000000, 359.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1592.547607, -1634.548950, 11.930853, 90.000000, 0.000000, 359.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19360, 1582.053955, -1637.918701, 14.128746, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 18065, "ab_sfammumain", "mp_gun_wall", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.206665, -1617.862915, 12.056526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1543.969970, -1631.352783, 15.876888, 0.000007, 0.000014, 89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1621.100463, 11.770865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1572.572265, -1635.229003, 16.363809, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.280029, -1622.819335, 11.772865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1565.859863, -1632.829589, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1562.389892, -1632.829589, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1558.909057, -1632.829589, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1555.428466, -1632.829589, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1551.937377, -1632.829589, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1548.466064, -1632.829589, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1546.725341, -1632.829589, 11.774865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1562.607055, -1635.314453, 12.060524, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1552.655029, -1635.314453, 12.060524, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1549.643554, -1635.314453, 12.062523, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1576.966430, -1635.314453, 12.064524, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 14577, "casinovault01", "vaultFloor", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1572.584838, -1635.314453, 12.068525, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 14577, "casinovault01", "vaultFloor", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1572.572265, -1640.230468, 16.373809, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1597.680541, -1632.875122, 11.930853, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1601.172607, -1632.875122, 11.930853, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1604.664672, -1632.875122, 11.930853, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1606.226684, -1632.875122, 11.934853, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1597.577514, -1635.336669, 12.221529, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1602.910766, -1635.336669, 12.225528, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1577.218139, -1635.208984, 16.432811, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1572.586669, -1635.218994, 16.422811, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1572.586669, -1640.210449, 16.432811, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1577.218139, -1635.208984, 16.432811, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(2737, 1577.102416, -1634.805664, 14.128526, 0.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19172, 1575.357421, -1637.247680, 14.588522, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 19162, "newpolicehats", "policehatmap1", 0x00000000);
	pevori2 = CreateDynamicObject(792, 1549.409057, -1620.291259, 12.622798, 0.000000, 0.000007, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, -1, "none", "none", 0xFF333333);
	pevori2 = CreateDynamicObject(19353, 1541.552734, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1544.424926, -1615.952270, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1544.424926, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1541.089477, -1656.290771, 12.070528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1653.100708, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1547.286132, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1550.167236, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1553.028442, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1555.879638, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1558.750610, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1561.601562, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1564.463256, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1567.305175, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1570.166015, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1573.027221, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1575.888916, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1578.740722, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1581.601440, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1584.452880, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1587.314575, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1590.176025, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1593.037353, -1604.181640, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1595.888305, -1604.181640, 10.672796, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1598.740234, -1604.181640, 10.702795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1601.601440, -1604.181640, 10.732796, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1604.453369, -1604.181640, 10.762798, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1604.453369, -1605.954589, 10.764798, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(1518, 1579.381469, -1633.228271, 13.944523, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 18631, "nomodelfile", "hazardtile6", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 19162, "newpolicehats", "policehatmap1", 0x00000000);
	pevori2 = CreateDynamicObject(1518, 1580.022094, -1633.228271, 13.944523, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 2, 19162, "newpolicehats", "policehatmap1", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1556.230834, -1657.352905, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19893, 1581.504028, -1635.999877, 13.654520, 0.000000, 0.000000, 254.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 1, 19162, "newpolicehats", "policehatmap2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1556.230834, -1647.350708, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1556.230834, -1668.021850, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1556.230834, -1684.029541, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1556.230834, -1696.694458, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.206665, -1646.069946, 12.060524, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1649.289184, 11.776865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1645.797973, 11.786865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19173, 1579.487426, -1637.250122, 14.874526, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 2464, "rc_shop_acc", "CJ_RC_4", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1543.969970, -1630.912475, 15.876888, 0.000007, 0.000014, 89.999977, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1543.969970, -1630.762329, 15.866888, 0.000000, 0.000014, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(4988, 1516.738037, -1583.532348, 39.206859, -0.000000, -0.000007, -170.099914, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 19173, "samppictures", "samppicture1", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1601.603393, -1605.954589, 10.734796, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1598.733032, -1605.954589, 10.704795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1595.891723, -1605.954589, 10.664794, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19173, 1567.587890, -1635.864990, 15.310523, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterialText(pevori2, 0, "{000000}Szatnia", 40, "Quartz MS", 20, 1, 0x00000000, 0x00000000, 1);
	pevori2 = CreateDynamicObject(19173, 1569.380371, -1632.913452, 14.918522, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 2254, "picture_frame_clip", "CJ_PAINTING4", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1593.039428, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1544.810546, -1638.644531, 15.866888, 0.000000, 0.000022, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1590.178833, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1587.306518, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1584.455444, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1581.603027, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1578.741333, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1575.889770, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1573.028808, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1570.166992, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1567.305419, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1564.463867, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1561.602050, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1558.750976, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1555.879028, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1540.109497, -1672.146484, 11.787879, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1584.091186, -1638.042236, 12.046878, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1582.640625, -1638.042236, 12.046878, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1582.640625, -1638.042236, 14.036873, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1582.640625, -1638.152343, 14.036873, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1582.640625, -1638.152343, 12.046878, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1584.091186, -1638.142333, 14.046875, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1584.091186, -1638.142333, 12.056879, 90.000000, 180.000030, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1656.582763, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1667.014038, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1670.485351, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1673.946411, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1677.428955, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1680.871337, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1684.333740, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1687.775146, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1691.256713, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1694.728027, 11.766865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.191650, -1703.643920, 12.070526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1698.199340, 11.766864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.169189, -1694.865966, 12.050527, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.169189, -1684.885986, 12.050527, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.169189, -1674.903930, 12.050524, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.169189, -1664.919067, 12.050527, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.169189, -1656.290771, 12.060527, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1650.377685, 11.886859, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1541.112548, -1664.919067, 12.060526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1541.112915, -1674.903930, 12.060525, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1541.112792, -1684.885986, 12.060526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1541.072143, -1694.865966, 12.060526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 11013, "crackdrive_sfse", "ws_asphalt2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1668.738891, 11.886859, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1682.459838, 11.876855, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1678.979003, 11.876856, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1675.487060, 11.876857, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1672.005249, 11.876856, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1540.109497, -1698.717285, 11.787880, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.609863, -1698.717285, 11.787880, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.429687, -1698.717285, 11.791880, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.429687, -1652.016723, 11.791880, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1540.113769, -1652.015991, 11.801865, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.630371, -1652.015991, 11.801865, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1583.490600, -1637.842285, 15.056876, 0.000000, 90.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.771118, -1675.533691, 11.800865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1542.184448, -1703.643920, 12.070526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1545.734252, -1696.985961, 10.950639, 0.000000, 90.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 17562, "coast_apts", "Concrete_rough_256", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1583.490600, -1638.332763, 15.056876, 0.000000, 90.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1545.734252, -1687.376342, 10.950639, 0.000000, 90.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 17562, "coast_apts", "Concrete_rough_256", 0x00000000);
	pevori2 = CreateDynamicObject(19940, 1583.490600, -1638.102294, 14.836872, 0.000000, 0.000022, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10429, "hashblock1_sfs", "Bow_Concrete_drip", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1545.734252, -1679.875732, 10.950639, 0.000000, 90.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 17562, "coast_apts", "Concrete_rough_256", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1545.734252, -1670.265380, 10.950639, 0.000000, 90.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 17562, "coast_apts", "Concrete_rough_256", 0x00000000);
	pevori2 = CreateDynamicObject(19538, 1550.227905, -1699.697875, 10.828618, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19327, 1570.019653, -1637.144775, 15.368526, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.623657, -1651.375732, 11.771864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1539.710205, -1674.723754, 12.070525, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19447, 1577.413085, -1637.796142, 15.182809, 180.000000, 180.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1544.184692, -1693.653076, 12.070526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1544.184692, -1683.653808, 12.070526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1544.184692, -1673.653442, 12.067524, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1539.710205, -1676.474365, 12.073525, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1679.044677, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19447, 1577.413085, -1637.796142, 11.722810, 180.000000, 180.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10041, "archybuild10", "rooftop_gz3", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.953002, -1669.312133, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1679.045898, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19327, 1572.349731, -1637.144775, 15.368526, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19327, 1571.390869, -1637.134765, 15.798533, 0.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterialText(pevori2, 0, "{FFFFFF} -1 0 1 2 3 4 5 6", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	pevori2 = CreateDynamicObject(19435, 1536.447509, -1672.146484, 11.787878, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1681.835571, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.459716, -1669.313598, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1684.625610, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1687.415649, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1690.185791, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1692.985839, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.460815, -1695.776123, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1538.293457, -1672.146484, 11.783880, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.459716, -1666.443481, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.459716, -1663.593139, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.459716, -1660.733276, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.459716, -1657.883056, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.459716, -1655.032592, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1681.834960, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.953002, -1666.440917, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.953002, -1663.590942, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.953002, -1660.731201, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.953002, -1657.880371, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.953002, -1655.029663, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1684.625000, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1687.415283, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1690.185180, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1692.985351, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.951904, -1695.775634, 11.770516, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1653.831176, 11.797864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1655.980224, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1677.886474, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1669.943603, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1666.443359, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1662.943115, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1659.461669, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1673.423706, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1681.379394, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1684.850219, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1688.350219, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1691.833129, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1695.324951, 11.796865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1541.770141, -1696.896240, 11.797864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1544.181884, -1663.654418, 12.072525, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1544.181884, -1653.664550, 12.072525, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1539.667846, -1649.583251, 12.072524, 270.000000, 180.000000, 540.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1697.459838, 11.886859, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.661254, -1700.961425, 11.886859, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.191650, -1710.825683, 12.074524, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1701.699462, 11.765865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1705.190429, 11.765865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1708.680908, 11.766864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1712.172485, 11.766864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.617797, -1714.058715, 11.769865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.271728, -1715.752319, 11.786866, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.763183, -1715.752319, 11.786866, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19538, 1518.267333, -1663.846191, 10.836617, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1553.026489, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1546.246337, -1655.016601, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1546.246337, -1672.009155, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1546.246337, -1681.989868, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1551.237915, -1700.673217, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1551.237915, -1690.691528, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1551.237915, -1680.696044, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1551.237915, -1667.344360, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1551.237915, -1657.352905, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1551.237915, -1647.352050, 12.170528, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1642.315551, 11.766864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1638.822631, 11.766864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.206665, -1637.863037, 12.056526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1635.330444, 11.766864, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1634.619750, 11.770865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.279907, -1632.938598, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.771240, -1632.938598, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.273559, -1632.938598, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1542.200317, -1637.863037, 12.056526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.760375, -1622.819335, 11.772865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1543.252319, -1622.819335, 11.772865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1617.610717, 11.770865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1614.130859, 11.770865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1610.640380, 11.770865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1607.160156, 11.770865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1534.620727, -1604.041137, 11.774865, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1536.330566, -1602.380004, 11.770865, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1539.810180, -1602.380004, 11.770865, 90.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.206665, -1607.892578, 12.056526, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1537.206665, -1607.442138, 12.060524, 90.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1544.706909, -1620.354125, 12.056526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1577.817138, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1579.648193, -1621.159179, 11.772865, 90.000000, 0.000000, 359.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1554.816040, -1617.625610, 11.770865, 90.000000, 0.399998, 269.616027, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1579.650146, -1619.258300, 11.776865, 90.000000, 0.000000, 359.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1574.316284, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1570.824829, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1567.324340, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1563.832397, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1560.340942, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1556.860107, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1553.369140, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1549.878173, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1546.387084, -1622.819335, 11.770865, 90.000000, 0.000000, 269.996002, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1558.296630, -1617.625000, 11.770865, 90.000000, 0.399998, 269.616027, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1561.776733, -1617.620483, 11.762866, 90.000000, 0.399998, 269.666076, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1565.276611, -1617.616577, 11.762866, 90.000000, 0.399998, 269.666076, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1568.766601, -1617.612670, 11.762866, 90.000000, 0.399998, 269.666076, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1551.345825, -1617.626220, 11.770865, 90.000000, 0.399998, 269.616027, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1572.256469, -1617.608764, 11.762866, 90.000000, 0.399998, 269.666076, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1575.736328, -1617.604736, 11.762866, 90.000000, 0.399998, 269.666076, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(19435, 1577.997314, -1617.603149, 11.766864, 90.000000, 0.399998, 269.666076, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 16398, "desn2_peckers", "vgs_shopwall02_128", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1554.685791, -1620.123901, 12.060524, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1554.685791, -1620.354125, 12.056526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1564.666992, -1620.354125, 12.056526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1574.649291, -1620.354125, 12.056526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1574.649291, -1620.143920, 12.061526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1564.649414, -1620.143920, 12.061526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(18766, 1554.456298, -1620.143920, 12.063526, 90.000000, 0.000000, 180.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "sf_pave2", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1553.027587, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1550.165771, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1547.285644, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1544.424682, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1541.553955, -1605.954589, 10.634795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1541.552734, -1615.952758, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1541.553955, -1614.185180, 10.636795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1544.425048, -1614.185180, 10.636795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1547.286132, -1615.943115, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1573.027221, -1615.931884, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1547.286132, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1550.166503, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1553.028442, -1615.951782, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1558.750610, -1615.942382, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1555.879638, -1615.973632, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1561.601562, -1615.942138, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1564.463256, -1615.952148, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1550.167236, -1616.152587, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1567.305175, -1615.941772, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1570.166015, -1615.932495, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1575.888916, -1615.951782, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1578.740722, -1615.919921, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1555.886962, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1558.746948, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1561.607299, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1564.457275, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1567.307617, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1570.157958, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1573.028198, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1575.888183, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19353, 1578.738037, -1614.182739, 10.632795, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	//drzwi obok /wjedz
	
	pevori2 =	CreateDynamicObject(1491, 1582.60486, -1638.01831, 14.83310,   0.00000, 0.00000, 0.00000, 0, 0);
	pevori2 =	CreateDynamicObject(1491, 1582.60486, -1638.01831, 12.35310,   0.00000, 0.00000, 0.00000, 0, 0);
	pevori2 = CreateDynamicObject(1569, 1582.61621, -1638.09863, 12.38380,   0.00000, 0.00000, 0.00000, 2, 0);
	pevori2 = CreateDynamicObject(1499, 1582.61621, -1638.09863, 12.38380,   0.00000, 0.00000, 0.00000, 0, 0);

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pevori2 = CreateDynamicObject(1231, 1546.666748, -1620.392456, 15.162810, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1367, 1543.713256, -1618.315795, 13.104551, 0.000000, 0.000000, -1.200006, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1231, 1578.912353, -1620.462402, 15.160466, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(18755, 1571.367553, -1639.159912, 14.483876, 0.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1570.173828, -1620.818725, 12.922812, 0.000007, 0.000000, 89.400032, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1574.844360, -1619.929809, 12.922812, 0.000000, 0.000000, -90.299942, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1570.164184, -1619.929809, 12.922812, -0.000007, 0.000000, -90.299919, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1574.854003, -1620.818725, 12.922812, 0.000000, 0.000000, 89.400054, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1232, 1565.826904, -1620.500244, 15.136874, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1561.293334, -1620.818725, 12.922812, 0.000029, 0.000000, 89.399963, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1561.283691, -1619.929809, 12.922812, -0.000029, 0.000000, -90.299850, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1556.653564, -1620.818725, 12.922812, 0.000037, 0.000000, 89.399940, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1556.643920, -1619.929809, 12.922812, -0.000037, 0.000000, -90.299827, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1291, 1542.752075, -1618.315551, 12.986877, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19976, 1539.640502, -1622.822998, 12.012806, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1256, 1538.995849, -1616.254150, 13.166876, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(638, 1538.953125, -1613.328002, 13.226875, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1256, 1538.995849, -1610.293823, 13.166876, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(638, 1538.953125, -1607.297607, 13.226875, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1256, 1538.995849, -1604.273193, 13.166876, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2860, 1538.740356, -1609.737304, 12.556876, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19810, 1544.561889, -1634.472290, 15.106521, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19967, 1542.721313, -1631.015014, 12.182806, -0.000014, 0.000000, -89.999954, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1366, 1538.832397, -1636.248168, 12.912810, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1223, 1539.176513, -1621.559082, 12.502809, 0.000000, 0.000000, -89.699981, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1223, 1539.240966, -1633.869628, 12.502809, 0.000000, 0.000000, 91.899971, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(18757, 1568.544067, -1687.228759, 7.060625, 0.000000, 0.000000, 91.200004, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(18757, 1568.618774, -1691.032104, 7.060625, 0.000000, 0.000000, -90.500076, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19325, 1572.240600, -1632.804687, 13.178524, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(11729, 1576.797607, -1633.200439, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(11730, 1576.127563, -1633.205566, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(11730, 1575.456909, -1633.205566, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(11729, 1574.788085, -1633.200439, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(11729, 1574.117431, -1633.200439, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2819, 1577.196899, -1634.463134, 12.558525, 0.000000, 0.000000, 104.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(349, 1577.076049, -1633.871826, 14.005789, 546.000000, 460.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(349, 1577.057617, -1634.157714, 14.018286, 546.000000, 460.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(349, 1577.058349, -1634.473022, 14.023512, 546.000000, 460.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(349, 1577.057739, -1634.816284, 14.013763, 546.000000, 460.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(349, 1577.058715, -1635.171752, 14.012080, 546.000000, 460.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(18637, 1577.057250, -1634.821166, 13.084222, 70.000000, 0.000000, 270.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2167, 1568.250732, -1632.938842, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2161, 1569.135131, -1632.932006, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1551.803833, -1620.767822, 12.922813, 0.000037, 0.000000, 89.399940, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1280, 1551.782714, -1619.904296, 12.922812, -0.000037, 0.000000, -90.299827, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2162, 1570.446655, -1632.917480, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2163, 1572.198974, -1632.934570, 12.568525, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(11745, 1567.984375, -1634.056274, 12.688528, 0.000000, 0.000000, 14.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19942, 1573.331420, -1633.162109, 13.588525, 0.000000, 0.000000, 4.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19942, 1573.042236, -1633.182250, 13.588525, 0.000000, 0.000000, -10.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19942, 1572.756713, -1633.208374, 13.588525, 0.000000, 0.000000, -24.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(19942, 1572.407714, -1633.206298, 13.588525, 0.000000, 0.000000, 80.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1738, 1574.592041, -1637.069213, 13.178529, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1738, 1577.731811, -1635.109130, 13.148530, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1671, 1580.036499, -1634.235229, 13.014524, 0.000000, 0.000000, 190.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1671, 1580.736450, -1635.471191, 13.014524, 0.000000, 0.000000, 435.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(18756, 1571.292724, -1635.336425, 14.488751, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(18757, 1571.307983, -1635.355957, 14.488747, 0.000000, 0.000000, 90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(2259, 1581.419555, -1633.699829, 14.234523, 0.000000, 0.000000, -90.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1260, 1538.289672, -1609.307373, 20.462797, 0.000000, 0.000000, -0.200019, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1260, 1516.568847, -1583.799926, 33.402774, 0.000007, 0.000000, 89.799957, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(1232, 1546.471069, -1636.730834, 15.124360, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(4090, 1602.910034, -1608.160034, 19.054700, 0.000000, 0.000000, 0.000000, 0, 0, -1, 150.00, 150.00);
	pevori2 = CreateDynamicObject(3037, 1589.59570, -1637.99036, 14.47502,   0.00000, 0.00000, 90.00000, -1, 0, -1, 150.00, 150.00); //Statyczna brama 
	
	

	//nowy 
	tmpobjid = CreateDynamicObject(16564, 1995.526611, -2136.571044, 12.516906, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 13059, "ce_fact03", "sw_garwind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 8, 3820, "boxhses_sfsx", "ws_green_wall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2041.024780, -2129.344238, 17.175668, 0.000000, 0.000000, 1261.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "weewall256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 15, 19076, "xmastree1", "goldplate", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2028.087524, -2156.510009, 14.255674, 0.000000, 360.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2018.456298, -2156.510009, 14.255674, 0.000000, 360.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2037.727661, -2156.510009, 14.255674, 0.000000, 360.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2008.816772, -2156.510009, 14.255674, 0.000000, 360.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2037.784912, -2129.664550, 14.255674, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2041.014404, -2139.990478, 14.255674, 0.000000, 0.000000, 1261.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2040.916748, -2134.486328, 14.255674, 0.000000, 0.000000, 1261.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2016.644531, -2129.664550, 14.255674, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2041.192016, -2138.972900, 17.175668, 0.000000, 0.000000, 1261.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "weewall256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 15, 19076, "xmastree1", "goldplate", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2056.999023, -2156.510009, 14.255674, 0.000000, 360.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2047.357543, -2156.510009, 14.255674, 0.000000, 360.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2041.190429, -2140.013183, 17.175668, 0.000000, 0.000000, 1261.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "weewall256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 15, 19076, "xmastree1", "goldplate", 0x00000000);
	tmpobjid = CreateDynamicObject(3976, 1571.587158, -1675.766479, 35.678524, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 5, 10041, "archybuild10", "copshop5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 10041, "archybuild10", "copshop5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 12, 10041, "archybuild10", "copshop2", 0x00000000);
	tmpobjid = CreateDynamicObject(19862, 2010.482910, -2126.488769, 12.565654, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 2001.656738, -2131.562255, 16.635692, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Los", 20, "Ariel", 15, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19482, 1998.876831, -2131.562255, 16.635692, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Santos", 20, "Ariel", 15, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19482, 1995.186279, -2131.562255, 16.635692, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "County", 20, "Ariel", 15, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(19482, 1991.006347, -2131.562255, 16.635692, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Sheriff's", 20, "Ariel", 15, 1, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(970, 1992.723754, -2127.265380, 12.025650, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19862, 2014.964721, -2126.488769, 12.565654, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19862, 2019.475952, -2126.488769, 12.565654, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(5135, 2109.530029, -2163.909912, 16.789100, 0.000000, 0.000000, -0.000009, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 8, 16322, "a51_stores", "steel64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 9, 10143, "calfed_sfe", "calfederal3", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 10143, "calfed_sfe", "calfederal3", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 2041.024780, -2129.344238, 13.675665, 0.000000, 0.000000, 1261.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "weewall256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 15, 19076, "xmastree1", "goldplate", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19452, 2008.836791, -2146.361083, 12.455657, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(6959, 1992.280395, -2139.901611, 12.566906, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(6959, 2033.599121, -2139.901611, 12.566906, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(5314, 2085.179931, -2132.699951, 12.414093, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2015.601318, -2129.713867, 13.425667, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2005.617431, -2141.492431, 14.275666, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3928, 2047.067138, -2140.279052, 18.947757, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3928, 2047.067138, -2129.590820, 18.947757, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3928, 2059.576416, -2129.590820, 18.947757, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3928, 2059.576416, -2140.205078, 18.947757, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2018.845214, -2129.713867, 13.425667, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2035.617187, -2129.713867, 13.425667, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2039.186645, -2129.713867, 13.425667, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9093, 2040.968261, -2140.936767, 14.225678, 0.000000, 0.000000, 1.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9093, 2040.838378, -2133.426757, 14.225678, 0.000000, 0.000000, 1.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2008.827880, -2141.492431, 14.275666, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2010.508056, -2143.154052, 14.285667, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2059.981689, -2156.387695, 13.815670, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2054.889648, -2156.387695, 13.815670, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2049.526611, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2044.316894, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2039.115600, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2033.905517, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2028.685058, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2023.464965, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2018.255004, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2013.034790, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2007.824584, -2156.557861, 13.585662, 0.000000, 0.000003, -179.999984, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19868, 2002.370727, -2156.185791, 13.585662, 0.000000, 0.000000, 172.299789, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19413, 2010.506835, -2146.367187, 14.285659, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19413, 2010.506835, -2149.576904, 14.285659, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2003.927612, -2143.154052, 14.275666, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2003.927612, -2146.364257, 14.275666, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2003.927612, -2149.574951, 14.275666, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2008.817871, -2151.102294, 14.285666, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19395, 2005.619628, -2151.102783, 14.285661, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19367, 2008.827880, -2145.383300, 14.275666, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19395, 2005.619628, -2145.381347, 14.275665, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2308, 2009.973632, -2149.535156, 12.535656, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1663, 2008.951904, -2149.482421, 12.955661, 0.000000, 0.000000, 50.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19893, 2010.000000, -2150.072998, 13.325665, 0.000000, 0.000000, 250.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 2007.479858, -2150.976562, 14.575655, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2867, 2009.095336, -2146.796630, 13.265657, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11706, 2008.012573, -2150.627197, 12.485655, 0.000000, 0.000000, 220.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 2010.079833, -2144.921142, 12.485655, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 2010.079833, -2144.240478, 12.485655, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11730, 2010.080200, -2143.556884, 12.485655, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19997, 2009.647094, -2142.279296, 12.535656, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19996, 2008.714843, -2141.989501, 12.535656, 0.000000, 0.000000, 50.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19893, 2009.375976, -2142.246337, 13.365666, 0.000000, 0.000000, -107.299987, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 2010.383422, -2142.457275, 14.275661, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19420, 2010.273681, -2144.289062, 14.555663, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2608, 2004.239501, -2142.589355, 13.125658, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2161, 2004.032104, -2144.403564, 12.515660, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2856, 2010.031127, -2141.935791, 13.355663, 0.000000, 0.000000, -12.999999, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11749, 2009.280639, -2142.583251, 13.385663, 0.000000, 0.000000, 18.299999, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1432, 2009.051879, -2146.812500, 12.645663, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11711, 2005.631591, -2151.029052, 15.265666, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1492, 2004.836303, -2145.342041, 12.515660, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1569, 2003.961303, -2149.491943, 12.535656, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1569, 2003.961303, -2146.491943, 12.535656, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19273, 2006.688964, -2151.120849, 14.215662, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(955, 2007.108276, -2145.856933, 12.945654, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19466, 2010.499877, -2149.377929, 14.325660, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19466, 2010.499877, -2146.527832, 14.325660, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19459, 2008.840942, -2146.357666, 15.955661, 0.000000, 90.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19459, 2005.350341, -2146.357666, 15.955661, 0.000000, 90.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1280, 2009.071166, -2151.577392, 12.925664, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9697, 2067.150634, -2152.780761, 12.535656, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1597, 2005.107299, -2124.680419, 14.985664, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1364, 2003.649169, -2122.444580, 13.225663, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1364, 2003.649169, -2126.864501, 13.225663, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3578, 2041.017944, -2149.998291, 11.855648, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3574, 2101.800048, -2162.560058, 15.070300, 0.000000, 0.000000, -0.000017, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19452, 2005.334960, -2146.361083, 12.455657, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3578, 2041.017944, -2151.369628, 11.855648, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3578, 2041.017944, -2139.718505, 11.855648, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3578, 2041.017944, -2129.432373, 11.855648, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3578, 2041.017944, -2125.111083, 11.855648, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2020.624023, -2128.604248, 13.105669, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2032.208740, -2155.497314, 15.345651, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2034.085937, -2128.604248, 13.105669, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2041.009643, -2155.497314, 15.345651, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2014.796142, -2155.497314, 15.345651, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2023.437377, -2155.497314, 15.345651, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2040.556640, -2137.207031, 13.095645, 0.000000, 0.000000, 360.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1223, 2003.697631, -2153.496093, 11.965662, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2013.367919, -2141.028076, 13.275652, 0.000000, 0.000000, 540.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1297, 2013.367919, -2130.107177, 13.275652, 0.000000, 0.000000, 540.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2064.456054, -2144.674072, 18.835666, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2041.073974, -2124.644775, 18.835666, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2041.384277, -2144.674072, 18.835666, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2041.073974, -2124.644775, 18.835666, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19124, 2064.584716, -2124.644775, 18.835666, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 

	//global object by nie spadały
	CreateObject(19593, 1994.130004, -2149.541259, -43.097431, 0.000000, 0.000000, 0.000000, 300.00); 
	

	return 1;
}

static StworzBramy()//1589.59570, -1637.99036, 14.47502 - to usuniete
{
	gateob = CreateDynamicObject(1500, 1544.75879, -1635.26477, 12.38701,   0.00000, 0.00000, 90.00000, 0, 0);
	DodajBrame(gateob, 1544.75879, -1635.26477, 12.38701,   0.00000, 0.00000, 90.00000, 1544.75879, -1635.26477, 12.38701,  0.00000, 0.00000, 0.00000, 5, 3, BRAMA_UPR_TYPE_FRACTION, 1); //drzwi obok bramy wjazdowej lspd
	gateob = CreateDynamicObject(1500, 1567.69812, -1636.65393, 12.34700,   0.00000, 0.00000, 90.00000, 0, 0);
	DodajBrame(gateob,1567.69812, -1636.65393, 12.34700,   0.00000, 0.00000, 90.00000, 1567.69812, -1636.65393, 12.34700,   0.00000, 0.00000, 0.00000, 5, 5, BRAMA_UPR_TYPE_FRACTION, 1); //drzwi do szatni
	gateob = CreateDynamicObject(969, 1544.77563, -1629.54626, 12.53196,   0.00000, 0.00000, 90.00000, 0, 0);
	DodajBrame(gateob, 1544.77563, -1629.54626, 12.53196,   0.00000, 0.00000, 90.00000, 1544.77563, -1624.1959, 12.53196,   0.00000, 0.00000, 90.00000, 5, 8, BRAMA_UPR_TYPE_FRACTION, 1);//Brama wjazdowa do LSPD
	return 1;
}

static UsunObiekty(playerid)
{

	
	RemoveBuildingForPlayer(playerid, 1260, 1538.520, -1609.800, 19.843, 0.250);
	RemoveBuildingForPlayer(playerid, 1266, 1538.520, -1609.800, 19.843, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.829, -1647.640, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.829, -1668.079, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1229, 1524.219, -1673.709, 14.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.829, -1688.089, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1508.449, -1668.739, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1541.449, -1642.030, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1547.569, -1661.030, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1547.569, -1689.979, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1541.449, -1709.640, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 646, 1545.520, -1678.839, 14.000, 0.250);
	RemoveBuildingForPlayer(playerid, 646, 1545.560, -1672.219, 14.000, 0.250);
	RemoveBuildingForPlayer(playerid, 1260, 1538.520, -1609.800, 19.843, 0.250);
	RemoveBuildingForPlayer(playerid, 1266, 1538.520, -1609.800, 19.843, 0.250);
	RemoveBuildingForPlayer(playerid, 4090, 1602.910, -1608.160, 19.054, 0.250);
	RemoveBuildingForPlayer(playerid, 4096, 1602.910, -1608.160, 19.054, 0.250);
	

	//nowy
	RemoveBuildingForPlayer(playerid, 5137, 2005.250, -2137.458, 16.513, 0.250);
	RemoveBuildingForPlayer(playerid, 5195, 2005.250, -2137.458, 16.513, 0.250);
	RemoveBuildingForPlayer(playerid, 1418, 2333.840, 106.953, 26.242, 0.250);
	RemoveBuildingForPlayer(playerid, 3574, 1992.300, -2146.406, 15.069, 0.250);
	RemoveBuildingForPlayer(playerid, 5314, 2085.177, -2132.697, 12.413, 0.250);
	RemoveBuildingForPlayer(playerid, 5315, 2085.177, -2132.697, 12.413, 0.250);
	RemoveBuildingForPlayer(playerid, 694, 2549.840, 259.125, 46.187, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 1365.400, 255.054, 18.631, 0.250);
	RemoveBuildingForPlayer(playerid, 1418, 2333.840, 106.953, 26.242, 0.250);
	RemoveBuildingForPlayer(playerid, 5135, 2109.530, -2163.906, 16.788, 0.250);
	RemoveBuildingForPlayer(playerid, 5196, 2109.530, -2163.906, 16.788, 0.250);
	RemoveBuildingForPlayer(playerid, 3574, 2101.800, -2162.560, 15.069, 0.250);
	
	return 1;
}
