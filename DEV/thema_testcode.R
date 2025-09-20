source("DEV/test_plots.R")


# Thema -------------------------------------------------------------------

thema_test <- function(){
  
  if (check_ruda_aanwezig()) {
    systemfonts::register_variant(
      name = "Ruda Title",
      family = "Ruda",
      weight = "heavy"
    )
    
    systemfonts::register_variant(
      name = "Ruda Bold",
      family = "Ruda",
      weight = "bold"
    )
  }
  thema <-
    ggplot2::theme(
      text = ggplot2::element_text(family = "Ruda Bold", color = "grey50"),
      title = ggplot2::element_text(family = "Ruda Title"),
      line = ggplot2::element_line(color = "grey50"),
      geom = ggplot2::element_geom(color = blauw, fill = blauw_l, accent = oranje),
      
      plot.title =    ggplot2::element_text(color = blauw_d,      size = ggplot2::rel(1.5)),
      plot.subtitle = ggplot2::element_text(family = "Ruda Bold", size = ggplot2::rel(1.1)),
      plot.caption =  ggplot2::element_text(family = "Ruda",      size = ggplot2::rel(0.9)),
      
      axis.title =  ggplot2::element_text(),
      axis.text =   ggplot2::element_text(size = ggplot2::rel(0.9), color = "grey50"),# doesn't inherit
      axis.ticks =  ggplot2::element_line(),
      axis.line = ggplot2::element_line(linewidth = 0.3),
      
      panel.border =     ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_blank(),
      
      legend.title = ggplot2::element_text(face = "bold"),
      legend.text =  ggplot2::element_text(size = ggplot2::rel(0.9)),
      
      strip.background = ggplot2::element_rect(fill = "#E1FAFDFF", colour = NA), # prismatic::clr_lighten(blauw_l_orig, 0.6)
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
    "Ruda is te installeren vanuit ", system.file("extdata/fonts", package = "HHSKwkl"), " .")
  
  if (!ruda_aanwezig) message(boodschap)
  
  invisible(ruda_aanwezig)
  
}

# Testcode ----------------------------------------------------------------
p2 + thema_test()

p + thema_test()


p3 + thema_test()

p4 + thema_test()



# Ruda install ------------------------------------------------------------
# 
# ruda_afwezig <- 
#   systemfonts::system_fonts()  %>% 
#   dplyr::filter(name == "Ruda")  %>% 
#   nrow() %>% 
#   {. == 0}
# 
# if (ruda_afwezig) message("Het thema maakt gebruik van het Google-font Ruda. Ruda  is niet geïnstalleerd. Ruda  is te installeren met xxx")
# 

check_ruda_aanwezig <- function(){
  
  ruda_aanwezig <- 
    systemfonts::system_fonts()  %>% 
    dplyr::filter(family == "Ruda")  %>% 
    nrow() %>% 
    {. > 0}
  
  boodschap <- paste0(
    "Het thema maakt gebruik van het Google-font Ruda: dit is niet geïnstalleerd.\n",
    "Ruda is te installeren vanuit", system.file("extdata/fonts"), ".")
  
  if (!ruda_aanwezig) message(boodschap)
  
  ruda_aanwezig
  
}

