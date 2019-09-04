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




commits = authRequest(urlcommits, params={ "since": '2018-08-26T00:00:00Z', "until": '2019-09-01T23:59:59Z'})

#counter = len(commits)

print('total commits in last year',len(commits))

