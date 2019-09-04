import requests
import os 
from dotenv import load_dotenv
import json
import base64
load_dotenv()


key = 'GIT_TOKEN'
github_token = os.getenv(key) 

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    #print(response.status_code)
    return response.json()

listofscavenger = []
frase = []

scavenger = authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/contents")
scavenger_list = [h["name"] for h in scavenger if h["name"] != ".gitignore"]
for name in scavenger_list:
    test= authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/contents/"+name)
    for e in test:
        if e["name"].endswith(".scavengerhunt"):
            listofscavenger.append([e["name"],e["path"]])
            
for element in sorted(listofscavenger):
    #print(element)
    conn = authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/contents/"+element[1])
    decoded = base64.b64decode(conn["content"])
    word = decoded.decode("utf-8").strip('\n')
    frase.append(word)

print(" ".join(frase))
