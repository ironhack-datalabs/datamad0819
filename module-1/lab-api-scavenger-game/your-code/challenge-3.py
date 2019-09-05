# enter your code below

from dotenv import load_dotenv
import os
import requests
import base64

load_dotenv()
gitToken= os.getenv("GIT_TOKEN")

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(gitToken)
    }
    response = requests.get(url,headers=headers, params=params)

    return response.json()


sha = authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/commits")[0]["sha"]

data=authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/git/trees/"+sha)["tree"]

folders=[]
for folder in data:
    folders.append(folder["url"])

files={}
prueba=[]

while folders:
    aux=authRequest(folders[0])
    if "tree" in aux:
        for folder in aux["tree"]:
            if ".scavengerhunt" in folder["path"]:

                files[folder["path"]]=(folder["url"])
    folders.pop(0)

sentence={}
for file in files.keys():
    sentence[file]=base64.b64decode(authRequest(files[file])["content"])


frase=" ".join([str(sentence[x])for x in sorted(sentence)])

frase=frase.replace("\\n'","")
frase=frase.replace("b'","")
print(frase)
