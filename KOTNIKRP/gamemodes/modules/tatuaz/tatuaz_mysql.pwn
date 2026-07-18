//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   tatuaz                                                  //
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
// Data utworzenia: 23.06.2023
//Opis:
/*
	
*/

//

//-----------------<[ MySQL: ]>-------------------

stock LoadPlayerTattoo(playerid)
{   
    inline OnTattooLoaded()
    {
        for(new i = 0; i < cache_num_rows(); i++)
        {
            new slot = GetFreeSlotTattoo(playerid);
            if(slot == -1) break;
            cache_get_value_index_int(i, 0, PlayerTattoo[playerid][slot][t_UID] );
            cache_get_value_index_int(i, 1, PlayerTattoo[playerid][slot][t_ID] );
            cache_get_value_index_float(i, 2, PlayerTattoo[playerid][slot][t_offsetX] );
            cache_get_value_index_float(i, 3, PlayerTattoo[playerid][slot][t_offsetY] );
            cache_get_value_index_float(i, 4, PlayerTattoo[playerid][slot][t_offsetZ]);
            cache_get_value_index_float(i, 5,             PlayerTattoo[playerid][slot][t_RX] );
            cache_get_value_index_float(i, 6,             PlayerTattoo[playerid][slot][t_RY] );
            cache_get_value_index_float(i, 7,             PlayerTattoo[playerid][slot][t_RZ] );
            cache_get_value_index_int(i, 8,             PlayerTattoo[playerid][slot][t_bone]);
        }
    }

    new query[248];
    query = "`UID`, `ID`, `offsetX`, `offsetY`, `offsetZ`, `rX`, `rY`, `rZ`, `bone`";
    format(query, sizeof(query), "SELECT %s FROM `mru_tattoo` WHERE `owner` = '%d'", query, PlayerInfo[playerid][pUID]);
    MySQL_TQueryInline(Database, using inline OnTattooLoaded, query);
    return 1;
}