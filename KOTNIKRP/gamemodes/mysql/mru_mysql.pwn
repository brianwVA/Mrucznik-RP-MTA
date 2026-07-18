//mru_mysql.pwn

new bool:MYSQL_ON = true;
new bool:MYSQL_SAVING = true;

//Moje funkcje:

//--------------------------------------------------------------<[ Konta ]>--------------------------------------------------------------

MruMySQL_Connect()
{
	if(!MYSQL_ON) return 0;

	Database = mysql_connect_file();
	if(Database != MYSQL_INVALID_HANDLE && mysql_errno(Database) == 0)
	{
		print("MYSQL: Polaczono sie z baza MySQL");
	}
	else
	{
		new err[256];
		mysql_error(err);
		printf("MYSQL: Nieudane polaczenie z baza MySQL: %s", err);
		SendRconCommand("gamemodetext Brak polaczenia MySQL");
		SendRconCommand("exit");
		return 0;
	}
	mysql_set_charset("cp1250", Database);
	//mysql_query(Database, "SET NAMES 'cp1250'");
	return 1;
}
MruMySQL_CreateAccount(playerid, password[])
{
	if(!MYSQL_ON) return 0;
	
	new query[256+WHIRLPOOL_LEN+SALT_LENGTH];
    new hash[WHIRLPOOL_LEN], salt[SALT_LENGTH];
	randomString(salt, sizeof(salt));
	WP_Hash(hash, sizeof(hash), sprintf("%s%s%s", ServerSecret, password, salt));
	format(query, sizeof(query), "INSERT INTO `mru_konta` (`Nick`, `Key`, `Salt`) VALUES ('%s', '%s', '%s')", GetNickEx(playerid), hash, salt);
	mysql_query(Database, query);
	return 1;
}

MruMySQL_SaveAccount(playerid, bool:forcegmx = false, bool:forcequit = false)
{
	if(!MYSQL_ON) return 0;
    if(GLOBAL_EXIT) return 0;
    if(gPlayerLogged[playerid] != 1) return 0;

    if(forcequit)
    {
        //Punkty karne
        if(PlayerInfo[playerid][pPK] > 0) PoziomPoszukiwania[playerid] += 10000+(PlayerInfo[playerid][pPK]*100);
        
    }

	new query[2048], bool:fault=true;

	if(forcegmx == false) GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);

	PlayerInfo[playerid][pCash] = kaska[playerid];

    if(PlayerInfo[playerid][pLevel] == 0)
    {
        Log(mysqlLog, ERROR, "MySQL:: %s - błąd zapisu konta (zerowy level)!!!", GetPlayerLogName(playerid));
        return 0;
    }

	//wyłącz na chwilkę maskowanie nicku (pNick)
	new maska_nick[24];
	if(GetPVarString(playerid, "maska_nick", maska_nick, 24))
	{
		format(PlayerInfo[playerid][pNick], 24, "%s", maska_nick);
	}

	orm_update(PlayerInfo[playerid][pORM]);
	orm_save(PlayerInfo[playerid][pORM]);
	if(forcequit || forcegmx) orm_destroy(PlayerInfo[playerid][pORM]);

	format(query, sizeof(query), "INSERT IGNORE INTO `mru_personalization` (`UID`) VALUES ('%d')", PlayerInfo[playerid][pUID]);
	mysql_query(Database, query);
	format(query, sizeof(query), "UPDATE `mru_personalization` SET \
	`KontoBankowe` = '%d', \
	`Ogloszenia` = '%d', \
	`LicznikPojazdu` = '%d', \
	`OgloszeniaRodzin` = '%d', \
	`OldNick` = '%d', \
	`CBRadio` = '%d', \
	`Report` = '%d', \
	`DeathWarning` = '%d', \
	`KaryTXD` = '%d', \
	`NewNick` = '%d', \
	`newbie` = '%d',	\
	`BronieScroll` = '%d', \
	`AnimacjaMowienia` = '%d',	\
	`JoinLeave` = '%d',	\
	`OgloszeniaTyp` = '%d',	\
	`KomunikatyAresztowania` = '%d',	\
	`KomunikatyNews` = '%d'	\
	WHERE `UID`= '%d'",
	PlayerPersonalization[playerid][PERS_KB],
	PlayerPersonalization[playerid][PERS_AD],
	PlayerPersonalization[playerid][PERS_LICZNIK],
	PlayerPersonalization[playerid][PERS_FAMINFO],
	PlayerPersonalization[playerid][PERS_NICKNAMES],
	PlayerPersonalization[playerid][PERS_CB],
	PlayerPersonalization[playerid][PERS_REPORT],
	PlayerPersonalization[playerid][WARNDEATH],
	PlayerPersonalization[playerid][PERS_KARYTXD],
	PlayerPersonalization[playerid][PERS_NEWNICK],
	PlayerPersonalization[playerid][PERS_NEWBIE],
	PlayerPersonalization[playerid][PERS_GUNSCROLL],
	PlayerPersonalization[playerid][PERS_TALKANIM],
	PlayerPersonalization[playerid][PERS_JOINLEAVE],
	PlayerPersonalization[playerid][PERS_OG_TYPE],
	PlayerPersonalization[playerid][PERS_ARREST_MSG],
	PlayerPersonalization[playerid][PERS_NEWS_MSG],
	PlayerInfo[playerid][pUID]); 

	//przywróć maskowanie nicku (pNick)
	if(GetPVarString(playerid, "maska_nick", maska_nick, 24))
	{
		new playernickname[MAX_PLAYER_NAME + 1];
		GetPlayerName(playerid, playernickname, sizeof(playernickname));
		format(PlayerInfo[playerid][pNick], 24, "%s", playernickname);
	}

	if(!mysql_query(Database, query)) fault=false;
	
    //Zapis MruCoinow
    MruMySQL_SaveMc(playerid);

    saveLegale(playerid);

    saveKevlarPos(playerid);

	if(rgRakNet_SaveWeapons[playerid] == 1)
    {
    	RestoreOldWeapons(playerid, PlayerInfo[playerid][pUID]);
    }

	return fault;
}

