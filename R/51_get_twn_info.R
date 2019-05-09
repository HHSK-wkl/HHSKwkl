## These functions depend on the package autecodata which can be found on
## https://github.com/RedTent/autecodata


# get_twn_info ------------------------------------------------------------


#' Opzoeken van de TWN informatie
#'
#' Deze functies zoeken bij taxonnamen de bijbehorende informatie uit de
#' TWN-lijst.
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
#' @param namen Een vector met taxonnamen
#'
#' @return Een vector met TWN-informatie. Namen die niet in de TWN worden
#'   gevonden krijgen `NA`.
#'   
#' @note De TWN-lijst is niet altijd volledig consistent. Diverse taxa staan
#'   meerdere malen in de lijst. In dat geval wordt het eerste resultaat
#'   geretourneerd.
#'   
#'   Als een taxon niet de voorkeurnaam is dan ontbreekt er vaak informatie 
#'   zoals de parent van het taxon
#'
#' @examples
#'
#' get_twn_voorkeur(c("Bufo calamita", "Bufo"))
#' get_twn_parent(c("Bufo calamita", "Bufo"))
#' get_twn_status(c("Bufo calamita", "Bufo"))
#' get_twn_localname(c("Bufo calamita", "Bufo"))
#' get_twn_taxonlevel(c("Bufo calamita", "Bufo"))
#'
#' @name get_twn_info
#' @seealso [autecodata::twn_lijst]
#'   
NULL

#' @export
#' @rdname get_twn_info
get_twn_voorkeur <- function(namen) {
  check_autecodata()  

  opzoektabel <- autecodata::twn_lijst %>% 
    dplyr::mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
    dplyr::select(taxonname, refername) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  unname(opzoektabel[as.character(namen)])
}

#' @export
#' @rdname get_twn_info
get_twn_parent <- function(namen) {
  check_autecodata()
  
  opzoektabel <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, parentname) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  unname(opzoektabel[as.character(namen)])
  
} 

#' @export
#' @rdname get_twn_info
get_twn_status <- function(namen) {
  check_autecodata()
  
  opzoektabel <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, status) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  unname(opzoektabel[as.character(namen)])
  
}

#' @export
#' @rdname get_twn_info
get_twn_localname <- function(namen) {
  check_autecodata()
  
  opzoektabel <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, localname) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  unname(opzoektabel[as.character(namen)])
  
}

#' @export
#' @rdname get_twn_info
get_twn_taxonlevel <- function(namen) {
  check_autecodata()
  
  opzoektabel <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, taxonlevel) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  unname(opzoektabel[as.character(namen)])
  
}




# fun_twn_info ------------------------------------------------------------

fun_twn_status <- function() {
  check_autecodata()
  
  opzoektabel <- autecodata::twn_lijst %>% 
    dplyr::select(taxonname, status) %>% 
    dplyr::distinct() %>% 
    tibble::deframe()
  
  opzoekfun <- function(namen) {
  unname(opzoektabel[as.character(namen)])
    stop("fun_twn_status")
  }
  opzoekfun
  
}

