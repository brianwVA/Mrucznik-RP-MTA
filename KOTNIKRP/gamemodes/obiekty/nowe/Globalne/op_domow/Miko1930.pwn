//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: domid1930.pwn ]------------------------------------------//
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

//-----------------<[ Główne funkcje: ]>-------------------
domid1930_Init()
{
	StworzObiekty();
	return 1;
}
domid1930_Connect(playerid)
{
    UsunObiekty(playerid);
    return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
    tmpobjid = CreateDynamicObject(1492, 1029.781860, -649.194458, 117.627204, 0.000000, 0.000000, 366.899993, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 1032.085083, -648.898925, 118.367149, 0.000000, 0.000000, 99.099899, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "hedge2_128", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 1033.674682, -648.644409, 118.367149, 0.000000, 0.000000, 99.099899, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "hedge2_128", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1032.296264, -661.570739, 119.817024, 0.000000, 90.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1031.844604, -658.100830, 119.816978, 0.000000, 90.000000, 97.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1030.611328, -661.789489, 118.296798, 90.000000, 270.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1030.158203, -658.320373, 118.296798, 90.000000, 270.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1032.494140, -663.400024, 118.296798, 90.000000, 270.000000, 547.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1033.892944, -661.362731, 118.296798, 90.000000, 270.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1033.441406, -657.892272, 118.296798, 90.000000, 270.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1031.588256, -656.429931, 118.296798, 90.000000, 270.000000, 547.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
    tmpobjid = CreateDynamicObject(19466, 1032.066162, -663.461181, 120.252014, 0.000000, 0.000000, 97.200035, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
    tmpobjid = CreateDynamicObject(18880, 1030.906494, -663.556579, 123.118522, 0.000000, 180.000000, 8.199995, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19466, 1030.686523, -662.355224, 120.252014, 0.000000, 0.000000, 187.200042, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
    tmpobjid = CreateDynamicObject(19466, 1030.404296, -660.133300, 120.252014, 0.000000, 0.000000, 187.200042, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
    tmpobjid = CreateDynamicObject(19466, 1030.122192, -657.912109, 120.252014, 0.000000, 0.000000, 187.200042, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
    tmpobjid = CreateDynamicObject(18880, 1030.041259, -656.913635, 123.118530, 0.000000, 180.000000, 8.199995, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(19466, 1031.213134, -656.715332, 120.252014, 0.000000, 0.000000, 97.200035, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
    tmpobjid = CreateDynamicObject(18880, 1032.461181, -656.614990, 123.128440, 0.000000, 180.000000, 8.199995, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(18880, 1033.285766, -663.252807, 123.118499, 0.000000, 180.000000, 8.199995, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(11685, 1030.887817, -659.774108, 119.867240, 0.000000, 0.000000, 97.499908, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling3", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 14668, "711c", "gun_ceiling3", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 14668, "711c", "gun_ceiling3", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1032.171997, -661.768005, 123.027290, 0.000000, 90.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
    tmpobjid = CreateDynamicObject(19366, 1031.717041, -658.299804, 123.027313, 0.000000, 90.000000, 457.399902, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
    tmpobjid = CreateDynamicObject(11685, 1030.723022, -658.515014, 119.867240, 0.000000, 0.000000, 97.499908, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling3", 0x00000000);
    tmpobjid = CreateDynamicObject(11682, 1030.638549, -657.529479, 119.862907, 0.000000, 0.000000, 98.299873, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling3", 0x00000000);
    tmpobjid = CreateDynamicObject(2293, 1032.182495, -657.253601, 119.902915, 0.000000, 0.000000, -81.999954, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19523, "sampicons", "reeedgrad32", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14668, "711c", "gun_ceiling3", 0x00000000);
    tmpobjid = CreateDynamicObject(19831, 1031.353271, -662.991455, 119.837280, 0.000000, 0.000000, 144.199569, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18885, "gunvendingmachine1", "vendredmetal", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_metalpanel1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_metalpanel1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 16640, "a51", "ws_metalpanel1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 5, 16640, "a51", "ws_metalpanel1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 6, 16640, "a51", "ws_metalpanel1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 7, 16640, "a51", "ws_metalpanel1", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 1064.796630, -647.585937, 118.367149, 0.000000, 0.000000, 99.099899, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "hedge2_128", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 1063.214843, -647.841857, 118.367149, 0.000000, 0.000000, 99.099899, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "hedge2_128", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 1061.632812, -648.093200, 118.367149, 0.000000, 0.000000, 99.099899, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "hedge2_128", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    tmpobjid = CreateDynamicObject(19433, 1060.051513, -648.347473, 118.367149, 0.000000, 0.000000, 99.099899, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1597, "centralresac1", "hedge2_128", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 1052.113281, -624.973754, 115.995849, 7.099996, 0.000000, 101.399955, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 1042.747558, -626.862792, 117.186080, 7.099996, 0.000000, 101.399955, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 1033.544189, -629.076354, 118.032066, 3.199999, 0.000000, 105.299980, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
    tmpobjid = CreateDynamicObject(19447, 1062.448486, -628.027160, 114.816635, 0.200002, -2.599999, 191.399963, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
    tmpobjid = CreateDynamicObject(1472, 1033.783569, -661.638549, 119.487281, 0.000000, 0.000000, 96.700111, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 1057.276367, -657.557861, 119.837158, 0.000000, 0.000000, -58.699855, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    tmpobjid = CreateDynamicObject(1827, 1032.682373, -659.118408, 119.910629, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1670, 1032.402954, -658.799316, 120.357231, 0.000000, 0.000000, -134.599990, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1034.059692, -663.136840, 119.800537, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19124, 1033.168823, -656.365539, 119.800537, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19882, 1031.512573, -663.077941, 120.672920, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19882, 1031.202270, -662.827697, 120.672920, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19563, 1032.522216, -659.107421, 120.330657, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1666, 1032.242797, -659.563293, 120.422943, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1666, 1032.042602, -659.323059, 120.422943, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19563, 1032.772460, -659.307617, 120.330657, 0.000000, 0.000000, 34.999992, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2814, 1032.950927, -658.797729, 120.337272, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2964, 1042.664062, -658.379760, 119.060539, 0.000000, 0.000000, -45.500061, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2995, 1043.115600, -658.265991, 119.977172, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2997, 1042.450317, -658.203979, 119.987319, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3000, 1042.490356, -658.484252, 119.997268, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3100, 1043.311157, -658.864624, 119.987159, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3106, 1042.229003, -658.269287, 119.987152, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3003, 1042.529174, -658.870544, 119.987319, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(638, 1063.778442, -648.310974, 119.757278, 0.000000, 0.000000, 99.999900, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(638, 1060.989501, -648.800292, 119.757278, 0.000000, 0.000000, 99.999900, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1364, 1062.716796, -652.654663, 119.767227, 0.000000, 0.000000, -112.299781, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(870, 1054.590698, -656.180603, 119.307220, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(870, 1057.663696, -655.289733, 119.307220, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(714, 1062.593261, -634.053222, 116.751350, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(631, 1043.815429, -642.982727, 120.037231, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(631, 1046.668090, -642.462219, 120.037231, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
    tmpobjid =CreateDynamicObject(19870, 1061.481567, -623.289794, 114.796684, 0.000000, -7.099996, -171.699722, 0, 0, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
    DodajBrame(tmpobjid,
    1061.232543, -623.327148, 112.772117, 0.000000, -7.099996, -171.699722,
    1061.481567, -623.289794, 114.796684, 0.000000, -7.099996, -171.699722,
    2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 1930);  
    return 1;
}

static UsunObiekty(playerid)
{
    RemoveBuildingForPlayer(playerid, 621, 1034.199, -660.710, 118.484, 0.250);
    RemoveBuildingForPlayer(playerid, 710, 1055.680, -656.468, 134.358, 0.250);
    RemoveBuildingForPlayer(playerid, 672, 1031.989, -632.078, 119.960, 0.250);
    return 1;
}