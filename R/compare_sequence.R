#' Compare DNA sequence
#'
#' Compare DNA sequences using Bobro two-stage sequence alignment algorithm
#'
#' @param x A \linkS4class{Bobro} class object.
#'
#' @details
#' Check \code{help_parameters} for current used parameters, to change parameters, use \code{basic_parameters()} and \code{advanced_parameters()}
#'
#' @return A \linkS4class{Bobro} class object.
#'
#' @name compare_sequence
#' @author Cankun Wang
#' @examples
#' object <- compare_sequence(object)
NULL

#' @importFrom Matrix colSums
.compare_sequence <- function(x) {
  pb <- txtProgressBar(char = "=", style = 3)
  pb <- txtProgressBar(min = 1, max = 100, char = "=", style = 3)
  width_seq <- width(x@sequence)
  n_seq <- length(x@sequence) - 86

  for (i in 1:n_seq) {
    for (p in i:n_seq) {
      d1 <- matrix(0,nrow = width_seq[i], ncol = width_seq[p])
      for (j in 1:width_seq[i]) {
        for (q in 1:width_seq[p]) {
          d1[j,q] <- .get_similarity_between_two_patterns(i,p,j,q,motif_len = 14)
          num <-  mapply(adist, as.character(x@sequence[[i]][seq(j,j+motif_len-1)]),as.character(x@sequence[[p]][seq(q,q+motif_len-1)]))
            setTxtProgressBar(pb = pb, value = p)
        }
      }
    }
  }
  return(x)
}
setGeneric("compare_sequence", function(x) standardGeneric("compare_sequence"))

#' @export
#' @rdname compare_sequence
setMethod("compare_sequence", "Bobro", .compare_sequence)

.get_compare_sequence_param <- function(x) {
  this_param <- list(threshold_1 = 10,
    threshold_2 = 14,
    threshold = 7,
    middle_enhance = FALSE,
    no_enhance = FALSE)
}

.get_similarity_between_two_patterns <- function(x,seq1,seq2,pos1,pos2,motif_len=14){
  num <-  mapply(adist, x[[seq1]][seq(pos1:pos1+motif_len-1)],x[[seq1]][seq(pos1:pos1+motif_len-1)])
  return(num)
}

.matrix_no_continuous_equal <- function(x) {
  return(x)
}

