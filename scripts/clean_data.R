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
write_csv(activities_clean, "clean_data/activities_clean")

# NOTE - I still need to figure out how to sort/group this?


# Cleaning of activities
# - janitor on names
# - drop 'featurecode'
# - drop measurement
# - figure out how to group / sort this (the question is which type generates the most visits?)


# Cleaning on demographics
# - janitor
# - drop featurecode
# - drop measurement
# - there are many rows with "All" - seems to be an NA / other value.
    # Need to decide what I'll do about that. 

# Cleaning needed on location
# - janitor
# - drop featurecode
# - drop measurement

# Cleaning on travel
# - janitor
# - drop featurecode
# - drop measurement
# - 

# Cleaning to complete on domestic_tourism
# - janitor on names
# - drop 'measurement' column
# - drop 'featurecode' column
# - split into 3 sets? pounds, visits and nights?
#   - mutate DateCode to specify individual years

# Notes on cleaning accomodation
# - use janitor
# - drop 'FeatureCode'
# - drop 'measurement'
# - 