stock MruMySQL_CreateORM(playerid)
{

	new ORM:orm = PlayerInfo[playerid][pORM] = orm_create("mru_konta", Database);

	orm_addvar_int(orm, PlayerInfo[playerid][pUID], "UID");
	orm_addvar_string(orm, PlayerInfo[playerid][pNick], 24, "Nick");
	orm_addvar_string(orm, PlayerInfo[playerid][pKey], 129, "Key");
	orm_addvar_string(orm, PlayerInfo[playerid][pSalt], SALT_LENGTH, "Salt");
	orm_addvar_int(orm, PlayerInfo[playerid][pLevel], "Level");
	orm_addvar_int(orm, PlayerInfo[playerid][pAdmin], "Admin");
	orm_addvar_int(orm, PlayerInfo[playerid][pDonateRank], "DonateRank");
	orm_addvar_int(orm, PlayerInfo[playerid][gPupgrade], "UpgradePoints");
	orm_addvar_int(orm, PlayerInfo[playerid][pConnectTime], "ConnectedTime");
	orm_addvar_int(orm, PlayerInfo[playerid][pReg], "Registered");
	orm_addvar_int(orm, PlayerInfo[playerid][pSex], "Sex");
	orm_addvar_int(orm, PlayerInfo[playerid][pAge], "Age");
	orm_addvar_int(orm, PlayerInfo[playerid][pOrigin], "Origin");
	orm_addvar_int(orm, PlayerInfo[playerid][pCK], "CK");
	orm_addvar_int(orm, PlayerInfo[playerid][pMuted], "Muted");
	orm_addvar_int(orm, PlayerInfo[playerid][pExp], "Respect");
	orm_addvar_int(orm, PlayerInfo[playerid][pCash], "Money");
	orm_addvar_int(orm, PlayerInfo[playerid][pAccount], "Bank");
	orm_addvar_int(orm, PlayerInfo[playerid][pCrimes], "Crimes");
	orm_addvar_int(orm, PlayerInfo[playerid][pKills], "Kills");
	orm_addvar_int(orm, PlayerInfo[playerid][pDeaths], "Deaths");
	orm_addvar_int(orm, PlayerInfo[playerid][pArrested], "Arrested");
	orm_addvar_int(orm, PlayerInfo[playerid][pWantedDeaths], "WantedDeaths");
	orm_addvar_int(orm, PlayerInfo[playerid][pPhoneBook], "Phonebook");
	orm_addvar_int(orm, PlayerInfo[playerid][pLottoNr], "LottoNr");
	orm_addvar_int(orm, PlayerInfo[playerid][pFishes], "Fishes");
	orm_addvar_int(orm, PlayerInfo[playerid][pBiggestFish], "BiggestFish");
	orm_addvar_int(orm, PlayerInfo[playerid][pJob], "Job");
	orm_addvar_int(orm, PlayerInfo[playerid][pPayCheck], "Paycheck");
	orm_addvar_int(orm, PlayerInfo[playerid][pHeadValue], "HeadValue");
	orm_addvar_int(orm, PlayerInfo[playerid][pBP], "BlokadaPisania");
	orm_addvar_int(orm, PlayerInfo[playerid][pJailed], "Jailed");
	orm_addvar_string(orm, PlayerInfo[playerid][pAJreason], MAX_AJ_REASON, "AJreason");
	orm_addvar_int(orm, PlayerInfo[playerid][pJailTime], "JailTime");
	orm_addvar_int(orm, PlayerInfo[playerid][pDrugs], "Drugs");
	orm_addvar_int(orm, PlayerInfo[playerid][pLider], "Lider");
	orm_addvar_int(orm, PlayerInfo[playerid][pChar], "Char");
	orm_addvar_int(orm, PlayerInfo[playerid][pSkin], "Skin");
	orm_addvar_int(orm, PlayerInfo[playerid][pJobSkin], "JobSkin");
	orm_addvar_int(orm, PlayerInfo[playerid][pContractTime], "ContractTime");
	orm_addvar_int(orm, PlayerInfo[playerid][pDetSkill], "DetSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pSexSkill], "SexSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pBoxSkill], "BoxSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pLawSkill], "LawSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pMechSkill], "MechSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pJackSkill], "JackSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pCarSkill], "CarSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pNewsSkill], "NewsSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pDrugsSkill], "DrugsSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pCookSkill], "CookSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pFishSkill], "FishSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pGunSkill], "GunSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pTruckSkill], "TruckSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pPizzaboySkill], "PizzaboySkill");
	orm_addvar_float(orm, PlayerInfo[playerid][pSHealth], "pSHealth");
	orm_addvar_float(orm, PlayerInfo[playerid][pHealth], "pHealth");
	orm_addvar_int(orm, PlayerInfo[playerid][pVW], "VW");
	orm_addvar_int(orm, PlayerInfo[playerid][pInt], "Int");
	orm_addvar_int(orm, PlayerInfo[playerid][pLocal], "Local");
	orm_addvar_int(orm, PlayerInfo[playerid][pTeam], "Team");
	orm_addvar_int(orm, PlayerInfo[playerid][pDom], "Dom");
	orm_addvar_int(orm, PlayerInfo[playerid][pBusinessOwner], "Bizz");
	orm_addvar_int(orm, PlayerInfo[playerid][pBusinessMember], "BizzMember");
	orm_addvar_int(orm, PlayerInfo[playerid][pWynajem], "Wynajem");
	orm_addvar_float(orm, PlayerInfo[playerid][pPos_x], "Pos_x");
	orm_addvar_float(orm, PlayerInfo[playerid][pPos_y], "Pos_y");
	orm_addvar_float(orm, PlayerInfo[playerid][pPos_z], "Pos_z");
	orm_addvar_int(orm, PlayerInfo[playerid][pCarLic], "CarLic");
	orm_addvar_int(orm, PlayerInfo[playerid][pFlyLic], "FlyLic");
	orm_addvar_int(orm, PlayerInfo[playerid][pBoatLic], "BoatLic");
	orm_addvar_int(orm, PlayerInfo[playerid][pFishLic], "FishLic");
	orm_addvar_int(orm, PlayerInfo[playerid][pGunLic], "GunLic");
	/*orm_addvar_int(orm, PlayerInfo[playerid][pGun0], "Gun0");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun1], "Gun1");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun2], "Gun2");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun3], "Gun3");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun4], "Gun4");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun5], "Gun5");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun6], "Gun6");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun7], "Gun7");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun8], "Gun8");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun9], "Gun9");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun10], "Gun10");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun11], "Gun11");
	orm_addvar_int(orm, PlayerInfo[playerid][pGun12], "Gun12");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo0], "Ammo0");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo1], "Ammo1");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo2], "Ammo2");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo3], "Ammo3");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo4], "Ammo4");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo5], "Ammo5");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo6], "Ammo6");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo7], "Ammo7");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo8], "Ammo8");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo9], "Ammo9");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo10], "Ammo10");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo11], "Ammo11");
	orm_addvar_int(orm, PlayerInfo[playerid][pAmmo12], "Ammo12");*/
	orm_addvar_int(orm, PlayerInfo[playerid][pCarTime], "CarTime");
	orm_addvar_int(orm, PlayerInfo[playerid][pPayDay], "PayDay");
	orm_addvar_int(orm, PlayerInfo[playerid][pPayDayHad], "PayDayHad");
	orm_addvar_int(orm, PlayerInfo[playerid][pCDPlayer], "CDPlayer");
	orm_addvar_int(orm, PlayerInfo[playerid][pWins], "Wins");
	orm_addvar_int(orm, PlayerInfo[playerid][pLoses], "Loses");
	orm_addvar_int(orm, PlayerInfo[playerid][pAlcoholPerk], "AlcoholPerk");
	orm_addvar_int(orm, PlayerInfo[playerid][pDrugPerk], "DrugPerk");
	orm_addvar_int(orm, PlayerInfo[playerid][pMiserPerk], "MiserPerk");
	orm_addvar_int(orm, PlayerInfo[playerid][pPainPerk], "PainPerk");
	orm_addvar_int(orm, PlayerInfo[playerid][pTraderPerk], "TraderPerk");
	orm_addvar_int(orm, PlayerInfo[playerid][pTut], "Tutorial");
	orm_addvar_int(orm, PlayerInfo[playerid][pMissionNr], "Mission");

	orm_addvar_int(orm, PlayerInfo[playerid][pBlock], "Block");
	orm_addvar_int(orm, PlayerInfo[playerid][pFuel], "Fuel");
	orm_addvar_int(orm, PlayerInfo[playerid][pMarried], "Married");
	orm_addvar_string(orm, PlayerInfo[playerid][pMarriedTo], 32, "MarriedTo");
	orm_addvar_int(orm, PoziomPoszukiwania[playerid], "PoziomPoszukiwania");
	orm_addvar_int(orm, PlayerInfo[playerid][pDowod], "Dowod");
	orm_addvar_int(orm, PlayerInfo[playerid][pTajniak], "PodszywanieSie");
	orm_addvar_int(orm, PlayerInfo[playerid][pZmienilNick], "ZmienilNick");
	orm_addvar_int(orm, PlayerInfo[playerid][pPodPW], "PodgladWiadomosci");
	orm_addvar_int(orm, PlayerInfo[playerid][pStylWalki], "StylWalki");
	orm_addvar_int(orm, PlayerInfo[playerid][pNewAP], "PAdmin");
	orm_addvar_int(orm, PlayerInfo[playerid][pZG], "ZaufanyGracz");
	orm_addvar_int(orm, PlayerInfo[playerid][pUniform], "Uniform");
	orm_addvar_int(orm, PlayerInfo[playerid][pCruiseController], "CruiseController");
	orm_addvar_int(orm, PlayerInfo[playerid][pFixKit], "FixKit");
	orm_addvar_int(orm, PlayerInfo[playerid][pAuto1], "Auto1");
	orm_addvar_int(orm, PlayerInfo[playerid][pAuto2], "Auto2");
	orm_addvar_int(orm, PlayerInfo[playerid][pAuto3], "Auto3");
	orm_addvar_int(orm, PlayerInfo[playerid][pAuto4], "Auto4");
	orm_addvar_int(orm, PlayerInfo[playerid][pLodz], "Lodz");
	orm_addvar_int(orm, PlayerInfo[playerid][pSamolot], "Samolot");
	orm_addvar_int(orm, PlayerInfo[playerid][pGaraz], "Garaz");
	orm_addvar_int(orm, PlayerInfo[playerid][pKluczeAuta], "KluczykiDoAuta");
	orm_addvar_int(orm, PlayerInfo[playerid][pSpawn], "Spawn");
	orm_addvar_int(orm, PlayerInfo[playerid][pBW], "BW");
	orm_addvar_int(orm, PlayerInfo[playerid][pCzystka], "Czystka");
	orm_addvar_int(orm, PlayerInfo[playerid][pCarSlots], "CarSlots");
	orm_addvar_int(orm, PlayerInfo[playerid][pHat], "Hat");
	orm_addvar_int(orm, PlayerInfo[playerid][pInjury], "Injury");
	orm_addvar_int(orm, PlayerInfo[playerid][pHealthPacks], "HealthPacks");
	orm_addvar_float(orm, PlayerInfo[playerid][pHunger], "Hunger");
	orm_addvar_float(orm, PlayerInfo[playerid][pThirst], "Thirst");
	orm_addvar_int(orm, PlayerInfo[playerid][pMotEvict], "motelEvict");
	orm_addvar_int(orm, FishCount[playerid], "fishCooldown");
	orm_addvar_int(orm, PlayerInfo[playerid][pDutyTime], "DutyTime");
	orm_addvar_int(orm, PlayerInfo[playerid][pDutyCheck], "DutyCheck");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponBlock], "BlokadaBroni");
	orm_addvar_string(orm, PlayerInfo[playerid][plastver], 15, "lastver");
	orm_addvar_int(orm, PlayerInfo[playerid][pForumUID], "uid_forum");
	orm_addvar_int(orm, PlayerInfo[playerid][pOsiagniecia1], "pOsiagniecia1");
	orm_addvar_int(orm, PlayerInfo[playerid][pMikolaj], "Mikolaj");
	orm_addvar_int(orm, PlayerInfo[playerid][pOsiagniecia2], "pOsiagniecia2");
	orm_addvar_int(orm, PlayerInfo[playerid][pOsiagniecia3], "pOsiagniecia3");
	orm_addvar_int(orm, PlayerInfo[playerid][pOsiagniecia4], "pOsiagniecia4");
	orm_addvar_int(orm, PlayerInfo[playerid][pOsiagniecia5], "pOsiagniecia5");
	orm_addvar_int(orm, PlayerInfo[playerid][pPlayerEXP], "pPlayerEXP");
	orm_addvar_int(orm, PlayerInfo[playerid][pChangeNumber], "ChangeNumber");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponSkill][0], "DeagleSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponSkill][1], "ColtSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponSkill][2], "SilencedSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponSkill][3], "ShotgunSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponSkill][4], "M4Skill");
	orm_addvar_int(orm, PlayerInfo[playerid][pWeaponSkill][5], "AKSkill");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupa][0], "Grupa1");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupa][1], "Grupa2");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupa][2], "Grupa3");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupa][3], "Grupa4");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupa][4], "Grupa5");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaRank][0], "Grupa1Rank");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaRank][1], "Grupa2Rank");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaRank][2], "Grupa3Rank");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaRank][3], "Grupa4Rank");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaRank][4], "Grupa5Rank");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaSkin][0], "Grupa1Skin");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaSkin][1], "Grupa2Skin");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaSkin][2], "Grupa3Skin");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaSkin][3], "Grupa4Skin");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaSkin][4], "Grupa5Skin");
	orm_addvar_int(orm, PlayerInfo[playerid][pGrupaSpawn], "GrupaSpawn");
	orm_addvar_int(orm, PlayerInfo[playerid][pSpawnHouseID], "spawnhouseid");
	orm_addvar_int(orm, PlayerInfo[playerid][pMaxSadzonkiBoost], "maxsadzonki");
	orm_addvar_int(orm, PlayerInfo[playerid][pConvert], "Convert");
	orm_addvar_float(orm, PlayerInfo[playerid][pLastHP], "LastHP");
	orm_addvar_float(orm, PlayerInfo[playerid][pLastArmour], "LastArmour");
	orm_addvar_int(orm, PlayerInfo[playerid][pBeta], "betatester");
	orm_addvar_int(orm, PlayerGames[playerid], "PlayGames");
	orm_addvar_int(orm, PlayerInfo[playerid][pGroupMoneySpent], "GroupMoneySpent");
	orm_addvar_int(orm, PlayerInfo[playerid][pGroupMoneySpentTime], "GroupMoneySpentTime");

	orm_setkey(orm, "UID");

	new lStr[256];
	format(lStr, sizeof(lStr), "UPDATE `mru_konta` SET `connected`='1', `online`='1' WHERE `UID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_tquery(Database, lStr);
	return 1;
}

