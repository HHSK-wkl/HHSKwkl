# hhskthema ---------------------------------------------------------------


#' HHSK thema
#' 
#' Dit is een HHSK-thema voor ggplot 
#'
#'
#' @return Een thema voor ggplot

#'
#' @name hhskthema
#'
#' @examples
#' \dontrun{
#' 
#' my_ggplot + hhskthema()
#' 
#' }
#' 
NULL

#' @rdname hhskthema
#' @export
hhskthema <- function(){
  #require(ggplot2)
  hhskthema <- ggplot2::theme_light() + ggplot2::theme(
    
    plot.title =    ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    plot.subtitle = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0, size = ggplot2::rel(1.1)),
    plot.caption =  ggplot2::element_text(color = "grey40", face = "italic"),
    
    axis.title =  ggplot2::element_text(color = "grey40"),
    axis.text =   ggplot2::element_text(color = "grey40"),
    axis.ticks =  ggplot2::element_line(color = "grey40"),
    axis.line = ggplot2::element_line(color = "grey40", size = 0.5),
    
    panel.border =     ggplot2::element_blank(),#ggplot2::element_rect(color = hhskblauw, size = 1),
    panel.grid.major = ggplot2::element_line(color = "grey80", linetype = "dotted", size = 0.5),
    panel.grid.minor = ggplot2::element_blank(),#ggplot2::element_line(color = "grey60", linetype = "dotted", size = 0.5),
    
    legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    legend.text =  ggplot2::element_text(color = "grey40"),
    
    strip.background = ggplot2::element_rect(fill = NA, colour = "grey50"),
    strip.text =       ggplot2::element_text(face = "bold", color = "grey50")
  )
  hhskthema
}

#' @rdname hhskthema
#' @export
hhskthema_kaart <- function(){
  #require(ggplot2)
  hhskthema <- ggplot2::theme_light() + ggplot2::theme(
    
    plot.title =    ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    plot.subtitle = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0, size = ggplot2::rel(1.1)),
    plot.caption =  ggplot2::element_text(color = "grey40", face = "italic"),
    plot.title.position = "plot",
    
    axis.title =  ggplot2::element_text(color = "grey40"),
    axis.text =   ggplot2::element_blank(),
    axis.ticks =  ggplot2::element_blank(),
    axis.line = ggplot2::element_line(color = "grey40", size = 0.5),
    
    panel.border =     ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    
    legend.title = ggplot2::element_text(color = "grey50", face = "bold", hjust = 0),
    legend.text =  ggplot2::element_text(color = "grey40"),
    
    strip.background = ggplot2::element_rect(fill = NA, colour = "grey50"),
    strip.text =       ggplot2::element_text(face = "bold", color = "grey50")
  )
  hhskthema
}