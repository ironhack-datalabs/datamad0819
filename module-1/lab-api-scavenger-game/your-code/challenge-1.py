import requests
import os 
from dotenv import load_dotenv
load_dotenv()


key = 'GIT_TOKEN'
github_token = os.getenv(key) 

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    return response.json()


#data = authRequest("https://api.github.com/users/ironhack-datalabs/repos?type=private")
#hey = [repo["full_name"] for repo in data]
#print(hey)

madrid_oct_2018 = authRequest("https://api.github.com/repos/ironhack-datalabs/madrid-oct-2018/forks")
madrid_oct_2018_list = list(dict.fromkeys([h["language"] for h in madrid_oct_2018]))

datamad0819 = authRequest("https://api.github.com/repos/ironhack-datalabs/datamad0819/forks")
datamad0819_list = list(dict.fromkeys([h["language"] for h in datamad0819]))
print("datamad0819",datamad0819_list)
print("madrid_oct_2018",madrid_oct_2018_list)