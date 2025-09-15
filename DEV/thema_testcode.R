library(HHSKwkl)
library(tidyverse)
library(glue)

fys_chem <- data_online("fys_chem.rds") %>% filter(mp %in% c("S_0010", "S_0007", "S_0005", "S_0016"), parnr == 1, year(datum) > 2015)

p <- 
  fys_chem %>% 
  filter(mp == "S_0007") %>% 
  ggplot(aes(datum, waarde)) +
  geom_point() +
  geom_line() 

my_theme <- theme() +
  complete_theme(default = theme_light())

p +
  my_theme
  
