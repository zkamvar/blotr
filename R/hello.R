#' Matrix blotter
#'
#' @param X an asymmetric square matrix
#' @param ut logical: include the upper triangle
#' @param lt logical: include lower triangle
#'
#' @return a symmetric square matrix
#' @export
#' @author Zhian N. Kamvar
#'
#' @examples
#' mat <-matrix(c(0,1,NA,1,
#'                NA,0,NA,NA,
#'                1,1,0,NA,
#'                NA,NA,NA,0), nrow=4, ncol=4)
#' mat
#' blot(mat)
blot <- function(X, ut = FALSE, lt = FALSE){
	if (length(unique(dim(X))) != 1){
		stop("Matrix must be square")
	}
	lower <- X[lower.tri(X)]
	upper <- t(X)[lower.tri(X)]
	u <- lower | upper
	mode(u) <- mode(X)
	X[lower.tri(X)] <- u
	X[upper.tri(X)] <- t(X)[upper.tri(X)]
	if (ut & lt | !(ut | lt)){
		return(X)
	} else if (ut){
		X[lower.tri(X)] <- NA
	} else {
		X[upper.tri(X)] <- NA
	}
	return(X)
}