//BazaMechanikow.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: BazaMechanikow.pwn ]--------------------------------------------//
//Autor: SzYm3k
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
BazaMechanikow_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

BazaMechanikow_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//Tutaj wstawiamy obiekty w nastepujacym formacie:
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	/*CreateDynamicObject(8843, 2830.89160, -1570.56970, 9.92210,   0.00000, 0.00000, 87.24000);
	CreateDynamicObject(8843, 2820.55347, -1587.34570, 9.93220,   0.00000, 0.00000, -117.72000);
	CreateDynamicObject(3934, 2835.06738, -1559.43726, 22.28478,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3934, 2834.75439, -1538.10461, 22.28772,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(918, 2808.85938, -1555.82715, 10.48859,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(918, 2808.84814, -1565.46863, 10.44839,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2808.90674, -1561.02063, 12.67898,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2829.12061, -1595.67236, 12.70432,   0.00000, 0.00000, -30.84000);
	CreateDynamicObject(1231, 2845.32202, -1567.29431, 12.69901,   0.00000, 0.00000, -20.04000);
	CreateDynamicObject(1229, 2842.93896, -1595.69897, 11.29498,   0.00000, 0.00000, -28.68001);
	CreateDynamicObject(955, 2827.35596, -1537.91553, 10.42441,   0.00000, 0.00000, -91.01999);
	CreateDynamicObject(19898, 2820.18848, -1570.35193, 9.92630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 2803.27222, -1583.93689, 9.93480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 2787.07983, -1615.88818, 9.92700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 2803.59595, -1560.09509, 9.92530,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11489, 2822.87891, -1577.77234, 10.08681,   0.00000, 0.00000, 70.26003);
	CreateDynamicObject(3935, 2829.97974, -1587.08154, 12.14596,   0.00000, 0.00000, -207.47998);
	CreateDynamicObject(3935, 2836.72876, -1574.93445, 12.14600,   0.00000, 0.00000, -13.98000);
	CreateDynamicObject(3935, 2833.64038, -1574.18811, 12.14600,   0.00000, 0.00000, -14.58000);
	CreateDynamicObject(3935, 2830.29346, -1574.49951, 12.14600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3935, 2827.08130, -1586.18555, 12.14600,   0.00000, 0.00000, -210.30020);
	CreateDynamicObject(3935, 2824.94922, -1584.94556, 12.14600,   0.00000, 0.00000, -211.91991);
	CreateDynamicObject(1341, 2810.15942, -1571.28271, 11.09074,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(853, 2786.20972, -1561.90930, 16.89944,   7.19998, 10.68000, 0.00000);
	CreateDynamicObject(910, 2827.03857, -1541.04736, 11.30392,   0.00000, 0.00000, -91.92000);
	CreateDynamicObject(1440, 2826.97241, -1543.29907, 10.53126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3593, 2822.35156, -1548.74829, 10.25776,   0.00000, 0.00000, -90.30004);
	CreateDynamicObject(658, 2808.89917, -1570.53381, 10.08783,   0.00000, 0.00000, -17.88000);
	CreateDynamicObject(14826, 2798.63062, -1541.33813, 10.64124,   0.00000, 0.00000, 87.83994);
	CreateDynamicObject(19899, 2791.00049, -1563.62390, 10.08684,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19900, 2791.14526, -1561.69983, 9.99005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.33521, -1551.87195, 9.91882,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19978, 2843.70752, -1596.13977, 9.79008,   0.00000, 0.00000, -42.53999);
	CreateDynamicObject(19966, 2828.02734, -1594.30115, 10.08462,   0.00000, 0.00000, -137.28008);
	CreateDynamicObject(984, 2835.12061, -1568.17090, 10.66870,   0.00000, 0.00000, 90.06000);
	CreateDynamicObject(983, 2830.27734, -1568.17725, 10.72245,   0.00000, 0.00000, 90.24010);
	CreateDynamicObject(983, 2825.62915, -1563.96021, 10.71216,   0.00000, 0.00000, -2.04001);
	CreateDynamicObject(984, 2832.36572, -1572.99036, 10.67340,   0.00000, 0.00000, 89.52000);
	CreateDynamicObject(984, 2821.45337, -1590.49902, 10.68250,   0.00000, 0.00000, -115.92003);
	CreateDynamicObject(983, 2812.81323, -1586.21704, 10.73983,   0.00000, 0.00000, 63.06001);
	CreateDynamicObject(983, 2826.73584, -1587.46814, 10.73977,   0.00000, 0.00000, 67.38000);
	CreateDynamicObject(983, 2821.91724, -1583.67517, 10.74480,   0.00000, 0.00000, 35.46000);
	CreateDynamicObject(983, 2823.43262, -1574.86499, 10.72413,   0.00000, 0.00000, -52.62000);
	CreateDynamicObject(1280, 2820.58032, -1578.80652, 10.39903,   0.00000, 0.00000, -14.64000);
	CreateDynamicObject(1280, 2826.26099, -1557.85657, 10.32536,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1280, 2837.92896, -1575.66687, 10.47152,   0.00000, 0.00000, 153.60019);
	CreateDynamicObject(1280, 2831.30298, -1587.52576, 10.42575,   0.00000, 0.00000, -205.20012);
	CreateDynamicObject(2611, 2807.53491, -1589.90247, 11.78303,   0.00000, 0.00000, -111.17998);
	CreateDynamicObject(2612, 2805.28516, -1595.53516, 11.75734,   0.00000, 0.00000, -112.20003);
	CreateDynamicObject(984, 2807.31226, -1557.92444, 10.68188,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 2807.30103, -1567.48950, 10.74093,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2810.46875, -1557.95276, 10.64267,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 2810.47827, -1567.51099, 10.66242,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(658, 2808.49585, -1552.73816, 9.89153,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2825.64526, -1531.59277, 10.70090,   0.00000, 0.00000, 93.42001);
	CreateDynamicObject(1257, 2847.27075, -1590.14014, 11.18800,   0.00000, 0.00000, -29.99999);
	CreateDynamicObject(1257, 2848.27173, -1561.01575, 11.19888,   0.00000, 0.00000, -196.92000);
	CreateDynamicObject(1229, 2850.38867, -1556.71436, 11.34331,   0.00000, 0.00000, -193.50002);
	CreateDynamicObject(19990, 2829.15991, -1645.25757, 9.90573,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19990, 2868.45508, -1396.32849, 10.02223,   0.00000, 0.00000, -185.52000);
	CreateDynamicObject(3283, 2799.86743, -1628.60474, 9.91575,   0.00000, 0.00000, -101.34003);
	CreateDynamicObject(1886, 2779.48828, -1628.22412, 14.55050,   9.90000, 0.96000, 134.64011);
	CreateDynamicObject(1260, 2788.89404, -1550.40332, 24.82355,   0.00000, 0.00000, 168.89999);
	CreateDynamicObject(4238, 2788.81836, -1550.24731, 30.51703,   0.00000, 0.00000, 109.37997);
	CreateDynamicObject(3633, 2769.35474, -1625.74072, 10.28987,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2358, 2770.79663, -1626.86829, 10.02357,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2831.00806, -1600.44714, 9.91807,   0.00000, 0.00000, -25.26001);
	CreateDynamicObject(19425, 2833.98120, -1601.84851, 9.91810,   0.00000, 0.00000, -25.26000);
	CreateDynamicObject(19425, 2836.95508, -1603.24719, 9.91820,   0.00000, 0.00000, -25.26000);
	CreateDynamicObject(19425, 2850.22412, -1564.83289, 9.91360,   0.00000, 0.00000, -25.26000);
	CreateDynamicObject(19425, 2853.21240, -1566.24561, 9.91970,   0.00000, 0.00000, -25.26000);
	CreateDynamicObject(19425, 2856.19165, -1567.64819, 9.91990,   0.00000, 0.00000, -25.26000);
	CreateDynamicObject(1490, 2766.57715, -1618.73291, 11.36600,   0.00000, 0.00000, 90.06000);
	CreateDynamicObject(1697, 2836.79639, -1547.79456, 23.56710,   0.00000, 0.00000, -87.41998);
	CreateDynamicObject(1697, 2836.27441, -1526.49780, 23.94326,   0.00000, 0.00000, -105.59998);
	CreateDynamicObject(1697, 2851.80151, -1513.03662, 31.91336,   0.00000, 0.00000, -107.22001);
	CreateDynamicObject(1694, 2843.72729, -1510.40295, 38.93607,   0.00000, 0.00000, -33.12000);
	CreateDynamicObject(1215, 2828.59058, -1586.71997, 10.50373,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2825.94702, -1585.59717, 10.53820,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2824.11572, -1583.84595, 10.63624,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2828.51294, -1574.53699, 10.58359,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2831.85620, -1574.37292, 10.57199,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2835.01172, -1574.45325, 10.53799,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2059, 2830.34741, -1580.50134, 10.10660,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2059, 2830.66284, -1575.82483, 10.10700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2684, 2833.62744, -1577.80286, 10.11240,   270.00000, 0.00000, 0.00000);
	CreateDynamicObject(1574, 2827.00049, -1539.29797, 10.08669,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2816, 2826.59741, -1584.09473, 10.08891,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2825.48706, -1534.65015, 12.68037,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2791.67017, -1599.51331, 12.68623,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2765.51709, -1611.09106, 13.74199,   90.00000, 0.00000, 91.67999);
	CreateDynamicObject(1231, 2797.46045, -1624.26477, 13.19220,   90.00000, 0.00000, -103.32001);
	CreateDynamicObject(19903, 2792.34473, -1556.07312, 10.05153,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.34888, -1560.65186, 10.07130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.35132, -1564.92456, 10.07140,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.35425, -1569.45557, 10.07060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.34204, -1573.66614, 10.07070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.31714, -1578.20227, 10.07170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.33545, -1582.47864, 10.05110,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.33838, -1587.01843, 10.09090,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2792.34302, -1591.25525, 10.09060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1348, 2808.80347, -1551.71545, 10.77068,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1348, 2791.35571, -1546.11450, 10.76654,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1348, 2791.50757, -1544.82324, 10.84648,   0.00000, 0.00000, 28.98000);
	CreateDynamicObject(18634, 2819.86670, -1549.07031, 10.60730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18865, 2819.58447, -1548.46436, 10.58934,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19527, 2775.33667, -1550.35693, 34.56356,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19627, 2819.29077, -1549.49585, 10.55970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19627, 2797.07861, -1542.10278, 9.92900,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19627, 2808.89673, -1557.00232, 11.56657,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19626, 2807.88232, -1571.51453, 10.79258,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19622, 2798.90723, -1543.48206, 9.96458,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19817, 2815.70166, -1540.46484, 9.26131,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19817, 2811.46704, -1540.46484, 9.26130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19817, 2806.92871, -1540.51563, 9.26130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19817, 2802.70508, -1540.46484, 9.26130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19899, 2796.58545, -1534.73682, 10.10710,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19899, 2820.53369, -1534.52356, 10.14250,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19899, 2790.96851, -1541.47986, 10.09810,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19917, 2794.22339, -1542.10828, 9.86239,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19917, 2826.03540, -1541.57166, 10.08745,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19921, 2820.23999, -1548.19324, 10.68450,   0.00000, 0.00000, -37.44000);
	CreateDynamicObject(11738, 2821.02295, -1534.75159, 11.45420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19815, 2815.03784, -1534.12219, 12.34140,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19815, 2806.04663, -1534.20190, 12.34144,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19900, 2799.03271, -1535.25989, 10.08819,   0.00000, 0.00000, -54.36000);
	CreateDynamicObject(939, 2768.95776, -1621.89014, 12.23919,   0.00000, 0.00000, 90.89999);
	CreateDynamicObject(1348, 2791.66309, -1547.45178, 10.76554,   0.00000, 0.00000, 28.32000);


	//obiekty cywilne przystanek BAZA MECHANIKoW (petla)
	CreateDynamicObject(1280,2821.6999512,-1578.5999756,10.5000000,0.0000000,0.0000000,344.0000000,0,0); //object(parkbench1) (1)
	CreateDynamicObject(1280,2822.1999512,-1582.4000244,10.5000000,0.0000000,0.0000000,23.9974365,0,0); //object(parkbench1) (2)
	CreateDynamicObject(1280,2824.1000977,-1575.5000000,10.5000000,0.0000000,0.0000000,303.9971924,0,0); //object(parkbench1) (3)
	CreateDynamicObject(1229,2825.1000977,-1573.0000000,11.6999998,0.0000000,0.0000000,140.0000000,0,0); //object(bussign1) (1)
	CreateDynamicObject(1229,2821.8000488,-1584.8000488,11.6999998,0.0000000,0.0000000,15.9987793,0,0); //object(bussign1) (2)
	CreateDynamicObject(2431,2820.3999023,-1579.0999756,13.3999996,346.0000000,0.0000000,71.7500000,0,0); //napis2 BM petla
	CreateDynamicObject(970,2834.5000000,-1580.3000488,10.6000004,0.0000000,0.0000000,58.0000000,0,0); //object(fencesmallb) (1)
	CreateDynamicObject(949,2822.5000000,-1576.8000488,10.6999998,0.0000000,0.0000000,0.0000000,0,0); //object(plant_pot_4) (1)
	CreateDynamicObject(949,2821.3999023,-1580.5000000,10.6999998,0.0000000,0.0000000,0.0000000,0,0); //object(plant_pot_4) (2)teraz
	CreateDynamicObject(950,2826.1000977,-1585.4000244,10.5000000,0.0000000,0.0000000,333.9949951,0,0); //object(plant_pot_12) (3)
	CreateDynamicObject(970,2837.8000488,-1574.9000244,10.6000004,0.0000000,0.0000000,57.9968262,0,0); //object(fencesmallb) (2)
	CreateDynamicObject(950,2834.0000000,-1580.0000000,10.5000000,0.0000000,0.0000000,59.9873047,0,0); //object(plant_pot_12) (6)
	CreateDynamicObject(970,2834.6999512,-1573.0999756,10.6000004,0.0000000,0.0000000,359.9968262,0,0); //object(fencesmallb) (3)
	CreateDynamicObject(970,2828.5000000,-1573.0999756,10.6000004,0.0000000,0.0000000,359.9949951,0,0); //object(fencesmallb) (4)
	CreateDynamicObject(949,2838.0000000,-1573.5000000,10.6999998,0.0000000,0.0000000,0.0000000,0,0); //object(plant_pot_4) (3)
	CreateDynamicObject(950,2836.8000488,-1575.5000000,10.5000000,0.0000000,0.0000000,59.9908447,0,0); //object(plant_pot_12) (9)
	CreateDynamicObject(950,2834.8000488,-1573.6999512,10.5000000,0.0000000,0.0000000,359.9908447,0,0); //object(plant_pot_12) (10)
	CreateDynamicObject(950,2828.3999023,-1573.9000244,10.5000000,0.0000000,0.0000000,359.9908447,0,0); //object(plant_pot_12) (11)
	CreateDynamicObject(1280,2832.1999512,-1577.3000488,10.5000000,0.0000000,0.0000000,223.9971924,0,0); //object(parkbench1) (4)
	CreateDynamicObject(949,2825.8000488,-1574.3000488,10.6999998,0.0000000,0.0000000,0.0000000,0,0); //object(plant_pot_4) (4)
	CreateDynamicObject(949,2823.3000488,-1584.3000488,10.6999998,0.0000000,0.0000000,0.0000000,0,0); //object(plant_pot_4) (6)
	CreateDynamicObject(970,2825.3999023,-1586.0999756,10.6000004,0.0000000,0.0000000,331.9945068,0,0); //object(fencesmallb) (5)*/
	CreateDynamicObject(14467,2792.3999023,-1535.8000488,12.8000002,0.0000000,0.0000000,50.0000000,0,0,-1,300.00,300.00); //krol mechanikow

	//NOWA BAZA
	
	tmpobjid = CreateDynamicObject(9339, 1699.533569, -1786.464477, 13.222867, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0xFFFFFF33);
	tmpobjid = CreateDynamicObject(9339, 1699.533569, -1760.384643, 13.222867, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0xFFFFFF33);
	tmpobjid = CreateDynamicObject(967, 1737.386108, -1806.329345, 12.538806, 0.000000, 0.000000, -103.799903, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "dt_office_roof", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14786, "ab_sfgymbeams", "knot_wood128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14786, "ab_sfgymbeams", "knot_wood128", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1735.174804, -1764.938354, 11.762171, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1706.402587, -1755.392333, 11.762171, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1706.402587, -1764.985107, 11.762171, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1711.133544, -1769.719726, 11.762171, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.398925, -1764.539672, 16.982183, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.398925, -1754.070190, 16.982183, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1720.781372, -1754.070190, 16.982183, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1720.799438, -1764.539672, 16.982183, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1711.148193, -1764.539672, 16.982183, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1711.231323, -1754.070190, 16.982183, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1712.154541, -1769.719726, 11.762171, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.428955, -1756.877685, 11.762171, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1720.828857, -1756.877685, 11.762171, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1711.289428, -1756.877685, 11.762171, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.338378, -1761.719482, 11.981515, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19397, 1724.341796, -1768.063476, 14.237662, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.338378, -1761.719482, 16.901563, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.338378, -1764.840087, 16.901563, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(10671, 1724.365112, -1760.808837, 13.277864, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.488525, -1761.709472, 11.981515, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.458496, -1759.047363, 11.941514, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1726.306274, -1758.563964, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1726.306274, -1761.745239, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1726.306274, -1764.926269, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1726.306274, -1768.087646, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1729.747680, -1758.563964, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1729.747680, -1761.764404, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1729.747680, -1764.925659, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1729.747680, -1768.138793, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1733.190429, -1768.138793, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1733.190429, -1761.737182, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1733.190429, -1764.928344, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19354, 1733.190429, -1758.566406, 12.492186, 360.000000, 270.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.428955, -1769.650146, 11.762171, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1726.120117, -1769.661132, 12.111518, 90.000000, 180.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1734.990844, -1764.768554, 11.762171, 0.000000, 0.000000, 360.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1734.990844, -1755.177246, 11.762171, 0.000000, 0.000000, 360.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1726.010009, -1756.889648, 12.111518, 90.000000, 180.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19397, 1724.491943, -1768.053466, 14.237662, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.388427, -1755.174316, 16.901563, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1724.388427, -1764.772460, 16.901563, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1729.068237, -1769.720214, 13.412110, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1735.174804, -1764.938354, 13.402170, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.448852, -1769.720214, 13.412110, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1735.174804, -1761.676391, 13.402170, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.398925, -1764.579711, 18.552219, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1730.398925, -1757.184326, 18.552219, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1729.117675, -1764.579711, 18.622219, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1729.117675, -1761.536743, 18.622219, 0.000000, 270.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(7520, 1720.028076, -1755.988037, 12.645177, 0.000000, 0.000000, -0.299998, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(9093, 1720.553222, -1770.604370, 16.590675, 0.000000, 75.699920, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1796.858642, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1791.506713, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1786.131835, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1780.792236, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1775.431518, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1770.100341, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1764.739746, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1759.377807, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(640, 1699.946166, -1754.026000, 13.285893, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19899, 1713.645874, -1757.450683, 12.633708, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19899, 1716.206909, -1757.450683, 12.633708, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19815, 1718.973388, -1756.981811, 14.631519, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19900, 1717.795166, -1757.277587, 12.643857, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19900, 1718.428222, -1757.277587, 12.643857, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19900, 1719.037963, -1757.277587, 12.643857, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19900, 1719.637939, -1757.277587, 12.643857, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19900, 1720.248779, -1757.277587, 12.643857, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19899, 1721.843994, -1757.397827, 12.574291, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19921, 1719.144653, -1757.499633, 13.550772, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19903, 1706.942626, -1769.187866, 12.724049, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19903, 1706.942626, -1764.625244, 12.724049, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2205, 1730.517944, -1758.588867, 12.578125, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19872, 1709.569335, -1767.010253, 10.887478, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19872, 1709.569335, -1762.109130, 10.907480, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(922, 1710.002929, -1757.493774, 13.534929, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1671, 1729.834716, -1757.546997, 12.968132, 0.000000, 0.000000, 360.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19786, 1734.999633, -1763.470336, 14.378136, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1723, 1731.604980, -1764.397216, 12.578125, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 1734.961547, -1765.146362, 12.578125, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2229, 1734.961547, -1762.414916, 12.578125, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2315, 1734.553466, -1764.231079, 12.578125, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18014, 1726.939697, -1769.189086, 12.988127, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18014, 1731.570556, -1769.189086, 12.988127, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18014, 1732.591552, -1769.189086, 12.988127, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14651, 1727.262573, -1764.290039, 14.778145, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18284, 1728.164916, -1800.158935, 15.292192, 0.000000, 0.000000, 77.000007, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3465, 1720.179809, -1797.956420, 13.792204, 0.000000, 0.000000, -13.899997, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3465, 1725.501708, -1799.273193, 13.792204, 0.000000, 0.000000, -13.899997, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3465, 1730.834472, -1800.592041, 13.792204, 0.000000, 0.000000, -13.899997, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3465, 1736.163940, -1801.910034, 13.792204, 0.000000, 0.000000, -13.899997, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 1725.187866, -1757.629882, 13.368133, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 1734.169311, -1757.629882, 13.368133, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19893, 1729.844116, -1758.278686, 13.528136, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	return 1;
}


