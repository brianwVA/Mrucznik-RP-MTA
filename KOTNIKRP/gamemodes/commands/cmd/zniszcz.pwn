//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zniszcz ]------------------------------------------------//
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

YCMD:zniszcz(playerid, params[])
{
	if(isnull(params))
		return sendTipMessage(playerid, "Użyj: /zniszcz [plantacja]");
	switch(YHash(params))
	{
		case _H<plantacja>:
		{
			if(!IsAPolicja(playerid))
				return sendErrorMessage(playerid, "Nie jesteś na służbie grupy, która ma dostęp do tej komendy!");
			if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) 
				return sendErrorMessage(playerid, "Aby zniszczyć krzak musisz być pieszo.");
			
			new id = GetClosestPlant(playerid);
			if(id == -1) return sendErrorMessage(playerid, "Nie znajdujesz się w pobliżu żadnej plantacji.");
			new targetid = GetPlayerIDFromUID(Plantacja[id][p_Owner]);
			if(IsPlayerConnected(targetid) && targetid != INVALID_PLAYER_ID)
			{
				SendClientMessage(targetid, COLOR_LIGHTBLUE, "Twoja plantacja została zniszczona!");
			}
			
			UsunPlantacje(id);
			RunCommand(playerid, "/me", "niszczy plantację");
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant_In", 4.0, 0, 0, 0, 0, 0);
			DajKaseDone(playerid, NARKO_POLICJA_REWARD);
			va_SendClientMessage(playerid, COLOR_GREEN, "* Zniszczyłeś krzak narko i otrzymałeś %d$.", NARKO_POLICJA_REWARD);
		}
		default: sendTipMessage(playerid, "Nieprawidłowa opcja.");
	}
	return 1;
}