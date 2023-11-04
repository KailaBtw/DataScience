#install.packages("stats")
#install.packages(c("Rtools", "stats"))   #c is a list

#library(help = "stats")

library(stats)

#x <- c(1,2,3,4,5) #set value of variable x

x <- rnorm(n=500, mean = 4, sd = 1)     #??rnorm
y <- rexp(400, rate = 0.3)

ks.test(x=x, y=y)


