//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    glod                                                   //
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
// Autor: renosk
// Data utworzenia: 26.05.2021
//Opis:
/*
	System głodu
*/

//

//-----------------<[ Funkcje: ]>-------------------

stock htTextDrawHide(playerid)
{
	PlayerTextDrawHide(playerid, hunger_value[playerid]);
	PlayerTextDrawHide(playerid, thirst_value[playerid]);
	return 1;
}

stock htTextDrawShow(playerid)
{
	if(GetPVarInt(playerid, "TogGlod") == 1) return 0;
	if(HUDShown[playerid] == 0) return 0;
	new string[128];
	format(string, sizeof(string), "%.0f", 100-PlayerInfo[playerid][pHunger]);
	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][15], string);
	format(string, sizeof(string), "%.0f", 100-PlayerInfo[playerid][pThirst]);
	PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][16], string);

	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][15]);
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][16]);

	if(PlayerInfo[playerid][pHunger] >= 88.0)
	{
		PlayerTextDrawColour(playerid, TDEditor_TD[playerid][15], 0xFF0000FF);
	}
	else
	{
		PlayerTextDrawColour(playerid, TDEditor_TD[playerid][15], -1);
	}

	if(PlayerInfo[playerid][pThirst] >= 91.0)
	{
		PlayerTextDrawColour(playerid, TDEditor_TD[playerid][16], 0xFF0000FF);
	}
	else
	{
		PlayerTextDrawColour(playerid,TDEditor_TD[playerid][16], -1);
	}

	new Float:food = 100-PlayerInfo[playerid][pHunger];
	if(food < 0) food = 0;
	if(food > 100) food = 100;
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][6], (food / 100.0) * (40), 6.190011);
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][6]);

	new Float:drink = 100-PlayerInfo[playerid][pThirst];
	if(drink < 0) drink = 0;
	if(drink > 100) drink = 100;
	PlayerTextDrawTextSize(playerid, TDEditor_TD[playerid][7], (drink / 100.0) * (46), 6.190011);
	PlayerTextDrawShow(playerid, TDEditor_TD[playerid][7]);
	return 1;
}



//end