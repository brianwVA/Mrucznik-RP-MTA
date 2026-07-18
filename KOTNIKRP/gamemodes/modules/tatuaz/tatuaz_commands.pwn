//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   tatuaz                                                  //
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
// Autor: renosk
// Data utworzenia: 23.06.2023
//Opis:
/*
	
*/

//

//-----------------<[ Komendy: ]>-------------------

YCMD:tatuaz(playerid, params[])
{
    if(!GroupPlayerDutyPerm(playerid, PERM_TATTOO)) return sendTipMessage(playerid, "Nie jesteś na służbie grupy z takimi uprawnieniami!");
    new targetid, price;
    if(sscanf(params, "k<fix>d", targetid, price)) return sendTipMessage(playerid, "Użyj: /tatuaz [ID gracza] [cena od 50$ do 400$]");
    if(!IsPlayerConnected(targetid)) return sendTipMessage(playerid, "Gracz o podanym ID nie istnieje!");
    if(!IsPlayerNear(playerid, targetid)) return sendTipMessage(playerid, "Nie jesteś w pobliżu tego gracza!");
    if(price < 50 || price > 400) return sendTipMessage(playerid, "Cena od $50 do $400!");
    if(kaska[targetid] < price) return sendTipMessage(playerid, "Ten gracz nie ma tyle kasy!");
    if(IsPlayerConnected(GetPVarInt(targetid, "Tattoo-Offer"))) return sendTipMessage(playerid, "Ten gracz ma aktywną ofertę!");
    if(GetFreeSlotTattoo(targetid) == -1) return sendErrorMessage(playerid, "Ten gracz przekroczył limit tatuaży!");
    foreach(new i : Player)
    {
        if(GetPVarInt(i, "Tattoo-Offer") == playerid && IsPlayerNear(playerid, i))
            return sendErrorMessage(playerid, "Wykonujesz już komuś tatuaż!");
    }

    SetPVarInt(targetid, "Tattoo-Offer", playerid);
    SetPVarInt(targetid, "Tattoo-Price", price);
    SetPVarInt(targetid, "Tattoo-Active", 1);
    va_SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wysłałeś ofertę wykonania tatuażu graczowi %s za $%d, czekaj na akceptację.", GetNick(targetid), price);
    va_SendClientMessage(targetid, COLOR_LIGHTBLUE, "* Tatuażysta %s wysłał Ci ofertę wykonania tatuażu za $%d. Wpisz /akceptuj tatuaz", GetNick(playerid), price);
    return 1;
}