# Pandas Project

## 1.- Objective 

The pandas project takes as objective cleaning and tidying up the shark.csv data file obtained from Kaggle in order to put into practice all the cleaning techniques learned for the pandas library.

## 2.- Data

The raw data comes from the Global Shark Attack Incident [Kaggle web-page](https://www.kaggle.com/teajay/global-shark-attacks/version/1)

## 3.- Project Folder

The project has the following structure: 

    - README.md: the current file. Explains the basic transformations made to the dataset.
    
    - input: folder containing the imported csv file.
    
    - output: folder containing the transformed csv file.
    
    - funciones.py: file containing all user defined functions to perform transformations in the data set.
    
    - Pandas Project.ipynb: Jupyter notebook file with operations made in the notebook.

## 4.- Analysis

As expected, the data file was not going to be a very tidy dataset. To perform some cleaning, I followed the subsequent steps: 

    1.- After importing the data, change column names to delete capital letters, spaces and symbols from the original column names.

    2.- The data had 5992 rows and 24 columns. Last two columns had 5992 null values, so columns were dropped.

    3.- Case number columns and order number had duplicated value and apparently no value at all for the analysis, so they were dropped as well. As well as pdf and “href” columns. information contained in those columns can be checked if necessary, but it is not important for analysis. 

    4.- Date: year column is converted to integer and rows with information from years before 1800 is deleted. As seen in many examples, information contained in those years is not very reliable.
    Seasons column is created with the date column converted to datetime format. 

    5.- Age: Age column is transforming into integer values using pandas to_numeric function. Not possible to convert values are considered as NaN. Not deleted till future decision. 

    6.- Male (age): male column is converted to Boolean taking into consideration the different values existing in the column

    7.- Is fatal column was mapped from Y, N and other values to True and False to facilitate future analysis. 
    
    8.- Time_aux: time column is analysed and mapped into day-time categories to facilitate future analysis. Although there a 50% of values missing, the column has not been dropped as time looks essential for analysis. 

   
     


