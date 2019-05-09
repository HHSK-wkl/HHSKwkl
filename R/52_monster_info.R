# monsterdiagnostiek - compleetheid, duplicaten, twnconformiteit
# monsterbeschrijving - aantal soorten, geslachten e.d 
# monsterverrijking -
# diversiteitsindexen,?beoordelingen? omgevingsfactoren etc.
#
# basisfuncties die uitgaan van  1 monster. Overkoepelende functies met group_by
# en een verzameling basisfuncties

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

mon_summary <- function(df) {
  get_twn_status <- fun_twn_status() 

  summarise(df, 
            taxa_n               = mon_taxa_n(naam),
            taxa_missing         = mon_taxa_missing(naam),
            taxa_n_uniek         = mon_taxa_n_uniek(naam),
            taxa_n_dubbel        = mon_taxa_n_dubbel(naam),
            waarde_tot           = mon_waarde_tot(waarde),
            waarde_max           = mon_waarde_max(waarde),
            waarde_missing       = mon_waarde_missing(waarde),
            waarde_nul           = mon_waarde_nul(waarde),
            twn_niet_in_twn      = mon_twn_niet_in_twn(naam),
            twn_status_afwijkend = mon_twn_status_afwijkend(naam, get_twn_status),
            twn_synoniem         = mon_twn_synoniem(naam, get_twn_status),
            twn_aggregaat        = mon_twn_aggregaat(naam, get_twn_status),
            twn_fout             = mon_twn_fout(naam, get_twn_status)
  )
}



mon_taxa_n <- function(naam) {
  length(naam)
}

mon_taxa_missing <- function(naam) {
  sum(is.na(naam))
}

mon_taxa_n_uniek <- function(naam) {
  n_distinct(naam)
}

mon_taxa_n_dubbel <- function(naam) {
  dplyr::tibble(naam) %>% 
    dplyr::count(naam) %>% 
    dplyr::filter(n > 1) %>% 
    nrow()
}

mon_twn_niet_in_twn <- function(naam) {
  sum(!(naam %in% autecodata::twn_lijst$taxonname))
}

mon_twn_status_afwijkend <- function(naam, get_twn_status = NULL){
  sum(get_twn_status(naam) != "10", na.rm =TRUE)
}

mon_twn_synoniem <- function(naam, get_twn_status = NULL){
  sum(get_twn_status(naam) == "20", na.rm =TRUE)
}

mon_twn_fout <- function(naam, get_twn_status = NULL){
  sum(get_twn_status(naam) %in% c("30", "91", "92"), na.rm =TRUE)
}

mon_twn_aggregaat <- function(naam, get_twn_status = NULL){
  sum(get_twn_status(naam) == "80", na.rm =TRUE)
}

mon_waarde_missing <- function(waarde) {
  sum(is.na(waarde))
}

mon_waarde_nul <- function(waarde) {
  sum(waarde <= 0)
}

mon_waarde_tot <- function(waarde) {
    sum(waarde, na.rm = TRUE)
}

mon_waarde_max <- function(waarde) {
  max(waarde, na.rm = TRUE)
}

