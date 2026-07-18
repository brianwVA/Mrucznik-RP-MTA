//monster.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Moduł: monster.pwn ]--------------------------------------------//
//Autor: Charlie112
//Data utworzenia: 16.07.2019
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
monster_Init() //tą metodę wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jeżeli chcemy stworzyć jakieś obiekty

	StworzBudynki();//To wykorzystujemy jeżeli chcemy stworzyć jakieś wejścia 
	return 1;
}
monster_Connect(playerid) //tą metodę wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jeżeli chcemy usunąć jakieś obiekty z mapy
	return 1;
}
//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	skgang = CreateDynamicObject(19445, 1928.387207, -1865.203247, 17.780532, 0.000014, 0.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(13028, 1921.293945, -1865.192260, 14.460074, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF0099FF);
	skgang = CreateDynamicObject(19445, 1938.007690, -1865.203247, 17.780532, 0.000014, 0.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1947.617675, -1865.203247, 17.780532, 0.000014, 0.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1946.296386, -1870.042968, 17.780532, 0.000000, -0.000014, 179.999908, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1946.296386, -1879.671752, 17.780532, 0.000000, -0.000014, 179.999908, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1922.215209, -1879.617797, 17.780532, 0.000044, 0.000000, 89.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1931.835693, -1879.617797, 17.780532, 0.000044, 0.000000, 89.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1941.445678, -1879.617797, 17.780532, 0.000044, 0.000000, 89.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1915.704833, -1870.042968, 17.780532, 0.000000, -0.000037, 179.999771, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1915.704833, -1879.671752, 17.780532, 0.000000, -0.000037, 179.999771, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1912.605346, -1879.617797, 17.780532, 0.000044, 0.000000, 89.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1914.217895, -1865.203247, 17.780532, 0.000014, 0.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1928.387207, -1865.203247, 14.280485, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(5738, 1931.927368, -1876.415527, -2.028059, 0.000000, 0.000000, 0.599999, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 10765, "airportgnd_sfse", "ws_runwaytarmac", 0x00000000);
	skgang = CreateDynamicObject(19445, 1938.007690, -1865.203247, 14.280485, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1947.617675, -1865.203247, 14.280485, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1946.296386, -1870.042968, 14.280485, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1946.296386, -1879.671752, 14.280485, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1922.215209, -1879.617797, 14.280485, 0.000029, 0.000000, 89.999908, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1931.835693, -1879.617797, 14.280485, 0.000029, 0.000000, 89.999908, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1941.445678, -1879.617797, 14.280485, 0.000029, 0.000000, 89.999908, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1915.704833, -1870.042968, 14.280485, 0.000000, -0.000022, 179.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1915.704833, -1879.671752, 14.280485, 0.000000, -0.000022, 179.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1912.605346, -1879.617797, 14.280487, 0.000029, 0.000000, 89.999908, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1914.217895, -1865.203247, 14.280485, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1923.335083, -1879.021240, 11.380476, 0.000000, -0.000022, 539.999877, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19445, 1918.445556, -1874.290039, 11.380476, 0.000000, -0.000022, 629.999877, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0x00000000);
	skgang = CreateDynamicObject(19379, 1918.159545, -1879.030273, 13.074214, 0.000000, 270.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	skgang = CreateDynamicObject(19426, 1922.910522, -1878.733276, 14.904220, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19426, 1922.910522, -1875.511962, 14.904219, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1918.170776, -1874.802612, 11.884221, 0.000014, 0.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19379, 1917.759521, -1879.420166, 13.094212, 0.000000, 270.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	skgang = CreateDynamicObject(2774, 1924.384277, -1865.306396, 12.574213, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	skgang = CreateDynamicObject(2774, 1918.194213, -1865.306396, 12.574213, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	skgang = CreateDynamicObject(19379, 1917.769165, -1879.510742, 16.544221, 0.000000, 270.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	skgang = CreateDynamicObject(19445, 1917.455200, -1869.302368, 17.780532, 0.000000, 89.999961, 539.999755, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1917.455200, -1878.911376, 17.780532, 0.000000, 89.999961, 539.999755, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1924.016357, -1878.130859, 17.780532, -0.000014, 449.999969, -90.000198, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1933.645996, -1878.130859, 17.780532, -0.000014, 449.999969, -90.000198, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1943.265747, -1878.130859, 17.780532, -0.000014, 449.999969, -90.000198, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1924.016357, -1866.617797, 17.780532, -0.000045, 449.999969, -90.000106, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1933.645996, -1866.617797, 17.780532, -0.000045, 449.999969, -90.000106, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1943.265747, -1866.617797, 17.780532, -0.000045, 449.999969, -90.000106, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19353, 1944.445434, -1869.972900, 17.780527, 0.000000, 89.999916, 179.999481, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19353, 1944.445434, -1873.172851, 17.780527, 0.000000, 89.999916, 179.999481, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19426, 1944.445434, -1875.582641, 17.780527, 0.000000, 89.999916, 179.999481, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(2774, 1931.574707, -1867.576660, 18.554208, 0.000000, 90.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	SetDynamicObjectMaterial(skgang, 1, 11631, "mp_ranchcut", "mpcj_speaker_6", 0x00000000);
	SetDynamicObjectMaterial(skgang, 2, 11631, "mp_ranchcut", "mpcj_speaker_6", 0x00000000);
	skgang = CreateDynamicObject(2774, 1931.574707, -1877.196533, 18.554208, 0.000000, 90.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	SetDynamicObjectMaterial(skgang, 1, 11631, "mp_ranchcut", "mpcj_speaker_6", 0x00000000);
	skgang = CreateDynamicObject(2774, 1918.414428, -1877.907226, 18.554208, 0.000000, 90.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 3922, "bistro", "sw_wallbrick_01", 0x00000000);
	SetDynamicObjectMaterial(skgang, 1, 11631, "mp_ranchcut", "mpcj_speaker_6", 0x00000000);
	skgang = CreateDynamicObject(2774, 1943.513793, -1877.907226, 18.554208, 0.000000, 90.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 1, 11631, "mp_ranchcut", "mpcj_speaker_6", 0x00000000);
	skgang = CreateDynamicObject(19445, 1935.776367, -1875.280151, 19.330541, -0.000068, 449.999969, -90.000038, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1935.776367, -1869.529052, 19.330541, -0.000068, 449.999969, -90.000038, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1942.337036, -1872.380004, 19.330541, -0.000022, 449.999969, -0.000174, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1919.586791, -1872.380004, 19.330541, -0.000022, 449.999969, -0.000174, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1926.146362, -1875.280151, 19.330541, -0.000105, 449.999969, -89.999923, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1926.146362, -1869.529052, 19.330541, -0.000105, 449.999969, -89.999923, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1918.170776, -1879.613159, 14.904219, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	skgang = CreateDynamicObject(19445, 1915.720947, -1879.613159, 14.904219, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	skgang = CreateDynamicObject(9131, 1923.059204, -1875.349853, 16.764211, 0.000007, 90.000000, 89.999977, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(9131, 1923.059204, -1877.620239, 16.764211, 0.000007, 90.000000, 89.999977, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(9131, 1923.059204, -1879.890014, 16.764211, 0.000007, 90.000000, 89.999977, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(9131, 1921.539184, -1874.589721, 16.764211, 0.000000, 450.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(9131, 1919.279296, -1874.589721, 16.764211, 0.000000, 450.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(9131, 1917.009277, -1874.589721, 16.764211, 0.000000, 450.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(9131, 1914.738891, -1874.589721, 16.764211, 0.000000, 450.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 11301, "carshow_sfse", "concreteslab_small", 0x00000000);
	skgang = CreateDynamicObject(19893, 1917.238037, -1877.981323, 13.970158, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 1, 14530, "estate2", "Auto_Slamvan2", 0x00000000);
	skgang = CreateDynamicObject(13028, 1921.293945, -1865.192260, 18.260078, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 9515, "bigboxtemp1", "lombard_build2_2", 0x00000000);
	skgang = CreateDynamicObject(2960, 1941.101196, -1873.475097, 13.344211, 0.000007, 90.000000, 89.999977, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 2127, "cj_kitchen", "CJ_RED", 0x00000000);
	skgang = CreateDynamicObject(2920, 1919.128173, -1865.390258, 9.284413, 0.000000, 0.399998, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	skgang = CreateDynamicObject(2920, 1923.428588, -1865.390258, 9.284413, 0.000000, 0.399998, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	skgang = CreateDynamicObject(2920, 1925.148681, -1865.360229, 12.714208, 89.000000, 630.000000, 720.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	skgang = CreateDynamicObject(2920, 1925.148681, -1865.298583, 16.253675, 89.000000, 630.000000, 720.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	skgang = CreateDynamicObject(2920, 1925.148681, -1865.318725, 15.053861, 89.000000, 630.000000, 720.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	skgang = CreateDynamicObject(2920, 1925.148681, -1865.340454, 13.804058, 89.000000, 630.000000, 720.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	skgang = CreateDynamicObject(19445, 1926.146362, -1872.519775, 19.430543, -0.000104, 449.999969, -89.999923, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF0066FF);
	skgang = CreateDynamicObject(19445, 1935.777099, -1872.519775, 19.430532, -0.000104, 449.999969, -89.999923, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18065, "ab_sfammumain", "shelf_glas", 0xFF0066FF);
	skgang = CreateDynamicObject(19426, 1922.186279, -1877.967895, 14.904219, 0.000000, 0.000000, 86.400016, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	skgang = CreateDynamicObject(4724, 1940.922729, -1870.778076, 14.534221, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 6882, "vgnland", "ws_oldredbrick64", 0x00000000);
	skgang = CreateDynamicObject(19370, 1917.498657, -1871.646606, 12.534212, 0.000000, 270.000000, 179.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1917.498657, -1868.436889, 12.534212, 0.000000, 270.000000, 179.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1919.170166, -1871.646606, 10.874206, 0.000007, 0.000014, 179.999969, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18886, "electromagnet1", "hazardtile13-128x128", 0x00000000);
	skgang = CreateDynamicObject(19370, 1919.170166, -1868.436889, 10.874206, 0.000007, 0.000014, 179.999969, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18886, "electromagnet1", "hazardtile13-128x128", 0x00000000);
	skgang = CreateDynamicObject(19370, 1917.654296, -1873.342895, 10.874206, -0.000023, 0.000007, -89.999923, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18886, "electromagnet1", "hazardtile13-128x128", 0x00000000);
	skgang = CreateDynamicObject(19370, 1914.444580, -1873.342895, 10.874206, -0.000023, 0.000007, -89.999923, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18886, "electromagnet1", "hazardtile13-128x128", 0x00000000);
	skgang = CreateDynamicObject(19370, 1917.654296, -1866.741210, 10.874206, -0.000052, 0.000007, -89.999832, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18886, "electromagnet1", "hazardtile13-128x128", 0x00000000);
	skgang = CreateDynamicObject(19370, 1914.444580, -1866.741210, 10.874206, -0.000052, 0.000007, -89.999832, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 18886, "electromagnet1", "hazardtile13-128x128", 0x00000000);
	skgang = CreateDynamicObject(9131, 1915.425048, -1871.768920, 14.660152, 0.000000, 90.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	skgang = CreateDynamicObject(19370, 1915.718750, -1871.696655, 14.644212, 0.000000, 360.000000, 179.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}POCZEKALNIA", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	skgang = CreateDynamicObject(19370, 1928.579589, -1876.827270, 12.534212, 0.000000, 270.000000, 179.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1928.579589, -1873.617553, 12.534212, 0.000000, 270.000000, 179.999862, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1933.410888, -1876.817260, 12.534212, 0.000000, 270.000000, 179.999633, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1933.410888, -1873.607543, 12.534212, 0.000000, 270.000000, 179.999633, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1938.131835, -1876.827270, 12.534212, 0.000000, 270.000000, 179.999725, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1938.131835, -1873.617553, 12.534212, 0.000000, 270.000000, 179.999725, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1943.022583, -1876.827270, 12.534212, 0.000000, 270.000000, 179.999679, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(19370, 1943.022583, -1873.617553, 12.534212, 0.000000, 270.000000, 179.999679, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 19085, "eyepatch1", "eyepatch", 0x00000000);
	skgang = CreateDynamicObject(2960, 1941.101196, -1876.465332, 13.344211, 0.000007, 90.000000, 89.999977, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 2127, "cj_kitchen", "CJ_RED", 0x00000000);
	skgang = CreateDynamicObject(2960, 1944.960693, -1873.475097, 13.344211, 0.000014, 90.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 2127, "cj_kitchen", "CJ_RED", 0x00000000);
	skgang = CreateDynamicObject(2960, 1944.960693, -1876.465332, 13.344211, 0.000014, 90.000000, 89.999954, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 2127, "cj_kitchen", "CJ_RED", 0x00000000);
	skgang = CreateDynamicObject(19353, 1942.970458, -1879.603149, 16.424213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}STANOWISKO I", 60, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	skgang = CreateDynamicObject(19353, 1938.279785, -1879.613159, 16.424213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}STANOWISKO II", 60, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	skgang = CreateDynamicObject(19353, 1933.469482, -1879.613159, 16.424213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}STANOWISKO III", 60, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	skgang = CreateDynamicObject(19353, 1928.519653, -1879.613159, 16.424213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}STANOWISKO IV", 60, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	skgang = CreateDynamicObject(19477, 1928.312622, -1865.297485, 14.674218, -10.199996, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 2813, "gb_books01", "GB_magazine06", 0x00000000);
	skgang = CreateDynamicObject(2960, 1940.951049, -1873.605224, 13.344210, 0.000007, 90.000000, 179.999969, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 16640, "a51", "ventb128", 0x00000000);
	skgang = CreateDynamicObject(19477, 1933.292602, -1865.297485, 14.674218, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14530, "estate2", "Auto_Slamvan2", 0x00000000);
	skgang = CreateDynamicObject(2960, 1940.951049, -1876.605957, 13.344210, 0.000007, 90.000000, 179.999969, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 16640, "a51", "ventb128", 0x00000000);
	skgang = CreateDynamicObject(2960, 1944.810668, -1873.605224, 13.344210, 0.000007, 89.999969, 179.999786, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 16640, "a51", "ventb128", 0x00000000);
	skgang = CreateDynamicObject(2960, 1944.810668, -1876.605957, 13.344210, 0.000007, 89.999969, 179.999786, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 16640, "a51", "ventb128", 0x00000000);
	skgang = CreateDynamicObject(19426, 1934.552856, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}PRZECINAK", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1927.432373, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}SHADOW", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1928.972412, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}METALIK", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1930.332519, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}ZAKR?CONE", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1931.752929, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}KLASYCZNE", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1933.303100, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}TWIST", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1936.103271, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}SWITCH", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1937.543579, -1865.219116, 14.534210, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}GROVE", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19477, 1923.003540, -1875.507690, 15.194222, 0.000000, 0.000000, 360.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14530, "estate2", "Auto_Slamvan2", 0x00000000);
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}BIURO", 50, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	skgang = CreateDynamicObject(19426, 1915.712280, -1872.109863, 14.534210, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}TERENOWE", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1915.712280, -1870.649658, 14.534210, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}IMPORTOWANE", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1915.712280, -1868.999389, 14.534210, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}DOLAR", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19426, 1915.712280, -1867.429565, 14.534210, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}ODLOT", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(14826, 1946.358764, -1867.333129, 13.294217, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 1, 19297, "matlights", "invisible", 0x00000000);
	skgang = CreateDynamicObject(19477, 1946.193115, -1867.277587, 14.674218, -12.099999, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterial(skgang, 0, 14530, "estate2", "Auto_monstera", 0x00000000);
	skgang = CreateDynamicObject(19353, 1925.226318, -1879.566040, 13.674215, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}Projekt wykonany przez:", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19353, 1925.146118, -1879.566040, 13.384214, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}? Charlie Halliwell", 140, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19353, 1925.226074, -1879.566040, 13.154209, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}Dane kontaktowe:", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19353, 1925.146118, -1879.566040, 12.804212, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}? Telefon - 6469", 140, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	skgang = CreateDynamicObject(19353, 1925.146118, -1879.566040, 12.604213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	SetDynamicObjectMaterialText(skgang, 0, "{FFFFFF}? E-Mail - Halliwell@Mru.com ((Charlie112))", 140, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	skgang = CreateDynamicObject(19425, 1928.575561, -1878.143676, 12.614212, 0.000000, 0.000014, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19325, 1919.608276, -1874.778198, 14.434217, 0.000037, 0.000000, 89.999885, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19426, 1923.500976, -1877.130249, 11.264208, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19426, 1923.671142, -1877.130249, 11.134209, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19325, 1912.968017, -1874.778198, 14.434217, 0.000037, 0.000000, 89.999885, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2166, 1917.095947, -1878.042236, 13.180150, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1714, 1916.770629, -1879.229736, 13.180150, 0.000000, 0.000000, 139.499984, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2161, 1915.806884, -1876.367675, 13.180150, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2204, 1921.861938, -1879.536254, 13.180150, 0.000000, 360.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(16779, 1919.785522, -1877.312500, 16.520154, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1708, 1921.694702, -1875.388916, 13.180150, 0.000000, 0.000000, -51.999996, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2072, 1920.636230, -1875.043457, 14.670166, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2260, 1916.295288, -1877.027099, 15.090150, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2261, 1916.305541, -1878.387451, 14.850149, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2259, 1917.969116, -1879.056274, 14.980151, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11737, 1922.210937, -1877.229858, 13.174208, 0.000000, 0.000000, 102.200027, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(18075, 1937.357299, -1870.238525, 19.284223, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(18075, 1924.555541, -1870.238525, 19.284223, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1721, 1915.920776, -1872.514648, 12.594212, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1721, 1915.920776, -1871.704223, 12.594212, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1721, 1915.920776, -1870.914184, 12.594212, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(955, 1916.271240, -1869.628662, 13.030153, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(956, 1916.181884, -1868.310913, 12.950148, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19425, 1933.406860, -1878.133666, 12.614212, 0.000000, 0.000052, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19921, 1929.230957, -1878.533935, 13.984226, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19917, 1940.307250, -1878.751220, 12.574213, 0.000000, 0.000000, -38.000003, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19900, 1932.023071, -1879.008666, 12.620148, -0.199999, 0.000000, 28.299999, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19903, 1930.908325, -1879.117431, 12.620148, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19899, 1928.476806, -1878.987548, 12.620148, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19425, 1938.127807, -1878.143676, 12.614212, 0.000000, 0.000037, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19903, 1935.698974, -1879.117431, 12.620148, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19899, 1938.147460, -1878.987548, 12.620148, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19425, 1943.018554, -1878.143676, 12.614212, 0.000000, 0.000045, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19815, 1933.421997, -1879.540649, 14.320151, 0.000000, 360.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19815, 1942.833007, -1879.540649, 14.320151, 0.000000, 360.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19900, 1945.648803, -1878.916870, 12.642419, -0.199999, 0.000000, 59.299995, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11710, 1921.270996, -1865.263305, 16.624219, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2961, 1923.010986, -1875.490722, 14.214213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19898, 1940.453979, -1871.488159, 12.584213, 0.000000, 0.000000, 133.899978, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2062, 1925.621826, -1865.726562, 13.134215, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(3785, 1924.468627, -1866.211181, 14.784215, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(3785, 1918.167968, -1866.211181, 14.784215, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2894, 1918.047851, -1878.837280, 13.970156, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19822, 1916.008056, -1876.261474, 14.510150, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1073, 1926.870483, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1075, 1928.400512, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1076, 1929.870605, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1077, 1931.250976, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1078, 1932.641357, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1079, 1934.021484, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1080, 1935.511352, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1081, 1936.941772, -1865.345214, 16.974224, 0.000000, 0.000000, 270.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2057, 1929.282470, -1878.871948, 14.404215, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11738, 1929.079223, -1878.907714, 14.744215, 0.000000, 0.299998, -38.899997, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11738, 1929.503417, -1878.832031, 14.742274, 0.000000, 0.299998, 40.800010, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19621, 1939.117553, -1878.538452, 13.980154, 0.000000, 0.000000, 360.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19621, 1938.604492, -1878.579589, 13.980154, 0.000000, 0.000000, 54.700008, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19621, 1938.816894, -1878.729736, 13.980154, 0.000000, 0.000000, 99.599990, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19627, 1932.000000, -1878.796142, 13.510149, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1025, 1915.851196, -1872.594726, 16.974224, 0.000000, 0.000007, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1082, 1915.851196, -1871.084472, 16.974224, 0.000000, 0.000007, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1083, 1915.851196, -1869.594360, 16.974224, 0.000000, 0.000007, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1084, 1915.851196, -1868.024291, 16.974224, 0.000000, 0.000007, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11730, 1942.463378, -1865.505493, 12.574213, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11729, 1943.223632, -1865.505493, 12.574213, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(11729, 1943.983886, -1865.505493, 12.574213, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(3085, 1939.560546, -1865.299316, 12.574213, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(3087, 1946.158935, -1872.119995, 12.574213, 0.000000, 0.000000, 90.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2062, 1923.989868, -1878.990234, 13.124217, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19897, 1924.022338, -1878.861694, 13.684214, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19625, 1923.930541, -1878.789672, 13.674216, 0.000000, 0.000000, -28.800001, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1300, 1916.552368, -1865.811279, 12.990155, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1428, 1930.943115, -1865.724975, 13.974221, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(3077, 1925.219238, -1879.514648, 12.574213, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19872, 1943.004028, -1875.192382, 10.710146, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19872, 1938.134033, -1875.192382, 10.710146, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19872, 1933.333862, -1875.192382, 10.710146, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19872, 1928.563476, -1875.192382, 10.710146, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(2886, 1923.969116, -1866.081054, 13.954216, 0.000000, 0.000000, 0.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1886, 1917.277343, -1867.107788, 17.753074, 19.599994, 0.000000, 48.299999, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(1886, 1945.021972, -1878.625122, 17.811510, 22.900001, 0.000000, -128.800048, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(19955, 1921.749633, -1874.314819, 12.034212, 0.000000, 0.000000, 180.000000, 12, 0, -1, 380.00, 380.00); 
	skgang = CreateDynamicObject(4848, 1931.000000, -1871.390014, 15.843795, 0.000000, 0.000000, -179.999984, 0, 0, -1, 500.00, 500.00); 


	return 1;
}

static StworzBudynki()
{
	DodajWejscie(1921.3878,-1863.4750,13.5604,1921.3020,-1866.9325,13.5742,0,0,12,0,"Monster Garage","Wyjście");//wejdz do budynku
	//StworzWjedz(1921.1761, -1862.3473, 13.4351, 1921.3132, -1868.8387, 13.4492, 8, 12, "Wjazd do garażu", "Wyjazd");
	StworzWjedz(1921.1761, -1862.3473, 13.4351, 1921.3132, -1868.8387, 13.4492, 8.0, 12, "Wjazd do garażu", "Wyjazd", 0, 0, PLOCAL_DEFAULT);
	return 1;
}
static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 4848, 1931.000, -1871.390, 15.843, 0.250);
	RemoveBuildingForPlayer(playerid, 4976, 1931.000, -1871.390, 15.843, 0.250);
	return 1;
}