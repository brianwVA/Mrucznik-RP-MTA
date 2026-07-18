//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ aktor ]-------------------------------------------------//
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

YCMD:aktor(playerid, params[], help)
{
    if(PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
	{
		new comm1[16],comm2[64], string[256];
		if(sscanf(params, "s[16]S()[64]", comm1, comm2))
			return sendTipMessage(playerid,"Użyj: /aktor [stworz | usun | goto | lista]");
		else
		{
			if(!strcmp(comm1, "stworz", true))
			{
				new skin, nick[32];
				if(sscanf(comm2, "dS()[32]", skin, nick))
					return sendTipMessage(playerid,"Użyj: /aktor stworz [skin] [nick]");
				else
				{
					new Float:x,Float:y,Float:z,Float:angle;
					GetPlayerPos(playerid, x, y,z);
					GetPlayerFacingAngle(playerid, angle);
					new uid = AddActor(nick,skin,x,y,z,angle,GetPlayerVirtualWorld(playerid));
					format(string, sizeof(string), "Aktor %s [UID:%d] został stworzony.",nick,uid);
					SendClientMessage(playerid, COLOR_GREEN, string);
					//SendClientMessageFormat(playerid,COLOR_GREEN,"Aktor %s [UID:%d] został stworzony.",nick,uid);
				}
			}
			if(!strcmp(comm1, "usun", true))
			{
				new uid;
				if(sscanf(comm2, "d", uid))
				{
					return sendTipMessage(playerid,"Użyj: /aktor usun [uid]");
				}
				if(uid < 0 || uid >= MAX_ACTORS || ActorInfo[uid][aUID] == 0 )
					return sendErrorMessage(playerid, "Niepoprawne id aktora");
				
				DeleteActor(uid);
				format(string, sizeof(string), "Aktor o uid %d został usunięty.",uid);
				SendClientMessage(playerid, COLOR_GREEN, string);
				//SendClientMessageFormat(playerid, COLOR_GREEN, "Aktor o uid %d został usunięty.",uid);
			}
			else if(!strcmp(comm1, "lista", true))
			{
				SendClientMessage(playerid, COLOR_GREEN,"*Lista aktorów*");
				ForeachEx(i, MAX_ACTORS)
				{
					if(ActorInfo[i][aUID])
					{
						format(string,sizeof(string),"%d:{ffffff} %s", i, ActorInfo[i][aName]);
						SendClientMessage(playerid, COLOR_GREEN, string);
					}
				}
			}
			else if(!strcmp(comm1,"anim",true))
			{
				new uid, animtext[32];
				if(sscanf(comm2, "dS()[32]", uid, animtext))
				{
					return sendTipMessage(playerid, "Użyj: /aktor anim [uid] [nazwa animacji]");
				}
				if(uid < 0 || uid >= MAX_ACTORS || ActorInfo[uid][aUID] == 0 )
					return sendErrorMessage(playerid, "Niepoprawne id aktora");
				ForeachEx(anim_id, MAX_ANIMS)
				{
					if(!isnull(AnimInfo[anim_id][aCommand]))
					{
						if(!strcmp(animtext, AnimInfo[anim_id][aCommand], true) && AnimInfo[anim_id][aAction] != 2)
						{
							ActorInfo[uid][aAnimId] = anim_id;
							ApplyActorAnimation(ActorInfo[uid][aActor], AnimInfo[anim_id][aLib], AnimInfo[anim_id][aName], AnimInfo[anim_id][aSpeed], AnimInfo[anim_id][aOpt1], AnimInfo[anim_id][aOpt2], AnimInfo[anim_id][aOpt3], AnimInfo[anim_id][aOpt4], AnimInfo[anim_id][aOpt5]);
							
							new query[256];
							format(query,sizeof(query),"UPDATE `mru_aktorzy` SET `anim` = '%d' WHERE `uid` = '%d'",anim_id,uid);
							mysql_query(Database, query);
							break;
						}
					}
				}
			}
			else if(!strcmp(comm1,"goto",true))
			{
				new uid;
				if(sscanf(comm2, "d", uid))
				{
					return sendTipMessage(playerid, "Użyj: /aktor goto [uid]");
				}
				if(uid < 0 || uid >= MAX_ACTORS || ActorInfo[uid][aUID] == 0 )
					return sendErrorMessage(playerid, "Niepoprawne id aktora");
				
				SetPlayerPos(playerid, ActorInfo[uid][aPosX] + 0.8, ActorInfo[uid][aPosY], ActorInfo[uid][aPosZ]);
				SetPlayerVirtualWorld(playerid, ActorInfo[uid][aVW]);
			}
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz uprawnień.");
	}
    return 1;
}
