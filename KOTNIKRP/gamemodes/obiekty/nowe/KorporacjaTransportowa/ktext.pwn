//ktext.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Moduł: ktext.pwn ]--------------------------------------------//
//Autor: RomanFallaci
//Data utworzenia: 13.11.2019r
//Załączono plik .DB: TAK
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

//-----------------<[ Główne funkcje: ]>-------------------
ktext_Init() //tą metodę wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jeżeli chcemy stworzyć jakieś obiekty
	StworzBramy();//To wykorzystujemy jeżeli chcemy stworzyć jakieś bramy
	StworzBudynki();//To wykorzystujemy jeżeli chcemy stworzyć jakieś wejścia 
	return 1;
}

ktext_Connect(playerid) //tą metodę wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jeżeli chcemy usunąć jakieś obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
    skgang = CreateDynamicObject(10060, 2454.266845, -2122.872802, -10.076792, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "CJ_7_11_win", 0xFFFFFFFF);
    SetDynamicObjectMaterial(skgang, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 4, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 5, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 6, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 7, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 8, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 9, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 10, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    skgang = CreateDynamicObject(10060, 2454.266845, -2087.759765, -10.074792, 0.000000, 0.000000, 180.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 10101, "2notherbuildsfe", "ferry_build14", 0xFFFFFFFF);
    SetDynamicObjectMaterial(skgang, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 4, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 5, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 6, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 7, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 8, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 9, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 10, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    skgang = CreateDynamicObject(16564, 2477.520751, -2084.927734, 12.547875, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 3, 10101, "2notherbuildsfe", "sl_vicwall02", 0x00000000);
    skgang = CreateDynamicObject(19477, 2472.510253, -2079.158691, 17.777881, 0.000022, 0.000000, 179.999832, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(19477, 2472.509277, -2081.910156, 17.777881, 0.000022, 0.000000, 179.999832, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(19477, 2472.510253, -2084.679931, 17.777881, 0.000029, 0.000000, 179.999801, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(19477, 2472.509277, -2087.431396, 17.777881, 0.000029, 0.000000, 179.999801, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(19479, 2472.491699, -2086.059082, 14.837882, 0.000037, 0.000000, 179.999786, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterialText(skgang, 0, "KORPORACJA TRANSPORTOWA", 130, "Ariel", 30, 1, 0xFFFFFFFF, 0x00000000, 0);
    skgang = CreateDynamicObject(19477, 2472.510253, -2089.453857, 17.777881, 0.000029, 0.000000, 179.999801, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(19479, 2472.492675, -2086.009033, 14.887884, 0.000037, 0.000000, 179.999786, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterialText(skgang, 0, "KORPORACJA TRANSPORTOWA", 130, "Ariel", 30, 1, 0xFF222222, 0x00000000, 0);
    skgang = CreateDynamicObject(18766, 2467.933593, -2089.802001, 12.055875, 89.999992, 585.000000, 44.999904, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2469.354980, -2074.534912, 12.057875, 89.999992, 585.000000, 44.999889, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2469.354980, -2070.771240, 12.058876, 89.999992, 585.000000, 44.999889, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2468.933593, -2071.025146, 12.056877, 89.999992, 585.000000, 44.999889, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(3934, 2471.392333, -2099.741455, 18.819522, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, -1, "none", "none", 0xFFFFFFFF);
    skgang = CreateDynamicObject(18766, 2469.354980, -2089.797607, 12.057876, 89.999992, 585.000000, 44.999889, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2467.933593, -2074.521972, 12.055874, 89.999992, 585.000000, 44.999889, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2461.504394, -2069.205810, 12.055875, 89.999992, 585.000000, 134.999893, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(10060, 2510.422363, -2087.760009, -10.072792, 0.000007, 0.000014, 179.999923, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 10101, "2notherbuildsfe", "ferry_build14", 0xFFFFFFFF);
    SetDynamicObjectMaterial(skgang, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 4, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 5, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 6, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 7, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 8, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 9, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 10, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    skgang = CreateDynamicObject(10060, 2510.422363, -2122.873046, -10.070792, 0.000007, 0.000014, 179.999923, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 10101, "2notherbuildsfe", "ferry_build14", 0xFFFFFFFF);
    SetDynamicObjectMaterial(skgang, 1, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 2, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 3, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 4, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 5, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 6, 9514, "711_sfw", "ws_carpark2", 0x00000000);
    SetDynamicObjectMaterial(skgang, 7, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 8, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 9, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterial(skgang, 10, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    skgang = CreateDynamicObject(3934, 2476.506347, -2071.889160, 18.819522, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, -1, "none", "none", 0xFFFFFFFF);
    skgang = CreateDynamicObject(18766, 2467.934814, -2081.465576, 12.054876, 89.999992, 585.000000, 44.999889, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
    skgang = CreateDynamicObject(1280, 2466.455566, -2089.168701, 12.958026, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
    skgang = CreateDynamicObject(18766, 2461.882568, -2067.872802, 12.058876, 89.999992, 585.000000, 134.999893, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2451.521728, -2069.205810, 12.055875, 89.999992, 495.000000, -135.000106, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2451.899902, -2067.872802, 12.058876, 89.999992, 495.000000, -135.000106, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2441.537841, -2069.205810, 12.055875, 89.999992, 475.528747, -115.528831, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2441.916015, -2067.872802, 12.058876, 89.999992, 475.528747, -115.528831, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2431.547363, -2069.205810, 12.055875, 89.999992, 463.368438, -103.368507, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2431.925537, -2067.872802, 12.058876, 89.999992, 463.368438, -103.368507, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2429.465332, -2069.205810, 12.057875, 89.999992, 456.773956, -96.773994, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2429.843505, -2067.872802, 12.060875, 89.999992, 456.773956, -96.773994, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2434.897460, -2069.205810, 12.055875, 89.999992, 475.528747, -115.528831, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2458.721435, -2105.287109, 10.978007, 0.000000, 0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2429.837890, -2105.287109, 10.978007, 0.000000, 0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2439.700195, -2105.286132, 10.979005, 0.000000, 0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2457.480224, -2105.287109, 10.978007, 0.000000, 0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2429.792480, -2101.955566, 12.055874, 90.000000, 448.394775, 91.605178, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2429.414306, -2103.288574, 12.058876, 90.000000, 448.394775, 91.605178, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2439.094726, -2101.955566, 12.057874, 90.000000, 626.790222, -86.790267, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2437.445312, -2103.288574, 12.060874, 90.000000, 626.790222, -86.790267, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2439.094726, -2102.496093, 12.055873, 90.000000, 626.790222, -86.790267, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    SetDynamicObjectMaterial(skgang, 1, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(1280, 2460.046386, -2070.727539, 12.958027, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
    skgang = CreateDynamicObject(1280, 2439.000732, -2070.727539, 12.958027, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
    skgang = CreateDynamicObject(1280, 2439.000732, -2100.417480, 12.958026, 0.000000, 0.000000, 270.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
    skgang = CreateDynamicObject(9093, 2468.116210, -2107.237548, 16.425981, 0.000000, 84.500106, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, -1, "none", "none", 0xFFFFFFFF);
    skgang = CreateDynamicObject(19479, 2483.529052, -2105.788818, 14.537893, 0.000037, 0.000000, 269.999786, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
    SetDynamicObjectMaterialText(skgang, 0, "@", 130, "Webdings", 199, 1, 0xFFFFFFFF, 0x00000000, 0);
    skgang = CreateDynamicObject(18766, 2519.510009, -2108.265380, 10.978007, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.509033, -2098.403076, 10.979004, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.510009, -2128.065429, 10.978007, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.509033, -2118.203125, 10.979004, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.509033, -2138.062988, 10.979004, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.510009, -2139.537841, 10.978007, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2486.964355, -2095.640380, 12.819033, -0.000001, 90.000000, 450.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2486.964355, -2100.856689, 12.917934, -0.000000, 145.500106, 450.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(3934, 2512.960937, -2121.323974, 12.549507, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, -1, "none", "none", 0xFFFFFFFF);
    skgang = CreateDynamicObject(1676, 2487.988281, -2100.675537, 14.062011, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 1, 8589, "lwbldstuff03", "filmcase01_64", 0x00000000);
    SetDynamicObjectMaterial(skgang, 2, 8589, "lwbldstuff03", "filmcase01_64", 0x00000000);
    SetDynamicObjectMaterial(skgang, 3, 8589, "lwbldstuff03", "filmcase01_64", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.510009, -2088.474853, 10.978007, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.509033, -2078.752685, 10.979004, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18766, 2519.510009, -2071.313964, 10.978007, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18765, 2492.553710, -2074.186035, 10.063748, 0.000000, 0.000000, 360.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15034, "genhotelsave", "ab_mottleWhite", 0xFF999999);
    SetDynamicObjectMaterial(skgang, 1, -1, "none", "none", 0xFFAAAAAA);
    skgang = CreateDynamicObject(18765, 2484.390869, -2074.185546, 10.062747, 0.000000, 0.000000, 360.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15034, "genhotelsave", "ab_mottleWhite", 0xFF999999);
    SetDynamicObjectMaterial(skgang, 1, -1, "none", "none", 0xFFAAAAAA);
    skgang = CreateDynamicObject(18766, 2497.052490, -2078.133544, 10.978007, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(1280, 2495.333740, -2075.532714, 12.958026, 0.000000, 0.000000, -55.799991, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
    skgang = CreateDynamicObject(18766, 2476.849853, -2068.721679, 12.056876, 89.999992, 585.000000, 134.999893, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2486.849365, -2068.721679, 12.058876, 89.999992, 585.000000, 134.999893, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18766, 2492.552490, -2068.721679, 12.056876, 89.999992, 585.000000, 134.999893, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
    skgang = CreateDynamicObject(18762, 2497.051757, -2066.905517, 10.978011, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18762, 2497.052734, -2067.855468, 10.979010, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18762, 2497.051757, -2068.857421, 10.978011, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    skgang = CreateDynamicObject(18762, 2497.052734, -2069.827148, 10.979010, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    SetDynamicObjectMaterial(skgang, 0, 15041, "bigsfsave", "walp73S", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    skgang = CreateDynamicObject(869, 2468.753417, -2077.310546, 12.997874, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2468.833496, -2074.358398, 12.997874, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2468.733398, -2068.364013, 12.997874, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2468.973632, -2088.809082, 12.997874, 0.000000, 0.000022, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2468.973632, -2086.899169, 12.997874, 0.000000, 0.000022, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2466.876708, -2077.450683, 12.217877, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2466.876708, -2072.449951, 12.217877, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2464.804687, -2070.377197, 12.219878, 0.000000, 0.000007, 179.999908, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2466.876708, -2086.890869, 12.217877, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2466.876708, -2088.942871, 12.217877, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2468.948730, -2084.813476, 12.217877, 0.000007, 0.000000, 179.999877, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2468.948730, -2079.519287, 12.217877, 0.000007, 0.000000, 179.999877, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2115.793457, 11.808008, 0.000001, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2430.038574, -2076.778320, 11.808008, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2456.483642, -2070.377197, 12.217877, 0.000000, -0.000007, 179.999816, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2460.647216, -2070.378173, 12.217877, 0.000000, 0.000007, 179.999908, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2466.876708, -2075.351074, 12.217877, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2452.326171, -2070.378173, 12.217877, 0.000000, -0.000007, 179.999816, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2448.180419, -2070.377197, 12.217877, 0.000000, 0.000000, 179.999862, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2439.859375, -2070.377197, 12.217877, 0.000000, -0.000014, 179.999771, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2444.022949, -2070.378173, 12.217877, 0.000000, 0.000000, 179.999862, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2435.680908, -2070.377197, 12.217877, 0.000000, -0.000007, 179.999816, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2427.359863, -2070.377197, 12.217877, 0.000000, -0.000022, 179.999725, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2431.523437, -2070.378173, 12.217877, 0.000000, -0.000007, 179.999816, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2426.899414, -2070.377197, 12.217877, 0.000000, -0.000022, 179.999725, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2468.733398, -2071.356689, 12.997874, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2465.549804, -2068.316162, 12.997874, 0.000007, 0.000000, 179.999725, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2462.597656, -2068.236083, 12.997874, 0.000007, 0.000000, 179.999725, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2456.603271, -2068.336181, 12.997874, 0.000007, 0.000000, 179.999725, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2459.595947, -2068.336181, 12.997874, 0.000007, 0.000000, 179.999725, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2453.047607, -2068.316162, 12.997874, 0.000007, -0.000007, 179.999679, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2450.095458, -2068.236083, 12.997874, 0.000007, -0.000007, 179.999679, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2444.101074, -2068.336181, 12.997874, 0.000007, -0.000007, 179.999679, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2447.093750, -2068.336181, 12.997874, 0.000007, -0.000007, 179.999679, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2440.062744, -2068.316162, 12.997874, 0.000007, -0.000014, 179.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2437.110595, -2068.236083, 12.997874, 0.000007, -0.000014, 179.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2431.116210, -2068.336181, 12.997874, 0.000007, -0.000014, 179.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2434.108886, -2068.336181, 12.997874, 0.000007, -0.000014, 179.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2428.073242, -2068.336181, 12.997874, 0.000007, -0.000014, 179.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2427.022216, -2068.336181, 12.997874, 0.000007, -0.000014, 179.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2424.956054, -2076.778320, 11.808008, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(966, 2445.215576, -2105.285888, 12.575749, 0.000000, 0.000000, 180.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2442.160888, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2438.039794, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2433.908447, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2429.777343, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2426.201660, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2455.114990, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2459.276123, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2461.686767, -2105.265136, 13.928766, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2424.956054, -2074.267578, 11.809007, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.358154, -2071.838134, 11.808008, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.759521, -2076.778320, 11.808008, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.759521, -2074.267578, 11.809007, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2430.038574, -2074.267578, 11.809007, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2432.440673, -2071.838134, 11.808008, -0.000001, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2434.842041, -2076.778320, 11.808008, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2434.842041, -2074.267578, 11.809007, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2440.194335, -2076.778320, 11.808008, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2435.111816, -2076.778320, 11.808008, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2435.111816, -2074.267578, 11.809007, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2437.513916, -2071.838134, 11.808008, -0.000004, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2439.915283, -2076.778320, 11.808008, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2439.915283, -2074.267578, 11.809007, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2440.194335, -2074.267578, 11.809007, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2442.596435, -2071.838134, 11.808008, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2444.997802, -2076.778320, 11.808008, 0.000000, -0.000009, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2444.997802, -2074.267578, 11.809007, 0.000000, -0.000009, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2450.337890, -2076.778320, 11.808008, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2445.255371, -2076.778320, 11.808008, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2445.255371, -2074.267578, 11.809007, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2447.657470, -2071.838134, 11.808008, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2450.058837, -2076.778320, 11.808008, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2450.058837, -2074.267578, 11.809007, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2450.337890, -2074.267578, 11.809007, 0.000000, -0.000001, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2452.739990, -2071.838134, 11.808008, -0.000001, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2455.141357, -2076.778320, 11.808008, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2455.141357, -2074.267578, 11.809007, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2460.493652, -2076.778320, 11.808008, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2455.411132, -2076.778320, 11.808008, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2455.411132, -2074.267578, 11.809007, 0.000000, -0.000004, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2457.813232, -2071.838134, 11.808008, -0.000004, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2460.214599, -2076.778320, 11.808008, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2460.214599, -2074.267578, 11.809007, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2460.493652, -2074.267578, 11.809007, 0.000000, -0.000007, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2462.895751, -2071.838134, 11.808008, -0.000007, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2465.297119, -2076.778320, 11.808008, 0.000000, -0.000009, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2465.297119, -2074.267578, 11.809007, 0.000000, -0.000009, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.504394, -2099.670898, 11.808008, 0.000000, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.504394, -2094.588378, 11.808008, 0.000000, -0.000004, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2461.015136, -2094.588378, 11.809007, 0.000000, -0.000004, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2463.444580, -2096.990478, 11.808008, -0.000004, 0.000000, 0.000034, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.504394, -2099.391845, 11.808008, 0.000000, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2461.015136, -2099.391845, 11.809007, 0.000000, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2461.015136, -2099.670898, 11.809007, 0.000000, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2463.444580, -2102.072998, 11.808008, -0.000007, 0.000000, 0.000034, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.504394, -2104.474365, 11.808008, 0.000000, -0.000009, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2461.015136, -2104.474365, 11.809007, 0.000000, -0.000009, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2459.985839, -2085.404296, 11.808008, 0.000001, -0.000004, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2462.496582, -2085.404296, 11.809007, 0.000001, -0.000004, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2464.926025, -2087.806396, 11.808008, -0.000004, -0.000001, 0.000034, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2459.985839, -2090.207763, 11.808008, 0.000001, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2462.496582, -2090.207763, 11.809007, 0.000001, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2427.873535, -2100.784179, 12.219878, 0.000000, 0.000003, -0.000080, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2432.031005, -2100.783203, 12.217877, 0.000000, 0.000003, -0.000080, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2436.204833, -2100.784179, 12.221878, 0.000000, 0.000000, -0.000080, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2440.362304, -2100.783203, 12.219877, 0.000000, 0.000000, -0.000080, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2425.861572, -2100.784179, 12.219878, 0.000000, 0.000003, -0.000080, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2442.444335, -2102.865234, 12.219877, 0.000000, 0.000000, 89.999916, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2427.192382, -2102.949462, 12.997874, 0.000007, -0.000014, 359.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2430.634277, -2102.949462, 12.997874, 0.000007, -0.000014, 359.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2436.683593, -2102.949462, 12.997874, 0.000007, -0.000014, 359.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2440.317138, -2102.949462, 12.997874, 0.000007, -0.000014, 359.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2433.522216, -2102.949462, 12.997874, 0.000007, -0.000014, 359.999633, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19917, 2465.088623, -2098.307128, 12.553731, 0.000000, 0.000000, 54.599994, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19903, 2467.966552, -2096.943115, 12.553730, 0.000000, 0.000000, -101.299987, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19900, 2464.748779, -2099.525878, 12.648019, 0.499998, 0.000000, 18.500003, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19899, 2475.503173, -2104.089111, 12.553730, 0.000000, 0.000000, 180.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19627, 2470.991455, -2104.821777, 12.663735, 0.000000, 0.000000, 124.099998, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19308, 2475.503417, -2104.719726, 13.933746, 0.000000, 0.000000, -18.800003, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19899, 2465.681396, -2097.036865, 12.553731, 0.000000, 0.000000, 270.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(630, 2475.325195, -2097.248535, 13.678032, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19172, 2475.966552, -2098.963623, 14.918022, 0.000000, 0.000000, 270.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1558, 2475.252685, -2102.087646, 13.248017, 0.000000, 0.000000, 17.899997, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2476.965332, -2106.528320, 11.808008, 0.000007, -0.000004, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2479.476074, -2106.528320, 11.809007, 0.000007, -0.000004, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2481.905517, -2108.930419, 11.810008, -0.000004, -0.000007, 0.000034, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2476.965332, -2111.331787, 11.808008, 0.000007, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2479.476074, -2111.331787, 11.809007, 0.000007, -0.000007, -89.999969, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2110.731445, 11.808008, 0.000004, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2110.731445, 11.809007, 0.000004, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2425.058105, -2108.329345, 11.810008, -0.000007, -0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2105.927978, 11.808008, 0.000004, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2105.927978, 11.809007, 0.000004, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2115.793457, 11.809007, 0.000001, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2425.058105, -2113.391357, 11.810008, -0.000007, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2110.989990, 11.808008, 0.000001, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2110.989990, 11.809007, 0.000001, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2125.917480, 11.808008, 0.000000, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2120.855468, 11.808008, 0.000001, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2120.855468, 11.809007, 0.000001, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2425.058105, -2118.453369, 11.810008, -0.000007, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2116.052001, 11.808008, 0.000001, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2116.052001, 11.809007, 0.000001, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2125.917480, 11.809007, 0.000000, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2425.058105, -2123.515380, 11.810008, -0.000007, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2121.114013, 11.808008, 0.000000, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2121.114013, 11.809007, 0.000000, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2136.017578, 11.808008, 0.000000, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2130.955566, 11.808008, 0.000001, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2130.955566, 11.809007, 0.000001, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2425.058105, -2128.553466, 11.810008, -0.000007, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2126.152099, 11.808008, 0.000001, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2126.152099, 11.809007, 0.000001, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2136.017578, 11.809007, 0.000000, -0.000007, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2425.058105, -2133.615478, 11.810008, -0.000007, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2429.998291, -2131.214111, 11.808008, 0.000000, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2427.487548, -2131.214111, 11.809007, 0.000000, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2443.010498, -2139.176757, 11.808008, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2437.965820, -2139.176757, 11.808008, 0.000000, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2437.965820, -2141.687500, 11.809007, 0.000000, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2435.563720, -2144.116943, 11.810008, 0.000000, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2433.162353, -2139.176757, 11.808008, 0.000000, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2433.162353, -2141.687500, 11.809007, 0.000000, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2443.010498, -2141.687500, 11.809007, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2440.608398, -2144.116943, 11.810008, 0.000001, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2438.207031, -2139.176757, 11.808008, 0.000000, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2438.207031, -2141.687500, 11.809007, 0.000000, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2453.103759, -2139.176757, 11.808008, 0.000000, 0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2448.059082, -2139.176757, 11.808008, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2448.059082, -2141.687500, 11.809007, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2445.656982, -2144.116943, 11.810008, 0.000001, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2443.255615, -2139.176757, 11.808008, 0.000000, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2443.255615, -2141.687500, 11.809007, 0.000000, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2453.103759, -2141.687500, 11.809007, 0.000000, 0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2450.701660, -2144.116943, 11.810008, 0.000004, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2448.300292, -2139.176757, 11.808008, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2448.300292, -2141.687500, 11.809007, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2483.371582, -2139.176757, 11.809007, 0.000000, 0.000009, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.133056, -2139.176757, 11.808008, 0.000000, 0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.133056, -2141.687500, 11.809007, 0.000000, 0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2455.730957, -2144.116943, 11.810008, 0.000004, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2453.329589, -2139.176757, 11.808008, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2453.329589, -2141.687500, 11.809007, 0.000000, 0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2483.371582, -2141.687500, 11.810008, 0.000000, 0.000009, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2480.969482, -2144.116943, 11.811008, 0.000009, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2478.568115, -2139.176757, 11.809007, 0.000000, 0.000007, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2478.568115, -2141.687500, 11.810008, 0.000000, 0.000007, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2493.463623, -2139.176757, 11.809007, 0.000000, 0.000017, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2488.418945, -2139.176757, 11.809007, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2488.418945, -2141.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2486.016845, -2144.116943, 11.811008, 0.000014, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2483.615478, -2139.176757, 11.809007, 0.000000, 0.000012, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2483.615478, -2141.687500, 11.810008, 0.000000, 0.000012, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2493.463623, -2141.687500, 11.810008, 0.000000, 0.000017, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2491.061523, -2144.116943, 11.811008, 0.000017, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2488.660156, -2139.176757, 11.809007, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2488.660156, -2141.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2493.463623, -2134.687500, 11.810008, 0.000000, 0.000017, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2488.660156, -2134.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2488.418945, -2134.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2483.615478, -2134.687500, 11.810008, 0.000000, 0.000012, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2503.563720, -2139.176757, 11.810008, 0.000000, 0.000017, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2498.519042, -2139.176757, 11.809007, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2498.519042, -2141.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2496.116943, -2144.116943, 11.811008, 0.000014, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2493.715576, -2139.176757, 11.809007, 0.000000, 0.000012, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2493.715576, -2141.687500, 11.810008, 0.000000, 0.000012, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2503.563720, -2141.687500, 11.810008, 0.000000, 0.000017, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2501.161621, -2144.116943, 11.811008, 0.000017, 0.000000, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2498.760253, -2139.176757, 11.809007, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2498.760253, -2141.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2503.563720, -2134.687500, 11.810008, 0.000000, 0.000017, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2498.760253, -2134.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2498.519042, -2134.687500, 11.810008, 0.000000, 0.000014, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2493.715576, -2134.687500, 11.810008, 0.000000, 0.000012, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2095.471923, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2099.593017, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2103.724365, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2107.855468, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2111.991943, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2116.113037, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2120.244384, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2124.375488, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2128.521972, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2132.643066, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2136.774414, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2140.905517, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2143.006591, 13.928766, -0.000007, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(14410, 2484.438232, -2099.970703, 14.632033, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(11393, 2493.682373, -2093.633789, 14.047730, 0.000000, 0.000000, 180.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1169, 2488.257568, -2095.350097, 12.967660, 0.100000, 39.699943, -131.100067, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1438, 2488.675781, -2094.862548, 12.547726, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19308, 2487.823974, -2096.711669, 12.687729, 0.000000, 0.000000, -39.299995, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2083.180664, 11.808008, -0.000004, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2078.118652, 11.808008, -0.000003, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2078.118652, 11.809006, -0.000003, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2497.989257, -2075.716552, 11.810008, -0.000006, 0.000003, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2073.315185, 11.808008, -0.000003, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2073.315185, 11.809006, -0.000003, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2083.180664, 11.809006, -0.000004, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2497.989257, -2080.778564, 11.810008, -0.000006, 0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2078.377197, 11.808008, -0.000004, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2078.377197, 11.809006, -0.000004, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2093.280761, 11.808008, -0.000004, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2088.218750, 11.808008, -0.000003, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2088.218750, 11.809006, -0.000003, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2497.989257, -2085.816650, 11.810008, -0.000006, 0.000003, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2083.415283, 11.808008, -0.000003, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2083.415283, 11.809006, -0.000003, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2093.280761, 11.809006, -0.000004, -0.000006, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2497.989257, -2090.878662, 11.810008, -0.000006, 0.000004, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2502.929443, -2088.477294, 11.808008, -0.000004, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2500.418701, -2088.477294, 11.809006, -0.000004, -0.000009, 90.000030, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2468.229248, -2139.173339, 11.808008, -0.000004, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2463.167236, -2139.173339, 11.808008, -0.000003, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2463.167236, -2141.684082, 11.809006, -0.000003, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2460.765136, -2144.113525, 11.810008, 0.000000, 0.000003, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.363769, -2139.173339, 11.808008, -0.000003, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2458.363769, -2141.684082, 11.809006, -0.000003, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2468.229248, -2141.684082, 11.809006, -0.000004, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2465.827148, -2144.113525, 11.810008, 0.000000, 0.000004, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2463.425781, -2139.173339, 11.808008, -0.000004, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2463.425781, -2141.684082, 11.809006, -0.000004, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2478.329345, -2139.173339, 11.808008, -0.000004, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2473.267333, -2139.173339, 11.808008, -0.000003, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2473.267333, -2141.684082, 11.809006, -0.000003, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2470.865234, -2144.113525, 11.810008, 0.000000, 0.000003, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2468.463867, -2139.173339, 11.808008, -0.000003, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2468.463867, -2141.684082, 11.809006, -0.000003, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2478.329345, -2141.684082, 11.809006, -0.000004, 0.000000, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2475.927246, -2144.113525, 11.810008, 0.000000, 0.000004, -89.999931, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2473.525878, -2139.173339, 11.808008, -0.000004, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2473.525878, -2141.684082, 11.809006, -0.000004, -0.000001, -179.999938, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19900, 2497.103027, -2093.974365, 12.604384, 0.499998, 0.000000, 18.500003, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2070.706787, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2074.827880, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2078.959228, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2083.090332, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2087.226806, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2091.347900, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2519.488037, -2067.614746, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1723, 2483.387207, -2074.238037, 12.562747, 0.000000, 0.000000, 95.499946, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1723, 2487.183837, -2075.656005, 12.563748, 0.000000, 0.000000, 180.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(2315, 2485.963134, -2073.373535, 12.563748, 0.000000, 0.000000, 109.900009, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1668, 2485.802734, -2073.632080, 13.212762, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1668, 2485.262207, -2072.271972, 13.212762, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1668, 2485.502441, -2071.781494, 13.212762, 0.000000, 0.000000, 31.000003, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1667, 2485.968994, -2073.735839, 13.142761, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1667, 2485.601562, -2073.538330, 13.142764, 0.000000, 0.000000, 14.300001, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1665, 2485.706787, -2072.767822, 13.072759, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(2854, 2485.573974, -2072.042724, 12.632749, 0.000000, 0.000000, 102.499984, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(2670, 2485.529785, -2073.829101, 12.652750, 0.000000, 0.000000, 147.899978, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(630, 2483.282958, -2075.730468, 13.552763, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19831, 2483.005371, -2070.376708, 12.562747, 0.000000, 0.000000, 73.700004, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19578, 2483.020996, -2070.030273, 13.382740, 0.000000, 0.000000, -176.099990, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(630, 2488.695556, -2075.730468, 13.552763, 0.000000, 0.000000, 0.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2497.050537, -2075.538574, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19815, 2487.454833, -2096.676757, 14.337731, 0.000000, 0.000000, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2508.993896, -2070.593994, 11.808008, -0.000004, -0.000009, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2514.055908, -2070.593994, 11.808008, -0.000003, -0.000009, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2514.055908, -2069.034179, 11.809006, -0.000003, -0.000006, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2516.458007, -2066.604736, 11.810008, -0.000006, 0.000003, 90.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2518.859375, -2070.593994, 11.808008, -0.000003, -0.000012, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2518.859375, -2069.034179, 11.809006, -0.000003, -0.000009, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2508.993896, -2069.034179, 11.809006, -0.000004, -0.000006, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2511.395996, -2066.604736, 11.810008, -0.000006, 0.000004, 90.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2513.797363, -2070.593994, 11.808008, -0.000004, -0.000012, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(19866, 2513.797363, -2069.034179, 11.809006, -0.000004, -0.000009, 0.000068, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2472.326904, -2068.364013, 12.997874, 0.000000, 0.000007, 89.999900, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2484.433349, -2067.212890, 12.997874, 0.000000, 0.000007, 179.999908, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2479.311767, -2068.215576, 12.997874, 0.000000, 0.000007, 172.299743, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2488.197021, -2067.312988, 12.997874, 0.000000, 0.000007, 179.999908, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2495.330078, -2067.312988, 12.997874, 0.000000, 0.000007, 179.999908, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(869, 2491.809814, -2067.312988, 12.997874, 0.000000, 0.000007, 179.999908, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2491.196289, -2069.172851, 12.217877, 0.000000, -0.000009, 179.999771, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2495.359863, -2069.173828, 12.217877, 0.000000, 0.000000, -0.000125, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2487.017822, -2069.172851, 12.217877, 0.000000, -0.000000, 179.999801, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2482.860351, -2069.173828, 12.217877, 0.000000, -0.000000, 179.999801, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(970, 2497.050537, -2067.884033, 13.928766, -0.000009, -0.000003, 90.000000, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(2855, 2493.646240, -2076.066162, 12.563748, 0.000000, 0.000000, 134.200057, 0,  0, -1, 500.00, 500.00); 
    skgang = CreateDynamicObject(1558, 2475.478271, -2100.778808, 13.248017, 0.000000, 0.000000, -0.400009, 0,  0, -1, 500.00, 500.00); 

	//Tutaj wstawiamy obiekty w następującym formacie:
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	return 1;
}

static StworzBramy()
{
    skgang = CreateDynamicObject(968, 2445.194580, -2105.291992, 13.335743, 0.000000, 360.000000, 180.000000, 0,  0, -1, 500.00, 500.00); 
    DodajBrame(skgang, 2445.194580, -2105.291992, 13.335743, 0.000000, 360.000000, 180.000000, 2445.194580, -2105.291992, 13.335743, 0.000000, 270.000000, 180.000000, 2, 10, 1, 10);
	//Tutaj wstawiamy bramy w formacie: 
		// DodajBrame(fobiekt, Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, Float:fspeed, Float:frange, fuprtyp=0, fuprval=0)
		// fuprtyp - TYPY UPRAWNIEŃ:
			//0 - BRAK
			//1 - FRAKCJA
			//2 - RODZINA
			//3 - BIZNES
		// fuprval - numer frakcji/rodziny
	
		//DualGateAdd(...rozpisane w głównym README) 
	return 1;
}

static StworzBudynki()
{
    DodajWejscie(2474.3645, -2085.3296, 14.1538, 2463.4041, -2085.2954, 14.0479, 0, 0, 33, 0, "Korporacja Transportowa", "Wyjdź"); 
	//Tutaj wstawiamy wejścia w formacie:
	//DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="", wejdzUID=0, playerLocal=255, bool:specialCome=false); 
	return 1;
}

static UsunObiekty(playerid)
{
    RemoveBuildingForPlayer(playerid, 3643, 2475.100, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3745, 2475.100, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3643, 2482.020, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3745, 2482.020, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3643, 2489.100, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3745, 2489.100, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3643, 2496.090, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3745, 2496.090, -2073.479, 17.820, 0.250);
    RemoveBuildingForPlayer(playerid, 3256, 2503.129, -2073.379, 12.429, 0.250);
    RemoveBuildingForPlayer(playerid, 3290, 2503.129, -2073.379, 12.429, 0.250);
    RemoveBuildingForPlayer(playerid, 3256, 2515.419, -2073.379, 12.406, 0.250);
    RemoveBuildingForPlayer(playerid, 3290, 2515.419, -2073.379, 12.406, 0.250);
    RemoveBuildingForPlayer(playerid, 3755, 2484.229, -2118.550, 17.703, 0.250);
    RemoveBuildingForPlayer(playerid, 3756, 2484.229, -2118.550, 17.703, 0.250);
    RemoveBuildingForPlayer(playerid, 1307, 2462.870, -2064.770, 12.320, 0.250);
    RemoveBuildingForPlayer(playerid, 3256, 2452.959, -2129.020, 25.273, 0.250);
    RemoveBuildingForPlayer(playerid, 3290, 2452.959, -2129.020, 25.273, 0.250);
    RemoveBuildingForPlayer(playerid, 3257, 2432.729, -2133.020, 12.453, 0.250);
    RemoveBuildingForPlayer(playerid, 3288, 2432.729, -2133.020, 12.453, 0.250);
    RemoveBuildingForPlayer(playerid, 3258, 2496.060, -2141.010, 12.187, 0.250);
    RemoveBuildingForPlayer(playerid, 3289, 2496.060, -2141.010, 12.187, 0.250);
    RemoveBuildingForPlayer(playerid, 3258, 2484.409, -2141.010, 12.187, 0.250);
    RemoveBuildingForPlayer(playerid, 3289, 2484.409, -2141.010, 12.187, 0.250);
    RemoveBuildingForPlayer(playerid, 3244, 2535.090, -2131.879, 12.992, 0.250);
    RemoveBuildingForPlayer(playerid, 3244, 2532.030, -2074.629, 12.992, 0.250);
    RemoveBuildingForPlayer(playerid, 3627, 2448.129, -2075.629, 16.046, 0.250);
    RemoveBuildingForPlayer(playerid, 3686, 2448.129, -2075.629, 16.046, 0.250);
    RemoveBuildingForPlayer(playerid, 3567, 2438.360, -2075.840, 13.257, 0.250);
    RemoveBuildingForPlayer(playerid, 3567, 2446.830, -2075.840, 13.257, 0.250);
    RemoveBuildingForPlayer(playerid, 1308, 2428.389, -2066.629, 12.679, 0.250);
    RemoveBuildingForPlayer(playerid, 1308, 1415.130, 363.414, 18.015, 0.250);
    RemoveBuildingForPlayer(playerid, 1410, 1393.030, 261.281, 19.179, 0.250);
    RemoveBuildingForPlayer(playerid, 5150, 2482.699, -2010.969, 23.601, 0.250);
    RemoveBuildingForPlayer(playerid, 5295, 2413.050, -2106.419, 23.054, 0.250);
    RemoveBuildingForPlayer(playerid, 5295, 2413.050, -2106.419, 23.054, 0.250);
    RemoveBuildingForPlayer(playerid, 5292, 2390.169, -2033.819, 23.828, 0.250);
    RemoveBuildingForPlayer(playerid, 5367, 2413.050, -2106.419, 23.054, 0.250);
	//Tutaj wstawiamy usuwanie obiektów z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);
	return 1;
}