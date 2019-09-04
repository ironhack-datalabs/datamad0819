import base64
import requests
import os
from dotenv import load_dotenv
load_dotenv()
git_token = os.getenv("git_token")

'''
Using Python, call Github API to find out the cold joke contained in the 24 secret files in the following repo:
https://github.com/ironhack-datalabs/scavenger
'''


def authRequest(url, params={}):
    headers = {"Authorization": "token {}".format(git_token)}
    response = requests.get(url, headers=headers, params=params)
    return response.json()


contents = authRequest(
    'https://api.github.com/repos/ironhack-datalabs/scavenger/contents')

parts = []
for folder in contents:
    if folder['name'] != '.gitignore':
        for file in authRequest(folder['url']):
            if "scavengerhunt" in file['name']:
                parts.append(
                    (base64.b64decode(authRequest(file['url'])['content']), file['name']))
parts = sorted(parts, key=lambda x: x[1])

joke = " ".join([part[0].decode("utf-8")[:-1] for part in parts])

print(joke)
