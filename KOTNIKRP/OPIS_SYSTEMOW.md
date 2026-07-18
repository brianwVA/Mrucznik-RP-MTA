# Opis Systemów - M-RP

## Spis Treści
1. [System Sklepy (Shops)](#system-sklepy-shops)
2. [System Skrytki (Storage)](#system-skrytki-storage)
3. [System Laboratorium (Druglab)](#system-laboratorium-druglab)
4. [System Skrzynki (Crates)](#system-skrzynki-crates)
5. [System Magazyny (Warehouses)](#system-magazyny-warehouses)
6. [System Kontrakty (Contracts)](#system-kontrakty-contracts)
7. [System Metamfetamina (Meth)](#system-metamfetamina-meth)
8. [System Heroina (Heroin)](#system-heroina-heroin)
9. [System Dilerzy (Dealers)](#system-dilerzy-dealers)

---

## System Sklepy (Shops)

### Opis
System legalnych sklepów - punkty skupu craftowanych produktów dla cywili. Gracze mogą sprzedawać produkty wyprodukowane w swoich skrytkach.

### Jak działa
1. **Lokalizacje**: Sklepy są rozmieszczone w różnych miastach (LS, SF, LV)
2. **Typy sklepów**:
   - Uniwersalne - skupują wszystkie produkty
   - Wyspecjalizowane - skupują tylko jeden typ produktu
3. **Produkty do sprzedaży**:
   - Narzędzia (Tools)
   - Ubrania (Clothes)
   - Meble (Furniture)
   - Elektronika (Electronics)
4. **Ceny**: Losowane przy każdym resecie serwera (30-40% zysku od kosztu materiałów)

### Zarobki
- **Narzędzia**: $650-850 za sztukę
  - Koszt produkcji: 3 tkaniny ($120-150) + 2 metale ($70-100) = $500-650
  - Zysk: ~$150-200 na sztuce
  
- **Ubrania**: $800-1000 za sztukę
  - Koszt produkcji: 5 tkanin ($120-150) = $600-750
  - Zysk: ~$200-250 na sztuce
  
- **Meble**: $300-450 za sztukę
  - Koszt produkcji: 3 materiały ($30-50) + 2 metale ($70-100) = $230-350
  - Zysk: ~$70-100 na sztuce
  
- **Elektronika**: $700-1000 za sztukę
  - Koszt produkcji: 2 metale ($70-100) + 1 chemikalia ($400-600) = $540-800
  - Zysk: ~$160-200 na sztuce

### Komendy
- `/sellshop` - Otwiera menu sprzedaży produktów
- `/shops` - Pokazuje aktualne ceny skupu

### Jak przetestować
1. Wyprodukuj produkt w skrytce (np. narzędzia)
2. Idź do sklepu (np. LS Sklep Przemysłowy: 2135.5, -1150.2, 24.0)
3. Użyj `/sellshop`
4. Wybierz produkt do sprzedaży
5. Sprawdź czy otrzymałeś pieniądze

---

## System Skrytki (Storage)

### Opis
System skrytek osobistych dla cywili - przechowywanie materiałów i produkcja legalnych produktów przy użyciu botów produkcyjnych.

### Jak działa
1. **Poziomy skrytek**:
   - **Tier 1 (Podstawowa)**: $15,000 - 1 bot, 50 pojemności
   - **Tier 2 (Zaawansowana)**: $30,000 - 2 boty, 100 pojemności
   - **Tier 3 (Garaż)**: $75,000 - 3 boty, 200 pojemności

2. **Materiały**:
   - Tkaniny (Fabrics)
   - Metale (Metals)
   - Materiały (Mats)
   - Chemikalia (Chemicals)

3. **Produkty**:
   - Narzędzia (Tools) - 3 tkaniny + 2 metale, czas: 60-120s
   - Ubrania (Clothes) - 5 tkanin, czas: 45-90s
   - Meble (Furniture) - 3 materiały + 2 metale, czas: 30-60s
   - Elektronika (Electronics) - 2 metale + 1 chemikalia, czas: 90-180s

4. **Boty produkcyjne**:
   - Automatyczna produkcja po ustawieniu typu
   - Kontynuują produkcję dopóki są materiały
   - Powiadomienia o zakończeniu produkcji

### Zarobki
Zależą od ceny skupu w sklepach (patrz System Sklepy):
- Narzędzia: ~$150-200 zysku na sztuce
- Ubrania: ~$200-250 zysku na sztuce
- Meble: ~$70-100 zysku na sztuce
- Elektronika: ~$160-200 zysku na sztuce

**Przykład**: Z Tier 3 (3 boty) produkując narzędzia:
- 3 boty × 1 narzędzie co ~90s = ~120 narzędzi/godzinę
- 120 × $150 = **$18,000/godzinę** (przy optymalnych warunkach)

### Komendy
- `/skrytka` - Otwiera menu skrytki
- `/kupskrytke [1-3]` - Kupuje skrytkę (1=Podstawowa, 2=Zaawansowana, 3=Garaż)

### Jak przetestować
1. Użyj `/kupskrytke 1` aby kupić podstawową skrytkę
2. Kup skrzynki materiałów w depocie (patrz System Skrzynki)
3. Wejdź do skrytki (naciśnij Y przy pickupie)
4. Użyj `/skrytka` → Zarządzaj → Przechowaj materiały (niesiesz skrzynkę)
5. Użyj `/skrytka` → Zarządzaj → Zarządzaj botami → Bot #1 → Ustaw produkcję (np. Narzędzia)
6. Poczekaj na powiadomienie o zakończeniu produkcji
7. Wyjmij produkty i sprzedaj w sklepie

---

## System Laboratorium (Druglab)

### Opis
System laboratoriów narkotykowych z NPC pracownikami do produkcji kokainy. Laboratoria mogą należeć do organizacji lub być prywatne.

### Jak działa
1. **Kupno laboratorium**:
   - Lider organizacji może kupić dla organizacji
   - Cywil może kupić prywatnie
   - Cena: zależna od laboratorium (ustawiana przez admina)

2. **Produkcja kokainy**:
   - Wymaga nasion (Seeds) - kupowane w laboratorium ($10 za nasiono)
   - NPC pracownicy produkują automatycznie co 1 minutę (60 sekund)
   - Każdy NPC poziomu X zużywa X nasion i produkuje 10g kokainy typu X

3. **Poziomy NPC**:
   - **Poziom 1 (Poor)**: $5,000 - produkuje Kokainę (P) - 10g/cykl
   - **Poziom 2 (Normal)**: $15,000 - produkuje Kokainę (N) - 10g/cykl
   - **Poziom 3 (Good)**: $35,000 - produkuje Kokainę (G) - 10g/cykl
   - **Poziom 4 (Excellent)**: $75,000 - produkuje Kokainę (E) - 10g/cykl
   - Maksymalnie 10 NPC na laboratorium

4. **Produkcja**:
   - Co 1 minutę każdy aktywny NPC produkuje 10g kokainy
   - Zużywa nasiona równe poziomowi NPC
   - Kokaina trafia do sejfu laboratorium

### Zarobki
Zależą od ceny skupu u dilerów (patrz System Dilerzy):
- **Kokaina (P)**: $30-70/g
- **Kokaina (N)**: $70-130/g
- **Kokaina (G)**: $150-250/g
- **Kokaina (E)**: $280-420/g

**Przykład z 10 NPC poziomu 4**:
- 10 NPC × 10g/cykl × 60 cykli/godzinę = 6,000g/godzinę
- 6,000g × $350 (średnia cena E) = **$2,100,000/godzinę**
- Koszt nasion: 10 NPC × 4 nasiona × 60 cykli × $10 = $24,000/godzinę
- **Zysk netto: ~$2,076,000/godzinę**

### Komendy
- `/lab` - Otwiera menu laboratorium
- `/kuplab` - Kupuje laboratorium
- `/weznasiona [ilość]` - Bierze nasiona z laboratorium
- `/odloznasiona [ilość]` - Odkłada nasiona do laboratorium

### Jak przetestować
1. Znajdź laboratorium (pickup na mapie)
2. Użyj `/kuplab` aby kupić (musisz być liderem organizacji lub cywilem)
3. Wejdź do laboratorium (naciśnij Y)
4. Użyj `/lab` → Zarządzaj NPC → Zatrudnij pracownika ($5,000)
5. Kup nasiona: `/lab` → Kup nasiona (np. 100 nasion za $1,000)
6. Poczekaj 1 minutę - NPC automatycznie wyprodukuje 10g Kokainy (P)
7. Użyj `/lab` → Weź kokainę z sejfu
8. Sprzedaj u dilera (patrz System Dilerzy)

---

## System Skrzynki (Crates)

### Opis
System skrzynek z materiałami - gracze kupują skrzynki w depotach, transportują je i dostarczają do magazynów/skrytek.

### Jak działa
1. **Typy skrzynek**:
   - **Tkaniny (Fabrics)**: $600 - 5 jednostek tkanin
   - **Metale (Metals)**: $300 - 5 jednostek metali
   - **Materiały (Mats)**: $100 - 5 jednostek materiałów
   - **Kokaina (Cocaine)**: $200 - skrzynka z kokainą
   - **Chemikalia (Chemicals)**: $3,500 - losowe chemikalia (1-4 jednostki każdego typu)

2. **Transport**:
   - Gracz nosi skrzynkę (attachment)
   - Można zapakować do pojazdu (max 5 skrzynek)
   - Można upuścić na ziemię (despawn po 15 minutach)
   - Skrzynka znika po 20 minutach noszenia

3. **Dostarczanie**:
   - Do magazynów organizacji (dla organizacji)
   - Do skrytek osobistych (dla cywili)
   - Automatyczne rozładowanie przy wejściu w obszar

4. **Kontrola policyjna**:
   - Szansa na kontrolę przy zakupie:
     - Tkaniny: 5%
     - Metale: 5%
     - Materiały: 10%
     - Kokaina: 30%
     - Chemikalia: 25%

### Zarobki
Zależą od tego, co zrobisz ze skrzynkami:
- **Sprzedaż materiałów**: Brak bezpośredniej sprzedaży
- **Produkcja produktów**: Patrz System Skrytki i System Magazyny
- **Kontrakty**: Patrz System Kontrakty

### Komendy
- `/upuscskrzynke` - Upuszcza noszoną skrzynkę
- `/skrzynkiauto` - Sprawdza skrzynki w pojeździe
- `/rozladujskrzynki` - Rozładowuje skrzynki z pojazdu do magazynu

### Jak przetestować
1. Idź do depota skrzynek (np. Tkaniny: 638.89, 851.91, -42.96)
2. Naciśnij Y przy depocie aby kupić skrzynkę
3. Nosi skrzynkę (attachment)
4. Możesz:
   - Zapakować do pojazdu (naciśnij Y przy otwartym bagażniku)
   - Dostarczyć do magazynu/skrytki (wejście w obszar automatycznie rozładuje)
   - Upuścić na ziemię (`/upuscskrzynke`)

---

## System Magazyny (Warehouses)

### Opis
System magazynów dla organizacji przestępczych - przechowywanie materiałów i craftowanie broni.

### Jak działa
1. **Kupno magazynu**:
   - Tylko dla organizacji przestępczych
   - Lider organizacji kupuje magazyn
   - Cena: zależna od magazynu (ustawiana przez admina)

2. **Poziomy magazynu**:
   - **Tier 1**: 200 pojemności
   - **Tier 2**: 500 pojemności (koszt ulepszenia: $100,000)

3. **Materiały**:
   - Tkaniny (Fabrics)
   - Metale (Metals)
   - Materiały (Mats)
   - Części broni (Gunparts) - automatycznie z tkanin i metali (5+5 = 5 gunparts)
   - Chemikalia: Aceton, Toluen, Lit, Sód, Wapno

4. **Craftowanie broni**:
   - **Snajperka**: 25 gunparts
   - **M4**: 10 gunparts
   - **AK47**: 8 gunparts
   - **RPG**: 50 gunparts
   - **Kamizelka**: 5 gunparts + 2 materiały

5. **Dostarczanie skrzynek**:
   - Skrzynki tkanin/metali/materiałów/chemikaliów dostarczane do magazynu
   - Automatyczne tworzenie gunparts z tkanin i metali

### Zarobki
Zależą od sprzedaży broni (nie ma bezpośredniego systemu sprzedaży w kodzie - prawdopodobnie przez handel między graczami):
- Koszt produkcji broni to tylko materiały (skrzynki)
- Zysk zależy od ceny sprzedaży innym graczom

### Komendy
- `/magazyn` - Otwiera menu magazynu
- `/kupmagazyn` - Kupuje magazyn
- `/craftbron` - Otwiera menu craftowania broni

### Jak przetestować
1. Jako lider organizacji idź do magazynu
2. Użyj `/kupmagazyn` aby kupić
3. Wejdź do magazynu (naciśnij Y)
4. Dostarcz skrzynki (tkaniny/metale) - automatycznie tworzą gunparts
5. Użyj `/magazyn` → Craftowanie broni
6. Wybierz broń do craftowania
7. Odbierz skrzynkę z bronią

---

## System Kontrakty (Contracts)

### Opis
System kontraktów - organizacje i cywile wystawiają zlecenia na dostarczenie skrzynek z nagrodą pieniężną.

### Jak działa
1. **Typy kontraktów**:
   - **Organizacje**: Wystawiają kontrakty na materiały (Tkaniny, Metale, Materiały, Chemikalia)
   - **Cywile**: Wystawiają kontrakty na materiały lub produkty (Narzędzia, Ubrania, Meble, Elektronika)

2. **Wystawianie kontraktu**:
   - Organizacja: Musi mieć magazyn, pieniądze są blokowane (escrow)
   - Cywil: Musi mieć skrytkę, pieniądze są blokowane (escrow)
   - Określa: typ, ilość skrzynek (1-20), nagrodę

3. **Przyjmowanie kontraktu**:
   - Gracz przegląda dostępne kontrakty
   - Może przyjąć tylko jeden kontrakt na raz
   - Otrzymuje GPS do miejsca dostawy

4. **Dostarczanie**:
   - Gracz dostarcza skrzynki do oznaczonego miejsca
   - Postęp jest śledzony
   - Po ukończeniu otrzymuje nagrodę

5. **Nagrody**:
   - Organizacje: $1,000 - $50,000
   - Cywile: $500 - $20,000

### Zarobki
Zależą od przyjętego kontraktu:
- **Przykład**: Kontrakt na 5 skrzynek tkanin za $5,000
  - Koszt skrzynek: 5 × $600 = $3,000
  - Nagroda: $5,000
  - **Zysk: $2,000**

### Komendy
- `/kontrakty` - Otwiera menu kontraktów
- `/mojkontrakt` - Sprawdza aktywny kontrakt

### Jak przetestować
**Jako wystawiający (organizacja)**:
1. Użyj `/kontrakty` → Wystaw kontrakt (organizacja)
2. Wybierz typ (np. Tkaniny)
3. Podaj ilość (np. 5)
4. Podaj nagrodę (np. $5,000)
5. Potwierdź

**Jako wykonawca**:
1. Użyj `/kontrakty` → Dostępne kontrakty
2. Wybierz kontrakt
3. Kup wymagane skrzynki
4. Dostarcz do oznaczonego miejsca (GPS)
5. Odbierz nagrodę po ukończeniu

---

## System Metamfetamina (Meth)

### Opis
System produkcji metamfetaminy w vanach - wymaga dodawania składników w odpowiednim czasie, inaczej van eksploduje.

### Jak działa
1. **Pojazdy**:
   - Journey (najlepszy) - 40% szansy na uniknięcie eksplozji
   - Rumpo - 10% szansy
   - Burrito - 10% szansy

2. **Proces produkcji**:
   - **Start**: `/meth start` - rozpoczyna produkcję
   - **Lithium**: `/meth lithium` - dodaj w ciągu 60 sekund
   - **Toluene**: `/meth toluene` - dodaj w ciągu 60 sekund
   - **Aceton**: `/meth aceton` - dodaj w ciągu 60 sekund
   - **Zbiór**: `/meth zbierz` - po zakończeniu

3. **Ryzyko**:
   - Jeśli nie dodasz składnika na czas - van eksploduje (szansa na uniknięcie zależy od pojazdu)
   - Ostrzeżenie po 45 sekundach (15 sekund przed końcem)

4. **Produkcja**:
   - Losowa ilość: 10-25g metamfetaminy
   - Wymaga składników: Lithium, Toluene, Aceton

### Zarobki
Zależą od ceny skupu u dilerów:
- **Metamfetamina**: $300-500/g
- **Przykład**: 15g × $400 = **$6,000** za jedną produkcję
- **Koszt składników**: ~$1,000-2,000 (zależnie od źródła)
- **Zysk netto**: ~$4,000-5,000 za produkcję

### Komendy
- `/meth start` - Rozpoczyna produkcję
- `/meth lithium` - Dodaje Lithium
- `/meth toluene` - Dodaje Toluene
- `/meth aceton` - Dodaje Aceton
- `/meth zbierz` - Zbiera gotową meth
- `/meth status` - Sprawdza status produkcji

### Jak przetestować
1. Wejdź do vana (Journey/Rumpo/Burrito)
2. Upewnij się, że masz składniki: Lithium, Toluene, Aceton
3. Użyj `/meth start`
4. Po ~45 sekundach otrzymasz ostrzeżenie
5. Użyj `/meth lithium` w ciągu 60 sekund
6. Po kolejnych 45 sekundach użyj `/meth toluene`
7. Po kolejnych 45 sekundach użyj `/meth aceton`
8. Poczekaj na zakończenie i użyj `/meth zbierz`
9. Sprzedaj u dilera

---

## System Heroina (Heroin)

### Opis
System produkcji heroiny w garnkach - wymaga dodawania składników w odpowiednim momencie procesu gotowania.

### Jak działa
1. **Proces produkcji**:
   - **Start**: `/heroina start` - tworzy garnek, rozpoczyna grzanie (0-20%)
   - **Woda**: `/heroina woda` - dodaj przy 20% (gotowanie wody 20-40%)
   - **Wapno**: `/heroina wapno` - dodaj przy 40% (mieszanie wapna 40-60%)
   - **Sód**: `/heroina sod` - dodaj przy 60% (mieszanie sodu 60-80%)
   - **Aceton**: `/heroina aceton` - dodaj przy 80% (mieszanie acetonu 80-100%)
   - **Zbiór**: `/heroina zbierz` - przy 100%

2. **Jakość**:
   - Zależy od błędów w dodawaniu składników
   - 0 błędów: 10-15g (doskonała jakość)
   - 1 błąd: 7-12g (dobra jakość)
   - 2 błędy: 5-9g (średnia jakość)
   - 3 błędy: 3-6g (słaba jakość)
   - 4+ błędów: 2-4g (bardzo słaba jakość)

3. **Postęp**:
   - Automatyczny co 30 sekund (+1%)
   - Cały proces: ~50 minut (100% × 30s = 3000s)

4. **Wymagane składniki**:
   - Woda
   - Wapno (Calcium)
   - Sód (Sodium)
   - Aceton (Acetone)

### Zarobki
Zależą od ceny skupu u dilerów i jakości:
- **Heroina**: $200-400/g
- **Przykład bez błędów**: 12g × $300 = **$3,600** za produkcję
- **Przykład z 2 błędami**: 7g × $300 = **$2,100** za produkcję
- **Koszt składników**: ~$500-1,000
- **Zysk netto**: ~$2,000-3,000 za produkcję (bez błędów)

### Komendy
- `/heroina start` - Rozpoczyna produkcję (tworzy garnek)
- `/heroina woda` - Dodaje wodę
- `/heroina wapno` - Dodaje wapno
- `/heroina sod` - Dodaje sód
- `/heroina aceton` - Dodaje aceton
- `/heroina zbierz` - Zbiera gotową heroinę
- `/heroina oproznij` - Usuwa garnek

### Jak przetestować
1. Upewnij się, że masz składniki: Woda, Wapno, Sód, Aceton
2. Użyj `/heroina start` - garnek pojawi się przed tobą
3. Poczekaj aż etap osiągnie 20% (sprawdź label na garnku)
4. Użyj `/heroina woda` dokładnie przy 20%
5. Poczekaj aż etap osiągnie 40%
6. Użyj `/heroina wapno` dokładnie przy 40%
7. Poczekaj aż etap osiągnie 60%
8. Użyj `/heroina sod` dokładnie przy 60%
9. Poczekaj aż etap osiągnie 80%
10. Użyj `/heroina aceton` dokładnie przy 80%
11. Poczekaj aż etap osiągnie 100%
12. Użyj `/heroina zbierz`
13. Sprzedaj u dilera

---

## System Dilerzy (Dealers)

### Opis
System dilerów NPC - punkty skupu narkotyków dla solo graczy. Dilerzy zmieniają lokalizacje co restart serwera.

### Jak działa
1. **Lokalizacje**:
   - Losowo wybierane z puli lokalizacji przy każdym resecie
   - 2 dilerów spawnuje się losowo
   - Lokalizacje: Idlewood, Ganton, El Corona, Jefferson, SF Chinatown, LV

2. **Ceny skupu**:
   - Losowane przy każdym resecie serwera
   - Różne dla każdego typu narkotyku
   - Zakresy cen (min-max)

3. **Narkotyki**:
   - Kokaina (P): $30-70/g
   - Kokaina (N): $70-130/g
   - Kokaina (G): $150-250/g
   - Kokaina (E): $280-420/g
   - Heroina: $200-400/g
   - Metamfetamina: $300-500/g

### Zarobki
Zależą od typu narkotyku i aktualnej ceny:
- **Najlepsze zarobki**: Kokaina (E) - do $420/g
- **Przykład**: 100g Kokainy (E) × $350 = **$35,000**

### Komendy
- `/sprzedajdiler` - Otwiera menu sprzedaży narkotyków
- `/dilerzy` - Pokazuje aktualne ceny skupu

### Jak przetestować
1. Wyprodukuj narkotyki (patrz System Laboratorium, Meth, Heroin)
2. Znajdź dilera (szukaj NPC z label "Skup narkotyków")
3. Użyj `/sprzedajdiler`
4. Wybierz narkotyk do sprzedaży
5. Sprawdź czy otrzymałeś pieniądze

---

## Podsumowanie Zarobków

### Najlepsze zarobki (na godzinę):
1. **Laboratorium (10 NPC poziomu 4)**: ~$2,076,000/h
2. **Skrytka Tier 3 (3 boty, narzędzia)**: ~$18,000/h
3. **Metamfetamina (Journey, optymalnie)**: ~$20,000-30,000/h
4. **Heroina (bez błędów)**: ~$4,200-6,000/h

### Najłatwiejsze do rozpoczęcia:
1. **Skrytka Tier 1**: $15,000 - szybki zwrot
2. **Metamfetamina**: Wymaga tylko vana i składników
3. **Heroina**: Wymaga tylko składników (garnek tworzy się automatycznie)

### Najbardziej ryzykowne:
1. **Metamfetamina**: Ryzyko eksplozji vana
2. **Heroina**: Błędy zmniejszają ilość produktu
3. **Skrzynki**: Kontrola policyjna przy zakupie

---

## Testowanie Kompleksowe

### Scenariusz testowy - Cywil:
1. Kup skrytkę Tier 1 (`/kupskrytke 1`)
2. Kup 5 skrzynek tkanin ($3,000)
3. Dostarcz do skrytki
4. Ustaw produkcję narzędzi
5. Sprzedaj produkty w sklepie
6. **Zysk**: ~$3,250 - $3,000 = $250 (pierwsza partia)

### Scenariusz testowy - Organizacja:
1. Kup magazyn (`/kupmagazyn`)
2. Dostarcz skrzynki tkanin i metali
3. Craftuj broń (np. M4 - 10 gunparts)
4. Sprzedaj innym graczom

### Scenariusz testowy - Narkotyki:
1. Kup laboratorium (`/kuplab`)
2. Zatrudnij 1 NPC ($5,000)
3. Kup 100 nasion ($1,000)
4. Poczekaj 1 minutę
5. Weź 10g Kokainy (P)
6. Sprzedaj u dilera (~$500)
7. **Zysk**: $500 - $100 (nasiona) = $400 (pierwsza partia)

---

## Uwagi Techniczne

- Wszystkie systemy zapisują dane do MySQL
- Ceny losują się przy każdym resecie serwera
- Timery produkcji działają w tle (nawet gdy gracz jest offline)
- Systemy są zintegrowane (skrzynki → magazyny/skrytki → produkcja → sprzedaż)
