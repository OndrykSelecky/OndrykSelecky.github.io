---
layout: default
title: Webové publikovanie
index: 2
type: developer
---

Stránka bola vypracovaná ako súčasť zadania z predmetu Webové publikovanie. Na nasledujúcich odkazoch sa nachádzajú popisy zadaní.

{% for zadanie in site.wpub %}
### [{{ zadanie.description }}]({{ zadanie.url }}){: .about-me}
{% endfor %}