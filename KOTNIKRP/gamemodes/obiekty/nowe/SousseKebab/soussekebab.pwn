//soussekebab.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Moduł: soussekebab.pwn ]--------------------------------------------//
//Autor: Trix
//Data utworzenia: 17.06.2021
//Załączono plik .DB: NIE
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
soussekebabtrix_Init() //tą metodę wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jeżeli chcemy stworzyć jakieś obiekty
	StworzBramy();//To wykorzystujemy jeżeli chcemy stworzyć jakieś bramy
	StworzBudynki();//To wykorzystujemy jeżeli chcemy stworzyć jakieś wejścia 
	return 1;
}

soussekebabtrix_Connect(playerid)
{
    UsunObiekty(playerid);
    return 1;
}

//-----------------<[ Funkcje: ]>-------------------

static UsunObiekty(playerid)
{
    RemoveBuildingForPlayer(playerid, 1215, 377.453, -1897.280, 7.375, 0.250);
    RemoveBuildingForPlayer(playerid, 1280, 378.460, -1902.819, 7.210, 0.250);
    RemoveBuildingForPlayer(playerid, 1215, 384.429, -1904.130, 7.375, 0.250);
    RemoveBuildingForPlayer(playerid, 1232, 374.796, -1942.540, 9.500, 0.250);
    return 1;
}

