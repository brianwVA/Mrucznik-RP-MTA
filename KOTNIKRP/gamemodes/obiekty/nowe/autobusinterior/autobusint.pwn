//sanVanInterior.pwn
//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Modu3: sanVanInterior.pwn ]--------------------------------------------//
//Autor: Deduir, Santiago
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

//-----------------<[ G3ówne funkcje: ]>-------------------
autobusint_Init() //t1 metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{


//1451.1464,-1779.5596,3.6388 - kordy po /wejdzw
	pevori2 = CreateDynamicObject(19376, 1447.785522, -1785.374145, 2.552813, -0.000007, 270.000000, -89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1448.831054, -1785.106689, 1.082839, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.661132, -1785.106689, 1.592813, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.702758, -1785.106689, 1.592813, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1445.755249, -1785.114990, 2.718751, 0.000000, 90.000015, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.482788, -1785.106689, 1.080804, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.880859, -1785.106689, 1.072803, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.561523, -1785.106689, 1.062805, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1780.216186, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.989501, -1780.216186, 4.318759, 0.000022, 0.000000, 89.999931, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1447.785522, -1774.881347, 2.552813, -0.000007, 270.000000, -89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1442.829956, -1780.224731, 1.075804, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1450.515380, -1785.114990, 2.718751, 0.000000, 90.000015, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1442.829956, -1778.913452, 1.075804, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.989501, -1778.914916, 4.318759, 0.000022, 0.000000, 89.999931, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1448.245361, -1791.683105, 2.718751, 0.000014, 90.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1453.600463, -1778.913452, 1.075804, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1448.245361, -1792.103515, 2.888753, 0.000014, 90.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1778.914916, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1453.560668, -1780.224731, 1.075804, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1782.397705, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1451.652832, -1789.968627, 5.204690, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1784.558227, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1451.652832, -1783.467773, 5.204690, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1447.785522, -1785.374145, 6.132816, -0.000007, 270.000000, -89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1447.785522, -1774.881347, 6.132826, -0.000007, 270.000000, -89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(2372, 1450.772949, -1780.022460, 2.476871, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1717, "cj_tv", "CJ_STEEL", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.209838, -1783.644897, 3.338752, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.209838, -1785.606079, 3.338752, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(3089, 1451.849121, -1778.841308, 3.738744, -0.000014, 0.000000, -89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 14584, "ab_abbatoir01", "cj_sheetmetal", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 14584, "ab_abbatoir01", "cj_sheetmetal", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.209838, -1781.664306, 3.338752, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(3089, 1444.515136, -1778.841308, 3.738744, -0.000014, 0.000000, -89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 14584, "ab_abbatoir01", "cj_sheetmetal", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 2, 14584, "ab_abbatoir01", "cj_sheetmetal", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 3, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.209838, -1787.476196, 3.338752, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.661132, -1794.740966, 1.592813, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.209838, -1789.316284, 3.338752, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.704467, -1794.740966, 1.592813, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1446.776611, -1789.997924, 1.085806, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1783.644897, 3.338752, 0.000000, -0.000075, 179.999542, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1785.606079, 3.338752, 0.000000, -0.000075, 179.999542, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1781.664306, 3.338752, 0.000000, -0.000075, 179.999542, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1787.476196, 3.338752, 0.000000, -0.000075, 179.999542, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1789.316284, 3.338752, 0.000000, -0.000075, 179.999542, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2372, 1446.802490, -1780.022460, 2.476871, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1717, "cj_tv", "CJ_STEEL", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1786.719604, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1788.851318, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1791.013305, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1793.194091, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.979370, -1782.397705, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.980468, -1784.558227, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.979980, -1788.851318, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.990844, -1786.719604, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.980346, -1791.013305, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.989624, -1793.194091, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.690063, -1793.199462, 2.552834, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.690063, -1793.199462, 7.352824, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1447.785522, -1795.864257, 6.132816, -0.000007, 270.000000, -89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1448.311035, -1793.188232, 5.204690, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1446.776611, -1790.438354, 1.235808, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.880859, -1794.878417, 1.072803, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.481811, -1794.878417, 1.072803, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1444.762451, -1783.467773, 5.204690, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1444.762451, -1790.008300, 5.204690, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1441.681030, -1793.188232, 5.204690, -0.000014, 0.000000, -89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.760375, -1792.517578, 3.498754, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.875732, -1795.329467, 1.235808, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1449.130859, -1792.517578, 3.498754, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.487304, -1795.329467, 1.235808, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1447.240478, -1792.517578, 3.498754, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1445.610229, -1792.517578, 3.498754, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1448.225952, -1797.205566, -0.707193, -89.999992, -89.999992, 89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19376, 1448.146850, -1797.195556, -0.707094, -89.999992, -89.999992, 89.999984, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.880859, -1774.036499, 1.072803, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19372, 1444.694824, -1777.229003, 4.378759, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19372, 1451.684082, -1777.229003, 4.378759, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.482788, -1774.006225, 1.080804, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1442.805053, -1777.234985, 2.718751, 0.000014, 90.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1442.810913, -1775.556640, 1.073804, 0.000014, 0.000007, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.989501, -1775.564453, 4.318759, 0.000022, 0.000000, 89.999931, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.380371, -1775.564453, 4.318759, 0.000022, 0.000000, 89.999931, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.560668, -1774.036499, 1.072803, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1453.615600, -1777.245727, 2.718751, 0.000014, 90.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1777.643554, 3.338752, 0.000000, -0.000029, -0.000365, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1453.600952, -1775.556640, 1.073804, 0.000014, 0.000007, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1446.178588, -1776.823242, 3.342751, 0.000000, -0.000091, 179.999450, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2372, 1446.802490, -1778.712036, 2.476871, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1717, "cj_tv", "CJ_STEEL", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.178833, -1777.700439, 3.338752, 0.000000, -0.000022, -0.000365, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(2748, 1450.178833, -1776.880126, 3.342751, 0.000000, -0.000097, 179.999404, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 1714, "cj_office", "BLUE_FABRIC", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1448.871215, -1774.036499, 1.072803, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	pevori2 = CreateDynamicObject(2372, 1450.772949, -1778.711914, 2.476871, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1717, "cj_tv", "CJ_STEEL", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.702758, -1770.676513, 1.872812, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.660888, -1770.706542, 1.872820, 0.000000, 0.000022, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.690063, -1773.380615, 1.882823, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1452.381713, -1773.417480, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1451.661132, -1772.956787, 7.142817, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1443.980102, -1773.417480, 4.318759, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1453.615600, -1773.715576, 2.718751, 0.000014, 90.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1444.690795, -1772.956787, 7.142817, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19455, 1442.805053, -1773.734619, 2.718751, 0.000014, 90.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 8420, "carpark3_lvs", "greyground12802", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1448.210571, -1772.646728, 4.318759, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.581542, -1773.347167, 7.142817, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1448.380737, -1772.646728, 4.318759, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19434, 1448.040405, -1772.646728, 4.318759, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1451.351074, -1773.427246, 5.204690, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1444.750976, -1773.427246, 5.204690, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1451.600708, -1772.237304, 5.204690, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1444.770263, -1772.237304, 5.204690, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	pevori2 = CreateDynamicObject(19463, 1447.690063, -1793.279541, 4.042843, 0.000014, 0.000000, 89.999954, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	pevori2 = CreateDynamicObject(11687, 1446.108154, -1773.348510, 3.186533, 48.599990, 0.000011, -0.000007, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(pevori2, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1451.817871, -1776.897705, 6.964695, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19325, 1444.541625, -1776.897705, 6.764696, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	pevori2 = CreateDynamicObject(19327, 1451.811279, -1779.552368, 5.614694, 0.000000, 0.000000, 270.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterialText(pevori2, 0, "{FFFFFF}EXIT", 50, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	pevori2 = CreateDynamicObject(19327, 1444.559570, -1779.552368, 5.614694, 0.000000, 0.000000, 450.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterialText(pevori2, 0, "{FFFFFF}EXIT", 50, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	pevori2 = CreateDynamicObject(19700, 1447.126831, -1775.361816, 2.638750, 90.000000, 0.000000, 180.000000, -1, -1, -1, 325.00, 325.00);
	SetDynamicObjectMaterial(pevori2, 0, 1649, "wglass", "carshowwin2", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pevori2 = CreateDynamicObject(994, 1441.334716, -1775.547119, 2.848757, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(994, 1448.824584, -1775.547119, 2.848757, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(2163, 1449.858154, -1773.038330, 2.674685, 0.000000, 0.000014, 0.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(1562, 1446.083496, -1774.859497, 3.422811, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(1563, 1446.083007, -1775.198974, 3.934689, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(1562, 1450.194824, -1775.059692, 3.422811, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(1563, 1450.195068, -1775.399169, 3.934689, 0.000000, -0.000014, 179.999908, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(19612, 1446.490600, -1773.259521, 3.334687, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	pevori2 = CreateDynamicObject(19616, 1445.406250, -1773.282226, 2.324688, 0.000000, 0.000000, 0.000000, -1, -1, -1, 325.00, 325.00);
	
	return 1;
}