forward OnPlayerDataLoaded(playerid);
public OnPlayerDataLoaded(playerid)
{

	//LOADING NEXT PART

	PlayerInfo[playerid][pIntSpawn] = PlayerInfo[playerid][pInt];
	MyWeapon[playerid] = PlayerInfo[playerid][pGun0];
	SetPlayerArmedWeapon(playerid, MyWeapon[playerid]);

	if(strcmp(PlayerInfo[playerid][plastver], VERSION, true) != 0) SetPVarInt(playerid, "showchangelog", 1);
	format(PlayerInfo[playerid][plastver], 15, VERSION);


	if(PlayerInfo[playerid][pDutyTime] >= 60)
	{
		if(PlayerInfo[playerid][pDutyCheck]+900 > gettime()) //czas na powrót: 15 minut
		{
			SetPVarInt(playerid, "reset-dutytime", gettime()+900);
			sendTipMessage(playerid, "Twój spędzony czas na służbie został przywrócony!");
			PrintDutyTime(playerid, 0);
		}
		else
		{
			sendTipMessage(playerid, "Twój spędzony czas na służbie został wyzerowany!");
			mysql_tquery_format("UPDATE `mru_konta` SET `DutyTime` = '0', `DutyCheck` = '0' WHERE `UID` = '%d'", PlayerInfo[playerid][pUID]);
			PlayerInfo[playerid][pDutyTime] = 0;
		}
	}

	PlayerInfo[playerid][pDutyCheck] = gettime();

	if(PlayerInfo[playerid][pConvert] > 0)
	{
		ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, "M-RP » Informacja", "{FFFFFF}Twoja postać wymaga działania.\n\nSprawdź panel gracza\n{a6a6a6}M-RP", "OK", "");
		KickEx(playerid);
		return 1;
	}
	/*if(PlayerInfo[playerid][pBeta] == 0)
	{
		ShowPlayerDialogEx(playerid, 9999, DIALOG_STYLE_MSGBOX, "M-RP » Informacja", "{FFFFFF}M-RP jest obecnie w fazie rozwoju.\nDostęp do gry mają wyłącznie testerzy.\nTwoja testowa postać zostanie usunięta przed oficjalnym startem serwera.", "OK", "");
		KickEx(playerid);
		return 1;
	}*/
	if(PlayerInfo[playerid][pChangeNumber] > 0)
	{
		MRP_SetPlayerPhone(playerid, PlayerInfo[playerid][pChangeNumber]);
		SendClientMessage(playerid, COLOR_BLUE, sprintf("Twój numer telefonu został zmieniony na %d", PlayerInfo[playerid][pChangeNumber]));
		PlayerInfo[playerid][pChangeNumber] = 0;
	}



	//Wczytaj nick OOC z forum

	new Cache:result;
	result = mysql_query_format("SELECT mybb_users.username, mybb_users.uid, mybb_users.samp_warns, mybb_users.samp_kc FROM mru_konta JOIN mybb_users on mybb_users.uid = mru_konta.uid_forum WHERE mru_konta.UID = '%d'", PlayerInfo[playerid][pUID]);

	cache_set_active(result);
	if(cache_num_rows() > 0)
	{
		cache_get_value_index(0, 0,             PlayerInfo[playerid][pNickOOC]);
		cache_get_value_index_int(0, 1,                 PlayerInfo[playerid][pGID]);
		cache_get_value_index_int(0, 2,                 PlayerInfo[playerid][pWarns]);
		cache_get_value_index_int(0, 3,                 PremiumInfo[playerid][pMC]);
	}

	cache_delete(result);

	// Pozycje kamizelki

	new lStr[512];

	loadKamiPos(playerid);

	//Wczytaj personalizacje
	lStr = "`KontoBankowe`, `Ogloszenia`, `LicznikPojazdu`, `OgloszeniaRodzin`, `OldNick`, `CBRadio`, `Report`, `DeathWarning`, `KaryTXD`, `NewNick`, `newbie`, `BronieScroll`, `AnimacjaMowienia`, `JoinLeave`, `OgloszeniaTyp`, `KomunikatyAresztowania`, `KomunikatyNews`";
	format(lStr, 1024, "SELECT %s FROM `mru_personalization` WHERE `UID`=%d", lStr, PlayerInfo[playerid][pUID]);
	result = mysql_query(Database, lStr); 
	cache_set_active(result);
	if(cache_num_rows())
	{
		cache_get_value_index_int(0, 0,                 PlayerPersonalization[playerid][PERS_KB]);
		cache_get_value_index_int(0, 1,                 PlayerPersonalization[playerid][PERS_AD]);
		cache_get_value_index_int(0, 2,                 PlayerPersonalization[playerid][PERS_LICZNIK]);
		cache_get_value_index_int(0, 3,                 PlayerPersonalization[playerid][PERS_FAMINFO]);
		cache_get_value_index_int(0, 4,                 PlayerPersonalization[playerid][PERS_NICKNAMES]);
		cache_get_value_index_int(0, 5,                 PlayerPersonalization[playerid][PERS_CB]);
		cache_get_value_index_int(0, 6,                 PlayerPersonalization[playerid][PERS_REPORT]);
		cache_get_value_index_int(0, 7,                 PlayerPersonalization[playerid][WARNDEATH]);
		cache_get_value_index_int(0, 8,                 PlayerPersonalization[playerid][PERS_KARYTXD]);
		cache_get_value_index_int(0, 9,                 PlayerPersonalization[playerid][PERS_NEWNICK]);
		cache_get_value_index_int(0, 10,                PlayerPersonalization[playerid][PERS_NEWBIE]);
		cache_get_value_index_int(0, 11,                PlayerPersonalization[playerid][PERS_GUNSCROLL]);
		cache_get_value_index_int(0, 12,                PlayerPersonalization[playerid][PERS_TALKANIM]);
		cache_get_value_index_int(0, 13,                PlayerPersonalization[playerid][PERS_JOINLEAVE]);
		cache_get_value_index_int(0, 14,                PlayerPersonalization[playerid][PERS_OG_TYPE]);
		cache_get_value_index_int(0, 15,                PlayerPersonalization[playerid][PERS_ARREST_MSG]);
		cache_get_value_index_int(0, 16,                PlayerPersonalization[playerid][PERS_NEWS_MSG]);
	}
	cache_delete(result);

	//Wczytaj ryby
	lStr = "`Fish1`, `Fish2`, `Fish3`, `Fish4`, `Fish5`, `Weight1`, `Weight2`, `Weight3`, `Weight4`, `Weight5`, `Fid1`, `Fid2`, `Fid3`, `Fid4`, `Fid5`";
	format(lStr, 1024, "SELECT %s FROM `mru_ryby` WHERE `Player` = '%d'", lStr, PlayerInfo[playerid][pUID]);
	result = mysql_query(Database, lStr);
	cache_set_active(result);
	if(cache_num_rows())
	{
		cache_get_value_index(0, 0,             Fishes[playerid][pFish1]);
		cache_get_value_index(0, 1,             Fishes[playerid][pFish2]);
		cache_get_value_index(0, 2,             Fishes[playerid][pFish3]);
		cache_get_value_index(0, 3,             Fishes[playerid][pFish4]);
		cache_get_value_index(0, 4,             Fishes[playerid][pFish5]);
		cache_get_value_index_int(0, 5,                 Fishes[playerid][pWeight1]);
		cache_get_value_index_int(0, 6,                 Fishes[playerid][pWeight2]);
		cache_get_value_index_int(0, 7,                 Fishes[playerid][pWeight3]);
		cache_get_value_index_int(0, 8,                 Fishes[playerid][pWeight4]);
		cache_get_value_index_int(0, 9,                 Fishes[playerid][pWeight5]);
		cache_get_value_index_int(0, 10,                Fishes[playerid][pFid1]);
		cache_get_value_index_int(0, 11,                Fishes[playerid][pFid2]);
		cache_get_value_index_int(0, 12,                Fishes[playerid][pFid3]);
		cache_get_value_index_int(0, 13,                Fishes[playerid][pFid4]);
		cache_get_value_index_int(0, 14,                Fishes[playerid][pFid5]);
	}
	else
		mysql_tquery_format("INSERT INTO `mru_ryby` (`Player`) VALUES ('%d')", PlayerInfo[playerid][pUID]);
	cache_delete(result);

	playerWeapons[playerid][weaponLegal1] 	= 1;
	playerWeapons[playerid][weaponLegal2] 	= 1;
	playerWeapons[playerid][weaponLegal3] 	= 1;
	playerWeapons[playerid][weaponLegal4] 	= 1;
	playerWeapons[playerid][weaponLegal5] 	= 1;
	playerWeapons[playerid][weaponLegal6] 	= 1;
	playerWeapons[playerid][weaponLegal7] 	= 1;
	playerWeapons[playerid][weaponLegal8] 	= 1;
	playerWeapons[playerid][weaponLegal9] 	= 1;
	playerWeapons[playerid][weaponLegal10] 	= 1;
	playerWeapons[playerid][weaponLegal11] 	= 1;
	playerWeapons[playerid][weaponLegal12] 	= 1;
	playerWeapons[playerid][weaponLegal13] 	= 1;

	//bw
	if(PlayerInfo[playerid][pInjury] >= 988 && PlayerInfo[playerid][pInjury] <= 999)
	{
		PlayerInfo[playerid][pInjury] = 999;
		TextDrawSetString(TextDrawInfo[playerid], "Mozesz uzyc komendy ~g~/akceptuj smierc");
		TextDrawShowForPlayer(playerid, TextDrawInfo[playerid]);
	}

    MruMySQL_LoadAccess(playerid);
	ValidateGroups(playerid);
    //MruMySQL_WczytajOpis(playerid, PlayerInfo[playerid][pUID], 1);

	// Load motel room
	for(new i = 0; i < MAX_MOTEL_ROOMS; i++)
	{
		if(MotelRooms[i][mtrOwnerUID] == PlayerInfo[playerid][pUID])
		{
			PlayerInfo[playerid][pMotRoom] = i;
		}
	}


	//

	new string[512], nick[24];
	GetPlayerName(playerid, nick);
	//Sprawdzanie banów
	if(CheckBan(GetAccountIP(playerid), PlayerInfo[playerid][pGID]) || CheckBlock(PlayerInfo[playerid][pUID], BLOCK_BAN) || CheckBlock(PlayerInfo[playerid][pUID], BLOCK_CHAR_BAN)) {
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}To konto jest zbanowane, nie możesz na nim grać.");
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] Jeśli uważasz, że konto zostało zbanowane niesłusznie napisz apelacje na: {33CCFF}M-RP");
		KickEx(playerid);
		return 1;
	}
	
	//Sprawdzanie blocków:
	if(CheckBlock(PlayerInfo[playerid][pUID], BLOCK_CHAR) || CheckBlock(PlayerInfo[playerid][pUID], BLOCK_CHAR_BAN)) {
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}To konto jest zablokowane, nie możesz na nim grać.");
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] Jeśli uważasz, że konto zostało zablokowane niesłusznie napisz apelacje na: {33CCFF}M-RP");
		KickEx(playerid);
		return 1;
	}
	
	//Sprawdzanie warnów:
	if(PlayerInfo[playerid][pWarns] >= 3)
	{
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}Twoje konto zostało zbanowane/zablokowane z powodu przekroczenia limtu warnów!");
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] Jeśli uważasz, że konto zostało zbanowane/zablokowane niesłusznie napisz apelacje na: {33CCFF}M-RP");
		KickEx(playerid);
		return 1;
	}
	else if(PlayerInfo[playerid][pWarns] < 0) PlayerInfo[playerid][pWarns] = 0;

	foreach(new i : Player)
	{
		if(IsPlayerConnected(i) && i != playerid)
		{
			if(gPlayerLogged[i])
			{
				if(PlayerInfo[playerid][pUID] == PlayerInfo[i][pUID])
				{
					SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}To konto jest już zalogowane.");
					KickEx(playerid);
					return 1;
				}
			}
		}
	}

	//Nadawanie pieniędzy:
	ResetujKase(playerid);
	if(PlayerInfo[playerid][pCash] < 0)
	{
		if(PlayerInfo[playerid][pWL] < 9)
		{
			PlayerInfo[playerid][pWL]++; 
			sendTipMessage(playerid, "Masz długi pieniężne wobec państwa, twój poziom poszukiwania rośnie."); 
		}
		if(PlayerInfo[playerid][pWL] >= 9)
		{
			PlayerInfo[playerid][pWL] = 10; 
			sendTipMessage(playerid, "Masz już 10 poziom poszukiwania! Część jest spowodowana długami! Zrób coś z tym!"); 
		}
		ZabierzKaseDone(playerid, -PlayerInfo[playerid][pCash]);
	}
	else if(PlayerInfo[playerid][pCash] >= 0)
	{
		DajKaseDone(playerid, PlayerInfo[playerid][pCash]); 
	}
	//Ustawianie na zalogowany:
	gPlayerLogged[playerid] = 1; 
	new strGPCI[41];
	gpci(playerid, strGPCI, sizeof(strGPCI));
	Log(connectLog, WARNING, "Gracz %s[id: %d, ip: %s, gpci: %s] zalogował się na konto", GetPlayerLogName(playerid), playerid, GetIp(playerid), strGPCI);
	Car_LoadForPlayer(playerid); //System aut
	LoadPlayerItems(playerid); //System przedmiotów
	MruMySQL_LoadPhoneContacts(playerid); //Kontakty telefonu
	//Command_SetPlayerDisabled(playerid, false); //Włączenie komend
	CorrectPlayerBusiness(playerid);
	CheckPlayerBusiness(playerid);
	htTextDrawShow(playerid);
	
	AC_OnPlayerLogin(playerid);
	//Frakcyjny GPS
	GPS_Load(playerid);
	//Powitanie:
	if(!IsPlayerNPC(playerid)){
		new join[128];
		format(join, sizeof(join), "[Join] %s (%d) zalogował się na serwer.", GetNickEx(playerid), GetPlayerIDFromName(GetNick(playerid)));
		OOCJoin(join);
	}
	g_ProtectionEnabled[playerid] = true;
	SetTimerEx("DisableProtection", 20000, false, "i", playerid); // 10 sekund (10000 milisekund)
	format(string, sizeof(string), "Witaj na serwerze M-RP, %s!",nick);
	SendClientMessage(playerid, COLOR_WHITE,string);
	printf("%s has logged in.",nick);
	if (IsPlayerPremiumOld(playerid))
	{
		SendClientMessage(playerid, COLOR_WHITE,"Jesteś posiadaczem {E2BA1B}Konta Premium.");
	}
	else if(GetPVarInt(playerid, "got-compensation") == 0)
	{
		//SendClientMessage(playerid, COLOR_WHITE, "Możesz odebrać rekompensatę za poprzednie problemy techniczne za pomocą {E2BA1B}/rekompensata");
	}

	//Nadawanie początkowych itemów po rejestracji:
	if(PlayerInfo[playerid][pReg] == 0)
	{
		PlayerInfo[playerid][pLevel] = 1;
		PlayerInfo[playerid][pSHealth] = 0.0;
		PlayerInfo[playerid][pHealth] = 100.0;
		PlayerInfo[playerid][pPos_x] = 2246.6;
		PlayerInfo[playerid][pPos_y] = -1161.9;
		PlayerInfo[playerid][pPos_z] = 1029.7;
		PlayerInfo[playerid][pInt] = 0;
		PlayerInfo[playerid][pLocal] = 255;
		PlayerInfo[playerid][pTeam] = 3;
		PlayerInfo[playerid][pUniform] = 0;
		PlayerInfo[playerid][pJobSkin] = 0; 
		PlayerInfo[playerid][pDom] = 0;
		PlayerInfo[playerid][pPbiskey] = 255;
		PlayerInfo[playerid][pAccount] = 25;
		PlayerInfo[playerid][pReg] = 1;
		PlayerInfo[playerid][pDowod] = 0;
		PlayerInfo[playerid][pBusinessOwner] = INVALID_BIZ_ID;
		PlayerInfo[playerid][pBusinessMember] = INVALID_BIZ_ID; 
		DajKaseDone(playerid, 25);
	}

	premium_loadForPlayer(playerid);

	if(IsPlayerPremiumOld(playerid))
	{
		if (PlayerInfo[playerid][pCarSlots] == 6) {
			PlayerInfo[playerid][pCarSlots] = 8;
		}
	}

	//Przywracanie Poziomu Poszukiwania
        //Punkty karne
    if (PlayerInfo[playerid][pWL] >= 10000)
    {
        string="\0";
        new lPunkty[8];
        PlayerInfo[playerid][pWL]-=10000;
        valstr(string, PlayerInfo[playerid][pWL]);
        if(strlen(string) == 3) strmid(lPunkty, string, 0, 1);
        else if(strlen(string) == 4) strmid(lPunkty, string, 0, 2);
        PlayerInfo[playerid][pPK] = strval(lPunkty);
        if(strlen(string) == 3) strmid(lPunkty, string, 1, 3);
        else if(strlen(string) == 4) strmid(lPunkty, string, 2, 4);
        PlayerInfo[playerid][pWL] = strval(lPunkty);
    }

	if (PlayerInfo[playerid][pWL] >= 1)
	{
        if(PlayerInfo[playerid][pWL] > 100) PlayerInfo[playerid][pWL] = 0;
        else
        {
    		PoziomPoszukiwania[playerid] = clamp(PlayerInfo[playerid][pWL], 0, 10);
    		format(string, sizeof(string), "Twój poziom poszukiwania został przywrócony do %d.",PlayerInfo[playerid][pWL]);
    		SendClientMessage(playerid, COLOR_WHITE,string);
        }
	}


	
	choroby_OnPlayerLogin(playerid);

	//obiekty
	PlayerAttachments_LoadItems(playerid);
	LoadPlayerTattoo(playerid);

	if(gettime() > GetPVarInt(playerid, "lastSobMsgNew"))
	{
		SetPVarInt(playerid, "lastSobMsgNew", gettime() + 60);
		SendMessageFromNewAC(playerid);
	}
	//Odbugowywanie domów:
    if(PlayerInfo[playerid][pDom] != 0)
    {
    	NaprawSpojnoscWlascicielaDomu(playerid);
		Dom[PlayerInfo[playerid][pDom]][hData_DD] = 0;
    	if(Dom[PlayerInfo[playerid][pDom]][hPDW] < 0) Dom[PlayerInfo[playerid][pDom]][hPDW] = 0;//naprawa wynajmu
    	if(Dom[PlayerInfo[playerid][pDom]][hPW] < 0) Dom[PlayerInfo[playerid][pDom]][hPW] = 0;
		ZapiszDom(PlayerInfo[playerid][pDom]);
	}

	//Spawnowanie gracza
	SetTimerEx("AntySB", 5000, 0, "d", playerid); //by nie kickowało timer broni
	AntySpawnBroni[playerid] = 5;
	GUIExit[playerid] = 0;
	SetPlayerVirtualWorld(playerid, 0);

    Zone_Sync(playerid);
    if(strlen(ServerInfo) > 1) TextDrawShowForPlayer(playerid, TXD_Info); //Show info

    //Konwersja pojazdów:
    //CONVERT_PlayerCar(playerid);

	//Teleportacja do poprzedniej pozycji:
	if (PlayerInfo[playerid][pTut] == 1)
	{
        if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0 || PlayerInfo[playerid][pZG] > 0 || IsAScripter(playerid))
        {
            if(PlayerInfo[playerid][pZG] > 0 || PlayerInfo[playerid][pNewAP] > 0)
            {
                SetPVarInt(playerid, "support_duty", 1);
                SendClientMessage(playerid, COLOR_GREEN, "SUPPORT: {FFFFFF}Stawiasz się na służbie nowym graczom. Aby sprawdzić zgłoszenia wpisz {00FF00}/supporty lub /reporty");
            }
			else if(PlayerInfo[playerid][pAdmin] > 0)
			{
				SendClientMessage(playerid, COLOR_GREEN, "SUPPORT: {FFFFFF}Aby widzieć zgłoszenia z /supporty lub /reporty wpisz {FF0000}/adminduty");
			}

			if(GetPVarInt(playerid, "ChangingPassword") != 1)
			{
				#if defined MRP_MTA_RUNTIME
					// Poziom admina pochodzi z już uwierzytelnionego konta; bez drugiego,
					// wspólnego hasła zapisanego jawnie w kodzie.
					OnDialogResponse(playerid, 235, 1, 0, "MTA");
				#else
					ShowPlayerDialogEx(playerid, 235, DIALOG_STYLE_INPUT, "Weryfikacja", "Logujesz się jako członek administracji. Zostajesz poproszony o wpisanie w\nponiższe pole hasła weryfikacyjnego. Pamiętaj, aby nie podawać go nikomu!", "Weryfikuj", "Wyjdź¸");
				#endif
			}
        }
        else if(PlayerInfo[playerid][pJailed] == 0 && GetCombatLogByPUID(PlayerInfo[playerid][pUID]) == -1)
        {
    		lowcap[playerid] = 1;
			if(GetPVarInt(playerid, "ChangingPassword") != 1){
				SetPVarInt(playerid, "spawn", 1);
				SetPlayerSpawn(playerid);
				TogglePlayerSpectating(playerid, false);
				ShowPlayerDialogEx(playerid, 1, DIALOG_STYLE_MSGBOX, "Serwer", "Czy chcesz się teleportować do poprzedniej pozycji?", "TAK", "NIE");
			}
        }
        else
        {
            SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
            SetPlayerSpawn(playerid);
			TogglePlayerSpectating(playerid, false);
        }
	}
    else
    {
        SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
		gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1;
		PlayerInfo[playerid][pMuted] = 1;
		TogglePlayerControllable(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		GUIExit[playerid] = 0;
		TutTime[playerid] = 123;
    }

	CombatLogOnLogin(playerid);

	#if defined MRP_MTA_RUNTIME
		// Kotnik kończy logowanie przez TogglePlayerSpectating(false), ale jego
		// ekran logowania używa wyłącznie własnej kamery i MTA nie zawsze uznaje
		// gracza za spectatora. Wtedy konto jest poprawnie wczytane, lecz ped nie
		// zostaje fizycznie utworzony. Dla ukończonych postaci wymuszamy końcowy
		// spawn dopiero po załadowaniu wszystkich danych konta.
		if(PlayerInfo[playerid][pTut] == 1)
		{
			GUIExit[playerid] = 0;
			SetPlayerSpawn(playerid);
			SpawnPlayer(playerid);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, true);
		}
	#endif

	format(lStr, sizeof(lStr), "UPDATE `mru_konta` SET `connected`='1', `online`='1' WHERE `UID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_tquery(Database, lStr);
	return 1;
}

