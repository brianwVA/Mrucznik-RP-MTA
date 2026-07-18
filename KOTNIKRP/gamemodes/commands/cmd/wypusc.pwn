YCMD:wypusc(playerid, params[], help)
{
	new string[128];

    if(PlayerInfo[playerid][pJob] != 2 && !CheckPlayerPerm(playerid, PERM_LAWYER))
    {
        sendTipMessageEx(playerid, COLOR_GREY, "Nie jesteś prawnikiem!");
        return 1;
    }
	new giveplayerid, money;
	if( sscanf(params, "k<fix>d", giveplayerid, money))
	{
		sendTipMessage(playerid, "Użyj /uwolnij [playerid/CzęśćNicku] [Kwota]");
		return 1;
	}
	if(playerid == giveplayerid)
	{
		sendTipMessage(playerid, "Nie możesz uwolnić samego siebie!");
		return 1;
	}
	if(money > 25000)
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Nie przesadzasz troszkę? Maksymalna kwota uwolnienia to 25.000$");
		return 1;
	}
	if(money < 1000)
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Minimalna kwota uwolnienia to 1.000$"); 
		return 1;
	}
	if(ApprovedLawyer[playerid] == 0)
	{
		sendErrorMessage(playerid, "Nie masz pozwolenia prawniczego!"); 
		return 1;
	}
	if(PlayerInfo[playerid][pJailed] > 0)
	{
		sendErrorMessage(playerid, "Nie możesz uwalniać będac w wiezieniu!");
		return 1;
	}
	if(IsPlayerConnected(giveplayerid))
	{
		if(giveplayerid != INVALID_PLAYER_ID)
		{
			if(PlayerInfo[giveplayerid][pJailed] == 1  && ApprovedLawyer[playerid] == 1 || PlayerInfo[giveplayerid][pJailed] == 2 && ApprovedLawyer[playerid] == 1)
			{
				if(ProxDetectorS(10.5, playerid, giveplayerid))
				{
					format(string, sizeof(string), "Prawnik %s proponuje Ci uwolnienie z więzienia za %d$ {AC3737}[Aby akceptować wpisz /akceptuj uwolnienie]", GetNick(playerid), money);
					SendClientMessage(giveplayerid, COLOR_BLUE, string);

					format(string, sizeof(string), "Zaoferowałeś uwolnienie %s z więzienia za kwotę %d$ - oczekuj na akceptację!", GetNick(giveplayerid), money); 
					SendClientMessage(playerid, COLOR_BLUE, string);

					LawyerOffer[giveplayerid] = 1;
					OfferPlayer[giveplayerid] = playerid;
					OfferPrice[giveplayerid] = money;

				}
				else
				{
					sendErrorMessage(playerid, "Nie możesz uwolnić gracza, który nie jest przy tobie!"); 
					return 1;
				}


			}
			else
			{
				sendErrorMessage(playerid, "Nie jesteś prawniekiem || Osoba nie jest w więzieniu || Nie masz pozwolenia");
				return 1;
			}


		}
		else
		{
			sendErrorMessage(playerid, "Nie możesz uwolnić samego siebie"); 
			return 1;
		}

	}
	else
	{
		sendErrorMessage(playerid, "Na serwerze nie ma takiego gracza!"); 
		return 1;
	}
	return 1;
}