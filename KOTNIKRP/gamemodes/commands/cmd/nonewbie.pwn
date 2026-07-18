//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ nonewbie ]-----------------------------------------------//
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

YCMD:nonewbie(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        new string[128];
		if (PlayerInfo[playerid][pAdmin] >= 5 || IsAScripter(playerid) )
		{
			if(!newbie)
			{
				newbie = 1;
				BroadCast(COLOR_GRAD2, "Czat newbie został zablokowany przez Administratora!");
			}
			else
			{
				newbie = 0;
				SendClientMessageToAll(COLOR_P@,"|_________________________Rada dnia: czat /n(ewbie)_________________________|");
				SendClientMessageToAll(COLOR_WHITE,"Czat {ADFF2F}/n{FFFFFF} jest przeznaczony głównie dla newbie - czyli nowych graczy.");
				SendClientMessageToAll(COLOR_WHITE,"Jeżeli jesteś nowym graczem i masz jakieś pytanie nie krępuj się i zadaj je na /n [pytanie] !");
				SendClientMessageToAll(COLOR_WHITE,"Gdy jednak początki gry masz już za sobą, nie zadawaj pytań a jedynie udzielaj odpowiedzi :)");
				SendClientMessageToAll(COLOR_WHITE,"Obowiązują jednak pewne {FFA500}zasady{FFFFFF} dot. tego czatu których trzeba przestrzegać:");
				SendClientMessageToAll(COLOR_WHITE,"1. Czat służy tylko do zadawania pytań i odpowiedzi!");
				SendClientMessageToAll(COLOR_WHITE,"2. Na czacie nie witamy się || 3. Nie udzielamy odpowiedzi na /w - wszytkie odpowiedzi udzielamy na /n )");
				SendClientMessageToAll(COLOR_WHITE,"4. Jeżeli chcesz ogłosić, że 'pomagasz  w RP' to nie tutaj, gdyż to własnie na tym czacie tej pomocy udzielamy! )");
				SendClientMessageToAll(COLOR_WHITE,"Jeżeli nie chcesz widzieć tego czatu, mozesz go wyłączyć komendą {CD5C5C}/togn");
				SendClientMessageToAll(COLOR_P@,"|________________________>>> M-RP <<<________________________|");
				BroadCast(COLOR_GRAD2, "Czat newbie został odblokowany przez Administratora !");
			}
			
			format(string, 128, "CMD_Info: /nonewbie użyte przez %s [%d]", GetNickEx(playerid), playerid);
			SendCommandLogMessage(string);
			Log(adminLog, WARNING, "Admin %s użył /nonewbie", GetPlayerLogName(playerid));
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
