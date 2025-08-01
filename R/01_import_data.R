#' Download en lees een online RDS-bestand
#' 
#' Deze functie download een .rds bestand van de FTP-server en leest het in.
#'
#' @param file Bestandsnaam van het rds bestand om te downloaden en in te lezen. 
#' @param url URL van de bronlocatie. Default is de FTP-server van HHSK
#'
#' @return Een R-object
#' @export
#'
#' @examples
#' 
#' \dontrun{
#' fys_chem <- data_online("fys_chem.rds")
#' }
data_online <- function(file, url = NULL){
  if (tolower(tools::file_ext(file)) != "rds") stop("data_online() kan alleen RDS-bestanden inlezen.")
  
  url <- url %||% "https://www.schielandendekrimpenerwaard.nl/kaart/waterkwaliteit/alle_wkl_metingen/data"
  
  url <- paste0(url, "/", file)
  
  temp <- tempfile() 
  httr2::request(url) |> httr2::req_perform(path = temp)
  res <- readRDS(temp)
  unlink(temp)
  res
}


#' Download data van FTP-server
#'
#' @param files Een character-vector met bestandsnamen
#' @param destination Map waar de data opgeslagen moet worden.
#' @param url URL van de FTP-server
#'
#' @return Databestanden op de gekozen locatie.
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' download_data(c("fys_chem.rds", "meetpunten.rds"))
#' }
#' 
download_data <- function(files, destination = "data", 
                          url = NULL){
  
  url <- url %||% "https://www.schielandendekrimpenerwaard.nl/kaart/waterkwaliteit/alle_wkl_metingen/data"
  
  for(filename in files) {
    url_full <- file.path(url, filename)
    httr2::request(url_full) |>
      httr2::req_perform(path = file.path(destination, filename))
  }
}
