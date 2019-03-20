# hhskthema ---------------------------------------------------------------


#' HHSK thema
#' 
#' Dit is een HHSK-thema voor ggplot met de kleuren van HHSK
#'
#'
#' @return Een thema voor ggplot
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' my_ggplot + hhskthema()
#' 
#' }
hhskthema <- function(){
  #require(ggplot2)
  hhskthema <- ggplot2::theme_light() + ggplot2::theme(
        
        plot.title =    ggplot2::element_text(color = hhskgroen, face = "bold", hjust = 0.5),
        plot.subtitle = ggplot2::element_text(color = hhskgroen, face = "bold", hjust = 0.5, size = ggplot2::rel(1.1)),
        plot.caption =  ggplot2::element_text(color = hhskgroen, face = "italic"),
          
        axis.title =  ggplot2::element_text(color = hhskblauw, face = "bold"),
        axis.text =   ggplot2::element_text(color = hhskblauw),
        axis.ticks =  ggplot2::element_line(color = hhskblauw),
        axis.line.x = ggplot2::element_line(color = hhskblauw, size = 0.5),
        
        panel.border =     ggplot2::element_rect(color = hhskblauw, size = 1),
        panel.grid.major = ggplot2::element_line(color = hhskgroen, linetype = "dotted", size = 0.5),
        panel.grid.minor = ggplot2::element_line(color = hhskgroen, linetype = "dotted", size = 0.5),
        
        legend.title = ggplot2::element_text(color = hhskgroen, face = "bold", hjust = 0.5),
        legend.text =  ggplot2::element_text(color = hhskblauw),
        
        strip.background = ggplot2::element_blank(),
        strip.text =       ggplot2::element_text(face = "bold", color = hhskblauw)
    )
  hhskthema
}


# grafiek_basis -----------------------------------------------------------


#' Tijdreeksgrafiek
#'
#' Deze functie maakt een tijdreeksgrafiek van 1 meetpunt van 1 parameter.
#'
#' @param data Een dataframe met de gegevens van 1 tijdreeks, dus van 1 meetpunt en 1 parameter. 
#' Kolommen zoals beschreven in [import_fys_chem()]. 
#' @param mp Code van het meetpunt. Deze wordt gebruikt in de titel
#' @param mpomsch Omschrijving van het meetpunt. Deze wordt gebruikt in de titel
#' @param parnaam Naam van de parameter. Deze wordt gebruikt in de ondertitel
#' @param eenheid Eenheid van de parameter. Deze wordt gebruikt als titel van de Y-as
#' @param plot_loess Wel of niet plotten van een LOESS-curve. Default is TRUE
#'
#' @return Een ggplot grafiek. Het is mogelijk om achteraf andere ggplot objecten toe te voegen met `+`
#' @export
#'
#' @examples
grafiek_basis <- function(data, mp = NULL, mpomsch = NULL, parnaam = NULL, eenheid = NULL, plot_loess = TRUE){
  
  #limieten
  range_y <- range(data$waarde, na.rm = TRUE)
  ylimieten <- range_y * c(0, 1.1)
  
  if (range_y[1] * 2 > range_y[2] & range_y[1] != range_y[2]) {ylimieten <- range_y * c(0.95, 1.05)}
  
  #grafiek
  grafiek <- ggplot2::ggplot(data, ggplot2::aes(x = datum, y = waarde)) +
    ggplot2::geom_line(col = hhskblauw) +
    ggplot2::geom_point(col = hhskblauw) +
    ggplot2::geom_point(data = dplyr::filter(data, detectiegrens == "<"), pch = 21, col = hhskblauw, fill = "white") + # detectiegrenswaarden
    
    ggplot2::labs(title = paste0("Meetpunt: ", mp," - ", mpomsch), 
                  subtitle = paste0("Parameter: ", parnaam),
                  x = "", 
                  y = eenheid) +
    ggplot2::scale_y_continuous(limits = ylimieten, expand = c(0,0), oob = scales::rescale_none ) +
    ggplot2::scale_x_date(date_breaks = "years", labels = lubridate::year) + 
    hhskthema()
  
  if (plot_loess) {
    grafiek <- grafiek + 
      ggplot2::geom_smooth(se = TRUE, col = hhskgroen, linetype = "dashed", fill = hhskblauw, alpha = 0.08, fullrange = TRUE)
  }
  
  grafiek
  
}# end of function


