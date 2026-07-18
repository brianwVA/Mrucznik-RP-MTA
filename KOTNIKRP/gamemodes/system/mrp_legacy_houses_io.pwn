ZaladujDomy()
{
	new string[256];
	if(dini_Exists("Domy/NRD.ini"))
	{
	    for(new i = 0; i <= dini_Int("Domy/NRD.ini", "NrDomow"); i++)
	    {
	        format(string, sizeof(string), "Domy/Dom%d.ini", i);
	        if(dini_Exists(string))
	        {
	            new GeT[MAX_PLAYER_NAME + 1];
	            new message[128];
	            new SEJF[20];
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Wlasciciel"));
				/*if(strfind(GeT, "Zamaskowany", true) != -1) //chwilowy fix, po użyciu na produkcji wyrzucić
				{
					new playernick[26];
    				strmid(playernick, MruMySQL_GetNameFromUID(dini_Int(string, "UID_Wlascicela")), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
					format(GeT, sizeof(GeT), "%s", playernick);
				}*/
    			Dom[i][hID] = i;
    			Dom[i][hDomNr] = dini_Int(string, "DomNr");
    			Dom[i][hZamek] = dini_Int(string, "Zamek");
				Dom[i][hWlasciciel] = GeT;
				Dom[i][hKupiony] = dini_Int(string, "Kupiony");
				Dom[i][hBlokada] = dini_Int(string, "Blokada");
				Dom[i][hOplata] = dini_Int(string, "Dodatkowa_Oplata");
				format(message, sizeof(message), "%s", dini_Get(string, "Komunikat_Wynajmu"));
				Dom[i][hKomunikatWynajmu] = message;
				Dom[i][hCena] = dini_Int(string, "Cena");
				Dom[i][hUID_W] = dini_Int(string, "UID_Wlascicela");
				Dom[i][hData_DD] = dini_Int(string, "Data");
				Dom[i][hWej_X] = dini_Float(string, "Wej_X");
				Dom[i][hWej_Y] = dini_Float(string, "Wej_Y");
				Dom[i][hWej_Z] = dini_Float(string, "Wej_Z");
				Dom[i][hInt_X] = dini_Float(string, "Int_X");
				Dom[i][hInt_Y] = dini_Float(string, "Int_Y");
				Dom[i][hInt_Z] = dini_Float(string, "Int_Z");
				Dom[i][hInterior] = dini_Int(string, "Interior");
				Dom[i][hParcela] = dini_Int(string, "Parcela");
				Dom[i][hVW] = dini_Int(string, "VirtualWorld");
				//format(GeT, sizeof(GeT), "%s", dini_Get(string, "Tekst_3D"));
				//Dom[i][h3D_txt] = GeT;
				//hK_3D,
				Dom[i][hSwiatlo] = dini_Int(string, "Oswietlenie");
				Dom[i][hPokoje] = dini_Int(string, "Pokoje");
				Dom[i][hPDW] = dini_Int(string, "Pokoi_Dowynajecia");
				Dom[i][hPW] = dini_Int(string, "Pokoi_Wynajmowanych");
                if(Dom[i][hPW] < 0) Dom[i][hPW] = 0;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator1"));
				Dom[i][hL1] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator2"));
				Dom[i][hL2] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator3"));
				Dom[i][hL3] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator4"));
				Dom[i][hL4] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator5"));
				Dom[i][hL5] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator6"));
				Dom[i][hL6] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator7"));
				Dom[i][hL7] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator8"));
				Dom[i][hL8] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator9"));
				Dom[i][hL9] = GeT;
				format(GeT, sizeof(GeT), "%s", dini_Get(string, "Lokator10"));
				Dom[i][hL10] = GeT;
				Dom[i][hWynajem] = dini_Int(string, "Wynajmowanie");
				Dom[i][hWW] = dini_Int(string, "Warunek_Wynajmu");
				Dom[i][hTWW] = dini_Int(string, "Tryb_WW");
				Dom[i][hCenaWynajmu] = dini_Int(string, "CenaWynajmu");
				Dom[i][hKomunikatDomowy] = dini_Int(string, "KomunikatDomowy");
				Dom[i][hUL_Z] = dini_Int(string, "Uprawnienia_Lokatorow_Zamek");
				Dom[i][hUL_D] = dini_Int(string, "Uprawnienia_Lokatorow_Dodatki");
				Dom[i][hApteczka] = dini_Int(string, "Apteczka");
				Dom[i][hKami] = dini_Int(string, "Kamizelka");
				Dom[i][hSejf] = dini_Int(string, "Sejf");
				format(SEJF, sizeof(SEJF), "%s", dini_Get(string, "Kod_Do_Sejfu"));
				Dom[i][hKodSejf] = SEJF;
				Dom[i][hZbrojownia] = dini_Int(string, "Zbrojownia");
				Dom[i][hGaraz] = dini_Int(string, "Garaz");
				Dom[i][hLadowisko] = dini_Int(string, "Ladowisko");
				Dom[i][hAlarm] = dini_Int(string, "Alarm");
				Dom[i][hZamekD] = dini_Int(string, "Zamek_Dodatkowy");
				Dom[i][hKomputer] = dini_Int(string, "Komputer");
				Dom[i][hRTV] = dini_Int(string, "Sprzet_RTV");
				Dom[i][hHazard] = dini_Int(string, "Zestaw_Hazardowy");
				Dom[i][hSzafa] = dini_Int(string, "Szafa");
				Dom[i][hTajemnicze] = dini_Int(string, "Tajemniczy_Dodatek");
				Dom[i][hS_kasa] = dini_Int(string, "S_kasa");
				Dom[i][hS_mats] = dini_Int(string, "S_mats");
				Dom[i][hS_ziolo] = dini_Int(string, "S_ziolo");
				Dom[i][hS_drugs] = dini_Int(string, "S_drugs");
				Dom[i][hS_PG1] = dini_Int(string, "S_PG1");
				Dom[i][hS_PG2] = dini_Int(string, "S_PG2");
				Dom[i][hS_PG3] = dini_Int(string, "S_PG3");
				Dom[i][hS_PG4] = dini_Int(string, "S_PG4");
				Dom[i][hS_PG5] = dini_Int(string, "S_PG5");
				Dom[i][hS_PG6] = dini_Int(string, "S_PG6");
				Dom[i][hS_PG7] = dini_Int(string, "S_PG7");
				Dom[i][hS_PG8] = dini_Int(string, "S_PG8");
				Dom[i][hS_PG9] = dini_Int(string, "S_PG9");
				Dom[i][hS_PG10] = dini_Int(string, "S_PG10");
				Dom[i][hS_PG11] = dini_Int(string, "S_PG11");
				Dom[i][hS_G0] = dini_Int(string, "S_G0");
				Dom[i][hS_G1] = dini_Int(string, "S_G1");
				Dom[i][hS_G2] = dini_Int(string, "S_G2");
				Dom[i][hS_G3] = dini_Int(string, "S_G3");
				Dom[i][hS_G4] = dini_Int(string, "S_G4");
				Dom[i][hS_G5] = dini_Int(string, "S_G5");
				Dom[i][hS_G6] = dini_Int(string, "S_G6");
				Dom[i][hS_G7] = dini_Int(string, "S_G7");
				Dom[i][hS_G8] = dini_Int(string, "S_G8");
				Dom[i][hS_G9] = dini_Int(string, "S_G9");
				Dom[i][hS_G10] = dini_Int(string, "S_G10");
				Dom[i][hS_G11] = dini_Int(string, "S_G11");
				Dom[i][hS_A1] = dini_Int(string, "S_A1");
				Dom[i][hS_A2] = dini_Int(string, "S_A2");
				Dom[i][hS_A3] = dini_Int(string, "S_A3");
				Dom[i][hS_A4] = dini_Int(string, "S_A4");
				Dom[i][hS_A5] = dini_Int(string, "S_A5");
				Dom[i][hS_A6] = dini_Int(string, "S_A6");
				Dom[i][hS_A7] = dini_Int(string, "S_A7");
				Dom[i][hS_A8] = dini_Int(string, "S_A8");
				Dom[i][hS_A9] = dini_Int(string, "S_A9");
				Dom[i][hS_A10] = dini_Int(string, "S_A10");
				Dom[i][hS_A11] = dini_Int(string, "S_A11");
				Dom[i][hIkonka] = -1;
				if(Dom[i][hKupiony] == 0)
				{
				    Dom[i][hPickup] = CreateDynamicPickup(1273, 1, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z], -1, -1, -1, 125.0);
				}
				else
				{
				    Dom[i][hPickup] = CreateDynamicPickup(1239, 1, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z], -1, -1, -1, 125.0);
				}
	        }
	    }
	}
	else
	{
	    dini_Create("Domy/NRD.ini");
	    dini_IntSet("Domy/NRD.ini", "NrDomow", 0);
	}
	return 1;
}

