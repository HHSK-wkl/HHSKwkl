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



