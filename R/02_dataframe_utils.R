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
#' @importFrom lubridate year month
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
  

# Opzoektabel -------------------------------------------------------------


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
#' @import dplyr
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
#' De functie voegt de latitude en longitude aan een dataframe op basis van coordinaten. Default is
#' van RD-stelsel naar WGS84
#'
#' @param df Dataframe met coordinaten
#' @param x_coord Character. Kolom met de x-coordinaat
#' @param y_coord Character. Kolom met de y-coordinaat
#' @param source_crs Coordinaten Referentie Systeem van de bron coordinaten. Default is RD-stelsel.
#' @param goal_crs Coordinaten Referentie Systeem van de doelcoordinaten. Default is WGS84.
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
                         source_crs = "+init=EPSG:28992", goal_crs = "+init=EPSG:4326"){
  
  df %>% 
    dplyr::mutate(latlong = purrr::map2(.[[x_coord]], .[[y_coord]], coordinate_conversion, 
                                 source_crs = source_crs, goal_crs = goal_crs)) %>% 
    tidyr::unnest()
}

  
#' Coordinate Conversion
#' 
#' Helper functie voor coordinaten conversie. Deze functie wordt gebruikt door add_lat_long
#'
#' @param x x-coordinaat van de bron
#' @param y y-coordinaat van de bron
#' @param source_crs Coordinaten Referentie Systeem van de bron coordinaten. Default is RD-stelsel.
#' @param goal_crs Coordinaten Referentie Systeem van de doelcoordinaten. Default is WGS84.
#'
#' @return Een dataframe met een long en een lat
#' 
#'
#' @examples
#' \dontrun{
#' 
#' coordinate_conversion(x = 111111, y = 444444)
#' }
coordinate_conversion <- function(x, y, source_crs = "+init=EPSG:28992", goal_crs = "+init=EPSG:4326"){
  
  if ( any(is.na(c(x,y))) ) {return(tibble::tibble(long = NA, lat = NA))}
  
  temp <- data.frame(x,y)
  sp::coordinates(temp) <- ~x+y
  sp::proj4string(temp) <- sp::CRS(source_crs)
  transformed <- as.data.frame(sp::spTransform(temp, goal_crs))
  
  tibble::tibble(long = transformed[1,1], lat = transformed[1,2])
  
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





  