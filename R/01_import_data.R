# import_fys_chem ---------------------------------------------------------------

#' Importeren van fysisch-chemische data
#' 
#' De functie helpt bij het importeren van fysische chemische data. Rijen zonder `waarde` worden verwijderd.
#' 
#' @param fys_chem_csv Een characterstring met het pad naar het te importeren bestand. 
#' Het bestand moet in csv-formaat zijn met `;` als scheidingsteken en `,` als decimaalteken. 
#' Default is `"data/fys_chem.csv"`. Het is ook mogelijk om een zip-bestand in te lezen 
#' waar het csv-bestand in zit.
#' @param datumtijd Logical. Of de kolom datum wordt geimporteerd als datum of als datum-tijd. 
#' Default is `FALSE`
#'
#' @return Een dataframe met fysisch-chemische meetgegevens.
#' 
#' @details Er is enige vrijheid t.a.v. de inhoud van het bestand. De functie verwacht 
#' ten minste een kolom `datum` en `waarde`. Een standaard bestand heeft gewoonlijk de kolommen:
#'  
#'  - `mp` Code met de aanduiding van het meetpunt
#'  - `datum` Datum in het format yyyy-mm-dd hh:mm
#'  - `parnr` Unieke nummer van de parameter 
#'  - `par` Parametercode, voor de leesbaarheid
#'  - `eenheid` Eenheid, voor de leesbaarheid
#'  - `detectiegrens` Aanduiding als < of >. Bij geen aanduidng krijgt het veld `NA`
#'  - `waarde` Waarde van de meting 
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' data <- import_fys_chem()
#' 
#' }
import_fys_chem <- function(fys_chem_csv = "data/fys_chem.csv", datumtijd = FALSE){
  
  if (datumtijd) {
    df <- readr::read_csv2(file = fys_chem_csv, locale = readr::locale(tz = "CET"), 
                           col_types = readr::cols(datum = readr::col_datetime()))
  } else {
    df <- readr::read_csv2(file = fys_chem_csv, 
                           col_types = readr::cols(datum = readr::col_date(format = "%Y-%m-%d %H:%M")))
  }
  
  # alle metingen moeten een meetwaarde hebben
  df <- dplyr::filter(df, !is.na(waarde)) %>% dplyr::arrange(mp, parnr, datum, waarde)
  
  #info zodat je weet wat je importeert
  message(paste("Laatste meetdatum is",max(df$datum, na.rm = TRUE)))
  df
}

# import_meetpunten -------------------------------------------------------------

#' Importeren van meetpunten
#'
#' De functie helpt bij het importeren van meetpunt-data en bijbehorende meetpuntinformatie. 
#'
#' @param meetpunten_csv Een characterstring met het pad naar het te importeren bestand. Het bestand moet in 
#' csv-formaat zijn met `;` als scheidingsteken en `,` als scheidingsteken. Default is `"data/meetpunten.csv"`. 
#' Het is ook mogelijk om een zip-bestand in te lezen waar het csv-bestand in zit.
#' @param wide Logical. Bepaalt of meetpunten in wijd of lang format worden ingelezen. Wide = `TRUE` is default
#' en resulteert in één regel per meetpunt
#' @param code Logical. Code of omschrijving gebruiken als kolomnamen.
#' @param tolower Logical. Bepaald of alle kolomnamen worden omgezet naar lowercase
#'
#' @return Een dataframe met meetpuntinformatie
#' 
#' @details De functie zet alle kolomkoppen om in lowercase. Er is enige vrijheid t.a.v. de inhoud van het bestand. 
#' Een standaard bestand heeft minimaal de kolommen:
#'  
#'  -  `mp` - Code met de aanduiding van het meetpunt
#'  -  `mpomsch` - Omschrijving van het meetpunt
#'  -  `x` - X-coordinaat in het RD-stelsel
#'  -  `y` - Y-coordinaat in het RD-stelsel
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' meetpunten <- import_meetpunten()
#' 
#' }
import_meetpunten <- function(meetpunten_csv = "data/meetpunten.csv", wide = TRUE, code = FALSE, tolower = TRUE){
  
  kenmerk <- ifelse(code, rlang::sym("kenmerk_code"), rlang::sym("kenmerk_naam"))
  
  meetpunten <- readr::read_csv2(meetpunten_csv,
                                 col_types = readr::cols(),
                                 locale = readr::locale(decimal_mark = ","))
  
  if (wide) {
    meetpunten <- meetpunten %>%
      dplyr::mutate(temp_var = paste0(!!kenmerk, "_", kenmerk_type)) %>%
      dplyr::select(-kenmerk_type, -kenmerk_code, -kenmerk_naam) %>%
      tidyr::pivot_wider(names_from = temp_var, values_from = kenmerk_waarde) %>%
      dplyr::mutate_at(dplyr::vars(dplyr::matches("_G$")), as.numeric) %>%
      dplyr::rename_at(dplyr::vars(dplyr::matches("_.")), ~stringr::str_remove(., "_.$"))
  }
  
  if (tolower) {names(meetpunten) <- tolower(names(meetpunten))}
  meetpunten
}