# boxplot_basis -----------------------------------------------------------

#' Boxplots per jaar
#' 
#' Deze functie plot een boxplot per jaar van 1 meetpunt van 1 parameter. De functie dient eigenlijk alleen met complete meetjaren te worden gebruikt.
#'
#' @param data Een dataframe met de gegevens van 1 tijdreeks, dus van 1 meetpunt en 1 parameter. 
#' Kolommen zoals beschreven in \code{\link{import_fys_chem}}.
#' 
#' @param meetpuntendf dataframe. Een opzoektabel voor de locatie-omschrijving. 
#' Kolommen zoals beschreven in \code{\link{import_meetpunten}}.
#' Probeert default ook met deze functie een meetpuntendf te maken.
#' 
#' @param parameterdf dataframe. Een opzoektabel voor de uitgebreide parameternaam en eenheid. 
#' Kolommen zoals beschreven in \code{\link{import_parameters}}.
#' Probeert default ook met deze functie een parameterdf te maken.
#' 
#' @param mp character. Optioneel, Meetpuntcode van het betreffende meetpunt. Neemt anders het eerste meetpunt uit `data`
#' 
#' @param parnr character. Optioneel,Parameternummer van het betrffende meetpunt. Neemt anders het eerste parameternummer uit `data`
#' 
#' @param ... Heeft geen functie, maar kan gebruikt worden om overbodige parameters te negeren
#'
#' @return Een ggplot boxplot grafiek. Het is mogelijk om achteraf andere ggplot objecten toe te voegen met `+`
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' basis_boxplot_grafiek <- boxplot_basis(data = chloride_myplace, 
#'                     parameterdf, meetpuntendf) 
#' }
boxplot_basis <- function(data, 
                         
                          meetpuntendf = import_meetpunten(),
                          parameterdf = import_parameters(),
                          mp = NULL,
                          parnr = NULL,
                          ...){

  if (is.null(mp)) {mp <- data[[1,"mp"]]}
  mpomsch <- opzoeken_waarde(df = meetpuntendf, sleutel = mp, attribuut =  "mpomsch", sleutelkolom = "mp")
  
  if (is.null(parnr)) {parnr <- data[[1,"parnr"]]}
  parameternaam <- opzoeken_waarde(df = parameterdf, sleutel = parnr, attribuut = "parnaamlang", sleutelkolom = "parnr")
  eenheid <- opzoeken_waarde(df = parameterdf, sleutel = parnr, attribuut = "eenheid")
  
  min_y <- min(data$waarde)
  max_y <- max(data$waarde)
  if (min_y == max_y) { ylimieten <- c(0, max_y * 1.1)} else if (min_y / (max_y - min_y) > 1) {ylimieten <- c(min_y * 0.95, max_y * 1.05)} else {ylimieten <- c(0, max_y * 1.1)}
  xlabels <- data %>% add_jaar() %>% select(jaar) %>% distinct() %>% my_c()
  
  grafiek <- data %>% add_jaar %>% 
    ggplot2::ggplot(ggplot2::aes(x = jaar, y = waarde, group = jaar)) +
    ggplot2::geom_boxplot(col = hhskblauw, fill = hhskgroen) +
    ggplot2::labs(title = paste("Meetpunt:", mp,"-", mpomsch), subtitle = paste("Parameter:", parameternaam)) +
    ggplot2::ylab(eenheid) +
    ggplot2::scale_y_continuous(limits = ylimieten, expand = c(0,0), oob = scales::rescale_none ) +
    ggplot2::xlab("") +
    ggplot2::scale_x_continuous(breaks = xlabels) + 
    hhskthema() +
    ggplot2::theme(panel.grid.minor.x = ggplot2::element_blank())
  
  grafiek
  
}# end of function



