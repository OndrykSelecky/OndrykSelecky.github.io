---
layout: page
title: Zadanie 2
navbar-description: Zadanie 2
---

## Zadanie 2

Predmetom 2. zadania je spracovanie vybraného dokumentu (ideálne bakalárskeho projektu) z pôvodného ľubovoľného (Word, OpenOffice, LaTeX, …) formátu do formátu DocBook a vygenerovanie cieľového tvaru v PDF. Pozostáva z vybraných častí z mojej bakalárskej práce. Jedná sa o časti z analýzy, pretože tie obsahujú objekty a formátovania požadované zadaním.

## Splnenie požadovaných podmienok

+ __Členenie textu__: kapitoly a sekcie, príloha
+ __Zvýraznenie textu__: tučné písmo v zozname v 2. kapitole, premenné sú zvýraznené kurzívami
+ __Odrážky a číslovanie__: použité aj nečíslované zoznamy (itemizedlist, kapitola. 2), aj číslované (orderedlist, napr. kapitola. 4, sekcia 2.2)
+ __Odkazy na iné časti__: v poslednom odseku úvodu. Niektoré kapitoly dokumentu sú prázdne, je to z toho dôvodu, aby boli platné odkazy na ne a číslovanie kapitol.
+ __Literatúra a citácie__: viaceré zdroje, najviac v 4. kapitole
+ __Poznámky pod čiarou__: nachádzajú sa pri obrázkoch, obsahujú zdroj
+ __Obrázky__: každý obrázok má titul a popis. Obrázky sú označené tagom \<figure\>, samotný súbor je vložený cez \<mediaobject\>:

~~~
        <figure id="id">
            <title> Titul </title> 
            <mediaobject>
                <caption> Popis obrázka </caption>
                <imageobject>
                    <imagedata fileref="cesta k suboru"/>
                </imageobject>            
            </mediaobject>           
        </figure>
~~~

+ __Rovnice__: vložené ako obrázky, avšak namiesto \<figure\> je použitý tag \<equation\>, aby ich zobrazilo v osobitnom zozname
+ __Tabuľky__: tabuľka sa nachádza v časti 4.1.2, veľkosti stĺpcov sú dané absolútne v cm.
+ __Index__: 2-úrovňový
+ __Generovaný obsah__: Zoznam obrázkov, tabuliek a rovníc

## Úpravy šablon

Použité je písmo Times New Roman. Z titulnej strany bolo odstránené logo, titul práce bol odsadený, a nachádza sa nižšie. Nápis _vedoucí_ bol nahradený anglickým ekvivalentom.