//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ app ]--------------------------------------------------//
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

YCMD:app(playerid, params[], help) {
    if(GetPVarInt(playerid, "pozwolenie-oferuje") == 999) return sendErrorMessage(playerid, "Nikt nie oferował Ci pozwolenia prawniczego!");
    new ofertaod = GetPVarInt(playerid, "pozwolenie-oferuje");
    if(!IsPlayerConnected(ofertaod)) return sendErrorMessage(playerid, "Osoba, która oferowała Ci pozwolenie wyszła z serwera!");
    if(GetPVarInt(ofertaod, "pozwolenie-oferujeDla") != playerid) return sendErrorMessage(playerid, "Osoba, która oferowała Ci pozwolenie wyszła z serwera!");
    if(kaska[playerid] < CENA_POZWOLENIE) return sendErrorMessage(playerid, "Nie stać Cie na pozwolenie prawnicze");
    new string[128];
    format(string, sizeof(string), "%s akceptował Twoją ofertę pozwolenia prawiczego, otrzymujesz $"#CENA_POZWOLENIE_ZYSK, GetNick(playerid));
    sendTipMessage(ofertaod, string, COLOR_LIGHTBLUE);
    format(string, sizeof(string), "Otrzymujesz pozwolenie prawnicze od %s", GetNick(ofertaod));
    sendTipMessage(playerid, string, COLOR_LIGHTBLUE);
    format(string, sizeof(string), "* %s dał zgodę na uwolnienie więźnia prawnikowi %s", GetNick(ofertaod), GetNick(playerid));
    SendRadioMessage(1, COLOR_PANICRED, string);
    SendRadioMessage(2, COLOR_PANICRED, string);
    SendRadioMessage(3, COLOR_PANICRED, string);
    ZabierzKaseDone(playerid, CENA_POZWOLENIE);
    DajKaseDone(ofertaod, CENA_POZWOLENIE_ZYSK);
    Log(payLog, WARNING, "%s kupił pozwolenie prawnicze od %s za "#CENA_POZWOLENIE" zysk: "#CENA_POZWOLENIE_ZYSK, GetPlayerLogName(playerid), GetPlayerLogName(ofertaod));
    SetPVarInt(playerid, "pozwolenie-oferuje", 999);
    Sejf_Add(1, CENA_POZWOLENIE_SEJF);
    ApprovedLawyer[playerid] = 1;
    Log(payLog, WARNING, "%s dał zgodę prawniczą %s", GetPlayerLogName(ofertaod), GetPlayerLogName(playerid));
    return 1;
}
