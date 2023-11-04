Y <- mtcars$mpg
X <- mtcars$am
lm(Y ~ X)$residuals

residuals <- (lm(Y ~ X)$residuals)

len <- length(sort(unique(X)))
small <- sort(unique(X))[len/2]
median(X)

small.group <- residuals[which(x <= small)]



Y <- data[,1]
X <- data[,2]


