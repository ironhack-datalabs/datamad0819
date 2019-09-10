import pandas as pd
from funciones import authRequest, comments, num_comments
import requests
import time
import os
from dotenv import load_dotenv
load_dotenv()

# Lectura del csv # TENGO QUE CAMBIAR EL DIRECTORIO DEL CSV!!!


data = pd.read_csv("./input/globalterrorismdb_0718dist.csv", encoding = "ISO-8859-1", dtype='unicode')

# Limpieza de columnas

remove_columns = ["approxdate", "extended", "resolution", "region", "region_txt",
                  "provstate", "vicinity", "location", "latitude", "longitude", "specificity",
                  "weaptype2", "weaptype2_txt", "weapsubtype2", "weapsubtype2_txt", "weaptype3",
                  "weaptype3_txt", "weapsubtype3", "weapsubtype3_txt", "weaptype4",
                  "weaptype4_txt", "weapsubtype4", "weapsubtype4_txt", "targsubtype1",
                  "targsubtype1_txt", "corp1", "targtype2", "targtype2_txt",
                  "targsubtype2", "targsubtype2_txt", "corp2", "target2", "natlty2", "natlty2_txt",
                  "targtype3", "targtype3_txt", "targsubtype3", "targsubtype3_txt", "corp3",
                  "target3", "natlty3", "natlty3_txt", "gsubname", "gname2", "gsubname2", "gname3",
                  "gsubname3", "guncertain1", "guncertain2", "guncertain3", "nperpcap", "claimed",
                  "claimmode", "claimmode_txt", "compclaim", "claim2", "claimmode2", "claim3",
                  "claimmode3", "property", "propextent", "propextent_txt", "propvalue", "propcomment",
                  "nhostkidus", "nhours", "ndays", "divert", "kidhijcountry", "ransom", "ransomamt",
                  "ransomamtus", "ransompaid", "ransompaidus", "ransomnote", "addnotes", "INT_LOG",
                  "INT_IDEO", "INT_MISC", "INT_ANY", "scite1", "scite2", "scite3", "dbsource",
                  "alternative", "alternative_txt", "attacktype2", "attacktype2_txt",
                  "attacktype3", "attacktype3_txt", "claimmode2_txt", "claimmode3_txt",
                  "nkillus", "nwoundus", "ishostkid", "nhostkid", "hostkidoutcome",
                  "hostkidoutcome_txt", "nreleased", "related"]

clean_data = data.drop(columns=remove_columns)

# Eliminación de filas para obtener solo los atentados cometidos en Estados Unidos a partir de 1997, la fecha en la que los responsables
# del dataset apuntan los datos tienen mayor consistencia 
# Cambiar el tipo de datos de algunas columnas para ese filtrado ["iyear"] ["country"] ["nkill"]

#print(clean_data.columns)

clean_data["city"] = clean_data["city"].astype(str)
clean_data["country"] = clean_data["country"].astype(int)
clean_data["iyear"] =  clean_data["iyear"].astype(int)
clean_data["imonth"] =  clean_data["imonth"].astype(int)
clean_data["iday"] =  clean_data["iday"].astype(int)
clean_data["nkil"] = clean_data["nkill"].fillna(0)
clean_data["nkill"] = pd.to_numeric(clean_data["nkill"])

atentadosEEUU = clean_data.loc[clean_data["country"] == 217]
atentadosNY = clean_data.loc[clean_data["city"] == "New York City"]
atentadosNY = atentadosNY.loc[atentadosNY["iyear"] >= 2001]

# Creación de una columna con la url encontrada de cada atentado

