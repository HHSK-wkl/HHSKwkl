#' Bepaal macrofaunagroep
#'
#' Deze functie bepaalt de groep waartoe een macrofaunataxon behoort, De indeling is gebaseerd op
#' het werk van de trainee Jildau Kuiper.
#'
#' @param naam Naam van een taxon. Als het taxon ontbreekt of niet gevonden wordt dan
#' is het resultaat `"Overig"`
#'
#' @returns Een vector met de groepsnamen
#' @export
#'
#' @examples
#' 
#' macev_groep(c("Faxonius", "Procambarus", "TEST", NA))
#' 
macev_groep <- function(naam){
  
  familia <- twn::increase_taxonlevel(naam, "Familia")
  ordo <-    twn::increase_taxonlevel(naam, "Ordo")
  classis <- twn::increase_taxonlevel(naam, "Classis")
  phylum <-  twn::increase_taxonlevel(naam, "Phylum")
  
  groep <- dplyr::case_when(
    familia == "Chironomidae"    ~ "Dansmuggen",
    familia == "Sialidae"        ~ "Slijkvliegen",
    familia == "Simuliidae"      ~ "Kriebelmuggen",
    familia == "Argulidae"       ~ "Visluizen",
    ordo    == "Mysida"          ~ "Aasgarnalen",
    ordo    == "Lepidoptera"     ~ "Vlinders",
    ordo    == "Coleoptera"      ~ "Kevers",
    ordo    == "Trichoptera"     ~ "Kokerjuffers",
    ordo    == "Odonata"         ~ "Libellen",
    ordo    == "Amphipoda"       ~ "Vlokreeften",
    ordo    == "Isopoda"         ~ "Pissebedden",
    ordo    == "Decapoda"        ~ "Tienpotigen (kreeften)",
    ordo    == "Ephemeroptera"   ~ "Haften",  
    ordo    == "Diptera"         ~ "Tweevleugeligen",
    ordo    == "Hemiptera"       ~ "Wantsen",
    ordo    == "Collembola"      ~ "Springstaarten",
    classis == "Bivalvia"        ~ "Tweekleppigen (mosselen)",
    classis == "Gastropoda"      ~ "Slakken",
    classis == "Turbellaria"     ~ "Trilhaarwormen",
    classis == "Polychaeta"      ~ "Borstelwormen",
    classis == "Arachnida"       ~ "Spinachtigen (mijten)",
    classis == "Insecta"         ~ "Insecten",
    classis == "Oligochaeta"     ~ "Borstelarme wormen",
    classis == "Hirudinea"       ~ "Bloedzuigers",
    classis == "Hydrozoa"        ~ "Hydroidpoliepen",
    phylum  == "Crustacea"       ~ "Kreeftachtigen",
    phylum  == "Platyhelminthes" ~ "Platwormen",
    phylum  == "Bryozoa"         ~ "Mosdiertjes",
    phylum  == "Porifera"        ~ "Sponzen",
    phylum  == "Cnidaria"        ~ "Neteldieren",
    phylum  == "Nemertea"        ~ "Snoerwormen",
    phylum  == "Mollusca"        ~ "Weekdieren",
    naam %in% "Plea cryptica"    ~ "Wantsen",
    .default = "Overig"
  )
  
  groep
  
}