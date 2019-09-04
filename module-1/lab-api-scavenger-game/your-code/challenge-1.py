import os
import requests
from dotenv import load_dotenv
load_dotenv()

token = os.getenv("GITHUB_TOKEN")


headers = {
    "Authorization" : "token {}".format(token)
    }

#Getting the SHA
repo_name = "datamad0819"
owner = "ironhack-datalabs"
to_do = "forks"
url = "https://api.github.com/repos/{}/{}/{}".format(owner,repo_name,to_do)

r = requests.get(url, headers = headers)
rd = r.json()

lang = [ele["language"] for ele in rd]
n_forks = len(lang)
prog_lang = set(lang)

print("The repository {} from {} was forked {} times and has used these programming languages: {}.".format(repo_name,owner,n_forks,prog_lang))




