import os
from dotenv import load_dotenv
import requests

load_dotenv()

github_token = os.getenv("TOKEN")
url = 'https://api.github.com/repos/ironhack-datalabs/scavenger/content/*.scavengerhunt'

def authRequest(url, params={}):
    headers = {
        "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print('status:',response.status_code)
    #print('headers',response.headers())
    return response.json()

content = authRequest(url)

print(content)