# titelpagina_internet ----------------------------------------------------

#' Titelpagina voor de grafieken op internet
#'
#' Creeert een titelpagina voor grafieken zoals deze worden geproduceerd met [grafiek_basis]. Dient gebruikt te worden binnen een graphic device (bijvoorbeeld `pdf()`).
#'
#' @param inclusief_normen logical Bepaald of de lijnen met normen op de titelpagina worden weergegeven. Default is `TRUE`
#'
#' @importFrom  grid grid.raster grid.polygon grid.lines grid.points grid.text gpar unit
#'
#' @return Een titelpagina voor de grafieken
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' pdf("mijntest.pdf", width = 16, height = 8)
#' titelpagina_internet()
#' print(basisgrafiek)
#' dev.off()
#' }
titelpagina_internet <- function(inclusief_normen = TRUE){

  # Plaatjes ----
  grid.raster(image = logo, x = 0.05, y = 0.87, width = 0.3, just = "left")
  grid.raster(image = schonevoeten, x = 0.5, y = 0.08, width = 0.2)
  
  # Intro ----
  grid.text("Dit document bevat grafieken van de chemische metingen van een meetpunt in het beheergebied van HHSK. \nIn de grafieken zijn de metingen van de afgelopen  10 jaar opgenomen, mits er voldoende metingen beschikbaar waren.\n\nLegenda bij de grafieken:",
            x = 0.1, y = 0.75, just = c("left","top"), gp = gpar())
  
  # Meetwaarden ----
  grid.lines(x = c(0.1,0.2),y = c(0.6,0.6), gp = gpar(lty = 1, col = hhskblauw, lwd = 2))
  grid.points(x = unit(c(0.125, 0.15, 0.175),"npc"), y = unit(c(0.6,0.6, 0.6),"npc"), gp = gpar(col = hhskblauw), pch = 20, size = unit(10, "pt"))
  grid.text("Meetwaarden", x = 0.22, y = 0.6, just = "left")
  
  # Meetwaarden onder rapportagegrens ----
  grid.lines(x = c(0.1,0.2),y = c(0.55,0.55), gp = gpar(lty = 1, col = hhskblauw, lwd = 2))
  grid.points(x = unit(c(0.125, 0.15, 0.175),"npc"), y = unit(c(0.55,0.55, 0.55),"npc"), gp = gpar(col = hhskblauw, fill = "white"), pch = 21, size = unit(8, "pt"))
  grid.text("Meetwaarde onder rapportagegrens", x = 0.22, y = 0.55, just = "left")
  
  # Trendlijn ----
  grid.lines(x = c(0.1,0.2),y = c(0.49,0.49), gp = gpar(lty = 2, col = hhskgroen, lwd = 3))
  grid.polygon(x = c(0.1,0.2,0.2,0.1), y = c(0.47,0.47,0.51,0.51), gp = gpar(fill = hhskblauw, alpha = 0.08))
  grid.text("Trendlijn d.m.v. locale regressie (LOESS). De blauwe band geeft de onzekerheid van de trendlijn weer.\nN.B. De trendlijn geeft het algemene verloop van de getoonde periode weer. De trendlijn heeft geen voorspellende waarde.", x = 0.22, y = 0.49, just = c("left"))
  #grid.text("N.B. De trendlijn geeft het algemene verloop van de getoonde periode weer.De trendlijn heeft geen voorspellende waarde.", x = 0.22, y = 0.47, just = c("left"))
  
  # Normen ----
  if (inclusief_normen) {
  
  grid.text(x = 0.1, y = 0.40, just = "left", "Normering gewasbeschermingsmiddelen  -  Bron: www.rivm.nl/rvs")
  
  # MAC-norm ----
  grid.lines(x = c(0.1,0.2),y = c(0.36,0.36), gp = gpar(lty = 1, col = "red", lwd = 2, alpha = 0.5))
  grid.text("Normwaarde - Maximaal aanvaardbare concentratie", x = 0.22, y = 0.36, just = c("left"))
  
  # P90 norm ----
  grid.lines(x = c(0.1,0.2),y = c(0.32,0.32), gp = gpar(lty = 5, col = "red", lwd = 2, alpha = 0.5))
  grid.text("Normwaarde - 90-percentielwaarde", x = 0.22, y = 0.32, just = c("left"))
  
  # JGM norm ----
  grid.lines(x = c(0.1,0.2),y = c(0.28,0.28), gp = gpar(lty = 2, col = "red", lwd = 2, alpha = 0.5))
  grid.text("Normwaarde - Jaargemiddelde waarde", x = 0.22, y = 0.28, just = c("left"))
  
  
  grid.text("N.B. Soms valt de normwaarde buiten het bereik van de grafiek of is er geen normwaarde beschikbaar.", x = 0.1, y = 0.24, just = c("left"))
  }
}


