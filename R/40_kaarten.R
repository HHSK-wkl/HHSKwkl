#' Leaflet basiskaart met topo en luchtfoto
#' 
#' Deze functie genereert een basiskaart in leaflet. Aan deze kaart kunnen vervolgens vrij elementen worden toegevoegd
#'
#' @param data Een optioneel dataframe. Zie ook het data-argument in de functie [leaflet::leaflet()]
#' @param type Het type kaart. Opties zijn `"osm"` (default) en `"cartolight"`
#' @param api_key API key voor Carto achtergrond. Zonder key krijgt de achtergrond een watermerk.
#'  Indien NULL wordt `Sys.getenv("CARTO_API_KEY")` geraadpleegd.
#' @param ... Named arguments voor `leaflet()`
#'
#' @return Een leaflet kaart
#' @export
#'
#' @examples
#' 
#' basiskaart()
#' 
basiskaart <- function(data = NULL, type = c("osm", "cartolight"), api_key = NULL, ...) {
  type <- rlang::arg_match(type, c("osm", "cartolight"))
  
  kaartlaag <- function(kaart){
    if (type == "osm") {
      
      leaflet::addProviderTiles(kaart, "OpenStreetMap", group = "Kaart")
      
    } else if (type == "cartolight") {
      
      api_key <- api_key %||% Sys.getenv("CARTO_API_KEY")
      
      if (api_key == "") {
        message("Geen API KEY beschikbaar. Dit resulteert in meldingen op de kaart.\nVerkrijg een API KEY op https://carto.com/basemaps/apikey/ .\nVoor automatisch gebruik van de API KEY: gebruik `usethis::edit_r_environ()`\nen maak een variabele aan met de naam CARTO_API_KEY met als waarde de key (geen spaties).")
        leaflet::addTiles(kaart, "https://basemaps.cartocdn.com/rastertiles/light_all/{z}/{x}/{y}.png", group = "Kaart")
        
      } else {
        leaflet::addTiles(kaart, paste0("https://basemaps.cartocdn.com/rastertiles/light_all/{z}/{x}/{y}.png?key=", api_key), group = "Kaart")
      }
      
    }
  }
  
  leaflet::leaflet(data, ...) %>% 
    kaartlaag() %>% 
    leaflet::addProviderTiles("Esri.WorldImagery", group = "Luchtfoto") %>% 
    leaflet::addLayersControl( baseGroups = c("Kaart", "Luchtfoto"), 
                               options = leaflet::layersControlOptions(collapsed = FALSE),
                               position = "topleft")
}