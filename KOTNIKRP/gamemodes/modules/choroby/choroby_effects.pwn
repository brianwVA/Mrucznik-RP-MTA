//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  choroby                                                  //
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
// Autor: Mrucznik
// Data utworzenia: 07.02.2020
//Opis:
/*
	System chorób.
*/

//

//-----------------<[ Funkcje: ]>-------------------
//Koronawirus

timer LoweringHP[500](playerid, uid, hpLoss, bool:death, bool:freeze)
{
	if(!IsPlayerConnected(playerid) || uid != PlayerInfo[playerid][pUID]) 
		return;

	if(hpLoss <= 0) 
	{
		if(freeze) TogglePlayerControllable(playerid, 1);
		return;
	}

	new Float:hp;
	GetPlayerHealth(playerid, hp);
	if(hp <= 2)
	{
		if(death)
		{
			ChatMe(playerid, "stracił przytomność na skutek choroby");
			NadajRanny(playerid, INJURY_TIME_DISEASES);
		}
		return;
	}
	SetPlayerHealth(playerid, hp-1);

	defer LoweringHP(playerid, uid, hpLoss-1, death, freeze);
}

public WuhanCouching(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna kaszleć.");
	ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 0, 0, 1);
	return 1;
}
public DusznosciEffect(playerid, disease, value)
{
	ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0999, 0, 1, 1, 1, 1, 1);
	ChatMe(playerid, "zaczyna się dusić.");
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, true, false);
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}
public FeverEffect(playerid, disease, value)
{
	ChatMe(playerid, "ma gorączkę, poci się i czuje się słabo.");
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	new Float:loss = value;
	SetPlayerHealth(playerid, (hp - loss <= 0) ? 1.0 : hp-loss);
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}
public KoronawirusDeathEffect(playerid, disease, value)
{
	ChatDo(playerid, sprintf("Koronawirus doszczętnie wyniszczył organizm %s", GetNick(playerid)));
	ChatMe(playerid, "upada na ziemie i zaczyna umierać");
	TogglePlayerControllable(playerid, 0);
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, true, true);
	ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0999, 0, 1, 1, 1, 1, 1);
	return 1;
}

//Grypa
public FeelingBadEffect(playerid, disease, value)
{
	ChatMe(playerid, "poczuł się źle.");
	ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.0999, 0, 0, 0, 0, 0, 1);
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}
public CouchingEffect(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna kaszleć.");
	ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 0, 0, 1);

	if(random(20) == 1)//5% szans
	{
		InfectOrDecreaseImmunity(playerid, ZAPALENIE_PLUC);
	}
	return 1;
}
public HPLossEffect(playerid, disease, value)
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	new Float:loss = value;
	SetPlayerHealth(playerid, (hp - loss <= 0) ? 1.0 : hp-loss);
	ChatMe(playerid, "czuje się słabo.");
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}

//Zapalenie płuc
public HPLossToDeathEffect(playerid, disease, value)
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	new Float:loss = value;
	if(hp - loss <= 0)
	{
		NadajRanny(playerid, INJURY_TIME_DISEASES);
	}
	else SetPlayerHealth(playerid, hp-loss);
	ChatMe(playerid, "poczuł mocny ból.");
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}

//Zatrucie
public FartEffect(playerid, disease, value)
{
	ChatDo(playerid, sprintf("wokół %s unosi się nieprzyjemna woń przetrawionego jedzenia.", GetNick(playerid)));
	return 1;
}
public DiarrheaEffect(playerid, disease, value)
{
	ChatDo(playerid, sprintf("z nogawki %s cieknie brązowy płyn.", GetNick(playerid)));
	return 1;
}
public ShittingEffect(playerid, disease, value)
{
	ChatMe(playerid, "nie wytrzymuje ciśnienia i zaczyna defekować się w gacie.");
	return 1;
}
public AbdominalPainEffect(playerid, disease, value)
{
	ChatMe(playerid, "czuje ostry ból żołądka.");
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	new Float:loss = value;
	SetPlayerHealth(playerid, (hp - loss <= 0) ? 1.0 : hp-loss);
}
public VomitEffect(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna wymiotować.");
	ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 4.0999, 0, 0, 0, 0, 0, 1);
	return 1;
}

//Padaka
public EpilepsyEffect(playerid, disease, value)
{
	ApplyAnimation(playerid, "CRACK", "crckdeth1", 4.1, 0, 1, 1, 1, 1, 1);
	ChatMe(playerid, "upada na ziemię i zaczyna się trząść oraz wykonywać niekontrolowane ruchy.");
	TogglePlayerControllable(playerid, 0);
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, true, true);
	return 1;
}

//Tourett
public TourettShoutEffect(playerid, disease, value)
{
	//TODO:
	// static shouts[][] = {
	// 	""
	// };

	// Krzyk(playerid, shouts[random(sizeof(shouts))]);
	switch(random(4))
	{
		case 0: ChatMe(playerid, "chrząka.");
		case 1: ChatMe(playerid, "wykonuje tik nerwowy.");
		case 2: ChatMe(playerid, "uderza się dłonią w głowę.");
		case 3: ChatMe(playerid, "miauczy.");
	}
}
public TourettPermanentEffect(playerid, disease, value)
{
	TourettActive[playerid] = 1;
}
public TourettPermanentEffect_Off(playerid, disease, value)
{
	TourettActive[playerid] = 0;
}

