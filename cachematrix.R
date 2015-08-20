## As no structure was specified for the special matrix I decided only to add
## the inverse method to it. The content of the matrix can't be modified as was
## not required for the task.
##
## The cache is done in the same special matrix without need of the cacheSolve.
## The cacheSolve will only invoke the method.

## Returns a list with a method inverse which will always return the inverse
## of the matrix currently passed.
## The inverse is not calculated until the method is executed.
## Once calculated, the same result will be always returned.
makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  
  inverse <- function () {
    if (is.null(cachedInverse)) {
      cachedInverse <<- solve(x)
    }
    cachedInverse
  }
  
  list(inverse = inverse)
}


## Returns the result of the inverse method of the special matrix passed.
cacheSolve <- function(x, ...) {
  x$inverse()
}
