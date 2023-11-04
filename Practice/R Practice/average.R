myFunc = function(input1, input2) {
  return (input, input)
}
myFunc(input1 = 2, input2 = 3)

avg.function <- function(input) {
  if (is.numeric(input)) {
    sum <- sum(input)
    n = length(input)
    avg <- sum/n
    return(avg)
  } else {
    print("error")
  }
}

#this is a comment


x <- c(1,2,3,4)
avg.function(x)


d.fun = function(input) {
  return(mean(abs(input-median(input))))
}

#d.fun(x)





func <- function(input) {
  
  sqrt(sum((input-mean(input))^2)/(length(input)-1))
  
}
#x <- c(1,2,3,4,5,6,7,8)
#s.fun(x)




stat.fun <- function(input1, input2) {
  diff = d.fun(input1) - d.fun(input2)
  s = s.fun(c(input1, input2))
  statistic = diff/(s*sqrt(length(input1)+1/length(input2)))

  return(statistic)
}

set.seed(325)
x = rnorm(n=100, mean=0, sd=1)
y = rnorm(n=100, mean=0, sd=3)
stat.fun(input = x, input2 = y)


