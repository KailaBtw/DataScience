
#library(car)
#value <- c(1,2,4,5,6,12,13,20, 4,8,12,22,60,90,105,120)
#group1 <- c(rep("Group1", 8), rep("Group2", 8))
#my.dataframe<-data.frame(value, group1)
#leveneTest(value~group1, data=my.dataframe, center=median)


#acctually compares the auto to mpg and manual to mpg from each frame

input1 <- c(1,2,4,5,6,12,13,20)
input2 <- c(4,8,12,22,60,90,105,120)

#function to calculate the error of the data frame and return
#an array of errors for each data point
error <- function(input) {
  err = c()
  for(x in 1:length(input)) {
    err[x] = (input[x]-mean(input))
  }
  return(err)
}
#error(input1)

#return an array of d values. absolute value of (e(i)-median(error))
dArray <- function(input) {
  err = error(input)
  dArray = c()
  for(x in 1:length(input)) {
    dArray[x] = abs(err[x] - median(err))
  }  
  return(dArray)
}
dArray(input1)

#return specific d value for a specific e value
dij <- function(input,i) {
  err = error(input)
  return(abs(err[i] - median(err)))
}
dij(input1,1)


s.stat <- function(input1,input2) {
  n = length(input1)
  err1 = error(input1)
  err2 = error(input2)
  
  sum1 = 0
  sum2 = 0
  for(x in 1:n) {
    sum1 = sum1 + ((dij(err1,x)-mean(dArray(err1)))^2)
    sum2 = sum2 + ((dij(err2,x)-mean(dArray(err2)))^2)
    #print("x")
    #print(x)
    #print(sum1)
    #print(sum2)
  }  
  return((sum1+sum2)/n-2)
}
s.stat(input1,input2)

levineTest <- function(input1, input2) {
  err1 = error(input1)
  err2 = error(input2)
  print(err1)
  print(err2)
  
  #print(c("dArray1",dArray(err1)))
  #print(c("dArray2",dArray(err2)))
  
  dbar1 = mean(dArray(err1))
  dbar2 = mean(dArray(err2))
  print(c("dbar1",dbar1))
  print(c("dbar2",dbar2))
  
  s.statistic = s.stat(input1,input2)
  print(c("S statistic",s.statistic))
  
  dem = sqrt((1/length(input1)) + (1/length(input2)))
  #print(dem)
  
  return((dbar1-dbar2)/(s.statistic*dem))
}
levineTest(input1,input2)


#null hyposthesis of all the variances are equal










