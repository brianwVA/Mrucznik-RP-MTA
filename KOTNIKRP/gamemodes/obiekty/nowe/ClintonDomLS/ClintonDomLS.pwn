//ClintonDomLS.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: ClintonDomLS.pwn ]--------------------------------------------//
//Autor: Just_Miko
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
ClintonDomLS_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

ClintonDomLS_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	tmpobjid = CreateDynamicObject(19447, 698.416137, -1665.221069, 1.738566, 0.000000, 0.000000, 90.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "sandytar_64HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 689.505737, -1665.221069, 1.738566, 0.000000, 0.000000, 90.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "sandytar_64HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 684.607604, -1660.489379, 1.738566, 0.000000, 0.000000, 180.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "sandytar_64HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 684.607604, -1650.865356, 1.738566, 0.000000, 0.000000, 180.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3896, "indust1", "sandytar_64HV", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 686.441284, -1663.653686, 2.114492, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 686.441284, -1660.470703, 2.114492, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 686.441284, -1657.269775, 2.114598, 0.299998, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 689.940551, -1663.653686, 2.163357, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 693.439941, -1663.653686, 2.212224, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 696.919921, -1663.653686, 2.260811, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 700.419128, -1663.653686, 2.309675, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 689.931518, -1660.470703, 2.163218, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 693.430541, -1660.470703, 2.212081, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 696.919189, -1660.470703, 2.260804, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 700.419128, -1660.470703, 2.309669, 0.000000, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 689.930603, -1657.259765, 2.163376, 0.299998, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 693.430297, -1657.259765, 2.212243, 0.299998, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 696.919555, -1657.259765, 2.260968, 0.299998, 89.200012, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(19362, 700.417968, -1657.259765, 2.309845, 0.099999, 89.100013, 0.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13691, "bevcunto2_lahills", "crazypave", 0x00000000);
	tmpobjid = CreateDynamicObject(2571, 694.809753, -1648.179809, 3.046066, 0.000000, 0.000000, 270.000000, -1, -1, -1, 200.00, 200.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14526, "sweetsmain", "ah_whitpanelceil", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(759, 686.803649, -1654.573608, 1.724915, 0.000000, 0.000000, -43.099994, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(792, 702.675231, -1664.481323, 2.418384, 0.000000, 0.000000, 0.000000, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(792, 702.675231, -1660.308715, 2.418384, 0.000000, 0.000000, 0.000000, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(792, 702.675231, -1656.647827, 2.418384, 0.000000, 0.000000, 0.000000, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(759, 698.776611, -1669.096923, 2.543082, 0.000000, 0.000000, -104.799980, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(759, 681.090759, -1659.315429, 2.143083, 0.000000, 0.000000, -104.799980, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(759, 690.949096, -1653.653198, 1.724915, 0.000000, 0.000000, -43.099994, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(759, 694.072570, -1654.989868, 1.754914, 0.000000, 0.000000, -43.099994, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(19831, 695.582153, -1643.689941, 2.363910, 0.000000, 0.000000, 180.000000, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(19882, 695.797363, -1643.701293, 3.206067, 0.000000, 0.000000, 0.000000, -1, -1, -1, 200.00, 200.00); 
	tmpobjid = CreateDynamicObject(19882, 695.327392, -1643.701293, 3.206067, 0.000000, 0.000000, 0.000000, -1, -1, -1, 200.00, 200.00); 
}
static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 759, 701.187, -1646.819, 2.468, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.187, -1649.000, 2.468, 0.250);
	RemoveBuildingForPlayer(playerid, 621, 700.437, -1653.089, 0.085, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.179, -1652.010, 2.468, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.179, -1654.319, 2.085, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.187, -1656.339, 2.468, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.187, -1658.520, 2.468, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.179, -1661.530, 2.468, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.179, -1663.839, 2.085, 0.250);
	RemoveBuildingForPlayer(playerid, 730, 694.445, -1658.479, 0.304, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 696.226, -1655.270, 2.492, 0.250);
	RemoveBuildingForPlayer(playerid, 16378, 414.406, 2536.550, 18.898, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 692.507, -1656.069, 2.492, 0.250);
	RemoveBuildingForPlayer(playerid, 762, 695.937, -1670.630, 3.742, 0.250);
	RemoveBuildingForPlayer(playerid, 762, 683.578, -1664.400, 3.742, 0.250);
	RemoveBuildingForPlayer(playerid, 762, 685.359, -1658.630, 3.742, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 701.179, -1639.640, 2.085, 0.250);
}

