
import re

def clean_colum(df):
    
    col_clean = []
    for col in df.columns:
        col = col.strip().lower()
        col = col.replace('.',' ')
        col = col.replace(" ","_")
        col_clean.append(col)
        
    df.columns = col_clean
    return df.columns

def clean_surf(val):
    if type(val) == str:
        if re.match('Surf|surf', val):
            return 'surfing'
        else:
            return val
    else: 
        return val

        

def clean_fatal(val):
    if val == "Y":
        return True
    else:
        return False