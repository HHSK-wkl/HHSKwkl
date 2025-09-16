library(HHSKwkl)
library(tidyverse)
library(glue)
library(systemfonts)

# Data en plots -----------------------------------------------------------

fys_chem <- readRDS("C:/data/fys_chem.rds") %>% filter(mp %in% c("S_0010", "S_0007", "S_0005", "S_0016"), parnr == 1, year(datum) > 2018)

p <- 
  fys_chem %>% 
  filter(mp == "S_0007") %>% 
  ggplot(aes(datum, waarde)) +
  geom_point() +
  geom_line() +
  # geom_smooth() +
  labs(
    title = "Dit is een wat langere tekst",
    subtitle = "En dit is dan de ondertitel g",
    caption = "Captiontekst g",
  )

p2 <- 
  fys_chem %>% 
  # filter(mp == "S_0007") %>% 
  ggplot(aes(datum, waarde, colour = mp)) +
  geom_point() +
  geom_line() +
  labs(
    title = "Dit is een wat langere tekst",
    subtitle = "En dit is dan de ondertitel g",
    caption = "Captiontekst g",
  )

p3 <- 
  fys_chem %>% 
  # filter(mp == "S_0007") %>% 
  ggplot(aes(y =waarde, group = mp)) +
  geom_boxplot() +
  labs(
    title = "Dit is een wat langere tekst",
    subtitle = "En dit is dan de ondertitel g",
    caption = "Captiontekst g",
  )

p4 <- 
  fys_chem %>% 
  # filter(mp == "S_0007") %>% 
  ggplot(aes(datum, waarde)) +
  geom_point() +
  geom_line() +
  facet_wrap(~mp, axes = "all") +
  labs(
    title = "Dit is een wat langere tekst",
    subtitle = "En dit is dan de ondertitel g",
    caption = "Captiontekst g",
  )


# Thema -------------------------------------------------------------------

thema_test <- function(){
  
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
      
      plot.title =    ggplot2::element_text(color = blauw_d, hjust = 0, size = rel(1.5)),
      plot.subtitle = ggplot2::element_text(face = "bold", color = "grey50", hjust = 0, size = rel(1.1)),
      plot.caption =  ggplot2::element_text(color = "grey40", size = rel(0.9)),
      
      axis.title =  ggplot2::element_text(color = "grey40"),
      axis.text =   ggplot2::element_text(color = "grey40", size = rel(0.9)),
      axis.ticks =  ggplot2::element_line(color = "grey40"),
      axis.line = ggplot2::element_line(color = "grey40", linewidth = 0.3),
      
      panel.border =     ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_blank(),
      
      legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
      legend.text =  ggplot2::element_text(color = "grey40"),
      
      strip.background = ggplot2::element_rect(fill = "#E1FAFDFF", colour = NA),
      strip.text =       ggplot2::element_text(family = "Ruda Title", color = blauw_d, size = rel(0.9))
      
    ) |>
    ggplot2::complete_theme(default = ggplot2::theme_light())
  
  thema
  
}

# Testcode ----------------------------------------------------------------

p + thema_test()

p2 + thema_test()

p3 + thema_test()

p4 + thema_test()

