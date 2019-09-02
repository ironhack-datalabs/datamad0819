# Project: Data Cleaning and Manipulation with Pandas


## Overview
As a first porject it is proposed to clean data in a given [dataframe](https://www.kaggle.com/teajay/global-shark-attacks/version/1), and start to get some conclussions.

The provided dataframe contains data from shark attacks along the history. It shows information about the date, the places where it was produced the letality of the attack and what was this person doing while shark attacks.

## Project structure

The project folder is structured in the following way:

* __pandas-proyect-main.ipynb__ : contains the notebook with the calculums and all the explanations about our research.

* __input__ : Folder where the dataset should be placed in csv format.

* __output__ : Folder that contains the cleaned datasets after clenaing an analysis.

* __modules__: Folder that concains the file functions.py with all the auxiliar functios used in our project.

## Data import process

The first step in this project is to import the data from the provided .csv file to a pandas DataFrame.

In this case the .csv file provided is nos codified in utf-8, so it has been to import it with the parameter encode='iso-8859-1'.

## DataFrame lecture and overview of data usability

A first lecture of our dataframe shows that it has 5992 rows and 24 columns. It contains columns with a lost of NaN values and others with names, urls, references to sources, those are data that can be used to d a analysis, but there are information that could be more interesting to get information in a easily way, so I decided to start focusing in the easy to clean and extrac information.

The selected columns to get information in a first issue are the mortality, the sex of the person, the year and the month (given from date column), the type of attack (in order to know if it was provoked or not)
It could help us to see how attacks has evolved around the years, what months are mostly probable to be attacked by a shark, and if really sharks are as letal as it is beleived.

In a second issue, there will be focused in activity and country in order to know where are the most dangerous oceans and seas in the world and what are the most risky activities.