import requests
import json
import os

def authRequest(url, params={}):
    github_token = os.getenv('TOKEN')
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    
    return response.json()