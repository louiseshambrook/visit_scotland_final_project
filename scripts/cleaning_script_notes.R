# Notes for cleaning script

# Cleaning to complete on domestic_tourism
# - janitor on names
# - drop 'measurement' column
# - drop 'featurecode' column
# - split into 3 sets? pounds, visits and nights?
#   - mutate DateCode to specify individual years

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
# - One of the questions is "who spends the most" (and visit) - spend and visit
# aren't features in that dataset. So I will have to think about joining, and how I do that.