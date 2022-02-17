# VisitScotland - Louise Shambrook
Final Project - CodeClan
Professional Data Analysis

## The Brief
visitscotland.com is the official website of VisitScotland, Scotland's national tourist board. VisitScotland works closely with private businesses, public agencies and local authorities to ensure that visitors experience the very best of Scotland and that the country makes the most of its outstanding tourism assets and realises its potential.

I selected this brief, as I visited Scotland in 2017 on my honeymoon for the first time, and later decided to move to Scotland. I was curious to see how much of my experience as a visitors was reflected in data.

This brief set out 9 questions, including whether change in visits and spend could be predicted.

## Data sources
6 datasets were provided. Two of these were from scot.gov and four of my datasets were obtained from visitscotland

## Data quality and bias
All the data I worked with was of good quality. There were no true missing values across all datasets (NA's), but it did seem that all datasets did use the value 'All' in place of this. Therefore, little cleaning was required and the missing values could be filtered out in the wrangling process.
There were also some columns which were irrelvant to my analysis, which were removed during my cleaning process; examples are 'FeatureCode', and 'Units'.

In the demographics dataset, only one variable which related to the data was available at a time. It is not known whether data was collected across all variables or if this was cleaned prior to being collected, but nonetheless, it lowered the potential quality of the analysis.

## Ethics
There were no ethical concerns regarding this data, as it was published by scot.gov, and I am therefore confident in terms of data storage / protection and it did not contain any personally identifiable information. 

## Analysis
The main stages of my analysis process were loading the datasets into RStudio, and exploring this, using a range of functions.

Once I had gotten to grips with the datasets, I began the process of cleaning the data, and wrangling it into a format on which I could complete my analysis. The cleaning and wrangling mainly comprised of removing, adding and changing columns, and changing variable names.

Once the data was in a stage that I was satisfied with, I began to calculate various summary statistics, and create graphs of these.

I also then began to build a predictive model of whether any variables had an effect on value or spend over time; this was done in Python. However, this was unsuccessful and is therefore not included.

Lastly, I interpreted my graphs and summarised my findings in a presentation, and put together my business recommendations. 

## Analysis and Insights
From my analysis, I have gained insights into customer trends. In turn, I have used these insights to put forward recommendations to VisitScotland. My recommendations are based on both improving the business' strategy, i.e how considering how the business could increase visits and spends, but also exploring the current challenges and shortcomings in the data, and putting forward recommedations to improve these, which will ultimately drive stronger data-driven decisions.

Specifically, the insights from my analysis were that the majority of visitors travel by and have access to a car. Additionally, there is a trend of visitors visiting cities; this is evident by exploring both the location data, but also by exploring the accommodations visitors use. Continuing on this thread, B&B's and hotels are the most popular type of accommodation. Additionally, there is an interesting intersection in data between urban areas, and the average occupation of B&B's, as this has been increasing since 2016. The overall profile of a visitor to Scotland is someone who does not have children, and is married; however, a key caveat to this is that the data collection method in demographics is binary, and therefore there are limited options. A better way to profile visitors is by age; 16-24 is the most popular age group, but this is declining, and so for an age group to target, the age group of 55+ is most prolific, as the attendance of these have been steadily increasing since 2015. Data is also profiled by home country, and here England is the dominant feature; however, this is also a dataset where there are limited options, as Wales and Northern Ireland are not included. Lastly, the most common activities in Scotland by visitors are eating out, and visiting family and friends

From my analysis and insights, I have recommended that VisitScotland can be confident that the majority of their customers travel by and have access to car, so any promotions that they may have planned which involve remote locations, they can confidently proceed with.
I recommended that VisitScotland develop partnerships with B&B providers, particularly in urban areas, which is an area that they should focus on. In terms of profiling a demographic, the age group of 55+ is the age group I recommend to target.
The key takeaway from my analysis however, is to restructure their data collection, as there were shortcomings in two datasets which made analysis a challenge. I also recommended that they collect data more frequently, e.g. monthly, as this would allow for predictive models to be built, which is not currently possible. 
