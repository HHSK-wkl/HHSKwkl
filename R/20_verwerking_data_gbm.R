#' Toetsing gewasbeschermingsmiddelen
#'
#' Deze functie toetst per jaar per gewasbeschermingsmiddel of er een overschrijding is en hoe groot deze is. 
#' Als er in een jaar meerdere detectiegrenzen zijn wordt de laagste detectiegrens gebruikt.
#'
#' @param data Een dataframe met data 
#' @param normen Een dataframe met normen 
#' @param factor_detectiegrens Te gebruiken factor voor detectiegrenswaarden. Default is 0.5.
#'
#' @return Een dataframe met per meetpunt, parameter en jaar een toetsing. De toetsing bestaat uit:
#' \itemize{
#' \item \code{aangetroffen} - Logical. Of het gewasbeschermingsmiddel is aangetroffen of niet
#' \item \code{overschrijding} - Logical. Of er een normoverschrijding geconstateerd is of niet
#' \item \code{hoogste_overschrijding} - De maximale (overschrijdings)factor
#' \item \code{factor_MAX} - De (overschrijdings)factor voor de Maximaal Aanvaarbare Concentratie - MAC
#' \item \code{facor_JGM} - De (overschrijdings)factor voor de jaargemiddelde concentratie - JGM
#' \item \code{factor_P90} - De (overschrijdings)factor voor de 90-percentielwaarde - P90

#' }
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' toetsing <- toetsing_gbm(mijn_data, normen)
#' }
#' 
toetsing_gbm <- function(data, normen, factor_detectiegrens = 0.5){
  
  # Om wisselende grenzen te kunnen hanteren
  detec_min <- 
    data %>% 
    dplyr::filter(parnr > 999, parnr < 2000,
                  detectiegrens == "<") %>% 
    dplyr::group_by(parnr, jaar) %>% 
    dplyr::summarise(detec_min = min(waarde, na.rm = TRUE))
    
  
toetsing <- 
  data %>% 
  dplyr::filter(parnr > 999, parnr < 2000) %>% 
  dplyr::semi_join(normen, by = "parnr") %>%
  dplyr::left_join(detec_min, by = c("parnr", "jaar")) %>% 
  
  dplyr::mutate(detectiegrens = dplyr::if_else(is.na(detectiegrens), "", detectiegrens), 
                waarde_det_half = dplyr::if_else(detectiegrens == "<", detec_min * factor_detectiegrens, waarde) ) %>% 
  
  dplyr::group_by(mp, parnr, par, jaar) %>%
  dplyr::summarise(aantal = dplyr::n(), 
                   aantal_det = sum(detectiegrens == "<"), 
                   MAX = max(waarde_det_half, na.rm = TRUE), 
                   JGM = mean(waarde_det_half, na.rm = TRUE), 
                   P90 = stats::quantile(waarde_det_half, probs = 0.9, na.rm = TRUE) ) %>%
  
  dplyr::left_join(normen, by = "parnr") %>%
  dplyr::mutate(aangetroffen = dplyr::if_else(aantal == aantal_det, FALSE, TRUE), 
         factor_MAX = MAX / norm_MAX, 
         factor_JGM = JGM / norm_JGM, 
         factor_P90 = P90 / norm_P90 ) %>%
  dplyr::rowwise() %>%
  
  dplyr::mutate(hoogste_overschrijding = dplyr::if_else(aangetroffen, max(factor_MAX, factor_JGM, factor_P90, na.rm = TRUE), 0), 
                normoverschrijding = dplyr::if_else(hoogste_overschrijding > 1, TRUE, FALSE) ) %>% 
  dplyr::ungroup()
  
toetsing  
  
}

