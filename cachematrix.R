## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  # function to set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # function to get the matrix
  get <- function() x
  
  # function to set the inverse
  setInverse <- function(inverse) inv <<- inverse
  
  # function to get the inverse
  getInverse <- function() inv
  
  # list all the functions created
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## Write a short comment describing this function

cacheSolve <- function(x) {
  
  # retrieve the cached inverse, if available
  if(!is.null(x$getInverse())) {
    message("Getting cached inverse.")
    return(x$getInverse())
  }
  
  # otherwise, compute the inverse and cache it
  inverse <- solve(x$get())
  x$setInverse(inverse)
  inverse
}


f<-makeCacheMatrix(matrix((1:8),2,4))
f$get()
f$cacheSolve()
cacheSolve(f)
