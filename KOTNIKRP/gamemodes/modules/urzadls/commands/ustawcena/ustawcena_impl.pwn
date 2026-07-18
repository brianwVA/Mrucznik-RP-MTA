//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 ustawcena                                                 //
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


//

//------------------<[ Implementacja: ]>-------------------
command_ustawcena_Impl(playerid, valueChoice, valueCost)
{
    new string[124];
    if(valueChoice > 7 || valueChoice < 0)
    {   
        sendErrorMessage(playerid, "Nieprawidłowe użycie komendy!");
        sendTipMessage(playerid, "0 - dowód || 1 - karta wędkarska || 2 - pozwolenie na broń"); 
        sendTipMessage(playerid, "3 - patent żeglarski || 4 - Prawko - teoria || 5 - Prawko - praktyka || 6 - Prawko - odbiór");
        sendTipMessage(playerid, "7 - licencja pilota"); 
        return 1;
    }
    if(valueCost < 0)
    {
        sendErrorMessage(playerid, "Nie możesz wprowadzać minusowych kwot!"); 
        return 1;
    }
    if(valueCost > 7_500_000)
    {
        sendTipMessage(playerid, "Kwota nie może przekroczyć 7.5kk");
        return 1;
    }
    if(PlayerInfo[playerid][pLider] != FRAC_GOV)
    {
        sendErrorMessage(playerid, "Nie jesteś liderem organizacji!"); 
        return 1;
    }
    DmvLicenseCost[valueChoice] = valueCost; 
    format(string, sizeof(string), "%s zmienił cenę licencji numer %d na %d", GetNick(playerid), valueChoice, valueCost);
    SendLeaderRadioMessage(FRAC_GOV, COLOR_LIGHTGREEN, string); 
    sendTipMessage(playerid, "Ustawiłeś nową cenę licencji!"); 
    return 1;
}

//end