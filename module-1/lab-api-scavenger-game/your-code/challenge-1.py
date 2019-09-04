######################################################
#           ~ lab-api-scavenger-game ~               #
# These are the solutions to a lesson on using APIs  #
# as part of the Data Analytics Bootcamp by Ironhack #
# Madrid.                ~ created by Felipe Ferrero #
#       ~ Feel free to use and modify freely. ~      #
######################################################

# This code takes information from a .env file as environment variables
# and uses them to access the GitHub API, retrieve statistics in json
# format and read specific files spread throughout a repository. 

# IMPORTING LIBRARIES
from dotenv import load_dotenv
import os
from functions import authRequest
from base64 import b64decode

# LAB-API-SCAVENGER-GAME
print('\n █████╗ ██████╗ ██╗\n██╔══██╗██╔══██╗██║\n███████║██████╔╝██║\n██╔══██║██╔═══╝ ██║\n██║  ██║██║     ██║\n╚═╝  ╚═╝╚═╝     ╚═╝')
print('######################\n# API Scavenger Game #\n######################\n')

# LOAD ENV VARIABLES
load_dotenv()
usr = os.getenv('USR')
repo_name = os.getenv('REPO_DATA')

# SET URL WITH ENV VARIABLES
url = 'https://api.github.com/repos/{}/{}/forks'.format(usr,repo_name)

# ASSIGN REQUEST
repo = authRequest(url)

#### CHALLENGE 1:

# GET LANGUAGE INFO FROM ALL FORKS
print('# Challenge 1:')
lang = []
print('Retrieving information.')

# ITERATING FORKS
for fork in repo:
    url_lang = 'https://api.github.com/repos/{}/languages'.format(fork['full_name'])
    repo_fork = authRequest(url_lang)
    lang += list(repo_fork.keys())
    print('.', end='', flush=True)

# PRINT LANGUAGES USED IN TERMINAL
print('\nLanguages used in all forks of {1}/{2}: {0}\n'.format(set(lang), usr, repo_name))

#### CHALLENGE 2:

# GET COMMITS STATISTICS
print('\n# Challenge 2:')
print('Retrieving information.\n.......................')
stats_url = 'https://api.github.com/repos/{}/{}/stats/participation'.format(usr,repo_name)
stats = authRequest(stats_url)
last_week = (stats['owner'][-1],stats['all'][-1])
last_year = (sum(stats['owner']),sum(stats['all']))

# PRINT NUMBER OF COMMITS IN TERMINAL
stats_values = [usr,repo_name,last_week[0],last_week[1],last_year[0],last_year[1]]
print('Statistics for {}/{}:\nCommits last week:\n     • {} by owner\n     • {} by everyone\nCommits last year:\n     • {} by owner\n     • {} by everyone'.format(*stats_values))

#### CHALLENGE 3:

# GETTING FOLDER NAMES
print('\n# Challenge 3:')
print('Retrieving information.')
repo_name = os.getenv('REPO_SCAV')
url_contents = 'https://api.github.com/repos/{}/{}/contents'.format(usr,repo_name)
repo_contents = authRequest(url_contents)
directories = []
for content in repo_contents:
    if content['type']=='dir':
        directories.append(content['name'])

# GETTING FILE NAMES
scav_files = []
for directory in directories:
    url_folder = 'https://api.github.com/repos/{}/{}/contents/{}'.format(usr,repo_name,directory)
    folder = authRequest(url_folder)
    for txt_file in folder:
        if 'scavengerhunt' in txt_file['name']:
            scav_files.append('{}/{}'.format(directory,txt_file['name']))
    print('.', end='', flush=True)

# SORTING FILE_NAMES
scav_files.sort(key = lambda txt_file: txt_file.split('/')[1])

# RETRIEVING TEXT
text = []
for scav_file in scav_files:
    url_file= 'https://api.github.com/repos/{}/{}/contents/{}'.format(usr,repo_name,scav_file)
    text.append(authRequest(url_file)['content'])

# DECODING TEXT FROM base64
text_decoded = []
for word in text:
    text_decoded.append(str(b64decode(word)).replace("b'",'').replace("\\n'",''))
text_decoded = ' '.join(text_decoded)
print('\nThe secret message is:\n       """ {} """\n\n'.format(text_decoded))