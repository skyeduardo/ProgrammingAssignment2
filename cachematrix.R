## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix<-function(x=matrix()){ #input matrix x
  m<-NULL#m will be our inverse matrix and it is reset to NULL every time 
  set<-function(y){#take an input vector
    x<<-y #save the input vector
    m<<-NULL #resets the mean to NULL
  }
  get<-function()x#function returns the value of the original vector
  setsolve<-function(slove){m<<-mean}#this is called by cacheSolve() during the frist cacheSolve()
  getsovle<-function()m #return the cache value to cacheSolve()
  list(set=set,get=get,setsolve=setsolve, getsolve=getsolve)
}#list of function defined before
cacheSolve<-function(x,...){#in put X is an object created by makecacheMatrix
  m<-x$getsolve()#accesses the object x and gets the inverse x
  if(!is.null(m)){ #if inverse was already cached(not NULL)
    message("gtting cached data")#SEND this to Console
    return (m)
  }
  data<-x$get()#reach this code only if x$getsolve() returned NULL
  m<-solve(data,...)#IF m was NULL then inverse matrix
  x$setsolve(m)#store the inversed matrix in x
  m #return new matrix to the code that called this function
}

  
