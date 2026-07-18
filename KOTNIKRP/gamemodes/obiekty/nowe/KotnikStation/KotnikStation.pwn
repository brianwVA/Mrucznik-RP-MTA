//-----------------<[ Main functions: ]>-------------------
MrucznikStation_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}

MrucznikStation_Connect(playerid) //tą metodę wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jeżeli chcemy usunąć jakieś obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
    CreateDynamicObject(-2028, 839.119079, -1360.073364, 12.823610, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
    CreateDynamicObject(5816, 877.351989, -1363.709960, 21.156299, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    return 1;
}

static UsunObiekty(playerid)
{
    RemoveBuildingForPlayer(playerid, 962, 827.507, -1353.729, 13.601, 0.250);
    RemoveBuildingForPlayer(playerid, 962, 825.054, -1356.880, 13.601, 0.250);
    RemoveBuildingForPlayer(playerid, 5773, 837.414, -1361.219, 10.031, 0.250);
    RemoveBuildingForPlayer(playerid, 5950, 837.414, -1361.219, 10.031, 0.250);
    RemoveBuildingForPlayer(playerid, 1462, 826.851, -1385.670, 12.507, 0.250);
    RemoveBuildingForPlayer(playerid, 1365, 861.984, -1380.459, 13.625, 0.250);
    RemoveBuildingForPlayer(playerid, 1440, 857.375, -1381.160, 13.046, 0.250);
    RemoveBuildingForPlayer(playerid, 5817, 848.859, -1370.430, 17.796, 0.250);
    RemoveBuildingForPlayer(playerid, 5815, 877.164, -1361.199, 12.453, 0.250);
    RemoveBuildingForPlayer(playerid, 5949, 877.164, -1361.199, 12.453, 0.250);
    RemoveBuildingForPlayer(playerid, 1462, 886.343, -1357.300, 12.554, 0.250);
    RemoveBuildingForPlayer(playerid, 1438, 872.265, -1346.410, 12.531, 0.250);
    RemoveBuildingForPlayer(playerid, 1411, 870.148, -1343.660, 14.085, 0.250);
    RemoveBuildingForPlayer(playerid, 1411, 875.414, -1343.660, 14.085, 0.250);
    RemoveBuildingForPlayer(playerid, 5782, 897.664, -1346.699, 14.531, 0.250);
    RemoveBuildingForPlayer(playerid, 5948, 897.664, -1346.699, 14.531, 0.250);
    RemoveBuildingForPlayer(playerid, 1635, 868.062, -1340.609, 17.484, 0.250);
    RemoveBuildingForPlayer(playerid, 1635, 860.914, -1359.800, 16.085, 0.250);
    RemoveBuildingForPlayer(playerid, 1462, 853.195, -1359.729, 12.554, 0.250);
    RemoveBuildingForPlayer(playerid, 5816, 877.351, -1363.709, 21.156, 0.250);
    return 1;
}