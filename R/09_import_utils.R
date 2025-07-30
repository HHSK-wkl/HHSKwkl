#' Synchroniseer bestanden met een bronlocatie
#' 
#' Deze functie is bedoeld om data van een centrale locatie te synchroniseren met een projectmap.
#'
#' @param filenames Vector of lijst met bestanden. Als deze leeg blijft worden 
#' alle bestanden uit `origin` gekopieerd.
#' @param origin Bronlocatie. 
#' @param destination Doellocatie. Default is `"data"`
#'
#' @return Synchronisatie van bestanden van de bronlocatie met de doellocatie.
#' @export
#'
#' @examples
#' 
#' \dontrun{
#' 
#' copy_data()
#' copy_data("fys_chem.csv")
#' copy_data("fys_chem.csv", origin = "P:/Dawaco/FME", destination = "data")
#' }
#' 
#' 
#' 
copy_data <- function(filenames = NULL, origin, destination = "data") {
  
  dest_trunc <- stringr::str_trunc(destination, width = 50, side = "center")
  
  copy_fun <- function(filename, origin, destination) {
    
    origin_path <- file.path(origin, filename)
    destination_path <- file.path(destination, filename)
    
    make_copy <- !file.exists(destination_path) | (file.info(origin_path)$mtime > file.info(destination_path)$mtime)
    
    if (make_copy) {
      
      copy_success <- file.copy(from = origin_path, to = destination_path, overwrite = TRUE)
      
      if (!copy_success) stop(paste("Synchroniseren van", filename, "is niet gelukt"))
      message(paste0(filename, " gekopieerd naar /", dest_trunc))
    } else {message(paste0(filename, " staat reeds in /", dest_trunc)) }
    
  }
  
  if (is.null(filenames)) filenames <- list.files(origin)
  
  purrr::walk(filenames, copy_fun, origin = origin, destination = destination)
  
}




