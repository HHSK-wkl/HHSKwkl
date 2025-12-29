# Informatie over de taxa in het monster

Verschillende functies om de diverse aspecten van taxa en waarden in het
monster samen te vatten.

## Usage

``` r
mon_taxa_n(naam)

mon_taxa_missing(naam)

mon_taxa_n_uniek(naam)

mon_taxa_n_dubbel(naam)

mon_twn_niet_in_twn(naam)

mon_twn_status_afwijkend(naam)

mon_twn_synoniem(naam)

mon_twn_fout(naam)

mon_twn_aggregaat(naam)

mon_waarde_missing(waarde)

mon_waarde_nul(waarde)

mon_waarde_som(waarde)

mon_waarde_max(waarde)

mon_level_kd_species(naam)

mon_level_gd_species(naam)
```

## Arguments

- naam:

  Een vector met taxonnamen.

- waarde:

  Een vector met aantallen (per taxon).

## Value

Een enkel getal waarmee het betreffende aspect wordt samengevat.

## Details

Iedere functie geeft een samenvatting van een aspect van de taxonnamen
van het monster.

- `mon_taxa_missing` - Het aantal ontbrekende taxonnamen.

- `mon_taxa_n` - Het aantal taxonnamen, mogelijk inclusief dubbelingen.

- `mon_taxa_n_uniek` - Het aantal unieke taxonnamen.

- `mon_taxa_n_dubbel` - Het aantal taxa dat 2 keer of vaker voorkomt.

- `mon_twn_niet_in_twn` - Aantal taxa dat niet in de TWN-lijst voorkomt.

- `mon_twn_status_afwijkend` - Aantal taxa dat niet status 10
  (voorkeursnaam) heeft.

- `mon_twn_synoniem` - Aantal taxa dat een synoniem is (status 20).

- `mon_twn_aggregaat` - Aantal taxa dat een aggregaat van verschillende
  soorten is (status 80).

- `mon_twn_fout` - Aantal taxa dat een foutcode heeft in de TWN-lijst
  (status 30, 91, en 92)

- `mon_waarde_missing` - Aantal ontbrekende waarden.

- `mon_waarde_nul` - Aantal waarden die (kleiner dan) 0 zijn.

- `mon_waarde_tot` - Som van alle waarden in het monster.

- `mon_waarde_max` - Hoogst voorkomende waarde in het monster.

- `mon_level_kd_species` - Aantal taxa op een lager niveau dan *Species*

- `mon_level_gd_species` - Aantal taxa op een hoger niveau dan *Species*

## Note

Als taxa meerdere keren in het monster voorkomen dan worden deze in de
`mon_twn_*`-functies ook meerdere malen geteld.

## Examples

``` r
if (FALSE) { # \dontrun{
mon_taxa_missing(c("Bufo calamita", "Bufo", NA, "Bufo"))
mon_taxa_n(c("Bufo calamita", "Bufo", NA, "Bufo"))
mon_taxa_n_uniek(c("Bufo calamita", "Bufo", NA, "Bufo"))
mon_taxa_n_dubbel(c("Bufo calamita", "Bufo", NA, "Bufo"))

mon_twn_niet_in_twn(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
mon_twn_status_afwijkend(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
mon_twn_synoniem(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
mon_twn_aggregaat(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
mon_twn_fout(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))

mon_waarde_missing(c(0, 1, 5, 20, 50, NA, NA))
mon_waarde_nul(c(0, 1, 5, 20, 50, NA, NA))
mon_waarde_som(c(0, 1, 5, 20, 50, NA, NA))
mon_waarde_max(c(0, 1, 5, 20, 50, NA, NA))
} # }
```
