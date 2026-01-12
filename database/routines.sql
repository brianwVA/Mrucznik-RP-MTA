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
-- Current Database: `mrucznik`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mrucznik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mrucznik`;

--
-- Dumping routines for database 'mrucznik'
--
/*!50003 DROP FUNCTION IF EXISTS `CAR_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CAR_NAME`(`carid` INTEGER) RETURNS varchar(32) CHARSET latin1
    DETERMINISTIC
BEGIN
    CASE carid
        WHEN 400 THEN RETURN 'Landstalker';
        WHEN 401 THEN RETURN 'Bravura';
        WHEN 402 THEN RETURN 'Buffalo';
        WHEN 403 THEN RETURN 'TIR';
        WHEN 404 THEN RETURN 'Perennial';
        WHEN 405 THEN RETURN 'Sentinel';
        WHEN 406 THEN RETURN 'Wywrotka';
        WHEN 407 THEN RETURN 'Straz';
        WHEN 408 THEN RETURN 'Smieciarka';
        WHEN 409 THEN RETURN 'Limuzyna';
        WHEN 410 THEN RETURN 'Manana';
        WHEN 411 THEN RETURN 'Infernus';
        WHEN 412 THEN RETURN 'Voodoo';
        WHEN 413 THEN RETURN 'Pony';
        WHEN 414 THEN RETURN 'Mule';
        WHEN 415 THEN RETURN 'Cheetah';
        WHEN 416 THEN RETURN 'Karetka';
        WHEN 417 THEN RETURN 'Leviathan';
        WHEN 418 THEN RETURN 'Moonbeam';
        WHEN 419 THEN RETURN 'Esperanto';
        WHEN 420 THEN RETURN 'Taxi';
        WHEN 421 THEN RETURN 'Washington';
        WHEN 422 THEN RETURN 'Bobcat';
        WHEN 423 THEN RETURN 'Lodziarnia';
        WHEN 424 THEN RETURN 'BF Injection';
        WHEN 425 THEN RETURN 'Hunter';
        WHEN 426 THEN RETURN 'Premier';
        WHEN 427 THEN RETURN 'Enforcer';
        WHEN 428 THEN RETURN 'Securicar';
        WHEN 429 THEN RETURN 'Banshee';
        WHEN 430 THEN RETURN 'Predator';
        WHEN 431 THEN RETURN 'Bus';
        WHEN 432 THEN RETURN 'Czolg';
        WHEN 433 THEN RETURN 'Barracks';
        WHEN 434 THEN RETURN 'Hotknife';
        WHEN 435 THEN RETURN 'Przyczepa';
        WHEN 436 THEN RETURN 'Previon';
        WHEN 437 THEN RETURN 'Autobus';
        WHEN 438 THEN RETURN 'Taxi';
        WHEN 439 THEN RETURN 'Stallion';
        WHEN 440 THEN RETURN 'Rumpo';
        WHEN 441 THEN RETURN 'RC Bandit';
        WHEN 442 THEN RETURN 'Karawan';
        WHEN 443 THEN RETURN 'Packer';
        WHEN 444 THEN RETURN 'Monster';
        WHEN 445 THEN RETURN 'Admiral';
        WHEN 446 THEN RETURN 'Squalo';
        WHEN 447 THEN RETURN 'Seasparrow';
        WHEN 448 THEN RETURN 'Pizzaboy';
        WHEN 449 THEN RETURN 'Tramwaj';
        WHEN 450 THEN RETURN 'Przyczepa';
        WHEN 451 THEN RETURN 'Turismo';
        WHEN 452 THEN RETURN 'Speeder';
        WHEN 453 THEN RETURN 'Kuter';
        WHEN 454 THEN RETURN 'Tropic';
        WHEN 455 THEN RETURN 'Flatbed';
        WHEN 456 THEN RETURN 'Yankee';
        WHEN 457 THEN RETURN 'Caddy';
        WHEN 458 THEN RETURN 'Solair';
        WHEN 459 THEN RETURN 'Berkleys RC Van';
        WHEN 460 THEN RETURN 'Skimmer';
        WHEN 461 THEN RETURN 'PCJ-600';
        WHEN 462 THEN RETURN 'Faggio';
        WHEN 463 THEN RETURN 'Freeway';
        WHEN 464 THEN RETURN 'RC Baron';
        WHEN 465 THEN RETURN 'RC Raider';
        WHEN 466 THEN RETURN 'Glendale';
        WHEN 467 THEN RETURN 'Oceanic';
        WHEN 468 THEN RETURN 'Sanchez';
        WHEN 469 THEN RETURN 'Sparrow';
        WHEN 470 THEN RETURN 'Hummer';
        WHEN 471 THEN RETURN 'Quad';
        WHEN 472 THEN RETURN 'Coastguard';
        WHEN 473 THEN RETURN 'Ponton';
        WHEN 474 THEN RETURN 'Hermes';
        WHEN 475 THEN RETURN 'Sabre';
        WHEN 476 THEN RETURN 'Rustler';
        WHEN 477 THEN RETURN 'ZR-350';
        WHEN 478 THEN RETURN 'Walton';
        WHEN 479 THEN RETURN 'Regina';
        WHEN 480 THEN RETURN 'Comet';
        WHEN 481 THEN RETURN 'BMX';
        WHEN 482 THEN RETURN 'Burrito';
        WHEN 483 THEN RETURN 'Camper';
        WHEN 484 THEN RETURN 'Jacht';
        WHEN 485 THEN RETURN 'Baggage';
        WHEN 486 THEN RETURN 'Dozer';
        WHEN 487 THEN RETURN 'Maverick';
        WHEN 488 THEN RETURN 'Newsokopter';
        WHEN 489 THEN RETURN 'Rancher';
        WHEN 490 THEN RETURN 'Rancher FBI';
        WHEN 491 THEN RETURN 'Virgo';
        WHEN 492 THEN RETURN 'Greenwood';
        WHEN 493 THEN RETURN 'Jetmax';
        WHEN 494 THEN RETURN 'Hotring';
        WHEN 495 THEN RETURN 'Sandking';
        WHEN 496 THEN RETURN 'Blista Compact';
        WHEN 497 THEN RETURN 'Policyjny Maverick';
        WHEN 498 THEN RETURN 'Boxville';
        WHEN 499 THEN RETURN 'Benson';
        WHEN 500 THEN RETURN 'Mesa';
        WHEN 501 THEN RETURN 'RC Goblin';
        WHEN 502 THEN RETURN 'Hotring Racer';
        WHEN 503 THEN RETURN 'Hotring Racer';
        WHEN 504 THEN RETURN 'Bloodring Banger';
        WHEN 505 THEN RETURN 'Rancher';
        WHEN 506 THEN RETURN 'Super GT';
        WHEN 507 THEN RETURN 'Elegant';
        WHEN 508 THEN RETURN 'Kamping';
        WHEN 509 THEN RETURN 'Rower';
        WHEN 510 THEN RETURN 'Rower Gorski';
        WHEN 511 THEN RETURN 'Beagle';
        WHEN 512 THEN RETURN 'Cropdust';
        WHEN 513 THEN RETURN 'Stunt';
        WHEN 514 THEN RETURN 'Tanker';
        WHEN 515 THEN RETURN 'RoadTrain';
        WHEN 516 THEN RETURN 'Nebula';
        WHEN 517 THEN RETURN 'Majestic';
        WHEN 518 THEN RETURN 'Buccaneer';
        WHEN 519 THEN RETURN 'Shamal';
        WHEN 520 THEN RETURN 'Hydra';
        WHEN 521 THEN RETURN 'FCR-900';
        WHEN 522 THEN RETURN 'NRG-500';
        WHEN 523 THEN RETURN 'HPV1000';
        WHEN 524 THEN RETURN 'Cement Truck';
        WHEN 525 THEN RETURN 'Tow Truck';
        WHEN 526 THEN RETURN 'Fortune';
        WHEN 527 THEN RETURN 'Cadrona';
        WHEN 528 THEN RETURN 'Armatka Wodna';
        WHEN 529 THEN RETURN 'Willard';
        WHEN 530 THEN RETURN 'Forklift';
        WHEN 531 THEN RETURN 'Traktor';
        WHEN 532 THEN RETURN 'Combine';
        WHEN 533 THEN RETURN 'Feltzer';
        WHEN 534 THEN RETURN 'Remington';
        WHEN 535 THEN RETURN 'Slamvan';
        WHEN 536 THEN RETURN 'Blade';
        WHEN 537 THEN RETURN 'Freight';
        WHEN 538 THEN RETURN 'Streak';
        WHEN 539 THEN RETURN 'Vortex';
        WHEN 540 THEN RETURN 'Vincent';
        WHEN 541 THEN RETURN 'Bullet';
        WHEN 542 THEN RETURN 'Clover';
        WHEN 543 THEN RETURN 'Sadler';
        WHEN 544 THEN RETURN 'Straz';
        WHEN 545 THEN RETURN 'Hustler';
        WHEN 546 THEN RETURN 'Intruder';
        WHEN 547 THEN RETURN 'Primo';
        WHEN 548 THEN RETURN 'Cargobob';
        WHEN 549 THEN RETURN 'Tampa';
        WHEN 550 THEN RETURN 'Sunrise';
        WHEN 551 THEN RETURN 'Merit';
        WHEN 552 THEN RETURN 'Utility Truck';
        WHEN 553 THEN RETURN 'Nevada';
        WHEN 554 THEN RETURN 'Yosemite';
        WHEN 555 THEN RETURN 'Windsor';
        WHEN 556 THEN RETURN 'Monster';
        WHEN 557 THEN RETURN 'Monster';
        WHEN 558 THEN RETURN 'Uranus';
        WHEN 559 THEN RETURN 'Jester';
        WHEN 560 THEN RETURN 'Sultan';
        WHEN 561 THEN RETURN 'Stratum';
        WHEN 562 THEN RETURN 'Elegy';
        WHEN 563 THEN RETURN 'Raindance';
        WHEN 564 THEN RETURN 'RCTiger';
        WHEN 565 THEN RETURN 'Flash';
        WHEN 566 THEN RETURN 'Tahoma';
        WHEN 567 THEN RETURN 'Savanna';
        WHEN 568 THEN RETURN 'Bandito';
        WHEN 569 THEN RETURN 'Freight';
        WHEN 570 THEN RETURN 'Trailer';
        WHEN 571 THEN RETURN 'Kart';
        WHEN 572 THEN RETURN 'Turbowozek';
        WHEN 573 THEN RETURN 'Dune';
        WHEN 574 THEN RETURN 'Sweeper';
        WHEN 575 THEN RETURN 'Broadway';
        WHEN 576 THEN RETURN 'Tornado';
        WHEN 577 THEN RETURN 'AT-400';
        WHEN 578 THEN RETURN 'DFT-30';
        WHEN 579 THEN RETURN 'Huntley';
        WHEN 580 THEN RETURN 'Stafford';
        WHEN 581 THEN RETURN 'BF-400';
        WHEN 582 THEN RETURN 'SANvan';
        WHEN 583 THEN RETURN 'Tug';
        WHEN 584 THEN RETURN 'Trailer';
        WHEN 585 THEN RETURN 'Emperor';
        WHEN 586 THEN RETURN 'Wayfarer';
        WHEN 587 THEN RETURN 'Euros';
        WHEN 588 THEN RETURN 'Hotdog';
        WHEN 589 THEN RETURN 'Club';
        WHEN 590 THEN RETURN 'Trailer';
        WHEN 591 THEN RETURN 'Trailer';
        WHEN 592 THEN RETURN 'Andromada';
        WHEN 593 THEN RETURN 'Dodo';
        WHEN 594 THEN RETURN 'RC Cam';
        WHEN 595 THEN RETURN 'Launch';
        WHEN 596 THEN RETURN 'Radiowoz (LSPD)';
        WHEN 597 THEN RETURN 'Radiowoz (SFPD)';
        WHEN 598 THEN RETURN 'Radiowoz (LVPD)';
        WHEN 599 THEN RETURN 'Policyjny Jeep';
        WHEN 600 THEN RETURN 'Picador';
        WHEN 601 THEN RETURN 'Pancernik FBI';
        WHEN 602 THEN RETURN 'Alpha';
        WHEN 603 THEN RETURN 'Phoenix';
        WHEN 604 THEN RETURN 'Glendale';
        WHEN 605 THEN RETURN 'Sadler';
        WHEN 606 THEN RETURN 'Luggage Trailer';
        WHEN 607 THEN RETURN 'Luggage Trailer';
        WHEN 608 THEN RETURN 'Stair Trailer';
        WHEN 609 THEN RETURN 'Boxville';
        WHEN 610 THEN RETURN 'Kombajn';
        WHEN 611 THEN RETURN 'Utility Trailer';
        WHEN 612 THEN RETURN 'Brak pojazdu';
        WHEN 613 THEN RETURN 'Brak łodzi';
        WHEN 614 THEN RETURN 'Brak samolotu';
        ELSE RETURN 'BRAK';
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `IS_CAR_UNIQUE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IS_CAR_UNIQUE`(`carid` INT) RETURNS tinyint(1)
    NO SQL
RETURN carid IN(403,406,407,408,413,414,416,423,425,427,428,430,431,432,433,437,440,441,442,443,444,447,448,455,456,457,459,460,461,464,465,476,481,485,486,490,494,497,498,499,501,502,503,504,509,510,514,515,520,523,524,525,528,530,531,532,539,544,548,552,556,557,564,571,573,574,577,578,582,583,588,592,594,596,597,598,599,601,609) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPRAWNIENIA_NAZWY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UPRAWNIENIA_NAZWY`(`bity` INT) RETURNS text CHARSET latin1
    NO SQL
    DETERMINISTIC