public MruMySQL_LoadAccount(playerid)
{
	MruMySQL_CreateORM(playerid);

	new fault = orm_load(PlayerInfo[playerid][pORM], "OnPlayerDataLoaded", "d", playerid);
	return fault;
}

MruMySQL_WczytajOpis(handle, uid, typ)
{
	new lStr[128], lText[128];
	inline OnDescLoaded()
	{
		if(cache_num_rows())
		{
			if(typ == 1)
			{
				cache_get_value_index(0, 0, lText);
				strpack(PlayerDesc[handle], lText);
			}
			else
			{
				cache_get_value_index(0, 0, lText);
				strcat(CarDesc[handle], lText);
			}
		}
	}

    format(lStr, 128, "SELECT `desc` FROM `mru_opisy` WHERE `owner`='%d' AND `typ`=%d", uid, typ);
    MySQL_TQueryInline(Database, using inline OnDescLoaded, lStr);
    return 1;
}

MruMySQL_UpdateOpis(handle, uid, typ)
{
    new lStr[256], packed[128], opis[128];
	if(typ == 1)
	{
		strunpack(packed, PlayerDesc[handle]);
    	mysql_escape_string(packed, opis);
	}
	else
	{
    	mysql_escape_string(CarDesc[handle], opis);
	}
    if(MruMySQL_CheckOpis(uid, typ))
        format(lStr, 256, "UPDATE `mru_opisy` SET `desc`='%s' WHERE `owner`='%d' AND `typ`=%d", opis, uid, typ);
    else
        format(lStr, 256, "INSERT INTO `mru_opisy` (`desc`, `owner`, `typ`) VALUES ('%s', %d, %d)", opis, uid, typ);
    mysql_tquery(Database, lStr);
}

