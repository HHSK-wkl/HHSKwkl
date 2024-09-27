# HHSKwkl 0.4.2

- aanpassing aan toetsing_gbm voor wisselende detectiegrenzen
- kleine aanpassingen (linewidth en nieuwe versie roxygen)

# HHSKwkl 0.4.1

- `mspaf()` Voorde berekening van msPAF uit PAF-waarden
- `download_data()` en `data_online()` toegevoegd voor online data

# HHSKwkl 0.4.0

- `fys_chem()` is `fys_chem_rds()` geworden ivm naamconflicten.
- `paf_gbm()` voor de berekening van de PAF-waarden

# HHSKwkl 0.3.0

- `import_normen_rivm()` bijgewerkt met meer info
- `hhskthema_kaart()` toegevoegd
- `basiskaart()` uitgebreid met argument `type` voor het type achtergrondkaart.
- `thema_hor_bar`, `thema_vert_bar`, `thema_facet_lines` toegevoegd.
- `fys_chem()` toegevoegd om snel fysisch-chemische data in te lezen uit een .rds-bestand.
- Diverse kleuren toegevoegd als object: zie `?kleuren`
- `dawaco_connect()` opgenomen om makkelijk verbinding te kunnen leggen met de Dawaco-database
- Een custom bookdown-template opgenomen.

- `make_sf()` toegevoegd en weer verwijderd. Gebruik snippets.

# HHSKwkl 0.2.1

- Kleuren van hhskthema iets verbeterd en grafiek_basis iets gewijzigd.
- Interne functies voor testdata toegevoegd.
- Import_fys_chem sorteert op mp, parnr, datum en waarde
- deprecated the `my_c` function
- `frac()` en `perc()` toegevoegd om snel fracties in summarise te kunnen maken.
- reexporting `%>%`

# HHSKwkl 0.2.0

## New features 
- Thema's en grafiekkleuren aangepast - meer grijs, minder groen.
- Titel toegevoegd aan pdf in `grafieken_internet()` 
- functie `link_grafiek()` toegevoegd om makkelijk te verwijzen naar grafieken op de website.
- functie `copy_data()` toegevoegd.
- `import_fys_chem` en `import_meetpunten` zijn aangepast aan het FME-export formaat.
- Een functie voor Nederlandse DT-labels toegevoegd.
- Rmarkdown-skeleton toegevoegd voor HHSK-rapportages, inclusief header en footer.
- Diverse monsterinfo functies gemaakt samen met een overkoepelende summary functie
- `render_server()` toegevoegd om Rmarkdown documenten op de server te laten uitvoeren.

## Deprecated
- `fun_twn_*`- en `get_twn_*`-functies verplaatst naar package twn.

## Bugfixes
- Bugfix in de functie `import_normen_rivm()`

## Bugs


## Wensen
- Wens voor monsterdiagnostiek
- Wens voor diagnostiek TWN-lijst


# HHSKwkl 0.1.0

* Added a `NEWS.md` file to track changes to the package.
