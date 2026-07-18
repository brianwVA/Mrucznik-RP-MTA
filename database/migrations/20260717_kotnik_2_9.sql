-- M-RP 2.9: bezpieczna migracja schematu Kotnika bez kasowania danych.
-- Wygenerowano 2026-07-17; wykonac jednokrotnie po utworzeniu kopii zapasowej.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- Tabela była używana przez moduł turfów Kotnika, lecz nie została dołączona
-- do jego zrzutu. Brak tabeli powodował pętlę UPDATE i destabilizował start.
CREATE TABLE IF NOT EXISTS `mru_gangzones` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(24) NOT NULL DEFAULT '',
    `takeable` TINYINT NOT NULL DEFAULT 1,
    `owner_uid` INT NOT NULL DEFAULT 0,
    `minx` FLOAT NOT NULL DEFAULT 0,
    `miny` FLOAT NOT NULL DEFAULT 0,
    `maxx` FLOAT NOT NULL DEFAULT 0,
    `maxy` FLOAT NOT NULL DEFAULT 0,
    `time` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Rejestr dodatkowych modeli jest pusty na świeżej migracji, ponieważ pełny
-- katalog M-RP jest już dostarczany przez zasób mrp_models.
CREATE TABLE IF NOT EXISTS `models` (
    `uid` INT NOT NULL AUTO_INCREMENT,
    `type` TINYINT NOT NULL,
    `vw` INT NOT NULL DEFAULT -1,
    `baseid` INT NOT NULL,
    `newid` INT NOT NULL,
    `dff` VARCHAR(64) NOT NULL,
    `txt` VARCHAR(64) NOT NULL,
    `description` VARCHAR(64) NOT NULL DEFAULT 'Brak',
    `disabled` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`uid`),
    UNIQUE KEY `uq_models_newid` (`newid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `contracts` (
    `id` INT NOT NULL PRIMARY KEY,
    `org_id` INT NOT NULL DEFAULT 0,
    `type` INT NOT NULL DEFAULT 0,
    `amount` INT NOT NULL DEFAULT 1,
    `amount_delivered` INT NOT NULL DEFAULT 0,
    `reward` INT NOT NULL DEFAULT 0,
    `state` INT NOT NULL DEFAULT 0,
    `created` INT NOT NULL DEFAULT 0,
    `accepted_by` INT NOT NULL DEFAULT 0,
    `warehouse_id` INT NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `crate_depots` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(48) NOT NULL,
    `type` INT NOT NULL DEFAULT 1,
    `amount` INT NOT NULL DEFAULT 500,
    `price` INT NOT NULL DEFAULT 100,
    `pos_x` FLOAT NOT NULL DEFAULT 0.0,
    `pos_y` FLOAT NOT NULL DEFAULT 0.0,
    `pos_z` FLOAT NOT NULL DEFAULT 0.0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `drug_dealers` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(48) NOT NULL,
    `pos_x` FLOAT NOT NULL DEFAULT 0.0,
    `pos_y` FLOAT NOT NULL DEFAULT 0.0,
    `pos_z` FLOAT NOT NULL DEFAULT 0.0,
    `angle` FLOAT NOT NULL DEFAULT 0.0,
    `interior` INT NOT NULL DEFAULT 0,
    `virtualworld` INT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `drug_labs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `ent_x` FLOAT NOT NULL DEFAULT 0.0,
    `ent_y` FLOAT NOT NULL DEFAULT 0.0,
    `ent_z` FLOAT NOT NULL DEFAULT 0.0,
    `price` INT NOT NULL DEFAULT 500000,
    `org_owner` INT NOT NULL DEFAULT 0,
    `player_owner` INT NOT NULL DEFAULT 0,
    `seeds` INT NOT NULL DEFAULT 0,
    `cocaine_p` INT NOT NULL DEFAULT 0,
    `cocaine_n` INT NOT NULL DEFAULT 0,
    `cocaine_g` INT NOT NULL DEFAULT 0,
    `cocaine_e` INT NOT NULL DEFAULT 0,
    `actor_1` INT NOT NULL DEFAULT 0,
    `actor_2` INT NOT NULL DEFAULT 0,
    `actor_3` INT NOT NULL DEFAULT 0,
    `actor_4` INT NOT NULL DEFAULT 0,
    `actor_5` INT NOT NULL DEFAULT 0,
    `actor_6` INT NOT NULL DEFAULT 0,
    `actor_7` INT NOT NULL DEFAULT 0,
    `actor_8` INT NOT NULL DEFAULT 0,
    `actor_9` INT NOT NULL DEFAULT 0,
    `actor_10` INT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mru_aktorzy` (
  `uid` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `skin` smallint unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `vw` smallint unsigned NOT NULL,
  `angle` float NOT NULL,
  `anim` smallint NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mru_anims` (
  `uid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `cmd` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lib` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `speed` float NOT NULL,
  `loop/sa` tinyint NOT NULL,
  `lockx` tinyint NOT NULL,
  `locky` tinyint NOT NULL,
  `freeze` tinyint NOT NULL,
  `time` smallint NOT NULL,
  `action` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mru_attached` (
  `UID` int NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `sx` float NOT NULL,
  `sy` float NOT NULL,
  `sz` float NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mru_bilboard` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `posx` float NOT NULL DEFAULT '0',
  `posy` float NOT NULL DEFAULT '0',
  `posz` float NOT NULL DEFAULT '0',
  `rotx` float NOT NULL DEFAULT '0',
  `roty` float NOT NULL DEFAULT '0',
  `rotz` float NOT NULL DEFAULT '0',
  `text` varchar(256) NOT NULL DEFAULT 'Do wynaj�cia',
  `time` int NOT NULL DEFAULT '-1',
  `cost` int NOT NULL DEFAULT '0',
  `rentuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mru_bramy` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `model` int NOT NULL,
  `object_x` float NOT NULL,
  `object_y` float NOT NULL,
  `object_z` float NOT NULL,
  `object_rx` float NOT NULL,
  `object_ry` float NOT NULL,
  `object_rz` float NOT NULL,
  `object_x2` float NOT NULL,
  `object_y2` float NOT NULL,
  `object_z2` float NOT NULL,
  `object_rx2` float NOT NULL,
  `object_ry2` float NOT NULL,
  `object_rz2` float NOT NULL,
  `speed` float NOT NULL,
  `range` float NOT NULL,
  `perm_type` int NOT NULL,
  `perm_id` int NOT NULL,
  `object_vw` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `mru_cars` ADD COLUMN `sideskirt` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `hood` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `exhaust` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `vent` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `lamps` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `roof` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `siren` tinyint NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `max_hp` float NOT NULL DEFAULT '0';
ALTER TABLE `mru_cars` ADD COLUMN `bulletproof` tinyint NOT NULL DEFAULT '0';
CREATE TABLE IF NOT EXISTS `mru_ceny_pojazdy` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `nazwa_ceny` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `cena` int NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

ALTER TABLE `mru_config` ADD COLUMN `changelog` text CHARACTER SET utf8 COLLATE utf8_polish_ci;
CREATE TABLE IF NOT EXISTS `mru_discord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT '0',
  `org_id` tinyint NOT NULL DEFAULT '0',
  `channel_id` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mru_frakcje` (
  `UID` int NOT NULL DEFAULT '0',
  `Name` varchar(64) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `a` float NOT NULL DEFAULT '0',
  `Int` int NOT NULL DEFAULT '0',
  `VW` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mru_groups` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `ShortName` text NOT NULL,
  `Color` int NOT NULL DEFAULT '-1',
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `a` float NOT NULL,
  `Int` int NOT NULL,
  `VW` int NOT NULL,
  `Flags` text NOT NULL,
  `Ranks` text NOT NULL,
  `Leader` int NOT NULL,
  `vLeader` text NOT NULL,
  `Money` int NOT NULL,
  `Mats` int NOT NULL,
  `Skins` text NOT NULL,
  `MaxDuty` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mru_items` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `vw` int NOT NULL DEFAULT '0',
  `int` int NOT NULL DEFAULT '0',
  `dropped` int NOT NULL DEFAULT '0',
  `owner_type` int NOT NULL DEFAULT '1',
  `owner` int NOT NULL DEFAULT '0',
  `item_type` int NOT NULL DEFAULT '0',
  `value1` int NOT NULL DEFAULT '0',
  `value2` int NOT NULL DEFAULT '0',
  `used` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1',
  `value3` int NOT NULL DEFAULT '0',
  `secretValue` int NOT NULL DEFAULT '0',
  `last_update` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `mru_items` ADD COLUMN `receive_time` int NOT NULL DEFAULT '0';

CREATE TABLE IF NOT EXISTS `mru_kary` (
  `penalty_id` int NOT NULL AUTO_INCREMENT,
  `player_uid` int NOT NULL,
  `player_gid` int NOT NULL,
  `player_ip` varchar(32) NOT NULL DEFAULT 'nieznane',
  `admin_uid` int NOT NULL,
  `admin_gid` int NOT NULL,
  `time` int NOT NULL,
  `type` int NOT NULL,
  `value` int NOT NULL,
  `reason` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`penalty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mru_kary_bany` (
  `ban_id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) NOT NULL,
  `player_global_id` int NOT NULL,
  PRIMARY KEY (`ban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mru_konta` ADD COLUMN `PizzaboySkill` smallint NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Hunger` float NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Thirst` float NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `motelEvict` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `online` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `fishCooldown` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `DutyTime` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `DutyCheck` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `BlokadaBroni` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `betatester` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `lastver` varchar(64) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL DEFAULT 'v0.0.0';
ALTER TABLE `mru_konta` ADD COLUMN `temp` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `hidden` tinyint(1) NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `uid_forum` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `Mikolaj` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `pPlayerEXP` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `pOsiagniecia1` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `pOsiagniecia2` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `pOsiagniecia3` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `pOsiagniecia4` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `pOsiagniecia5` int DEFAULT NULL;
ALTER TABLE `mru_konta` ADD COLUMN `Grupa1` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa2` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa3` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa4` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa5` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa1Rank` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa2Rank` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa3Rank` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa4Rank` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa5Rank` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa1Skin` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa2Skin` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa3Skin` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa4Skin` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Grupa5Skin` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `GrupaSpawn` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `spawnhouseid` int NOT NULL DEFAULT '-1';
ALTER TABLE `mru_konta` ADD COLUMN `maxsadzonki` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `ChangeNumber` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `Convert` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `DeagleSkill` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `ColtSkill` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `SilencedSkill` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `ShotgunSkill` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `M4Skill` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `AKSkill` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `LastHP` float NOT NULL DEFAULT '50';
ALTER TABLE `mru_konta` ADD COLUMN `LastArmour` float NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `PlayGames` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `GroupMoneySpent` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_konta` ADD COLUMN `GroupMoneySpentTime` int NOT NULL DEFAULT '0';
CREATE TABLE IF NOT EXISTS `mru_logs_settings` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` bit(8) NOT NULL DEFAULT b'0',
  `style` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dark',
  `online` int NOT NULL DEFAULT '0',
  `betterlogs` tinyint(1) NOT NULL DEFAULT '1',
  `rawlogs` tinyint(1) NOT NULL DEFAULT '0',
  `paging` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mru_logs_settings_chat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `name` varchar(64) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=cp1250;

CREATE TABLE IF NOT EXISTS `mru_mmat` (
  `objectid` int NOT NULL,
  `materialindex` int NOT NULL,
  `modelid` int NOT NULL,
  `txdname` text NOT NULL,
  `texturename` text NOT NULL,
  `materialcolor` int NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mru_motele` (
  `UID` smallint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL DEFAULT 'Motel',
  `Rooms` smallint NOT NULL DEFAULT '-1',
  `Occupied` smallint NOT NULL DEFAULT '0',
  `Price` int NOT NULL DEFAULT '0',
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `VW` int NOT NULL DEFAULT '0',
  `Interior` int NOT NULL DEFAULT '0',
  `InX` float NOT NULL DEFAULT '0',
  `InY` float NOT NULL DEFAULT '0',
  `InZ` float NOT NULL DEFAULT '0',
  `InVW` int NOT NULL DEFAULT '0',
  `InInterior` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mru_motele_rooms` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `MotelUID` smallint NOT NULL DEFAULT '0',
  `RoomNum` smallint NOT NULL DEFAULT '0',
  `Interior` smallint NOT NULL DEFAULT '0',
  `OwnerUID` int NOT NULL DEFAULT '0',
  `Doors` smallint NOT NULL DEFAULT '0',
  `LastOnline` varchar(32) NOT NULL DEFAULT '0.0.0000',
  `PayOffline` int NOT NULL DEFAULT '0',
  `Access` varchar(256) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mru_napady` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `RX` float NOT NULL DEFAULT '0',
  `RY` float NOT NULL DEFAULT '0',
  `RZ` float NOT NULL DEFAULT '0',
  `VW` int NOT NULL,
  `INT` int NOT NULL,
  `Cash` int NOT NULL DEFAULT '5000',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mru_obiekty` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `model` int NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `vw` int NOT NULL DEFAULT '0',
  `o_int` int NOT NULL DEFAULT '0',
  `ownertype` int NOT NULL COMMENT '1 = admin',
  `owner` int NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `mru_org` ADD COLUMN `UID` int NOT NULL;
ALTER TABLE `mru_org` ADD COLUMN `flags` int NOT NULL DEFAULT '0';
ALTER TABLE `mru_personalization` ADD COLUMN `AnimacjaMowienia` tinyint(1) NOT NULL DEFAULT '0';
ALTER TABLE `mru_personalization` ADD COLUMN `JoinLeave` tinyint NOT NULL DEFAULT '0';
ALTER TABLE `mru_personalization` ADD COLUMN `OgloszeniaTyp` tinyint NOT NULL DEFAULT '1';
ALTER TABLE `mru_personalization` ADD COLUMN `KomunikatyAresztowania` tinyint NOT NULL DEFAULT '0';
ALTER TABLE `mru_personalization` ADD COLUMN `KomunikatyNews` tinyint NOT NULL DEFAULT '0';
CREATE TABLE IF NOT EXISTS `mru_products` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `orgID` int NOT NULL DEFAULT '0',
  `product_name` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `value1` int NOT NULL DEFAULT '0',
  `value2` int NOT NULL DEFAULT '0',
  `item_type` int NOT NULL,
  `quant` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mru_rodziny` (
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

ALTER TABLE `mru_sejfy` ADD COLUMN `matsy` int DEFAULT '0';
CREATE TABLE IF NOT EXISTS `mru_tattoo` (
	`UID` INT(10) NOT NULL AUTO_INCREMENT,
	`ID` INT(10) NOT NULL DEFAULT '0',
	`owner` INT(10) NOT NULL DEFAULT '0',
	`offsetX` FLOAT NOT NULL DEFAULT '0',
	`offsetY` FLOAT NOT NULL DEFAULT '0',
	`offsetZ` FLOAT NOT NULL DEFAULT '0',
	`rX` FLOAT NOT NULL DEFAULT '0',
	`rY` FLOAT NOT NULL DEFAULT '0',
	`rZ` FLOAT NOT NULL DEFAULT '0',
	`bone` INT(10) NOT NULL DEFAULT '0',
	PRIMARY KEY (`UID`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


/*
Pominiety surowy fragment dumpa Kotnika. Zawieral pelna kopie tabeli forum,
przykladowe konta i stare dane organizacji. Nie wolno importowac go do
istniejacej bazy M-RP ani przechowywac w repozytorium jako aktywnej migracji.

-- Zrzut struktury tabela kotniczek.mybb_users
CREATE TABLE IF NOT EXISTS `mybb_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL DEFAULT '',
  `password` varchar(120) NOT NULL DEFAULT '',
  `salt` varchar(10) NOT NULL DEFAULT '',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(220) NOT NULL DEFAULT '',
  `postnum` int unsigned NOT NULL DEFAULT '0',
  `threadnum` int unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(200) NOT NULL DEFAULT '',
  `avatardimensions` varchar(10) NOT NULL DEFAULT '',
  `avatartype` varchar(10) NOT NULL DEFAULT '0',
  `usergroup` smallint unsigned NOT NULL DEFAULT '0',
  `additionalgroups` varchar(200) NOT NULL DEFAULT '',
  `displaygroup` smallint unsigned NOT NULL DEFAULT '0',
  `usertitle` varchar(250) NOT NULL DEFAULT '',
  `regdate` int unsigned NOT NULL DEFAULT '0',
  `lastactive` int unsigned NOT NULL DEFAULT '0',
  `lastvisit` int unsigned NOT NULL DEFAULT '0',
  `lastpost` int unsigned NOT NULL DEFAULT '0',
  `website` varchar(200) NOT NULL DEFAULT '',
  `icq` varchar(10) NOT NULL DEFAULT '',
  `skype` varchar(75) NOT NULL DEFAULT '',
  `google` varchar(75) NOT NULL DEFAULT '',
  `birthday` varchar(15) NOT NULL DEFAULT '',
  `birthdayprivacy` varchar(4) NOT NULL DEFAULT 'all',
  `signature` text NOT NULL,
  `allownotices` tinyint(1) NOT NULL DEFAULT '0',
  `hideemail` tinyint(1) NOT NULL DEFAULT '0',
  `subscriptionmethod` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `receivepms` tinyint(1) NOT NULL DEFAULT '0',
  `receivefrombuddy` tinyint(1) NOT NULL DEFAULT '0',
  `pmnotice` tinyint(1) NOT NULL DEFAULT '0',
  `pmnotify` tinyint(1) NOT NULL DEFAULT '0',
  `buddyrequestspm` tinyint(1) NOT NULL DEFAULT '1',
  `buddyrequestsauto` tinyint(1) NOT NULL DEFAULT '0',
  `threadmode` varchar(8) NOT NULL DEFAULT '',
  `showimages` tinyint(1) NOT NULL DEFAULT '0',
  `showvideos` tinyint(1) NOT NULL DEFAULT '0',
  `showsigs` tinyint(1) NOT NULL DEFAULT '0',
  `showavatars` tinyint(1) NOT NULL DEFAULT '0',
  `showquickreply` tinyint(1) NOT NULL DEFAULT '0',
  `showredirect` tinyint(1) NOT NULL DEFAULT '0',
  `ppp` smallint unsigned NOT NULL DEFAULT '0',
  `tpp` smallint unsigned NOT NULL DEFAULT '0',
  `daysprune` smallint unsigned NOT NULL DEFAULT '0',
  `dateformat` varchar(4) NOT NULL DEFAULT '',
  `timeformat` varchar(4) NOT NULL DEFAULT '',
  `timezone` varchar(5) NOT NULL DEFAULT '',
  `dst` tinyint(1) NOT NULL DEFAULT '0',
  `dstcorrection` tinyint(1) NOT NULL DEFAULT '0',
  `buddylist` text NOT NULL,
  `ignorelist` text NOT NULL,
  `style` smallint unsigned NOT NULL DEFAULT '0',
  `away` tinyi…8402 tokens truncated…cerzy', 2422.24, -1749.59, 13.5469, 267.71, 0, 0),
	(17, 'LSFD', 1756.92, -1122.9, 227.806, 82.8949, 0, 22),
	(18, 'Freelancery', 0, 0, 0, 0, 0, 0),
	(19, 'Brak', 0, 0, 0, 0, 0, 0);

INSERT IGNORE INTO `mru_groups` (`UID`, `Name`, `ShortName`, `Color`, `x`, `y`, `z`, `a`, `Int`, `VW`, `Flags`, `Ranks`, `Leader`, `vLeader`, `Money`, `Mats`, `Skins`) VALUES
	(1, 'Los Santos Police Department', 'LSPD', 1570955007, 1578.69, -1635.21, 13.5645, 356.811, 0, 0, '6,14,13,28,21', 'Cadet,Police Officer I,Police Officer II,-,-,-,-,-,-,-,-', 0, '0', 0, 0, '311,300,66'),
	(2, 'Federal Bureau of Investigation', 'FBoI', 1, 600.955, -1490.7, 15.0571, 199.069, 0, 0, '6,14,13', '-', 0, '0', 0, 0, '5'),
	(3, 'National Guards', 'NG', 1, 2689.13, -2366.78, 13.6328, 176.21, 0, 0, '6,14,13', '-', 0, '0', 0, 0, '0'),
	(4, 'Los Santos Rescue Center', 'LSRC', -1, 1177.45, -1327.74, 14.0711, 186.043, 0, 0, '7,14,13,21', '-,-,-,-,-,-,-,-,-,-,Lider', 0, '0', 0, 0, '311,301,256,50,31'),
	(5, 'Camorra', 'C', 1, 2730.32, -2451.21, 17.5937, 289.463, 0, 0, '8,13', '-', 0, '0', 0, 0, '0'),
	(6, 'Yakuza', 'Y', 1, 2801.39, -1088.04, 30.7217, 179.427, 0, 0, '8,13', '-', 0, '0', 0, 0, '0'),
	(7, 'United States Secret Service', 'USSS', 1, 1508.77, -1470.02, 14.2133, 286.286, 0, 41, '13', '-', 0, '0', 0, 0, '0'),
	(8, 'Hitman Agency', 'HA', 1, -49.6947, -276.316, 5.42969, 177.586, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
	(9, 'San News', 'SN', 1, 732.954, -1341.47, 14.4214, 284.765, 0, 0, '11,13', '-', 1, '0', 0, 0, '0'),
	(10, '10', 'Korporacja Transportowa', -1, 0, 0, 0, 0, 0, 0, '0', '-,-,-,-,-,-,-,-,-,-,-', 0, '0', 0, 0, '0'),
	(11, 'Los Santos Government', 'LSG', -1, 1436.77, -1829.74, 58.6723, 270.677, 0, 51, '10,13', '-,-,-,-,-,-,-,-,-,-,-', 1, '0', 25, 0, '0'),
	(12, 'Grove Street Families', 'GSF', 1, 2495.35, -1686.99, 13.5151, 0.896565, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
	(13, 'Uninvited guests', 'Ug', 1, 2149.87, -1286.29, 24.1965, 333.553, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
	(14, 'Ballas', 'B', 1, 1933.42, -1122.11, 26.3131, 177.987, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
	(15, 'Undetected', 'U', -1, 1093.76, -1194.46, 18.0981, 178.455, 0, 0, '3,8,13,4', '-,-,-,-,-,-,-,-,-,-,-', 1, '0', 0, 0, '0'),
	(16, 'Freelancerzy', 'F', 1, 2422.24, -1749.59, 13.5469, 267.71, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
	(17, 'LSFD', 'LSFD', 1, 1756.92, -1122.9, 227.806, 82.8949, 0, 22, '12,14,13', '-', 1, '0', 0, 0, '0'),
	(18, 'Ibiza Club', 'IC', 1, 403.516, -1801.61, 7.82812, 1.31537, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(19, 'Vinyl Club', 'VC', 1, 816.221, -1386.19, 13.5996, 46.9039, 0, 0, '16', '-', 1, '0', 0, 0, '0'),
	(20, 'Solarin Industries', 'SI', 1, 807.156, -602.547, 16.3359, 246.955, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(21, 'Ammunation Los Santos', 'ALS', 1, 1795.24, -1166.7, 23.39, 158.311, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(22, 'Supreme Court of San Andreas', 'SCoSA', 1, 1309.86, -1368.97, 13.5557, 182.345, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(23, 'Event Team', 'ET', 1, 2569.66, -1122.28, 65.2784, 112.787, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(24, 'National Balla Association', 'NBA', 1, 1898.54, -1720.2, 13.531, 46.7901, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(25, 'The Lost MC', 'TLMC', 1, 270.088, 1.62426, 2.43583, 97.1374, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(26, 'Ammunation Willowfield', 'AW', 1, 2400.38, -1980.53, 13.5469, 345.289, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(27, 'Ammunation Commerce', 'AC', 1, 1706.08, -1502.75, 13.3828, 288.493, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(28, 'Leo country bar', 'Lcb', 1, 2110, -1807.12, 13.6504, 85.7699, 0, 0, '1', '-,-,-,-,-,-,-,-,-,-,-', 2, '1,2', 0, 0, '0'),
	(29, 'santos customs', 'c', 1, 1767.76, -1677.2, 14.4097, 87.7789, 0, 12, '0', '-', 1, '0', 0, 0, '0'),
	(30, 'Pimp Your Ride Workshop', 'PYRW', 1, 1015.86, -1369.52, 13.3738, 45.3346, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(31, 'Islamic State of Iraq and Syria', 'ISoIaS', 1, -798.207, 1553.28, 27.1172, 99.7475, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(32, 'Pimp Your Ride Workshop', 'PYRW', 1, 2331.08, -1228.07, 22.5, 284.028, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(33, 'the playboy players', 'pp', 1, 2755.85, -1180.47, 69.3984, 359.361, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(34, 'Companeros Del Diablo', 'CDD', 1, 2217.6, -1167.97, 25.7266, 37.8389, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(35, 'Guerrilla Family gang uliczny', 'GFgu', 1, 2526.89, -2009.36, 13.554, 86.7296, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(36, 'Promienna 13''', 'P13''', 1, 2780.93, -1985.11, 13.5559, 159.252, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(37, 'Grove Street Families', 'GSF', 1, 2495.17, -1687.51, 13.5153, 352.916, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(38, 'Ku Klux Klan', 'KKK', 1, 1022.61, -308.836, 73.9931, 127.381, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(39, 'Camorra Family', 'CF', 1, 2806.34, -1087.44, 30.7337, 90.4364, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(40, 'islamic state of iraq and syria', 'soias', 1, 881.599, -21.9463, 63.207, 118.11, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(41, 'RUSSKAYA KOPMANIYA', 'RUSSKAYAKOPMANIYA', 1, 277.688, -1433.32, 13.8986, 27.8118, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(42, 'The Blackwoods Crew', 'TBC', 1, 1940.8, -2115.86, 13.6953, 273.124, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(43, 'Vagos Bandits', 'VB', 1, 1603.69, -1219.63, 17.4754, 248.456, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(44, 'Rix 77'' Carte', 'R77''C', 1, 2047.06, -2046.66, 13.5469, 252.498, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(45, 'Promienna', 'P', 1, 2761.1, -1946.28, 13.5469, 246.13, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(46, 'Nieuzywane', 'N', 1, 1023.83, -307.679, 73.9931, 64.3531, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(47, 'Son''s Of Nicodem', 'S''ON', 1, 1491.79, -1140.99, 24.0781, 294.35, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(48, 'LS Auto Center', 'LSAC', 1, 1872.32, -1689.7, 13.5889, 35.8273, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(49, 'Vegas Club', 'VC', 1, 1846.51, -1743.74, 13.5469, 250.882, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
	(50, 'Khadahal Clan', 'KC', 1, 1983.31, -1580.19, 13.5507, 272.889, 0, 0, '0', '-', 1, '0', 0, 0, '0');

INSERT IGNORE INTO `mru_konta` (`UID`, `Nick`, `Key`, `Salt`, `Level`, `Admin`, `DonateRank`, `UpgradePoints`, `ConnectedTime`, `Registered`, `Sex`, `Age`, `Origin`, `CK`, `Muted`, `Respect`, `Money`, `Bank`, `Crimes`, `Kills`, `Deaths`, `Arrested`, `WantedDeaths`, `Phonebook`, `LottoNr`, `Fishes`, `BiggestFish`, `Job`, `Paycheck`, `HeadValue`, `BlokadaPisania`, `Jailed`, `AJreason`, `JailTime`, `Materials`, `Drugs`, `Lider`, `Member`, `FMember`, `Rank`, `Char`, `Skin`, `JobSkin`, `ContractTime`, `DetSkill`, `SexSkill`, `BoxSkill`, `LawSkill`, `MechSkill`, `JackSkill`, `CarSkill`, `NewsSkill`, `DrugsSkill`, `CookSkill`, `FishSkill`, `GunSkill`, `TruckSkill`, `PizzaboySkill`, `pSHealth`, `pHealth`, `VW`, `Int`, `Local`, `Team`, `Model`, `Dom`, `Bizz`, `BizzMember`, `Wynajem`, `Pos_x`, `Pos_y`, `Pos_z`, `CarLic`, `FlyLic`, `BoatLic`, `FishLic`, `GunLic`, `Gun0`, `Gun1`, `Gun2`, `Gun3`, `Gun4`, `Gun5`, `Gun6`, `Gun7`, `Gun8`, `Gun9`, `Gun10`, `Gun11`, `Gun12`, `Ammo0`, `Ammo1`, `Ammo2`, `Ammo3`, `Ammo4`, `Ammo5`, `Ammo6`, `Ammo7`, `Ammo8`, `Ammo9`, `Ammo10`, `Ammo11`, `Ammo12`, `CarTime`, `PayDay`, `PayDayHad`, `CDPlayer`, `Wins`, `Loses`, `AlcoholPerk`, `DrugPerk`, `MiserPerk`, `PainPerk`, `TraderPerk`, `Tutorial`, `Mission`, `Warnings`, `Block`, `Fuel`, `Married`, `MarriedTo`, `CBRADIO`, `PoziomPoszukiwania`, `Dowod`, `PodszywanieSie`, `ZmienilNick`, `PodgladWiadomosci`, `StylWalki`, `PAdmin`, `ZaufanyGracz`, `Uniform`, `CruiseController`, `FixKit`, `Auto1`, `Auto2`, `Auto3`, `Auto4`, `Lodz`, `Samolot`, `Garaz`, `KluczykiDoAuta`, `Spawn`, `BW`, `Czystka`, `CarSlots`, `Immunity`, `Hat`, `FW`, `connected`, `Injury`, `HealthPacks`, `Hunger`, `Thirst`, `motelEvict`, `online`, `fishCooldown`, `DutyTime`, `DutyCheck`, `BlokadaBroni`, `betatester`, `lastver`, `temp`, `hidden`, `uid_forum`, `Mikolaj`, `pPlayerEXP`, `pOsiagniecia1`, `pOsiagniecia2`, `pOsiagniecia3`, `pOsiagniecia4`, `pOsiagniecia5`, `Grupa1`, `Grupa2`, `Grupa3`, `Grupa1Rank`, `Grupa2Rank`, `Grupa3Rank`, `Grupa1Skin`, `Grupa2Skin`, `Grupa3Skin`, `GrupaSpawn`, `ChangeNumber`, `Convert`, `DeagleSkill`, `ColtSkill`, `SilencedSkill`, `ShotgunSkill`, `M4Skill`, `AKSkill`, `LastHP`, `LastArmour`) VALUES
	-- Przykladowe konto z dumpa usunieto: migracja nie tworzy kont ani hasel.

INSERT IGNORE INTO `mru_logs_settings` (`name`, `level`, `style`, `online`, `betterlogs`, `rawlogs`, `paging`, `token`) VALUES
	('Ank', b'00111111', 'dark', 1684015126, 1, 0, 1, '0'),
	('xSeLeCTx', b'00111111', 'dark', 1725067274, 1, 0, 1, '0');

INSERT IGNORE INTO `mru_motele` (`UID`, `Name`, `Rooms`, `Occupied`, `Price`, `PosX`, `PosY`, `PosZ`, `VW`, `Interior`, `InX`, `InY`, `InZ`, `InVW`, `InInterior`) VALUES
	(1, 'Motel Idlewood', -1, -1, 250, 2177.92, -1770.66, 13.54, 0, 0, 2234.49, -1166.01, 35.4968, 4301, 1),
	(2, 'Motel Jefferson', -1, 0, 350, 2232.53, -1159.76, 25.8906, 0, 0, 2215.69, -1150.6, 1025.79, 4302, 15);

INSERT IGNORE INTO `mru_org` (`ID`, `UID`, `Type`, `Name`, `Motd`, `Color`, `x`, `y`, `z`, `a`, `Int`, `VW`, `flags`) VALUES
	(549, 18, 5, 'Ibiza Club', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(550, 17, 5, 'Vinyl Club', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(602, 43, 4, 'Basen Tsunami', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(639, 26, 4, 'Solarin Industries', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(640, 23, 4, 'military.com', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(664, 1, 0, 'Supreme Court of San Andreas', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(691, 35, 0, 'Salon Samochodowy', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(697, 40, 2, 'Arms Dealer', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(705, 30, 3, 'Event Team', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(720, 38, 0, 'Epizod Fort Carson', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(737, 5, 1, 'Hoover Gangster Crips', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(747, 4, 1, 'The Lost MC', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(759, 21, 4, 'Ammunation Willowfield', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(760, 3, 4, 'AmmuNation', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(761, 22, 4, 'Ammunation Commerce', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(762, 45, 4, 'Pizzeria PRESTIGE', '0', 0, 2103.27, -1808.81, 13.6504, 10, 0, 0, 33),
	(763, 31, 4, 'Bar Dillimore', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(765, 27, 1, 'Sekta', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(769, 15, 4, 'Warsztat Idle', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(771, 16, 4, 'Crew Tune', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(772, 9, 2, 'Islamic State of Iraq and Syria', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(774, 19, 4, 'Pimp Your Ride Workshop', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(775, 6, 2, 'the playboy players', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(776, 8, 2, 'Companeros Del Diablo', '0', 0, 0, 0, 0, 0, 0, 0, 0),
	(778, 28, 1, 'Guerrilla Family gang uliczny', '0', 0, 0, 0, 0, 0, 0, 0, 0);

INSERT IGNORE INTO `mru_rodziny` (`name`, `id`) VALUES
	('FAMILY_RSC', -1),
	('FAMILY_SAD', 1),
	('FAMILY_FDU', 14),
	('FAMILY_VINYL', 17),
	('FAMILY_IBIZA', 18),
	('FAMILY_SEKTA', 27),
	('FAMILY_LCN', 40),
	('FAMILY_YKZ', 41),
	('FAMILY_GROVE', 42),
	('FAMILY_BALLAS', 43),
	('FAMILY_VAGOS', 44),
	('FAMILY_WPS', 46),
	('FAMILY_ALHAMBRA', 49),
	('FAMILY_NOA', 50);

INSERT IGNORE INTO `mru_strefy` (`id`, `gang`, `expire`) VALUES
	(0, 0, 0),
	(1, 0, 0),
	(2, 0, 0),
	(3, 0, 0),
	(4, 0, 0),
	(5, 0, 0),
	(6, 0, 0),
	(7, 0, 0),
	(8, 0, 0),
	(9, 0, 0),
	(10, 0, 0),
	(11, 0, 0),
	(12, 0, 0),
	(13, 0, 0),
	(14, 0, 0),
	(15, 0, 0),
	(16, 0, 0),
	(17, 0, 0),
	(18, 0, 0),
	(19, 0, 0),
	(20, 0, 0),
	(21, 0, 0),
	(22, 0, 0),
	(23, 0, 0),
	(24, 0, 0),
	(25, 0, 0),
	(26, 0, 0),
	(27, 0, 0),
	(28, 0, 0),
	(29, 0, 0),
	(30, 0, 0),
	(31, 0, 0),
	(32, 0, 0),
	(33, 0, 0),
	(34, 0, 0),
	(35, 0, 0),
	(36, 0, 0),
	(37, 0, 0),
	(38, 0, 0),
	(39, 0, 0),
	(40, 0, 0),
	(41, 0, 0),
	(42, 0, 0),
	(43, 0, 0),
	(44, 0, 0),
	(45, 0, 0),
	(46, 0, 0),
	(47, 0, 0),
	(48, 0, 0),
	(49, 0, 0),
	(50, 0, 0),
	(51, 0, 0),
	(52, 0, 0),
	(53, 0, 0),
	(54, 0, 0),
	(55, 0, 0),
	(56, 0, 0),
	(57, 0, 0),
	(58, 0, 0),
	(59, 0, 0),
	(60, 0, 0),
	(61, 0, 0),
	(62, 0, 0),
	(63, 0, 0),
	(64, 0, 0);

*/

-- Minimalna lokalna tabela zgodnosci. Produkcja moze wskazac oddzielna baze forum.
CREATE TABLE IF NOT EXISTS `mybb_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL DEFAULT '',
  `password` varchar(120) NOT NULL DEFAULT '',
  `salt` varchar(10) NOT NULL DEFAULT '',
  `usergroup` smallint unsigned NOT NULL DEFAULT '0',
  `samp_warns` int NOT NULL DEFAULT '0',
  `samp_kc` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Tkanin', 1, 500, 600, 638.8908, 851.9096, -42.9609
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Tkanin');

INSERT IGNORE INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Metali', 2, 500, 300, 2119.2893, -1969.7300, 13.782
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Metali');

INSERT IGNORE INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Materialow', 3, 500, 100, -744.4017, -129.8114, 66.11
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Materialow');

INSERT IGNORE INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Kokainy', 4, 500, 200, -2160.3679, 654.5424, 52.3672
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Kokainy');

INSERT IGNORE INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Chemikaliow', 5, 500, 3500, 2085.9185, 2070.8342, 10.8203
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Chemikaliow');

INSERT IGNORE INTO `mru_groups` (`UID`, `Name`, `ShortName`, `Color`, `x`, `y`, `z`, `a`, `Int`, `VW`, `Flags`, `Ranks`, `Leader`, `vLeader`, `Money`, `Mats`, `Skins`) VALUES
(1, 'Los Santos Police Department', 'LSPD', 1570955007, 1578.69, -1635.21, 13.5645, 356.811, 0, 0, '6,14,13,28,21', 'Cadet,Police Officer I,Police Officer II,-,-,-,-,-,-,-,-', 0, '0', 0, 175, '311,300,66'),
(2, 'Federal Bureau of Investigation', 'FBoI', 1, 600.955, -1490.7, 15.0571, 199.069, 0, 0, '6,14,13', '-', 0, '0', 0, 0, '5'),
(3, 'National Guards', 'NG', 1, 2689.13, -2366.78, 13.6328, 176.21, 0, 0, '6,14,13', '-', 0, '0', 0, 0, '0'),
(4, 'Los Santos Rescue Center', 'LSRC', -1, 1177.45, -1327.74, 14.0711, 186.043, 0, 0, '7,14,13,21', '-,-,-,-,-,-,-,-,-,-,Lider', 0, '0', 0, 0, '311,301,256,50,31'),
(5, 'Camorra', 'C', 1, 2730.32, -2451.21, 17.5937, 289.463, 0, 0, '8,13', '-', 0, '0', 0, 0, '0'),
(6, 'Yakuza', 'Y', 1, 2801.39, -1088.04, 30.7217, 179.427, 0, 0, '8,13', '-', 0, '0', 0, 0, '0'),
(7, 'United States Secret Service', 'USSS', 1, 1508.77, -1470.02, 14.2133, 286.286, 0, 41, '13', '-', 0, '0', 0, 0, '0'),
(8, 'Hitman Agency', 'HA', 1, -49.6947, -276.316, 5.42969, 177.586, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
(9, 'San News', 'SN', 1, 732.954, -1341.47, 14.4214, 284.765, 0, 0, '11,13', '-', 1, '0', 0, 0, '0'),
(10, 'Korporacja Transportowa', 'KT', 1, 2487.71, -2093.4, 18.7579, 21.8746, 0, 33, '9,13', '-', 1, '0', 0, 0, '0'),
(11, 'Los Santos Government', 'LSG', -1, 1436.77, -1829.74, 58.6723, 270.677, 0, 51, '10,13', '-,-,-,-,-,-,-,-,-,-,-', 1, '0', 25, 0, '0'),
(12, 'Grove Street Families', 'GSF', 1, 2495.35, -1686.99, 13.5151, 0.896565, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
(13, 'Uninvited guests', 'Ug', 1, 2149.87, -1286.29, 24.1965, 333.553, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
(14, 'Ballas', 'B', 1, 1933.42, -1122.11, 26.3131, 177.987, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
(15, 'Undetected', 'U', 1, 1093.76, -1194.46, 18.0981, 178.455, 0, 0, '3,8,13', '-', 1, '0', 0, 0, '0'),
(16, 'Freelancerzy', 'F', 1, 2422.24, -1749.59, 13.5469, 267.71, 0, 0, '8,13', '-', 1, '0', 0, 0, '0'),
(17, 'LSFD', 'LSFD', 1, 1756.92, -1122.9, 227.806, 82.8949, 0, 22, '12,14,13', '-', 1, '0', 0, 0, '0'),
(18, 'Ibiza Club', 'IC', 1, 403.516, -1801.61, 7.82812, 1.31537, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(19, 'Vinyl Club', 'VC', 1, 816.221, -1386.19, 13.5996, 46.9039, 0, 0, '16', '-', 1, '0', 0, 0, '0'),
(20, 'Solarin Industries', 'SI', 1, 807.156, -602.547, 16.3359, 246.955, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(21, 'Ammunation Los Santos', 'ALS', 1, 1795.24, -1166.7, 23.39, 158.311, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(22, 'Supreme Court of San Andreas', 'SCoSA', 1, 1309.86, -1368.97, 13.5557, 182.345, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(23, 'Event Team', 'ET', 1, 2569.66, -1122.28, 65.2784, 112.787, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(24, 'National Balla Association', 'NBA', 1, 1898.54, -1720.2, 13.531, 46.7901, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(25, 'The Lost MC', 'TLMC', 1, 270.088, 1.62426, 2.43583, 97.1374, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(26, 'Ammunation Willowfield', 'AW', 1, 2400.38, -1980.53, 13.5469, 345.289, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(27, 'Ammunation Commerce', 'AC', 1, 1706.08, -1502.75, 13.3828, 288.493, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(28, 'Leo country bar', 'Lcb', 1, 2110, -1807.12, 13.6504, 85.7699, 0, 0, '1', '-,-,-,-,-,-,-,-,-,-,-', 2, '1,2', 0, 0, '0'),
(29, 'santos customs', 'c', 1, 1767.76, -1677.2, 14.4097, 87.7789, 0, 12, '0', '-', 1, '0', 0, 0, '0'),
(30, 'Pimp Your Ride Workshop', 'PYRW', 1, 1015.86, -1369.52, 13.3738, 45.3346, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(31, 'Islamic State of Iraq and Syria', 'ISoIaS', 1, -798.207, 1553.28, 27.1172, 99.7475, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(32, 'Pimp Your Ride Workshop', 'PYRW', 1, 2331.08, -1228.07, 22.5, 284.028, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(33, 'the playboy players', 'pp', 1, 2755.85, -1180.47, 69.3984, 359.361, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(34, 'Companeros Del Diablo', 'CDD', 1, 2217.6, -1167.97, 25.7266, 37.8389, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(35, 'Guerrilla Family gang uliczny', 'GFgu', 1, 2526.89, -2009.36, 13.554, 86.7296, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(36, 'Promienna 13''', 'P13''', 1, 2780.93, -1985.11, 13.5559, 159.252, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(37, 'Grove Street Families', 'GSF', 1, 2495.17, -1687.51, 13.5153, 352.916, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(38, 'Ku Klux Klan', 'KKK', 1, 1022.61, -308.836, 73.9931, 127.381, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(39, 'Camorra Family', 'CF', 1, 2806.34, -1087.44, 30.7337, 90.4364, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(40, 'islamic state of iraq and syria', 'soias', 1, 881.599, -21.9463, 63.207, 118.11, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(41, 'RUSSKAYA KOPMANIYA', 'RUSSKAYAKOPMANIYA', 1, 277.688, -1433.32, 13.8986, 27.8118, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(42, 'The Blackwoods Crew', 'TBC', 1, 1940.8, -2115.86, 13.6953, 273.124, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(43, 'Vagos Bandits', 'VB', 1, 1603.69, -1219.63, 17.4754, 248.456, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(44, 'Rix 77'' Carte', 'R77''C', 1, 2047.06, -2046.66, 13.5469, 252.498, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(45, 'Promienna', 'P', 1, 2761.1, -1946.28, 13.5469, 246.13, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(46, 'Nieuzywane', 'N', 1, 1023.83, -307.679, 73.9931, 64.3531, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(47, 'Son''s Of Nicodem', 'S''ON', 1, 1491.79, -1140.99, 24.0781, 294.35, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(48, 'LS Auto Center', 'LSAC', 1, 1872.32, -1689.7, 13.5889, 35.8273, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(49, 'Vegas Club', 'VC', 1, 1846.51, -1743.74, 13.5469, 250.882, 0, 0, '0', '-', 1, '0', 0, 0, '0'),
(50, 'Khadahal Clan', 'KC', 1, 1983.31, -1580.19, 13.5507, 272.889, 0, 0, '0', '-', 1, '0', 0, 0, '0');

SET FOREIGN_KEY_CHECKS=1;

-- Konto testowe właściciela serwera: najwyższy poziom administracji Kotnika.
UPDATE `mru_konta` SET `Admin` = 5000 WHERE `Nick` = 'Miroslaw_Zlotowa';
