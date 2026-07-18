//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: hamc.pwn ]-----------------------------------------//
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
//BY- Charlie112
//-----------------<[ ZMIENNE ]>---------------------------

//Są w pliku ./zmienne
new bramahell1;
new bramahell2;

//-----------------<[ Wyw Funkcje ]>---------------------------

hamcint_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}

//-----------------<[ Funkcje ]>---------------------------

static StworzObiekty()
{

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2018-10-04 07:22:28" by "Luis_Cotta"
		Created by "Charlie112"
		Spawn Position: -/-
		Script by: Simeone
	*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////

	hellsy= CreateDynamicObject(19378, 46.928863, -2643.156005, 11.984128, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19448, 52.238681, -2651.352050, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 52.238681, -2641.722656, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 50.590267, -2649.665283, 11.639081, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 50.590267, -2652.285156, 11.639081, 0.000014, 0.000000, 89.999954, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 49.436412, -2644.911865, 13.754133, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 50.986412, -2646.422119, 13.774132, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 49.436412, -2638.650634, 13.754133, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 50.986412, -2640.160888, 13.774132, 0.000029, 0.000000, 89.999908, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 50.956417, -2637.130615, 13.764133, 0.000029, 0.000000, 89.999908, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 50.956417, -2643.391845, 13.764133, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 52.238681, -2632.091308, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 54.178684, -2633.822753, 13.779087, 0.000000, 360.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19386, 47.772014, -2633.815917, 13.774132, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19429, 45.442749, -2634.079589, 13.774128, 0.000000, 0.000000, 113.000030, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19929, 44.225730, -2638.328125, 12.274140, 0.000000, -0.000067, 179.999588, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_tabletop_wood", 0x00000000);
	hellsy= CreateDynamicObject(19929, 44.225730, -2641.188964, 12.274140, 0.000000, -0.000067, 179.999588, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_tabletop_wood", 0x00000000);
	hellsy= CreateDynamicObject(19386, 44.660171, -2635.459716, 13.794134, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 43.066432, -2642.672851, 13.754133, 0.000022, 0.000000, 89.999931, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19429, 43.939647, -2636.980468, 13.774128, 0.000022, 0.000000, 89.999931, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(8419, 43.530899, -2648.096923, 27.212497, 0.000000, 540.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 4, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	hellsy= CreateDynamicObject(19448, 39.848701, -2634.473144, 13.779087, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 46.928863, -2633.523193, 11.984128, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19356, 40.376426, -2641.602294, 13.754133, 0.000022, 0.000000, 179.999938, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19429, 40.379653, -2639.200439, 13.774127, 0.000022, 0.000000, 179.999938, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19386, 41.756862, -2637.725341, 13.764134, 0.000000, 0.000000, -62.100013, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 39.866443, -2642.672851, 13.754133, 0.000022, 0.000000, 89.999931, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 40.378726, -2633.592285, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 46.928863, -2652.788574, 11.984127, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19378, 46.928863, -2629.014404, 11.994129, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18081, "cj_barb", "ab_marble_checks", 0x00000000);
	hellsy= CreateDynamicObject(19448, 49.298690, -2628.950683, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(19448, 41.478679, -2633.751464, 13.779087, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(19448, 43.428688, -2628.950683, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(19448, 45.748691, -2629.451171, 13.779087, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(1494, 44.665519, -2636.203369, 12.070067, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19358, 48.411663, -2629.473144, 11.540067, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 3922, "bistro", "Marble2", 0x00000000);
	hellsy= CreateDynamicObject(19358, 49.271652, -2630.292968, 11.540063, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 3922, "bistro", "Marble2", 0x00000000);
	hellsy= CreateDynamicObject(19358, 46.881679, -2628.322509, 11.540066, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 3922, "bistro", "Marble2", 0x00000000);
	hellsy= CreateDynamicObject(19358, 50.451644, -2631.813964, 11.540061, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 3922, "bistro", "Marble2", 0x00000000);
	hellsy= CreateDynamicObject(19358, 50.651649, -2629.653320, 11.540062, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 3922, "bistro", "Marble2", 0x00000000);
	hellsy= CreateDynamicObject(19378, 36.418857, -2652.778320, 11.044122, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(14877, 41.284786, -2654.163330, 9.980048, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18081, "cj_barb", "ab_panel_woodgrime", 0x00000000);
	hellsy= CreateDynamicObject(14877, 41.284786, -2651.173339, 9.980048, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18081, "cj_barb", "ab_panel_woodgrime", 0x00000000);
	hellsy= CreateDynamicObject(19448, 52.238681, -2660.982177, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 50.748638, -2657.541503, 13.779087, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 37.908641, -2657.541503, 13.779087, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 37.908641, -2657.541503, 10.279088, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18028, "cj_bar2", "GB_nastybar06", 0x00000000);
	hellsy= CreateDynamicObject(19448, 37.908641, -2648.041259, 13.779087, 0.000007, 0.000000, 89.999977, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 37.908641, -2648.041259, 10.279089, 0.000007, 0.000000, 89.999977, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18028, "cj_bar2", "GB_nastybar06", 0x00000000);
	hellsy= CreateDynamicObject(19356, 42.656452, -2646.503173, 13.754133, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 43.535190, -2643.883300, 13.754133, 0.000000, 0.000000, -42.299995, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 41.748630, -2652.670898, 10.279088, 0.000007, 0.000000, 179.999969, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 41.756469, -2648.083740, 11.354125, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 41.756469, -2657.204589, 11.354125, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 41.966457, -2655.693115, 10.304120, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 41.966457, -2649.601806, 10.304120, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 33.148643, -2652.641113, 9.819082, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18028, "cj_bar2", "GB_nastybar06", 0x00000000);
	hellsy= CreateDynamicObject(19378, 27.948862, -2652.778320, 11.504122, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18028, "cj_bar2", "GB_nastybar06", 0x00000000);
	hellsy= CreateDynamicObject(19448, 29.558643, -2652.790039, 13.179079, 0.000014, -0.000022, 179.999786, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14486, "ab_vegasgymbits01", "bbar_wall2", 0x00000000);
	hellsy= CreateDynamicObject(19609, 31.059698, -2649.932617, 11.550059, 0.000000, 0.000000, 48.899997, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 8421, "pirateland", "tislndskullrock_256", 0x00000000);
	hellsy= CreateDynamicObject(19448, 28.278621, -2657.541503, 13.299079, 0.000045, 0.000000, 89.999862, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14794, "ab_vegasgymmain", "bbar_wall3", 0x00000000);
	hellsy= CreateDynamicObject(19448, 28.278621, -2648.041259, 13.299078, 0.000050, 0.000000, 89.999839, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14794, "ab_vegasgymmain", "bbar_wall3", 0x00000000);
	hellsy= CreateDynamicObject(19378, 27.948862, -2652.778320, 14.914129, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18028, "cj_bar2", "GB_nastybar06", 0x00000000);
	hellsy= CreateDynamicObject(19448, 33.148643, -2652.641113, 16.589059, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18028, "cj_bar2", "GB_nastybar06", 0x00000000);
	hellsy= CreateDynamicObject(955, 41.187690, -2648.868408, 11.510059, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 955, "cj_ext_vend", "CJ_SPRUNK_DIRTY", 0x00000000);
	hellsy= CreateDynamicObject(19448, 40.778720, -2630.972656, 12.839081, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(1494, 41.097354, -2638.079345, 12.070067, 0.000000, 0.000000, 27.900005, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(1494, 48.525520, -2633.781738, 12.070067, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19386, 47.772014, -2633.745849, 13.804133, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(19448, 41.478679, -2633.751464, 13.779087, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 11100, "bendytunnel_sfse", "Bow_sub_wallshine", 0x00000000);
	hellsy= CreateDynamicObject(19386, 44.332309, -2657.541503, 13.770071, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 40.098854, -2662.418457, 11.984127, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19448, 42.778629, -2662.421875, 13.779087, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 40.548614, -2659.951416, 13.779087, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 47.218688, -2662.403320, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19448, 47.218688, -2662.403320, 10.299089, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19448, 45.268699, -2662.403320, 10.299089, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19448, 47.218688, -2662.403320, 6.809073, 0.000000, 0.000007, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19448, 45.268699, -2662.403320, 6.809073, 0.000000, 0.000007, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19378, 44.908866, -2666.706542, 6.174117, 0.000000, 90.000083, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 3967, "cj_airprt", "bigbrick", 0x00000000);
	hellsy= CreateDynamicObject(19448, 46.598693, -2663.408447, 12.349820, 38.100002, 90.000000, 360.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19448, 45.278697, -2664.692871, 13.779087, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 9524, "blokmodb", "Bow_Grimebrick", 0x00000000);
	hellsy= CreateDynamicObject(19386, 46.242282, -2667.173339, 8.000061, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 42.468849, -2662.418457, 15.104146, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19448, 47.218688, -2671.933349, 7.979074, 0.000000, 0.000007, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 48.540576, -2668.498046, 7.979074, 0.000000, 0.000007, 129.499984, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 44.718711, -2662.432861, 7.979074, 0.000000, 0.000007, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 40.058895, -2662.352294, 9.634134, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18049, "ammu_twofloor", "concretebig4256128", 0x00000000);
	hellsy= CreateDynamicObject(19378, 50.558872, -2671.984375, 9.634134, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18049, "ammu_twofloor", "concretebig4256128", 0x00000000);
	hellsy= CreateDynamicObject(19448, 36.778675, -2671.602294, 7.979074, 0.000000, 0.000007, 270.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19386, 39.741821, -2663.261718, 7.980055, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 37.788692, -2661.802978, 7.979074, 0.000000, 0.000007, 270.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19386, 43.191833, -2671.602294, 7.980054, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 44.908866, -2676.337890, 6.174117, 0.000000, 90.000083, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14581, "ab_mafiasuitea", "ab_walnut", 0x00000000);
	hellsy= CreateDynamicObject(2965, 46.079948, -2646.880126, 12.990073, 0.000000, 0.000000, 19.899997, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10765, "airportgnd_sfse", "coasty_bit3_sfe", 0x00000000);
	hellsy= CreateDynamicObject(19378, 34.408878, -2664.834716, 6.174118, 0.000000, 450.000091, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19378, 34.408878, -2674.465332, 6.174118, 0.000000, 90.000083, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	hellsy= CreateDynamicObject(19448, 39.738655, -2669.671630, 7.979074, 0.000000, 0.000007, 360.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(14877, 34.084812, -2655.724365, 9.470044, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18081, "cj_barb", "ab_panel_woodgrime", 0x00000000);
	hellsy= CreateDynamicObject(19356, 32.156467, -2654.162597, 9.834110, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19356, 32.156467, -2657.142822, 9.834110, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "bbar_wall1", 0x00000000);
	hellsy= CreateDynamicObject(19427, 33.796752, -2668.592529, 5.420045, 0.000000, 0.000098, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(2205, 34.180168, -2666.020263, 6.260054, 0.000000, 0.000007, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(11435, 36.387084, -2669.311279, 2.500049, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19427, 35.916706, -2668.592529, 5.420045, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19448, 49.608711, -2671.603027, 7.979074, 0.000000, 0.000007, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 43.488693, -2676.753173, 7.979074, 0.000000, 0.000007, 90.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 42.473735, -2677.445800, 7.979074, 0.000000, 0.000007, 394.400024, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19448, 40.823242, -2661.108642, 7.979074, 0.000000, 0.000007, -123.900032, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 40.058883, -2671.984375, 9.634136, 0.000000, 90.000045, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18049, "ammu_twofloor", "concretebig4256128", 0x00000000);
	hellsy= CreateDynamicObject(19448, 30.678697, -2666.642822, 7.979074, 0.000000, 0.000007, 360.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19378, 29.558908, -2662.352294, 9.634134, 0.000000, 90.000061, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18049, "ammu_twofloor", "concretebig4256128", 0x00000000);
	hellsy= CreateDynamicObject(19378, 29.558897, -2671.984375, 9.634136, 0.000000, 90.000061, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 18049, "ammu_twofloor", "concretebig4256128", 0x00000000);
	hellsy= CreateDynamicObject(19358, 31.848817, -2670.762695, 7.970063, 0.000000, 0.000000, 44.399997, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19358, 31.854204, -2662.819091, 7.970063, 0.000000, 0.000000, 134.399993, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10370, "alleys_sfs", "ws_sandstone1", 0x00000000);
	hellsy= CreateDynamicObject(19427, 35.916706, -2666.991699, 5.420045, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19427, 35.916706, -2665.401611, 5.420045, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19427, 33.796752, -2666.991699, 5.420045, 0.000000, 0.000098, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19427, 33.796752, -2665.401611, 5.420045, 0.000000, 0.000098, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(11435, 34.307144, -2669.301269, 2.500049, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(11435, 36.387084, -2664.687500, 2.500049, 0.000000, 179.999984, -179.999847, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(11435, 34.307144, -2664.687500, 2.500049, 0.000000, 179.999984, -179.999847, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	hellsy= CreateDynamicObject(19355, 39.729492, -2667.937988, 9.050049, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}President", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.719490, -2668.706787, 8.660049, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Vice President", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.719490, -2667.067382, 8.660049, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Sgt. At. Arms", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.729488, -2667.957519, 8.260046, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Secretary", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.729488, -2667.957519, 7.930047, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Inactive", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.729488, -2667.957519, 7.650045, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}AFFA", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.719497, -2667.957519, 7.360046, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Filthy Few", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.729492, -2667.957519, 7.090045, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Full Patch", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19355, 39.719486, -2667.957519, 6.810044, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterialText(hellsy, 0, "{FFFFFF}Prospeet", 100, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	hellsy= CreateDynamicObject(19359, 39.733669, -2667.450195, 7.890056, 540.000000, 360.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	hellsy= CreateDynamicObject(11435, 40.147075, -2665.889160, 5.630051, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	SetDynamicObjectMaterial(hellsy, 1, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	hellsy= CreateDynamicObject(11435, 40.147075, -2669.809570, 5.630051, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 1, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	hellsy= CreateDynamicObject(19359, 39.733669, -2668.260498, 7.890056, 540.000000, 360.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(hellsy, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	hellsy= CreateDynamicObject(1538, 52.112216, -2650.227294, 12.069083, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19325, 52.317211, -2649.677978, 12.379089, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19325, 52.317211, -2652.297851, 12.379089, 0.000014, 0.000000, 89.999954, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 48.401126, -2649.674072, 11.064133, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 48.401126, -2652.293945, 11.064133, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(18060, 50.626476, -2641.749755, 13.804134, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(18059, 50.630523, -2641.761230, 12.454138, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 48.121143, -2633.810546, 11.064131, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1541, 43.734470, -2638.688964, 13.384137, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1541, 43.734470, -2640.888916, 13.384137, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2714, 44.604053, -2639.939208, 15.154136, 0.000059, 7.500000, 89.999816, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19929, 44.225730, -2638.328125, 11.344138, 0.000000, -0.000096, 179.999404, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19929, 44.225730, -2641.188964, 11.344138, 0.000000, -0.000097, 179.999404, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19929, 44.225730, -2638.328125, 14.604136, 0.000000, -0.000104, 179.999359, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19929, 44.225730, -2641.188964, 14.604136, 0.000000, -0.000104, 179.999359, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2350, 45.681434, -2641.963378, 12.414134, 0.000000, 0.000022, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2350, 45.681434, -2640.272460, 12.414134, 0.000000, 0.000022, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2350, 45.681434, -2638.381835, 12.414134, 0.000000, 0.000022, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 46.401126, -2633.810546, 11.064131, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2964, 46.029502, -2647.138916, 12.064131, 0.000000, 0.000000, 29.200000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19378, 36.428936, -2638.536865, 11.984129, 0.000000, 90.000083, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1523, 45.558582, -2631.062255, 12.070067, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19603, 49.304656, -2627.404541, 12.140069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19358, 48.411663, -2629.833496, 10.450058, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19358, 48.951660, -2630.292968, 10.450058, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19603, 51.374660, -2629.375000, 12.160070, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2742, 46.279079, -2633.596191, 13.280074, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2808, 51.900127, -2653.533203, 12.690066, 0.000007, 0.000000, 89.999977, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2808, 50.120174, -2652.822998, 12.690066, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2808, 52.210186, -2652.822998, 12.690066, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2808, 51.900127, -2655.623291, 12.690066, 0.000007, 0.000000, 89.999977, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19325, 41.767208, -2646.367919, 11.799085, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19325, 41.767208, -2658.927734, 11.799085, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 41.271133, -2655.705322, 9.914125, 0.000000, 180.000000, 720.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 41.761116, -2656.195556, 19.224132, 0.000000, 720.000000, 1350.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 41.271133, -2649.604248, 9.914125, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 41.761116, -2650.094482, 19.224132, -0.000007, 720.000000, -89.999977, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19611, 32.792358, -2652.507812, 11.590062, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19610, 32.829692, -2652.513916, 13.210061, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(16101, 32.293048, -2654.616943, 6.620057, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 32.641265, -2657.345703, 10.754137, 0.000000, 180.000000, -0.000068, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 32.641265, -2648.252929, 10.754137, 0.000000, 180.000000, -0.000068, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 29.281122, -2657.345947, 11.034140, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 29.281122, -2648.252929, 11.034139, 0.000000, 180.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2725, 36.183307, -2654.776123, 11.530062, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19317, 30.481246, -2653.586914, 11.610054, 270.000000, 1530.000000, 1530.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19318, 29.777599, -2652.766357, 12.178709, -11.800002, 0.000000, 450.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19319, 29.801712, -2653.586914, 12.225761, -12.399998, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 37.508182, -2654.878662, 11.750069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 36.398200, -2653.627929, 11.750069, 0.000000, 0.000000, 61.599994, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2725, 36.183307, -2650.423583, 11.530062, 0.000000, 0.000007, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 37.489601, -2651.119140, 11.750069, 0.000000, 0.000007, -24.700004, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 36.147457, -2649.038330, 11.750069, 0.000006, 0.000003, 87.499984, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 35.623092, -2656.339355, 11.275970, 0.000000, -130.500000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2725, 41.013313, -2656.707519, 11.530062, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 40.828159, -2656.709228, 11.890070, 0.000000, 180.000000, 360.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2725, 38.758129, -2652.749755, 11.530062, 0.000000, 0.000014, -21.999992, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 39.723224, -2653.897460, 11.750069, -0.000001, 0.000014, -43.699993, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 39.387496, -2651.765380, 11.750069, 0.000012, 0.000007, 39.599975, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2120, 38.338043, -2652.753417, 11.750069, 0.000012, 0.000007, -174.200073, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19173, 42.760742, -2646.477783, 14.350068, 0.000000, 9.500001, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(927, 41.293563, -2634.616699, 13.550069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1547, 44.154918, -2637.821777, 13.200072, 0.000000, 0.000000, -34.699996, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1547, 44.184516, -2639.290527, 13.200072, 0.000000, 0.000000, -102.100006, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1547, 44.262577, -2640.882324, 13.200072, 0.000000, 0.000000, -70.499984, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2718, 40.512104, -2640.217529, 14.550067, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2255, 51.674365, -2655.109130, 14.040068, 0.000000, -12.500000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2525, 44.015495, -2630.245605, 12.080066, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11711, 52.162265, -2650.994873, 14.960062, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2232, 30.262073, -2656.981445, 12.120072, 0.000000, 0.000000, 123.899963, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1670, 50.472976, -2641.813964, 12.840071, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1514, 44.101470, -2640.081542, 13.390069, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2204, 40.466182, -2641.426269, 12.040068, 0.000000, 0.000000, 450.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1517, 44.073852, -2641.712402, 13.390076, 0.000000, 0.000000, -24.500001, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1520, 44.023872, -2641.971679, 13.250069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1517, 44.203887, -2638.243408, 13.390076, 0.000000, 0.000000, -24.500001, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2995, 45.823207, -2647.128906, 13.010068, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2998, 46.578727, -2646.773681, 12.980067, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(3104, 46.154769, -2647.408691, 13.000070, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(3106, 45.123107, -2647.249755, 12.990075, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(16779, 46.287578, -2645.763183, 15.500073, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1893, 46.332153, -2638.369628, 15.600069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1893, 46.332153, -2641.891113, 15.600069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1893, 46.332153, -2648.644287, 15.600069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1893, 46.332153, -2652.744140, 15.600069, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(5078, 58.613693, -2668.662353, 12.820056, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2681, 46.981681, -2656.947021, 12.070068, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2588, 37.521892, -2648.219238, 12.920070, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(18059, 56.551578, -2654.744384, 12.460063, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2068, 37.846450, -2652.811035, 15.190077, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2676, 46.689868, -2654.689208, 12.180066, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2677, 43.437313, -2650.513916, 12.360071, 0.000000, 0.000000, -40.799999, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2675, 46.725753, -2643.074707, 12.140065, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1520, 49.193859, -2639.621093, 12.150070, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1520, 49.113861, -2639.500976, 12.150070, 0.000000, 0.000000, -63.399993, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1517, 49.101768, -2639.796142, 12.120076, 0.000000, 90.000000, 335.500000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2845, 43.513729, -2632.221191, 12.080065, 0.000000, 0.000000, -11.000012, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(15027, 45.822696, -2628.033203, 12.410071, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2515, 45.129467, -2633.418212, 13.090069, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2741, 45.103359, -2633.671630, 13.420064, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2264, 48.846035, -2644.349121, 14.300065, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2265, 48.847011, -2645.469970, 13.860063, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2801, 50.551879, -2635.474121, 12.460065, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2587, 38.292755, -2648.209716, 12.730057, 0.000000, -12.300000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2660, 36.718639, -2657.403076, 12.810063, 0.000000, -7.499999, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2614, 52.100273, -2641.790527, 14.490071, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2047, 52.145999, -2635.399169, 14.460069, 0.000000, 360.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2002, 48.863666, -2638.714111, 12.070066, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 42.691112, -2657.986328, 10.954133, 0.000000, 180.000000, 810.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 45.441123, -2657.486083, 10.954133, 0.000000, 180.000000, 720.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(14407, 47.312984, -2660.671630, 8.870065, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(338, 45.533275, -2647.288818, 13.050069, 0.000000, 90.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(338, 46.315555, -2646.113037, 12.370064, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2205, 35.540157, -2665.000244, 6.260054, 0.000000, 360.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2205, 34.180168, -2667.010498, 6.260054, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2205, 34.180168, -2668.000000, 6.260054, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2205, 34.180168, -2668.989990, 6.260054, 0.000000, 0.000029, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(14880, 45.862174, -2673.136474, 6.650059, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2844, 43.954528, -2674.386474, 6.260056, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2852, 44.354526, -2672.324707, 6.260056, 0.000000, 0.000000, 19.200000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1362, 40.475597, -2672.598632, 6.820055, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1791, 46.533245, -2676.503906, 7.380057, 0.000000, 0.000000, -147.999908, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1535, 42.277191, -2671.838867, 6.270054, 90.000000, -28.100017, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(913, 41.501880, -2675.045410, 7.110057, 0.000000, 0.000000, 125.299995, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(911, 46.091636, -2676.143554, 6.810056, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2677, 43.435966, -2675.492187, 6.540057, 0.000000, 0.000000, 24.000001, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(923, 44.152549, -2665.991455, 7.130058, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1462, 45.987648, -2669.886962, 6.260054, 0.000000, 0.000000, -142.800018, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(943, 40.260547, -2669.944091, 7.010057, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(920, 40.105682, -2668.123535, 6.650056, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 45.207050, -2671.532714, 5.630051, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 42.147056, -2671.532714, 5.630051, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(17969, 39.866252, -2668.175537, 8.000060, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(11435, 40.307064, -2664.799316, 5.630051, 180.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(944, 42.776973, -2663.364501, 7.150062, 0.000000, 0.000000, -35.800010, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2046, 39.986381, -2666.433593, 7.980061, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(3014, 40.096427, -2667.415771, 6.460059, 0.000000, 0.000000, -36.700000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2059, 42.313880, -2664.628662, 6.270057, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2058, 44.064197, -2667.675292, 6.270059, 0.000000, 0.000000, -103.000007, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19173, 47.132865, -2673.968017, 8.080058, 0.000000, 0.000000, 90.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(322, 45.485004, -2676.312744, 7.480060, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(14455, 30.733163, -2664.600341, 7.840061, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1714, 34.902050, -2663.467041, 6.260052, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1714, 34.902050, -2670.538818, 6.260052, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 36.931251, -2668.341308, 6.690050, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 36.931251, -2667.391113, 6.690050, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 36.931251, -2666.490722, 6.690050, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 36.931251, -2665.630126, 6.690050, 0.000000, 0.000000, 270.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 32.751155, -2665.630371, 6.690050, 0.000007, 0.000007, 89.999916, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 32.751155, -2666.580566, 6.690050, 0.000007, 0.000007, 89.999916, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 32.751155, -2667.480957, 6.690050, 0.000007, 0.000007, 89.999916, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1671, 32.751155, -2668.341308, 6.690050, 0.000007, 0.000007, 89.999916, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19893, 35.423904, -2664.821289, 7.180057, 0.000000, 0.000000, -145.099960, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1893, 41.561916, -2665.587158, 9.460059, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(1893, 41.561916, -2669.257568, 9.460059, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2045, 34.412372, -2664.781982, 7.240056, 4.199997, 0.000000, 127.700004, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(16780, 34.848495, -2666.770507, 9.540067, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(19325, 39.600032, -2667.847412, 6.260049, 90.000000, 360.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2894, 34.917358, -2669.097900, 7.190058, 0.000000, 0.000000, 0.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2264, 33.910789, -2671.003662, 7.700059, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2265, 34.995635, -2671.026611, 8.040059, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2266, 35.659412, -2671.001464, 8.040057, 0.000000, 270.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(2263, 37.188377, -2671.023681, 8.160055, 0.000000, 0.000000, 180.000000, 5, -1, -1, 300.00, 300.00);
	hellsy= CreateDynamicObject(14455, 37.983169, -2661.829101, 7.840061, 0.000000, 0.000000, 540.000000, 5, -1, -1, 300.00, 300.00);

	DodajWejscie(33.5437,-2649.7981,40.7285, 50.9963,-2650.9519,13.0701, 0, 0, 5, 0, "Klub Motocyklowy", "Już upity? Wynocha!");//Glowne wejscie




	return 1;
}

static StworzBramy()
{
	bramahell1= CreateDynamicObject(1495, 46.9822, -2667.191894, 6.260055, 0.000000, 0.000000, -179.7399, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(bramahell1, 2, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	DodajBrame(bramahell1, 46.9822, -2667.191894, 6.260055, 0.000000, 0.000000, -179.7399, 46.9822, -2667.191894, 6.260055, 0.000000, 0.000000, -103.5999, 2, 2, BRAMA_UPR_TYPE_GROUP, 35);

    bramahell2= CreateDynamicObject(1495, 39.791118, -2662.4826, 6.260055, 0.000000, 0.000000, -91.9000, 5, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(bramahell2, 2, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	DodajBrame(bramahell2, 39.791118, -2662.4826, 6.260055, 0.000000, 0.000000, -91.9000, 39.791118, -2662.4826, 6.260055, 0.000000, 0.000000, -188.5600, 2, 2, BRAMA_UPR_TYPE_GROUP, 35);


	return 1;
}
