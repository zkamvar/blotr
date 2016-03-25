<!-- README.md is generated from README.Rmd. Please edit that file -->
blotmat: Blotting matrices since 2016
=====================================

This package does one thing: create symmetric matrices from asymmetric matrices. It is inspired by [This tweet](https://twitter.com/algaebarnacle/status/713103252582064128).

How do I use it?
----------------

There is only one function called `blot()`:

``` r
library("blotmat")
mat <- matrix(sample(c(NA, 1), 100, replace = TRUE), 10, 10)
diag(mat) <- 0
mat
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    0   NA    1    1    1    1   NA   NA    1     1
#>  [2,]    1    0   NA    1   NA   NA   NA   NA   NA     1
#>  [3,]   NA   NA    0   NA   NA   NA   NA    1   NA     1
#>  [4,]   NA   NA   NA    0    1    1   NA   NA    1    NA
#>  [5,]    1   NA   NA   NA    0    1   NA   NA   NA    NA
#>  [6,]    1    1   NA    1    1    0   NA   NA   NA    NA
#>  [7,]    1    1    1    1   NA   NA    0    1   NA    NA
#>  [8,]   NA   NA   NA    1   NA    1   NA    0    1    NA
#>  [9,]    1   NA   NA   NA   NA   NA   NA    1    0     1
#> [10,]    1   NA    1    1   NA   NA    1    1   NA     0
isSymmetric(mat)
#> [1] FALSE
blot(mat)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    0    1    1    1    1    1    1   NA    1     1
#>  [2,]    1    0   NA    1   NA    1    1   NA   NA     1
#>  [3,]    1   NA    0   NA   NA   NA    1    1   NA     1
#>  [4,]    1    1   NA    0    1    1    1    1    1     1
#>  [5,]    1   NA   NA    1    0    1   NA   NA   NA    NA
#>  [6,]    1    1   NA    1    1    0   NA    1   NA    NA
#>  [7,]    1    1    1    1   NA   NA    0    1   NA     1
#>  [8,]   NA   NA    1    1   NA    1    1    0    1     1
#>  [9,]    1   NA   NA    1   NA   NA   NA    1    0     1
#> [10,]    1    1    1    1   NA   NA    1    1    1     0
isSymmetric(blot(mat))
#> [1] TRUE
```
