rstudio_project_setup <- function(path, ...) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  file.copy(from = system.file("project_files/markdown_template_JT.Rmd", package = "HHSKwkl"),
            to = path)
  
  dir.create(file.path(path, "R"))
  file.copy(from = system.file("project_files/R/CODE_markdown.R", package = "HHSKwkl"),
            to = file.path(path, "R"))
  file.copy(from = system.file("project_files/R/script.R", package = "HHSKwkl"),
            to = file.path(path, "R"))
  
  
  dir.create(file.path(path, "data"))
  file.copy(from = system.file("project_files/data/ws_grens.gpkg", package = "HHSKwkl"),
            to = file.path(path, "data"))
  
  
  dir.create(file.path(path, "images"))
  file.copy(from = system.file("project_files/images/logo_website.png", package = "HHSKwkl"),
            to = file.path(path, "images"))
  file.copy(from = system.file("project_files/images/schonevoeten.png", package = "HHSKwkl"),
            to = file.path(path, "images"))
  
  
  dir.create(file.path(path, "html"))
  file.copy(from = system.file("project_files/html/footer_hhsk.html", package = "HHSKwkl"),
            to = file.path(path, "html"))
  file.copy(from = system.file("project_files/html/header_hhsk.html", package = "HHSKwkl"),
            to = file.path(path, "html"))
  
  
  
  dir.create(file.path(path, "CSS"))
  file.copy(from = system.file("project_files/CSS/markdown_JT.css", package = "HHSKwkl"),
            to = file.path(path, "CSS"))
  
 
}

