import numpy as np
import re

def clean_year(año):  
    if año > 1600 : 
        return año
    else:
        return np.nan


def clean_month(month):
    for i in month:
        if len(i) > 3:
           return month.replace(i,i[:3], inplace=True)
        if i == "Jut":
           return month.replace(i,'Jun', inplace=True)
        
def cha_col_pos(col,pos,df):
    
    lista_col = []
    for i in df.columns:
        lista_col.append(i)
        
    lista_col.pop(lista_col.index(col))
    lista_col.insert(pos,col)
    
    return df[lista_col]

def fatal_cl(Fatal):
    for i in Fatal:
        if Fatal == 'N' or Fatal == 'Y':
            return Fatal
        else:
            return np.nan