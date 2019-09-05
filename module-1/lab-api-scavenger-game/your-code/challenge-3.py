'''

Esto de momento es lo que he hecho y el resutlado y que he obtenido:

github_token = os.getenv("github_token")

def authRequest(url, params={}):
    headers = {
       "Authorization": "token {}".format(github_token)
    }
    response = requests.get(url,headers=headers, params=params)
    print(response.status_code)
    #print(response.headers)
    return response.json()

data = authRequest("https://api.github.com/repos/ironhack-datalabs/scavenger/git/trees/master")

con la información que obtengo imprimo esto:

data["tree"][1]["url"]

y obtengo esta url:

'https://api.github.com/repos/ironhack-datalabs/scavenger/git/trees/2945e51c87ad5da893c954afcf092f06343bbb7d'

Vuelvo a hacer una request con esta url y hago estos dos bucles:

for item in data:
    print(item)


Con este obtengo esto:

sha
url
tree
truncated

Y con este otro:

for item in data["tree"]:
    print(item["path"])

obtengo esto:

.0006.scavengerhunt
40
74
99

Sé que es el primer documento el que voy buscando

Y de momento he llegado hasta aquí

'''