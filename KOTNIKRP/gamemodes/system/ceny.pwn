//ceny.pwn

// CENY
#define KILL_REWARD             150
#define PRICE_SPRUNK            15
#define PRICE_SLUB              8000
#define PRICE_POZWOLENIE        70
#define PRICE_POZWOLENIE_ZYSK   25
#define PRICE_POZWOLENIE_SEJF   35
#define PRICE_KASYNO_KARTY      10
#define PRICE_CYGARO            5
#define PRICE_GOKART            55
#define PRICE_KAMIZELKA         150
#define PRICE_KASYNO_KF         5
#define PRICE_KOSTKA_MIN        1
#define PRICE_KOSTKA_MAX        100000
#define PRICE_LOTTO             30
#define PRICE_PRZEJAZD          30
#define PRICE_RESET_ULEPSZEN    1000
#define PRICE_SMS_NORMAL        8
#define PRICE_CHECK_NEON        50
#define PRICE_ZMIANA_PLCI       2000
#define PRICE_SCENA             2000
#define PRICE_FOTORADAR         100

#define PRICE_CAR_RESPAWN       50
#define PRICE_PAYNSPRAY         250

#define PRICE_PIWO              7
#define PRICE_WINO              5
#define PRICE_TELEFON           45
#define PRICE_APARAT            50
#define PRICE_MP3               15
#define PRICE_CBRADIO           40
#define PRICE_TEMPOMAT          75
#define PRICE_EPAPIEROS         20
#define PRICE_KOSTKA            2
#define PRICE_KONDOM            1
#define PRICE_LOM               35
#define PRICE_KSIAZKA_TEL       10
#define PRICE_BASEBALL          20
#define PRICE_ZDRAPKA           25
#define PRICE_WYTRYCH           30
#define PRICE_DESKOROLOKA       20
#define PRICE_DYMIARKA          450
#define PRICE_FLARA             450
#define PRICE_MASKA             200
#define PRICE_BAG               250
#define PRICE_APTECZKA          500
#define PRICE_WODA              50

#define PRICE_DILDO_PURP        70
#define PRICE_DILDO_ANALNY      30
#define PRICE_DILDO_BIALY       40
#define PRICE_DILDO_SREBRNY     25
#define PRICE_DILDO_LASKA       10
#define PRICE_DILDO_KWIATY      5

#define PRICE_BASEN_1           20
#define PRICE_BASEN_2           40
#define PRICE_BASEN_3           60
#define PRICE_BASEN_4           90

#define PRICE_RESTAURACJA_NAME  10
#define PRICE_WULGARYZMY        20

#define PRICE_HA_LIDER          1000
#define PRICE_HA_POLICJA        400
#define PRICE_HA_ORG            200
#define PRICE_HA_MIN            100
#define PRICE_HA_MAX            10000

#define PRICE_GRZYWNA_MIN       100
#define PRICE_GRZYWNA_MAX       700

#define PRICE_KAUCJA_MIN        2000
#define PRICE_KAUCJA_MAX        15000

#define PRICE_BOX_GANGSTER      200
#define PRICE_BOX_KUNGFU        350
#define PRICE_BOX_KICKBOX       500

#define PRICE_GRIPEX            50
#define PRICE_APAP              75

#define PRICE_SELLCAR_MIN       1
#define PRICE_SELLCAR_MAX       9000000

#define PRICE_NAPAD_MIN         1500
#define PRICE_NAPAD_MAX         10000

#define PRICE_NARKO_KRZAK       150
#define PRICE_NARKO_DRUG        90

#define PRICE_STEAL_CAR_1       250
#define PRICE_STEAL_CAR_2       450
#define PRICE_STEAL_CAR_3       650
#define PRICE_STEAL_CAR_4       850
#define PRICE_STEAL_CAR_MAX     1050

// ZAROBKI

#define PRICE_MAGAZYNIER        75   // było 50, +50% = 75 // swieta
#define PRICE_SZMUGLER          150  // było 100, +50% = 150 // swieta
#define PRICE_GAZECIARZ         75   // było 50, +50% = 75 // swieta

#define PRICE_RYBA_SAKWA        100
#define PRICE_NAPAD_FAIL        250

#define PRICE_ZDRAPKA_WIN1      20
#define PRICE_ZDRAPKA_WIN2      50
#define PRICE_ZDRAPKA_WIN3      130

#define PRICE_PLAMA             150