static UsunObiekty(playerid)
{
	/*RemoveBuildingForPlayer(playerid, 17772, 2870.2422, -1589.3906, 16.5625, 0.25);
    RemoveBuildingForPlayer(playerid, 1530, 2767.7813, -1621.1875, 11.2344, 0.25);
    RemoveBuildingForPlayer(playerid, 17904, 2769.2422, -1624.2266, 19.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 2833.3047, -1593.1797, 13.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 17550, 2870.2422, -1589.3906, 16.5625, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 2809.4219, -1567.6328, 9.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 2809.2734, -1556.3125, 9.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 1290, 2808.7109, -1562.2578, 15.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 1294, 2848.3516, -1567.9531, 14.6797, 0.25);
    //Mech
   	RemoveBuildingForPlayer(playerid, 1297, 2833.3047, -1593.1797, 13.3281, 0.25);*/

	//NOWA BAZA

	RemoveBuildingForPlayer(playerid, 3986, 1719.739, -1770.780, 23.429, 0.250);
	RemoveBuildingForPlayer(playerid, 4070, 1719.739, -1770.780, 23.429, 0.250);
	RemoveBuildingForPlayer(playerid, 1531, 1724.729, -1741.500, 14.101, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1700.900, -1743.979, 12.453, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1701.150, -1753.229, 12.351, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1701.260, -1764.479, 12.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1700.849, -1778.400, 12.492, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1701.300, -1794.430, 12.546, 0.250);
	RemoveBuildingForPlayer(playerid, 1294, 1738.859, -1813.250, 16.906, 0.250);
	return 1;
}