BEGIN

DECLARE names TEXT; 
SET @names = "";

IF bity & 0b1 THEN 
    SET @names = CONCAT(@names, "PANEL | ");
END IF;
IF bity & 0b10 THEN 
    SET @names = CONCAT(@names, "KARY | ");
END IF;
IF bity & 0b100 THEN 
    SET @names = CONCAT(@names, "KARY_ZNAJDZ | ");
END IF;
IF bity & 0b1000 THEN 
    SET @names = CONCAT(@names, "KARY_UNBAN | ");
END IF;
IF bity & 0b10000 THEN 
    SET @names = CONCAT(@names, "KARY_BAN | ");
END IF;
IF bity & 0b100000 THEN 
    SET @names = CONCAT(@names, "ZG | ");
END IF;
IF bity & 0b1000000 THEN 
    SET @names = CONCAT(@names, "MAKEFAMILY | ");
END IF;
IF bity & 0b10000000 THEN 
    SET @names = CONCAT(@names, "MAKELEADER | ");
END IF;
IF bity & 0b100000000 THEN 
    SET @names = CONCAT(@names, "EDITPERM | ");
END IF;
IF bity & 0b1000000000 THEN 
    SET @names = CONCAT(@names, "EDITCAR | ");
END IF;
IF bity & 0b10000000000 THEN 
    SET @names = CONCAT(@names, "EDITRANG | ");
