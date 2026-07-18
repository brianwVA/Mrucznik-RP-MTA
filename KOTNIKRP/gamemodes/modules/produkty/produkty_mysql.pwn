//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                  produkty                                                 //
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
// Data utworzenia: 31.05.2021
//Opis:
/*
	System produktów dla organizacji
*/

//

//------------------<[ MySQL: ]>--------------------

stock LoadProducts()
{
	new id, Cache:result;
	result = mysql_query_format("SELECT * FROM `mru_products` LIMIT %d", MAX_PRODUCTS);
	for(new i = 0; i < cache_num_rows(); i++)
	{
		id = Iter_Free(Products);
		if(id == -1) return 0;
		cache_get_value_index_int(i, 0,                 Product[id][p_UID] );
		cache_get_value_index_int(i, 1,                 Product[id][p_OrgID] );
		cache_get_value_index(i, 2,             Product[id][p_ProductName] );
		cache_get_value_index_int(i, 3,                 Product[id][p_Price] );
		cache_get_value_index_int(i, 4,                 Product[id][p_Value1] );
		cache_get_value_index_int(i, 5,                 Product[id][p_Value2]);
		cache_get_value_index_int(i, 6,                 Product[id][p_ItemType]);
		cache_get_value_index_int(i, 7,                 Product[id][p_Quant]);
		Iter_Add(Products, id);
	}
	cache_delete(result);
	printf("Zaladowano %d produktow.", Iter_Count(Products));
	return 1;
}

//end