MruMySQL_CheckOpis(uid, typ)
{
    new lStr[128], Cache:result;
    format(lStr, sizeof(lStr), "SELECT `UID` FROM `mru_opisy` WHERE `owner`='%d' AND `typ`=%d", uid, typ);
    result = mysql_query(Database, lStr);
    if(cache_num_rows())
    {
        cache_delete(result);
        return 1;
    }
	cache_delete(result);
    return 0;
}

MruMySQL_DeleteOpis(uid, typ)
{
    new lStr[128];
    format(lStr, sizeof(lStr), "DELETE FROM `mru_opisy` WHERE `owner`='%d' AND `typ`=%d", uid, typ);
    mysql_tquery(Database, lStr);
    return 0;
}

MruMySQL_LoadAccess(playerid)
{
    if(!MYSQL_ON) return false;

	inline OnAccessLoaded()
	{
		if(cache_num_rows())
		{
			cache_get_value_index_int(0, 0, ACCESS[playerid]);
			OLD_ACCESS[playerid] = ACCESS[playerid];
		}
	}

	new query[128];
	format(query, sizeof(query), "SELECT CAST(`FLAGS` AS UNSIGNED) AS `FLAGS` FROM `mru_uprawnienia` WHERE `UID`=%d", PlayerInfo[playerid][pUID]);

	MySQL_TQueryInline(Database, using inline OnAccessLoaded, query);
    return 1;
}