#define PRICE_FARE_TAXI_MIN     1
#define PRICE_FARE_TAXI_MAX     35
#define PRICE_FARE_PLANE_MIN    20
#define PRICE_FARE_PLANE_MAX    150

#define PRICE_LOT_MIN           0
#define PRICE_LOT_MAX           200

#define PRICE_TRAIN_KT_MIN      10
#define PRICE_TRAIN_KT_MAX      100

#define PRICE_SELLHOUSE_MIN     500
#define PRICE_SELLHOUSE_MAX     2000000

#define PRICE_SEX_MIN           5
#define PRICE_SEX_MAX           100

#define PRICE_ZESTAW_NAPR       90

#define PRICE_MECH_FIX_MIN      90
#define PRICE_MECH_FIX_MAX      250

#define PRICE_MECH_TANK_MIN     80     
#define PRICE_MECH_TANK_MAX     160

#define PRICE_PAYDAY_MIN        1000
#define PRICE_PAYDAY_MAX        1700

#define PRICE_PAYDAY_MIN_RESTAURANT       3000
#define PRICE_PAYDAY_MAX_RESTAURANT       4000
#define PRICE_PAYDAY_MIN_MEDIC       4500
#define PRICE_PAYDAY_MAX_MEDIC       5000
#define PRICE_PAYDAY_MIN_COPS       6000
#define PRICE_PAYDAY_MAX_COPS       6700

#define PRICE_MASECZKA_MIN      5
#define PRICE_MASECZKA_MAX      45

#define NARKO_POLICJA_REWARD 150 //Nagroda za zniszczenie krzaka narko

// ==================== SYSTEM SKRZYNEK I MATERIALOW ====================

// Ceny skupu w legalnych sklepach (za jednostke)
#define PRICE_SHOP_FABRICS_MIN      50
#define PRICE_SHOP_FABRICS_MAX      80
#define PRICE_SHOP_METALS_MIN       40
#define PRICE_SHOP_METALS_MAX       60
#define PRICE_SHOP_MATS_MIN         20
#define PRICE_SHOP_MATS_MAX         35
#define PRICE_SHOP_CHEMICALS_MIN    200
#define PRICE_SHOP_CHEMICALS_MAX    350

// Ceny skrytek osobistych
#define PRICE_STORAGE_BASIC         10000
#define PRICE_STORAGE_ADVANCED      25000
#define PRICE_STORAGE_GARAGE        60000

// Pojemnosc skrytek
#define STORAGE_BASIC_CAPACITY      50
#define STORAGE_ADVANCED_CAPACITY   100
#define STORAGE_GARAGE_CAPACITY     200

// Ceny craftowanych przedmiotow legalnych
#define PRICE_CRAFT_TOOLS_MIN       800
#define PRICE_CRAFT_TOOLS_MAX       1200
#define PRICE_CRAFT_CLOTHES_MIN     600
#define PRICE_CRAFT_CLOTHES_MAX     900
#define PRICE_CRAFT_FURNITURE_MIN   500
#define PRICE_CRAFT_FURNITURE_MAX   800
#define PRICE_CRAFT_ELECTRONICS_MIN 1500
#define PRICE_CRAFT_ELECTRONICS_MAX 2200

// Koszty craftowania (ilo?? surowców)
#define CRAFT_TOOLS_FABRICS         3
#define CRAFT_TOOLS_METALS          2
#define CRAFT_CLOTHES_FABRICS       5
#define CRAFT_FURNITURE_MATS        3
#define CRAFT_FURNITURE_METALS      2
#define CRAFT_ELECTRONICS_METALS    2
#define CRAFT_ELECTRONICS_CHEMICALS 1

// Kontrakty cywilne
#define CONTRACT_CIVIL_MIN_AMOUNT   1
#define CONTRACT_CIVIL_MAX_AMOUNT   3
#define CONTRACT_CIVIL_MIN_REWARD   300
#define CONTRACT_CIVIL_MAX_REWARD   5000

// Kontrakty organizacji
#define CONTRACT_ORG_MIN_REWARD     2000
#define CONTRACT_ORG_MAX_REWARD     25000

// Wymiana materialow
#define EXCHANGE_FEE_MIN            5  // 5%
#define EXCHANGE_FEE_MAX            10 // 10%
#define EXCHANGE_MIN_VALUE          100
#define EXCHANGE_MAX_VALUE          5000

