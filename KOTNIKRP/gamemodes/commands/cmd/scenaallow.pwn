//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ scenaallow ]----------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:scenaallow(playerid, params[], help)
{
    if(PlayerInfo[playerid][pAdmin] < 200 ) return 1;
    new id;
    if(sscanf(params, "k<fix>", id)) return sendTipMessage(playerid, "Użyj /scenaallow [Nick/ID]");
    if(GetPVarInt(id, "scena-req") != 2 && PlayerInfo[playerid][pAdmin] < 1) return sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz nie prosił o to.");
    new str[128];
    format(str, 128, "× Admin %s (ID: %d) nadał Ci pozwolenie na zarządzanie sceną.", GetNickEx(playerid), playerid);
    SendClientMessage(id, COLOR_LIGHTBLUE,  str);
    format(str, 128, "× Daleś %s (ID: %d) możliwość kontrolowania sceny. Aby zabrać (/scenadisallow)", GetNick(id), id);
    SendClientMessage(playerid, COLOR_LIGHTBLUE,  str);
    SetPVarInt(id, "scena-allow", 1);
    return 1;
}
