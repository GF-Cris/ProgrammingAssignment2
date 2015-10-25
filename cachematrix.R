## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(Matrix = matrix()) {
  inverse <- NULL 
  
  SetMatrix <- function(NewMatrix) {
    Matrix <<- NewMatrix    # Set the value of the matrix
    inverse <<- NULL        # Clear the existing inverse from the cache
  }
  GetMatrix <- function(){
    MatrixValues   #Get the value of the matrix
  } 
  SetInverse<- function(solve){
    inverse <<- NewInverse   #Used by getinverse() when there is no inverse
  } 
  GetInverse <- function(){
    inverse  # Get the inverse of the matrix.
  }
  list(set = SetMatrix,  # Return a list with the above four functions
       get = GetMatrix,
       setinverse = SetInverse,
       getinverse = GetInverse)
}


## This function computes the inverse of a given matrix object if is not already in the cache,
#  if so, returns the existing value from the cache.


cacheSolve <- function(Matrix, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- Matrix$GetInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- Matrix$GetMatrix()
  inverse <- solve(data, ...)
  Matrix$SetInverse(inverse)
  inverse
}
