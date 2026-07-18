//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                  specshow                                                 //
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
// Kod wygenerowany automatycznie narzędziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTANĄ NADPISANE PO WYWOŁANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================


//-------<[ include ]>-------
#include "specshow_impl.pwn"

//-------<[ initialize ]>-------
command_specshow()
{
    //new command = Command_GetID("specshow");

    //aliasess
    

    //permissions
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:specshow(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Komenda, która pozwala spojrzeć kogo podgląda dany administrator.");
        return 1;
    }
    //fetching params
    new valueSpec;
    if(sscanf(params, "d", valueSpec))
    {
        sendTipMessage(playerid, "Użyj /specshow [ID] ");
        return 1;
    }
    
    //command body
    return command_specshow_Impl(playerid, valueSpec);
}