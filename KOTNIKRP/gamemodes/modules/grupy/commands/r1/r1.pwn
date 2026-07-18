//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                 agraffiti                                                 //
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

//-------<[ initialize ]>-------
command_r1()
{
    new command = Command_GetID("r1");
    Command_AddAlt(command, "radio1");

    command = Command_GetID("r2");
    Command_AddAlt(command, "radio2");

    command = Command_GetID("r3");
    Command_AddAlt(command, "radio3");

    command = Command_GetID("r4");
    Command_AddAlt(command, "radio4");

    command = Command_GetID("r5");
    Command_AddAlt(command, "radio5");

}

//-------<[ command ]>-------
YCMD:r1(playerid, params[])
{
    GroupSendMessageRadio(playerid, 1, params);
    return 1;
}
YCMD:r2(playerid, params[])
{
    GroupSendMessageRadio(playerid, 2, params);
    return 1;
}
YCMD:r3(playerid, params[])
{
    GroupSendMessageRadio(playerid, 3, params);
    return 1;
}


YCMD:r4(playerid, params[])
{
    GroupSendMessageRadio(playerid, 4, params);
    return 1;
}


YCMD:r5(playerid, params[])
{
    GroupSendMessageRadio(playerid, 5, params);
    return 1;
}