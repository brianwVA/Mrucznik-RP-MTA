//nowe_obiekty.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//--------------------------------------[ Obiekty: nowe_obiekty.pwn ]----------------------------------------//
//Opis: NOWE OBIEKTY - TWORZONE W NOWYM FORMACIE
/*

	Plik zawierajacy dolaczenia wszystkich obiekt�w w nowym formacie

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

#define SetDynamicObjectMaterialText_Kolejnosc(%0,%1,%2,%3,%4,%5,%6,%7,%8,%9) SetDynamicObjectMaterialText(%0,%2,%1,%3,%4,%5,%6,%7,%8,%9)

//-----------------<[ Include: ]>-------------------

//#include "nowe/PowerGym/powergym.pwn"
#include "obiekty_zmienne.pwn"

#include "nowe/Bank/bank.pwn"

#include "nowe\DMV\DMV.pwn"
#include "nowe\FBI\FBI.pwn"
//#include "nowe\GSA\centralaGSA.pwn" //TODO: Rozdziel
#include "nowe\Globalne\ObiektyCiekawostki\obiektyCiekawostki.pwn"
#include "nowe\Globalne\PoprawkiRockstar\poprawkiRockstar.pwn"
//	#include "nowe\NG\bazaNG.pwn"  //TODO: Rozdziel
#include "nowe\GlobalneLS\Pomnik\pomnik.pwn" 
#include "nowe\GlobalneLS\SkracaneZakrety\skracaneZakrety.pwn" 
#include "nowe\GlobalneLS\ZnakiUpiekszenia\znakiUpiekszenia.pwn" 
#include "nowe\GlobalneLS\lslot\lslot.pwn"
#include "nowe\CentrumRozrywkiLS\centrumRozrywkiLS.pwn" 
#include "nowe\GlobalneLV\lv.pwn"
#include "nowe\GunShop\gunShop.pwn" 
//#include "nowe\ParkingObokSzpitala\parkingObokSzpitala.pwn"
#include "nowe\MountChiliad\mountChiliad.pwn" 
#include "nowe\MoneyMakers\moneyMakers.pwn" 
#include "nowe\LowFolow\lowFolow.pwn" 
#include "nowe\KomisariatLS\komisariatLS.pwn" 

//*****************************************************
//Aktualizacja 2.5.84- By Simeone
//*****************************************************
#include "nowe\przes\pub\pub.pwn"
#include "nowe\rondo\rondo.pwn"
#include "nowe\GlobalneLS\chinatown\chinatown.pwn"
//#include "nowe\GlobalneLS\molo\molo.pwn"
#include "nowe\przes\Ocult\ocult.pwn"
#include "nowe\GlobalneLS\syskanalow\wej1\kanal.pwn"
#include "nowe\GlobalneLS\syskanalow\wej1\norakan\miesko.pwn"
#include "nowe\cjgirl\cjgirl.pwn"
//#include "nowe\LSMC\lsmc.pwn"
#include "nowe\LSMC_New\lsmc_new.pwn"
#include "nowe\opdlaorg\StacjaMont\stam.pwn"
#include "nowe\SanVanInterior\sanVanInterior.pwn"

//------------------------------

//#include "nowe\Pizzernia idle\pizza.pwn"
//#include "nowe\centralbank\bank.pwn"
#include "nowe\GlobalneLS\stacja_paliw_idle\sidle.pwn"
//#include "nowe\Pizzernia idle\intpidle.pwn"
#include "nowe\GlobalneLS\inttv.pwn"
#include "nowe\autobusinterior\autobusint.pwn"
#include "nowe\enforcerint\enforcerint.pwn"

//*****************************************************
//Aktualizacja 2.5.84 - dodatki
//*****************************************************
#include "nowe\HouseInteriorWOSP\houseInteriorWOSP.pwn"

//*****************************************************
//Aktualizacja 2.5.93 - By Simeone
//*****************************************************
#include "nowe\hitman\hitmans.pwn"
#include "nowe\DMV\intekdmv.pwn"
#include "nowe\ramirezaservice\ramirezext.pwn"
#include "nowe\dscs\dscs.pwn"
#include "nowe\hellsangelsmc\hamc.pwn"
#include "nowe\ramirezaservice\ramirezint.pwn"
#include "nowe\GlobalneLS\banklsext.pwn"
#include "nowe\GunShop\gunshopls.pwn"

#include "nowe\DMV\DMV_bramyplac.pwn"

//*****************************************************
//Aktualizacja 2.5.94 - By Simeone
//*****************************************************
#include "nowe\wps\wpsext.pwn"
#include "nowe\DMV\DMV_exteriorpc.pwn"
#include "nowe\SASD/interior.pwn"
#include "nowe\Dillimore\GunShop/interior.pwn"
#include "nowe\SASD/exterior.pwn"
#include "nowe\coffeshopls/interior.pwn"
#include "nowe\chinesefood/interior.pwn"
#include "nowe\KomisariatLS/interior.pwn"
#include "nowe\Globalne\magazynsol/interior.pwn"
//#include "nowe\dualgate\duale.pwn"//Potrzebne do skryptu na dual-gate
#include "nowe\FBI/interior.pwn"
#include "nowe\wps/interior.pwn"
#include "nowe\Globalne\interiorypojazdow\pociag.pwn"

//*****************************************************
//Aktualizacja 2.6 - By Simeone & Sergio & deduir
//*****************************************************
#include "nowe\Globalne\bankomaty.pwn"
#include "nowe\BialyDom/exterior.pwn"
#include "nowe\basen/interior.pwn"
#include "nowe\basen/exterior.pwn"
#include "nowe\Globalne\biznesy\biznesy_obj.pwn"
#include "nowe\inne_skrypt/wejscia.pwn"
#include "nowe\StripClub\stripclub.pwn"
//#include "nowe\SanNews\exteriorSN.pwn"
#include "nowe\BarKacpra\bar.pwn"
#include "nowe\ElPueblo/pueint.pwn"
#include "nowe\ElPueblo/pueext.pwn"
#include "nowe\MelinaIdle/exterior.pwn"
#include "nowe\SanNews/ScenaSASC.pwn"
#include "nowe\MelinaIdle/interior.pwn"
#include "nowe\StudioNagran/interior.pwn"
#include "nowe\StudioNagran/exterior.pwn"

//*****************************************************
//Aktualizacja 2.6.03 - By Simeone 
//*****************************************************
//#include "nowe\SanNews/interiorSN.pwn"
#include "nowe\Sad/interiorSCOSA.pwn"
#include "nowe\SanNews/interiorVINYL.pwn"
#include "nowe\SanNews/mma-event.pwn"

//*****************************************************
//Aktualizacja 2.6.1 - By Simeone & skPembleton
//*****************************************************
#include "nowe\MelinaLasColinas/interior.pwn"
#include "nowe\TheRealIra/interiorira.pwn"
#include "nowe\MonsterGarage/monsterint.pwn"
//#include "nowe\stanowe\stanoweint.pwn"
//#include "nowe\stanowe\stanoweext.pwn"
#include "nowe\USSS/usssext.pwn"
#include "nowe\USSS/usssint.pwn"
#include "nowe\WestEagle/eaglewest.pwn"
#include "nowe\FirmaBudowlana/firmab.pwn"
#include "nowe\Ibiza/ibiza.pwn"
//#include "nowe\PowerGym/powergym.pwn"
#include "nowe\AmmunationWillowfield/ammunationw.pwn"
#include "nowe\Octagon/octagon.pwn"

//*****************************************************
//Aktualizacja 2.6.14 - By Creative & skPembleton
//*****************************************************
#include "nowe\KorporacjaTransportowa\ktext.pwn"
#include "nowe\KorporacjaTransportowa\ktint.pwn"
//*****************************************************
//Aktualizacja 2.6.15 - By Creative & skPembleton
//*****************************************************
#include "nowe\Piwnica/piwnica.pwn"
//*****************************************************
//Aktualizacja 2.6.18 - By Sanda� & Rozalka(deduir)
//*****************************************************
#include "nowe\sekta/interior.pwn"
//*****************************************************
//Aktualizacja 2.6.19 - By Sanda� & Kvbu�
//*****************************************************
#include "nowe\GoldenPalms/interior.pwn"
#include "nowe\GoldenPalms/exterior.pwn"
//*****************************************************
//Aktualizacja 2.7.4 - By Sanda� & Chlor
//*****************************************************
#include "nowe\Dillimore\farma/exterior.pwn"
// Wadliwe obiekty GTA SA (usuni�te na zawsze)
#include "nowe\Globalne/wadliwe_obiekty/wadliwe_obiekty.pwn"
//Dildos Club
#include "nowe\DildosClub\DildosClub.pwn"
//SASC2020
#include "nowe\SASC2020\SASC2020.pwn"

//*****************************************************
//Aktualizacja 2.7.7
//*****************************************************
#include "nowe\ISISObjects\ISISObjects.pwn"
#include "nowe\AmmuNationCommerce/ammuNationCommerce.pwn"

#include "nowe\sa_bahamas/sa_bahamas.pwn"
#include "nowe\bar_HA/bar_HA.pwn"

#include "nowe\julia_dom1\julia_dom1.pwn"
#include "nowe\julia_dom2\julia_dom2.pwn"
#include "nowe\julia_dom3\julia_dom3.pwn"
#include "nowe\julia_dom4\julia_dom4.pwn"
#include "nowe\julia_dom5\julia_dom5.pwn"
#include "nowe\julia_dom6\julia_dom6.pwn"
//#include "nowe\villa_Jensena\villa_Jensena.pwn"
//*****************************************************
//Porz�dki
//*****************************************************
#include "nowe\ZniszczoneStudioTatuazu\ZniszczoneStudioTatuazu.pwn"
#include "nowe\ZajezdniaCommerce\ZajezdniaCommerce.pwn"
#include "nowe\Yakuza\Yakuza.pwn"
#include "nowe\WyspaAdminow\WyspaAdminow.pwn"
#include "nowe\WarsztatRSC\WarsztatRSC.pwn"
#include "nowe\WarsztatGanton\WarsztatGanton.pwn"
#include "nowe\WarsztatFDU\WarsztatFDU.pwn"
#include "nowe\WarsztatCywilny\WarsztatCywilny.pwn"
#include "nowe\VicaForelli\VicaForelli.pwn"
#include "nowe\VeronalMall\VeronalMall.pwn"
#include "nowe\Vagos\Vagos.pwn"
#include "nowe\TorZuzlowy\TorZuzlowy.pwn"
#include "nowe\Statek\Statek.pwn"
#include "nowe\StaryBasen\StaryBasen.pwn"
#include "nowe\StaryBank\StaryBank.pwn"
#include "nowe\StareSAN\StareSAN.pwn"
#include "nowe\StareNationalGuard\StareNationalGuard.pwn"
#include "nowe\StareLSPD\StareLSPD.pwn"
//#include "nowe\StareLSMCS\StareLSMCS.pwn"
#include "nowe\Samolot\Samolot.pwn"
#include "nowe\SalaPrzesluchan\SalaPrzesluchan.pwn"
#include "nowe\RockHotel\RockHotel.pwn"
#include "nowe\Ristorante\Ristorante.pwn"
#include "nowe\PrzystankiAutobusowe\PrzystankiAutobusowe.pwn"
#include "nowe\Plantacja\Plantacja.pwn"
#include "nowe\PalominoCreek\PalominoCreek.pwn"
#include "nowe\ObiektyPrzyczepy\ObiektyPrzyczepy.pwn"
#include "nowe\ObiektyDillimore\ObiektyDillimore.pwn"
#include "nowe\MrucznikTower\MrucznikTower.pwn"
#include "nowe\MonopolowyLasColinas\MonopolowyLasColinas.pwn"
#include "nowe\MoloBK\MoloBK.pwn"
#include "nowe\LSFD\LSFD.pwn"
#include "nowe\Lotniska\Lotniska.pwn"
#include "nowe\Limuzyna\Limuzyna.pwn"
#include "nowe\Kosciol\Kosciol.pwn"
#include "nowe\Kasyno\Kasyno.pwn"
#include "nowe\JettyLounge\JettyLounge.pwn"
#include "nowe\InteriorKaretki\InteriorKaretki.pwn"
#include "nowe\InteriorBallas\InteriorBallas.pwn"
#include "nowe\HitmanAgency\HitmanAgency.pwn"
//#include "nowe\GroveStreet\GroveStreet.pwn"
#include "nowe\FabrykaBroni\FabrykaBroni.pwn"
/*#include "nowe\DomVerte\DomVerte.pwn"
#include "nowe\DomSejciak\DomSejciak.pwn"
#include "nowe\DomSaula\DomSaula.pwn"*/
#include "nowe\Commerce247\Commerce247.pwn"
#include "nowe\BudynekSadu\BudynekSadu.pwn"
#include "nowe\BiuroTFATF\BiuroTFATF.pwn"
#include "nowe\BazaMechanikow\BazaMechanikow.pwn"
#include "nowe\BazaBOR\BazaBOR.pwn"
#include "nowe\BaySide\BaySide.pwn"
#include "nowe\BarierkiIBlokady\BarierkiIBlokady.pwn"
#include "nowe\Bar19\Bar19.pwn"
#include "nowe\Bankomaty\Bankomaty.pwn"
#include "nowe\AkademiaLSPD\AkademiaLSPD.pwn"
#include "nowe\Alhambra\Alhambra.pwn"
#include "nowe\AdminJail\AdminJail.pwn"

