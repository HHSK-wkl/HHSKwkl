#' Leaflet basiskaart met topo en luchtfoto
#' 
#' Deze functie genereert een basiskaart in leaflet. Aan deze kaart kunnen vervolgens vrij elementen worden toegevoegd
#'
#' @param data Een optioneel dataframe. Dataframe wordt doorgeleid naar de functie [leaflet::leaflet()]
#'
#' @return Een leaflet kaart
#' @export
#'
#' @examples
#' 
#' basiskaart()
#' 
basiskaart <- function(data = NULL) {
  leaflet::leaflet(data) %>% 
    leaflet::addProviderTiles(leaflet::providers$OpenStreetMap, group = "Kaart") %>% 
    leaflet::addProviderTiles(leaflet::providers$Esri.WorldImagery, group = "Luchtfoto") %>% 
    leaflet::addLayersControl( baseGroups = c("Kaart", "Luchtfoto"), 
                      options = leaflet::layersControlOptions(collapsed = FALSE),
                      position = "topleft")
}