library(HHSKwkl)
library(tidyverse)
library(glue)

fys_chem <- data_online("fys_chem.rds") %>% filter(mp %in% c("S_0010", "S_0007", "S_0005", "S_0016"), parnr == 1, year(datum) > 2015)

p <- 
  fys_chem %>% 
  filter(mp == "S_0007") %>% 
  ggplot(aes(datum, waarde)) +
  geom_point() +
  geom_line() +
  # geom_smooth() +
  labs(
    title = "Dit is een wat langere tekst",
    subtitle = "En dit is dan de ondertitel",
    caption = "Captiontekst",
  )

p2 <- 
  fys_chem %>% 
  # filter(mp == "S_0007") %>% 
  ggplot(aes(datum, waarde, colour = mp)) +
  geom_point() +
  geom_line() +
  labs(
    title = "Dit is een wat langere tekst",
    subtitle = "En dit is dan de ondertitel",
    caption = "Captiontekst",
  )

p3 <- 
  fys_chem %>% 
  # filter(mp == "S_0007") %>% 
  ggplot(aes(y =waarde, group = mp)) +
  geom_boxplot()


my_theme <- 
  theme(
    geom = element_geom(color = blauw, fill = blauw_l, accent = oranje),
    
    plot.title =    ggplot2::element_text(color = "grey50", face = "bold", hjust = 0, size = rel(1.5)),
    plot.subtitle = ggplot2::element_text(color = "grey50", face = "bold.italic", hjust = 0, size = rel(1.1)),
    plot.caption =  ggplot2::element_text(color = "grey40", face = "italic"),
    
    axis.title =  ggplot2::element_text(color = "grey40"),
    axis.text =   ggplot2::element_text(color = "grey40"),
    axis.ticks =  ggplot2::element_line(color = "grey40"),
    axis.line = ggplot2::element_line(color = "grey40", linewidth = 0.3),
    
    panel.border =     ggplot2::element_blank(),#ggplot2::element_rect(color = hhskblauw, size = 1),
    panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", linewidth = 0.3),
    panel.grid.minor = ggplot2::element_blank(),#ggplot2::element_line(color = "grey60", linetype = "dotted", size = 0.5),
    
    legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    legend.text =  ggplot2::element_text(color = "grey40"),
    
    strip.background = ggplot2::element_rect(fill = NA, colour = "grey50"),
    strip.text =       ggplot2::element_text(face = "bold", color = "grey50")
    
    
    
  ) %>% 
  complete_theme(default = theme_light())

p +
  my_theme
  
p2 + my_theme

p3 + my_theme

# hhskthema <- function(){
#   #require(ggplot2)
#   hhskthema <- ggplot2::theme_light() + ggplot2::theme(
#     
#     plot.title =    ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
#     plot.subtitle = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0, size = ggplot2::rel(1.1)),
#     plot.caption =  ggplot2::element_text(color = "grey40", face = "italic"),
#     
#     axis.title =  ggplot2::element_text(color = "grey40"),
#     axis.text =   ggplot2::element_text(color = "grey40"),
#     axis.ticks =  ggplot2::element_line(color = "grey40"),
#     axis.line = ggplot2::element_line(color = "grey40", linewidth = 0.5),
#     
#     panel.border =     ggplot2::element_blank(),#ggplot2::element_rect(color = hhskblauw, size = 1),
#     panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", linewidth = 0.5),
#     panel.grid.minor = ggplot2::element_blank(),#ggplot2::element_line(color = "grey60", linetype = "dotted", size = 0.5),
#     
#     legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
#     legend.text =  ggplot2::element_text(color = "grey40"),
#     
#     strip.background = ggplot2::element_rect(fill = NA, colour = "grey50"),
#     strip.text =       ggplot2::element_text(face = "bold", color = "grey50")
#   )
#   hhskthema
# }