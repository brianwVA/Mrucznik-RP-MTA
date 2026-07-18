//InteriorKaretki.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: InteriorKaretki.pwn ]--------------------------------------------//
//Autor: 
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
InteriorKaretki_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	/////////////
	///KARETKA///
	/////////////
	//Podloga
	gateob = CreateDynamicObject(19377, 1082.92090, -1313.85168, 20.53920,   0.00000, 90.00000, 0.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 14383, "burg_1", "wall6", 0);
	//Drzwi
	new d1 = CreateDynamicObject(3089, 1078.03735, -1309.11047, 21.84780,   0.00000, 0.00000, 0.00000, -1, 1);
	new d2 = CreateDynamicObject(3089, 1081.02234, -1309.11047, 21.84780,   0.00000, 0.00000, 180.00000, -1, 1);
    SetDynamicObjectMaterial(d1, 1, 2151, "cj_kitchen", "CJ_RED", 0);
    SetDynamicObjectMaterial(d2, 1, 2151, "cj_kitchen", "CJ_RED", 0);
    SetDynamicObjectMaterial(d1, 2, 14383, "burg_1", "wall6", 0);
    SetDynamicObjectMaterial(d2, 2, 14383, "burg_1", "wall6", 0);
	//sciany
	gateob = CreateDynamicObject(19460, 1077.93750, -1313.86328, 21.73170,   0.00000, 0.00000, 0.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 14383, "burg_1", "wall6", 0);
	gateob = CreateDynamicObject(19460, 1081.09180, -1313.87964, 21.73170,   0.00000, 0.00000, 0.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 14383, "burg_1", "wall6", 0);
	gateob = CreateDynamicObject(19460, 1079.64441, -1313.25513, 21.73170,   0.00000, 0.00000, 90.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 14383, "burg_1", "wall6", 0);
	//Akcesoria karetki
	CreateDynamicObject(1997, 1080.54089, -1311.06189, 20.32700,   0.00000, 0.00000, 180.00000, -1, 1);
	CreateDynamicObject(2154, 1078.22253, -1310.63220, 20.51420,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2151, 1078.21399, -1311.99475, 20.51420,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2153, 1078.19128, -1312.69238, 20.51420,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2343, 1080.3702, -1312.6514, 21.2414,   0.00000, 0.00000, 180.00000, -1, 1);
	CreateDynamicObject(2709, 1078.10339, -1312.36035, 21.68910,   0.00000, 0.00000, 0.00000, -1, 1);
	CreateDynamicObject(2966, 1078.57813, -1312.34717, 21.59130,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2344, 1078.50500, -1312.18420, 21.56580,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2685, 1078.06531, -1310.62134, 21.86770,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2684, 1078.05981, -1311.28003, 21.80170,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2684, 1078.07336, -1311.84863, 21.86770,   0.00000, 0.00000, 90.00000, -1, 1);
	CreateDynamicObject(2687, 1078.07739, -1311.30884, 21.83970,   0.00000, 0.00000, 90.00000, -1, 1);
    CreateDynamicObject(3384, 1081.1053, -1311.9226, 21.9358,   0.00000, 180.00000, 180.00000, -1, 1);
	//Boki bcian
	gateob = CreateDynamicObject(18762, 1081.49597, -1311.59766, 21.64820,   0.00000, 90.00000, 90.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 2151, "cj_kitchen", "CJ_RED", 0);
	gateob = CreateDynamicObject(18762, 1079.51868, -1313.65698, 21.64820,   0.00000, 90.00000, 0.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 2151, "cj_kitchen", "CJ_RED", 0);
	gateob = CreateDynamicObject(18762, 1077.54077, -1311.59753, 21.64820,   0.00000, 90.00000, 90.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  0, 2151, "cj_kitchen", "CJ_RED", 0);
	//Monitory
	gateob = CreateDynamicObject(2775, 1078.86194, -1313.16626, 22.60070,   0.00000, 0.00000, 180.00000, -1, 1);
	SetDynamicObjectMaterial(gateob,  2, 2151, "cj_kitchen", "CJ_WOOD5", 0);
	//Obraz
	CreateDynamicObject(19174, 1079.28503, -1309.10339, 22.29109,   0.00000, 0.00000, 0.00000, -1, 1);
	//Sufit
    gateob = CreateDynamicObject(19377, 1082.92090, -1313.85168, 23.29000,   0.00000, 90.00000, 0.00000, -1, 1);
    SetDynamicObjectMaterial(gateob,  0, 14383, "burg_1", "wall6", 0);

	return 1;
}
