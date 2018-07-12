#Cleaning Census Data

#load libraries
library(haven)
library(tidyverse)

#read in race datasets
MArace <- read_sas("C:\\Users\\cmhopson\\Documents\\GitHub\\Summer_Practicum_19_blue_9\\Original_Data\\Data\\MA\\acs_16_5yr_b02001_with_ann2.sas7bdat")
NCrace <- read_sas("C:\\Users\\cmhopson\\Documents\\GitHub\\Summer_Practicum_19_blue_9\\Original_Data\\Data\\NC\\acs_16_5yr_b02001_with_ann2.sas7bdat")
ORrace <- read_sas("C:\\Users\\cmhopson\\Documents\\GitHub\\Summer_Practicum_19_blue_9\\Original_Data\\Data\\OR\\acs_16_5yr_b02001_with_ann2.sas7bdat")

#add a state column to each
MArace$State <- "MA"
NCrace$State <- "NC"
ORrace$State <- "OR"

#bind by zip code
totalrace <- rbind(MArace,NCrace,ORrace)

#keep only zip code, total population, white population (we're going to use to make proportions)
totalrace <- totalrace[c(1,2,3,12)]

#let's rename the columns
colnames(totalrace) <- c("Zip","Totalpop","Whitepop","State")

#finally, make sure the NA's are labeled correctly
totalrace$Totalpop[totalrace$Totalpop==0] <- NA
totalrace$Whitepop[totalrace$Whitepop==0] <- NA

#how many rows contain any NAs?
naracerows <- totalrace[rowSums(is.na(totalrace)) > 0,]
#14

#read in age/sex datasets
MAagesex <- read_sas("C:\\Users\\cmhopson\\Documents\\GitHub\\Summer_Practicum_19_blue_9\\Original_Data\\Data\\MA\\acs_16_5yr_s0101_with_ann2.sas7bdat")
NCagesex <- read_sas("C:\\Users\\cmhopson\\Documents\\GitHub\\Summer_Practicum_19_blue_9\\Original_Data\\Data\\NC\\acs_16_5yr_s0101_with_ann2.sas7bdat")
ORagesex <- read_sas("C:\\Users\\cmhopson\\Documents\\GitHub\\Summer_Practicum_19_blue_9\\Original_Data\\Data\\OR\\acs_16_5yr_s0101_with_ann2.sas7bdat")

#add a state column to each
MAagesex$State <- "MA"
NCagesex$State <- "NC"
ORagesex$State <- "OR"

#bind by zip code
totalagesex <- rbind(MAagesex,NCagesex,ORagesex)

#keep only zip code, total population, total male population, proportion over 18, proportion over 65, and median age
totalagesex <- totalagesex[c(1,2,3,74,83,89,110)]

#let's rename the columns
colnames(totalagesex) <- c("Zip","Totalpop","Malepop","Prop18","Prop65","Medianage","State")

#finally, make sure the NA's are labeled correctly
totalagesex$Totalpop[totalagesex$Totalpop==0] <- NA
totalagesex$Malepop[totalagesex$Malepop==0] <- NA
totalagesex$Prop18[totalagesex$Prop18==0] <- NA
totalagesex$Prop65[totalagesex$Prop65==0] <- NA
totalagesex$Medianage[totalagesex$Medianage==0] <- NA

#how many rows contain any NAs?
naagesexrows <- totalagesex[rowSums(is.na(totalagesex)) > 0,]
#28

#let's merge race and age/sex (includes NAs)
raceagesex <- merge(x=totalrace,y=totalagesex,by="Zip",all=TRUE)
#we have 1807 total observations

#are any of the na rows from race and sex the same?
natotal <- merge(x=naracerows,y=naagesexrows,by="Zip",all=TRUE)
#yes, overlap shows us that in total, 30 observations are missing from these datasets

