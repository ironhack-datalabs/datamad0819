import os
from dotenv import load_dotenv
import requests

load_dotenv()

github_token = os.getenv("TOKEN")
urlcommits = 'https://api.github.com/repos/ironhack-datalabs/datamad0819/commits'

def authRequest(url, params={}):
    headers = {
        "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print('status:',response.status_code)
    #print('headers',response.headers())
    return response.json()

    commits = authRequest(urlcommits,since= 2019-08-26T00:00Z, until= 2019-09-01T23:59Z)

    counter = len(commits)
    print(counter)