
wejsciaSkrypt_Init()
{
	StworzBudynki();
	return 1;
}

static StworzBudynki()
{
//DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="", wejdzUID=0, playerLocal=255);
//WejdzInt(playerid, Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2, Float:tolerancja, interior, vw, komunikat[]="", local, gametext[]=""); 

	DodajWejscie(1478.42, -1802.45, 15.39, 1305.9960,-1365.4862,52.4260, 0, 0, 11, 0, "Supreme Court of San Andreas", "Wyjście");//Wejście do sądu
	DodajWejscie(1412.3348388672, -1790.5777587891, 15.370599746704,1303.2700,-1330.7017,48.8789, 0, 0, 18, 0, "", "Wyjście");//Wejście do sądu (Ewakuacyjne)
	DodajWejscie(-2474.1194,2232.1296,5.7156, -2063.9272460938,547.01922607422,1172.2559814453, 0, 0, 7, 0, "Ratusz BaySide", "Wyjście"); 
	DodajWejscie(608.19793701172, -1458.9837646484, 14.387271881104, 592.71991, -1487.62439, 89.30576, 0, 0, 1, 0, "", "Wyjście", 3, PLOCAL_FRAC_FBI);
	DodajWejscie(2447.8284,-1963.1549,13.5469, 2455.1021,-1958.0905,120.8159, 0, 0, 1, 0, "BoneHead Club", "Wyjście", 6, PLOCAL_ORG_BONEHEAD);
	DodajWejscie(1673.3000488281, 1447.8000488281, 10.89999961853, 1673, 1447.5, 14.800000190735, 0, 0, 0, 1, "Lotnisko w Las Venturas", "Wyjście"); 
	DodajWejscie(1597.6999511719, 1448.3000488281, 10.89999961853, 1675.8000488281, 1455.4000244141, 14.89999961853, 0, 0, 0, 1, "Wejście\nLotnisko w Las Venturas", "Wyjście"); 
	DodajWejscie(-1421.4000244141,-287.29998779297,14.10000038147, -1394.4000244141,-301.5,-74.6,  0, 0, 0, 0, "Lotnisko San Fierro", "Powrót"); 
	DodajWejscie(-1376.3000488281,-261.10000610352,14.300000190735, -1390,-294.60000610352,-74.6, 0, 0, 0, 0, "Lotnisko San Fierro", "Wyjście na pas"); 
	DodajWejscie(1585.2,-2286.6,13.7, 1573.5999755859,-2286.3999023438,-75, 0, 0, 0, 0,  "Lotnisko LS", "Powrót"); 
	DodajWejscie(1462.395751,-1012.391174,26.843799, 1444.85,-1010.76,69.29, 0, 0, 2, 0, "", "Wyjście", 4, PLOCAL_INNE_BANK); // BANK WEJSCIE XD
	DodajWejscie(2302.7798,-15.9637,26.4844, 2305.688964,-16.088100,26.749599, 0, 0, 2, 0, "", "Wyjście", 5, PLOCAL_INNE_BANK); 
	//to jest coś zesrane
	DodajWejscie(830.4240, -1376.2208, 27.8467, 830.5424, -1375.1467, 27.8467, 255, 0, 255,0, "Strefa VIP", "", 8);
	DodajWejscie(813.2293, -1349.5438, 23.6597, 823.3508, -1349.5614, 24.7971, 255, 0, 255, 0, "Przejście dla DJ", "Powrót na salę", 9); 
	
	DodajWejscie(2269.6848, -75.5530, 27.1525, 2318.7566, -85.3065, 41.7866, 0, 0, 1,0, "", "Wyjście", 0, PLOCAL_FRAC_DMV);//DMV w PC
	DodajWejscie(292.85711669922, -1530.8516845703, 13.818398475647, 322.0553894043, 303.41961669922, 999.1484375, 0, 0, 0,5, "", "Wyjście");//Biuro łowców nagród
	DodajWejscie(315.4501953125, -1501.822265625, 13.820824623108, 319.72470092773, -1548.3374023438, 13.845289230347, 0, 0, 0, 0, "", "Wyjście");//Kancelaria Prawnicza MRP tower
	DodajWejscie(330.6893,-1513.0613,35.8672, 301.29656982422, -1515.7513427734, 13.809589385986, 0, 0, 0, 0, "", "Wyjście z biurowca");//Biurowiec MRP tower
	DodajWejscie(2254.8652,-1334.2078,23.9922, 1964.1326904297, -350.83026123047, 1092.9454345703, 0, 0, 0, 3, "", "Powrót");//Kościół LS
	DodajWejscie(695.07702636719,-499.34088134766,16.3359375, 703.78033447266,-497.16967773438,23.36548614502, 0, 0, 35, 0, "Rada Miasta Dillimore", "Powrót"); //Rada miasta Dillimore
	DodajWejscie(2495.576171875,-1689.9849853516,14.765625, 2495.9689941406,-1692.6496582031,1014.7421875, 0, 0, 0, 3, "CJ House", "Follow CJ");//Dom CJ
	DodajWejscie(2165.9409179688,-1671.8609619141,15.074726104736, 318.75366210938,1115.3836669922,1083.8828125, 0, 0, 0, 5, "", "Follow! Anyway, give me this drugs!");//Melina dragów
	DodajWejscie(1698.8944091797,-1667.6840820313,20.194225311279, 1701.4025878906,-1667.9442138672,20.21875, 0, 0, 18, 0, "", "Wyjście");//Muzeum sztuki
	DodajWejscie(1727.1125488281,-1635.5847167969,20.216684341431, 1727.076171875,-1638.8159179688,20.223419189453, 0, 0, 18, 0, "", "Wyjście");//Muzeum sztuki 2
	DodajWejscie(1763.4033,-1129.7128,24.0859, 1763.4243,-1128.0543,224.1499, 0, 0, 22, 0, "Remiza im. Świętego Krzysztofa", "Powrót"); //Remiza
	DodajWejscie(1711.3928, -1130.0851, 24.1741, 1751.6058, -1118.3661, 46.8055, 0, 0, 0, 0, "Dach", "Powrót"); //LSFD DACH
	DodajWejscie(725.4005,-1450.4960,17.695, 722.04, -1450.49, 26.04, 0, 0, 255, 0, "Przejście do środka", "Wyjście na taras", 12); //LCN przez taras do środka
	DodajWejscie(725.7198,-1439.3527,13.5391, 734.06, -1451.67, 22.59, 0, 0, 255, 0, "Jetty Lounge", "Wyjście", 12);//Główne wejście do LCN

	DodajWejscie(1939.1805,-1114.6561,27.4523, 2524.35, -1679.30, 1015.49, 0, 0, 50, 1, "", "Wyjście");
	return 1;
}