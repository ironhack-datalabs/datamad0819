# First we import all of the modules necessary for the exercise

import requests
import os
from dotenv import load_dotenv
load_dotenv()
import base64

git_token = os.getenv("git_token")

# Second we execute the API call and do a few for loops to get down to the content of the files we want

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(git_token)
    }
    response = requests.get(url,headers=headers, params=params)

    return response.json()


data = authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/contents") # repo with folders
folders_url = [folder["url"] for folder in data if folder["name"] not in ".gitignore"] # url of folders
files = [authRequest(url) for url in folders_url] #folders with files
files_url = [file["url"] for file_list in files for file in file_list if "scavengerhunt" in file["name"]] # url for files
contents = [authRequest(url) for url in files_url] # contents of files

content = [(content["name"],content["content"]) for content in contents] # name and content of all files

# We order the items by file name and get the coded content

def sort_by_name(arr):
    return sorted(arr,key=lambda x: x[0])

contenidos = sort_by_name(content)

message_coded = []
for t in contenidos:
    message_coded.append(t[1])
    
print(message_coded)

# Finally we decode the content and create the string

message_mesy = []

for m in message_coded:
    x = base64.b64decode(m)
    message_mesy.append(x)

message = []
for i in message_mesy:
    x = str(i).split("'")
    message.append(x[1])

message_final = ""
for w in message:
    x = len(w)
    message_final += (w[0:x-2])+" "
    
message_final = message_final[:-1]

print(message_final)