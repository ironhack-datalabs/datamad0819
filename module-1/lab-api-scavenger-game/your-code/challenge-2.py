import requests #para hacer las llamadas apis
import os #para moverte por el ordenador
from dotenv import load_dotenv #para cargar fichero env
load_dotenv() 
git_token = os.getenv("git_token")

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(git_token)
    }
    response = requests.get(url,headers=headers, params=params)
    return response.json()
#Todos los commits
data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits")
data
#Los de la semana pasada
data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits?since=2019-08-26&until=2019-09-01")
print(len(data))