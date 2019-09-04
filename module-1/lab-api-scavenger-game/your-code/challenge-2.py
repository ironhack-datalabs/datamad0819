import requests
import os
from dotenv import load_dotenv
load_dotenv()
import base64

git_token = os.getenv("git_token")


def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(git_token)
    }
    response = requests.get(url,headers=headers, params=params)

    return response.json()


data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits",{"since":"2019-08-26","until":"2019-09-01"}) 

print(len(data))