# HHSKwkl (development version)

- `import_normen_rivm()` bijgewerkt met meer info
- `hhskthema_kaart()` toegevoegd
- `make_sf()` toegevoegd.

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
