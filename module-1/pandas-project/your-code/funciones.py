import pandas as pd
from collections import Counter

def check_nulls(shdf):
    
    print("Date nulls: ", pd.isnull(shdf["Date"]).values.ravel().sum())
    print("Year nulls: ", pd.isnull(shdf["Year"]).values.ravel().sum())
    print("Type nulls: ", pd.isnull(shdf["Type"]).values.ravel().sum())
    print("Country nulls: ", pd.isnull(shdf["Country"]).values.ravel().sum())
    print("Area nulls: ", pd.isnull(shdf["Area"]).values.ravel().sum())
    print("Location nulls: ", pd.isnull(shdf["Location"]).values.ravel().sum())
    print("Activity nulls: ", pd.isnull(shdf["Activity"]).values.ravel().sum())
    #print("Sex nulls: ", pd.isnull(shdf["Sex"]).values.ravel().sum())
    print("Age nulls: ", pd.isnull(shdf["Age"]).values.ravel().sum())
    print("Injury nulls: ", pd.isnull(shdf["Injury"]).values.ravel().sum())
    print("Fatal (Y/N) nulls: ", pd.isnull(shdf["Fatal (Y/N)"]).values.ravel().sum())
    print("Time: ", pd.isnull(shdf["Time"]).values.ravel().sum())

    
def ataques_ano_pais(shdf,a_inicial,a_final):
    years_list = shdf["Year"].values.tolist()
    new_list=[]
    country_list = shdf["Country"].values.tolist()
    for i in range(len(years_list)):
        if (years_list[i] >= a_inicial) and (years_list[i] <= a_final):
            new_list.append(country_list[i])
    new_counter=Counter(new_list)
    return new_counter.most_common(5)