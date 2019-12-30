# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# S4 methods for the getter and setter accessors
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Get and set DNA sequence headers
#'
#' Get and set DNA sequence headers, default values read from FASTA format headers
#'
#' @param x A \linkS4class{Bobro} class object.
#'
#' @param values A string with same length of names
#'
#' @details
#'
#' @name sequence_names
#' @author Cankun Wang
#' @seealso
#' \code{\link{names}}, on which this function is based.
#'
#' @examples
#' sequence_names(object)
#' sequence_names(object) <- paste("test-",sequence_names(object),sep="")
NULL

#' @name sequence_names
#' @aliases sequence_names
#' @return A character vector of DNA sequences sequence header information.
setGeneric("sequence_names", function(x) standardGeneric("sequence_names"))

#' @include object.R
#' @export
setMethod(
  f = "sequence_names",
  signature = "Bobro",
  definition = function(x) {
    return(names(x@sequence))
  }
)

#' @name sequence_names<-
#' @aliases sequence_names<-
#' @docType methods
#' @rdname sequence_names
setGeneric("sequence_names<-", function(x, value) standardGeneric("sequence_names<-"))
#' @include object.R
#' @export
setMethod(
  f = "sequence_names<-",
  signature = "Bobro",
  definition = function(x, value) {
    names(x@sequence) <- value
    return(x)
  }
)


#' Get and set Bobro class basic parameters
#'
#' Get and set Bobro class basic parameters, default values are listed.
#'
#' @param x A \linkS4class{Bobro} class object.
#'
#' @param values A string with same length of basic parameters
#'
#' @details
#'
#' @name basic_parameters
#' @author Cankun Wang
#'
#' @examples
#' basic_parameters(object)
#' basic_parameters(object) <- list(14:16,T,100,T)
NULL

#' @name basic_parameters
#' @aliases basic_parameters
#' @return A list of basic parameters used in Bobro
setGeneric("basic_parameters", function(x) standardGeneric("basic_parameters"))

#' @name basic_parameters<-
#' @aliases basic_parameters<-
#' #' @docType methods
#' @rdname basic_parameters
setGeneric("basic_parameters<-", function(x, value) standardGeneric("basic_parameters<-"))

#' @include object.R
#' @export
setMethod(
  f = "basic_parameters",
  signature = "Bobro",
  definition = function(x) {
    return(x@parameters[1:4])
  }
)

#' @include object.R
#' @export
setMethod(
  f = "basic_parameters<-",
  signature = "Bobro",
  definition = function(x, value) {
    x@parameters[1:4] <- value
    return(x)
  }
)


#' Get and set Bobro class advanced parameters
#'
#' Get and set Bobro class advanced parameters, default values are listed.
#'
#' @param x A \linkS4class{Bobro} class object.
#'
#' @param values A string with same length of advancedparameters
#'
#' @details
#'
#' @name advanced_parameters
#' @author Cankun Wang
#'
#' @examples
#' advanced_parameters(object)
#' advanced_parameters(object) <-
NULL

#' @name advanced_parameters
#' @aliases advanced_parameters
#' @return A list of basic parameters used in Bobro
setGeneric("advanced_parameters", function(x) standardGeneric("advanced_parameters"))

#' @name advanced_parameters<-
#' @aliases advanced_parameters<-
#' @docType methods
#' @rdname advanced_parameters
setGeneric("advanced_parameters<-", function(x, value) standardGeneric("advanced_parameters<-"))

#' @include object.R
#' @export
setMethod(
  f = "advanced_parameters",
  signature = "Bobro",
  definition = function(x) {
    return(x@parameters[5:22])
  }
)
#' @include object.R
#' @export
setMethod(
  f = "advanced_parameters<-",
  signature = "Bobro",
  definition = function(x, value) {
    x@parameters[5:22] <- value
    return(x)
  }
)

#' Display current parameters and description
#'
#' To change parameters, check the function \code{basic_parameters()} and \code{advanced_parameters()}
#'
#' @param x A \linkS4class{Bobro} class object.
#'
#'
#' @details
#'
#' @name help_parameters
#' @author Cankun Wang
#'
#' @examples
#' help_parameters(object)
NULL

#' @name help_parameters
#' @aliases help_parameters
setGeneric("help_parameters", function(x) standardGeneric("help_parameters"))
#' @include object.R
setMethod(
  f = "help_parameters",
  signature = "Bobro",
  definition = function(x) {
    p <- x@parameters
    cat(
      "===================================================================\n",
      "Commonly used parameters:\n",
      "length = ",p[[1]], "|A vector value of motif length at least 5:[5, ], default = 14\n",
      "is_fast = ",p[[2]], "|the flag of fast version of bobro which just enhance two ends of motif, default = FALSE\n",
      "n_output = ",p[[3]], "|number of closures to report (used under a specific input length), default = 10\n",
      "both_strand = ",p[[4]], "|search motif sites on both strands (reverse complement), default = FALSE\n",
      "===================================================================\n",
      "Advanced parameters:\n",
      "n = ",p[[5]], "|top n closures under each length are used when searching multiple motif length, default = 1\n",
      "w = ",p[[6]], "|the weight of the two motif ends, default = 2\n",
      "k = ",p[[7]], "|the minimum size of the initial motif seeds, default = 3\n",
      "c = ",p[[8]], "|consistency level of the motif seeds (0.5-1.0], default = 1\n",
      "s = ",p[[9]], "|the nunber of simulation times [5, ], default = 5\n",
      "u = ",p[[10]], "|the threshold of two closures' similarity socre (0,1], default = 0.7\n",
      "a = ",p[[11]], "|the upper limit of conservation level (N,10], default = 9\n",
      "N = ",p[[12]], "|the lower limit of conservation level (0,a), default = 6\n",
      "P = ",p[[13]], "|the flag of palindromic of TFBS, default = FALSE\n",
      "M = ",p[[14]], "|the flag of mirror of TFBS, default = FALSE\n",
      "G = ",p[[15]], "|the flag of global TF prediction, default = FALSE\n",
      "C = ",p[[16]], "|the flag of local TF prediction, default = FALSE\n",
      "E = ",p[[17]], "|the flag of expansion of closures base on the threshold 0.3-0.8, default = FALSE\n",
      "A = ",p[[18]], "|the flag of approximation of pvalue calculation, default = FALSE\n",
      "W = ",p[[19]], "|the flag of considering sequences weight, default = FALSE\n",
      "R = ",p[[20]], "|the range when we use [L,U], default = 1\n",
      "e = ",p[[21]], "|the times of seed alignments enlargement [1,3], default = 3\n",
      "b = ",p[[22]], "|the conserve level when search in background genome, default = 0.95\n"
    )
  }
)



