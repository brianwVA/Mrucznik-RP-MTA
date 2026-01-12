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
-- Temporary view structure for view `view_pojazdy_frakcji`
--

DROP TABLE IF EXISTS `view_pojazdy_frakcji`;
/*!50001 DROP VIEW IF EXISTS `view_pojazdy_frakcji`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pojazdy_frakcji` AS SELECT 
 1 AS `UID`,
 1 AS `owner`,
 1 AS `model`,
 1 AS `nazwa_modelu`,
 1 AS `x`,
 1 AS `y`,
 1 AS `z`,
 1 AS `angle`,
 1 AS `hp`,
 1 AS `color1`,
 1 AS `color2`,
 1 AS `int`,
 1 AS `vw`,
 1 AS `ranga`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_pojazdy_frakcji`
--

/*!50001 DROP VIEW IF EXISTS `view_pojazdy_frakcji`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_polish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pojazdy_frakcji` AS select `mru_cars`.`UID` AS `UID`,`mru_cars`.`owner` AS `owner`,`mru_cars`.`model` AS `model`,`CAR_NAME`(`mru_cars`.`model`) AS `nazwa_modelu`,`mru_cars`.`x` AS `x`,`mru_cars`.`y` AS `y`,`mru_cars`.`z` AS `z`,`mru_cars`.`angle` AS `angle`,`mru_cars`.`hp` AS `hp`,`mru_cars`.`color1` AS `color1`,`mru_cars`.`color2` AS `color2`,`mru_cars`.`int` AS `int`,`mru_cars`.`vw` AS `vw`,`mru_cars`.`ranga` AS `ranga` from `mru_cars` where (`mru_cars`.`ownertype` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 18:03:42
