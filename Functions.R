library(igraph)

load_and_show <- function(file) {
  code <- readLines(file)
  cat("```r\n", paste(code, collapse = "\n"), "\n```")
  eval(parse(text = code),envir = .GlobalEnv)
}

plot_as_flux <- function(g, ...) {
  lay <- layout_with_sugiyama(g)
  coords <- lay$layout
  coords[, 2] <- -coords[, 2]   # invert y-axis (basal bottom → predators top)
  
  plot(g, layout = coords, ...)
}

