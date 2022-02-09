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
  mutate(activity_type = case_when(
                    tourism_activity ==
                       "Shopping for items that you do not regularly buy"
                     ~ "Shopping",
                     tourism_activity ==
                       "Watched live sporting events (not on TV)"
                     ~ "Watch live sports",
                     tourism_activity == "Night out to a bar, pub and/or club"
                     ~ "Night out",
                     tourism_activity ==
                       "Special personal events e.g. wedding, graduation"
                     ~ "Attend personal event",
                     tourism_activity ==
                       "Leisure activities e.g. hobbies & evening classes"
                     ~ "Leisure activity",
                     tourism_activity ==
                       "Sport participation, e.g. exercise classes, gym"
                     ~ "Sports participation",
                     tourism_activity ==
                       "Special public event e.g. festival, exhibition"
                     ~ "Attend public event",
                     tourism_activity == "Went out for a meal" ~ "Eating out",
                     tourism_activity ==
                       "Day out to a beauty/health centre/spa, etc."
                     ~ "Day out (spa)",
                     tourism_activity ==
                       "Outdoor leisure activities e.g. walking, golf"
                     ~ "Outdoor leisure activity",
                     tourism_activity ==
                       "Visitor attraction e.g. theme park, museum, zoo"
                     ~ "Visitor attraction",
                     tourism_activity ==
                       "General day out/ to explore an area" ~ "Day out",
                     tourism_activity ==
                       "Entertainment - to a cinema, concert or theatre"
                     ~ "Entertainment - cinema etc.",
                     tourism_activity ==
                       "Day trips/excursions for other leisure purpose"
                     ~ "Day trip - leisure",
                     tourism_activity ==
                       "Visited friends or family for leisure"
                     ~ "Visit family/friends",
                     tourism_activity == "All" ~ "Other")) %>%
  mutate(unit = ifelse(unit == "million pounds (GBP)",
                       "million (£)", "million")) %>%
  relocate(value, .after = year) %>%
  relocate(breakdown_of_domestic_tourism, .after = unit) %>%
  select(-tourism_activity)
write_csv(activities, "clean_data/activities_clean.csv")
rm(activities)


# cleaning the demographics dataset --------------------------------------------
demographics <- read_csv("raw_data/tourism_day_visits_demographics.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units") %>%
  mutate(unit = ifelse(unit == "million pounds (GBP)",
                       "million (£)", "million")) %>%
  relocate(value, .after = year) %>%
  relocate(breakdown_of_domestic_tourism, .after = unit)
write_csv(demographics, "clean_data/demographics_clean.csv")
rm(demographics)


# cleaning the location dataset ------------------------------------------------
location <- read_csv("raw_data/tourism_day_visits_location.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units") %>%
  mutate(type_of_location_visited = 
           case_when(type_of_location_visited == "City/large town"
                     ~ "City/large town",
                     type_of_location_visited == "Rural countryside"
                     ~ "Rural countryside",
                     type_of_location_visited == "Seaside - beach" ~ "Seaside",
                     type_of_location_visited == "Seaside - other" ~ "Seaside",
                     type_of_location_visited == "Seaside resort or town"
                     ~ "Seaside",
                     type_of_location_visited == "Small town" ~ "Small town",
                     type_of_location_visited == "Village" ~ "Village",
                     type_of_location_visited == "All areas" ~ "Other")) %>%
  mutate(unit = ifelse(unit == "million pounds (GBP)",
                       "million (£)", "million")) %>%
  relocate(value, .after = year) %>%
  relocate(breakdown_of_domestic_tourism, .after = unit)
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
                     method_of_travel == "Train" ~ "Train",
                     method_of_travel == "Tram" ~ "Tram",
                     method_of_travel == "Tube" ~ "Tube",
                     method_of_travel == "Walked" ~ "Walked",
                     method_of_travel == "All" ~ "Other")) %>%
  mutate(unit = ifelse(unit == "million pounds (GBP)",
                       "million (£)", "million")) %>%
  relocate(value, .after = year) %>%
  relocate(breakdown_of_domestic_tourism, .after = unit) %>%
  select(-method_of_travel)
write_csv(transport, "clean_data/transport_clean.csv")
rm(transport)


# cleaning the accommodation dataset -------------------------------------------
accomodation <- read_csv("raw_data/scottish_accomodation_occupancy.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(year = "date_code",
         unit = "units") %>%
  mutate(location = 
           case_when(location == "Accessible Rural" ~ "Rural",
                     location == "Accessible Small Towns" ~ "Small town",
                     location == "Large Urban Areas" ~ "Urban area",
                     location == "Other Urban Areas" ~ "Urban area",
                     location == "Remote Rural" ~ "Remote rural",
                     location == "Remote Small Towns" ~ "Remote small town",
                     location == "All" ~ "Other")) %>%
  separate(accommodation_type_and_occupancy,
           into = c("accommodation_type","occupancy_type"), sep = "-") %>%
  mutate(unit = ifelse(unit == "Percentage", "percentage", NA)) %>%
  relocate(value, .after = year)
write_csv(accomodation, "clean_data/accomodation_clean.csv")
rm(accomodation)


# cleaning the regional_domestic dataset ---------------------------------------
regional_domestic <- read_csv("raw_data/regional_domestic_tourism.csv") %>%
  clean_names() %>%
  select(-feature_code, -measurement) %>%
  rename(years = "date_code",
         unit = "units")%>%
  mutate(spend_unit = case_when(unit == "million pounds (GBP)" ~ "million (£)"),
         visit_night_unit = case_when(unit == "Thousand Nights" ~ "Thousand",
                                      unit == "Thousand Visits" ~ "Thousand")) %>%
  select(-unit) %>%
  relocate(spend_unit, .after = value) %>%
  relocate(visit_night_unit, .after = spend_unit) %>%
  relocate(breakdown_of_domestic_tourism, .after = visit_night_unit)
write_csv(regional_domestic, "clean_data/regional_domestic_clean.csv")
rm(regional_domestic)