# norm_lijnen -------------------------------------------------------------

#' Maak en voeg RIVM-normlijnen toe aan een plot
#' 
#' De functie \code{norm_lijnen} vertaalt de normen behorend bij een bepaald parameternummer in normlijnen die toegevoegd kunnen worden aan 
#' een plot. De functie \code{add_norm_lijnen} voegt ze toe aan het plot.
#'
#' @param plot Het plot waar de normlijnen aan toegevoegd moeten worden
#' @param parnr Het nummer van de parameter waar de normen van toegevoegd moeten worden
#' @param normen Een dataframe met de normen zoals geimporteerd kan worden met de functie \code{\link{import_normen_rivm}}
#' 
#' @return een geom-object met normen dat toegevoegd kan worden aan een plot, of een plot waar deze aan toegevoegd zijn.
#' 
#' @describeIn norm_lijnen Creeer normlijnen die aan een plot toegevoegd kunnen worden
#' 
#' @export
#'
#' @examples
#' 
#' \dontrun{
#' 
#' norm_lijnen_object <- norm_lijnen(parnr = 1000, normen = normen)
#' plot_met_normen <- plot + norm_lijnen_object
#' 
#' plot_met_normen <- add_norm_lijnen(plot, parnr = 1000, normen = normen )
#' 
#' plot %>% add_norm_lijnen(parnr = 1000, normen = normen)
#' 
#' }
#' 
norm_lijnen <- function(parnr, normen){
  #require(dplyr)
  #require(ggplot2)
  #require(grid)
  
  norm_sel <- normen %>% dplyr::filter(parnr == !!parnr) #!! zorgt ervoor dat het functie-argument wordt gebruikt en niet de kolomnaam
  norm_JGM <- norm_sel %>% dplyr::select(norm_JGM) %>% as.numeric()
  norm_MAX <- norm_sel %>% dplyr::select(norm_MAX) %>% as.numeric()
  norm_P90 <- norm_sel %>% dplyr::select(norm_P90) %>% as.numeric()
  
  if (sum(is.na(c(norm_JGM, norm_MAX, norm_P90))) == 3) {
    norm_lijnen = grid::grid.null()
    } else {
    norm_lijnen <- ggplot2::geom_hline(yintercept = c(norm_JGM, norm_MAX, norm_P90), lty = c(2,1,5), alpha = 0.5, color = "red")
  }
  
  norm_lijnen
}

#' @describeIn norm_lijnen Voeg normlijnen toe aan een bestaand plot
#' @export
add_norm_lijnen <- function(plot, parnr, normen){
  #require(ggplot2)
  
  plot <- plot + norm_lijnen(parnr, normen)
  plot
  
}

# grafieken_internet ------------------------------------------------------