//*****************************************************
//Aktualizacja 2.7.8
//*****************************************************
/*#include "nowe\LilkaDomLV\LilkaDomLV.pwn"
#include "nowe\ClintonDomLS\ClintonDomLS.pwn"
#include "nowe\ElCoronaAztecasOP\ElCoronaAztecasOP.pwn"*/
#include "nowe\rafineriaLV/interior.pwn"
#include "nowe\rafineriaLV/exterior.pwn"
/*#include "nowe\GlobalneLV/pustynialotnisko.pwn"
#include "nowe\Globalne\op_domow/Sandal197.pwn"
#include "nowe\Globalne\op_domow/West326.pwn"
#include "nowe\Globalne\op_domow/Twite997.pwn"
#include "nowe\Globalne\op_domow/Verone1783.pwn"
#include "nowe\Globalne\op_domow/Konio1838.pwn"
#include "nowe\Globalne\op_domow/Pikus1929.pwn"
#include "nowe\Globalne\op_domow/WestLV1335.pwn"
#include "nowe\Globalne\op_domow/Miko1930.pwn"
#include "nowe\Globalne\op_domow/Dudson1895.pwn"
#include "nowe\Globalne\op_domow/Kamil1125.pwn"*/
#include "nowe\PlazaLS/PlazaLS.pwn"

