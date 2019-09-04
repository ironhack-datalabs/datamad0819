# IMPORTING LIBRARIES

from dotenv import load_dotenv
import requests
import json
import os
from functions import authRequest
from datetime import datetime, timedelta
import re
import base64

# LAB-API-SCAVENGER-GAME
print('\n █████╗ ██████╗ ██╗\n██╔══██╗██╔══██╗██║\n███████║██████╔╝██║\n██╔══██║██╔═══╝ ██║\n██║  ██║██║     ██║\n╚═╝  ╚═╝╚═╝     ╚═╝')
print('######################\n# API Scavenger Game #\n######################\n')

# LOAD ENV VARIABLES
load_dotenv()
usr = os.getenv('USR_IRON')
repo_name = os.getenv('REPO_DATA')

# SET URL WITH ENV VARIABLES
url = 'https://api.github.com/repos/{}/{}/forks'.format(usr,repo_name)

# ASSIGN REQUEST
repo = authRequest(url)

#### CHALLENGE 1:

# GET LANGUAGE INFO FROM ALL FORKS:
lang = []
print('Retrieving a lot of information, might take a minute.')
# ITERATING FORKS
for fork in repo:
    url_lang = 'https://api.github.com/repos/{}/languages'.format(fork['full_name'])
    repo_fork = authRequest(url_lang)
    lang += list(repo_fork.keys())
    print('.', end='', flush=True)

# PRINT LANGUAGES USED IN TERMINAL
print('\n\n# Challenge 1:')
print('Languages used in all forks of {1}/{2}: {0}\n'.format(set(lang), usr, repo_name))

#### CHALLENGE 2:

# GET COMMITS FOR PAST WEEK FOR ALL BRANCHES IN ALL FORKS FOR THE PAST WEEK
# ASSIGNING DATE VARIABLE
date = datetime.now().replace(microsecond=0)
since = date - timedelta(days=7)
since = str(since.isoformat())+'Z'

print('Retrieving a lot of information, might take a minute.')
forks = 0
branches = 0
commits = []

# ITERATING FORKS
for fork in repo:
    url_branch = 'https://api.github.com/repos/{}/branches'.format(fork['full_name'])
    repo_branch = authRequest(url_branch)
    forks +=1
    # ITERATING BRANCHES
    for branch in repo_branch:
        url_commit = branch['commit']['url']
        repo_commit = authRequest(url_commit,params={'since':since})
        # COUNTING NUMBER OF COMMITS
        commits.append(len(repo_commit))
        branches +=1
    print('.', end='', flush=True)
# SUMMING TOTAL
commit_count=sum(commits)

# PRINT NUMBER OF COMMITS IN TERMINAL
print('\n\n# Challenge 2:')
print('{0} commits made to {4} branches of {5} forks of {1}/{2} since {3} \n'.format(commit_count, usr, repo_name, since, branches, forks))

#### CHALLENGE 3:

print('Retrieving a lot of information, might take a minute.')
# GETTING FOLDER NAMES
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
    text_decoded.append(str(base64.b64decode(word)).replace("b'",'').replace("\\n'",''))
text_decoded = ' '.join(text_decoded)
print('\n\n# Challenge 3:')
print('The secret message is: ""{}""'.format(text_decoded))
 