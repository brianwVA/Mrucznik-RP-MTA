//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ wyprowadz ]-----------------------------------------------//
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

YCMD:wyprowadz(playerid, params[], help)
{
	if(GroupPlayerDutyRank(playerid) >= 2 && IsPlayerInGroup(playerid, 18, 1)) //RANGA
	{
		new id;
		if(sscanf(params, "d", id)) return sendTipMessage(playerid, "Użyj /wyprowadz [id]");
		if(!IsPlayerConnected(id)) return sendTipMessageEx(playerid, 0xB52E2BFF, "Tego gracza nie ma na serwerze");
		if(GetPVarInt(playerid, "IbizaWejdz") != 1 || GetPVarInt(id, "IbizaWejdz") != 1) return sendTipMessageEx(playerid, 0xB52E2BFF, "Nie możesz interweniować poza klubem / podany gracz nie znajduje się w klubue");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(id, x, y, z);
		if(!IsPlayerInRangeOfPoint(playerid, 4.0, x, y, z) || GetPlayerVirtualWorld(id) != 1) return sendTipMessageEx(playerid, 0xB52E2BFF, "Ten gracz jest za daleko od ciebie");
		if(CheckPlayerPerm(id, PERM_CLUB)) return sendTipMessageEx(playerid, 0xB52E2BFF, "Nie możesz wyprowadzić członka klubu Ibiza");
		SetPVarInt(id, "IbizaWejdz", 0);
		SetPVarInt(id, "IbizaBilet", 0);
		SetPlayerPos(id, 394.2784,-1805.9104,7.8302);
		SetPlayerFacingAngle(id, 178.8095);
		SetPlayerVirtualWorld(id, 0);
		StopAudioStreamForPlayer(id);
		IbizaWyjscie(id);
		new string[128];
		format(string, sizeof string, "Wyprowadziłeś gracza %s z klubu.", PlayerName(id));
		SendClientMessage(playerid, 0x00C000FF, string);
		format(string, sizeof string, "Zostałeś wyprowadzony z klubu Ibiza przez ochronę.");
		SendClientMessage(id, 0xFF2040FF, string);
	}
	return 1;
}
