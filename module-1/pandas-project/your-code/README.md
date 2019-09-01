# PANDAS-PROJECT

## Introduction

This proyect consist in import and cleaning a pandas DataFrame  and export it to a csv file

## Steps
* Import the csv file and analyze ir
* Cleaning null values
* Cleaning columns
** Cleaning "fatal"
** Cleaning "type"
** Cleaning "activity"
** Adding "country"
** Cleaning "sex"
** Cleaning "species"
*** Searching for patterns length in "species" and adding the column "lenght" using them
*** Cleaning "species"
** Testing the URLs in "href" column (Incomplete)
** Writing the cleaning.csv whith clean columns in output folder

## Conclusions
* Regular expresions in python are powerful in data cleaning
* Searching for hidden patterns in a dirty data set will be very important for extract new data
* Study python requests library can be interesting for extract and evaluate data in the internet
* I only have a solution for checkint the "href" columns: try to download the file and cath the exception (BUT IS STUPID)

##  Improvements
* Evaluate and clean the totaly of columns
* Make the chekingUrl function useful.