//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ zasady ]------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:zasady(playerid, params[], help)
{
    SendClientMessage(playerid,COLOR_P@,"|_________________Zasady ruletki i Black Jack'a_________________|");
	SendClientMessage(playerid,COLOR_WHITE,"Black Jack - gracz stara się pokonac krupiera poprzez uzyskanie sumy najbliższej 21pkt.");
	SendClientMessage(playerid,COLOR_WHITE,"Jednak nie należy przekroczyć 21pkt gdyż jest to równoznaczne z przegraną.");
	SendClientMessage(playerid,COLOR_WHITE,"W przypadku uzyskania 21 pkt gracz ma tzw. 'Oczko' i automatycznie wygrywa grę. Wszycy uczestnicy zabawy grają przeciw krupierowi.");
	SendClientMessage(playerid,COLOR_WHITE,"Jeżeli gracz ma mneij niż 21 pkt może w dowolnym momencie przestać dobierac karty (pas) i czekac na ruch krupiera.");
	SendClientMessage(playerid,COLOR_WHITE,"Za Damę (Q) Waleta (J) i Króla (K) liczymy 10pkt. As to 1pkt lub 11pkt- do wyboru. Reszta według figur.");
	SendClientMessage(playerid,COLOR_WHITE,"Ruletka- w tej grze mozna wygrać zdecydowanie najiększe pieniądze. Na ruletce mozna obstawiac wiele kombinacji, im większe ryzyko tym wyższa wygrana:");
	SendClientMessage(playerid,COLOR_WHITE,"Zakłady niskiego ryzka (szansa 1:2): kolory, parzyste, nieparzyste, połówki");
	SendClientMessage(playerid,COLOR_WHITE,"Średnie ryzyko: tuziny, rzędy (szansa 1:3), cztery numery (szansa 1:9), dwie linie (sznasa 1:6), pierwsze pięc numerów (sznasa 1:7)");
	SendClientMessage(playerid,COLOR_WHITE,"Wysokie ryzyko: jeden numer (szansa 1:35), dwa numery (szansa 1:17), trzy numery (szansa 1:11)");
	SendClientMessage(playerid,COLOR_P@,"|_______________________>>> $Bymber Casino$ <<<_______________________|");
	return 1;
}
