//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                  bizlock                                                  //
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
#include "bizlock_impl.pwn"

//-------<[ initialize ]>-------
command_bizlock()
{
    new command = Command_GetID("bizlock");

    //aliases
    Command_AddAlt(command, "zamknijbiznes");
    Command_AddAlt(command, "otworzbiznes");
    Command_AddAlt(command, "businesslock");
    

    //permissions
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:bizlock(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Pozwala zamknąć bądź otworzyć twój biznes. Może ją użyć zarówno członek jak i własciciel biznesu.");
        return 1;
    }
    
    
    //command body
    return command_bizlock_Impl(playerid);
}