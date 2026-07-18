//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ barierka ]-----------------------------------------------//
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

YCMD:barierka(playerid, params[], help)
{
    if(!(GroupPlayerDutyPerm(playerid, PERM_POLICE) || GroupPlayerDutyPerm(playerid, PERM_BOR) || GroupPlayerDutyPerm(playerid, PERM_MEDIC)))
	{
		sendErrorMessage(playerid, "Nie jesteś na służbie grupy, która ma dostęp do tej komendy.");
		return 1;
	}
	
	if(PlayerInfo[playerid][pJailed] != 0)
	{
		sendErrorMessage(playerid, "Nie możesz stawiać barierek w więzieniu.");
		return 1;
	}
    new group = GetPlayerGroupUID(playerid, OnDuty[playerid]-1);

    if(isnull(params))
    {
        DestroySelectionMenu(playerid);
    	SetPVarInt(playerid, "gatechose_active", 1);
        SetPVarInt(playerid, "gategroup", group);
    	CreateSelectionMenu(playerid);
    	SelectTextDraw(playerid, 0xACCBF1FF);
        sendTipMessage(playerid, "Użyj /barierka usuń [ID] aby usunąć!");
    }
    else
    {
        new var[32], id;
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
        if(sscanf(params, "s[32]d", var, id)) return sendTipMessage(playerid, "Użyj /barierka usuń [ID]");
        if(strcmp(var, "usuń", true) == 0 ||  strcmp(var, "usun", true) == 0)
        {
            if(GetPVarInt(playerid, "gatechose_active") == 1)//Zabezpieczenie przed edycją obiektów mapy
            {
                DestroySelectionMenu(playerid);
                SetPVarInt(playerid, "gatechose_active", 0);
                return 1;
            }
            if(id < 0 || id > 9) return 1;
            if(OnDuty[playerid] < 1) return 1;
            if(!BarierState[group][id]) return 1;

            BARIERKA_Remove(group, id);

            SendClientMessage(playerid, -1, "Usunięto barierkę");
        }
    }
    return 1;
}
