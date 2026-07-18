//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ wezdragi ]-----------------------------------------------//
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

YCMD:wezdragi(playerid, params[], help)
{
	new string[128];

    if(IsPlayerConnected(playerid))
   	{
   	    if(PlayerBoxing[playerid] > 0)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie możesz używać dragów podczas walki !");
            return 1;
        }
		if(PlayerInfo[playerid][pDrugs] > 1)
		{
		    PlayerStoned[playerid] += 1;
		    if(PlayerStoned[playerid] >= 4) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Nacpany", 4000, 1); }
		    new Float:health;
		    GetPlayerHealth(playerid, health);
		    if(PlayerInfo[playerid][pDrugPerk] > 0)
		    {
		        new hp = 2 * PlayerInfo[playerid][pDrugPerk]; hp += 20;
				SetPlayerHealth(playerid, health + hp);
		    }
		    else
		    {
		        SetPlayerHealth(playerid, health + 20.0);
		    }
		    new nick[MAX_PLAYER_NAME + 1];
		    GetPlayerName(playerid, nick, sizeof(nick));
		    SendClientMessage(playerid, COLOR_GREY, "   2 gramy narkotyków zażyte !");
		    format(string, sizeof(string), "* %s wyciąga skręta i zaciąga się", nick);
			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		    PlayerInfo[playerid][pDrugs] -= 2;
		    //SetPlayerDrunkLevel(playerid, 8000);
		    //SetPlayerWeather(playerid, -66);

			//choroba
			if(random(50) == 1)//2%
			{
				InfectOrDecreaseImmunity(playerid, SCHIZOFRENIA);
			}
			
			//System siły
			if(GetPVarInt(playerid, "ZjadlDragi") == 0)
			{
				if(PlayerInfo[playerid][pStrong] < MAX_STRONG_VALUE/2)
				{
					SetPVarInt(playerid, "ZjadlDragi", 1);
					sendTipMessageEx(playerid, COLOR_P@, "Zażyłeś narkotyki, twoja siła wzrosła dwukrotnie na jakiś czas"); 
					format(string, sizeof(string), "Miałeś %d , po zażyciu 2 gram masz %d siły.", PlayerInfo[playerid][pStrong], PlayerInfo[playerid][pStrong]*2);
					sendTipMessage(playerid, string);
					SetPVarInt(playerid, "FirstValueStrong", PlayerInfo[playerid][pStrong]);
					SetStrong(playerid, PlayerInfo[playerid][pStrong]*2);
					TimerEfektNarkotyku[playerid] = SetTimerEx("EfektNarkotyku", 60000, false, "i", playerid);
				}
				else
				{
					sendTipMessage(playerid, "Masz zbyt dużą wartość siły, aby dragi Ci coś dały!"); 
				}
			
			}
			else
			{
				if(PlayerInfo[playerid][pStrong] >= 15)
				{
					sendTipMessage(playerid, "Ćpun, przez twój nałóg spada Ci wartość siły!");
					MSGBOX_Show(playerid, "Sila -15", MSGBOX_ICON_TYPE_EXPLODE, 3);
					TakeStrong(playerid, 15);
					new StrongValue = GetPVarInt(playerid, "FirstValueStrong"); 
					SetPVarInt(playerid, "FirstValueStrong", StrongValue-15);
				}
				else
				{
					sendTipMessage(playerid, "Ćpun, przez twój nałóg spada Ci wartość siły!");
					MSGBOX_Show(playerid, "Sila -15", MSGBOX_ICON_TYPE_EXPLODE, 3);
				}
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz już więcej narkotyków !");
		}
	}//not connected
	return 1;
}
