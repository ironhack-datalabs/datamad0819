# enter your code below

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


data = authRequest("https://api.github.com/users/ironhack-datalabs/repos") 

forks_urls = [repo["forks_url"] for repo in data if repo["name"]=="datamad0819"]

forks =[authRequest(ur) for ur in forks_urls]

languages_url =[fork["languages_url"] for lista in forks for fork in lista]

languages_forks = [authRequest(ur) for ur in languages_url]

languages_list = [d for dt in languages_forks for d in dt]

languages = list(set(languages_list))

print(languages)