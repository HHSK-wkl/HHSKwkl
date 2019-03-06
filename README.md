#TRAVIS BADGE

# Package HHSKwkl

Bevat uiteenlopende functies voor gebruik bij analyse en rapportage van waterkwaliteit voor HHSK.

## Dataframe Utilities

* `add_jaar_maand()` - voeg kolommen met jaar en/of maand toe aan een dataframe
* `add_jaar()`
* `add_maand()`

* `add_lat_long` - voeg kolommen met longitude en latitude toe o.b.v. RD-coordinaten

* `opzoeken_waarde()` - zoek een waarde op in een dataframe op basis van een key

* `randomize()` - verandert de rijen van een dataframe in willekeurige volgorde

* `my_c()` - de standaard `c()`-functie met aangepaste defaults

## Importfuncties

*DAWACO*

* `import_fys_chem()` - importeren fysisch-chemische data 
* `import_meetpunten()` - importeren van meetpunten 
* `import_parameters()` - importeren van parameters 
* `import_biologie()` - importeren van biologische waarnemingen 
* `import_biologie_stadia()` - importeren van biologische waarnemingen op stadium-niveau 
* `import_biologische_kenmerken()` - importeren van biologische monsterkenmerken

*RIVM*

* `import_normen_rivm()` - importeren van RIVM-normen zoals te downloaden van [RIVM Risico's van stoffen](https://rvszoeksysteem.rivm.nl/)

## Data-verwerking

* `toetsing_gbm()` - Toets de metingen van gewasbeschermingsmiddelen

## Grafieken

*Grafieken plotten*

* `grafiek_basis()` - ggplot-tijdreeksgrafiek van 1 meetpunt en parameter
* `boxplot_basis()` - ggplot-boxplots per jaar van 1 meetpunt en parameter
* `norm_lijnen()` - een object met normlijnen dat aan grafieken kan worden toegevoegd
* `add_norm_lijnen()` - voegt normlijnen toe aan een bestaande grafiek
* `titelpagina_internet()` - Titelpagina voor de grafieken op internet
* `grafieken_internet()` - Maakt van elke meetpunt een pdf met per parameter een grafiek

* `hhskthema()` - thema met HHSK kleuren voor ggplot

*Hulpobjecten*

* `hhskblauw` - Hexadecimale waarde voor HHSK-blauw
* `hhskgroen` - Hexadecimale waarde voor HHSK-groen
* `logo` - Het logo van HHSK 
* `schonevoeten` - Footer van HHSK met motto van HHSK en website

