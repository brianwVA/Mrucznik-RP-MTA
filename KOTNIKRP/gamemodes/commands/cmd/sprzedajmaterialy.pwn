//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------[ sprzedajmaterialy ]-------------------------------------------//
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

YCMD:sprzedajmaterialy(playerid, params[], help)
{
	new giveplayerid, moneys, kasa;
	if(sscanf(params, "k<fix>dd", giveplayerid, moneys, kasa))
	{
		sendTipMessage(playerid, "Użyj /sprzedajmats [playerid/CzęśćNicku] [ilość] [cena]");
		return 1;
	}
	new matsy = CountMats(playerid);
	if(PlayerCuffed[playerid] == 1) return sendErrorMessage(playerid, "Nie możesz tego zrobić będąc skuty!");
	if (matsy > 0)
	{
		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID && playerid != giveplayerid)
			{
				if(matsy >= moneys)
				{
					if(moneys <= 50000)
					{
						if(ProxDetectorS(5.0, playerid, giveplayerid))
						{
							if(moneys > 50000 || moneys < 1)
							{
							    sendErrorMessage(playerid, "Zakres od 1 do 50 000!");
								return 1;
							}
							if(kasa > 1000000 || kasa < 0)
							{
							    sendErrorMessage(playerid, "Zakres od 0 do 1 000 000!");
								return 1;
							}
							if(IsPlayerInAnyVehicle(giveplayerid) || IsPlayerInAnyVehicle(playerid)) return sendErrorMessage(playerid, "Jeden z was znajduje się w pojeździe!");
                            if(GetPVarInt(giveplayerid, "OKupMats") == 1) return sendErrorMessage(playerid, "Gracz ma już ofertę!");
                            if(GetPVarInt(playerid, "OSprzedajMats") == 1) return sendErrorMessage(playerid, "Oferujesz już komuś sprzedaż!");
                          //  if(IsASklepZBronia(playerid) && !IsASklepZBronia(giveplayerid)) return sendErrorMessage(playerid, "Pracownik GunShopu może oferować sprzedaż tylko innemu pracownikowi GunShopu!");

                            new string[128];
							format(string, sizeof(string),"%s oferuje %d materiałów za %d $.", GetNick(playerid), moneys, kasa);
							ShowPlayerDialogEx(giveplayerid, 9520, DIALOG_STYLE_MSGBOX, "KUPNO MATERIAŁÓW", string, "Kup", "Odrzuć");
                            format(string, sizeof(string), "Zaoferowałeś %d materiałów za %d graczowi %s.", moneys, kasa, GetNick(giveplayerid));
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							
							SetPVarInt(giveplayerid, "OKupMats", 1);
							SetPVarInt(playerid, "OSprzedajMats", 1);
                            SetPVarInt(giveplayerid, "Mats-id", playerid);
                            SetPVarInt(giveplayerid, "Mats-kasa", kasa);
                            SetPVarInt(giveplayerid, "Mats-mats", moneys);
                            SetTimerEx("SprzedajMatsTimer", 20000, false, "ii", playerid, giveplayerid);
						}
						else
						{
							sendErrorMessage(playerid, "Gracz jest za daleko!");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Możesz dać tylko 50 000 materiałów na raz!");
					}
				}
				else
				{
					sendErrorMessage(playerid, "Nie masz tylu materiałów!");
				}
			}
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz tylu materiałów!");
	}
	return 1;
}
