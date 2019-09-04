import base64
import requests
import os
from dotenv import load_dotenv
load_dotenv()
git_token = os.getenv("git_token")

'''
Count how many commits were made in the past week.
Obtain all the commits made in the past week via API, which is a JSON array that contains multiple
commit objects.
Count how many commit objects are contained in the array.
'''


def authRequest(url, params={}):
    headers = {"Authorization": "token {}".format(git_token)}
    response = requests.get(url, headers=headers, params=params)
    return response.json()


# two ways of doing it (with a query in the url or with parameters):
commits = authRequest(
    "https://api.github.com/repos/ironhack-datalabs/datamad0819/commits?since=2019-08-26&until=2019-09-02")
commits = authRequest(
    "https://api.github.com/repos/ironhack-datalabs/datamad0819/commits", {'since': '2019-08-26', 'until': '2019-09-02'})

num_commits = len([commit['commit'] for commit in commits])
print(num_commits)
