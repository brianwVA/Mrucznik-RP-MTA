//sa_bahamas.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: sa_bahamas.pwn ]--------------------------------------------//
//Autor: Widelec
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
sa_bahamas_Init() 
{
	StworzObiekty();
	StworzBramy();
	StworzBudynki();
	return 1;
}

sa_bahamas_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	gateob = CreateDynamicObject(19377, 934.59998, -1530.45996, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 945.09998, -1530.45996, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 945.09998, -1540.07996, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 945.09998, -1549.69995, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 934.59998, -1540.07996, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 934.59998, -1549.69995, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 934.59998, -1520.83997, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 934.59998, -1511.21997, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 945.09998, -1520.83997, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19377, 945.09998, -1511.21997, 20.30000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14702, "masmall3int2", "hs3_wall6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 929.44000, -1530.45996, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1524.04004, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1520.83997, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1517.64001, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1514.43994, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 929.44000, -1511.23999, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 929.71997, -1508.12000, 22.12000,   0.00000, 0.00000, 350.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 934.84003, -1506.47998, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 944.46002, -1506.47998, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 949.73999, -1508.02002, 22.12000,   0.00000, 0.00000, 20.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 950.28003, -1511.21997, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 950.28003, -1520.83997, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 950.28003, -1540.07996, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 950.28003, -1530.45996, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 950.28003, -1549.69995, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1536.88000, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1540.07996, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1543.28003, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 943.90002, -1554.47998, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 949.34003, -1553.30005, 22.12000,   0.00000, 0.00000, 320.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19388, 934.44000, -1530.45996, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 935.96997, -1535.18005, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 934.44000, -1533.66003, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 934.44000, -1527.26001, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 937.48999, -1549.59998, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 934.44000, -1550.09998, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 935.96997, -1545.36011, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 935.96997, -1525.66016, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 934.44000, -1524.06006, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 934.44000, -1520.86011, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 934.44000, -1517.66016, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19388, 935.96997, -1516.06018, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 937.48999, -1511.16003, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 934.44000, -1511.30005, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 937.48999, -1517.66016, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19388, 937.48999, -1520.86011, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 937.48999, -1524.06006, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 937.48999, -1536.78015, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19388, 937.48999, -1539.97998, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 937.48999, -1543.18005, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1546.47998, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19404, 929.44000, -1549.68005, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 930.34998, -1552.56006, 22.12000,   0.00000, 0.00000, 35.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 937.47998, -1554.47998, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 934.28003, -1554.47998, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 932.40002, -1553.96997, 22.12000,   0.00000, 0.00000, 70.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19388, 940.48999, -1517.62024, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 940.48999, -1511.21997, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 940.48999, -1524.04004, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 940.48999, -1533.66003, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 940.48999, -1540.08008, 22.12000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 939.12000, -1541.62000, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19450, 945.32001, -1521.16003, 22.12000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19358, 949.16998, -1520.04004, 22.12000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 934.59998, -1511.21997, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 945.09998, -1511.21997, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 934.59998, -1520.83997, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 945.09998, -1520.83997, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 945.09998, -1530.45996, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 934.59998, -1530.45996, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 945.09998, -1540.07996, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 945.09998, -1549.69995, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 934.59998, -1549.69995, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19378, 934.59998, -1540.07996, 23.94000,   0.00000, 90.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4002, "cityhall_lan", "lacityhwal1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 934.78003, -1537.78003, 20.34000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 18006, "genintintbarberA", "barberspic1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 934.78003, -1542.73999, 20.34000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 18006, "genintintbarberA", "barberspic1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 929.87000, -1538.31995, 20.34000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 929.87000, -1543.31995, 20.34000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 929.87000, -1548.31995, 20.34000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 929.87000, -1519.31995, 20.34000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 929.87000, -1524.31995, 20.34000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 929.87000, -1514.31995, 20.34000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1549.52002, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1547.19995, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1544.43994, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1542.17993, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1539.57996, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1536.95996, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1525.47998, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1523.18005, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1520.52014, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1518.20007, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1515.40015, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2682, 929.87000, -1513.24011, 21.65000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14802, "lee_bdupsflat", "bdup_punters", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 931.17999, -1506.82996, 23.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14640, "chinese_furn", "ab_tv_tricas1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1517.64001, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14785, "gen_offtrackINT", "otb_mural2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1520.83997, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 2611, "POLICE_PROPS_un", "gus", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1524.04004, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 5857, "lawnbuy", "ws_starballs", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1536.88000, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14785, "gen_offtrackINT", "otb_mural1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1540.07996, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 1515, "dsfs", "CJ_POKERSCREEN", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1543.28003, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 1515, "dsfs", "CJ_POKERSCREEN2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1546.47998, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14785, "gen_offtrackINT", "otb_mural3", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1549.68005, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 15040, "cuntcuts", "csnewspaper", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 934.08002, -1549.31995, 23.41000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11389, "hubint1_sfse", "ws_stdcalendar", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 934.08002, -1547.31995, 23.41000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14785, "gen_offtrackINT", "otb_mural4", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 934.08002, -1551.31995, 23.41000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 17519, "lae2newtempbx", "lasclean4", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 929.78998, -1514.43994, 23.41000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12981, "sw_fact01", "ws_solarin", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 932.17999, -1506.82996, 23.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 6864, "vgnvrock", "vrocksign1_256", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 933.17999, -1506.82996, 23.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 4682, "dtbuil1_lan2", "LAInside_Tracksign2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 933.98999, -1514.09998, 20.34000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 933.98999, -1509.18005, 20.34000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(11686, 933.98999, -1549.19995, 20.34000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2568, 933.81000, -1531.75000, 20.36000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 18006, "genintintbarberA", "barberspic1", 0x00FFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2256, 937.38000, -1537.56995, 22.23000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14785, "gen_offtrackINT", "otb_mural1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2256, 937.38000, -1542.56995, 22.23000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14785, "gen_offtrackINT", "otb_mural2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1825, 931.03003, -1507.68994, 20.37000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 1825, "kbmiscfrn1cj", "htl_tbltop2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1825, 930.64001, -1510.46997, 20.37000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 1825, "kbmiscfrn1cj", "htl_tbltop2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1825, 933.57001, -1552.82996, 20.37000,   0.00000, 0.00000, 50.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 1825, "kbmiscfrn1cj", "htl_tbltop2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1825, 930.90997, -1551.18994, 20.37000,   0.00000, 0.00000, 50.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 1825, "kbmiscfrn1cj", "htl_tbltop2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 938.07001, -1538.19995, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 938.07001, -1537.19995, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 938.07001, -1536.19995, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 935.65997, -1528.39001, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 935.65997, -1533.39001, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 942.84003, -1510.03003, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 942.84003, -1508.93005, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 942.84003, -1511.13000, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 942.84003, -1512.22998, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 947.72000, -1514.40002, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 947.72000, -1513.30005, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 947.72000, -1512.19995, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 945.79999, -1519.53003, 20.38000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 947.29999, -1518.85010, 20.38000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 947.96997, -1517.37000, 20.38000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2296, 949.09000, -1507.21000, 20.38000,   0.00000, 0.00000, 290.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 948.46002, -1506.95996, 20.38000,   0.00000, 0.00000, 290.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 949.13000, -1508.80005, 20.38000,   0.00000, 0.00000, 290.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 949.79999, -1510.64001, 20.38000,   0.00000, 0.00000, 290.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 943.72998, -1521.05994, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 941.76001, -1521.05994, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2834, 938.48999, -1507.56995, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14735, "newcrak", "carpet-tile", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19929, 934.96002, -1524.02002, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19929, 934.96002, -1521.02002, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19929, 934.96002, -1518.02002, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19930, 933.92999, -1519.26001, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19930, 933.92999, -1522.47998, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19929, 934.96002, -1513.93994, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19929, 934.96002, -1511.02002, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 11686, "int_casinoint3", "GB_midbar08", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 936.90997, -1513.40002, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 936.90997, -1512.40002, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 936.90997, -1511.40002, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 936.90997, -1510.40002, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2063, 934.81000, -1508.14001, 21.29000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2063, 937.13000, -1508.26001, 21.29000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 939.91998, -1510.81006, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 939.91998, -1512.81006, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING3", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 939.91998, -1514.81006, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING4", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 938.06000, -1512.40015, 22.41000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING8", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 938.06000, -1514.40015, 22.41000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING9", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 938.06000, -1516.40015, 22.41000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING27", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 930.01001, -1510.43005, 22.41000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 930.37000, -1507.71997, 22.41000,   0.00000, 0.00000, 80.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING6", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 930.42999, -1551.68005, 22.41000,   0.00000, 0.00000, 125.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING12", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 932.65002, -1553.45996, 22.41000,   0.00000, 0.00000, 160.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2262, "picture_frame_clip", "CJ_PAINTING24", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 936.91998, -1517.30005, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 14640, "chinese_furn", "ab_tv_tricas1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 936.91998, -1519.07996, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 12981, "sw_fact01", "ws_solarin", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 936.91998, -1522.68005, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 5857, "lawnbuy", "ws_starballs", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2262, 936.91998, -1524.56006, 22.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 12984, "sw_block11", "sw_locals", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2255, 941.06000, -1512.72998, 22.35000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 6354, "sunset03_law2", "billla02", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 941.06000, -1515.66003, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2158, 941.06000, -1514.66003, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2255, 941.06000, -1507.72998, 22.35000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 6354, "sunset03_law2", "billla01", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2255, 941.06000, -1510.22998, 22.35000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 6864, "vgnvrock", "vrocksign1_256", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2255, 941.76001, -1507.05005, 22.35000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14860, "gf1", "mp_apt1_pos1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2255, 943.76001, -1507.05005, 22.35000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14860, "gf1", "mp_apt1_pos2", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2255, 945.76001, -1507.05005, 22.35000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 14860, "gf1", "mp_apt1_pos3", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 936.79999, -1534.81995, 23.41000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 935.79999, -1534.81995, 23.41000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 935.79999, -1526.01990, 23.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(2700, 936.79999, -1526.01990, 23.41000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 0, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19893, 934.85999, -1522.93994, 21.30000,   0.00000, 0.00000, 70.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19893, 934.85999, -1522.09985, 21.30000,   0.00000, 0.00000, 110.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(19893, 934.85999, -1519.09985, 21.30000,   0.00000, 0.00000, 110.00000,120250,_,_,_,500);
	SetDynamicObjectMaterial(gateob, 1, 2754, "otb_machine", "ap_screens1", 0xFFFFFFFF);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 929.44000, -1519.18005, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 929.44000, -1519.18005, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 929.44000, -1519.18005, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 929.44000, -1545.97998, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 929.44000, -1545.97998, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 929.44000, -1545.97998, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3857, 929.44000, -1534.69995, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3857, 929.44000, -1534.69995, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3857, 929.44000, -1534.69995, 24.34000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1515, 933.81000, -1526.26001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2242, 929.90002, -1528.17004, 20.54000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(651, 929.89001, -1528.21997, 20.00000,   0.00000, 0.00000, 330.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2242, 929.90002, -1534.17004, 20.54000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(651, 929.92999, -1534.12000, 20.00000,   0.00000, 0.00000, 150.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11724, 937.40997, -1537.56995, 20.91000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(956, 936.16998, -1535.69995, 20.78000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(956, 936.16998, -1544.83997, 20.78000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11724, 937.40997, -1542.56995, 20.91000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1515, 933.81000, -1527.26001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1515, 933.81000, -1528.26001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 934.44000, -1517.79114, 24.62000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 934.44000, -1517.79114, 24.62000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3858, 934.44000, -1517.79114, 24.62000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(16780, 931.83002, -1514.02002, 24.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(16780, 931.83002, -1529.02002, 24.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(16780, 931.83002, -1545.02002, 24.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19820, 937.25000, -1536.63000, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19821, 937.25000, -1538.50000, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19822, 937.25000, -1537.79004, 21.42000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19824, 937.25000, -1538.31006, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19823, 937.25000, -1537.53015, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 934.78003, -1537.46997, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19822, 937.25000, -1538.06995, 21.42000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19824, 937.25000, -1537.31006, 21.42000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19820, 937.25000, -1536.98999, 21.42000,   0.00000, 0.00000, 10.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19820, 937.25000, -1541.63000, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19820, 937.25000, -1541.98999, 21.42000,   0.00000, 0.00000, 10.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19824, 937.25000, -1542.31006, 21.42000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19823, 937.25000, -1542.53015, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19822, 937.25000, -1542.79004, 21.42000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19824, 937.25000, -1543.31006, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19821, 937.25000, -1543.50000, 21.42000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19819, 934.78003, -1538.46997, 21.51000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19818, 934.78003, -1539.68994, 21.51000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19818, 934.78003, -1540.68994, 21.51000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19818, 934.78003, -1542.68994, 21.51000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 934.78003, -1544.68994, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19818, 934.78003, -1535.79004, 21.51000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 934.84003, -1539.94995, 21.45000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 934.66998, -1537.90002, 21.45000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 934.73999, -1543.40002, 21.45000,   0.00000, 0.00000, 120.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 934.04999, -1548.88000, 21.45000,   0.00000, 0.00000, 120.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 930.00000, -1546.38000, 21.45000,   0.00000, 0.00000, 120.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 929.95001, -1542.93005, 21.45000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 929.91998, -1522.18994, 21.45000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 929.91998, -1514.18994, 21.45000,   0.00000, 0.00000, 250.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 933.91998, -1513.81995, 21.45000,   0.00000, 0.00000, 310.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 933.91998, -1508.81995, 21.45000,   0.00000, 0.00000, 310.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 933.78003, -1547.12000, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 930.00000, -1548.10999, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 929.84003, -1543.68994, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19818, 929.92999, -1538.57996, 21.51000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 929.88000, -1524.90002, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 929.78998, -1519.17004, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1509, 933.72998, -1511.93994, 21.63000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19897, 937.16998, -1537.14001, 21.44000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19897, 937.22198, -1542.16846, 21.44000,   0.00000, 0.00000, 40.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19897, 934.50940, -1542.45068, 21.45000,   0.00000, 0.00000, 40.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19897, 934.61560, -1537.08911, 21.45000,   0.00000, 0.00000, 120.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19807, 937.25000, -1543.04004, 21.49000,   0.00000, 0.00000, 260.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19807, 933.82001, -1534.59998, 21.28000,   0.00000, 0.00000, 260.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2824, 933.84003, -1533.19995, 21.20000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2611, 934.31000, -1533.26001, 22.30000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2611, 934.31000, -1513.26001, 22.30000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2611, 934.31000, -1549.26001, 22.30000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.64001, -1525.67004, 20.76000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.64001, -1523.67004, 20.76000,   0.00000, 0.00000, 30.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.64001, -1520.67004, 20.76000,   0.00000, 0.00000, 70.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.64001, -1517.67004, 20.76000,   0.00000, 0.00000, 100.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.64001, -1514.67004, 20.76000,   0.00000, 0.00000, 150.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2242, 940.03003, -1528.40002, 20.54000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2242, 940.03003, -1533.40002, 20.54000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(651, 940.03003, -1528.44995, 20.00000,   0.00000, 0.00000, 330.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(651, 940.06000, -1533.33997, 20.00000,   0.00000, 0.00000, 150.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 933.25000, -1510.90002, 20.76000,   0.00000, 0.00000, 150.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 933.25000, -1513.90002, 20.76000,   0.00000, 0.00000, 190.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 933.25000, -1549.18860, 20.76000,   0.00000, 0.00000, 190.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 933.25000, -1547.38855, 20.76000,   0.00000, 0.00000, 250.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.62000, -1549.10999, 20.76000,   0.00000, 0.00000, 250.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.62000, -1546.10999, 20.76000,   0.00000, 0.00000, 300.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.62000, -1543.10999, 20.76000,   0.00000, 0.00000, 350.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2350, 930.62000, -1540.10999, 20.76000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1713, 937.02002, -1534.55005, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2236, 935.65997, -1533.39001, 20.34000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2607, 939.00000, -1507.06006, 20.77000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1714, 938.59003, -1507.95007, 20.38000,   0.00000, 0.00000, 100.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1713, 935.28003, -1526.29004, 20.38000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2236, 935.65997, -1528.39001, 20.34000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1526.03003, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1524.20996, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1522.39001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1536.03003, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1538.03003, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2964, 948.25000, -1512.79004, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1703, 941.13000, -1510.94995, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1704, 941.96002, -1507.50000, 20.38000,   0.00000, 0.00000, 20.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11691, 943.32788, -1510.08179, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1703, 945.40997, -1509.10999, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1704, 943.96002, -1507.19995, 20.38000,   0.00000, 0.00000, 340.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1704, 942.59998, -1512.95996, 20.38000,   0.00000, 0.00000, 160.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1704, 944.75000, -1512.63000, 20.38000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1998, 947.57001, -1517.73999, 20.38000,   0.00000, 0.00000, 315.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1998, 946.90002, -1519.84009, 20.38000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1714, 948.32001, -1519.17004, 20.38000,   0.00000, 0.00000, 225.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2607, 944.23999, -1520.59998, 20.77000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2607, 942.23999, -1520.59998, 20.77000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1514.39001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1512.39001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1510.39001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.59003, -1512.83008, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.59003, -1514.83008, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.59003, -1516.83008, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2332, 934.94000, -1510.18005, 21.74000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2332, 934.94000, -1513.18005, 21.74000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2332, 934.94000, -1514.18005, 21.74000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.39001, -1516.81006, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.39001, -1518.67004, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.39001, -1522.25000, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 937.39001, -1524.17004, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2163, 940.39001, -1520.39001, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2611, 944.28003, -1521.03003, 22.30000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2611, 942.28003, -1521.03003, 22.30000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(16780, 937.64001, -1530.31006, 24.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(16780, 947.73999, -1517.79004, 24.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(16780, 943.03998, -1509.81995, 24.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3002, 948.13000, -1512.05005, 21.31000,   0.00000, 0.00000, 10.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3100, 947.96002, -1512.53003, 21.31000,   0.00000, 0.00000, 100.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3102, 948.08002, -1513.44995, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3101, 948.48999, -1512.52002, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3103, 948.28003, -1513.04004, 21.31000,   0.00000, 0.00000, 40.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3104, 948.59003, -1513.23999, 21.31000,   0.00000, 0.00000, 20.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3106, 948.46997, -1511.93005, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3105, 948.17999, -1513.23999, 21.31000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3003, 947.90997, -1512.94995, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2995, 948.23999, -1512.67004, 21.31000,   0.00000, 0.00000, 100.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2999, 948.40997, -1513.50000, 21.31000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2996, 948.14001, -1513.57996, 21.31000,   0.00000, 0.00000, 20.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2997, 948.26001, -1512.35999, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2998, 947.91998, -1513.56006, 21.31000,   0.00000, 0.00000, 150.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3000, 948.46997, -1512.89001, 21.31000,   0.00000, 0.00000, 300.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(3001, 948.00000, -1513.33997, 21.31000,   0.00000, 0.00000, 60.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19897, 942.70001, -1509.56995, 21.17000,   0.00000, 0.00000, 70.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19897, 943.82001, -1511.34998, 21.17000,   0.00000, 0.00000, 45.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1486, 942.75000, -1511.07996, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1486, 943.67999, -1508.81006, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1486, 943.76001, -1510.50000, 21.31000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2967, 942.85999, -1508.92004, 21.16000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2967, 947.46002, -1518.08997, 21.19000,   0.00000, 0.00000, 60.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1486, 948.83002, -1512.19995, 21.47000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1486, 947.96002, -1513.83997, 21.47000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19807, 942.91998, -1520.55005, 21.25000,   0.00000, 0.00000, 160.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19807, 939.71997, -1507.05005, 21.25000,   0.00000, 0.00000, 340.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 938.33002, -1507.04004, 21.19000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 942.84998, -1510.29004, 21.18000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 943.10999, -1511.40198, 21.18000,   0.00000, 0.00000, 80.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 946.67999, -1519.95996, 21.21000,   0.00000, 0.00000, 150.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 936.12000, -1532.82996, 20.86000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1665, 936.19000, -1527.68005, 20.86000,   0.00000, 0.00000, 200.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19807, 937.15002, -1519.56995, 21.38000,   0.00000, 0.00000, 250.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19621, 936.98999, -1507.47998, 21.31000,   0.00000, 0.00000, 30.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19918, 934.79999, -1507.73999, 20.74000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19918, 934.79999, -1508.50000, 21.66000,   0.00000, 0.00000, 80.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19918, 937.12000, -1508.50000, 21.22000,   0.00000, 0.00000, 140.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2713, 937.09003, -1508.94995, 20.88000,   0.00000, 0.00000, 70.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2855, 933.94000, -1522.41003, 21.30000,   0.00000, 0.00000, 30.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2855, 936.52002, -1532.88000, 20.84000,   0.00000, 0.00000, 70.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2386, 934.75000, -1507.23999, 20.84000,   0.00000, 0.00000, 50.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11743, 943.53003, -1520.80005, 21.17000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19624, 946.91998, -1518.17004, 20.81000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11745, 948.29999, -1516.93005, 20.55000,   0.00000, 0.00000, 50.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11745, 940.17999, -1524.51001, 21.47000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11745, 934.83002, -1508.77002, 20.90000,   0.00000, 0.00000, 20.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11745, 937.09998, -1507.92004, 20.90000,   0.00000, 0.00000, 350.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2816, 933.94000, -1519.29004, 21.30300,   0.00000, 0.00000, 50.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1670, 930.77002, -1507.72998, 21.27000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11706, 940.09998, -1534.64001, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19622, 935.95001, -1506.68994, 21.09000,   10.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2231, 950.09003, -1509.31006, 20.87000,   0.00000, 0.00000, 300.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2231, 949.28998, -1507.32996, 20.87000,   0.00000, 0.00000, 280.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2069, 940.08002, -1541.14001, 20.42000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(2069, 949.53998, -1516.73596, 20.42000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19914, 937.01001, -1508.17004, 21.67000,   0.00000, 0.00000, 80.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19835, 944.89001, -1520.44995, 21.27000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19835, 943.95001, -1509.60205, 21.26000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19613, 936.15997, -1535.69995, 22.56000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(19613, 936.15997, -1544.81995, 22.56000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11721, 950.16998, -1515.29004, 21.00000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11721, 946.88000, -1506.59998, 21.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11721, 937.60999, -1510.26001, 21.00000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11721, 937.60999, -1523.26001, 21.00000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11721, 934.32001, -1546.02002, 21.00000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(11721, 932.60999, -1506.59998, 21.00000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1550, 935.40002, -1506.81995, 20.72000,   0.00000, 0.00000, 0.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.
	CreateDynamicObject(1550, 936.53998, -1506.81995, 20.72000,   0.00000, 0.00000, 455.00000,120250,_,_,_,500);//Obiekt zakładu bukmacherskiego by widelec.

	Create3DTextLabel("ALLIBRATORE", 0xFFFFFFFF, 928.2803,-1530.6527,13.5413, 10, 0, 1);//Napis 3D przed zakładem bukmacherskim by widelec.
	//obiekty do bramy w LV
	tmpobjid = CreateDynamicObject(19447, 1136.706542, 1362.799438, 13.420762, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1136.706542, 1362.799438, 9.920737, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1127.094238, 1362.799438, 9.920737, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1127.094238, 1362.799438, 13.420740, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1127.094238, 1362.629272, 13.420740, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1136.702026, 1362.629272, 13.420740, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1136.702026, 1362.629272, 9.930759, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19447, 1127.071899, 1362.629272, 9.930759, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6908, "vgndwntwn21", "vgnlawbuild1_256", 0x00000000);
	return 1;
}

static StworzBramy()
{
	// DodajBrame(fobiekt, Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, Float:fspeed, Float:frange, fuprtyp=0, fuprval=0)
	gateob = CreateDynamicObject(1567, 934.44000, -1529.67004, 20.38000,   0.00000, 0.00000, 270.00000,120250,_,_,_,500);
	DodajBrame(gateob,
		934.44000, -1529.67004, 20.38000, 0.00000, 0.00000, 270.00000,
		934.42000, -1529.67004, 20.38000, 0.00000, 0.00000, 20.00000,
		2.0, 2.5, BRAMA_UPR_TYPE_FRACTION, 5);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1567, 937.51001, -1521.61011, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	DodajBrame(gateob,
		937.51001, -1521.61011, 20.38000, 0.00000, 0.00000, 90.00000,
		937.49001, -1521.61011, 20.38000, 0.00000, 0.00000, 30.00000,
		2.0, 2.5, BRAMA_UPR_TYPE_FRACTION, 5);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1567, 940.51001, -1518.37024, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	DodajBrame(gateob,
		940.51001, -1518.37024, 20.38000, 0.00000, 0.00000, 90.00000,
		940.49001, -1518.37024, 20.38000, 0.00000, 0.00000, 330.00000,
		2.0, 2.5, BRAMA_UPR_TYPE_FRACTION, 5);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1567, 937.51001, -1540.72998, 20.38000,   0.00000, 0.00000, 90.00000,120250,_,_,_,500);
	DodajBrame(gateob,
		937.51001, -1540.72998, 20.38000, 0.00000, 0.00000, 90.00000,
		937.49001, -1540.72998, 20.38000, 0.00000, 0.00000, 335.00000,
		2.0, 2.5, BRAMA_UPR_TYPE_FRACTION, 5);//Obiekt zakładu bukmacherskiego by widelec.
	gateob = CreateDynamicObject(1567, 936.71997, -1516.06018, 20.38000,   0.00000, 0.00000, 180.00000,120250,_,_,_,500);
	DodajBrame(gateob,
		936.71997, -1516.06018, 20.38000, 0.00000, 0.00000, 180.00000,
		936.71997, -1516.08018, 20.38000, 0.00000, 0.00000, 70.00000,
		2.0, 2.5, BRAMA_UPR_TYPE_FRACTION, 5);//Obiekt zakładu bukmacherskiego by widelec.
	//Brama w LV
	tmpobjid = CreateDynamicObject(980, 1147.311767, 1362.695434, 12.385804, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00), // brama zamkni?ta
	SetDynamicObjectMaterial(tmpobjid, 0, 18773, "tunnelsections", "metalflooring44-2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18773, "tunnelsections", "metalflooring44-2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18773, "tunnelsections", "metalflooring44-2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 18773, "tunnelsections", "metalflooring44-2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 18773, "tunnelsections", "metalflooring44-2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 18773, "tunnelsections", "metalflooring44-2", 0x00000000);
	DodajBrame(tmpobjid,
		1147.311767, 1362.695434, 12.385804, 0.000000, 0.000000, 0.000000,
		1147.311767, 1362.695434, 5.225762, 0.000000, 0.000000, 0.000000,
		2.0, 10.0, BRAMA_UPR_TYPE_FRACTION, 5);	
	return 1;
}

static StworzBudynki()
{
	//DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="", wejdzUID=0, playerLocal=255, bool:specialCome=false); 
	DodajWejscie(928.2803,-1530.6527,13.5413, 930.3282,-1530.9423,21.3859, 0, 0, 120250, 0, "", ""); 
	DodajWejscie(954.4177,-1556.1593,13.5734, 939.5939,-1530.9329,21.3859, 0, 0, 120250, 0, "", "");
	DodajWejscie(1062.0242,2075.7725,10.8203, 24.1133, 0, 0, 0, 0, 0, 0); //magazyn LV
	DodajWejscie(1062.1541,2077.8030,10.8203, 237.7436, 0, 0, 0, 0, 0, 0); //magazyn LV
	return 1;

}

static UsunObiekty(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);
	RemoveBuildingForPlayer(playerid, 6192, 988.9063, -1487.9063, 24.5391, 0.25);//Usunięty obiekt przed zakładem bukmacherskim by widelec.
	RemoveBuildingForPlayer(playerid, 615, 929.0391, -1559.4609, 12.4766, 0.25);//Usunięty obiekt przed zakładem bukmacherskim by widelec.
	RemoveBuildingForPlayer(playerid, 1297, 922.1328, -1534.3125, 15.9375, 0.25);//Usunięty obiekt przed zakładem bukmacherskim by widelec.
	//usunięta brama w LV
	RemoveBuildingForPlayer(playerid, 8229, 1142.030, 1362.500, 12.484, 0.250);
	return 1;
}

