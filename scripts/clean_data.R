# Cleaning and wrangling of data

# loading the required libraries
library(tidyverse)
library(janitor)

# cleaning the activities dataset ----------------------------------------------

activities <- read_csv("raw_data/tourism_day_visits_activities.csv")
activities_clean <- activities %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(activities_clean, "clean_data/activities_clean.csv")

# NOTE - I still need to figure out how to sort/group this?
# I can't clock this one - I will have to come back to it.


# cleaning the demographics dataset --------------------------------------------

demographics <- read_csv("raw_data/tourism_day_visits_demographics.csv")
demographics_clean <- demographics %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(demographics_clean, "clean_data/demographics_clean.csv")

# when completing the analysis with the demographics dataset, I will have to examine
# each variable individually. There are too many variables with "all" as an answer,
# which I cannot remove in the cleaning process.


# cleaning the location dataset ------------------------------------------------

location <- read_csv("raw_data/tourism_day_visits_location.csv")
location_clean <- location %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(location_clean, "clean_data/location_clean.csv")


# cleaning the transport dataset -----------------------------------------------

transport <- read_csv("raw_data/tourism_day_visits_transport.csv")
transport_clean <- transport %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(transport_clean, "clean_data/transport_clean.csv")


# cleaning the accommodation dataset --------------------------------------------

accomodation <- read_csv("raw_data/scottish_accomodation_occupancy.csv")
accomodation_clean <- accomodation %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(accomodation_clean, "clean_data/accomodation_clean.csv")


# cleaning the regional_domestic dataset ---------------------------------------
regional_domestic <- read_csv("raw_data/regional_domestic_tourism.csv")
regional_domestic_clean <- regional_domestic %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(regional_domestic_clean, "clean_data/regional_domestic_clean.csv")

# NOTE - I still need to figure out what to do about the years here!!


