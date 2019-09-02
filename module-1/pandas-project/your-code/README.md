![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Data Cleaning and Manipulation with Pandas
Ironhack Madrid Data Bootcamp project nº1

<img style="float: left;" src="./images/pandashark.jpg" width="500">

## Overview

The goal of this project was to start with this messy data set [Shark Attack](https://www.kaggle.com/teajay/global-shark-attacks/version/1). I needed to import it and use data wrangling skills to clean it up, prepare it to be analyzed, and then export it as a clean CSV data file. 

In addition, I had to formulate an hypothesis based on the raw data file and prove it right or wrong by analyzing the cleansed database.

---

## Hypothesis

**"The time and place in history where conditions were the most favorable to be attacked by a shark were in the 1980 decade (decade that allowed for leisure but with fewer precautionary measures than upcoming ones), in Australia (country known for its shark population), New South Wales (where most of the Australian population lives), in December (their summer holidays), and in the morning."**


## Cleaning and analysis phase

I started from the hypothesis to clean the database towards a new database that could allow for analysis, following the next steps:

1. Diagnosing the data
2. Fixing the column names
3. Dealing with duplicates
   * Analyzing completely duplicate rows
   * Analyzing duplicate primary key 
4. Deleting not useful columns
5. Dealing with missing values
    * Importing fixer functions
    * Deleting columns where almost all values are NaN
    * Deleting rows for columns with less than 600 NaN
    * Filling the column 'age' NaN with the average of ages
    * Filling the column 'time' NaN with the value "unknown"
6. Fixing columns
    * Importing fixer functions
    * Fixing 'country', 'area', and 'sex' columns
    * Deleting rows with unknown values
7. Creating new columns
    * Importing maker functions
    * Creating new 'month' column
    * Creating new 'decade' column - using cut ranges
8. Analyzing outliers
9. Analyzing the cleaned data set
    * Shark attacks per country
    * Shark attacks per area
    * Shark attacks per sex
    * Shark attacks per age
    * Shark attacks per time
    * Shark attacks per month
    * Shark attacks per decade
    * Shark attacks per decade, country, area, month and time
10. Conclusion
11. Exporting file

The steps are further explained in the main.ipynb file, along with the code.


## Conclusions

1. The USA is the country with more shark attacks in history, followed by Australia
2. Florida is the area with more shark attacks, followed by New South Wales
3. 88,83% of the victims of shark attacks are men and just 11,17% are women
4. The average age of the victims is 27 years
5. The attacks are mostly in the afternoon
6. July is the month with most shark attacks ever
7. The 2000 decade is the decade with most sharks attacks until 2016

The hypothesis was close to being true, but the real time and place in history where conditions were the most favorable to be attacked by a shark were: 

**In the 2000 decade, in the USA, Florida, in September, and during the afternoon.**

**24 people were attacked under those conditions.**








