levenes_test <- function(dataSet, alpha) {
  y <- dataSet[,1]
  x <- dataSet[,2]
  
  residuals <- (lm(y~x))$residuals
  
  uniqueValues <- sort(unique(x))
  
  cutOffValue <- uniqueValues[length(uniqueValues)/2]
  smallObs <- which(x <= cutOffValue)
  largeObs <- which(x > cutOffValue)
  #print(smallObs)
  #print(largeObs)
  
  smallRes <- residuals[smallObs]
  largeRes <- residuals[largeObs]
  
  d1<- abs(smallRes-median(smallRes))
  d2<- abs(largeRes-median(largeRes))
  
  d1_bar <- mean(d1)
  d2_bar <- mean(d2)
  
  n <- dim(dataSet)[1]
  n1 <- length(smallObs)
  n2 <- length(largeObs)
  
  s <- ((sum((d1-d1_bar)^2)) + (sum((d2-d2_bar)^2)))/(n-2)
  #print(paste("S:",s))
  
  test_statistic <- (d1_bar - d2_bar)/(s*sqrt((1/n1)+(1/n2)))
  
  lower_critValue <- qt(p = alpha/2, df = (n-2))
  upper_critValue <- qt(p = 1-(alpha/2), df = (n-2))
  #print(lower_critValue)
  #print(upper_critValue)
  
  if(test_statistic < lower_critValue || test_statistic > upper_critValue) {
    print(paste("We have",((1-alpha)*100),"% confidence to reject the Null Hypothesis, H0."))
  } else {
    print(paste("We have ",((1-alpha)*100),"% confidence to fail to reject the Null Hypothesis, H0."))
  }
  print(paste("The critical cutoff values are between",lower_critValue,"and",upper_critValue))
  print(paste("The test Statistic is",test_statistic))
}

dataSet <- cbind(mtcars$am, mtcars$mpg)
levenes_test(dataSet, alpha = 0.05)
