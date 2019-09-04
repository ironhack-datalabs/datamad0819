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
data = authRequest("https://api.github.com/users/ironhack-datalabs/repos")
data
forks_url = [ repos["forks_url"] for repos in data if repos["name"] == "datamad0819"]
forks_url
forks =  [authRequest(url) for url in forks_url]
forks
languages_url = [forkpepito["languages_url"] for lista in forks for forkpepito in lista ]
languages_url
languages_apis = [authRequest(url) for url in languages_url]
languages_apis
values = [(key)for diccionario in languages_apis for key in diccionario]
values
languages = list(set(values))
print(languages)