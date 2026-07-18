---
to: nowe/<%= project %>/<%= project %>.pwn
---
//<%= project %>.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------------[ Module: <%= project %>.pwn ]--------------------------------------------//
//Autor: <%= autor %>
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
<%= project %>_Init() //ta metode wklejamy do obiekty.pwn -> obiekty_OnGameModeInit()
{
	//Tutaj wstawiamy obiekty w nastepujacym formacie:
	//CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0);
	

	//Tutaj wstawiamy bramy w formacie: 
		// DodajBrame(fobiekt, 
		//    Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, 
		//    Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, 
		//    Float:fspeed, Float:frange, fuprtyp=0, fuprval=0)
		// fuprtyp - TYPY UPRAWNIEN:
			//0 - BRAK
			//1 - FRAKCJA
			//2 - RODZINA
			//3 - BIZNES
		// fuprval - numer frakcji/rodziny
	
		//DualGateAdd(...rozpisane w glownym README) 

	//Tutaj wstawiamy wejscia w formacie:
	//DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="", wejdzUID=0, playerLocal=255, bool:specialCome=false); 

}

<%= project %>_Connect(playerid) //ta metode wklejamy do obiekty.pwn -> obiekty_OnPlayerConnect(playerid)
{
	//Tutaj wstawiamy usuwanie obiektow z mapy GTA w formacie:
	//RemoveBuildingForPlayer(playerid, modelid, Float:fX, Float:fY, Float:fZ, Float:fRadius);

	/*
	=========[PAMIeTAJ]=========
		Jezeli usuwasz jakies obiekty, usuwasz je z kazdego wytyczonego Virtual Worlda serwera. 
		Jezeli chcesz gdzies dodac interior (wraz z oknami),
		tworzac iluzje prawdziwego wnetrza i chcesz usunac obiekt budynku tylko na VW 0 powinienes:
			1. Usunac obiekt budynku
			2. W pliku exterior.pwn (twojego interioru) dodac na nowo obiekt usunietego budynku tylko i wylacznie na VW 0
				> W textureStudio swietnie sprawdza sie do tego komenda /swapbuilding (na nowej mapie) 
	=============================
	*/ 
	
}
