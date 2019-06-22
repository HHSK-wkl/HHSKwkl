# monsterdiagnostiek - compleetheid, duplicaten, twnconformiteit
# monsterbeschrijving - aantal soorten, geslachten e.d 
# monsterverrijking -
# diversiteitsindexen,?beoordelingen? omgevingsfactoren etc.
#
# basisfuncties die uitgaan van  1 monster. Overkoepelende functies met group_by
# en een verzameling basisfuncties


# Monster-summaryfunctie --------------------------------------------------


# mon_summary_old <- function(df) {
#   summarise(df, 
#             taxa_missing   = mon_taxa_missing(naam),
#             taxa_n         = mon_taxa_n(naam),
#             taxa_n_uniek   = mon_taxa_n_uniek(naam),
#             taxa_n_dubbel  = mon_taxa_n_dubbel(naam),
#             waarde_missing = mon_waarde_missing(waarde),
#             waarde_nul     = mon_waarde_nul(waarde),
#             waarde_tot     = mon_waarde_tot(waarde),
#             waarde_max     = mon_waarde_max(waarde),
#             twn_niet_in_twn  = mon_twn_niet_in_twn(naam),
#             twn_status_afwijkend = mon_twn_status_afwijkend(naam)
#             )
# }

#' Samenvatting monster
#'
#' @description Deze functie maakt een samenvatting van een monster. Hiermee is
#'   het mogelijk om snel een overzicht van een monster te krijgen en eventuele
#'   problemen te constateren.
#'
#'   Het is mogelijk om meerdere monsters tegelijk samen te vatten door gebruik
#'   van de functie [dplyr::group_by]
#'
#' @param df Een (grouped) dataframe met een of meerdere monsters
#' @param naam De kolomnaam met de taxonnamen. Dit argument wordt gequote.
#' @param waarde De kolomnaam met de waarden. Dit argument wordt gequote.
#'
#' @return  DUMMY
#' @export
#'
#' @examples
#' 
#' #DUMMY
mon_summary <- function(df, naam = naam, waarde = waarde) {
  naam <- dplyr::enquo(naam)
  waarde <- dplyr::enquo(waarde)
  
  dplyr::summarise(
    df, 
    taxa_n               = mon_taxa_n(!!naam),
    taxa_missing         = mon_taxa_missing(!!naam),
    taxa_n_uniek         = mon_taxa_n_uniek(!!naam),
    taxa_n_dubbel        = mon_taxa_n_dubbel(!!naam),
    waarde_som           = mon_waarde_som(!!waarde),
    waarde_max           = mon_waarde_max(!!waarde),
    waarde_missing       = mon_waarde_missing(!!waarde),
    waarde_nul           = mon_waarde_nul(!!waarde),
    twn_niet_in_twn      = mon_twn_niet_in_twn(!!naam),
    twn_status_afwijkend = mon_twn_status_afwijkend(!!naam),
    twn_synoniem         = mon_twn_synoniem(!!naam),
    twn_aggregaat        = mon_twn_aggregaat(!!naam),
    twn_fout             = mon_twn_fout(!!naam),
    level_kd_species     = mon_level_kd_species(.data$naam),
    level_gd_species     = mon_level_gd_species(.data$naam)
  )
}



# Monster info-documentatie -----------------------------------------------

