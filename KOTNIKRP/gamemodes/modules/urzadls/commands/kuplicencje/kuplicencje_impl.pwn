//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                kuplicencje                                                //
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
// Autor: Simeone
// Data utworzenia: 20.09.2019

//------------------<[ Implementacja: ]>-------------------
command_kuplicencje_Impl(playerid)
{
    if(PlayerInDmvPoint(playerid))
    {
        if(!DmvActorStatus)
        {
            sendErrorMessage(playerid, "Ta komenda jest wyłączona - Urząd miasta nie obsługują boty!"); 
            return 1;
        }
        new string[356]; 
        format(string, sizeof(string), "Nazwa\tKoszt\n\
        Dowód Osobisty\t{80FF00}$%d\n\
        Karta wędkarska\t{80FF00}$%d\n\
        Pozwolenie na broń\t{80FF00}$%d\n\
        Patent żeglarski\t{80FF00}$%d\n\
        Prawo jazdy - teoria\t{80FF00}$%d\n\
        Prawo Jazdy - praktyka\t{80FF00}$%d\n\
        Prawo jazdy - odbiór\t{80FF00}$%d\n\
        Licencja pilota\t{80FF00}$%d", 
        DmvLicenseCost[0], 
        DmvLicenseCost[1],
        DmvLicenseCost[2],
        DmvLicenseCost[3],
        DmvLicenseCost[4],
        DmvLicenseCost[5],
        DmvLicenseCost[6],
        DmvLicenseCost[7]);
        /* na później
        DmvLicenseCost[8], - rejestracja pojazdu
        DmvLicenseCost[9]); - własna tablica rejestracyjna
        */
        ProxDetector(30.0, playerid, "Urzędnik mówi: Witam Pana(i) w Urzędzie Miasta! W czym mogę Panu(i) pomóc?", COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
        ShowPlayerDialogEx(playerid, DIALOG_DMV, DIALOG_STYLE_TABLIST_HEADERS, "Wybierz dokument:", string, "Wyrób", "Wyjdz");
    }
    else
    {
        sendErrorMessage(playerid, "Nie jesteś przy okienkach urzędu miasta!"); 
    }
    return 1;
}

//end