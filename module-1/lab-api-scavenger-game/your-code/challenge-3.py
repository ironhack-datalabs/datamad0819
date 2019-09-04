import base64
import os
import requests
import re
from dotenv import load_dotenv
load_dotenv()

token = os.getenv("GITHUB_TOKEN")


headers = {
    "Authorization" : "token {}".format(token)
    }

#Getting the SHA
url = "https://api.github.com/repos/ironhack-datalabs/scavenger/commits/master"

r = requests.get(url, headers = headers)
rd = r.json()

#Getting the subfolders
url = "https://api.github.com/repos/ironhack-datalabs/scavenger/git/trees/{}".format(rd["sha"])
r = requests.get(url, headers = headers)
rd = r.json()

#Folders names
paths = [dic["path"] for dic in rd["tree"]]

#Getting content  //EVITAR .git...
full_path = []
for ele in paths[1:]: #paths[1:]:
    url = "https://api.github.com/repos/ironhack-datalabs/scavenger/contents/"+ele
    r = requests.get(url, headers = headers)
    rd = r.json()
    for dic in rd:
        if re.search("\d+\/\.\d+\.",dic["path"]):
            full_path.append(dic["path"])

full_path = sorted(full_path,key = lambda x: x[8:] ,reverse = False)

content = []
for ele in full_path:
    url = "https://api.github.com/repos/ironhack-datalabs/scavenger/contents/"+ele
    r = requests.get(url, headers = headers)
    rd = r.json()
    content.append(str(base64.b64decode(rd["content"])))

a = " ".join(content)
a = a.replace("\\n'","").replace("b'","")
print("The solution to the Scavengers Lab is: \n{}".format(a))

"""
headers = {'Authorization': 'token ' + token}

login = requests.get('https://api.github.com/user', headers=headers)
print(login.json())

def getPokemon(pokeId):
    url = "https://pokeapi.co/api/v2/pokemon/{}".format(pokeId)
    response = requests.get(url)
    print(response.status_code)
    data = response.json()
    return {
        "name": data["name"],
        "image": data["sprites"]["front_default"]
    }
"""

#print(base64.b64decode("SW4K\n"))