#' Maak grafieken voor het internet
#'
#' Deze functie maakt per meetpunt een pdf-document met een grafiek voor elke parameter.
#'
#' @param data Een dataframe met ruwe gegevens om grafieken van te maken. Deze moet tenminste de kolommen 
#' mp, parnr, datum, detectiegrens en waarde hebben.
#' @param meetpuntendf Een dataframe met mp en mpomsch voor de titel van de grafiek. Zie ook [import_meetpunten()]
#' @param parameterdf Een dataframe met parnr eenheid en parnaamlang voor de titel van de grafiek. 
#' Zie ook [import_parameters()]
#' @param normen Een dataframe met de normen. Zie ook [import_normen_rivm()]
#' @param plot_normen Logical. Switch om wel geen normen te plotten. Default is \code{TRUE}
#' @param export_pad String. Locatie waar de pdf's geplaatst worden
#' @param lijst_parnrs Een optionele vector met parameternummers die meegenomen worden.
#' @param min_aantal_waarden Het minimale aantal waarnemingen wat vereist is voor een grafiek
#' @param grafiekenfunctie Het is mogelijk om een alternatieve functie op te geven om de grafieken te maken. 
#' De default is [grafiek_basis()]
#'
#' @return Per meetpunt in \code{data} een pdf-document met per parameter een grafiek
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' grafieken_internet(data, meetpuntendf, parameterdf, normen, export_pad = "TEST/GRAF")
#' 
#' }
grafieken_internet <- function(data, 
                               meetpuntendf,
                               parameterdf,
                               normen,
                               plot_normen = TRUE,
                               export_pad = "export/grafieken",
                               lijst_parnrs = NULL,
                               min_aantal_waarden = 12,
                               grafieken_functie = grafiek_basis){
  
  if (is.null(lijst_parnrs)) {lijst_parnrs <- c(1:99, 107, 200:401, 403:505, 507:899, 1000:2999)}
  
  # nadenken welke info df's verplicht moeten zijn
  
  f_mpomsch <- maak_opzoeker(meetpuntendf, mp, mpomsch)
  f_eenheid <- maak_opzoeker(parameterdf, parnr, eenheid)
  f_parnaam <- maak_opzoeker(parameterdf, parnr, parnaamlang)
  
  # overbodige parameters en kolommen verwijderen
  data <- data %>% 
    dplyr::filter(parnr %in% lijst_parnrs) %>% 
    dplyr::group_by(mp, parnr) %>% 
    dplyr::mutate(aantal = n(), 
                  min_is_max = min(waarde, na.rm = TRUE) == max(waarde, na.rm = TRUE),
                  aantal_detectiegrens = sum(detectiegrens == "<", na.rm = TRUE),
                  alleen_detectiegrens = aantal == aantal_detectiegrens) %>%  
    dplyr::filter(aantal >= min_aantal_waarden, !min_is_max, !alleen_detectiegrens) %>% 
    dplyr::select(mp, parnr, datum, detectiegrens, waarde) %>%
    dplyr::ungroup()
  
  # loops om grafieken te maken
  for (meetpunt in sort(unique(data$mp))) {
    print(meetpunt)
    data_mp <- data %>% dplyr::filter(mp == meetpunt)
    
    filename <- paste0(export_pad, "/", meetpunt, ".pdf")
    grDevices::pdf(file = filename, width = 16, height = 8)
    
    titelpagina_internet(inclusief_normen = plot_normen)    
    
    for (parameternr in sort(unique(data_mp$parnr))) {
      
      grafiek <- dplyr::filter(data_mp, parnr == parameternr) %>% 
        grafieken_functie(mp = meetpunt, 
                          mpomsch = f_mpomsch(meetpunt),
                          parnaam = f_parnaam(parameternr),
                          eenheid = f_eenheid(parameternr),
                          plot_loess = parameternr < 1000)
      
      if (parameternr >= 1000 & plot_normen) grafiek <- add_norm_lijnen(grafiek, parameternr, normen)
      
      suppressMessages(print(grafiek))
      
    }# einde parameterloop
    
    grDevices::dev.off()
    
  }#einde meetpuntloop
  
}

