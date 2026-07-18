//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   admin                                                   //
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
// Autor: 2.5
// Data utworzenia: 04.05.2019
//Opis:
/*
	System administracji.

	Zawiera komendy administratora, wywoływania listy administratorów, funkcje administratorów, 
	przydzielanie administratora, zabezpieczenia. Część komend została przepisana na nowo, natomiast część 
	oczekuje dalej na przepisanie. Póki co została oddzielona od komendy.pwn i otrzymała swój własny plik.
	
	Funkcje:
		> AJPlayerTXD - TXD show za AJ
		> BanPlayerTXD - TXD show za Bana
		> KickPlayerTXD - TXD show za kica
		> WarnPlayerTXD - TXD show za warna
		> BlockPlayerTXD - TXD show za blocka
		>
	
	Komendy:
		> Admins - lista administratorów na służbie
		> Kary[i] txd - Kary[i]  w txd
		> check - sprawdza statystyki gracza (showstats) 
		> nonewbie - odpala/gasi chat newbie
		> dn & up - teleportuje gracza w górę/dół
		> usunpozar - usuwa pożar z mapy
		> losowypozar - losowo startuje pożar
		> unblock - unblokowuje gracza o nicku (%s)
		> gotobiz - teleportuje do biznesu o ID
		> resetsejfhasla - resetuje hasła w domach (sejfy)
		> zapiszkonta - zapisuje konta graczy 
		> ann - gametex for all (3) 
		> setname - ustawia graczowi o ID name (%s) 
		> spec & unspec - podgląda gracza (kamera)
		> block - nadaje blocka dla gracza 
		> pblock - nadaje blocka offline
		> pban - nadaje bana offline
		> pwarn - nadaje warna offline
		> paj - nadaje AdminJail'a offline
		> sblock - cichy block
		> ip - sprawdza ip gracza o ID
		> czyjtonumer - sprawdza czyj to numer
		> flip - obraca pojazd do góry kołami :) 
		> snn  - text for all
		> cca & cc - czyści chat dla wszystkich 
		> hpall - nadaje HP dla każdego
		> killall - zabija każdego
		> podglad - ustala podgląd dla gracza o ID
		> antybh - ustawienia antyBH
		> undemorgan - uwalnia gracza o ID z więzeienia
		> zaraz  zaraża gracza chorobą
		> kill - zabija gracza o ID
		> setwiek - ustala wiek dla gracza o ID
		> setjob -  ustala graczowi o ID pracę X
		> setslot - ustala liczbę slotów dla gracza o ID
		> pojazdygracza - sprawdza pojazdy gracza o ID
		> checkcar - sprawdza do kogo należy pojazd X
		> checkcars - sprawdza auta gracza (GUI)
		> setcar - ustawia auto Y na slot X
		> setwl - ustawia graczowi o ID WL X
		> setskin - ustawia graczowi o ID skin X
		> naprawskin - naprawia graczowi o ID skin X
		> rozwiedz - rozwodzi gracza o ID
		> dskill - ustala skill dla broni
		> dnobiekt - obniża obiekt (?)
		> dsus - ustawia graczowi o ID WL X
		> jump - podrzuca gracza
		> sh
		> carjump - podrzuca auto
		> ksam - włącza podgląd miejsca (jako kamera) 
		> fdaj - ustala styl dla gracza o ID
		> dajdowozu - teleportuje gracza o ID do wozu X
		> sprawdzinv - nwm
		> sprawdzin - sprawdza pozycje gracza (on foot, in car [..]) 
		> getposp - pobiera koordynaty gracza o ID
		> zniszczobiekty - usuwa wszystkie obiekty z serwera
		> stworzobiekty - tworzy obiekty
		> respawn - powoduje odliczanie do respawnu pojazów (20s)
		> dajdzwiek - odpala dźwięk dla gracza o ID
		> crimereport - report crime's
		> respp - respawnuje gracza o ID
		> respcar - respawnuje pojazd o ID
		> unbp - zdejmuje blokadę pisania na chaty frakcyjne dla gracza o ID
		> dpa - degraduje pół admina
		> BP - nadaje blokadę pisania dla gracza o ID na czas X
		> kickallex - kickuje wszystkich graczy
		> setmats - ustawia materiały dla gracza o ID
		> reloadbans - przeładowuje plik z banami
		> koxubankot - nadaje administratora X dla gracza o ID
		> setcarint - ustawia pojazdowi interior (taki jaki ma obecnie gracz)
		> setcarvw - ustawia pojazdowi VirtualWorld (taki jaki ma obecnie gracz)
		> panel - panel KS
		> msgbox - wyświetla MSG box
		> gotoczit - teleportuje na miejsce zbrodni 
		> anulujzp - anuluje zabranie prawa jazdy dla gracza o ID
		> addcar - dodaje pojazd na mapę o podanym ID
		> removecar - usuwa pojazd z mapy o podanym ID
		> setac - ustawia anty-cheat'a
		> support - teleportuje do /supporty
		> supportend - przywraca starą pozycję
		> stworz - tworzy organizacje, pojazd, rangę (wymaga uprawnień)
		> edytuj - edytuje pojazd, organizacje, rangę (wymaga uprawnień)
		> delete3dtext - usuwa 3dtext (nie sprawdzone)
		> deleteobject - usuwa obiekt (nie sprawdzone) 
		> scena - stawia scenę
		> scenaallow - pozwala stawiać scenę graczowi o ID
		> scenadisallow - zabiera pozwolenie dla gracza o ID do stawiania sceny
		> zrobkolejke - tworzy kolejkę 
		> gotoadmin - teleportuje na wyspę adminów
		> gotomechy - teleportuje do mechaników
		> gotostacja - teleportuje na stacje paliw idle
		> rapidfly - włącza tryb latania dla gracza
		> removeganglimit
		> removezoneprotect
		> gangzone
		> zonedelay - usuwa strefe
		> clearzone - czyści strefę
		> setzonecontrol - ustawia kontrolę nad strefą dla... 
		> unbw - zdejmuje BW graczowi o ID
		> bw - nadaje BW graczowi o ID
		> checkbw - informacja o czasie BW gracza
		> cziterzy - pokazuje liste osób, które AC uznał za cziterów 
		> restart - restartuje serwera
		> wczytajskrypt - wczytuje FS'a 
		> setmistrz - mianuje gracza o ID mistrzem bokserskim 
		> togadminmess - wyłącza wszelkie komunikaty admina
		> mole - wysyła smsa jako marcepan
		> zg - wysyła wiadomość na chacie zaufanych
		> logout - wylogowuje gracza
		> logoutpl - wylogowuje gracza o ID
		> logoutall - wylogowuje wszystkich graczy
		> cnn - wysyła wszystkim gametext
		> cnnn - wysyła wszystkim gametext (2)
		> demorgan - więzi gracza o ID
		> unaj - usuwa adminjail dla gracza o ID
		> AJ - nadaje adminjaila dla gracza o ID
		> jail - nadaje jaila dla gracza o ID (UWAGA CZAS NIELIMITOWANY!) 
		> tod - ustawia dla wszystkich godzinę X
		> startlotto - startuje lotto 
		> setstat - ustawia graczowi o ID statystyki 
		> clearwlall - czyści wszystkim wanted level
		> setint - nadaje graczowi o ID interior X
		> setvw - nadaje graczowi o ID virtualworld X
		> getvw - pobiera od gracza o ID virtualworld i wyświetla adminowi
		> getint - pobiera od gracza o ID interior i wyświetla adminowi
		> skydive - teleportuje gracza o ID w kosmos (XD)
		> dajpomocnika - nadaje pół administratora (1-3) dla gracza o ID
		> dajskryptera - nadaje skryptera dla gracza o ID
		> dajzaufanego - nadaje zaufanego dla gracza o ID
		> makeircadmin - nadaje administratora chatu IRC dla gracza o ID
		> forceskin - wymusza otworzenie wybierałki, gdy gracz o ID jest we frakcji
		> dajlideraorg - nadaje lidera organizacji (rodziny) dla gracza o ID X
		> makemember - nadaje stopień [0] graczowi o ID we frakcji X
		> zabierzlideraorg - zabiera lidera organizacji (rodziny) dla gracza o ID
		> makeleader - daje graczowi o ID lidera frakcji o ID X
		> setteam - ustala "team" graczowi (raczej już nie używane) - są dwa cop, civilian. 
		> gotopos - teleportuje nas do pozycji X,Y,Z
		> gotols - teleportuje pod komisariat LS
		> gotolv - teleportuje pod lotnisko LV
		> gotosf - teleportuje pod dworzec san fierro
		> gotoszpital - teleportuje pod szpital w LS
		> gotosalon - teleportuje pod salon aut w LS
		> entercar - wsadza nas do wozu o ID
		> gotocar - teleportuje do auta o ID
		> mark - ustawia markera
		> gotomark - teleportuje do markera (którego wcześniej ustawiliśmy poprzez CMD:mark) 
		> gotojet - teleportuje na odrzutowiec
		> gotostad - teleportuje na stadion
		> gotoin - teleportuje w .. coś
		> goto - teleportuje nas do gracza X
		> gotoint - teleportuje nas do interioru X
		> tp - teleportuje gracza X do gracza Y
		> GetHere - teleportuje gracza o ID do nas
		> Getcar - teleportuje auto o ID do nas
		> tankujauto - tankuje pojedyńczy samochód (w którym siedzimy)
		> tankujauta - tankuje samochody
		> givegun - daje graczowi o ID broń o ID z amunicją o wartości X
		> sethp - ustawia graczowi o ID podaną wartość HP
		> setarmor - ustawia graczowi o ID podaną wartość armour 
		> fixveh - naprawia auto
		> fixallveh - naprawia wszystkim graczom auto
		> pogodaall - ustawia podaną pogodę dla wszystkich graczy
		> money - resetuje graczowi o ID kasę do 0 i ustawia podaną wartość
		> dajkase - daje graczowi o ID kasę X
		> carslots - resetuje graczu sloty na [4] domyślne
		> slap - daje klapsa w dupsko dla gracza o ID 
		> mute - ucisza gracza o ID
		> setplocal - ustawia pLOCAL dla gracza o ID
		> glosowanie - tworzy głosowanie na X temat na Y czas
		> freeze - zamraża gracza o ID
		> unfreeze - odmraża gracza o ID
		> warn - nadaje ostrzeżenie graczowi o ID
		> unwarn - zdejmuje ostrzeżenie graczowi o ID
		> skick - kickuje (cichy kick) gracza o ID
		> sban - banuje (ukryty ban) gracza o ID
		> ban - banuje gracza o ID
		> kick - kickuje gracza o ID
		> banip - banuje gracza o ID
	Timery:
		> Brak
		
	Funkcje
		>IsAHeadAdmin
		>IsAScripter
		>IsAGameMaster
		>AdminCommandAcces
*/

