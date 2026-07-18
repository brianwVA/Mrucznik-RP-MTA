//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ pozwolenie ]----------------------------------------------//
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

YCMD:pozwolenie(playerid, params[], help) {
    if(!IsAPolicja(playerid)) return sendErrorMessage(playerid, "Nie jesteś policjantem!");
    new komu;
    if(sscanf(params, "k<fix>", komu)) return sendTipMessage(playerid, "Użyj /pozwolenie [id gracza / część nazwy]");
    if(!IsPlayerConnected(komu)) return sendErrorMessage(playerid, "Nie ma takiego gracza!");
    if(!ProxDetectorS(4.5, playerid, komu)) return sendErrorMessage(playerid, "Tego gracza nie ma w pobliżu!");
    if(PlayerInfo[komu][pJob] != 2 && !CheckPlayerPerm(komu, PERM_LAWYER)) return sendErrorMessage(playerid, "Gracz nie jest prawnikiem!");
    SetPVarInt(komu, "pozwolenie-oferuje", playerid);
    SetPVarInt(playerid, "pozwolenie-oferujeDla", komu);
    new string[128];
    format(string, sizeof(string), "Zaoferowałeś %s pozwolenie prawnicze za $"#CENA_POZWOLENIE, GetNick(komu));
    sendTipMessage(playerid, string, COLOR_LIGHTBLUE);
    format(string, sizeof(string), "%s zaoferował Ci pozwolenie prawnicze za $"#CENA_POZWOLENIE". Akceptuj za pomocą /app", GetNick(playerid));
    sendTipMessage(komu, string, COLOR_LIGHTBLUE);
    return 1;
}
