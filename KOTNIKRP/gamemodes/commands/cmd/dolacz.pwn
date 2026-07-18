//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dolacz ]------------------------------------------------//
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
	dodano rynek pracy :) :(
*/

YCMD:praca(playerid, params[])
{
    new string[256];
    if(PlayerInfo[playerid][pJob] != 0) return sendTipMessage(playerid, "Posiadasz już pracę!");
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1498.4562,-1582.0427,13.5498))
    {
        format(string, sizeof(string), "Mechanik\nOchroniarz\nPizzaboy\nTrener boksu\nKurier\nTaksówkarz");
        ShowPlayerDialogEx(playerid, D_JOB_CENTER_DIALOG, DIALOG_STYLE_LIST, "M-RP »» Rynek pracy", string, "Wybierz", "Anuluj");
    }
    return 1;
}

YCMD:dolacz(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pJob] == 0 )
		{
		    if(PlayerInfo[playerid][pJob] == 0 )
			{
				if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1215.1304,-11.8431,1000.9219))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zostać Prostytutką, lecz najpierw musisz podpisać kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnować z tej pracy musi minąć czas kontraktu, dopiero wtedy będziesz mógł się zwolnić.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca polega na zaspokajaniu potrzeb seksualnych mieszkańców.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jeden z kilku wymagającyh zawodów. Nie sprowadza się on tylko do wpisania komendy.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Tutaj najważniejsze jest dobre odgrywanie na /me i /do, im będzie ono lepsze tym wyższy zarobek.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Mimo, ze praca posiada skill nie ma on tak dużego znaczenia. Gdyż nikt nie wynajmuje prostytutki aby dodać sobie HP.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jeżeli potrafisz dobrze odgrywać akcje możesz zarobić nawet 500k za godzinę, jednak zazwyczaj jest to 40k-70k. Pieniądze dostajesz od klientów.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeśli akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 3;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,2166.3772,-1675.3829,15.0859) && IsAPrzestepca(playerid))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zostać Dilerem Dragów, lecz najpierw musisz podpisać kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnować z tej pracy musi minąć czas kontraktu, dopiero wtedy będziesz mógł się zwolnić.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Masz za zadanie odbierać dragi z meliny i rozprowadzać je po całym Los Santos, ty dyktujesz cenę.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Sprzedając narkotyki nie daj sie złapac policji która tylko czeka na okazję by przyskrzynić dilera.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Niestety popularność narkotyków maleje i nowy diler przy dużym szczęściu zarabia ok. 7k za godzinę.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Im wyższy skill tym więcej narkotyków możesz miec przy sobie, spada też ich cena w melinie.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Ta praca jest najlepsza dla osób które już są albo aspirują do bycia gangsterem. To co zarobisz wypłacamy co godzinę (w Pay Day)");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeśli akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 4;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1109.3318,-1796.3042,16.5938))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zostać Złodziejem Aut, lecz najpierw musisz podpisać kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnować z tej pracy musi minąć czas kontraktu, dopiero wtedy będziesz mógł się zwolnić.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Twoje zadanie jest bardzo proste. Ukraść wóz i przewieść go w stanie nienaruszonym na statek przemytników w San Fierro.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Tylko niektóre pojazdy w Los Santos można ukraść. Dodatkowo przemytnicy przyjmują twoje łupy co 15 minut.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Im wyższy skill tym więcej dostaniesz od przemytników za pojazd oraz łatwiej będzie ci coś zwędzić.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Warto również zaparkować swój własny pojazd pod statkiem przemytników żeby mieć czym wrócić do Los Santos.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Zarobki to średnio 200k za godzinę. To co zarobisz wypłacamy natychmiastowo.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeśli akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 5;
				}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1366.7279,-1275.4633,13.5469) && IsADilerBroni(playerid, 0))
		  		{
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zostać Dilerem Broni, lecz najpierw musisz podpisać kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnować z tej pracy musi minąć czas kontraktu, dopiero wtedy będziesz mógł się zwolnić.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Sprzedajesz nielegalną broń tym, którzy nie są w stanie nabyć jej w legalny sposób. Praca jest nielaglna.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jednak zanim przystąpisz do sprzedaży musisz zdobyć zabronione w LS materiały. To dość skomplikowany proces.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Pakiet max. 10paczek odbierzesz w budynku koło wypożyczalni aut. Fabryka w Ocean Docks przerobi je na 500 materiałów.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Dopiero z materiałów możesz wyrabiać broń. Im wyższy skill tym lepsze broni znajdą sie w twojej ofercie. ");
				    SendClientMessage(playerid, COLOR_WHITE, "   Dobry diler potrafi zarobic nawet 150k w godzinę. Jednak początkujący często muszą dokładać do interesu. Ty pobierasz pieniądze od klientów.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeśli akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 9;
		  		}
				else if(GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid, 0.0, 0.0, 0.0))
				{
					if(PlayerInfo[playerid][pCarLic] != 1)
					{
						sendTipMessage(playerid, "Do tej pracy wymagane jest prawo jazdy - Kategoria B!"); 
						return 1;
					}
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca polega na zbieraniu śmieci z terenów Los Santos");
                    SendClientMessage(playerid, COLOR_WHITE, "   Transporcie śmieci w wyznaczone miejsca");
                    SendClientMessage(playerid, COLOR_WHITE, "   Praca jest optymalna, przynosi w miarę dobre zyski - do 3.000$ za jeden śmietnik.");
                    SendClientMessage(playerid, COLOR_WHITE, "   Atutem jest zarabianie kasy do ręki, za odwiezienie zebranych śmieci ze śmietników. ");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeśli akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 17;
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie posiadasz dowodu osobistego, wyrób go w Urzędzie Miasta!");
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Masz już pracę, wpisz /quitjob aby z niej zrezygnować !");
		}
	}//not connected
    return 1;
}