END IF;
IF bity & 0b100000000000 THEN 
    SET @names = CONCAT(@names, "GIVEHALF | ");
END IF;
IF bity & 0b1000000000000 THEN 
    SET @names = CONCAT(@names, "DELETEORG | ");
END IF; 

RETURN (@names);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CZYSTKA_KONTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CZYSTKA_KONTA`(IN `player` VARCHAR(24))
    MODIFIES SQL DATA
    COMMENT 'Procedura wykonujaca czystke majatku'
BEGIN

DECLARE message VARCHAR(256);
DECLARE playerConnected INT;
DECLARE oldMoney INT;
DECLARE oldBank INT;
DECLARE oldHouse INT;
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
    GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    ROLLBACK;
    SELECT CONCAT(@p1, ':', @p2);
END;

SELECT connected, Money, Bank, Dom INTO playerConnected, oldMoney, oldBank, oldHouse FROM mru_konta WHERE  `Nick`=player;

IF playerConnected = 0 THEN
START TRANSACTION;

    
    UPDATE mru_konta SET Money=0, Bank=0, Dom=0, detskill=0, sexskill=0, boxskill=0, lawskill=0, mechskill=0, jackskill=0, carskill=0, newsskill=0, drugsskill=0, cookskill=0, fishskill=0, gunskill=0, truckskill=0 WHERE Nick=player;
    UPDATE mru_cars SET ownertype=0 WHERE ownertype=3 AND owner=(SELECT UID FROM mru_konta WHERE Nick=player);
    
    
    SET message = CONCAT('Wyczyszczono konto graczowi ', player, ' old money ', oldMoney, ' old bank ', oldBank, ' old house ', oldHouse, ' i pojazdy');
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
COMMIT;
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DAJ_MC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DAJ_MC`(IN `name` VARCHAR(21), IN `mc` INT)
    MODIFIES SQL DATA
