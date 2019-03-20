# Jaar en maand -----------------------------------------------------------

#' Jaar en maand toevoegen
#' 
#' Voeg kolommen toe met het jaar en/of de maand op basis van de datum. De datumkolom moet een datumformaat hebben.
#'
#' @param df Een dataframe waar de kolommen aan toegevoegd moeten worden.
#' @param datum Een character-string met naam van de datum kolom. Default is \code{"datum"}
#'
#' @return De dataframe met een extra kolom \code{jaar} en/of \code{maand}. Beide kolommen zijn integers.
#' 
#' @export
#'
#' @describeIn add_jaar_maand Voeg twee kolommen toe met het jaar en de maand.
#'
#' @examples
#' 
#' \dontrun{
#' 
#' data %>% add_jaar_maand()
#' 
#' data %>% add_jaar()
#' 
#' data %>% add_maand()
#' }
add_jaar_maand <- function(df, datum = "datum"){

  df$jaar <- as.integer(lubridate::year(df[[datum]]))
  df$maand <- as.integer(lubridate::month(df[[datum]]))
  df

}

#' @describeIn add_jaar_maand Voeg een kolom toe met het jaar.
#' @export
add_jaar <- function(df, datum = "datum"){
  
  df$jaar <- as.integer(lubridate::year(df[[datum]]))
  df
  
}

#' @describeIn add_jaar_maand Voeg een kolom toe met de maand.
#' @export
add_maand <- function(df, datum = "datum"){
  
  df$maand <- as.integer(lubridate::month(df[[datum]]))
  df
  
}

#' Toevoegen van de maandnaam
#' 
#' Deze functie voegt de Nederlandse naam van een maand toe aan een dataframe op basis van de datum
#'
#' @param df Dataframe waar een kolom maandnaam aan wordt toegevoegd
#' @param datum Character met de naam van de datum kolom. De default is `"datum"`
#' @param titlecase Logical. Maandnamen met hoofdletter of niet
#'
#' @return Een dataframe met de nieuwe kolom `maandnaam`
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' dataframe <- add_maandnaam(dataframe_orig)
#' dataframe %>% add_maandnaam()
#' dataframe %>% add_maandnaam(datum = "mijn_datumkolom", titlecase = FALSE)
#' }
add_maandnaam <- function(df, datum = "datum", titlecase = FALSE) {
  df$maandnaam <- lubridate::month(df[[datum]], label = TRUE, abbr = FALSE)
  
  if (titlecase) {df$maandnaam <- forcats::fct_relabel(df$maandnaam,stringr::str_to_title)}
  df
}
  

# Opzoeken -------------------------------------------------------------

#' Maak een opzoekfunctie
#'
#' Deze functie maakt opzoekfuncties waarmee een waarde op basis van een sleutel opgezocht kan worden.
#'
#' @param df Een dataframe met de opzoekwaarden.
#' @param key De sleutelkolom om een waarde op te zoeken. Default is de eerste kolom.
#' @param value De kolom met waarden die opgezocht moeten worden. Default is de tweede kolom
#'
#' @return Een functie die gebruikt kan worden voor het opzoeken van waarden.
#' @export
#'
#' @examples
#' 
#' x <- USArrests
#' x$names <- rownames(x)
#' 
#' urbanpop_state <- maak_opzoeker(x, key = names, value = UrbanPop)
#' urbanpop_state("Texas")
#' urbanpop_state("Vermont")
#' 
maak_opzoeker <- function(df, key = 1, value = 2){
  key <- dplyr::enquo(key)
  value <- dplyr::enquo(value)
  opzoektabel <- dplyr::select(df, !!key, !!value) %>% dplyr::distinct() %>% tibble::deframe()
  
  function(key){
    unname(opzoektabel[as.character(key)])
  }
  
}


#' Zoek een waarde op in een opzoektabel
#' 
#' Deze functie kan waarden opzoeken in een tabel. Het is het alternatief voor een hash table, die R helaas niet heeft.
#'
#' @param df Een dataframe die functioneert als opzoektabel
#' @param sleutel De sleutelwaarde, selecteert de rij
#' @param attribuut De kolom(index) waar de op te halen waarde staat
#' @param sleutelkolom Optioneel - de kolom(index) als character of integer. 
#' Standaard staat de eerste kolom als sleutelkolom ingesteld
#'
#' @return De waarde die te vinden is op de betreffende rij of kolom
#' @export
#' 
#' @examples
#' \dontrun{
#' 
#' meetpuntomschrijving <- ophalen_waarde(sleutel = "00016", df = meetpuntendf, attribuut = "mpomsch")
#' 
#' }
opzoeken_waarde <- function(sleutel, df, attribuut, sleutelkolom = 1){
  df[df[[sleutelkolom]] == sleutel, attribuut] %>% 
    c(use.names = FALSE, recursive = TRUE)
}


# Randomize ---------------------------------------------------------------


#' Randomize
#' 
#' Verandert de rijen in willekeurige volgorde
#'
#' @param data Een dataframe
#'
#' @return Hetzelfde dataframe als de input in willekeurige volgorde
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' randomize(mtcars)
#' }
randomize <- function(data) {
  data[sample(nrow(data)),]
  }


# Latitude en longitude ---------------------------------------------------

#' Toevoegen van latidute en longitude
#' 
#' De functie voegt de latitude (Y) en longitude (X) aan een dataframe op basis van coordinaten. Default is
#' van RD-stelsel (EPSG = 28992) naar WGS84 (EPSG = 4326)
#'
#' @param df Dataframe met coordinaten
#' @param x_coord Tekst - Kolom met de x-coordinaat
#' @param y_coord Tekst -  Kolom met de y-coordinaat
#' @param source_crs Coordinaten Referentie Systeem van de broncoordinaten: als integer met EPSG-code of als proj4string.
#' @param goal_crs Coordinaten Referentie Systeem van de doelcoordinaten: als integer met EPSG-code of als proj4string.
#'
#' @return Geeft hetzelfde dataframe met een kolom long en lat toegevoegd.
#' @export
#'
#' @examples
#' 
#' \dontrun{
#' 
#' df %>% add_lat_long()
#' df %>% add_lat_long(x_coord = "my_x_column", y = "my_y_column")
#' 
#' }
add_lat_long <- function(df, x_coord = "x", y_coord = "y", 
                         source_crs = 28992, goal_crs = 4326){
  
  long_lat <- 
    df %>% 
    sf::st_as_sf(coords = c(x_coord, y_coord), remove = FALSE, na.fail = FALSE, crs = source_crs) %>% 
    sf::st_transform(crs = goal_crs) %>%  
    sf::st_coordinates() %>% 
    tibble::as_tibble() %>% 
    dplyr::rename(long = X, lat = Y) 
  
  dplyr::bind_cols(df, long_lat)  
}

  

# my_c --------------------------------------------------------------------

#' Create a single clean vector
#'
#'@description A helper function for the basic \code{c()} function to remove names and create a singular vector.
#' This can be useful if you select a single column from a tibble.
#'
#' @param vector A vector that needs 'cleaning'
#'
#' @return Returns a single clean vector without names
#'
#' @export
#'
my_c <- function(vector){
  c(vector, use.names = FALSE, recursive = TRUE)
}





  