-- ============================================================================
-- SCHEMA DLA SYSTEMOW NARKOTYKOW I PRODUKCJI
-- ============================================================================

-- Tabela magazynow organizacji
CREATE TABLE IF NOT EXISTS `warehouses` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `ent_x` FLOAT NOT NULL DEFAULT 0.0,
    `ent_y` FLOAT NOT NULL DEFAULT 0.0,
    `ent_z` FLOAT NOT NULL DEFAULT 0.0,
    `price` INT NOT NULL DEFAULT 100000,
    `org_owner` INT NOT NULL DEFAULT 0,
    `fabrics` INT NOT NULL DEFAULT 0,
    `metals` INT NOT NULL DEFAULT 0,
    `mats` INT NOT NULL DEFAULT 0,
    `gunparts` INT NOT NULL DEFAULT 0,
    `acetone` INT NOT NULL DEFAULT 0,
    `toluene` INT NOT NULL DEFAULT 0,
    `lithium` INT NOT NULL DEFAULT 0,
    `sodium` INT NOT NULL DEFAULT 0,
    `calcium` INT NOT NULL DEFAULT 0,
    `tier` INT NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela laboratoriow narkotykowych
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

-- Tabela depotow skrzynek
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

-- Tabela dilerow narkotykowych
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

-- Tabela kontraktow
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

-- Tabela osobistych skrytek graczy
CREATE TABLE IF NOT EXISTS `personal_storages` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `owner_uid` INT NOT NULL DEFAULT 0,
    `tier` INT NOT NULL DEFAULT 1,
    `ent_x` FLOAT NOT NULL DEFAULT 0.0,
    `ent_y` FLOAT NOT NULL DEFAULT 0.0,
    `ent_z` FLOAT NOT NULL DEFAULT 0.0,
    `exit_x` FLOAT NOT NULL DEFAULT 1405.3120,
    `exit_y` FLOAT NOT NULL DEFAULT -8.2928,
    `exit_z` FLOAT NOT NULL DEFAULT 1000.9130,
    `fabrics` INT NOT NULL DEFAULT 0,
    `metals` INT NOT NULL DEFAULT 0,
    `mats` INT NOT NULL DEFAULT 0,
    `chemicals` INT NOT NULL DEFAULT 0,
    `acetone` INT NOT NULL DEFAULT 0,
    `toluene` INT NOT NULL DEFAULT 0,
    `lithium` INT NOT NULL DEFAULT 0,
    `sodium` INT NOT NULL DEFAULT 0,
    `calcium` INT NOT NULL DEFAULT 0,
    `tools` INT NOT NULL DEFAULT 0,
    `clothes` INT NOT NULL DEFAULT 0,
    `furniture` INT NOT NULL DEFAULT 0,
    `electronics` INT NOT NULL DEFAULT 0,
    `bot1_type` INT NOT NULL DEFAULT 0,
    `bot2_type` INT NOT NULL DEFAULT 0,
    `bot3_type` INT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `owner_uid` (`owner_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- DANE POCZATKOWE
-- ============================================================================

-- Depot skrzynek - Tkaniny
INSERT INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Tkanin', 1, 500, 600, 638.8908, 851.9096, -42.9609
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Tkanin');

-- Depot skrzynek - Metale
INSERT INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Metali', 2, 500, 300, 2119.2893, -1969.7300, 13.782
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Metali');

-- Depot skrzynek - Materialy
INSERT INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Materialow', 3, 500, 100, -744.4017, -129.8114, 66.11
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Materialow');

-- Depot skrzynek - Kokaina
INSERT INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Kokainy', 4, 500, 200, -2160.3679, 654.5424, 52.3672
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Kokainy');

-- Depot skrzynek - Chemikalia
INSERT INTO `crate_depots` (`name`, `type`, `amount`, `price`, `pos_x`, `pos_y`, `pos_z`)
SELECT 'Skrzynki Chemikaliow', 5, 500, 3500, 2085.9185, 2070.8342, 10.8203
WHERE NOT EXISTS (SELECT 1 FROM `crate_depots` WHERE `name` = 'Skrzynki Chemikaliow');

-- ============================================================================
-- MIGRACJE - Dodanie kolumn do istniejacych tabel (tylko jesli nie istnieja)
-- ============================================================================

-- Procedura pomocnicza do dodawania kolumn (jesli nie istnieja)
DELIMITER $$

DROP PROCEDURE IF EXISTS AddColumnIfNotExists$$
CREATE PROCEDURE AddColumnIfNotExists(
    IN tableName VARCHAR(64),
    IN columnName VARCHAR(64),
    IN columnDefinition TEXT
)
BEGIN
    DECLARE columnExists INT DEFAULT 0;
    
    SELECT COUNT(*) INTO columnExists
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = tableName
      AND COLUMN_NAME = columnName;
    
    IF columnExists = 0 THEN
        SET @sql = CONCAT('ALTER TABLE `', tableName, '` ADD COLUMN `', columnName, '` ', columnDefinition);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$

DELIMITER ;

-- Migracje dla tabeli warehouses (dodanie kolumn jesli nie istnieja)
CALL AddColumnIfNotExists('warehouses', 'mats', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('warehouses', 'acetone', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('warehouses', 'toluene', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('warehouses', 'lithium', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('warehouses', 'sodium', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('warehouses', 'calcium', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('warehouses', 'tier', 'INT NOT NULL DEFAULT 1');

-- Migracje dla tabeli personal_storages (dodanie kolumn jesli nie istnieja)
-- Uwaga: Kolumny acetone, toluene, lithium, sodium, calcium sa juz w CREATE TABLE,
-- ale procedura sprawdzi czy istnieja przed dodaniem, wiec nie bedzie bledu
CALL AddColumnIfNotExists('personal_storages', 'acetone', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('personal_storages', 'toluene', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('personal_storages', 'lithium', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('personal_storages', 'sodium', 'INT NOT NULL DEFAULT 0');
CALL AddColumnIfNotExists('personal_storages', 'calcium', 'INT NOT NULL DEFAULT 0');

-- Usuniecie procedury pomocniczej
DROP PROCEDURE IF EXISTS AddColumnIfNotExists;
