import requests
import os
import dotenv
import json
import re
dotenv.load_dotenv()

token = os.getenv("GITHUB_TOKEN")

headers = {
    "Authorization": "token {}".format(token)
}

owner = "ironhack-datalabs"
repo = "madrid-oct-2018"
accion = "commits" 

url = "https://api.github.com/repos/{}/{}/{}".format(owner,repo,accion)

response = requests.get(url,headers=headers)

print(response.status_code)
data1 = response.json()

with open('output.json', 'w') as file:
    file.write(json.dumps(data1))

agosto = []
for ele in data1:
    
    agosto.append(ele["commit"]["author"]["date"])
last_week = agosto[0]
print(last_week)

lista_commit = []
for el in data1:
    lista_commit.append(el['commit'])

print(len(lista_commit))
        
        