//*****************************************************
//Aktualizacja 2.7.10
//*****************************************************
/*#include "nowe\opBarman/opBarman.pwn"
#include "nowe\opDaniel/opDaniel.pwn"
#include "nowe\opMarkSmith/opMarkSmith.pwn"
#include "nowe\BramaJackVega/BramaJackVega.pwn"
#include "nowe\opSelect/opSelect.pwn"
#include "nowe\opDarki/opDarki.pwn"
#include "nowe\BramyTelehamy/BramyTelehamy.pwn"
#include "nowe\OPdlaRafalka/OPdlaRafalka.pwn"*/

//*****************************************************
//Aktualizacja 2.7.11
//*****************************************************
/*#include "nowe\opWayneSkolds/opWayneSkolds.pwn"
#include "nowe\opLuizPuccinii/opLuizPuccinii.pwn"
#include "nowe\OPSzklany/OPSzklany.pwn"
#include "nowe\opWojtus/opWojtus.pwn"
#include "nowe\opWilliam/opWilliam.pwn"
#include "nowe\opPatryq/opPatryq.pwn"
#include "nowe\opBeryl/opBeryl.pwn"
#include "nowe\opWashington/opWashington.pwn"
#include "nowe\opSteven/opSteven.pwn"
#include "nowe\opCzolgista/opCzolgista.pwn"*/

//*****************************************************
//Aktualizacja 2.7.12
//*****************************************************
/*#include "nowe\ParkSzpital/ParkSzpital.pwn"
#include "nowe\opDarkiRichman/opDarkiRichman.pwn"
#include "nowe\opPeter/opPeter.pwn"
#include "nowe\CinemaCar/CinemaCar.pwn"
#include "nowe\BramaVandet/BramaVandet.pwn"
#include "nowe\opTreylo/opTreylo.pwn"
#include "nowe\opJeffMatson/opJeffMatson.pwn"
#include "nowe\opFuBu/opFuBu.pwn"*/


#include "nowe\MotelIdlewood\MotelIdlewood.pwn"
#include "nowe\BazaNG\BazaNG.pwn"
#include "nowe\NowaYakuza\NowaYakuza.pwn"
#include "nowe\SousseKebab\soussekebab.pwn"
//#include "nowe\BiuroOchronyMola\bom.pwn"
/*#include "nowe\SASC2021/interior.pwn"
#include "nowe\SASC2021/exterior.pwn"*/
#include "nowe\Camorra\camorra.pwn"
#include "nowe\SicarioCultura/sicariocultura.pwn"
#include "nowe\SicarioCultura/apart.pwn"
#include "nowe\SicarioCultura/klubmafijny.pwn"
#include "nowe\TrailerParkBoys\trailerparkboys.pwn"
#include "nowe\SicarioCultura/sicarioexterior.pwn"
#include "nowe\SicarioCultura/gunshopgta5.pwn"
//#include "nowe\SicarioCultura/familiada.pwn"


//*****************************************************
//                MODELE 3D
//*****************************************************
#include "nowe\Modele3D/Modele3D.pwn" 

#include "nowe\IdlewoodGhetto/IdlewoodGhetto.pwn" 
//*****************************************************
//                2.1.1
//*****************************************************
#include "nowe\Eventy/eventy.pwn"

#include "nowe/KotnikStation/KotnikStation.pwn"
#include "nowe/CityHall/CityHall.pwn"
#include "nowe/VeronaMall/VeronaMall.pwn"

