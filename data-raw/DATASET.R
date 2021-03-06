library(tidyverse)
library(knitr)
library(kableExtra)
library(RCurl)
if (!file.exists("housing_loans.rds")) {
  HousingLoans <- read.csv(unzip("hmda_2017_ma_all-records_labels.zip")) %>%
    saveRDS(file = "housing_loans.rds")
  print(".rds file created.")
  HousingLoans <- read_rds("housing_loans.rds")
} else {
  HousingLoans <- read_rds("housing_loans.rds")
}
HousingLoans <- HousingLoans %>% # We focus on the following columns for this analysis
  select(agency_name, loan_purpose_name, owner_occupancy_name,
         loan_amount_000s, preapproval_name,
         action_taken_name, loan_type_name,
         property_type_name, county_name) %>%
  select(sort(tidyselect::peek_vars())) %>% # Organize the columns by sorting and renaming
  rename(c(Agency = agency_name, Loan_Purpose = loan_purpose_name,
           Owner_Occupancy = owner_occupancy_name,
           Loan_Amount_In_Thousands = loan_amount_000s,
           Preapproval = preapproval_name,
           Action_Taken = action_taken_name,
           Loan_Type = loan_type_name,
           Property_Type = property_type_name,
           County = county_name))  %>%
  filter(!(County == "")) %>% # Remove entries with missing county/occupancy information
  filter(!(Owner_Occupancy == "Not applicable")) %>%
  mutate(across(where(is.character), as.factor)) # Convert string columns to factors
HousingLoans <- HousingLoans %>%
  filter(!(Action_Taken %in% c("File closed for incompleteness",
                               "Loan purchsed by the institution"))) %>%
  mutate(Loan_Accepted =
           ifelse(Action_Taken == "Loan originated", TRUE, FALSE)) %>%
  select(-Action_Taken)
HousingLoans %>% select(-Loan_Amount_In_Thousands) %>% lapply(table)
usethis::use_data(HousingLoans)

