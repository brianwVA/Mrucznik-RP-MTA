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
-- Temporary view structure for view `view_mru_konta`
--

DROP TABLE IF EXISTS `view_mru_konta`;
/*!50001 DROP VIEW IF EXISTS `view_mru_konta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_mru_konta` AS SELECT 
 1 AS `UID`,
 1 AS `Nick`,
 1 AS `Level`,
 1 AS `ConnectedTime`,
 1 AS `DonateRank`,
 1 AS `KontroPremium`,
 1 AS `Money`,
 1 AS `Bank`,
 1 AS `Dom`,
 1 AS `Job`,
 1 AS `Fraction`,
 1 AS `Family`,
 1 AS `Warnings`,
 1 AS `PhoneNr`,
 1 AS `SkinCywila`,
 1 AS `Uniform`,
 1 AS `ZmianyNicku`,
 1 AS `CarLic`,
 1 AS `FlyLic`,
 1 AS `BoatLic`,
 1 AS `FishLic`,
 1 AS `GunLic`,
 1 AS `Smierci`,
 1 AS `Materials`,
 1 AS `detskill`,
 1 AS `sexskill`,
 1 AS `boxskill`,
 1 AS `lawskill`,
 1 AS `mechskill`,
 1 AS `jackskill`,
 1 AS `carskill`,
 1 AS `newsskill`,
 1 AS `drugsskill`,
 1 AS `cookskill`,
 1 AS `fishskill`,
 1 AS `gunskill`,
 1 AS `truckskill`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_mru_konta`
--

/*!50001 DROP VIEW IF EXISTS `view_mru_konta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_mru_konta` AS select `mru_konta`.`UID` AS `UID`,`mru_konta`.`Nick` AS `Nick`,`mru_konta`.`Level` AS `Level`,`mru_konta`.`ConnectedTime` AS `ConnectedTime`,`mru_konta`.`DonateRank` AS `DonateRank`,`p`.`p_activeKp` AS `KontroPremium`,`mru_konta`.`Money` AS `Money`,`mru_konta`.`Bank` AS `Bank`,`mru_konta`.`Dom` AS `Dom`,`mru_konta`.`Job` AS `Job`,`mru_konta`.`Member` AS `Fraction`,`mru_konta`.`FMember` AS `Family`,`mru_konta`.`Warnings` AS `Warnings`,`mru_konta`.`PhoneNr` AS `PhoneNr`,`mru_konta`.`Skin` AS `SkinCywila`,`mru_konta`.`Uniform` AS `Uniform`,`mru_konta`.`ZmienilNick` AS `ZmianyNicku`,`mru_konta`.`CarLic` AS `CarLic`,`mru_konta`.`FlyLic` AS `FlyLic`,`mru_konta`.`BoatLic` AS `BoatLic`,`mru_konta`.`FishLic` AS `FishLic`,`mru_konta`.`GunLic` AS `GunLic`,`mru_konta`.`Deaths` AS `Smierci`,`mru_konta`.`Materials` AS `Materials`,`mru_konta`.`DetSkill` AS `detskill`,`mru_konta`.`SexSkill` AS `sexskill`,`mru_konta`.`BoxSkill` AS `boxskill`,`mru_konta`.`LawSkill` AS `lawskill`,`mru_konta`.`MechSkill` AS `mechskill`,`mru_konta`.`JackSkill` AS `jackskill`,`mru_konta`.`CarSkill` AS `carskill`,`mru_konta`.`NewsSkill` AS `newsskill`,`mru_konta`.`DrugsSkill` AS `drugsskill`,`mru_konta`.`CookSkill` AS `cookskill`,`mru_konta`.`FishSkill` AS `fishskill`,`mru_konta`.`GunSkill` AS `gunskill`,`mru_konta`.`TruckSkill` AS `truckskill` from (`mru_konta` left join `mru_premium` `p` on((`p`.`p_charUID` = `mru_konta`.`UID`))) */;
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

-- Dump completed on 2026-01-12 17:24:49