MruMySQL_DoesAccountExistByUID(uid)
{
	new Cache:result;
	result = mysql_query_format("SELECT `UID` FROM `mru_konta` WHERE `UID` = '%d'", uid);
	new num = cache_num_rows();
	cache_delete(result);
	if(num > 0)
		return 1;
	return 0;
}

MruMySQL_DoesAccountExist(nick[])
{
	new string[128], Cache:result;
	new escaped[128];
	mysql_escape_string(nick, escaped);
	format(string, sizeof(string), "SELECT `Nick` FROM `mru_konta` WHERE `Nick` = BINARY '%s'", escaped);
	result = mysql_query(Database, string);
	new num = cache_num_rows();
	cache_delete(result);

	if(num > 0)
	{
		return -1;
	}
    else
    {
        format(string, sizeof(string), "SELECT `Nick` FROM `mru_konta` WHERE `Nick` = '%s'", escaped);
    	result = mysql_query(Database, string);
    	num = cache_num_rows();
    	cache_delete(result);
        if(num > 0) return -999;
    }
    format(string, 128, "%s.ini", escaped);

	if(dini_Exists(string)) return 1;
	return 0;
}

MruMySQL_ReturnPassword(nick[], key[200], salt[200])
{
	new string[256];

	new escaped[128], Cache:result;
	
	mysql_escape_string(nick, escaped);
	// Konta podpięte do forum używają hasha MyBB. Starsze konta Mrucznika
	// (oraz konta tworzone bez forum) mają hash Whirlpool w mru_konta.
	// LEFT JOIN i COALESCE zachowują obsługę obu formatów po migracji bazy.
	format(string, sizeof(string),
	"SELECT COALESCE(NULLIF(mybb_users.password, ''), mru_konta.`Key`), COALESCE(NULLIF(mybb_users.salt, ''), mru_konta.`Salt`) FROM mru_konta LEFT JOIN mybb_users on mybb_users.uid = mru_konta.uid_forum WHERE mru_konta.Nick = '%s'",
	escaped);

	result = mysql_query(Database, string);
	if(cache_num_rows() > 0)
	{
		cache_get_value_index(0, 0, key);
		cache_get_value_index(0, 1, salt);
	}

	
	cache_delete(result);
	return 1;
}