ZapiszDomy()
{
	new string[256];
    for(new i = 0; i <= dini_Int("Domy/NRD.ini", "NrDomow"); i++)
    {
    	format(string, sizeof(string), "Domy/Dom%d.ini", i);
     	if(dini_Exists(string))
      	{
   			//dini_IntSet(string, "ID", Dom[i][hID]);
   			dini_IntSet(string, "DomNr", Dom[i][hDomNr]);
			dini_Set(string, "Wlasciciel", Dom[i][hWlasciciel]);
			dini_IntSet(string, "Zamek", Dom[i][hZamek]);
			dini_IntSet(string, "Kupiony", Dom[i][hKupiony]);
			dini_IntSet(string, "Blokada", Dom[i][hBlokada]);
		 	dini_IntSet(string, "Dodatkowa_Oplata", Dom[i][hOplata]);
		 	dini_Set(string, "Komunikat_Wynajmu", Dom[i][hKomunikatWynajmu]);
		 	dini_IntSet(string, "Cena", Dom[i][hCena]);
			dini_IntSet(string, "UID_Wlascicela", Dom[i][hUID_W]);
			dini_IntSet(string, "Data", Dom[i][hData_DD]);
			dini_FloatSet(string, "Wej_X", Dom[i][hWej_X]);
			dini_FloatSet(string, "Wej_Y", Dom[i][hWej_Y]);
			dini_FloatSet(string, "Wej_Z", Dom[i][hWej_Z]);
			dini_FloatSet(string, "Int_X", Dom[i][hInt_X]);
			dini_FloatSet(string, "Int_Y", Dom[i][hInt_Y]);
			dini_FloatSet(string, "Int_Z", Dom[i][hInt_Z]);
			dini_IntSet(string, "Interior", Dom[i][hInterior]);
			dini_IntSet(string, "Parcela", Dom[i][hParcela]);
			dini_IntSet(string, "VirtualWorld", Dom[i][hVW]);
			//format(GeT, sizeof(GeT), "%s", dini_Get(string, "Tekst_3D"));
			//Dom[i][h3D_txt] = GeT;
			//hK_3D,
			dini_IntSet(string, "Oswietlenie", Dom[i][hSwiatlo]);
			dini_IntSet(string, "Pokoje", Dom[i][hPokoje]);
			dini_IntSet(string, "Pokoi_Dowynajecia", Dom[i][hPDW]);
			dini_IntSet(string, "Pokoi_Wynajmowanych", Dom[i][hPW]);
			dini_Set(string, "Lokator1", Dom[i][hL1]);
			dini_Set(string, "Lokator2", Dom[i][hL2]);
			dini_Set(string, "Lokator3", Dom[i][hL3]);
			dini_Set(string, "Lokator4", Dom[i][hL4]);
			dini_Set(string, "Lokator5", Dom[i][hL5]);
			dini_Set(string, "Lokator6", Dom[i][hL6]);
			dini_Set(string, "Lokator7", Dom[i][hL7]);
			dini_Set(string, "Lokator8", Dom[i][hL8]);
			dini_Set(string, "Lokator9", Dom[i][hL9]);
			dini_Set(string, "Lokator10", Dom[i][hL10]);
			dini_IntSet(string, "Wynajmowanie", Dom[i][hWynajem]);
			dini_IntSet(string, "CenaWynajmu", Dom[i][hCenaWynajmu]);
            dini_IntSet(string, "KomunikatDomowy", Dom[i][hKomunikatDomowy]);
			dini_IntSet(string, "Uprawnienia_Lokatorow_Zamek", Dom[i][hUL_Z]);
			dini_IntSet(string, "Uprawnienia_Lokatorow_Dodatki", Dom[i][hUL_D]);
            dini_IntSet(string, "Warunek_Wynajmu", Dom[i][hWW]);
            dini_IntSet(string, "Tryb_WW", Dom[i][hTWW]);
			dini_IntSet(string, "Apteczka", Dom[i][hApteczka]);
			dini_IntSet(string, "Kamizelka", Dom[i][hKami]);
			dini_IntSet(string, "Sejf", Dom[i][hSejf]);
			dini_Set(string, "Kod_Do_Sejfu", Dom[i][hKodSejf]);
			dini_IntSet(string, "Zbrojownia", Dom[i][hZbrojownia]);
			dini_IntSet(string, "Garaz", Dom[i][hGaraz]);
			dini_IntSet(string, "Ladowisko", Dom[i][hLadowisko]);
			dini_IntSet(string, "Alarm", Dom[i][hAlarm]);
		 	dini_IntSet(string, "Zamek_Dodatkowy", Dom[i][hZamekD]);
			dini_IntSet(string, "Komputer", Dom[i][hKomputer]);
			dini_IntSet(string, "Sprzet_RTV", Dom[i][hRTV]);
			dini_IntSet(string, "Zestaw_Hazardowy", Dom[i][hHazard]);
			dini_IntSet(string, "Szafa", Dom[i][hSzafa]);
			dini_IntSet(string, "Tajemniczy_Dodatek", Dom[i][hTajemnicze]);
			dini_IntSet(string, "S_kasa", Dom[i][hS_kasa]);
			dini_IntSet(string, "S_mats", Dom[i][hS_mats]);
			dini_IntSet(string, "S_ziolo", Dom[i][hS_ziolo]);
			dini_IntSet(string, "S_drugs", Dom[i][hS_drugs]);
			dini_IntSet(string, "S_PG1", Dom[i][hS_PG1]);
			dini_IntSet(string, "S_PG2", Dom[i][hS_PG2]);
			dini_IntSet(string, "S_PG3", Dom[i][hS_PG3]);
			dini_IntSet(string, "S_PG4", Dom[i][hS_PG4]);
			dini_IntSet(string, "S_PG5", Dom[i][hS_PG5]);
			dini_IntSet(string, "S_PG6", Dom[i][hS_PG6]);
			dini_IntSet(string, "S_PG7", Dom[i][hS_PG7]);
			dini_IntSet(string, "S_PG8", Dom[i][hS_PG8]);
			dini_IntSet(string, "S_PG9", Dom[i][hS_PG9]);
			dini_IntSet(string, "S_PG10", Dom[i][hS_PG10]);
			dini_IntSet(string, "S_PG11", Dom[i][hS_PG11]);
			dini_IntSet(string, "S_G0", Dom[i][hS_G0]);
			dini_IntSet(string, "S_G1", Dom[i][hS_G1]);
			dini_IntSet(string, "S_G2", Dom[i][hS_G2]);
			dini_IntSet(string, "S_G3", Dom[i][hS_G3]);
			dini_IntSet(string, "S_G4", Dom[i][hS_G4]);
			dini_IntSet(string, "S_G5", Dom[i][hS_G5]);
			dini_IntSet(string, "S_G6", Dom[i][hS_G6]);
			dini_IntSet(string, "S_G7", Dom[i][hS_G7]);
			dini_IntSet(string, "S_G8", Dom[i][hS_G8]);
			dini_IntSet(string, "S_G9", Dom[i][hS_G9]);
			dini_IntSet(string, "S_G10", Dom[i][hS_G10]);
			dini_IntSet(string, "S_G11", Dom[i][hS_G11]);
			dini_IntSet(string, "S_A1", Dom[i][hS_A1]);
			dini_IntSet(string, "S_A2", Dom[i][hS_A2]);
			dini_IntSet(string, "S_A3", Dom[i][hS_A3]);
			dini_IntSet(string, "S_A4", Dom[i][hS_A4]);
			dini_IntSet(string, "S_A5", Dom[i][hS_A5]);
			dini_IntSet(string, "S_A6", Dom[i][hS_A6]);
			dini_IntSet(string, "S_A7", Dom[i][hS_A7]);
			dini_IntSet(string, "S_A8", Dom[i][hS_A8]);
			dini_IntSet(string, "S_A9", Dom[i][hS_A9]);
			dini_IntSet(string, "S_A10", Dom[i][hS_A10]);
			dini_IntSet(string, "S_A11", Dom[i][hS_A11]);
        }
    }
    return 1;
}

