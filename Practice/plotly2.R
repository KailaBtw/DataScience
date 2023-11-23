

#point to which package to use with library
library("plotly")

data <- cbind(mtcars$mpg, mtcars$am)
colors <- c("red", "blue")

plot <- plot_ly() %>%
  add_trace(x = mtcars$am[which(mtcars$am == 0)],
            y = mtcars$mpg[which(mtcars$am == 0)],
            type = "scatter", mode = "markers",
            name = "Auto", showlegend = FALSE) %>%
  add_trace(x = mtcars$am[which(mtcars$am == 1)],
            y = mtcars$mpg[which(mtcars$am == 1)],
            type = "scatter", mode = "markers",
            name = "Manual", showlegend = FALSE) %>%
  layout(xaxis = list(zeroline = FALSE,
                      ticktext = list("Auto", "Manual"),
                      tickvals = list(0,1)
                      ))
  
  
  plot  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  