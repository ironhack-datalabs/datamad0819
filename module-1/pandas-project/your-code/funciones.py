import numpy as np
import re

def clean_year(año):  
    if año > 1600 : 
        return año
    else:
        return np.nan


def clean_month(month):
        if len(month) > 3:
           return month.replace(month,month[:3])
        elif month == "Jut":
           return month.replace(month,'Jun')
        
def cha_col_pos(col,pos,df):

    lista_col = []
    for i in df.columns:
        lista_col.append(i)
        
    lista_col.pop(lista_col.index(col))
    lista_col.insert(pos,col)
    
    return df[lista_col]

def fatal_cl(Fatal):
        if Fatal == 'N' or Fatal == 'Y':
            return Fatal
        else:
            return np.nan


def dist_month(fecha):
   
    
    mes_fila = ''.join(re.findall('\-[A-Za-z]{3}\-',fecha))

    mes_fila = re.sub('\-','', mes_fila).capitalize()

    if mes_fila == '':
        mes_fila = np.nan


    return mes_fila


def dist_act(acty):
        
    act_fila = ''.join(re.findall(('Surfing|surfing|Surf|surf|Board|board'),acty))
        
    act_fila = re.sub('\-','', act_fila).capitalize()
            
            
    if act_fila == '':
        act_fila = np.nan

    return act_fila