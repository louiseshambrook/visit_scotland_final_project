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
rm(activities)
rm(activities_clean)

activities_clean_mutated <- activities_clean %>%
  mutate(activity_type = 
           case_when(tourism_activity == "Shopping for items that you do not regularly buy" ~ "Shopping",
                     tourism_activity == "Watched live sporting events (not on TV)" ~ "Attend events (sports)",
                     tourism_activity == "Night out to a bar, pub and/or club" ~ "Going out",
                     tourism_activity == "Special personal events e.g. wedding, graduation" ~ "Attend events (personal)",
                     tourism_activity == "Leisure activities e.g. hobbies & evening classes" ~ "Leisure",
                     tourism_activity == "Sport participation, e.g. exercise classes, gym" ~ "Sports",
                     tourism_activity == "Special public event e.g. festival, exhibition" ~ "Attend events",
                     tourism_activity == "Went out for a meal" ~ "Going out",
                     tourism_activity == "Day out to a beauty/health centre/spa, etc." ~ "Leisure",
                     tourism_activity == "Outdoor leisure activities e.g. walking, golf" ~ "Leisure",
                     tourism_activity == "Visitor attraction e.g. theme park, museum, zoo" ~ "Day trip (visit attractions)",
                     tourism_activity == "General day out/ to explore an area" ~ "Day trip",
                     tourism_activity == "Entertainment - to a cinema, concert or theatre" ~ "Going out",
                     tourism_activity == "Day trips/excursions for other leisure purpose" ~ "Day trip",
                     tourism_activity == "Visited friends or family for leisure" ~ "Visit family/friends",
                     tourism_activity == "All" ~ "Other"))

# same as with the regional dataset; this is still under development, but I have
# saved it to a variable for now (but not to a csv as I don't know if I will use
# it in the analysis)


# cleaning the demographics dataset --------------------------------------------

demographics <- read_csv("raw_data/tourism_day_visits_demographics.csv")
demographics_clean <- demographics %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(demographics_clean, "clean_data/demographics_clean.csv")
rm(demographics)
rm(demographics_clean)

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
rm(location)
rm(location_clean)


# cleaning the transport dataset -----------------------------------------------

transport <- read_csv("raw_data/tourism_day_visits_transport.csv")
transport_clean <- transport %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(transport_clean, "clean_data/transport_clean.csv")
rm(transport)
rm(transport_clean)


# cleaning the accommodation dataset --------------------------------------------

accomodation <- read_csv("raw_data/scottish_accomodation_occupancy.csv")
accomodation_clean <- accomodation %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(accomodation_clean, "clean_data/accomodation_clean.csv")
rm(accomodation)
rm(accomodation_clean)


# cleaning the regional_domestic dataset ---------------------------------------
regional_domestic <- read_csv("raw_data/regional_domestic_tourism.csv")
regional_domestic_clean <- regional_domestic %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(regional_domestic_clean, "clean_data/regional_domestic_clean.csv")
rm(regional_domestic)
rm(regional_domestic_clean)


regional_pivoted <- regional_domestic_clean %>%
  separate(year, into = c("year_1", "year_3"), sep = "-") %>%
  mutate(year_1 = as.numeric(year_1),
         year_3 = as.numeric(year_3)) %>%
  mutate(year_2 = case_when(year_1 == 2009 & year_3 == 2011 ~ 2010,
                            year_1 == 2010 & year_3 == 2012 ~ 2011,
                            year_1 == 2011 & year_3 == 2013 ~ 2012,
                            year_1 == 2012 & year_3 == 2014 ~ 2013,
                            year_1 == 2013 & year_3 == 2015 ~ 2014,
                            year_1 == 2014 & year_3 == 2016 ~ 2015,
                            year_1 == 2015 & year_3 == 2017 ~ 2016,
                            year_1 == 2016 & year_3 == 2018 ~ 2017,
                            year_1 == 2017 & year_3 == 2019 ~ 2018,
                            year_1 < 2009 & year_3 > 2019 ~ 0)) %>%
  relocate(year_2, .after = (year_1)) %>%
  pivot_longer(cols = starts_with("year"), names_repair = "unique")

# This is the pivoted and mutated dataset. I haven't written to csv yet, as I'm
# not sure if it is better to use this one, or the original. Because each item covers
# three years, I'm not sure whether this or the original is better for timeseries analysis.

