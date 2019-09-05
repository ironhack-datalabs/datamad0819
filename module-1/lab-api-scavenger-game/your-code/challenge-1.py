# enter your code below

import os
import requests
from dotenv import load_dotenv
load_dotenv()
import pandas as pd

github_token = os.getenv("github_token")

headers = {"Authorization": "token {}".format(github_token)}

response = requests.get("https://api.github.com/repos/ironhack-datalabs/datamad0819/forks", headers=headers) #, params=params)
data = response.json()

forks = [item["forks_url"] for item in data]
for e in forks:
    print("Url forks: ", e)
    

language = [item["language"] for item in data]
print(language)