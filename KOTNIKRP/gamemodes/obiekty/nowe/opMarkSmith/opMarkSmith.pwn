//opMarkSmith.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opMarkSmith.pwn ]--------------------------------------------//
//Autor: JustMiko
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
opMarkSmith_Init()
{
	tmpobjid = CreateDynamicObject(1705, 1689.595825, -1676.971923, 19.201110, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14525, "imy_motel2", "ah_skylight", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1705, 1687.393798, -1676.010986, 19.171136, 0.000000, 0.000000, 360.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14525, "imy_motel2", "ah_skylight", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 1693.326660, -1676.508666, 19.384296, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 1693.326660, -1673.015258, 19.384296, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2030, 1687.061035, -1667.013061, 19.614555, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3439, "xrefairtree", "treepropleaf01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "gz_vicdoor2", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 1687.070068, -1667.048828, 20.611801, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 18757, "vcinteriors", "metalplate9", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 18757, "vcinteriors", "dts_elevator_carpet3", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 8, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 9, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 10, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 11, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 12, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 13, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 14, 18752, "volcano", "lavalake", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 15, 18752, "volcano", "lavalake", 0x00000000);
	tmpobjid = CreateDynamicObject(1702, 1689.545776, -1666.073852, 19.201566, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls3_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(1702, 1685.724121, -1664.952758, 19.201566, 0.000000, 0.000000, 360.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "bridge_walls3_sfw", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 1679.505859, -1673.425903, 19.916133, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "wall6", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 15041, "bigsfsave", "wall6", 0x00000000);
	tmpobjid = CreateDynamicObject(2600, 1686.699707, -1681.222167, 20.033006, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "casinowall1_128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(2762, 1687.845336, -1678.265014, 19.554698, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 5785, "melrosetr1_lawn", "711doors1", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 1693.326660, -1680.011596, 19.384296, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1705, 1685.973022, -1678.013916, 19.201110, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14525, "imy_motel2", "ah_skylight", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1705, 1685.973022, -1679.334228, 19.201110, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14525, "imy_motel2", "ah_skylight", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(1705, 1689.595825, -1678.333251, 19.201110, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14525, "imy_motel2", "ah_skylight", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 1693.326660, -1669.522705, 19.384296, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19430, 1693.326660, -1666.019897, 19.384296, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 1682.276977, -1664.366455, 20.077568, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19123, 1685.158691, -1664.334960, 20.057743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1688.208007, -1664.309570, 20.077568, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19123, 1691.080566, -1664.293090, 20.057743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1663.262207, -1671.093261, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19123, 1685.158691, -1682.056152, 20.057743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1688.208007, -1682.008544, 20.077568, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19123, 1691.080566, -1681.956054, 20.057743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19123, 1679.229492, -1664.336547, 20.057743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1654.629638, -1671.093261, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19893, 1687.530151, -1666.640502, 20.011606, 0.000000, 0.000000, 69.600196, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(630, 1688.908935, -1665.149047, 20.285478, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1692.862060, -1676.455322, 19.931556, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1692.862060, -1680.358764, 19.931556, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18868, 1687.592285, -1667.504028, 20.002019, 0.000000, 0.000000, 112.099838, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3934, 1669.569091, -1717.109375, 19.474374, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1673.683471, -1713.469482, 19.334371, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1673.633422, -1720.950439, 19.334371, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1665.282104, -1720.950439, 19.334371, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3666, 1665.282104, -1713.508544, 19.334371, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19123, 1679.229492, -1682.176269, 20.057743, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1654.629638, -1675.494873, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1682.276977, -1682.138671, 20.077568, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1663.293579, -1675.494873, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1661.123657, -1673.221069, 21.557525, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1656.800903, -1673.221069, 21.557525, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1658.812866, -1673.221069, 21.557525, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1641.114990, -1687.708374, 22.153236, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1641.114990, -1684.837768, 22.153236, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1641.114990, -1681.597167, 22.153236, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1641.114990, -1678.606567, 22.153236, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1640.897216, -1704.128051, 20.988876, 0.000000, 0.000000, -85.299987, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1640.898193, -1707.660034, 20.988876, 0.000000, 0.000000, 76.400123, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1639.065429, -1705.984741, 21.417516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1663.163452, -1686.846191, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1654.743408, -1686.846191, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1654.743408, -1691.716430, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1663.225585, -1691.716430, 21.167516, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1660.907348, -1688.891723, 21.510580, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1657.055541, -1688.891723, 21.510580, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1670, 1687.813110, -1678.970825, 19.992004, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1688.113525, -1677.393432, 20.121704, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1687.402832, -1677.423461, 20.121704, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1687.733154, -1677.883911, 20.121704, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1687.933349, -1677.943969, 20.121704, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1687.813232, -1678.013916, 20.121704, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1582, 1687.847778, -1678.449707, 19.971691, -0.399998, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1676.512939, -1673.218750, 21.557525, 0.000000, 0.000000, -155.100051, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1691.370605, -1672.206665, 20.261564, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1685.821533, -1672.216674, 20.221563, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1688.558593, -1672.206665, 20.261564, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 1679.313476, -1663.063720, 21.635206, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1364, 1671.447021, -1660.016113, 22.247579, 0.000000, 0.000000, 15.599983, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1634.052246, -1677.337036, 12.461650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1634.046386, -1674.044311, 12.461652, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1692.862060, -1669.751342, 19.931556, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 1692.862060, -1665.989746, 19.931556, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 1629.961425, -1663.063720, 21.635206, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1640.971679, -1664.909179, 23.286146, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(804, 1665.896728, -1664.909179, 23.256145, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	gateob = CreateDynamicObject(971, 1643.396240, -1714.823364, 15.034778, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		1643.396240, -1706.260131, 15.034777, 0.000000, 0.000000, 270.000000,
		1643.396240, -1714.823364, 15.034778, 0.000000, 0.000000, 270.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1905);
	gateob = CreateDynamicObject(19304, 1639.660278, -1675.949340, 18.705621, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(gateob,
		1639.660278, -1678.960693, 18.705621, 0.000000, 0.000000, 90.000000,
		1639.660278, -1675.949340, 18.705621, 0.000000, 0.000000, 90.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1905);
}
