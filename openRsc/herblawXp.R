#super runecrafting = 250xp actual
#Potion of Saradomon = 360 xp actual
#super ranging potion = 365xp actual

#primary Ingredients
guam = 1678000 
mar = 1371000
tar = 571000
har = 531000
ranarr = 336000
irit = 209300
ava = 191300
kwuarm = 124600
cada = 93100
dwarf = 73000
torstol = 0

#secondaries
newts = 1665000
limps = 806000
snapes = 604000
horns = 1096000
eggs = 503000
berries = 168000
wines = 73000

#other vars
baseXp = 92660000
sinisterKeyCount = 32026 #2331xp each (with sara pots)


#increase herb count based on number of sinister keys
sinisterKeys <- function(keys) {
  ava <<- ava + keys
  kwuarm <<- kwuarm + keys
  irit <<- irit + keys
  torstol <<- torstol + keys
  ranarr <<- ranarr + (3*keys)
  har <<- har + (keys*2)
  print("sinisters calculated")
}
sinisterKeys(sinisterKeyCount)


#find which is lower, secondaries or herbs (to calc pot count)
findMinimums <- function() {
  attackPots <<- min(c(guam,newts))
  poisonPots <<- min(c(mar,horns))
  strPots <<- min(c(tar,limps))
  statPots <<- min(c(har,eggs))
  prayPots <<- min(c(ranarr,snapes))
  superAtks <<- min(c(irit,newts))
  superStrs <<- min(c(kwuarm,limps))
  superRunePots <<- ava
  superDefs <<- min(c(cada,berries))
  rangePots <<- min(c(dwarf,wines))
  saraPots <<- torstol
  #print("mins calculated")
}
findMinimums()


#find the total number of vials required
findVials <- function() {
  totalVials <<- 0
  totalVials <<- totalVials + attackPots
  totalVials <<- totalVials + poisonPots
  totalVials <<- totalVials + strPots
  totalVials <<- totalVials + statPots
  totalVials <<- totalVials + prayPots
  totalVials <<- totalVials + superAtks
  totalVials <<- totalVials + superStrs
  totalVials <<- totalVials + superRunePots
  totalVials <<- totalVials + superDefs
  totalVials <<- totalVials + rangePots
  totalVials <<- totalVials + saraPots
  totalVials <<- totalVials + rangePots
  #print("vials calculated")
}
findVials()

#calculate the herblaw xp after 
calculateTotal <- function(currentXp) {
  totalXp <<- 0
  totalXp <<- totalXp + currentXp
  totalXp <<- totalXp + (attackPots * 50)
  totalXp <<- totalXp + (poisonPots * 75)
  totalXp <<- totalXp + (strPots * 100)
  totalXp <<- totalXp + (statPots * 125)
  totalXp <<- totalXp + (prayPots * 175)
  totalXp <<- totalXp + (superAtks * 200)
  totalXp <<- totalXp + (superStrs * 250)
  totalXp <<- totalXp + (superRunePots * 250)
  totalXp <<- totalXp + (superDefs * 300)
  totalXp <<- totalXp + (rangePots * 325)
  totalXp <<- totalXp + (saraPots * 360)
  totalXp <<- totalXp + (rangePots * 365)
  #print("done Calculating Total")
}
calculateTotal(baseXp)

paste("Total Zammy Wine needed",rangePots)
paste("Total Half Coconuts needed",rangePots)
paste("Total Fish oil needed",(superRunePots*10))
paste("Total Sliced Dragnfruit needed",saraPots)

paste("Total Vials Needed",totalVials)
paste("Total Xp:",totalXp)



