import requests
import os 
from dotenv import load_dotenv
import json
load_dotenv()


key = 'GIT_TOKEN'
github_token = os.getenv(key) 

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    return response.json()

datamad0819 = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits")
#aparecen los 30 primeros commits
datamad0819_list = [h["commit"] for h in datamad0819]
print("First {} commits".format(len([o for o in datamad0819_list])))
