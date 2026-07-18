//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                 wypuscrybe                                                //
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
#include "wypuscrybe_impl.pwn"

//-------<[ initialize ]>-------
command_wypuscrybe()
{
    new command = Command_GetID("wypuscrybe");

    //aliases
    Command_AddAlt(command, "wywalrybe");
    Command_AddAlt(command, "throwfish");
    

    //permissions
    Group_SetGlobalCommand(command, true);
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:wypuscrybe(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Wypuszczasz złowioną rybę.");
        return 1;
    }
    //fetching params
    new fishid;
    if(sscanf(params, "d", fishid))
    {
        sendTipMessage(playerid, "Użyj /wypuscrybe [id ryby] ");
        return 1;
    }
    
    //command body
    return command_wypuscrybe_Impl(playerid, fishid);
}