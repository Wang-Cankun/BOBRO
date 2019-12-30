# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# S4 methods for the generic Bobro class
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


setMethod(
  f = "show",
  signature = "Bobro",
  definition = function(x) {
    n_sequences <- length(x@meta_data$header)
    range_sequences <- range(width(x@sequence))
    cat("An object of class", class(x = x), "\n")
    cat(
      n_sequences,
      "sequences with length from",
      range_sequences[1],
      "to",
      range_sequences[2],
      "\n",
      "use help_parameters(object) to display all parameters settings.",
      "\n"
    )
    cat("\n")
  }
)

setMethod(
  f = "names",
  signature = "Bobro",
  definition = function(x) {
    return(names(x@sequence))
  }
)


