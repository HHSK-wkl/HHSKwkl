
# Waterschapsgrens --------------------------------------------------------

#' Waterschapsgrens
#' 
#' Waterschapsgrens als dataframe of als bestand
#' 
#' @param pad een string voor het pad op de ws_grens.gpkg op te slaan. Default is de map *data*.
#'
#' @return `get_ws_grens()` slaat ws_grens.gpkg op de gekozen locatie.
#'
#' @examples
#' 
#' \dontrun{
#' get_ws_grens("data")
#' }
#' 
#' @export
get_ws_grens <- function(pad = "data"){
  bestandsnaam <- system.file("extdata/ws_grens.gpkg", package = "HHSKwkl")
  file.copy(from = bestandsnaam, to = pad, overwrite = TRUE)
  
}


# Brand -------------------------------------------------------------------



