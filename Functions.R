load_and_show <- function(file) {
  code <- readLines(file)
  cat("```r\n", paste(code, collapse = "\n"), "\n```")
  eval(parse(text = code),envir = .GlobalEnv)
}
