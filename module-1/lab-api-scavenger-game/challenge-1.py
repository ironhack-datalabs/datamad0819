# enter your code below
import os
from dotenv import load_dotenv
import requests

load_dotenv()

github_token = os.getenv("TOKEN")
urlforks = 'https://api.github.com/repos/ironhack-datalabs/datamad0819/forks'

def authRequest(url, params={}):
    headers = {
        "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print('status:',response.status_code)
    #print('headers',response.headers())
    return response.json()

#lanzamos para conseguir los forks:

forks = authRequest(urlforks)
people_forking = [fork["owner"]["login"] for fork in forks]
print(people_forking)

#lenguajes usados:

languages = set([fork['language']for fork in forks])

print('languages used:',languages )
