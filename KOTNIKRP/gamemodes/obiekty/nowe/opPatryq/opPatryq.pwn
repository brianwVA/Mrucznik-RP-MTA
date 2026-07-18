//opPatryq.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opPatryq.pwn ]--------------------------------------------//
//Autor: Lilka
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
opPatryq_Init()
{
	tmpobjid = CreateDynamicObject(19362, 2340.321533, 731.298828, 9.119756, 3.099998, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 2340.321533, 726.883605, 8.910688, 3.099997, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(1757, 2337.192626, 727.042480, 9.973640, 0.000000, 0.000000, 179.700012, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(1757, 2334.345214, 728.159362, 9.973640, 0.000000, 0.000000, 89.299980, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(2030, 2336.316650, 729.056213, 10.379094, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2336.360107, 728.415527, 10.774634, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil2-128x128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19173, "samppictures", "samppicture1", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 2336.461669, 732.125061, 10.167949, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2725, 2337.897705, 732.144653, 10.702848, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2334.473632, 726.323974, 9.617974, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2332.883789, 730.544128, 9.807974, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2332.783935, 726.964111, 9.557973, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(3461, 2339.300537, 726.810852, 10.486004, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(3461, 2338.210449, 726.810852, 10.476002, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(15038, 2335.203613, 733.406738, 11.459374, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(15038, 2336.673095, 733.406738, 11.459374, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(15038, 2338.213378, 733.406738, 11.459374, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(15038, 2339.923583, 733.406738, 11.459374, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 2342.813964, 732.096435, 10.939781, 0.000000, 0.000000, 0.500000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sjmpostbar3", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2344.507080, 733.478088, 10.579375, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2343.237060, 733.478088, 10.579375, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2341.727050, 733.478088, 10.579375, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1339, 2346.162597, 734.314331, 11.098291, 0.000000, 0.000000, 90.500000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(3407, 2349.315917, 727.369201, 10.046958, 0.000000, 0.000000, 47.699996, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(1641, 2346.361328, 736.389526, 10.478294, 0.000000, 0.000000, 90.499977, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	tmpobjid = CreateDynamicObject(3532, 2345.966796, 724.049804, 10.423089, 0.000000, 0.000000, 88.399986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(3532, 2341.538574, 724.173583, 10.423089, 0.000000, 0.000000, 88.399986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(3532, 2337.210205, 724.294494, 10.423089, 0.000000, 0.000000, 88.399986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(3532, 2333.881103, 724.387512, 10.423089, 0.000000, 0.000000, 88.399986, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 4830, "airport2", "bevflower2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(1667, 2336.110595, 728.718383, 10.894227, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1667, 2335.800537, 729.358459, 10.894227, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19822, 2336.315185, 729.103210, 10.764229, 0.000000, 0.000000, 158.900024, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1665, 2336.434082, 729.360900, 10.814636, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19824, 2336.172363, 729.141662, 10.764312, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19564, 2337.860107, 731.939819, 11.133613, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2768, 2338.100341, 732.140136, 11.193616, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1544, 2337.749511, 732.159423, 11.113615, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1544, 2337.909667, 732.159423, 11.113615, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2333.231689, 731.415832, 10.354804, -2.600002, 0.000000, 58.899990, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 2332.943115, 727.116821, 10.086399, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 2332.943115, 728.886840, 10.086399, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2333.047851, 727.496826, 10.019160, -2.600002, 0.000000, 58.899990, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3532, 2346.854980, 726.105773, 10.643089, 0.000000, 0.000000, 88.399986, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3532, 2343.105957, 726.210510, 10.643089, 0.000000, 0.000000, 88.399986, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(861, 2344.576904, 732.429260, 10.182028, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(861, 2340.986816, 732.429260, 10.182028, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 2353.687255, 742.945007, 14.278293, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 2353.687255, 740.764709, 14.278293, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 2353.687255, 738.784790, 14.278293, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1073, 2353.531494, 744.739624, 11.588289, 0.000000, 0.000000, -86.199989, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1080, 2355.070312, 744.758300, 12.828294, 0.000000, 0.000000, -88.899993, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19815, 2352.767089, 740.895812, 12.498292, 0.000000, 0.000000, 90.799980, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2001, 2347.851806, 736.535400, 10.468292, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2355.583251, 733.571105, 13.587498, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2353.442871, 733.571105, 13.627499, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2351.293457, 733.571105, 13.677499, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2349.183105, 733.571105, 13.717499, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2347.083496, 733.571105, 13.727499, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2344.983886, 733.571105, 13.747501, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2342.854003, 733.571105, 13.777502, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2340.704345, 733.571105, 13.787502, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2338.563964, 733.571105, 13.817502, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2336.423828, 733.571105, 13.777504, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 2335.123779, 733.571105, 13.777504, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 2333.219970, 729.050659, 9.795669, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14469, 2354.293701, 750.901184, 10.738823, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14469, 2349.524169, 750.901184, 10.738823, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14469, 2344.814697, 750.901184, 10.738823, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14469, 2339.415039, 750.901184, 10.738823, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(657, 2332.662109, 750.748535, 10.079833, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14469, 2334.174316, 750.901184, 10.738823, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
}

