#include <Rcpp.h>
#include "edlib.h"
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector calc_similarity_kmer(CharacterVector x, int k, int total_kmer)
{
  NumericMatrix m(total_kmer, total_kmer);
  for (int i=0;i < total_kmer; i++){
    for (int j=i;j < total_kmer; j++){
      EdlibAlignResult result = edlibAlign(x[i], k, x[j], k, edlibDefaultAlignConfig());
      m(i,j) = k - result.editDistance;
    }
  }

  return (m);
}

/*** R

*/
