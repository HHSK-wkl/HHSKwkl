library(tidyverse)
library(sf)

# URL van de ArcGIS FeatureServer
url <- "https://services.arcgis.com/OnnVX2wGkBfflKqu/arcgis/rest/services/VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/0"
url <- "https://services.arcgis.com/OnnVX2wGkBfflKqu/arcgis/rest/services/VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/1"
url <- "https://services.arcgis.com/OnnVX2wGkBfflKqu/ArcGIS/rest/services/VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/0/query?where=1%3D1&outFields=*&f=geojson"
geojson_rd_url <- "https://services.arcgis.com/OnnVX2wGkBfflKqu/ArcGIS/rest/services/VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/0/query?where=1%3D1&outFields=*&f=geojson&outSR=28992"

# Inlezen van de data als sf-object
peilgebieden <- st_read(url)

# Bekijken van de eerste paar rijen
head(peilgebieden)

peilgebieden %>% 
  mutate(opp = st_area(peilgebieden)) %>% 
  as_tibble() %>% View()
  
st_area(peilgebieden)


url_peilafwijkingen <- "https://services.arcgis.com/OnnVX2wGkBfflKqu/ArcGIS/rest/services/VigerendePeilgebiedenEnPeilafwijkingen_HHSK/FeatureServer/1/query?where=1%3D1&outFields=*&f=geojson"

# Inlezen van de data als sf-object
# peilgebieden <- st_read(url)
peilafwijkingen <-  st_read(url_peilafwijkingen)



peilgebieden_rd <- st_read(geojson_rd_url)

st_crs(peilgebieden_rd)  # Controleer of het EPSG:28992 is