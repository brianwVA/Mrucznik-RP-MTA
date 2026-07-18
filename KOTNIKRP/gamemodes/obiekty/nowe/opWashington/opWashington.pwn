//opWashington.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: opWashington.pwn ]--------------------------------------------//
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
opWashington_Init()
{
	tmpobjid = CreateDynamicObject(19433, 2272.191650, 151.755218, 24.724365, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2273.791503, 151.758026, 24.737161, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2275.381591, 151.760803, 24.739936, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2276.980957, 151.763626, 24.742734, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2278.571289, 151.766387, 24.745512, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2280.171630, 151.769195, 24.748304, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2281.761718, 151.772018, 24.751083, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2283.361083, 151.774887, 24.753879, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2284.960693, 151.777709, 24.756673, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2286.561767, 151.780471, 24.759460, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2288.163085, 151.783264, 24.762252, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2295.610351, 151.796279, 24.785259, -0.099999, 0.099999, 90.099983, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2296.285156, 153.220809, 24.712011, 7.900000, 0.099999, -0.900013, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2296.283447, 154.774627, 24.913768, 6.699998, 0.099999, 0.699985, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2296.266845, 156.385635, 25.129959, 7.599999, 0.099999, -0.500012, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2296.247070, 159.484985, 25.445695, 5.300002, 0.099999, 0.699985, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 2296.266357, 157.881988, 25.296976, 5.300002, 0.099999, 0.699985, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(18880, 2296.234375, 152.021591, 26.484714, 179.000000, 4.199998, 1.799958, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	tmpobjid = CreateDynamicObject(647, 2296.407226, 151.895874, 26.435052, 0.000000, 0.000000, -21.599994, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 2277.145507, 155.712615, 26.527185, 1.099998, -4.399999, 60.099994, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "cj_sheetmetal", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2273.924560, 154.352737, 25.588155, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2273.924560, 157.132720, 25.828161, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19121, 2275.265380, 155.402709, 25.638156, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(3407, 2287.157226, 154.335067, 25.996805, 0.000000, 0.000000, 123.200012, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(2115, 2281.920410, 174.576629, 26.601104, 0.000000, 0.000000, 90.299987, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2283.454833, 174.583343, 27.233608, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2283.454833, 175.733367, 27.233608, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2280.374267, 174.578018, 27.233608, 0.000000, 0.000000, -177.099975, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(2120, 2280.336669, 175.727600, 27.233608, 0.000000, 0.000000, -179.999969, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19818, 2282.078125, 175.468902, 27.481647, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "ab_wallpaper02", 0x00000000);
	tmpobjid = CreateDynamicObject(19818, 2281.627929, 175.468902, 27.481647, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "ab_wallpaper02", 0x00000000);
	tmpobjid = CreateDynamicObject(19818, 2281.627929, 174.358947, 27.481647, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "ab_wallpaper02", 0x00000000);
	tmpobjid = CreateDynamicObject(19818, 2282.068359, 174.298934, 27.481647, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "ab_wallpaper02", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 2281.588378, 174.621398, 27.392110, 0.000000, 0.000000, -88.799980, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 19173, "samppictures", "samppicture3", 0x00000000);
	tmpobjid = CreateDynamicObject(2830, 2282.141357, 175.771102, 27.395610, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 11150, "ab_acc_control", "ws_shipmetal5", 0x00000000);
	tmpobjid = CreateDynamicObject(2830, 2281.650878, 175.771102, 27.395610, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 11150, "ab_acc_control", "ws_shipmetal5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 11150, "ab_acc_control", "ws_shipmetal5", 0x00000000);
	tmpobjid = CreateDynamicObject(2830, 2282.141357, 174.621093, 27.395610, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 11150, "ab_acc_control", "ws_shipmetal5", 0x00000000);
	tmpobjid = CreateDynamicObject(2293, 2289.543212, 170.388320, 27.441642, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(2293, 2289.543212, 169.108261, 27.441642, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 2290.673583, 169.375411, 27.831649, 0.000000, 0.000000, 0.399998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 2288.927490, 171.065567, 27.840501, 0.000000, 0.000000, -88.900009, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 2283.832763, 169.327713, 27.831649, 0.000000, 0.000000, 0.399998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19080, "laserpointer2", "laserbeam-2-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2290.437255, 168.214645, 27.071640, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2290.437255, 168.924652, 27.071640, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2290.437255, 170.824645, 27.071640, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19122, 2290.437255, 169.964645, 27.071640, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(949, 2287.001464, 168.505905, 28.061645, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(949, 2284.671142, 168.505905, 28.061645, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(869, 2291.389648, 176.203948, 27.158685, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3946, "bistro_plants", "starflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 2278.806396, 178.452865, 26.637310, 0.000000, 0.000000, 21.900001, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(647, 2275.625732, 177.588912, 28.036071, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = CreateDynamicObject(869, 2274.190429, 153.842636, 26.104518, 3.299999, -1.399999, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2274.188476, 156.423767, 26.333452, 3.299999, -1.399999, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(738, 2274.019042, 155.571563, 25.679534, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14400, 2278.127685, 153.831787, 25.887865, 0.000000, 0.000000, -176.599975, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3931, 2287.902587, 155.721389, 25.635616, 0.000000, 0.000000, -22.699998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3931, 2287.298583, 156.451477, 25.765617, 0.000000, 0.000000, -22.699998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3931, 2286.621093, 157.266326, 25.935617, 0.000000, 0.000000, -22.699998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(3931, 2286.309326, 158.155227, 26.085617, 0.000000, 0.000000, -22.699998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2288.353271, 159.579742, 26.731250, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2288.353271, 158.259780, 26.481248, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2288.353271, 157.129745, 26.321243, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2277.508056, 158.244873, 26.539739, 3.299999, -1.399999, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2288.353271, 152.459747, 25.551237, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2288.353271, 153.389755, 25.691236, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2288.353271, 154.399765, 25.801239, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2274.184082, 158.499893, 26.633413, 3.299999, -1.399999, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19824, 2281.865478, 175.141525, 27.381649, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(715, 2292.463378, 176.697280, 34.304729, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 2291.389648, 178.903976, 27.158685, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 2284.296875, 170.834869, 27.541643, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2281.090576, 179.867767, 26.519762, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2286.570556, 179.867767, 26.519762, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2292.600585, 179.867767, 26.519762, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 2275.160644, 179.867767, 26.519762, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2933, 2291.735107, 151.773986, 24.787334, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5631, "apartmentalpha", "ws_railing1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	DodajBrame(tmpobjid,
		2291.735107, 151.773986, 20.077329, 0.000000, 0.000000, 0.000000,
		2291.735107, 151.773986, 24.787334, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_HOUSEOWNER, 831);
}

opWashington_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 1408, 2285.399, 151.813, 26.015, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2279.860, 151.813, 26.015, 0.250);
	RemoveBuildingForPlayer(playerid, 766, 2279.879, 155.171, 25.476, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2274.330, 151.813, 26.015, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2296.270, 156.983, 26.867, 0.250);
	RemoveBuildingForPlayer(playerid, 780, 2289.679, 176.063, 26.312, 0.250);
}
