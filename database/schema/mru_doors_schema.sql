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
-- Table structure for table `mru_doors`
--

DROP TABLE IF EXISTS `mru_doors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mru_doors` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned NOT NULL,
  `owner` int NOT NULL,
  `ox` float NOT NULL,
  `oy` float NOT NULL,
  `oz` float NOT NULL,
  `oa` float NOT NULL,
  `ix` float NOT NULL,
  `iy` float NOT NULL,
  `iz` float NOT NULL,
  `ia` float NOT NULL,
  `ovw` smallint unsigned NOT NULL,
  `oint` smallint unsigned NOT NULL,
  `ivw` smallint unsigned NOT NULL,
  `iint` smallint unsigned NOT NULL,
  `lights` tinyint(1) NOT NULL DEFAULT '1',
  `lock` tinyint(1) NOT NULL,
  `title` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `flags` bit(8) NOT NULL DEFAULT b'1',
  `oplata` int NOT NULL,
  `url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `audioplay` tinyint(1) NOT NULL,
  `fire` tinyint(1) NOT NULL,
  `elevator` int NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '255',
  `parent` int unsigned NOT NULL,
  PRIMARY KEY (`UID`),
  KEY `owner` (`owner`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
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