BEGIN

DECLARE message VARCHAR(255);
DECLARE playerUID INT;
DECLARE oldMC INT;
DECLARE playerConnected INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
       ROLLBACK;
        SELECT CONCAT(@p1, ':', @p2);
    END;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;
SELECT `UID` INTO playerUID FROM `mru_konta` WHERE `Nick` LIKE name;
SET oldMC = 0;
SELECT `p_MC` INTO oldMC FROM mru_premium WHERE p_charUID=playerUID;

IF playerConnected = 0 THEN
START TRANSACTION;
    
    
    SET message = CONCAT('Nadno graczowi ', name, ' mc ', mc, ' stare mc ', oldMC);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    
    INSERT INTO `mru_premium` (`p_charUID`, `p_MC`) VALUES(playerUID, mc) ON DUPLICATE KEY UPDATE `p_MC` = (`p_MC` + mc);
    
    COMMIT;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NADAJ_ADMINA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NADAJ_ADMINA`(IN `name` VARCHAR(24), IN `adminlvl` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
    GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    ROLLBACK;
    SELECT CONCAT(@p1, ':', @p2);
END;

START TRANSACTION;
SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN
    
    SET message = CONCAT('Nadano ', adminlvl, ' level admina graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Admin`=adminlvl WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NADAJ_LIDERA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NADAJ_LIDERA`(IN `player` VARCHAR(24), IN `leader` SMALLINT UNSIGNED, IN `leader_value` ENUM('1','2'))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN

DECLARE message VARCHAR(256);
DECLARE player_uid INTEGER;

SELECT `UID` INTO player_uid FROM mru_konta WHERE Nick LIKE player;


INSERT INTO `mru_liderzy`(`NICK`, `UID`, `FracID`, `LiderValue`) 
VALUES (player, player_uid, leader, leader_value)
ON DUPLICATE KEY UPDATE 
`NICK`=player, `UID`=player_uid, `FracID`=leader, `LiderValue`=leader_value;


SET message = CONCAT('Nadano lidera frakcji ', leader, ' graczowi ', player);
INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);


SELECT message AS komunikat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NADAJ_LIDERA_RODZINY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NADAJ_LIDERA_RODZINY`(IN `player` VARCHAR(24), IN `family` SMALLINT UNSIGNED)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN

DECLARE message VARCHAR(256);


UPDATE mru_konta SET FMember=family, `Rank`=1009 WHERE Nick LIKE player;


SET message = CONCAT('Nadano lidera rodziny ', family, ' graczowi ', player);
INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);


SELECT message AS komunikat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NADAJ_POLADMINA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NADAJ_POLADMINA`(IN `name` VARCHAR(24), IN `adminlvl` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
    GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    ROLLBACK;
    SELECT CONCAT(@p1, ':', @p2);
END;

START TRANSACTION;
SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN
    
    SET message = CONCAT('Nadano ', adminlvl, ' level pol admina graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `PAdmin`=adminlvl WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `POBIERZ_GRACZY_PO_IP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `POBIERZ_GRACZY_PO_IP`(IN `ipaddress` VARCHAR(16))
    READS SQL DATA
SELECT DISTINCT k.UID, k.Nick, k.Level, l.IP, Count(l.IP) AS 'Ilość logowań'
FROM mru_konta k 
JOIN mru_logowania l ON k.UID=l.PID
WHERE IP LIKE ipaddress
GROUP BY k.UID, k.Nick, k.Level, l.IP
ORDER BY Count(l.IP) DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `POBIERZ_IP_GRACZA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `POBIERZ_IP_GRACZA`(IN name VARCHAR(24))
    READS SQL DATA
SELECT DISTINCT k.UID, k.Nick, k.Level, l.IP, Count(l.IP) AS 'Ilość logowań'
FROM mru_konta k 
JOIN mru_logowania l ON k.UID=l.PID
WHERE Nick=name
GROUP BY k.UID, k.Nick, k.Level, l.IP
ORDER BY Count(l.IP) DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `POBIERZ_LOGOWANIA_GRACZA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `POBIERZ_LOGOWANIA_GRACZA`(IN `name` VARCHAR(24))
    READS SQL DATA
