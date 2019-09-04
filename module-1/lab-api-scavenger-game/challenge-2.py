from dotenv import load_dotenv
import os
import requests
import datetime

load_dotenv()
gitToken= os.getenv("GIT_TOKEN")

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(gitToken)
    }
    response = requests.get(url,headers=headers, params=params)

    return response.json()

commits=[]

call=True
page=1
while call:
    respond=authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits",{"per_page":"100","page":page})
    if respond:
        commits+=respond
    else:
        call=False
    page+=1
    
print("Se han hecho {} commits en total".format(len(commits)))

until=datetime.datetime.now()
since=until-datetime.timedelta(days=7)

week_commits=authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits",{"since":since,"until":until})
print("En los ultimos 7 dias se han hecho {} commits".format(len(week_commits)))