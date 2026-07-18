//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                zabierzbilet                                               //
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
// Autor: Sandał
// Data utworzenia: 14.02.2020


//

//------------------<[ Implementacja: ]>-------------------
command_zabierzbilet_Impl(playerid, giveplayerid)
{
    if(IsPlayerInGroup(playerid, 18, 1) && GroupPlayerDutyRank(playerid) >= 6) 
    {
        new var[128];
        if(IbizaTicket[giveplayerid] > 0)
        {
            IbizaTicket[giveplayerid] = 0;
            format(var, sizeof(var), "Zabrałeś bilet %s", GetNick(giveplayerid));
            sendTipMessageEx(playerid, COLOR_LIGHTBLUE, var);
            format(var, sizeof(var), "%s zabrał ci bilet od Ibizy.", GetNick(playerid));
            sendTipMessageEx(giveplayerid, COLOR_LIGHTBLUE, var);
        }
        else
        {
            sendTipMessage(playerid, "Gracz nie posiada biletu.");   
        }
    }
    else
    {
        sendTipMessage(playerid, "Komenda dostępna dla ibizy od [6].");
    }
    return 1;
}

//end