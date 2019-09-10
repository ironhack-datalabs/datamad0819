import requests
import time
import os
from dotenv import load_dotenv
load_dotenv()
import pandas as pd

def authRequest(url, key):

    # cómo hacer una llamada a la Api

    api_key = key
    
    response = requests.get("https://api.nytimes.com/svc/community/v3/user-content/url.json?url={}&api-key={}".format(url, api_key))
    #if response.status_code ==  429:
    time.sleep(6.2)
    print(response.status_code)
    #print(response.headers)
    response = response.json()
    return response


def comments(response):

    # cómo extraer los comentarios

    try:
        if response == 0:
            return "Not url"
        elif response["results"]["totalCommentsFound"] == 0:
            return "Not comments"
        else:
            return [item["commentBody"] for item in response["results"]["comments"]][0]
    except:
        print("Error")



def num_comments(response):

    # cómo obtener el número de comentarios

    try:
        if response == 0:
            return 0
        else:
            result = response["results"]["totalCommentsFound"]
        return result
    
    except:
        print("Error")


def suma_atentados(year):

    # calcula el número de atentados registrado en un año concreto en Nueva York y el número de muertos

    data = pd.read_csv("./output/atentadosNY.csv")

    if year >= 2001:
        total_atentados = len([item for item in atentadosNY["iyear"] if item == year])
        total_fallecidos = atentadosNY.loc[atentadosNY["iyear"] == year, "nkill"].sum()
        return "El número total de atentados en Nueva York en {} fue de {}. Los fallecidos asecendieron a {}".format(year, total_atentados, total_fallecidos)
    
    else:
        return "El año de búsqueda debe ser igual a 2001 o superior"

    
'''
def ciudades(pregunta):
    if pregunta == "Si":
        data = pd.read_csv("./output/atentadosEEUU.csv")
        top10cities = data["city"].value_counts()[:10]
        return top10cities
    else:
        return ("Hasta la próxima")

'''
