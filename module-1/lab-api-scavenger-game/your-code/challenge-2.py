import os
import requests
from dotenv import load_dotenv
load_dotenv()
import json

github_token = os.getenv("github_token")

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    #print(response.headers)
    return response.json()



'''

Al ejecutar la variable data, al final de la url he añadido el parametro since, que permite, incluyendo una fecha obtener los
commits realizados desde entonces. Originariamente puse esta terminación: since=2019-08-28T00:00:00Z, pero me devolvía la variable
vacía. De hecho, al ejecutar este código:

dates = [item["commit"]["author"]["date"] for item in data]

Haciéndolo sin ningún límite tempral, las fechas que obtenía son las siguientes: ['2019-08-21T08:43:15Z', '2019-08-07T15:56:23Z', 
'2019-08-07T15:41:23Z', '2019-08-07T15:41:02Z', '2019-07-03T07:37:34Z', '2019-07-01T13:53:01Z', '2019-07-01T13:52:37Z'...] 
Es decir, todas anteriores a la semana pasada... Os dejo aquí el código que escribí y a continuación otro, retrasando un poco más
la fecha para poder obtener algún dato, y mostrar así al menos cómo lo hubiese hecho.

'''

# Poniendo la fecha correspondiente a la semana pasada

data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits?since=2019-08-21T00:00:00Z")

commits = [item['commit'] for item in data]

print(len(commits))


# Retrasando la fecha al inicio del curso, aunque me sale un número bajísimo de commits, uno en concreto. No soy capaz de identificar el fallo

data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits?since=2019-08-19T00:00:00Z")

commits = [item['commit'] for item in data]

print(len(commits))