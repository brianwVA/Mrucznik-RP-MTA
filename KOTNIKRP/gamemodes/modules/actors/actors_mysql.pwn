//-----------------------------------------------<< Source >>------------------------------------------------//
//                                              ActorSystem                                                  //
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
// Autor: never 
// Data utworzenia: 28.05.2021
//Opis:
/*

*/

//

//-----------------<[ Funkcje: ]>-------------------
//-----------------<[ Timery: ]>-------------------
//------------------<[ MySQL: ]>--------------------
public LoadAnimations()
{
	new anim_id = 0, Cache:result;
	
	result = mysql_query(Database, "SELECT * FROM `mru_anims`");
	
	for(new i = 0; i < cache_num_rows(); i++)
	{
		//ds[12]s[16]s[24]fdddddd
		anim_id ++;
		cache_get_value_index_int(i, 0, AnimInfo[anim_id][aUID]);
		cache_get_value_index(i, 1, AnimInfo[anim_id][aCommand]);
		cache_get_value_index(i, 2, AnimInfo[anim_id][aLib]);
		cache_get_value_index(i, 3, AnimInfo[anim_id][aName]);
		cache_get_value_index_float(i, 4, AnimInfo[anim_id][aSpeed]);
		cache_get_value_index_int(i, 5, AnimInfo[anim_id][aOpt1]);
		cache_get_value_index_int(i, 6, AnimInfo[anim_id][aOpt2]);
		cache_get_value_index_int(i, 7, AnimInfo[anim_id][aOpt3]);
		cache_get_value_index_int(i, 8, AnimInfo[anim_id][aOpt4]);
		cache_get_value_index_int(i, 9, AnimInfo[anim_id][aOpt5]);
		cache_get_value_index_int(i, 10, AnimInfo[anim_id][aAction]);
	}
	
	cache_delete(result);
	
	printf("Wczytano %d animacje.", anim_id);
	return 1;
}

public LoadActors()
{
	new actors = 0, Cache:result;
	new uid;
	
	result = mysql_query(Database, "SELECT * FROM `mru_aktorzy`");
	
	for(new i = 0; i < cache_num_rows(); i++)
	{
		//p<|>ds[32]dfffdfd
		cache_get_value_index_int(i, 0, uid);

		cache_get_value_index_int(i, 0, ActorInfo[uid][aUID]);
		cache_get_value_index(i, 1, ActorInfo[uid][aName]);
		cache_get_value_index_int(i, 2, ActorInfo[uid][aSkin]);
		cache_get_value_index_float(i, 3, ActorInfo[uid][aPosX]);
		cache_get_value_index_float(i, 4, ActorInfo[uid][aPosY]);
		cache_get_value_index_float(i, 5, ActorInfo[uid][aPosZ]);
		cache_get_value_index_int(i, 6, ActorInfo[uid][aVW]);
		cache_get_value_index_float(i, 7, ActorInfo[uid][aAngle]);
		cache_get_value_index_int(i, 8, ActorInfo[uid][aAnimId]);
			
		ActorInfo[uid][aActor] = INVALID_ACTOR_ID;
		SpawnActor(uid);
		
		actors++;
	}
	
	cache_delete(result);
	
	printf("Wczytano %d aktorów.", actors);
	return 1;
}
//-----------------<[ Komendy: ]>-------------------

//end