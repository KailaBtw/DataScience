
# Ellie Lagrave
# Homework 04
# Regression Models
# 11/6/2023


levenes_test <- function(dataSet, alpha) {
  y <- dataSet[,1]
  x <- dataSet[,2]
  #print(y)
  #print(x)
  
  residuals <- (lm(y~x))$residuals
  #print(lm(y~x))
  
  uniqueValues <- sort(unique(x))
  #print(uniqueValues)
  
  cutOffValue <- uniqueValues[length(uniqueValues)/2]
  #print(cutOffValue)
  
  smallObsPos <- which(x <= cutOffValue)
  largeObsPos <- which(x > cutOffValue)
  #print(smallObsPos)
  #print(largeObsPos)
  
  smallRes <- residuals[smallObsPos]
  largeRes <- residuals[largeObsPos]
  
  d1<- abs(smallRes-median(smallRes))
  d2<- abs(largeRes-median(largeRes))
  
  d1_bar <- mean(d1)
  d2_bar <- mean(d2)
  
  n <- dim(dataSet)[1]
  n1 <- length(smallObsPos)
  n2 <- length(largeObsPos)
  
  s <- ((sum((d1-d1_bar)^2)) + (sum((d2-d2_bar)^2)))/(n-2)
  #print(paste("S:",s))
  
  testStatistic <- (d1_bar - d2_bar)/(s*sqrt((1/n1)+(1/n2)))
  
  lowerCritValue <- qt(p = alpha/2, df = (n-2))
  upperCritValue <- qt(p = 1-(alpha/2), df = (n-2))
  
  print(paste("The critical cutoff values are between",lowerCritValue,"and",upperCritValue))
  print(paste("The test Statistic is",testStatistic))
  print("")
  if(testStatistic < lowerCritValue || testStatistic > upperCritValue) {
    print(paste("Therefore we have",((1-alpha)*100),"% confidence to reject the Null Hypothesis, H0."))
    print("The Variances within the groups are significantly different from eachother")
  } else {
    print(paste("Therefore we have ",((1-alpha)*100),"% confidence to fail to reject the Null Hypothesis, H0."))
    print("The Variances within the groups are Not significantly different from eachother")
  }

}

dataSet <- cbind(mtcars$am, mtcars$mpg)
levenes_test(dataSet, alpha = 0.05)
