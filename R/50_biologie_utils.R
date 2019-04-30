### These functions depend on the package autecodata which can be found on
### https://github.com/RedTent/autecodata

# Check autecodata --------------------------------------------------------

#' Check autecodata
#'
#' Deze functie checkt of autecodata is geinstalleerd en geeft een foutmelding
#' als dat niet zo is
#'
#' @return Niets of een foutmelding als auteocdata niet is geinstalleerd.
#'
check_autecodata <- function(){
  if (!requireNamespace("autecodata", quietly = TRUE)) {
    stop("Deze functie werkt alleen als het package autecodata is geinstalleerd.
         Dit package kan worden gedownload op https://github.com/RedTent/autecodata")}}


# Toevoegen TWN-voorkeurnamen ---------------------------------------------

#' Toevoegen TWN-voorkeurnamen
#'
#' Deze functie voegt op basis van de TWN-lijst de voorkeurnamen toe aan een
#' dataframe. Deze functie maakt gebruik van de dataset twn_lijst uit het package autecodata.
#'
#' @param df Een dataframe met biologische data
#' @param naam_orig Naam van de kolom met originele namen. Dit argument is
#'   quoted. Default is `naam`
#' @param naam_doel Naam van de kolom waar de voorkeurnamen in moeten komen. Dit
#'   argument is quoted. Default is `naam_voorkeur`
#'
#' @note
#'
#' Deze functie is afhankelijk van de beschikbaarheid van de package autecodata. Dit kan gedownload worden op [https://github.com/RedTent/autecodata](https://github.com/RedTent/autecodata)
#'
#' Bij een ongeldige TWN-naam geeft deze functie een `NA`.
#'
#' De namen zijn hoofdlettergevoelig.
#'
#' @return Een dataframe met daaraan de voorkeurnamen toegevoegd.
#' @export
#'
#' @seealso 
#' [autecodata::twn_lijst]
#'
#' @examples
#' \dontrun{
#'
#' bio %>% add_twn_voorkeurnaam(naam_orig = naam, naam_doel = naam_voorkeur)
#'
#' }
#' 
add_twn_voorkeurnaam <- function(df, naam_orig = naam, naam_doel = naam_voorkeur){
  check_autecodata()
  
  naam_orig <- dplyr::enquo(naam_orig)
  naam_doel <- dplyr::enquo(naam_doel)
  
  df <- df %>% dplyr::mutate(!!naam_doel := get_twn_voorkeur(!!naam_orig))
  df
}





# Find  parents ----------------------------------------------------









# find_matching_parent <- function(naam_bron, namen_doel){
#   check_autecodata()
#   
#   if (naam_bron %in% namen_doel) {return(naam_bron)}
#   
#   
#   temp_naam <- naam_bron
#   
#   # deze blijft nodig om eindeloos aanmaken van de opzoektabel te voorkomen
#   zoek_parent <- autecodata::twn_lijst %>% maak_opzoeker(key = taxonname, value = parentname) 
#     
#   while(!(temp_naam %in% namen_doel) & !is.na(temp_naam) ){}
# }