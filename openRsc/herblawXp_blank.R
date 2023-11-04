#super runecrafting = 250xp actual
#Potion of Saradomon = 360 xp actual
#super ranging potion = 365xp actual

#primary Ingredients (fill these in)
guam = 0 
mar = 0
tar = 0
har = 0
ranarr = 0
irit = 0
ava = 0
kwuarm = 0
cada = 0
dwarf = 0
torstol = 0

#secondaries (fill these in)
newts = 0
limps = 0
snapes = 0
horns = 0
eggs = 0
berries = 0
wines = 0

#other vars
baseXp = 0  #put in what your current xp is before "training"
sinisterKeyCount = 0 #put in how many sinister keys you have

#increase herb count based on number of sinister keys
sinisterKeys <- function(keys) {
  ava <<- ava + keys
  kwuarm <<- kwuarm + keys
  irit <<- irit + keys
  torstol <<- torstol + keys
  ranarr <<- ranarr + (3*keys)
  har <<- har + (keys*2)
  #print("sinisters calculated")
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



