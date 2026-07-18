//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  zastrzyk                                                 //
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
// Autor: Mrucznik
// Data utworzenia: 07.02.2020


//

//------------------<[ Implementacja: ]>-------------------
command_zastrzyk_Impl(playerid, giveplayerid)
{
	if ( !(IsAMedyk(playerid) && GroupPlayerDutyRank(playerid) >= 1))
	{
		sendErrorMessage(playerid, "Nie masz 1 rangi lub nie jesteś medykiem!");
        return 1;
	}
    
    if(!IsPlayerNear(playerid, giveplayerid))
    {
        sendErrorMessage(playerid, sprintf("Jesteś zbyt daleko od gracza %s", GetNick(giveplayerid)));
        return 1;
    }

    if(kaska[giveplayerid] >= 1)
    {
        SendClientMessage(giveplayerid, COLOR_GREY, sprintf("%s oferuje Ci zastrzyk. Koszt to $1. Aby akceptować wpisz /akceptuj zastrzyk", GetNick(playerid)));
        SendClientMessage(playerid, COLOR_GREY, sprintf("Zaoferowałeś %s zastrzyk. Czekaj na akceptacje.", GetNick(giveplayerid)));

        SetPVarInt(giveplayerid, "ZastrzykID", playerid);
        SetPVarInt(giveplayerid, "ZastrzykHave", 1);
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREY, sprintf("%s nie stać na zastrzyk ($1)", GetNick(giveplayerid)));
    }
    return 1;
}

//end