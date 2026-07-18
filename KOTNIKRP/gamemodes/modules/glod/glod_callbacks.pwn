//----------------------------------------------<< Callbacks >>----------------------------------------------//
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

#include <YSI_Coding\y_hooks>

//-----------------<[ Callbacki: ]>-----------------

hook OnGameModeInit()
{ 
	return 1;
}

hook OnPlayerConnect(playerid)
{
	SetPVarInt(playerid, "bw-cooldown", gettime() + 600);

	//PlayerHungerBar[playerid] = CreatePlayerProgressBar(playerid, 548.0, 62.0, 62.500, 4.000, COLOR_GREEN, MAX_ALLOWED_HUNGER);
	hunger_value[playerid] = CreatePlayerTextDraw(playerid, 600.000000, 15.000000, "0%%");
	PlayerTextDrawFont(playerid, hunger_value[playerid], 1);
	PlayerTextDrawLetterSize(playerid, hunger_value[playerid], 0.137500, 1.000000);
	PlayerTextDrawTextSize(playerid, hunger_value[playerid], 566.500000, 8.000000);
	PlayerTextDrawSetOutline(playerid, hunger_value[playerid], 1);
	PlayerTextDrawSetShadow(playerid, hunger_value[playerid], 0);
	PlayerTextDrawAlignment(playerid, hunger_value[playerid], 2);
	PlayerTextDrawColour(playerid, hunger_value[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, hunger_value[playerid], 255);
	PlayerTextDrawBoxColor(playerid, hunger_value[playerid], 50);
	PlayerTextDrawUseBox(playerid, hunger_value[playerid], 0);
	PlayerTextDrawSetProportional(playerid, hunger_value[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, hunger_value[playerid], 0);

	thirst_value[playerid] = CreatePlayerTextDraw(playerid, 622.000000, 15.000000, "0%%");
	PlayerTextDrawFont(playerid, thirst_value[playerid], 1);
	PlayerTextDrawLetterSize(playerid, thirst_value[playerid], 0.137500, 1.000000);
	PlayerTextDrawTextSize(playerid, thirst_value[playerid], 566.500000, 8.000000);
	PlayerTextDrawSetOutline(playerid, thirst_value[playerid], 1);
	PlayerTextDrawSetShadow(playerid, thirst_value[playerid], 0);
	PlayerTextDrawAlignment(playerid, thirst_value[playerid], 2);
	PlayerTextDrawColour(playerid, thirst_value[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, thirst_value[playerid], 255);
	PlayerTextDrawBoxColor(playerid, thirst_value[playerid], 50);
	PlayerTextDrawUseBox(playerid, thirst_value[playerid], 0);
	PlayerTextDrawSetProportional(playerid, thirst_value[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, thirst_value[playerid], 0);
	return 1;
}

//end