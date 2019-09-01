import re

def yn_to_boolean(letter):
    # Changes letter values N,n,F,f,Y,y,T,t to True or False equivalent
    if letter.strip() in ['N','n','F','f']:
      return False
    elif letter.strip() in ['Y','y','T','t']:
      return True

def empire(country,dic):
    # Asigns a former empire to each country
    if country in dic.keys():
        return dic[country]
    else:
        return 'OTHER'