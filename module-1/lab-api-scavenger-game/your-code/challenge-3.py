import os
from dotenv import load_dotenv
import requests

load_dotenv()

github_token = os.getenv("TOKEN")
url = 'https://api.github.com/repos/ironhack-datalabs/scavenger/contents/'

def authRequest(url, params={}):
    headers = {
        "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print('status:',response.status_code)
    
    return response.json()

folder = authRequest(url)

foldername = [fol['name'] for fol in folder]


def filesnames(lst):
    scaven = []
    for element in lst:
        archivo = authRequest(url+element)
        try:
            for objeto in archivo:
                scaven.append(objeto['path'])
        except:
            pass

    retval =[path for path in scaven if path.endswith('scavengerhunt')]    
    return retval

def filecontent(lst):
    words =[]
    for path in lst:
        archivo = authRequest(url+path)
        words.append(archivo['content'])

    return words


filename = filesnames(foldername)
palabras = filecontent(filename)

print(foldername)
print(filename)
print(palabras)