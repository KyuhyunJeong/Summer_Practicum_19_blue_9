Merged_cleaned_data <- read.csv("Original_Data/csv/Merged_cleaned_data.csv")

Merged_cleaned_data %>%
  filter(Total_over_15==0) %>%
  select(Zip, Total_over_15, Totalpop.x)