// ==================== SYSTEM SKRZYNEK (CRATES) ====================
// Ceny kupna skrzynek w depotach (skrzynka = 10 jednostek)
#define PRICE_CRATE_FABRICS         400
#define PRICE_CRATE_METALS          250
#define PRICE_CRATE_MATS            150
#define PRICE_CRATE_COCAINE         150
#define PRICE_CRATE_CHEMICALS       2000

// ==================== SYSTEM DILEROW NPC (DEALERS) ====================
// Ceny skupu narkotykow u dilerow NPC (zakres min-max, losowane przy resecie)
#define DEALER_PRICE_COCAINE_P_MIN  25
#define DEALER_PRICE_COCAINE_P_MAX  60
#define DEALER_PRICE_COCAINE_N_MIN  60
#define DEALER_PRICE_COCAINE_N_MAX  110
#define DEALER_PRICE_COCAINE_G_MIN  130
#define DEALER_PRICE_COCAINE_G_MAX  200
#define DEALER_PRICE_COCAINE_E_MIN  220
#define DEALER_PRICE_COCAINE_E_MAX  350
#define DEALER_PRICE_HEROIN_MIN     150
#define DEALER_PRICE_HEROIN_MAX     300
#define DEALER_PRICE_METH_MIN       250
#define DEALER_PRICE_METH_MAX       400

// ==================== SYSTEM SKLEPOW LEGALNYCH (SHOPS) ====================
// Ceny skupu craftowanych produktow (zakres min-max, losowane przy resecie)
// Narzedzia: 3 fabrics ($50-80) + 2 metals ($40-60) = koszt $230-360 -> skup $300-450 (+30% zysku)
#define SHOP_PRICE_TOOLS_MIN        300
#define SHOP_PRICE_TOOLS_MAX        450
// Ubrania: 5 fabrics ($50-80) = koszt $250-400 -> skup $350-550 (+40% zysku)
#define SHOP_PRICE_CLOTHES_MIN       350
#define SHOP_PRICE_CLOTHES_MAX       550
// Meble: 3 mats ($20-35) + 2 metals ($40-60) = koszt $140-225 -> skup $200-320 (+40% zysku)
#define SHOP_PRICE_FURNITURE_MIN     200
#define SHOP_PRICE_FURNITURE_MAX     320
// Elektronika: 2 metals ($40-60) + 1 chemicals ($200-350) = koszt $280-470 -> skup $400-650 (+40% zysku)
#define SHOP_PRICE_ELECTRONICS_MIN   400
#define SHOP_PRICE_ELECTRONICS_MAX   650

// ==================== SYSTEM MAGAZYNOW (WAREHOUSE) ====================
// Koszt ulepszenia magazynu do Tier 2
#define WAREHOUSE_TIER_2_COST       75000

// Pojemnosc magazynow
#define WAREHOUSE_TIER_1_CAPACITY   200
#define WAREHOUSE_TIER_2_CAPACITY   500

// Wymagane gunparts do craftowania broni
#define GUNPARTS_SNIPER             25
#define GUNPARTS_M4                 10
#define GUNPARTS_AK47               8
#define GUNPARTS_RPG                50
#define GUNPARTS_ARMOUR             5
#define MATS_ARMOUR                 2  // Materialy potrzebne do kamizelki

// ==================== SYSTEM LABORATORIOW (DRUG LAB) ====================
// Cena nasion do produkcji kokainy
#define PRICE_DRUGLAB_SEED          5     // Cena za jedno nasiono

// Ceny upgrade NPC w laboratoriach
#define NPC_UPGRADE_COST_1          3000   // Upgrade do poziomu 1 (Poor)
#define NPC_UPGRADE_COST_2          10000  // Upgrade do poziomu 2 (Normal)
#define NPC_UPGRADE_COST_3          25000  // Upgrade do poziomu 3 (Good)
#define NPC_UPGRADE_COST_4          50000  // Upgrade do poziomu 4 (Excellent)

// MNO?NIKI

#define MULT_POLICEKILL         15
#define MULT_POLICE_ARRESTED    50
#define MULT_POLICE_ARREST      100
#define MULT_POLICE_BAIL        110
#define MULT_OGLOSZENIE         0.5
#define MULT_LOTTO              50
#define MULT_LOTTO2             150

#define MULT_RYBA_KG            0.55
#define MULT_MATS               20
#define MULT_LAWYER_WL          40

new MULT_TANKOWANIE = 2;