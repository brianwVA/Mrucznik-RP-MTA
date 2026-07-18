//-----------------------------------------------<< Timers >>------------------------------------------------//
//                                                  choroby                                                  //
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
// Data utworzenia: 07.02.2020
//Opis:
/*
	System chorób.
*/

//

//-----------------<[ Timery: ]>-------------------
//CallEffectTimer(playerid, disease, callback)

timer TreatmentCounter[1000](playerid, count)
{
	new doctorid = GetPVarInt(playerid, "treatment-doctorid");
	GameTextForPlayer(playerid, sprintf("Kuracja ~r~%ds", count), 1000, 4);
	if(IsPlayerConnected(doctorid))
		GameTextForPlayer(doctorid, sprintf("Kuracja ~r~%ds", count), 1000, 4);

	if(count >= 0) 
	{
		if(	IsPlayerConnected(doctorid) && GetDistanceBetweenPlayers(playerid,doctorid) < 5) 
		{	
			AbortCurration[playerid] = 0;
			defer TreatmentCounter(playerid, count-1);
		}
		else
		{
			if(AbortCurration[playerid] == 60)
			{
				//abort treatment
				if(IsPlayerConnected(doctorid))
				{
					GameTextForPlayer(doctorid, "Kuracja przerwana.", 1000, 1);
					SendClientMessage(doctorid, COLOR_RED, "Kuracja przerwana - oddaliłeś się od pacjenta na zbyt długo!");
				}
				GameTextForPlayer(playerid, "Kuracja przerwana.", 1000, 1);
				SendClientMessage(playerid, COLOR_RED, "Kuracja przerwana - oddaliłeś się od doktora na zbyt długo!");
				SetPVarInt(playerid, "disease-treatement", 0);
				return;
			}
			if(IsPlayerConnected(doctorid))
				GameTextForPlayer(doctorid, "Wracaj do pacjenta!", 1000, 1);
			GameTextForPlayer(playerid, "Wracaj do lekarza!", 1000, 1);
			AbortCurration[playerid]++;
			defer TreatmentCounter(playerid, count);
		}
	} 
	else 
	{
		EndPlayerTreatment(playerid, doctorid);
	}
}

task ChorobyMinutaTimer[60000]() 
{
	foreach(new i : Player)
	{
		//Grypa
		new Float:hp;
		GetPlayerHealth(i, hp);
		if(hp < 20.0) 
		{
			Grypa[i]++;
			if(Grypa[i] == 60)
			{
				if(InfectOrDecreaseImmunity(i, GRYPA)) {
					SendClientMessage(i, COLOR_LIGHTBLUE, "Twoja postać była zbyt długo osłabiona (niskie HP) i zaraziła się grypą!");
				}
				Grypa[i] = 0;
			}
		}
		else
		{
			Grypa[i] = 0;
		}

		//Tourett
		if(Tourett[i] > 0) Tourett[i]--;

		//PTSD
		if(PTSDCounter[i] > 0) PTSDCounter[i]--;
	}
}

//end