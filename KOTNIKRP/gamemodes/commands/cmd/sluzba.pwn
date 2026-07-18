//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ sluzba ]------------------------------------------------//
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

YCMD:sluzba(playerid, params[], help)
{

    if(IsPlayerConnected(playerid))
    {
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie możesz tego użyć  podczas @Duty! Zejdź ze służby używając /adminduty");
			return 1;
		}
		
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Aby wziąć służbe musisz być pieszo!");

        if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
        {
            sendErrorMessage(playerid, "Jesteś podczas wsiadania - odczekaj chwile. Nie możesz znajdować się w pojeździe.");
            return 1;
        }

        if(gettime() - GetPVarInt(playerid, "lastDamage") < 60)
			return sendErrorMessage(playerid, "Nie możesz tego użyć podczas walki!");
        if(PlayerInfo[playerid][pJob] == 7)
        {
            if(AntySpam[playerid] == 0)
            {
                if(JobDuty[playerid] == 1)
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jesteś już na służbie mechanika, nie będą ci się wyświetlać zgłoszenia.");
                    JobDuty[playerid] = 0;
                    PrintDutyTime(playerid);
                }
                else
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jesteś na służbie mechanika, kiedy ktoś będzie cię potrzebował zostanie wyświetlony komunikat.");
                    JobDuty[playerid] = 1;
                }
                AntySpam[playerid] = 1;
                SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "Odczekaj 10 sekund");
            }
        }
        else return sendTipMessage(playerid, "Użyj: /g [slot] duty");
    }
    return 1;
}