//-----------------<[ Funkcje: ]>-------------------
obiekty_OnGameModeInit()
{
	//VeronaMall();
	//exampleObjects_Init();
	//template_Init();
	
	bank_Init();
	postawLawke0k();

//	radaMiasta_Init();
//	barierkiDillimore_Init();
	//DMV_Init();
	FBI_Init();
	//centralaGSA_Init();
	//obiektyCiekawostki_Init();
	poprawkiRockstar_Init();
	//bazaNG_Init();
	//pomnik_Init()
	//skracaneZakrety_Init();
	//znakiUpiekszenia_Init();
	//centrumRozrywkiLS_Init();
	gunShop_Init();
	//parkingObokSzpitala_Init();
	//mountChiliad_Init();
	//moneyMakers_Init();
	lowFolow_Init();
	komisariatLS_Init();
	//centralBank_Init();
	//idleop_Init();
	
	rondo_Init();
	//chinatown_Init();
	//pub_Init();//PUB
	//ocult_Init();
	//molo_Init();
	//satan_Init();
	//miesko_Init();
	//kasia_Init();
	opmont_Init();
	sanVanInterior_Init();
	//houseInteriorWOSP_Init();
	//bank_Init();
	sidle_Init();
	lslot_Init();
	//intpidle_Init();
	inttv_Init();
	//autobusint_Init();
	//enforcer_Init();
	//LSMC_Init();
	LSMC_New_Init();
	hitmans_Init();
	ChangeLSMCElevatorState();
	//intSN_Init(); 
	interiorSCOSA_Init();
	interiorVINYL_Init(); 
	MelinaLasColinas_Init();
	ammuNationCommerce_Init();

	//lv_Init();
	intekdmv_Init();//INTERIOR DMV
	ramirezext_Init();//RAMIREZ CAR SERVICE EXTERIOR
	dossantos_Init();//Dos Santos Car Service interior
	hamcint_Init();//Hells Angels MC
	ramirezint_Init();//RAMIREZ CAR SERVICE
	//banklsext_Init();//Bariekrki przed bankiem LS
	gunshopls_Init();//GS LS
	carinterior_Init();
	carexterior_Init();
	bramydmvext_Init();//Bramy DMV (?) 
	wpsext_Init();//WPS
	//pcexterior_Init();//DMV w PC
	//inteksasd_Init();//Interior SASD w PC
	//gsdiliinterior_Init();//GunShop Dillimore
	//extsasd_Init();//Exterior SASD w PC
	coffeeshop_Init();//Coffee Shop Los Santos
	chinskiejedzenie_Init();//Chinese food
	interiorpolicedepartment_Init();//PD LS
	//magazynsol_Init();//Magazyn Solarin 
	fbiintek_Init();//Interior FBI
	wpsint_Init();//Interior WPS
	interiorpociagu_Init();//interior pociagu
	bankomaty_Init();//Obiekty bankomat�w na SA
	//WhiteHouseExt_Init();//Exterior bia�ego domu
	basenint_Init();//interior basenu
	basenext_Init();//exteriorbasenu
	//DildosClub_Init();//Dildos Club
	SASC2020_Init();//SASC2020
	biznesy_Init();
	wejsciaSkrypt_Init();
	stripclub_Init();
	//extSN_Init();
	//intBarKacpra_Init();//Bar u Kacpra
	MelinaIdle_Init();//Melina na Idlewood - przy domie big smoke, exterior
	ScenaSASC_Init();
	StudioIdle_Init();//studio nagran idlewood, interior
	MelinaIdleint_Init();//Melina na Idlewood - przy domie big smoke, interior
	StudioIdleext_Init();//studio nagran idlewood, exterior
	mmaevent_Init(); 
	realIra_Init();
	monster_Init();
	//stanoweEXT_Init();
	//stanoweINT_Init(); 
	usss_Init();
	usssext_Init();
	westeagle_Init();
	firmab_Init();
	ibizamrn_Init();
	interiorSEKTA_Init();
	GoldenPalms_Init();
	GoldenPalmsExterior_Init();
	//powergym_Init();
	ammuwill_Init();
	octagon_Init();
	ktext_Init();
	ktint_Init();
	piwnica_Init();
	farmadillmore_Init();
//	rahim1_Init();
	ISISObjects_Init();

	sa_bahamas_Init();
	bar_HA_Init();

	//domy julii
	/*julia_dom1_Init();
	//julia_dom2_Init();
	julia_dom3_Init();
	julia_dom4_Init();
	julia_dom5_Init();
	julia_dom6_Init();
	//villa_Jensena_Init();
	*/
	//Porz�dki:
	ZniszczoneStudioTatuazu_Init();
	ZajezdniaCommerce_Init();
	Yakuza_Init();
	WyspaAdminow_Init();
	WarsztatRSC_Init();
	WarsztatGanton_Init();
	WarsztatFDU_Init();
	WarsztatCywilny_Init();
	VicaForelli_Init();
	VeronalMall_Init();
	Vagos_Init();
	TorZuzlowy_Init();
	Statek_Init();
	StaryBasen_Init();
	StaryBank_Init();
	StareSAN_Init();
	StareNationalGuard_Init();
	StareLSPD_Init();
	//StareLSMCS_Init();
	Samolot_Init();
	SalaPrzesluchan_Init();
	RockHotel_Init();
	Ristorante_Init();
	PrzystankiAutobusowe_Init();
	Plantacja_Init();
	PalominoCreek_Init();
	ObiektyPrzyczepy_Init();
	ObiektyDillimore_Init();
	//MrucznikTower_Init();
	MonopolowyLasColinas_Init();
	MoloBK_Init();
	//LSFD_Init();
	Lotniska_Init();
	Limuzyna_Init();
	Kosciol_Init();
	Kasyno_Init();
	JettyLounge_Init();
	InteriorKaretki_Init();
	InteriorBallas_Init();
	HitmanAgency_Init();
	//GroveStreet_Init();
	FabrykaBroni_Init();
	//DomVerte_Init();
	//DomSejciak_Init();
	//DomSaula_Init();
	Commerce247_Init();
	BudynekSadu_Init();
	BiuroTFATF_Init();
	BazaMechanikow_Init();
	BazaBOR_Init();
	BaySide_Init();
	//BarierkiIBlokady_Init();
	Bar19_Init();
	Bankomaty_Init();
	AkademiaLSPD_Init();
	Alhambra_Init();
	AdminJail_Init();
	/*LilkaDomLV_Init();
	ClintonDomLS_Init();*/
	//ElCoronaAztecasOP_Init();
	//rafineriaLVext_Init();
	//rafineriaLVint_Init();
	//lvlotnisko_Init();
	/*domid197_Init();
    domid326_Init();
    domid997_Init();
    domid1783_Init();
    domid1838_Init();
    domid1929_Init();
	domid1335_Init();
	domid1930_Init();
	dom1895_Init();
	dom1125_Init();*/
	//PlazaLS_Init();
	/*opBarman_Init();
	opDaniel_Init();
	opMarkSmith_Init();
	BramaJackVega_Init();
	opSelect_Init();
	opDarki_Init();
	BramyTelehamy_Init();
	OPdlaRafalka_Init();
	opWayneSkolds_Init();
	opLuizPuccinii_Init();
	OPSzklany_Init();
	opWojtus_Init();
	opWilliam_Init();
	opPatryq_Init();
	opBeryl_Init();
	opWashington_Init();
	opSteven_Init();
	opCzolgista_Init();
	ParkSzpital_Init();
	opDarkiRichman_Init();
	opPeter_Init();
	CinemaCar_Init();
	BramaVandet_Init();
	opTreylo_Init();
	opJeffMatson_Init();
	opFuBu_Init();*/
	BazaNG_Init();
	MotelIdlewood_Init();
	NowaYakuza_Init();
	soussekebabtrix_Init();
	//BOM_Init();
	/*sasc2021interior_Init();
	sasc2021exterior_Init();*/
	camorra_Init();
	SicarioCultura_Init();
	apart_Init();
	klubmafijny_Init();
	trailerparkboys_Init();
	SicarioExterior_Init();
	gunshopgta5_Init(); // maly gs
	CityHall_init();
	//familiada_Init();
	
	//deniu_dom1_Init();
	//deniu_dom2_Init();
	eventy_Init();

	Modele3D_Init();
	IdlewoodGhetto_Init();

	MrucznikStation_Init();

	//OLD
	ZaladujBramy();
	return 1;
}

