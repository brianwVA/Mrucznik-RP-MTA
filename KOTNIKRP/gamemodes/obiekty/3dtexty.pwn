//3dtexty.pwn

Zaladuj3DTexty()
{
	//wybory
	//CreateDynamic3DTextLabel("Urna wyborcza", 0x33CCFFAA, 1304.1296, -1299.9874, 35.6941, 25.0);
	CreateDynamic3DTextLabel("Aby kupić jedzenie wpisz /kupjedzenie", COLOR_WHITE, 369.67, -6.65, 1001.85, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1, 9, -1); // cluckin bell idlewood
	okienko[0] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 1 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1454.55847, -1792.14673, 79.56396,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[1] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 2 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1454.59851, -1795.38660, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[2] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 3 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1454.59851, -1798.56665, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[3] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 4 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1454.59814, -1801.72668, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[4] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 5 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1446.32007, -1791.37695, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[5] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 6 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1446.32007, -1794.63696, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[6] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 7 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1446.32007, -1797.8570, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	okienko[7] = CreateDynamic3DTextLabel("Urząd Miasta Los Santos\n{0080FF}Okienko 8 \n {FF0000}[Wpisz /kuplicencje]",COLOR_WHITE,1446.32007, -1800.9770, 79.56400,9,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);
	
	RybyTop = CreateDynamic3DTextLabel("Największe ryby:", COLOR_WHITE, 837.64, -2065.83, 14.31, 15);

    //CreateDynamic3DTextLabel("Weź zlecenie - PIZZA", 0xFFA500AA, 2103.8123,-1798.7085,13.6504,30.0);//PizzaJob
	//nowe domy 3dtext biznesów
	CreateDynamic3DTextLabel("Oczysczanie z zarzutow", 0x33CCFFAA, 246.3568,120.3933,1003.2682, 10.0); //Clear icon in Police Station
	//CreateDynamic3DTextLabel("/kuppozwolenie", 0x42F5C5AA, 1582.4530,-1678.2080,63.5498, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 25);
	CreateDynamic3DTextLabel("/kupbilet", 0x42F5C5AA, 401.07, -1809.11, 9.41, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 21);
	CreateDynamic3DTextLabel("Urząd Miasta", 0x9ACD32AA, 1310.0885, -1367.6865, 13.8504, 50.0); //City Hall
	CreateDynamic3DTextLabel("Urząd Miasta - zaplecze", 0x9ACD32AA, 1285.5134, -1329.1538, 13.5492, 10.0); //City Hall
	//CreateDynamic3DTextLabel("Praca Łowcy Nagród", 0xFFA500AA, 322.3034,317.0233,999.1484, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 5); //Detective Registration
	//CreateDynamic3DTextLabel("Praca Prawnika", 0xFFA500AA, 310.3626,-1503.3282,13.8096, 10.0); //Lawyer Registration
	CreateDynamic3DTextLabel("Praca Dziwki", 0xFFA500AA, 1215.1304,-11.8431,1000.9219, 15.0); //Whore Registration
	CreateDynamic3DTextLabel("Praca Dilera Dragow", 0xFFA500AA, 2166.3772,-1675.3829,15.0859, 30.0); //DrugDealer Registration
	CreateDynamic3DTextLabel("Praca Zlodzieja Aut", 0xFFA500AA, 1109.3318,-1796.3042,16.5938, 30.0); //CarJacker Registration 7
	//CreateDynamic3DTextLabel("Praca Mechanika", 0xFFA500AA, -1932.3859,276.2117,41.0391,30.0); //CarMechanic Registration
	//CreateDynamic3DTextLabel("Praca Mechanika", 0xFFA500AA, 1740.9182,-1757.5448,13.5289,30.0); //CarMechanic Registration
	//CreateDynamic3DTextLabel("Praca Ochroniarza", 0xFFA500AA, 2226.1716,-1718.1792,13.5165, 30.0); //BodyGuard Registration
	CreateDynamic3DTextLabel("Praca Dilera Broni", 0xFFA500AA, 1366.4325,-1275.2096,13.5469, 30.0); //ArmsDealer Registration
	//CreateDynamic3DTextLabel("Praca Dilera Aut", 0xFFA500AA, 531.7930,-1292.4044,17.2422, 30.0); //CarDealer Registration 12
	//CreateDynamic3DTextLabel("Praca Boksera", 0xFFA500AA, 766.0804,14.5133,1000.7004, 30.0); //Boxer Registration
	//CreateDynamic3DTextLabel("Praca Kierowcy Autobusu", 0xFFA500AA, 1154.2208,-1770.8203,16.5992, 10.0); //BusDriver Registration
	//CreateDynamic3DTextLabel("Praca Taksówkarza\nMożliwośc podjęcia tej\npracy została wyłączona\nna czas nieokreślony.", 0xFFA500AA, 1750.7670,-1944.7601,13.5655, 20.0); //BusDriver Registration
	//CreateDynamic3DTextLabel("Praca Truckera", 0xFFA500AA, -77.7288,-1136.3896,1.0781, 30.0); //Trucker Registration
	CreateDynamic3DTextLabel("Melina Dragowa", 0xFFA500AA, 323.0342,1118.5804,1083.8828, 30.0); //Getting Drugs for DrugDealers 17
    CreateDynamic3DTextLabel("Paczka z ziołem\n/get drugs", 0xFFA500AA, -1022.34930420,-2158.46484375,33.91813278, 30.0);
	CreateDynamic3DTextLabel("Helvetica Cargo Ltd.", 0xAA3333AA, 597.1277,-1248.6479,18.2734, 50.0);
	CreateDynamic3DTextLabel("Fabryka Broni", 0xAA3333AA, -2119.5469,-178.5679,35.3203, 50.0); //Factory SF
	CreateDynamic3DTextLabel("Kościół", COLOR_NEWS, 2254.8652,-1334.2078,23.9922, 30.0); //Kościół
	//CreateDynamic3DTextLabel("Ołtarz", COLOR_NEWS, 1964.2332,-369.1353,1093.7289, 10.0); //Kościół
	CreateDynamic3DTextLabel("Kosciół w Palomino Creek [/slub]", COLOR_NEWS, 2256.8000488281,-43.900001525879,26.5, 10.0); //Kościół
	//CreateDynamic3DTextLabel("Baza Puro Cubano", COLOR_NEWS, -382.5024, -1426.3225, 26.1998, 20.0); //Baza Puro Cubano
	CreateDynamic3DTextLabel("Witamy na torze żużlowym\nWpisz /zuzel aby zobaczyc komendy", 0x0080FFFF, -1150.0270,-990.5195,130.8855, 10.0); //Tor żużlowy
	CreateDynamic3DTextLabel("Publiczne\nTory szkoleniowe FBI", COLOR_NEWS, 1271.0920,-1667.8794,19.7344, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 60);
    CreateDynamic3DTextLabel("Wyjście z toru", COLOR_NEWS, 1630.513671875,5232.2626953125,2.6707870960236, 10.0);
    CreateDynamic3DTextLabel("Wyjście z toru", COLOR_NEWS, -433.55599975586,-3812.8073730469,176.7035064697, 10.0);
    CreateDynamic3DTextLabel("Przebieralnia", COLOR_NEWS, 988.94909667969,-3676.5551757813,1.2307510375977, 10.0);
    CreateDynamic3DTextLabel("Przebieralnia", COLOR_NEWS, 994.54052734375,-3676.474609375,1.2307510375977, 10.0);
    CreateDynamic3DTextLabel("Sala przesłuchań", COLOR_NEWS, 276.32934570313,122.20029449463,1004.1166992188, 10.0);
    CreateDynamic3DTextLabel("SAN - główne wejście", COLOR_NEWS, 646.9418,-1355.8645,13.5625, 30.0);
    CreateDynamic3DTextLabel("Dyrekcja", COLOR_BLUE, 1523.0439,-1466.9510,64.7786, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 32);
    CreateDynamic3DTextLabel("Sala posiedzeń", COLOR_BLUE, -778.3271484375,496.4326171875,1368.5303955078, 5.0);
    CreateDynamic3DTextLabel("Gabinet Oyabuna", COLOR_BLUE, 368.3667,193.8689,1008.3828, 5.0);
    CreateDynamic3DTextLabel("Studio tatuażu", COLOR_BLUE, 2292.3088,-1723.3538,13.5469, 10.0);
    CreateDynamic3DTextLabel("Verte Bank\nOddział Los Santos", COLOR_BLUE, 1462.395751,-1012.391174,26.843799, 10.0);
    CreateDynamic3DTextLabel("Verte Bank\nOddział Palomino Creek", COLOR_BLUE, 2302.7798,-15.9637,26.4844, 10.0);
    CreateDynamic3DTextLabel("Tylne wejście", COLOR_BLUE, 595.6168,-1489.4412, 15.5205, 5.0);
	//--------------[Pickupy odnośnie systemu biletów KT]----------------------
	//Ticket machine
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, 1747.0645,-1944.3795,13.5668, 10.0);
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, 1757.1211,-1943.6776,13.5694, 10.0);
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, 2293.0547,-1175.9962,26.0441, 10.0);
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, 2856.7439,1314.4252,11.3906, 10.0);
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, 1436.5784,2655.9736,11.3926, 10.0);
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, -1958.2460,121.6830,27.6875, 10.0);
	CreateDynamic3DTextLabel("Maszyna do biletów\n[/kupbiletpociag]", COLOR_BLUE, 825.0424,-1353.8247,13.5372, 10.0);
	
	
	//--------------[Moje Pickupy i 3D moje 3d texty]---------------- {9ACD32}

	new str2[512];
    str2 = "{FFA500}Dowód osobisty - {9ACD32}20$ + akt urodz.\n{FFA500}Wydanie Prawa Jazdy - {9ACD32}120$ + zal. egz.\n {FFA500}Patent Żeglarski - {9ACD32}120$\n {FFA500}Pozwolenie na bron - {9ACD32}1000$\n {FFA500}Licencja Pilota - {9ACD32}7000$\n {FFA500}Karta wędkarska - {9ACD32}100$\n{9ACD32}Egzamin teoretyczny - 130${FFA500}\n{9ACD32}Egzamin praktyczny- {9ACD32} 140$";
    CreateDynamic3DTextLabel(str2, COLOR_NEWS, 1447.46899, -1785.40881, 79.21838,12,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 50, 0);//Cennik DMV
    str2 = "BACZNOŚĆ \n{7CFC00}By nie zostać oszukanym:\n {8B0000}1. NIGDY NIE GRAJ gdy ktoś chce grać o więcej niż ma w {FFFFFF}/sprawdzkase [ID]\n{9ACD32}Jeżeli mimo to zostaniesz oszukany NATYCHMIAST zgłoś ten fakt na {FFFFFF}/report{9ACD32} - oszust otrzyma od razu blocka\nGdy taka osoba otrzyma blokadę ty masz 10min na napisanie na niego skargi\nW ten sposób możesz odzyskać nawet 100%% wygranej!!";
	CreateDynamic3DTextLabel(str2, COLOR_PANICRED ,1032.8098,-1091.7827,-66.5729, 20.0);
    CreateDynamic3DTextLabel("San Andreas Police Department\n{00FFCC}Zaświadczenia o niekaralnośći\nKoszt: {9ACD32}18 000${0080FF}", COLOR_BLUE ,252.3918,117.3390,1005.2188, 2.5);//36
	CreateDynamic3DTextLabel("Lista Zasłużonych\n\n{FFA500}Beyonce Bennett\n{FFA500}Victoria Foxworth\n{FFA500}Mat Drep\n{FFA500}Richard Parker\n{FFA500}Lucas Scott", COLOR_RED, 298.12421, -1609.47058, 117.22952, 6.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 17, 0); 
	CreateDynamic3DTextLabel("Lista Zasłużonych\n\n{FFA500}Mateusz Jaroslowski {C0C0C0}- od 2013 do 2017 GLD i zasłużony\n{FFA500}Krzysztof Golder {C0C0C0}- od 2014 do 2016 VLD i zasłużony\n{FFA500}Monika Lorens {C0C0C0}- od 2014 do 2016 VLD i zasłużona\n{FFA500}Luis Cotta {C0C0C0}- od 2017 VLD i zasłużony dla frakcji", COLOR_RED, 1460.06836, -1813.06421, 79.45823, 8.0);
	CreateDynamic3DTextLabel("Plac Manewrowy", COLOR_RED, 1441.79016, -1811.51782, 79.55123, 5);//Plac manewrowy w dmv ls 
	CreateDynamic3DTextLabel("Biuro USSS\n[MONITORING]", COLOR_RED, 1454.66711, -1788.37805, 79.52730, 5);
	CreateDynamic3DTextLabel("Regulamin Obiektu\n\n{C0C0C0}1. Nie wolno biegać i skakać\n2.Nie wolno krzyczeć\n3.Obowiązuje kultura osobista\n4.Urząd to nie biuro pożyczek\n5.Na plac manewrowy, za okienka, jak i na resztę całego urzędu\ndostęp mają jedynie urzędnicy!", COLOR_RED, 1454.67273, -1785.99878, 79.40360, 4.2);
    CreateDynamic3DTextLabel("Taras PD", COLOR_BLUE ,214.9873,121.0619,999.0156, 2.5);//36

    CreateDynamic3DTextLabel("Biurowiec\nFederalnego Biura Śledczego", COLOR_BLUE ,608.19793701172, -1458.9837646484, 14.387271881104, 30.0);
	CreateDynamic3DTextLabel("________________________\nKancelaria\n Burmistrza Los Santos \n    Carmen Delacortez     \n________________________", 0xFFA500FF, 1479.9778,-1785.5557,164.3959, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 14);//36
	CreateDynamic3DTextLabel("Toalety", COLOR_GREEN, 1067.7961,1049.3918,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Do okienek 1-4", COLOR_GREEN, 1090.6261,1051.1055,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Szatnia", COLOR_GREEN, 1060.6478,1061.0955,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Przejście służbowe", COLOR_GREEN, 1063.2349,1063.8685,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Toalety", COLOR_GREEN, 1051.6702,1075.4916,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Szatnia", COLOR_GREEN, 1061.0271,1073.2203,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Plac manewrowy", COLOR_GREEN, 1062.4417,1083.2163,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Toaleta publiczna", COLOR_GREEN, 1067.8160,1083.9149,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Okienka 5-8", COLOR_GREEN, 1090.4949,1081.3397,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Przejście służbowe", COLOR_GREEN, 1088.3507,1089.1888,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Biuro GPB", COLOR_GREEN, 1074.1942,1061.7606,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36
	CreateDynamic3DTextLabel("Izolatka GPB", COLOR_GREEN, 1074.3879,1071.4058,-15.6441, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 50);//36

	CreateDynamic3DTextLabel("Biuro Urzędników", COLOR_GREEN, 1485.7014,-1775.9730,164.3959, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 60);//36
	CreateDynamic3DTextLabel("Sanepid", COLOR_GREEN, 1474.3630,-1782.3595,164.3959, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 60);//36
	CreateDynamic3DTextLabel("Wydział Planowania", COLOR_GREEN, 1485.7137,-1782.2922,164.3959, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 60);//36
	CreateDynamic3DTextLabel("Sala obrad", COLOR_GREEN, -1817.0055,506.7179,-17.5041, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 75);//36
	CreateDynamic3DTextLabel("Duża Sala Sądowa", COLOR_GREEN, -1791.9020,513.7820,-18.9341, 8.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 75);//36
	CreateDynamic3DTextLabel("Mała Sala Sądowa", COLOR_GREEN, -1779.0680,500.3323,-18.9341, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 75);//36
	CreateDynamic3DTextLabel("Adwokatura, Prokuratura\nGabinety Sędziów", COLOR_GREEN, -1778.8135,528.1346,-18.9341, 8.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 75);//36

	CreateDynamic3DTextLabel("Aby rozpocząć zakupy wpisz /kupdildo", 0xFF00FFAA, -105.0829,-10.6207,1000.7188, 5.0);
	CreateDynamic3DTextLabel("Dystrybutor\nWpisz /tankuj", COLOR_BLUE ,-1130.3420,-1018.1770,129.2188, 10.0);
	
	CreateDynamic3DTextLabel("{FFFFFF}{FF0000}J{FFFFFF}ack {FF0000}S{FFFFFF}imon\nNadwodny Arcymak Gubernatora", 0x008080FF, 1528.4802, -1458.5370, 67.3899, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 80);
 	CreateDynamic3DTextLabel("{FFFFFF}Biuro Dyrektora GPB", 0x008080FF, 1513.5140, -1467.9963, 69.3863, 5.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 80);
    CreateDynamic3DTextLabel("{FFFFFF}Sala Konferencyjna", 0x008080FF, 1526.1975, -1460.5238, 69.3863, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 80);
	CreateDynamic3DTextLabel("{FFFFFF}Sala gimnastyczna", 0x008080FF, 1481.3822, -1535.7865, 71.3195, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 80);
    CreateDynamic3DTextLabel("{FFFFFF}Strzelnica", 0x008080FF, 1478.1902, -1535.7865, 71.3195, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 80);
    CreateDynamic3DTextLabel("{FFFFFF}Symulacja napadu", 0x008080FF, 1474.9702, -1535.7865, 71.3195, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 80);

//Pickup bayside

	CreateDynamic3DTextLabel("Ratusz", COLOR_BLUE ,-2474.1194,2232.1296,5.7156, 25.0);
	CreateDynamic3DTextLabel("Tu rozpoczniesz służbę\n i wrzucisz podejrzanego do więzienia (BSPD)", COLOR_BLUE ,-2614.1667,2264.6279,8.2109, 15.0);
	CreateDynamic3DTextLabel("Komisariat Palomino Creek", COLOR_BLUE ,2425.6000976563,117.69999694824,26.5, 15.0);
	CreateDynamic3DTextLabel("Kościół", COLOR_BLUE ,-2482.6416,2406.8088,17.1094, 25.0);
	CreateDynamic3DTextLabel("Wejście na balkon", COLOR_BLUE ,-2065.5505,575.6121,1173.0511, 1.0);

//3dtexty na basenie 
	CreateDynamic3DTextLabel("Wpisz tu /trampolina\n aby wykonać skok", COLOR_BLUE ,579.3132,-2193.8735,6.5254, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	CreateDynamic3DTextLabel("Sauna", COLOR_BLUE ,1212.84546, -1790.80505, 71.69380, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	CreateDynamic3DTextLabel("Basen", COLOR_BLUE ,1221.30774, -1790.77686, 71.70520, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	CreateDynamic3DTextLabel("=-=-=-=-=Tsunami Pool=-=-=-=-=\n\n{37AC45}1.Nie biegamy\n{37AC45}2.Nie skaczemy\n{37AC45}3.Na basenie obowiązuje zakaz pływania bez stroju!\n{37AC45}4. Osoby poniżej 18 roku życia wymagają wejścia z opiekunem!", COLOR_BLUE , 1222.38391, -1807.12610, 71.86166, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
    str2 =  "Wejście na pływalnię i inne atrakcje na basenie jest płatne za pomocą kredytów\n Zaopatrz się w odpowiednią liczbę kredytów u pracownika Aqua Parku\n Cennik znajduje się na tablicy przy kasach\n Dodatkowe kredyty możesz dokupić również na basenie\n Wchodząc na basen akceptujesz regulamin pływalni";
	CreateDynamic3DTextLabel(str2, COLOR_BLUE ,1205.84192, -1765.71741, 13.52577, 6.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
    str2 = "{FFA500}Wejście na basen -{9ACD32}210 kredytów \n {FFA500}Wejście do Sauny - {9ACD32}75 kredytów \n {FFA500}Skorzystanie z szatni-{9ACD32}50 kredytów\n {FFA500}Trampolina średnia - {9ACD32}10 kredytów\n {FFA500}Trampolina wyczynowa- {9ACD32}25 kredytów\n {FFA500}Wejście do pontonu basenowego- {9ACD32}25 kredytów\nCeny kredytów ustala dzierżawca\nPo opuszczeniu pływalni kredyty przepadają";
    CreateDynamic3DTextLabel(str2,COLOR_NEWS,1193.82861,-1771.33301,13.27689+0.2,8.5,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	//CreateDynamic3DTextLabel("Wejscie tylko dla personelu \n(wpisz /wyjdz aby wejsc)", COLOR_BLUE ,562.2107,-2029.9917,16.1670, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	CreateDynamic3DTextLabel("Trampoliny", COLOR_BLUE ,578.6193,-2195.7708,1.6288, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	CreateDynamic3DTextLabel("Użyj: /kupkredyty", COLOR_BLUE ,1197.0911,-1772.3119,13.7282, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	//CreateDynamic3DTextLabel("Pani Janina (69)", COLOR_WHITE,1197.0911,-1772.3119,13.7282+0.85, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);
	CreateDynamic3DTextLabel("=-=-=-=-=Tsunami Pool=-=-=-=-=\n\n{37AC45}Founded by:\n{C0C0C0}>Luis Cotta\n{C0C0C0}>Sergio Santiago\n{C0C0C0}>John Mrucznik\n{C0C0C0}>Sven Helvetica", COLOR_BLUE, 1205.97107, -1759.93848, 15.94710, 14, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 43);

//-------------------------------[Przystanki autobusowe]----------------------------------------

	CreateDynamic3DTextLabel("Przystanek \n  Ganton - Grove Street \n Kursuje linia: {FF8C00}72" /*\n {808080} Więcej na /businfo*/, COLOR_BLUE ,2592.8000488281,-1723.5999755859,16 ,20.0); //most
	CreateDynamic3DTextLabel("Przystanek \n  Ganton - Grove Street \n Kursuje linia: {FF8C00}72", COLOR_BLUE ,2474.3999023438,-1738.4000244141,16 ,20.0); //przy GS
	CreateDynamic3DTextLabel("Przystanek \n Idlewood - Silownia \n Kursuje linia: {FF8C00}72", COLOR_BLUE , 2163.0180664063,-1758.4976806641,16.147880172729, 20.0); // Idlewood - Silownia przy motelu

	CreateDynamic3DTextLabel("Przystanek \n Idlewood - Silownia \n Kursuje linia: {FF8C00}72", COLOR_BLUE ,2179.3752441406,-1711.3572998047,16, 20.0); // Idlewood - Silownia przy melinie
	CreateDynamic3DTextLabel("Przystanek \n Idlewood - Stacja benzynowa \n Kursuje linia: {FF8C00}72", COLOR_BLUE ,1890.3483886719,-1744.2761230469,16.146875, 20.0); // Idlewood - Stacja benzynowa
	CreateDynamic3DTextLabel("Przystanek \n Idlewood - Stacja benzynowa \n Kursuje linia: {FF8C00}72", COLOR_BLUE ,1925.3206787109,1760.4560546875,16.146875, 20.0); // Idlewood - Stacja benzynowa
	CreateDynamic3DTextLabel("Przystanek \n El Corona - Unity Station \n Kursuje linia: {4682B4}55  {008000}96", COLOR_BLUE ,1743.8525390625,-1810.5493164063,16.126877403259, 20.0); // El Corona - Unity Station
	CreateDynamic3DTextLabel("Przystanek \n El Corona - Unity Station \n Kursuje linia: {4682B4}55  {008000}96", COLOR_BLUE ,1790.5799560547,-1839.7934570313,16.126877403259, 20.0); // El Corona - Unity Station
	CreateDynamic3DTextLabel("Przystanek \n Pershing Square - Komisariat \n Kursuje linia: {4682B4}55  {FF8C00}72", COLOR_BLUE ,1523.8828125,-1694.9890136719,16.126877403259, 20.0); // Pershing Square - Komisariat
	CreateDynamic3DTextLabel("Przystanek \n Pershing Square - Komisariat \n Kursuje linia: {4682B4}55  {FF8C00}72  {FFFF00}82  {FFFF00}82A", COLOR_BLUE ,1535.2431640625,-1647.8034667969,16.126877403259, 20.0); // Pershing Square - Komisariat
	CreateDynamic3DTextLabel("Przystanek \n Downtown - Ammu-Nation \n Nie kursuje żadna linia", COLOR_BLUE ,1363.3416748047,-1275.2260742188,16.126877403259, 20.0); // Downtown - Ammu-Nation
	CreateDynamic3DTextLabel("Przystanek \n Downtown - Ammu-Nation \n Kursuje linia: {FF8C00}72(j)", COLOR_BLUE ,1336.8793945313,-1348.0667724609,16.126877403259, 20.0); // Downtown - Ammu-Nation
	CreateDynamic3DTextLabel("Przystanek \n Downtown - Bank \n Kursuje linia: {4682B4}55 {FF00FF}85", COLOR_BLUE ,1451.1014404297,-1041.8737792969,26.328125, 20.0); // Downtown - Bank
	CreateDynamic3DTextLabel("Przystanek \n Downtown - Bank \n Kursuje linia: {4682B4}55  {FF8C00}72(j) {FF00FF}85", COLOR_BLUE ,1451.2653808594,-1025.9205322266,26.328125, 20.0); //przy banku
	CreateDynamic3DTextLabel("Przystanek \n Downtown - Mrucznikowy Gun Shop \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,1782.1417236328,-1163.5463867188,26.328125, 20.0); // Downtown - Mrucznikowy Gun Shop
	CreateDynamic3DTextLabel("Przystanek \n Downtown - Mrucznikowy Gun Shop \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,1811.40234375,-1185.9276123047,26.328125, 20.0); // Downtown - Mrucznikowy Gun Shop
	CreateDynamic3DTextLabel("Przystanek \n Glen Park \n Kursuje linia: {4682B4}55 {FF00FF}85", COLOR_BLUE ,1964.6368408203,-1201.1809082031,27.985903930664, 20.0); //bus glen
	CreateDynamic3DTextLabel("Przystanek \n Ganton - Bar Ten green bottles N/Ż\n Kursuje linia: {FF8C00}72", COLOR_BLUE ,2316.6101074219,-1665.5198974609,16.951803398132, 20.0); // Ganton - Bar "Ten green bottles"
	CreateDynamic3DTextLabel("Przystanek \n Ganton - Bar Ten green bottles N/Ż\n Kursuje linia: {FF8C00}72", COLOR_BLUE ,2296.3830566406,-1653.36328125,16.92245349884, 20.0); // Ganton - Bar "Ten green bottles"
	CreateDynamic3DTextLabel("Przystanek końcowy \n Ocean Docks - Fabryka \n Kursuje linia: {008000}96", COLOR_BLUE ,2226.7065429688,-2204.9982910156,16.246875, 20.0); // Ocean Docks - Fabryka
	CreateDynamic3DTextLabel("Przystanek \n Playa del Seville - Osiedle mieszkaniowe \n Kursuje linia: 96", COLOR_BLUE ,2741.4299316406,-2000.4523925781,16.2546875, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Playa del Seville - Osiedle mieszkaniowe \n Kursuje linia: 96", COLOR_BLUE ,2763.8073730469,-1937.013671875,16.246875, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Beach - Baza Mechanikow \n Kursuje linia: {FFFF00}82  {FFFF00}82A {FF00FF}85", COLOR_BLUE ,2847.9274902344,-1563.1618652344,13.793752861023, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Beach - Baza Mechanikow \n Kursuje linia: {FFFF00}82  {FFFF00}82A {FF00FF}85", COLOR_BLUE ,2867.8012695313,-1539.7840576172,13.793752861023, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Beach - Baza Mechanikow \n Kursuje linia: {FFFF00}82  {FFFF00}82A {FF00FF}85", COLOR_BLUE ,2847.9274902344,-1563.1618652344,13.793752861023, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Beach - Agencja Ochrony braci Izumi \n Kursuje linia: {FFFF00}82  {FFFF00}82A {FF00FF}85", COLOR_BLUE ,2843.7377929688,-1097.9293212891,26.818738174438, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Beach - Agencja Ochrony braci Izumi \n Kursuje linia: {FFFF00}82  {FFFF00}82A {FF00FF}85", COLOR_BLUE ,2832.1416015625,-1101.7882080078,26.810314941406, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Los Santos - Pig Pen \n Kursuje linia: 96", COLOR_BLUE ,2436.2917480469,-1262.3370361328,26.70008, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Los Santos - Pig Pen \n Kursuje linia: 96", COLOR_BLUE ,2389.1911621094,-1250.794921875,26.702835845947, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Jefferson - Motel Jefferson \n Kursuje linia: {4682B4}55 {FF00FF}85", COLOR_BLUE ,2254.9758300781,-1151.0307617188,29.372472000122, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Jefferson - Motel Jefferson \n Kursuje linia: {4682B4}55 {FF00FF}85", COLOR_BLUE ,2248.9545898438,-1132.9829101563,29.025132369995, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Temple - 24/7 \n Kursuje linia: 55", COLOR_BLUE ,1307.6668701172,-916.51196289063,41.573985290527, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Temple - 24/7 \n Kursuje linia: 55", COLOR_BLUE ,1318.3203125,-939.79602050781,40.522116851807, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market - Kasyno \n Kursuje linia: {4682B4}55", COLOR_BLUE ,1036.2315673828,-1155.5111083984,26.520327758789, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market - Kasyno \n Kursuje linia: {4682B4}55", COLOR_BLUE ,1008.0661621094,-1133.0928955078,26.528125, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market - Cluckin'Bell \n Kursuje linia: 55", COLOR_BLUE ,911.25482177734,-1380.9995117188,16.289659309387, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market - Cluckin'Bell \n Kursuje linia: 55", COLOR_BLUE ,923.01147460938,-1340.8969726563,16.201903533936, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Jetty Lounge / Studio SAN \n Kursuje linia: {4682B4}55", COLOR_BLUE ,723.23773193359,-1413.8408203125,16.21894569397, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Jetty Lounge / Studio SAN \n Kursuje linia: {4682B4}55", COLOR_BLUE ,709.17822265625,-1387.4063720703,16.387715530396, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Klub wedkarski \n Kursuje linia: {4682B4}55", COLOR_BLUE ,359.1096496582,-1653.7490234375,35.704319763184, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Klub wedkarski \n Kursuje linia: {4682B4}55", COLOR_BLUE ,351.99530029297,-1636.6911621094,35.715753173828, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Glen Park \n Kursuje linia: {4682B4}55", COLOR_BLUE ,1978.0007324219,-1196.2591552734,28.55196304321, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Jefferson - Kościół \n Kursuje linia: {4682B4}55", COLOR_BLUE ,2204.6647949219,-1441.4039306641,23.984375, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Jefferson - Kościół \n Kursuje linia: {4682B4}55", COLOR_BLUE ,2220.5141601563,-1438.9367675781,24.0, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Idlewood - Skate Park \n Kursuje linia: {4682B4}55", COLOR_BLUE ,1839.6973876953,-1362.1072998047,13.5625, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Idlewood - Skate Park \n Kursuje linia: {4682B4}55", COLOR_BLUE ,1859.5150146484,-1392.0882568359,13.5625, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market - Szpital Wszystkich Swietych \n Kursuje linia: {FF8C00}72 {FF00FF}85", COLOR_BLUE ,1213.7967529297,-1315.9571533203,16.557159423828, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market - Szpital Wszystkich Swietych \n Kursuje linia: {FF8C00}72 {FF00FF}85", COLOR_BLUE ,1189.6943359375,-1355.6044921875,16.567205429077, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Miedzynarodowy Port Lotniczy Los Santos - Terminale \n Nie kursuje żadna linia.", COLOR_BLUE ,1692.3889160156,-2246.84375,13.539621353149, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Miedzynarodowy Port Lotniczy Los Santos - Terminale \n Nie kursuje żadna linia.", COLOR_BLUE ,1672.7529296875,-2261.7868652344,13.529561042786, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Miedzynarodowy Port Lotniczy Los Santos - Pas Startowy \n Kursuje linia: {008000}96", COLOR_BLUE ,1977.9957275391,-2174.1936035156,13.540592193604, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Miedzynarodowy Port Lotniczy Los Santos - Pas Startowy \n Kursuje linia: {008000}96", COLOR_BLUE ,1927.5277099609,-2158.7475585938,13.546875, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Marina - Molo \n Nie kursuje żadna linia.", COLOR_BLUE ,816.23620605469,-1792.2507324219,13.663411140442, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Marina - Molo \n Nie kursuje żadna linia.", COLOR_BLUE ,830.7861328125,-1761.5969238281,13.557691574097, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Granica \n Nie kursuje żadna linia.", COLOR_BLUE ,157.0863494873,-1599.9953613281,13.426840782166, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Granica \n Nie kursuje żadna linia.", COLOR_BLUE ,172.44171142578,-1569.1838378906,12.701812744141, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Wypozyczalnia Aut \n Kursuje linia: {008000}96", COLOR_BLUE ,579.77905273438,-1242.9088134766,17.654222488403, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Rodeo - Wypozyczalnia Aut \n Kursuje linia: {008000}96", COLOR_BLUE ,531.23394775391,-1240.2409667969,16.635330200195, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Marina - Burger Shot \n Kursuje linia: {008000}96", COLOR_BLUE ,846.78448486328,-1619.1676025391,13.546875, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Marina - Burger Shot \n Kursuje linia: {008000}96", COLOR_BLUE ,821.37451171875,-1622.2203369141,13.546875, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Las Collinas 34 \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2192.2785644531,-1016.5588989258,63.465999603271, 20.0); //
	CreateDynamic3DTextLabel("Przystanek \n Las Collinas 34 \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2203.9050292969,-1007.9483032227,61.827796936035, 20.0); //
	CreateDynamic3DTextLabel("Przystanek końcowy \n Rodeo - Mrucznik Tower \n Kursuje linia: {FF8C00}72 {4682B4}55  {008000}96", COLOR_BLUE ,335.34939575195,-1529.0958251953,33.285037994385, 20.0); // 96
	CreateDynamic3DTextLabel("Przystanek \nWillowfield-Culck'n bell\n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2408.3994140625,-1906.9099121094,15.825965881348 , 20.0); // +1
	CreateDynamic3DTextLabel("Przystanek \nWillowfield- Culck'n bell\n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2419.5556640625,-1910.5183105469,15.61351776123 , 20.0); // +2
	//CreateDynamic3DTextLabel("Ocean Docks - Zajezdnia Autobusowa", COLOR_BLUE ,22433.2265625,-2100.5439453125,15.542405128479 , 20.0); // +3
	CreateDynamic3DTextLabel("Ocean Docks - Zajezdnia Autobusowa", COLOR_BLUE ,32427.7380371094,-2100.1787109375,15.542405128479 , 20.0); // +4
	CreateDynamic3DTextLabel("Dillimore \n Kursuje linia: {FFFF00}82  {FFFF00}82A", COLOR_BLUE ,659.56359863281,-591.3818359375,18.719856262207 , 20.0); // +5
 	//CreateDynamic3DTextLabel("Dillimore \n Kursuje linia: 82 ", COLOR_BLUE ,666.42944335938,-592.18737792969,18.719856262207 , 20.0); // +6
	//CreateDynamic3DTextLabel("Dillimore \n Kursuje linia: 82 ", COLOR_BLUE ,1044.3587646484,-443.26565551758,53.460746765137 , 20.0); // +7
	CreateDynamic3DTextLabel("Dillimore \n Kursuje linia: {FFFF00}82  {FFFF00}82A ", COLOR_BLUE ,1017.0083007813,-468.32012939453,53.510246276855 , 20.0); // +8
	CreateDynamic3DTextLabel("Rodeo - Biurowiec FBI N/Ż\n Kursuje linia: {4682B4}55  {008000}96", COLOR_BLUE, 619.19805908203, -1467.7951660156, 16.544940948486, 50.0);
	CreateDynamic3DTextLabel("Rodeo - Biurowiec FBI N/Ż\n Kursuje linia: {4682B4}55  {008000}96", COLOR_BLUE, 645.48364257813, -1453.806640625, 16.544940948486, 50.0);
	CreateDynamic3DTextLabel("Przystanek \n Bluberry \n Kursuje linia: {FFFF00}82", COLOR_BLUE ,241.1724395752 ,-54.447734832764 ,4.2472524642944, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Bluberry \n Kursuje linia: {FFFF00}82", COLOR_BLUE , 224.9140625 ,-170.3115234375 ,4.2472524642944, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Willowfield - Wysypisko \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2117.7602539063 ,-1902.6304931641 ,15.796875, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Willowfield - Wysypisko \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2116.009765625 ,-1888.6198730469 ,16.046875, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Los Santos - Myjnia Samochodowa \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2490.0166015625 ,-1509.8363037109 ,26.799991607666, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n East Los Santos - Myjnia Samochodowa \n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2511.2307128906 ,-1498.5869140625 ,26.699989318848, 15.0); //
	//CreateDynamic3DTextLabel("Przystanek \n Ocean Docks - Baza Wojskowa \n Kursuje linia: {008000}96", COLOR_BLUE ,2657.4958496094 ,-2411.2084960938 ,16.296684265137, 15.0); //
	//CreateDynamic3DTextLabel("Przystanek \n Ocean Docks - Baza Wojskowa \n Kursuje linia: {008000}96", COLOR_BLUE ,2650.7568359375 ,-2397.2963867188 ,16.296684265137, 15.0); //
	//CreateDynamic3DTextLabel("Przystanek \n Market Station \n Kursuje linia: {4682B4}55", COLOR_BLUE ,804.85333251953 ,-1350.9718017578 ,15.691011428833, 15.0); //
    CreateDynamic3DTextLabel("Przystanek \n Ocean Docks - Więzienie Stanowe \n Kursuje linia: {008000}96", COLOR_BLUE ,2497.7761,-2411.4561 ,16.296684265137, 15.0);
    CreateDynamic3DTextLabel("Przystanek \n Market Station \n Kursuje linia: {FF8C00}72 {4682B4}55", COLOR_BLUE ,833.5,-1334.5,16.10000038147, 15.0); //market station przy martket station
	CreateDynamic3DTextLabel("Przystanek \n Market Station \n Kursuje linia: {FF8C00}72 {4682B4}55", COLOR_BLUE ,837.26153564453 ,-1312.2224121094 ,16.216003417969, 15.0); //sprawdzic
	CreateDynamic3DTextLabel("Przystanek \n Market- Galerie Handlowe \n Kursuje linia: {008000}96", COLOR_BLUE ,1084.4793701172 ,-1564.4562988281 ,16.239723205566, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Market- Galerie Handlowe \n Kursuje linia: {008000}96", COLOR_BLUE ,1104.8861083984 ,-1580.5274658203 ,15.508214950562, 15.0); // sprawdzic
	CreateDynamic3DTextLabel("Przystanek \n Las Colinas 13\n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2545.386962890,-1054.0794677734,72.065757751465, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Las Colinas 13\n Kursuje linia: {FF00FF}85", COLOR_BLUE ,2516.0454101563,-1041.4760742188 ,72.065757751465, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Palomino Creek\n Kursuje linia: {FFFF00}82  {FFFF00}82A", COLOR_BLUE ,2579.8977,33.2024,29.1535 , 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Palomino Creek\n Kursuje linia: {FFFF00}82 {FFFF00}82A", COLOR_BLUE ,2336.5998535156,38.69066619873,28.980960845947, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Bay Side\n Kursuje linia: {FFFF00}82", COLOR_BLUE ,-2499.2897949219 ,2338.8022460938 ,7.6357254981995, 15.0); //
	CreateDynamic3DTextLabel("Przystanek \n Commerce - Dworzec Autobusowy\nBasen 'Tsunami'\n Kursuje linia: {FFFF00}82  {FFFF00}82A  {008000}96", COLOR_BLUE, 1167.5377197266,-1825.7144775391,15.588569641113, 20.0);
    CreateDynamic3DTextLabel("Przystanek \nCommerce - Dworzec Autobusowy\nBasen 'Tsunami'\n Kursuje linia: {FFFF00}82  {FFFF00}82A  {008000}96", COLOR_BLUE, 1186.3753662109,-1750.328125,16.239440917969, 20.0);
    CreateDynamic3DTextLabel("Los Santos Bus Department\n{FF8C00}Zajezdnia Autobusowa Commerce\n{808080}Przystanek dla wysiadających!", COLOR_BLUE , 1140.800048828,-1732.9000244141,16.10000038147, 20.0);

	CreateDynamic3DTextLabel("Biurowiec\n'Mrucznik'", COLOR_BROWN, 330.6893,-1513.0613,35.8672, 100.0);
    CreateDynamic3DTextLabel("Kancelaria Prawnicza", COLOR_LIGHTGREEN, 315.4501953125, -1501.822265625, 13.820824623108, 10.0);
    CreateDynamic3DTextLabel("Biuro Łowców Nagród", COLOR_LIGHTGREEN, 292.85711669922, -1530.8516845703, 13.818398475647, 20.0);//99
	
	CreateDynamic3DTextLabel("Kamera więzienna", COLOR_LIGHTGREEN, 327.5762,-1546.8887,13.8364, 10.0);
    CreateDynamic3DTextLabel("Lista nagród [/wanted]", COLOR_LIGHTGREEN, 325.0463,306.9240,999.1484, 5.0);

	//3d texty dynamicznych interioró
	//CreateDynamic3DTextLabel("Dom na Grove Street", COLOR_BLUE, 2495.576171875,-1689.9849853516,14.765625, 15.0);
	CreateDynamic3DTextLabel("Melina", COLOR_BLUE, 2165.9409179688,-1671.8609619141,15.074726104736, 15.0);
	CreateDynamic3DTextLabel("Szamboa Gym", COLOR_BLUE, 2229.2248535156,-1721.9586181641,13.567801475525, 15.0);
	//CreateDynamic3DTextLabel("Pizzeria", COLOR_BLUE, 2104.4970703125,-1806.3927001953,13.5546875, 15.0);
	//CreateDynamic3DTextLabel("Dom na Las Collinas", COLOR_BLUE, 2351.8894042969,-1169.4614257813,28.001684188843, 15.0);

//	CreateDynamic3DTextLabel("{FF00FF}V{FFFFFF}inyl {FF00FF}C{FFFFFF}lub", COLOR_BLUE, 816.0999,-1386.8,13.6, 10.0);//VIP VINYL club central
	CreateDynamic3DTextLabel("{FF00FF}K{FFFFFF}rul {FF00FF}M{FFFFFF}echanikuw\n{008000}Bij Pokłony", COLOR_BLUE, 2792.6999511719,-1536.4000244141,10.5, 10.0);//pomnik króla
	//CreateDynamic3DTextLabel("{FF00FF}A{FFFFFF}lhambra {FF00FF}C{FFFFFF}lub {FF00FF}\n{008000}Płatne wewnątrz", 0xFFFFFF, 1836.1028,-1682.2826,13.3620, 10.0);//nowa Alhambra
	CreateDynamic3DTextLabel("{FFFFFF}Wejscie na Scene!",0xFFFFFF,481.0048,-1499.3975,41.3900,5,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel("{FFFFFF}Wejscie za Bar!",0xFFFFFF,488.6343,-1520.8257,41.3900,5,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel("{FFFFFF}Wejscie za Lade!",0xFFFFFF,495.5948,-1503.1011,41.3900,5,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel("{FFFFFF}Tu Rozpoczniesz impreze \n {FF0000}Wpisz /konsola \n {FFFFFF}a ukaze ci sie lista streamow !",0xFFFFFF,488.2908,-1492.8959,43.6700,5,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel("{FF00FF}E{FFFFFF}xclusive {FF00FF}C{FFFFFF}lub", COLOR_BLUE, 931.09,919.29,42.59, 15.0);
	CreateDynamic3DTextLabel("Muzeum sztuki współczesnej", COLOR_BLUE, 1698.8944091797,-1667.6840820313,20.194225311279, 15.0);
	CreateDynamic3DTextLabel("Muzeum sztuki współczesnej", COLOR_BLUE, 1727.1125488281,-1635.5847167969,20.216684341431, 15.0);
	CreateDynamic3DTextLabel("Salon Aut\n(/kupauto)", COLOR_BLUE, 2132.0371,-1149.7332,24.2372, 15.0);//128
	CreateDynamic3DTextLabel("Stocznia\n(/kuplodz)", COLOR_BLUE, 857.3464,-2100.0881,9.8666, 15.0);//UHA
    CreateDynamic3DTextLabel("Fabryka pojazdów latających\n(/kupsamolot)", COLOR_BLUE, -1262.5095,40.3263,14.1392, 15.0);//UHA
	CreateDynamic3DTextLabel("Naprawa łodzi", COLOR_BLUE, 698.51708984375 , -2050.6135253906 , 1.4432492256165, 15.0);//129
	CreateDynamic3DTextLabel("Wejście na dach", COLOR_BLUE, 2289.8876953125,-1206.8327636719,-18.008888244629, 15.0);//130
//3d texty wejscia
	//CreateDynamic3DTextLabel("Cowboy Bar", COLOR_BLUE, 682.03063964844,-473.62811279297,16.425407409668, 15.0);//132
	CreateDynamic3DTextLabel("Rada lokalna Dillimore", COLOR_BLUE, 695.07702636719,-499.34088134766,16.3359375, 15.0);//133
	CreateDynamic3DTextLabel("Przejście do cel\n Użyj: /wejdz", COLOR_GRAD1, -1674.5769,903.1641,-48.9141, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);//138

	CreateDynamic3DTextLabel("Wyjście", COLOR_PANICRED,  -1674.4122,917.7183,-52.4141, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);//nowe komi
	CreateDynamic3DTextLabel("Zbrojownia LSPD \n Komendy: /kamizelka /swat /szturmowy", COLOR_LIGHTBLUE,  -1674.8365,866.0356,-52.4141, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel("{6699FF}Bonehead Club",0x80FF0084,2447.8284,-1963.1549,13.5469,15);

	NapislotLS1 = CreateDynamic3DTextLabel("Kasa 1\nCena biletu:\nBrak", COLOR_BLUE, 1593.3000488281,-2285.6000976563,-75, 25.0);
	NapislotLS2 = CreateDynamic3DTextLabel("Kasa 2\nCena biletu:\nBrak", COLOR_BLUE, 1593.3000488281,-2280, -75, 25.0);
	NapislotLV1 = CreateDynamic3DTextLabel("Kasa 1\nCena biletu:\nBrak", COLOR_BLUE, 1674.8, 1442.3, 14.8, 25.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	NapislotSF1 = CreateDynamic3DTextLabel("Kasa 1\nCena biletu:\nBrak", COLOR_BLUE, -1391.9,-299.8,-74.7, 25.0);
	CreateDynamic3DTextLabel("Lotnisko w Los Santos", COLOR_BLUE, 1585.2,-2286.6,13.7, 25.0);
	CreateDynamic3DTextLabel("Lotnisko w Los Santos", COLOR_BLUE, 1585.2,-2286.6,13.7, 25.0);
	CreateDynamic3DTextLabel("Lotnisko w Los Santos", COLOR_BLUE, 1886.1,-2286.4,14, 25.0);
	CreateDynamic3DTextLabel("Pas startowy w Los Santos", COLOR_BLUE, 1605,-2282.9,-74.90, 25.0);
	CreateDynamic3DTextLabel("Pas startowy", COLOR_BLUE, 1675.8, 1455.4, 14.9, 25.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel("Lotnisko w San Fierro", COLOR_BLUE, -1421.4,-287.3,14.1, 25.0);
	CreateDynamic3DTextLabel("Lotnisko w San Fierro", COLOR_BLUE, -1376.3,-261.1,14.3, 25.0);
	CreateDynamic3DTextLabel("Pas startowy", COLOR_BLUE, -1390,-294.6,-74.6, 25.0);
	
	//pc by abram01
	CreateDynamic3DTextLabel("{FFFFFF}Biuro burmistrza\n {FF0000}P{FFFFFF}alomino {FF0000}C{FFFFFF}reek", 0x008080FF, 2312.9653, -72.1337, 40.8925, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Sala konferencyjna miasta\n {FF0000}P{FFFFFF}alomino {FF0000}C{FFFFFF}reek", 0x008080FF, 2310.3062, -75.0557, 40.8925, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Okienka 1-2", 0x008080FF, 2313.0664, -77.9755, 40.8925, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Okienka 3-4", 0x008080FF, 2324.6873, -77.9382, 40.8925, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Przejście dla klientów", 0x008080FF, 2318.8750, -77.9110, 40.8925, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Plac Manewrowy\n Wejście tylko z instruktorem", 0x008080FF, 2327.4940, -75.0322, 41.0837, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    str2 = "{FFA500}Dowód osobisty - {9ACD32}5000$ +akt urodz.\n{FFA500}Wydanie Prawa Jazdy - {9ACD32}20 000$ +zal. egz.\n {FFA500}Patent Żeglarski - {9ACD32}350 000$\n {FFA500}Pozwolenie na Bron - {9ACD32}200 000$\n {FFA500}Licencja Pilota - {9ACD32}5 000 000$\n {FFA500}Karty wędkarskie - {9ACD32}10 000$\n{9ACD32}Egzamin teoretyczny - 10 000${FFA500}\n{9ACD32}Egzamin praktyczny- {9ACD32} 15 000$";
    CreateDynamic3DTextLabel(str2, 0x008080FF, 2321.0730, -78.1003, 40.5000, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Przebierlania Urzędników", 0x008080FF, 2318.8938, -72.1589, 41.0185, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
    CreateDynamic3DTextLabel("{FFFFFF}Urząd Miasta \n {FF0000}P{FFFFFF}alomino {FF0000}C{FFFFFF}reek", 0x008080FF,2269.6770, -73.9858, 26.2765, 10.0);
	
	//verona mall
	
	CreateDynamic3DTextLabel("Verona Mall #1", 0xFFFFFFFF, 1155.1920,-1440.2554,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #2", 0xFFFFFFFF, 1155.0938,-1458.1758,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #3", 0xFFFFFFFF, 1159.0585,-1473.5192,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #4", 0xFFFFFFFF, 1157.8987,-1506.9456,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #5", 0xFFFFFFFF, 1144.2046,-1521.6428,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #6", 0xFFFFFFFF, 1112.1560,-1521.3732,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #7", 0xFFFFFFFF, 1099.3752,-1507.0377,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #8", 0xFFFFFFFF, 1098.5304,-1473.3096,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #9", 0xFFFFFFFF, 1101.7878,-1457.6602,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #10", 0xFFFFFFFF, 1101.9540,-1440.1140,18.8004, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #11", 0xFFFFFFFF, 1162.3512,-1435.7961,25.7909, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #12", 0xFFFFFFFF, 1159.0237,-1522.0995,25.7456, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #13", 0xFFFFFFFF, 1096.8696,-1522.0790,25.7450, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("Verona Mall #14", 0xFFFFFFFF, 1094.1958,-1451.0001,25.7605, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    //SN
	CreateDynamic3DTextLabel("Dach San News", 0xFFA500FF, 721.5504,-1381.8588,25.7176, 15.0);
    CreateDynamic3DTextLabel("Zaplecze San News", 0xFFA500FF, 732.5052,-1343.5123,13.5206, 15.0);
    /*CreateDynamic3DTextLabel("Dach San News", 0xFFA500FF, 297.7128,-1612.1783,114.4219, 15.0);
    CreateDynamic3DTextLabel("Parking San News", 0xFFA500FF, 288.0914,-1609.7465,17.9994, 10.0);
	CreateDynamic3DTextLabel("Biurowiec San News", 0xFFA500FF, 287.7476,-1609.9395,33.0723, 10.0);*/

    //CreateDynamic3DTextLabel("Siedziba Sądu Najwyższego", COLOR_BLUE, 1310.1124,-1367.6780,13.5391, 35.0);
    //CreateDynamic3DTextLabel("Wejście ewakuacyjne", COLOR_LIGHTBLUE, 1286.0413,-1329.2007,13.5515, 9.0);
    CreateDynamic3DTextLabel("Wyjście ewakuacyjne", COLOR_LIGHTBLUE, 1305.0424,-1291.6113,35.6751, 9.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 501);
    CreateDynamic3DTextLabel("Sala rozpraw", COLOR_LIGHTBLUE, 1297.2946,-1300.0739,37.9, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 501);
    CreateDynamic3DTextLabel("Firma kurierska", 0x99311EFF, 1751.4445, -2054.9761, 14.5, 25.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    //FD
    CreateDynamic3DTextLabel("Lista zasłużonych:\n+ Shoji Ertubo +\n+ Brayan Johnson +\n+ Jack Stanley +\n+ Raul Alvarez +\n+ Patrick Robinson +", COLOR_YELLOW, 1742.34100, -1126.92000, 229.35000, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 22, -1, -1, 10.0);
	CreateDynamic3DTextLabel("Ważne informacje:\n\nRachunki za poprzedni miesiąc do odebrania w biurze.\n\nPodsumowanie tygodnia ma miejsce w każdy piątek o godzinie 21:00.\n\nProsimy pamiętać o zamykaniu swoich szafek na klucz.\n\n", COLOR_YELLOW, 1753.40393, -1121.24000, 229.00000, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 22, -1, -1, 10.0);

    return 1;
}

