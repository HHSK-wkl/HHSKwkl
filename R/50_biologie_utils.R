### These functions depend on the package autecodata which can be found on
### https://github.com/RedTent/autecodata

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


#' Toevoegen TWN-voorkeurnamen
#'
#' Deze functie voegt op basis van de TWN-lijst de voorkeurnamen toe aan een
#' dataframe. Deze functie maakt gebruik van de dataset [autecodata::twn_lijst]
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
#' @examples
#'
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
  
  twn_voorkeurnaam <- autecodata::twn_lijst %>% 
                      dplyr::mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
                      maak_opzoeker(key = taxonname, value = refername)
  
  df <- df %>% dplyr::mutate(!!naam_doel := twn_voorkeurnaam(!!naam_orig))
  df
}