obiekty_OnPlayerConnect(playerid)
{
	IdlewoodGhetto_Connect(playerid);
	Modele3D_Connect(playerid);
	//powergym_Connect(playerid);

	//exampleObjects_Connect(playerid);
	//template_Connect(playerid);
	
	//centralBank_Connect(playerid);
//	radaMiasta_Connect(playerid);
	//DMV_Connect(playerid);
	//centralaGSA_Connect(playerid);
	//bazaNG_Connect(playerid);
	pomnik_Connect(playerid);
	skracaneZakrety_Connect(playerid);
	//znakiUpiekszenia_Connect(playerid);
	mountChiliad_Connect(playerid);
	komisariatLS_Connect(playerid);
	//parkingObokSzpitala_Connect(playerid);
	
	pub_Connect(playerid);
	rondo_Connect(playerid);
	//molo_Connect(playerid);
	kasia_Connect(playerid);
	opmont_Connect(playerid);
	//idleop_Connect(playerid);
	sidle_Connect(playerid);
	ammuNationCommerce_Connect(playerid);
	lv_Connect(playerid);
//	rahim1_Connect(playerid);
	
	pcexterior_Connect(playerid);//exterior urzedu w pc
	extsasd_Connect(playerid);//exterior sasd
	coffeshop_Connect(playerid);//Coffe shop
	chinskiejedzenie_Connect(playerid);//Chinese food
	wpsint_Connect(playerid);//Interior WPS
	WhiteHouseExt_Connect(playerid);//Extterior bia�ego domu
	basen_Connect(playerid);//basen
	FBIPARKING_Connect(playerid);
	carniceria_Connect(playerid);//interior el pueblo
	MelinaLasColinas_Connect(playerid);
	monster_Connect(playerid);
	//stanoweINT_Connect(playerid);  
	usss_Connect(playerid);
	westeagle_Connect(playerid);
	firmab_Connect(playerid);
	//powergym_Connect(playerid);
	ktext_Connect(playerid);
	ktint_Connect(playerid);
	WadliweObiekty_Connect(playerid);
	sa_bahamas_Connect(playerid);

	//porz�dki
	Vagos_Connect(playerid);
	VeronalMall_Connect(playerid);
	interiorSCOSA_Connect(playerid);
	BazaMechanikow_Connect(playerid);
	//DomSejciak_Connect(playerid);
	//LSMC_Connect(playerid);
	LSMC_New_Connect(playerid);
	ObiektyDillimore_Connect(playerid);
	julia_dom1_Connect(playerid);
	julia_dom2_Connect(playerid);
	julia_dom3_Connect(playerid);
	julia_dom4_Connect(playerid);
	julia_dom5_Connect(playerid);
	julia_dom6_Connect(playerid);
	//villa_Jensena_Connect(playerid);
    /*domid326_Connect(playerid);
	domid1783_Connect(playerid);
	domid1930_Connect(playerid);
	domid1335_Connect(playerid);
	domid1929_Connect(playerid);
	dom1895_OnPlayerConnect(playerid);
	dom1125_OnPlayerConnect(playerid);
	ClintonDomLS_Connect(playerid);*/
	//lvlotnisko_Connect(playerid);
	gunshopls_OnPlayerConnect(playerid);
	/*opDaniel_Connect(playerid);
	opSelect_Connect(playerid);
	BramyTelehamy_Connect(playerid);
	OPdlaRafalka_Connect(playerid);
	opWayneSkolds_Connect(playerid);
	opLuizPuccinii_Connect(playerid);
	OPSzklany_Connect(playerid);
	opWojtus_Connect(playerid);
	opWilliam_Connect(playerid);
	opBeryl_Connect(playerid);
	Konio1838_Connect(playerid);
	opWashington_Connect(playerid);
	opCzolgista_Connect(playerid);
	ParkSzpital_Connect(playerid);
	opPeter_Connect(playerid);
	CinemaCar_Connect(playerid);
	opTreylo_Connect(playerid);
	opJeffMatson_Connect(playerid);
	opFuBu_Connect(playerid);*/
	BazaNG_Connect(playerid);
	NowaYakuza_Connect(playerid);
	//soussekebabtrix_Connect(playerid);
	//intpidle_Connect(playerid);

	//deniu_dom1_Connect(playerid);
	//deniu_dom2_Connect(playerid);
	eventy_Connect(playerid);

	MrucznikStation_Connect(playerid);
	// OLD
    //Trucker job
    RemoveBuildingForPlayer(playerid, 5464, 1902.4297, -1309.5391, 29.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 3573, 1798.6484, -2057.9141, 14.9844, 0.25);
    //K.A.C.C LV bramy
    RemoveBuildingForPlayer(playerid, 985, 2497.4063, 2777.0703, 11.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 986, 2497.4063, 2769.1094, 11.5313, 0.25);

    RemoveBuildingForPlayer(playerid, 13024, -87.3047, -347.5000, 3.1719, 0.25); //HA
	RemoveBuildingForPlayer(playerid, 12932, -117.9609, -337.4531, 3.6172, 0.25); //HA
    

    //Vinyl
    RemoveBuildingForPlayer(playerid, 1297, 828.7656, -1390.1172, 15.6406, 0.25);
    RemoveBuildingForPlayer(playerid, 1462, 826.8516, -1385.6719, 12.5078, 0.25);
    RemoveBuildingForPlayer(playerid, 1307, 807.0313, -1363.7344, 12.7813, 0.25);
    RemoveBuildingForPlayer(playerid, 6003, 954.6875, -1305.7734, 30.1406, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 875.0469, -1383.4766, 28.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 868.7656, -1390.1172, 15.6406, 0.25);
    RemoveBuildingForPlayer(playerid, 5817, 848.8594, -1370.4297, 17.7969, 0.25);
    RemoveBuildingForPlayer(playerid, 1440, 857.3750, -1381.1641, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 1365, 861.9844, -1380.4609, 13.6250, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 875.0469, -1383.4766, 28.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1462, 853.1953, -1359.7266, 12.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 1635, 860.9141, -1359.8047, 16.0859, 0.25);
    RemoveBuildingForPlayer(playerid, 5818, 954.6875, -1305.7734, 30.1406, 0.25);

    //BILBORD
	RemoveBuildingForPlayer(playerid, 4239, 1407.9063, -1407.3984, 33.9844, 0.25);
	//DOM EK
	RemoveBuildingForPlayer(playerid, 691, 375.6094, -1285.7500, 43.3281, 0.25);
	//FBI
    RemoveBuildingForPlayer(playerid, 1529, 583.4609, -1502.1094, 16.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1215, 616.7656, -1495.7734, 14.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 1215, 616.7656, -1492.0313, 14.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 1215, 616.7656, -1488.4766, 14.3203, 0.25);
	//Fire
	RemoveBuildingForPlayer(playerid, 717, 1703.9922, -1150.1484, 23.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 717, 1721.2344, -1150.1484, 23.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 717, 1738.7813, -1150.1484, 23.0938, 0.25);

	RemoveBuildingForPlayer(playerid, 1412, 1917.3203, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1912.0547, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1906.7734, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1927.8516, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1922.5859, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1938.3906, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1933.1250, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1821.1250, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1815.8594, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1810.5938, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1805.3281, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1948.9844, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1943.6875, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1800.0625, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 545.2109, -1523.2344, 17.5000, 0.25);
	
	//Urzad miasta PC by abram01
	RemoveBuildingForPlayer(playerid, 13374, 2241.4063, 21.4609, 33.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 781, 2253.7734, -79.5313, 25.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 781, 2259.3906, -79.4141, 25.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 781, 2266.0859, -79.4141, 25.4922, 0.25);
	
	//plac manewrowy w SF
    RemoveBuildingForPlayer(playerid, 11372, -2076.4375, -107.9297, 36.9688, 0.25);
 	RemoveBuildingForPlayer(playerid, 11014, -2076.4375, -107.9297, 36.9688, 0.25);
	

	//groove street
	RemoveBuildingForPlayer(playerid, 3593, 2437.4844, -1644.1172, 12.9844, 0.25);
	//baza KT by Kubi
	RemoveBuildingForPlayer(playerid, 3682, 2673.0859, -2114.9063, 36.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 3683, 2684.7656, -2088.0469, 20.1172, 0.25);
    RemoveBuildingForPlayer(playerid, 3289, 2484.4141, -2141.0078, 12.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 3289, 2496.0625, -2141.0078, 12.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 3289, 2679.2344, -2106.9766, 12.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3290, 2503.1250, -2073.3750, 12.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 3290, 2515.4219, -2073.3750, 12.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 3290, 2647.1016, -2073.3750, 12.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 3290, 2658.7188, -2073.3750, 12.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 3290, 2671.5000, -2073.3750, 12.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 3288, 2432.7266, -2133.0234, 12.4531, 0.25);
    RemoveBuildingForPlayer(playerid, 3686, 2448.1328, -2075.6328, 16.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 3745, 2475.1016, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3745, 2482.0234, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3745, 2489.1016, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3745, 2496.0938, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3290, 2452.9609, -2129.0156, 25.2734, 0.25);
    RemoveBuildingForPlayer(playerid, 3756, 2484.2344, -2118.5547, 17.7031, 0.25);
    RemoveBuildingForPlayer(playerid, 3755, 2484.2344, -2118.5547, 17.7031, 0.25);
    RemoveBuildingForPlayer(playerid, 3779, 2631.9141, -2098.5781, 20.0078, 0.25);
    RemoveBuildingForPlayer(playerid, 3779, 2653.9375, -2092.3359, 20.0078, 0.25);
    RemoveBuildingForPlayer(playerid, 3257, 2432.7266, -2133.0234, 12.4531, 0.25);
    RemoveBuildingForPlayer(playerid, 3258, 2484.4141, -2141.0078, 12.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 3258, 2496.0625, -2141.0078, 12.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 3256, 2452.9609, -2129.0156, 25.2734, 0.25);
    RemoveBuildingForPlayer(playerid, 3567, 2446.8281, -2075.8438, 13.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 3567, 2438.3594, -2075.8438, 13.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 3627, 2448.1328, -2075.6328, 16.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 3643, 2489.1016, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3643, 2482.0234, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3643, 2475.1016, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3643, 2496.0938, -2073.4766, 17.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 3256, 2515.4219, -2073.3750, 12.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 3256, 2503.1250, -2073.3750, 12.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2663.0547, -2121.6563, 30.6250, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2665.7734, -2122.5078, 22.2813, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2667.3594, -2120.7969, 19.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2669.3359, -2120.7969, 26.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2669.3359, -2120.7969, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2679.4375, -2121.6563, 21.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2675.8594, -2121.6563, 25.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2684.2031, -2122.5078, 22.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2685.0547, -2119.7891, 14.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3675, 2685.1172, -2119.1016, 19.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 3637, 2631.9141, -2098.5781, 20.0078, 0.25);
    RemoveBuildingForPlayer(playerid, 3637, 2653.9375, -2092.3359, 20.0078, 0.25);
    RemoveBuildingForPlayer(playerid, 3673, 2673.0859, -2114.9063, 36.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 3258, 2679.2344, -2106.9766, 12.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3674, 2682.3203, -2114.5313, 39.0313, 0.25);
    RemoveBuildingForPlayer(playerid, 3636, 2684.7656, -2088.0469, 20.1172, 0.25);
    RemoveBuildingForPlayer(playerid, 3256, 2647.1016, -2073.3750, 12.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 3256, 2658.7188, -2073.3750, 12.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 3256, 2671.5000, -2073.3750, 12.4453, 0.25);
	//KT SWAG

	//willa mad doga sicario
	RemoveBuildingForPlayer(playerid, 13744, 1272.593, -803.109, 86.359, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1304.703, -767.132, 91.070, 0.250);
	RemoveBuildingForPlayer(playerid, 617, 1254.765, -763.257, 90.851, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1294.796, -761.390, 92.015, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1265.890, -760.789, 92.554, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1285.781, -760.125, 92.398, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1276.968, -759.664, 92.539, 0.250);

    //SN
    RemoveBuildingForPlayer(playerid, 1689, 745.5859, -1381.1094, 25.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1689, 751.3359, -1368.0313, 25.8750, 0.25);
	//RemoveBuildingForPlayer(playerid, 6516, 717.6875, -1357.2813, 18.0469, 0.25); schody SN San News
	RemoveBuildingForPlayer(playerid, 1415, 732.8516, -1332.8984, 12.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1439, 732.7266, -1341.7734, 12.6328, 0.25);


	//CITYHALL
	RemoveBuildingForPlayer(playerid, 4024, 1479.8672, -1790.3984, 56.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 4044, 1481.1875, -1785.0703, 22.3828, 0.25);
    RemoveBuildingForPlayer(playerid, 4046, 1479.5234, -1852.6406, 24.5156, 0.25);
    RemoveBuildingForPlayer(playerid, 4047, 1531.6328, -1852.6406, 24.5156, 0.25);
    RemoveBuildingForPlayer(playerid, 4163, 1469.3359, -1732.2891, 12.4609, 0.25);
    RemoveBuildingForPlayer(playerid, 4164, 1469.3359, -1732.2891, 12.4609, 0.25);
    RemoveBuildingForPlayer(playerid, 1527, 1448.2344, -1755.8984, 14.5234, 0.25);
    RemoveBuildingForPlayer(playerid, 4217, 1449.2500, -1852.5703, 22.3672, 0.25);
    RemoveBuildingForPlayer(playerid, 713, 1407.1953, -1749.3125, 13.0938, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1482.0859, -1859.9688, 25.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 713, 1496.8672, -1707.8203, 13.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 713, 1405.2344, -1821.1172, 13.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 1450.5547, -1868.0078, 16.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 1265, 1465.4766, -1848.2500, 12.9922, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1466.9453, -1847.8438, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1419.7344, -1846.5469, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 1265, 1420.4297, -1845.3438, 12.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1419.6953, -1844.2031, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 1220, 1420.4922, -1842.4375, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 1220, 1419.7266, -1842.8516, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 1230, 1419.6719, -1842.0313, 12.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 4170, 1433.9531, -1844.4063, 21.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1456.3984, -1832.5313, 11.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1482.0859, -1859.9688, 25.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 4004, 1479.5234, -1852.6406, 24.5156, 0.25);
    RemoveBuildingForPlayer(playerid, 1357, 1487.6953, -1848.1094, 12.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1486.2109, -1848.1250, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1468.0625, -1847.7891, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 1230, 1488.9219, -1848.2734, 12.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 4171, 1503.3984, -1848.3359, 21.4609, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1504.8438, -1832.5313, 11.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 1265, 1515.3828, -1850.0547, 12.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 1265, 1514.4219, -1850.0391, 12.9922, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1516.6875, -1850.0547, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 4002, 1479.8672, -1790.3984, 56.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 3980, 1481.1875, -1785.0703, 22.3828, 0.25);
    RemoveBuildingForPlayer(playerid, 4003, 1481.0781, -1747.0313, 33.5234, 0.25);
    RemoveBuildingForPlayer(playerid, 1231, 1479.6953, -1716.7031, 15.6250, 0.25);
    RemoveBuildingForPlayer(playerid, 1231, 1479.6953, -1702.5313, 15.6250, 0.25);
    RemoveBuildingForPlayer(playerid, 4048, 1531.6328, -1852.6406, 24.5156, 0.25);
    RemoveBuildingForPlayer(playerid, 1372, 1538.9453, -1849.2734, 12.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 1230, 1538.8359, -1847.6250, 13.6719, 0.25);
    RemoveBuildingForPlayer(playerid, 1220, 1538.3906, -1847.9297, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 1220, 1539.1016, -1847.2969, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 700, 1554.8203, -1816.1563, 13.4766, 0.25);
	return 1;
}

