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
//BY- xSelectx

//-----------------<[ Główne Funkcje ]>---------------------------

rafineriaLVint_Init()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje ]>---------------------------

static StworzObiekty()
{
    tmpobjid = CreateDynamicObject(6959, 623.984008, 1241.733642, 65.971321, 0.000000, 0.000000, 28.999992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "metpat64", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 641.214050, 1248.149902, 67.650024, 0.000000, 0.000000, 30.599992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 641.214050, 1248.149902, 71.140014, -0.031098, 0.000000, 30.599992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 646.111267, 1239.871215, 67.650024, 0.000000, 0.000000, 30.599992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 636.357604, 1256.363281, 67.650024, 0.000000, 0.000000, 30.599992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 646.106567, 1239.880249, 71.145233, -0.031098, 0.000000, 30.599992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 636.357971, 1256.361450, 71.134887, -0.031098, 0.000000, 30.599992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 641.455322, 1238.494873, 65.866744, 179.999832, 89.599983, -60.700050, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 633.060119, 1253.459594, 65.866500, 179.999816, 89.599983, -59.600067, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 621.524597, 1253.085815, 71.140007, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 644.296997, 1233.321411, 67.640022, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 644.296997, 1233.321411, 71.140068, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 636.144958, 1228.423217, 67.640022, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 627.908447, 1223.450561, 67.640022, 0.000000, 0.000000, -58.800045, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 619.697021, 1218.476684, 67.640022, 0.000000, 0.000000, -58.800045, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 636.118957, 1228.406982, 71.140068, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 627.898437, 1223.468505, 71.140068, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 619.686462, 1218.534179, 71.140068, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 629.710632, 1258.004028, 67.640022, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 629.710632, 1258.004028, 71.140007, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 621.481567, 1253.059204, 67.710037, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.577941, 1249.520507, 67.710037, 0.000000, 0.000000, -59.000041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 613.856201, 1242.947387, 67.640022, 0.000000, 0.000000, 30.699983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.593017, 1249.522094, 71.140007, 0.000000, 0.000000, -59.200038, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 617.729064, 1236.350463, 67.640022, 0.000000, 0.000000, 30.199981, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19387, 614.008300, 1232.955200, 71.040008, 0.000000, 0.000000, -62.199954, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.900573, 1230.001708, 67.640022, 0.000000, 0.000000, -61.799983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 614.967834, 1231.532348, 69.279365, 0.000000, -90.100059, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 616.815246, 1234.455688, 71.027137, 0.599997, 0.000000, 119.500022, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 613.692138, 1223.384765, 71.140068, 0.000000, 0.000000, 25.900016, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 617.850219, 1214.820556, 67.660049, 0.000000, 0.000000, 25.900016, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 611.197570, 1231.449829, 71.033866, 0.599997, 0.000000, 118.300041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 610.903808, 1229.125488, 71.129997, 0.000000, 0.000000, 25.900016, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 617.850219, 1214.820556, 71.130027, 0.000000, 0.000000, 25.900016, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 612.783752, 1234.307983, 69.230453, 0.000000, -89.899963, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14385, "trailerkb", "tr_wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 611.113159, 1237.371948, 69.236557, -0.009999, -89.899963, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14385, "trailerkb", "tr_wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.855895, 1239.458496, 74.159919, 0.000000, 0.000000, 30.699983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 617.484191, 1236.712036, 70.947540, 0.000000, 0.000000, 30.700002, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 609.441650, 1240.436645, 69.242698, -0.009999, -89.899963, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14385, "trailerkb", "tr_wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 613.824401, 1242.853149, 71.087570, 0.000000, 0.000000, 31.100004, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.827087, 1239.429443, 68.510032, 0.000000, 0.000000, 30.599983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 608.798645, 1241.784912, 71.040031, 0.000000, 0.000000, -61.799983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 607.956115, 1235.109130, 71.040031, 0.000000, 0.000000, 28.000045, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 603.733032, 1243.157836, 71.040031, 0.000000, 0.000000, 27.300043, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 609.593750, 1240.513671, 72.642707, -0.009999, -89.899963, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "planks01", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 610.664611, 1248.203857, 71.059982, 0.000000, 0.000000, 30.699983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 613.692138, 1223.384765, 67.660049, 0.000000, 0.000000, 25.900016, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 613.871887, 1242.928588, 69.527854, 0.599999, 0.000000, 30.800003, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 640.506713, 1247.896728, 69.722465, 0.000000, 87.799980, -149.300003, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "a51_handrail", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 646.106201, 1241.066528, 69.275375, -0.099999, 87.699981, -149.400009, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 632.804748, 1263.557983, 69.320945, -0.099999, 87.699981, -149.400009, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 622.846130, 1254.523437, 69.461402, -0.399998, 92.599906, -59.099910, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 614.788269, 1249.703369, 69.526817, -0.399998, 92.599906, -59.099910, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 613.809875, 1221.803344, 69.074890, 0.100000, 92.999938, 25.800094, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 608.492004, 1226.392089, 69.039260, 0.100000, 89.099998, -60.699882, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 638.126342, 1228.966430, 69.221366, -0.399998, 92.599906, 121.300079, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 623.739013, 1220.289306, 72.688056, -0.099999, 89.899955, 120.900108, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 615.223327, 1218.957519, 72.742767, 0.100000, 92.999938, 25.800094, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 623.782836, 1220.257202, 69.103775, -0.399998, 92.599906, 121.200080, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 646.038146, 1233.659790, 72.733459, -0.099999, 89.999954, 121.000106, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 647.540039, 1238.574707, 72.739448, -0.099999, 89.899955, -149.399917, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 637.013183, 1256.376586, 72.775520, -0.099999, 89.899955, -149.399917, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 622.556823, 1254.266845, 72.789520, 0.099999, 91.699928, -59.399917, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 611.173583, 1246.293334, 72.854316, 0.399998, 91.199966, 30.500091, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 606.619567, 1229.657226, 72.696807, 0.399998, 90.999969, -61.899848, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(9339, 611.274353, 1246.236206, 69.496070, 0.600000, 86.599998, 30.500087, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 617.461608, 1236.652099, 70.947540, 0.000000, 0.000000, 30.700002, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 613.788513, 1242.854858, 71.087570, 0.000000, 0.000000, 31.000003, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.830078, 1239.443115, 74.189926, 0.000000, 0.000000, 30.699983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 615.878723, 1239.460205, 68.530036, 0.000000, 0.000000, 30.599983, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "pavea256", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 616.799255, 1234.503906, 71.027030, 0.599997, 0.000000, 119.500022, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19387, 614.007873, 1232.977416, 71.050010, 0.000000, 0.000000, -62.199951, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19368, 611.192810, 1231.458618, 71.033866, 0.599997, 0.000000, 118.300041, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 13014, "sw_block04", "sw_wallbrick_03", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 618.756652, 1233.437500, 69.134712, 0.399998, -89.300048, -60.399749, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "shingles2", 0x00000000);
    tmpobjid = CreateDynamicObject(8661, 627.147033, 1234.509033, 72.785774, 540.000000, 0.000000, 31.099990, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "a51_panel2", 0x00000000);
    tmpobjid = CreateDynamicObject(8661, 616.878417, 1251.532226, 72.785774, 540.000000, 0.000000, 31.099990, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "a51_panel2", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 611.423706, 1237.534301, 72.636466, -0.009999, -89.899963, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "planks01", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 613.085571, 1234.464233, 72.630470, 0.000000, -89.899963, -61.399967, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "planks01", 0x00000000);
    tmpobjid = CreateDynamicObject(2911, 612.183227, 1243.421264, 70.262931, 90.000000, 90.000000, -58.999992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(2911, 613.280639, 1241.595336, 70.262931, 90.000000, 90.000000, -58.999992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(2911, 614.377441, 1239.770263, 70.262931, 90.000000, 90.000000, -58.999992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(2911, 615.443115, 1237.996337, 70.262931, 90.000000, 90.000000, -58.999992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(2911, 616.220947, 1236.702392, 70.262931, 89.800003, 90.399993, -58.999992, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 612.151428, 1243.369140, 68.509155, 179.889999, 0.100036, 31.200038, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "corugwall_sandy", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 614.816772, 1238.845947, 68.530464, 179.890029, -1.899963, 31.300039, 40, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16093, "a51_ext", "corugwall_sandy", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(11714, 640.854919, 1248.557495, 67.160064, 0.000000, 0.000000, 30.500015, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(17951, 645.434143, 1240.837280, 67.390045, 0.000000, 0.000000, 29.800018, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(17951, 636.655151, 1255.684570, 67.419998, 0.000000, 0.000000, 30.500019, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19273, 641.847717, 1246.932006, 67.440055, 0.000000, 0.000000, -57.699970, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 634.818481, 1259.052001, 66.230049, 0.000000, 0.000000, -149.400009, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3761, 618.328247, 1241.535034, 67.920066, 0.000000, 0.000000, 27.100000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3761, 622.921813, 1243.885620, 67.920066, 0.000000, 0.000000, 27.100000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(939, 629.723266, 1234.056640, 68.310043, 0.000000, 0.000000, 33.299999, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(925, 636.296630, 1229.629394, 66.979995, 0.000000, 0.000000, 29.200019, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 647.615417, 1237.414062, 66.230049, 0.000000, 0.000000, -149.400009, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 637.259094, 1229.041992, 66.230049, 0.000000, 0.000000, 121.099906, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 622.695861, 1253.846923, 66.230049, 0.000000, 0.000000, -59.000007, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 614.944519, 1215.581176, 66.230049, 0.000000, 0.000000, 121.099906, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 613.584289, 1243.443603, 66.230049, 0.000000, 0.000000, 30.199903, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(16666, 621.488403, 1266.029785, 65.289993, 0.000000, 0.000000, 31.800067, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8614, 617.694091, 1229.814575, 68.149993, 0.000000, 0.000000, 28.000015, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 618.259948, 1231.230834, 69.889251, 0.000000, 0.000000, -152.100204, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 619.043701, 1233.993652, 69.879249, 0.000000, 0.000000, -59.999992, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 611.735595, 1227.739624, 69.889251, 0.000000, 0.000000, -151.400131, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 617.317871, 1215.951171, 66.230049, 0.000000, 0.000000, 26.199888, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(9339, 608.693542, 1226.137329, 66.230049, 0.000000, 0.000000, 118.099937, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1494, 613.346252, 1232.601196, 69.278656, 0.000000, 0.000000, 28.100002, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1649, 615.711547, 1239.846679, 71.841903, 0.000000, 0.000000, -59.000011, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1649, 615.711547, 1239.846679, 71.841903, 0.000000, 0.000000, 120.999984, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 627.060913, 1252.664184, 66.494148, 0.000000, 0.000000, -66.700004, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 629.367980, 1248.679077, 66.494148, 0.000000, 0.000000, -57.000003, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 635.377319, 1238.139648, 66.494148, 0.000000, 0.000000, -57.000003, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 637.832153, 1233.772705, 66.494148, 0.000000, 0.000000, -57.000003, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 638.800842, 1236.664184, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 634.501281, 1244.168701, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 622.140686, 1246.975341, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 631.148681, 1231.912231, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 623.181945, 1227.349853, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 630.237609, 1251.613281, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1893, 626.726318, 1239.715454, 72.679977, 0.000000, 0.000000, 29.799974, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 617.272155, 1216.457519, 70.840049, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 617.272155, 1216.457519, 67.370071, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 617.705261, 1234.991821, 70.870124, 0.000000, 0.000000, -61.900039, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 617.705261, 1234.991821, 67.430130, 0.000000, 0.000000, -61.900039, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 619.468200, 1231.989135, 67.460144, 0.000000, 0.000000, -66.799758, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 609.618530, 1230.529785, 70.840034, 0.000000, 0.000000, -67.799957, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 611.353515, 1247.551757, 71.220046, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 611.353515, 1247.551757, 67.760047, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 611.353515, 1247.551757, 64.300094, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 633.528930, 1260.920043, 67.450050, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 633.528930, 1260.920043, 70.900001, 0.000000, 0.000000, 26.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 648.880004, 1236.301147, 70.799980, 0.000000, 0.000000, -60.500087, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19433, 648.880004, 1236.301147, 67.439979, 0.000000, 0.000000, -60.500087, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1722, 610.185913, 1240.507202, 69.310569, 0.000000, 0.000000, 168.400054, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2115, 608.840270, 1238.625488, 69.313323, 0.000000, 0.000000, 19.799999, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19996, 608.679504, 1240.208129, 69.312019, 0.000000, 0.000000, 5.199998, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2121, 609.057128, 1237.011230, 69.729850, 0.000000, 0.000000, -171.200149, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2121, 610.251159, 1237.589843, 69.691329, 0.000000, 0.000000, -131.100006, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19786, 607.984924, 1235.142578, 71.531555, 0.000000, 0.000000, 120.400039, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2953, 614.078369, 1240.515991, 70.312622, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(18868, 608.678955, 1238.849121, 70.095695, 0.000000, 0.000000, -169.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1665, 609.932556, 1239.025024, 70.128143, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3801, 613.920959, 1233.295654, 72.073867, 0.000000, 0.000000, 114.200004, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2026, 611.495422, 1237.290893, 72.559883, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19827, 614.988098, 1233.594726, 71.066413, 0.000000, 0.000000, -150.100082, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(18641, 615.912658, 1237.573974, 70.330009, 98.199996, 0.000000, 14.699993, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2267, 609.222412, 1241.852661, 71.541397, 0.000000, 0.000000, 29.200012, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19825, 606.871582, 1240.584716, 71.787513, 0.000000, 0.000000, 30.400001, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2332, 606.361389, 1239.905029, 69.728912, 0.000000, 0.000000, 28.099998, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1620, 609.683166, 1232.136718, 71.470809, 0.000000, 0.000000, -152.300094, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2007, 612.363586, 1232.673706, 69.297622, 0.000000, 0.000000, -150.899932, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2007, 611.507141, 1232.197387, 69.297622, 0.000000, 0.000000, -150.899932, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(14600, 615.179199, 1222.179199, 67.490066, 0.000000, 0.000000, -157.000167, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1438, 620.761047, 1222.660888, 65.910064, 0.000000, 0.000000, 171.500000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2969, 624.203857, 1242.079833, 67.670074, 0.000000, 0.000000, -60.399997, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2040, 629.953125, 1235.130249, 66.270072, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1271, 624.300781, 1245.208129, 66.290077, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2991, 617.029418, 1248.997802, 66.550033, 0.000000, 0.000000, 31.700008, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2991, 617.024169, 1249.006347, 67.610046, 0.000000, 0.000000, 31.500007, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1421, 617.951599, 1249.581176, 68.940071, 0.000000, 0.000000, -31.899999, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3630, 633.424072, 1226.801391, 67.470069, 0.000000, 0.000000, 120.999923, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19587, 623.576660, 1243.359985, 69.950119, 0.000000, 0.000000, 112.100006, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3675, 641.520935, 1232.670166, 68.460197, 0.000000, 0.000000, -149.699981, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3675, 640.261230, 1231.934204, 68.460197, 0.000000, 0.000000, -149.699981, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2983, 643.128356, 1232.304565, 67.324874, 0.000000, 0.000000, -148.100234, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(16088, 646.861694, 1229.963012, 66.575828, 0.000000, 0.000000, 31.200017, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19903, 638.653625, 1230.452392, 65.940071, 0.000000, 0.000000, 122.700019, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2149, 613.319030, 1242.094116, 70.435661, 0.000000, 0.000000, -53.600009, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2768, 613.677307, 1241.735351, 70.346359, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2858, 616.854614, 1236.483642, 70.309516, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2241, 614.679199, 1240.395996, 70.472518, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2245, 615.655578, 1238.642089, 70.541305, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2277, 613.208312, 1242.653320, 71.216156, 0.000000, 0.000000, -58.099994, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2400, 617.758666, 1234.908325, 70.897956, 0.000000, 0.000000, -152.900024, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11745, 610.627807, 1232.129882, 69.410820, 0.000000, 0.000000, 79.500000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1550, 611.646240, 1231.966064, 70.517211, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(348, 614.816650, 1240.056640, 70.295150, 86.600006, -82.999946, -30.999996, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1370, 621.023986, 1250.094482, 66.450027, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2921, 636.833984, 1228.927124, 71.700042, 0.000000, 0.000000, -70.899993, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19898, 631.426208, 1235.918212, 65.950035, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1575, 605.870361, 1239.812744, 69.473426, -1.399999, -62.999996, 24.499954, 40, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1805, 607.822265, 1238.268920, 69.537803, 0.000000, 0.000000, 0.000000, 40, -1, -1, 300.00, 300.00); 

	return 1;
}