# import_parameters -------------------------------------------------------------

#' Importeren van parameters
#'
#' De functie helpt bij het importeren van parameter-data en bijbehorende parameterinformatie. 
#'
#' @param parameter_csv Een characterstring met het pad naar het te importeren bestand. Het bestand moet in 
#' csv-formaat zijn met `;` als scheidingsteken en `,` als scheidingsteken. Default is `"data/parameters.csv"`. 
#' Het is ook mogelijk om een zip-bestand in te lezen waar het csv-bestand in zit.
#'
#' @return Een dataframe met parameterinformatie
#' 
#' #' @details Er is enige vrijheid t.a.v. de inhoud van het bestand. Een standaard bestand heeft minimaal 
#' de onderstaande kolommen, maar de aquo_kolommen zijn wel wenselijk.
#'
#'  - `parnr` Het parameternummer
#'  - `par` Code voor de parameter, veelal aquo-conform
#'  - `parnaamlang` Uitgebreide naam van de parameter. Geschikt voor weergave
#'  - `eenheid` Eenheid van de parameter
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' parameters <- import_parameters()
#' 
#' }
import_parameters <- function(parameter_csv = "data/parameters.csv"){
  parameterdf <- readr::read_csv2(parameter_csv, col_types = readr::cols())
  parameterdf
}

# import_biologie ---------------------------------------------------------------

#' Importeer biologie-meetwaarden
#' 
#' De functie helpt bij het importeren van biologische data. De functie leest de kolom \code{datum} als \code{Date}.
#' Verder wordt er een kolom \code{monster_id} toegevoegd op basis van meetpunt, datum en methode.
#' 
#' @param biologie_csv Een characterstring met het pad naar het te importeren bestand. Het bestand moet in 
#' csv-formaat zijn met \code{;} als scheidingsteken en \code{,} als scheidingsteken. Default is \code{"data/biologie.csv"}. 
#' Het is ook mogelijk om een zip-bestand in te lezen waar het csv-bestand in zit.
#'
#' @details Er is enige vrijheid t.a.v. de inhoud van het bestand. De functie verwacht ten minste een kolom 
#' \code{mp}, \code{datum}, \code{methode}, \code{stadium} en \code{stadiumwaarde}. Een standaard bestand heeft gewoonlijk de kolommen:
#'  \itemize{
#'  \item \code{mp} Code met de aanduiding van het meetpunt
#'  \item \code{datum} Datum in het format dd-mm-yyyy hh:mm:ss
#'  \item \code{taxatype} Type taxon cf. aquo
#'  \item \code{naam} Latijnse naam, conform TWN
#'  \item \code{nednaam} Nederlandse naam indien beschikbaar
#'  \item \code{waarde} Meetwaarde (voor alle stadia gezamenlijk)
#'  \item \code{stadium} Code voor het stadium, indien beschikbaar
#'  \item \code{stadiumwaarde} Meetwaarde voor het stadium, indien beschikbaar
#'  \item \code{eenheid} Eenheid van de meetwaarden
#'  \item \code{taxniv} Code voor het taxonomisch niveau
#'  }
#'
#' @describeIn import_biologie Importeer biologische meetwaarden zonder stadiumwaarden
#'
#' @return Een dataframe met biologische meetwaarden.
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' biologie <- import_biologie()
#' biologie_met_stadium <- import_biologie_stadia()
#' 
#' }
import_biologie <- function(biologie_csv = "data/biologie.csv"){
  
  biodf <- readr::read_csv2(biologie_csv, col_types = readr::cols(datum = readr::col_date(format = "%d-%m-%Y %H:%M:%S"))) %>% 
    dplyr::mutate(monster_id = dplyr::group_indices(., mp, datum, methode)) %>% 
    dplyr::select(-dplyr::starts_with("stadium")) %>% 
    dplyr::distinct()
  
  biodf
}

#' @describeIn import_biologie Importeer biologische meetwaarden met stadium informatie
#' @export
import_biologie_stadia <- function(biologie_csv = "data/biologie.csv"){
  
  biodf <- readr::read_csv2(biologie_csv, col_types = readr::cols(datum = readr::col_date(format = "%d-%m-%Y %H:%M:%S"))) %>% 
    dplyr::mutate(monster_id = dplyr::group_indices(., mp, datum, methode))
  
  biodf
}

# import_biologie_kenmerken -----------------------------------------------------

