## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#The makeCacheMatrix() function takes a single argument x, which is a matrix. If no matrix is provided, an empty matrix is used as the default value.

#The next block defines a function called get() that retrieves the matrix from the cache environment using the $ operator on the cache object.

#The set() function is defined to set the matrix in the cache environment. It takes a single argument m that represents the matrix to be cached. The cache$i variable is set to NULL to invalidate the cached inverse, because the matrix has changed.

#The getInverse() function is defined to retrieve the cached inverse from the cache environment using the $ operator on the cache object.

#The setInverse() function is defined to cache the inverse in the cache environment. It takes a single argument i that represents the inverse to be cached.

#Finally, the makeCacheMatrix() function returns a list of functions that can be used to interact with the cached matrix and its cached inverse.

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

#The cacheSolve() function takes a single argument x, which is a makeCacheMatrix() object created using the makeCacheMatrix() function.

#The first if statement checks if the cached inverse is available using the getInverse() method of the makeCacheMatrix() object. If the cached inverse is available, a message is printed indicating that the cached value is being used, and the cached inverse is returned using the getInverse() method.

#If the cached inverse is not available, the else block is executed. The solve() function is used to compute the inverse of the matrix, which is stored in the inverse variable.

#The setInverse() method of the makeCacheMatrix() object is then used to cache the computed inverse.


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
f$inverse()
cacheSolve(f)
