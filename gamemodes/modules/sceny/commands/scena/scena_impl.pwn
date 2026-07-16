//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
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
// Autor: mrucznik
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_scena_Impl(playerid)
{
    if(GetPlayerFraction(playerid) == FRAC_SN && PlayerInfo[playerid][pAdmin] < 1)
    {
        if(GetPVarInt(playerid, "scena-allow") != 1)
        {
            if(PlayerInfo[playerid][pRank] < 4) return sendTipMessageEx(playerid, COLOR_GRAD2, "Scena dostêpna za pozwoleniem adminów i od 4 rangi!");
            else
            {
                if(GetPVarInt(playerid, "scena-req") == 1)
                {
                    new str[128];
                    format(str, 128, "××× Gracz %s (ID: %d) prosi o pozwolenie na zarz¹dzanie scen¹.", GetNick(playerid), playerid);
                    SendAdminMessage(COLOR_PANICRED, str);
                    SetPVarInt(playerid, "scena-req", 2);
                }
                else if(GetPVarInt(playerid, "scena-req") == 0)
                {
                    SendClientMessage(playerid, COLOR_RED, "Mo¿esz tworzyæ scenê za pozwoleniem administracji. Aby wys³aæ zapytanie wpisz ponownie /scena");
                    SetPVarInt(playerid, "scena-req", 1);
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_RED, "Czekaj na akceptacjê administracji!");
                }
            }
        }
    }
    if(PlayerInfo[playerid][pAdmin] < 200 && GetPVarInt(playerid, "scena-allow") != 1) return 1;
    if(GetPlayerFraction(playerid) != FRAC_SN && SN_ACCESS[playerid] == 0)
    {
        ShowPlayerDialogEx(playerid, SCENA_DIALOG_GETMONEY, DIALOG_STYLE_MSGBOX, "M-RP", "Aby postawiæ scenê w swoim zakresie musisz umieœciæ op³atê\nW sejf San News w wysokoœci 2 milionów!!!!\nJe¿eli organizujesz event OOC zg³oœ siê do lidera SN po pozwolenie na scenê (darmow¹)", "Zap³aæ", "Anuluj");
        return 1;
    }
    ShowPlayerDialogEx(playerid, SCENA_DIALOG_MAIN, DIALOG_STYLE_LIST, "Zarz¹dzanie scen¹", "Zbuduj scenê » Zniszcz scenê\nZarz¹dzanie ekranem\nZarz¹dzanie neonami\nDodatkowe efekty\nAudio URL\nMaszyny do dymu", "Wybierz", "Wyjdz");
    return 1;
}

//end
