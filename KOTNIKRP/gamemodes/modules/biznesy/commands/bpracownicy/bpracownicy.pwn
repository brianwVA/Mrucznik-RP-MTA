//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                bpracownicy                                                //
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
#include "bpracownicy_impl.pwn"

//-------<[ initialize ]>-------
command_bpracownicy()
{
    new command = Command_GetID("bpracownicy");

    //aliases
    Command_AddAlt(command, "biznespracownicy");
    Command_AddAlt(command, "businessworkers");
    

    //permissions
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:bpracownicy(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Wyświetla listę pracowników online biznesu.");
        return 1;
    }
    
    
    //command body
    return command_bpracownicy_Impl(playerid);
}