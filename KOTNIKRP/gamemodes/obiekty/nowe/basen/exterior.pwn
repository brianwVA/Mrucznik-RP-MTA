//exterior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: exterior.pwn ]------------------------------------------//
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
basenext_Init()
{
	StworzObiekty();
	return 1;
}

basen_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	basenint = CreateDynamicObject(1215, 1164.589965, -1782.359985, 13.109395, 0.000000, 0.000000, 0.000000, 0, -1, -1, 300.00, 300.00); 
	basenint = CreateDynamicObject(1215, 1190.290039, -1754.790039, 13.109395, 0.000000, 0.000000, 0.000000, 0, -1, -1, 300.00, 300.00); 
	basenint = CreateDynamicObject(1215, 1190.290039, -1769.339965, 13.109395, 0.000000, 0.000000, 0.000000, 0, -1, -1, 300.00, 300.00); 
	basenint = CreateDynamicObject(4101, 1224.699951, -1782.199951, 29.898399, 0.000000, 0.000000, 0.000000, 0, -1, -1, 300.00, 300.00); 

	StworzWjedz(1827.0527, -1539.3645, 13.2089, 1818.77222, -1536.09314, 13.11075, 3, 0, "Brama United States Secret Service", "Wyjazdowa Brama", 7, 0, 255);
	//=====================================[WJAZDY]=============================
	StworzWjedz(1753.2124,-1538.7153,9.1894, 1481.5889,-1519.8298,66.9969, 5.0, 2, "Parking podziemny", "Wyjazd z parkingu podziemnego", FRAC_BOR, 0, 255);//USSS - parking podziemny
	StworzWjedz(593.47217, -1509.27258, 15.75509, 1059.91748, 1553.65698, 7.59697, 5.0, 2, "Parking wewnętrzny FBI", "Wyjazd z parkingu wewnętrznego", FRAC_FBI, 0, 255);//FBI podziemny
	//StworzWjedz(1588.0006,-1633.5677,13.1671, 1588.9865,-1642.7157,12.4604, 5.0, 2, "Parking wewnętrzny Los Santos Police Department", "Wyjazd z parkingu", FRAC_LSPD, 0, 255);//Podziemny LSPD
	StworzWjedz(1588.52,-1632.32, 13.38, 1588.9865,-1642.7157,12.4604, 5.0, 2, "Parking wewnętrzny Los Santos Police Department", "Wyjazd z parkingu", FRAC_LSPD, 0, 255);//Podziemny LSPD
	//(Float:wjedzX, Float:wjedzY, Float:wjedzZ, Float:wyjedzX, Float:wyjedzY, Float:wyjedzZ, Float:RangePoint, VW, MessageIN[]=" ", MessageOut[]=" ", FracOwner=0, OrgOwner=0, local)
	return 1;
}

static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 4101, 1224.699, -1782.199, 29.898, 0.250);
	RemoveBuildingForPlayer(playerid, 4105, 1224.699, -1782.199, 29.898, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1190.290, -1769.339, 13.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1190.290, -1754.790, 13.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1164.589, -1782.359, 13.109, 0.250);
	return 1;
}