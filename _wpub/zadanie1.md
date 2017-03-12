---
layout: page
title: Zadanie 1
navbar-description: Zadanie 1
---

## Popis stránky

Stránka má nasledujúcu štruktúru (*kurzívami* sú označené sekcie jednej stránky):
+ Index = Home  
+ Navigation bar:
  + Home
  + About me 
    + Profesionálne záujmy
      + *Profesionálne záujmy*
      + *Webové publikovanie*
        + Zadanie 1
    + Osobné záujmy 
      + *Knihy*
        + Moje obľúbené knihy
          + Stránky kníh
      + *Seriály*
        + Moje obľúbené seriály
      + *Šport*
  + CV
  + Blog
  + About site ( Zadanie 1)

Popis zadania je na stránke __Zadanie 1__.

Stránka knihy obsahuje zoznam niekoľkých kníh. K prvým trom som vytvoril vlastný text, zvyšné obsahujú texty z externých zdrojov alebo žiadne.

## Popis riešenia

V počiatočných fázach dizajnu som pracoval s bootstrapom, potom som však od neho upustil a štýly som si vytvoril sám.
Inšpiráciu som si zobral z nasledujúcich šablon:

+ Vytváraním CV prostredníctvom dátových súborov som sa inšpiroval na [https://github.com/mattcouchman/jekyll-resume/tree/master/_data](https://github.com/mattcouchman/jekyll-resume/tree/master/_data)
+ Inšpirácia pre dizajn: [https://github.com/BlackrockDigital/startbootstrap-full-width-pics](https://github.com/BlackrockDigital/startbootstrap-full-width-pics)
+ Pri vytváraní som použil časti z tutoriálu [http://jekyll.tips/](http://jekyll.tips/), najmä kolekcie.


#### Šablony (layouts)

Stránka obsahuje tieto šablóny:
1. _Default_. Použitá je na úvodnej stránke a na väčšine ostatných. Zvyšné šablóny sú od nej odvodené.
2. _Page_. Od _default_ šablóny sa líši formátovaním, ktoré je v nej použité.
3. _Interest_. Táto šablóna zoskupí na jednej stránke záujmy z _abouts_ podľa toho, ku ktorému typu z _interests_ patria (Osobné alebo profesné)
4. _Post_. Šablóna pre príspevok v blogu. Obsahuje dátum, nadpis a podnadpis.
5. _Book_. Použitá pre stránku o knihe. Kniha obsahuje názov knihy, meno autora, žánre, titulný obrázok a iné.


#### Premenné

Napríklad každá stránka knihy obsahuje tieto premenné:
~~~
---
layout: book                //názov layoutu
title:  Pieseň ľadu a ohňa  //titul
author: G. R. R. Martin     //meno autora
cover_image:                //adresa titulného obrázka
goodreads:                  //url na goodreads.com
martinus:                   //url na martinus.sk
rating: 1                   //rating, podľa ktorého sa sortuje pri zobrazovaní
genre:                      //pole žánrov, napr:
    - román
    - magický realizmus
---
~~~

Vlastné premenné majú takmer všetky stránky.


#### Tagy

Použité sú `{% raw  %}{% include %}{% endraw %}` tagy:
+ Navigation bar. Uložený je v súbore _nav.html_. Include sa nachádza v šablóne _default_.
+ Footer. Uložený je v súbore _footer.html_.

+ V tomto článku sú použité tagy `{% raw %}{% raw %}{% endraw %}` a `{{ "{% endraw " }}%}` na escape liquid tagov.


#### Filtre

+ V _nav.html_ sa do navigačného panela ukladajú odkazy na základe hodnoty premennej navigation\_weight: 
  `{% raw %}{% assign navigation_pages = site.html_pages | sort: 'navigation_weight' | reverse %}{% endraw %}`
+ Sort sa používa aj v _mybooks.html_, kde sa knihy zobrazujú na základe hodnoty premennej rating: `{% raw %}{% assign my_books = site.books | sort: 'rating'  %}{% endraw %}`
+ Dátumový filter v layoute _post.html_: `{% raw %}{{ page.date | date: '%d. %b. %Y' }}{% endraw %}`


#### Dátové súbory

Jednotlivé záznamy v sekciách životopisu, ako napríklad štúdium alebo znalosti, sú uložené v dátových súboroch yaml v priečinku _\_data_. Napríklad znalosti sú vymenované v poliach v súbore _knowledge.yml_:

~~~
- type: Language skills
  values:
    - name: Anglický jazyk
      description: "C1"
    - name: Nemecký jazyk
      description: "A1"

- type: Computer skills
  values:
  - name: Microsoft Excel
    description: "2"
  - name: Microsoft Word
    description: "3"
  - name: Microsoft PowerPoint
    description: "3"
~~~

Znalosti sa potom načítavajú pomocou for cyklu v _cv.html_. Hodnota description udáva úroveň znalosti. Tá sa ešte nahradí, poprípade doplní textovým pomenovaním. Textové pomenovania sú uložené v poli _knowledge\_levels v \_config.yml_:

~~~
knowledge_levels:
  "1": basic
  "2": advanced
  "3": expert
  "A1": basic user
  "A2": basic user
  "B1": independent user
  "B2": independent user
  "C1": proficient user
  "C2": proficient user
~~~

Nahradenie sa vykonáva prostredníctvom \[\]: 

~~~
{% raw %}{% for knowledge in type.values %}
  {% assign identificator = knowledge.description %}
  {% assign description = site.knowledge_levels[identificator] %}			
  <!-- výpis -->
{% endfor %}{% endraw %}
~~~


#### Kolekcie

V _\_config.yml_ sú definované tieto kolekcie:

~~~
collections:
  books:
    output: true
  interests:
    output: true
  abouts:
  wpub:
    output: true
~~~

Kolekcia _books_ uchováva stránky jednotlivých kníh.  
Kolekcia _interests_ sa používa na stránky kategórií záujmov - osobné alebo profesné  
Kolekcia _abouts_ uchováva jednotlivé záľuby - knihy, seriály, webové publikovanie.  
Kolekcia _wpub_ uchováva stránky zadaní k predmetu Webové publikovanie.  


#### Pluginy

Pluginy sú použité v blogu a postoch.
+ [_jemoji_](https://github.com/jekyll/jemoji). Slúži na zobrazovanie emotikonov. Funguje aj na githube..
+ [_youtube_](https://gist.github.com/joelverhagen/1805814). Umožňuje pridať na stránku video z youtube. 
+ [_jekyll-timeago_](https://github.com/markets/jekyll-timeago). Vykonáva konverziu dátumu na časový rozdiel. Použitý je v _blog.html_ pri dátumoch postov, je potrebné spustenie na localhoste.







