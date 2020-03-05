#' Render R-markdown documenten op de server
#'
#' De R-server heeft problemen om op het netwerk te renderen. Deze functie omzeilt het
#' probleem door R-markdown documenten eerst lokaal te renderen en daarna to kopieren
#' naar de gewenste locatie.
#'
#' @param rmd_bestand Naam van het R-markdownbestand
#' @param rmd_map Pad van het R-markdownbestand
#' @param output_bestand Naam van het outputbestand
#' @param output_map Pad naar de outputlocatie
#' @param temp_dir Naam van de tijdelijke map. Default is `"C:/JT"`
#' @param ...  Optionele argumenten naar `rmarkdown::render`
#'
#' @note Deze functie is een "hack" om het renderen op de server zonder problemen te
#' laten verlopen. Het zou wenselijker zijn als direct de functie `rmarkdown::render()`
#' kan worden aangeroepen.
#'
#' @return Een gerenderd R-markdownbestand
#' @export
#'
render_server <- function(rmd_bestand, rmd_map, output_bestand, output_map = rmd_map, temp_dir = "C:/JT", ...){

  temp_file <- file.path(temp_dir, output_bestand)

  rmarkdown::render(input = file.path(rmd_map, rmd_bestand),
                    intermediates_dir = temp_dir,
                    output_file = temp_file,
                    ...)

  file.copy(temp_file, to = output_map, overwrite = TRUE)

  file.remove(temp_file)
}