SELECT DISTINCT k.UID, k.Nick, k.Level, l.IP, l.time
FROM mru_konta k 
JOIN mru_logowania l ON k.UID=l.PID
WHERE Nick=name
ORDER BY time DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `POBIERZ_LOGOWANIA_Z_IP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `POBIERZ_LOGOWANIA_Z_IP`(IN `ipaddress` VARCHAR(16))
    READS SQL DATA
SELECT k.UID, k.Nick, k.Level, l.IP, l.time
FROM mru_konta k 
JOIN mru_logowania l ON k.UID=l.PID
WHERE IP LIKE ipaddress
ORDER BY time DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPRAWNIENIA_ADMINOW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPRAWNIENIA_ADMINOW`()
    NO SQL
SELECT k.Nick, UPRAWNIENIA_NAZWY(flags) FROM `mru_uprawnienia` u join mru_konta k on k.uid=u.uid ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USUN_LIDERA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USUN_LIDERA`(IN `player` VARCHAR(24))
    MODIFIES SQL DATA
BEGIN

DECLARE message VARCHAR(256);


DELETE FROM mru_liderzy WHERE Nick=player;


SET message = CONCAT('Usunieto lidera rodziny graczowi ', player);
INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);


SELECT message AS komunikat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USUN_LIDERA_RODZINY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USUN_LIDERA_RODZINY`(IN `player` VARCHAR(24))
    MODIFIES SQL DATA
BEGIN

DECLARE message VARCHAR(256);


UPDATE mru_konta SET FMember=0, `Rank`=0 WHERE Nick LIKE player;


SET message = CONCAT('Usunieto lidera frakcji graczowi ', player);
INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);


