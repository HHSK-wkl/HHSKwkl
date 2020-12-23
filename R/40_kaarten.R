#' Leaflet basiskaart met topo en luchtfoto
#' 
#' Deze functie genereert een basiskaart in leaflet. Aan deze kaart kunnen vervolgens vrij elementen worden toegevoegd
#'
#' @param data Een optioneel dataframe. Zie ook het data-argument in de functie [leaflet::leaflet()]
#' @param type Het type kaart. Opties zijn `"osm"` (default) en `"cartolight"`
#'
#' @return Een leaflet kaart
#' @export
#'
#' @examples
#' 
#' basiskaart()
#' 
basiskaart <- function(data = NULL, type = c("osm", "cartolight")) {
  type <- rlang::arg_match(type, c("osm", "cartolight"))
  
  leaflet::leaflet(data) %>% 
    {if (type == "osm") {leaflet::addProviderTiles(. ,"OpenStreetMap", group = "Kaart") } else {.}} %>%
    {if (type == "cartolight") {leaflet::addProviderTiles(., "CartoDB.Positron", group = "Kaart") } else {.}} %>%
    leaflet::addProviderTiles("Esri.WorldImagery", group = "Luchtfoto") %>% 
    leaflet::addLayersControl( baseGroups = c("Kaart", "Luchtfoto"), 
                      options = leaflet::layersControlOptions(collapsed = FALSE),
                      position = "topleft")
}