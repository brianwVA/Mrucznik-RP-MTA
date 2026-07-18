//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                  setpragnienie                                                  //
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

//-------<[ command ]>-------
YCMD:setpragnienie(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Zmienia pragnienie gracza");
        return 1;
    }
    if(PlayerInfo[playerid][pAdmin] < 1)
        return noAccessMessage(playerid);
    //fetching params
    new giveplayerid, Float:thirst;
    if(sscanf(params, "rf", giveplayerid, thirst))
    {
        sendTipMessage(playerid, "Użyj /setpragnienie [Nick/ID] [Pragnienie] ");
        return 1;
    }
    if(!IsPlayerConnected(giveplayerid))
    {
        sendErrorMessage(playerid, "Nie znaleziono gracza o nicku/id podanym w parametrze.");
        return 1;
    }
    if(thirst > 100.0) thirst = 100.0;
    if(thirst < 0.0) thirst = 0.0;

    PlayerInfo[giveplayerid][pThirst] = thirst;
    SetPlayerDrunkLevel(giveplayerid, 2000);
    _MruGracz(giveplayerid, sprintf("   Administrator %s ustawił Tobie pragnienie na %0.1f", GetNick(playerid), thirst));
    _MruGracz(playerid, sprintf("   Ustawiłeś graczowi %s pragnienie na %0.1f", GetNickEx(giveplayerid), thirst));
    return 1;
}