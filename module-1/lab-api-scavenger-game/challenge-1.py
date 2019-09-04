# enter your code below
import os
import dotenv
import request

load_dotenv()

github_token = os.getenv("TOKEN")


def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    #print(response.headers)
    return response.json()