#' Importeer biologische monsterkenmerken
#' 
#' De functie helpt bij het importeren van biologische monsterkenmerken. De functie leest de kolom \code{datum} als \code{Date}.
#' Verder wordt er een kolom \code{monster_id} toegevoegd op basis van meetpunt, datum en methode.
#' 
#' @param kenmerken_csv Een characterstring met het pad naar het te importeren bestand. Het bestand moet in 
#' csv-formaat zijn met \code{;} als scheidingsteken en \code{,} als scheidingsteken. Default is \code{"data/biologie_kenmerken.csv"}. 
#' Het is ook mogelijk om een zip-bestand in te lezen waar het csv-bestand in zit.
#'
#' @return Een dataframe met biologische kenmerken
#' 
#' @export
#' 
#' @details Er is enige vrijheid t.a.v. de inhoud van het bestand. De functie verwacht ten minste een kolom \code{datum}.
#' Een standaard bestand heeft gewoonlijk de kolommen:
#'  \itemize{
#'  \item \code{mp} Code met de aanduiding van het meetpunt
#'  \item \code{datum} Datum in het format dd-mm-yyyy hh:mm:ss
#'  \item \code{taxatype} Type taxon cf. aquo
#'  \item \code{kenmerkcode} Code van het biologische kenmerk
#'  \item \code{kenmerknaam} Beschrijving van het biologische kenmerk
#'  \item \code{waarde} De numerieke waarde van het kenmerk. Is 0 voor tekstwaarden en klassewaarden
#'  \item \code{waarde_tekst} De tekstwaarde van het kenmerk indien het een tekstkenmerk betreft
#'  \item \code{waarde_klasse} De numerieke klasse-aanduiding
#'  \item \code{waarde_klassenaam} De beschrijving van de klasse
#'  }
#'  
#' @examples
#' \dontrun{
#' 
#' biologie_kenmerken <- import_biologie_kenmerken(kenmerken_csv = "data/biologie_kenmerken.csv")
#' 
#' }
#' 
#' 
import_biologie_kenmerken <- function(kenmerken_csv = "data/biologie_kenmerken.csv"){
  
  bio_km_df <- readr::read_csv2(kenmerken_csv,col_types = readr::cols(datum = readr::col_date(format = "%d-%m-%Y %H:%M:%S")))
  bio_km_df
}

# import_normen_rivm ------------------------------------------------------------

#' Importeren RIVM normen
#' 
#' Het rivm stelt via de website \url{https://rvs.rivm.nl/zoeksysteem/} normen beschikbaar voor stoffen. Via deze website kunnen de
#' normen voor zoet oppervlaktewater worden gedownload. Deze functie leest een bestand met de normen zoals 
#' de website deze beschikbaar stelt en koppelt deze aan Dawaco-parameternummers. De koppeling is op basis van parametercode, 
#' eenheid en compartiment. Hoedanigheid wordt niet meegenomen. Veel normen hebben als hoedanigheid nf. Dit verschil levert echter 
#' slechts een geringe afwijking (< 5 \%) en is voor de toetsing niet echt relevant. Alleen gewasbeschermingsmiddelen worden meegenomen.
#'
#' @param normen Het normenbestand zoals dit van de RIVM website gedownload kan worden. Default is \code{"data/normen.txt"}
#' @param parameterdf Een parameterbestand. Zie ook \code{\link{import_parameters}}. Voor de koppeling zijn de kolommen \code{aquo_parcode}, 
#' \code{aquo_eenheid} en \code{aquo_compartiment} noodzakelijk. Default wordt een nieuw parameterbestand ingelezen met 
#' \code{import_parameters()}
#'
#' @return Een dataframe met de kolommen \code{parnr}, \code{norm_JGM}, \code{norm_MAX} en \code{norm_P90}
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' normen <- import_normen_rivm()
#' 
#' }
import_normen_rivm <- function(normen = "data/normen.txt", parameterdf = import_parameters() ){  

  koppeling <- c("Aquo-code" = "aquo_parcode", "Eenheid" = "aquo_eenheid", "Compartiment.code" = "aquo_compartiment")
  
  normen <- 
    suppressWarnings(readr::read_tsv(normen, col_types = readr::cols(Waarde = "n"), locale = readr::locale(decimal_mark = ","))) %>% 
    dplyr::mutate(Eenheid = dplyr::case_when(Eenheid == "\u00B5g/l" ~ "ug/l", TRUE ~ Eenheid )) %>% 
    dplyr::mutate(Waarde  = dplyr::case_when(Eenheid == "ng/l" ~ Waarde / 1000, TRUE ~ Waarde),
                  Eenheid = dplyr::case_when(Eenheid == "ng/l" ~ "ug/l", TRUE ~ Eenheid),) %>% 
    dplyr::filter(!is.na(Eenheid), !is.na(`Aquo-code`), !is.na(Compartiment), !(Norm.code %in% c("AC","Kp","VR")) ) %>% 
    dplyr::left_join(parameterdf, by = koppeling) %>%
    dplyr::filter(!is.na(parnr), parnr > 999) %>%
    dplyr::group_by(parnr,Waardebewerkingsmethode.code) %>%
    dplyr::summarise(normwaarde = min(Waarde)) %>%
    dplyr::ungroup() %>%
    tidyr::spread(key = "Waardebewerkingsmethode.code",value = "normwaarde") %>%
    dplyr::rename(norm_JGM = JGM, norm_MAX = MAX, norm_P90 = P90)

  normen
}
