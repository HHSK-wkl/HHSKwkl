# hhskthema ---------------------------------------------------------------


#' HHSK thema
#' 
#' Dit is een HHSK-thema voor ggplot 
#'
#'
#' @return Een thema voor ggplot

#'
#' @name hhskthema
#'
#' @examples
#' \dontrun{
#' 
#' my_ggplot + hhskthema()
#' 
#' }
#' 
NULL

#' @rdname hhskthema
#' @export
hhskthema <- function(){
  #require(ggplot2)
  hhskthema <- ggplot2::theme_light() + ggplot2::theme(
    
    plot.title =    ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    plot.subtitle = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0, size = ggplot2::rel(1.1)),
    plot.caption =  ggplot2::element_text(color = "grey40", face = "italic"),
    
    axis.title =  ggplot2::element_text(color = "grey40"),
    axis.text =   ggplot2::element_text(color = "grey40"),
    axis.ticks =  ggplot2::element_line(color = "grey40"),
    axis.line = ggplot2::element_line(color = "grey40", linewidth = 0.5),
    
    panel.border =     ggplot2::element_blank(),#ggplot2::element_rect(color = hhskblauw, size = 1),
    panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", linewidth = 0.5),
    panel.grid.minor = ggplot2::element_blank(),#ggplot2::element_line(color = "grey60", linetype = "dotted", size = 0.5),
    
    legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    legend.text =  ggplot2::element_text(color = "grey40"),
    
    strip.background = ggplot2::element_rect(fill = NA, colour = "grey50"),
    strip.text =       ggplot2::element_text(face = "bold", color = "grey50")
  )
  hhskthema
}

#' @rdname hhskthema
#' @export
hhskthema_kaart <- function(){
  #require(ggplot2)
  hhskthema <- ggplot2::theme_light() + ggplot2::theme(
    
    plot.title    = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    plot.subtitle = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0, size = ggplot2::rel(1.1)),
    plot.caption  = ggplot2::element_text(color = "grey40", face = "italic"),
    plot.title.position = "plot",
    
    axis.title =  ggplot2::element_text(color = "grey40"),
    axis.text  =  ggplot2::element_blank(),
    axis.ticks =  ggplot2::element_blank(),
    axis.line  =  ggplot2::element_blank(),
    
    panel.border     = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    
    legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    legend.text  = ggplot2::element_text(color = "grey40"),
    
    strip.background = ggplot2::element_rect(fill = NA, colour = "grey50"),
    strip.text       = ggplot2::element_text(face = "bold", color = "grey50")
  )
  hhskthema
}

#' @rdname hhskthema
#' @export
thema_hor_bar <-
  hhskthema() +
  ggplot2::theme(axis.ticks.y           = ggplot2::element_blank(),
                 panel.grid.major.y     = ggplot2::element_blank(),
                 axis.line.y            = ggplot2::element_blank(),
                 plot.title.position    = "plot",
                 plot.caption.position  = "plot",
                 plot.subtitle          = ggplot2::element_text(face = "italic"))

#' @rdname hhskthema
#' @export
thema_vert_bar <-
  hhskthema() +
  ggplot2::theme(axis.ticks.x           = ggplot2::element_blank(),
                 panel.grid.major.x     = ggplot2::element_blank(),
                 axis.line.x            = ggplot2::element_blank(),
                 plot.title.position    = "plot",
                 plot.caption.position  = "plot",
                 plot.subtitle          = ggplot2::element_text(face = "italic"))

#' @rdname hhskthema
#' @export
thema_line_facet <-
  hhskthema() +
  ggplot2::theme(panel.grid.major.x    = ggplot2::element_blank(),
                 plot.title.position   = "plot",
                 plot.caption.position = "plot",
                 plot.subtitle         = ggplot2::element_text(face = "italic"),
                 panel.spacing         = unit(40, "points"),
                 strip.background      = ggplot2::element_rect(fill = NA, colour = NA),
                 strip.text            = ggplot2::element_text(face = "bold", color = "grey50", size = 12)
  )

#' @rdname hhskthema
#' @export
thema_test <- function(){
  
  check_ruda_aanwezig()
  
  systemfonts::register_variant(
    name = "Ruda Title",
    family = "Ruda",
    weight = "heavy"
  )
  
  thema <-
    ggplot2::theme(
      geom = ggplot2::element_geom(color = blauw, fill = blauw_l, accent = oranje),
      text = ggplot2::element_text(family = "Ruda"),
      title = ggplot2::element_text(family = "Ruda Title", color = blauw_d),
      
      plot.title =    ggplot2::element_text(color = blauw_d, hjust = 0, size = ggplot2::rel(1.5)),
      plot.subtitle = ggplot2::element_text(face = "bold", color = "grey50", hjust = 0, size = ggplot2::rel(1.1)),
      plot.caption =  ggplot2::element_text(color = "grey40", size = ggplot2::rel(0.9)),
      
      axis.title =  ggplot2::element_text(color = "grey40"),
      axis.text =   ggplot2::element_text(color = "grey40", size = ggplot2::rel(0.9)),
      axis.ticks =  ggplot2::element_line(color = "grey40"),
      axis.line = ggplot2::element_line(color = "grey40", linewidth = 0.3),
      
      panel.border =     ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_blank(),
      
      legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
      legend.text =  ggplot2::element_text(color = "grey40"),
      
      strip.background = ggplot2::element_rect(fill = "#E1FAFDFF", colour = NA),
      strip.text =       ggplot2::element_text(family = "Ruda Title", color = blauw_d, size = ggplot2::rel(0.9))
      
    ) |>
    ggplot2::complete_theme(default = ggplot2::theme_light())
  
  thema
  
}

check_ruda_aanwezig <- function(){
  
  ruda_aanwezig <- 
    systemfonts::system_fonts()  %>% 
    dplyr::filter(family == "Ruda")  %>% 
    nrow() %>% 
    {. > 0}
  
  boodschap <- paste0(
    "Het thema maakt gebruik van het Google-font Ruda: dit is niet geinstalleerd.\n",
    "Ruda is te installeren vanuit", system.file("extdata/fonts"), ".")
  
  if (!ruda_aanwezig) message(boodschap)
  
  invisible(ruda_aanwezig)
  
}