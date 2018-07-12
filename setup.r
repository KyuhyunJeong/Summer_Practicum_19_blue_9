library(dplyr)
library(magrittr)
library(haven)

# for the marital data
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

#wrie the final dataset in sas and csv files
write_sas(Marriage, 'Original_Data/Data/Marriage.sas7bdat')
write.csv(Marriage, 'Original_Data/csv/Marriage.csv')

#clean any temporary datasets
remove(MA_marriage, NC_marriage, OR_marriage, NAs, Marriage)


# for the school data
#prepare for the school data
MA_school <-read_sas('Original_Data/Data/MA/ACS_16_5YR_S1401_with_ann2.sas7bdat')
NC_school <-read_sas('Original_Data/Data/NC/ACS_16_5YR_S1401_with_ann2.sas7bdat')
OR_school <-read_sas('Original_Data/Data/OR/ACS_16_5YR_S1401_with_ann2.sas7bdat')

School <- (MA_school %>% mutate(state = 'MA')) %>%
  rbind( NC_school %>% mutate(state = 'NC') ) %>%
  rbind( OR_school %>% mutate(state = 'OR') ) %>%
  as_data_frame() %>%
  select(Zip = Zip, 
         Num_3yrs = HC01_EST_VC01,
         # Pct_3yrs = HC02_EST_VC01,        commented variables do not have a valid values
         # Num_3yrs_pub = HC03_EST_VC01,
         Pct_3yrs_pub = HC04_EST_VC01,
         # Num_3yrs_pri = HC05_EST_VC01,
         Pct_3yrs_pri = HC06_EST_VC01,
         
         Num_high = HC01_EST_VC07,
         Pct_high = HC02_EST_VC07,
         Num_high_pub = HC03_EST_VC07,
         Pct_high_pub = HC04_EST_VC07,
         Num_high_pri = HC05_EST_VC07,
         Pct_high_pri = HC06_EST_VC07,
         
         Num_coll = HC01_EST_VC08,
         Pct_coll = HC02_EST_VC08,
         Num_coll_pub = HC03_EST_VC08,
         Pct_coll_pub = HC04_EST_VC08,
         Num_coll_pri = HC05_EST_VC08,
         Pct_coll_pri = HC06_EST_VC08,
         
         Num_grad = HC01_EST_VC09,
         Pct_grad = HC02_EST_VC09,
         Num_grad_pub = HC03_EST_VC09,
         Pct_grad_pub = HC04_EST_VC09,
         Num_grad_pri = HC05_EST_VC09,
         Pct_grad_pri = HC06_EST_VC09,
         
         Num_1824 = HC01_EST_VC40,
         Pct_1824 = HC02_EST_VC40,
         Num_1824_pub = HC03_EST_VC40,
         Pct_1824_pub = HC04_EST_VC40,
         Num_1824_pri = HC05_EST_VC40,
         Pct_1824_pri = HC06_EST_VC40
  )

#convert from character values to numeric values
School[2:28] <- sapply(School[2:28], as.character)
School[2:28] <- sapply(School[2:28], as.numeric) # Notice that there are 15 warnings

#find NA values in School
NAs <- School[which(is.na(School$Pct_high)|is.na(School$Pct_coll)|is.na(School$Pct_grad)|is.na(School$Pct_1824)),]
NAs_pri <- School[which(is.na(School$Pct_3yrs_pri)|is.na(School$Pct_high_pri)|is.na(School$Pct_coll_pri)|is.na(School$Pct_grad_pri)|is.na(School$Pct_1824_pri)),]
NAs_pub <- School[which(is.na(School$Pct_3yrs_pub)|is.na(School$Pct_high_pub)|is.na(School$Pct_coll_pub)|is.na(School$Pct_grad_pub)|is.na(School$Pct_1824_pub)),]
NAs_no_match <- NAs_pri[which(!(NAs_pri$Zip %in% NAs_pub$Zip))]
# the warnings come from the zip code with 0 population went to private school
# No Observation found on non matching zip code in private and public NA values
# This implies that if there is any NA values in private sector, there must be a NA value in public sector and vice versa

write_sas(School, 'Original_Data/Data/School.sas7bdat')
write.csv(School, 'Original_Data/csv/School.csv')

remove(MA_school, NC_school, OR_school, NAs, NAs_pri, NAs_pub, NAs_no_match, School)

