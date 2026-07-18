//JettyLounge.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: JettyLounge.pwn ]--------------------------------------------//
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
JettyLounge_Init() //ta metode wklejamy do nowe_obiekty -> obiekty_OnGameModeInit()
{
	StworzObiekty();//To wykorzystujemy, jezeli chcemy stworzyc jakies obiekty
	return 1;
}


//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//Tutaj wstawiamy obiekty w nastepujacym formacie:
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	new obiekt;
    obiekt = CreateDynamicObject(19739, 726.32813, -1460.40002, 21.19049,   0.00000, 0.00000, 0.00000, 255);  //podoga
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 734.42047, -1454.78186, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 734.42047, -1464.39978, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 713.52600, -1474.01489, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 713.52600, -1464.39978, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 713.52600, -1454.78186, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 723.95038, -1474.01489, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 723.95038, -1464.39978, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 723.95038, -1454.78186, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 734.42047, -1474.01489, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 749.83551, -1459.75854, 24.96460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 739.33313, -1456.20874, 24.96460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 737.60358, -1454.57813, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 744.89459, -1473.93494, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 744.89459, -1454.66650, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 716.64038, -1454.59399, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 716.64130, -1464.22620, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 716.64038, -1473.84595, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 744.89459, -1464.32251, 21.50890,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 727.12097, -1454.57800, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 739.33313, -1465.82996, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);
    obiekt = CreateDynamicObject(19379, 740.92230, -1469.38098, 24.97460,   0.00000, 90.00000, 0.00000, 255);     //podoga koniec
    SetDynamicObjectMaterial(obiekt, 0, 14771, "int_brothelint3", "gb_nastybar12", 0);


    obiekt = CreateDynamicObject(19449, 735.74951, -1473.98132, 23.33090,   0.00000, 0.00000, 0.00000, 255);  //sciany
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19379, 739.33313, -1465.82996, 24.95460,   0.00000, 90.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 718.91577, -1478.74194, 26.80160,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 718.91577, -1478.74194, 23.33090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 735.74951, -1473.98132, 26.80160,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 745.36432, -1473.83582, 23.33090,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);//1
    obiekt = CreateDynamicObject(19449, 745.36432, -1464.21106, 23.33090,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 740.59460, -1474.03027, 23.33090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 735.74951, -1464.37939, 26.80160,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 735.74951, -1454.68396, 23.33090,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 728.59857, -1450.01672, 26.80160,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 718.96448, -1450.01672, 26.80160,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 714.19250, -1454.72180, 26.80160,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 714.19250, -1464.35449, 26.80160,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 728.59857, -1450.01672, 23.31090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 718.96448, -1450.01672, 23.31090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 714.19250, -1454.73389, 23.31090,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 714.19250, -1464.34680, 23.31090,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 714.19250, -1473.98132, 26.80160,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 714.19250, -1473.98132, 23.31090,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 735.74951, -1454.74402, 26.80160,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 713.83630, -1469.10205, 23.29090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 734.10760, -1464.29565, 20.88080,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 735.17749, -1464.29565, 20.88080,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 740.65039, -1459.42065, 23.33090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19449, 747.01361, -1469.27930, 23.33090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19387, 720.24127, -1469.10205, 23.29090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19387, 737.41571, -1469.27930, 23.33090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19387, 740.62677, -1469.27930, 23.33090,   0.00000, 0.00000, 90.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19357, 734.59222, -1451.18176, 26.80160,   0.00000, 0.00000, 45.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(19357, 734.59222, -1451.18176, 23.33090,   0.00000, 0.00000, 45.00000, 255);
    SetDynamicObjectMaterial(obiekt, 0, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0); //sciany koniec


    obiekt = CreateDynamicObject(2774, 734.82391, -1469.93176, 11.79490,   0.00000, 0.00000, 0.00000, 255); //supy
    SetDynamicObjectMaterial(obiekt, 1, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    SetDynamicObjectMaterial(obiekt, 2, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(2774, 734.82391, -1458.67188, 11.79490,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    SetDynamicObjectMaterial(obiekt, 2, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(2774, 721.07281, -1458.67188, 11.79490,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    SetDynamicObjectMaterial(obiekt, 2, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(2774, 721.07281, -1464.40454, 11.79490,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    SetDynamicObjectMaterial(obiekt, 2, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    obiekt = CreateDynamicObject(2774, 727.75452, -1458.67188, 11.79490,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);
    SetDynamicObjectMaterial(obiekt, 2, 4681, "stolenbuild03", "sl_dtbuild2wall1", 0);


    obiekt = CreateDynamicObject(8614, 722.79309, -1474.54944, 23.80700,   0.00000, 0.00000, 90.00000, 255); //schody
    SetDynamicObjectMaterial(obiekt, 1, 14771, "int_brothelint3", "gb_nastybar12", 0);

    /*gateob = CreateDynamicObject(3089, 719.47821, -1469.03955, 22.69330,   0.00000, 0.00000, 0.00000, 255);
    DodajBrame(gateob,
	    719.47821, -1469.03955, 22.69330, 0.00000, 0.00000, 0.00000,
      719.47821, -1469.03955, 22.69330, 0.00000, 0.00000, 90.00000,
      2.0, 2.5, BRAMA_UPR_TYPE_GROUP, -1);
    gateob = CreateDynamicObject(3089, 738.15009, -1469.26721, 22.69330,   0.00000, 0.00000, 180.00000, 255);
    DodajBrame(gateob,
	    738.15009, -1469.26721, 22.69330, 0.00000, 0.00000, 180.00000,
      738.15009, -1469.26721, 22.69330, 0.00000, 0.00000, 90.00000,
      2.0, 2.5, BRAMA_UPR_TYPE_GROUP, -1);
    gateob = CreateDynamicObject(3089, 739.86658, -1469.26721, 22.69330,   0.00000, 0.00000, 0.00000, 255);
    DodajBrame(gateob,
	    739.86658, -1469.26721, 22.69330, 0.00000, 0.00000, 0.00000,
      739.86658, -1469.26721, 22.69330, 0.00000, 0.00000, 90.00000,
      2.0, 2.5, BRAMA_UPR_TYPE_GROUP, -1);*/ //GRUPA DO PRZYPISANIA

    obiekt = CreateDynamicObject(19129, 725.79541, -1468.85071, 28.56180,   0.00000, 0.00000, 0.00000, 255); //sufit
    SetDynamicObjectMaterial(obiekt, 1, 14852, "mp_policeSF", "mp_cop_vinyl", 0);
    obiekt = CreateDynamicObject(19129, 725.79541, -1448.89893, 28.56180,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 14852, "mp_policeSF", "mp_cop_vinyl", 0);
    obiekt = CreateDynamicObject(19129, 705.88159, -1468.85071, 28.56180,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 14852, "mp_policeSF", "mp_cop_vinyl", 0);
    obiekt = CreateDynamicObject(19129, 705.90570, -1448.89893, 28.56180,   0.00000, 0.00000, 0.00000, 255);
    SetDynamicObjectMaterial(obiekt, 1, 14852, "mp_policeSF", "mp_cop_vinyl", 0);


    CreateDynamic3DTextLabel("Biuro", 0x0080E0FF, 720.21973, -1469.00867, 24.25440, 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 255); //texty 3d
    CreateDynamic3DTextLabel("Dla Personelu", 0x0080E0FF, 735.65527, -1472.93872, 24.29690, 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 255);
    CreateDynamic3DTextLabel("Wyjscie na Taras", 0x0080E0FF, 721.97430, -1450.10620, 27.81960, 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 255);


    CreateDynamicObject(19466, 735.84338, -1478.81665, 21.79300,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 733.61731, -1478.81665, 21.79300,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 731.37708, -1478.81665, 21.79300,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 729.14191, -1478.81665, 21.79300,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 726.90790, -1478.81665, 21.79300,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 724.67358, -1478.81665, 21.79300,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 735.84338, -1478.81665, 23.72710,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 733.61731, -1478.81665, 23.72710,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 731.37708, -1478.81665, 23.72710,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 729.14191, -1478.81665, 23.72710,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 726.90790, -1478.81665, 23.72710,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 724.67358, -1478.81665, 23.72710,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 735.84338, -1478.81665, 25.65200,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 724.67358, -1478.81665, 25.65200,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 726.90790, -1478.81665, 25.65200,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 729.14191, -1478.81665, 25.65200,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 731.37708, -1478.81665, 25.65200,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 733.61731, -1478.81665, 25.65200,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 735.84338, -1478.81665, 27.58010,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 733.61731, -1478.81665, 27.58010,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 731.37708, -1478.81665, 27.58010,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 729.14191, -1478.81665, 27.58010,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 726.90790, -1478.81665, 27.58010,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 724.67358, -1478.81665, 27.58010,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1470.29089, 23.93370,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1470.29089, 21.99970,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1472.52661, 21.99970,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1474.76575, 21.99970,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1476.99463, 21.99970,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1479.23389, 21.99970,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1472.52661, 23.93370,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1474.76575, 23.93370,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1476.99463, 23.93370,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 721.84711, -1479.23389, 23.93370,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2115, 734.65198, -1460.88501, 21.83530,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2115, 734.65198, -1462.85315, 21.83530,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2115, 734.65198, -1464.81165, 21.83530,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2115, 734.65198, -1466.75964, 21.83530,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2115, 734.65198, -1468.71899, 21.83530,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(1569, 735.56921, -1452.22278, 21.59660,   0.00000, 0.00000, 135.00000, 255);
    CreateDynamicObject(1569, 733.45441, -1450.12451, 21.59660,   0.00000, 0.00000, -45.00000, 255);
    CreateDynamicObject(1569, 720.47412, -1450.08545, 25.01210,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1569, 723.46368, -1450.08447, 25.01210,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(970, 721.87201, -1473.65808, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 721.87201, -1469.56714, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 721.87201, -1465.49670, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 608.05109, -1485.91272, 35.34373,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(970, 721.87201, -1461.41016, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 723.89587, -1459.33020, 25.55910,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(970, 727.97760, -1459.33020, 25.55910,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(970, 732.05957, -1459.33020, 25.55910,   0.00000, 0.00000, 0.00000, 255);
    // gate = CreateDynamicObject(1569, 735.69409, -1472.15735, 21.59660,   0.00000, 0.00000, 270.00000, 255);
    //DodajBrame(gate, 735.69409, -1472.15735, 21.59660, 0.00000, 0.00000, 270.00000, 735.69409, -1472.15735, 21.59660, 0.00000, 0.00000, 180.00000, 5, 2, BRAMA_UPR_TYPE_GROUP, -1); //GRUPA DO PRZYPISANIA
    CreateDynamicObject(1569, 735.83551, -1472.14807, 21.59660,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1468.11145, 23.99950,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1468.11145, 22.06940,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1465.87732, 22.06940,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1463.64392, 22.06940,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1461.41895, 22.06940,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1459.18665, 22.06940,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1465.87732, 23.99950,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1463.64392, 23.99950,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1461.41895, 23.99950,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19466, 739.01788, -1459.18665, 23.99950,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 732.25549, -1478.28186, 22.16510,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 726.89398, -1478.28186, 22.16510,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2416, 738.32452, -1460.01575, 21.60180,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2441, 738.67462, -1461.93079, 21.60100,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2441, 738.67462, -1462.93555, 21.60100,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2441, 738.67462, -1463.93250, 21.60100,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2441, 738.67462, -1464.93408, 21.60100,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2441, 738.67462, -1465.94128, 21.60100,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2453, 738.65210, -1461.86096, 23.03520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2425, 738.86890, -1462.84192, 22.61540,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2421, 738.95020, -1463.65845, 22.59440,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1669, 738.67047, -1464.27319, 22.81570,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1669, 738.74023, -1464.49500, 22.81570,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1514, 734.77643, -1460.69336, 22.89380,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1514, 734.77643, -1462.82288, 22.89380,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1514, 734.77643, -1465.25476, 22.89380,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1514, 734.77643, -1467.41956, 22.89380,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1775, 738.51501, -1467.07166, 22.68310,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2341, 744.75391, -1460.01563, 21.59600,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2134, 743.75122, -1460.00806, 21.59600,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2134, 742.75482, -1460.00806, 21.59600,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2133, 744.75250, -1460.98828, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.75250, -1461.97485, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2132, 744.75250, -1462.97754, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2131, 739.75378, -1459.95874, 21.54780,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2134, 741.77271, -1460.00806, 21.59600,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2133, 744.75250, -1464.97595, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.75250, -1465.97168, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.75250, -1466.96973, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2184, 717.23853, -1476.07935, 21.59560,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1714, 716.03693, -1477.98621, 21.59630,   0.00000, 0.00000, 160.00000, 255);
    CreateDynamicObject(14455, 714.30249, -1469.99780, 23.08870,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1671, 715.33069, -1474.81360, 22.01530,   0.00000, 0.00000, 20.00000, 255);
    CreateDynamicObject(1671, 717.33209, -1474.96533, 22.01530,   0.00000, 0.00000, -20.00000, 255);
    CreateDynamicObject(2608, 714.48322, -1476.91980, 23.39160,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(1702, 721.68158, -1478.02478, 21.55640,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1702, 719.68280, -1474.74182, 21.55640,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 720.15302, -1476.89734, 21.57570,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1828, 717.44727, -1472.40137, 21.57690,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(18014, 721.10382, -1471.78174, 21.97580,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14527, 717.71100, -1474.46570, 22.38400,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1736, 717.89337, -1478.34888, 23.96310,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(2832, 720.69177, -1476.44287, 22.10780,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2737, 718.05890, -1469.22461, 23.21750,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2100, 715.33478, -1469.33130, 21.57990,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(19173, 720.29089, -1478.65515, 23.70620,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 717.78479, -1478.24976, 25.72920,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 714.72968, -1475.97021, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.72968, -1470.59167, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.72968, -1465.22522, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.72968, -1459.84851, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.72968, -1454.47876, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.72968, -1449.12524, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 717.81439, -1450.48083, 25.72920,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 726.15350, -1450.48083, 25.72920,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 731.52820, -1450.48083, 25.72920,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 811.68494, -1381.31055, 18.03073,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 735.35291, -1452.48132, 25.71920,   0.00000, 0.00000, 45.00000, 255);
    CreateDynamicObject(640, 735.30768, -1467.92151, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 735.30768, -1462.57275, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 735.30768, -1457.19495, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 735.30768, -1451.84314, 25.72920,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(970, 734.12201, -1461.37817, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 734.12201, -1464.96436, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 734.12201, -1468.54456, 25.55910,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(970, 736.18573, -1470.62366, 25.55910,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 735.29907, -1476.35815, 22.16510,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 716.81952, -1468.62622, 22.16510,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 714.64423, -1465.61414, 22.16510,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.64423, -1460.23584, 22.16510,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.64423, -1454.87512, 22.16510,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 714.64423, -1449.50464, 22.16510,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(640, 717.70392, -1450.44958, 22.16510,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 723.07678, -1450.44958, 22.16510,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 728.43958, -1450.44958, 22.16510,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(640, 735.31921, -1455.18054, 22.16510,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2233, 731.93573, -1450.06897, 21.59050,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2233, 732.55798, -1450.06897, 21.59050,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 731.43518, -1475.00769, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 726.94666, -1475.55420, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 725.74219, -1471.82751, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 729.51227, -1471.35852, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 725.07263, -1467.09155, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 729.60754, -1466.86511, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 725.21185, -1463.42810, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 729.13556, -1462.87476, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 730.19153, -1459.25098, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 724.13489, -1458.88025, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 629.43958, -1315.95398, 60.56550,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(643, 721.72296, -1461.39709, 22.05520,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 729.85730, -1451.67468, 21.51620,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1723, 726.28833, -1453.68933, 21.51620,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(1723, 719.40747, -1451.67468, 21.51620,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1723, 715.76172, -1453.68933, 21.51620,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(1723, 716.10681, -1456.92761, 21.51620,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 718.14990, -1460.57996, 21.51620,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(2024, 718.12872, -1453.21875, 21.57600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(1723, 724.53442, -1451.67468, 21.51620,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(1723, 720.95959, -1453.68933, 21.51620,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2024, 723.26343, -1453.21875, 21.57600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2024, 728.55908, -1453.21875, 21.57600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(1723, 716.10681, -1463.61426, 21.51620,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 718.14990, -1467.34326, 21.51620,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(2024, 716.69873, -1466.01501, 21.59410,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 716.69873, -1459.27771, 21.59410,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 730.84875, -1452.77710, 25.00060,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 732.81000, -1456.62036, 25.00060,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1723, 725.27722, -1452.77710, 25.00060,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 727.36829, -1456.62036, 25.00060,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1723, 716.67523, -1452.77368, 25.00060,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 718.73279, -1456.62036, 25.00060,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1723, 716.73572, -1459.26294, 25.00060,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 718.73212, -1463.18652, 25.00060,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1723, 716.67517, -1465.94446, 25.00060,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 718.73242, -1469.65039, 25.00060,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(1723, 716.67517, -1472.12280, 25.00060,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(1723, 718.73279, -1475.95520, 25.00060,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(2024, 731.28900, -1455.15076, 25.03890,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 725.79510, -1455.15076, 25.03890,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 717.13739, -1455.15076, 25.03890,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 717.13818, -1474.55786, 25.03890,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 717.13739, -1468.27612, 25.03890,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2024, 717.13739, -1461.71094, 25.03890,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2133, 742.69189, -1467.00305, 21.59600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2133, 741.66968, -1466.96973, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 741.66968, -1465.97229, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 741.66968, -1464.98450, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 741.66968, -1463.99207, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 741.66968, -1463.01245, 21.59600,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(2133, 742.69189, -1466.01294, 21.59600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2133, 742.69189, -1465.02271, 21.59600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2133, 742.69189, -1464.03406, 21.59600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2133, 742.69189, -1463.04138, 21.59600,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(14782, 742.12402, -1473.62256, 22.55790,   0.00000, 0.00000, 180.00000, 255);
    CreateDynamicObject(2360, 739.47888, -1463.46753, 21.58160,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2360, 739.47888, -1464.95667, 21.58160,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2360, 739.47888, -1466.45874, 21.58160,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2421, 742.09888, -1466.64063, 22.58760,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2425, 742.15051, -1465.68298, 22.64750,   0.00000, 0.00000, 90.00000, 255);
    CreateDynamicObject(2222, 742.27289, -1464.93945, 22.72780,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2222, 742.33270, -1464.11816, 22.72780,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(2134, 741.77887, -1460.00427, 24.92970,   0.00000, 180.00000, 0.00000, 255);
    CreateDynamicObject(2134, 742.78387, -1460.00427, 24.92970,   0.00000, 180.00000, 0.00000, 255);
    CreateDynamicObject(2134, 743.77533, -1460.00427, 24.92970,   0.00000, 180.00000, 0.00000, 255);
    CreateDynamicObject(2341, 744.75262, -1460.00427, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1460.98645, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1461.97314, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1462.96399, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1463.95435, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1464.94714, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1465.93604, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2133, 744.76428, -1466.91992, 24.92970,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2134, 742.67651, -1466.98389, 24.91880,   0.00000, 180.00000, 90.00000, 255);
    CreateDynamicObject(2134, 741.68262, -1466.98938, 24.91880,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2134, 741.68262, -1466.02502, 24.91880,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2134, 741.68262, -1465.05286, 24.91880,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2134, 741.68262, -1464.07373, 24.91880,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2134, 741.68262, -1463.09924, 24.91880,   0.00000, 180.00000, 270.00000, 255);
    CreateDynamicObject(2134, 742.67651, -1466.00989, 24.91880,   0.00000, 180.00000, 90.00000, 255);
    CreateDynamicObject(2134, 742.67651, -1465.00952, 24.91880,   0.00000, 180.00000, 90.00000, 255);
    CreateDynamicObject(2134, 742.67651, -1464.01416, 24.91880,   0.00000, 180.00000, 90.00000, 255);
    CreateDynamicObject(2134, 742.67651, -1463.02283, 24.91880,   0.00000, 180.00000, 90.00000, 255);
    CreateDynamicObject(1723, 744.72131, -1469.91870, 21.53270,   0.00000, 0.00000, 270.00000, 255);
    CreateDynamicObject(14699, 742.14148, -1474.54041, 23.32320,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 732.93207, -1472.25122, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 729.18250, -1472.25122, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 722.06989, -1472.25122, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 732.93213, -1464.65576, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 729.18250, -1464.65576, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 722.06989, -1464.65576, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 732.93213, -1457.51904, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 729.18250, -1457.51904, 26.97080,   0.00000, 0.00000, 0.00000, 255);
    CreateDynamicObject(14699, 722.06989, -1457.51904, 26.97080,   0.00000, 0.00000, 0.00000, 255);


    //EXTERIOR
    gateob = CreateDynamicObject(1825, 739.72827, -1444.72083, 16.68750,   0.00000, 0.00000, 47.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1726, 717.82861, -1449.64563, 16.68740,   0.00000, 0.00000, 130.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    CreateDynamicObject(1827, 732.03711, -1448.40173, 16.68789,   0.00000, 0.00000, 0.00000);
    gateob = CreateDynamicObject(1726, 733.38434, -1450.12012, 16.68740,   0.00000, 0.00000, 185.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1727, 734.36432, -1447.31555, 16.68830,   0.00000, 0.00000, -77.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1825, 713.73651, -1444.70764, 16.68750,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1825, 725.36609, -1443.87268, 16.68750,   0.00000, 0.00000, -76.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1726, 730.75494, -1446.58130, 16.68740,   0.00000, 0.00000, 14.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    CreateDynamicObject(1827, 718.50500, -1447.86145, 16.68789,   0.00000, 0.00000, 0.00000);
    gateob = CreateDynamicObject(1726, 719.16553, -1446.00598, 16.68740,   0.00000, 0.00000, 309.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1727, 720.31128, -1448.98254, 16.68830,   0.00000, 0.00000, -135.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1727, 729.67084, -1449.32532, 16.68830,   0.00000, 0.00000, 103.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(638, 710.24060, -1439.90723, 17.36650,   0.00000, 0.00000, 90.00000);
    SetDynamicObjectMaterial(gateob,0,14535,"ab_wooziec","ab_wood01",0);
    gateob = CreateDynamicObject(638, 718.32062, -1439.90723, 17.36650,   0.00000, 0.00000, 90.00000);
    SetDynamicObjectMaterial(gateob,0,14535,"ab_wooziec","ab_wood01",0);
    gateob = CreateDynamicObject(638, 726.40057, -1439.90723, 17.36650,   0.00000, 0.00000, 90.00000);
    SetDynamicObjectMaterial(gateob,0,14535,"ab_wooziec","ab_wood01",0);
    gateob = CreateDynamicObject(638, 734.52063, -1439.90723, 17.36650,   0.00000, 0.00000, 90.00000);
    SetDynamicObjectMaterial(gateob,0,14535,"ab_wooziec","ab_wood01",0);
    gateob = CreateDynamicObject(638, 742.28058, -1439.90723, 17.36650,   0.00000, 0.00000, 90.00000);
    SetDynamicObjectMaterial(gateob,0,14535,"ab_wooziec","ab_wood01",0);
    gateob = CreateDynamicObject(1825, 730.91388, -1442.37793, 16.68750,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    gateob = CreateDynamicObject(1825, 718.53229, -1442.37793, 16.68750,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(gateob,1,1754,"cj_sofa","CJ-COUCHL1",0);
    CreateDynamicObject(3806, 728.14227, -1450.86731, 19.29240,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(3806, 723.20227, -1450.86731, 19.29240,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(3806, 715.36230, -1450.86731, 19.29240,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(3806, 735.96228, -1450.86731, 19.29240,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(948, 724.31281, -1450.83081, 16.68680,   0.00000, 0.00000, -24.00000);
    CreateDynamicObject(948, 727.11328, -1450.83081, 16.68680,   0.00000, 0.00000, 24.00000);
    CreateDynamicObject(1549, 727.77240, -1450.98035, 16.68770,   0.00000, 0.00000, -22.00000);
    CreateDynamicObject(2010, 730.90198, -1450.88977, 16.68869,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2010, 718.77557, -1450.47644, 16.68777,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1543, 725.20203, -1443.98010, 17.56604,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2683, 725.43982, -1444.12964, 17.70640,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2852, 732.31219, -1448.36035, 17.12360,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2854, 725.33148, -1443.70349, 17.56690,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2353, 731.52368, -1448.73608, 17.17450,   -25.00000, 23.00000, -6.00000);
    CreateDynamicObject(2354, 718.76947, -1442.54614, 17.61530,   -25.00000, 23.00000, 46.00000);
    CreateDynamicObject(1487, 718.90143, -1442.48145, 17.74640,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1665, 718.57123, -1442.81580, 17.58640,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1543, 718.14130, -1442.63684, 17.56648,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1669, 732.09229, -1448.51123, 17.29480,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1667, 732.36371, -1448.29993, 17.21510,   0.00000, 0.00000, 55.00000);
    CreateDynamicObject(1667, 731.92743, -1448.86475, 17.21510,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1665, 731.80188, -1447.91248, 17.13510,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1520, 731.82642, -1448.16040, 17.17480,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2829, 713.46613, -1444.99170, 17.56660,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2816, 713.82001, -1444.79907, 17.56650,   0.00000, 0.00000, 135.00000);
    CreateDynamicObject(2800, 718.49048, -1447.86877, 16.93450,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1665, 718.35071, -1448.42688, 17.13480,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2342, 718.11023, -1447.36743, 17.25570,   0.00000, 0.00000, 40.00000);
    CreateDynamicObject(2222, 730.74561, -1442.42896, 17.64620,   0.00000, 0.00000, 55.00000);
    CreateDynamicObject(2223, 739.63422, -1444.87427, 17.64600,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1551, 739.91638, -1445.04395, 17.78620,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1665, 739.30719, -1444.87378, 17.58610,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1951, 730.97015, -1442.08655, 17.76530,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(8615, 720.949035, -1474.671264, 19.355337, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	return 1;
}
