
# Waterschapsgrens --------------------------------------------------------

#' Waterschapsgrens
#' 
#' Waterschapsgrens als bestand
#' 
#' @param pad een string voor het pad op de ws_grens.gpkg op te slaan. ordt aangemaakt als het nog niet bestaat. 
#' Default is de map *data*.
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
  if (!dir.exists(pad)) dir.create(pad)
  
  bestandsnaam <- system.file("extdata/ws_grens.gpkg", package = "HHSKwkl")
  file.copy(from = bestandsnaam, to = pad, overwrite = TRUE)
  
}


# Logo --------------------------------------------------------------------

#' Logo's HHSK
#' 
#' Logo's van HHSK als bestand
#' 
#' @param pad Het pad op de logo's op te slaan. Wordt aangemaakt als het nog niet bestaat. Default is de map *images*.
#'
#' @return slaat logo_kleur.png en logo_wit.png op op de gekozen locatie.
#'
#' @examples
#' 
#' \dontrun{
#' get_logo("images")
#' }
#' 
#' @export
get_logo <- function(pad = "images"){
  if (!dir.exists(pad)) dir.create(pad)
  
  bestandsnamen <- system.file(c("extdata/logo_kleur.png", "extdata/logo_wit.png", "extdata/favicon.svg"), package = "HHSKwkl")
  file.copy(from = bestandsnamen, to = pad, overwrite = TRUE)
  
}

# Brand -------------------------------------------------------------------



