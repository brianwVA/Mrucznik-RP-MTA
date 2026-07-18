YCMD:sw(playerid, params[], help)
{
	if(!IsPlayerInAnyVehicle(playerid)) return sendErrorMessage(playerid, "Musisz być w samochodzie!");
    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) return sendErrorMessage(playerid, "Musisz być na miejscu pasażera!");

    new bron[32];
    if(sscanf(params, "s[32]", bron)){
		sendTipMessage(playerid, "Użyj /sw [nazwa broni]");
		return 1;
	}

    if(strcmp(bron, "fist", true ) == 0 || strcmp(bron, "f", true) == 0 || strcmp(bron, "pięści", true) == 0){
		new SeatID = GetPlayerVehicleSeat(playerid);
		new VehicleID = GetPlayerVehicleID(playerid);
		RemovePlayerFromVehicle(playerid);
        SetPlayerArmedWeapon(playerid, 0);
		PutPlayerInVehicle(playerid, VehicleID, SeatID);
		return 1;
	}

    new WeaponID = GetWeaponID(bron);
	if(WeaponID == 24 || WeaponID == 34 || WeaponID == 35 || WeaponID == 37) return sendErrorMessage(playerid, "Nie możesz używać tej broni podczas drive-by!");
	new weapons, ammo;
	GetPlayerWeaponData(playerid, GetWeaponSlot(WeaponID), weapons, ammo);
	if(weapons > 0 && ammo > 0){
		SetPlayerArmedWeapon(playerid, WeaponID);
	}
	else{
		sendErrorMessage(playerid, "Nie posiadasz tej broni przy sobie!");
	}
	return 1;
}
