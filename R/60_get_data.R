
#' Waterschapsgrens
#' 
#' Waterschapsgrens als dataframe of als bestand
#' 
#' @param crs optionele CRS-code als getal voor conversie van de CRS
#' @param pad een string voor het pad op de ws_grens.gpkg op te slaan. Default is de map *data*.
#'
#' @return `ws_grens()` geeft een sf dataframe met de waterschapsgrens. 
#' 
#' `get_ws_grens()` slaat ws_grens.gpkg op de gekozen locatie.
#'
#' @name ws_grens
#'
#' @examples
#' 
#' \dontrun{
#' ws_grens(crs = 4326)
#' 
#' get_ws_grens("data")}
#' 


#' @export
#' @rdname ws_grens
ws_grens <- function(crs = NULL) {
  bestandsnaam <- system.file("extdata/ws_grens.gpkg", package = "HHSKwkl")
  ws_grens <- sf::st_read(bestandsnaam, crs = 28992, quiet = TRUE)
  
  if (!is.null(crs)) ws_grens <- sf::st_transform(ws_grens, crs)
  
  ws_grens
  
}

#' @export
#' @rdname ws_grens
get_ws_grens <- function(pad = "data"){
  bestandsnaam <- system.file("extdata/ws_grens.gpkg", package = "HHSKwkl")
  file.copy(from = bestandsnaam, to = pad, overwrite = TRUE)
  
}



