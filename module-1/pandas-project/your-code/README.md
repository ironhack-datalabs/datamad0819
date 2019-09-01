![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Project: Data Cleaning and Manipulation with Pandas

<img style="float: left;" src="./images/pandashark.jpg" width="500">

---

## Hypothesis

**"The time and place in history where conditions were the most favorable to be attacked by a shark were in the 1980 decade (decade that allowed for leisure but with fewer precautionary measures than upcoming decades), in Australia (country known for its shark population), New South Wales (where most of the Australian population lives), in December (their summer holidays), and in the morning."**

---

## Cleaning phase

I started from the hypothesis to clean the database towards a new database that could allow for analysis, following the next steps:

1. Diagnosing the data
2. Fixing the column names
3. Dealing with duplicates
   * Analyzed rows completely duplicate
   * Duplicate primary key 
4. Deleting not useful columns
5. Dealing with missing values
    * Importing fixer functions
    * Delete columns where almost all values are NaN
    * Delete rows for columns with less than 600 NaN
    *Filling the 'age' NaN with the average of ages
    *Filling the 'time' NaN with the value "unknown"
6. Fixing columns
    * Importing fixer functions
    * Fixing 'country', 'area', and 'sex' column
    * Deleting rows with unknown values
7. Creating new columns
    * Importing maker functions
    * Create new 'month' column
    * Create new 'decade' column - using cut ranges
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

1. The USA is the country with more shark attacks, followed by Australia
2. Florida is the are with more shark attacks, followed by New South Wales
3. 88,83% of the victims of shark attacks are men and just 11,17% are women
4. The average age of the victims is 27 years
5. The attacks are mostly in the afternoon
6. July is the month with most shark attacks ever
7. The 2000 decade is the decade with most sharks attacks to date (2006)

The hypothesis was close to being true, but the real time and place in history where conditions were the most favorable to be attacked by a shark were: 

**In the 2000 decade, in the USA, Florida, in September, and during the afternoon.**

**24 people were attacked under those conditions.**








