//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    opis                                                   //
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
// Autor: niceczlowiek | Creative
// Data utworzenia: 13.05.2019


//

//------------------<[ Implementacja: ]>-------------------
command_opis_Impl(playerid, text[])
{
	if(PlayerInfo[playerid][pBP] != 0)
	{
		return SendClientMessage(playerid, COLOR_GRAD1, "Posiadasz blokadę pisania na czatach globalnych, nie możesz utworzyć opisu.");
	}

	new opis[128];
	sscanf(text, "S()[128]", opis);
	if(strlen(opis) > 0)
	{
		new givenString[128];
		format(givenString, sizeof(givenString), "%s", opis);
		if(strfind(givenString, "(FF0000)", true) != -1 || strfind(givenString, "(000000)", true) != -1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Znaleziono niedozwolony kolor.");
			return 1;
		}
		//todo: kolorowe opisy tylko dla KP
		new checkBlocked = CheckBlockedChars(givenString);
		if(checkBlocked != -1) return SendClientMessage(playerid, COLOR_GRAD1, sprintf("Znaleziono niedozwolony znak: %s", givenString[checkBlocked]));

		if(!strcmp(opis, "usun", true) || !strcmp(opis, "usuń", true))
		{
			Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, "");
			PlayerInfo[playerid][pDesc][0] = EOS;
			sendTipMessage(playerid, "Opis został usunięty.");
			return 1;
		}
		if(strlen(opis) > 50)
		{
			if(strfind(opis, " ") == -1)
			{
				return sendErrorMessage(playerid, "Długi opis musi zawierać spację.");
			}
		}
		mysql_escape_string(opis, opis);
		new DBResult:db_result;
		db_result = DB_ExecuteQuery(db_handle, sprintf("SELECT * FROM `mru_opisy` WHERE `owner`= '%d' AND `text` = '%s'", PlayerInfo[playerid][pUID], opis));
		new rows = DB_GetRowCount(db_result);
		new query[256];
		if(rows) //opis istnieje wiec update
		{
			new descUid = DB_GetFieldIntByName(db_result, "uid");
			format(query, sizeof(query), "UPDATE `mru_opisy` SET `last_used`=%d WHERE `uid`=%d", gettime(), descUid);
			db_result = DB_ExecuteQuery(db_handle, query);
		}
		else
		{
			format(query, sizeof(query), "INSERT INTO `mru_opisy` (`uid`,`text`, `owner`, `last_used`) VALUES (null, '%s', '%d', '%d')", opis, PlayerInfo[playerid][pUID], gettime());
			DB_FreeResultSet(DB_ExecuteQuery(db_handle, query));
		}

		if(strlen(opis) > 120) return sendErrorMessage(playerid, "Nieodpowiednia długość opisu.");

		PlayerInfo[playerid][pDesc] = opis;
		ReColor(opis);
		Attach3DTextLabelToPlayer(PlayerInfo[playerid][pDescLabel], playerid, 0.0, 0.0, -0.7);
		Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, wordwrapEx(opis));
		sendTipMessage(playerid, "Ustawiono nowy opis:");
		new stropis[126];
		format(stropis, sizeof(stropis), "%s", opis);
		SendClientMessage(playerid, 0xBBACCFFF, stropis);
		return 1;
	}
		

	DynamicGui_Init(playerid);
	new string[1400];
	if(!isnull(PlayerInfo[playerid][pDesc]))
	{
		new str[256];
		strcopy(str, PlayerInfo[playerid][pDesc], sizeof str);
		strdel(str, 55, sizeof str);
		ReColor(str);
		format(string, sizeof(string), "{f4f5fa}%s...", str);
		DynamicGui_AddRow(playerid, DLG_NO_ACTION);
		format(string, sizeof(string), "%s\n{ff0000}Usuń (/opis usun)\n", string);
		DynamicGui_AddRow(playerid, DG_DESC_DELETE);
	}
	else
	{
		format(string, sizeof(string), "Nie masz ustawionego opisu...");
		DynamicGui_AddRow(playerid, DLG_NO_ACTION);
		format(string, sizeof(string), "%s{888888}\n{ff0000}Dodaj opis postaci (/opis [tekst])\n", string);
		DynamicGui_AddRow(playerid, DLG_NO_ACTION);
	}

	format(string, sizeof(string), "%s\t\t\n", string);
	DynamicGui_AddBlankRow(playerid);
	format(string, sizeof(string), "%s{00B33C}Ostatnie opisy\n", string);
	DynamicGui_AddBlankRow(playerid);

	new DBResult:db_result;
	db_result = DB_ExecuteQuery(db_handle, sprintf("SELECT * FROM `mru_opisy` WHERE `owner`=%d ORDER BY `last_used` DESC LIMIT 5", PlayerInfo[playerid][pUID]));

	new rows = DB_GetRowCount(db_result);
		
	if( rows )
	{
		for(new row; row < rows; row++,DB_SelectNextRow(db_result))   
		{
			new tmpText[256];
			DB_GetFieldString(db_result, 1, tmpText, sizeof(tmpText));
			strdel(tmpText, 55, 256);
			ReColor(tmpText);
			format(string, sizeof(string), "%s(%d)\t{FFFFFF}%s...\n", string, row+1, tmpText);
			DynamicGui_AddRow(playerid, DG_DESC_USEOLD, DB_GetFieldIntByName(db_result, "uid"));
		}
	}
	else 
	{
		format(string, sizeof(string), "%sBrak\n", string);
		DynamicGui_AddBlankRow(playerid);
	}

	ShowPlayerDialogEx(playerid, 4192, DIALOG_STYLE_LIST, "Opis", string, "Ok", "X");
	return 1;
}


//end