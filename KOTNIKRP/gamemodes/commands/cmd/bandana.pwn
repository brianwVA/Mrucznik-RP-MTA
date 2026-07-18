//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ bandana ]------------------------------------------------//
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

YCMD:bandana(playerid, params[], help)
{
	if(IsAPrzestepca(playerid) || (IsAFBI(playerid)))
	{
		if((GroupRank(playerid, FRAC_FBI) >= 2) || (GroupPlayerDutyPerm(playerid, PERM_CRIMINAL) && GroupPlayerDutyRank(playerid) >= 2))
		{
			new string[64];
			new nick[24], sendername[MAX_PLAYER_NAME + 1];
			if(GetPVarString(playerid, "maska_nick", nick, 24))
			{
				SendClientMessage(playerid, COLOR_GREY, " Musisz ściągnąć maskę z twarzy! (/maska).");
				return 1;
			}
			
			if(IsPlayerAttachedObjectSlotUsed(playerid, 2))
			{
				SetPlayerColor(playerid, TEAM_HIT_COLOR);
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* %s sciąga bandane z twarzy.", sendername);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				RemovePlayerAttachedObject(playerid,2);
			}
			else
			{
				//SetPlayerColor(playerid, COLOR_BLACK);
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* %s zakłada bandane na twarz.", sendername);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				SetPlayerAttachedObject(playerid, 2, 18896, 2, 0.122467, 0.007340, 0.003190, 274.433288, 0.248657, 262.665466, 1.000000, 1.000000, 1.000000 );//bandana - czarna
			}
		}
	}
	return 1;
}