#' Informatie over de taxa in het monster
#'
#' Verschillende functies om de diverse aspecten van taxa en waarden in het
#' monster samen te vatten.
#'
#' @details Iedere functie geeft een samenvatting van een aspect van de
#'   taxonnamen van het monster.
#'
#'   - `mon_taxa_missing`  - Het aantal ontbrekende taxonnamen. 
#'   - `mon_taxa_n`        - Het aantal taxonnamen, mogelijk inclusief dubbelingen. 
#'   - `mon_taxa_n_uniek`  - Het aantal unieke taxonnamen. 
#'   - `mon_taxa_n_dubbel` - Het aantal taxa dat 2 keer of vaker voorkomt.
#'   
#'   - `mon_twn_niet_in_twn`      - Aantal taxa dat niet in de TWN-lijst voorkomt.
#'   - `mon_twn_status_afwijkend` - Aantal taxa dat niet status 10 (voorkeursnaam) heeft.
#'   - `mon_twn_synoniem`         - Aantal taxa dat een synoniem is (status 20).
#'   - `mon_twn_aggregaat`        - Aantal taxa dat een aggregaat van verschillende soorten is (status 80).
#'   - `mon_twn_fout`             - Aantal taxa dat een foutcode heeft in de TWN-lijst (status 30, 91, en 92)
#'   
#'   - `mon_waarde_missing` - Aantal ontbrekende waarden.
#'   - `mon_waarde_nul`     - Aantal waarden die (kleiner dan) 0 zijn.
#'   - `mon_waarde_tot`     - Som van alle waarden in het monster.
#'   - `mon_waarde_max`     - Hoogst voorkomende waarde in het monster.
#'   
#'   - `mon_level_kd_species` - Aantal taxa op een lager niveau dan *Species*
#'   - `mon_level_gd_species` - Aantal taxa op een hoger niveau dan *Species*
#'
#' @param naam Een vector met taxonnamen.
#' @param waarde Een vector met aantallen (per taxon).
#' 
#' @note
#' 
#' Als taxa meerdere keren in het monster voorkomen dan worden deze in de `mon_twn_*`-functies 
#' ook meerdere malen geteld.
#'
#' @return Een enkel getal waarmee het betreffende aspect wordt samengevat.
#'
#' @name mon_info
#'
#' @examples
#'
#' mon_taxa_missing(c("Bufo calamita", "Bufo", NA, "Bufo"))
#' mon_taxa_n(c("Bufo calamita", "Bufo", NA, "Bufo"))
#' mon_taxa_n_uniek(c("Bufo calamita", "Bufo", NA, "Bufo"))
#' mon_taxa_n_dubbel(c("Bufo calamita", "Bufo", NA, "Bufo"))
#' 
#' mon_twn_niet_in_twn(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
#' mon_twn_status_afwijkend(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
#' mon_twn_synoniem(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
#' mon_twn_aggregaat(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
#' mon_twn_fout(c("Bufo calamita", "Bufo", NA, "Bufo", "Denkbeeldig dier"))
#' 
#' mon_waarde_missing(c(0, 1, 5, 20, 50, NA, NA))
#' mon_waarde_nul(c(0, 1, 5, 20, 50, NA, NA))
#' mon_waarde_som(c(0, 1, 5, 20, 50, NA, NA))
#' mon_waarde_max(c(0, 1, 5, 20, 50, NA, NA))
NULL

# Monster taxa-info -------------------------------------------------------

#' @export
#' @rdname mon_info
mon_taxa_n <- function(naam) {
  sum(!is.na(naam))
}

#' @export
#' @rdname mon_info
mon_taxa_missing <- function(naam) {
  sum(is.na(naam))
}

#' @export
#' @rdname mon_info
mon_taxa_n_uniek <- function(naam) {
  dplyr::n_distinct(naam, na.rm = TRUE)
}

#' @export
#' @rdname mon_info
mon_taxa_n_dubbel <- function(naam) {
  dplyr::tibble(naam) %>% 
    dplyr::count(naam) %>% 
    dplyr::filter(n > 1, !is.na(naam)) %>% 
    nrow()
}


# Monster twn-info --------------------------------------------------------


#' @export
#' @rdname mon_info
mon_twn_niet_in_twn <- function(naam) {
  sum(!(naam %in% autecodata::twn_lijst$taxonname))
}

#' @export
#' @rdname mon_info
mon_twn_status_afwijkend <- function(naam){
  sum(autecodata::get_twn_status(naam) != "10", na.rm = TRUE)
}

#' @export
#' @rdname mon_info
mon_twn_synoniem <- function(naam){
  sum(autecodata::get_twn_status(naam) == "20", na.rm = TRUE)
}

#' @export
#' @rdname mon_info
mon_twn_fout <- function(naam){
  sum(autecodata::get_twn_status(naam) %in% c("30", "91", "92"), na.rm = TRUE)
}

#' @export
#' @rdname mon_info
mon_twn_aggregaat <- function(naam){
  sum(autecodata::get_twn_status(naam) == "80", na.rm = TRUE)
}


# Monster waarde-info -----------------------------------------------------

#' @export
#' @rdname mon_info
mon_waarde_missing <- function(waarde) {
  sum(is.na(waarde))
}

#' @export
#' @rdname mon_info
mon_waarde_nul <- function(waarde) {
  sum(waarde <= 0)
}

#' @export
#' @rdname mon_info
mon_waarde_som <- function(waarde) {
    sum(waarde, na.rm = TRUE)
}

#' @export
#' @rdname mon_info
mon_waarde_max <- function(waarde) {
  max(waarde, na.rm = TRUE)
}


# Monster taxonlevels -------------------------------------------------------------

#' @export
#' @rdname mon_info
mon_level_kd_species <- function(naam) {
  # Cultivars, Subspecies, Varietas en Forma
  sum(autecodata::get_twn_taxonlevel(naam) < "Species", na.rm = TRUE)
  #length(get_twn_taxonlevel(.naam))
}

#' @export
#' @rdname mon_info
mon_level_gd_species <- function(naam) {
  # Alles behalve Nothospecies, Species, Cultivars, Subspecies, Varietas en Forma
  sum(autecodata::get_twn_taxonlevel(naam) >= "Species combi", na.rm = TRUE)
}

