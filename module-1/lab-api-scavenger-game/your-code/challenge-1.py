import base64
import requests
import os
from dotenv import load_dotenv
load_dotenv()
git_token = os.getenv("git_token")

'''
Obtain the full list of forks created from the main lab repo via Github API.
Loop the JSON response to find out the language attribute of each fork. Use an array to store the language attributes of each fork.
Hint: Each language should appear only once in your array.
Print the language array. 
'''


def authRequest(url, params={}):
    headers = {"Authorization": "token {}".format(git_token)}
    response = requests.get(url, headers=headers, params=params)
    return response.json()


forks = authRequest(
    "https://api.github.com/repos/ironhack-datalabs/datamad0819/forks")

languages = []
for fork in forks:
    language_dict = authRequest(fork['languages_url'])
    for lan in language_dict.keys():
        if lan not in languages:
            languages.append(lan)

print(languages)
