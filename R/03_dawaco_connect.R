#' Open een verbinding naar de Dawaco-database
#'
#' @param gebruiker Gebruikersnaam
#' @param wachtwoord_env Environment variabele met het wachtwoord. Als deze niet bestaat wordt er een
#' venster geopend om het wachtwoord in te voeren.
#'
#' @return Een connectie naar de Dawaco-database
#' @export
#'
#' @examples 
#' 
#' \dontrun{
#' 
#' con <- dawaco_connect()
#' 
#' meetpunten <- dplyr::tbl(con, dbplyr::in_schema("DAWACO2018", "MP"))
#' 
#' }
dawaco_connect <- function(gebruiker = "behtent", wachtwoord_env = "DAWACO2018_PWD") {
  ww <- Sys.getenv(wachtwoord_env)
  if (ww == "")  ww <- rstudioapi::askForPassword()
  
  con_string <- paste0("Driver={Oracle in OraClient12_home1_64bit};DBQ=db_dawacop:12503/dawacop;UID=", gebruiker,";PWD=", ww)
  
  con <- DBI::dbConnect(odbc::odbc(), .connection_string = con_string, timeout = 10)
  
}