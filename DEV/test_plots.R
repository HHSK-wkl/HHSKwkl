library(HHSKwkl)
library(tidyverse)
library(glue)
library(systemfonts)

# Data en plots -----------------------------------------------------------

# fys_chem <- readRDS("C:/data/fys_chem.rds") %>% filter(mp %in% c("S_0010", "S_0007", "S_0005", "S_0016"), parnr == 1, year(datum) > 2018)
fys_chem <- data_online("fys_chem.rds") %>% filter(mp %in% c("S_0010", "S_0007", "S_0005", "S_0016"), parnr == 1, year(datum) > 2018)

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