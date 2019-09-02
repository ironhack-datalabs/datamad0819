import pandas as pd
import numpy as np
import os
import re

def check_nulls(dataframe):
    null_cols = dataframe.isnull().sum()
    return (null_cols[null_cols > 0]), dataframe.columns, dataframe.shape

def espacio(text):
    if re.search('\ (N)', text):
        return 'N'
    return text


def drop_less_10( df, column):
    keys = df["column"].value_counts().index
    values = df["column"].value_counts().values
    countries = {keys[i]: values[i] for i in range(len(keys))}
    drop_countries = []

    for i in countries:
        if countries[i] < 10:
            drop_countries.append(i)
        else:
            pass
 
    for c in drop_countries:
        df = df[df["column"] != c]

    return df


def activities(text):
    if re.search('(urfing)+', str(text)):
        return 'Surfing'
    elif re.search('(Surf)+', str(text)):
        return 'Surfing'
    elif re.search('(oarding)+',str(text)):
        return 'Surfing'
    elif re.search('(ishing)+', str(text)):
        return 'Fishing'
    elif re.search('(iving)+', str(text)):
        return 'Diving'
    elif re.search('(norke)+', str(text)):
        return 'Snorkeling'
    elif re.search('(wimming)+', str(text)):
        return 'Swimming'
    elif re.search('(Sea)\ [a-zA-Z](isaster)',str(text)):
        return 'Sea Disaster'
    elif re.search('(Air)\ [a-zA-Z](isaster)',str(text)):
        return 'Air Disaster'
    elif re.search('(Paddle)',str(text)):
        return 'Paddle Sport'
    elif re.search('(anoe)',str(text)):
        return 'Rowing'
    elif re.search('(ayak)',str(text)):
        return 'Rowing'
    elif re.search('(Walking)+',str(text)):
        return 'Treading Water'
    elif re.search('(Bathing)+',str(text)):
        return 'Swimming'
    else:
        return 'Other'

    return text

def gender(text):
    if re.search('(M )', str(text)):
        return 'M'
    
    return text


def tipo(text):
    if re.search('(Boating)', str(text)):
        return 'Boat'
    if re.search('(Sea Disaster)',str(text)):
        return 'Unprovoked'
    
    return text

