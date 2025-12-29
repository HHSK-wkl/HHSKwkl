
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



# Open GIS-data -----------------------------------------------------------


#' Haal Open GIS-data van HHSK op
#' 
#' Met deze functie kan GIS-data van HHSK worden gedownload. Voor de beschikbare datasets zie
#' `gisdata_info` of gebruik de interactieve versie van de functie met `dataset = NULL`.
#'
#' @param dataset Code voor de gewenste dataset. Zie ook `gisdata_info`. `NULL` geeft een keuze menu.
#'
#' @returns Een geo-object met de gekozen dataset.
#' @export
#'
#' @examples
#' 
#' \dontrun{
#' get_open_gisdata("krw_2022_2027")
#' }
#' 
get_open_gisdata <- function(dataset = NULL){
  if (is.null(dataset)) {
    dataset_nr <- utils::menu(gisdata_info$code)
    
    dataset <- gisdata_info[[dataset_nr, "code"]]
    
    message(paste0('Haal de data direct op met `get_open_gisdata("', 
                   dataset, 
                   '")`'))
  }
  
  gisdata_info %>% 
    dplyr::filter(code == dataset) %>% 
    .[[1, "url_lang"]] %>% 
    sf::read_sf()
  
}


# Brand HHSK --------------------------------------------------------------

#' De quarto brand-extensie en templates voor HHSK
#'
#' @returns Installeert de brand extensie in de working directory of installeert de templates
#' @export
#'
#' @examples
#' 
#' \dontrun{
#'  get_brand_hhsk()
#' }
get_brand_hhsk <- function(){
  quarto::quarto_add_extension("HHSK-wkl/brand_hhsk", no_prompt = TRUE)
}


