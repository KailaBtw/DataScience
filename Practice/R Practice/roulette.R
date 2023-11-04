winCount <- 0
winnings <- 0

N = 1000

for(i in 1:N)  {  #i is our index value and takes on the value 1 to N (1000)
  #thus for loop repeats 1000 times
  
  
  guess = runif(1, min = 0, max = 1) #guess 0 for even, 1 for odd
  #runif just selects a random double value between 0 and 1
  # a floating point is like 1.00001 with frational values
  guess = as.integer(guess) #convert double to whole number integer (like 1)
  
  rollBoard = runif(1, min = 0, max = 37) #37 is 00
  # random double from 0 to 37
  rollBoard = as.integer(rollBoard)
  #convert double to whole number integer 0 to 37
  
  if(rollBoard < 37 & (rollBoard %% 2 == 0)) { #if even  (i %2 == 0)
    if (guess == 0) { #if I guessed 0 for even
      winCount = winCount + 1 #increment number of wins
      winnings = winnings + 36 #add 36 to my winnings
    }
  } else if(rollBoard < 37 & (rollBoard + 1 %% 2 == 0)) { #if odd (i+1 %2 == 0)
    if (guess == 1) { #if I guessed 1 for odd
      winCount = winCount + 1 #increment number of wins
      winnings = winnings + 36 #add 36 to my winnings
    }
  } else {
    winnings = winnings - 1 #if I lose reduce winnings by
  }
  
}

winCount #print win count

winnings #print winnings (profit)

winRatio = winCount/N #calculate ratio of wins over total

winRatio #print win ratio

