library(tidyverse)
library(sf)
library(lobstr)

url <- url_meetpunten_wkn

bepaal_grootte <- function(url){
  read_sf(url) %>% 
    lobstr::obj_size() %>% 
    format()
    
}

bepaal_type <- function(url){
  read_sf(url) %>% 
    sf::st_geometry_type(by_geometry =  FALSE) %>% 
    as.character()
}
  
open_data <- readxl::read_excel("data-raw/open_data_hhsk.xlsx") 
  

open_data_metadata <-
  open_data %>% 
    mutate(type_geometry = map_chr(url_lang, bepaal_type)) %>% 
    mutate(grootte = map_chr(url_lang, bepaal_grootte)) 
  
  

