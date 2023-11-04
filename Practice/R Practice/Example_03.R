x <- c(1,2,3,4,5,6)
length(x)
x[3] #index starts with 1


b <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2, byrow = TRUE)
b
dim(b)
b[1,2] #   row, column specific value
b[ ,2] # grab an entire column

#create blank vector to store our data
y <- rep(NA, length=length(x))  #repeat 

for (i in 1:6) {
  y[i] <- x[i] + 2;
}
