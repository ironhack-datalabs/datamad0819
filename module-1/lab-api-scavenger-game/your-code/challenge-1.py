import requests
import os 
from dotenv import load_dotenv
load_dotenv()

key = 'GITHUB_TOKEN'
github_token = os.getenv(key) 

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    return response.json()

data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/forks")
datamad0819_list = list(dict.fromkeys([h["language"] for h in data]))
print(datamad0819_list)


# parte 2
data = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/commits")
datamad0819_list = ([h["commit"] for h in data])
#print(datamad0819_list)
for i in datamad0819_list:
    print (datamad0819_list[2])
    
x = len(datamad0819_list)
print(x)


#parte3
hidden = authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger")





