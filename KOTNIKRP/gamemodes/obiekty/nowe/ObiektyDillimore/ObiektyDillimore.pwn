//ObiektyDillimore.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: ObiektyDillimore.pwn ]--------------------------------------------//
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
ObiektyDillimore_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	StworzBramy();//To wykorzystujemy jezeli chcemy stworzyc jakies bramy
	StworzBudynki();//To wykorzystujemy jezeli chcemy stworzyc jakies wejscia 
	return 1;
}

ObiektyDillimore_Connect(playerid) //ta metode wklejamy do nowe_obiekty -> obiekty_OnPlayerConnect(playerid)
{
	UsunObiekty(playerid);//To wykorzystujemy, jezeli chcemy usunac jakies obiekty z mapy
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//Tutaj wstawiamy obiekty w nastepujacym formacie:
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	//rada lokalna dillimore (miasteczko) obiekty dillimore
	CreateDynamicObject(1280,696.94738770,-499.21337891,15.73729324,0.00000000,0.00000000,0.00000000,35,0); //object(parkbench1) (1)
	CreateDynamicObject(10994,694.86816406,-508.66992188,13.93142605,270.00000000,179.99450684,179.99450684,35,0); //object(shoppie6_sfs02) (1)
	CreateDynamicObject(5040,700.45117188,-528.11718750,25.79909325,0.00000000,0.00000000,0.00000000,35,0); //object(unionliq_las) (1)
	CreateDynamicObject(5040,690.46582031,-485.12011719,25.79909325,0.00000000,0.00000000,270.00000000,35,0); //object(unionliq_las) (2)
	CreateDynamicObject(5040,678.60839844,-507.91894531,25.79909325,0.00000000,0.00000000,270.00000000,35,0); //object(unionliq_las) (3)
	CreateDynamicObject(2617,701.27343750,-499.97363281,23.14048195,0.00000000,0.00000000,86.99523926,35,0); //object(hotel_single_3) (1)
	CreateDynamicObject(3051,699.77868652,-501.92752075,23.87768555,0.00000000,0.00000000,46.29998779,35,0); //object(lift_dr) (2)
	CreateDynamicObject(3051,699.80328369,-503.07369995,23.87768745,0.00000000,0.00000000,226.29089355,35,0); //object(lift_dr) (3)
	CreateDynamicObject(2922,699.77789307,-501.05386353,23.88330841,0.00000000,0.00000000,268.74755859,35,0); //object(kmb_keypad) (1)
	CreateDynamicObject(2445,700.25671387,-504.19610596,22.51548386,0.00000000,0.00000000,180.00000000,35,0); //object(cj_ff_conter_4d) (1)
	CreateDynamicObject(2445,701.24737549,-504.19610596,22.51548386,0.00000000,0.00000000,179.99450684,35,0); //object(cj_ff_conter_4d) (2)
	CreateDynamicObject(2445,702.23822021,-504.19610596,22.51548386,0.00000000,0.00000000,179.99450684,35,0); //object(cj_ff_conter_4d) (3)
	CreateDynamicObject(2445,703.22839355,-504.19610596,22.51548386,0.00000000,0.00000000,179.99450684,35,0); //object(cj_ff_conter_4d) (4)
	CreateDynamicObject(2445,704.19531250,-504.19610596,22.51548386,0.00000000,0.00000000,179.99450684,35,0); //object(cj_ff_conter_4d) (5)
	CreateDynamicObject(2445,705.18554688,-504.19531250,22.51548386,0.00000000,0.00000000,179.99450684,35,0); //object(cj_ff_conter_4d) (6)
	CreateDynamicObject(2167,710.07635498,-506.92810059,22.51548386,0.00000000,0.00000000,180.00000000,35,0); //object(med_office_unit_7) (1)
	CreateDynamicObject(2164,709.15441895,-506.92214966,22.51548386,0.00000000,0.00000000,180.00000000,35,0); //object(med_office_unit_5) (1)
	CreateDynamicObject(2190,701.85699463,-503.98406982,23.57105255,0.00000000,0.00000000,0.00000000,35,0); //object(pc_1) (1)
	CreateDynamicObject(2190,704.49975586,-503.96795654,23.57105255,0.00000000,0.00000000,0.00000000,35,0); //object(pc_1) (2)
	CreateDynamicObject(2186,700.23168945,-506.29263306,22.51548386,0.00000000,0.00000000,90.00000000,35,0); //object(photocopier_1) (1)
	CreateDynamicObject(1210,700.23724365,-504.84298706,22.66392136,0.00000000,0.00000000,0.00000000,35,0); //object(briefcase) (1)
	CreateDynamicObject(1210,700.24096680,-504.76675415,22.66392136,0.00000000,0.00000000,0.00000000,35,0); //object(briefcase) (2)
	CreateDynamicObject(1649,711.62695312,-505.29125977,24.18122673,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1649,711.62695312,-500.94421387,24.18122292,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1649,711.62695312,-496.58032227,24.18122292,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(2207,706.08612061,-499.16632080,22.51548004,0.00000000,0.00000000,0.00000000,35,0); //object(med_office7_desk_1) (1)
	CreateDynamicObject(1455,709.95642090,-496.77615356,23.29361725,0.00000000,0.00000000,0.00000000,35,0); //object(dyn_glass) (1)
	CreateDynamicObject(1808,709.89404297,-496.63778687,22.51548004,0.00000000,0.00000000,0.00000000,35,0); //object(cj_watercooler2) (1)
	CreateDynamicObject(1455,707.69812012,-498.88366699,23.36454010,0.00000000,0.00000000,0.00000000,35,0); //object(dyn_glass) (2)
	CreateDynamicObject(2953,707.69573975,-498.57510376,23.29658318,0.00000000,0.00000000,0.00000000,35,0); //object(kmb_paper_code) (1)
	CreateDynamicObject(1549,711.12615967,-506.69580078,22.51548386,0.00000000,0.00000000,0.00000000,35,0); //object(cj_ashtray_b) (1)
	CreateDynamicObject(2961,701.12341309,-504.54119873,23.42509842,0.00000000,0.00000000,0.00000000,35,0); //object(fire_break) (1)
	CreateDynamicObject(2961,703.98614502,-504.54119873,23.40600777,0.00000000,0.00000000,0.00000000,35,0); //object(fire_break) (2)
	CreateDynamicObject(2894,706.08618164,-498.49221802,23.29285240,0.00000000,0.00000000,0.00000000,35,0); //object(kmb_rhymesbook) (1)
	CreateDynamicObject(2811,710.98266602,-501.42218018,22.51548004,0.00000000,0.00000000,0.00000000,35,0); //object(gb_romanpot01) (1)
	CreateDynamicObject(10994,698.22167969,-525.29785156,18.28788757,270.00000000,179.99450684,90.00000000,35,0); //object(shoppie6_sfs02) (1)
	CreateDynamicObject(1649,711.57385254,-509.79022217,28.53307533,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1649,711.57324219,-514.14257812,28.53307533,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(5040,690.46710205,-496.42459106,29.97636604,0.00000000,0.00000000,270.00000000,35,0); //object(unionliq_las) (2)
	CreateDynamicObject(3051,706.28259277,-507.63003540,28.23414612,0.00000000,0.00000000,135.75000000,35,0); //object(lift_dr) (1)
	CreateDynamicObject(3051,707.45239258,-507.64093018,28.23414612,0.00000000,0.00000000,316.29089355,35,0); //object(lift_dr) (4)
	CreateDynamicObject(5040,682.83300781,-519.47753906,29.97636604,0.00000000,0.00000000,270.00000000,35,0); //object(unionliq_las) (2)
	CreateDynamicObject(2131,704.51074219,-509.13281250,26.87194252,0.00000000,0.00000000,90.00000000,35,0); //object(cj_kitch2_fridge) (1)
	CreateDynamicObject(2340,704.48974609,-510.16210938,26.87194443,0.00000000,0.00000000,90.00000000,35,0); //object(cj_kitch2_washer) (1)
	CreateDynamicObject(2339,704.48907471,-511.14431763,26.87194443,0.00000000,0.00000000,90.00000000,35,0); //object(cj_kitch2_cooker) (1)
	CreateDynamicObject(2149,704.34722900,-511.29962158,28.07655716,0.00000000,0.00000000,90.00000000,35,0); //object(cj_microwave1) (1)
	CreateDynamicObject(2500,703.99328613,-510.36245728,27.92520142,0.00000000,0.00000000,90.00000000,35,0); //object(cj_ff_coffee) (1)
	CreateDynamicObject(1649,711.57324219,-518.48535156,28.53307533,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1649,711.57324219,-522.85449219,28.53307533,0.00000000,0.00000000,270.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1510,704.56433105,-510.91168213,27.95020103,0.00000000,0.00000000,0.00000000,35,0); //object(dyn_ashtry) (1)
	CreateDynamicObject(5040,700.40429688,-546.16699219,29.97636604,0.00000000,0.00000000,0.00000000,35,0); //object(unionliq_las) (2)
	CreateDynamicObject(2239,704.70697021,-524.31896973,26.87194443,0.00000000,0.00000000,0.00000000,35,0); //object(cj_mlight16) (1)
	CreateDynamicObject(2568,704.49176025,-521.30584717,26.87194443,0.00000000,0.00000000,90.00000000,35,0); //object(hotel_dresser_3) (1)
	CreateDynamicObject(1726,707.84497070,-516.33160400,26.87194061,0.00000000,0.00000000,90.00000000,35,0); //object(mrk_seating2) (1)
	CreateDynamicObject(1727,708.97662354,-512.79785156,26.87194061,0.00000000,0.00000000,0.00000000,35,0); //object(mrk_seating2b) (1)
	CreateDynamicObject(1727,709.97088623,-517.59539795,26.87194061,0.00000000,0.00000000,180.00000000,35,0); //object(mrk_seating2b) (2)
	CreateDynamicObject(1823,708.99041748,-515.73242188,26.87194061,0.00000000,0.00000000,0.00000000,35,0); //object(coffee_med_5) (1)
	CreateDynamicObject(2194,709.42083740,-515.29089355,27.69854164,0.00000000,0.00000000,0.00000000,35,0); //object(plant_pot_2) (1)
	CreateDynamicObject(2816,709.38513184,-515.41363525,27.36757278,0.00000000,0.00000000,0.00000000,35,0); //object(gb_bedmags01) (2)
	CreateDynamicObject(10994,693.30859375,-519.06542969,38.56707382,90.00000000,180.00549316,359.98901367,35,0); //object(shoppie6_sfs02) (1)
	CreateDynamicObject(10994,698.30371094,-488.30566406,34.36515808,90.00000000,179.99450684,270.00000000,35,0); //object(shoppie6_sfs02) (1)
	CreateDynamicObject(1337,694.99908447,-500.12564087,15.98516273,0.00000000,0.00000000,0.00000000,35,0); //object(binnt07_la) (3)
	CreateDynamicObject(13028,618.02203369,-596.99511719,18.15020561,0.00000000,0.00000000,180.00000000,35,0); //object(ce_spraydoor1) (1)
	CreateDynamicObject(13028,618.02203369,-601.47198486,18.15020561,0.00000000,0.00000000,179.99450684,35,0); //object(ce_spraydoor1) (2)
	CreateDynamicObject(13028,616.94299316,-601.47882080,19.82229805,0.00000000,80.00000000,179.99450684,35,0); //object(ce_spraydoor1) (3)
	CreateDynamicObject(13028,616.94299316,-596.94097900,19.82229805,0.00000000,79.99694824,179.99450684,35,0); //object(ce_spraydoor1) (4)
	CreateDynamicObject(1649,709.36053467,-518.64208984,28.53307533,0.00000000,0.00000000,180.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1649,709.36035156,-518.64160156,28.53307533,0.00000000,0.00000000,0.00000000,35,0); //object(wglasssmash) (3)
	CreateDynamicObject(1721,707.54583740,-520.24456787,26.87194061,0.00000000,0.00000000,178.00000000,35,0); //object(est_chair1) (1)
	CreateDynamicObject(1721,708.83160400,-520.13226318,26.87194633,0.00000000,0.00000000,177.99499512,35,0); //object(est_chair1) (2)
	CreateDynamicObject(1721,710.06378174,-520.17877197,26.87194633,0.00000000,0.00000000,177.99499512,35,0); //object(est_chair1) (3)
	CreateDynamicObject(1721,710.50848389,-521.33612061,26.87194633,0.00000000,0.00000000,177.99499512,35,0); //object(est_chair1) (4)
	CreateDynamicObject(1721,709.26910400,-521.34808350,26.87194633,0.00000000,0.00000000,177.99499512,35,0); //object(est_chair1) (5)
	CreateDynamicObject(1721,708.01055908,-521.37530518,26.87194633,0.00000000,0.00000000,177.99499512,35,0); //object(est_chair1) (6)
	CreateDynamicObject(2491,708.95544434,-523.31878662,26.11733627,0.00000000,0.00000000,0.00000000,35,0); //object(model_stand) (1)
	CreateDynamicObject(2811,707.50396729,-518.93536377,26.79694748,0.00000000,0.00000000,0.00000000,35,0); //object(gb_romanpot01) (2)
	CreateDynamicObject(2811,711.06909180,-518.99615479,26.87194633,0.00000000,0.00000000,0.00000000,35,0); //object(gb_romanpot01) (3)
	CreateDynamicObject(2011,708.39813232,-519.40765381,26.87208748,0.00000000,0.00000000,0.00000000,35,0); //object(nu_plant2_ofc) (1)
	CreateDynamicObject(2001,709.45648193,-519.23510742,26.84694290,0.00000000,0.00000000,0.00000000,35,0); //object(nu_plant_ofc) (1)
	CreateDynamicObject(2011,710.25372314,-519.04913330,26.84708786,0.00000000,0.00000000,0.00000000,35,0); //object(nu_plant2_ofc) (3)
	CreateDynamicObject(2248,710.96997070,-517.61859131,27.44926262,0.00000000,0.00000000,0.00000000,35,0); //object(plant_pot_16) (1)
	CreateDynamicObject(2251,707.85742188,-523.59887695,27.71479416,0.00000000,0.00000000,0.00000000,35,0); //object(plant_pot_20) (1)
	CreateDynamicObject(1297,711.57324219,-522.05273438,29.62748146,0.00000000,0.00000000,0.00000000,35,0); //object(lamppost1) (1)
	CreateDynamicObject(2765,707.62036133,-518.63488770,27.32194138,90.00000000,179.59350586,180.40100098,35,0); //object(cj_cb_list1) (2)
	CreateDynamicObject(1721,711.06835938,-520.17431641,26.87194633,0.00000000,0.00000000,177.99499512,35,0); //object(est_chair1) (7)
	CreateDynamicObject(2765,709.13354492,-518.63720703,27.32194138,90.00000000,179.59350586,180.40100098,35,0); //object(cj_cb_list1) (3)
	CreateDynamicObject(2765,709.10394287,-518.10894775,28.84615517,0.00000000,0.00000000,0.00000000,35,0); //object(cj_cb_list1) (4)
	CreateDynamicObject(2765,707.67333984,-518.12170410,28.84615517,0.00000000,0.00000000,0.00000000,35,0); //object(cj_cb_list1) (5)
	CreateDynamicObject(2765,711.07952881,-519.11016846,28.84615517,0.00000000,0.00000000,180.00000000,35,0); //object(cj_cb_list1) (6)
	CreateDynamicObject(2765,709.63958740,-519.12707520,28.84615517,0.00000000,0.00000000,179.99450684,35,0); //object(cj_cb_list1) (7)
	CreateDynamicObject(1569,702.86456299,-496.26995850,22.49048424,0.00000000,0.00000000,0.00000000,35,0); //object(adam_v_door) (1)
	
	//intek SASP
	gateob = CreateDynamicObject(1491, 226.23210, 72.71840, 1004.04053,   0.00000, 0.00000, 270.00000);
	SetDynamicObjectMaterial(gateob, 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0xFFFFFFFF);
	gateob = CreateDynamicObject(1491, 226.23210, 74.89560, 1004.04053,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0xFFFFFFFF);
	gateob = CreateDynamicObject(1491, 222.21159, 78.91710, 1004.04053,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0xFFFFFFFF);
	gateob = CreateDynamicObject(1491, 252.08179, 72.90366, 1002.64050,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0xFFFFFFFF);
	gateob = CreateDynamicObject(1491, 259.47366, 72.83719, 1002.64050,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 1649, "wglass", "carshowwin2", 0xFFFFFFFF);
	gateob = CreateDynamicObject(1569, 259.46371, 74.34350, 1002.64093,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 1649, "wglass", "carshowwin2", 0xFFFFFFFF);
	CreateDynamicObject(1569, 246.98380, 72.53520, 1002.64069,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 222.15651, 70.35696, 1004.04041,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 226.23210, 71.20850, 1004.04041,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(19303, 266.35931, 87.45140, 1001.29022,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19303, 266.35931, 82.95680, 1001.29022,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19303, 266.35931, 78.46470, 1001.29022,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1771, 263.72931, 87.91010, 1000.67059,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1771, 263.85574, 83.35513, 1000.67059,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1771, 263.85031, 78.79002, 1000.67059,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19303, 258.93069, 89.23220, 1002.68958,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(348, 253.80769, 73.19850, 1003.73297,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 245.30280, 61.89270, 1002.64038,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 248.29601, 61.89270, 1002.64038,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1569, 226.23210, 76.39510, 1004.04041,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 222.21159, 80.42630, 1004.04041,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 250.53391, 63.91270, 1002.64038,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19380, 237.24580, 65.40560, 1004.03918,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19380, 226.97639, 65.42230, 1004.03918,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19380, 231.95520, 64.07220, 1004.03918,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19447, 237.14740, 69.93010, 1004.04077,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19447, 232.12970, 69.93470, 1003.48602,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19447, 232.12970, 69.93470, 1008.29602,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 232.45261, 70.10230, 1005.23962,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 247.67140, 72.42100, 1004.0613,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 250.81551, 64.82580, 1004.03497,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 250.61070, 68.14340, 1006.25671,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(321, 261.51129, 70.38320, 1002.24127,   90.00000, -103.00000, 0.00000);
	CreateDynamicObject(322, 254.10146, 73.25883, 1003.22272,   90.00000, -47.00000, 0.00000);
	CreateDynamicObject(18636, 253.49686, 73.22023, 1004.27588,   0.00000, 90.00000, 126.00000);
	CreateDynamicObject(334, 253.93657, 80.70556, 1003.14093,   90.00000, -62.00000, 0.00000);
	CreateDynamicObject(18637, 258.82077, 78.72878, 1003.17590,   105.00000, -180.00000, 90.00000);
	CreateDynamicObject(2206, 218.91655, 70.79005, 1004.04028,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2190, 219.37866, 70.42716, 1004.97491,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(19808, 218.66820, 70.22630, 1004.99579,   0.00000, 0.00000, 287.00000);
	CreateDynamicObject(1671, 220.26675, 70.31686, 1004.48102,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(1714, 217.38445, 69.89870, 1004.02100,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19807, 218.85291, 69.04620, 1005.05560,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(2255, 217.37250, 69.18670, 1006.00452,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2612, 221.86031, 67.28660, 1005.75732,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2605, 223.83514, 71.84997, 1004.44110,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2356, 222.72321, 72.48440, 1004.03998,   0.00000, 0.00000, -149.00000);
	CreateDynamicObject(19807, 223.96791, 71.29570, 1004.91779,   0.00000, 0.00000, -91.00000);
	CreateDynamicObject(2610, 217.32104, 66.51542, 1004.87012,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2610, 217.32100, 67.00890, 1004.87012,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 248.12000, 75.25200, 1002.64069,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1569, 252.07179, 74.40640, 1002.64093,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19437, 228.58681, 69.93430, 1005.79340,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19437, 227.69850, 69.93290, 1005.79340,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2911, 236.67580, 70.31050, 1004.04779,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2911, 236.67580, 69.87050, 1004.04779,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2008, 251.43085, 68.26211, 1002.63489,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2356, 252.40752, 69.42122, 1002.64001,   0.00000, 0.00000, -229.00000);
	CreateDynamicObject(2356, 256.99597, 69.71844, 1002.64001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2310, 242.83162, 68.57943, 1003.13959,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 242.83160, 69.35940, 1003.13959,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 242.83160, 70.11940, 1003.13959,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 242.83160, 70.87940, 1003.13959,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2611, 248.97000, 72.29260, 1004.37323,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2615, 242.44460, 63.74080, 1004.20251,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19942, 251.44250, 68.73598, 1003.54572,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2606, 250.96440, 67.66730, 1005.87378,   18.00000, 0.00000, 90.00000);
	CreateDynamicObject(2606, 227.14830, 66.00940, 1006.90009,   25.00000, 0.00000, 90.00000);
	CreateDynamicObject(2606, 227.14830, 67.98940, 1006.90009,   25.00000, 0.00000, 90.00000);
	CreateDynamicObject(1518, 226.95450, 65.38530, 1006.16022,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19786, 227.02209, 66.96650, 1005.87988,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1518, 226.95450, 65.38530, 1005.58020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1518, 226.95450, 68.56530, 1006.16022,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1518, 226.95450, 68.56530, 1005.58020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19165, 237.14980, 66.96310, 1006.24060,   90.00000, 90.00000, 180.00000);
	CreateDynamicObject(14532, 227.92487, 69.19360, 1005.01849,   0.00000, 0.00000, -113.00000);
	CreateDynamicObject(2605, 229.94820, 65.19969, 1004.43921,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2605, 229.94820, 68.80690, 1004.43921,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2605, 232.14819, 65.19970, 1004.43921,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2605, 232.14819, 68.80690, 1004.43921,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2605, 234.22820, 68.80690, 1004.43921,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2605, 234.22820, 65.19970, 1004.43921,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2356, 231.31296, 64.66663, 1004.04059,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(2356, 233.37239, 64.70709, 1004.04059,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(2356, 235.50862, 64.75301, 1004.04059,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(2356, 231.20183, 69.38299, 1004.04059,   0.00000, 0.00000, -229.00000);
	CreateDynamicObject(2356, 233.52278, 69.50469, 1004.04059,   0.00000, 0.00000, -229.00000);
	CreateDynamicObject(2356, 235.30788, 69.47223, 1004.04059,   0.00000, 0.00000, -229.00000);
	CreateDynamicObject(1775, 222.91760, 76.70300, 1005.13391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2641, 221.85980, 78.21490, 1005.88922,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(19916, 217.13490, 74.35580, 1004.03192,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2339, 218.04761, 74.36090, 1004.11737,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1679, 215.64030, 80.89886, 1004.52051,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1679, 215.68436, 77.01719, 1004.52051,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1679, 220.16624, 77.05414, 1004.52051,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2149, 218.05029, 74.30890, 1005.31897,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2415, 218.88730, 74.52490, 1004.04010,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1998, 257.09714, 88.21230, 1001.43945,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2356, 258.58810, 87.96306, 1001.44049,   0.00000, 0.00000, -287.00000);
	CreateDynamicObject(2063, 258.56201, 84.98910, 1002.35931,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(11749, 257.48459, 89.09960, 1002.25140,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(11750, 257.66711, 89.30910, 1002.26141,   0.00000, 0.00000, -40.00000);
	CreateDynamicObject(2610, 236.77490, 65.10200, 1004.87061,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2610, 236.77490, 65.59400, 1004.87061,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2173, 252.01414, 83.81405, 1001.43958,   0.00000, 0.00000, 324.00000);
	CreateDynamicObject(1721, 253.59959, 84.04593, 1001.44092,   0.00000, 0.00000, 76.00000);
	CreateDynamicObject(1671, 251.80542, 82.60175, 1001.89093,   0.00000, 0.00000, -215.00000);
	CreateDynamicObject(2196, 252.48236, 83.07852, 1002.23969,   0.00000, 0.00000, 164.00000);
	CreateDynamicObject(19807, 251.92192, 83.90334, 1002.32013,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11749, 252.60130, 83.33320, 1002.24011,   0.00000, 0.00000, -142.00000);
	CreateDynamicObject(11749, 253.67320, 84.32720, 1001.89038,   -84.00000, 98.00000, 0.00000);
	CreateDynamicObject(19380, 232.40581, 65.14140, 1003.94702,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1535, 247.91830, 82.29800, 1002.63788,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(11746, 253.54500, 73.14540, 1004.39551,   0.00000, 0.00000, 126.00000);
	CreateDynamicObject(11746, 257.57999, 88.94090, 1002.25153,   90.00000, 0.00000, -25.00000);
	CreateDynamicObject(18885, 255.99519, 82.25970, 1002.54150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2587, 254.69031, 80.77440, 1004.74121,   0.00000, 0.00000, 0.00000);

	//Dillimore komi exterior
	gateob = CreateDynamicObject(19463, 612.17810, -591.78021, 17.10700,   12.00000, 90.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19463, 612.16589, -588.53137, 17.10700,   12.00000, 90.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19447, 611.90503, -586.86639, 15.29880,   12.00000, 180.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	CreateDynamicObject(970, 609.62079, -586.80353, 18.28270,   0.00000, 12.00000, 0.00000);
	CreateDynamicObject(970, 613.66931, -586.80353, 17.42270,   0.00000, 12.00000, 0.00000);
	gateob = CreateDynamicObject(19367, 607.30859, -574.62152, 18.05780,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 607.30859, -577.82373, 18.05780,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 607.30859, -568.96167, 18.05780,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 607.30859, -565.75519, 18.05780,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19440, 607.30859, -563.35553, 18.05780,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19440, 607.30859, -580.22449, 18.05780,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 600.48499, -602.26001, 14.19880,   0.00000, 0.00000, 180.06200);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 600.46198, -581.18201, 14.19880,   0.00000, 0.00000, 180.06200);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 600.43213, -560.10498, 14.1888,   0.00000, 0.00000, 180.06200);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 605.12891, -555.37988, 14.20880,   0.00000, 0.00000, 270.06201);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 592.77655, -560.12152, 14.19880,   0.00000, 0.00000, 180.06200);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 592.83588, -581.13184, 14.17880,   0.00000, 0.00000, 180.06200);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(3628, 592.85754, -602.20984, 14.17880,   0.00000, 0.00000, 180.06200);
	SetDynamicObjectMaterial(gateob, 5, 12855, "cunte_cop", "sw_PDground", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 602.42432, -611.52002, 18.00000,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 598.28198, -611.52899, 18.00000,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 598.22192, -548.45178, 18.00000,   0.00000, 0.00000, 90.06000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 607.84332, -548.43378, 14.54790,   0.00000, 0.00000, 90.06000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 607.56262, -581.98187, 18.00000,   0.00000, 0.00000, 0.04000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 590.62799, -611.52808, 18.00000,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 590.53662, -548.45691, 18.00000,   0.00000, 0.00000, 90.06000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.81897, -553.20837, 18.00000,   0.00000, 0.00000, 0.10000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.82617, -562.83801, 18.00000,   0.00000, 0.00000, 0.06000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.83698, -572.45270, 18.00000,   0.00000, 0.00000, 0.10000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.85718, -582.06769, 18.00000,   0.00000, 0.00000, 0.10000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.87311, -591.67688, 18.00000,   0.00000, 0.00000, 0.10000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.88800, -601.29272, 18.00000,   0.00000, 0.00000, 0.04000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 585.89392, -606.71289, 18.00000,   0.00000, 0.00000, 0.04000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 607.84332, -548.43323, 18.00000,   0.00000, 0.00000, 90.06000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 598.23718, -548.46338, 14.54790,   0.00000, 0.00000, 90.06000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19456, 602.42432, -611.52002, 14.56950,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "sw_brick05", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 643.96698, -611.91217, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 643.79279, -611.91333, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 643.96887, -610.20343, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 643.79633, -610.20142, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 642.66943, -607.77686, 15.07350,   0.00000, 0.00000, 56.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 642.57001, -607.92499, 15.07350,   0.00000, 0.00000, 56.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 639.99628, -606.00525, 15.07350,   0.00000, 0.00000, 56.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 638.84619, -605.24597, 15.07350,   0.00000, 0.00000, 56.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 636.66681, -603.05389, 15.07350,   0.00000, 0.00000, 33.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 636.51947, -603.15009, 15.07350,   0.00000, 0.00000, 33.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 634.90216, -600.38477, 15.07350,   0.00000, 0.00000, 33.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 634.09167, -599.16101, 15.07350,   0.00000, 0.00000, 33.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 639.94086, -606.18665, 15.07350,   0.00000, 0.00000, 56.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 638.70325, -605.36273, 15.07350,   0.00000, 0.00000, 56.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 634.75385, -600.48694, 15.07350,   0.00000, 0.00000, 33.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 633.94391, -599.26373, 15.07350,   0.00000, 0.00000, 33.50000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.63129, -588.49719, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.63342, -585.74628, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.45172, -588.49597, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.45581, -585.74512, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.63342, -585.74628, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.45172, -588.49597, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.45581, -585.74512, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.63000, -582.54132, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.62915, -579.34088, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.62903, -576.13879, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 630.11047, -573.56281, 15.07350,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 630.11029, -573.70251, 15.07350,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.62842, -575.07843, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.45892, -582.53632, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.46002, -579.33112, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.46002, -576.12720, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 631.46008, -575.12482, 15.07350,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 609.54559, -548.34918, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 608.75488, -548.34900, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19367, 604.04871, -548.34900, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19459, 597.63470, -548.34900, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19459, 588.00262, -548.34900, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19459, 585.76630, -591.05731, 15.45900,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19459, 585.76471, -600.67206, 15.45900,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19459, 602.34741, -611.64539, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19459, 592.72327, -611.64301, 15.45900,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12855, "cunte_cop", "ws_bigstones", 0xFFFFFFFF);
	gateob = CreateDynamicObject(8615, 606.26398, -605.67987, 19.99030,   0.00000, 0.00000, 270.00000);
	SetDynamicObjectMaterial(gateob, 1, 8615, "vgssstairs1", "gridchev_64HV", 0xFFFFFFFF);
	CreateDynamicObject(966, 633.09253, -597.23779, 15.33030,   0.00000, 0.00000, -78.50000);
	CreateDynamicObject(19967, 631.92249, -589.86713, 15.32800,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 607.28027, -572.49280, 18.18610,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 620.53430, -568.63568, 25.12130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 618.52032, -571.78693, 24.67420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 618.46527, -578.67963, 24.67420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 610.84039, -571.80542, 24.67420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 610.79688, -578.67499, 24.67420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19876, 666.71948, -565.11841, 17.33400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 626.59003, -573.30670, 16.90920,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 626.59003, -570.32129, 16.90920,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1535, 605.63623, -548.41302, 15.55880,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3626, 608.76538, -554.46753, 19.67320,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1238, 636.32654, -573.37927, 15.66260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 636.34125, -570.29871, 15.66260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 636.35712, -567.49078, 15.66260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 636.33752, -575.97644, 15.66260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 601.88910, -611.52161, 20.41960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 595.48553, -611.52136, 20.41960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 589.08350, -611.52887, 20.41960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 608.28882, -611.51642, 20.41960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 585.86932, -598.70007, 20.41960,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(982, 585.80841, -573.08795, 20.41960,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(983, 585.80499, -551.65051, 20.41960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 585.79010, -558.03339, 20.40960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 598.60260, -548.47931, 20.41960,   0.00000, 0.00000, 90.10000);
	CreateDynamicObject(970, 631.71436, -563.48926, 15.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 631.70538, -559.34967, 15.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 631.69714, -555.20990, 15.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 631.70770, -551.09027, 15.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 631.69812, -546.97009, 15.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2921, 611.26764, -547.93256, 18.99260,   0.00000, 0.00000, 11.00000);
	CreateDynamicObject(11245, 630.95117, -571.85486, 20.66030,   0.00000, 0.00000, -1.50000);
	CreateDynamicObject(2047, 628.23523, -574.53430, 18.89830,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2048, 628.23523, -568.90308, 18.89830,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 631.71442, -567.61011, 15.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 618.34302, -595.59778, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 618.33728, -599.71472, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 618.34399, -611.91418, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 618.34052, -607.79279, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 616.25140, -593.52869, 22.16150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 612.13776, -593.53320, 22.16150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 609.24658, -593.53992, 22.16150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 607.17456, -595.60962, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 607.17767, -599.74219, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 607.17615, -603.86298, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 616.26672, -613.98383, 22.16150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 612.15668, -613.98438, 22.16150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 609.26099, -613.97522, 22.16150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 607.19342, -611.91040, 22.16150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 607.17358, -605.56299, 22.16150,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3934, 612.96191, -597.85541, 21.71690,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3934, 612.90540, -609.52570, 21.71690,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3934, 614.74408, -575.14911, 25.12820,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19978, 633.67151, -598.40015, 13.57930,   0.00000, 0.00000, 123.50000);

	//Dillimore ori obiekty + warsztat nowy

	CreateDynamicObject(3172, 760.97302, -621.90448, 14.35400,   0.00000, 0.00000, 273.00000);
	CreateDynamicObject(3168, 744.24841, -620.34210, 14.12540,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(3171, 728.41718, -615.94421, 14.74680,   -2.00000, 0.00000, -113.00000);
	CreateDynamicObject(3172, 743.78119, -610.13599, 14.36200,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(3171, 761.03967, -611.06677, 14.35150,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(12843, 661.80762, -615.11731, 15.32690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(12844, 664.78497, -615.12372, 17.31310,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(12845, 664.67883, -615.42078, 17.42320,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1514, 662.87622, -616.42407, 16.47620,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1496, 659.08917, -610.44202, 14.99190,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(1496, 660.59027, -610.44092, 14.99190,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2911, 670.89130, -619.95532, 15.33490,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(1688, 662.48383, -617.28607, 20.64340,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1691, 667.73389, -614.26062, 20.04420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 646.35358, -624.00549, 15.89151,   0.00000, 358.75000, 261.24390);
	CreateDynamicObject(970, 645.39966, -628.01910, 15.99151,   0.00000, 357.99756, 252.48840);
	dodajBudke(1346, 669.06531, -578.51605, 16.68690,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1366, 669.10449, -451.33594, 15.87443,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1367, 632.08533, -568.30798, 15.93089,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 654.76001, -560.56744, 16.01949,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 656.51099, -560.57556, 16.01949,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 654.75427, -569.44574, 16.01949,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 656.50439, -569.46112, 16.01949,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 669.48309, -590.13104, 15.83742,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 665.35132, -590.13751, 15.83742,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 651.71454, -542.21039, 15.83742,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 653.79504, -540.13232, 15.83742,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2656, 662.83984, -577.65137, 17.14565,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18066, 655.93896, -571.22992, 17.85139,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18066, 655.96631, -569.62903, 17.85139,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18066, 655.35455, -569.58771, 17.85139,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(18066, 655.36548, -571.16895, 17.85139,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2656, 655.64880, -571.84943, 16.62066,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2456, 661.48743, -551.87683, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2714, 655.70508, -576.34668, 20.25476,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3467, 655.41589, -539.90564, 16.03875,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3467, 663.71973, -590.41113, 16.02536,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2657, 655.67279, -558.30487, 16.63619,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(848, 653.19342, -639.49213, 17.06846,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1359, 685.96466, -475.80988, 15.95950,   0.00000, 0.00000, 0.00000);
	dodajBudke(1363, 671.38098, -474.01807, 16.29730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6299, 702.11133, -445.31055, 17.30633,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1776, 689.16309, -470.21024, 16.58569,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3057, 710.62372, -469.70047, 16.48033,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3948, 774.40698, -425.51099, 25.47232,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18269, 685.00378, -418.68073, 41.18134,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 712.02179, -475.10861, 15.66188,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1342, 691.65808, -474.43195, 16.54463,   0.00000, 0.00000, 90.00000);
	dodajBudke(1346, 651.05078, -436.92383, 16.68694,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2837, 656.01355, -440.28470, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2860, 655.19885, -440.31714, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(924, 652.71332, -467.39441, 16.01703,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1359, 677.08582, -475.62445, 15.95950,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3302, 663.04688, -441.69531, 15.81969,   27.48230, 1.97205, 0.33508);
	CreateDynamicObject(3035, 663.16406, -439.50781, 16.10607,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3006, 718.18365, -438.88284, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2971, 665.47852, -439.53693, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2907, 662.02502, -438.86050, 15.49597,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3006, 662.70831, -440.22168, 15.03594,   0.00000, 0.00000, 92.00000);
	CreateDynamicObject(2890, 674.10742, -447.14529, 15.31094,   0.00000, 0.00000, 272.00000);
	CreateDynamicObject(2900, 725.94922, -438.59122, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2953, 715.25513, -472.54434, 15.34743,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2840, 725.28094, -464.37375, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 651.73846, -440.00952, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 651.73438, -444.13477, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 651.73212, -448.28644, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 651.72906, -452.43793, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 651.72559, -456.56412, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 651.74915, -460.73929, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 651.72247, -464.91672, 15.86242,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1238, 726.41016, -475.28906, 15.65412,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 714.64160, -475.15430, 15.66188,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 724.08868, -475.20511, 15.65412,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1280, 657.14496, -472.29327, 15.73729,   0.00000, 0.00000, 260.00000);
	CreateDynamicObject(1280, 654.28546, -469.43292, 15.76229,   0.00000, 0.00000, 177.99695);
	CreateDynamicObject(1280, 714.86829, -452.74292, 15.73729,   0.00000, 0.00000, 355.49463);
	CreateDynamicObject(1280, 672.50995, -457.45828, 15.93765,   0.00000, 0.00000, 79.49463);
	CreateDynamicObject(1280, 656.50580, -475.51657, 15.73729,   0.00000, 0.00000, 91.49158);
	CreateDynamicObject(1280, 689.45819, -475.60629, 15.73729,   0.00000, 0.00000, 91.48865);
	CreateDynamicObject(1280, 725.98340, -470.86133, 15.73729,   0.00000, 0.00000, 3.48816);
	CreateDynamicObject(3497, 645.13605, -520.58362, 19.40104,   0.00000, 0.00000, 182.00000);
	CreateDynamicObject(3861, 723.91895, -444.12207, 16.50827,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(3861, 715.75378, -439.44589, 16.50827,   0.00000, 0.00000, 1.99451);
	CreateDynamicObject(3006, 660.65137, -439.17578, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3006, 713.52954, -441.03360, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3006, 721.15143, -444.78250, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 711.61682, -452.31143, 15.65412,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1375, 688.37128, -614.05072, 17.02595,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1887, 801.78387, -716.01434, 78.52293,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(918, 805.21216, -612.54596, 15.70747,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 692.79785, -589.57520, 21.07964,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1280, 810.97461, -605.54669, 15.73729,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1280, 806.78027, -605.29962, 15.74460,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1526, 811.52393, -614.12878, 16.61320,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1258, 802.44867, -605.80585, 16.00496,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2900, 835.38403, -605.78662, 15.33594,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1449, 802.33826, -613.86743, 15.85759,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(1372, 835.40137, -614.72119, 15.34324,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1358, 834.62036, -608.66107, 16.53948,   0.00000, 0.00000, 274.00000);
	CreateDynamicObject(1338, 833.12256, -605.22626, 16.04725,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1224, 835.50201, -611.67365, 15.95085,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1265, 833.91730, -607.99725, 17.40753,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1300, 808.84351, -605.82690, 15.70585,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2670, 811.87726, -605.22455, 15.49514,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1428, 824.49335, -613.27930, 16.90379,   0.00000, 0.00000, 184.00000);
	CreateDynamicObject(1345, 785.99219, -612.45117, 16.10607,   0.00000, 0.00000, 181.99951);
	CreateDynamicObject(1224, 780.34564, -596.68341, 15.95085,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1355, 781.20044, -593.23065, 15.53290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1300, 784.97168, -543.55469, 15.70585,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1236, 794.00378, -612.70233, 16.00597,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1441, 867.44342, -587.26331, 17.68738,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3273, 863.68652, -579.75586, 17.07030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3273, 859.60938, -579.71777, 17.07030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3273, 855.38965, -579.61133, 17.07030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 867.21252, -585.10059, 21.83553,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3643, 839.99243, -610.59137, 22.99385,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3675, 864.54510, -584.27063, 18.73555,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3675, 864.54590, -585.22461, 18.73555,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(920, 850.23535, -581.01563, 17.69602,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(929, 848.85449, -580.00586, 18.20067,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1353, 848.86133, -582.79785, 17.83169,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1420, 848.70148, -583.96411, 17.12841,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1687, 850.05566, -585.09961, 17.90790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1688, 863.42871, -582.78418, 18.18431,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3259, 872.81683, -613.30902, 17.42188,   0.00000, 0.00000, 88.00000);
	CreateDynamicObject(12957, 814.79028, -564.84790, 16.21416,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1230, 814.71362, -564.34473, 16.55625,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2671, 816.85077, -564.85352, 15.61017,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1526, 690.93982, -456.46127, 16.39889,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1255, 739.04614, -487.50693, 16.59260,   0.00000, 0.00000, 329.99817);
	CreateDynamicObject(1255, 739.87891, -485.90802, 16.59260,   0.00000, 0.00000, 329.99634);
	CreateDynamicObject(1255, 777.20813, -517.20032, 16.11760,   0.00000, 0.00000, 239.99631);
	CreateDynamicObject(1446, 809.50623, -520.03369, 16.07030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1446, 814.18549, -520.03802, 16.07030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1446, 824.33722, -517.79419, 16.20070,   0.00000, -3.00000, 91.00000);
	CreateDynamicObject(1446, 824.25720, -513.09412, 16.45070,   0.00000, -3.00000, 91.00000);
	CreateDynamicObject(1446, 824.17719, -508.39941, 16.69070,   0.00000, -3.00000, 91.00000);
	CreateDynamicObject(1446, 824.10718, -503.70959, 16.93070,   0.00000, -3.00000, 91.00000);
	CreateDynamicObject(1446, 769.03418, -589.67169, 18.13050,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1446, 731.81647, -599.57678, 16.08000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1446, 731.82208, -594.89307, 16.08000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1446, 778.72827, -520.00555, 16.08000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1446, 774.03931, -520.00562, 16.08000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1255, 804.07422, -516.90723, 16.16760,   -4.00000, 4.00000, 240.00000);
	CreateDynamicObject(1481, 796.12952, -494.11169, 17.71970,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1481, 742.24298, -497.51810, 17.71080,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1255, 803.16779, -515.07660, 16.31760,   -4.00000, 4.00000, 240.00000);
	CreateDynamicObject(1446, 734.61377, -540.27295, 16.07030,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1446, 739.29407, -540.27643, 16.07030,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19815, 785.46832, -485.09299, 17.99890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1499, 638.74847, -495.23230, 15.33310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8948, 644.81567, -495.22672, 18.88160,   0.00000, 98.00000, 270.00000);
	CreateDynamicObject(10281, 644.91089, -494.34619, 21.03220,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(19817, 648.53619, -505.28769, 14.78190,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19325, 636.82452, -519.56207, 17.31970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19815, 636.70959, -501.40210, 17.20000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19903, 646.13660, -510.67258, 15.33270,   0.00000, 0.00000, 116.00000);
	CreateDynamicObject(19899, 637.17633, -497.62378, 15.33231,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19899, 643.61414, -511.35022, 15.33320,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19897, 642.63000, -511.03711, 16.59550,   0.00000, 0.00000, 200.00000);
	CreateDynamicObject(2525, 632.22418, -506.87189, 15.33430,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2739, 633.23822, -505.24295, 15.33433,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, 635.67957, -507.91220, 15.33310,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1502, 637.10931, -510.14200, 15.33340,   0.00000, 0.00000, -48.00000);
	CreateDynamicObject(2685, 633.98163, -504.80710, 16.78870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2520, 635.84906, -506.25858, 15.33467,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1083, 636.84967, -499.62219, 15.80510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19308, 644.40601, -511.32321, 17.07670,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(18635, 643.20667, -511.32480, 16.58430,   90.00000, 105.00000, 0.00000);
	CreateDynamicObject(1663, 636.91730, -516.64032, 15.79340,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(1714, 639.85229, -517.14453, 15.33400,   0.00000, 0.00000, -105.00000);
	CreateDynamicObject(1728, 632.36774, -514.83594, 15.33350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1729, 633.91461, -515.77588, 15.33360,   0.00000, 0.00000, 149.00000);
	CreateDynamicObject(1516, 635.34448, -513.82495, 15.50340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1791, 635.63171, -513.82520, 16.02790,   0.00000, 0.00000, -76.00000);
	CreateDynamicObject(2008, 638.29712, -517.51166, 15.33160,   0.00000, 0.00000, 69.00000);
	CreateDynamicObject(1893, 644.11584, -503.02936, 19.91422,   0.00000, 0.00000, 0.00000);
	gateob = CreateDynamicObject(19380, 646.46930, -499.96680, 20.00740,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "desgrns256", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19380, 646.46930, -509.58051, 20.00740,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "desgrns256", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19380, 636.49780, -514.84998, 20.00750,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "desgrns256", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19380, 636.49780, -499.96680, 20.00740,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "desgrns256", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19380, 636.49780, -508.33289, 20.00750,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "desgrns256", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19805, 637.62738, -510.72839, 18.50300,   0.00000, -180.00000, -229.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19805, 634.90314, -507.91986, 18.50300,   0.00000, -180.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19805, 639.79822, -495.24771, 18.49300,   0.00000, -180.00000, 180.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 650.11218, -495.22220, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 641.80402, -518.05389, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 641.80402, -515.00128, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 641.80402, -512.60211, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 641.80402, -518.05389, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 641.80402, -515.00128, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 641.80402, -512.60211, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 635.10950, -504.69031, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 631.30487, -519.57269, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19409, 634.44061, -519.57257, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19392, 639.52972, -495.22220, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 636.92188, -519.57269, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19409, 639.24408, -519.57257, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 641.64398, -519.57257, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 632.03998, -519.57257, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 636.84058, -519.57257, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.32458, -514.66687, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.32458, -505.03241, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.63483, -514.67078, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.63483, -505.03900, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.64911, -514.65680, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.63483, -505.03900, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 646.52850, -511.86890, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 646.52850, -511.86890, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 652.14807, -511.86890, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 652.14807, -511.86890, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 637.12280, -495.22220, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 631.89728, -504.68509, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 636.64038, -499.95941, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 636.64038, -499.95941, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 632.86951, -504.69019, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 651.63770, -499.95099, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 651.63770, -509.58151, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 651.63770, -509.58151, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 651.63770, -499.95099, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 650.11218, -495.22220, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 637.12280, -495.22220, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19392, 639.52972, -495.22220, 14.67240,   180.00000, 0.00000, 270.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 636.64038, -506.37460, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19392, 637.66309, -510.70477, 14.67240,   180.00000, 0.00000, 221.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 640.26074, -511.87955, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 636.64038, -508.77740, 14.67240,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19392, 637.66309, -510.70480, 18.17420,   0.00000, 0.00000, 41.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 640.26068, -511.87949, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 636.64038, -506.37460, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19436, 636.64038, -508.77740, 18.17420,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19392, 634.92755, -507.95728, 14.67240,   180.00000, 0.00000, 270.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19392, 634.92761, -507.95731, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 631.71777, -507.95731, 14.67240,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19363, 631.71777, -507.95731, 18.17420,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);
	gateob = CreateDynamicObject(19455, 644.86450, -495.23181, 20.67270,   180.00000, 0.00000, 270.00000);
	SetDynamicObjectMaterial(gateob, 0, 12862, "sw_block03", "sw_wall03", 0xFFFFFFFF);

	//bramka LS-LV
	CreateDynamicObject(9623, 1700.67847, 415.62292, 32.45000,   -0.70000, 0.00000, 160.88310);
	CreateDynamicObject(19124, 1704.91785, 402.90421, 30.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1703.72119, 409.86484, 29.65380,   -1.00000, 0.00000, 160.00000);
	CreateDynamicObject(19425, 1698.30432, 421.14938, 29.79210,   0.00000, 0.00000, 160.00000);
	CreateDynamicObject(19425, 1712.31775, 406.83768, 29.65380,   -1.00000, 0.00000, 160.00000);
	CreateDynamicObject(19425, 1688.75378, 424.60980, 29.81210,   0.00000, -1.00000, 160.00000);
	CreateDynamicObject(963, 1709.99280, 413.14929, 31.63300,   90.00000, 71.26000, 0.00000);
	CreateDynamicObject(963, 1701.86975, 415.94562, 31.63300,   89.58000, 71.26000, 0.00000);
	CreateDynamicObject(963, 1700.44861, 414.94760, 31.61300,   90.00000, -109.20000, 0.00000);
	CreateDynamicObject(963, 1691.52979, 418.04034, 31.61300,   90.00000, -109.20000, 0.00000);
	CreateDynamicObject(7415, 1792.48169, 722.42346, 22.75190,   0.00000, 0.00000, 110.00000);
	CreateDynamicObject(3578, 1700.33887, 413.11960, 29.63810,   0.00000, 0.00000, 71.00000);
	CreateDynamicObject(966, 1682.57898, 416.67038, 29.59280,   0.00000, 0.00000, 5200.00000);
	CreateDynamicObject(966, 1698.59839, 410.91818, 29.59280,   0.00000, 0.00000, 340.00000);
	CreateDynamicObject(966, 1703.75867, 420.08932, 29.59280,   0.00000, 0.00000, 520.00000);
	CreateDynamicObject(966, 1718.24146, 414.86954, 29.59280,   0.00000, 0.00000, 340.00000);
	CreateDynamicObject(19966, 1707.67712, 408.05740, 29.90130,   0.00000, 0.00000, 340.00000);
	CreateDynamicObject(19966, 1693.80286, 423.23169, 29.90130,   0.00000, 0.00000, 160.00000);
	CreateDynamicObject(984, 1718.47156, 414.78619, 30.61740,   1.08000, 0.00000, -19.00000);
	CreateDynamicObject(984, 1714.27209, 402.68610, 30.35740,   1.08000, 0.00000, -19.00000);
	CreateDynamicObject(984, 1711.10071, 390.33719, 30.01740,   2.00000, 0.00000, -10.00000);
	CreateDynamicObject(984, 1723.84949, 426.35001, 30.69740,   -0.34000, -0.30000, -31.00000);
	CreateDynamicObject(984, 1682.32361, 416.75189, 30.39930,   0.84000, 0.00000, -19.84000);
	CreateDynamicObject(983, 1678.89343, 407.78680, 30.25280,   1.62000, 0.00000, -23.06000);
	CreateDynamicObject(984, 1686.66528, 428.79489, 30.57930,   0.84000, 0.00000, -19.84000);
	CreateDynamicObject(984, 1689.89600, 441.09741, 30.71930,   0.34000, 0.00000, -9.78000);
	CreateDynamicObject(19124, 1706.74585, 402.32761, 30.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 1705.39038, 401.21518, 29.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 1696.57642, 427.89606, 30.39000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 1694.59277, 428.56610, 30.39000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 1696.08496, 429.66446, 30.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2921, 1711.05334, 414.81812, 33.35170,   0.00000, 0.00000, -236.00000);
	CreateDynamicObject(2921, 1702.93457, 417.67300, 33.35170,   0.00000, 0.00000, -236.00000);
	CreateDynamicObject(2921, 1699.28894, 413.16400, 33.35170,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(2921, 1690.35742, 416.26501, 33.35170,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(1290, 1702.73132, 420.37283, 30.99820,   0.00000, 0.00000, -19.00000);
	CreateDynamicObject(1290, 1699.46692, 410.66641, 30.99820,   0.00000, 0.00000, -19.00000);

	//bramka na mostku
	CreateDynamicObject(966, 526.86566, 475.89520, 17.92650,   0.00000, 0.00000, 35.00000);
	CreateDynamicObject(966, 515.28510, 467.78699, 17.92650,   0.00000, 0.00000, -145.00000);
	CreateDynamicObject(16003, 522.11023, 470.30200, 19.38860,   0.00000, 0.00000, 124.50000);
	CreateDynamicObject(16003, 519.97809, 473.41461, 19.38860,   0.00000, 0.00000, -54.50000);
	CreateDynamicObject(19124, 522.60223, 468.16452, 18.50750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 523.91473, 469.07925, 18.50750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 523.98309, 467.63699, 18.50750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 518.05383, 474.66306, 18.50750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 519.33832, 475.58423, 18.50750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 518.13879, 475.97781, 18.50750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19966, 518.78986, 475.08939, 17.92710,   0.00000, 0.00000, -144.00000);
	CreateDynamicObject(19966, 523.32788, 468.61636, 17.92710,   0.00000, 0.00000, 36.00000);
	CreateDynamicObject(963, 523.47748, 469.87521, 18.96950,   91.00000, 0.00000, -236.00000);
	CreateDynamicObject(963, 518.60059, 473.81635, 18.96950,   91.00000, 0.00000, -55.00000);
	CreateDynamicObject(2921, 525.49121, 480.11371, 20.70210,   0.00000, 0.00000, 127.00000);
	CreateDynamicObject(2921, 516.54395, 463.74863, 20.70210,   0.00000, 0.00000, -55.00000);

	//bramka na mostku 2

	CreateDynamicObject(966, -161.65366, 363.51865, 11.07200,   0.00000, 0.00000, -14.10000);
	CreateDynamicObject(966, -175.38094, 367.07813, 11.07200,   0.00000, 0.00000, 165.10001);
	CreateDynamicObject(16003, -169.04900, 363.39331, 12.50970,   0.00000, 0.00000, 75.50000);
	CreateDynamicObject(16003, -168.03951, 367.09109, 12.50970,   0.00000, 0.00000, -104.50000);
	CreateDynamicObject(19966, -169.52684, 361.44318, 11.07530,   0.00000, 0.00000, -14.00000);
	CreateDynamicObject(19966, -167.54770, 369.04947, 11.07530,   0.00000, 0.00000, -193.00000);
	CreateDynamicObject(19124, -166.74754, 368.79623, 11.57450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -168.38210, 369.24054, 11.57450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -167.30669, 369.97318, 11.57450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -170.36810, 361.64166, 11.57450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -168.75243, 361.24225, 11.57450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -169.88586, 360.26483, 11.57450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(963, -168.43980, 362.07431, 12.13580,   91.00000, 76.00000, 0.00000);
	CreateDynamicObject(963, -168.63217, 368.41190, 12.13580,   91.00000, 76.00000, -180.00000);
	CreateDynamicObject(2921, -160.33311, 363.04166, 16.18030,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(2921, -176.36461, 367.78964, 16.18030,   0.00000, 0.00000, -113.00000);

	//bramka na mostku 3

	CreateDynamicObject(966, -960.20862, -342.53021, 35.27810,   0.00000, 0.00000, -11.00000);
	CreateDynamicObject(966, -973.93781, -339.85959, 35.27810,   0.00000, 0.00000, -191.00000);
	CreateDynamicObject(967, -973.59680, -338.73865, 35.77270,   0.00000, 0.00000, -280.00000);
	CreateDynamicObject(967, -960.49591, -343.72879, 35.39270,   0.00000, 0.00000, -101.00000);
	CreateDynamicObject(963, -967.79590, -344.15698, 36.33110,   91.00000, 0.00000, 79.00000);
	CreateDynamicObject(963, -966.42505, -338.49707, 36.33110,   91.00000, 0.00000, -101.00000);
	CreateDynamicObject(19124, -966.31183, -337.18256, 35.84060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -967.95770, -345.63037, 35.84060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19870, -979.04089, -338.97461, 35.11800,   0.00000, 0.00000, -11.00000);
	CreateDynamicObject(19870, -975.82458, -339.60440, 35.11800,   0.00000, 0.00000, -191.00000);
	CreateDynamicObject(19870, -959.87341, -342.57401, 34.95800,   0.00000, 0.00000, -11.00000);
	CreateDynamicObject(1223, -967.43262, -342.97061, 35.28120,   0.00000, 0.00000, -11.00000);
	CreateDynamicObject(1223, -966.80621, -339.73047, 35.28120,   0.00000, 0.00000, -193.00000);
	CreateDynamicObject(1294, -968.99402, -339.53409, 394921.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2921, -979.37262, -341.93469, 39.13860,   0.00000, 0.00000, -142.00000);
	CreateDynamicObject(2921, -956.18170, -339.76587, 39.54350,   0.00000, 0.00000, 40.00000);

	//tunel

	CreateDynamicObject(966, -1225.40222, -783.32697, 62.90020,   0.00000, 0.00000, 222.00000);
	CreateDynamicObject(966, -1215.18701, -773.66797, 62.90020,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(963, -1221.87708, -776.40302, 63.96360,   91.00000, -3.00000, -47.00000);
	CreateDynamicObject(963, -1218.24756, -780.76978, 63.96360,   91.00000, -3.00000, 137.00000);
	CreateDynamicObject(19124, -1222.70862, -775.66168, 63.44290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -1217.37451, -781.50177, 63.54290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1290, -1219.86743, -778.91980, 64.34730,   0.00000, 0.00000, 42.00000);
	CreateDynamicObject(19966, -1216.95007, -781.96417, 63.02060,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(19966, -1223.05139, -775.24927, 62.88660,   0.00000, 0.00000, 251.00000);
	CreateDynamicObject(2921, -1224.84888, -783.42230, 66.74380,   0.00000, 0.00000, -47.00000);
	CreateDynamicObject(2921, -1219.83459, -778.90045, 66.74380,   0.00000, 0.00000, 193.00000);

	//tunel 2

	CreateDynamicObject(18452, -11.44068, -1335.23279, 12.96710,   0.00000, 0.00000, 39.00000);
	CreateDynamicObject(18452, -15.00210, -1330.85693, 12.96720,   0.00000, 0.00000, 39.00000);
	CreateDynamicObject(19425, -8.96410, -1333.19055, 10.07680,   0.00000, 0.00000, 128.50000);
	CreateDynamicObject(19425, -12.50500, -1328.74500, 10.07680,   0.00000, 0.00000, 128.50000);
	CreateDynamicObject(966, -11.57243, -1340.70703, 9.98560,   0.00000, 0.00000, -51.00000);
	CreateDynamicObject(966, -20.29900, -1329.81616, 9.98560,   0.00000, 0.00000, 128.39999);
	CreateDynamicObject(963, -13.22130, -1333.08704, 11.25640,   91.00000, 0.00000, -141.50000);
	CreateDynamicObject(963, -9.67255, -1337.54431, 11.25640,   91.00000, 0.00000, -141.50000);
	CreateDynamicObject(8674, -7.59040, -1336.24524, 10.21320,   0.00000, 0.00000, 39.50000);
	CreateDynamicObject(8674, -15.17082, -1326.89124, 10.21320,   0.00000, 0.00000, 39.30000);
	CreateDynamicObject(8674, 1.01842, -1330.69324, 10.21320,   0.00000, 0.00000, 26.00000);
	CreateDynamicObject(8674, -8.04594, -1319.50195, 10.21320,   0.00000, 0.00000, 53.00000);
	CreateDynamicObject(2921, -11.69689, -1339.00903, 13.50840,   0.00000, 0.00000, -76.00000);
	CreateDynamicObject(2921, -15.20977, -1334.60083, 13.50840,   0.00000, 0.00000, -76.00000);
	CreateDynamicObject(19124, -10.77120, -1331.04895, 10.72360,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -7.19430, -1335.42456, 10.72360,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, -14.37601, -1326.66675, 10.72360,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19966, -10.93470, -1331.18799, 10.10250,   0.00000, 0.00000, 129.00000);
	CreateDynamicObject(1294, -10.42800, -1336.55688, 10.59240,   0.00000, 0.00000, -50.00000);
	CreateDynamicObject(1294, -13.98330, -1332.10632, 10.59240,   0.00000, 0.00000, -50.00000);
	CreateDynamicObject(18452, 17.66410, -1341.25195, 11.94710,   0.00000, 1.30000, 39.00000);
	CreateDynamicObject(18452, 21.23414, -1345.62598, 11.94710,   0.00000, 1.30000, 39.00000);
	CreateDynamicObject(19425, 18.66861, -1347.69543, 9.10720,   0.00000, 0.00000, -51.00000);
	CreateDynamicObject(19425, 15.16863, -1343.32141, 9.10720,   0.00000, 0.00000, -51.00000);
	CreateDynamicObject(963, 15.88277, -1338.96082, 10.23640,   91.00000, 0.00000, 40.00000);
	CreateDynamicObject(963, 19.49687, -1343.33484, 10.23640,   91.00000, 0.00000, 40.00000);
	CreateDynamicObject(19966, 17.11130, -1345.33167, 9.27190,   0.00000, 0.00000, -51.00000);
	CreateDynamicObject(1294, 16.65530, -1339.92004, 9.53060,   0.00000, 0.00000, 129.00000);
	CreateDynamicObject(1294, 20.24140, -1344.34387, 9.53060,   0.00000, 0.00000, 129.00000);
	CreateDynamicObject(966, 18.13322, -1335.57751, 9.02570,   0.00000, 0.00000, 128.00000);
	CreateDynamicObject(966, 26.72598, -1346.60254, 9.02570,   0.00000, 0.00000, -52.00000);
	CreateDynamicObject(2921, 17.96230, -1337.44128, 12.74650,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2921, 21.52854, -1341.85144, 12.74650,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(13677, 92.21875, -1291.65625, 14.11719,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 13.79352, -1340.17395, 9.22080,   0.00000, 0.00000, 39.00000);
	CreateDynamicObject(8674, 5.12582, -1345.59473, 9.22080,   0.00000, 0.00000, 25.00000);
	CreateDynamicObject(8674, 21.39732, -1349.56360, 9.22080,   0.00000, 0.00000, 39.00000);
	CreateDynamicObject(8674, 14.22279, -1356.86035, 9.22080,   0.00000, 0.00000, 52.00000);
	CreateDynamicObject(19124, 16.88520, -1345.49231, 9.78990,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 13.34975, -1341.08533, 9.78990,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 20.39497, -1349.91016, 9.78990,   0.00000, 0.00000, 0.00000);
	return 1;
}

static StworzBramy()
{
	new brama;
	
	//intek SASP 
	brama = CreateDynamicObject(1569, 222.16035, 68.89352, 1004.04041,   0.00000, 0.00000, 90.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 222.16035, 68.89352, 1004.04041,   0.00000, 0.00000, 90.00000,222.16035, 67.7135, 1004.04041,   0.00000, 0.00000, 90.00000, 1, 2, BRAMA_UPR_TYPE_FRACTION, 3); 
	brama = CreateDynamicObject(19302, 266.35931, 85.70960, 1001.29022,   0.00000, 0.00000, 90.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 266.35931, 85.70960, 1001.29022,   0.00000, 0.00000, 90.00000,267.13681, 85.22551, 1001.29022,   0.00000, 0.00000, 25.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3); 
	brama = CreateDynamicObject(19302, 266.35931, 81.20890, 1001.29022,   0.00000, 0.00000, 90.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 266.35931, 81.20890, 1001.29022,   0.00000, 0.00000, 90.00000,267.13681, 80.72890, 1001.29022,   0.00000, 0.00000, 25.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(19302, 266.35931, 76.70890, 1001.29022,   0.00000, 0.00000, 90.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 266.35931, 76.70890, 1001.29022,   0.00000, 0.00000, 90.00000,267.13681, 76.22890, 1001.29022,   0.00000, 0.00000, 25.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(19302, 258.93069, 90.96210, 1002.68958,   0.00000, 0.00000, 270.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 258.93069, 90.96210, 1002.68958,   0.00000, 0.00000, 270.00000,258.93069, 92.3021, 1002.68958,   0.00000, 0.00000, 270.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(1569, 250.53391, 62.42270, 1002.64038,   0.00000, 0.00000, 90.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 250.53391, 62.42270, 1002.64038,   0.00000, 0.00000, 90.00000,250.53391, 61.2527, 1002.64038,   0.00000, 0.00000, 90.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(1569, 245.49270, 72.53520, 1002.64069,   0.00000, 0.00000, 0.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 245.49270, 72.53520, 1002.64069,   0.00000, 0.00000, 0.00000,244.3127, 72.53520, 1002.64069,   0.00000, 0.00000, 0.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3); 
	brama = CreateDynamicObject(1569, 248.12000, 76.75250, 1002.64069,   0.00000, 0.00000, 270.00000, 88, 6, -1, 300.00, 300.00);
	DodajBrame(brama, 248.12000, 76.75250, 1002.64069,   0.00000, 0.00000, 270.00000,248.12000, 77.9225, 1002.64069,   0.00000, 0.00000, 270.00000,1, 2, BRAMA_UPR_TYPE_FRACTION, 3);
	
	//brama komi
	brama = CreateDynamicObject(968, 633.10651, -597.23071, 16.15150,   0.00000, -90.00000, -78.50000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		633.10651, -597.23071, 16.15150,   0.00000, -90.00000, -78.50000,
		633.10651, -597.23071, 16.15150,   0.00000, -5.00000, -78.00000,
		1, 10, BRAMA_UPR_TYPE_FRACTION, 3);

	
	//bramka LS-LV
	brama = CreateDynamicObject(968, 1682.49878, 416.69019, 30.57900,   0.00000, 0.00000, -20.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		1682.49878, 416.69019, 30.57900,   0.00000, 0.00000, -20.00000,
		1682.49878, 416.69019, 30.57900,   0.00000, 90.00000, -20.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3); 
	brama = CreateDynamicObject(968, 1698.69885, 410.88089, 30.57900,   0.00000, 0.00000, 160.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		1698.69885, 410.88089, 30.57900,   0.00000, 0.00000, 160.00000,
		1698.69885, 410.88089, 30.57900,   0.00000, 90.00000, 160.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(968, 1718.32532, 414.82669, 30.61900,   0.00000, 0.00000, 160.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		1718.32532, 414.82669, 30.61900,   0.00000, 0.00000, 160.00000,
		1718.32532, 414.82669, 30.61900,   0.00000, 90.00000, 160.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3); 
	brama = CreateDynamicObject(968, 1703.68982, 420.09259, 30.61900,   0.00000, 0.00000, -20.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		1703.68982, 420.09259, 30.61900,   0.00000, 0.00000, -20.00000,
		1703.68982, 420.09259, 30.61900,   0.00000, 90.00000, -20.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);

	//bramka na mostku
	brama = CreateDynamicObject(968, 526.94672, 475.95499, 18.80680,   0.00000, 0.00000, 35.04000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		526.94672, 475.95499, 18.80680,   0.00000, 0.00000, 35.04000,
		526.94672, 475.95499, 18.80680,   0.00000, -90.00000, 35.04000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(968, 515.19238, 467.72159, 18.86680,   0.00000, 0.00000, 35.04000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		515.19238, 467.72159, 18.86680,   0.00000, 0.00000, 35.04000,
		515.19238, 467.72159, 18.86680,   0.00000, 90.00000, 35.04000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);

	//bramka na mostku 2
	brama = CreateDynamicObject(968, -161.60710, 363.50439, 11.99300,   0.00000, 0.00000, -14.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-161.60710, 363.50439, 11.99300,   0.00000, 0.00000, -14.00000,
		-161.60710, 363.50439, 11.99300,   0.00000, -90.00000, -14.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(968, -175.44040, 367.09341, 11.99300,   0.00000, 0.00000, 165.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-175.44040, 367.09341, 11.99300,   0.00000, 0.00000, 165.00000,
		-175.44040, 367.09341, 11.99300,   0.00000, -90.00000, 165.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);

	//bramka na mostku 3
	brama = CreateDynamicObject(968, -974.08752, -339.83640, 36.27580,   0.00000, 0.00000, -11.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-974.08752, -339.83640, 36.27580,   0.00000, 0.00000, -11.00000,
		-974.08752, -339.83640, 36.27580,   0.00000, 90.00000, -11.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3); 
	brama = CreateDynamicObject(968, -960.05786, -342.55597, 36.21580,   0.00000, 0.00000, -11.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-960.05786, -342.55597, 36.21580,   0.00000, 0.00000, -11.00000,
		-960.05786, -342.55597, 36.21580,   0.00000, -90.00000, -11.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);

	//tunel
	brama = CreateDynamicObject(968, -1225.51465, -783.38373, 63.89480,   0.00000, 0.32000, 42.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-1225.51465, -783.38373, 63.89480,   0.00000, 0.32000, 42.00000,
		-1225.51465, -783.38373, 63.89480,   0.00000, 90.32000, 42.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama =  CreateDynamicObject(968, -1215.10303, -773.57288, 63.79480,   0.00000, 0.00000, 45.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-1215.10303, -773.57288, 63.79480,   0.00000, 0.00000, 45.00000,
		-1215.10303, -773.57288, 63.79480,   0.00000, -90.00000, 45.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);

	//tunel 2
	brama = CreateDynamicObject(968, -20.38480, -1329.73218, 10.88180,   0.00000, 0.50000, -51.40000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-20.38480, -1329.73218, 10.88180,   0.00000, 0.50000, -51.40000,
		-20.38480, -1329.73218, 10.88180,   0.00000, 89.50000, -51.40000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(968, -11.48793, -1340.80090, 10.90180,   0.00000, 0.22000, -51.40000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		-11.48793, -1340.80090, 10.90180,   0.00000, 0.22000, -51.40000,
		-11.48793, -1340.80090, 10.90180,   0.00000, -90.22000, -51.40000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(968, 18.04645, -1335.45569, 10.02170,   0.00000, 0.00000, -52.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		18.04645, -1335.45569, 10.02170,   0.00000, 0.00000, -52.00000,
		18.04645, -1335.45569, 10.02170,   0.00000, 91.00000, -52.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	brama = CreateDynamicObject(968, 26.81360, -1346.70227, 9.96170,   0.00000, 0.00000, -52.00000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(brama, 
		26.81360, -1346.70227, 9.96170,   0.00000, 0.00000, -52.00000,
		26.81360, -1346.70227, 9.96170,   0.00000, -91.00000, -52.00000,
		1, 7, BRAMA_UPR_TYPE_FRACTION, 3);
	return 1;
}

static StworzBudynki()
{
	//DodajWejscie(246.6199,63.3594,1003.6406, 627.8462,-571.6732,17.5113, 88, 6, 0, 0, "", "Posterunek");
	DodajWejscie(246.6199,63.3594,1003.6406, 2693.0266,-2359.8662,14.1568, 88, 6, 0, 0, "", "Posterunek");
	DodajWejscie(236.1267,71.6366,1005.0391, 236.1212,68.5662,1005.0391, 88, 6, 88, 6, "", "");
	/*DodajWejscie(246.4406,87.1606,1003.6406, 606.1909,-571.7484,19.1921, 88, 6, 0, 0, "Parking", "Posterunek");
	DodajWejscie(247.2509,81.4765,1003.6406, 621.4407,-569.5487,26.1432, 88, 6, 0, 0, "Dach", "Posterunek");*/
	DodajWejscie(243.0992,66.2829,1003.6406, 795.0273, -580.6437,-74.1979, 88, 6, 0, 16, "Akademia policyjna", "Posterunek");
	//DodajWejscie(611.0284,-583.8448,18.0515, 803.0414,-588.9749,-74.1955, 0, 0, 0, 16, "Akademia policyjna", "");
	return 1;
}

static UsunObiekty(playerid)
{
	//Dillimore
	RemoveBuildingForPlayer(playerid, 1446, 741.6328, -517.7656, 16.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 741.6328, -513.0703, 16.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 731.8594, -595.0547, 16.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 731.8594, -599.7266, 16.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, 642.7188, -511.0547, 15.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 739.3750, -540.3438, 16.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 734.7109, -540.3438, 16.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 756.6953, -561.1094, 18.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 756.6953, -565.8906, 18.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 756.6953, -551.7891, 17.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 756.6953, -556.4453, 17.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 756.6953, -542.4844, 17.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 756.6953, -547.1406, 17.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 778.8750, -519.9844, 16.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 774.2109, -519.9844, 16.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 809.3672, -520.0234, 16.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 814.0391, -520.0234, 16.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 824.2188, -517.7813, 16.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 824.2188, -513.1016, 16.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 824.2188, -508.4219, 16.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 824.2188, -503.7422, 16.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 1503, 638.8359, -517.4766, 15.5469, 0.25);

	//intek sasp
	RemoveBuildingForPlayer(playerid, 1535, 245.2891, 61.9063, 1002.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1535, 248.3125, 61.9375, 1002.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 14843, 266.3516, 81.1953, 1001.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 2610, 236.3594, 70.7188, 1004.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 2610, 237.3047, 70.7188, 1004.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 2605, 232.1172, 65.0625, 1004.4609, 0.25);
	return 1;
}

