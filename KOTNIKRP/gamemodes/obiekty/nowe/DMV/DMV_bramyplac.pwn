//

bramydmvext_Init()
{
	StworzBramy();
	return 1;
}



static StworzBramy()
{

    new placbrama =   CreateDynamicObject(968, 1378.64551, -1802.05420, 13.36220,   0.00000, -90.00000, 90.00000);
    DodajBrame(placbrama, 1378.64551, -1802.05420, 13.36220,   0.00000, -90.00000, 90.00000, 1378.64551, -1802.05420, 13.36220,   0.00000, 0.00000, 90.00000, 2, 7, BRAMA_UPR_TYPE_FRACTION, 11);//Brama wjazdowa
    
    new placbrama3 = CreateDynamicObject(1495, 1378.911621, -1812.582275, 12.546875, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(placbrama3, 0, 19058, "xmasboxes", "silk5-128x128", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 1, 18646, "matcolours", "grey-70-percent", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 2, 18646, "matcolours", "grey-40-percent", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 3, 18646, "matcolours", "grey-70-percent", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 4, 18646, "matcolours", "grey-70-percent", 0x00000000);
    DodajBrame(placbrama3, 1378.911621, -1812.582275, 12.546875, 0.000000, 0.000000, 90.000000, 1378.911621, -1812.582275, 12.546875, 0.000000, 0.000000, 175.7999, 2, 3, BRAMA_UPR_TYPE_FRACTION, 11);//Brama poboczna
	
	//new bramaAlarmu[4];
	//BRAMY ALARMU
	bramaAlarmu[0] = CreateDynamicObject(19912, 1458.55872, -1781.09436, 84.14751,   0.00000, 0.00000, 0.00000, 50, 0);
	bramaAlarmu[1] = CreateDynamicObject(19912, 1453.65222, -1822.41931, 87.62315,   0.00000, 0.00000, 0.00000, 50, 0);
	bramaAlarmu[2] = CreateDynamicObject(19912, 1453.60974, -1822.42871, 87.69519,   0.00000, 0.00000, 180.00000, 50, 0);
	bramaAlarmu[3] = CreateDynamicObject(18646, 1449.86377, -1807.49780, 179.68960,   0.00000, 90.00000, 90.00000, 50, 0);

    return 1;
}