atentados = {
    71959: 0,
    73126: "https://www.nytimes.com/2001/09/12/us/us-attacked-hijacked-jets-destroy-twin-towers-and-hit-pentagon-in-day-of-terror.html?searchResultPosition=12",
    73127: "https://www.nytimes.com/2001/09/12/us/us-attacked-hijacked-jets-destroy-twin-towers-and-hit-pentagon-in-day-of-terror.html?searchResultPosition=12",
    73240: "https://www.nytimes.com/2001/10/12/national/anthrax-found-in-nbc-news-aide.html?searchResultPosition=1",
    73245: "https://www.nytimes.com/2001/10/16/nyregion/a-nation-challenged-new-york-city-anthrax-found-in-baby-of-abc-news-producer.html?searchResultPosition=1",
    73254: "https://www.nytimes.com/2001/10/17/nyregion/anthrax-spores-found-in-patakis-midtown-office.html?searchResultPosition=1",
    73258: "https://www.nytimes.com/2001/10/19/nyregion/a-nation-challenged-the-new-cases-anthrax-is-found-in-2-more-people.html?searchResultPosition=3",
    73260: "https://www.nytimes.com/2001/10/19/nyregion/woman-at-new-york-post-tests-positive-for-anthrax-exposure.html?searchResultPosition=1",
    73291: "https://www.nytimes.com/2001/10/30/nyregion/possible-anthrax-case-shuts-a-new-york-hospital.html?searchResultPosition=7",
    74653: "https://www.nytimes.com/2002/10/03/nyregion/shots-fired-outside-un-building.html?searchResultPosition=3",
    78014: "https://www.nytimes.com/2005/05/06/world/europe/2-explosions-near-british-consulate.html?searchResultPosition=1",
    84565: "https://cityroom.blogs.nytimes.com/2007/10/26/2-hand-grenades-thrown-into-mexican-consulate/?searchResultPosition=1&mtrref=www.nytimes.com&gwh=FE2E0B4E942EE018586F5CC9B7BECCC1&gwt=pay&assetType=PAYWALL",
    85879: "https://cityroom.blogs.nytimes.com/2008/03/06/police-investigate-explosion-in-times-square/?searchResultPosition=1&mtrref=www.nytimes.com&gwh=9F08107675CD5C8DB8B659ADB18AB2BD&gwt=pay&assetType=PAYWALL",
    95520: 0,
    96291: "https://www.nytimes.com/2010/05/03/nyregion/03timessquare.html?searchResultPosition=12&mtrref=www.nytimes.com&gwh=AB307D0C127132D410073FEA0C8303C2&gwt=pay&assetType=PAYWALL",
    104833: "https://www.nytimes.com/2012/01/04/nyregion/firebomber-picked-targets-to-settle-scores-nyc-police-say.html?searchResultPosition=1&mtrref=www.nytimes.com&gwh=1EAB1E5D6009E1AFAE5F1492EECCED95&gwt=pay&assetType=PAYWALL",
    104834: "https://www.nytimes.com/2012/01/04/nyregion/firebomber-picked-targets-to-settle-scores-nyc-police-say.html?searchResultPosition=1&mtrref=www.nytimes.com&gwh=1EAB1E5D6009E1AFAE5F1492EECCED95&gwt=pay&assetType=PAYWALL",
    104835: "https://www.nytimes.com/2012/01/04/nyregion/firebomber-picked-targets-to-settle-scores-nyc-police-say.html?searchResultPosition=1&mtrref=www.nytimes.com&gwh=1EAB1E5D6009E1AFAE5F1492EECCED95&gwt=pay&assetType=PAYWALL",
    104836: "https://www.nytimes.com/2012/01/04/nyregion/firebomber-picked-targets-to-settle-scores-nyc-police-say.html?searchResultPosition=1&mtrref=www.nytimes.com&gwh=1EAB1E5D6009E1AFAE5F1492EECCED95&gwt=pay&assetType=PAYWALL",
    117355: "https://www.nytimes.com/2013/05/30/nyregion/letter-sent-to-bloomberg-is-said-to-test-positive-for-ricin.html?searchResultPosition=2",
    138675: "https://artsbeat.blogs.nytimes.com/2014/10/05/exhibit-on-ukraine-displays-signs-of-vandalism/?searchResultPosition=1&mtrref=www.nytimes.com&gwh=C560B470E115273981E003A0E1F3A5B4&gwt=pay&assetType=PAYWALL",
    139525: "https://www.nytimes.com/2014/10/24/nyregion/new-york-police-fatally-shoot-man-who-attacked-officer-with-a-hatchet.html?searchResultPosition=2",
    141778: "https://www.nytimes.com/2014/12/21/nyregion/two-police-officers-shot-in-their-patrol-car-in-brooklyn.html?searchResultPosition=4",
    156274: 0,
    157730: "https://www.nytimes.com/2016/01/17/nyregion/assailants-yell-isis-isis-during-attack-on-man-in-bronx-police-say.html?searchResultPosition=1",
    163330: "https://www.nytimes.com/2016/06/11/nyregion/police-seek-arsonist-after-attacks-on-2-staten-island-churches.html?searchResultPosition=1",
    163488: "https://www.nytimes.com/2016/06/11/nyregion/police-seek-arsonist-after-attacks-on-2-staten-island-churches.html?searchResultPosition=1",
    165945: "https://www.nytimes.com/2016/08/13/nyregion/queens-mosque-shooting.html?searchResultPosition=2",
    167059: "https://www.nytimes.com/2016/09/18/nyregion/chelsea-explosion-new-york-city.html?searchResultPosition=14",
    167060: "https://www.nytimes.com/2016/09/20/nyregion/nyc-nj-explosions-ahmad-khan-rahami.html?searchResultPosition=4",
    173161: "https://www.nytimes.com/2017/03/22/nyregion/manhattan-nyc-james-harris-jackson-hate-crime.html?searchResultPosition=1",
    175258: 0,
    175413: 0,
    175701: 0,
    175737: 0,
    176364: 0,
    180118: "https://www.nytimes.com/2017/10/31/nyregion/police-shooting-lower-manhattan.html?searchResultPosition=5",
    181219: "https://www.nytimes.com/2017/12/11/nyregion/explosion-times-square.html?searchResultPosition=2"
}

atentadosNY["urlatentado"] = list(atentados.values())

# Creación de una columna con el comentario encontrado

api_key = os.getenv("api_key")

#print(api_key)

lista = []

for item in atentadosNY["urlatentado"]:
    if item == 0:
        lista.append(0)
    else:
        lista.append(authRequest(item, api_key))


comentarios = []

for item in lista:
    comentarios.append(comments(item))


atentadosNY["comments"] = comentarios

# Creación de una columna con el número de comentarios para cada artículo

numero_comentarios = []

for item in lista:
    numero_comentarios.append(num_comments(item))


atentadosNY["num_comments"] = numero_comentarios


# Creación de dos csv, uno con los datos de Estados Unidos y otro con los de NY


atentadosEEUU.to_csv("./output/atentadosEEUU.csv")
atentadosNY.to_csv("./output/atentadosNY.csv")
