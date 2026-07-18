//-----------------------------------------------<< Timers >>------------------------------------------------//
//                                                  wypadek                                                  //
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
// Data utworzenia: 11.06.2019
//Opis:
/*
	System wypadków. Dawny filterscript scanhp.
*/

//

//-----------------<[ Timery: ]>-------------------
public scanhp(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
    new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInConvoyCar(playerid)) return 1;
	GetVehicleHealth(vehicleid,newhealth[playerid]);
	if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 7.0, 2064.0703,-1831.3167,13.3853) || IsPlayerInRangeOfPoint(playerid, 7.0, 1024.8514,-1022.2302,31.9395) || IsPlayerInRangeOfPoint(playerid, 7.0, 486.9398,-1742.4130,10.9594) || IsPlayerInRangeOfPoint(playerid, 7.0, -1904.2325,285.3743,40.8843)  || IsPlayerInRangeOfPoint(playerid, 7.0, 720.0876,-458.3574,16.3359))
	    {
	        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Pojazd naprawiony!");
	    }
	    else
		{
			if(WszedlDoPojazdu[playerid] == 0 && !IsABike(vehicleid) && pasy[playerid] == 1)
			{
				if(newhealth[playerid] >= 1000.0) return 1;
				if(oldhealth[playerid] > (newhealth[playerid] + 150))
				{
					new nick[MAX_PLAYER_NAME + 1];
					new string[256];
					new Float:zyciewypadku;
					GetPlayerName(playerid, nick, sizeof(nick));
					GetPlayerHealth(playerid, zyciewypadku);
					SetPlayerHealth(playerid, zyciewypadku-7);
					format(string, sizeof(string), "* %s uderzył głową w kierownice mimo zapiętych pasów", nick);
					ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ale przywaliłeś, szczęście że miałeś zapięte pasy!");
				}
				else if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE+50))
				{
					new nick[MAX_PLAYER_NAME + 1];
					new string[256];
					GetPlayerName(playerid, nick, sizeof(nick));
					format(string, sizeof(string), "* Pasy zadziałały i %s nie doznał poważnych obrażeń (( %s ))", nick, nick);
					ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna stłuczka, miałeś zapięte pasy i nic ci się nie stało!");
				}
			}
			else if(WszedlDoPojazdu[playerid] == 0 && IsABike(vehicleid) && kask[playerid] == 1)
			{
				if(newhealth[playerid] >= 1000.0) return 1;
				if(oldhealth[playerid] > (newhealth[playerid] + 150))
				{
					new nick[MAX_PLAYER_NAME + 1];
					new string[256];
					new Float:zyciewypadku;
					GetPlayerName(playerid, nick, sizeof(nick));
					GetPlayerHealth(playerid, zyciewypadku);
					SetPlayerHealth(playerid, zyciewypadku-7);
					format(string, sizeof(string), "* %s uderzył kaskiem w kierownicę.", nick);
					ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ale przywaliłeś, szczęście że miałeś kask na głowie!");
				}
				else if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE+50))
				{
					new nick[MAX_PLAYER_NAME + 1];
					new string[256];
					GetPlayerName(playerid, nick, sizeof(nick));
					format(string, sizeof(string), "* Kask uratował %s i nie doznał poważnych obrażeń. (( %s ))", nick, nick);
					ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna stłuczka, miałeś kask na głowie i nic ci się nie stało!");
				}
			}
			else
			{
				if(WszedlDoPojazdu[playerid] == 0)
				{
					if(newhealth[playerid] >= 1000.0) return 1;
					if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE+30))
					{
						new nick[MAX_PLAYER_NAME + 1];
						new string[256];
						new Float:zyciewypadku;
						GetPlayerName(playerid, nick, sizeof(nick));
						GetPlayerHealth(playerid, zyciewypadku);
						SetPlayerHealth(playerid, zyciewypadku-7);
						format(string, sizeof(string), "* %s uderzył głową w kierownicę. (( %s ))", nick, nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
						if(IsABike(GetPlayerVehicleID(playerid)))
						{
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna stłuczka, aby uniknąć obrażeń wpisz /kask!");
						}
						else
						{
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna stłuczka, aby uniknąć obrażeń wpisz /zp!");
						}
					}
				}
			}
		}
	}
	GetVehicleHealth(vehicleid,oldhealth[playerid]);
	return 1;
}

public EnterCar(playerid)
{
	WszedlDoPojazdu[playerid] = 0;
}

//end