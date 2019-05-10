### These functions depend on the package autecodata which can be found on
### https://github.com/RedTent/autecodata

# Check autecodata --------------------------------------------------------

#' Check autecodata
#'
#' Deze functie checkt of autecodata is geinstalleerd en geeft een foutmelding
#' als dat niet zo is. Dit is een interne functie.
#'
#' @return Niets of een foutmelding als auteocdata niet is geinstalleerd.
#'
check_autecodata <- function(){
  if (!requireNamespace("autecodata", quietly = TRUE)) {
    stop('Deze functie werkt alleen als het package autecodata is geinstalleerd.
         Dit package kan worden gedownload op https://github.com/RedTent/autecodata 
         of direct worden geinstalleerd met `devtools::install_github("RedTent/autecodata")`')}}


# Toevoegen TWN-voorkeurnamen ---------------------------------------------

#' Toevoegen TWN-voorkeurnamen
#'
#' Deze functie voegt op basis van de TWN-lijst de voorkeurnamen toe aan een
#' dataframe. Deze functie maakt gebruik van de dataset twn_lijst uit het
#' package autecodata.
#'
#' @details Deze functie maakt gebruik van de functie [get_twn_voorkeur] om de
#'   voorkeurnaam op te zoeken indien deze beschikbaar is.
#'
#' @param df Een dataframe met biologische data
#' @param naam_orig Naam van de kolom met originele namen. Dit argument is
#'   quoted. Default is `naam`
#' @param naam_doel Naam van de kolom waar de voorkeurnamen in moeten komen. Dit
#'   argument is quoted. Default is `naam_voorkeur`
#'
#' @note
#'
#' Deze functie is afhankelijk van de beschikbaarheid van de package autecodata.
#' Dit kan gedownload worden op
#' [https://github.com/RedTent/autecodata](https://github.com/RedTent/autecodata)
#'
#' Bij een ongeldige TWN-naam geeft deze functie een `NA`.
#'
#' @return Een dataframe met daaraan de voorkeurnamen toegevoegd.
#' @export
#'
#' @seealso [autecodata::twn_lijst]
#'
#' @examples
#' \dontrun{
#'
#' bio %>% add_twn_voorkeurnaam(naam_orig = naam, naam_doel = naam_voorkeur)
#'
#' }
#' 
add_twn_voorkeurnaam <- function(df, naam_orig = naam, naam_doel = naam_voorkeur){
  #check_autecodata() # zit al in get_twn_voorkeur en is hier overbodig geworden
  
  naam_orig <- dplyr::enquo(naam_orig)
  naam_doel <- dplyr::enquo(naam_doel)
  
  df <- df %>% dplyr::mutate(!!naam_doel := get_twn_voorkeur(!!naam_orig))
  df
}





# Find  parents ----------------------------------------------------

# add_matching_parent <- function(df, naam_orig, namen_match, naam_doel = naam_matching_parent){
#   check_autecodata()
#   
#   if (!all(namen_match %in% autecodata::twn_lijst$taxonname)) {warning("Niet alle gezochte soorten komen voor in de TWN-lijst")}
#   
#   df %>% dplyr::mutate(tempnaam)
#   
# }


# find_matching_parent <- function(naam_bron, namen_match){
#   check_autecodata()
# 
#   if (naam_bron %in% namen_doel) {return(naam_bron)}
#   zoek_voorkkeur
#   
#   temp_naam <- get_twn_voorkeur(naam_bron)
# 
#   # deze blijft nodig om eindeloos aanmaken van de opzoektabel te voorkomen
#   zoek_parent <- autecodata::twn_lijst %>% maak_opzoeker(key = taxonname, value = parentname)
#   
# 
#   while (!(temp_naam %in% namen_doel) & !is.na(temp_naam) ) {
#     temp_naam <- zoek_parent(temp_naam)
# 
#   }
#   temp_naam
# }

# add_matching_parent <- function(df, naam_orig = naam, namen_match, naam_doel = naam_matching_parent){
#   check_autecodata()
# 
# 
# # Voorwerk ----------------------------------------------------------------
#                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
#   naam_orig <- dplyr::enquo(naam_orig)
#   naam_doel <- dplyr::enquo(naam_doel)
#   
#   if (!all(namen_match %in% autecodata::twn_lijst$taxonname)) {warning("Niet alle gezochte soorten komen voor in de TWN-lijst")}
#   if (any(is.na(namen_match))) {
#     namen_match <- namen_match[!is.na(namen_match)] 
#     message("NA's verwijderd uit namen_match")
#     }
#   
#   if (all(df$naam_orig %in% namen_match)) return(mutate(df, !!naam_doel := !!naam_orig))
# 
#   opzoeker_voorkeur <- 
#     autecodata::twn_lijst %>% 
#     dplyr::mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
#     maak_opzoeker(key = taxonname, value = refername)
#   
#   opzoeker_parent <- autecodata::twn_lijst %>% maak_opzoeker(key = taxonname, value = parentname)
#   
#   no_match <- function(naam) {!(naam %in% namen_match)}
# 
# 
# # Het echte werk ----------------------------------------------------------
# 
#   df_temp <- df %>% dplyr::mutate(tempnaam1 = !!naam_orig, 
#                                   tempnaam2 = ifelse(no_match(tempnaam1), opzoeker_voorkeur(tempnaam2), tempnaam1))
#   
# }