ZapiszDom(domid)
{
    new string[256];
    format(string, sizeof(string), "Domy/Dom%d.ini", domid);
  	if(dini_Exists(string))
  	{
   		//dini_IntSet(string, "ID", Dom[domid][hID]);
   		dini_IntSet(string, "DomNr", Dom[domid][hDomNr]);
  		dini_Set(string, "Wlasciciel", Dom[domid][hWlasciciel]);
  		dini_IntSet(string, "Zamek", Dom[domid][hZamek]);
  		dini_IntSet(string, "Kupiony", Dom[domid][hKupiony]);
  		dini_IntSet(string, "Blokada", Dom[domid][hBlokada]);
	 	dini_IntSet(string, "Dodatkowa_Oplata", Dom[domid][hOplata]);
	 	dini_Set(string, "Komunikat_Wynajmu", Dom[domid][hKomunikatWynajmu]);
	 	dini_IntSet(string, "Cena", Dom[domid][hCena]);
		dini_IntSet(string, "UID_Wlascicela", Dom[domid][hUID_W]);
		dini_IntSet(string, "Data", Dom[domid][hData_DD]);
		dini_FloatSet(string, "Wej_X", Dom[domid][hWej_X]);
		dini_FloatSet(string, "Wej_Y", Dom[domid][hWej_Y]);
		dini_FloatSet(string, "Wej_Z", Dom[domid][hWej_Z]);
		dini_FloatSet(string, "Int_X", Dom[domid][hInt_X]);
		dini_FloatSet(string, "Int_Y", Dom[domid][hInt_Y]);
		dini_FloatSet(string, "Int_Z", Dom[domid][hInt_Z]);
		dini_IntSet(string, "Interior", Dom[domid][hInterior]);
		dini_IntSet(string, "Parcela", Dom[domid][hParcela]);
		dini_IntSet(string, "VirtualWorld", Dom[domid][hVW]);
		//format(GeT, sizeof(GeT), "%s", dini_Get(string, "Tekst_3D"));
		//Dom[domid][h3D_txt] = GeT;
		//hK_3D,
		dini_IntSet(string, "Oswietlenie", Dom[domid][hSwiatlo]);
		dini_IntSet(string, "Pokoje", Dom[domid][hPokoje]);
		dini_IntSet(string, "Pokoi_Dowynajecia", Dom[domid][hPDW]);
		dini_IntSet(string, "Pokoi_Wynajmowanych", Dom[domid][hPW]);
		dini_Set(string, "Lokator1", Dom[domid][hL1]);
		dini_Set(string, "Lokator2", Dom[domid][hL2]);
		dini_Set(string, "Lokator3", Dom[domid][hL3]);
		dini_Set(string, "Lokator4", Dom[domid][hL4]);
		dini_Set(string, "Lokator5", Dom[domid][hL5]);
		dini_Set(string, "Lokator6", Dom[domid][hL6]);
		dini_Set(string, "Lokator7", Dom[domid][hL7]);
		dini_Set(string, "Lokator8", Dom[domid][hL8]);
		dini_Set(string, "Lokator9", Dom[domid][hL9]);
		dini_Set(string, "Lokator10", Dom[domid][hL10]);
		dini_IntSet(string, "Wynajmowanie", Dom[domid][hWynajem]);
		dini_IntSet(string, "CenaWynajmu", Dom[domid][hCenaWynajmu]);
		dini_IntSet(string, "KomunikatDomowy", Dom[domid][hKomunikatDomowy]);
		dini_IntSet(string, "Uprawnienia_Lokatorow_Zamek", Dom[domid][hUL_Z]);
		dini_IntSet(string, "Uprawnienia_Lokatorow_Dodatki", Dom[domid][hUL_D]);
		dini_IntSet(string, "Warunek_Wynajmu", Dom[domid][hWW]);
  		dini_IntSet(string, "Tryb_WW", Dom[domid][hTWW]);
		dini_IntSet(string, "Apteczka", Dom[domid][hApteczka]);
		dini_IntSet(string, "Kamizelka", Dom[domid][hKami]);
		dini_IntSet(string, "Sejf", Dom[domid][hSejf]);
		dini_Set(string, "Kod_Do_Sejfu", Dom[domid][hKodSejf]);
		dini_IntSet(string, "Zbrojownia", Dom[domid][hZbrojownia]);
		dini_IntSet(string, "Garaz", Dom[domid][hGaraz]);
		dini_IntSet(string, "Ladowisko", Dom[domid][hLadowisko]);
		dini_IntSet(string, "Alarm", Dom[domid][hAlarm]);
	 	dini_IntSet(string, "Zamek_Dodatkowy", Dom[domid][hZamekD]);
		dini_IntSet(string, "Komputer", Dom[domid][hKomputer]);
		dini_IntSet(string, "Sprzet_RTV", Dom[domid][hRTV]);
		dini_IntSet(string, "Zestaw_Hazardowy", Dom[domid][hHazard]);
		dini_IntSet(string, "Szafa", Dom[domid][hSzafa]);
		dini_IntSet(string, "Tajemniczy_Dodatek", Dom[domid][hTajemnicze]);
		dini_IntSet(string, "S_kasa", Dom[domid][hS_kasa]);
		dini_IntSet(string, "S_mats", Dom[domid][hS_mats]);
		dini_IntSet(string, "S_ziolo", Dom[domid][hS_ziolo]);
		dini_IntSet(string, "S_drugs", Dom[domid][hS_drugs]);
		dini_IntSet(string, "S_PG1", Dom[domid][hS_PG1]);
		dini_IntSet(string, "S_PG2", Dom[domid][hS_PG2]);
		dini_IntSet(string, "S_PG3", Dom[domid][hS_PG3]);
		dini_IntSet(string, "S_PG4", Dom[domid][hS_PG4]);
		dini_IntSet(string, "S_PG5", Dom[domid][hS_PG5]);
		dini_IntSet(string, "S_PG6", Dom[domid][hS_PG6]);
		dini_IntSet(string, "S_PG7", Dom[domid][hS_PG7]);
		dini_IntSet(string, "S_PG8", Dom[domid][hS_PG8]);
		dini_IntSet(string, "S_PG9", Dom[domid][hS_PG9]);
		dini_IntSet(string, "S_PG10", Dom[domid][hS_PG10]);
		dini_IntSet(string, "S_PG11", Dom[domid][hS_PG11]);
		dini_IntSet(string, "S_G0", Dom[domid][hS_G0]);
		dini_IntSet(string, "S_G1", Dom[domid][hS_G1]);
		dini_IntSet(string, "S_G2", Dom[domid][hS_G2]);
		dini_IntSet(string, "S_G3", Dom[domid][hS_G3]);
		dini_IntSet(string, "S_G4", Dom[domid][hS_G4]);
		dini_IntSet(string, "S_G5", Dom[domid][hS_G5]);
		dini_IntSet(string, "S_G6", Dom[domid][hS_G6]);
		dini_IntSet(string, "S_G7", Dom[domid][hS_G7]);
		dini_IntSet(string, "S_G8", Dom[domid][hS_G8]);
		dini_IntSet(string, "S_G9", Dom[domid][hS_G9]);
		dini_IntSet(string, "S_G10", Dom[domid][hS_G10]);
		dini_IntSet(string, "S_G11", Dom[domid][hS_G11]);
		dini_IntSet(string, "S_A1", Dom[domid][hS_A1]);
		dini_IntSet(string, "S_A2", Dom[domid][hS_A2]);
		dini_IntSet(string, "S_A3", Dom[domid][hS_A3]);
		dini_IntSet(string, "S_A4", Dom[domid][hS_A4]);
		dini_IntSet(string, "S_A5", Dom[domid][hS_A5]);
		dini_IntSet(string, "S_A6", Dom[domid][hS_A6]);
		dini_IntSet(string, "S_A7", Dom[domid][hS_A7]);
		dini_IntSet(string, "S_A8", Dom[domid][hS_A8]);
		dini_IntSet(string, "S_A9", Dom[domid][hS_A9]);
		dini_IntSet(string, "S_A10", Dom[domid][hS_A10]);
		dini_IntSet(string, "S_A11", Dom[domid][hS_A11]);
    }
	return 1;
}
