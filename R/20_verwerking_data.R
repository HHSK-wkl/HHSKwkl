#' Toetsing gewasbeschermingsmiddelen
#'
#' Deze functie toetst per jaar per gewasbeschermingsmiddel of er een overschrijding is en hoe groot deze is.
#'
#' @param data Een dataframe met data zoals wordt gemaakt met [import_fys_chem()]
#' @param normen Een dataframe met normen zoals wordt gemaakt met [import_normen_rivm()]
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
  
toetsing <- 
  data %>% 
  dplyr::filter(parnr > 999, parnr < 2000) %>% 
  dplyr::semi_join(normen, by = "parnr") %>%
  
  dplyr::mutate(detectiegrens = dplyr::if_else(is.na(detectiegrens), "", detectiegrens), 
                waarde_det_half = dplyr::if_else(detectiegrens == "<", waarde * factor_detectiegrens, waarde) ) %>%
  
  dplyr::group_by(mp, parnr, par, jaar) %>%
  dplyr::summarise(aantal = n(), 
                   aantal_det = sum(detectiegrens == "<"), 
                   MAX = max(waarde_det_half, na.rm = TRUE), 
                   JGM = mean(waarde_det_half, na.rm = TRUE), 
                   P90 = stats::quantile(waarde_det_half, probs = 0.9, na.rm = TRUE) ) %>%
  
  dplyr::left_join(normen, by = "parnr") %>%
  dplyr::mutate(aangetroffen = if_else(aantal == aantal_det, FALSE, TRUE), 
         factor_MAX = MAX / norm_MAX, 
         factor_JGM = JGM / norm_JGM, 
         factor_P90 = P90 / norm_P90 ) %>%
  dplyr::rowwise() %>%
  
  dplyr::mutate(hoogste_overschrijding = dplyr::if_else(aangetroffen, max(factor_MAX, factor_JGM, factor_P90, na.rm = TRUE), 0), 
                normoverschrijding = dplyr::if_else(hoogste_overschrijding > 1, TRUE, FALSE) ) %>% 
  dplyr::ungroup()
  
toetsing  
  
}