//MotelIdlewood.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: MotelIdlewood.pwn ]--------------------------------------------//
//Autor: Biago_Tieri
/*
	Wejscie do intka: 2234.4912, -1166.0139, 35.4968, 264.6473
	Pozycja bota pracującego w motelu: 2241.0510, -1168.8594, 35.4968, 85.5873
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
MotelIdlewood_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
    tmpobjid = CreateDynamicObject(-3007, 2238.241699, -1169.031372, 34.364013, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
    tmpobjid = CreateDynamicObject(-3007, 2238.241699, -1179.031372, 34.364013, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2242.603271, -1165.646606, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2243.133789, -1168.856811, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2243.133789, -1172.066894, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2241.762451, -1176.768432, 36.236778, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2243.133789, -1178.486938, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2241.542236, -1178.473754, 36.236778, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2241.462158, -1164.144653, 36.236778, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2238.252197, -1164.144653, 36.236778, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2235.042236, -1164.144653, 36.236778, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2233.407470, -1165.646606, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2233.407470, -1168.856567, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2233.407470, -1172.066528, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2233.407470, -1175.276489, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2233.407470, -1178.486450, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2238.332275, -1178.473754, 36.236778, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3010, 2240.244873, -1168.802856, 36.696811, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2240.241943, -1165.607543, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2240.311035, -1168.696655, 33.896766, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1166.608886, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1164.608886, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3007, 2238.241699, -1169.031372, 38.064014, 180.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "carp11S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3007, 2238.241699, -1179.031372, 38.064014, 180.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "carp11S", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1164.608886, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1166.608886, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1168.608886, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1170.608886, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2235.122314, -1178.473754, 36.236778, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2239.120117, -1164.237670, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.120117, -1164.237670, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2235.120117, -1164.237670, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.120117, -1164.237670, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2235.085937, -1170.522583, 36.236778, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3012, 2238.303955, -1170.522338, 35.996715, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2241.505859, -1170.522583, 36.236778, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2240.241943, -1172.027465, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2240.241943, -1175.237426, 36.236778, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2237.031982, -1175.237426, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2237.031982, -1172.127441, 36.236778, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2236.561523, -1170.427856, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2234.561523, -1170.427856, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.071044, -1170.427856, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.071044, -1170.427856, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.071044, -1170.618041, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2236.559326, -1170.618041, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1170.990600, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1172.990600, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1174.990600, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.150878, -1175.861450, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.128906, -1171.617553, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.128906, -1173.617553, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.128906, -1175.617553, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.118896, -1175.867797, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2235.499267, -1176.768432, 36.236778, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.052490, -1178.383911, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.052490, -1178.383911, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2238.052490, -1178.383911, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2236.052490, -1178.383911, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2234.052490, -1178.383911, 34.526821, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1166.608886, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1164.608886, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1164.608886, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1166.608886, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1168.608886, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.496826, -1170.608886, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2239.120117, -1164.237670, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.120117, -1164.237670, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2235.120117, -1164.237670, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2233.120117, -1164.237670, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2236.561523, -1170.427856, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2234.561523, -1170.427856, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.071044, -1170.427856, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.071044, -1170.427856, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.071044, -1170.618041, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2236.559326, -1170.618041, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1170.990600, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1172.990600, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1174.990600, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.150878, -1175.861450, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.128906, -1171.617553, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.128906, -1173.617553, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.128906, -1175.617553, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2237.118896, -1175.867797, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.052490, -1178.383911, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.052490, -1178.383911, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2238.052490, -1178.383911, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2236.052490, -1178.383911, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2234.052490, -1178.383911, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2238.183105, -1170.427856, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1168.599731, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.140869, -1170.561645, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2238.301025, -1170.618041, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3006, 2242.600585, -1168.833862, 36.306636, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.860595, 35.666767, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.860595, 37.096660, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.860595, 36.406772, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.860595, 36.756713, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.860595, 36.056766, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1167.939697, 36.136753, 90.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1169.721435, 36.136753, 90.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.660400, 36.136753, 90.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1169.020751, 36.136753, 90.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1169.391113, 36.136753, 90.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.744628, -1168.300781, 36.136753, 90.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.282226, -1168.480224, 35.656768, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.285156, -1169.110839, 35.653766, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1897, 2240.239501, -1169.652709, 36.766765, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1897, 2240.239501, -1168.171264, 36.766765, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.255126, -1169.795776, 36.656799, 90.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.255126, -1167.824829, 36.656799, 90.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "ab_trellis", 0x00000000);
    tmpobjid = CreateDynamicObject(3380, 2240.247070, -1169.201416, 37.226669, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(3380, 2240.247070, -1168.450683, 37.226669, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19939, 2240.232666, -1168.820922, 37.146816, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19328, 2240.198730, -1168.813598, 37.136657, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "RECEPCJA", 100, "Engravers MT", 30, 1, 0xFFFFFFFF, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(19940, 2242.513183, -1169.420532, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.513183, -1167.420532, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.513183, -1165.420532, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.503173, -1169.441650, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.503173, -1167.441650, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.503173, -1165.441650, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.503173, -1163.441650, 34.526821, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2242.513183, -1163.420532, 38.076812, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3002, 2240.745605, -1167.207397, 36.186717, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.220947, -1167.798950, 35.426933, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.220947, -1169.798950, 35.426933, 0.000000, 90.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.351074, -1169.999145, 33.747016, 90.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2240.351074, -1167.596801, 33.747016, 90.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(-3019, 2238.258056, -1170.537963, 34.506732, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-93-percent", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 18646, "matcolours", "grey-93-percent", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 2232.561523, -1170.427856, 38.076812, 0.000000, 90.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(1713, 2236.269531, -1169.865356, 34.386844, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 18064, "ab_sfammuunits", "rubber_mat", 0x00000000);
    tmpobjid = CreateDynamicObject(1820, 2235.144775, -1168.706176, 34.496826, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1567, 2240.164306, -1174.540893, 34.496826, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0x00000000);
    tmpobjid = CreateDynamicObject(1567, 2237.111328, -1173.611816, 34.496826, 0.000000, 0.000000, 450.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0x00000000);
    tmpobjid = CreateDynamicObject(1567, 2238.002197, -1178.376464, 34.496826, 0.000000, 0.000000, 540.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 3629, "arprtxxref_las", "ws_corrugateddoor1", 0x00000000);
    tmpobjid = CreateDynamicObject(2189, 2236.636474, -1167.251464, 37.876827, 180.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
    tmpobjid = CreateDynamicObject(2958, 2240.258056, -1168.275390, 35.616329, -1.199999, -16.900024, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2567, "ab", "chipboard_256", 0x00000000);
    tmpobjid = CreateDynamicObject(-3003, 2238.633544, -1174.686889, 36.236778, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(1555, 2240.181884, -1166.613525, 34.516826, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1493, 2233.537109, -1166.953125, 34.486827, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2713, 2239.356933, -1164.569335, 34.626804, 0.000000, 0.000000, 13.600010, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2002, 2241.998535, -1167.553955, 34.496826, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2712, 2239.017089, -1164.532836, 35.076801, 0.000000, 0.000000, 54.899993, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2986, 2233.516113, -1169.078491, 37.646705, 360.000000, 270.000000, 360.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2611, 2237.102294, -1164.283813, 36.356784, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2612, 2235.328369, -1164.267944, 36.356765, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19825, 2240.123535, -1167.097778, 36.946765, 0.000000, 0.000000, 270.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2256, 2235.455322, -1170.410522, 36.556705, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1731, 2238.832519, -1164.385253, 36.656730, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1731, 2234.057861, -1164.385253, 36.656730, 0.000000, 0.000000, 90.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1731, 2237.278320, -1175.238281, 36.656730, 0.000000, 0.000000, 180.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1731, 2239.990478, -1172.725830, 36.656730, 0.000000, 0.000000, 360.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(16779, 2236.655761, -1167.227783, 37.946620, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2010, 2233.930175, -1169.835205, 34.496826, 0.000000, 0.000000, 27.500009, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2855, 2235.627929, -1168.272705, 35.006740, 0.000000, 0.000000, 38.100013, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19591, 2241.801757, -1170.426391, 36.616718, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(11705, 2240.332275, -1169.205078, 35.616733, 0.000000, 0.000000, 235.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19039, 2242.802490, -1168.845458, 36.076698, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19039, 2242.802490, -1168.084716, 36.456645, 0.000000, 0.000000, 0.000000, 4301, -1, -1, 300.00, 300.00); 
}