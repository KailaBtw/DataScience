#super runecrafting = 250xp actual
#Potion of Saradomon = 360 xp actual
#super ranging potion = 365xp actual


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



#find which is lower, secondaries or herbs (to calc pot count)
findMinimums <- function() {
  attackPots <<- min(c(guam + (0.1 * guam),newts + (0.1 * newts)))
  poisonPots <<- min(c(mar + (0.1 * mar),horns + (0.1 * horns)))
  strPots <<- min(c(tar + (0.1 * tar),limps + (0.1 * limps)))
  statPots <<- min(c(har + (0.1 * har),eggs + (0.1 * eggs)))
  prayPots <<- min(c(ranarr + (0.1 * ranarr),snapes + (0.1 * snapes)))
  superAtks <<- min(c(irit + (0.1 * irit),newts + (0.1 * newts)))
  superStrs <<- min(c(kwuarm + (0.1 * kwuarm),limps + (0.1 * limps)))
  superRunePots <<- ava + (0.1 * ava)
  superDefs <<- min(c(cada + (0.1 * cada),berries + (0.1 * berries)))
  rangePots <<- min(c(dwarf + (0.1 * dwarf),wines + (0.1 * wines)))
  saraPots <<- torstol + (0.1 * torstol)
  #print("mins calculated")
}


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


#starting information

#primary Ingredients
guam = 1919000
mar = 1551000
tar = 708000
har = 636000
ranarr = 419000
irit = 268000
ava = 243000
kwuarm = 161000
cada = 122000
dwarf = 95000
torstol = 0

#secondaries
newts = 1665000+200000+20000000 #dded 200k to each for infinite secondaries
limps = 806000+2000000
snapes = 604000+2000000
horns = 1186000+35000+2000000
eggs = 503000
berries = 168000
wines = 73000+2000000

#other vars
baseXp = 92660000
sinisterKeyCount = 33000 #2331xp each (with sara pots)


#"main" method

sinisterKeys(sinisterKeyCount)
findMinimums()
findVials()
calculateTotal(baseXp)

paste("Total Zammy Wine needed",rangePots)
paste("Total Half Coconuts needed",rangePots)
paste("Total Fish oil needed",(superRunePots*10))
paste("Total Sliced Dragnfruit needed",saraPots)

paste("Total Vials Needed",totalVials)
paste("Total Xp:",totalXp)



