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

forks=authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/forks")

languages=[]
for fork in forks:
    languages+=list(authRequest(fork["languages_url"]).keys())
    
print(set(languages))  