//OLD:
ZaladujBramy()
{
	//--------[bramy i windy]-------
	BramaLCN = CreateDynamicObject(1557, -792.44158935547, 495.30035400391, 1370.7421875, 0, 0, 0);//2
	WindaYKZ = CreateDynamicObject(2928, 2806.7307128906, -1089.2893066406, 29.75, 90, 0, 0);//winda YKZ area 3
	WindaYKZKrata = CreateDynamicObject(2909, 2809.38671875, -1088.9912109375, 42.11808013916, 0, 90, 0);//winda ykz karata 4
	//bramadom1 = CreateDynamicObject(7891, 2313.65747, -1217.92151, 24.50300,   0.00000, 0.00000, 180.00000);//nowa brama TFAT
	bor = CreateDynamicObject(1569, 1501.6648, -1452.1390, 63.3306,   0.00000, 0.00000, 270.00000,80,0);//nowa baza
	bor1 = CreateDynamicObject(1569, 1513.57556, -1468.74573, 66.82270,   0.00000, 0.00000, 90.00000,80,0);//nowa baza

	// Nowa policja
	//lspdWjazdDolny = CreateDynamicObject(19880, 1588.4932, -1638.2795, 17.0965, 0.0000, 0.0000, 0.0000); //zamknieta brama
	// End nowa policja

	DrzwiPDKomi = CreateDynamicObject(1569,253.18164062,108.04980469,1002.21875000,0.00000000,0.00000000,90.00000000); //brama pd1 stary komisariat (old komi)
	DrzwiPDKomi2 = CreateDynamicObject(1569,253.22167969,124.16796875,1002.21875000,0.00000000,0.00000000,90.00000000); //bramapd 2b stary komisariat (old komi)
	DrzwiPDKomi3 = CreateDynamicObject(1569,238.32324219,119.16503906,1002.21875000,0.00000000,0.00000000,179.99450684); //brama pd3 stary komisariat (old komi)
	DrzwiPDKomi4 = CreateDynamicObject(3089,220.67187500,118.53125000,1010.50921631,0.00000000,0.00000000,270.00000000); //brama pd4 (drzwi FBI)
	//nowe komi
	// bramalspd1 = CreateDynamicObject(1495, -1673.90, 876.96, -49.90,   0.00, 0.00, 90.00,1);
	// bramalspd2 = CreateDynamicObject(1495, -1673.90, 902.57, -49.90,   0.00, 0.00, 90.00,1);
	// bramalspd3 = CreateDynamicObject(1495, -1670.67, 904.90, -49.90,   0.00, 0.00, 0.00,1);
	// bramalspd4 = CreateDynamicObject(1495, -1670.57, 876.07, -49.90,   0.00, 0.00, 0.00,1);
	// bramalspd5 = CreateDynamicObject(3089, -1673.90, 891.26, -48.60,   0.00, 0.00, 270.00,1);
	// bramalspd6 = CreateDynamicObject(3089, -1616.80, 829.67, -25.80,   0.00, 0.00, 90.00,1);
	// bramalspd7 = CreateDynamicObject(3089, -1626.40, 829.67, -25.80,   0.00, 0.00, 90.00,1);
	// bramalspd8 = CreateDynamicObject(3089, -1626.40, 823.28, -25.80,   0.00, 0.00, 90.00,1);
	// bramalspd9 = CreateDynamicObject(3089, -1616.80, 823.28, -25.80,   0.00, 0.00, 90.00,1);
	// bramalspd10 = CreateDynamicObject(3089, -1745.86, 784.40, -44.20,   0.00, 0.00, 0.00,1);
	// bramalspd11 = CreateDynamicObject(1569, -1606.47, 817.80, -30.50,   0.00, 0.00, 0.00,1);
	// bramalspd12 = CreateDynamicObject(1569, -1745.87, 805.20, -45.50,   0.00, 0.00, 0.00,1);
	// bramalspd13 = CreateDynamicObject(971, -1671.50, 918.00, -49.80,   0.00, 0.00, 90.00,1);
	// celalspd1 = CreateDynamicObject(19302, -1682.70, 923.10, -52.20,   0.00, 0.00, 90.00,1);
	// celalspd2 = CreateDynamicObject(19302, -1682.70, 926.30, -52.20,   0.00, 0.00, 90.00,1);
	//koniec
	Izba = CreateDynamicObject(2930, 266.57534790039, 112.58443450928, 1006.2540283203, 0.000000, 0.000000, 270); //object (chinatgate) (2) 18
    BramaCortez = CreateDynamicObject(969, 1240.9154052734, -767.32855224609, 91.052940368652, 0, 0, 0);//25
    BrF[0] = CreateDynamicObject(969,1285.09960938,-1006.29980469,29.89999962,0.00000000,0.00000000,0.00000000); //brama 1 o
    BrF[1] = CreateDynamicObject(969,1285.09997559,-966.40002441,33.59999847,0.00000000,0.00000000,0.00000000); //brama 2 o
    BrF[2] = CreateDynamicObject(3089,1289.59960938,-1080.09960938,5972.39990234,0.00000000,0.00000000,179.99450684); //brama 1 1 o
    BrF[3] = CreateDynamicObject(3089,1286.60937500,-1080.09960938,5972.50000000,0.00000000,0.00000000,0.00000000); //brama 1 2 o
    BrF[4] = CreateDynamicObject(1569,1288.21972656,-1086.67968750,5971.18017578,0.00000000,0.00000000,0.00000000); //brama 3
    BrF[5] = CreateDynamicObject(1569,1276.29980469,-1084.68652344,5971.10009766,0.00000000,0.00000000,90.00000000); //brama 2
    BrF[6] = CreateDynamicObject(980,-1770.29980469,984.19921875,25.29999924,0.00000000,0.00000000,90.00000000); //brama o
    BrF[7] = CreateDynamicObject(1569,-1837.09960938,1159.31933594,6797.89990234,0.00000000,0.00000000,90.00000000); //hardcor drzwi
	
	BramaKomiCela = CreateDynamicObject(971,212.88121032715,124.91903686523,998.40710449219, 0.0, 0.0, 0.0);//43 stary komisariat (old komi)
	//fbi
	Celaki[0] = CreateDynamicObject(19303, 640.95209, -1488.60669, 90.89490,   0.00000, 0.00000, 90.00000,11);
	Celaki[1] = CreateDynamicObject(19303, 640.95209, -1484.39648, 90.89490,   0.00000, 0.00000, 90.00000,11);
	Celaki[2] = CreateDynamicObject(19303, 640.95209, -1480.18262, 90.89490,   0.00000, 0.00000, 90.00000,11);
	FBIdrzwi3 = CreateDynamicObject(1569, 613.93781, -1482.25500, 89.61260,   0.00000, 0.00000, 0.00000,11);
	FBIdrzwi4 = CreateDynamicObject(1569, 620.36481, -1482.25720, 89.61260,   0.00000, 0.00000, 0.00000,11);
	FBIdrzwi7 = CreateDynamicObject(1569, 628.00238, -1455.47119, 72.94110,   0.00000, 0.00000, 90.00000,12);
	//BramaWDol = CreateDynamicObject(980, 615.2236328125, -1509.96484375, 16.714672088623, 0, 0, 90, -1, -1, -1, 200.0);
	//koniecfbi
	BramaBaySide = CreateDynamicObject(1557,-2059.30249023,568.60919189,1172.05114746,0.00000000,0.00000000,180.0); //brama bayside
	windka = CreateDynamicObject(18755, 507.65, -1493.03, 46.58,   0.00, 0.00, 90.00,1);
	bramka[0] = CreateDynamicObject(3089, 482.15, -1523.25, 45.01,   0.00, 0.00, 90.00,1);
	bramka[1] = CreateDynamicObject(18756, 509.63, -1493.10, 46.57,   0.00, 0.00, 90.00,1);
	bramka[2] = CreateDynamicObject(18757, 505.63, -1493.10, 46.57,   0.00, 0.00, 90.00,1);
	bramka[3] = CreateDynamicObject(18756, 507.63, -1493.10, 49.87,   0.00, 0.00, 90.00,1);
	bramka[4] = CreateDynamicObject(18757, 507.63, -1493.10, 49.87,   0.00, 0.00, 90.00,1);
	bramka[5] = CreateDynamicObject(980, 496.61, -1509.25, 42.78,   0.00, 0.00, 90.00,1);
	//bramka[6] = CreateDynamicObject(980, 502.26, -1509.94, 45.18,   0.00, 0.00, 270.00,1);
    BramaZuz = CreateDynamicObject(983,-1113.25769043,-1008.68634033,128.90229797,0.00000000,0.00000000,249.92016602); //object(fenceshit3) (5) brama
    BramaHA = CreateDynamicObject(980,-1.39941406,-267.09960938,7.19999981,0.00000000,0.00000000,0.00000000); //object(airportgate) (2)
    
    return 1;
}