#' Bereken PAF voor bestrijdingsmiddelen
#'
#' Functie voor het berekenen van potentieel aangetaste fractie obv de data van de 
#' toxiciteitstool van ESF 8 Toxiciteit versie 2.
#'
#' @param aquo_par Parameternaam volgens de aquonaamgeving
#' @param concentratie Concentratie in ug/l
#' @param detectiegrens Detectiegrens. NA als geen detectiegrens (NB TRUE FALSE zou logischer zijn)
#' @param ssd_data SSD data volgens het format van de toxiciteitstool
#' @param type_paf `"acuut"` of `"chronisch"`
#' @param digits `NULL` of het aantal decimalen om de paf af te ronden
#'
#' @return Een vector met PAF waarden
#' @export
#' 
#' @source 
#' De toxiciteitsdata komen uit de [toxiciteitstool](https://rivm.shinyapps.io/chemie-tool-in-shiny/).
#' Documentatie is te vinden op de 
#' [website van ESF 8 Toxiciteit](https://kiwk-tox.netlify.app/nl/chemie-tool-rekentool/)
#'
#' @examples
#' 
#' \dontrun{
#' testdata %>% 
#' mutate(paf_acuut = paf_gbm(aquo_par = f_aquopar(parnr), 
#'                            concentratie = waarde, 
#'                            detectiegrens = detectiegrens,
#'                            ssd_data = tox, type_paf = "acuut"),
#'        paf_chronisch = paf_gbm(aquo_par = f_aquopar(parnr), 
#'                                concentratie = waarde, 
#'                                detectiegrens = detectiegrens,
#'                                ssd_data = tox, type_paf = "chronisch", digits = 5))
#' 
#' }
paf_gbm <- function(aquo_par, 
                    concentratie, 
                    detectiegrens, 
                    ssd_data, 
                    type_paf = c("acuut", "chronisch"), 
                    digits = NULL){
  
  type_paf <- type_paf[[1]]
  type_paf <- rlang::arg_match(type_paf, c("acuut", "chronisch"))
  
  paf_calc <- function(concentratie, log10avg, log10dev){
    stats::pnorm(log(concentratie, base = 10), mean = log10avg, sd = log10dev)
  }
  
  data <- tibble::tibble(aquo_par, concentratie, detectiegrens) %>% 
    dplyr::left_join(ssd_data, c("aquo_par" = "AquoCode"))
  
  if(type_paf == "acuut"){
    paf <- 
      data %>% 
      dplyr::mutate(paf = purrr::pmap_dbl(.l = list(concentratie, 
                                                    log10avg = log10AvgAcute, 
                                                    log10dev = Devlog10Acute), 
                                          .f = paf_calc)) %>% 
      dplyr::mutate(paf = ifelse(is.na(detectiegrens), paf, NA_real_)) %>% 
      dplyr::pull(paf)
    
    paf <- if (is.null(digits)) paf else round(paf, digits)
    
    return(paf)
    
  }
  
  if(type_paf == "chronisch") {
    paf <- 
      data %>% 
      dplyr::mutate(paf = purrr::pmap_dbl(.l = list(concentratie, 
                                                    log10avg = log10AvgChronic, 
                                                    log10dev = Devlog10Chronic), 
                                          .f = paf_calc)) %>% 
      dplyr::mutate(paf = ifelse(is.na(detectiegrens), paf, NA_real_)) %>% 
      dplyr::pull(paf)
    
    paf <- if (is.null(digits)) paf else round(paf, digits)
    
    return(paf)
  }

  
}


#' Bereken de msPAF
#'
#' Berekent de msPAF door het effect van afzonderlijke PAF-waarden samen te nemen. 
#' De msPAF berekening werkt volgens het principe van kansrekening.
#'
#' @param paf_vector Een vector met PAF-waarden (tussen de 0 en 1).
#'
#' @return De msPAF
#' 
#' @export
#'
#' @examples
#' 
#' # dobbelsteen voorbeeld
#' mspaf(c(1/6, 1/6))
#' 
mspaf <- function(paf_vector){
  
  1 - prod(1 - paf_vector, na.rm = TRUE)
  
}
