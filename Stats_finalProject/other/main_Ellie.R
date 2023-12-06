#Stat 325 Final Project
#Ellie Lagrave

#library(dplyr)
#library(tidyverse)

#Import our CSV data into R studio

setwd('./') #set directory (relative pathing here)

gii_data = read.csv("GII_Data.csv")
hdi_data = read.csv("HDI_Data.csv")


#Test our data was imported correctly
#head(gii_data)
#head(hdi_data)

#Our data contains multiple columns of NA, or junk data, remove them
#(probably headers from excel format conversion)
gii_data = subset(gii_data, select = 
                    -c(X.1, X.3, X.5, X.7, X.9, X.11, X.13, X.15, X.17))
hdi_data = subset(hdi_data, select = 
                    -c(X.1, X.3, X.5, X.7, X.9, X.11, X.13, X.14, X.15,
                       X.16, X.17, X.18, X.19, X.20, X.21, X.22, X.23, X.24))

#Data frame columns look clean, now clean the rows
#We want to remove na rows, ".." rows and "" rows
gii_data <- gii_data[!apply(is.na(gii_data) | gii_data$X == ".." | gii_data$X == "", 1, all),]
hdi_data <- hdi_data[!apply(is.na(hdi_data) | hdi_data$X == ".." | hdi_data$X == "", 1, all),]

#Our rown names are now non sequential from our removal
rownames(gii_data) <- 1:nrow(gii_data)
rownames(hdi_data) <- 1:nrow(hdi_data)


#The end of the data has 15 rows of global/regional data
#subset them just incase we need later (then remove)
gii_global_data <- gii_data[174:188, ]
hdi_global_data <- hdi_data[174:188, ]

#fix global data index
rownames(gii_global_data) <- 1:nrow(gii_global_data)
rownames(hdi_global_data) <- 1:nrow(hdi_global_data)

# Now we want to subset our rows remove global data (footer data)
gii_data <- head(gii_data, -15)
hdi_data <- head(hdi_data, -15)

#Now we need to remove empty/unneeded header rows
gii_data = gii_data[-c(1:3),]
hdi_data = hdi_data[-c(1:3),]

#Our rown names are now non sequential from our removal
rownames(gii_data) <- 1:nrow(gii_data)
rownames(hdi_data) <- 1:nrow(hdi_data)

#Our data frame column names are generic, lets rename columns 
newGiiColumnNames <- c(
  "hdiRank", 
  "country", 
  "gii",
  "rank",
  "maternalMortality",
  "adolBirthRate",
  "fSeatsParlament",
  "fSecondaryEdu",
  "mSecondaryEdu",
  "fLaborForce",
  "mLaborForce"
  )

for (i in 1:11) {
  names(gii_data)[i] <- newGiiColumnNames[i]
}

newHdiColumnNames <- c(
  "hdiRank", 
  "country", 
  "hdiValue",
  "lifeExpec",
  "expecYearsSchool",
  "meanYearsSchool",
  "gniCapita",
  "gniMinusHdi",
  "hdi2020"
)

for (i in 1:9) {
  names(hdi_data)[i] <- newHdiColumnNames[i]
}

#Data was visually inspected by scrolling through, both are clean
#head(gii_data)
#colnames(gii_data)
#colnames(hdi_data)

str(gii_data)
str(hdi_data)
#Now, looking at our data it is stored as a character, convert to numeric values
gii_data[, c(1,3:11)] <- sapply(gii_data[, c(1,3:11)], as.numeric)
hdi_data[, c(1,3:6,8:9)] <- sapply(hdi_data[, c(1,3:6,8:9)], as.numeric)


#Lets reverse the value of gii (closer to 0 is better)
#to match HDI value (closer to 1 is better)
#I.e. (1 - gii value) = gii value reversed
gii_data$gii <- 1 - gii_data$gii

#for(i in 1:170) {
 # gii_data$gii[i] <- 1 - gii_data$gii[i]
#}


#hdi_data_subset <- hdi_data[1:170,]

nrow(gii_data)
nrow(hdi_data)


plot(gii_data$gii,hdi_data[1:170,]$hdiValue)




