#include <Rcpp.h>
#include "edlib.h"

using namespace Rcpp;

// [[Rcpp::export]]
NumericVector calc2(CharacterVector x, int k, int total_kmer)
{
  NumericMatrix m(total_kmer, total_kmer);
  for (int i=0;i < total_kmer; i++){
    for (int j=i+1;j < total_kmer; j++){
      EdlibAlignResult result = edlibAlign(x[i], k, x[j], k, edlibNewAlignConfig(7, EDLIB_MODE_NW, EDLIB_TASK_DISTANCE, NULL, 0));
      m(i,j)  = k - result.editDistance;
      edlibFreeAlignResult(result);
    }
  }

  return (m);
}

/*** R

*/
