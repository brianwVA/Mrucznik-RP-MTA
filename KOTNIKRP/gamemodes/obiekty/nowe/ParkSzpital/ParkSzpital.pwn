//ParkSzpital.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: ParkSzpital.pwn ]--------------------------------------------//
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
ParkSzpital_Init() 
{
	tmpobjid = CreateDynamicObject(19377, 1240.746826, -1380.272583, 12.179224, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12802, "cunteroads2", "roadnew4_512", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.256469, -1380.272583, 12.215841, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.766845, -1380.272583, 12.252470, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12802, "cunteroads2", "roadnew4_512", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1370.643188, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12802, "cunteroads2", "roadnew4_512", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1370.643188, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1370.643188, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12802, "cunteroads2", "roadnew4_512", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1361.013183, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12802, "cunteroads2", "roadnew4_512", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1370.643188, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1351.413696, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1361.014526, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12802, "cunteroads2", "roadnew4_512", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1341.813232, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1332.193237, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1361.015014, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1322.603637, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1313.043701, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1351.386474, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1303.423706, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1240.616577, -1293.834594, 12.179686, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1351.378295, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1341.776245, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1341.780395, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1332.156616, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1322.557006, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1332.163696, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1312.937133, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1303.306396, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1322.535034, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1230.127563, -1293.697509, 12.216300, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1312.909179, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1303.307250, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1219.647338, -1293.704345, 12.252880, 0.000000, 89.799964, 179.999923, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.712158, -1295.907104, 12.045841, 0.000000, 0.000000, -0.399998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.645996, -1305.506958, 12.045841, 0.000000, 0.000000, -0.399998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.619262, -1315.127197, 12.045841, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.646240, -1324.746582, 12.045841, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.664550, -1334.267333, 12.045841, 0.000000, 0.000000, 0.199999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.718505, -1343.857055, 12.045841, 0.000000, 0.000000, 0.399998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.741333, -1353.428833, 12.045841, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.758178, -1363.018554, 12.045841, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.775146, -1372.618041, 12.045841, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1245.788452, -1380.128295, 12.045841, 0.000000, 0.000000, 0.099999, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1241.011962, -1384.898681, 12.045841, 0.000000, 0.000000, -89.199966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1220.731933, -1385.041503, 12.045841, 0.000000, 0.000000, -89.899955, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(997, 1230.700439, -1384.963500, 12.335620, 0.000000, 0.000000, 90.499984, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	tmpobjid = CreateDynamicObject(997, 1230.672363, -1381.773803, 12.335620, 0.000000, 0.000000, 90.499984, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1240.852661, -1356.150268, 12.075839, 0.000000, 0.000000, 90.300010, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1220.631713, -1356.256469, 12.075839, 0.000000, 0.000000, 90.300010, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1215.973510, -1380.309692, 12.045841, 0.000000, 0.000000, -179.599838, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1215.906127, -1370.719848, 12.045841, 0.000000, 0.000000, -179.599838, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1215.838867, -1361.080078, 12.045841, 0.000000, 0.000000, -179.599838, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1215.861938, -1351.481323, 12.045841, 0.000000, 0.000000, -179.799819, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1215.947021, -1341.973388, 12.045841, 0.000000, 0.000000, 179.300155, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1216.165771, -1329.175292, 12.045841, 0.000000, 0.000000, 179.900146, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19387, 1216.056030, -1335.577880, 14.099383, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1216.182617, -1319.555664, 12.045841, 0.000000, 0.000000, 179.900146, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1216.199707, -1309.975952, 12.045841, 0.000000, 0.000000, 179.900146, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1240.842651, -1291.150756, 12.065892, -0.099999, 0.000000, 89.700019, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1216.216796, -1300.365966, 12.045841, 0.000000, 0.000000, 179.900146, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19387, 1216.056030, -1335.577880, 14.099383, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19387, 1230.181152, -1356.187988, 14.099523, -0.199999, -0.399998, -89.300003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 1234.458129, -1356.149536, 12.080134, 0.000000, 0.000000, -90.800010, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1231.210815, -1291.040893, 12.049070, -0.099999, 0.000000, 88.900032, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 1227.025512, -1356.236206, 12.080134, 0.000000, 0.000000, -90.400016, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1221.585571, -1290.874267, 12.032253, -0.099999, 0.000000, 89.100028, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.574829, -1356.154663, 12.084563, 0.000000, 0.000000, 90.900001, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 1216.212158, -1293.996337, 12.023874, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1216.599975, -1291.692871, 12.066038, 0.000000, 0.000000, -20.600004, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	tmpobjid = CreateDynamicObject(6965, 1229.466186, -1313.208984, 15.675118, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1225.212524, -1322.995605, 12.958999, 0.000000, 0.000000, 64.600006, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1218.996215, -1315.387939, 12.958999, 0.000000, 0.000000, 11.600016, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1234.229736, -1323.033813, 12.958999, 0.000000, 0.000000, 115.300033, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1240.024658, -1315.927734, 12.958999, 0.000000, 0.000000, 166.300003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1237.830200, -1306.337524, 12.819001, 0.000000, 0.000000, -142.300003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1229.481323, -1302.397827, 12.958999, 0.000000, 0.000000, -91.500007, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1256, 1220.790527, -1306.705688, 12.958999, 0.000000, 0.000000, -36.500003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 13691, "bevcunto2_lahills", "Bow_Abattoir_Floor_Clean", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 1224.264404, -1351.853271, 13.043196, 0.000000, 0.000000, 152.300064, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1228.818969, -1354.533081, 12.751420, 0.000000, 0.000000, 0.499998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19588, 1230.175903, -1345.692016, 13.214160, 0.000000, 0.000000, -90.099998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 1222.043090, -1350.641479, 13.043196, 0.000000, 0.000000, 150.399993, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(11691, 1222.752075, -1348.783447, 12.321071, 0.000000, 0.699999, -27.699998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1231.518676, -1354.514404, 12.751420, 0.000000, 0.000000, 0.399998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(11691, 1225.408935, -1350.177856, 12.284421, 0.000000, 0.699999, -27.699998, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(19831, 1218.614868, -1346.769531, 12.341675, 0.000000, 0.000000, 104.400001, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 1238.582519, -1353.064819, 12.505913, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "purpledirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 1238.582519, -1349.674926, 12.505914, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "greendirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 1238.582519, -1346.664550, 12.505914, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "bluedirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1255, 1238.582519, -1343.534423, 12.505914, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19655, "mattubes", "purpledirt1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 1238.480712, -1351.654174, 13.665372, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_Wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 1238.480712, -1348.344238, 13.665372, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_Wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(642, 1238.480712, -1344.873535, 13.665372, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14815, "whore_main", "WH_Wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_blind", 0x00000000);
	tmpobjid = CreateDynamicObject(869, 1230.032348, -1319.915283, 12.782486, 0.000000, 0.000000, 77.699966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFF0000);
	tmpobjid = CreateDynamicObject(869, 1224.942382, -1318.427001, 12.782486, 0.000000, 0.000000, 77.699966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF9900FF);
	tmpobjid = CreateDynamicObject(869, 1223.433593, -1311.640380, 12.782486, 0.000000, 0.000000, 77.699966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFF6699);
	tmpobjid = CreateDynamicObject(869, 1224.792480, -1308.301269, 12.782486, 0.000000, 0.000000, -3.300026, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF3333FF);
	tmpobjid = CreateDynamicObject(869, 1231.633422, -1306.930786, 12.782486, 0.000000, 0.000000, 95.199966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF0000FF);
	tmpobjid = CreateDynamicObject(869, 1235.801269, -1311.496948, 12.782486, 0.000000, 0.000000, -102.100036, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF3333FF);
	tmpobjid = CreateDynamicObject(869, 1235.443603, -1315.281005, 12.782486, 0.000000, 0.000000, 77.699966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF9900FF);
	tmpobjid = CreateDynamicObject(869, 1233.412963, -1318.631347, 12.722488, 0.000000, 0.000000, 24.399963, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF0000FF);
	tmpobjid = CreateDynamicObject(869, 1227.515502, -1319.254028, 12.782486, 0.000000, 0.000000, 77.699966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF3333FF);
	tmpobjid = CreateDynamicObject(869, 1223.136108, -1315.536010, 12.782486, 0.000000, 0.000000, 77.699966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF0000FF);
	tmpobjid = CreateDynamicObject(869, 1228.038208, -1307.257934, 12.782486, 0.000000, 0.000000, 95.199966, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF9900FF);
	tmpobjid = CreateDynamicObject(869, 1233.745117, -1308.650878, 12.782482, 0.000000, 0.000000, 50.399982, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFF0000);
	tmpobjid = CreateDynamicObject(1642, 1223.040527, -1328.307617, 12.343449, 0.000000, 0.000000, -49.500003, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18869, "mobilephone5", "mobilephone5-3", 0x00000000);
	tmpobjid = CreateDynamicObject(1642, 1220.461547, -1328.557250, 12.343449, 0.000000, 0.000000, -107.899993, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19173, "samppictures", "samppicture4", 0x00000000);
	tmpobjid = CreateDynamicObject(997, 1230.644653, -1378.563964, 12.335620, 0.000000, 0.000000, 90.499984, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	tmpobjid = CreateDynamicObject(997, 1230.616455, -1375.354003, 12.335620, 0.000000, 0.000000, 90.499984, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	tmpobjid = CreateDynamicObject(8843, 1232.868774, -1387.618164, 12.220717, 1.199996, 0.699988, -0.299998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(8843, 1228.278564, -1375.278564, 12.307327, 0.199996, -1.200011, -178.200088, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1219.888916, -1349.878295, 12.144989, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(737, 1225.999023, -1352.598144, 12.144989, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1226.308105, -1352.396240, 12.020260, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1219.068115, -1350.076416, 12.020260, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1225.668090, -1350.466308, 13.223695, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1225.817993, -1350.466308, 13.223695, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1486, 1225.747924, -1350.536376, 13.223695, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 1228.627807, -1345.985595, 15.028573, 0.000000, 0.000000, -89.999931, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2244, 1224.037475, -1349.535522, 13.361373, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19143, 1225.978515, -1352.581542, 15.060256, 5.300000, 0.199999, 7.199998, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19143, 1219.989257, -1349.942016, 15.206888, -0.299998, 0.099999, -82.399925, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1665, 1221.868774, -1347.655761, 13.136246, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19897, 1222.054443, -1347.624633, 13.128002, 0.000000, 0.000000, -170.799972, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 1223.211059, -1348.851928, 13.194685, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 1222.050659, -1348.771728, 13.194685, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1546, 1224.701171, -1350.011962, 13.194685, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19819, 1224.929321, -1349.387573, 13.161412, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19819, 1225.469482, -1350.797485, 13.161412, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1230.425781, -1348.633178, 12.718167, 0.000000, 0.000000, 73.199996, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1230.664794, -1345.143432, 12.718167, 0.000000, 0.000000, 73.199996, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1230.989257, -1341.752807, 12.718167, 0.000000, 0.000000, 73.199996, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1219.323486, -1353.807861, 12.690509, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1223.033569, -1353.807861, 12.690509, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1226.073730, -1353.807861, 12.690509, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(869, 1219.323486, -1350.967651, 12.690509, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(715, 1236.506835, -1352.729248, 20.463495, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(715, 1222.862182, -1328.039428, 19.893495, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1223, 1244.534423, -1322.613769, 12.116859, 0.000000, 0.000000, 151.499969, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1223, 1244.846069, -1334.867187, 12.116859, 0.000000, 0.000000, 151.499969, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1223, 1245.033447, -1306.690429, 12.021455, 0.000000, 0.000000, -168.099990, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(647, 1216.981201, -1291.485107, 13.552697, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1231.856567, -1313.735107, 12.504781, 0.000000, 0.000000, 13.100003, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1231.663208, -1311.340087, 12.534783, 0.000000, 0.000000, -107.199996, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1229.615722, -1310.308471, 12.534783, 0.000000, 0.000000, -143.600036, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1227.581787, -1311.680175, 12.534521, 0.099999, 0.000000, 169.899963, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1226.993286, -1313.994018, 12.528409, 0.099999, 0.000000, -137.300064, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1228.286743, -1315.469726, 12.531780, 0.099999, 0.000000, -91.600013, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(870, 1230.598510, -1315.463989, 12.535812, 0.099999, 0.000000, -62.000049, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1217.511108, -1336.645263, 12.776625, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1218.431152, -1336.645263, 12.776625, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 1231.628051, -1345.985595, 15.028573, 0.000000, 0.000000, -89.999931, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1233.234008, -1312.304809, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1233.134033, -1308.794921, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1236.763916, -1311.614990, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1235.403930, -1315.595092, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1231.533935, -1319.515014, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1226.783691, -1319.515014, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1226.183593, -1315.375000, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1226.183593, -1310.224609, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19121, 1229.183715, -1305.664550, 12.074064, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1216.591186, -1336.645263, 12.776625, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(715, 1241.567016, -1336.079345, 20.463495, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1216.591186, -1334.495117, 12.776625, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1217.511108, -1334.475219, 12.776625, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19122, 1218.431152, -1334.425415, 12.776625, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19143, 1222.615356, -1328.146606, 15.413158, -34.599998, -0.499998, -135.299972, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(715, 1241.567016, -1320.309326, 20.463495, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(708, 1221.456298, -1296.282226, 8.568655, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(708, 1228.075927, -1296.282226, 8.568655, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(708, 1237.416259, -1296.282226, 8.568655, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(708, 1237.416259, -1296.282226, 8.568655, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18688, 1218.856079, -1346.742919, 12.008523, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
}

ParkSzpital_Connect(playerid)
{
	RemoveBuildingForPlayer(playerid, 620, 1222.660, -1335.050, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 739, 1231.140, -1341.849, 12.734, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1240.920, -1356.550, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1240.920, -1374.609, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 739, 1231.140, -1356.209, 12.734, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1222.660, -1356.550, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1240.920, -1335.050, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 739, 1231.140, -1328.089, 12.734, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1240.920, -1317.739, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1240.920, -1300.920, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1222.660, -1300.920, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1222.660, -1317.739, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1222.660, -1374.609, 12.296, 0.250);
	RemoveBuildingForPlayer(playerid, 5812, 1230.890, -1337.979, 12.539, 0.250);
	RemoveBuildingForPlayer(playerid, 5929, 1230.890, -1337.979, 12.539, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 1231.640, -1389.869, 15.671, 0.250);	
}
