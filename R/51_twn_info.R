## These functions depend on the package autecodata which can be found on
## https://github.com/RedTent/autecodata


# twn_info ------------------------------------------------------------


#' Opzoeken van de TWN informatie
#'
#' De `fun_twn_*`-functies maken een opzoekfunctie om bij taxonnamen de bijbehorende informatie uit de
#' TWN-lijst op te zoeken. De `get_twn_*`-functies gebruiken deze opzoekfuncties om direct deze informatie
#' uit de TWN-lijst op te halen. Voor herhaaldelijk gebruik zijn de `get_twn_*`-functies echter minder efficient.
#'
#' @details Deze functies accepteren een vector met taxonnamen en retourneren de
#'   betreffende informatie uit de TWN-lijst. Als de taxonnaam niet in de
#'   TWN-lijst voorkomt retourneert de functie `NA`
#'
#'   - `get_twn_voorkeur`: Geeft de voorkeurnaam van het taxon. Als het al de
#'   voorkeurnaam is wordt de originele naam teruggegeven.
#'   - `get_twn_parent`: Geeft de parent van het taxon. 
#'   - `get_twn_status`: Geeft de status van het taxon. 
#'   - `get_twn_localname`: Geeft de Nederlandse naam van het taxon. 
#'   - `get_twn_taxonlevel`: Geeft het taxonlevel van het taxon.
#'
#' @param namen Een vector met taxonnamen.
#'
#' @return Een vector met TWN-informatie. Namen die niet in de TWN worden
#'   gevonden krijgen `NA`.
#'   
#' @note De TWN-lijst is niet altijd volledig consistent. Diverse taxa staan
#'   meerdere malen in de lijst. In dat geval wordt het eerste resultaat
#'   geretourneerd.
#'   
#'   Als een taxon niet de voorkeurnaam is dan ontbreekt er vaak informatie 
#'   zoals de parent van het taxon.
#'
#' @examples
#' get_twn_voorkeur2   <- fun_twn_voorkeur()
#' get_twn_parent2     <- fun_twn_parent()
#' get_twn_status2     <- fun_twn_status()
#' get_twn_localname2  <- fun_twn_localname()
#' get_twn_taxonlevel2 <- fun_twn_taxonlevel()
#'
#' fun_twn_voorkeur()(c("Bufo calamita", "Bufo"))
#'
#' get_twn_voorkeur(c("Bufo calamita", "Bufo"))
#' get_twn_parent(c("Bufo calamita", "Bufo"))
#' get_twn_status(c("Bufo calamita", "Bufo"))
#' get_twn_localname(c("Bufo calamita", "Bufo"))
#' get_twn_taxonlevel(c("Bufo calamita", "Bufo"))
#'
#' @name twn_info
#' @seealso Deze functies werken op basis van de tabel [autecodata::twn_lijst]
#'   
NULL


# fun_twn_info ------------------------------------------------------------


#' @export
#' @rdname twn_info
fun_twn_voorkeur <- function(namen) {
  check_autecodata()  
  
  opzoektabel_voorkeur <- autecodata::twn_lijst %>% 
    dplyr::mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
    dplyr::select(taxonname, refername) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  function(namen) {
  unname(opzoektabel_voorkeur[as.character(namen)])
  }
}

#' @export
#' @rdname twn_info
fun_twn_parent <- function(namen) {
  check_autecodata()
  
  opzoektabel_parent <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, parentname) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  function(namen) {
  unname(opzoektabel_parent[as.character(namen)])
  }
} 

#' @export
#' @rdname twn_info
fun_twn_status <- function(namen) {
  check_autecodata()
  
  opzoektabel_status <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, status) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  function(namen) {
  unname(opzoektabel_status[as.character(namen)])
  }
}

#' @export
#' @rdname twn_info
fun_twn_localname <- function(namen) {
  check_autecodata()
  
  opzoektabel_localname <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, localname) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  function(namen) {
  unname(opzoektabel_localname[as.character(namen)])
  }
}

#' @export
#' @rdname twn_info
fun_twn_taxonlevel <- function(namen) {
  check_autecodata()
  
  opzoektabel_taxonlevel <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, taxonlevel) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  function(namen) {
  unname(opzoektabel_taxonlevel[as.character(namen)])
  }
}


# get_twn_info ------------------------------------------------------------


#' @export
#' @rdname twn_info
get_twn_voorkeur <- function(namen){
  fun_twn_voorkeur()(namen)
}

#' @export
#' @rdname twn_info
get_twn_parent <- function(namen){
  fun_twn_parent()(namen)
}

#' @export
#' @rdname twn_info
get_twn_status <- function(namen) {
  fun_twn_status()(namen)
}

#' @export
#' @rdname twn_info
get_twn_localname <- function(namen){
  fun_twn_localname()(namen)
}

#' @export
#' @rdname twn_info
get_twn_taxonlevel <- function(namen){
  fun_twn_taxonlevel()(namen)
}