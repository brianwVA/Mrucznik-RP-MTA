//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  antyspam                                                 //
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
// Autor: Simeone
// Data utworzenia: 25.09.2019
//Opis:
/*
	Timery i funkcje dotyczące anty-spamu
*/

//Będę to rozwijał głównie pod uniwersalizm, aby antyspam nie nakładał się na siebie i nie tworzyć milionów zmiennych.
//Póki co podstawowe założenie się sprawdza - więc na jakiś czas pozostaje to w takim stadium :) 

//-----------------<[ Funkcje: ]>-------------------
SetAntySpamForPlayer(playerid, ANTY_SPAM_TYPE)
{
	if(ANTY_SPAM_TYPE == 30)
	{
		SetTimerEx("AntySpam30", 10000, 0, "d", playerid);
	}
	return 1;
}
CheckAntySpamForPlayer(playerid, ANTY_SPAM_TYPE)
{
	if(ANTY_SPAM_TYPE == 30)
	{
		if(antySpam30[playerid] == 1)
		{
			return true;
		}
	}
	return false;
}

//end