import os
import requests
import json
from dotenv import load_dotenv
load_dotenv()

token = os.getenv("GITHUB_TOKEN")


headers = {
    "Authorization" : "token {}".format(token)
    }



#Getting the first SHA
repo_name = "datamad0819"
owner = "ironhack-datalabs"
to_do = "commits"
n_commit = "100"


##Ver: 1.- Getting commits with SINCE argument

url = "https://api.github.com/repos/{}/{}/{}".format(owner,repo_name,to_do)
date = "2019-08-08T00:00:00Z"
r = requests.get(url, headers = headers, params={"since":date})
rd = r.json()
dates=[]
for ele in rd:
        dates.append(ele["commit"]["committer"]["date"])

print("Since {} there has been {} commits".format(date[:10],len(dates)))


##Ver: 2.- GEtting all commits


url = "https://api.github.com/repos/{}/{}/{}".format(owner,repo_name,to_do)
r = requests.get(url, headers = headers)
rd = r.json()

sha=rd[0]["sha"] #"bf7762a4cd32dd9d08bd852e0cba0f1fd45c34fa"



dates = []
more_commits = True

while (more_commits):

    url = "https://api.github.com/repos/{}/{}/{}?per_page={}&sha={}".format(owner,repo_name,to_do,n_commit,sha)
    r = requests.get(url, headers = headers)
    rd = r.json()
    for ele in rd:
        dates.append(ele["commit"]["committer"]["date"])

    sha = rd[-1]["sha"]

    if len(dates)%int(n_commit)!= 0:
        more_commits = False


#print("These are the dates of the commits: {}".format(dates),len(dates))
print("There are no commits from last week. Last commit was done in {}. There are a total of {} commits".format(dates[1],len(dates)))

