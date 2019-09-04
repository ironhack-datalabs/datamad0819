import requests
import json
import os

def authRequest(url, params={}):
   """ authRequest takes a GitHub API url and returns
   a json object with the retrieved information. 
   A GiHub personal token is required on a .env file
   as TOKEN=<token> in order for it to be used as 
   environment variable.
   Optionally, parameters for the query may be passed
   to authRequest as a dictonary.
   Check API documentation for information on valid 
   parameters. """
   github_token = os.getenv('TOKEN')
   headers = {
      "Authorization": "token {}".format(github_token)
   }
   response = requests.get(url,headers=headers, params=params)
   return response.json()