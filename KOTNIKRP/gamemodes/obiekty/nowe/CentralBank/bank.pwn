//bank.pwn
//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: bank.pwn ]------------------------------------------//
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
//BY- Simeone, Deduir, Faraon
//DAĆ MOŻLIWOŚĆ WPŁAT I WYPŁAT NA CAŁY INTERIOR 110!!!!!!!!!!!!!!!!!!
//-----------------<[ G3ówne funkcje: ]>-------------------
bank_Init()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	new simeonel;
	simeonel = CreateDynamicObject(19379, 1780.293701, -1776.685058, 149.180252, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1771.938964, 149.726242, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.967041, -1781.878784, 149.726242, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1774.930664, 151.296188, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1766.948730, 149.726242, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1778.891113, 151.296188, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1780.293701, -1787.186035, 149.180252, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1789.922851, -1776.685058, 149.180252, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.976562, -1774.929077, 149.726242, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1780.293701, -1766.191284, 149.180252, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.965942, -1774.930664, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1789.922851, -1787.186035, 149.180252, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1789.922851, -1766.181274, 149.180252, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.965942, -1778.891113, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1781.878784, 149.726242, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1785.846313, -1774.930664, 151.296188, 0.000000, 0.000029, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.976562, -1778.889038, 149.726242, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19327, 1789.624755, -1771.434326, 152.026107, 0.000000, 0.000000, 360.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{33CC00}Czynna", 100, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19453, 1786.250732, -1784.180175, 151.706268, 0.000000, 0.000007, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1786.878540, 149.726242, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1785.590576, -1784.180175, 151.706268, 0.000000, 0.000007, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19327, 1791.627197, -1781.256958, 152.576049, 0.000000, 0.000000, 540.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Toalety", 100, "Ariel", 50, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(18762, 1781.955932, -1771.959960, 149.766296, 0.000000, 90.000022, 270.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1785.440429, -1784.180175, 148.446228, 0.000000, 0.000007, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18773, "tunnelsections", "stonewall4", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1785.846313, -1778.891113, 151.296188, 0.000000, 0.000029, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.965942, -1788.871826, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19361, 1794.780395, -1781.376220, 151.706268, -0.000007, -0.000045, -90.000282, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1791.152221, -1776.685058, 149.870254, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.965942, -1784.872192, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1786.250732, -1769.740478, 151.706268, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.965942, -1768.971923, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1785.590576, -1769.740478, 151.706268, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1785.440429, -1769.740478, 148.446228, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18773, "tunnelsections", "stonewall4", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.976562, -1764.948852, 149.726242, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1780.293701, -1766.191284, 153.160095, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1791.152221, -1766.184692, 149.870254, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1780.293701, -1776.695434, 153.160095, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1791.152221, -1787.183715, 149.870254, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1780.293701, -1787.198486, 153.160095, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.965942, -1764.942504, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.955932, -1771.959960, 149.766296, 0.000000, 90.000022, 270.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1791.170898, -1785.790283, 151.706268, 0.000000, 0.000007, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.994262, -1764.942504, 151.296188, 0.000000, 0.000022, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1791.130859, -1767.548217, 151.706268, 0.000000, 0.000007, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1786.681030, -1764.959594, 151.706268, 0.000007, 0.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1787.001831, -1764.859863, 154.456146, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19426, 1783.096801, -1777.229003, 149.196166, 0.000000, 90.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFF00}$", 30, "Ariel", 40, 1, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(18762, 1781.968017, -1771.958374, 153.296218, 0.000000, 90.000000, 450.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.984863, -1788.871826, 149.766204, 0.000000, 90.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1796.041503, -1770.407104, 151.706268, 0.000000, -0.000045, 179.999679, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1796.041503, -1783.586425, 151.706268, 0.000000, -0.000045, 179.999679, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1771.938964, 153.296218, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1785.440429, -1765.140380, 148.446228, 0.000007, 0.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18773, "tunnelsections", "stonewall4", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.986083, -1766.958740, 153.296218, 0.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19426, 1782.245971, -1778.360229, 149.196166, 0.000000, 90.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Biura\n----->", 100, "Ariel", 25, 1, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(19379, 1789.913085, -1766.191284, 153.160095, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1789.913085, -1776.695434, 153.160095, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1789.913085, -1787.198486, 153.160095, 0.000007, 90.000000, 89.999977, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19426, 1782.245971, -1775.519531, 149.196166, 0.000000, 90.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Poczekalnia\n<-----", 100, "Ariel", 25, 1, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(18762, 1778.984863, -1788.871826, 150.766159, 0.000000, 90.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1786.276000, -1788.886718, 151.706268, -0.000052, 0.000007, -89.999877, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1786.276000, -1788.736572, 148.446228, -0.000052, 0.000007, -89.999877, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18773, "tunnelsections", "stonewall4", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.996582, -1776.878784, 153.306198, 0.000000, 90.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(2187, 1787.045532, -1783.225585, 149.936187, 0.000014, 0.000000, 89.999954, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.997192, -1774.899169, 153.296218, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1781.967285, -1781.889282, 153.296218, 0.000000, 90.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.976562, -1764.948852, 150.716232, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(2187, 1787.045532, -1781.463867, 149.936187, 0.000022, 0.000000, 89.999931, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1792.141723, -1771.588256, 149.196273, 0.000037, 0.000007, 89.999885, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1791.146606, -1771.531616, 151.296188, 0.000000, 0.000045, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1792.141723, -1771.108398, 149.196273, 0.000037, 0.000007, 89.999885, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1791.146606, -1770.531616, 151.296188, 0.000000, 0.000045, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19327, 1784.543212, -1765.079101, 151.836120, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{0000FF}Projektanci", 100, "Ariel", 30, 1, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(18762, 1786.835815, -1771.531616, 151.296188, 0.000000, 0.000037, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1786.835815, -1770.531616, 151.296188, 0.000000, 0.000037, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19328, 1783.997436, -1765.073608, 151.976150, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{000000}>Luis Cotta<\n>David Riddle<\n>Reginald Sorrentino<", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(18762, 1795.457397, -1771.531616, 151.296188, 0.000000, 0.000052, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1795.457397, -1770.531616, 151.296188, 0.000000, 0.000052, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19327, 1784.583251, -1765.079101, 150.976150, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{0000FF}Inwestorzy", 100, "Ariel", 30, 1, 0x00000000, 0x00000000, 0);
	simeonel = CreateDynamicObject(19327, 1783.982788, -1765.079101, 151.256118, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{000000}>Hektor Rubio<\n>John Mrucznik<\n>James Duble<", 100, "Ariel", 15, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19328, 1783.974365, -1765.052001, 151.876159, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "None", 10, "Ariel", 20, 0, 0x00000000, 0xFFFFFFFF, 0);
	simeonel = CreateDynamicObject(19379, 1799.522216, -1766.191284, 153.160095, 0.000014, 90.000000, 89.999954, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1799.522216, -1776.695434, 153.160095, 0.000014, 90.000000, 89.999954, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19379, 1799.522216, -1787.198486, 153.160095, 0.000014, 90.000000, 89.999954, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 8391, "ballys01", "greyground256128", 0x00000000);
	simeonel = CreateDynamicObject(19303, 1784.665039, -1764.177368, 152.056167, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	simeonel = CreateDynamicObject(19303, 1783.304199, -1764.177368, 152.056167, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	simeonel = CreateDynamicObject(19303, 1783.994750, -1764.237426, 150.846206, 90.000000, 90.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.984863, -1788.871826, 151.756164, 0.000000, 90.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.984863, -1788.871826, 152.746170, 0.000000, 90.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.984375, -1788.871826, 151.296188, 0.000000, 0.000022, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.997192, -1778.910156, 153.296218, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.996582, -1781.888549, 153.306198, 0.000000, 90.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1775.996582, -1786.878540, 153.306198, 0.000000, 90.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.976562, -1764.948852, 151.716278, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(18762, 1778.976562, -1764.948852, 152.716308, 0.000000, 90.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 16639, "a51_labs", "dam_terazzo", 0x00000000);
	simeonel = CreateDynamicObject(19453, 1790.050170, -1786.106201, 151.706268, 0.000000, -0.000052, 179.999633, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19390, 1791.570556, -1781.376220, 151.706268, -0.000007, -0.000045, -90.000282, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterial(simeonel, 0, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	simeonel = CreateDynamicObject(19327, 1782.484130, -1784.845336, 151.636138, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFF00}$", 100, "Ariel", 90, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1782.484130, -1784.865356, 151.296096, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Biura", 100, "Ariel", 50, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1782.484130, -1768.964233, 151.296096, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Poczekalnia", 100, "Ariel", 21, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1782.484130, -1768.945556, 151.636138, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFF00}$", 100, "Ariel", 90, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1789.085571, -1771.434326, 152.286071, 0.000000, 0.000000, 360.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Kasa 1", 100, "Ariel", 50, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1793.377685, -1771.434326, 152.286071, 0.000000, 0.000000, 360.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}Kasa 2", 100, "Ariel", 50, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1794.075439, -1771.434326, 152.026107, 0.000000, 0.000000, 360.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FF0000}Nieczynna", 100, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1788.994750, -1771.307617, 152.656158, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFF00}$", 100, "Ariel", 90, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1793.374389, -1771.307617, 152.656158, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFF00}$", 100, "Ariel", 90, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19327, 1791.634521, -1781.277587, 152.856140, 0.000000, 0.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFF00}$", 100, "Ariel", 90, 1, 0x00000000, 0x00000000, 1);
	simeonel = CreateDynamicObject(19172, 1788.513427, -1785.926269, 151.756225, 0.000000, 0.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	SetDynamicObjectMaterialText(simeonel, 0, "{FFFFFF}KURWY JEBANE", 40, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	simeonel = CreateDynamicObject(1557, 1775.551513, -1778.401000, 149.266189, 0.000007, 0.000007, 89.999946, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1557, 1775.548583, -1775.410522, 149.266189, -0.000007, -0.000007, -89.999961, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1775.997192, -1788.354858, 152.006256, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(14394, 1785.223510, -1776.772705, 149.136184, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1787.041503, -1774.956176, 151.006164, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1775.997192, -1781.713745, 152.006256, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1704, 1779.527709, -1765.948120, 149.266189, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1781.054443, -1765.941528, 150.266220, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2239, 1777.111083, -1765.959716, 149.266189, 0.000000, 0.000000, 46.999996, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1516, 1777.144287, -1767.230834, 149.426147, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1886, 1776.926025, -1766.294189, 153.121353, 20.000000, 0.000000, 39.300003, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2165, 1778.894653, -1780.430053, 149.266189, 0.000000, 0.000000, -90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1715, 1777.447509, -1781.312744, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2310, 1780.299072, -1780.561767, 149.746261, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2310, 1780.299072, -1781.511718, 149.746261, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1787.041503, -1778.898681, 151.006164, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1781.054443, -1774.042358, 150.266220, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2309, 1781.267089, -1769.715087, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2357, 1793.307617, -1771.366333, 150.546142, 0.000000, 0.000045, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19324, 1786.693481, -1784.542114, 150.576171, 0.000014, 0.000000, 89.999954, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2309, 1781.267089, -1770.465820, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2309, 1781.267089, -1771.206542, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19324, 1786.683471, -1782.792114, 150.576171, 0.000022, 0.000000, 89.999931, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19324, 1786.683471, -1781.041870, 150.576171, 0.000022, 0.000000, 89.999931, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2309, 1781.267089, -1771.957031, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2309, 1781.267089, -1772.687744, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1703, 1777.073974, -1774.050903, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2309, 1781.267089, -1773.418457, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1704, 1778.007324, -1765.948120, 149.266189, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1703, 1777.073974, -1770.340087, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1777.184448, -1771.171875, 150.266220, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1781.054443, -1769.052246, 150.266220, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2357, 1788.997558, -1771.366333, 150.546142, 0.000000, 0.000037, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1714, 1794.057128, -1770.556152, 149.956192, 0.000000, 0.000000, -12.399994, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1714, 1788.370605, -1769.717163, 149.956192, 0.000000, 0.000000, 18.500001, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2190, 1788.927246, -1771.431762, 150.936187, 0.000000, 0.000000, -162.999984, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2202, 1795.432373, -1768.624633, 149.956192, 0.000000, 0.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2202, 1786.792358, -1768.124267, 149.956192, 0.000000, 0.000000, 360.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1788.819335, -1771.303955, 153.636199, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2002, 1786.989746, -1772.414306, 149.956192, 0.000000, 0.000000, 80.099990, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2197, 1791.207031, -1768.684082, 149.956192, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(18865, 1783.468627, -1765.303833, 150.836227, 0.000000, 0.000000, -9.799999, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2190, 1793.102050, -1771.346801, 150.936187, 0.000000, 0.000000, 128.999969, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19893, 1791.230957, -1767.968750, 151.626235, 0.000000, 0.000000, -19.999996, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19583, 1784.105590, -1765.272216, 150.866012, 0.000000, 0.000000, 108.599983, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1795.459960, -1771.303955, 153.636199, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19570, 1784.704467, -1765.195678, 150.826126, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1775.997192, -1771.203857, 152.006256, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1775.997192, -1764.563964, 152.006256, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(18755, 1798.015502, -1776.989501, 151.886199, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1776.276489, -1774.923583, 152.006256, 89.999992, 180.000000, -89.999977, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1235, 1784.998168, -1788.252197, 149.756179, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1520, 1785.099365, -1788.284179, 149.356170, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1235, 1784.992797, -1765.627197, 149.786163, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1664, 1784.941894, -1788.306762, 149.456146, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1780.396118, -1774.923583, 152.006256, 89.999992, 180.000000, -89.999977, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2164, 1777.916015, -1788.355468, 149.266189, 0.000000, 0.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2162, 1780.215087, -1788.352783, 149.266189, 0.000000, 0.000000, 180.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1776.256469, -1778.893310, 152.006256, 89.999992, 180.000015, -89.999969, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1780.376098, -1778.893310, 152.006256, 89.999992, 180.000015, -89.999969, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2167, 1781.435913, -1784.890014, 149.256195, 0.000000, 0.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1781.977294, -1781.713745, 152.006256, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2167, 1781.435913, -1784.890014, 150.736206, 0.000000, 0.000000, 270.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1781.977294, -1772.052734, 152.006256, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2165, 1776.945068, -1786.024291, 149.266189, 0.000000, 0.000000, 90.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(19325, 1775.615844, -1776.954223, 152.006256, 89.999992, 180.000000, 0.000022, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1522, 1790.823120, -1781.524536, 149.956192, 0.000000, 0.000007, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2773, 1788.602539, -1773.345458, 150.476119, 0.000000, 0.000000, -0.900000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2239, 1789.622070, -1785.390869, 149.956192, 0.000000, 0.000000, -140.800018, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1795.471557, -1772.646118, 151.006164, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2773, 1793.250732, -1772.227905, 150.476119, 0.000000, 0.000000, 83.500000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2773, 1789.784667, -1773.884033, 150.476119, 0.000000, 0.000000, -0.900000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(630, 1795.642822, -1780.739990, 151.006164, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1893, 1783.398315, -1776.940917, 153.022125, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(2670, 1798.131835, -1777.041992, 150.086181, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1893, 1779.048339, -1776.940917, 153.022125, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1893, 1788.298461, -1776.940917, 153.022125, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);
	simeonel = CreateDynamicObject(1893, 1792.008544, -1776.940917, 153.022125, 0.000000, 0.000000, 0.000000, 0, 110, -1, 350.00, 350.00);




	return 1;
}

