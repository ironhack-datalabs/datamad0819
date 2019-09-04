import pandas as pd
import json
import requests
import os
import sentry_sdk
from sentry_sdk import capture_exception
from dotenv import load_dotenv
load_dotenv()


response = requests.get('https://github.com/DavidR81/datamad0819')
results = response.json()
print(results)

data = pd.DataFrame(results)
print(data)
# response = requests.get('https://github.com/DavidR81/datamad0819/network/members')
# results = response.json()
# print(results)

# response = requests.get('https://api.github.com/events')
# data = pd.DataFrame(response.json())
# print(data.head(10))

# data = pd.DataFrame(results)
# print(data.head(25))

# response = requests.get('https://github.com/ironhack-datalabs/datamad0819/network/members')

# data = pd.DataFrame(response.json())
# print(data.head(10))

# response = requests.get('https://api.github.com/events')

# data = pd.DataFrame(response.json())
# data.head(10)

# github_token = ""
# def authRequest(url, params={}):
#     headers = {
#        "Authorization": "token {}".format(github_token)
#     }
#     response = requests.get(url,headers=headers, params=params)
#     print(response.status_code)
#     #print(response.headers)
#     return response.json()



# data = authRequest("https://github.com/DavidR81/datamad0819/network/members",{"type":"private"})
# [repo["datamad0819"] for repo in data]
# print(data)
