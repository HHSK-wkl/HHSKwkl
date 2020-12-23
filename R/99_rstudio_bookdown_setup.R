rstudio_bookdown_setup <- function(path, ...) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  dir.create(file.path(path, "R"))
  dir.create(file.path(path, "data"))
  dir.create(file.path(path, "images"))
  dir.create(file.path(path, "CSS"))
  
  
  file.copy(from = system.file("bookdown_template/index.Rmd", package = "HHSKwkl"),
            to = path)
  file.copy(from = system.file("bookdown_template/_bookdown.yml", package = "HHSKwkl"),
            to = path)
  file.copy(from = system.file("bookdown_template/_output.yml", package = "HHSKwkl"),
            to = path)
 
  
  file.copy(from = system.file("bookdown_template/R/CODE.R", package = "HHSKwkl"),
            to = file.path(path, "R"))
  
  file.copy(from = system.file("bookdown_template/CSS/markdown_JT.css", package = "HHSKwkl"),
            to = file.path(path, "CSS"))
  file.copy(from = system.file("bookdown_template/CSS/style.css", package = "HHSKwkl"),
            to = file.path(path, "CSS"))
  
  
  # bestanden niet dubbel in package
  file.copy(from = system.file("project_files/images/logo_website.png", package = "HHSKwkl"),
            to = file.path(path, "images"))
  file.copy(from = system.file("project_files/images/schonevoeten.png", package = "HHSKwkl"),
            to = file.path(path, "images"))
  file.copy(from = system.file("project_files/data/ws_grens.gpkg", package = "HHSKwkl"),
            to = file.path(path, "data"))
  
}

