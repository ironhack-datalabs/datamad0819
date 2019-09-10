from bs4 import BeautifulSoup
import requests

#que se pide mas hamburguesa o pizza
#comparativa de estado eentree hamburguesa o piiza
#comparativa entre estados
def get_state():
    """consigue el nombre completo del estado.
    Ej: AL -> alabama"""
   

    html = requests.get("https://www.infoplease.com/us/postal-information/state-abbreviations-and-state-postal-codes")
    soup = BeautifulSoup(html.text,'html.parser')
    
    table = soup.find("table","sgmltable")
    tr = table.find_all("tr")
    result = {}
    
    for row in tr:
        try:
            td = row.find_all("td")
            result[td[2].text] = td[0].text
        except:
            pass
        
    
    return result
    
def get_population():
    """consigue el censo por estado"""

    html = requests.get("https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States_by_population")
    soup = BeautifulSoup(html.text,'html.parser')
    
    table = soup.find("table",["wikitable", "sortable", "jquery-tablesorter"])
   
    tr = table.find_all("tr")
    result = {}
    for row in tr:
        try:
            td = row.find_all("td")
            result[td[2].text.strip()] = int(td[3].text.strip().replace(",",""))
        except:
            pass
        
    return result

def get_obese():
    """consigue la obesidad por estado"""

    html = requests.get("https://en.wikipedia.org/wiki/Obesity_in_the_United_States")
    soup = BeautifulSoup(html.text,'html.parser')
    
    table = soup.find("table",["wikitable", "sortable", "jquery-tablesorter"])
   
    tr = table.find_all("tr")
    result = {}
    for row in tr:
        try:
            td = row.find_all("td")
            name = td[0].find("a").text.strip()
            percent = td[1].text.strip()
        
            result[name] = float(percent.replace("%",""))
        except:
            pass
    

    return result

