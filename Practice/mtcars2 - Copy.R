levenes_test <- function(data, alpha) {
  y <- data[,1]
  x <- data[,2]
  
  residuals <- (lm(y~x))$residuals
  
  #edit this code to be different!!!!
  len <- length(sort(unique(X)))
  criterion <- sort(unique(x))[len/2]
  small.obs <- which(x <= criterion)
  large.obs <- which(x > criterion)
  print(small.obs)
  print(large.obs)
  
  res.small <- residuals[small.obs]
  res.large <- residuals[large.obs]
  
  d1<- abs(res.small-median(res.small))
  d2<- abs(res.large-median(res.large))
  
  d1bar <- mean(d1)
  d2bar <- mean(d2)
  
  n <- dim(data)[1]
  n1 <- length(small.obs)
  n2 <- length(large.obs)
  
  s <- (sum((d1-d1bar)^2) + sum((d2-d2bar)^2))/(n-2)
  
  test.statistic <- (d1bar - d2bar)/(s*sqrt((1/n1)+(1/n2)))
  
  t.crit.lower <- qt(alpha/2, df = (n-2))
  t.crit.upper <- qt(1-(alpha/2), df = (n-2))
  
  if(test.statistic < t.crit.lower || test.statistic > t.crit.upper) {
    out1 <- print(paste("We have ",1-alpha,"confidence to reject H0."))
  } else {
    out2 <- print(paste("We have ",1-alpha,"confidence to fail to reject H0."))
  }
  
  list(test.statistic, out1)
}

dataSet <- cbind(mtcars$am, mtcars$mpg)
levenes_test(dataSet, alpha = 0.5)

#wrong answer

#4 homework combined for the project, #5 is the proposal
