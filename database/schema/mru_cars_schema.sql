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
-- Table structure for table `mru_cars`
--

DROP TABLE IF EXISTS `mru_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mru_cars` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `ownertype` int NOT NULL DEFAULT '0' COMMENT 'INVALID 0 | FRACTION 1 | FAMILY 2 | PLAYER 3 | JOB 4 | SPECIAL 5 | PUBLIC  6 |',
  `owner` int NOT NULL DEFAULT '0',
  `model` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `angle` float NOT NULL DEFAULT '0',
  `hp` float NOT NULL DEFAULT '1000',
  `tires` int NOT NULL DEFAULT '0',
  `color1` int NOT NULL DEFAULT '0',
  `color2` int NOT NULL DEFAULT '0',
  `nitro` int NOT NULL DEFAULT '0',
  `hydraulika` tinyint(1) NOT NULL DEFAULT '0',
  `felgi` int NOT NULL DEFAULT '0',
  `malunek` int NOT NULL DEFAULT '3',
  `spoiler` int NOT NULL DEFAULT '0',
  `bumper1` int NOT NULL DEFAULT '0',
  `bumper2` int NOT NULL DEFAULT '0',
  `keys` int NOT NULL DEFAULT '0',
  `neon` int NOT NULL DEFAULT '0',
  `ranga` int NOT NULL DEFAULT '0',
  `int` int NOT NULL DEFAULT '-1',
  `vw` int NOT NULL DEFAULT '-1',
  `oldid` int NOT NULL DEFAULT '0',
  `pdvehmod` int NOT NULL DEFAULT '0',
  `Rejestracja` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL DEFAULT '',
  `mru_carscol` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci DEFAULT '0',
  PRIMARY KEY (`UID`),
  KEY `owner` (`owner`),
  KEY `ownertype` (`ownertype`)
) ENGINE=InnoDB AUTO_INCREMENT=69820 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 17:24:45