//

//-----------------<[ Callbacki: ]>-------------------
//-----------------<[ Funkcje: ]>-------------------
IsAHeadAdmin(playerid)
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		return 1;
	}
	return 0;
}

IsAKox(playerid)
{
	if(DEVELOPMENT) return true;
	return IsAHeadAdmin(playerid);
}

IsAScripter(playerid)
{
	return Uprawnienia(playerid, ACCESS_SKRYPTER);
}

IsAGameMaster(playerid)
{
	return Uprawnienia(playerid, ACCESS_GAMEMASTER);
}

SendMessageToAdmin(text[], mColor)//Wysyła wiadomość do administratora na służbie
{
	foreach(new i : Player)
	{
		if(GetPlayerAdminDutyStatus(i) == 1 && (PlayerInfo[i][pAdmin] > 0 || PlayerInfo[i][pNewAP] > 0))
		{
			new stradm[256];
			format(stradm, sizeof(stradm), "%s", text);
			SendClientMessage(i, mColor, stradm);
		}
	}
	return 1;
}
SendMessageToAdminEx(text[], mColor, condition)//Wysyła wiadomość do administratora za spełnieniem warunku
{
	new stradm[256];
	foreach(new i : Player)
	{
		if(PlayerInfo[i][pAdmin] > 0 || PlayerInfo[i][pNewAP] > 0 || IsAScripter(i) || PlayerInfo[i][pZG] >= 3)
		{
			if(condition == 1)//Warunek włączonej widoczności reportów
			{
				if(PlayerPersonalization[i][PERS_REPORT] == 0)
				{
					format(stradm, sizeof(stradm), "%s", text);
					SendClientMessage(i, mColor, stradm);
				}
			}
			else if(condition == 2)//Warunek włączonej widoczności DEATH_WARNING
			{
				if(PlayerPersonalization[i][WARNDEATH] == 0)
				{
					format(stradm, sizeof(stradm), "%s", text);
					SendClientMessage(i, mColor, stradm);
				}
			}
		}	
	}
	return 1;
}


//-----------------<[ Timery: ]>-------------------

forward StopDraw();
public StopDraw()
{
	foreach(new i : Player)
	{
		PlayerTextDrawHide(i, Kary[i]); 
	}
	KillTimer(karaTimer);
	return 1;
}


//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end