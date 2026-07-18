//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ wyrzucbronie ]---------------------------------------------//
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

YCMD:wyrzucbronie(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
        if(TazerAktywny[playerid] == 1) return sendErrorMessage(playerid, "Podczas paraliżu nie możesz dać /wb");
        new weapon[12], ammo[12], bool:wyrzuc=false;
        for(new i=0;i<12;i++)
        {
            GetPlayerWeaponData(playerid, i, weapon[i], ammo[i]);
            if(weapon[i] > 0)
            {
                wyrzuc = true;
                break;
            }
        }
        if(wyrzuc)
        {
            if(PlayerInfo[playerid][pInjury] > 0 || PlayerInfo[playerid][pBW] > 0) return sendErrorMessage(playerid, "Jesteś ranny, nie możesz dać /wb");
    		new string[64], sendername[MAX_PLAYER_NAME + 1];
    		GetPlayerName(playerid, sendername, sizeof(sendername));
    		format(string, sizeof(string), "* słychać dźwięk upuszczonej broni ((%s))", sendername);
    		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    		format(string, sizeof(string),"%s wyrzucił broń na ziemię.", sendername);
    		ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    		SendClientMessage(playerid, COLOR_WHITE, "   Twoja broń zostanie przywrócona po śmierci.");
    		RemovePlayerWeaponsTemporarity(playerid);
            SetPVarInt(playerid, "mozeUsunacBronie", 1);
        }
	}
	return 1;
}
