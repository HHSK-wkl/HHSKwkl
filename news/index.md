# Changelog

## HHSKwkl (development version)

## HHSKwkl 0.5.2

*Nieuw*

- [`get_brand_hhsk()`](https://hhsk-wkl.github.io/HHSKwkl/reference/get_brand_hhsk.md)
  toegevoegd voor vereenvoudigde installatie van brand_hhsk voor Quarto.
- [`get_open_gisdata()`](https://hhsk-wkl.github.io/HHSKwkl/reference/get_open_gisdata.md)
  en `gisdata_info` toegevoegd voor gebruik open dataportaal van HHSK
  voor GIS-informatie.
- aanpassing ws_grens_rd en ws_grens_wgs naar sf-tibble ipv sf-dataframe
- `...` toegevoegd aan basiskaart voor leaflet elementId

## HHSKwkl 0.5.1

*Nieuw*

- Kleuren aangepast omdat originele huisstijlkleuren minder goed werken
  voor visualisaties.
- Eerste stappen voor vervanging
  [`hhskthema()`](https://hhsk-wkl.github.io/HHSKwkl/reference/hhskthema.md)
  vernieuwd, oude thema’s te vinden onder
  [`hhskthema_oud()`](https://hhsk-wkl.github.io/HHSKwkl/reference/hhskthema.md)
- brand en Ruda-font opgenomen in extdata

## HHSKwkl 0.5.0

*Vernieuwd*

- Github Action voor package-check versimpeld en geupdate
- `ws_grens_rd` en `ws_grens_wgs` opgenomen als data-object i.p.v. de
  functie `ws_grens()`
- nieuwe huisstijlkleuren opgenomen
- logo vervangen en opgenomen in extdata
- [`get_logo()`](https://hhsk-wkl.github.io/HHSKwkl/reference/get_logo.md)
  functie toegevoegd

*Verwijderd*

- Oude templates voor R-studioprojecten en rmarkdown verwijderd
- maandnamen verwijderd
- `randomize()` verwijderd
- `add_twn_voorkeurnaam()` verwijderd
- `render_server()` verwijderd - onnodig met nieuwe server
- overbodige badges in de README weggehaald
- coverage check verwijderd
- `hhskblauw` en `hhskgroen`
- `myCRS`
- verouderde importfuncties verwijderd

*To Do*

- brand.yml
- nieuwe pipe?
- import_normen_rivm updaten voor nieuwe excelversie
- ggplot thema’s updaten
- [`titelpagina_internet()`](https://hhsk-wkl.github.io/HHSKwkl/reference/titelpagina_internet.md)
  en
  [`grafieken_internet()`](https://hhsk-wkl.github.io/HHSKwkl/reference/grafieken_internet.md)
  verwijderen als Actuele metingen geupdate is
- Tests bijwerken
- get_data functies uitbreiden en updaten

*Over na denken* - Diverse functies (bijv.
[`count_rel()`](https://hhsk-wkl.github.io/HHSKwkl/reference/count_rel.md))
zijn nuttig, maar worden vergeten. Wat te doen met deze functies? - Wat
te doen met monster_info functies - gebruik van interne functies?

## HHSKwkl 0.4.3

30-7-2025

- gebruik van `httr2` voor
  [`download_data()`](https://hhsk-wkl.github.io/HHSKwkl/reference/download_data.md)
  en
  [`data_online()`](https://hhsk-wkl.github.io/HHSKwkl/reference/data_online.md)
- laatste versie voor opschonen

17-12-2024

*Toegevoegd*

- `ws_grens()` en
  [`get_ws_grens()`](https://hhsk-wkl.github.io/HHSKwkl/reference/get_ws_grens.md)
- Voorbereiding voor toevoeging van \_brand.yml

*Acties*

- \_brand.yml en bijbehorende bestanden maken
- biologie uitfaseren
- render_server() uitfaseren
- bookdown_setup uitfaseren
- code voor snippets opnemen??

*Verwijderd*

- `fys_chem_rds()`
- `dawaco_connect()`

## HHSKwkl 0.4.2

1-10-2024

- aanpassing aan toetsing_gbm voor wisselende detectiegrenzen
- kleine aanpassingen (linewidth en nieuwe versie roxygen)

## HHSKwkl 0.4.1

- [`mspaf()`](https://hhsk-wkl.github.io/HHSKwkl/reference/mspaf.md)
  Voorde berekening van msPAF uit PAF-waarden
- [`download_data()`](https://hhsk-wkl.github.io/HHSKwkl/reference/download_data.md)
  en
  [`data_online()`](https://hhsk-wkl.github.io/HHSKwkl/reference/data_online.md)
  toegevoegd voor online data

## HHSKwkl 0.4.0

- `fys_chem()` is `fys_chem_rds()` geworden ivm naamconflicten.
- [`paf_gbm()`](https://hhsk-wkl.github.io/HHSKwkl/reference/paf_gbm.md)
  voor de berekening van de PAF-waarden

## HHSKwkl 0.3.0

- `import_normen_rivm()` bijgewerkt met meer info

- [`hhskthema_kaart()`](https://hhsk-wkl.github.io/HHSKwkl/reference/hhskthema.md)
  toegevoegd

- [`basiskaart()`](https://hhsk-wkl.github.io/HHSKwkl/reference/basiskaart.md)
  uitgebreid met argument `type` voor het type achtergrondkaart.

- `thema_hor_bar`, `thema_vert_bar`, `thema_facet_lines` toegevoegd.

- `fys_chem()` toegevoegd om snel fysisch-chemische data in te lezen uit
  een .rds-bestand.

- Diverse kleuren toegevoegd als object: zie
  [`?kleuren`](https://hhsk-wkl.github.io/HHSKwkl/reference/kleuren.md)

- `dawaco_connect()` opgenomen om makkelijk verbinding te kunnen leggen
  met de Dawaco-database

- Een custom bookdown-template opgenomen.

- `make_sf()` toegevoegd en weer verwijderd. Gebruik snippets.

## HHSKwkl 0.2.1

- Kleuren van hhskthema iets verbeterd en grafiek_basis iets gewijzigd.
- Interne functies voor testdata toegevoegd.
- Import_fys_chem sorteert op mp, parnr, datum en waarde
- deprecated the `my_c` function
- [`frac()`](https://hhsk-wkl.github.io/HHSKwkl/reference/fracties.md)
  en
  [`perc()`](https://hhsk-wkl.github.io/HHSKwkl/reference/fracties.md)
  toegevoegd om snel fracties in summarise te kunnen maken.
- reexporting `%>%`

## HHSKwkl 0.2.0

### New features

- Thema’s en grafiekkleuren aangepast - meer grijs, minder groen.
- Titel toegevoegd aan pdf in
  [`grafieken_internet()`](https://hhsk-wkl.github.io/HHSKwkl/reference/grafieken_internet.md)
- functie
  [`link_grafiek()`](https://hhsk-wkl.github.io/HHSKwkl/reference/link_grafiek.md)
  toegevoegd om makkelijk te verwijzen naar grafieken op de website.
- functie
  [`copy_data()`](https://hhsk-wkl.github.io/HHSKwkl/reference/copy_data.md)
  toegevoegd.
- `import_fys_chem` en `import_meetpunten` zijn aangepast aan het
  FME-export formaat.
- Een functie voor Nederlandse DT-labels toegevoegd.
- Rmarkdown-skeleton toegevoegd voor HHSK-rapportages, inclusief header
  en footer.
- Diverse monsterinfo functies gemaakt samen met een overkoepelende
  summary functie
- `render_server()` toegevoegd om Rmarkdown documenten op de server te
  laten uitvoeren.

### Deprecated

- `fun_twn_*`- en `get_twn_*`-functies verplaatst naar package twn.

### Bugfixes

- Bugfix in de functie `import_normen_rivm()`

### Bugs

### Wensen

- Wens voor monsterdiagnostiek
- Wens voor diagnostiek TWN-lijst

## HHSKwkl 0.1.0

- Added a `NEWS.md` file to track changes to the package.