# for the employment data
#prepare for the employment data
MA_employment <-read_sas('Original_Data/Data/MA/ACS_16_5YR_S2301_with_ann2.sas7bdat')
NC_employment <-read_sas('Original_Data/Data/NC/ACS_16_5YR_S2301_with_ann2.sas7bdat')
OR_employment <-read_sas('Original_Data/Data/OR/ACS_16_5YR_S2301_with_ann2.sas7bdat')

Employment <- (MA_employment %>% mutate(state = 'MA')) %>%
  rbind( NC_employment %>% mutate(state = 'NC') ) %>%
  rbind( OR_employment %>% mutate(state = 'OR') ) %>%
  as_data_frame() %>%
  select(Zip = Zip, 
         Total_over_16 = HC01_EST_VC01,
         LF_over_16 = HC02_EST_VC01,
         ER_over_16 = HC03_EST_VC01,
         UR_over_16 = HC04_EST_VC01,
         
         Total_2064 = HC01_EST_VC26,
         LF_2064 = HC02_EST_VC26,
         ER_2064 = HC03_EST_VC26,
         UR_2064 = HC04_EST_VC26,
         
         Total_lt_pl = HC01_EST_VC36,
         LF_lt_pl = HC02_EST_VC36,
         ER_lt_pl = HC03_EST_VC36,
         UR_lt_pl = HC04_EST_VC36,
         
         Total_ge_pl = HC01_EST_VC37,
         LF_ge_pl = HC02_EST_VC37,
         ER_ge_pl = HC03_EST_VC37,
         UR_ge_pl = HC04_EST_VC37
  )

#convert from character values to numeric values
Employment[2:17] <- sapply(Employment[2:17], as.character)
Employment[2:17] <- sapply(Employment[2:17], as.numeric) # Notice that there are 15 warnings

#find NA values in Employment
NAs_over_16 <- Employment[which(is.na(Employment$Total_over_16)|is.na(Employment$LF_over_16)|is.na(Employment$ER_over_16)|is.na(Employment$UR_over_16)),]
NAs_2064 <- Employment[which(is.na(Employment$Total_2064)|is.na(Employment$LF_2064)|is.na(Employment$ER_2064)|is.na(Employment$UR_2064)),]
NAs_lt_pl <- Employment[which(is.na(Employment$Total_lt_pl)|is.na(Employment$LF_lt_pl)|is.na(Employment$ER_lt_pl)|is.na(Employment$UR_lt_pl)),]
NAs_ge_pl <- Employment[which(is.na(Employment$Total_ge_pl)|is.na(Employment$LF_ge_pl)|is.na(Employment$ER_ge_pl)|is.na(Employment$UR_ge_pl)),]
# the warnings come from the zip code with 0 ppl with that criteria

#wrie the final dataset in sas and csv files
write_sas(Employment, 'Original_Data/Data/Employment.sas7bdat')
write.csv(Employment, 'Original_Data/csv/Employment.csv')

#clean any temporary datasets
remove(MA_employment, NC_employment, OR_employment, NAs_over_16, NAs_2064, NAs_lt_pl, NAs_ge_pl, Employment)


#Merging all data
#reading the data
Employment <- read.csv("Original_Data/csv/Employment.csv")
Marriage <- read.csv("Original_Data/csv/Marriage.csv")
School <- read.csv("Original_Data/csv/School.csv")
Income <- read.csv("Original_Data/csv/Income.csv")
Raceagesex <- read.csv("Original_Data/csv/Raceagesex.csv")
Education <- read.csv("Original_Data/csv/Education.csv")
Households <- read.csv("Original_Data/csv/Households.csv")
Proverty  <- read.csv("Original_Data/csv/proverty.csv")

Merged_cleaned_data <- Employment %>%
  left_join(Marriage, by="Zip") %>%
  left_join(School, by="Zip") %>%
  left_join(Income, by="Zip") %>%
  left_join(Raceagesex, by="Zip") %>%
  left_join(Education, by="Zip") %>%
  left_join(Proverty, by="Zip") %>%
  left_join(Households, by="Zip")

write.csv(Merged_cleaned_data, 'Original_Data/csv/Merged_cleaned_data.csv')
write_sas(Merged_cleaned_data, 'Original_Data/csv/Merged_cleaned_data.sas7bdat')

remove(Employment, Marriage, School, Income, Raceagesex, Education, Households)
