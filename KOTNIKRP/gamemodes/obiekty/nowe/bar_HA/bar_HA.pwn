//bar_HA.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: bar_HA.pwn ]--------------------------------------------//
//Autor: Miko & skBarman
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
bar_HA_Init()
{
	StworzExterior();
	StworzInterior();
	StworzBramy();
	StworzBudynki();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzExterior()
{
    tmpobjid = CreateDynamicObject(19911, 290.965789, -196.792846, 0.563695, -0.000003, 89.799934, 0.000000, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarb_wall_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19911, 290.976867, -187.194824, 0.563660, -0.000003, 89.799934, -0.099999, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarb_wall_128", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 289.557647, -201.562820, 0.823563, 0.000000, 0.000000, 719.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 292.997375, -201.568847, 0.823563, 0.000000, 0.000000, 719.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 295.913940, -185.813461, 0.783563, 0.000000, 0.000000, 179.899703, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 294.187255, -184.161071, 0.783563, 0.000000, 0.000000, 449.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 294.187255, -184.161071, 0.783563, 0.000000, 0.000000, 449.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 292.461029, -182.358261, 0.783563, 0.000000, 0.000000, 539.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 289.602020, -182.353256, 0.783563, 0.000000, 0.000000, 539.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 287.868316, -184.069976, 0.823563, 0.000000, 0.000000, 629.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 287.862487, -187.540054, 0.823563, 0.000000, 0.000000, 629.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 287.856353, -191.050003, 0.823563, 0.000000, 0.000000, 629.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1418, 287.881317, -199.830383, 0.823563, 0.000000, 0.000000, 629.899719, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ab_kitchunit2", 0x00000000);
    tmpobjid = CreateDynamicObject(1506, 293.723907, -196.197357, 0.787298, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14590, "mafcastopfoor", "ab_stairwellLwr", 0x00000000);

    tmpobjid = CreateDynamicObject(2635, 288.978942, -187.673355, 1.023107, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 288.703643, -198.803512, 1.108086, 0.000000, 0.000000, 89.799942, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 290.239013, -187.632690, 1.120355, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 288.688629, -200.762573, 1.050495, 0.000000, 0.000000, -88.699783, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2635, 288.704376, -199.808959, 1.019687, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 288.968688, -186.405670, 1.098351, -0.499998, 0.000000, 90.400001, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2635, 292.108062, -198.952453, 1.008618, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 292.167144, -197.908935, 1.028620, 0.000000, 0.000000, 89.899841, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 288.978851, -189.013580, 1.143893, 0.000000, 0.000000, -88.299942, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 292.164703, -199.899719, 1.063527, 0.000000, 0.000000, -86.699981, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 288.993835, -189.955749, 1.098351, -0.499998, 0.000000, 90.400001, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(3802, 291.221679, -193.760940, 3.717317, 0.000000, 0.000000, -174.099990, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2011, 293.780883, -182.748565, 0.606275, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(3802, 291.232696, -197.660873, 3.717317, 0.000000, 0.000000, -174.099990, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2635, 288.978942, -191.243316, 1.023107, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2011, 288.045806, -197.415390, 0.585058, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2011, 288.045806, -193.515762, 0.585058, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 290.239013, -191.362548, 1.120355, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2011, 292.875061, -188.794097, 0.622995, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2011, 292.282470, -201.072769, 0.594897, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2011, 288.211212, -185.698364, 0.606275, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 292.254760, -182.942596, 1.127234, -0.499998, 0.000000, 90.400001, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2635, 292.178833, -184.253402, 1.073107, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 289.083129, -192.531646, 1.143893, 0.000000, 0.000000, -88.299942, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 292.177062, -185.506973, 1.143893, 0.000000, 0.000000, -88.299942, 0, 0, -1, 300.0);
    tmpobjid = CreateDynamicObject(2310, 293.309448, -184.302886, 1.120355, 0.000000, 0.000000, 0.000000, 0, 0, 0, 300.00);
	return 1;
}
static StworzInterior()
{
    tmpobjid = CreateDynamicObject(19377, 296.244812, -187.404495, 13.120002, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14736, "whorerooms", "AH_bathplanks", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 306.744812, -187.404495, 13.120002, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14736, "whorerooms", "AH_bathplanks", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 296.244812, -197.034500, 13.120002, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14736, "whorerooms", "AH_bathplanks", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 306.744812, -197.034500, 13.120002, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14736, "whorerooms", "AH_bathplanks", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 296.244812, -187.504501, 16.500000, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 306.744812, -187.504501, 16.500000, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 292.863708, -197.018707, 14.729219, 0.000000, 0.699999, -0.199999, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19358, 300.763336, -201.936370, 14.734841, 0.000000, 0.000000, -90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 292.877441, -187.431884, 14.731615, 0.000000, 0.499998, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19404, 297.553344, -201.936370, 14.734841, 0.000000, 0.000000, -90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19455, 297.606781, -188.321334, 14.720193, 0.000000, -1.299999, -90.099899, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 297.615356, -188.359603, 14.723212, 0.000000, 0.000000, -90.099975, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 308.567565, -187.698791, 14.724040, 0.000000, 0.000000, -90.599975, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 306.744812, -177.774490, 13.120002, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14736, "whorerooms", "AH_bathplanks", 0x00000000);
    tmpobjid = CreateDynamicObject(19404, 311.996795, -191.702423, 14.730264, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19404, 312.002990, -194.476669, 14.730854, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 311.974273, -200.687103, 14.727684, 0.000000, 0.000000, -0.400000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 307.183349, -201.936370, 14.734841, 0.000000, 0.000000, -90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19455, 297.585968, -182.673309, 14.750672, 0.599999, 0.000000, -90.499908, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19404, 294.343353, -201.936370, 14.734841, 0.000000, 0.000000, -90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 308.220550, -187.635681, 14.738615, 0.000000, 0.000000, -90.899971, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 312.004547, -172.467239, 14.727684, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 309.656829, -187.651794, 14.725316, 0.000000, 0.000000, -90.800041, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "sialalala", 60, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(19450, 306.374908, -173.107009, 14.727684, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 301.504547, -177.997360, 14.727684, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 307.515686, -186.746246, 14.733632, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 316.004333, -173.107009, 14.727684, 0.000000, 0.000000, 90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 304.381774, -179.224594, 14.727684, 0.000000, 0.000000, 40.499946, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 311.253936, -187.667129, 14.729994, 0.000000, 0.000000, -90.299934, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 307.519989, -185.191711, 14.731409, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(1523, 302.371459, -188.405746, 13.366892, 0.000000, 0.000000, 24.000001, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 12946, "ce_bankalley1", "sw_warewall", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 310.556518, -200.888153, 13.793032, 0.000000, 0.000000, 178.999938, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 306.872100, -200.853637, 13.774195, 0.000000, 0.000000, 178.399826, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(19445, 302.604370, -182.747528, 14.792991, 0.799998, -0.099999, -90.699981, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 302.691986, -200.800033, 13.754925, 0.000000, 0.000000, 178.000228, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 298.926879, -200.790496, 13.761200, 0.000000, 0.000000, 179.799606, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 304.546691, -187.634552, 14.708672, -0.100001, -0.400000, 89.100105, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 294.978332, -200.753082, 13.762641, 0.000000, 0.000000, 178.299652, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 310.473358, -197.958297, 13.755530, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 306.143859, -187.654815, 14.707601, 0.000000, 0.000000, -90.699890, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 301.601287, -188.284942, 14.716259, 0.000000, 0.000000, -90.300010, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 306.909576, -197.958007, 13.753400, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 300.001464, -188.261383, 14.722297, -0.099999, -0.699999, -90.299987, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 302.666412, -197.924591, 13.759558, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(2027, 298.978302, -197.911300, 13.761474, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19332, "balloon_texts", "balloon03", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 307.494842, -186.912200, 14.729658, 0.000000, 0.000000, -1.299999, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 307.514739, -185.325225, 14.734194, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 307.315673, -187.665069, 14.714221, 0.000000, 0.000000, -90.999847, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(19383, 297.655487, -184.198684, 14.719445, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 297.653045, -186.585113, 14.719097, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 298.392364, -188.257171, 14.721710, 0.000000, -0.799998, -90.099945, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, 297.651855, -187.378997, 14.724698, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19436, 292.905029, -183.504669, 14.710619, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19436, 292.907379, -187.445632, 14.719289, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19436, 292.897796, -185.895294, 14.716665, 0.000000, 0.399998, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(19436, 292.888977, -184.368621, 14.716371, -0.599999, 0.299998, 0.699998, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9583, "bigshap_sfw", "freighter2", 0x00000000);
    tmpobjid = CreateDynamicObject(1492, 297.696746, -184.950744, 12.947076, 0.000000, 0.000000, 91.300025, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(19927, 298.170166, -187.225112, 13.146613, 0.599999, 0.000000, -179.700302, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3895, "inditaly", "tenwhitebrick64", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 296.244812, -197.134506, 16.500000, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 306.744812, -197.134506, 16.500000, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 309.816589, -187.656265, 14.736889, 0.000000, 0.000000, -90.999870, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(19431, 311.994659, -189.315673, 14.729080, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 307.493072, -183.689285, 17.365644, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
    tmpobjid = CreateDynamicObject(1492, 307.428314, -182.890426, 13.115365, 0.000000, 0.000000, -90.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
    tmpobjid = CreateDynamicObject(19431, 312.002838, -187.720001, 14.732925, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "tarmac_64HV", 0x00000000);
    tmpobjid = CreateDynamicObject(2272, 311.404724, -193.051483, 14.657585, 1.000013, -0.199999, -92.899848, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "wrappingpaper16", 0x00000000);
    tmpobjid = CreateDynamicObject(19377, 306.744812, -177.874496, 16.500000, 0.000000, 90.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19450, 312.004547, -182.097366, 14.727684, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(11724, 311.637573, -190.273391, 13.751335, 0.000000, 0.000000, -90.800064, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6056, "venice_law", "stonewalls2", 0x00000000);
    tmpobjid = CreateDynamicObject(19437, 312.000854, -186.784500, 14.725956, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbwall7_256", 0x00000000);
    tmpobjid = CreateDynamicObject(1557, 292.878021, -196.495285, 13.143518, 0.799998, 0.100000, 90.200210, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2202, 309.447814, -187.063674, 13.185939, 0.000000, 0.000000, 179.599792, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11686, 295.385406, -191.220809, 13.137349, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1805, 293.567810, -192.579589, 13.453006, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19466, 311.927947, -191.660018, 14.731003, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1805, 295.167175, -192.565963, 13.452290, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1805, 296.770263, -192.591995, 13.455020, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11686, 299.824798, -191.222900, 13.138627, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1805, 298.601165, -192.540725, 13.459645, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1805, 300.903045, -192.526977, 13.465165, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2232, 311.432952, -188.336135, 13.738739, 0.000000, 0.000000, -41.699974, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2184, 305.121429, -175.656646, 13.163248, 0.000000, 0.000000, 71.400123, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19999, 303.264923, -173.990203, 13.185729, 0.000000, 0.000000, 68.800193, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1808, 311.497619, -187.375167, 13.205940, 0.000000, 0.000000, -178.800064, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1713, 311.335266, -174.720397, 13.215939, 0.000000, 0.000000, -90.099952, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1670, 304.118988, -178.056808, 13.621461, 0.000000, 0.000000, 156.099807, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2083, 303.320343, -178.120422, 13.111807, 0.000000, 0.000000, -49.700057, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(14651, 306.674194, -190.768081, 15.293493, 0.000000, 0.000000, -124.599723, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2196, 304.403686, -175.024429, 13.933600, 0.000000, 0.000000, 97.699813, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3105, 306.806488, -190.476104, 14.119483, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3102, 307.924316, -190.746017, 14.117929, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3000, 307.385375, -190.005676, 14.105692, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3003, 307.385375, -191.045608, 14.125691, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3006, 296.929687, -187.656066, 12.853715, 0.000000, -2.600003, -178.000015, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3106, 306.585601, -189.890533, 14.118954, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19928, 298.104705, -185.822509, 13.140517, 0.000000, 0.000000, -179.600372, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19929, 301.613555, -186.782394, 13.141405, 0.000000, 0.000000, -2.300055, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19929, 301.556488, -183.288696, 13.138892, 0.000000, 0.000000, -90.300086, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19923, 303.440826, -183.531814, 13.141876, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19924, 303.422454, -183.492630, 15.920557, 0.000000, 0.000000, -90.699928, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2832, 298.041046, -185.935287, 14.071228, 0.000000, 0.000000, -58.099967, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19581, 304.031158, -183.775726, 14.181523, 0.000000, 0.000000, -70.999977, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19582, 303.589385, -183.940917, 14.199891, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19830, 300.788635, -183.254608, 14.060497, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19583, 301.649658, -183.478958, 14.071233, 0.000000, 0.000000, -141.100021, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19586, 304.123107, -184.049194, 14.139759, 0.000000, 0.000000, -178.200119, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19929, 305.974517, -187.084075, 13.138665, 0.000000, 0.000000, -89.699851, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19468, 304.794464, -183.362136, 13.241710, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2865, 306.680450, -186.962860, 14.071295, 0.000000, 0.000000, 50.499980, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1431, 293.470275, -187.304153, 13.657816, 0.000000, 0.000000, -92.900077, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19638, 293.503601, -187.698837, 14.193549, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19636, 293.513702, -186.859130, 14.213554, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19564, 305.408325, -187.041900, 14.064593, 0.000000, 0.000000, -83.100013, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19563, 305.151489, -187.308471, 14.062019, 0.000000, 0.000000, -40.099990, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1271, 293.421569, -183.960235, 13.453886, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1271, 293.381408, -183.130630, 13.413886, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1271, 294.161682, -183.140731, 13.453886, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1271, 293.571533, -183.360580, 14.133887, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1537, 293.015747, -186.015823, 13.026124, 0.000000, 0.000000, -89.499954, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19612, 311.475311, -188.292083, 14.328626, 0.000000, 0.000000, -42.400028, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19466, 311.936340, -194.359725, 14.700381, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2232, 293.435516, -188.885803, 15.560072, 6.500016, -2.199997, 46.700012, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19466, 297.475219, -201.849060, 14.750814, 0.000000, 0.000000, 90.099990, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2801, 306.953948, -194.437500, 13.543644, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2231, 304.541687, -201.869171, 13.210378, 0.000000, 0.000000, 178.500015, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2802, 310.499786, -194.427001, 13.543133, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2801, 310.493438, -194.401306, 13.556857, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2802, 306.958709, -194.463058, 13.542110, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(638, 293.285186, -197.880386, 13.825734, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19466, 294.376037, -201.853424, 14.795204, 0.000000, 0.000000, -90.099960, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1649, 297.990295, -201.940231, 14.743083, 0.000000, 0.000000, 179.400344, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19445, 1889.896240, -1867.349365, 12.560374, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2241, 293.352844, -201.312850, 13.636979, 0.000000, 0.000000, -52.299999, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2500, 301.375854, -188.109329, 14.050830, 0.000000, 0.000000, -179.700073, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2273, 305.192718, -188.259384, 15.027723, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19893, 304.953887, -174.008361, 13.932931, 0.000000, 0.000000, -85.400009, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2500, 295.086334, -191.413024, 14.224722, 0.000000, 0.000000, -179.299942, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19173, 304.448852, -201.823959, 15.424210, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19812, 293.267761, -188.757110, 13.611947, 0.000000, 0.000000, 31.399995, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19812, 294.219024, -188.798889, 13.618390, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19173, 311.822753, -199.309020, 15.390583, 0.000000, 0.000000, -87.100006, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19172, 296.830993, -188.457870, 15.377091, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1546, 295.068420, -191.016830, 14.347352, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 306.872375, -197.958953, 15.994423, 0.000000, 179.799896, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2812, 310.578247, -200.850021, 14.023655, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1667, 302.410949, -201.252746, 14.078909, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1667, 302.991455, -200.462921, 14.068929, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2812, 298.916961, -200.849304, 13.980124, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 310.555145, -197.807235, 16.003025, 0.000000, -179.799865, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 310.599151, -200.943527, 16.013198, 0.000000, -179.999954, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2161, 301.624053, -175.283660, 14.284331, 0.000000, 0.000000, 87.899864, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2829, 299.032806, -197.975173, 13.970693, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19916, 304.130981, -187.210067, 13.071645, 0.000000, 0.000000, -178.799972, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11744, 302.407226, -197.995254, 13.999857, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11744, 302.903198, -197.994522, 14.002655, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19809, 302.697479, -198.295928, 14.012276, 0.000000, 0.000000, -91.599990, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2804, 302.772979, -198.248519, 14.092276, 0.000000, 0.000000, 99.399993, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2530, 300.241638, -188.962829, 13.163171, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2812, 306.928466, -197.974212, 13.975525, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1520, 300.618865, -188.852752, 14.159359, 0.000000, 0.000000, -88.399932, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19563, 300.562225, -188.846878, 13.719388, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1520, 300.489105, -188.901016, 14.169372, 0.000000, 0.000000, -89.599967, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1520, 300.349151, -188.974853, 14.179347, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19563, 300.309020, -188.898696, 13.729260, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1664, 300.169555, -188.965637, 14.299107, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1664, 300.051055, -188.937957, 14.299049, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19563, 300.048583, -188.828887, 13.708841, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1664, 299.909149, -188.945251, 14.299553, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2601, 299.898040, -188.809341, 14.738525, 0.000000, 0.000000, 80.299964, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2601, 300.045867, -188.886901, 14.758517, 0.000000, 0.000000, 85.599983, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19564, 300.564392, -189.055831, 13.326025, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2601, 300.209014, -189.005004, 14.758886, 0.000000, 0.000000, 79.799987, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2601, 300.376281, -189.015121, 14.748846, 0.000000, 0.000000, 85.800003, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19564, 300.327972, -189.162582, 13.379422, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19564, 300.127624, -189.072647, 13.319420, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2059, 305.001403, -174.829193, 13.950167, 0.000000, 0.000000, -154.199951, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19174, 303.824310, -178.336517, 15.072806, 0.000000, 0.000000, 132.899581, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19835, 304.875762, -174.651062, 14.030344, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2850, 298.074096, -186.308975, 13.907994, 0.000000, 5.699961, -62.000045, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11715, 298.136535, -187.568405, 14.047285, 0.000000, 0.000000, 56.900024, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11716, 298.347717, -187.632308, 14.044006, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11744, 298.047760, -187.850616, 14.045429, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1514, 299.889770, -191.182037, 14.468903, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1514, 297.538391, -191.210998, 14.484010, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2079, 294.491699, -187.675857, 13.719483, 0.000000, 0.000000, -109.900032, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1665, 293.692962, -186.463211, 13.679345, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19897, 294.064819, -187.110275, 13.112399, 0.000000, 0.000000, 29.000001, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(322, 302.026000, -174.681503, 14.439440, 0.000000, 92.999961, 106.499916, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2674, 294.466003, -187.253723, 13.223024, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(338, 306.927062, -189.855239, 14.080424, 83.999931, 0.000000, 1.899999, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19317, 311.634948, -189.080566, 13.915498, -22.699968, 0.799998, -91.199974, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(338, 308.936981, -190.569229, 14.109094, -1.399997, -93.999992, -0.400000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19173, 307.581237, -183.908401, 16.025966, 0.000000, 0.000000, -89.799934, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2123, 307.154235, -173.887191, 13.755947, 0.000000, 0.000000, 10.599987, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 299.012451, -197.991668, 15.950180, 0.000000, -179.099960, -1.399999, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 302.638214, -197.872283, 15.958244, 0.000000, 179.799804, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 306.909820, -200.966339, 15.983395, 0.000000, -179.799942, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 293.106536, -191.285186, 14.568801, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 302.671325, -200.857284, 15.944160, 0.000000, -179.900070, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2123, 306.928802, -175.377029, 13.735952, 0.000000, 0.000000, -15.400011, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 298.880615, -200.802124, 15.938546, 0.000000, -179.599853, 2.099999, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2107, 294.964141, -200.904174, 15.922206, 0.000000, -179.399887, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19632, 311.618804, -190.253860, 13.250680, 0.000000, 0.000000, -96.000007, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2010, 311.453216, -173.664260, 13.215940, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2802, 311.073913, -179.057998, 13.535947, 0.000000, 0.000000, 136.600006, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2737, 305.951751, -173.243164, 14.875957, 0.000000, 0.000000, -0.699964, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19473, 306.178649, -180.294647, 13.245941, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19825, 303.372833, -173.245254, 15.345959, 0.000000, 0.000000, 0.000000, 1, 0, -1, 300.00, 300.00); 

	return 1;
}

static StworzBramy()
{
	//Tutaj wstawiamy bramy w formacie: 
		// DodajBrame(fobiekt, Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, Float:fspeed, Float:frange, fuprtyp=0, fuprval=0)
		// fuprtyp - TYPY UPRAWNIEN:
			//0 - BRAK
			//1 - FRAKCJA
			//2 - RODZINA
			//3 - BIZNES
		// fuprval - numer frakcji/rodziny
	
		//DualGateAdd(...rozpisane w glownym README) 
	return 1;
}

static StworzBudynki()
{
	//Tutaj wstawiamy wejscia w formacie:
	//DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="", wejdzUID=0, playerLocal=255, bool:specialCome=false); 
	DodajWejscie(292.4474,-195.3832,1.5781, 293.7954,-195.7626,14.1287, 0, 0, 1, 0, "Bar", "", 21); 
	DodajWejscie(294.1698,-187.3298,1.5781, 293.5556,-185.1613,14.0982, 0, 0, 1, 0, "Składzik", "", 21); 
	return 1;
}
