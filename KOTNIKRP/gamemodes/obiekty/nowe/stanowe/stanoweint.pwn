//stanoweINT.pwn
//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Modu3: stanoweINT.pwn ]--------------------------------------------//
//Autor: Simeone, Rozalka
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

//-----------------<[ G3ówne funkcje: ]>-------------------
stanoweINT_Init() 
{
	StworzObiekty();
	StworzBudynki();
	return 1;
}
stanoweINT_Connect(playerid)
{
	UsunObiekty(playerid); 
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	simeonel = CreateDynamicObject(18765, -553.595825, 2593.872802, 82.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(18765, -543.595825, 2593.872802, 82.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(18765, -543.595825, 2603.872802, 82.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(18765, -553.595825, 2603.872802, 82.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(19445, -553.773498, 2588.791992, 86.865608, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -544.153930, 2588.791992, 86.865608, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -539.544128, 2593.591796, 86.865608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -539.544128, 2603.213867, 86.865608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -544.374145, 2608.075195, 86.865608, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -553.993957, 2608.075195, 86.865608, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -557.544128, 2590.031494, 86.865608, 0.000000, 0.000000, 360.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -557.544128, 2603.213867, 86.865608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -553.773498, 2588.791992, 90.365608, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -544.153930, 2588.791992, 90.365608, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -539.544128, 2593.591796, 90.365608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -539.544128, 2603.213867, 90.365608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -544.374145, 2608.075195, 90.365608, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -553.993957, 2608.075195, 90.365608, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -557.544128, 2593.591796, 90.365608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -557.544128, 2603.213867, 90.365608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(18765, -553.595825, 2593.872802, 92.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(18765, -543.595825, 2593.872802, 92.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(18765, -543.595825, 2603.872802, 92.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(18765, -553.595825, 2603.872802, 92.635620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 11145, "carrierint_sfs", "ws_shipmetal4", 0xFF707070);
	simeonel = CreateDynamicObject(19445, -557.303649, 2603.263671, 86.875625, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -554.853393, 2603.263671, 90.395606, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -554.853393, 2603.263671, 91.795600, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19383, -550.870361, 2603.259277, 86.875625, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -549.344360, 2607.994140, 86.875625, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -549.344360, 2607.994140, 90.395606, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -549.344360, 2607.994140, 91.815605, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19426, -548.471252, 2603.270751, 86.895622, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19383, -546.070312, 2603.259277, 86.875625, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -539.663513, 2603.263671, 86.875625, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -545.223510, 2603.263671, 90.395606, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -535.613403, 2603.263671, 90.395606, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19426, -544.371093, 2602.370117, 86.895622, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19426, -544.371093, 2600.759033, 86.895622, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19383, -544.379943, 2598.367187, 86.875625, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19426, -544.371093, 2595.978271, 86.895622, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19426, -544.371093, 2594.358886, 86.895622, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19383, -544.379943, 2591.946289, 86.875625, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -544.383544, 2598.374755, 90.395606, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -544.383544, 2588.744873, 90.395606, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -544.383544, 2585.554443, 86.885620, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -544.383544, 2584.193603, 86.885620, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -539.483886, 2596.665771, 86.885620, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -539.483886, 2596.665771, 90.345626, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(1569, -551.643005, 2603.227294, 85.135620, 0.000000, 0.000000, -110.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19302, "pd_jail_door01", "pd_jail_door01", 0xFF202020);
	simeonel = CreateDynamicObject(1497, -550.063659, 2588.908935, 85.135620, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, -1, "none", "none", 0xFF909090);
	simeonel = CreateDynamicObject(1569, -546.831420, 2603.208496, 85.135620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19302, "pd_jail_door01", "pd_jail_door01", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -557.574157, 2596.653564, 92.945594, 90.000000, 0.000000, 360.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -557.594177, 2596.553466, 92.945594, 90.000000, 0.000000, 360.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2990, "arsex", "steel128", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(19445, -557.644226, 2597.123046, 86.865608, 0.000000, 0.000000, 360.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
	simeonel = CreateDynamicObject(2602, -557.055419, 2604.319824, 85.735618, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	simeonel = CreateDynamicObject(14793, -551.130310, 2595.793457, 90.045646, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	simeonel = CreateDynamicObject(14793, -551.130310, 2607.744628, 90.045646, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	simeonel = CreateDynamicObject(14793, -540.789978, 2607.744628, 90.045646, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	simeonel = CreateDynamicObject(14793, -540.789978, 2595.752441, 90.045646, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 16644, "a51_detailstuff", "roucghstonebrtb", 0x00000000);
	simeonel = CreateDynamicObject(2602, -540.024536, 2604.319824, 85.735618, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	simeonel = CreateDynamicObject(19445, -545.263549, 2603.263671, 91.745574, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -535.733703, 2603.263671, 91.745574, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -544.354248, 2598.455078, 91.745574, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(19445, -544.354248, 2588.855712, 91.745574, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19304, "pd_jail_door_top01", "pd_jail_door_top01", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 1, -1, "none", "none", 0xFF202020);
	SetDynamicObjectMaterial(simeonel, 2, -1, "none", "none", 0xFF202020);
	simeonel = CreateDynamicObject(4227, -555.117309, 2588.830566, 87.225608, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2602, -540.024536, 2599.600097, 85.735618, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	simeonel = CreateDynamicObject(2670, -542.140197, 2600.994384, 85.225631, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(1569, -544.391601, 2597.584472, 85.135620, 0.000000, 0.000000, 150.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19302, "pd_jail_door01", "pd_jail_door01", 0xFF202020);
	simeonel = CreateDynamicObject(1569, -544.391601, 2591.194335, 85.135620, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 19302, "pd_jail_door01", "pd_jail_door01", 0xFF202020);
	simeonel = CreateDynamicObject(14401, -550.656372, 2596.436279, 85.385612, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 2, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2602, -540.024536, 2592.148925, 85.735618, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	simeonel = CreateDynamicObject(2670, -542.278076, 2598.897460, 85.225631, 0.000000, 0.000000, 72.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2670, -541.250854, 2598.563720, 85.225631, 0.000000, 0.000000, 102.000007, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2670, -550.129577, 2605.752929, 85.225631, 0.000000, 0.000000, 102.000007, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2670, -552.271667, 2605.296386, 85.225631, 0.000000, 0.000000, 102.000007, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 4, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 5, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2670, -555.255187, 2604.656494, 85.225631, 0.000000, 0.000000, 372.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 3, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 4, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(simeonel, 5, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2673, -546.357055, 2605.196044, 85.225631, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2673, -544.436950, 2605.196044, 85.225631, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2673, -548.146850, 2604.185302, 85.225631, 0.000000, 0.000000, 39.200000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2673, -547.568847, 2606.515136, 85.225631, 0.000000, 0.000000, 39.200000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2673, -543.531005, 2605.963134, 85.225631, 0.000000, 0.000000, 39.200000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	simeonel = CreateDynamicObject(2673, -542.247741, 2604.390869, 85.225631, 0.000000, 0.000000, 39.200000, 1, 0, -1, 190.00, 190.00); 
	SetDynamicObjectMaterial(simeonel, 1, 19297, "matlights", "invisible", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	simeonel = CreateDynamicObject(1800, -556.816406, 2604.384521, 85.095611, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18755, -559.503906, 2596.610351, 87.065567, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -556.816406, 2604.384521, 86.105613, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -553.796630, 2604.384521, 85.105598, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -553.796630, 2604.384521, 86.105583, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2738, -551.422119, 2607.504882, 85.755607, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18659, -555.185852, 2607.959228, 86.375625, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18660, -539.653076, 2598.164062, 86.665611, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18661, -539.644531, 2594.984130, 87.235595, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18662, -539.654846, 2605.632324, 87.375633, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(17969, -557.416931, 2591.525390, 86.635620, 0.000000, 0.000000, 540.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -543.796630, 2607.084228, 85.105598, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -543.796630, 2607.084228, 86.105583, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -541.396728, 2607.084228, 85.105598, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -541.396728, 2607.084228, 86.105583, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2738, -548.381591, 2607.504882, 85.755607, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -539.796630, 2602.384521, 85.105598, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -539.796630, 2602.384521, 86.105583, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2738, -540.126525, 2601.366943, 85.755607, 0.000000, 0.000000, -89.199989, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18667, -557.438232, 2600.781982, 86.945625, 0.000000, 0.000000, 180.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(18662, -553.226623, 2588.918701, 87.105606, 0.000000, 0.000000, 270.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -539.796630, 2595.672607, 85.105598, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1800, -539.796630, 2595.672607, 86.155593, 0.000000, -0.000002, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2738, -540.032897, 2594.668945, 85.755607, 0.000000, 0.000000, -89.199989, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2674, -554.816711, 2597.279052, 85.195617, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2674, -554.816711, 2589.986816, 85.195617, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2674, -547.546813, 2589.986816, 85.195617, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2674, -541.656799, 2592.897460, 85.195617, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2670, -554.260192, 2594.972900, 85.255615, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2670, -549.399780, 2594.972900, 85.255615, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2670, -549.399780, 2597.643310, 85.255615, 0.000000, 0.000000, 90.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2670, -546.414184, 2592.073730, 85.255615, 0.000000, 0.000000, 36.099994, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2670, -545.841674, 2598.196777, 85.255615, 0.000000, 0.000000, 36.099994, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2670, -551.409545, 2602.130126, 85.255615, 0.000000, 0.000000, 36.099994, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2671, -554.917419, 2600.440429, 85.135620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2671, -554.800781, 2593.050781, 85.135620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(2671, -547.991210, 2601.427978, 85.135620, 0.000000, 0.000000, 0.000000, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1886, -556.520874, 2590.068603, 90.213783, 18.600004, 0.000000, 155.599960, 1, 0, -1, 190.00, 190.00); 
	simeonel = CreateDynamicObject(1886, -556.397399, 2601.907470, 89.989456, 19.399999, 0.000000, 37.599975, 1, 0, -1, 190.00, 190.00); 

	return 1;
}
static StworzBudynki()
{
	DodajWejscie(-554.7513,2590.4070,53.6603, -556.4969,2596.6355,86.1356, 0, 0, 1, 0, "{333399}Tymczasowe więzienie stanowe FBI\n{FFFFFF}[/aresztuj]", "Wyjście", 16);//Winda-Zewnątrz
	DodajWejscie(-551.1606,2589.7166,86.1356, -572.0835,2610.5825,53.6603, 1, 0, 0, 0, "Spacerniak", "Powrót do cel");//Spacerniak
	return 1; 
}
static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 16010, -569.617, 2593.530, 56.406, 0.250);
	RemoveBuildingForPlayer(playerid, 16612, -569.617, 2593.530, 56.406, 0.250);
	return 1;
}
