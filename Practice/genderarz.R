height <- rnorm(100)
weight <- rnorm(100)
gender<- sample(c(0,1), 100, replace = TRUE)
data <- cbind(height, weight, gender)


fig <- plot_ly()%>%
  add_trace(c = height[which(gender ==0)])
add_trace(c = weight[which(gender ==0)])  





add_trace(c = height[which(gender ==1)])
add_trace(c = weight[which(gender ==1)])  