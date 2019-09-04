import requests
import os
import dotenv
import json
dotenv.load_dotenv()


token = os.getenv("GITHUB_TOKEN")

headers = {
    "Authorization": "token {}".format(token)
}

owner = "ironhack-datalabs"
repo = "madrid-oct-2018"
accion = "forks" 

url = "https://api.github.com/repos/{}/{}/{}".format(owner,repo,accion)

response = requests.get(url,headers=headers)

print(response.status_code)
data = response.json()

with open('output.json', 'w') as file:
    file.write(json.dumps(data))

language = []
for ele in data:
    language.append(ele["language"])
print("Los forks estan escritos en los siguientes lenguajes: {} y hay un total de {} forks.".format(set(language),len(language)))