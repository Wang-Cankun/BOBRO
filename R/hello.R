#' @title hello
#' @description display some scripts
#' You can learn more about package authoring with RStudio at:
#'
#'   http://r-pkgs.had.co.nz/
#'
#' Some useful keyboard shortcuts for package authoring:
#'
#'   Install Package:           'Ctrl + Shift + B'
#'   Check Package:             'Ctrl + Shift + E'
#'   Test Package:              'Ctrl + Shift + T'
#' If "Build Package Documentation" shortcut not working, check within Tools -> Project Options... -> Build Tools; there should be a checkbox:
#' @examples
#' hello()
hello <- function(x) {
  message("Install Package:           'Ctrl + Shift + B'")
  message("Check Package:             'Ctrl + Shift + E'")
  message("Test Package:              'Ctrl + Shift + T'")
  message("Make Document:             'Ctrl + Shift + D'")
  message("Knit document:              knitr::knit('README.Rmd')")
  message("For loop, initialize the progress bar with:              pb <- txtProgressBar(min = 1, max = 100, char = "=", style = 3)")
  message("update in each loop iteration with:              setTxtProgressBar(pb = pb, value = i)")

  # knitr::knit('README.Rmd')
}

#' @title test1
#' @description test script
test1 <- function() {
  # s3 <- read.fasta("bic2337.txt.fa")
  s1 <- DNAString("ATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTGATCGATCGATCGATCGATCGATCGACTGACTAGCTAGCTACGATCGACTG")
  s1
  s4 <- DNAString("ATCGA")
  s1
  s2 <- DNAString(paste0(rep(s1, 20000), collate = ""))
  s2

  matchPattern(s4, enhancerFB)

  data(TFBS)
  DNAString(s3$ENSG00000108179)
  sk13 <- spectrumKernel(k = 14, normalized = FALSE)
  system.time(kmerFreq <- drop(getExRep(s1, sk13)))
  kmerFreq
  system.time(kmerFreq <- drop(getExRep(rep(enhancerFB, 20), sk13)))
  kmerFreq <- getExRep(rep(enhancerFB, 10), sk13)
  kmerFreq[1:10, 1:10]
  #sk13 <- kebabs::spectrumKernel(k = 14, normalized = FALSE)
  #system.time(kmerFreq <- drop(kebabs::getExRep(s1, sk13)))
  #kmerFreq
}

#' @title test2
#' @description test script
test2 <- function() {
  library(seqinr)
  test_sequence <- Biostrings::readDNAStringSet("data/cra.fa")
  object <- CreateBobroObject(test_sequence)
  object <- FindBobroMotif(object)
  PlotBobroMotif(object)
}
