//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                quitbusiness                                               //
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
#include "quitbusiness_impl.pwn"

//-------<[ initialize ]>-------
command_quitbusiness()
{
    new command = Command_GetID("quitbusiness");

    //aliases
    Command_AddAlt(command, "qb");
    Command_AddAlt(command, "quitbiz");
    Command_AddAlt(command, "opuscbiznes");
    Command_AddAlt(command, "quitbiznes");
    Command_AddAlt(command, "opuscbiz");
    

    //permissions
    Group_SetGlobalCommand(command, true);
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:quitbusiness(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Komenda pozwalająca opuścić biznes.");
        return 1;
    }
    
    
    //command body
    return command_quitbusiness_Impl(playerid);
}