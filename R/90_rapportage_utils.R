#' Nederlandse labels voor Datatable 
#' 
#' Deze functie stelt in [base::options()] een aantal opties in die zorgen voor Nederlandse labels 
#' bij het gebruik van [DT::datatable]
#'
#' @return Aanpassing in [base::options()]
#' @export
#'
#' @examples
#' 
#' dt_labels_nederlands
#' 
dt_labels_nederlands <- function() {
  options(DT.options = list(
    language = list(
      paginate = list(previous = 'Vorige', `next` = 'Volgende'),
      search = "Zoeken",
      decimal = ",",
      info = 'Rijen _START_ tot _END_ | Totaal: _TOTAL_ rijen',
      lengthMenu = "Toon _MENU_ rijen"
    )
  ))
  
}



#' HTML link naar grafiek van een meetpunt
#'
#' @param mp De meetpuntcode
#' @param link_tekst Optionele tekst
#'
#' @return HTML-tekst met een link naar een grafiek
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' link_grafiek("S_0067", "onzintekst")
#'
#' }
link_grafiek <- function(mp, link_tekst = "Grafiek"){
  adres <- paste0("https://www.schielandendekrimpenerwaard.nl/kaart/waterkwaliteit/wkl_gegevens_op_kaart/grafieken/", mp, ".pdf")
  paste0("<a  href=",
         adres,
         ' target="_blank" >',
         link_tekst,
         '</a>')
}