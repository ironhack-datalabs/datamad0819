# Creación de una columna con el comentario encontrado

import pandas as pd
from funciones import authRequest, comments, num_comments
import requests
import time
import os
from dotenv import load_dotenv
load_dotenv()

# Lectura del nuevo csv



data = pd.read_csv("./input/atentadosEEUU.csv", encoding = "ISO-8859-1", dtype='unicode')

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



atentadosNY.to_csv("./output/atentadosNY.csv")
