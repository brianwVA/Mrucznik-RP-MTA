-- M-RP 2.9: konwersja typow wlascicieli pojazdow Mrucznik -> Kotnik.
--
-- Mrucznik: 0 brak, 1 frakcja, 2 rodzina, 3 gracz, 4 praca,
--            5 specjalny, 6 publiczny.
-- Kotnik:   0 brak, 1 frakcja/grupa, 2 gracz, 3 praca,
--            4 specjalny, 5 publiczny.
--
-- Importowana baza nie zawiera pojazdow rodzinnych (typ 2), dlatego typy 3-6
-- mozna bezpiecznie przesunac o jeden. Rejestr migracji chroni przed ponownym
-- przesunieciem danych przy kolejnym uruchomieniu skryptu.

CREATE TABLE IF NOT EXISTS `mru_migrations` (
    `name` VARCHAR(128) NOT NULL,
    `applied_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

START TRANSACTION;

SET @mrp_vehicle_owner_types_pending = (
    SELECT COUNT(*) = 0
    FROM `mru_migrations`
    WHERE `name` = '20260719_kotnik_vehicle_owner_types'
);

UPDATE `mru_cars`
SET `ownertype` = CASE `ownertype`
    WHEN 3 THEN 2
    WHEN 4 THEN 3
    WHEN 5 THEN 4
    WHEN 6 THEN 5
    ELSE `ownertype`
END
WHERE @mrp_vehicle_owner_types_pending = 1
  AND `ownertype` BETWEEN 3 AND 6;

INSERT IGNORE INTO `mru_migrations` (`name`)
VALUES ('20260719_kotnik_vehicle_owner_types');

COMMIT;
