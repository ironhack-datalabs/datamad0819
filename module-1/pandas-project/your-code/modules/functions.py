import re
import pandas as pd
import numpy as np

def get_poor_rows(df,nulls = 2):
    # Returns indexes of rows with more than 2 Nulls in it.
    return [index for index, fila in df.iterrows() if fila.isnull().sum() > nulls]



def drop_by_index(df, indexes):
    # Drop rows by a given index or list of indexes.
    return df.drop(df.iloc[indexes].index)


def get_month_from_date(df):
    # From date in 'date' column gets the tree letter corresponding to month, and returns them in a list.
    temp_lst = []
    for row in df['Date']:
        temp_row = ''.join(re.findall('\-?[A-Za-z]{3}\-',row)).lower()
        temp_row = re.sub('\-','',temp_row)
               
        if temp_row == '':
            temp_row = np.nan

        temp_lst.append(temp_row)
    return temp_lst
