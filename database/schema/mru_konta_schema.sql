-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: mrucznik
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mru_konta`
--

DROP TABLE IF EXISTS `mru_konta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mru_konta` (
  `UID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nick` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `Key` varchar(129) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `Salt` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL DEFAULT '',
  `Level` tinyint unsigned NOT NULL DEFAULT '1',
  `Admin` smallint unsigned NOT NULL DEFAULT '0',
  `DonateRank` tinyint NOT NULL DEFAULT '0',
  `UpgradePoints` smallint unsigned NOT NULL DEFAULT '0',
  `ConnectedTime` smallint unsigned NOT NULL DEFAULT '0',
  `Registered` tinyint unsigned NOT NULL DEFAULT '0',
  `Sex` tinyint unsigned NOT NULL DEFAULT '0',
  `Age` tinyint unsigned NOT NULL DEFAULT '0',
  `Origin` tinyint unsigned NOT NULL DEFAULT '0',
  `CK` tinyint unsigned NOT NULL DEFAULT '0',
  `Muted` tinyint unsigned NOT NULL DEFAULT '0',
  `Respect` smallint unsigned NOT NULL DEFAULT '0',
  `Money` int NOT NULL DEFAULT '0',
  `Bank` int NOT NULL DEFAULT '0',
  `Crimes` smallint unsigned NOT NULL DEFAULT '0',
  `Kills` smallint unsigned NOT NULL DEFAULT '0',
  `Deaths` smallint unsigned NOT NULL DEFAULT '0',
  `Arrested` smallint unsigned NOT NULL DEFAULT '0',
  `WantedDeaths` smallint unsigned NOT NULL DEFAULT '0',
  `Phonebook` tinyint unsigned NOT NULL DEFAULT '0',
  `LottoNr` tinyint unsigned NOT NULL DEFAULT '0',
  `Fishes` int NOT NULL DEFAULT '0',
  `BiggestFish` int DEFAULT NULL,
  `Job` tinyint unsigned NOT NULL DEFAULT '0',
  `Paycheck` int NOT NULL DEFAULT '0',
  `HeadValue` int NOT NULL DEFAULT '0',
  `BlokadaPisania` tinyint unsigned NOT NULL DEFAULT '0',
  `Jailed` tinyint unsigned NOT NULL DEFAULT '0',
  `AJreason` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL DEFAULT 'Brak (stary system)',
  `JailTime` int DEFAULT '0',
  `Materials` int unsigned NOT NULL DEFAULT '0',
  `Kontrabanda` int DEFAULT '0',
  `Drugs` int unsigned NOT NULL DEFAULT '0',
  `Lider` tinyint unsigned NOT NULL DEFAULT '0',
  `Member` tinyint unsigned NOT NULL DEFAULT '0',
  `FMember` tinyint unsigned NOT NULL DEFAULT '0',
  `Rank` smallint unsigned NOT NULL DEFAULT '0',
  `Char` smallint unsigned NOT NULL DEFAULT '0',
  `Skin` smallint unsigned NOT NULL DEFAULT '0',
  `JobSkin` int NOT NULL DEFAULT '0',
  `ContractTime` tinyint unsigned NOT NULL DEFAULT '0',
  `DetSkill` smallint unsigned NOT NULL DEFAULT '0',
  `SexSkill` smallint unsigned NOT NULL DEFAULT '0',
  `BoxSkill` smallint unsigned NOT NULL DEFAULT '0',
  `LawSkill` smallint unsigned NOT NULL DEFAULT '0',
  `MechSkill` smallint unsigned NOT NULL DEFAULT '0',
  `JackSkill` smallint unsigned NOT NULL DEFAULT '0',
  `CarSkill` smallint unsigned NOT NULL DEFAULT '0',
  `NewsSkill` smallint unsigned NOT NULL DEFAULT '0',
  `DrugsSkill` smallint unsigned NOT NULL DEFAULT '0',
  `CookSkill` smallint unsigned NOT NULL DEFAULT '0',
  `FishSkill` smallint unsigned NOT NULL DEFAULT '0',
  `GunSkill` smallint unsigned NOT NULL DEFAULT '0',
  `TruckSkill` smallint unsigned NOT NULL DEFAULT '0',
  `pSHealth` float NOT NULL DEFAULT '0',
  `pHealth` float NOT NULL DEFAULT '0',
  `VW` int NOT NULL DEFAULT '0',
  `Int` smallint unsigned NOT NULL DEFAULT '0',
  `Local` smallint unsigned NOT NULL DEFAULT '0',
  `Team` tinyint unsigned NOT NULL DEFAULT '0',
  `Model` smallint unsigned NOT NULL DEFAULT '0',
  `PhoneNr` int NOT NULL DEFAULT '0',
  `Dom` int NOT NULL DEFAULT '0',
  `Bizz` int NOT NULL DEFAULT '255',
  `BizzMember` int NOT NULL DEFAULT '-1',
  `Wynajem` int NOT NULL DEFAULT '0',
  `Pos_x` float NOT NULL DEFAULT '0',
  `Pos_y` float NOT NULL DEFAULT '0',
  `Pos_z` float NOT NULL DEFAULT '0',
  `CarLic` tinyint unsigned NOT NULL DEFAULT '0',
  `FlyLic` tinyint unsigned NOT NULL DEFAULT '0',
  `BoatLic` tinyint unsigned NOT NULL DEFAULT '0',
  `FishLic` tinyint unsigned NOT NULL DEFAULT '0',
  `GunLic` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun0` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun1` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun2` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun3` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun4` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun5` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun6` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun7` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun8` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun9` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun10` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun11` tinyint unsigned NOT NULL DEFAULT '0',
  `Gun12` tinyint unsigned NOT NULL DEFAULT '0',
  `Ammo0` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo1` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo2` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo3` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo4` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo5` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo6` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo7` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo8` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo9` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo10` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo11` smallint unsigned NOT NULL DEFAULT '0',
  `Ammo12` smallint unsigned NOT NULL DEFAULT '0',
  `CarTime` int NOT NULL DEFAULT '0',
  `PayDay` int NOT NULL DEFAULT '0',
  `PayDayHad` int NOT NULL DEFAULT '0',
  `CDPlayer` tinyint unsigned NOT NULL DEFAULT '0',
  `Wins` tinyint unsigned NOT NULL DEFAULT '0',
  `Loses` tinyint unsigned NOT NULL DEFAULT '0',
  `AlcoholPerk` tinyint unsigned NOT NULL DEFAULT '0',
  `DrugPerk` tinyint unsigned NOT NULL DEFAULT '0',
  `MiserPerk` tinyint unsigned NOT NULL DEFAULT '0',
  `PainPerk` tinyint unsigned NOT NULL DEFAULT '0',
  `TraderPerk` tinyint unsigned NOT NULL DEFAULT '0',
  `Tutorial` tinyint unsigned NOT NULL DEFAULT '0',
  `Mission` tinyint unsigned NOT NULL DEFAULT '0',
  `Warnings` tinyint unsigned NOT NULL DEFAULT '0',
  `Block` tinyint unsigned NOT NULL DEFAULT '0',
  `Fuel` tinyint unsigned NOT NULL DEFAULT '0',
  `Married` int NOT NULL DEFAULT '0',
  `MarriedTo` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL DEFAULT 'Nikt',
  `CBRADIO` tinyint unsigned NOT NULL DEFAULT '0',
  `PoziomPoszukiwania` int NOT NULL DEFAULT '0',
  `Dowod` tinyint unsigned NOT NULL DEFAULT '0',
  `PodszywanieSie` tinyint unsigned NOT NULL DEFAULT '0',
  `ZmienilNick` tinyint unsigned NOT NULL DEFAULT '2',
  `Wino` tinyint unsigned NOT NULL DEFAULT '0',
  `Piwo` tinyint unsigned NOT NULL DEFAULT '0',
  `Cygaro` tinyint unsigned NOT NULL DEFAULT '0',
  `Sprunk` tinyint unsigned NOT NULL DEFAULT '0',
  `PodgladWiadomosci` tinyint unsigned NOT NULL DEFAULT '0',
  `StylWalki` tinyint unsigned NOT NULL DEFAULT '0',
  `PAdmin` tinyint unsigned NOT NULL DEFAULT '0',
  `ZaufanyGracz` tinyint unsigned NOT NULL DEFAULT '0',
  `Uniform` int NOT NULL DEFAULT '0',
  `CruiseController` tinyint(1) NOT NULL DEFAULT '0',
  `FixKit` tinyint NOT NULL DEFAULT '0',
  `Auto1` int NOT NULL DEFAULT '0',
  `Auto2` int NOT NULL DEFAULT '0',
  `Auto3` int NOT NULL DEFAULT '0',
  `Auto4` int NOT NULL DEFAULT '0',
  `Lodz` int NOT NULL DEFAULT '0',
  `Samolot` int NOT NULL DEFAULT '0',
  `Garaz` int NOT NULL DEFAULT '0',
  `KluczykiDoAuta` int NOT NULL DEFAULT '0',
  `Spawn` tinyint unsigned NOT NULL DEFAULT '3',
  `BW` smallint unsigned NOT NULL DEFAULT '0',
  `Czystka` smallint unsigned NOT NULL DEFAULT '0',
  `CarSlots` tinyint unsigned NOT NULL DEFAULT '4',
  `Hat` tinyint unsigned NOT NULL DEFAULT '0',
  `FW` tinyint unsigned NOT NULL DEFAULT '0',
  `Injury` smallint NOT NULL DEFAULT '0',
  `HealthPacks` smallint NOT NULL DEFAULT '0',
  `Immunity` int NOT NULL DEFAULT '10',
  `connected` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Nick` (`Nick`)
) ENGINE=InnoDB AUTO_INCREMENT=185408 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 18:03:41
