## Put comments here that give an overall description of what your
## functions do

## The following are written as fullfilment of the R Programming
## Week 3 Assigment (8/17/2018)

makeCacheMatrix <- function(x = matrix()) {
 mirror <- NULL        ##set variable to hold inverse of matrix
 
 set <- function(y) {   ##this block will set the function to
   x <<- y              ##assign new value of matrix in parent env.
   mirror <<- NULL     ##if new matrix, inverse is reset to NULL.
 }
 
 get <- function () x   #defines get function, returns val. of matrix arg.
 
 setinverse <-function(inverse) mirror <<- inverse ##assigns val. of mirror in parent
 getinverse <-function() mirror                    ##gets val. of mirror
 
 list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}

## Write a short comment describing this function
## the above function will compute the inverse of the matrix returned by "makeCacheMatrix"
## cacheSolve will grab the inverse from the cache 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mirror <-x$getinverse()
  if(!is.null(mirror)) {
    message("getting cached data")
    return(mirror)
  }
  data <- x$get()
  mirror <-inverse(data, ...)
  x$setinverse(mirror)
  mirror
}
