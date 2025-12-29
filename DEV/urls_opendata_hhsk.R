library(tidyverse)
library(sf)

bouw_url <- function(tussen_url){
  
  paste0("https://services.arcgis.com/OnnVX2wGkBfflKqu/arcgis/rest/services/",
         tussen_url,
         "/query?outFields=*&where=1%3D1&f=geojson&outSR=28992"
  )
}

# Diverse
url_krw_2022_2027 <- bouw_url("KRW_vastgesteld_2022_2027/FeatureServer/0")
url_riooloverstort <- bouw_url("Riooloverstort/FeatureServer/0")
url_ecokleurenkoers_2025 <- bouw_url("Ecokleurenkoers_2025/FeatureServer/0")
url_oppervlaktewater_lijnen <- bouw_url("Oppervlaktewater_Categorie/FeatureServer/1")
url_oppervlaktewater_vlakken <- bouw_url("Oppervlaktewater_Categorie/FeatureServer/2")

# Legger
url_legger_sluis <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/0")
url_legger_gemaal <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/1")
url_legger_stuw <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/2")
url_legger_vaste_dam <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/3")
url_legger_inlaat <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/4")
url_legger_hydro_object_kw <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/5")
url_legger_hydro_object <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/6")
url_legger_oppervlaktewaterlichaam <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/7")
url_legger_bergingsgebied <- bouw_url("Vigerende_Legger_Watersystemen/FeatureServer/8")

# Peilbeheer
url_peilbesluiten <- bouw_url("Peilbesluiten/FeatureServer/0")
url_peilgebieden <- bouw_url("VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/0")
url_peilafwijkingen <- bouw_url("VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/1")
url_praktijkpeilgebieden <- bouw_url("Praktijkpeilgebieden_HHSK/FeatureServer/0")
url_meetpunten_wkn <- bouw_url("Peilbeheer_HHSK/FeatureServer/0")
url_peilschalen <- bouw_url("Peilbeheer_HHSK/FeatureServer/1")

# Waterkwaliteitsmeetpunten
url_meetpunten_regulier <- bouw_url("Waterkwaliteitsmeetpunt/FeatureServer/0")

# Regulier (0)
# KRW (1)
# Quickscan (2)
# Vlakdekkend (3)
# KWA (4)
# Diepteprofiel (5)
# NVO (6)
# Vis (7)
# Maaibeheer (8)
# Stadswater (9)
# Gebiedsgerichte aanpak (10)
# Ad Hoc (11)
# Handhaving (12)
# Overig (13)


# Kunstwerken
url_beheer_sluis <- bouw_url("HHSK_Kunstwerken/FeatureServer/0")
# Sluis (0)
# Aquaduct (1)
# Gemaal (2)
# Stuw (4)
# Stuw Lijn (5)
# Vaste dam (7)
# Afsluitmiddel (8)
# Duiker (10)
# Duiker Punt (11)
# Inlaat (13)
# Inlaat Punt (14)
# Sifon (16)
# Sifon Punt (17)
# Brug (18)
# Put (19)
# Coupure (20)
# Kwelscherm (21)
# Drainage Punt (23)
# Drainage (24)
# Tunnel Punt (26)
# Tunnel Lijn (27)
# Wandconstructie Punt (29)
# Wandconstructie Lijn (30)
# Wandconstructie Vlak (31)
# Verankering Lijn (32)

st_read(url_peilschalen)

mp_reg <- st_read(url_meetpunten_regulier) 

mp_reg %>% 
  st_transform(crs = 4326) %>% 
  HHSKwkl::basiskaart() %>% 
  leaflet::addCircleMarkers()


# legger_sluis <- st_read(url_legger_sluis) 
# beheer_sluis <- st_read(url_beheer_sluis)
# 
# st_read(url_peilschalen) %>%
#   st_transform(crs = 4326) %>%
#   HHSKwkl::basiskaart() %>%
#   leaflet::addCircleMarkers(label = ~CODE)
#   
# st_read(url_meetpunten_wkn) %>%
#   st_transform(crs = 4326) %>%
#   HHSKwkl::basiskaart() %>%
#   leaflet::addCircleMarkers(label = ~CODE)

st_read(url_legger_bergingsgebied)
x <- st_read(url_krw_2022_2027)

x %>% select(CODE, NAAM) %>% HHSKwkl::maak_opzoeker()
