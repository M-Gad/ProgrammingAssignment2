## Pair of functions that cache the inverse of a matrix rather than computed repeatedly.

## Functions 1 creates a 'special matrix' object that can cache its inverse

makeCacheMatrix<- function(x=matrix()) {
inv <- NULL
set <- function(y) {
x <<- y
inv <<- NULL
}
get <- function () x
setInverse <- function(Inverse)inv <<- Inverse
getInverse <- function() inv
list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}



## Functions 2 computes the inverse of the 'special matrix' returned by makeCacheMatric
## if inverse already calculated, cacheSolve should retrieve the inverse from cache.

cacheSolve <- function(x,...){
inv <- x$getInverse()
if(!is.null(inv)){
message("getting cached data")
return(inv)
}
data_matrix <- x$get()
inv <- solve(data_matrix)
x$setInverse(inv)
inv
}
