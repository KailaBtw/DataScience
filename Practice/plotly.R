

#point to which package to use with library
library("plotly")

data <- cbind(mtcars$mpg, mtcars$am)
colors <- c("red", "blue")

plot <- plot_ly(x = data[,2],
                y = data[,1],
                style = "scatter",
                mode = "markers",
                markers = list(lise = 8, 
                               symbol = "diamond", 
                               line = list(width = 1)),
                color = data[,2],
                colors = c("hotpink", "purple")) %>%
layout(title = "Effect of transmission type on MPG",
       plot_bgcolor='#e5ecf6', 
       xaxis = list( 
         zeroline = FALSE,
         ticktext = list("Auto", "Manual"),
         tickvals = list(0,1),
         zerolinecolor = '#ffff', 
         zerolinewidth = 2, 
         gridcolor = 'ffff',
         title = "Tranismission Type"),
       #range = c(0.5, 1.5),
       
       yaxis = list( 
         zerolinecolor = '#ffff', 
         zerolinewidth = 2, 
         gridcolor = 'ffff',
         title = "MPG"))

            
             #+markers

#rbind(c(1,2,3,4,5),c(2,3,4,5,6))
mtcars$mpg
mtcars$am
  
plot  






























