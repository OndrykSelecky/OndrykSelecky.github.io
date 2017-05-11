---
layout: page
title: Zadanie 3
navbar-description: Zadanie 3
---

## Zadanie 3

Predmetom 3. zadania je analyzovanie možností tvorby webových prezentácií a návrh vlastnej prezentácie vytvorením xml schémy, xslt transformácií do pdf a html a ukážkovej prezentácie.

## Splnenie požadovaných podmienok

+ __Opis typu dokumentu__: pomocou xml schémy
+ __Vytvorenie ukážkovej prezentácie__: Bola vytvorená prezentácia vo formáte html, ktorá demonštruje možnosti zadania. 
+ __Návrh xsl transformácií__: do html aj do pdf, je možné zadať vstupný parameter
+ __konverzia z xml do html__: dohromady 5 slajdov, použité css, ukážková prezentácia
+ __konverzia z xml do pdf__: len čiastočne, z časových dôvodov neobsahuje všetky potrebné transformácie, problém s kódovaním

## Popis schémy

Prezentácia, ktorá spĺňa požiadavky schémy, obsahuje tieto súčasti:
+ koreňový element \<presentation\>
    + element \<styles\> - obsahuje štýlovanie pre celú prezentáciu, vrátene farby pozadia, štýlu písma a nadpisov či štúlu nadpisov každého slajdu
    + \<frontPage\> = titulná strana. Obsahuje tieto hlavné elementy:        
        + \<title\> = hlavný nadpis
        + \<subtitle\> = podnadpis
        + \<authors\> = mená autorov
        + \<date\> = dátum vytvorenia
    + \<page\> = obyčajná strana 
        + \<title\> = nadpis       
        + layouty = 
            + \<simplelayout\> = 1 stĺpec
            + \<doublelayout\> = 2 stĺpce
                + \<leftColumn\>
                + \<rightColumn\>

Nadpisy, \<simplelayout\> a \<*Column\> môžu obsahovať niektoré z týchto elementov, presné možnosti závisia od druhu nadelementu: 
+ \<paragraph\> = odstavec
+ \<table\> = tabuľka
+ \<image\> = obrázok
+ \<list\>, \<orderedList\> = zoznamy

Štýlovanie elementov sa nastavuje v elemente \<style\>, ktorý obsahujú niektoré z vyššie popísaných elementov. Pre daný elemnt vždy platí štýlovanie najnižšie v hierarchii. Napríklad, je možné nastaviť pozadie všetkých slajdov v elemente \<styles\>, ale aj konkrétnym slajdom, pričom globálne nastavenia sa uchovajú len pri tých elementoch, ktoré nemajú lokálne. 

Je možné nastaviť štýly:
+ výška a šírka blokov
+ farba pozadia
+ zarovnanie
+ písmo - typ, farba, veľkosť
+ odsadenie od vrchu

Okrem celkových štýlov sú definované aj inline elementy na lokálnu zmenu, napríklad tučné písmo či kurzíva. Tieto je možné aj kombinovať.

Poradie elementov na titulnej stránke je možné meniť, ich výška a odsadenie textu sa nastavuje pre každý osobitne.

## Popis transformácií

### Html
Vygenerovaná prezentácia pozostáva z titulného slajdu (súbor index.html) a ostatných, ktoré sú uložené v súboroch slide_*.html, kde * je poradové číslo. Okrem štandardného obsahu sa v nich nachádza navigačný panel na prepínanie medzi snímkami, generovaný slajd so zoznamom referencií a mená autorov v spodnej časti, ktorých viditeľnosť je možné nastaviť cez parameter transformácie showAuthors

### Pdf
Pri transformácii do pdf chýbajú určité vlastnosti, ktoré má html výstup, pretože som ich nestihol dokončiť. Chýbaj číslovanie strán a zoznam odkazov na konci. Tktiež je problém s kódovaním niektorých znakov, ktoré nezobrazuje správne.


                