//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 rybypomoc                                                 //
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
// Autor: mrucznik
// Data utworzenia: 03.03.2020


//

//------------------<[ Implementacja: ]>-------------------
command_rybypomoc_Impl(playerid)
{
    SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	SendClientMessage(playerid, COLOR_WHITE,"*** RYBY POMOC *** wpisz komende aby uzyskać więcej pomocy");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** /wedkuj (Próbujesz złapać rybę) /ryby (Pokazuje jakie ryby złapałeś)");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** /wywalrybe (Wywala ostatnią złapaną rybe) /wywalryby");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** [NOWE] /sprzedajrybe (sprzedajesz wybraną rybę w 24/7)");
	SendClientMessage(playerid, COLOR_GRAD6,"*** INNE *** /telefonpomoc /dompomoc /wynajempomoc /bizpomoc /pomoc /ircpomoc");
    return 1;
}

//end