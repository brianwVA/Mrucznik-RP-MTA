//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ actorsOnWorld ]---------------------------------------------//
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
// Autor: Simeone
// Data utworzenia: W ciul dawno

/*
Aby stworzyć na serwerze Actora wykorzystaj poniższą funkcję, a następnie wklep ją w PushActors. 

CreateActorEx(actorIDs, const aName[], Float:aX, Float:aY, Float:aZ, Float:aR, aInvulnerable, aStreamDistance, aVW, aINT, aPlayer)

Objaśnienia argumentów:
actorIDs - ID skina actora,
aName - nick (MAXPLAYERNAME)
aX, aY, aZ - pozycje gdzie Actor ma domyślnie stać x,y,z
aR - pozycja obrócenia actora
aInvulnerable - nieśmiertelność
aStreamDistance - odległość w jakiej Actor będzie "narysowany"/"widoczny" 
aVw - Virtual World actora
aINT - Interior actora
aPlayer - dla jakiego gracza ma zostać stworzony, ustaw -1 jeśli dla wszystkich, bądź poszczególne wartości na ID. 
*/ 
//Load:
/*PushActors()
{
	CreateActorEx(305, "Jon_Goal", -2080.0237,-430.3130,104.8052,266.7092, 1, 15.0, 0, 0, -1,  AGROUP_DEFAULT); 
	CreateActorEx(11, "Angelica_Dickens", 833.8511,-1391.2689,-17.6433,93.0610, 1, 25.0, 71, -1, -1,  AGROUP_DEFAULT); //vinyl barman góra
	CreateActorEx(189, "Patrick_Yellow", 800.8901,-1410.6635,-22.6093,271.9528, 1, 25.0, 71, -1, -1,  AGROUP_DEFAULT); //vinyl barmanka dół
	CreateActorEx(165, "Roger_Bike", 798.8154,-1403.3728,-22.6193,272.0977, 1, 25.0, 71, -1, -1,  AGROUP_DEFAULT); //vinyl staff - vip
	CreateActorEx(217, "Jan_Polish", 816.3592,-1384.7954,-20.1095,177.6383, 1, 25.0, 71, -1, -1,  AGROUP_DEFAULT); //vinyl staff - konsola
	CreateActorEx(88, "Leonardo_Lorenz", 1197.0911,-1772.3119,13.7282, 0, 1, 25.0, 43, -1, -1,  AGROUP_DEFAULT);  
	CreateActorEx(129, "Beate_Goth", 809.4175,-1420.2585,-22.6193,268.8190, 1, 25.0, 72, -1, -1,  AGROUP_DEFAULT);  

	//Na event Los Santos-MMA
	CreateActorEx(217, "Mariusz_Trump", 2766.1125,-1438.2677,67.7845,2.7868, 1, 25.0, 2, -1, -1,  AGROUP_DEFAULT);  
	CreateActorEx(211, "Roksana_Wegiel", 433.2737,-1415.4435,51.0105,125.0213, 1, 25.0, 1, -1, -1,  AGROUP_DEFAULT);  
	CreateActorEx(32, "Adam_Vector", 2776.5264,-1429.2460,67.7845,183.8717, 1, 25.0, 2, -1, -1,  AGROUP_DEFAULT);  

	//Więzienie stanowe {XD} {very funny}
	CreateActorEx(287, "James_Coal", -509.8135,2603.0234,69.7385,265.0590, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT);  //wieza 1
	CreateActorEx(287, "Simon_Verwest", -509.0591,2582.5391,61.3385,269.7825, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT);  //wieza 2
	CreateActorEx(287, "Matthew_Gusto", -515.1072,2548.0283,61.3400,35.7671, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT);  //wieza 3
	CreateActorEx(287, "Nikhay_Loikovic", -548.8246,2542.5515,69.7385,234.6890, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT);  //wieza 4
	CreateActorEx(287, "Aaron_Scott",-555.5360,2589.3965,53.6603,274.9643, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT);  //wejscie left
	CreateActorEx(287, "Michael_Brother", -555.5648,2591.7900,53.6603,267.7575, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT); //wejscie right
	CreateActorEx(287, "Jacob_Horseradish", -584.6313,2576.7729,53.7003,88.8423, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT);  //Palacz 1
	CreateActorEx(283, "Rafael_Jamesaw", -584.9884,2574.2271,53.7003,340.6198, 1, 100.0, 0, 0, -1,  AGROUP_DEFAULT); //Palacz 2
	CreateActorEx(287, "Dominic_How", -569.9664,2610.1797,53.6603,357.3949, 1, 50.0, 0, 0, -1,  AGROUP_DEFAULT);  //wyjscie na spacerniak
	CreateActorEx(287, "Francis_White", -573.7086,2610.5989,53.6603,317.6012, 1, 50.0, 0, 0, -1,  AGROUP_DEFAULT); //wyjscie na specerniak 2
	CreateActorEx(107, "Kendrick_Keyn", -508.1606,2615.5796,53.6603,106.4124, 1, 50.0, 0, 0, -1,  AGROUP_DEFAULT); //Groove
	CreateActorEx(109, "Rafael_Sock", -542.8791,2628.2600,53.6603,232.5419, 1, 50.0, 0, 0, -1,  AGROUP_DEFAULT); //VAGOS
	CreateActorEx(287, "Pavlo_Rudovy", -556.6976,2594.1780,86.1356,277.4148, 1, 50.0, 1, 0, -1,  AGROUP_DEFAULT);  //Winda 1
	CreateActorEx(287, "Michael_East", -556.5135,2599.4041,86.1356,271.4614, 1, 50.0, 1, 0, -1,  AGROUP_DEFAULT); //Winda 2
	CreateActorEx(287, "Jeffrey_Dog", -547.5727,2589.8755,86.1356,1.0523, 1, 50.0, 1, 0, -1,  AGROUP_DEFAULT); //Wyjscie na spacerniak
	//West Eagle Pub
	CreateActorEx(76, "Dominika_Czaders", 503.0299,-1490.4990,14.6606, 269.4052, 1, 50.0, 61, -1, -1,  AGROUP_DEFAULT); 
	//Firma Budowlana
	CreateActorEx(76, "Frank_Pletenburg", 947.5116,-1738.7377,13.5754,88.3839, 1, 50.0, 41, -1, -1,  AGROUP_DEFAULT); 
	//IBIZA
	CreateActorEx(172, "Nancy_Pig", 402.8168, -1807.7854, 7.8789, 90.0, 1, 50.0, 21, -1, -1,  AGROUP_DEFAULT); 
	CreateActorEx(194, "Lillie_Pen", 402.6997, -1810.4082, 7.8789, 90.0, 1, 50.0, 21, -1, -1,  AGROUP_DEFAULT); 
	//Power Gym
	CreateActorEx(291, "Michael_Karmowsky", 900.2252, -1341.4918, 13.5940, 324.5591, 1, 50.0, 21, -1, -1,  AGROUP_DEFAULT); 
	//Urzad Miasta Los Santos
	CreateActorEx(60, "Andre_Bogucallo", 1455.7231, -1792.1993, 77.9612+10, 89.1325, 1, 40.0, 50, -1, -1,  AGROUP_DMV);  //1 
	CreateActorEx(147, "Mark_Meon", 1455.7333,-1795.4087,77.9612+10,88.5058, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //2
	CreateActorEx(59, "Cristiano_Carlos", 1455.7354,-1798.5978,77.9612+10,88.5058, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //3
	CreateActorEx(169, "Marie_Cat", 1455.7334,-1801.7968,77.9502+10,88.5058, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //4
	CreateActorEx(165, "Jordan_Fredson", 1445.2711,-1791.3987,77.9502+10,269.9041, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //5
	CreateActorEx(150, "Susan_Water", 1445.2773,-1794.7145,77.9612+10,269.9041, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //6
	CreateActorEx(57, "Peter_Joe", 1445.3197,-1797.8114,77.9612+10,269.9041, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //7
	CreateActorEx(98, "Harry_Brown", 1445.2811,-1801.1071,77.9612+10,269.9041, 1, 40.0, 50, -1, -1,  AGROUP_DMV); //8

	//GSA
	CreateActorEx(20002, "Matthew_Amstaf", 1541.1328,-1452.5272,21.7028, 157.9058, 1, 40.0, 43, -1, -1, AGROUP_DEFAULT); 
	CreateActorEx(88, "Leia_Lake", 1515.5507,-1470.4158,14.2133, 175.0911, 1, 40.0, 41, -1, -1, AGROUP_DEFAULT); 
	CreateActorEx(93, "Betty_Boost", 1525.1969,-1460.8966,14.2133,83.2602, 1, 40.0, 41, -1, -1, AGROUP_DEFAULT, "INT_OFFICE", "OFF_Sit_Type_Loop"); 
	CreateActorEx(20305, "Zroy_Rea", 1527.0894,-1461.7399,21.7028,180.2978, 1, 40.0, 43, -1, -1, AGROUP_DEFAULT, "PED", "SEAT_idle"); 
	//Hippie Club
	CreateActorEx(151, "Katarina_Belmore", 1260.5381,-1549.7122,3.1509,6.0556, 1, 40.0, 40, -1, -1, AGROUP_DEFAULT); 
	CreateActorEx(158, "Simon_Mountain", 1270.5703,-1538.4010,3.1410,148.9137, 1, 40.0, 40, -1, -1, AGROUP_DEFAULT);
	CreateActorEx(178, "Sabrine_Box", 1258.4135,-1530.4537,0.8010,215.9444, 1, 40.0, 40, -1, -1, AGROUP_DEFAULT);
	CreateActorEx(191, "Carla_Huawei", 1264.1796,-1519.7985,-0.3290,12.6125, 1, 40.0, 40, -1, -1, AGROUP_DEFAULT); 
	CreateActorEx(165, "Jacob_Horseradi", 1263.7649,-1522.7013,-0.3350,177.9090, 1, 40.0, 40, -1, -1, AGROUP_DEFAULT);
	CreateActorEx(166, "Joe_Pea", 1265.3063,-1547.7554,3.1350,269.1132, 1, 40.0, 40, -1, -1, AGROUP_DEFAULT); 
	//LSPD komisariat
	CreateActorEx(281, "Josh_Camert", 1583.8292,-1677.2463,62.2463,87.8659, 1, 40.0, 25, -1, -1, AGROUP_DEFAULT, "COP_AMBIENT", "Coplook_loop");

	CreateActorEx(219, "Lynda_Davidosn", 2241.0510, -1168.8594, 35.4968, 85.5873, 1, 40.0, 4301, -1, -1, AGROUP_DEFAULT);
}*/