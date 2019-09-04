import os
import requests
from dotenv import load_dotenv
load_dotenv()

token = os.getenv("GITHUB_TOKEN")
print(token)