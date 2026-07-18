//poprawkiRockstar.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: poprawkiRockstar.pwn ]------------------------------------------//
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

//By simeone

//-----------------<[ Zmienne: ]>-------------------

new pociagi;

//-----------------<[ Główne funkcje: ]>-------------------
interiorpociagu_Init()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	pociagi = CreateDynamicObject(19445, 1707.326538, -1953.989868, -18.450931, 0.000000, 270.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1707.326538, -1955.821044, -16.650928, 0.000000, 360.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1707.326538, -1952.261718, -16.650928, 0.000000, 360.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1702.518798, -1953.841918, -16.650928, 0.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	pociagi = CreateDynamicObject(1500, 1702.618896, -1953.268432, -18.364994, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 1, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	pociagi = CreateDynamicObject(1522, 1707.901123, -1955.718994, -18.364994, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14577, "casinovault01", "dts_elevator_door", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 14577, "casinovault01", "dts_elevator_door", 0x00000000);
	pociagi = CreateDynamicObject(1522, 1709.432373, -1952.328369, -18.364994, 0.000000, -0.000014, 179.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14577, "casinovault01", "dts_elevator_door", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 14577, "casinovault01", "dts_elevator_door", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.945678, -1953.989868, -18.450931, 0.000029, 270.000000, 89.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.945678, -1955.821044, -16.650928, 0.000029, 360.000000, 89.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.945678, -1952.261718, -16.650928, 0.000029, 360.000000, 89.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1714.792114, -1953.268432, -16.650928, -0.000007, 360.000000, 0.000007, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	pociagi = CreateDynamicObject(1500, 1714.692016, -1954.832275, -18.364994, 0.000000, 0.000007, 89.999938, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 1, 1560, "7_11_door", "cj_sheetmetal2", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1707.572509, -1954.875732, -18.364994, 0.000000, -0.000007, 179.999954, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1707.572509, -1953.205322, -18.364994, 0.000000, -0.000007, 179.999954, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1709.674560, -1954.875732, -18.364994, 0.000000, -0.000014, 179.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1709.674560, -1953.205322, -18.364994, 0.000000, -0.000014, 179.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1707.572509, -1954.875732, -15.705015, 0.000000, -0.000037, 179.999771, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1707.572509, -1953.205322, -15.705015, 0.000000, -0.000037, 179.999771, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1709.674560, -1954.875732, -15.705015, 0.000000, -0.000045, 179.999725, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1709.674560, -1953.205322, -15.705015, 0.000000, -0.000045, 179.999725, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1707.326538, -1953.181518, -13.840925, 0.000000, 1080.000000, 630.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1707.326538, -1954.912231, -13.840925, 0.000000, 1080.000000, 630.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1707.326538, -1952.421875, -15.480298, 0.000000, -110.000000, 630.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1707.326538, -1955.671752, -15.477087, 0.000000, -110.000000, 450.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.946899, -1953.181518, -13.840925, -0.000007, 1080.000000, -89.999977, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.946899, -1954.912231, -13.840925, -0.000007, 1080.000000, -89.999977, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.946899, -1952.425292, -15.489694, -0.000007, -110.000000, -89.999977, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	pociagi = CreateDynamicObject(19445, 1716.946899, -1955.671752, -15.477087, 0.000007, -110.000000, 89.999977, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1707.562500, -1953.205322, -16.074958, 0.000000, 89.999961, 179.999771, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1707.562500, -1954.875732, -16.074958, 0.000000, 89.999961, 179.999771, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1704.890625, -1953.205322, -16.074958, 0.000000, 89.999938, 179.999633, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1704.890625, -1954.875732, -16.074958, 0.000000, 89.999938, 179.999633, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1715.037353, -1953.205322, -16.074958, 0.000000, 89.999954, 179.999725, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1715.037353, -1954.875732, -16.074958, 0.000000, 89.999954, 179.999725, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1712.365478, -1953.205322, -16.074958, 0.000000, 89.999931, 179.999588, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1712.365478, -1954.875732, -16.074958, 0.000000, 89.999931, 179.999588, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(2596, 1714.926391, -1954.037841, -15.584987, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14544, "ab_woozieb", "ap_screens1", 0x00000000);
	pociagi = CreateDynamicObject(2596, 1702.394409, -1954.097900, -15.584986, 0.000000, 0.000000, 450.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 14544, "ab_woozieb", "ap_screens1", 0x00000000);
	pociagi = CreateDynamicObject(19329, 1708.634277, -1955.287963, -18.364986, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
	pociagi = CreateDynamicObject(19329, 1708.634277, -1952.788330, -18.364986, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 16640, "a51", "sm_conc_hatch", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1713.300415, -1955.730957, -16.514982, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1710.910156, -1955.730957, -16.514982, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1710.910034, -1952.368896, -16.514982, -0.000007, 0.000014, 0.000007, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1713.300292, -1952.368896, -16.514982, -0.000007, 0.000014, 0.000007, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1706.408325, -1955.730957, -16.514982, 0.000000, -0.000029, 179.999816, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1704.018066, -1955.730957, -16.514982, 0.000000, -0.000029, 179.999816, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1704.017944, -1952.368896, -16.514982, -0.000007, 0.000045, 0.000007, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19327, 1706.408203, -1952.368896, -16.514982, -0.000007, 0.000045, 0.000007, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 15040, "cuntcuts", "AH_pinkcurtain", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1705.180664, -1954.875732, -18.364994, 0.000000, -0.000014, 179.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1705.180664, -1953.205322, -18.364994, 0.000000, -0.000014, 179.999908, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1705.180664, -1954.875732, -15.705015, 0.000000, -0.000045, 179.999725, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1705.180664, -1953.205322, -15.705015, 0.000000, -0.000045, 179.999725, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1712.062744, -1954.875732, -18.364994, 0.000000, -0.000022, 179.999862, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1712.062744, -1953.205322, -18.364994, 0.000000, -0.000022, 179.999862, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1712.062744, -1954.875732, -15.705015, 0.000000, -0.000051, 179.999679, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	pociagi = CreateDynamicObject(19956, 1712.062744, -1953.205322, -15.705015, 0.000000, -0.000051, 179.999679, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(pociagi, 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 1, 16640, "a51", "concreteyellow256 copy", 0x00000000);
	SetDynamicObjectMaterial(pociagi, 2, 19297, "matlights", "invisible", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	pociagi = CreateDynamicObject(19445, 1707.326538, -1956.581787, -15.520928, 0.000000, 810.000000, 450.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19445, 1707.326538, -1951.510742, -15.520928, 0.000000, 810.000000, 630.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1704.009033, -1955.429321, -17.784994, 0.000000, 0.000037, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1706.369873, -1955.429321, -17.784994, 0.000000, 0.000037, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1706.369873, -1952.648681, -17.784994, 0.000007, 0.000000, 179.999877, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1704.009033, -1952.648681, -17.784994, 0.000007, 0.000000, 179.999877, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1710.902343, -1955.429321, -17.784994, 0.000000, 0.000052, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1713.263183, -1955.429321, -17.784994, 0.000000, 0.000052, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1713.263183, -1952.648681, -17.784994, 0.000007, -0.000014, 179.999786, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(2808, 1710.902343, -1952.648681, -17.784994, 0.000007, -0.000014, 179.999786, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19325, 1707.578613, -1958.209838, -17.884983, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19325, 1707.578613, -1949.889648, -17.884983, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19325, 1709.680664, -1958.209838, -17.884983, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19325, 1709.680664, -1949.889648, -17.884983, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19445, 1716.946899, -1956.581787, -15.520928, 0.000007, 810.000000, 89.999977, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(19445, 1716.946899, -1951.510742, -15.520928, -0.000007, 810.000000, -89.999977, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1704.081054, -1952.818481, -15.644994, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1706.361816, -1952.818481, -15.644994, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1708.712890, -1952.818481, -15.644994, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1710.943969, -1952.818481, -15.644994, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1713.344604, -1952.818481, -15.644994, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1704.081054, -1955.240356, -15.644994, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1706.361816, -1955.240356, -15.644994, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1708.712890, -1955.240356, -15.644994, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1710.943969, -1955.240356, -15.644994, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00); 
	pociagi = CreateDynamicObject(957, 1713.344604, -1955.240356, -15.644994, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00); 

	
	return 1;
}