//--------------------------------------------------------------<[ Kary ]>--------------------------------------------------------------

//Pobieranie i zwracanie pojedynczych zmiennych:

stock MruMySQL_GetWarnsFromName(name[])
{
	new wartosc, Cache:result;
	result = mysql_query_format("SELECT mybb_users.samp_warns FROM mru_konta JOIN mybb_users on mybb_users.uid = mru_konta.uid_forum WHERE mru_konta.Nick = '%s'", name);
    if(cache_num_rows())
    {
	   cache_get_value_index_int(0, 0, wartosc);
    }
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_GetNameFromUID(uid) {
	new wartosc[MAX_PLAYER_NAME + 1], string[128], Cache:result;
	format(string, sizeof(string), "SELECT `Nick` FROM `mru_konta` WHERE `UID` = '%d'", uid);
	result = mysql_query(Database, string);
		
	if(cache_num_rows())
	{
		cache_get_value_index(0, 0, wartosc);
	}
	strunpack(wartosc, wartosc);
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_GetUIDFromName(name[])
{
	new wartosc, Cache:result;
	result = mysql_query_format("SELECT UID FROM mru_konta WHERE Nick = '%s'", name);
    if(cache_num_rows())
    {
	   cache_get_value_index_int(0, 0, wartosc);
    }
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_GetNickOOCFromName(name[])
{
	new wartosc[MAX_PLAYER_NAME + 1], Cache:result;
	result = mysql_query_format("SELECT mybb_users.username FROM mru_konta JOIN mybb_users on mybb_users.uid = mru_konta.uid_forum WHERE mru_konta.Nick = '%s'", name);
	if(cache_num_rows())
	{
		cache_get_value_index(0, 0, wartosc);
	}
	strunpack(wartosc, wartosc);
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_GetNickOOCFromGID(t_gid)
{
	new wartosc[MAX_PLAYER_NAME + 1], Cache:result;
	result = mysql_query_format("SELECT username FROM mybb_users WHERE uid = '%d'", t_gid);
	if(cache_num_rows())
	{
		cache_get_value_index(0, 0, wartosc);
	}
	strunpack(wartosc, wartosc);
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_GetAccString(kolumna[], nick[])
{
	new string[128], wartosc[256], Cache:result;
	mysql_escape_string(kolumna, kolumna);
	mysql_escape_string(nick, nick);
	
	format(string, sizeof(string), "SELECT `%s` FROM `mru_konta` WHERE `Nick` = '%s'", kolumna, nick);
	result = mysql_query(Database, string);
		
	if(cache_num_rows())
	{
		cache_get_value_index(0, 0, wartosc);
	}
	strunpack(wartosc, wartosc);
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_GetAccInt(kolumna[], nick[])
{

	new string[128], wartosc, Cache:result;

	new escaped_kolumna[64], escaped_nick[64];
	mysql_escape_string(kolumna, escaped_kolumna);
	mysql_escape_string(nick, escaped_nick);
	format(string, sizeof(string), "SELECT `%s` FROM `mru_konta` WHERE `Nick` = '%s'", escaped_kolumna, escaped_nick);
	result = mysql_query(Database, string);
    if(cache_num_rows())
    {
	   cache_get_value_index_int(0, 0, wartosc);
    }
	cache_delete(result);
	return wartosc;
}

stock MruMySQL_SetAccString(kolumna[], nick[MAX_PLAYER_NAME + 1], wartosc[])
{
	new string[128];

	new escaped_wartosc[64], escaped_kolumna[64];
	mysql_escape_string(wartosc, escaped_wartosc);
	mysql_escape_string(nick, nick);
	mysql_escape_string(kolumna, escaped_kolumna);
	format(string, sizeof(string), "UPDATE `mru_konta` SET `%s` = '%s' WHERE `Nick` = '%s'", escaped_kolumna, escaped_wartosc, nick);
	mysql_tquery(Database, string);
	return 1;
}

stock MruMySQL_SetAccInt(kolumna[], nick[], wartosc)
{
	new string[128];

	new escaped_nick[64], escaped_kolumna[64];
	mysql_escape_string(nick, escaped_nick);
	mysql_escape_string(kolumna, escaped_kolumna);
	format(string, sizeof(string), "UPDATE `mru_konta` SET `%s` = '%d' WHERE `Nick` = '%s'", escaped_kolumna, wartosc, escaped_nick);
	mysql_tquery(Database, string);
	return 1;
}

stock MruMySQL_LoadPhoneContacts(playerid)
{

	mysql_query(Database, sprintf("SELECT UID, Number, Name FROM mru_kontakty WHERE Owner='%d' LIMIT 10", PlayerInfo[playerid][pUID]));
	if(cache_num_rows()>0)
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_int(i, 0,                                         Kontakty[playerid][i][eUID] );
			cache_get_value_int(i, 1,                                         Kontakty[playerid][i][eNumer] );
			cache_get_value(i, 2,                                     Kontakty[playerid][i][eNazwa]);
			if(i == MAX_KONTAKTY) 
				break;
		}
	}
	return 1;
}

stock MruMySQL_AddPhoneContact(playerid, nazwa[], numer)
{
	new string[128], escapedName[32];
	mysql_escape_string(nazwa, escapedName);
	format(string, sizeof(string), "INSERT INTO mru_kontakty (Owner, Number, Name) VALUES ('%d', '%d', '%s')", PlayerInfo[playerid][pUID], numer, escapedName);
	mysql_tquery(Database, string);
	
	new uid = cache_insert_id();
	return uid;
}

stock MruMySQL_EditPhoneContact(uid, nazwa[])
{
	new string[128], escapedName[32];
	mysql_escape_string(nazwa, escapedName);
	format(string, sizeof(string), "UPDATE mru_kontakty SET Name='%s' WHERE UID='%d'", escapedName, uid);
	mysql_tquery(Database, string);
	return 1;
}

stock MruMySQL_DeletePhoneContact(uid)
{
	new string[128];
	format(string, sizeof(string), "DELETE FROM mru_kontakty WHERE UID='%d'", uid);
	mysql_tquery(Database, string);
	return 1;
}

/* pointless public MySQL_Refresh()
{
    if(mysql_ping() == 1)
    {
        if(MySQL_timeout)
        {
            new str[64];
            format(str, 64, "gamemodetext M-RP %s", VERSION);
            SendRconCommand(str);
            MySQL_timeout = false;
        }
    }
    else
	{
		print("MySQL: Connection time-out");
        mysql_reconnect();
        MySQL_timeout= true;
		SendRconCommand("gamemodetext M-RP: MySQL timeout");
	}
}*/

stock mysql_query_format(query[], va_args<>)
{
	new str[2048];
    strreplace(query, "%s", "%e", false, 0, -1, 2048);
    mysql_format(Database, str, sizeof(str), query, va_start<1>);

	return mysql_query(Database, str);
}

stock mysql_tquery_format(query[], va_args<>)
{
	/*new str[528];
	va_format(str, sizeof str, query, va_start<1>);
	return mysql_tquery(Database, str);*/

	new str[2048];
    strreplace(query, "%s", "%e", false, 0, -1, 2048);
    mysql_format(Database, str, sizeof(str), query, va_start<1>);

	return mysql_tquery(Database, str);
}

public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
    printf("SQL ERROR: %d, %d (%s)", _:handle, errorid, error);
	if(strlen(callback) > 0) {
		printf("cb: '%s', %s", callback, query);
	} else {
		printf("%s", query);
	}
}

//EOF
