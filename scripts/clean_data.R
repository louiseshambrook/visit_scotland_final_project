# Cleaning and wrangling of data

# loading the required libraries
library(tidyverse)
library(janitor)

# cleaning the activities dataset ----------------------------------------------

activities <- read_csv("raw_data/tourism_day_visits_activities.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units") %>%
  mutate(activity_type = 
           case_when(tourism_activity == "Shopping for items that you do not regularly buy" ~ "Shopping",
                     tourism_activity == "Watched live sporting events (not on TV)" ~ "Watch sports",
                     tourism_activity == "Night out to a bar, pub and/or club" ~ "Night out",
                     tourism_activity == "Special personal events e.g. wedding, graduation" ~ "Attend personal event",
                     tourism_activity == "Leisure activities e.g. hobbies & evening classes" ~ "Leisure activity",
                     tourism_activity == "Sport participation, e.g. exercise classes, gym" ~ "Sports participation",
                     tourism_activity == "Special public event e.g. festival, exhibition" ~ "Attend public event",
                     tourism_activity == "Went out for a meal" ~ "Eating out",
                     tourism_activity == "Day out to a beauty/health centre/spa, etc." ~ "Day out (spa)",
                     tourism_activity == "Outdoor leisure activities e.g. walking, golf" ~ "Outdoor leisure",
                     tourism_activity == "Visitor attraction e.g. theme park, museum, zoo" ~ "Visitor attraction",
                     tourism_activity == "General day out/ to explore an area" ~ "Day out",
                     tourism_activity == "Entertainment - to a cinema, concert or theatre" ~ "Entertainment - cinema",
                     tourism_activity == "Day trips/excursions for other leisure purpose" ~ "Day trip - leisure",
                     tourism_activity == "Visited friends or family for leisure" ~ "Visit family/friends",
                     tourism_activity == "All" ~ "Other"))
write_csv(activities, "clean_data/activities_clean.csv")
rm(activities)


# cleaning the demographics dataset --------------------------------------------

demographics <- read_csv("raw_data/tourism_day_visits_demographics.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(demographics, "clean_data/demographics_clean.csv")
rm(demographics)

# when completing the analysis with the demographics dataset, I will have to examine
# each variable individually. There are too many variables with "all" as an answer,
# which I cannot remove in the cleaning process.


# cleaning the location dataset ------------------------------------------------

location <- read_csv("raw_data/tourism_day_visits_location.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(location, "clean_data/location_clean.csv")
rm(location)


# cleaning the transport dataset -----------------------------------------------

transport <- read_csv("raw_data/tourism_day_visits_transport.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units") %>%
  mutate(travel_type = 
           case_when(method_of_travel == "Bicycle" ~ "Bicycle",
                     method_of_travel == "Boat/Ship/Ferry" ~ "Boat/Ship/Ferry",
                     method_of_travel == "Bus or Coach - Minibus" ~ "Bus",
                     method_of_travel == "Bus or Coach - Organised Tour" ~ "Bus",
                     method_of_travel == "Bus or Coach - Regular" ~ "Bus",
                     method_of_travel == "Car - hired" ~ "Car",
                     method_of_travel == "Car - own/friends/family" ~ "Car",
                     method_of_travel == "Caravan/Campervan" ~ "Caravan",
                     method_of_travel == "Lorry/Truck/Van" ~ "Lorry",
                     method_of_travel == "Motor cycle" ~ "Motorcycle",
                     method_of_travel == "Other" ~ "Other",
                     method_of_travel == "Plane" ~ "Plane",
                     method_of_travel == "Taxi" ~ "Taxi",
                     method_of_travel == "Train" ~ "Train/Tube/Tram",
                     method_of_travel == "Tram" ~ "Train/Tube/Tram",
                     method_of_travel == "Tube" ~ "Train/Tube/Tram",
                     method_of_travel == "Walked" ~ "Walked",
                     method_of_travel == "All" ~ "Other"))
write_csv(transport, "clean_data/transport_clean.csv")
rm(transport)


# cleaning the accommodation dataset --------------------------------------------

accomodation <- read_csv("raw_data/scottish_accomodation_occupancy.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units")
write_csv(accomodation, "clean_data/accomodation_clean.csv")
rm(accomodation)


# cleaning the regional_domestic dataset ---------------------------------------
regional_domestic %>%
  separate(year, into = c("start_year", "end_year"), sep = "-") %>%
  mutate(start_year = as.numeric(start_year),
         end_year = as.numeric(end_year)) %>%
  mutate(middle_year = case_when(start_year == 2009 & end_year == 2011 ~ 2010,
                                 start_year == 2010 & end_year == 2012 ~ 2011,
                                 start_year == 2011 & end_year == 2013 ~ 2012,
                                 start_year == 2012 & end_year == 2014 ~ 2013,
                                 start_year == 2013 & end_year == 2015 ~ 2014,
                                 start_year == 2014 & end_year == 2016 ~ 2015,
                                 start_year == 2015 & end_year == 2017 ~ 2016,
                                 start_year == 2016 & end_year == 2018 ~ 2017,
                                 start_year == 2017 & end_year == 2019 ~ 2018,
                                 start_year < 2009 & end_year > 2019 ~ 0)) %>%
  relocate(middle_year, .after = (start_year))
write_csv(regional_domestic, "clean_data/regional_domestic_clean.csv")
rm(regional_domestic)

# This is the pivoted and mutated dataset. I haven't written to csv yet, as I'm
# not sure if it is better to use this one, or the original. Because each item covers
# three years, I'm not sure whether this or the original is better for timeseries analysis.