//Astma
public AnaphylacticShock(playerid, disease, value)
{
	ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0999, 0, 1, 1, 1, 1, 1);
	ChatMe(playerid, "nie może oddychać i zaczyna się dusić.");
	TogglePlayerControllable(playerid, 0); //TODO: nie odmrażać gdy gracz już był zamrożony
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, true, true);
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}

//Schizofrenia paranoidalna
//TODO: więcej efektów
timer HallucinationsOff[60000](playerid)
{
	SetPlayerWeather(playerid, ServerWeather);
}

public HallucinationsEffect(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna widzieć niestworzone rzeczy.");
	SetPlayerDrunkLevel(playerid, 8000);
	SetPlayerWeather(playerid, -66);
	defer HallucinationsOff(playerid);
	return 1;
}

//Zombie effects
public ZombieSkinEffect(playerid, disease, value)
{
	//TODO
	SetPlayerSkin(playerid, 20004+random(3));
	return 1;
}
public ZombieSkinEffect_Off(playerid, disease, value)
{
	SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	return 1;
}
public ZombieTalkEffect(playerid, disease, value)
{
	//TODO
}

//HIV
public ReducedImmunityEffect(playerid, disease, value)
{
	ChatMe(playerid, "czuje, że jego organizm ma obniżoną odporność");
	DecreasePlayerImmunity(playerid, MAX_PLAYER_IMMUNITY);
	return 1;
}
public RandomInfectionEffect(playerid, disease, value)
{
	new rand = random(eDiseases);
	InfectPlayer(playerid, eDiseases:rand);
}

//Astygmatyzm
public AstigmatismEffect(playerid, disease, value)
{
	ChatMe(playerid, "widzi niewyraźnie.");
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 1);
	return 1;
}
public AstigmatismEffect_Off(playerid, disease, value)
{
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 1000);
	return 1;
}

//Parkinson/niedowład rąk
public ShakingHandsEffect(playerid, disease, value)
{
	ChatDo(playerid, sprintf("ręce %s zaczynają się trząść w niekontrolowany przez niego sposób.", GetNick(playerid)));
	return 1;
}
public ShootingSkillEffect(playerid, disease, value)
{
	ChatMe(playerid, "trzęsą mu się ręce.");
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 1);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 1);

	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 1);

	return 1;
}
public ShootingSkillEffect_Off(playerid, disease, value)
{
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 1000);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
	return 1;
}

//Uraz
public BleedingEffect(playerid, disease, value)
{
	ChatDo(playerid, sprintf("Z rany %s zaczyna płynąć krew.", GetNick(playerid)));
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, false, false);
	return 1;
}
public GetGangreneEffect(playerid, disease, value)
{
	if(random(20) == 1) //5% szans
	{
		InfectOrDecreaseImmunity(playerid, GANGRENA);
	}
	return 1;
}
public FaintEffect(playerid, disease, value)
{
	ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0999, 0, 1, 1, 1, 1, 1);
	ChatMe(playerid, "omdlał.");
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}

//Gangrena
public PurulenceEffect(playerid, disease, value)
{
	ChatDo(playerid, sprintf("Z rany %s zaczyna wyciekać ropa.", GetNick(playerid)));
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, true, false);

	if(random(20) == 0)
	{
		InfectPlayer(playerid, PARKINSON);
	}
	return 1;
}
public RottenFleshEffect(playerid, disease, value)
{
	ChatMe(playerid, "gorączkuje, a z jego rany wydobywa się smród zgnilizny.");
	defer LoweringHP(playerid, PlayerInfo[playerid][pUID], value, false, false);
	SetPlayerDrunkLevel(playerid, 5000);
	return 1;
}

//PTSD
public HideWeaponEffect(playerid, disease, value)
{
	SetPlayerArmedWeapon(playerid, 0);
	ChatMe(playerid, "jest wyraźnie zestresowany");
	Krzyk(playerid, "RATUNKU, POMOCY! To znowu Oni!");
	return 1;
}
public ThrowWeaponEffect(playerid, disease, value)
{
	new weapon = GetPlayerWeapon(playerid);
	ChatMe(playerid, "przerażony powracającymi wspomnieniami w postaci halucynacji, wyrzuca trzymaną broń.");
	RemoveWeaponFromSlot(playerid, GetWeaponSlot(weapon));
	return 1;
}
public ThrowAllWeaponsEffect(playerid, disease, value)
{
	ChatMe(playerid, "panikuje i pozbywa się wszelkiego uzbrojenia.");
	Command_ReProcess(playerid, "wyrzucbronie", false);
	return 1;
}
public FearEffect(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna odczuwać irracjonalny strach.");
	ApplyAnimation(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

//others
public BlackoutEffect(playerid, disease, value)
{
	ShowPlayerFadeScreenToBlank(playerid, 20, 255, 255, 255, 255);
	SetPlayerDrunkLevel(playerid, 3000);
	return 1;
}
public DeathEffect(playerid, disease, value)
{
	ChatMe(playerid, "stracił przytomność na skutek choroby");
	NadajRanny(playerid, INJURY_TIME_DISEASES);
	return 1;
}

//0k
public OKEffect(playerid, disease, value)
{
	ChatIC(playerid, "0k");
}
public OKPermanentEffect(playerid, disease, value)
{
	OKActive[playerid] = 1;
}
public OKPermanentEffect_Off(playerid, disease, value)
{
	OKActive[playerid] = 0;
}


//effects timers

