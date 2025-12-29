library(tidyverse)
devtools::load_all(".")

fys_chem <- data_online("fys_chem.rds")

# extrafont::loadfonts("win")

fys_chem %>% 
  filter(mp %in% c("S_0010"), parnr == 3, year(datum) > 2015) %>% 
  grafiek_basis() +
  labs(caption = "hhskthema()",
       title = "Dit is een wat langere tekst",
       subtitle = "En dit is dan de ondertitel") +
  hhskthema() 

fys_chem %>% 
  filter(mp %in% c("S_0010"), parnr == 3, year(datum) > 2015) %>% 
  grafiek_basis() +
  labs(caption = "hhskthema()",
       title = "Dit is een wat langere tekst",
       subtitle = "En dit is dan de ondertitel") +
  hhskthema() +
  theme(title = element_text(family = "Ruda ExtraBold"),
        plot.title = element_text(colour = grijs, size = 16),
        plot.subtitle = element_text(colour = grijs, face = "italic"))


fys_chem %>% 
  filter(mp %in% c("S_0010"), parnr == 3, year(datum) > 2015) %>% 
  grafiek_basis() +
  labs(caption = "hhskthema()",
       title = "Dit is een wat langere tekst",
       subtitle = "En dit is dan de ondertitel") +
  hhskthema() +
  theme(title = element_text(family = "Ruda Black"),
        plot.title = element_text(colour = grijs, size = 16),
        plot.subtitle = element_text(colour = grijs, face = "italic"))


grid::grid.text(
  "FUTURA 🎉",
  gp = grid::gpar(fontfamily = "Futura", fontface = 3, fontsize = 30)
)


systemfonts::register_variant(
  name = "Ruda Black",
  family = "Ruda",
  weight = "heavy"
)
systemfonts::register_variant(
  name = "Ruda ExtraBold",
  family = "Ruda",
  weight = "ultrabold"
)