static StworzObiekty()
{
	//Tutaj wstawiamy obiekty w następującym formacie:
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	/// ======= INTERIOR
	trix = CreateDynamicObject(-3007, 393.031219, -1899.866210, 6.835937, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	trix = CreateDynamicObject(-3003, 389.680816, -1893.502441, 8.698755, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 10806, "airfence_sfse", "ws_oldpainted", 0xFF909090);
	trix = CreateDynamicObject(-3003, 392.890838, -1893.502441, 8.698755, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 10806, "airfence_sfse", "ws_oldpainted", 0xFF909090);
	trix = CreateDynamicObject(-3003, 396.100830, -1893.502441, 8.698755, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 10806, "airfence_sfse", "ws_oldpainted", 0xFF909090);
	trix = CreateDynamicObject(-3003, 396.100830, -1904.702392, 8.698755, 0.000000, 0.000000, 270.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 10806, "airfence_sfse", "ws_oldpainted", 0xFF909090);
	trix = CreateDynamicObject(-3003, 392.890838, -1904.702392, 8.698755, 0.000000, 0.000000, 270.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 10806, "airfence_sfse", "ws_oldpainted", 0xFF909090);
	trix = CreateDynamicObject(-3003, 389.680847, -1904.702392, 8.698755, 0.000000, 0.000000, 270.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 10806, "airfence_sfse", "ws_oldpainted", 0xFF909090);
	trix = CreateDynamicObject(-3003, 397.722198, -1903.032714, 8.698755, 360.000000, 0.000000, 720.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 397.722198, -1899.822753, 8.698755, 360.000000, 0.000000, 720.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 397.722198, -1896.612792, 8.698755, 360.000000, 0.000000, 720.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 388.152191, -1896.612792, 6.258753, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 388.152191, -1899.822753, 6.258756, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 388.152191, -1903.032714, 6.258755, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3007, 393.031219, -1899.866210, 10.435935, 0.000000, 180.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(2639, 389.309509, -1904.192382, 7.588764, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(-3003, 388.152191, -1899.822753, 11.498755, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 388.152191, -1903.032714, 11.498755, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 388.152191, -1905.852783, 8.698755, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(2639, 389.339538, -1900.769042, 7.588764, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(2639, 389.314514, -1900.108398, 7.593763, 0.000000, 0.000000, 360.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(2639, 389.339538, -1896.677612, 7.588764, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(-3007, 393.031219, -1889.866088, 6.835937, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	trix = CreateDynamicObject(-3007, 393.031219, -1889.866210, 10.435935, 0.000000, 180.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(-3003, 388.152191, -1896.612792, 11.498758, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 388.154174, -1894.904296, 8.698763, 360.000000, 0.000000, 900.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(-3003, 397.722198, -1893.402832, 8.698755, 360.000000, 0.000000, 720.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	trix = CreateDynamicObject(1897, 388.161132, -1904.331909, 8.658772, 0.000000, 180.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.131103, -1896.418701, 8.658772, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.131103, -1897.639892, 7.908757, 90.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.131103, -1899.829711, 7.908757, 90.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.131103, -1902.051879, 7.908757, 90.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.131103, -1904.274047, 7.908757, 90.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.151123, -1897.639892, 9.848773, 270.000000, 360.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.151123, -1899.872070, 9.848773, 270.000000, 360.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.151123, -1902.093139, 9.848773, 270.000000, 360.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(1897, 388.151123, -1904.322753, 9.848773, 270.000000, 360.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 18065, "ab_sfammumain", "plywood_gym", 0x00000000);
	trix = CreateDynamicObject(980, 388.146362, -1900.912719, 8.838781, 0.000000, 0.000000, 630.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(trix, 4, 14581, "ab_mafiasuitea", "barbersmir1", 0xAAD0EFFF);
	SetDynamicObjectMaterial(trix, 5, 19480, "signsurf", "sign", 0x00000000);
	SetDynamicObjectMaterial(trix, 6, 19962, "samproadsigns", "leftturnsign", 0x00000000);
	SetDynamicObjectMaterial(trix, 7, 19962, "samproadsigns", "leftturnsign", 0x00000000);
	SetDynamicObjectMaterial(trix, 9, 19962, "samproadsigns", "leftturnsign", 0x00000000);
	trix = CreateDynamicObject(1493, 388.269500, -1895.737670, 6.978754, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.225524, -1904.611206, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.225524, -1904.611206, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 395.225524, -1904.611206, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 397.225524, -1904.611206, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.225524, -1893.605224, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.225524, -1893.605224, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 395.225524, -1893.605224, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 397.225524, -1893.605224, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 389.225524, -1893.605224, 6.978748, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(-3010, 393.572601, -1895.143920, 9.118764, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 1, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3010, 393.572601, -1898.353881, 9.118764, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 1, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3010, 393.562591, -1895.143920, 6.928762, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 1, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3010, 393.562591, -1898.353881, 6.928762, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 1, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(19940, 393.535522, -1898.599853, 7.168753, 0.000000, 90.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.535522, -1896.599853, 7.168753, 0.000000, 90.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.535522, -1894.599853, 7.168753, 0.000000, 90.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.535522, -1894.599853, 7.608753, 0.000000, 90.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.535522, -1896.599853, 7.608753, 0.000000, 90.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.535522, -1898.599853, 7.608753, 0.000000, 90.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.435424, -1898.960205, 8.218750, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.435424, -1896.960205, 8.218750, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.435424, -1894.960205, 8.218750, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.435424, -1892.960205, 8.218750, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(2430, 393.660430, -1895.121459, 9.388762, 0.000000, 0.000000, -90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	SetDynamicObjectMaterial(trix, 4, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19087, 397.088684, -1895.118164, 10.348776, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	trix = CreateDynamicObject(19087, 397.088684, -1898.848632, 10.348776, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 1560, "7_11_door", "CJ_CHROME2", 0x00000000);
	trix = CreateDynamicObject(-3003, 393.572387, -1904.785522, 8.678753, 360.000000, 0.000000, 720.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 4, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3012, 393.571746, -1901.569335, 8.458772, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 1, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 4, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 5, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3012, 395.132415, -1900.298095, 8.458772, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 1, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 4, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 5, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3003, 398.353149, -1900.298706, 8.678753, 360.000000, 0.000000, 810.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 12855, "cunte_cop", "sw_brick05", 0xFF909090);
	SetDynamicObjectMaterial(trix, 2, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	SetDynamicObjectMaterial(trix, 4, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	trix = CreateDynamicObject(-3019, 393.543823, -1901.604248, 6.968750, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(-3019, 395.094635, -1900.302978, 6.968750, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(1499, 394.334899, -1900.293823, 6.888748, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	trix = CreateDynamicObject(19940, 390.905334, -1892.607910, 8.248751, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.672546, -1892.607910, 8.455534, 0.000000, 95.999984, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.189483, -1892.607910, 8.872944, 0.000000, 82.300018, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.585052, -1892.607910, 9.290919, 0.000000, 95.999984, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.855285, -1892.607910, 8.668762, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.935363, -1892.607910, 8.668762, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.015441, -1892.607910, 9.088770, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.825256, -1892.607910, 9.088770, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.765197, -1892.607910, 9.508763, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.075500, -1892.607910, 9.508763, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.075500, -1892.607910, 9.538763, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.765197, -1892.607910, 9.538763, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.815246, -1892.607910, 9.118771, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.015441, -1892.607910, 9.118771, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.855285, -1892.607910, 8.698761, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.945373, -1892.607910, 8.698761, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.614898, -1892.607910, 9.294054, 0.000000, 95.999984, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.159729, -1892.607910, 8.876964, 0.000000, 82.300018, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.702392, -1892.607910, 8.458670, 0.000000, 95.999984, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 390.905334, -1892.607910, 8.278753, 0.000000, 180.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19610, 390.931243, -1893.442871, 9.558772, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19610, 390.931243, -1893.442871, 9.588771, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19610, 390.931243, -1893.442871, 9.628772, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19610, 390.931243, -1893.442871, 8.218750, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19610, 390.931243, -1893.442871, 8.188751, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19328, 389.568328, -1893.602905, 8.798768, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(trix, 0, "SOUSSE", 100, "Ariel", 70, 1, 0xFFD4AF37, 0x00000000, 1);
	trix = CreateDynamicObject(19328, 392.168457, -1893.602905, 8.798768, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(trix, 0, "KEBAB", 100, "Ariel", 70, 1, 0xFFD4AF37, 0x00000000, 1);
	trix = CreateDynamicObject(2420, 389.559417, -1896.213256, 6.898747, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 1, 19480, "signsurf", "sign", 0x00000000);
	trix = CreateDynamicObject(19940, 391.225524, -1904.611206, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.225524, -1904.611206, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 395.225524, -1904.611206, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 397.225524, -1904.611206, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 391.225524, -1893.605224, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 393.225524, -1893.605224, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 395.225524, -1893.605224, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 397.225524, -1893.605224, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 389.225524, -1893.605224, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(19940, 389.225524, -1904.611206, 10.428749, 0.000000, 90.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(2642, 393.471557, -1903.192749, 8.598758, 0.000000, 0.000000, -90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 2, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 3, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	trix = CreateDynamicObject(1408, 390.839141, -1904.670898, 10.488801, 180.000000, 0.000000, 360.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(1408, 390.839141, -1893.537475, 10.488801, 180.000000, 0.000000, 540.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(-3019, 388.123565, -1894.960571, 7.018751, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 0, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	SetDynamicObjectMaterial(trix, 1, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(1514, 393.483551, -1894.501708, 8.468763, 0.000000, 0.000000, 270.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 2, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	trix = CreateDynamicObject(1514, 393.483551, -1897.702880, 8.468763, 0.000000, 0.000000, 270.000000, 22, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(trix, 2, 14803, "bdupsnew", "Bdup2_wallpaperB", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	trix = CreateDynamicObject(2637, 389.326690, -1902.494506, 7.358757, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2637, 389.326690, -1898.414794, 7.358757, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2419, 397.014129, -1895.957641, 6.968750, 0.000000, 0.000000, -90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2451, 396.989807, -1894.057617, 6.968750, 0.000000, 0.000000, -90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2451, 396.989807, -1897.848754, 6.968750, 0.000000, 0.000000, -90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2451, 396.989807, -1894.988525, 10.848806, 180.000000, 0.000000, 450.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2451, 396.989807, -1898.720092, 10.848806, 180.000000, 0.000000, 450.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2806, 397.096282, -1895.142944, 8.979666, 112.799667, 83.999961, 0.899999, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2806, 397.096282, -1898.832885, 8.979666, 112.799667, 83.999961, 0.899999, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2443, 397.273345, -1899.748657, 6.968750, 0.000000, 0.000000, 270.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(11729, 393.952453, -1904.261230, 6.968750, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(11729, 393.952453, -1903.580566, 6.968750, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(11729, 393.952453, -1902.899902, 6.968750, 0.000000, 0.000000, 90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2803, 396.954254, -1901.117797, 7.438757, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(1702, 397.395843, -1904.075927, 6.968750, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2011, 393.023895, -1904.162841, 6.968750, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2011, 390.633514, -1900.451660, 6.968750, 0.000000, 0.000000, 42.699981, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2011, 390.633514, -1896.451660, 6.968750, 0.000000, 0.000000, 42.699981, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2837, 389.144104, -1898.374633, 7.798754, 0.000000, 0.000000, 34.299995, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2004, 397.630462, -1900.988769, 8.308744, 0.000000, 0.000000, -90.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(19173, 396.447601, -1904.609863, 8.828767, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(18075, 393.221862, -1899.185302, 10.368796, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(2804, 397.075866, -1896.695434, 7.968731, 0.000000, 0.000000, 46.799995, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(19811, 397.388275, -1897.199584, 7.978752, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(19811, 397.388275, -1897.199584, 8.098753, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(19812, 395.973602, -1893.969116, 7.498755, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(1486, 396.968536, -1899.489501, 7.678754, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(1486, 397.078643, -1899.639648, 7.678754, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 
	trix = CreateDynamicObject(1486, 397.078643, -1899.829833, 8.598773, 0.000000, 0.000000, 0.000000, 22, -1, -1, 300.00, 300.00); 

	// ======= EXTERIOR

    tmpobjid = CreateDynamicObject(970, 386.289520, -1892.930786, 7.330090, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(970, 382.189453, -1892.930786, 7.330090, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(970, 382.189453, -1899.180541, 7.330090, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(970, 386.299438, -1899.180541, 7.330090, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(7313, 387.751922, -1896.422485, 9.275937, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FF0000} Sousse Kebab", 70, "Ariel", 30, 0, 0x00000000, 0x00000001, 1);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(1968, 387.315856, -1894.368774, 7.295937, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1968, 384.405792, -1894.368774, 7.295937, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1968, 381.235748, -1894.368774, 7.295937, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1232, 374.796997, -1911.379516, 9.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2222, 381.245941, -1894.437011, 7.615935, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2222, 384.375976, -1894.437011, 7.615935, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2222, 387.365997, -1894.437011, 7.615935, 0.000000, 0.000000, 61.200000, -1, -1, -1, 300.00, 300.00); 

	//CreateDynamic3DTextLabel("Aby kupić jedzenie wpisz /kupjedzenie", COLOR_WHITE,392.8683,-1896.6530,7.9687, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 22);
    return 1;
}

static StworzBramy()
{
	//Tutaj wstawiamy bramy w formacie: 
		// DodajBrame(fobiekt, Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, Float:fspeed, Float:frange, fuprtyp=0, fuprval=0)
		// fuprtyp - TYPY UPRAWNIEŃ:
			//0 - BRAK
			//1 - FRAKCJA
			//2 - RODZINA
		// fuprval - numer frakcji/rodziny
    // ======= BIURA
	//trix = CreateDynamicObject(2959, 393.491851, -1900.823120, 6.868747, 0.000000, 0.000000, 180.000000, 22, -1, -1, 300.00, 300.00); 
	//SetDynamicObjectMaterial(trix, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    //(trix, 393.491851, -1900.823120, 6.868747, 0.000000, 0.000000, 180.000000, 393.491851, -1900.823120, 6.868747, 0.000000, 0.000000, 240.000000, 2, 2, BRAMA_UPR_TYPE_GROUP, -1); GRUPA DO PRZYPISANIA
	
		//DualGateAdd(...rozpisane w głównym README) 
	return 1;
}

static StworzBudynki()
{
	//Tutaj wstawiamy wej?cia w formacie:
	//DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="", wejdzUID=0, playerLocal=255, bool:specialCome=false); 
    DodajWejscie(387.9594,-1897.0111,7.8359, 388.923675, -1895.046142, 7.968750, 0, 0, 22, 0,"Sousse Kebab", "Wyjście", 13);//Do kebsa
}