SELECT message AS komunikat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZMIEN_DOM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZMIEN_DOM`(IN `name` VARCHAR(32), IN `dom` INT)
    MODIFIES SQL DATA
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zmieniono dom na: ', dom, ' graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Dom`=dom WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZMIEN_NICK_GRACZA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZMIEN_NICK_GRACZA`(IN `name` VARCHAR(21), IN `newName` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zmieniono nicku graczowi: ', name, ' na nick: ', newName);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Nick`=newName WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_BANK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_BANK`(IN `name` VARCHAR(21), IN `hajs` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;
DECLARE player_uid INTEGER;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;
SELECT `UID` INTO player_uid FROM mru_konta WHERE Nick LIKE name;

IF playerConnected = 0 THEN
    
    SET message = CONCAT('Oddano ', hajs, '$ graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Bank`=`Bank`+hajs WHERE `UID`=player_uid;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_BOATLIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_BOATLIC`(IN `name` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono BoatLic graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `BoatLic`=1 WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_CARLIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_CARLIC`(IN `name` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono carlic graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `CarLic`=1 WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_FISHLIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_FISHLIC`(IN `name` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono FishLic graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `FishLic`=1 WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_FLYLIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_FLYLIC`(IN `name` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono FlyLic graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `FlyLic`=1 WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_GUNLIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_GUNLIC`(IN `name` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono GunLic graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `GunLic`=1 WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_HAJS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_HAJS`(IN `name` VARCHAR(21), IN `hajs` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN DECLARE message VARCHAR(256); DECLARE playerConnected INT; DECLARE player_uid INTEGER;  SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name; SELECT `UID` INTO player_uid FROM mru_konta WHERE Nick LIKE name;  IF playerConnected = 0 THEN          SET message = CONCAT('Oddano ', hajs, '$ graczowi: ', name);     INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);               UPDATE mru_konta SET `Money`=`Money`+hajs WHERE `UID`=player_uid;               SELECT message AS komunikat; ELSE SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat; END IF; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_HASLO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_HASLO`(IN `name` VARCHAR(21))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;
DECLARE newPass VARCHAR(32);

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN
SELECT LEFT(UUID(), 8) INTO newPass;

    
    SET message = CONCAT('Zmieniono haslo na: ', newPass, ' graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Key`=MD5(newPass), `Salt`='' WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_MATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_MATS`(IN `name` VARCHAR(21), IN `mats` INT)
    MODIFIES SQL DATA
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
    GET DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    ROLLBACK;
    SELECT CONCAT(@p1, ':', @p2);
END;

START TRANSACTION;
SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN
    
    SET message = CONCAT('Oddano ', mats, ' mats graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Materials`=`Materials`+mats WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_NR_TEL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_NR_TEL`(IN `name` VARCHAR(21), IN `numer` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zmieniono numer na: ', numer, ' graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `PhoneNr`=numer WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_POJAZD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_POJAZD`(IN `name` VARCHAR(21), IN `veh` INT)
    NO SQL
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;
DECLARE previousOwner INT;
DECLARE previousOwnerType INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;
SELECT owner, ownertype INTO previousOwner, previousOwnerType FROM mru_cars WHERE UID=veh;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono auto uid ', veh, ' graczowi: ', name, 'poprzedni owner', previousOwner, ' ownertype ', previousOwnerType);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_cars SET `owner`=(SELECT UID FROM mru_konta WHERE `Nick`=name), ownertype=3 WHERE UID=veh;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_SKIN_CYWILA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_SKIN_CYWILA`(IN `name` VARCHAR(21), IN `skin` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zmieniono skin na: ', skin, ' graczowi: ', name);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `Skin`=skin WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZWROC_ZMIANE_NICKU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_polish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZWROC_ZMIANE_NICKU`(IN `name` VARCHAR(21), IN `ilosc` INT)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message VARCHAR(256);
DECLARE playerConnected INT;

SELECT connected INTO playerConnected FROM mru_konta WHERE `Nick`=name;

IF playerConnected = 0 THEN

    
    SET message = CONCAT('Zwrocono zmiane nicku graczowi: ', name, ' w ilosci:', ilosc);
    INSERT INTO actions (Data, Caller, Action) VALUES (NOW(), USER(), message);
    
    
    UPDATE mru_konta SET `ZmienilNick`=`ZmienilNick`+ilosc WHERE `Nick`=name;
    
    
    SELECT message AS komunikat;
ELSE
SELECT 'Gracz jest na serwerze/nie ma takiego gracza.' AS komunikat;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 17:24:51
