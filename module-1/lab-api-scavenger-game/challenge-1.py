import requests
import os
from dotenv import load_dotenv
import re
import base64
load_dotenv("./.env")
github_token = os.getenv("github_token")

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    
    return response.json()

data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819")

#Contar los forks
print([ele for ele in list(data.items()) if ele[0].find("fork")!=-1])
print("forks_count = ",23)

#Encontrar los atributos language
print([ele for ele in list(data.items()) if ele[0].find("language")!=-1])
urlLanguage = "https://api.github.com/repos/ironhack-datalabs/datamad0819/languages"
dataL = authRequest(urlLanguage)
print(dataL)
print(list(dataL.keys()))

