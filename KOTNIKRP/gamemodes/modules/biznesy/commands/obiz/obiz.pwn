//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                    obiz                                                   //
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
#include "obiz_impl.pwn"

//-------<[ initialize ]>-------
command_obiz()
{
    new command = Command_GetID("obiz");

    //aliases
    Command_AddAlt(command, "ogloszeniebiznesowe");
    Command_AddAlt(command, "ogloszeniebiz");
    Command_AddAlt(command, "bizad");
    Command_AddAlt(command, "buisnessad");
    

    //permissions
    Group_SetGlobalCommand(command, true);
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:obiz(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Ogłoszenie biznesowe.");
        return 1;
    }
    //fetching params
    new text[124];
    if(sscanf(params, "s[124]", text))
    {
        sendTipMessage(playerid, "Użyj /obiz [ogłoszenie] ");
        return 1;
    }
    
    //command body
    return command_obiz_Impl(playerid, text);
}