library(dplyr)
library(magrittr)
library(haven)

#prepare for the marital data
MA_marriage <-read_sas('Original_Data/Data/MA/ACS_16_5YR_S1201_with_ann2.sas7bdat')
NC_marriage <-read_sas('Original_Data/Data/NC/ACS_16_5YR_S1201_with_ann2.sas7bdat')
OR_marriage <-read_sas('Original_Data/Data/OR/ACS_16_5YR_S1201_with_ann2.sas7bdat')

Marriage <- (MA_marriage %>% mutate(state = 'MA')) %>%
  rbind( NC_marriage %>% mutate(state = 'NC') ) %>%
  rbind( OR_marriage %>% mutate(state = 'OR') ) %>%
  as_data_frame() %>%
  select(Zip = Zip, 
        Total_over_15 = HC01_EST_VC01,
        Married_over_15 = HC02_EST_VC01,
        Widowed_over_15 = HC03_EST_VC01,
        Divorced_over_15 = HC04_EST_VC01,
        Separated_over_15 = HC05_EST_VC01,
        Never_over_15 = HC06_EST_VC01,
        
        Total_over_15_M = HC01_EST_VC03,
        Married_over_15_M = HC02_EST_VC03,
        Widowed_over_15_M = HC03_EST_VC03,
        Divorced_over_15_M = HC04_EST_VC03,
        Separated_over_15_M = HC05_EST_VC03,
        Never_over_15_M = HC06_EST_VC03,
        
        Total_over_15_F = HC01_EST_VC10,
        Married_over_15_F = HC02_EST_VC10,
        Widowed_over_15_F = HC03_EST_VC10,
        Divorced_over_15_F = HC04_EST_VC10,
        Separated_over_15_F = HC05_EST_VC10, 
        Never_over_15_F = HC06_EST_VC10
  )

#convert from character values to numeric values
Marriage[2:19] <- sapply(Marriage[2:19], as.character)
Marriage[2:19] <- sapply(Marriage[2:19], as.numeric) # Notice that there are 15 warnings

#find NA values in Marriage
NAs <- Marriage[which(is.na(Marriage$Married_over_15)|is.na(Marriage$Married_over_15_M)|is.na(Marriage$Married_over_15_F)),]
# the warnings come from the zip code with 0 population/male/female over 15

write_sas(Marriage, 'Original_Data/Data/Marriage.sas7bdat')
write.csv(Marriage, 'Original_Data/csv/Marriage.csv')
