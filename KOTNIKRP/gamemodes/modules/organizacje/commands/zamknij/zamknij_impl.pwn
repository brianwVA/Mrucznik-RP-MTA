//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  zamknij                                                  //
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
// Data utworzenia: 18.06.2020


//

//------------------<[ Implementacja: ]>-------------------
command_zamknij_Impl(playerid)
{
    if(!IsPlayerInGroup(playerid, 21))
    {
        sendTipMessage(playerid, "Komenda dostępna tylko dla Gunshop Los Santos.");
        return 1;
    }
    if(GroupPlayerDutyRank(playerid) <= 3)
    {
        sendTipMessage(playerid, "Komenda dostępna od [4].");
        return 1;
    }
    if(IsPlayerInRangeOfPoint(playerid, 2.0, 1791.6248,-1164.4028,23.8281) || (IsPlayerInRangeOfPoint(playerid, 200.0, 1815.6812,-1172.1915,61.5103) && GetPlayerVirtualWorld(playerid) == 5))
    {
        if(GunshopLSLock == 0)
        {
            GunshopLSLock = 1;
            new string[128];
            format(string, sizeof(string), "* %s przykłada kartę do drzwi i zamyka magnetyczne zamki.", GetNick(playerid));
			ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
            format(string, sizeof(string), "* Stalowe rolety od okien i drzwi zaczynają opadać...");
			ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
            return 1;
        }
        else
        {
            sendTipMessage(playerid, "Biznes jest już otwarty.");
            return 1;
        }
    }
    else
    {
        sendTipMessage(playerid, "Nie znajdujesz się w środku/przy drzwiach wejściowych!");
        return 1;
    }
}

//end