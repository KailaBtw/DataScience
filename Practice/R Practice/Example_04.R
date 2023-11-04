winCount <- 0
drawCount <- 0

N<- 5000
Me <- sample(c("R", "P","S"), size=N, replace = TRUE)
You <- sample(c("R", "P","S"), size=N, replace = TRUE)
#result <- rep(NA, N)


for(i in 1:N)  {
  if(Me[i] == "R" & You[i] == "S") {
    winCount <- winCount + 1
  } else if (Me[i] == "P" & You[i] == "R") {
    winCount <- winCount + 1
  } else if (Me[i] == "S" & You[i] == "P") {
    winCount <- winCount + 1
    #result[i] <- 0 
  }
  if (Me[i] == You[i]) {
    drawCount = drawCount + 1
  }
}

winCount
winRatio = winCount/N
winRatio
drawCount




